-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Shopping = TSM:NewPackage("Shopping")
local private = {}
local L = TSM.L
local OPERATION_DEFAULTS = {
	restockQuantity = 0,
	maxPrice = 1,
	evenStacks = nil,
	showAboveMaxPrice = nil,
	includeInSniper = nil,
	restockSources = {},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Shopping.OnInitialize()
	TSM.Operations.Register("Shopping", OPERATION_DEFAULTS, 1, private.GetOperationInfo)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOperationInfo(operationSettings)
	if operationSettings.showAboveMaxPrice and operationSettings.evenStacks then
		return format(L["Shopping for even stacks including those above the max price"])
	elseif operationSettings.showAboveMaxPrice then
		return format(L["Shopping for auctions including those above the max price."])
	elseif operationSettings.evenStacks then
		return format(L["Shopping for even stacks with a max price set."])
	else
		return format(L["Shopping for auctions with a max price set."])
	end
end
