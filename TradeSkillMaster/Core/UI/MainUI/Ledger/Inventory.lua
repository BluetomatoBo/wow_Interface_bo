-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Inventory = TSM.MainUI.Ledger:NewPackage("Inventory")
local L = TSM.L
local private = {
	query = nil,
	characterList = {},
	characterFilter = ALL,
	guildList = {},
	guildFilter = "",
	groupList = {},
	groupFilter = "",
	valuePriceSource = "dbmarket",
	totalValueString = TSMAPI_FOUR.Money.ToString("0", "OPT_PAD", "OPT_SEP")
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Inventory.OnInitialize()
	TSM.MainUI.Ledger.RegisterPage(L["Inventory"], private.DrawInventoryPage)
end



-- ============================================================================
-- Inventory UI
-- ============================================================================

function private.DrawInventoryPage()
	if true then
		return TSMAPI_FOUR.UI.NewElement("Frame", "content")
			:SetLayout("VERTICAL")
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "text")
				:SetStyle("justifyH", "CENTER")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 20)
				:SetText("Inventory Viewer is coming soon!")
			)
	end
	-- luacheck: ignore 511

	for guild in pairs(TSMAPI_FOUR.PlayerInfo.GetGuilds()) do
		tinsert(private.guildList, guild)
	end

	wipe(private.groupList)
	TSM.Groups:GetSortedGroupPathList(private.groupList)

	-- private.UpdateQuery()

	return TSMAPI_FOUR.UI.NewElement("Frame", "content")
		:SetLayout("VERTICAL")
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "firstRow")
			:SetLayout("HORIZONTAL")
			:SetStyle("height", 14)
			:SetStyle("padding.left", 8)
			:SetStyle("padding.right", 8)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "search")
				:SetStyle("margin.right", 16)
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 10)
				:SetText(L["ITEM SEARCH"])
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "group")
				:SetStyle("margin.right", 16)
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 10)
				:SetText(strupper(GROUP))
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "characters")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 10)
				:SetText(L["CHARACTERS"])
			)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "firstRowFields")
			:SetLayout("HORIZONTAL")
			:SetStyle("height", 26)
			:SetStyle("margin.top", 4)
			:SetStyle("margin.bottom", 24)
			:SetStyle("padding.left", 8)
			:SetStyle("padding.right", 8)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Input", "searchInput")
				:SetStyle("margin.right", 16)
				:SetHintText(L["Search for Item"])
				:SetStyle("hintTextColor", "#e2e2e2")
				:SetStyle("hintJustifyH", "LEFT")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetScript("OnEnterPressed", private.SearchFilterChanged)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("SelectionDropdown", "groupInput")
				:SetStyle("margin.right", 16)
				:SetHintText(L["None"])
				:SetItems(private.groupList)
				:SetScript("OnSelectionChanged", private.GroupDropdownOnSelectionChanged)
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("SelectionDropdown", "characterSelect")
				:SetHintText(L["None"])
				:SetItems(private.characterList)
				:SetSelectedItem(private.characterFilter)
				:SetScript("OnSelectionChanged", private.CharacterDropdownOnSelectionChanged)
			)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "secondRow")
			:SetLayout("HORIZONTAL")
			:SetStyle("height", 14)
			:SetStyle("padding.left", 8)
			:SetStyle("padding.right", 8)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "guilds")
				:SetStyle("margin.right", 16)
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 10)
				:SetText(L["GUILDS"])
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "valuePriceSource")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 10)
				:SetText(L["VALUE PRICE SOURCE"])
			)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "secondRowFields")
			:SetLayout("HORIZONTAL")
			:SetStyle("height", 26)
			:SetStyle("margin.top", 4)
			:SetStyle("margin.bottom", 24)
			:SetStyle("padding.left", 8)
			:SetStyle("padding.right", 8)
			:AddChild(TSMAPI_FOUR.UI.NewElement("SelectionDropdown", "guildsInput")
				:SetStyle("margin.right", 16)
				-- :SetScript("OnSelectionChanged", private.RarityDropdownOnSelectionChanged)
				:SetItems(private.guildList)
				:SetHintText(L["None"])
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Input", "valuePriceSourceInput")
				:SetText(private.valuePriceSource)
				-- :SetHintText(L["Search for Item"])
				:SetStyle("hintTextColor", "#e2e2e2")
				:SetStyle("hintJustifyH", "LEFT")
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				-- :SetScript("OnEnterPressed", private.SearchFilterChanged)
			)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "totalValueRow")
			:SetLayout("HORIZONTAL")
			:SetStyle("padding.left", 8)
			:SetStyle("height", 14)
			:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "totalValue")
				:SetStyle("margin.bottom", 24)
				:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("fontHeight", 16)
				:SetText(L["Total Value of All Items: "] .. private.totalValueString)
			)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Frame", "accountingScrollingTableFrame")
			:SetLayout("VERTICAL")
			:AddChild(TSMAPI_FOUR.UI.NewElement("Texture", "line")
				:SetStyle("height", 2)
				:SetStyle("color", "#9d9d9d")
			)
			:AddChild(TSMAPI_FOUR.UI.NewElement("QueryScrollingTable", "scrollingTable")
				:SetStyle("headerBackground", "#404040")
				:SetStyle("headerFont", TSM.UI.Fonts.MontserratMedium)
				:SetStyle("headerFontHeight", 14)
				:GetScrollingTableInfo()
					:NewColumn("item")
						:SetTitles(L["Item"])
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("LEFT")
						-- :SetTextFunction(private.TableGetItemText)
						-- :SetSortValueFunction(private.TableGetItemSortValue)
						:Commit()
					:NewColumn("totalItems")
						:SetTitles(L["Total"])
						:SetWidth(60)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("RIGHT")
						-- :SetTextFunction(private.TableGetPlayerText)
						-- :SetSortValueFunction(private.TableGetPlayerSortValue)
						:Commit()
					:NewColumn("bags")
						:SetTitles(L["Bags"])
						:SetWidth(60)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("LEFT")
						-- :SetTextFunction(private.TableGetTypeText)
						-- :SetSortValueFunction(private.TableGetTypeSortValue)
						:Commit()
					:NewColumn("banks")
						:SetTitles(L["Banks"])
						:SetWidth(60)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("LEFT")
						-- :SetTextFunction(private.TableGetStackText)
						-- :SetSortValueFunction(private.TableGetStackSortValue)
						:Commit()
					:NewColumn("mail")
						:SetTitles(L["Mail"])
						:SetWidth(60)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("LEFT")
						-- :SetTextFunction(private.TableGetAuctionsText)
						-- :SetSortValueFunction(private.TableGetAuctionsSortValue)
						:Commit()
					:NewColumn("guildVault")
						:SetTitles(L["GVault"])
						:SetWidth(60)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("LEFT")
						-- :SetTextFunction(private.TableGetPerItemText)
						-- :SetSortValueFunction(private.TableGetPerItemSortValue)
						:Commit()
					:NewColumn("auctionHouse")
						:SetTitles(L["AH"])
						:SetWidth(60)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("LEFT")
						-- :SetTextFunction(private.TableGetTimeframeText)
						-- :SetSortValueFunction(private.TableGetTimeframeSortValue)
						:Commit()
					:NewColumn("totalValue")
						:SetTitles(L["Total Value"])
						:SetWidth(120)
						:SetFont(TSM.UI.Fonts.FRIZQT)
						:SetFontHeight(12)
						:SetJustifyH("RIGHT")
						-- :SetTextFunction(private.TableGetTimeframeText)
						-- :SetSortValueFunction(private.TableGetTimeframeSortValue)
						:Commit()
					:Commit()
				-- :SetQuery(private.query)

			)
		)
end



-- ============================================================================
-- Local Script Handlers
-- ============================================================================

function private.DropdownChangedCommon(dropdown)
	-- private.UpdateQuery()
	-- dropdown:GetElement("__parent.__parent.accountingScrollingTableFrame.scrollingTable")
	-- 	:SetQuery(private.query, true)
end

function private.CharacterDropdownOnSelectionChanged(dropdown)
	private.characterFilter = dropdown:GetSelectedItem()
	private.DropdownChangedCommon(dropdown)
end

function private.GroupDropdownOnSelectionChanged(dropdown)
	private.groupFilter = dropdown:GetSelectedItem()
	private.DropdownChangedCommon(dropdown)
end

function private.SearchFilterChanged(dropdown)
	private.searchInput = dropdown:GetSelectedItem()
	private.DropdownChangedCommon(dropdown)
end
