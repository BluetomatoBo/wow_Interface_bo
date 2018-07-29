-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- ShoppingScrollingTable UI Element Class.
-- The shopping scrolling table is a special subclass of auction scrolling table which has a column for triggering the posting of auctions. It is a subclass of the @{AuctionScrollingTable} class.
-- @classmod ShoppingScrollingTable

local _, TSM = ...
local ShoppingScrollingTable = TSMAPI_FOUR.Class.DefineClass("ShoppingScrollingTable", TSM.UI.AuctionScrollingTable)
TSM.UI.ShoppingScrollingTable = ShoppingScrollingTable
local private = { rowFrameLookup = {} }



-- ============================================================================
-- Public Class Methods
-- ============================================================================

function ShoppingScrollingTable.__init(self)
	self.__super:__init()

	self._highestFilterId = 0
	self._onPostButtonClickHandler = nil
end

function ShoppingScrollingTable.Acquire(self)
	self._highestFilterId = 0
	self.__super:Acquire()
	self:GetScrollingTableInfo()
		:NewColumn("post")
			:SetTitleIcon("iconPack.12x12/Post")
			:SetWidth(12)
			:SetFont(TSM.UI.Fonts.MontserratRegular)
			:SetFontHeight(12)
			:SetJustifyH("CENTER")
			:SetSortValueFunction(private.PostSortFunction)
			:Commit()
		:Commit()
end

function ShoppingScrollingTable.Release(self)
	self._onPostButtonClickHandler = nil
	for _, row in ipairs(self._rows) do
		private.rowFrameLookup[row._frame] = nil
	end
	self.__super:Release()
end

--- Registers a script handler.
-- @tparam ShoppingScrollingTable self The shopping scrolling table object
-- @tparam string script The script to register for (supported scripts: `OnPostButtonClick`)
-- @tparam function handler The script handler which will be called with the shopping scrolling table object followed by
-- any arguments to the script
-- @treturn ShoppingScrollingTable The shopping scrolling table object
function ShoppingScrollingTable.SetScript(self, script, handler)
	if script == "OnPostButtonClick" then
		self._onPostButtonClickHandler = handler
	else
		self.__super:SetScript(script, handler)
	end
	return self
end

--- Selects the next record in the table.
-- @tparam ShoppingScrollingTable self The shopping scrolling table object
function ShoppingScrollingTable.SelectNextRecord(self)
	if not self._selection or self._numAuctionsByHash[self._selection] > 1 then
		return
	end
	local nextItemHash = nil
	for i = 2, #self._data do
		local hash = self._data[i]
		local prevHash = self._data[i-1]
		if prevHash == self._selection then
			nextItemHash = hash
			while self._baseRecordByHash[hash].seller == UnitName("player") and self._data[i + 1] do
				hash = self._data[i + 1]
			end
			if self._baseRecordByHash[hash].baseItemString == self._baseRecordByHash[prevHash].baseItemString then
				-- found the next auction for this item
				self:SetSelection(hash)
				return
			end
			break
		end
	end
	local selectionRecord = self._baseRecordByHash[self._selection]
	if nextItemHash and selectionRecord == self._baseRecordByItem[selectionRecord.baseItemString] then
		-- select the next highest auction
		self:SetSelection(nextItemHash)
	end
end



-- ============================================================================
-- Private Class Methods
-- ============================================================================

function ShoppingScrollingTable._UpdateData(self, queryChanged)
	self.__super:_UpdateData(queryChanged)
	self._highestFilterId = 0
	for _, record in pairs(self._baseRecordByHash) do
		self._highestFilterId = max(self._highestFilterId, record:GetField("filterId"))
	end
end

function ShoppingScrollingTable._GetTableRow(self, isHeader)
	local row = self.__super:_GetTableRow(isHeader)
	if not isHeader then
		private.rowFrameLookup[row._frame] = row

		-- add the post button
		local post = row:_GetTexture()
		TSM.UI.TexturePacks.SetTextureAndSize(post, "iconPack.12x12/Post")
		post:SetPoint("CENTER", row._texts.post, -4, 0)
		row._icons.post = post

		local postBtn = row:_GetButton()
		postBtn:SetAllPoints(post)
		postBtn:SetScript("OnClick", private.PostBtnOnClick)
		row._buttons.post = postBtn
	end
	return row
end

function ShoppingScrollingTable._SetRowData(self, row, data)
	local record = self._baseRecordByHash[data]
	local numBags = TSMAPI_FOUR.Inventory.GetBagQuantity(record:GetField("itemString"))
	if numBags > 0 then
		row._icons.post:Show()
		row._buttons.post:Show()
	else
		row._icons.post:Hide()
		row._buttons.post:Hide()
	end
	self.__super:_SetRowData(row, data)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.PostSortFunction(_, record)
	return TSMAPI_FOUR.Inventory.GetBagQuantity(record:GetField("itemString"))
end



-- ============================================================================
-- Local Script Handlers
-- ============================================================================

function private.PostBtnOnClick(button)
	local self = private.rowFrameLookup[button:GetParent()]
	local scrollingTable = self._scrollingTable
	local record = scrollingTable._baseRecordByHash[self:GetData()]
	scrollingTable:_onPostButtonClickHandler(record)
end
