-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local ProfessionScanner = TSM.Crafting:NewPackage("ProfessionScanner")
local private = {
	db = nil,
	hasScanned = false,
	callbacks = {},
	disabled = false,
	ignoreUpdatesUntil = 0,
}
-- don't want to scan a bunch of times when the profession first loads so add a 10 frame debounce to update events
local SCAN_DEBOUNCE_FRAMES = 10



-- ============================================================================
-- Module Functions
-- ============================================================================

function ProfessionScanner.OnInitialize()
	private.db = TSMAPI_FOUR.Database.NewSchema("CRAFTING_RECIPES")
		:AddUniqueNumberField("index")
		:AddUniqueNumberField("spellId")
		:AddStringField("name")
		:AddNumberField("categoryId")
		:AddStringField("difficulty")
		:AddNumberField("rank")
		:AddNumberField("numSkillUps")
		:Commit()
	TSM.Crafting.ProfessionState.RegisterUpdateCallback(private.ProfessionStateUpdate)
	TSMAPI_FOUR.Event.Register("TRADE_SKILL_LIST_UPDATE", private.OnTradeSkillUpdateEvent)
end

function ProfessionScanner.SetDisabled(disabled)
	private.disabled = disabled
	private.ScanProfession()
end

function ProfessionScanner.HasScanned()
	return private.hasScanned
end

function ProfessionScanner.HasSkills()
	return private.hasScanned and private.db:GetNumRows() > 0
end

function ProfessionScanner.RegisterHasScannedCallback(callback)
	tinsert(private.callbacks, callback)
end

function ProfessionScanner.IgnoreNextProfessionUpdates()
	private.ignoreUpdatesUntil = GetTime() + 1
end

function ProfessionScanner.CreateQuery()
	return private.db:NewQuery()
end

function ProfessionScanner.GetNameBySpellId(spellId)
	assert(private.hasScanned)
	return private.db:GetUniqueRowField("spellId", spellId, "name")
end

function ProfessionScanner.GetRankBySpellId(spellId)
	assert(private.hasScanned)
	return private.db:GetUniqueRowField("spellId", spellId, "rank")
end

function ProfessionScanner.GetNumSkillupsBySpellId(spellId)
	assert(private.hasScanned)
	return private.db:GetUniqueRowField("spellId", spellId, "numSkillUps")
end

function ProfessionScanner.GetDifficultyBySpellId(spellId)
	assert(private.hasScanned)
	return private.db:GetUniqueRowField("spellId", spellId, "difficulty")
end

function ProfessionScanner.GetFirstSpellId()
	if not private.hasScanned then
		return
	end
	return private.db:NewQuery()
		:Select("spellId")
		:OrderBy("index", true)
		:GetFirstResultAndRelease()
end

function ProfessionScanner.HasSpellId(spellId)
	return private.hasScanned and private.db:GetUniqueRowField("spellId", spellId, "index") and true or false
end



-- ============================================================================
-- Event Handlers
-- ============================================================================

function private.ProfessionStateUpdate()
	private.hasScanned = false
	for _, callback in ipairs(private.callbacks) do
		callback()
	end
	if TSM.Crafting.ProfessionState.GetCurrentProfession() then
		private.db:Truncate()
		private.OnTradeSkillUpdateEvent()
	else
		TSMAPI_FOUR.Delay.Cancel("PROFESSION_SCAN_DELAY")
	end
end

function private.OnTradeSkillUpdateEvent()
	TSMAPI_FOUR.Delay.Cancel("PROFESSION_SCAN_DELAY")
	TSMAPI_FOUR.Delay.AfterFrame("PROFESSION_SCAN_DELAY", SCAN_DEBOUNCE_FRAMES, private.ScanProfession)
end



-- ============================================================================
-- Profession Scan Thread
-- ============================================================================

