-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--          http://www.curse.com/addons/wow/tradeskillmaster_warehousing          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local AuctionTracking = TSM.Inventory:NewPackage("AuctionTracking")
local private = {
	db = nil,
	updateQuery = nil,
	isAHOpen = false,
	callbacks = {},
	indexUpdates = {
		list = {},
		pending = {},
	},
	lastScanNum = nil,
	ignoreUpdateEvent = nil,
}
local DB_SCHEMA = {
	fields = {
		index = "number",
		itemString = "string",
		baseItemString = "string",
		autoBaseItemString = "string",
		itemLink = "string",
		itemTexture = "number",
		itemName = "string",
		itemQuality = "number",
		duration = "number",
		highBidder = "string",
		currentBid = "number",
		buyout = "number",
		stackSize = "number",
		saleStatus = "number",
	},
	fieldAttributes = {
		index = { "unique", "index" },
		autoBaseItemString = { "index" },
		saleStatus = { "index" },
	},
	fieldOrder = {
		"index",
		"itemString",
		"baseItemString",
		"autoBaseItemString",
		"itemLink",
		"itemTexture",
		"itemName",
		"itemQuality",
		"duration",
		"highBidder",
		"currentBid",
		"buyout",
		"stackSize",
		"saleStatus",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function AuctionTracking.OnInitialize()
	TSMAPI_FOUR.Event.Register("AUCTION_HOUSE_SHOW", private.AuctionHouseShowHandler)
	TSMAPI_FOUR.Event.Register("AUCTION_HOUSE_CLOSED", private.AuctionHouseClosedHandler)
	TSMAPI_FOUR.Event.Register("AUCTION_OWNED_LIST_UPDATE", private.AuctionOwnedListUpdateHandler)
	private.db = TSMAPI_FOUR.Database.New(DB_SCHEMA, "AUCTION_TRACKING")
	private.updateQuery = private.db:NewQuery()
		:SetUpdateCallback(private.OnCallbackQueryUpdated)
end

function AuctionTracking.RegisterCallback(callback)
	tinsert(private.callbacks, callback)
end

function AuctionTracking.DatabaseFieldIterator()
	return private.db:FieldIterator()
end

function AuctionTracking.CreateQuery()
	return private.db:NewQuery()
end



-- ============================================================================
-- Event Handlers
-- ============================================================================

function private.AuctionHouseShowHandler()
	private.isAHOpen = true
	GetOwnerAuctionItems()
	-- We don't always get AUCTION_OWNED_LIST_UPDATE events, so do our own scanning if needed
	TSMAPI_FOUR.Delay.AfterTime("auctionBackgroundScan", 1, private.DoBackgroundScan, 1)
end

function private.AuctionHouseClosedHandler()
	private.isAHOpen = false
	TSMAPI_FOUR.Delay.Cancel("auctionBackgroundScan")
end

function private.DoBackgroundScan()
	if GetNumAuctionItems("owner") ~= private.lastScanNum then
		private.AuctionOwnedListUpdateHandler()
	end
end

function private.AuctionOwnedListUpdateHandler()
	if private.ignoreUpdateEvent then
		return
	end
	wipe(private.indexUpdates.pending)
	wipe(private.indexUpdates.list)
	for i = 1, GetNumAuctionItems("owner") do
		if not private.indexUpdates.pending[i] then
			private.indexUpdates.pending[i] = true
			tinsert(private.indexUpdates.list, i)
		end
	end
	TSMAPI_FOUR.Delay.AfterFrame("AUCTION_OWNED_LIST_SCAN", 2, private.AuctionOwnedListUpdateDelayed)
end

-- this is not a WoW event, but we fake it based on a delay from private.BankSlotChangedHandler
function private.AuctionOwnedListUpdateDelayed()
	if not private.isAHOpen then
		return
	elseif AuctionFrame and AuctionFrame:IsVisible() and AuctionFrame.selectedTab == 3 then
		-- default UI auctions tab is visible, so scan later
		TSMAPI_FOUR.Delay.AfterFrame("AUCTION_OWNED_LIST_SCAN", 2, private.AuctionOwnedListUpdateDelayed)
		return
	end
	-- check if we need to change the sort
	local needsSort = false
	local numColumns = #AuctionSort.owner_duration
	for i, info in ipairs(AuctionSort.owner_duration) do
		local col, reversed = GetAuctionSort("owner", numColumns - i + 1)
		-- we want to do the opposite order
		reversed = not reversed
		if col ~= info.column or info.reverse ~= reversed then
			needsSort = true
			break
		end
	end
	if needsSort then
		TSM:LOG_INFO("Sorting owner auctions")
		-- ignore events while changing the sort
		private.ignoreUpdateEvent = true
		AuctionFrame_SetSort("owner", "duration", true)
		SortAuctionApplySort("owner")
		private.ignoreUpdateEvent = nil
	end

	-- scan the auctions
	TSM.Inventory.WipeAuctionQuantity()

	private.db:SetQueryUpdatesPaused(true)
	private.db:Truncate()
	private.db:BulkInsertStart()
	for i = #private.indexUpdates.list, 1, -1 do
		local index = private.indexUpdates.list[i]
		local name, texture, stackSize, quality, _, _, _, minBid, _, buyout, bid, highBidder, _, _, _, saleStatus = GetAuctionItemInfo("owner", index)
		local link = name and name ~= "" and GetAuctionItemLink("owner", index)
		if link then
			assert(saleStatus == 0 or saleStatus == 1)
			local duration = GetAuctionItemTimeLeft("owner", index)
			duration = saleStatus == 0 and duration or (time() + duration)
			highBidder = highBidder or ""
			texture = texture or TSMAPI_FOUR.Item.GetTexture(link)
			local itemString = TSMAPI_FOUR.Item.ToItemString(link)
			local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
			local autoBaseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString, true)
			local currentBid = highBidder ~= "" and bid or minBid
			if saleStatus == 0 then
				TSM.Inventory.ChangeAuctionQuantity(baseItemString, stackSize)
			end
			private.indexUpdates.pending[index] = nil
			tremove(private.indexUpdates.list, i)
			private.db:BulkInsertNewRow(index, itemString, baseItemString, autoBaseItemString, link, texture, name, quality, duration, highBidder, currentBid, buyout, stackSize, saleStatus)
		end
	end
	private.db:BulkInsertEnd()
	private.db:SetQueryUpdatesPaused(false)

	TSM:LOG_INFO("Scanned auctions (left=%d)", #private.indexUpdates.list)
	if #private.indexUpdates.list > 0 then
		-- some failed to scan so try again
		TSMAPI_FOUR.Delay.AfterFrame("AUCTION_OWNED_LIST_SCAN", 2, private.AuctionOwnedListUpdateDelayed)
	else
		private.lastScanNum = GetNumAuctionItems("owner")
	end
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.OnCallbackQueryUpdated()
	for _, callback in ipairs(private.callbacks) do
		callback()
	end
end
