-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Money = TSM.Accounting:NewPackage("Money")
local private = { db = nil }
local CSV_KEYS = { "type", "amount", "otherPlayer", "player", "time" }
local COMBINE_TIME_THRESHOLD = 300 -- group expenses within 5 minutes together
local SECONDS_PER_DAY = 24 * 60 * 60
local DB_SCHEMA = {
	fields = {
		recordType = "string",
		type = "string",
		amount = "number",
		otherPlayer = "string",
		player = "string",
		time = "number",
	},
	fieldAttributes = {
		recordType = { "index" },
	},
	fieldOrder = {
		"recordType",
		"type",
		"amount",
		"otherPlayer",
		"player",
		"time",
	}
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Money.OnInitialize()
	private.db = TSMAPI_FOUR.Database.New(DB_SCHEMA, "ACCOUNTING_MONEY")
	private.LoadData("expense", TSM.db.realm.internalData.csvExpense)
	private.LoadData("income", TSM.db.realm.internalData.csvIncome)
end

function Money.OnDisable()
	TSM.db.realm.internalData.csvExpense = private.SaveData("expense")
	TSM.db.realm.internalData.csvIncome = private.SaveData("income")
end

function Money.InsertMoneyTransferExpense(amount, destination)
	private.InsertRecord("expense", "Money Transfer", amount, destination, time())
end

function Money.InsertPostageExpense(amount, destination)
	private.InsertRecord("expense", "Postage", amount, destination, time())
end

function Money.InsertRepairBillExpense(amount)
	private.InsertRecord("expense", "Repair Bill", amount, "Merchant", time())
end

function Money.InsertMoneyTransferIncome(amount, source, timestamp)
	private.InsertRecord("income", "Money Transfer", amount, source, timestamp)
end

function Money.InsertGarrisonIncome(amount)
	private.InsertRecord("income", "Garrison", amount, "Mission", time())
end

function Money.CreateQuery()
	return private.db:NewQuery()
end

function Money.CharacterIterator(recordType)
	return private.db:NewQuery()
		:Equal("recordType", recordType)
		:Distinct("player")
		:Select("player")
		:IteratorAndRelease()
end

function Money.RemoveOldData(days)
	local query = private.db:NewQuery()
		:LessThan("time", time() - days * SECONDS_PER_DAY)
	local numRecords = 0
	private.db:SetQueryUpdatesPaused(true)
	for _, row in query:Iterator() do
		private.db:DeleteRow(row)
		numRecords = numRecords + 1
	end
	query:Release()
	private.db:SetQueryUpdatesPaused(false)
	return numRecords
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.LoadData(recordType, csvRecords)
	local _, records = TSMAPI_FOUR.CSV.Decode(csvRecords)
	if not records then
		return
	end
	private.db:BulkInsertStart()
	for _, record in ipairs(records) do
		-- convert from old (TSM3) keys if necessary
		local otherPlayer = record.otherPlayer or record.destination or record.source
		if type(otherPlayer) == "string" and type(record.time) == "number" then
			local newTime = floor(record.time)
			if newTime ~= record.time then
				-- make sure all timestamps are stored as integers
				record.time = newTime
			end
			private.db:BulkInsertNewRow(recordType, record.type, record.amount, otherPlayer, record.player, record.time)
		end
	end
	private.db:BulkInsertEnd()
end

function private.SaveData(recordType)
	local query = private.db:NewQuery()
		:Equal("recordType", recordType)
	local encodeContext = TSMAPI_FOUR.CSV.EncodeStart(CSV_KEYS)
	for _, row in query:Iterator() do
		TSMAPI_FOUR.CSV.EncodeAddRowData(encodeContext, row)
	end
	query:Release()
	return TSMAPI_FOUR.CSV.EncodeEnd(encodeContext)
end

function private.InsertRecord(recordType, type, amount, otherPlayer, timestamp)
	assert(type and amount and amount > 0 and otherPlayer and timestamp)
	timestamp = floor(timestamp)
	local matchingRow = private.db:NewQuery()
		:Equal("recordType", recordType)
		:Equal("type", type)
		:Equal("otherPlayer", otherPlayer)
		:Equal("player", UnitName("player"))
		:GreaterThan("time", timestamp - COMBINE_TIME_THRESHOLD)
		:LessThan("time", timestamp + COMBINE_TIME_THRESHOLD)
		:GetFirstResultAndRelease()
	if matchingRow then
		matchingRow:SetField("amount", matchingRow:GetField("amount") + amount)
		matchingRow:Update()
		matchingRow:Release()
	else
		private.db:NewRow()
			:SetField("recordType", recordType)
			:SetField("type", type)
			:SetField("amount", amount)
			:SetField("otherPlayer", otherPlayer)
			:SetField("player", UnitName("player"))
			:SetField("time", timestamp)
			:Create()
	end
end
