-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- This file contains code for scanning the auction house
local _, TSM = ...
local L = TSM.L
local private = {
	recycledFilters = {},
	recycledScans = {},
	nextFilterId = 0,
	queryUtilContext = { self = nil, maxItemQuantity = nil },
}
-- some constants
local SCAN_RESULT_DELAY = 0.1
local MAX_SOFT_RETRIES = 50
local MAX_HARD_RETRIES = 2



-- ============================================================================
-- AuctionFilter Class
-- ============================================================================

local AuctionFilter = TSMAPI_FOUR.Class.DefineClass("AuctionFilter")

function AuctionFilter.__init(self)
	self._name = nil
	self._minLevel = nil
	self._maxLevel = nil
	self._quality = nil
	self._class = nil
	self._subClass = nil
	self._invType = nil
	self._usable = nil
	self._unlearned = nil
	self._canlearn = nil
	self._exact = nil
	self._sniperLastPage = nil
	self._page = 0
	-- custom filters applies after the scan
	self._evenOnly = nil
	self._minItemLevel = nil
	self._maxItemLevel = nil
	self._minPrice = nil
	self._maxPrice = nil
	self._generalMaxQuantity = nil
	self._items = {}
	self._itemMaxQuantities = {}
	self._resultIncludesRow = {}
end

function AuctionFilter._Acquire(self)
	self._page = 0
end

function AuctionFilter._Release(self)
	self._name = nil
	self._minLevel = nil
	self._maxLevel = nil
	self._quality = nil
	self._class = nil
	self._subClass = nil
	self._invType = nil
	self._usable = nil
	self._unlearned = nil
	self._canlearn = nil
	self._exact = nil
	self._sniperLastPage = nil
	self._evenOnly = nil
	self._minItemLevel = nil
	self._maxItemLevel = nil
	self._minPrice = nil
	self._maxPrice = nil
	self._generalMaxQuantity = nil
	wipe(self._items)
	wipe(self._itemMaxQuantities)
	wipe(self._resultIncludesRow)
end

function AuctionFilter.SetName(self, name)
	self._name = name
	return self
end

function AuctionFilter.SetMinLevel(self, minLevel)
	self._minLevel = minLevel
	return self
end

function AuctionFilter.SetMaxLevel(self, maxLevel)
	self._maxLevel = maxLevel
	return self
end

function AuctionFilter.SetQuality(self, quality)
	self._quality = quality
	return self
end

function AuctionFilter.SetClass(self, class)
	self._class = class
	return self
end

function AuctionFilter.SetSubClass(self, subClass)
	self._subClass = subClass
	return self
end

function AuctionFilter.SetInvType(self, invType)
	self._invType = invType
	return self
end

function AuctionFilter.SetUsable(self, usable)
	self._usable = usable
	return self
end

function AuctionFilter.SetUnlearned(self, unlearned)
	self._unlearned = unlearned
	return self
end

function AuctionFilter.SetCanLearn(self, canlearn)
	self._canlearn = canlearn
	return self
end

function AuctionFilter.SetExact(self, exact)
	self._exact = exact
	return self
end