function private.ScanProfession()
	if InCombatLockdown() then
		-- we are in combat, so try again in a bit
		TSMAPI_FOUR.Delay.AfterFrame("PROFESSION_SCAN_DELAY", SCAN_DEBOUNCE_FRAMES, private.ScanProfession)
		return
	elseif private.disabled then
		return
	elseif GetTime() < private.ignoreUpdatesUntil then
		return
	end

	local professionName = TSM.Crafting.ProfessionState.GetCurrentProfession()
	if not professionName then
		-- profession hasn't fully opened yet
		TSMAPI_FOUR.Delay.AfterFrame("PROFESSION_SCAN_DELAY", SCAN_DEBOUNCE_FRAMES, private.ScanProfession)
		return
	end
	assert(professionName and C_TradeSkillUI.IsTradeSkillReady() and not C_TradeSkillUI.IsDataSourceChanging())

	local hadFilter = false
	if C_TradeSkillUI.GetOnlyShowUnlearnedRecipes() then
		C_TradeSkillUI.SetOnlyShowLearnedRecipes(true)
		C_TradeSkillUI.SetOnlyShowUnlearnedRecipes(false)
		hadFilter = true
	end
	if C_TradeSkillUI.GetOnlyShowMakeableRecipes() then
		C_TradeSkillUI.SetOnlyShowMakeableRecipes(false)
		hadFilter = true
	end
	if C_TradeSkillUI.GetOnlyShowSkillUpRecipes() then
		C_TradeSkillUI.SetOnlyShowSkillUpRecipes(false)
		hadFilter = true
	end
	if C_TradeSkillUI.AnyRecipeCategoriesFiltered() then
		C_TradeSkillUI.ClearRecipeCategoryFilter()
		hadFilter = true
	end
	if C_TradeSkillUI.AreAnyInventorySlotsFiltered() then
		C_TradeSkillUI.ClearInventorySlotFilter()
		hadFilter = true
	end
	for i = 1, C_PetJournal.GetNumPetSources() do
		if C_TradeSkillUI.IsAnyRecipeFromSource(i) and C_TradeSkillUI.IsRecipeSourceTypeFiltered(i) then
			C_TradeSkillUI.ClearRecipeSourceTypeFilter()
			hadFilter = true
			break
		end
	end
	if C_TradeSkillUI.GetRecipeItemNameFilter() ~= "" then
		C_TradeSkillUI.SetRecipeItemNameFilter(nil)
		hadFilter = true
	end
	local minItemLevel, maxItemLevel = C_TradeSkillUI.GetRecipeItemLevelFilter()
	if minItemLevel ~= 0 or maxItemLevel ~= 0 then
		C_TradeSkillUI.SetRecipeItemLevelFilter(0, 0)
		hadFilter = true
	end

	if hadFilter then
		-- an update event will be triggered
		return
	end

	local prevRecipeIds = TSMAPI_FOUR.Util.AcquireTempTable()
	local nextRecipeIds = TSMAPI_FOUR.Util.AcquireTempTable()
	local recipeLearned = TSMAPI_FOUR.Util.AcquireTempTable()
	local recipes = TSMAPI_FOUR.Util.AcquireTempTable()
	assert(C_TradeSkillUI.GetFilteredRecipeIDs(recipes) == recipes)
	local spellIdIndex = TSMAPI_FOUR.Util.AcquireTempTable()
	for index, spellId in ipairs(recipes) do
		-- There's a Blizzard bug where First Aid duplicates spellIds, so check that we haven't seen this before
		if not spellIdIndex[spellId] then
			spellIdIndex[spellId] = index
			local info = TSMAPI_FOUR.Util.AcquireTempTable()
			assert(C_TradeSkillUI.GetRecipeInfo(spellId, info) == info)
			if info.previousRecipeID then
				prevRecipeIds[spellId] = info.previousRecipeID
				nextRecipeIds[info.previousRecipeID] = spellId
			end
			recipeLearned[spellId] = info.learned
			TSMAPI_FOUR.Util.ReleaseTempTable(info)
		end
	end
	private.db:TruncateAndBulkInsertStart()
	for index, spellId in ipairs(recipes) do
		local hasHigherRank = nextRecipeIds[spellId] and recipeLearned[nextRecipeIds[spellId]]
		-- TODO: show unlearned recipes in the TSM UI
		-- There's a Blizzard bug where First Aid duplicates spellIds, so check that this is the right index
		if spellIdIndex[spellId] == index and recipeLearned[spellId] and not hasHigherRank then
			local info = TSMAPI_FOUR.Util.AcquireTempTable()
			assert(C_TradeSkillUI.GetRecipeInfo(spellId, info) == info)
			local rank = -1
			if prevRecipeIds[spellId] or nextRecipeIds[spellId] then
				rank = 1
				local tempSpellId = spellId
				while prevRecipeIds[tempSpellId] do
					rank = rank + 1
					tempSpellId = prevRecipeIds[tempSpellId]
				end
			end
			local numSkillUps = info.difficulty == "optimal" and info.numSkillUps or 1
			private.db:BulkInsertNewRow(index, spellId, info.name, info.categoryID, info.difficulty, rank, numSkillUps)
			TSMAPI_FOUR.Util.ReleaseTempTable(info)
		end
	end
	private.db:BulkInsertEnd()
	TSMAPI_FOUR.Util.ReleaseTempTable(spellIdIndex)
	TSMAPI_FOUR.Util.ReleaseTempTable(recipes)
	TSMAPI_FOUR.Util.ReleaseTempTable(prevRecipeIds)
	TSMAPI_FOUR.Util.ReleaseTempTable(nextRecipeIds)
	TSMAPI_FOUR.Util.ReleaseTempTable(recipeLearned)

	if C_TradeSkillUI.IsNPCCrafting() or C_TradeSkillUI.IsTradeSkillLinked() or C_TradeSkillUI.IsTradeSkillGuild() then
		-- we don't want to store this profession in our DB, so we're done
		if not private.hasScanned then
			private.hasScanned = true
			for _, callback in ipairs(private.callbacks) do
				callback()
			end
		end
		return
	end

	if not TSM.db.sync.internalData.playerProfessions[professionName] then
		-- we are in combat or the player's professions haven't been scanned yet by PlayerProfessions.lua, so try again in a bit
		TSMAPI_FOUR.Delay.AfterFrame("PROFESSION_SCAN_DELAY", SCAN_DEBOUNCE_FRAMES, private.ScanProfession)
		return
	end

	-- update the link for this profession
	TSM.db.sync.internalData.playerProfessions[professionName].link = C_TradeSkillUI.GetTradeSkillListLink()

	-- scan all the recipes
	TSM.Crafting.SetSpellDBQueryUpdatesPaused(true)
	local query = private.db:NewQuery()
		:Select("spellId")
	local numFailed = 0
	for _, spellId in query:Iterator() do
		if not private.ScanRecipe(professionName, spellId) then
			numFailed = numFailed + 1
		end
	end
	query:Release()
	TSM.Crafting.SetSpellDBQueryUpdatesPaused(false)

	TSM:LOG_INFO("Scanned %s (failed to scan %d)", professionName, numFailed)
	if numFailed > 0 then
		-- didn't completely scan, so we'll try again
		TSMAPI_FOUR.Delay.AfterFrame("PROFESSION_SCAN_DELAY", SCAN_DEBOUNCE_FRAMES, private.ScanProfession)
	end
	if not private.hasScanned then
		private.hasScanned = true
		for _, callback in ipairs(private.callbacks) do
			callback()
		end
	end
