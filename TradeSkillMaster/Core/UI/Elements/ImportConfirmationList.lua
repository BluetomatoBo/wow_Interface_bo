-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local ImportConfirmationList = TSMAPI_FOUR.Class.DefineClass("ImportConfirmationList", TSM.UI.ScrollList)
local L = TSM.L
TSM.UI.ImportConfirmationList = ImportConfirmationList
local private = {}

local stylesheet = {
	LINE_COLOR = "#e2e2e2",
	BANANA_YELLOW = "#ffd839",
	GROUP_LABEL_COLOR = "#e2e2e2",
	TEXTCOLOR = "#e2e2e2",
	HIGHLIGHT_TEXT_COLOR = "#ff000000",
}

-- ============================================================================
-- Public Class Methods
-- ============================================================================

function ImportConfirmationList.__init(self)
	self.__super:__init()

	self._sections = {}
	self._hidden = {}
	self._itemGroup = {}
	self._groupLabel = {}
	self._sectionLabel = {}
	self._operationModules = {}
	self._operationName = {}

	self._importer = nil
	self._onSelectionChangedHandler = nil
end


function ImportConfirmationList.Release(self)
	private._WipeTables(self)
	self._onSelectionChangedHandler = nil
	self._importer = nil
	self.__super:Release()
end


function ImportConfirmationList.SetImporter(self, importer, redraw)
	wipe(self._data)
	private._WipeTables(self)

	self._importer = importer

	private._AddSectionLabel(self, "GROUPS_HEADER", L["Imported Items"])
	local groups = importer.groups
	for _, groupPath in pairs(groups) do
		private._AddGroupLabel(self, groupPath)
		local items = importer:ItemsForGroup(groupPath)
		for _, itemString in pairs(items) do
			private._AddItem(self, itemString, groupPath)
		end
	end

	private._AddSectionLabel(self, "OPERATIONS_HEADER", L["Imported Operations"])
	local modulesByOperation = importer:GetModulesByOperation()
	for name, modules in pairs(modulesByOperation) do
		private._AddOperation(self, name, modules)
	end

	if redraw then
		self:Draw()
	end

	return self
end

function ImportConfirmationList.IsItemSelected(self, item)
	return false
end

function ImportConfirmationList.ClearSelection(self)
	if self._onSelectionChangedHandler then
		self:_onSelectionChangedHandler(0)
	end
	self:_DrawRows()
end

function ImportConfirmationList.SetScript(self, script, handler)
	if script == "OnSelectionChanged" then
		self._onSelectionChangedHandler = handler
	else
		error("Unknown ImportConfirmationList script: "..tostring(script))
	end
	return self
end



-- ============================================================================
-- Private Class Methods
-- ============================================================================

function private._WipeTables(self)
	wipe(self._sections)
	wipe(self._hidden)
	wipe(self._sectionLabel)
	wipe(self._groupLabel)
	wipe(self._itemGroup)
	wipe(self._operationModules)
	wipe(self._operationName)
end

function private._AddSectionLabel(self, marker, label)
	tinsert(self._data, marker)
	self._sections[marker] = marker
	self._sectionLabel[marker] = label
	self._lastSection = marker
end

function private._AddGroupLabel(self, path)
	tinsert(self._data, path)
	local fullPath = self._importer:JoinPath(path)
	self._groupLabel[path] = "Placed in Root > " .. gsub(fullPath, TSM.CONST.GROUP_SEP, " > ")
	self._sections[path] = self._lastSection
	self._lastGroup = path
end

function private._AddItem(self, itemString, groupPath)
	tinsert(self._data, itemString)
	self._itemGroup[itemString] = groupPath
	self._sections[itemString] = self._lastSection
end

function private._AddOperation(self, label, modules)
	local key = private._GetOperationKey(self, label)

	tinsert(self._data, key)
	self._operationName[key] = label
	self._operationModules[key] = modules
	self._sections[key] = self._lastSection
end

function private._GetOperationKey(self, label)
	return TSM.CONST.GROUP_SEP..label
end

function ImportConfirmationList._IsDataHidden(self, data)
	local section = self._sections[data]

	if section == data then
		return self.__super:_IsDataHidden(data)
	end

	-- this whole block is for items
	local group = self._itemGroup[data]
	if group then
		if self._hidden[group] then
			return true
		end
		if self._hidden[self._sections[group]] then
			return true
		end
		return self.__super:_IsDataHidden(data)
	end

	local operation = self._operationName[data]
	if operation then
		if self._hidden[self._sections[data]] then
			return true
		end
		return self.__super:_IsDataHidden(data)
	end

	if section and self._hidden[section] then
		return true
	end

	return self.__super:_IsDataHidden(data)
end

