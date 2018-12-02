-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--          http://www.curse.com/addons/wow/tradeskillmaster_warehousing          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local GuildTracking = TSM.Inventory:NewPackage("GuildTracking")
local private = {
	db = nil,
	isOpen = nil,
	lastUpdate = 0,
	pendingPetSlotIds = {},
	petSpeciesCache = {},
}
local PLAYER_NAME = UnitName("player")
local PLAYER_GUILD = nil
local MAX_PET_SCANS = 10
-- don't use MAX_GUILDBANK_SLOTS_PER_TAB since it isn't available right away
local GUILD_BANK_TAB_SLOTS = 98
local GUILD_BANK_DB_SCHEMA = {
	fields = {
		slotId = "number",
		tab = "number",
		slot = "number",
		itemString = "string",
		baseItemString = "string",
		autoBaseItemString = "string",
		quantity = "number",
	},
	fieldAttributes = {
		slotId = { "unique", "index" },
		itemString = { "index" },
		baseItemString = { "index" },
		autoBaseItemString = { "index" },
	},
	fieldOrder = {
		"slotId",
		"tab",
		"slot",
		"itemString",
		"baseItemString",
		"autoBaseItemString",
		"quantity",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function GuildTracking.OnEnable()
	private.db = TSMAPI_FOUR.Database.New(GUILD_BANK_DB_SCHEMA, "GUILD_BANK")
	TSMAPI_FOUR.Event.Register("GUILDBANKFRAME_OPENED", private.GuildBankFrameOpenedHandler)
	TSMAPI_FOUR.Event.Register("GUILDBANKFRAME_CLOSED", private.GuildBankFrameClosedHandler)
	TSMAPI_FOUR.Event.Register("GUILDBANKBAGSLOTS_CHANGED", private.GuildBankBagSlotsChangedHandler)
	TSMAPI_FOUR.Delay.AfterFrame(1, private.GetGuildName)
	TSMAPI_FOUR.Event.Register("PLAYER_GUILD_UPDATE", private.GetGuildName)
end

function GuildTracking.CreateQuery()
	return private.db:NewQuery()
end

function GuildTracking.GetQuantityBySlotId(slotId)
	return private.db:GetUniqueRowField("slotId", slotId, "quantity")
end

function GuildTracking.GetItemStringBySlotId(slotId)
	return private.db:GetUniqueRowField("slotId", slotId, "itemString")
end

function GuildTracking.GetQuantityByAutoBaseItemString(autoBaseItemString)
	local query = private.db:NewQuery()
		:Equal("autoBaseItemString", autoBaseItemString)
	local result = query:Sum("quantity")
	query:Release()
	return result or 0
end

function GuildTracking.GuildBankIterator(autoBaseItems)
	local query = private.db:NewQuery()
		:Select("tab", "slot", autoBaseItems and "autoBaseItemString" or "itemString", "quantity")
	return query:IteratorAndRelease()
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetGuildName()
	if not IsInGuild() then
		TSM.db.factionrealm.internalData.characterGuilds[PLAYER_NAME] = nil
		return
	end
	PLAYER_GUILD = GetGuildInfo("player")
	if not PLAYER_GUILD then
		-- try again next frame
		TSMAPI_FOUR.Delay.AfterFrame(1, private.GetGuildName)
		return
	end

	TSM.db.factionrealm.internalData.characterGuilds[PLAYER_NAME] = PLAYER_GUILD

	-- clean up any guilds with no players in them
	local validGuilds = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, character in TSM.db:FactionrealmCharacterByAccountIterator() do
		local guild = TSM.db.factionrealm.internalData.characterGuilds[character]
		if guild then
			validGuilds[guild] = true
		end
	end
	local toRemove = TSMAPI_FOUR.Util.AcquireTempTable()
	for character, guild in pairs(TSM.db.factionrealm.internalData.characterGuilds) do
		if not validGuilds[guild] then
			tinsert(toRemove, character)
		end
	end
	for _, character in ipairs(toRemove) do
		TSM.db.factionrealm.internalData.characterGuilds[character] = nil
	end
	wipe(toRemove)
	for guild in pairs(TSM.db.factionrealm.internalData.guildVaults) do
		if not validGuilds[guild] then
			tinsert(toRemove, guild)
		end
	end
	for _, guild in ipairs(toRemove) do
		TSM.Inventory.WipeGuildQuantity(guild)
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(toRemove)
	TSMAPI_FOUR.Util.ReleaseTempTable(validGuilds)

	TSM.db.factionrealm.internalData.guildVaults[PLAYER_GUILD] = TSM.db.factionrealm.internalData.guildVaults[PLAYER_GUILD] or {}
	TSM.Inventory.OnGuildLoaded()
end

function private.GuildBankFrameOpenedHandler()
	local initialTab = GetCurrentGuildBankTab()
	for i = 1, GetNumGuildBankTabs() do
		QueryGuildBankTab(i)
	end
	QueryGuildBankTab(initialTab)
	private.isOpen = true
end

function private.GuildBankFrameClosedHandler()
	private.isOpen = nil
end

function private.GuildBankBagSlotsChangedHandler()
	private.lastUpdate = GetTime()
	TSMAPI_FOUR.Delay.AfterFrame("guildBankScan", 2, private.GuildBankChangedDelayed)
end

function private.GuildBankChangedDelayed()
	if not private.isOpen then
		return
	end
	if not PLAYER_GUILD then
		-- we don't have the guild name yet, so try again after a short delay
		TSMAPI_FOUR.Delay.AfterFrame("guildBankScan", 2, private.GuildBankChangedDelayed)
		return
	end
	private.ScanGuildBank()
end


function private.ScanGuildBank()
	TSM.Inventory.WipeGuildQuantity(PLAYER_GUILD)
	wipe(private.pendingPetSlotIds)
	private.db:TruncateAndBulkInsertStart()
	local didFail = false
	for tab = 1, GetNumGuildBankTabs() do
		-- only scan tabs which we have at least enough withdrawals to withdraw every slot
		local _, _, _, _, numWithdrawals = GetGuildBankTabInfo(tab)
		if numWithdrawals == -1 or numWithdrawals >= GUILD_BANK_TAB_SLOTS then
			for slot = 1, GUILD_BANK_TAB_SLOTS do
				local slotId = TSMAPI_FOUR.Util.JoinSlotId(tab, slot)
				local itemLink = GetGuildBankItemLink(tab, slot)
				local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemLink)
				if baseItemString == TSM.CONST.PET_CAGE_ITEMSTRING then
					if not private.petSpeciesCache[itemLink] then
						-- defer the scanning of pets which we don't have cached info for
						private.pendingPetSlotIds[slotId] = true
					end
					baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(private.petSpeciesCache[itemLink])
				end
				if baseItemString then
					local _, quantity = GetGuildBankItemInfo(tab, slot)
					if quantity == 0 then
						-- the info for this slot isn't fully loaded yet
						TSM:LOG_ERR("Failed to scan guild bank slot (%d)", slotId)
						didFail = true
						break
					end
					TSM.Inventory.ChangeGuildQuantity(baseItemString, quantity)
					local itemString = private.petSpeciesCache[itemLink] or TSMAPI_FOUR.Item.ToItemString(itemLink)
					local autoBaseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString, true)
					private.db:BulkInsertNewRow(slotId, tab, slot, itemString, baseItemString, autoBaseItemString, quantity)
				end
			end
		end
		if didFail then
			break
		end
	end
	private.db:BulkInsertEnd()
	if didFail then
		TSMAPI_FOUR.Delay.AfterFrame("guildBankScan", 2, private.GuildBankChangedDelayed)
	elseif next(private.pendingPetSlotIds) then
		TSMAPI_FOUR.Delay.AfterFrame("guildBankPetScan", 2, private.ScanPetsDeferred)
	else
		TSMAPI_FOUR.Delay.Cancel("guildBankPetScan")
	end
