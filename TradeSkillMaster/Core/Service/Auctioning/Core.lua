-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Auctioning = TSM:NewPackage("Auctioning")
local private = {}
local L = TSM.L
local OPERATION_DEFAULTS = {
	-- general
	matchStackSize = nil,
	blacklist = "",
	ignoreLowDuration = 0,
	-- post
	stackSize = 1,
	stackSizeIsCap = nil,
	postCap = 5,
	keepQuantity = 0,
	keepQtySources = {},
	maxExpires = 0,
	duration = 24,
	bidPercent = 1,
	undercut = 1,
	minPrice = "max(0.25*avg(crafting,dbmarket,dbregionmarketavg),1.5*vendorsell)",
	maxPrice = "max(5*avg(crafting,dbmarket,dbregionmarketavg),30*vendorsell)",
	normalPrice = "max(2*avg(crafting,dbmarket,dbregionmarketavg),12*vendorsell)",
	priceReset = "none",
	aboveMax = "normalPrice",
	-- cancel
	cancelUndercut = true,
	keepPosted = 0,
	cancelRepost = true,
	cancelRepostThreshold = 10000,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Auctioning.OnInitialize()
	TSM.Operations.Register("Auctioning", OPERATION_DEFAULTS, 20, private.GetOperationInfo)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOperationInfo(operationSettings)
	local parts = TSMAPI_FOUR.Util.AcquireTempTable()

	-- get the post string
	if operationSettings.postCap == 0 then
		tinsert(parts, L["No posting."])
	else
		tinsert(parts, format(L["Posting %d stack(s) of %d for %d hours."], operationSettings.postCap, operationSettings.stackSize, operationSettings.duration))
	end

	-- get the cancel string
	if operationSettings.cancelUndercut and operationSettings.cancelRepost then
		tinsert(parts, format(L["Canceling undercut auctions and to repost higher."]))
	elseif operationSettings.cancelUndercut then
		tinsert(parts, format(L["Canceling undercut auctions."]))
	elseif operationSettings.cancelRepost then
		tinsert(parts, format(L["Canceling to repost higher."]))
	else
		tinsert(parts, L["Not canceling."])
	end

	local result = table.concat(parts, " ")
	TSMAPI_FOUR.Util.ReleaseTempTable(parts)
	return result
end
