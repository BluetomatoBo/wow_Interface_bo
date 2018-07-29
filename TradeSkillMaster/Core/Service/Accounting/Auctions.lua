-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Auctions = TSM.Accounting:NewPackage("Auctions")
local private = { db = nil, numExpiresQuery = nil, dataChanged = false }
local COMBINE_TIME_THRESHOLD = 300 -- group expenses within 5 minutes together
local CSV_KEYS = { "itemString", "stackSize", "quantity", "player", "time" }
local DB_SCHEMA = {
	fields = {
		type = "string",
		itemString = "string",
		baseItemString = "string",
		stackSize = "number",
		quantity = "number",
		player = "string",
		time = "number",
		saveTime = "number",
	},
	fieldAttributes = {
		type = { "index" },
		baseItemString = { "index" },
	},
	fieldOrder = {
		"type",
		"itemString",
		"baseItemString",
		"stackSize",
		"quantity",
		"player",
		"time",
		"saveTime",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Auctions.OnInitialize()
	private.db = TSMAPI_FOUR.Database.New(DB_SCHEMA, "ACCOUNTING_AUCTIONS")
	private.numExpiresQuery = private.db:NewQuery()
		:Select("quantity")
		:Equal("type", "expire")
		:Equal("baseItemString", TSM.CONST.BOUND_QUERY_PARAM)
		:GreaterThanOrEqual("time", TSM.CONST.BOUND_QUERY_PARAM)

	private.db:BulkInsertStart()
	private.LoadData("cancel", TSM.db.realm.internalData.csvCancelled, TSM.db.realm.internalData.saveTimeCancels)
	private.LoadData("expire", TSM.db.realm.internalData.csvExpired, TSM.db.realm.internalData.saveTimeExpires)
	private.db:BulkInsertEnd()
end

function Auctions.OnDisable()
	if not private.dataChanged then
		-- nothing changed, so no need to save
		return
	end
	local cancelSaveTimes, expireSaveTimes = {}, {}
	local cancelEncodeContext = TSMAPI_FOUR.CSV.EncodeStart(CSV_KEYS)
	local expireEncodeContext = TSMAPI_FOUR.CSV.EncodeStart(CSV_KEYS)
	for _, recordType, itemString, _, stackSize, quantity, player, timestamp, saveTime in private.db:RawIterator() do
		local saveTimes, encodeContext = nil, nil
		if recordType == "cancel" then
			saveTimes = cancelSaveTimes
			encodeContext = cancelEncodeContext
		elseif recordType == "expire" then
			saveTimes = expireSaveTimes
			encodeContext = expireEncodeContext
		else
			error("Invalid recordType: "..tostring(recordType))
		end
		-- add the save time
		tinsert(saveTimes, saveTime ~= 0 and saveTime or time())
		-- add to our list of CSV lines
		TSMAPI_FOUR.CSV.EncodeAddRowDataRaw(encodeContext, itemString, stackSize, quantity, player, timestamp)
	end
	TSM.db.realm.internalData.csvCancelled = TSMAPI_FOUR.CSV.EncodeEnd(cancelEncodeContext)
	TSM.db.realm.internalData.saveTimeCancels = table.concat(cancelSaveTimes, ",")
	TSM.db.realm.internalData.csvExpired = TSMAPI_FOUR.CSV.EncodeEnd(expireEncodeContext)
	TSM.db.realm.internalData.saveTimeExpires = table.concat(expireSaveTimes, ",")
end

function Auctions.InsertCancel(itemString, stackSize, timestamp)
	private.InsertRecord("cancel", itemString, stackSize, timestamp)
end

function Auctions.InsertExpire(itemString, stackSize, timestamp)
	private.InsertRecord("expire", itemString, stackSize, timestamp)
end

function Auctions.GetStats(itemString, minTime)
	local query = private.db:NewQuery()
		:Equal("baseItemString", TSMAPI_FOUR.Item.ToBaseItemString(itemString))
	if minTime then
		query:GreaterThanOrEqual("time", minTime)
	end
	local cancel, expire, total = 0, 0, 0
	for _, row in query:Iterator() do
		local recordType = row:GetField("type")
		local quantity = row:GetField("quantity")
		total = total + quantity
		if recordType == "cancel" then
			cancel = cancel + quantity
		elseif recordType == "expire" then
			expire = expire + quantity
		else
			error("Invalid recordType: "..tostring(recordType))
		end
	end
	query:Release()
	return cancel, expire, total
end

function Auctions.GetNumExpires(itemString, minTime)
	private.numExpiresQuery:BindParams(TSMAPI_FOUR.Item.ToBaseItemString(itemString), minTime or 0)
	local num = 0
	for _, quantity in private.numExpiresQuery:Iterator() do
		num = num + quantity
	end
	return num
end

function Auctions.GetNumExpiresSinceSale(itemString)
	return Auctions.GetNumExpires(itemString, TSM.Accounting.Transactions.GetLastSaleTime(itemString))
end

function Auctions.CreateQuery()
	return private.db:NewQuery()
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.LoadData(recordType, csvRecords, csvSaveTimes)
	local _, records = TSMAPI_FOUR.CSV.Decode(csvRecords)
	local saveTimes = TSMAPI_FOUR.Util.SafeStrSplit(csvSaveTimes, ",")
	if not records or not saveTimes or #records ~= #saveTimes then
		return
	end

	for index, record in ipairs(records) do
		local itemString = TSMAPI_FOUR.Item.ToItemString(record.itemString)
		if itemString then
			local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
			local saveTime = tonumber(saveTimes[index])
			private.db:BulkInsertNewRow(recordType, itemString, baseItemString, record.stackSize, record.quantity, record.player, record.time, saveTime)
		end
	end
end

function private.InsertRecord(recordType, itemString, stackSize, timestamp)
	private.dataChanged = true
	assert(itemString and stackSize and stackSize > 0 and timestamp)
	local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	local matchingRow = private.db:NewQuery()
		:Equal("type", recordType)
		:Equal("baseItemString", baseItemString)
		:Equal("itemString", itemString)
		:Equal("stackSize", stackSize)
		:Equal("player", UnitName("player"))
		:GreaterThan("time", timestamp - COMBINE_TIME_THRESHOLD)
		:LessThan("time", timestamp + COMBINE_TIME_THRESHOLD)
		:GetFirstResultAndRelease()
	if matchingRow then
		matchingRow:SetField("quantity", matchingRow:GetField("quantity") + stackSize)
		matchingRow:Update()
		matchingRow:Release()
	else
		private.db:NewRow()
			:SetField("type", recordType)
			:SetField("itemString", itemString)
			:SetField("baseItemString", baseItemString)
			:SetField("stackSize", stackSize)
			:SetField("quantity", stackSize)
			:SetField("player", UnitName("player"))
			:SetField("time", timestamp)
			:SetField("saveTime", 0)
			:Create()
	end
end
