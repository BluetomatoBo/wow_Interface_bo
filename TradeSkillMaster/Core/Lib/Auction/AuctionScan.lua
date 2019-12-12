-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- This file contains code for scanning the auction house
local _, TSM = ...
local L = TSM.Include("Locale").GetTable()
local DisenchantInfo = TSM.Include("Data.DisenchantInfo")
local Database = TSM.Include("Util.Database")
local TempTable = TSM.Include("Util.TempTable")
local Vararg = TSM.Include("Util.Vararg")
local Log = TSM.Include("Util.Log")
local ItemString = TSM.Include("Util.ItemString")
local Threading = TSM.Include("Service.Threading")
local ItemInfo = TSM.Include("Service.ItemInfo")
local Conversions = TSM.Include("Service.Conversions")
local private = {
	recycledScans = {},
	filterId = 1,
	queryUtilContext = { self = nil, maxItemQuantity = nil, targetItem = nil },
	lastSearchQuery83 = 0,
}
-- some constants
local SCAN_RESULT_DELAY = 0.1
local MAX_SOFT_RETRIES = 50
local MAX_SETTLE_TIME = 0.5
local EMPTY_SORTS_TABLE = {}
-- According to Blizzard's documentation, queries are limited to 100 per minute (we leave a bit of buffer and do 90)
local MIN_QUERY_INTERVAL_83 = 60 / 90



-- ============================================================================
-- Class Meta Methods
-- ============================================================================

local AuctionScan = TSM.Include("LibTSMClass").DefineClass("AuctionScan")

function AuctionScan.__init(self)
	self._scripts = nil
	self._thread = nil
	self._resolveSellers = nil
	self._ignoreItemLevel = nil
	self._filters = {}
	self._db = nil
	self._filtersScanned = 0
	self._pagesScanned = 0
	self._numPages = 0
	self._onProgressUpdateHandler = nil
	self._onFilterDoneHandler = nil
	self._customFilterFunc = nil
	self._findFilter = nil
	self._findResult = {}
	self._cancelled = false
end

function AuctionScan._Acquire(self, db)
	self._db = db
end

function AuctionScan._Release(self)
	self._thread = nil
	self._resolveSellers = nil
	self._ignoreItemLevel = nil
	for _, filter in ipairs(self._filters) do
		filter:_Release()
		TSM.Auction.RecycleAuctionFilter(filter)
	end
	wipe(self._filters)
	if self._findFilter then
		self._findFilter:_Release()
		TSM.Auction.RecycleAuctionFilter(self._findFilter)
		self._findFilter = nil
	end
	self._db = nil
	self._filtersScanned = 0
	self._pagesScanned = 0
	self._numPages = 0
	self._onProgressUpdateHandler = nil
	self._onFilterDoneHandler = nil
	self._customFilterFunc = nil
	self._cancelled = false
	wipe(self._findResult)
end



-- ============================================================================
-- Public Class Methods
-- ============================================================================

function AuctionScan.Release(self)
	self:_Release()
	tinsert(private.recycledScans, self)
end

function AuctionScan.CreateDBQuery(self)
	return self._db:NewQuery()
end

function AuctionScan.SetCustomFilterFunc(self, func)
	self._customFilterFunc = func
	return self
end

function AuctionScan.SetResolveSellers(self, resolveSellers)
	self._resolveSellers = resolveSellers
	return self
end

function AuctionScan.SetIgnoreItemLevel(self, ignoreItemLevel)
	self._ignoreItemLevel = ignoreItemLevel
	return self
end

function AuctionScan.SetScript(self, script, handler)
	if script == "OnProgressUpdate" then
		self._onProgressUpdateHandler = handler
	elseif script == "OnFilterDone" then
		self._onFilterDoneHandler = handler
	else
		error("Unknown AuctionScan script: "..tostring(script))
	end
	return self
end

function AuctionScan.GetNumFilters(self)
	return #self._filters
end

function AuctionScan.FilterIterator(self)
	return ipairs(self._filters)
end

function AuctionScan.NewAuctionFilter(self)
	local filter = TSM.Auction.NewAuctionFilter()
	filter:_Acquire(self)
	tinsert(self._filters, filter)
	return filter
end

function AuctionScan.AddItemListFiltersThreaded(self, itemList, maxItemQuantity, targetItem)
	assert(Threading.IsThreadContext())
	-- remove duplicates
	local usedItems = TempTable.Acquire()
	for i = #itemList, 1, -1 do
		local itemString = itemList[i]
		if usedItems[itemString] then
			tremove(itemList, i)
		end
		usedItems[itemString] = true
	end
	TempTable.Release(usedItems)
	private.queryUtilContext.self = self
	private.queryUtilContext.maxItemQuantity = maxItemQuantity
	private.queryUtilContext.targetItem = targetItem
	TSM.Auction.QueryUtil.GenerateThreaded(itemList, private.NewQueryFilterCallback)
end

