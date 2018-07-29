-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Mailing = TSM:NewPackage("Mailing")
local L = TSM.L
local private = {
	mailOpen = false,
	frameCallbacks = {},
}
local OPERATION_DEFAULTS = {
	maxQtyEnabled = nil,
	maxQty = 10,
	target = "",
	restock = nil,
	restockSources = { guild = nil, bank = nil },
	keepQty = 0,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Mailing.OnInitialize()
	TSM.Operations.Register("Mailing", OPERATION_DEFAULTS, 30, private.GetOperationInfo)
	TSMAPI_FOUR.Event.Register("MAIL_SHOW", private.MailShow)
	TSMAPI_FOUR.Event.Register("MAIL_CLOSED", private.MailClosed)
end

function Mailing.RegisterFrameCallback(callback)
	tinsert(private.frameCallbacks, callback)
end

function Mailing.IsOpen()
	return private.mailOpen
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOperationInfo(operationSettings)
	if operationSettings.target == "" then
		return
	end

	if operationSettings.maxQtyEnabled then
		return format(L["Mailing up to %d to %s."], operationSettings.maxQty, operationSettings.target)
	else
		return format(L["Mailing all to %s."], operationSettings.target)
	end
end

function private.MailShow()
	private.mailOpen = true
	for _, callback in ipairs(private.frameCallbacks) do
		callback(true)
	end
end

function private.MailClosed()
	if not private.mailOpen then
		return
	end
	private.mailOpen = false
	for _, callback in ipairs(private.frameCallbacks) do
		callback(false)
	end
end
