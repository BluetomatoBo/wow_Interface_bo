-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- Crafting Queue List UI Element Class.
-- The element used to show the queue in the Crafting UI. It is a subclass of the @{ScrollList} class.
-- @classmod CraftingQueueList

local _, TSM = ...
local CraftingQueueList = TSMAPI_FOUR.Class.DefineClass("CraftingQueueList", TSM.UI.ScrollList)
TSM.UI.CraftingQueueList = CraftingQueueList
local private = { queryCraftingQueueListLookup = {}, categoryOrder = {} }
local CATEGORY_SEP = "\001"
local EXPANDER_MARGIN = { left = 2 }
local MINUS_BUTTON_MARGIN = { left = 4 }
local NUM_TEXT_MARGIN = { left = 4, right = 4 }
local ITEM_TEXT_MARGIN = { left = 4 }



-- ============================================================================
-- Public Class Methods
-- ============================================================================

function CraftingQueueList.__init(self)
	self.__super:__init()
	self._collapsed = {}
	self._query = nil
	self._onRowClickHandler = nil
end

function CraftingQueueList.Release(self)
	self._onRowClickHandler = nil
	wipe(self._collapsed)
	if self._query then
		self._query:Release()
		private.queryCraftingQueueListLookup[self._query] = nil
		self._query = nil
	end
	self.__super:Release()
end

--- Gets the data of the first row.
-- @tparam CraftingMatList self The crafting queue list object
-- @treturn CraftingQueueList The crafting queue list object
function CraftingQueueList.GetFirstData(self)
	for _, data in ipairs(self._data) do
		if type(data) ~= "string" then
			return data
		end
	end
end

--- Registers a script handler.
-- @tparam CraftingQueueList self The crafting queue list object
-- @tparam string script The script to register for (supported scripts: `OnValueChanged`)
-- @tparam function handler The script handler which will be called with the crafting queue list object followed by any
-- arguments to the script
-- @treturn CraftingQueueList The crafting queue list object
function CraftingQueueList.SetScript(self, script, handler)
	if script == "OnRowClick" then
		self._onRowClickHandler = handler
	else
		error("Unknown CraftingQueueList script: "..tostring(script))
	end
	return self
end

--- Sets the @{DatabaseQuery} source for this list.
-- This query is used to populate the entries in the crafting queue list.
-- @tparam CraftingQueueList self The crafting queue list object
-- @tparam DatabaseQuery query The query object
-- @treturn CraftingQueueList The crafting queue list object
function CraftingQueueList.SetQuery(self, query)
	if self._query then
		self._query:Release()
		private.queryCraftingQueueListLookup[self._query] = nil
	end
	self._query = query
	self._query:SetUpdateCallback(private.QueryUpdateCallback)
	private.queryCraftingQueueListLookup[query] = self
	return self
end

function CraftingQueueList.Draw(self)
	self:_UpdateData()
	self.__super:Draw()
end



-- ============================================================================
-- Private Class Methods
-- ============================================================================

function CraftingQueueList._IsDataHidden(self, data)
	if type(data) ~= "string" then
		local category = strjoin(CATEGORY_SEP, data.profession, data.players)
		if self._collapsed[category] then
			return true
		end
	end
	return self.__super:_IsDataHidden(data)
end

function CraftingQueueList._UpdateData(self)
	wipe(self._data)
	if not self._query then
		return
	end
	local categories = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, row in self._query:Iterator() do
		local rawCategory = strjoin(CATEGORY_SEP, row:GetFields("profession", "players"))
		local category = strlower(rawCategory)
		if not categories[category] then
			tinsert(categories, category)
		end
		categories[category] = rawCategory
		tinsert(self._data, row)
	end
	sort(categories, private.CategorySortComparator)
	wipe(private.categoryOrder)
	for i, category in ipairs(categories) do
		private.categoryOrder[category] = i
		tinsert(self._data, categories[category])
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(categories)
	sort(self._data, private.DataSortComparator)
end