end

function private.ScanPetsDeferred()
	local numPetSlotIdsScanned = 0
	local toRemove = TSMAPI_FOUR.Util.AcquireTempTable()
	private.db:BulkInsertStart()
	for slotId in pairs(private.pendingPetSlotIds) do
		local tab, slot = TSMAPI_FOUR.Util.SplitSlotId(slotId)
		local itemLink = GetGuildBankItemLink(tab, slot)
		local speciesId, level, rarity = GameTooltip:SetGuildBankItem(tab, slot)
		private.petSpeciesCache[itemLink] = "p:"..speciesId..":"..level..":"..rarity
		local itemString = private.petSpeciesCache[itemLink]
		if itemString then
			tinsert(toRemove, slotId)
			local _, quantity = GetGuildBankItemInfo(tab, slot)
			TSM.Inventory.ChangeGuildQuantity(itemString, quantity)
			private.db:BulkInsertNewRow(slotId, tab, slot, itemString, TSMAPI_FOUR.Item.ToBaseItemString(itemString), TSMAPI_FOUR.Item.ToBaseItemString(itemString, true), quantity)
		end
		-- throttle how many pet slots we scan per call (regardless of whether or not it was successful)
		numPetSlotIdsScanned = numPetSlotIdsScanned + 1
		if numPetSlotIdsScanned == MAX_PET_SCANS then
			break
		end
	end
	private.db:BulkInsertEnd()
	TSM:LOG_INFO("Scanned %d pet slots", numPetSlotIdsScanned)
	for _, slotId in ipairs(toRemove) do
		private.pendingPetSlotIds[slotId] = nil
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(toRemove)

	if next(private.pendingPetSlotIds) then
		-- there are more to scan
		TSMAPI_FOUR.Delay.AfterFrame("guildBankPetScan", 2, private.ScanPetsDeferred)
	end
end
