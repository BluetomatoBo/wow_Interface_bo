-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Sniper = TSM.MainUI.Operations:NewPackage("Sniper")
local L = TSM.L
local private = { currentOperationName = nil }



-- ============================================================================
-- Module Functions
-- ============================================================================

function Sniper.OnInitialize()
	TSM.MainUI.Operations.RegisterModule("Sniper", private.GetSniperOperationSettings)
end



-- ============================================================================
-- Sniper Operation Settings UI
-- ============================================================================

function private.GetSniperOperationSettings(operationName)
	private.currentOperationName = operationName
	local operation = TSM.operations.Sniper[private.currentOperationName]
	return TSMAPI_FOUR.UI.NewElement("Frame", "content")
		:SetLayout("VERTICAL")
		:AddChild(TSMAPI_FOUR.UI.NewElement("Texture", "line")
			:SetStyle("color", "#9d9d9d")
			:SetStyle("height", 2)
			:SetStyle("margin", { top = 24 })
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("ScrollFrame", "settings")
			:SetStyle("background", "#1e1e1e")
			:SetStyle("padding", { left = 16, right = 16, top = -8 })
			:AddChild(TSM.MainUI.Operations.CreateHeadingLine("settings", L["Sniper Settings"]))
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("belowPrice", L["Below custom price:"]))
			:AddChild(TSMAPI_FOUR.UI.NewElement("Input", "input")
				:SetStyle("height", 26)
				:SetStyle("background", "#5c5c5c")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 16)
				:SetStyle("justifyH", "LEFT")
				:SetStyle("textColor", "#ffffff")
				:SetDisabled(operation.relationships.belowPrice and true or false)
				:SetSettingInfo(operation, "belowPrice", TSM.MainUI.Operations.CheckCustomPrice)
				:SetText(TSMAPI_FOUR.Money.ToString(operation.belowPrice, "OPT_DISABLE") or operation.belowPrice)
			)
			:AddChild(TSM.MainUI.Operations.GetOperationManagementElements("Sniper", private.currentOperationName))
		)
end