function CraftingQueueList._CreateRow(self)
	return self.__super:_CreateRow()
		:SetLayout("HORIZONTAL")
		:SetMouseEnabled(true)
		:AddChildNoLayout(TSMAPI_FOUR.UI.NewElement("Button", "button")
			:SetStyle("anchors", { { "TOPLEFT" }, { "BOTTOMRIGHT" } })
			:EnableRightClick()
			:SetScript("OnClick", private.RowOnClick)
			:SetScript("OnEnter", TSM.UI.GetPropagateScriptFunc("OnEnter"))
			:SetScript("OnLeave", TSM.UI.GetPropagateScriptFunc("OnLeave"))
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Button", "expander")
			:SetStyle("relativeLevel", 2)
			:SetStyle("width", 18)
			:SetStyle("height", 18)
			:SetStyle("margin", EXPANDER_MARGIN)
			:SetScript("OnClick", private.RowExpanderOnClick)
			:SetScript("OnEnter", TSM.UI.GetPropagateScriptFunc("OnEnter"))
			:SetScript("OnLeave", TSM.UI.GetPropagateScriptFunc("OnLeave"))
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Button", "minusBtn")
			:SetStyle("relativeLevel", 2)
			:SetStyle("width", 14)
			:SetStyle("height", 14)
			:SetStyle("margin", MINUS_BUTTON_MARGIN)
			:SetStyle("backgroundTexturePack", "iconPack.14x14/Subtract/Circle")
			:SetScript("OnClick", private.MinusBtnOnClick)
			:SetScript("OnEnter", TSM.UI.GetPropagateScriptFunc("OnEnter"))
			:SetScript("OnLeave", TSM.UI.GetPropagateScriptFunc("OnLeave"))
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Button", "plusBtn")
			:SetStyle("relativeLevel", 2)
			:SetStyle("width", 14)
			:SetStyle("height", 14)
			:SetStyle("backgroundTexturePack", "iconPack.14x14/Add/Circle")
			:SetScript("OnClick", private.PlusBtnOnClick)
			:SetScript("OnEnter", TSM.UI.GetPropagateScriptFunc("OnEnter"))
			:SetScript("OnLeave", TSM.UI.GetPropagateScriptFunc("OnLeave"))
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "numText")
			:SetStyle("width", 24)
			:SetStyle("margin", NUM_TEXT_MARGIN)
			:SetStyle("font", TSM.UI.Fonts.RobotoRegular)
			:SetStyle("fontHeight", 12)
			:SetStyle("justifyH", "RIGHT")
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Texture", "spellIcon")
			:SetStyle("width", 14)
			:SetStyle("height", 14)
		)
		:AddChild(TSMAPI_FOUR.UI.NewElement("Text", "itemText")
			:SetStyle("margin", ITEM_TEXT_MARGIN)
			:SetStyle("fontHeight", 12)
			:SetStyle("textColor", "#ffd839")
		)
end

function CraftingQueueList._SetRowHitRectInsets(self, row, top, bottom)
	row:GetElement("minusBtn"):SetHitRectInsets(0, 0, top, bottom)
	row:GetElement("plusBtn"):SetHitRectInsets(0, 0, top, bottom)
	self.__super:_SetRowHitRectInsets(row, top, bottom)
end

function CraftingQueueList._DrawRow(self, row, dataIndex)
	local data = row:GetContext()

	local expander = row:GetElement("expander")
	local minusBtn = row:GetElement("minusBtn")
	local plusBtn = row:GetElement("plusBtn")
	local numText = row:GetElement("numText")
	local spellIcon = row:GetElement("spellIcon")
	local itemText = row:GetElement("itemText")
	if type(data) == "string" then
		row:SetTooltip(nil)
		minusBtn:Hide()
		plusBtn:Hide()
		numText:Hide()
		spellIcon:Hide()
		expander:SetStyle("backgroundTexturePack", self._collapsed[data] and "iconPack.18x18/Carot/Collapsed" or "iconPack.18x18/Carot/Expanded")
		expander:Show()
		local _, _, _, _, _, _, currentProfession = C_TradeSkillUI.GetTradeSkillLine()
		local profession, players = strsplit(CATEGORY_SEP, data)
		if strlower(profession) ~= strlower(currentProfession or "") then
			profession = "|cfff21319"..profession.."|r"
		end
		if not private.PlayersContains(players, UnitName("player")) then
			players = "|cfff21319("..players..")|r"
		else
			players = "("..players..")"
		end
		itemText:SetText(profession.." "..players)
	else
		expander:Hide()
		minusBtn:Show()
		plusBtn:Show()
		local spellId = data:GetField("spellId")
		local numCraftable = TSM.Crafting.ProfessionUtil.GetNumCraftableFromDB(spellId)
		local numQueued = data:GetField("num")
		local numTextColor = numCraftable >= numQueued and "|cff2cec0d" or "|cfff21319"
		numText:SetText(numTextColor..numQueued.."|r")
		numText:Show()
		local itemString = TSM.Crafting.GetItemString(spellId)
		local name = itemString and TSM.UI.GetColoredItemName(itemString) or GetSpellInfo(spellId) or "?"
		local texture = itemString and TSMAPI_FOUR.Item.GetTexture(itemString) or GetSpellTexture(spellId)
		local tooltipLines = TSMAPI_FOUR.Util.AcquireTempTable()
		tinsert(tooltipLines, name)
		for _, matItemString, quantity in TSM.Crafting.MatIterator(spellId) do
			local numHave = TSMAPI_FOUR.Inventory.GetBagQuantity(matItemString) + TSMAPI_FOUR.Inventory.GetReagentBankQuantity(matItemString) + TSMAPI_FOUR.Inventory.GetBankQuantity(matItemString)
			local numNeed = quantity * numQueued
			local color = numHave >= numNeed and "|cff2cec0d" or "|cfff21319"
			tinsert(tooltipLines, format("%s%d/%d|r - %s", color, numHave, numNeed, TSMAPI_FOUR.Item.GetName(matItemString) or "?"))
		end
		row:SetTooltip(strjoin("\n", TSMAPI_FOUR.Util.UnpackAndReleaseTempTable(tooltipLines)))
		spellIcon:SetStyle("texture", texture)
		spellIcon:Show()
		itemText:SetText(name)
	end

	self.__super:_DrawRow(row, dataIndex)