function ImportConfirmationList._CreateRow(self)
	local row = self.__super:_CreateRow()
		:SetLayout("HORIZONTAL")
		:SetStyle("padding", 10)
		:SetStyle("height", self:_GetStyle("rowHeight"))
		:SetScript("OnUpdate", private.RowOnUpdate)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Button", "expander")
			:SetScript("OnClick", private.RowOnClick)
			:SetStyle("margin", { right = 4 })
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "text")
			:SetStyle("justifyH", "LEFT")
			:SetStyle("autoWidth", true)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "subText")
			:SetStyle("justifyH", "LEFT")
			:SetStyle("textColor", "#e2e2e2")
			:SetStyle("fontHeight", 16)
			:SetStyle("autoWidth", true)
			:SetStyle("margin", { left = 8 })
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Spacer", "spacer"))
		:AddChild(TSMAPI_FOUR.UI.NewElement("ActionButton", "cancelButton")
			:SetStyle("width", 68)
			:SetStyle("height", 26)
			:SetText(CANCEL)
			:SetStyle("font", TSM.UI.Fonts.MontserratMedium)
			:SetStyle("fontHeight", 14)
			:SetStyle("height", 15)
			:SetScript("OnClick", private.RowOnClick)
		)
	return row
end

function ImportConfirmationList._DrawRow(self, row, dataIndex)
	local item = row:GetContext()

	local isSection = self._sections[item] == item
	local isGroup = self._groupLabel[item]
	local isOperation = self._operationName[item]
	local isItem = not isSection and not isGroup and not isOperation
	local isCollapsable = not isItem and not isOperation
	local isCollapsed = isCollapsable and self._hidden[item]

	local cancelButton = row:GetElement("cancelButton")
	local text = row:GetElement("text")
	text:SetStyle("height", self:_GetStyle("rowHeight"))
	local subText = row:GetElement("subText")

	if isCollapsable then
		text:SetStyle("font", TSM.UI.Fonts.MontserratBold)
		if isSection then
			text:SetText(self._sectionLabel[item])
				:SetStyle("textColor", stylesheet.BANANA_YELLOW)
				:SetStyle("fontHeight", 18)
			if item == "GROUPS_HEADER" then
				cancelButton:Hide()
			elseif item == "OPERATIONS_HEADER" then
				cancelButton:Show()
				cancelButton:SetScript("OnClick", private.OperationsCancelClick)
			end
			subText:Hide()
		elseif isGroup then
			text:SetText(self._groupLabel[item])
				:SetStyle("textColor", stylesheet.TEXTCOLOR)
			subText:SetText(L["(New group(s) will be created)"])
				:Show()
			cancelButton:Show()
			cancelButton:SetScript("OnClick", private.GroupCancelClick)
		end

		local texturePack = self:_GetStyle(isCollapsed and "expanderCollapsedBackgroundTexturePack" or "expanderExpandedBackgroundTexturePack")
		row:GetElement("expander")
			:SetStyle("width", TSM.UI.TexturePacks.GetWidth(texturePack))
			:SetStyle("height", TSM.UI.TexturePacks.GetHeight(texturePack))
			:SetStyle("backgroundTexturePack", texturePack)
			:Show()
	elseif isOperation then
		text:SetStyle("font", TSM.UI.Fonts.MontserratRegular)
			:SetText(self._operationName[item])
			:SetStyle("fontHeight", 14)
		subText:SetText(self._operationModules[item])
			:SetStyle("font", TSM.UI.Fonts.MontserratRegular)
			:SetStyle("fontHeight", 14)
			:Show()

		row:GetElement("expander"):Hide()
		text:SetStyle("textColor", stylesheet.TEXTCOLOR)
		local texturePack = self:_GetStyle("expanderCollapsedBackgroundTexturePack")
		row:GetElement("expander")
			:SetStyle("width", TSM.UI.TexturePacks.GetWidth(texturePack))
			:SetStyle("backgroundTexturePack", nil)
			:Show()
		cancelButton:Hide()
		-- FIXME set text to white color and set correct font size
	elseif isItem then
		text:SetStyle("font", TSM.UI.Fonts.MontserratBold)
			:SetText(TSMAPI_FOUR.Item.GetLink(item))
			:SetStyle("fontHeight", 16)
		row:GetElement("subText")
			:Hide()

		text:SetText(TSM.UI.GetColoredItemName(item))
		local texturePack = self:_GetStyle("expanderCollapsedBackgroundTexturePack")
		row:GetElement("expander")
			:SetStyle("width", TSM.UI.TexturePacks.GetWidth(texturePack))
			:SetStyle("backgroundTexturePack", nil)
		cancelButton:Hide()
	else
		print("Unfortunate")
	end

	self.__super:_DrawRow(row, dataIndex)
end



-- ============================================================================
-- Local Script Handlers
-- ============================================================================

function private.GroupCancelClick(button)
	local row = button:GetParentElement()
	local self = row:GetParentElement()
	local item = row:GetContext()
	self._importer:CancelGroup(item)
	self:SetImporter(self._importer, true)
end

function private.OperationsCancelClick(button)
	local row = button:GetParentElement()
	local self = row:GetParentElement()
	wipe(self._importer.operations)
	self:SetImporter(self._importer, true)
end

function private.RowOnClick(button)
	local row = button:GetParentElement()
	local self = row:GetParentElement()
	local data = row:GetContext()

	if (self._sections[data] == data) or self._groupLabel[data] or self._operationName[data] then
		self._hidden[data] = not self._hidden[data]
	end
	self:Draw()
end
