-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Groups = TSM.Mailing:NewPackage("Groups")
local private = {
	thread = nil,
	sendDone = false,
}

local PLAYER_NAME = UnitName("player")
local PLAYER_NAME_REALM = string.gsub(PLAYER_NAME.."-"..GetRealmName(), "%s+", "")



-- ============================================================================
-- Module Functions
-- ============================================================================

function Groups.OnInitialize()
	private.thread = TSMAPI_FOUR.Thread.New("MAIL_GROUPS", private.GroupsMailThread)
end

function Groups.KillThread()
	TSMAPI_FOUR.Thread.Kill(private.thread)
end

function Groups.StartSending(callback, groupList, sendRepeat)
	TSMAPI_FOUR.Thread.Kill(private.thread)

	TSMAPI_FOUR.Thread.SetCallback(private.thread, callback)
	TSMAPI_FOUR.Thread.Start(private.thread, groupList, sendRepeat)
end



-- ============================================================================
-- Group Sending Thread
-- ============================================================================

function private.GroupsMailThread(groupList, sendRepeat)
	while true do
		for _, groupPath in ipairs(groupList) do
			for _, operationSettings in TSMAPI_FOUR.Operations.Iterator("Mailing", groupPath) do
				if groupPath == TSM.CONST.ROOT_GROUP_PATH then
					-- TODO
				else
					if operationSettings.target ~= "" and operationSettings.target ~= PLAYER_NAME and operationSettings.target ~= PLAYER_NAME_REALM then
						local items = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
						for _, itemString in TSMAPI_FOUR.Groups.ItemIterator(groupPath) do
							local quantity = private.GetItemQuantity(itemString, operationSettings)
							if quantity > 0 then
								items[itemString] = quantity
							end
						end

						if next(items) then
							private.SendItems(operationSettings.target, items)
							TSMAPI_FOUR.Thread.Sleep(0.5)
						end

						TSMAPI_FOUR.Thread.ReleaseSafeTempTable(items)
					end
				end
			end
		end

		if sendRepeat then
			TSMAPI_FOUR.Thread.Sleep(TSM.db.global.mailingOptions.resendDelay * 60)
		else
			break
		end
	end
end

function private.SendItems(target, items)
	private.sendDone = false
	TSM.Mailing.Send.StartSending(private.SendCallback, target, "", "", 0, items, true)
	while not private.sendDone do
		TSMAPI_FOUR.Thread.Yield(true)
	end
end

function private.SendCallback()
	private.sendDone = true
end

function private.GetItemQuantity(itemString, operationSettings)
	local numToSend = 0
	local playerQty = TSMAPI_FOUR.Inventory.GetBagQuantity(itemString)
	local numAvailable = playerQty - operationSettings.keepQty
	if numAvailable > 0 then
		if operationSettings.maxQtyEnabled then
			if operationSettings.restock then
				local targetQty = private.GetTargetQuantity(operationSettings.target, itemString, operationSettings.restockSources)
				if TSMAPI_FOUR.PlayerInfo.IsPlayer(operationSettings.target) and targetQty <= operationSettings.maxQty then
					numToSend = numAvailable
				else
					numToSend = min(numAvailable, operationSettings.maxQty - targetQty)
				end
			else
				numToSend = min(numAvailable, operationSettings.maxQty)
			end
		else
			numToSend = numAvailable
		end
	end

	return numToSend
end

function private.GetTargetQuantity(player, itemString, sources)
	if player then
		player = strtrim(strmatch(player, "^[^-]+"))
	end
	local num = TSMAPI_FOUR.Inventory.GetBagQuantity(itemString, player) + TSMAPI_FOUR.Inventory.GetMailQuantity(itemString, player) + TSMAPI_FOUR.Inventory.GetAuctionQuantity(itemString, player)
	if sources then
		if sources.guild then
			num = num + TSMAPI_FOUR.Inventory.GetGuildQuantity(itemString, TSMAPI_FOUR.PlayerInfo.GetPlayerGuild(player))
		end
		if sources.bank then
			num = num + TSMAPI_FOUR.Inventory.GetBankQuantity(itemString, player) + TSMAPI_FOUR.Inventory.GetReagentBankQuantity(itemString, player)
		end
	end

	return num
end