function AuctionScan.AddItemFilterThreaded(self, itemFilter)
	if itemFilter:GetCrafting() then
		local itemList = Threading.AcquireSafeTempTable()
		local targetItem = Conversions.GetTargetItemByName(itemFilter:GetStr())
		assert(targetItem)
		tinsert(itemList, targetItem)
		local conversionInfo = Conversions.GetSourceItems(targetItem)
		for itemString in pairs(conversionInfo) do
			tinsert(itemList, itemString)
		end
		self:AddItemListFiltersThreaded(itemList, nil, targetItem)
		Threading.ReleaseSafeTempTable(itemList)
	elseif itemFilter:GetDisenchant() then
		local targetItem = Conversions.GetTargetItemByName(itemFilter:GetStr())
		assert(targetItem)
		local disenchantInfo = DisenchantInfo.GetInfo(targetItem)
		for _, info in ipairs(disenchantInfo.sourceInfo) do
			self:NewAuctionFilter()
				:SetMinLevel(disenchantInfo.minLevel)
				:SetMaxLevel(disenchantInfo.maxLevel)
				:SetQuality(info.quality)
				:SetClass(info.classId)
				:SetMinItemLevel(info.minItemLevel)
				:SetMaxItemLevel(info.maxItemLevel)
				:SetTargetItem(targetItem)
		end
		local itemList = Threading.AcquireSafeTempTable()
		tinsert(itemList, targetItem)
		self:AddItemListFiltersThreaded(itemList, nil, targetItem)
		Threading.ReleaseSafeTempTable(itemList)
	else
		self:NewAuctionFilter()
			:SetName(itemFilter:GetStr())
			:SetMinLevel(itemFilter:GetMinLevel())
			:SetMaxLevel(itemFilter:GetMaxLevel())
			:SetQuality(itemFilter:GetQuality())
			:SetClass(itemFilter:GetClass())
			:SetSubClass(itemFilter:GetSubClass())
			:SetInvType(itemFilter:GetInvSlotId())
			:SetUsable(itemFilter:GetUsableOnly())
			:SetUnlearned(itemFilter:GetUnlearned())
			:SetCanLearn(itemFilter:GetCanLearn())
			:SetExact(itemFilter:GetExactOnly())
			:SetEvenOnly(itemFilter:GetEvenOnly())
			:SetMinItemLevel(itemFilter:GetMinItemLevel())
			:SetMaxItemLevel(itemFilter:GetMaxItemLevel())
			:SetMinPrice(itemFilter:GetMinPrice())
			:SetMaxPrice(itemFilter:GetMaxPrice())
			:SetGeneralMaxQuantity(itemFilter:GetMaxQuantity())
			:SetItems(itemFilter:GetItem())
	end
end

function AuctionScan.StartScanThreaded(self)
	assert(Threading.IsThreadContext())
	private.ScanQueryThreaded(self)
end

function AuctionScan.FindAuctionThreaded(self, row, noSeller)
	assert(Threading.IsThreadContext())
	wipe(self._findResult)
	if TSM.IsWow83() then
		return private.FindAuctionThreaded83(self, row, noSeller)
	else
		return private.FindAuctionThreaded(self, row, noSeller)
	end
end

function AuctionScan.PlaceBidOrBuyout(self, index, bidBuyout, validateRow, noSeller)
	if TSM.IsWow83() then
		local isCommodity, itemId = strsplit("~", validateRow:GetField("hash"))
		isCommodity = isCommodity == "true"
		if isCommodity then
			itemId = tonumber(itemId)
			local itemBuyout = validateRow:GetField("itemBuyout")
			local quantity = 1
			-- TODO: implement a way for the user to specify how many they want to buy, and properly deduct the quantity
			-- from the current results row (instead of removing it)
			C_AuctionHouse.StartCommoditiesPurchase(itemId, quantity, itemBuyout)
			C_AuctionHouse.ConfirmCommoditiesPurchase(itemId, quantity)
		else
			C_AuctionHouse.PlaceBid(validateRow:GetField("auctionId"), bidBuyout)
		end
		return true
	else
		if not self:_ValidateIndex(index, validateRow, noSeller) then
			return false
		end
		PlaceAuctionBid("list", index, bidBuyout)
		return true
	end
end

function AuctionScan.GetProgress(self)
	return self._filtersScanned, #self._filters, self._pagesScanned, self._numPages
end

function AuctionScan.GetNumCanBuy(self, row)
	local rowFilter = nil
	for _, filter in ipairs(self._filters) do
		if filter:_IncludesResultRow(row:GetUUID()) then
			assert(not rowFilter)
			rowFilter = filter
		end
	end
	assert(rowFilter)
	return rowFilter:_GetNumCanBuy(row)
end

function AuctionScan.DeleteRowFromDB(self, row, bought)
	local rowFilter = nil
	for _, filter in ipairs(self._filters) do
		if filter:_IncludesResultRow(row:GetUUID()) then
			assert(not rowFilter)
			rowFilter = filter
		end
	end
	assert(rowFilter)
	self._db:SetQueryUpdatesPaused(true)
	rowFilter:_RemoveResultRows(self._db, row, bought)
	self._db:SetQueryUpdatesPaused(false)
end

function AuctionScan.Cancel(self)
	self._cancelled = true
end



-- ============================================================================
-- Private Class Methods
-- ============================================================================

function AuctionScan._IsCancelled(self)
	return self._cancelled
end

function AuctionScan._IsFiltered(self, itemString, itemBuyout, stackSize, itemDisplayedBid)
	if self._customFilterFunc and self._customFilterFunc(itemString, itemBuyout, stackSize, itemDisplayedBid) then
		return true
	end
	return false
end

function AuctionScan._GetAuctionRowHash(self, index, noSeller)
	local _, _, stackSize, _, _, _, _, minBid, minIncrement, buyout, bid, isHighBidder, _, seller, sellerFull = GetAuctionItemInfo("list", index)
	local rawLink = GetAuctionItemLink("list", index)
	local timeLeft = GetAuctionItemTimeLeft("list", index)
	-- this is to get around a bug in Blizzard's code where the minIncrement value will be inconsistent for auctions where the player is the highest bidder
	minIncrement = isHighBidder and 0 or minIncrement
	if noSeller then
		return strjoin("~", tostringall(rawLink, minBid, minIncrement, buyout, bid, timeLeft, stackSize, isHighBidder))
	else
		seller = private.FixSellerName(seller, sellerFull) or "?"
		return strjoin("~", tostringall(rawLink, minBid, minIncrement, buyout, bid, seller, timeLeft, stackSize, isHighBidder))
	end
end

