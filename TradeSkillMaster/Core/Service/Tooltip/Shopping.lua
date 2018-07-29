-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Shopping = TSM.Tooltip:NewPackage("Shopping")
local L = TSM.L
local private = {}
local DEFAULTS = {
	maxPrice = false,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Shopping.OnInitialize()
	TSM.Tooltip.Register("Shopping", DEFAULTS, private.LoadTooltip)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.LoadTooltip(tooltip, itemString, options)
	if not options.maxPrice then
		-- only 1 tooltip option
		return
	end
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString, true)

	local operationName = TSMAPI.Operations:GetFirstByItem(itemString, "Shopping")
	if not operationName or not TSM.operations.Shopping[operationName] then
		return
	end
	TSMAPI.Operations:Update("Shopping", operationName)

	local maxPrice = TSMAPI_FOUR.CustomPrice.GetValue(TSM.operations.Shopping[operationName].maxPrice, itemString)
	if maxPrice then
		tooltip:AddItemValueLine(L["Max Shopping Price"], maxPrice)
	end
end