end

function private.ScanRecipe(professionName, spellId)
	-- get the links
	local itemLink = C_TradeSkillUI.GetRecipeItemLink(spellId)
	local spellLink = C_TradeSkillUI.GetRecipeLink(spellId)
	assert(itemLink and spellLink and strfind(spellLink, "enchant:"), "Invalid craft: "..tostring(spellId))

	-- get the itemString and craft name
	local itemString, craftName = nil, nil
	if strfind(itemLink, "enchant:") then
		-- result of craft is not an item
		itemString = TSM.CONST.ENCHANT_ITEM_STRINGS[spellId] or TSM.CONST.MASS_MILLING_RECIPES[spellId]
		if not itemString then
			-- we don't care about this craft
			return true
		end
		craftName = GetSpellInfo(spellId)
	elseif strfind(itemLink, "item:") then
		-- result of craft is item
		itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemLink)
		craftName = TSMAPI_FOUR.Item.GetName(itemLink)
	else
		error("Invalid craft: "..tostring(spellId))
	end
	if not itemString or not craftName then
		return false
	end

	-- get the result number
	local numResult = nil
	local isEnchant = professionName == GetSpellInfo(7411) and strfind(itemLink, "enchant:")
	if isEnchant then
		numResult = 1
	else
		local lNum, hNum = C_TradeSkillUI.GetRecipeNumItemsProduced(spellId)
		-- workaround for incorrect values returned for Temporal Crystal
		if spellId == 169092 and itemString == "i:113588" then
			lNum, hNum = 1, 1
		end
		-- workaround for incorrect values returned for new mass milling recipes
		if TSM.CONST.MASS_MILLING_RECIPES[spellId] then
			if spellId == 210116 then -- Yseralline
				lNum, hNum = 4, 4 -- always four
			elseif spellId == 209664 then -- Felwort
				lNum, hNum = 42, 42 -- amount is variable but the values are conservative
			elseif spellId == 247861 then -- Astral Glory
				lNum, hNum = 4, 4 -- amount is variable but the values are conservative
			else
				lNum, hNum = 8, 8.8
			end
		end
		numResult = floor(((lNum or 1) + (hNum or 1)) / 2)
	end

	-- store general info about this recipe
	local _, cooldown = C_TradeSkillUI.GetRecipeCooldown(spellId)
	local hasCD = cooldown and true or false
	TSM.Crafting.CreateOrUpdate(spellId, itemString, professionName, craftName, numResult, UnitName("player"), hasCD)

	-- get the mat quantities and add mats to our DB
	local matQuantities = TSMAPI_FOUR.Util.AcquireTempTable()
	local haveInvalidMats = false
	for i = 1, C_TradeSkillUI.GetRecipeNumReagents(spellId) do
		local matItemString = TSMAPI_FOUR.Item.ToBaseItemString(C_TradeSkillUI.GetRecipeReagentItemLink(spellId, i))
		if not matItemString then
			haveInvalidMats = true
			break
		end
		local name, _, quantity = C_TradeSkillUI.GetRecipeReagentInfo(spellId, i)
		if not name or not quantity then
			haveInvalidMats = true
			break
		end
		TSM.ItemInfo.StoreItemName(matItemString, name)
		TSM.db.factionrealm.internalData.mats[matItemString] = TSM.db.factionrealm.internalData.mats[matItemString] or {}
		matQuantities[matItemString] = quantity
	end
	-- if this is an enchant, add a vellum to the list of mats
	if isEnchant then
		local matItemString = TSM.CONST.VELLUM_ITEM_STRING
		TSM.db.factionrealm.internalData.mats[matItemString] = TSM.db.factionrealm.internalData.mats[matItemString] or {}
		matQuantities[matItemString] = 1
	end

	if not haveInvalidMats then
		TSM.Crafting.SetMats(spellId, matQuantities)
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(matQuantities)
	return not haveInvalidMats
end