function AuctionScan._GetAuctionRowFields(self, index, filter)
	local rawName, texture, stackSize, _, _, _, _, minBid, minIncrement, buyout, bid, isHighBidder, _, seller, sellerFull = GetAuctionItemInfo("list", index)
	local rawLink = GetAuctionItemLink("list", index)
	local timeLeft = GetAuctionItemTimeLeft("list", index)
	local itemLink = ItemInfo.GeneralizeLink(rawLink)
	local itemString = ItemString.Get(itemLink)
	if not itemString or not buyout or not stackSize or not timeLeft then
		return
	end
	-- pet auctions don't give textures so get from our item database
	texture = texture or ItemInfo.GetTexture(itemLink)
	local displayedBid = bid == 0 and minBid or bid
	local itemDisplayedBid = floor(displayedBid / stackSize)
	local itemBuyout = (buyout > 0) and floor(buyout / stackSize) or 0
	-- this is to get around a bug in Blizzard's code where the minIncrement value will be inconsistent for auctions where the player is the highest bidder
	minIncrement = isHighBidder and 0 or minIncrement
	seller = private.FixSellerName(seller, sellerFull) or "?"
	local hash = self:_GetAuctionRowHash(index, false)
	local hashNoSeller = self:_GetAuctionRowHash(index, true)
	local targetItem = filter and filter:_GetTargetItem() or itemString
	local targetItemRate = filter and filter:_GetTargetItemRate(itemString)
	return rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder,
		seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink,
		itemString, hash, hashNoSeller, private.filterId, targetItem, targetItemRate
end

function AuctionScan._GetAuctionRowFields83(self, isCommodity, itemKey, index, filter)
	local rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid = nil, nil, nil, nil, nil, nil, nil, nil
	local isHighBidder, seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout = nil, nil, nil, nil, nil, nil
	local itemLink, itemString, hash, hashNoSeller, targetItem, targetItemRate, auctionId = nil, nil, nil, nil, nil, nil, nil
	local resultInfo = nil
	if isCommodity then
		resultInfo = C_AuctionHouse.GetCommoditySearchResultInfo(itemKey.itemID, index)
	else
		resultInfo = C_AuctionHouse.GetItemSearchResultInfo(itemKey, index)
	end
	if not resultInfo then
		return
	end
	if isCommodity then
		rawLink = ItemInfo.GetLink(itemKey.itemID)
		buyout = resultInfo.unitPrice * resultInfo.quantity
		-- convert the timeLeftSeconds to regular timeLeft
		if resultInfo.timeLeftSeconds < 60 * 60 then
			timeLeft = 1
		elseif resultInfo.timeLeftSeconds < 2 * 60 * 60 then
			timeLeft = 2
		elseif resultInfo.timeLeftSeconds < 12 * 60 * 60 then
			timeLeft = 3
		else
			timeLeft = 4
		end
	else
		rawLink = resultInfo.itemLink
		buyout = resultInfo.buyoutAmount or 0
		timeLeft = resultInfo.timeLeft + 1
	end
	itemLink = ItemInfo.GeneralizeLink(rawLink)
	texture = ItemInfo.GetTexture(itemLink)
	rawName = ItemInfo.GetName(rawLink)
	stackSize = resultInfo.quantity
	itemString = ItemString.Get(itemLink)
	itemBuyout = buyout / stackSize
	isHighBidder = false -- FIXME: figure out what this should be (for non-commodities)
	minBid = resultInfo.minBid or buyout
	minIncrement = 0 -- FIXME: figure out what this should be (for non-commodities)
	bid = resultInfo.bidAmount or 0
	displayedBid = bid == 0 and minBid or bid
	itemDisplayedBid = displayedBid / stackSize
	for i, owner in ipairs(resultInfo.owners) do
		if owner == "player" then
			resultInfo.owners[i] = UnitName("player")
		end
	end
	seller = table.concat(resultInfo.owners, ",")
	if isCommodity then
		hash = strjoin("~", tostringall(true, itemKey.itemID, buyout, timeLeft, stackSize))
		hashNoSeller = strjoin("~", tostringall(true, itemKey.itemID, buyout, seller, timeLeft, stackSize))
	else
		hash = strjoin("~", tostringall(false, itemKey.itemID, itemKey.itemLevel, itemKey.itemSuffix, itemKey.battlePetSpeciesID, rawLink, minBid, minIncrement, buyout, bid, timeLeft, stackSize, isHighBidder))
		hashNoSeller = strjoin("~", tostringall(false, itemKey.itemID, itemKey.itemLevel, itemKey.itemSuffix, itemKey.battlePetSpeciesID, rawLink, minBid, minIncrement, buyout, bid, seller, timeLeft, stackSize, isHighBidder))
	end
	targetItem = filter and filter:_GetTargetItem() or itemString
	targetItemRate = filter and filter:_GetTargetItemRate(itemString)
	auctionId = resultInfo.auctionID
	return rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder,
		seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink,
		itemString, hash, hashNoSeller, private.filterId, targetItem, targetItemRate, auctionId
end

function AuctionScan._CreateAuctionRowIfNotFiltered(self, index, filter)
	local rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder,
		seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink,
		itemString, hash, hashNoSeller, filterId, targetItem, targetItemRate = self:_GetAuctionRowFields(index, filter)
	if filter:_IsFiltered(self._ignoreItemLevel, itemString, itemBuyout, stackSize, targetItemRate) or self:_IsFiltered(itemString, itemBuyout, stackSize, itemDisplayedBid) then
		return nil
	end
	return self._db:NewRow()
		:SetField("rawName", rawName)
		:SetField("rawLink", rawLink)
		:SetField("texture", texture)
		:SetField("stackSize", stackSize)
		:SetField("minBid", minBid)
		:SetField("minIncrement", minIncrement)
		:SetField("buyout", buyout)
		:SetField("bid", bid)
		:SetField("isHighBidder", isHighBidder)
		:SetField("seller", seller)
		:SetField("timeLeft", timeLeft)
		:SetField("displayedBid", displayedBid)
		:SetField("itemDisplayedBid", itemDisplayedBid)
		:SetField("itemBuyout", itemBuyout)
		:SetField("itemLink", itemLink)
		:SetField("itemString", itemString)
		:SetField("hash", hash)
		:SetField("hashNoSeller", hashNoSeller)
		:SetField("filterId", filterId)
		:SetField("targetItem", targetItem)
		:SetField("targetItemRate", targetItemRate)
		:SetField("auctionId", 0)
		:CreateAndClone()
