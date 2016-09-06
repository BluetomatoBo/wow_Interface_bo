-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_Additions                           --
--           http://www.curse.com/addons/wow/tradeskillmaster_additions           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- register this file with Ace Libraries
local TSM = select(2, ...)
TSM = LibStub("AceAddon-3.0"):NewAddon(TSM, "TSM_Additions")

function TSM:OnInitialize()
	DisableAddOn("TradeSkillMaster_Additions")
	StaticPopupDialogs["TSMAdditionsRemoved"] = {
		text = "TradeSkillMaster_Additions is no longer part of the TSM suite as its functionality has been merged into the core addon. It has been automatically disabled, but please uninstall it.",
		button1 = OKAY,
		timeout = 0,
	}
	TSMAPI.Util:ShowStaticPopupDialog("TSMAdditionsRemoved")
end