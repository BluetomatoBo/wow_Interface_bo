-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Crafting = TSM.MainUI.Operations:NewPackage("Crafting")
local L = TSM.L
local private = { currentOperationName = nil }



-- ============================================================================
-- Module Functions
-- ============================================================================

function Crafting.OnInitialize()
	TSM.MainUI.Operations.RegisterModule("Crafting", private.GetCraftingOperationSettings)
end



-- ============================================================================
-- Crafting Operation Settings UI
-- ============================================================================

function private.GetCraftingOperationSettings(operationName)
	private.currentOperationName = operationName
	local operation = TSM.Operations.GetSettings("Crafting", private.currentOperationName)
	return TSMAPI_FOUR.UI.NewElement("Frame", "content")
		:SetLayout("VERTICAL")
		:AddChild(TSMAPI_FOUR.UI.NewElement("Texture", "line")
			:SetStyle("color", "#9d9d9d")
			:SetStyle("height", 2)
			:SetStyle("margin.top", 24)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("ScrollFrame", "settings")
			:SetStyle("background", "#1e1e1e")
			:SetStyle("padding.left", 16)
			:SetStyle("padding.right", 16)
			:SetStyle("padding.top", -8)
			:AddChild(TSM.MainUI.Operations.CreateHeadingLine("restockQuantity", L["Restock Quantity Settings"]))
			:AddChild(private.CreateNumericInputLine("minRestock", L["Minimum restock quantity:"], 1, 2000))
			:AddChild(private.CreateNumericInputLine("maxRestock", L["Maximum restock quantity:"], 1, 2000))
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("minProfit", L["Set minimum profit?"])
				:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "minProfitEnabledFrame")
					:SetLayout("HORIZONTAL")
					-- move the right by the width of the toggle so this frame gets half the total width
					:SetStyle("margin.right", -TSM.UI.TexturePacks.GetWidth("uiFrames.ToggleOn"))
					:AddChild(TSMAPI_FOUR.UI.NewElement("ToggleOnOff", "toggle")
						:SetValue(operation.minProfit ~= "")
						:SetDisabled(TSM.Operations.HasRelationship("Crafting", private.currentOperationName, "minProfit"))
						:SetScript("OnValueChanged", private.MinProfitToggleOnValueChanged)
					)
					:AddChild(TSMAPI_FOUR.UI.NewElement("Spacer", "spacer"))
				)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "minProfitInputFrame")
				:SetLayout("VERTICAL")
				:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("minProfit", L["Minimum profit:"], operation.minProfit == "")
					:AddChild(TSMAPI_FOUR.UI.NewElement("Input", "input")
						:SetStyle("background", "#5c5c5c")
						:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
						:SetStyle("fontHeight", 16)
						:SetStyle("justifyH", "LEFT")
						:SetStyle("textColor", "#ffffff")
						:SetDisabled(TSM.Operations.HasRelationship("Crafting", private.currentOperationName, "minProfit") or operation.minProfit == "")
						:SetSettingInfo(operation, "minProfit", TSM.MainUI.Operations.CheckCustomPrice)
						:SetText(TSM.Money.ToString(operation.minProfit) or operation.minProfit)
					)
				)
			)
			:AddChild(TSM.MainUI.Operations.CreateHeadingLine("priceSettings", L["Price Settings"]))
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("craftPriceMethod", L["Override default craft value method?"])
				:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "craftPriceOverrideFrame")
					:SetLayout("HORIZONTAL")
					-- move the right by the width of the toggle so this frame gets half the total width
					:SetStyle("margin.right", -TSM.UI.TexturePacks.GetWidth("uiFrames.ToggleOn"))
					:AddChild(TSMAPI_FOUR.UI.NewElement("ToggleOnOff", "toggle")
						:SetValue(operation.craftPriceMethod ~= "")
						:SetDisabled(TSM.Operations.HasRelationship("Crafting", private.currentOperationName, "craftPriceMethod"))
						:SetScript("OnValueChanged", private.CraftPriceToggleOnValueChanged)
					)
					:AddChild(TSMAPI_FOUR.UI.NewElement("Spacer", "spacer"))
				)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "craftPriceLabel")
				:SetStyle("height", 26)
				:SetStyle("fontHeight", 14)
				:SetStyle("textColor", (TSM.Operations.HasRelationship("Crafting", private.currentOperationName, "craftPriceMethod") or operation.craftPriceMethod == "") and "#424242" or "#e2e2e2")
				:SetText(L["Craft value method:"])
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Input", "craftPriceInput")
				:SetStyle("height", 26)
				:SetStyle("background", "#5c5c5c")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 16)
				:SetStyle("justifyH", "LEFT")
				:SetStyle("textColor", "#ffffff")
				:SetDisabled(TSM.Operations.HasRelationship("Crafting", private.currentOperationName, "craftPriceMethod") or operation.craftPriceMethod == "")
				:SetSettingInfo(operation, "craftPriceMethod", TSM.MainUI.Operations.CheckCustomPrice)
				:SetText(TSM.Money.ToString(operation.craftPriceMethod) or operation.craftPriceMethod or TSM.db.global.craftingOptions.defaultCraftPriceMethod)
			)
			:AddChild(TSM.MainUI.Operations.GetOperationManagementElements("Crafting", private.currentOperationName))
		)
