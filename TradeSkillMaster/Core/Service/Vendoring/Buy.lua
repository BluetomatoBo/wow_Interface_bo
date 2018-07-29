-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Buy = TSM.Vendoring:NewPackage("Buy")
local private = {
	merchantDB = nil,
}
local MERCHANT_DB_SCHEMA = {
	fields = {
		index = "number",
		itemString = "string",
		price = "number",
		costItemString = "string",
		stackSize = "number",
		numAvailable = "number",
	},
	fieldAttributes = {
		index = { "unique" },
		itemString = { "unique" },
	},
	fieldOrder = {
		"index",
		"itemString",
		"price",
		"costItemString",
		"stackSize",
		"numAvailable",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Buy.OnInitialize()
	private.merchantDB = TSMAPI_FOUR.Database.New(MERCHANT_DB_SCHEMA, "MERCHANT")
	TSMAPI_FOUR.Event.Register("MERCHANT_SHOW", private.MerchantShowEventHandler)
	TSMAPI_FOUR.Event.Register("MERCHANT_CLOSED", private.MerchantClosedEventHandler)
	TSMAPI_FOUR.Event.Register("MERCHANT_UPDATE", private.MerchantUpdateEventHandler)
end

function Buy.CreateMerchantQuery()
	return private.merchantDB:NewQuery()
end

function Buy.NeedsRepair()
	local _, needsRepair = GetRepairAllCost()
	return needsRepair
end

function Buy.CanGuildRepair()
	return Buy.NeedsRepair() and CanGuildBankRepair()
end

function Buy.DoGuildRepair()
	RepairAllItems(true)
end

function Buy.DoRepair()
	RepairAllItems()
end

function Buy.BuyItem(itemString, quantity)
	local index = private.merchantDB:GetUniqueRowField("itemString", itemString, "index")
	assert(index)
	local maxStack = GetMerchantItemMaxStack(index)
	quantity = min(quantity, private.GetMaxCanAfford(index))
	while quantity > 0 do
		BuyMerchantItem(index, min(quantity, maxStack))
		quantity = quantity - maxStack
	end
end

function Buy.CanBuyItem(itemString)
	return private.merchantDB:GetUniqueRowField("itemString", itemString, "index") and true or false
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.MerchantShowEventHandler()
	TSMAPI_FOUR.Delay.AfterFrame("UPDATE_MERCHANT_DB", 1, private.UpdateMerchantDB)
end

function private.MerchantClosedEventHandler()
	TSMAPI_FOUR.Delay.Cancel("UPDATE_MERCHANT_DB")
	TSMAPI_FOUR.Delay.Cancel("RESCAN_MERCHANT_DB")
	private.merchantDB:Truncate()
end

function private.MerchantUpdateEventHandler()
	TSMAPI_FOUR.Delay.AfterFrame("UPDATE_MERCHANT_DB", 1, private.UpdateMerchantDB)
end

function private.UpdateMerchantDB()
	local needsRetry = false
	local usedItem = TSMAPI_FOUR.Util.AcquireTempTable()
	private.merchantDB:SetQueryUpdatesPaused(true)
	private.merchantDB:Truncate()
	private.merchantDB:BulkInsertStart()
	for i = 1, GetMerchantNumItems() do
		local itemLink = GetMerchantItemLink(i)
		local itemString = TSMAPI_FOUR.Item.ToItemString(itemLink)
		if itemString and not usedItem[itemString] then
			usedItem[itemString] = true
			TSM.ItemInfo.StoreItemInfoByLink(itemLink)
			local _, _, price, stackSize, numAvailable, _, _, extendedCost = GetMerchantItemInfo(i)
			local numAltCurrencies = GetMerchantItemCostInfo(i)
			-- bug with big keech vendor returning extendedCost = true for gold only items
			if numAltCurrencies == 0 then
				extendedCost = false
			end
			local costItemsStr = ""
			if extendedCost then
				assert(numAltCurrencies > 0)
				local costItems = TSMAPI_FOUR.Util.AcquireTempTable()
				for j = 1, numAltCurrencies do
					local _, costNum, costItemLink = GetMerchantItemCostItem(i, j)
					local costItemString = TSMAPI_FOUR.Item.ToItemString(costItemLink)
					local texture = nil
					if not costItemLink then
						needsRetry = true
					elseif costItemString then
						texture = TSMAPI_FOUR.Item.GetTexture(costItemString)
					elseif strmatch(costItemLink, "currency:") then
						texture = select(3, GetCurrencyInfo(costItemLink))
					else
						error(format("Unknown item cost (%d, %d, %s)", i, costNum, tostring(costItemLink)))
					end
					tinsert(costItems, costNum.." |T"..(texture or "")..":12|t")
				end
				costItemsStr = table.concat(costItems, " ")
				TSMAPI_FOUR.Util.ReleaseTempTable(costItems)
			end
			private.merchantDB:BulkInsertNewRow(i, itemString, price, costItemsStr, stackSize, numAvailable)
		end
	end
	private.merchantDB:BulkInsertEnd()
	private.merchantDB:SetQueryUpdatesPaused(false)
	TSMAPI_FOUR.Util.ReleaseTempTable(usedItem)

	if needsRetry then
		TSM:LOG_ERR("Failed to scan merchant")
		TSMAPI_FOUR.Delay.AfterTime("RESCAN_MERCHANT_DB", 0.2, private.UpdateMerchantDB)
	else
		TSMAPI_FOUR.Delay.Cancel("RESCAN_MERCHANT_DB")
	end
end

function private.GetMaxCanAfford(index)
	local maxCanAfford = math.huge
	local _, _, price, _, _, _, _, extendedCost = GetMerchantItemInfo(index)
	local numAltCurrencies = GetMerchantItemCostInfo(index)
	-- bug with big keech vendor returning extendedCost = true for gold only items
	if numAltCurrencies == 0 then
		extendedCost = false
	end

	-- check the price
	if price > 0 then
		maxCanAfford = min(floor(GetMoney() / price), maxCanAfford)
	end

	-- check the extended cost
	if extendedCost then
		assert(numAltCurrencies > 0)
		for i = 1, numAltCurrencies do
			local _, costNum, costItemLink, currencyName = GetMerchantItemCostItem(index, i)
			local costItemString = TSMAPI_FOUR.Item.ToItemString(costItemLink)
			local costNumHave = nil
			if costItemString then
				costNumHave = TSMAPI_FOUR.Inventory.GetBagQuantity(costItemString) + TSMAPI_FOUR.Inventory.GetBankQuantity(costItemString) + TSMAPI_FOUR.Inventory.GetReagentBankQuantity(costItemString)
			elseif currencyName then
				for j = 1, GetCurrencyListSize() do
					local name, isHeader, _, _, _, count = GetCurrencyInfo(j)
					if not isHeader and name == currencyName then
						costNumHave = count
						break
					end
				end
			end
			if costNumHave then
				maxCanAfford = min(floor(costNumHave / costNum), maxCanAfford)
			end
		end
	end

	return maxCanAfford
end