end

function CraftingQueueList._SetCollapsed(self, data, collapsed)
	self._collapsed[data] = collapsed or nil
end



-- ============================================================================
-- Local Script Handlers
-- ============================================================================

function private.MinusBtnOnClick(self)
	TSM.Crafting.Queue.Remove(self:GetParentElement():GetContext():GetField("spellId"), 1)
end

function private.PlusBtnOnClick(self)
	TSM.Crafting.Queue.Add(self:GetParentElement():GetContext():GetField("spellId"), 1)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.PlayersContains(players, player)
	players = strlower(players)
	player = strlower(player)
	return players == player or strmatch(players, "^"..player..",") or strmatch(players, ","..player..",") or strmatch(players, ","..player.."$")
end

function private.CategorySortComparator(a, b)
	local aProfession, aPlayers = strsplit(CATEGORY_SEP, a)
	local bProfession, bPlayers = strsplit(CATEGORY_SEP, b)
	if aProfession ~= bProfession then
		local _, _, _, _, _, _, currentProfession = C_TradeSkillUI.GetTradeSkillLine()
		currentProfession = strlower(currentProfession or "")
		if aProfession == currentProfession then
			return true
		elseif bProfession == currentProfession then
			return false
		else
			return aProfession < bProfession
		end
	end
	local playerName = UnitName("player")
	local aContainsPlayer = private.PlayersContains(aPlayers, playerName)
	local bContainsPlayer = private.PlayersContains(bPlayers, playerName)
	if aContainsPlayer and not bContainsPlayer then
		return true
	elseif bContainsPlayer and not aContainsPlayer then
		return false
	else
		return aPlayers < bPlayers
	end
end

function private.DataSortComparator(a, b)
	local aCategory, bCategory = nil, nil
	if type(a) == "string" and type(b) == "string" then
		return private.categoryOrder[strlower(a)] < private.categoryOrder[strlower(b)]
	elseif type(a) == "string" then
		aCategory = strlower(a)
		bCategory = strlower(strjoin(CATEGORY_SEP, b:GetFields("profession", "players")))
		if aCategory == bCategory then
			return true
		end
	elseif type(b) == "string" then
		aCategory = strlower(strjoin(CATEGORY_SEP, a:GetFields("profession", "players")))
		bCategory = strlower(b)
		if aCategory == bCategory then
			return false
		end
	else
		aCategory = strlower(strjoin(CATEGORY_SEP, a:GetFields("profession", "players")))
		bCategory = strlower(strjoin(CATEGORY_SEP, b:GetFields("profession", "players")))
	end
	if aCategory ~= bCategory then
		return private.categoryOrder[aCategory] < private.categoryOrder[bCategory]
	end
	local aSpellId = a:GetField("spellId")
	local bSpellId = b:GetField("spellId")
	-- FIXME: re-enable once inventory code is rewritten to not be so slow
	-- local aNumCraftable = TSM.Crafting.ProfessionUtil.GetNumCraftableFromDB(aSpellId)
	-- local bNumCraftable = TSM.Crafting.ProfessionUtil.GetNumCraftableFromDB(bSpellId)
	-- local aNumQueued = a:GetField("num")
	-- local bNumQueued = b:GetField("num")
	-- local aCanCraftAll = aNumCraftable >= aNumQueued
	-- local bCanCraftAll = bNumCraftable >= bNumQueued
	-- if aCanCraftAll and not bCanCraftAll then
	-- 	return true
	-- elseif not aCanCraftAll and bCanCraftAll then
	-- 	return false
	-- end
	-- if aNumCraftable ~= bNumCraftable then
	-- 	return aNumCraftable > bNumCraftable
	-- end
	return aSpellId < bSpellId
end

function private.QueryUpdateCallback(query)
	local self = private.queryCraftingQueueListLookup[query]
	self:Draw()
end

function private.RowOnClick(button, mouseButton)
	local row = button:GetParentElement()
	local self = row:GetParentElement()
	local data = row:GetContext()
	if type(data) ~= "string" and self._onRowClickHandler then
		self:_onRowClickHandler(data, mouseButton)
	end
end

function private.RowExpanderOnClick(button)
	local row = button:GetParentElement()
	local self = row:GetParentElement()
	local data = row:GetContext()
	self:_SetCollapsed(data, not self._collapsed[data])
	self:Draw()
end
