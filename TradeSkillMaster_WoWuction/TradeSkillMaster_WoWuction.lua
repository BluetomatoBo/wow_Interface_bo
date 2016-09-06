-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_WoWuction                           --
--           http://www.curse.com/addons/wow/tradeskillmaster_wowuction           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- register this file with Ace Libraries
local TSM = select(2, ...)
TSM = LibStub("AceAddon-3.0"):NewAddon(TSM, "TSM_WoWuction")


function TSM:OnInitialize()
	StaticPopupDialogs["TSM_WOWUCTION_EOL_POPUP"] = {
		text = "|cffff0000WARNING:|r TSM_WoWuction is no longer supported and will be disabled. All WoWuction prices will automatically point to TSM_AuctionDB prices for now, but you should update your prices accordingly. For more info, visit:",
		button1 = OKAY,
		timeout = 0,
		hideOnEscape = false,
		hasEditBox = true,
		OnShow = function(self)
			self.editBox:SetText("http://bit.ly/tsmwuend")
		end,
	}
	TSMAPI.Util:ShowStaticPopupDialog("TSM_WOWUCTION_EOL_POPUP")
	DisableAddOn("TradeSkillMaster_WoWuction")
end