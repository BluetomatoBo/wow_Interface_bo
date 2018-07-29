-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Sync = TSM.Crafting:NewPackage("Sync")
local private = {
	connectedPlayers = {},
	hashesTemp = {},
	spellsTemp = {},
	spellInfoTemp = {
		spellIds = {},
		mats = {},
		itemStrings = {},
		names = {},
		numResults = {},
		hasCDs = {},
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Sync.OnInitialize()
	TSM.Sync.Connection.RegisterConnectionChangedCallback(private.ConnectionChangedHandler)
	TSM.Sync.RPC.Register("CRAFTING_GET_HASHES", private.RPCGetHashes)
	TSM.Sync.RPC.Register("CRAFTING_GET_SPELLS", private.RPCGetSpells)
	TSM.Sync.RPC.Register("CRAFTING_GET_SPELL_INFO", private.RPCGetSpellInfo)
end



-- ============================================================================
-- RPC Functions and Result Handlers
-- ============================================================================

function private.RPCGetHashes()
	wipe(private.hashesTemp)
	local player = UnitName("player")
	private.GetPlayerProfessionHashes(player, private.hashesTemp)
	return player, private.hashesTemp
end

function private.RPCGetHashesResultHandler(player, data)
	if not player then
		return
	end
	local currentInfo = TSMAPI_FOUR.Util.AcquireTempTable()
	private.GetPlayerProfessionHashes(player, currentInfo)
	for profession, hash in pairs(data) do
		if hash == currentInfo[profession] then
			TSM:LOG_INFO("%s data for %s already up to date", profession, player)
		else
			TSM:LOG_INFO("Requesting updated %s data from %s (%s, %s)", profession, player, hash, tostring(currentInfo[hash]))
			TSM.Sync.RPC.Call("CRAFTING_GET_SPELLS", player, private.RPCGetSpellsResultHandler, profession)
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(currentInfo)
end

function private.RPCGetSpells(profession)
	wipe(private.spellsTemp)
	local player = UnitName("player")
	local query = TSM.Crafting.CreateRawCraftsQuery()
		:Select("spellId")
		:Equal("profession", profession)
		:Custom(private.QueryPlayerFilter, player)
		:OrderBy("spellId", true)
	for _, spellId in query:Iterator() do
		tinsert(private.spellsTemp, spellId)
	end
	query:Release()
	return player, profession, private.spellsTemp
end

function private.RPCGetSpellsResultHandler(player, profession, spells)
	if not player then
		return
	end

	for i = #spells, 1, -1 do
		local spellId = spells[i]
		if TSM.Crafting.HasSpellId(spellId) then
			-- already have this spell so just make sure this player is added
			TSM.Crafting.AddPlayer(spellId, player)
			tremove(spells, i)
		end
	end
	if #spells == 0 then
		TSM:LOG_INFO("Spells up to date for %s -> %s", player, profession)
	else
		TSM:LOG_INFO("Requesting %d %s spells from %s", #spells, profession, player)
		TSM.Sync.RPC.Call("CRAFTING_GET_SPELL_INFO", player, private.RPCGetSpellInfoResultHandler, profession, spells)
	end
end

function private.RPCGetSpellInfo(profession, spells)
	for _, tbl in pairs(private.spellInfoTemp) do
		wipe(tbl)
	end
	for i, spellId in ipairs(spells) do
		private.spellInfoTemp.spellIds[i] = spellId
		private.spellInfoTemp.mats[i] = TSM.db.factionrealm.internalData.crafts[spellId].mats
		private.spellInfoTemp.itemStrings[i] = TSM.db.factionrealm.internalData.crafts[spellId].itemString
		private.spellInfoTemp.names[i] = TSM.db.factionrealm.internalData.crafts[spellId].name
		private.spellInfoTemp.numResults[i] = TSM.db.factionrealm.internalData.crafts[spellId].numResult
		private.spellInfoTemp.hasCDs[i] = TSM.db.factionrealm.internalData.crafts[spellId].hasCD
	end
	TSM:LOG_INFO("Sent %d %s spells", #private.spellInfoTemp.spellIds, profession)
	return UnitName("player"), profession, private.spellInfoTemp
end

function private.RPCGetSpellInfoResultHandler(player, profession, spellInfo)
	if not player or not profession or not spellInfo then
		return
	end

	for i, spellId in ipairs(spellInfo.spellIds) do
		TSM.Crafting.CreateOrUpdate(spellId, spellInfo.itemStrings[i], profession, spellInfo.names[i], spellInfo.numResults[i], player, spellInfo.hasCDs[i] and true or false)
		for itemString in pairs(spellInfo.mats[i]) do
			TSM.db.factionrealm.internalData.mats[itemString] = TSM.db.factionrealm.internalData.mats[itemString] or {}
		end
		TSM.Crafting.SetMats(spellId, spellInfo.mats[i])
	end
	TSM:LOG_INFO("Added %d spells for %s from %s", #spellInfo.spellIds, profession, player)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.ConnectionChangedHandler(_, player, connected)
	private.connectedPlayers[player] = connected or nil
	if connected then
		-- issue a request for profession info
		TSM.Sync.RPC.Call("CRAFTING_GET_HASHES", player, private.RPCGetHashesResultHandler)
	end
end

function private.QueryPlayerFilter(row, player)
	return TSMAPI_FOUR.Util.SeparatedStrContains(row:GetField("players"), ",", player)
end

function private.GetPlayerProfessionHashes(player, resultTbl)
	local query = TSM.Crafting.CreateRawCraftsQuery()
		:Select("spellId", "profession")
		:Custom(private.QueryPlayerFilter, player)
		:OrderBy("spellId", true)
	for _, spellId, profession in query:Iterator() do
		resultTbl[profession] = TSMAPI_FOUR.Util.CalculateHash(spellId, resultTbl[profession])
	end
end