end

function private.CreateNumericInputLine(key, label, minValue, maxValue)
	local operation = TSM.Operations.GetSettings("Crafting", private.currentOperationName)
	local hasRelationship = TSM.Operations.HasRelationship("Crafting", private.currentOperationName, key)
	return TSM.MainUI.Operations.CreateLinkedSettingLine(key, label)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", key.."Frame")
			:SetLayout("HORIZONTAL")
			-- move the right by the width of the input box so this frame gets half the total width
			:SetStyle("margin.right", -112)
			:AddChild(TSMAPI_FOUR.UI.NewElement("InputNumeric", "input")
				:SetStyle("width", 96)
				:SetStyle("height", 24)
				:SetStyle("margin.right", 16)
				:SetStyle("justifyH", "CENTER")
				:SetStyle("font", TSM.UI.Fonts.MontserratBold)
				:SetStyle("fontHeight", 16)
				:SetDisabled(hasRelationship)
				:SetSettingInfo(operation, key)
				:SetMaxNumber(maxValue)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "maxLabel")
				:SetStyle("fontHeight", 12)
				:SetText(format(L["(min %d - max %d)"], minValue, maxValue))
				:SetStyle("textColor", hasRelationship and "#424242" or "#e2e2e2")
			)
		)
end



-- ============================================================================
-- Local Script Handlers
-- ============================================================================

function private.MinProfitToggleOnValueChanged(toggle, value)
	local operation = TSM.Operations.GetSettings("Crafting", private.currentOperationName)
	operation.minProfit = value and TSM.Operations.GetSettingDefault("Crafting", "minProfit") or ""
	local settingsFrame = toggle:GetParentElement():GetParentElement():GetParentElement()
	settingsFrame:GetElement("minProfitInputFrame.minProfit.left.linkBtn")
		:SetStyle("backgroundVertexColor", value and "#ffffff" or "#424242")
		:SetDisabled(not value)
	settingsFrame:GetElement("minProfitInputFrame.minProfit.left.label")
		:SetStyle("textColor", value and "#e2e2e2" or "#424242")
	settingsFrame:GetElement("minProfitInputFrame.minProfit.input")
		:SetDisabled(not value)
		:SetText(TSM.Money.ToString(operation.minProfit) or operation.minProfit)
	settingsFrame:Draw()
end

function private.CraftPriceToggleOnValueChanged(toggle, value)
	local operation = TSM.Operations.GetSettings("Crafting", private.currentOperationName)
	operation.craftPriceMethod = value and TSM.db.global.craftingOptions.defaultCraftPriceMethod or ""
	local settingsFrame = toggle:GetParentElement():GetParentElement():GetParentElement()
	settingsFrame:GetElement("craftPriceLabel")
		:SetStyle("textColor", value and "#e2e2e2" or "#424242")
	settingsFrame:GetElement("craftPriceInput")
		:SetDisabled(not value)
		:SetText(operation.craftPriceMethod ~= "" and operation.craftPriceMethod or TSM.db.global.craftingOptions.defaultCraftPriceMethod)
	settingsFrame:Draw()
end
