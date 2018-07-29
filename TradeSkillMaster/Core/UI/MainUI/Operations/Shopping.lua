-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Shopping = TSM.MainUI.Operations:NewPackage("Shopping")
local L = TSM.L
local private = { currentOperationName = nil }
local RESTOCK_SOURCES = { bank = BANK, guild = GUILD, alts = L["Alts"], auctions = L["Auctions"] }
local RESTOCK_SOURCES_ORDER = { "alts", "auctions", "bank", "guild" }



-- ============================================================================
-- Module Functions
-- ============================================================================

function Shopping.OnInitialize()
	TSM.MainUI.Operations.RegisterModule("Shopping", private.GetShoppingOperationSettings)
end



-- ============================================================================
-- Shopping Operation Settings UI
-- ============================================================================

function private.GetShoppingOperationSettings(operationName)
	private.currentOperationName = operationName
	local operation = TSM.operations.Shopping[private.currentOperationName]
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
			:AddChild(TSM.MainUI.Operations.CreateHeadingLine("generalOptions", L["General Options"]))
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("maxAuctionPrice", L["Maximum Auction Price (Per Item)"]))
			:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "maxPriceFrame")
				:SetLayout("HORIZONTAL")
				:SetStyle("height", 20)
				:SetStyle("margin", { bottom = 16 })
				:AddChild(TSMAPI_FOUR.UI.NewElement("Input", "maxPriceInput")
					:SetStyle("background", "#1ae2e2e2")
					:SetStyle("textColor", "#ffffff")
					:SetStyle("margin", { right = 10 })
					:SetStyle("height", 24)
					:SetStyle("justifyH", "LEFT")
					:SetText(TSMAPI_FOUR.Money.ToString(operation.maxPrice) or operation.maxPrice)
					:SetSettingInfo(operation, "maxPrice", TSM.MainUI.Operations.CheckCustomPrice)
				)
			)
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("aboveMaxPrice", L["Show auctions above max price?"])
				:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "showAboveMaxPriceSettingFrame")
					:SetLayout("HORIZONTAL")
					-- move the right by the width of the toggle so this frame gets half the total width
					:SetStyle("margin", { right = -TSM.UI.TexturePacks.GetWidth("uiFrames.ToggleOn") })
					:AddChild(TSMAPI_FOUR.UI.NewElement("ToggleOnOff", "showAboveMaxPrice")
						:SetSettingInfo(operation, "showAboveMaxPrice")
					)
					:AddChild(TSMAPI_FOUR.UI.NewElement("Spacer", "spacer"))
				)
			)
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("neatStacks", L["Neat Stacks only?"])
				:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "evenStacksSettingFrame")
					:SetLayout("HORIZONTAL")
					-- move the right by the width of the toggle so this frame gets half the total width
					:SetStyle("margin", { right = -TSM.UI.TexturePacks.GetWidth("uiFrames.ToggleOn") })
					:AddChild(TSMAPI_FOUR.UI.NewElement("ToggleOnOff", "evenStacks")
						:SetSettingInfo(operation, "evenStacks")
					)
					:AddChild(TSMAPI_FOUR.UI.NewElement("Spacer", "spacer"))
				)
			)
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("restockFrame", L["Maximum restock quantity:"])
				:SetLayout("HORIZONTAL")
				:SetStyle("margin", { right = -112, bottom = 16 })
				:AddChild(TSMAPI_FOUR.UI.NewElement("InputNumeric", "restockInput")
					:SetStyle("margin", { right = 10 })
					:SetStyle("width", 96)
					:SetStyle("height", 24)
					:SetStyle("margin", { right = 16 })
					:SetStyle("justifyH", "CENTER")
					:SetStyle("font", TSM.UI.Fonts.MontserratBold)
					:SetStyle("fontHeight", 16)
					:SetSettingInfo(operation, "restockQuantity")
					:SetMaxNumber(10000)
				)
				:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "restockLabel")
					:SetText(L["(min 0 - max 10000)"])
					:SetStyle("fontHeight", 14)
				)
			)
			:AddChild(TSM.MainUI.Operations.CreateLinkedSettingLine("restockSourcesFrame", L["Sources to include for restock:"])
				:AddChild(TSMAPI_FOUR.UI.NewElement("Dropdown", "restockSourcesDropdown")
					:SetMultiselect(true)
					:SetDictionaryItems(RESTOCK_SOURCES, operation.restockSources, RESTOCK_SOURCES_ORDER)
					:SetSettingInfo(operation, "restockSources")
				)
			)
			:AddChild(TSM.MainUI.Operations.GetOperationManagementElements("Shopping", private.currentOperationName))
		)
end