function AuctionFilter.SetItems(self, items)
	assert(#self._items == 0)
	if type(items) == "table" then
		assert(#items > 0)
		for _, itemString in ipairs(items) do
			tinsert(self._items, itemString)
		end
	else
		tinsert(self._items, items)
	end
	return self
end

function AuctionFilter.SetEvenOnly(self, evenOnly)
	self._evenOnly = evenOnly
	return self
end

function AuctionFilter.SetMinItemLevel(self, minItemLevel)
	self._minItemLevel = minItemLevel
	return self
end

function AuctionFilter.SetMaxItemLevel(self, maxItemLevel)
	self._maxItemLevel = maxItemLevel
	return self
end

function AuctionFilter.SetMinPrice(self, minPrice)
	self._minPrice = minPrice
	return self
end

function AuctionFilter.SetMaxPrice(self, maxPrice)
	self._maxPrice = maxPrice
	return self
end

function AuctionFilter.SetGeneralMaxQuantity(self, maxQuantity)
	self._generalMaxQuantity = maxQuantity
	return self
end

function AuctionFilter.SetItemMaxQuantity(self, itemString, maxQuantity)
	self._itemMaxQuantities[itemString] = maxQuantity
	return self
end

function AuctionFilter.SetSniper(self, isLastPage)
	assert(type(isLastPage) == "boolean")
	self._sniperLastPage = isLastPage
	return self
end

function AuctionFilter.GetItems(self)
	return self._items
end

function AuctionFilter._IsSniper(self)
	return self._sniperLastPage ~= nil
end

function AuctionFilter._GetPage(self)
	return self._page
end

function AuctionFilter._SetPage(self, page)
	self._page = page
end

function AuctionFilter._ResetPage(self)
	self._page = 0
end

function AuctionFilter._NextPage(self)
	self._page = self._page + 1
	return self._page < private.GetNumPages()
end

function AuctionFilter._GetPageProgress(self)
	return self._page, private.GetNumPages()
end

function AuctionFilter._IsFiltered(self, row)
	if #self._items > 0 then
		local found = false
		local rowItemString = row:GetField("itemString")
		local rowBaseItemString = row:GetField("baseItemString")
		for _, itemString in ipairs(self:GetItems()) do
			if itemString == rowItemString or itemString == rowBaseItemString then
				found = true
			end
		end
		if not found then
			return true
		end
	end
	if self._evenOnly and row:GetField("stackSize") % 5 ~= 0 then
		return true
	end
	local itemString = row:GetField("itemString")
	local itemLevel = TSMAPI_FOUR.Item.GetItemLevel(itemString)
	if itemLevel < (self._minItemLevel or 0) or itemLevel > (self._maxItemLevel or math.huge) then
		return true
	end
	if self._unlearned and CanIMogIt:PlayerKnowsTransmog(TSMAPI_FOUR.Item.GetLink(itemString)) then
		return true
	end
	if self._canlearn and not CanIMogIt:CharacterCanLearnTransmog(TSMAPI_FOUR.Item.GetLink(itemString)) then
		return true
	end
	if self._minPrice or self._maxPrice then
		local rowBuyout = row:GetField("itemBuyout")
		if not rowBuyout or rowBuyout < (self._minPrice or 0) or rowBuyout > (self._maxPrice or math.huge) then
			return true
		end
	end
	return false
end

function AuctionFilter._DoAuctionQueryThreaded(self)
	if self:_IsSniper() then
		if self._sniperLastPage then
			-- scan the last page
			local lastPage = max(private.GetNumPages() - 1, 0)
			while true do
				-- wait for the AH to be ready
				TSMAPI_FOUR.Thread.WaitForFunction(CanSendAuctionQuery)
				-- query the AH
				QueryAuctionItems(nil, nil, nil, lastPage)
				-- wait for the update event
				TSMAPI_FOUR.Thread.WaitForEvent("AUCTION_ITEM_LIST_UPDATE")
				local newLastPage = max(private.GetNumPages() - 1, 0)
				if newLastPage == lastPage then
					break
				end
				lastPage = newLastPage
			end
		else
			-- scan the first page
			-- wait for the AH to be ready
			TSMAPI_FOUR.Thread.WaitForFunction(CanSendAuctionQuery)
			-- query the AH
			QueryAuctionItems(nil, nil, nil, 0)
			-- wait for the update event
			TSMAPI_FOUR.Thread.WaitForEvent("AUCTION_ITEM_LIST_UPDATE")
		end
	else
		-- wait for the AH to be ready
		TSMAPI_FOUR.Thread.WaitForFunction(CanSendAuctionQuery)
		local classFilterInfo = nil
		if self._class or self._subClass or self._invType then
			classFilterInfo = TSMAPI_FOUR.Util.AcquireTempTable()
			if self._invType == LE_INVENTORY_TYPE_CHEST_TYPE or self._invType == LE_INVENTORY_TYPE_ROBE_TYPE then
				-- default AH sends in queries for both chest types, we need to mimic this when using a chest filter
				local info1 = TSMAPI_FOUR.Util.AcquireTempTable()
				info1.classID = self._class
				info1.subClassID = self._subClass
				info1.inventoryType = LE_INVENTORY_TYPE_CHEST_TYPE
				tinsert(classFilterInfo, info1)
				local info2 = TSMAPI_FOUR.Util.AcquireTempTable()
				info2.classID = self._class
				info2.subClassID = self._subClass
				info2.inventoryType = LE_INVENTORY_TYPE_ROBE_TYPE
				tinsert(classFilterInfo, info2)
			else
				local info = TSMAPI_FOUR.Util.AcquireTempTable()
				info.classID = self._class
				info.subClassID = self._subClass
				info.inventoryType = self._invType
				tinsert(classFilterInfo, info)
			end
		end
		QueryAuctionItems(self._name, self._minLevel, self._maxLevel, self._page, self._usable, self._quality, nil, self._exact, classFilterInfo)
		if classFilterInfo then
			for i = #classFilterInfo, 1, -1 do
				TSMAPI_FOUR.Util.ReleaseTempTable(classFilterInfo[i])
				classFilterInfo[i] = nil
			end
			TSMAPI_FOUR.Util.ReleaseTempTable(classFilterInfo)
		end
		-- wait for the update event
		TSMAPI_FOUR.Thread.WaitForEvent("AUCTION_ITEM_LIST_UPDATE")
	end
end

function AuctionFilter._AddResultRow(self, uuid)
	self._resultIncludesRow[uuid] = true
end

function AuctionFilter._IncludesResultRow(self, uuid)
	return self._resultIncludesRow[uuid]
end

function AuctionFilter._GetNumCanBuy(self, row)
	local num = nil
	if self._generalMaxQuantity then
		num = min(self._generalMaxQuantity, num or math.huge)
	end
	if self._itemMaxQuantities then
		local itemString, baseItemString = row:GetFields("itemString", "baseItemString")
		if self._itemMaxQuantities[itemString] then
			num = min(self._itemMaxQuantities[itemString], num or math.huge)
		elseif self._itemMaxQuantities[baseItemString] then
			num = min(self._itemMaxQuantities[baseItemString], num or math.huge)
		end
	end
	if num then
		num = ceil(num / row:GetField("stackSize"))
	end
	return num
end

function AuctionFilter._RemoveResultRows(self, db, row, bought)
	self._resultIncludesRow[row:GetUUID()] = nil
	db:DeleteRow(row)
	if not bought then
		return
	end

	local numBought, itemString, baseItemString = row:GetFields("stackSize", "itemString", "baseItemString")
	if self._generalMaxQuantity then
		self._generalMaxQuantity = self._generalMaxQuantity - numBought
		if self._generalMaxQuantity <= 0 then
			-- remove everything
			for uuid in pairs(self._resultIncludesRow) do
				self._resultIncludesRow[uuid] = nil
				db:DeleteRowByUUID(uuid)
			end
		end
	end
	if self._itemMaxQuantities then
		if self._itemMaxQuantities[itemString] then
			self._itemMaxQuantities[itemString] = self._itemMaxQuantities[itemString] - numBought
			if self._itemMaxQuantities[itemString] <= 0 then
				-- remove all of this item
				for uuid in pairs(self._resultIncludesRow) do
					if db:GetRowFieldByUUID(uuid, "itemString") == itemString then
						self._resultIncludesRow[uuid] = nil
						db:DeleteRowByUUID(uuid)
					end
				end
			end
		elseif self._itemMaxQuantities[baseItemString] then
			self._itemMaxQuantities[baseItemString] = self._itemMaxQuantities[baseItemString] - numBought
			if self._itemMaxQuantities[baseItemString] <= 0 then
				-- remove all of this item
				for uuid in pairs(self._resultIncludesRow) do
					if db:GetRowFieldByUUID(uuid, "baseItemString") == baseItemString then
						self._resultIncludesRow[uuid] = nil
						db:DeleteRowByUUID(uuid)
					end
				end
			end
		end
	end
end



-- ============================================================================
-- AuctionScan Class
-- ============================================================================

local DB_SCHEMA = {
	fields = {
		-- raw fields directly from the game
		rawName = "string",
		rawLink = "string",
		texture = "number",
		stackSize = "number",
		minBid = "number",
		minIncrement = "number",
		buyout = "number",
		bid = "number",
		isHighBidder = "boolean",
		seller = "string",
		timeLeft = "number",
		-- calculated fields which we'll use (so want to cache)
		displayedBid = "number",
		itemDisplayedBid = "number",
		requiredBid = "number",
		itemBuyout = "number",
		itemLink = "string",
		itemString = "string",
		baseItemString = "string",
		hash = "string",
		hashNoSeller = "string",
		filterId = "number",
	}
}

local AuctionScan = TSMAPI_FOUR.Class.DefineClass("AuctionScan")

function AuctionScan.__init(self)
	self._scripts = nil
	self._thread = nil
	self._resolveSellers = nil
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
	self._itemFilter = TSMAPI_FOUR.ItemFilter.New()
end

function AuctionScan._Acquire(self, db)
	self._db = db
end

function AuctionScan._Release(self)
	self._thread = nil
	self._resolveSellers = nil
	for _, filter in ipairs(self._filters) do
		filter:_Release()
		tinsert(private.recycledFilters, filter)
	end
	wipe(self._filters)
	if self._findFilter then
		self._findFilter:_Release()
		tinsert(private.recycledFilters, self._findFilter)
		self._findFilter = nil
	end
	self._db = nil
	self._filtersScanned = 0
	self._pagesScanned = 0
	self._numPages = 0
	self._onProgressUpdateHandler = nil
	self._onFilterDoneHandler = nil
	self._customFilterFunc = nil
	wipe(self._findResult)
end

function AuctionScan.Release(self)
	self:_Release()
	tinsert(private.recycledScans, self)
end

function AuctionScan.SetCustomFilterFunc(self, func)
	self._customFilterFunc = func
	return self
end

function AuctionScan.SetResolveSellers(self, resolveSellers)
	self._resolveSellers = resolveSellers
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

function AuctionScan.NewAuctionFilter(self)
	local filter = tremove(private.recycledFilters)
	if not filter then
		filter = AuctionFilter()
	end
	filter:_Acquire()
	tinsert(self._filters, filter)
	return filter
end

function AuctionScan.AddItemListFiltersThreaded(self, itemList, maxItemQuantity)
	assert(TSMAPI_FOUR.Thread.IsThreadContext())
	-- remove duplicates
	local usedItems = TSMAPI_FOUR.Util.AcquireTempTable()
	for i = #itemList, 1, -1 do
		local itemString = itemList[i]
		if usedItems[itemString] then
			tremove(itemList, i)
		end
		usedItems[itemString] = true
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(usedItems)
	private.queryUtilContext.self = self
	private.queryUtilContext.maxItemQuantity = maxItemQuantity
	TSM.Auction.QueryUtil.GenerateThreaded(itemList, private.NewQueryFilterCallback)
end

function AuctionScan.AddStringFilter(self, filterStr)
	if not self._itemFilter:ParseStr(filterStr) then
		return false
	end
	self:NewAuctionFilter()
		:SetName(self._itemFilter:GetStr())
		:SetMinLevel(self._itemFilter:GetMinLevel())
		:SetMaxLevel(self._itemFilter:GetMaxLevel())
		:SetQuality(self._itemFilter:GetQuality())
		:SetClass(self._itemFilter:GetClass())
		:SetSubClass(self._itemFilter:GetSubClass())
		:SetInvType(self._itemFilter:GetInvSlotId())
		:SetUsable(self._itemFilter:GetUsableOnly())
		:SetUnlearned(self._itemFilter:GetUnlearned())
		:SetCanLearn(self._itemFilter:GetCanLearn())
		:SetExact(self._itemFilter:GetExactOnly())
		:SetEvenOnly(self._itemFilter:GetEvenOnly())
		:SetMinItemLevel(self._itemFilter:GetMinItemLevel())
		:SetMaxItemLevel(self._itemFilter:GetMaxItemLevel())
		:SetMinPrice(self._itemFilter:GetMinPrice())
		:SetMaxPrice(self._itemFilter:GetMaxPrice())
		:SetGeneralMaxQuantity(self._itemFilter:GetMaxQuantity())
		:SetItems(self._itemFilter:GetItem())
	return true
end

function AuctionScan.StartScanThreaded(self)
	assert(TSMAPI_FOUR.Thread.IsThreadContext())
	private.ScanQueryThreaded(self)
end

function AuctionScan.FindAuctionThreaded(self, row, noSeller)
	assert(TSMAPI_FOUR.Thread.IsThreadContext())
	wipe(self._findResult)
	return private.FindAuctionThreaded(self, row, noSeller)
end

function AuctionScan.ValidateIndex(self, index, validateRow, noSeller)
	return validateRow:GetField(noSeller and "hashNoSeller" or "hash") == self:_GetAuctionRowHash(index, noSeller)
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

function AuctionScan._IsFiltered(self, row)
	if self._customFilterFunc and self._customFilterFunc(row) then
		return true
	end
	return false
end

function AuctionScan._HasFilter(self)
	return self._customFilterFunc and true or false
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
		seller = TSMAPI_FOUR.Auction.FixSellerName(seller, sellerFull) or "?"
		return strjoin("~", tostringall(rawLink, minBid, minIncrement, buyout, bid, seller, timeLeft, stackSize, isHighBidder))
	end
end

function AuctionScan._CreateAuctionRow(self, index)
	local rawName, texture, stackSize, _, _, _, _, minBid, minIncrement, buyout, bid, isHighBidder, _, seller, sellerFull = GetAuctionItemInfo("list", index)
	local rawLink = GetAuctionItemLink("list", index)
	local timeLeft = GetAuctionItemTimeLeft("list", index)
	local itemLink = TSMAPI_FOUR.Item.GeneralizeLink(rawLink)
	-- pet auctions don't give textures so get from our item database
	texture = texture or TSMAPI_FOUR.Item.GetTexture(itemLink)
	local displayedBid = bid == 0 and minBid or bid
	-- this is to get around a bug in Blizzard's code where the minIncrement value will be inconsistent for auctions where the player is the highest bidder
	minIncrement = isHighBidder and 0 or minIncrement
	seller = TSMAPI_FOUR.Auction.FixSellerName(seller, sellerFull) or "?"
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
		:SetField("itemDisplayedBid", floor(displayedBid / stackSize))
		:SetField("requiredBid", bid == 0 and minBid or (bid + minIncrement))
		:SetField("itemBuyout", (buyout > 0) and floor(buyout / stackSize) or 0)
		:SetField("itemLink", itemLink)
		:SetField("itemString", TSMAPI_FOUR.Item.ToItemString(itemLink))
		:SetField("baseItemString", TSMAPI_FOUR.Item.ToBaseItemString(itemLink))
		:SetField("hash", self:_GetAuctionRowHash(index, false))
		:SetField("hashNoSeller", self:_GetAuctionRowHash(index, true))
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
		self._findFilter = tremove(private.recycledFilters)
		if not self._findFilter then
			self._findFilter = AuctionFilter()
		end
	end
	self._findFilter:_Acquire()
	local itemString = row:GetField("itemString")
	local level = TSMAPI_FOUR.Item.GetMinLevel(itemString)
	self._findFilter
		:SetName(TSMAPI_FOUR.Item.GetName(itemString))
		:SetMinLevel(level)
		:SetMaxLevel(level)
		:SetQuality(TSMAPI_FOUR.Item.GetQuality(itemString))
		:SetClass(TSMAPI_FOUR.Item.GetClassId(itemString))
		:SetSubClass(TSMAPI_FOUR.Item.GetSubClassId(itemString))
		:SetExact(true)
		:SetItems(itemString)
	return self._findFilter
end



-- ============================================================================
-- TSMAPI Functions
-- ============================================================================

function TSMAPI_FOUR.Auction.NewDatabase(name)
	return TSMAPI_FOUR.Database.New(DB_SCHEMA, name)
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
	if private.queryUtilContext.maxItemQuantity then
		for _, itemString in ipairs(auctionFilter:GetItems()) do
			local num = private.queryUtilContext.maxItemQuantity[itemString]
			if num then
				auctionFilter:SetItemMaxQuantity(itemString, num)
			end
		end
	end
end

function private.GetNumPages()
	local _, total = GetNumAuctionItems("list")
	return ceil(total / NUM_AUCTION_ITEMS_PER_PAGE)
end

function private.IsAuctionPageValid(resolveSellers)
	local numAuctions, totalAuctions = GetNumAuctionItems("list")
	if totalAuctions <= NUM_AUCTION_ITEMS_PER_PAGE and numAuctions ~= totalAuctions then
		-- there are cases where we get (0, 1) from the API - no idea why and it'll cause bugs later, so we should count it as invalid
		TSM:LOG_ERR("Unexpected number of auctions (%d, %d)", numAuctions, totalAuctions)
		return false
	end

	for i = 1, numAuctions do
		-- checks to make sure all the data has been sent to the client
		-- if not, the data is bad and we'll wait / try again
		local _, _, stackSize, _, _, _, _, _, _, buyout, _, _, _, seller, sellerFull = GetAuctionItemInfo("list", i)
		seller = TSMAPI_FOUR.Auction.FixSellerName(seller, sellerFull)
		local timeLeft = GetAuctionItemTimeLeft("list", i)
		local link = TSMAPI_FOUR.Item.GeneralizeLink(GetAuctionItemLink("list", i))
		local itemString = TSMAPI_FOUR.Item.ToItemString(link)
		local name = TSMAPI_FOUR.Item.GetName(link)
		local itemLevel = TSMAPI_FOUR.Item.GetItemLevel(link)
		if not itemString or not buyout or not stackSize or not itemLevel or not name or not timeLeft then
			return false
		elseif not seller and resolveSellers and buyout ~= 0 then
			return false
		end
	end

	return true
end

function private.ValidateThreaded(resolveSellers)
	-- wait till we can send the next query to give time for things to settle a bit
	TSMAPI_FOUR.Thread.WaitForFunction(CanSendAuctionQuery)
	-- check the result
	for _ = 0, MAX_SOFT_RETRIES do
		-- wait a small delay and then try and get the result
		TSMAPI_FOUR.Thread.Sleep(SCAN_RESULT_DELAY)
		-- get result
		if private.IsAuctionPageValid(resolveSellers) then
			-- result is valid, so we're done
			return true
		end
	end
	return false
end

function private.DoQueryAndValidateThreaded(filter, resolveSellers)
	for _ = 0, MAX_HARD_RETRIES do
		-- query the AH
		filter:_DoAuctionQueryThreaded()
		-- check the result
		if private.ValidateThreaded(resolveSellers) then
			return true
		end
		if filter:_IsSniper() then
			-- don't retry sniper filters
			break
		end
	end
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
	for _, col in TSMAPI_FOUR.Util.VarargIterator(...) do
		SortAuctionItems("list", col, false)
	end
	SortAuctionApplySort("list")
end

function private.ScanQueryThreaded(auctionScan)
	-- loop through each filter to perform
	auctionScan:_SetFiltersScanned(0)
	local allSuccess = true
	for i, filter in ipairs(auctionScan._filters) do
		-- update the sort for this filter
		if filter:_IsSniper() then
			private.SetAuctionSort()
		else
			private.SetAuctionSort("seller", "quantity", "unitprice")
		end
		-- give some time for the AH to update
		TSMAPI_FOUR.Thread.Yield(true)
		filter:_ResetPage()
		local numNewResults = 0
		local hasMorePages = true
		local filterSuccess = true
		-- loop through each page of this filter and scan it
		while hasMorePages do
			-- query until we get good data or run out of retries
			local success = private.DoQueryAndValidateThreaded(filter, auctionScan._resolveSellers)
			-- don't store results for a failed filter
			if not success then
				TSM:LOG_ERR("Failed to scan filter")
				filterSuccess = false
				break
			end
			-- we've made the query, now store the results
			auctionScan._db:SetQueryUpdatesPaused(true)
			local filterId = private.nextFilterId
			private.nextFilterId = private.nextFilterId + 1
			for j = 1, GetNumAuctionItems("list") do
				local row = auctionScan:_CreateAuctionRow(j)
					:SetField("filterId", filterId)
					:CreateAndClone()
				if filter:_IsFiltered(row) or auctionScan:_IsFiltered(row) then
					auctionScan._db:DeleteRow(row)
				else
					local hashNoSeller = row:GetField("hashNoSeller")
					if filter:_IsSniper() then
						-- remove existing duplicates from previous filters
						local query = auctionScan._db:NewQuery()
							:Equal("hashNoSeller", hashNoSeller)
							:LessThan("filterId", filterId)
						local removedOld = false
						for _, oldRow in query:Iterator() do
							removedOld = true
							auctionScan:DeleteRowFromDB(oldRow, false)
						end
						query:Release()
						if not removedOld then
							local newQuery = auctionScan._db:NewQuery()
								:Equal("hashNoSeller", hashNoSeller)
								:Equal("filterId", filterId)
							if newQuery:Count() == 1 then
								numNewResults = numNewResults + 1
							end
							newQuery:Release()
						end
					else
						numNewResults = numNewResults + 1
					end
					filter:_AddResultRow(row:GetUUID())
				end
				row:Release()
			end
			auctionScan._db:SetQueryUpdatesPaused(false)
			if filter:_IsSniper() then
				hasMorePages = false
			else
				hasMorePages = filter:_NextPage()
			end
			auctionScan:_SetPageProgress(filter:_GetPageProgress())
		end
		if filterSuccess then
			auctionScan:_NotifyFilterDone(filter, numNewResults)
		elseif not filter:_IsSniper() then
			allSuccess = false
		end
		auctionScan:_SetFiltersScanned(i)
	end
	if not allSuccess then
		TSM:Print(L["TSM failed to scan some auctions. Please rerun the scan."])
	end
end

function private.FindAuctionThreaded(auctionScan, row, noSeller)
	-- make sure we're not in the middle of a query where the results are going to change on us
	TSMAPI_FOUR.Thread.WaitForFunction(CanSendAuctionQuery)
	local timeout = 5
	while not private.IsAuctionPageValid(auctionScan._resolveSellers) and timeout > 0 do
		TSMAPI_FOUR.Thread.Sleep(0.2)
		timeout = timeout - 0.2
	end

	-- search the current page for the auction
	if private.FindAuctionOnCurrentPage(auctionScan, row, noSeller) then
		TSM:LOG_INFO("Found on current page")
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
		TSM:LOG_INFO("Predicting auction is on page %d (bid-only)", predictionPage)
	else
		local index = 1
		for _, dbRow in query:Iterator() do
			if dbRow == row then
				-- this row shouldn't show up multiple times in the query
				assert(not predictionPage)
				predictionPage = ceil(index / NUM_AUCTION_ITEMS_PER_PAGE) - 1
				TSM:LOG_INFO("Predicting auction is on page %d (found in DB)", predictionPage)
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
		private.DoQueryAndValidateThreaded(filter, auctionScan._resolveSellers)
		-- search this page for the row
		if private.FindAuctionOnCurrentPage(auctionScan, row, noSeller) then
			TSM:LOG_INFO("Found auction (%d)", filter:_GetPage())
			return auctionScan._findResult
		end

		-- check if we can go to the next page
		local page, numPages = filter:_GetPageProgress()
		local canBeLater = private.FindAuctionCanBeOnLaterPage(row)
		local canBeEarlier = private.FindAuctionCanBeOnLaterPage(row)
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
					TSM:LOG_INFO("Trying next page (%d)", page + 1)
					filter:_SetPage(page + 1)
					break
				else
					direction = "DOWN"
				end
			end
			if direction == "DOWN" then
				if canBeEarlier and page > minPage then
					TSM:LOG_INFO("Trying previous page (%d)", page - 1)
					filter:_SetPage(page - 1)
					break
				else
					if retriesLeft == 0 then
						-- give up
						TSM:LOG_INFO("Giving up (%d,%d,%d,%d)", minPage, maxPage, page, numPages)
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

	seller = TSMAPI_FOUR.Auction.FixSellerName(seller, sellerFull) or "?"
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

	seller = TSMAPI_FOUR.Auction.FixSellerName(seller, sellerFull) or "?"
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
		if auctionScan:ValidateIndex(i, row, noSeller) then
			tinsert(auctionScan._findResult, i)
			found = true
		end
	end
	return found
end