end

function AuctionScan._NotifyFilterDone(self, filter, numNewResults)
	if self._onFilterDoneHandler then
		self:_onFilterDoneHandler(filter, numNewResults)
	end
end

function AuctionScan._SetFiltersScanned(self, num)
	self._filtersScanned = num
	self:_SetPageProgress(0, 0)
end

function AuctionScan._SetPageProgress(self, pagesScanned, numPages)
	self._pagesScanned = pagesScanned
	self._numPages = numPages
	if self._onProgressUpdateHandler then
		self:_onProgressUpdateHandler()
	end
end

function AuctionScan._GetFindFilter(self, row)
	if self._findFilter then
		self._findFilter:_Release()
	else
		self._findFilter = TSM.Auction.NewAuctionFilter()
	end
	self._findFilter:_Acquire(self)
	local itemString = row:GetField("itemString")
	local level = ItemInfo.GetMinLevel(itemString)
	self._findFilter
		:SetName(ItemInfo.GetName(itemString))
		:SetMinLevel(level)
		:SetMaxLevel(level)
		:SetQuality(ItemInfo.GetQuality(itemString))
		:SetClass(ItemInfo.GetClassId(itemString))
		:SetSubClass(ItemInfo.GetSubClassId(itemString))
		:SetExact(true)
		:SetItems(itemString)
	return self._findFilter
end

function AuctionScan._ValidateIndex(self, index, validateRow, noSeller)
	return validateRow:GetField(noSeller and "hashNoSeller" or "hash") == self:_GetAuctionRowHash(index, noSeller)
end

function AuctionScan._SendBrowseQuery83(self, query)
	if not private.ThrottleQuery83(self) then
		return false
	end
	C_AuctionHouse.SendBrowseQuery(query)
	return true
end



-- ============================================================================
-- TSMAPI Functions
-- ============================================================================

function TSMAPI_FOUR.Auction.NewDatabase(name)
	return Database.NewSchema(name)
		-- raw fields directly from the game
		:AddStringField("rawName")
		:AddStringField("rawLink")
		:AddNumberField("texture")
		:AddNumberField("stackSize")
		:AddNumberField("minBid")
		:AddNumberField("minIncrement")
		:AddNumberField("buyout")
		:AddNumberField("bid")
		:AddBooleanField("isHighBidder")
		:AddStringField("seller")
		:AddNumberField("timeLeft")
		-- calculated fields which we'll use (so want to cache)
		:AddNumberField("displayedBid")
		:AddNumberField("itemDisplayedBid")
		:AddNumberField("itemBuyout")
		:AddStringField("itemLink")
		:AddStringField("itemString")
		:AddSmartMapField("baseItemString", ItemString.GetBaseMap(), "itemString")
		:AddStringField("hash")
		:AddStringField("hashNoSeller")
		:AddNumberField("filterId")
		:AddStringField("targetItem")
		:AddNumberField("targetItemRate")
		:AddNumberField("auctionId")
		:Commit()
end

function TSMAPI_FOUR.Auction.NewAuctionScan(db)
	local auctionScan = tremove(private.recycledScans)
	if not auctionScan then
		auctionScan = AuctionScan()
	end
	auctionScan:_Acquire(db)
	return auctionScan
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.NewQueryFilterCallback(items, name, minLevel, maxLevel, quality, class, subClass)
	local auctionFilter = private.queryUtilContext.self:NewAuctionFilter()
		:SetName(name)
		:SetMinLevel(minLevel)
		:SetMaxLevel(maxLevel)
		:SetQuality(quality)
		:SetClass(class)
		:SetSubClass(subClass)
		:SetItems(items)
	for _, itemString in ipairs(auctionFilter:GetItems()) do
		local num = private.queryUtilContext.maxItemQuantity and private.queryUtilContext.maxItemQuantity[itemString]
		if num then
			auctionFilter:SetItemMaxQuantity(itemString, num)
		end
		local targetItem = private.queryUtilContext.targetItem
		if targetItem then
			auctionFilter:SetTargetItem(targetItem)
		end
	end
end

function private.IsAuctionPageValidThreaded(auctionScan)
	local numAuctions, totalAuctions = GetNumAuctionItems("list")
	if totalAuctions <= NUM_AUCTION_ITEMS_PER_PAGE and numAuctions ~= totalAuctions then
		-- there are cases where we get (0, 1) from the API - no idea why and it'll cause bugs later, so we should count it as invalid
		Log.Err("Unexpected number of auctions (%d, %d)", numAuctions, totalAuctions)
		return false
	end

	for i = 1, numAuctions do
		-- checks to make sure all the data has been sent to the client
		-- if not, the data is bad and we'll wait / try again
		local _, _, _, stackSize, _, _, buyout, _, _, seller, timeLeft, _, _, _, itemLink, itemString = auctionScan:_GetAuctionRowFields(i)
		local name = ItemInfo.GetName(itemLink)
		local itemLevel = ItemInfo.GetItemLevel(itemLink)
		if not itemString or not buyout or not stackSize or not name or not timeLeft then
			return false
		elseif not itemLevel and not auctionScan._ignoreItemLevel then
			return false
		elseif not seller and auctionScan._resolveSellers and buyout ~= 0 then
			return false
		end
		Threading.Yield()
	end

	return true
end

