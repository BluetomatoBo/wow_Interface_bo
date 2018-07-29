-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Crafting = TSM:NewPackage("Crafting")
local L = TSM.L
local private = {
	spellDB = nil,
	matDB = nil,
	matItemDB = nil,
	matDBSpellIdQuery = nil,
	ignoredCooldownDB = nil,
}
local CHARACTER_KEY = UnitName("player").." - "..GetRealmName()
local IGNORED_COOLDOWN_SEP = "\001"
local PROFESSION_SEP = ","
local PLAYER_SEP = ","
local OPERATION_DEFAULTS = {
	minRestock = 1,
	maxRestock = 3,
	minProfit = 1000000,
	craftPriceMethod = nil,
}
local SPELL_DB_SCHEMA = {
	fields = {
		spellId = "number",
		itemString = "string",
		itemName = "string",
		name = "string",
		profession = "string",
		numResult = "number",
		players = "string",
		hasCD = "boolean",
		firstOperation = "string",
	},
	fieldAttributes = {
		spellId = { "unique" },
		itemString = { "index" },
	},
	fieldOrder = {
		"spellId",
		"itemString",
		"itemName",
		"name",
		"profession",
		"numResult",
		"players",
		"hasCD",
		"firstOperation",
	},
}
local MAT_DB_SCHEMA = {
	fields = {
		spellId = "number",
		itemString = "string",
		quantity = "number",
	},
	fieldAttributes = {
		spellId = { "index" },
		itemString = { "index" },
	},
	fieldOrder = {
		"spellId",
		"itemString",
		"quantity",
	},
}
local MAT_ITEM_DB_SCHEMA = {
	fields = {
		itemString = "string",
		professions = "string",
		hasCustomValue = "boolean",
	},
	fieldAttributes = {
		itemString = { "unique" },
	},
	fieldOrder = {
		"itemString",
		"professions",
		"hasCustomValue",
	},
}
local IGNORED_COOLDOWN_DB_SCHEMA = {
	fields = {
		characterKey = "string",
		spellId = "number",
	},
	fieldOrder = {
		"characterKey",
		"spellId",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Crafting.OnInitialize()
	TSM.Operations.Register("Crafting", OPERATION_DEFAULTS, 1, private.GetOperationInfo)
end

function Crafting.OnEnable()
	local used = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, craftInfo in pairs(TSM.db.factionrealm.internalData.crafts) do
		for itemString in pairs(craftInfo.mats) do
			used[itemString] = true
			if not TSM.db.factionrealm.internalData.mats[itemString] then
				TSM.db.factionrealm.internalData.mats[itemString] = {}
			end
			-- clear the old name field
			TSM.db.factionrealm.internalData.mats[itemString].name = nil
		end
	end
	for itemString in pairs(TSM.db.factionrealm.internalData.mats) do
		if not used[itemString] then
			TSM.db.factionrealm.internalData.mats[itemString] = nil
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(used)

	local professionItems = TSMAPI_FOUR.Util.AcquireTempTable()
	private.matDB = TSMAPI_FOUR.Database.New(MAT_DB_SCHEMA, "CRAFTING_MATS")
	private.matDB:BulkInsertStart()
	private.spellDB = TSMAPI_FOUR.Database.New(SPELL_DB_SCHEMA, "CRAFTING_SPELLS")
	private.spellDB:BulkInsertStart()
	for spellId, craftInfo in pairs(TSM.db.factionrealm.internalData.crafts) do
		local players = TSMAPI_FOUR.Util.AcquireTempTable()
		for player in pairs(craftInfo.players) do
			tinsert(players, player)
		end
		sort(players)
		local playersStr = strjoin(PLAYER_SEP, TSMAPI_FOUR.Util.UnpackAndReleaseTempTable(players))
		local itemName = TSMAPI_FOUR.Item.GetName(craftInfo.itemString) or ""
		-- FIXME: replace with a join
		local firstOperation = TSMAPI.Operations:GetFirstNameByItem(craftInfo.itemString, "Crafting") or ""
		private.spellDB:BulkInsertNewRow(spellId, craftInfo.itemString, itemName, craftInfo.name or "", craftInfo.profession, craftInfo.numResult, playersStr, craftInfo.hasCD and true or false, firstOperation)

		for matItemString, matQuantity in pairs(craftInfo.mats) do
			private.matDB:BulkInsertNewRow(spellId, matItemString, matQuantity)
			professionItems[craftInfo.profession] = professionItems[craftInfo.profession] or TSMAPI_FOUR.Util.AcquireTempTable()
			professionItems[craftInfo.profession][matItemString] = true
		end
	end
	private.spellDB:BulkInsertEnd()
	private.matDB:BulkInsertEnd()

	private.matDBMatsInTableQuery = private.matDB:NewQuery()
		:Select("itemString", "quantity")
		:Equal("spellId", TSM.CONST.BOUND_QUERY_PARAM)

	private.matItemDB = TSMAPI_FOUR.Database.New(MAT_ITEM_DB_SCHEMA, "CRAFTING_MAT_ITEMS")
	private.matItemDB:BulkInsertStart()
	for itemString, info in pairs(TSM.db.factionrealm.internalData.mats) do
		local professions = TSMAPI_FOUR.Util.AcquireTempTable()
		for profession, items in pairs(professionItems) do
			if items[itemString] then
				tinsert(professions, profession)
			end
		end
		sort(professions)
		local professionsStr = strjoin(PROFESSION_SEP, TSMAPI_FOUR.Util.UnpackAndReleaseTempTable(professions))
		private.matItemDB:BulkInsertNewRow(itemString, professionsStr, info.customValue and true or false)
	end
	private.matItemDB:BulkInsertEnd()

	for _, tbl in pairs(professionItems) do
		TSMAPI_FOUR.Util.ReleaseTempTable(tbl)
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(professionItems)

	private.matDBSpellIdQuery = private.matDB:NewQuery()
		:Equal("spellId", TSM.CONST.BOUND_QUERY_PARAM)

	-- register 1:1 crafting conversions
	local query = private.spellDB:NewQuery()
		:Select("spellId", "itemString", "numResult")
		:Equal("hasCD", false)
	local matQuery = private.matDB:NewQuery()
		:Select("itemString", "quantity")
		:Equal("spellId", TSM.CONST.BOUND_QUERY_PARAM)
	for _, spellId, itemString, numResult in query:Iterator() do
		if not TSM.CONST.MASS_MILLING_RECIPES[spellId] then
			matQuery:BindParams(spellId)
			if matQuery:Count() == 1 then
				local matItemString, matQuantity = matQuery:GetFirstResult()
				TSMAPI_FOUR.Conversions.Add(itemString, matItemString, numResult / matQuantity, "craft")
			end
		end
	end
	matQuery:Release()
	query:Release()

	local isValid, err = TSMAPI_FOUR.CustomPrice.Validate(TSM.db.global.craftingOptions.defaultCraftPriceMethod, "crafting")
	if not isValid then
		TSM:Printf(L["Your default craft value method was invalid so it has been returned to the default. Details: %s"], err)
		TSM.db.global.craftingOptions.defaultCraftPriceMethod = TSM.db:GetDefault("global", "craftingOptions", "defaultCraftPriceMethod")
	end
	for name, operation in pairs(TSM.operations.Crafting) do
		if operation.craftPriceMethod then
			isValid, err = TSMAPI_FOUR.CustomPrice.Validate(operation.craftPriceMethod, "crafting")
			if not isValid then
				TSM:Printf(L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"], name, err)
				operation.craftPriceMethod = nil
			end
		end
	end

	private.ignoredCooldownDB = TSMAPI_FOUR.Database.New(IGNORED_COOLDOWN_DB_SCHEMA, "IGNORED_COOLDOWNS")
	private.ignoredCooldownDB:BulkInsertStart()
	for entry in pairs(TSM.db.factionrealm.userData.craftingCooldownIgnore) do
		local characterKey, spellId = strsplit(IGNORED_COOLDOWN_SEP, entry)
		private.ignoredCooldownDB:BulkInsertNewRow(characterKey, tonumber(spellId))
	end
	private.ignoredCooldownDB:BulkInsertEnd()
end

function Crafting.HasSpellId(spellId)
	return private.spellDB:HasUniqueRow("spellId", spellId)
end

function Crafting.CreateRawCraftsQuery()
	return private.spellDB:NewQuery()
end

function Crafting.CreateCraftsQuery()
	return private.spellDB:NewQuery()
		:LeftJoin(TSM.Crafting.Queue.GetDBForJoin(), "spellId")
		:InnerJoin(TSM.Crafting.Cost.GetCraftDBForJoin(), "spellId")
end

function Crafting.CreateQueuedCraftsQuery()
	return private.spellDB:NewQuery()
		:InnerJoin(TSM.Crafting.Queue.GetDBForJoin(), "spellId")
end

function Crafting.CreateCooldownSpellsQuery()
	return private.spellDB:NewQuery()
		:Equal("hasCD", true)
end

function Crafting.CreateRawMatItemQuery()
	return private.matItemDB:NewQuery()
end

function Crafting.CreateMatItemQuery()
	return private.matItemDB:NewQuery()
		:InnerJoin(TSM.ItemInfo.GetDBForJoin(), "itemString")
		:InnerJoin(TSM.Crafting.Cost.GetMatDBForJoin(), "itemString")
end

function Crafting.SpellIterator()
	return private.spellDB:NewQuery()
		:Select("spellId")
		:IteratorAndRelease()
end

function Crafting.GetSpellIdsByItem(itemString)
	return private.spellDB:NewQuery()
		:Select("spellId", "hasCD")
		:Equal("itemString", itemString)
		:IteratorAndRelease()
end

function Crafting.GetMostProfitableSpellIdByItem(itemString, playerFilter)
	local maxProfit, bestSpellId = nil, nil
	local maxProfitCD, bestSpellIdCD = nil, nil
	for _, spellId, hasCD in Crafting.GetSpellIdsByItem(itemString) do
		if not playerFilter or TSMAPI_FOUR.Util.In(playerFilter, Crafting.GetPlayers(spellId)) then
			local profit = Crafting.Cost.GetProfitBySpellId(spellId)
			if hasCD then
				if profit and profit > (maxProfitCD or -math.huge) then
					maxProfitCD = profit
					bestSpellIdCD = spellId
				elseif not maxProfitCD then
					bestSpellIdCD = spellId
				end
			else
				if profit and profit > (maxProfit or -math.huge) then
					maxProfit = profit
					bestSpellId = spellId
				elseif not maxProfit then
					bestSpellId = spellId
				end
			end
		end
	end
	if maxProfit then
		return bestSpellId, maxProfit
	elseif maxProfitCD then
		return bestSpellIdCD, maxProfitCD
	else
		return bestSpellId or bestSpellIdCD or nil, nil
	end
end

function Crafting.GetItemString(spellId)
	return private.spellDB:GetUniqueRowField("spellId", spellId, "itemString")
end

function Crafting.GetProfession(spellId)
	return private.spellDB:GetUniqueRowField("spellId", spellId, "profession")
end

function Crafting.GetNumResult(spellId)
	return private.spellDB:GetUniqueRowField("spellId", spellId, "numResult")
end

function Crafting.GetPlayers(spellId)
	local players = private.spellDB:GetUniqueRowField("spellId", spellId, "players")
	if not players then
		return
	end
	return strsplit(PLAYER_SEP, players)
end

function Crafting.GetName(spellId)
	return private.spellDB:GetUniqueRowField("spellId", spellId, "name")
end

function Crafting.MatIterator(spellId)
	return private.matDB:NewQuery()
		:Select("itemString", "quantity")
		:Equal("spellId", spellId)
		:IteratorAndRelease()
end

function Crafting.GetMatsAsTable(spellId, tbl)
	private.matDBMatsInTableQuery:BindParams(spellId)
	private.matDBMatsInTableQuery:AsTable(tbl)
end

function Crafting.RemovePlayers(spellId, playersToRemove)
	local shouldRemove = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, player in ipairs(playersToRemove) do
		shouldRemove[player] = true
	end
	local players = TSMAPI_FOUR.Util.AcquireTempTable(Crafting.GetPlayers(spellId))
	for i = #players, 1, -1 do
		local player = players[i]
		if shouldRemove[player] then
			TSM.db.factionrealm.internalData.crafts[spellId].players[player] = nil
			tremove(players, i)
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(shouldRemove)
	local query = private.spellDB:NewQuery()
		:Equal("spellId", spellId)
	local row = query:GetFirstResult()

	local playersStr = strjoin(PLAYER_SEP, TSMAPI_FOUR.Util.UnpackAndReleaseTempTable(players))
	if playersStr ~= "" then
		row:SetField("players", playersStr)
			:Update()
		query:Release()
		return true
	end

	-- no more players so remove this spell and all its mats
	private.spellDB:DeleteRow(row)
	query:Release()
	TSM.db.factionrealm.internalData.crafts[spellId] = nil

	local removedMats = TSMAPI_FOUR.Util.AcquireTempTable()
	private.matDB:SetQueryUpdatesPaused(true)
	query = private.matDB:NewQuery()
		:Equal("spellId", spellId)
	for _, matRow in query:Iterator() do
		removedMats[matRow:GetField("itemString")] = true
		private.matDB:DeleteRow(matRow)
	end
	query:Release()
	private.matDB:SetQueryUpdatesPaused(false)
	private.ProcessRemovedMats(removedMats)
	TSMAPI_FOUR.Util.ReleaseTempTable(removedMats)

	return false
end

function Crafting.SetSpellDBQueryUpdatesPaused(paused)
	private.spellDB:SetQueryUpdatesPaused(paused)
end

function Crafting.CreateOrUpdate(spellId, itemString, profession, name, numResult, player, hasCD)
	local row = private.spellDB:GetUniqueRow("spellId", spellId)
	if row then
		local playersStr = row:GetField("players")
		local foundPlayer = TSMAPI_FOUR.Util.SeparatedStrContains(playersStr, PLAYER_SEP, player)
		if not foundPlayer then
			assert(playersStr ~= "")
			playersStr = playersStr .. PLAYER_SEP .. player
		end
		row:SetField("itemString", itemString)
			:SetField("profession", profession)
			:SetField("itemName", TSMAPI_FOUR.Item.GetName(itemString) or "")
			:SetField("name", name)
			:SetField("numResult", numResult)
			:SetField("players", playersStr)
			:SetField("hasCD", hasCD)
			:Update()
		row:Release()
		local craftInfo = TSM.db.factionrealm.internalData.crafts[spellId]
		craftInfo.itemString = itemString
		craftInfo.profession = profession
		craftInfo.name = name
		craftInfo.numResult = numResult
		craftInfo.players[player] = true
		craftInfo.hasCD = hasCD or nil
	else
		TSM.db.factionrealm.internalData.crafts[spellId] = {
			mats = {},
			players = { [player] = true },
			queued = 0,
			itemString = itemString,
			name = name,
			profession = profession,
			numResult = numResult,
			hasCD = hasCD,
		}
		private.spellDB:NewRow()
			:SetField("spellId", spellId)
			:SetField("itemString", itemString)
			:SetField("profession", profession)
			:SetField("itemName", TSMAPI_FOUR.Item.GetName(itemString) or "")
			:SetField("name", name)
			:SetField("numResult", numResult)
			:SetField("players", player)
			:SetField("hasCD", hasCD)
			-- FIXME: replace with a join
			:SetField("firstOperation", TSMAPI.Operations:GetFirstNameByItem(itemString, "Crafting") or "")
			:Create()
	end
end

function Crafting.AddPlayer(spellId, player)
	if TSM.db.factionrealm.internalData.crafts[spellId].players[player] then
		return
	end
	local row = private.spellDB:GetUniqueRow("spellId", spellId)
	local playersStr = row:GetField("players")
	assert(playersStr ~= "")
	playersStr = playersStr .. PLAYER_SEP .. player
	row:SetField("players", playersStr)
	row:Update()
	row:Release()
	TSM.db.factionrealm.internalData.crafts[spellId].players[player] = true
end

function Crafting.SetMats(spellId, matQuantities)
	if TSMAPI_FOUR.Util.TablesEqual(TSM.db.factionrealm.internalData.crafts[spellId].mats, matQuantities) then
		-- nothing changed
		return
	end

	wipe(TSM.db.factionrealm.internalData.crafts[spellId].mats)
	for itemString, quantity in pairs(matQuantities) do
		TSM.db.factionrealm.internalData.crafts[spellId].mats[itemString] = quantity
	end

	private.matDB:SetQueryUpdatesPaused(true)
	local removedMats = TSMAPI_FOUR.Util.AcquireTempTable()
	local usedMats = TSMAPI_FOUR.Util.AcquireTempTable()
	private.matDBSpellIdQuery:BindParams(spellId)
	for _, row in private.matDBSpellIdQuery:Iterator() do
		local itemString = row:GetField("itemString")
		local quantity = matQuantities[itemString]
		if not quantity then
			-- remove this row
			private.matDB:DeleteRow(row)
			removedMats[itemString] = true
		else
			usedMats[itemString] = true
			row:SetField("quantity", quantity)
				:Update()
		end
	end
	local profession = Crafting.GetProfession(spellId)
	for itemString, quantity in pairs(matQuantities) do
		if not usedMats[itemString] then
			private.matDB:NewRow()
				:SetField("spellId", spellId)
				:SetField("itemString", itemString)
				:SetField("quantity", quantity)
				:Create()
			local matItemRow = private.matItemDB:GetUniqueRow("itemString", itemString)
			if matItemRow then
				-- update the professions if necessary
				local professions = TSMAPI_FOUR.Util.AcquireTempTable(strsplit(PROFESSION_SEP, matItemRow:GetField("professions")))
				if not TSMAPI_FOUR.Util.TableKeyByValue(professions, profession) then
					tinsert(professions, profession)
					sort(professions)
					matItemRow:SetField("professions", table.concat(professions, PROFESSION_SEP))
						:Update()
				end
				TSMAPI_FOUR.Util.ReleaseTempTable(professions)
			else
				private.matItemDB:NewRow()
					:SetField("itemString", itemString)
					:SetField("professions", profession)
					:SetField("hasCustomValue", TSM.db.factionrealm.internalData.mats[itemString].customValue and true or false)
					:Create()
			end
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(usedMats)
	private.matDB:SetQueryUpdatesPaused(false)

	private.ProcessRemovedMats(removedMats)
	TSMAPI_FOUR.Util.ReleaseTempTable(removedMats)
end

function Crafting.SetMatCustomValue(itemString, value)
	TSM.db.factionrealm.internalData.mats[itemString].customValue = value
	private.matItemDB:GetUniqueRow("itemString", itemString)
		:SetField("hasCustomValue", value and true or false)
		:Update()
end

function Crafting.CanCraftItem(itemString)
	local count = private.spellDB:NewQuery()
		:Equal("itemString", itemString)
		:CountAndRelease()
	return count > 0
end

function Crafting.RestockHelp(link)
	local itemString = TSMAPI_FOUR.Item.ToItemString(link)
	if not itemString then
		return print(L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"])
	end

	TSM:Printf(L["Restock help for %s:"], link)

	-- check if the item is in a group
	local groupPath = TSMAPI_FOUR.Groups.GetPathByItem(itemString)
	if not groupPath then
		return print(L["This item is not in a TSM group."])
	end

	-- check that there's a crafting operation applied
	local opName = TSMAPI.Operations:GetFirstByItem(itemString, "Crafting")
	local opSettings = opName and TSM.operations.Crafting[opName]
	if not opSettings then
		return print(format(L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."], TSMAPI_FOUR.Groups.FormatPath(groupPath)))
	end

	-- check if it's an invalid operation
	if opSettings.minRestock > opSettings.maxRestock then
		return print(format(L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."], opSettings.minRestock, opSettings.maxRestock))
	end

	-- check that this item is craftable
	if not TSM.Crafting.CanCraftItem(itemString) then
		return print(L["You don't know how to craft this item."])
	end

	-- check the restock quantity
	local numHave = TSMAPI_FOUR.Inventory.GetTotalQuantity(itemString)
	if numHave >= opSettings.maxRestock then
		return print(format(L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"], numHave, opSettings.maxRestock))
	elseif (opSettings.maxRestock - numHave) < opSettings.minRestock then
		return print(format(L["The number which would be queued (%d) is less than the min restock quantity (%d)."], (opSettings.maxRestock - numHave), opSettings.minRestock))
	end

	-- check the prices on the item and the min profit
	if opSettings.minProfit then
		local cost = TSM.Crafting.Cost.GetLowestCostByItem(itemString)
		local craftedValue = TSM.Crafting.Cost.GetCraftedItemValue(itemString)
		local profit = cost and craftedValue and (craftedValue - cost) or nil

		-- check that there's a crafted value
		if not craftedValue then
			local craftPriceMethod = opSettings and opSettings.craftPriceMethod or TSM.db.global.craftingOptions.defaultCraftPriceMethod
			return print(format(L["The 'Craft Value Method' (%s) did not return a value for this item."], craftPriceMethod))
		end

		-- check that there's a crafted cost
		if not cost then
			return print(L["This item does not have a crafting cost. Check that all of its mats have mat prices."])
		end

		-- check that there's a profit
		if not profit then
			return print(L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"])
		end

		local minProfit = TSMAPI_FOUR.CustomPrice.GetValue(opSettings.minProfit, itemString)
		if not minProfit then
			return print(format(L["The min profit (%s) did not evalulate to a valid value for this item."], opSettings.minProfit))
		end

		if profit < minProfit then
			return print(format(L["The profit of this item (%s) is below the min profit (%s)."], TSMAPI_FOUR.Money.ToString(profit), TSMAPI_FOUR.Money.ToString(minProfit)))
		end
	end

	print(L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."])
end

function Crafting.IgnoreCooldown(spellId)
	assert(not TSM.db.factionrealm.userData.craftingCooldownIgnore[CHARACTER_KEY..IGNORED_COOLDOWN_SEP..spellId])
	TSM.db.factionrealm.userData.craftingCooldownIgnore[CHARACTER_KEY..IGNORED_COOLDOWN_SEP..spellId] = true
	private.ignoredCooldownDB:NewRow()
		:SetField("characterKey", CHARACTER_KEY)
		:SetField("spellId", spellId)
		:Create()
end

function Crafting.IsCooldownIgnored(spellId)
	return TSM.db.factionrealm.userData.craftingCooldownIgnore[CHARACTER_KEY..IGNORED_COOLDOWN_SEP..spellId]
end

function Crafting.CreateIgnoredCooldownQuery()
	return private.ignoredCooldownDB:NewQuery()
end

function Crafting.RemoveIgnoredCooldown(characterKey, spellId)
	assert(TSM.db.factionrealm.userData.craftingCooldownIgnore[characterKey..IGNORED_COOLDOWN_SEP..spellId])
	TSM.db.factionrealm.userData.craftingCooldownIgnore[characterKey..IGNORED_COOLDOWN_SEP..spellId] = nil
	local row = private.ignoredCooldownDB:NewQuery()
		:Equal("characterKey", characterKey)
		:Equal("spellId", spellId)
		:GetFirstResultAndRelease()
	assert(row)
	private.ignoredCooldownDB:DeleteRow(row)
	row:Release()
end




-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOperationInfo(operationSettings)
	if operationSettings.minProfit then
		return format(L["Restocking to a max of %d (min of %d) with a min profit."], operationSettings.maxRestock, operationSettings.minRestock)
	else
		return format(L["Restocking to a max of %d (min of %d) with no min profit."], operationSettings.maxRestock, operationSettings.minRestock)
	end
end

function private.ProcessRemovedMats(removedMats)
	private.matItemDB:SetQueryUpdatesPaused(true)
	for itemString in pairs(removedMats) do
		local numSpells = private.matDB:NewQuery()
			:Equal("itemString", itemString)
			:CountAndRelease()
		if numSpells == 0 then
			local matItemRow = private.matItemDB:GetUniqueRow("itemString", itemString)
			private.matItemDB:DeleteRow(matItemRow)
			matItemRow:Release()
		end
	end
	private.matItemDB:SetQueryUpdatesPaused(false)
end
