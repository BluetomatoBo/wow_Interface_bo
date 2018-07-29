-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local GatheringSearch = TSM.Shopping:NewPackage("GatheringSearch")
local private = {
	scanThreadId = nil,
	itemList = {},
	itemQuantity = {},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function GatheringSearch.OnInitialize()
	-- initialize thread
	private.scanThreadId = TSMAPI_FOUR.Thread.New("GATHERING_SEARCH", private.ScanThread)
end

function GatheringSearch.GetScanContext()
	return private.scanThreadId, private.MarketValueFunction
end



-- ============================================================================
-- Scan Thread
-- ============================================================================

function private.ScanThread(auctionScan, items)
	auctionScan:SetCustomFilterFunc(private.ScanFilter)

	-- create the list of items, and add filters for them
	wipe(private.itemList)
	wipe(private.itemQuantity)
	for itemString, quantity in pairs(items) do
		private.itemQuantity[itemString] = quantity
		tinsert(private.itemList, itemString)
	end
	if #private.itemList == 0 then
		return false
	end
	auctionScan:AddItemListFiltersThreaded(private.itemList, private.itemQuantity)

	-- run the scan
	auctionScan:StartScanThreaded()
	return true
end

function private.ScanFilter(row)
	local itemBuyout = row:GetField("itemBuyout")
	if itemBuyout == 0 then
		return true
	end
	return false
end

function private.MarketValueFunction(row)
	-- FIXME: proper market value for gathering
	return TSMAPI_FOUR.CustomPrice.GetValue(TSM.db.global.shoppingOptions.pctSource, row:GetField("itemString"))
end
