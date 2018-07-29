-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local PlayerUtil = TSM.Sync:NewPackage("PlayerUtil")
local private = {
	addedFriends = {},
	invalidPlayers = {},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function PlayerUtil.OnInitialize()
	TSMAPI_FOUR.Event.Register("CHAT_MSG_SYSTEM", private.ChatMsgSystemEventHandler)
end

function PlayerUtil.GetTargetPlayer(account)
	local tempTbl = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, player in TSM.db:FactionrealmCharacterByAccountIterator(account) do
		tinsert(tempTbl, player)
	end

	-- find the player to connect to without adding to the friends list
	for _, player in ipairs(tempTbl) do
		if PlayerUtil.IsOnline(player, true) then
			TSMAPI_FOUR.Util.ReleaseTempTable(tempTbl)
			return player
		end
	end
	-- if we failed, try again with adding to friends list
	for _, player in ipairs(tempTbl) do
		if PlayerUtil.IsOnline(player) then
			TSMAPI_FOUR.Util.ReleaseTempTable(tempTbl)
			return player
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(tempTbl)
end

function PlayerUtil.IsOnline(target, noAdd)
	for i = 1, GetNumFriends() do
		local name, _, _, _, connected = GetFriendInfo(i)
		if name and strlower(name) == strlower(target) then
			return connected
		end
	end

	if not noAdd and not private.invalidPlayers[strlower(target)] and GetNumFriends() ~= 50 then
		-- add them as a friend
		AddFriend(target)
		tinsert(private.addedFriends, target)
		for i = 1, GetNumFriends() do
			local name, _, _, _, connected = GetFriendInfo(i)
			if name and strlower(name) == strlower(target) then
				return connected
			end
		end
	end
end



-- ============================================================================
-- Helper Functions
-- ============================================================================

function private.ChatMsgSystemEventHandler(_, msg)
	if #private.addedFriends == 0 then return end
	if msg == ERR_FRIEND_NOT_FOUND then
		if #private.addedFriends > 0 then
			private.invalidPlayers[strlower(tremove(private.addedFriends, 1))] = true
		end
	else
		for i, v in ipairs(private.addedFriends) do
			if format(ERR_FRIEND_ADDED_S, v) == msg then
				tremove(private.addedFriends, i)
				private.invalidPlayers[strlower(v)] = true
			end
		end
	end
end
