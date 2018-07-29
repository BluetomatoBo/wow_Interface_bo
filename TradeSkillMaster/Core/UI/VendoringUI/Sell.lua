-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Sell = TSM.UI.VendoringUI:NewPackage("Sell")
local L = TSM.L
local private = {
	filterText = "",
	query = nil,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Sell.OnInitialize()
	TSM.UI.VendoringUI.RegisterTopLevelPage(L["Sell"], "iconPack.24x24/Auctions", private.GetFrame)
end



-- ============================================================================
-- Sell UI
-- ============================================================================

function private.GetFrame()
	private.filterText = ""
	if private.query then
		TSM.Vendoring.Sell.ResetBagsQuery(private.query)
	else
		private.query = TSM.Vendoring.Sell.CreateBagsQuery()
	end

	return TSMAPI_FOUR.UI.NewElement("Frame", "sell")
		:SetLayout("VERTICAL")
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "header")
			:SetLayout("VERTICAL")
			:SetStyle("background", "#272727")
			:SetStyle("padding.top", 33)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "ignoreText")
				:SetStyle("height", 34)
				:SetStyle("margin.left", 8)
				:SetStyle("margin.right", 8)
				:SetStyle("margin.bottom", 8)
				:SetStyle("fontSpacing", 4)
				:SetStyle("font", TSM.UI.Fonts.MontserratRegular)
				:SetStyle("fontHeight", 12)
				:SetText(L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."])
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "filters")
				:SetLayout("HORIZONTAL")
				:SetStyle("height", 32)
				:SetStyle("padding.bottom", 12)
				:SetStyle("padding.left", 8)
				:SetStyle("padding.right", 8)
				:AddChild(TSMAPI_FOUR.UI.NewElement("SearchInput", "searchInput")
					:SetStyle("margin.right", 8)
					:SetHintText(L["Search Bags"])
					:SetScript("OnTextChanged", private.SearchInputOnTextChanged)
				)
				:AddChild(TSMAPI_FOUR.UI.NewElement("Button", "filterBtn")
					:SetStyle("autoWidth", true)
					:SetStyle("margin.right", 4)
					:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
					:SetStyle("fontHeight", 12)
					:SetText(FILTERS)
					-- TODO
					-- :SetScript("OnClick", private.FilterButtonOnClick)
				)
				:AddChild(TSMAPI_FOUR.UI.NewElement("Button", "filterBtnIcon")
					:SetStyle("width", 14)
					:SetStyle("height", 14)
					:SetStyle("backgroundTexturePack", "iconPack.14x14/Filter")
					-- TODO
					-- :SetScript("OnClick", private.FilterButtonOnClick)
				)
			)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Texture")
			:SetStyle("height", 2)
			:SetStyle("color", "#585858")
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("QueryScrollingTable", "items")
			:SetStyle("rowHeight", 20)
			:SetStyle("headerBackground", "#404040")
			:SetStyle("headerFont", TSM.UI.Fonts.MontserratMedium)
			:SetStyle("headerFontHeight", 14)
			:GetScrollingTableInfo()
				:NewColumn("item")
					:SetTitles(L["Item"])
					:SetIconSize(12)
					:SetFont(TSM.UI.Fonts.FRIZQT)
					:SetFontHeight(12)
					:SetJustifyH("LEFT")
					:SetTextInfo("itemString", private.GetItemText)
					:SetIconInfo("itemString", TSMAPI_FOUR.Item.GetTexture)
					:SetTooltipInfo("itemString")
					:SetSortInfo("name")
					:SetTooltipLinkingDisabled(true)
					:Commit()
				:NewColumn("vendorSell")
					:SetTitles(L["Vendor Sell"])
					:SetWidth(100)
					:SetFont(TSM.UI.Fonts.RobotoMedium)
					:SetFontHeight(12)
					:SetJustifyH("RIGHT")
					:SetTextInfo("vendorSell", private.GetVendorSellText)
					:SetSortInfo("vendorSell")
					:Commit()
				:NewColumn("potential")
					:SetTitles(L["Potential"])
					:SetWidth(100)
					:SetFont(TSM.UI.Fonts.RobotoMedium)
					:SetFontHeight(12)
					:SetJustifyH("RIGHT")
					:SetTextInfo("potentialValue", private.GetPotentialText)
					:SetSortInfo("potentialValue")
					:Commit()
				:SetCursor("BUY_CURSOR")
				:Commit()
			:SetQuery(private.query)
			:SetScript("OnRowClick", private.RowOnClick)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "footer")
			:SetLayout("HORIZONTAL")
			:SetStyle("height", 26)
			:SetStyle("margin.top", 8)
			:SetStyle("margin.bottom", -2)
			:AddChild(TSMAPI_FOUR.UI.NewElement("ActionButton", "sellTrashBtn")
				:SetStyle("width", 127)
				:SetStyle("margin.right", 8)
				:SetText(L["SELL TRASH"])
				:SetScript("OnClick", private.SellTrashBtnOnClick)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("ActionButton", "sellBOEBtn")
				:SetStyle("width", 127)
				:SetStyle("margin.right", 8)
				:SetText(L["SELL BOES"])
				:SetScript("OnClick", private.SellBOEBtnOnClick)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("ActionButton", "sellAllBtn")
				:SetText(L["SELL ALL"])
				:SetScript("OnClick", private.SellAllBtnOnClick)
			)
		)
		:SetScript("OnUpdate", private.FrameOnUpdate)
		:SetScript("OnHide", private.FrameOnHide)