function private.ScanAuctionPageThreaded(auctionScan, filter)
	if not TSM.IsWow83() then
		local startTime = GetTime()
		local lastSuccessTime = GetTime()
		local index = 1
		local numInsertedRows = 0
		while true do
			local numAuctions, totalAuctions = GetNumAuctionItems("list")
			if totalAuctions <= NUM_AUCTION_ITEMS_PER_PAGE and numAuctions ~= totalAuctions then
				-- there are cases where we get (0, 1) from the API - no idea why and it'll cause bugs later, so we should count it as invalid
				Log.Err("Unexpected number of auctions (%d, %d)", numAuctions, totalAuctions)
				return false
			elseif filter:_IsGetAll() and totalAuctions <= NUM_AUCTION_ITEMS_PER_PAGE then
				-- we're no longer on the GetAll results
				Log.Err("Switched off GetAll results")
				return false
			end

			auctionScan._db:BulkInsertStart()
			local maxIndex = min(numAuctions, index + NUM_AUCTION_ITEMS_PER_PAGE)
			while index <= maxIndex do
				local rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder, seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink, itemString, hash, hashNoSeller, filterId, targetItem, targetItemRate = auctionScan:_GetAuctionRowFields(index, filter)
				if not itemString or not buyout or not stackSize or not ItemInfo.GetName(itemLink) or not timeLeft then
					break
				elseif not ItemInfo.GetItemLevel(itemLink) and not auctionScan._ignoreItemLevel then
					break
				elseif seller == "?" and auctionScan._resolveSellers and buyout ~= 0 then
					break
				end
				index = index + 1
				lastSuccessTime = GetTime()
				if not filter:_IsFiltered(auctionScan._ignoreItemLevel, itemString, itemBuyout, stackSize, targetItemRate) and not auctionScan:_IsFiltered(itemString, itemBuyout, stackSize, itemDisplayedBid) then
					local uuid = auctionScan._db:BulkInsertNewRow(rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder, seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink, itemString, hash, hashNoSeller, filterId, targetItem, targetItemRate, 0)
					filter:_AddResultRow(uuid)
					numInsertedRows = numInsertedRows + 1
				end
			end
			auctionScan._db:BulkInsertEnd()

			if filter:_IsGetAll() then
				-- update the "page"
				filter:_SetPage(index)
				filter:_SetNumPages(numAuctions)
			else
				filter:_SetNumPages(ceil(totalAuctions / NUM_AUCTION_ITEMS_PER_PAGE))
			end
			auctionScan:_SetPageProgress(filter:_GetPageProgress())

			if index > numAuctions then
				return true, numInsertedRows
			elseif GetTime() > startTime + 300 then
				Log.Err("Timed out on entire scan")
				return false
			elseif GetTime() > lastSuccessTime + 30 then
				Log.Err("Timed out on index (%d)", index)
				return false
			end
			Threading.Sleep(0.01)
			if auctionScan:_IsCancelled() then
				Log.Info("Stopping cancelled scan")
				return false
			end
		end
	else
		local results = C_AuctionHouse.GetBrowseResults()
		filter:_SetNumPages(#results)
		local numInsertedRows = 0
		for i = 1, #results do
			local itemKey = results[i].itemKey

			-- check if the item is a commodity or not
			local itemKeyInfo = C_AuctionHouse.GetItemKeyInfo(itemKey)
			while not itemKeyInfo do
				Threading.Yield(true)
				itemKeyInfo = C_AuctionHouse.GetItemKeyInfo(itemKey)
				if auctionScan:_IsCancelled() then
					Log.Info("Stopping cancelled scan")
					return false
				end
			end
			local isCommodity = itemKeyInfo.isCommodity

			-- send the query for this item
			Threading.Yield(true)
			if not C_AuctionHouse.HasSearchResults(itemKey) then
				if not private.SendSearchQuery83(itemKey, auctionScan) then
					return false
				end
				Threading.WaitForEvent(itemKeyInfo.isCommodity and "COMMODITY_SEARCH_RESULTS_UPDATED" or "ITEM_SEARCH_RESULTS_UPDATED")
			end

			-- get all the search results
			if itemKeyInfo.isCommodity then
				while not C_AuctionHouse.HasFullCommoditySearchResults(itemKey.itemID) do
					Log.Info("Requesting more...")
					C_AuctionHouse.RequestMoreCommoditySearchResults(itemKey.itemID)
					Threading.WaitForEvent("COMMODITY_SEARCH_RESULTS_ADDED")
				end
			else
				while not C_AuctionHouse.HasFullItemSearchResults(itemKey) do
					Log.Info("Requesting more...")
					C_AuctionHouse.RequestMoreItemSearchResults(itemKey)
					Threading.WaitForEvent("ITEM_SEARCH_RESULTS_ADDED")
				end
			end

			-- scan the results
			local startTime = GetTime()
			local lastSuccessTime = GetTime()
			local index = 1
			while true do
				local numItemResults = nil
				if isCommodity then
					numItemResults = C_AuctionHouse.GetNumCommoditySearchResults(itemKey.itemID)
				else
					numItemResults = C_AuctionHouse.GetNumItemSearchResults(itemKey)
				end
				auctionScan._db:BulkInsertStart()
				while index <= numItemResults do
					local rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder, seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink, itemString, hash, hashNoSeller, filterId, targetItem, targetItemRate, auctionId = auctionScan:_GetAuctionRowFields83(isCommodity, itemKey, index, filter)
					if not itemString or not buyout or not stackSize or not ItemInfo.GetName(itemLink) or not timeLeft then
						break
					elseif not ItemInfo.GetItemLevel(itemLink) and not auctionScan._ignoreItemLevel then
						break
					elseif seller == "" and auctionScan._resolveSellers and buyout ~= 0 then
						break
					end
					index = index + 1
					lastSuccessTime = GetTime()
					if not filter:_IsFiltered(auctionScan._ignoreItemLevel, itemString, itemBuyout, stackSize, targetItemRate) and not auctionScan:_IsFiltered(itemString, itemBuyout, stackSize, itemDisplayedBid) then
						local uuid = auctionScan._db:BulkInsertNewRow(rawName, rawLink, texture, stackSize, minBid, minIncrement, buyout, bid, isHighBidder, seller, timeLeft, displayedBid, itemDisplayedBid, itemBuyout, itemLink, itemString, hash, hashNoSeller, filterId, targetItem, targetItemRate, auctionId)
						filter:_AddResultRow(uuid)
						numInsertedRows = numInsertedRows + 1
					end
				end
				auctionScan._db:BulkInsertEnd()

				if index > numItemResults then
					break
				elseif GetTime() > startTime + 300 then
					Log.Err("Timed out on entire scan")
					return false
				elseif GetTime() > lastSuccessTime + 30 then
					Log.Err("Timed out on index (%d)", index)
					return false
				end
				Threading.Sleep(0.01)
				if auctionScan:_IsCancelled() then
					Log.Info("Stopping cancelled scan")
					return false
				end
			end

			-- update the "page"
			filter:_SetPage(i)
			auctionScan:_SetPageProgress(filter:_GetPageProgress())
		end
		return true, numInsertedRows
	end
end

function private.ValidateThreaded(auctionScan)
	-- wait a bit for things to settle
	local settleStartTime = GetTime()
	while not CanSendAuctionQuery() and GetTime() < settleStartTime + MAX_SETTLE_TIME do
		if auctionScan:_IsCancelled() then
			return false
		end
		Threading.Yield(true)
	end
	Log.Info("Took %d seconds for AH to settle", GetTime() - settleStartTime)
	-- check the result
	local tryNum = 0
	while tryNum < MAX_SOFT_RETRIES do
		if auctionScan:_IsCancelled() then
			Log.Info("Stopping cancelled scan")
			return false
		end
		-- wait a small delay and then try and get the result
		Threading.Sleep(SCAN_RESULT_DELAY)
		-- get result
		if private.IsAuctionPageValidThreaded(auctionScan) then
			-- result is valid, so we're done
			Log.Info("Took %d soft retries", tryNum)
			return true
		end
		-- only count tries if we're ready to send the next query
		if CanSendAuctionQuery() then
			tryNum = tryNum + 1
		end
	end
	Log.Info("Exhausted soft retries")
	return false
end

function private.SetAuctionSort(...)
	local numCols = select("#", ...)
	if GetAuctionSort("list", numCols + 1) == nil then
		local properlySorted = true
		for i = 1, numCols do
			local col = select(i, ...)
			local sortCol, sortReversed = GetAuctionSort("list", numCols - i + 1)
			-- we never care to reverse a sort so if it's reversed then it's not properly sorted
			if sortCol ~= col or sortReversed then
				properlySorted = false
				break
			end
		end
		if properlySorted then
			-- already sorted
			return
		end
	end

	SortAuctionClearSort("list")
	for _, col in Vararg.Iterator(...) do
		SortAuctionItems("list", col)
	end
	SortAuctionApplySort("list")
end

function private.ScanQueryThreaded(auctionScan)
	-- loop through each filter to perform
	auctionScan:_SetFiltersScanned(0)
	auctionScan._cancelled = false
	local allSuccess = true
	for i, filter in ipairs(auctionScan._filters) do
		if not TSM.IsWow83() then
			-- update the sort for this filter
			if filter:_IsSniper() or filter:_IsGetAll() then
				private.SetAuctionSort()
			else
				private.SetAuctionSort("seller", "quantity", "unitprice")
			end
		end
		-- give some time for the AH to update
		Threading.Yield(true)
		filter:_ResetPage()
		local numNewResults = 0
		local hasMorePages = true
		local filterSuccess = true
		-- loop through each page of this filter and scan it
		while hasMorePages and not auctionScan:_IsCancelled() do
			-- query the AH
			if not filter:_DoAuctionQueryThreaded() then
				filterSuccess = false
				break
			end
			-- we've made the query, now store the results
			if filter:_IsSniper() then
				-- check the result
				if not private.ValidateThreaded(auctionScan) then
					-- don't store results for a failed filter
					Log.Err("Failed to scan filter")
					filterSuccess = false
					break
				elseif auctionScan:_IsCancelled() then
					Log.Info("Stopping cancelled scan")
					break
				end
				auctionScan._db:SetQueryUpdatesPaused(true)
				for j = 1, GetNumAuctionItems("list") do
					local row = auctionScan:_CreateAuctionRowIfNotFiltered(j, filter)
					if row then
						local hashNoSeller = row:GetField("hashNoSeller")
						-- remove existing duplicates from previous filters
						local query = auctionScan._db:NewQuery()
							:Equal("hashNoSeller", hashNoSeller)
							:LessThan("filterId", private.filterId)
						local removedOld = false
						for _, oldRow in query:Iterator() do
							removedOld = true
							auctionScan:DeleteRowFromDB(oldRow, false)
						end
						query:Release()
						if not removedOld then
							local newQuery = auctionScan._db:NewQuery()
								:Equal("hashNoSeller", hashNoSeller)
								:Equal("filterId", private.filterId)
							if newQuery:Count() == 1 then
								numNewResults = numNewResults + 1
							end
							newQuery:Release()
						end
						filter:_AddResultRow(row:GetUUID())
						row:Release()
					end
				end
				auctionScan._db:SetQueryUpdatesPaused(false)
			else
				-- scan the results
				local scanSuccess, numInsertedRows = private.ScanAuctionPageThreaded(auctionScan, filter)
				if not scanSuccess then
					-- don't store results for a failed filter
					Log.Err("Failed to scan filter")
					filterSuccess = false
					break
				elseif auctionScan:_IsCancelled() then
					Log.Info("Stopping cancelled scan")
					break
				end
				numInsertedRows = numInsertedRows
			end
			private.filterId = private.filterId + 1
			hasMorePages = filter:_NextPage()
			auctionScan:_SetPageProgress(filter:_GetPageProgress())
		end
		if filterSuccess then
			auctionScan:_NotifyFilterDone(filter, numNewResults)
		elseif not filter:_IsSniper() then
			allSuccess = false
		end
		auctionScan:_SetFiltersScanned(i)
		if auctionScan:_IsCancelled() then
			break
		end
	end
	if not allSuccess then
		Log.PrintUser(L["TSM failed to scan some auctions. Please rerun the scan."])
	end
end

function private.FindAuctionThreaded(auctionScan, row, noSeller)
	-- make sure we're not in the middle of a query where the results are going to change on us
	Threading.WaitForFunction(CanSendAuctionQuery)
	local timeout = 5
	while not private.IsAuctionPageValidThreaded(auctionScan) and timeout > 0 do
		Threading.Sleep(0.2)
		timeout = timeout - 0.2
	end

	-- search the current page for the auction
	if private.FindAuctionOnCurrentPage(auctionScan, row, noSeller) then
		Log.Info("Found on current page")
		return auctionScan._findResult
	end

	-- Sort the auction house
	private.SetAuctionSort("seller", "quantity", "unitprice")

	-- try to predict the auction index within the query we will be doing below
	local query = auctionScan._db:NewQuery()
		:Equal("baseItemString", row:GetField("baseItemString"))
		:GreaterThan("itemBuyout", 0)
		:OrderBy("itemBuyout", true)
		:OrderBy("stackSize", true)
		:OrderBy("seller", true)
	local predictionPage = nil
	if row:GetField("itemBuyout") == 0 then
		-- bid-only auctions will be on the last page so start there
		predictionPage = ceil(query:Count() / NUM_AUCTION_ITEMS_PER_PAGE) - 1
		Log.Info("Predicting auction is on page %d (bid-only)", predictionPage)
	else
		local index = 1
		for _, dbRow in query:Iterator() do
			if dbRow == row then
				-- this row shouldn't show up multiple times in the query
				assert(not predictionPage)
				predictionPage = ceil(index / NUM_AUCTION_ITEMS_PER_PAGE) - 1
				Log.Info("Predicting auction is on page %d (found in DB)", predictionPage)
			end
			index = index + 1
		end
	end
	query:Release()

	-- search for the item
	local filter = auctionScan:_GetFindFilter(row)
	filter:_SetPage(predictionPage)
	local minPage, maxPage, direction, retriesLeft = 0, nil, "UP", 1
	while true do
		-- query the AH
		if not filter:_DoAuctionQueryThreaded() then
			break
		end
		-- check the result
		private.ValidateThreaded(auctionScan)
		-- search this page for the row
		if private.FindAuctionOnCurrentPage(auctionScan, row, noSeller) then
			Log.Info("Found auction (%d)", filter:_GetPage())
			return auctionScan._findResult
		elseif auctionScan:_IsCancelled() then
			break
		end

		-- check if we can go to the next page
		local page, numPages = filter:_GetPageProgress()
		local canBeLater = private.FindAuctionCanBeOnLaterPage(row)
		local canBeEarlier = private.FindAuctionCanBeOnEarlierPage(row)
		maxPage = maxPage or numPages - 1
		if not canBeLater and page < maxPage then
			maxPage = page
		end
		if not canBeEarlier and page > minPage then
			minPage = page
		end
		while true do
			if direction == "UP" then
				if canBeLater and page < maxPage then
					Log.Info("Trying next page (%d)", page + 1)
					filter:_SetPage(page + 1)
					break
				else
					direction = "DOWN"
				end
			end
			if direction == "DOWN" then
				if canBeEarlier and page > minPage then
					Log.Info("Trying previous page (%d)", page - 1)
					filter:_SetPage(page - 1)
					break
				else
					if retriesLeft == 0 then
						-- give up
						Log.Info("Giving up (%d,%d,%d,%d)", minPage, maxPage, page, numPages)
						return
					end
					retriesLeft = retriesLeft - 1
					direction = "UP"
				end
			end
		end
	end
end

function private.FindAuctionCanBeOnLaterPage(row)
	local pageAuctions = GetNumAuctionItems("list")
	if pageAuctions == 0 then
		-- there are no auctions on this page, so it cannot be on a later one
		return false
	end
	local _, _, stackSize, _, _, _, _, _, _, buyout, _, _, _, seller, sellerFull = GetAuctionItemInfo("list", pageAuctions)

	local itemBuyout = (buyout > 0) and floor(buyout / stackSize) or 0
	local rowItemBuyout = row:GetField("itemBuyout")
	if rowItemBuyout > itemBuyout then
		-- item must be on a later page since it would be sorted after the last auction on this page
		return true
	elseif rowItemBuyout < itemBuyout then
		-- item cannot be on a later page since it would be sorted before the last auction on this page
		return false
	end

	local rowStackSize = row:GetField("stackSize")
	if rowStackSize > stackSize then
		-- item must be on a later page since it would be sorted after the last auction on this page
		return true
	elseif rowStackSize < stackSize then
		-- item cannot be on a later page since it would be sorted before the last auction on this page
		return false
	end

	seller = private.FixSellerName(seller, sellerFull) or "?"
	local rowSeller = row:GetField("seller")
	if rowSeller > seller then
		-- item must be on a later page since it would be sorted after the last auction on this page
		return true
	elseif rowSeller < seller then
		-- item cannot be on a later page since it would be sorted before the last auction on this page
		return false
	end

	-- all the things we are sorting on are the same, so the auction could be on a later page
	return true
end

function private.FindAuctionCanBeOnEarlierPage(row)
	local pageAuctions = GetNumAuctionItems("list")
	if pageAuctions == 0 then
		-- there are no auctions on this page, so it can be on an earlier one
		return true
	end
	local _, _, stackSize, _, _, _, _, _, _, buyout, _, _, _, seller, sellerFull = GetAuctionItemInfo("list", 1)

	local itemBuyout = (buyout > 0) and floor(buyout / stackSize) or 0
	local rowItemBuyout = row:GetField("itemBuyout")
	if rowItemBuyout < itemBuyout then
		-- item must be on an earlier page since it would be sorted before the first auction on this page
		return true
	elseif rowItemBuyout > itemBuyout then
		-- item cannot be on an earlier page since it would be sorted after the first auction on this page
		return false
	end

	local rowStackSize = row:GetField("stackSize")
	if rowStackSize < stackSize then
		-- item must be on an earlier page since it would be sorted before the last auction on this page
		return true
	elseif rowStackSize > stackSize then
		-- item cannot be on an earlier page since it would be sorted after the last auction on this page
		return false
	end

	seller = private.FixSellerName(seller, sellerFull) or "?"
	local rowSeller = row:GetField("seller")
	if rowSeller < seller then
		-- item must be on an earlier page since it would be sorted before the last auction on this page
		return true
	elseif rowSeller > seller then
		-- item cannot be on an earlier page since it would be sorted after the last auction on this page
		return false
	end

	-- all the things we are sorting on are the same, so the auction could be on an earlier page
	return true
end

function private.FindAuctionOnCurrentPage(auctionScan, row, noSeller)
	local found = false
	for i = 1, GetNumAuctionItems("list") do
		if auctionScan:_ValidateIndex(i, row, noSeller) then
			tinsert(auctionScan._findResult, i)
			found = true
		end
	end
	return found
end

function private.FindAuctionThreaded83(auctionScan, row, noSeller)
	local isCommodity, itemId, itemLevel, itemSuffix, battlePetSpeciesID = strsplit("~", row:GetField("hash"))
	isCommodity = isCommodity == "true"
	itemId = tonumber(itemId)
	itemLevel = tonumber(itemLevel)
	itemSuffix = tonumber(itemSuffix)
	battlePetSpeciesID = tonumber(battlePetSpeciesID)
	local itemKey = TempTable.Acquire()
	itemKey.itemID = itemId
	itemKey.itemLevel = isCommodity and 0 or itemLevel
	itemKey.itemSuffix = isCommodity and 0 or itemSuffix
	itemKey.battlePetSpeciesID = isCommodity and 0 or battlePetSpeciesID
	-- send the query for this item
	if not C_AuctionHouse.HasSearchResults(itemKey) then
		if not private.SendSearchQuery83(itemKey, auctionScan) then
			return nil
		end
		Threading.WaitForEvent(isCommodity and "COMMODITY_SEARCH_RESULTS_UPDATED" or "ITEM_SEARCH_RESULTS_UPDATED")
	end

	-- get all the search results
	if isCommodity then
		while not C_AuctionHouse.HasFullCommoditySearchResults(itemKey.itemID) do
			Log.Info("Requesting more...")
			C_AuctionHouse.RequestMoreCommoditySearchResults(itemKey.itemID)
			Threading.WaitForEvent("COMMODITY_SEARCH_RESULTS_ADDED")
		end
	else
		while not C_AuctionHouse.HasFullItemSearchResults(itemKey) do
			Log.Info("Requesting more...")
			C_AuctionHouse.RequestMoreItemSearchResults(itemKey)
			Threading.WaitForEvent("ITEM_SEARCH_RESULTS_ADDED")
		end
	end

	-- search the results for the auction
	local numItemResults = nil
	if isCommodity then
		numItemResults = C_AuctionHouse.GetNumCommoditySearchResults(itemKey.itemID)
	else
		numItemResults = C_AuctionHouse.GetNumItemSearchResults(itemKey)
	end
	for i = 1, numItemResults do
		local resultInfo = nil
		if isCommodity then
			resultInfo = C_AuctionHouse.GetCommoditySearchResultInfo(itemKey.itemID, i)
			tinsert(auctionScan._findResult, i)
		else
			resultInfo = C_AuctionHouse.GetItemSearchResultInfo(itemKey, i)
			if resultInfo.auctionID == row:GetField("auctionId") then
				tinsert(auctionScan._findResult, i)
			end
		end
	end
	TempTable.Release(itemKey)
	return #auctionScan._findResult > 0 and auctionScan._findResult or nil
end

function private.FixSellerName(seller, sellerFull)
	local realm = GetRealmName()
	if sellerFull and strjoin("-", seller, realm) ~= sellerFull then
		return sellerFull
	else
		return seller
	end
end

function private.ThrottleQuery83(auctionScan)
	local sleepTime = MIN_QUERY_INTERVAL_83 - (GetTime() - private.lastSearchQuery83)
	local timeout = GetTime() + MIN_QUERY_INTERVAL_83 * 10
	while sleepTime > 0 do
		if auctionScan:_IsCancelled() then
			Log.Info("Stopping cancelled scan")
			return false
		elseif GetTime() > timeout then
			Log.PrintUser(L["Timed out waiting for the AH to be ready. Please ensure no other addons are scanning the AH and try again."])
			return false
		end
		Threading.Sleep(sleepTime)
		sleepTime = MIN_QUERY_INTERVAL_83 - (GetTime() - private.lastSearchQuery83)
	end
	return true
end

function private.SendSearchQuery83(itemKey, auctionScan)
	if not private.ThrottleQuery83(auctionScan) then
		return false
	end
	C_AuctionHouse.SendSearchQuery(itemKey, EMPTY_SORTS_TABLE, true)
	return true
end



-- ============================================================================
-- Initialization Code
-- ============================================================================

do
	if TSM.IsWow83() then
		local function UpdateLastSearchQueryTime()
			private.lastSearchQuery83 = GetTime()
		end
		hooksecurefunc(C_AuctionHouse, "SendBrowseQuery", UpdateLastSearchQueryTime)
		hooksecurefunc(C_AuctionHouse, "SendSearchQuery", UpdateLastSearchQueryTime)
		hooksecurefunc(C_AuctionHouse, "SendSellSearchQuery", UpdateLastSearchQueryTime)
	end
end
