-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Cost = TSM.Crafting:NewPackage("Cost")
local private = {
	craftDB = nil,
	matDB = nil,
	matsVisited = {},
	isItemCraftableCache = {},
	matCostCache = {},
	matsTemp = {},
	matsTempInUse = false,
}
local CRAFT_COST_DB_SCHEMA = {
	fields = {
		spellId = "number",
		craftingCost = "number",
		itemValue = "number",
		profit = "number",
		saleRate = "number",
	},
	fieldAttributes = {
		spellId = { "unique" },
	},
	fieldOrder = {
		"spellId",
		"craftingCost",
		"itemValue",
		"profit",
		"saleRate",
	},
}
local MAT_COST_DB_SCHEMA = {
	fields = {
		itemString = "string",
		matCost = "number",
	},
	fieldAttributes = {
		itemString = { "unique" },
	},
	fieldOrder = {
		"itemString",
		"matCost",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Cost.OnInitialize()
	private.craftDB = TSMAPI_FOUR.Database.New(CRAFT_COST_DB_SCHEMA)
	private.matDB = TSMAPI_FOUR.Database.New(MAT_COST_DB_SCHEMA)
end

function Cost.UpdateDB()
	private.craftDB:TruncateAndBulkInsertStart()
	for _, spellId in TSM.Crafting.SpellIterator() do
		local itemString = TSM.Crafting.GetItemString(spellId)
		local craftingCost, itemValue, profit = Cost.GetCostsBySpellId(spellId)
		local saleRate = TSM.AuctionDB.GetRegionItemData(itemString, "regionSalePercent")
		craftingCost = craftingCost or math.huge * 0
		itemValue = itemValue or math.huge * 0
		profit = profit or math.huge * 0
		saleRate = saleRate and (saleRate / 100) or math.huge * 0
		private.craftDB:BulkInsertNewRow(spellId, craftingCost, itemValue, profit, saleRate)
	end
	private.craftDB:BulkInsertEnd()

	private.matDB:TruncateAndBulkInsertStart()
	local query = TSM.Crafting.CreateRawMatItemQuery()
		:Select("itemString")
	for _, itemString in query:Iterator() do
		private.matDB:BulkInsertNewRow(itemString, Cost.GetMatCost(itemString) or math.huge * 0)
	end
	query:Release()
	private.matDB:BulkInsertEnd()
end

function Cost.GetCraftDBForJoin()
	return private.craftDB
end

function Cost.GetMatDBForJoin()
	return private.matDB
end

function Cost.GetMatCost(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	if not TSM.db.factionrealm.internalData.mats[itemString] then
		return
	end
	if private.matsVisited[itemString] then
		-- there's a loop in the mat cost, so bail
		return
	end
	private.matsVisited[itemString] = true
	if private.matCostCache.lastUpdate ~= GetTime() then
		wipe(private.matCostCache)
		private.matCostCache.lastUpdate = GetTime()
	end
	if not private.matCostCache[itemString] then
		local priceStr = TSM.db.factionrealm.internalData.mats[itemString].customValue or TSM.db.global.craftingOptions.defaultMatCostMethod
		private.matCostCache[itemString] = TSMAPI_FOUR.CustomPrice.GetValue(priceStr, itemString)
	end
	private.matsVisited[itemString] = nil
	return private.matCostCache[itemString]
end

function Cost.GetCraftingCostBySpellId(spellId)
	local cost = 0
	local hasMats = false
	local mats = nil
	if private.matsTempInUse then
		mats = TSMAPI_FOUR.Util.AcquireTempTable()
	else
		mats = private.matsTemp
		private.matsTempInUse = true
		wipe(mats)
	end
	TSM.Crafting.GetMatsAsTable(spellId, mats)
	for itemString, quantity in pairs(mats) do
		hasMats = true
		local matCost = Cost.GetMatCost(itemString)
		if not matCost then
			cost = nil
		elseif cost then
			cost = cost + matCost * quantity
		end
	end
	if mats == private.matsTemp then
		private.matsTempInUse = false
	else
		TSMAPI_FOUR.Util.ReleaseTempTable(mats)
	end
	if not cost or not hasMats then
		return
	end
	cost = TSMAPI_FOUR.Util.Round(cost / TSM.Crafting.GetNumResult(spellId))
	return cost > 0 and cost or nil
end

function Cost.GetCraftedItemValue(itemString)
	-- TODO: replace with new operation APIs
	local operationName, operationSettings = TSMAPI.Operations:GetFirstByItem(itemString, "Crafting")
	if operationSettings then
		TSMAPI.Operations:Update("Crafting", operationName)
	end
	local priceStr = operationSettings and operationSettings.craftPriceMethod or TSM.db.global.craftingOptions.defaultCraftPriceMethod
	return TSMAPI_FOUR.CustomPrice.GetValue(priceStr, itemString)
end

function Cost.GetProfitBySpellId(spellId)
	local _, _, profit = Cost.GetCostsBySpellId(spellId)
	return profit
end

function Cost.GetCostsBySpellId(spellId)
	local craftingCost = Cost.GetCraftingCostBySpellId(spellId)
	local itemString = TSM.Crafting.GetItemString(spellId)
	local craftedItemValue = itemString and Cost.GetCraftedItemValue(itemString) or nil
	return craftingCost, craftedItemValue, craftingCost and craftedItemValue and (craftedItemValue - craftingCost) or nil
end

function Cost.GetSaleRateBySpellId(spellId)
	local itemString = TSM.Crafting.GetItemString(spellId)
	return itemString and TSMAPI_FOUR.CustomPrice.GetItemPrice(itemString, "DBRegionSaleRate") or nil
end

function Cost.GetLowestCostByItem(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	if private.isItemCraftableCache.updateTime ~= GetTime() then
		-- update the cache
		wipe(private.isItemCraftableCache)
		private.isItemCraftableCache.updateTime = GetTime()
		for _, spellId in TSM.Crafting.SpellIterator() do
			local spellItemString = TSMAPI_FOUR.Item.ToBaseItemString(TSM.Crafting.GetItemString(spellId))
			if not private.isItemCraftableCache[spellItemString] then
				private.isItemCraftableCache[spellItemString] = spellId
			else
				private.isItemCraftableCache[spellItemString] = true
			end
		end
	end
	if not private.isItemCraftableCache[itemString] then
		return
	elseif private.isItemCraftableCache[itemString] ~= true then
		-- just one spell to craft this item which is stored in the cache
		local spellId = private.isItemCraftableCache[itemString]
		local cost = Cost.GetCraftingCostBySpellId(spellId)
		if cost then
			return cost, spellId
		else
			return
		end
	end

	local lowestCost, lowestSpellId = nil, nil
	local cdCost, cdSpellId = nil, nil
	local numSpells = 0
	for _, spellId, hasCD in TSM.Crafting.GetSpellIdsByItem(itemString) do
		numSpells = numSpells + 1
		local cost = Cost.GetCraftingCostBySpellId(spellId)
		if cost and (not lowestCost or cost < lowestCost) then
			-- exclude spells with cooldown if option to ignore is enabled and there is more than one way to craft
			if not hasCD or not TSM.db.global.craftingOptions.ignoreCDCraftCost then
				lowestCost = cost
				lowestSpellId = spellId
			else
				cdCost = cost
				cdSpellId = spellId
			end
		end
	end
	if numSpells == 1 and not lowestCost and cdCost then
		-- only way to craft it is with a CD craft, so use that
		lowestCost = cdCost
		lowestSpellId = cdSpellId
	end
	return lowestCost, lowestSpellId
end
