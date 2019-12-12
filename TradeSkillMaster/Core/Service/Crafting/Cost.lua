-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Cost = TSM.Crafting:NewPackage("Cost")
local TempTable = TSM.Include("Util.TempTable")
local Math = TSM.Include("Util.Math")
local ItemString = TSM.Include("Util.ItemString")
local CustomPrice = TSM.Include("Service.CustomPrice")
local private = {
	matsVisited = {},
	isItemCraftableCache = {},
	matCostCache = {},
	matsTemp = {},
	matsTempInUse = false,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Cost.GetMatCost(itemString)
	itemString = ItemString.GetBase(itemString)
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
		private.matCostCache[itemString] = CustomPrice.GetValue(priceStr, itemString)
	end
	private.matsVisited[itemString] = nil
	return private.matCostCache[itemString]
end

function Cost.GetCraftingCostBySpellId(spellId)
	local cost = 0
	local hasMats = false
	local mats = nil
	if private.matsTempInUse then
		mats = TempTable.Acquire()
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
		TempTable.Release(mats)
	end
	if not cost or not hasMats then
		return
	end
	cost = Math.Round(cost / TSM.Crafting.GetNumResult(spellId))
	return cost > 0 and cost or nil
end

function Cost.GetCraftedItemValue(itemString)
	local hasCraftPriceMethod, craftPrice = TSM.Operations.Crafting.GetCraftedItemValue(itemString)
	if hasCraftPriceMethod then
		return craftPrice
	end
	return CustomPrice.GetValue(TSM.db.global.craftingOptions.defaultCraftPriceMethod, itemString)
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
	return itemString and CustomPrice.GetItemPrice(itemString, "DBRegionSaleRate") or nil
end

function Cost.GetLowestCostByItem(itemString)
	itemString = ItemString.GetBase(itemString)
	if private.isItemCraftableCache.updateTime ~= GetTime() then
		-- update the cache
		wipe(private.isItemCraftableCache)
		private.isItemCraftableCache.updateTime = GetTime()
		for _, spellId in TSM.Crafting.SpellIterator() do
			local spellItemString = ItemString.GetBase(TSM.Crafting.GetItemString(spellId))
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
	for _, spellId, hasCD in TSM.Crafting.GetSpellIdsByItem(itemString, TSM.db.global.craftingOptions.ignoreCDCraftCost) do
		numSpells = numSpells + 1
		local cost = Cost.GetCraftingCostBySpellId(spellId)
		if cost and (not lowestCost or cost < lowestCost) then
			-- exclude spells with cooldown if option to ignore is enabled and there is more than one way to craft
			if hasCD then
				cdCost = cost
				cdSpellId = spellId
			else
				lowestCost = cost
				lowestSpellId = spellId
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