end

function private.GetItemText(itemString)
	return TSM.UI.GetColoredItemName(itemString) or "?"
end

function private.GetVendorSellText(vendorSell)
	return vendorSell > 0 and TSMAPI_FOUR.Money.ToString(vendorSell, "OPT_PAD", "OPT_SEP") or ""
end

function private.GetPotentialText(potentialValue)
	return TSMAPI_FOUR.Money.ToString(potentialValue, "OPT_PAD", "OPT_SEP") or ""
end



-- ============================================================================
-- Local Script Handlers
-- ============================================================================

function private.FrameOnUpdate(frame)
	frame:SetScript("OnUpdate", nil)
	local baseFrame = frame:GetBaseElement()
	baseFrame:SetStyle("bottomPadding", 32)
	baseFrame:Draw()
end

function private.FrameOnHide(frame)
	local baseFrame = frame:GetBaseElement()
	baseFrame:SetStyle("bottomPadding", nil)
	baseFrame:Draw()
	OpenStackSplitFrame()
end

function private.SearchInputOnTextChanged(input)
	local text = strtrim(input:GetText())
	if text == private.filterText then
		return
	end
	private.filterText = text
	input:SetText(private.filterText)

	TSM.Vendoring.Sell.ResetBagsQuery(private.query)
	if text ~= "" then
		private.query:Matches("name", TSMAPI_FOUR.Util.StrEscape(text))
	end
	input:GetElement("__parent.__parent.__parent.items"):UpdateData(true)
end

function private.RowOnClick(_, row, mouseButton)
	local itemString = row:GetField("itemString")
	if mouseButton == "RightButton" then
		TSM.Vendoring.Sell.SellItem(itemString)
	elseif IsShiftKeyDown() then
		TSM.Vendoring.Sell.IgnoreItemPermanent(itemString)
	else
		TSM.Vendoring.Sell.IgnoreItemSession(itemString)
	end
end

function private.SellTrashBtnOnClick(button)
	for _, row in private.query:Iterator() do
		local itemString, quality = row:GetFields("itemString", "quality")
		if quality == LE_ITEM_QUALITY_POOR then
			TSM.Vendoring.Sell.SellItem(itemString)
		end
	end
end

function private.SellBOEBtnOnClick(button)
	for _, row in private.query:Iterator() do
		local itemString = row:GetField("itemString")
		if TSMAPI_FOUR.Item.IsDisenchantable(itemString) then
			TSM.Vendoring.Sell.SellItem(itemString)
		end
	end
end

function private.SellAllBtnOnClick(button)
	for _, row in private.query:Iterator() do
		TSM.Vendoring.Sell.SellItem(row:GetField("itemString"))
	end
end
