-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Vendoring = TSM:NewPackage("Vendoring")
local private = {}
local L = TSM.L
local OPERATION_DEFAULTS = {
	qsPreference = 1,
	sellAfterExpired = 20,
	sellSoulbound = false,
	keepQty = 0,
	restockQty = 0,
	restockSources = {},
	enableBuy = true,
	enableSell = true,
	vsMarketValue = "dbmarket",
	vsMaxMarketValue = "0c",
	vsDestroyValue = "Destroy",
	vsMaxDestroyValue = "0c",
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Vendoring.OnInitialize()
	TSM.Operations.Register("Vendoring", OPERATION_DEFAULTS, 1, private.GetOperationInfo)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOperationInfo(operationSettings)
	local parts = TSMAPI_FOUR.Util.AcquireTempTable()
	if operationSettings.enableBuy and operationSettings.restockQty > 0 then
		tinsert(parts, format(L["Restocking to %d."], operationSettings.restockQty))
	end

	if operationSettings.enableSell then
		if operationSettings.keepQty > 0 then
			tinsert(parts, format(L["Keeping %d."], operationSettings.keepQty))
		end
		if operationSettings.sellSoulbound then
			tinsert(parts, L["Selling soulbound items."])
		end
	end

	local result = table.concat(parts, " ")
	TSMAPI_FOUR.Util.ReleaseTempTable(parts)
	return result
end
