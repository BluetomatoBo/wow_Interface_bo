-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Transactions = TSM.Accounting:NewPackage("Transactions")
local L = TSM.L
local private = {
	db = nil,
	dbSummary = nil,
	characters = {},
	dataChanged = false,
	statsQuery = nil,
	buyStatsCache = {
		lastUpdate = 0,
		totalNum = {},
		smartTotalNum = {},
		smartTotalPrice = {},
	},
}
local CSV_KEYS = { "itemString", "stackSize", "quantity", "price", "otherPlayer", "player", "time", "source" }
local COMBINE_TIME_THRESHOLD = 300 -- group transactions within 5 minutes together
local MAX_CSV_RECORDS = 55000 -- the max number of records we can store without WoW corrupting the SV file
local TRIMMED_CSV_RECORDS = 50000 -- how many records to trim to if we're over the limit (so we don't trim every time)
local SECONDS_PER_DAY = 24 * 60 * 60
local DB_SCHEMA = {
	fields = {
		type = "string",
		itemString = "string",
		baseItemString = "string",
		stackSize = "number",
		quantity = "number",
		price = "number",
		otherPlayer = "string",
		player = "string",
		time = "number",
		source = "string",
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
		"price",
		"otherPlayer",
		"player",
		"time",
		"source",
		"saveTime",
	}
}
local SUMMARY_DB_SCHEMA = {
	fields = {
		itemString = "string",
		sold = "number",
		avgSellPrice = "number",
		bought = "number",
		avgBuyPrice = "number",
		avgResaleProfit = "number",
	},
	fieldAttributes = {
		itemString = { "unique" },
	},
	fieldOrder = {
		"itemString",
		"sold",
		"avgSellPrice",
		"bought",
		"avgBuyPrice",
		"avgResaleProfit",
	}
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Transactions.OnInitialize()
	if TSM.db.realm.internalData.accountingTrimmed.sales then
		TSM:Printf(L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."], SecondsToTime(time() - TSM.db.realm.internalData.accountingTrimmed.sales))
		TSM.db.realm.internalData.accountingTrimmed.sales = nil
	end
	if TSM.db.realm.internalData.accountingTrimmed.buys then
		TSM:Printf(L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."], SecondsToTime(time() - TSM.db.realm.internalData.accountingTrimmed.buys))
		TSM.db.realm.internalData.accountingTrimmed.buys = nil
	end

	private.db = TSMAPI_FOUR.Database.New(DB_SCHEMA, "TRANSACTIONS_LOG")
	private.db:BulkInsertStart()
	private.LoadData("sale", TSM.db.realm.internalData.csvSales, TSM.db.realm.internalData.saveTimeSales)
	private.LoadData("buy", TSM.db.realm.internalData.csvBuys, TSM.db.realm.internalData.saveTimeBuys)
	private.db:BulkInsertEnd()
	private.dbSummary = TSMAPI_FOUR.Database.New(SUMMARY_DB_SCHEMA, "TRANSACTIONS_SUMMARY")
	private.statsQuery = private.db:NewQuery()
		:Select("quantity", "price")
		:Equal("type", TSM.CONST.BOUND_QUERY_PARAM)
		:Equal("baseItemString", TSM.CONST.BOUND_QUERY_PARAM)
		:NotEqual("source", "Vendor")
end

function Transactions.OnDisable()
	if not private.dataChanged then
		-- nothing changed, so just keep the previous saved values
		return
	end
	TSM.db.realm.internalData.csvSales, TSM.db.realm.internalData.saveTimeSales, TSM.db.realm.internalData.accountingTrimmed.sales = private.SaveData("sale")
	TSM.db.realm.internalData.csvBuys, TSM.db.realm.internalData.saveTimeBuys, TSM.db.realm.internalData.accountingTrimmed.buys = private.SaveData("buy")
end

function Transactions.InsertAuctionSale(itemString, stackSize, price, buyer, timestamp)
	private.InsertRecord("sale", itemString, "Auction", stackSize, price, buyer, timestamp)
end

function Transactions.InsertAuctionBuy(itemString, stackSize, price, seller, timestamp)
	private.InsertRecord("buy", itemString, "Auction", stackSize, price, seller, timestamp)
end

function Transactions.InsertCODSale(itemString, stackSize, price, buyer, timestamp)
	private.InsertRecord("sale", itemString, "COD", stackSize, price, buyer, timestamp)
end

function Transactions.InsertCODBuy(itemString, stackSize, price, seller, timestamp)
	private.InsertRecord("buy", itemString, "COD", stackSize, price, seller, timestamp)
end

function Transactions.InsertTradeSale(itemString, stackSize, price, buyer)
	private.InsertRecord("sale", itemString, "Trade", stackSize, price, buyer, time())
end

function Transactions.InsertTradeBuy(itemString, stackSize, price, seller)
	private.InsertRecord("buy", itemString, "Trade", stackSize, price, seller, time())
end

function Transactions.InsertVendorSale(itemString, stackSize, price)
	private.InsertRecord("sale", itemString, "Vendor", stackSize, price, "Merchant", time())
end

function Transactions.InsertVendorBuy(itemString, stackSize, price)
	private.InsertRecord("buy", itemString, "Vendor", stackSize, price, "Merchant", time())
end

function Transactions.CreateQuery()
	return private.db:NewQuery()
end

function Transactions.RemoveOldData(days)
	private.dataChanged = true
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

function Transactions.GetSaleStats(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	private.statsQuery:BindParams("sale", itemString)
	private.statsQuery:ResetOrderBy()
	local totalPrice = private.statsQuery:SumOfProduct("quantity", "price")
	local totalNum = private.statsQuery:Sum("quantity")
	if not totalNum or totalNum == 0 then
		return
	end
	return totalPrice, totalNum
end

function Transactions.GetBuyStats(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)

	-- check if we need to clear our cache
	if private.buyStatsCache.lastUpdate ~= GetTime() then
		wipe(private.buyStatsCache.totalNum)
		wipe(private.buyStatsCache.smartTotalNum)
		wipe(private.buyStatsCache.smartTotalPrice)
		private.buyStatsCache.lastUpdate = GetTime()
	end

	-- check if we have the values cached
	if private.buyStatsCache.totalNum[itemString] then
		return private.buyStatsCache.smartTotalPrice[itemString], private.buyStatsCache.smartTotalNum[itemString], private.buyStatsCache.totalNum[itemString]
	end

	-- need to query for the values
	private.statsQuery:BindParams("buy", itemString)
	private.statsQuery:ResetOrderBy()
	local remainingNum = nil
	if TSM.db.global.accountingOptions.smartBuyPrice then
		local numHave = TSMAPI_FOUR.Inventory.GetTotalQuantity(itemString)
		if numHave > 0 then
			private.statsQuery:OrderBy("time", false)
			remainingNum = numHave
		end
	end
	local smartTotalPrice, smartTotalNum, totalNum = 0, 0, 0
	if remainingNum then
		if private.statsQuery:Count() == 0 then
			return
		end
		for _, quantity, price in private.statsQuery:Iterator() do
			totalNum = totalNum + quantity
			quantity = min(quantity, remainingNum)
			if quantity > 0 then
				remainingNum = remainingNum - quantity
				smartTotalPrice = smartTotalPrice + price * quantity
				smartTotalNum = smartTotalNum + quantity
			end
		end
	else
		smartTotalNum = private.statsQuery:Sum("quantity")
		totalNum = smartTotalNum
		if not smartTotalNum then
			return
		end
		smartTotalPrice = private.statsQuery:SumOfProduct("quantity", "price")
	end
	private.buyStatsCache.totalNum[itemString] = totalNum
	private.buyStatsCache.smartTotalPrice[itemString] = smartTotalPrice
	private.buyStatsCache.smartTotalNum[itemString] = smartTotalNum
	return smartTotalPrice, smartTotalNum, totalNum
end

function Transactions.GetMaxSalePrice(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	return private.db:NewQuery()
		:Select("price")
		:Equal("type", "sale")
		:Equal("baseItemString", itemString)
		:NotEqual("source", "Vendor")
		:OrderBy("price", false)
		:GetFirstResultAndRelease()
end

function Transactions.GetMaxBuyPrice(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	return private.db:NewQuery()
		:Select("price")
		:Equal("type", "buy")
		:Equal("baseItemString", itemString)
		:NotEqual("source", "Vendor")
		:OrderBy("price", false)
		:GetFirstResultAndRelease()
end

function Transactions.GetMinSalePrice(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	return private.db:NewQuery()
		:Select("price")
		:Equal("type", "sale")
		:Equal("baseItemString", itemString)
		:NotEqual("source", "Vendor")
		:OrderBy("price", true)
		:GetFirstResultAndRelease()
end

function Transactions.GetMinBuyPrice(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	return private.db:NewQuery()
		:Select("price")
		:Equal("type", "buy")
		:Equal("baseItemString", itemString)
		:NotEqual("source", "Vendor")
		:OrderBy("price", true)
		:GetFirstResultAndRelease()
end

function Transactions.GetAverageSalePrice(itemString)
	local totalPrice, totalNum = Transactions.GetSaleStats(itemString)
	if not totalPrice then
		return
	end
	return TSMAPI_FOUR.Util.Round(totalPrice / totalNum), totalNum
end

function Transactions.GetAverageBuyPrice(itemString)
	local totalPrice, totalNum = Transactions.GetBuyStats(itemString)
	if not totalPrice then
		return
	end
	return TSMAPI_FOUR.Util.Round(totalPrice / totalNum), totalNum
end

function Transactions.GetLastSaleTime(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	return private.db:NewQuery()
		:Select("time")
		:Equal("type", "sale")
		:Equal("baseItemString", itemString)
		:NotEqual("source", "Vendor")
		:OrderBy("time", false)
		:GetFirstResultAndRelease()
end

function Transactions.GetLastBuyTime(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	return private.db:NewQuery()
		:Select("time")
		:Equal("type", "buy")
		:Equal("baseItemString", itemString)
		:NotEqual("source", "Vendor")
		:OrderBy("time", false)
		:GetFirstResultAndRelease()
end

function Transactions.GetQuantity(itemString, timeFilter, typeFilter)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	local query = private.db:NewQuery()
		:Equal("type", typeFilter)
		:Equal("baseItemString", itemString)
	if timeFilter then
		query:GreaterThan("time", time() - timeFilter)
	end
	local sum = query:Sum("quantity") or 0
	query:Release()
	return sum
end

function Transactions.GetAveragePrice(itemString, timeFilter, typeFilter)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	local query = private.db:NewQuery()
		:Select("price", "quantity")
		:Equal("type", typeFilter)
		:Equal("baseItemString", itemString)
	if timeFilter then
		query:GreaterThan("time", time() - timeFilter)
	end
	local avgPrice = 0
	local totalQuantity = 0
	for _, price, quantity in query:IteratorAndRelease() do
		avgPrice = avgPrice + price * quantity
		totalQuantity = totalQuantity + quantity
	end
	return avgPrice / totalQuantity
end

function Transactions.GetTotalPrice(itemString, timeFilter, typeFilter)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	local query = private.db:NewQuery()
		:Select("price", "quantity")
		:Equal("type", typeFilter)
		:Equal("baseItemString", itemString)
	if timeFilter then
		query:GreaterThan("time", time() - timeFilter)
	end
	local sumPrice = query:SumOfProduct("price", "quantity") or 0
	query:Release()
	return sumPrice
end

function Transactions.CreateSummaryQuery()
	return private.dbSummary:NewQuery()
end

function Transactions.UpdateSummaryData(groupFilter, typeFilter, characterFilter, timeFrameFilter)
	local totalSold = TSMAPI_FOUR.Util.AcquireTempTable()
	local totalSellPrice = TSMAPI_FOUR.Util.AcquireTempTable()
	local totalBought = TSMAPI_FOUR.Util.AcquireTempTable()
	local totalBoughtPrice = TSMAPI_FOUR.Util.AcquireTempTable()

	local items = private.db:NewQuery()
		:Select("itemString", "price", "quantity", "type")
		:LeftJoin(TSM.Groups.GetItemDBForJoin(), "itemString")

	if groupFilter ~= ALL then
		items:Equal("groupPath", groupFilter)
	end
	if typeFilter ~= "All" then
		items:Equal("source", typeFilter)
	end
	if characterFilter ~= ALL then
		items:Equal("player", characterFilter)
	end
	if timeFrameFilter ~= 0 then
		items:GreaterThan("time", time() - timeFrameFilter)
	end

	for _, itemString, price, quantity, recordType in items:IteratorAndRelease() do
		if not totalSold[itemString] then
			totalSold[itemString] = 0
			totalSellPrice[itemString] = 0
			totalBought[itemString] = 0
			totalBoughtPrice[itemString] = 0
		end

		if recordType == "sale" then
			totalSold[itemString] = totalSold[itemString] + quantity
			totalSellPrice[itemString] = totalSellPrice[itemString] + price * quantity
		elseif recordType == "buy" then
			totalBought[itemString] = totalBought[itemString] + quantity
			totalBoughtPrice[itemString] = totalBoughtPrice[itemString] + price * quantity
		else
			error("Invalid recordType: "..tostring(recordType))
		end
	end

	private.dbSummary:SetQueryUpdatesPaused(true)
	private.dbSummary:Truncate()
	private.dbSummary:BulkInsertStart()
	for itemString, sold in pairs(totalSold) do
		if sold > 0 and totalBought[itemString] > 0 then
			local totalAvgSellPrice = totalSellPrice[itemString] / totalSold[itemString]
			local totalAvgBuyPrice = totalBoughtPrice[itemString] / totalBought[itemString]
			local profit = totalAvgSellPrice - totalAvgBuyPrice
			private.dbSummary:BulkInsertNewRow(itemString, sold, totalAvgSellPrice, totalBought[itemString], totalAvgBuyPrice, profit)
		end
	end
	private.dbSummary:BulkInsertEnd()
	private.dbSummary:SetQueryUpdatesPaused(false)

	TSMAPI_FOUR.Util.ReleaseTempTable(totalSold)
	TSMAPI_FOUR.Util.ReleaseTempTable(totalSellPrice)
	TSMAPI_FOUR.Util.ReleaseTempTable(totalBought)
	TSMAPI_FOUR.Util.ReleaseTempTable(totalBoughtPrice)
end

function Transactions.GetCharacters(characters)
	for character in pairs(private.characters) do
		tinsert(characters, character)
	end
	return characters
end

function Transactions.RemoveRowByUUID(uuid)
	private.db:DeleteRowByUUID(uuid)
	private.dataChanged = true
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.LoadData(recordType, csvRecords, csvSaveTimes)
	local _, records = TSMAPI_FOUR.CSV.Decode(csvRecords)
	if not records then
		return
	end
	local saveTimes = TSMAPI_FOUR.Util.SafeStrSplit(csvSaveTimes, ",")
	local saveTimeIndex = 1
	for _, record in ipairs(records) do
		local saveTime = 0
		if saveTimes and record.source == "Auction" then
			saveTime = tonumber(saveTimes[saveTimeIndex])
			saveTimeIndex = saveTimeIndex + 1
		end
		local itemString = TSMAPI_FOUR.Item.ToItemString(record.itemString)
		if itemString then
			local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
			local otherPlayer = record.otherPlayer
			if not otherPlayer then
				-- convert from old (TSM3) keys
				otherPlayer = record.buyer or record.seller
				private.dataChanged = true
			end
			otherPlayer = type(otherPlayer) == "string" and otherPlayer or "?"
			if type(record.stackSize) == "number" and type(record.quantity) == "number" and type(record.price) == "number" and type(record.player) == "string" and type(record.time) == "number" then
				private.db:BulkInsertNewRow(recordType, record.itemString, baseItemString, record.stackSize, record.quantity, record.price, otherPlayer, record.player, record.time, record.source, saveTime)
			end

			private.characters[record.player] = true
		end
	end
end

function private.SaveData(recordType)
	if private.db:GetNumRowsByIndex("type", recordType) > MAX_CSV_RECORDS then
		local query = private.db:NewQuery()
			:Equal("type", recordType)
			:OrderBy("time", false)
		local count = 0
		local saveTimes = {}
		local shouldTrim = query:Count() > MAX_CSV_RECORDS
		local lastTime = nil
		local encodeContext = TSMAPI_FOUR.CSV.EncodeStart(CSV_KEYS)
		for _, row in query:Iterator() do
			if not shouldTrim or count <= TRIMMED_CSV_RECORDS then
				-- add the save time
				local saveTime = row:GetField("saveTime")
				saveTime = saveTime ~= 0 and saveTime or time()
				if row:GetField("source") == "Auction" then
					tinsert(saveTimes, saveTime)
				end
				-- update the time we're trimming to
				if shouldTrim then
					lastTime = row:GetField("time")
				end
				-- add to our list of CSV lines
				TSMAPI_FOUR.CSV.EncodeAddRowData(encodeContext, row)
			end
			count = count + 1
		end
		query:Release()
		return TSMAPI_FOUR.CSV.EncodeEnd(encodeContext), table.concat(saveTimes, ","), lastTime
	else
		local saveTimes = {}
		local encodeContext = TSMAPI_FOUR.CSV.EncodeStart(CSV_KEYS)
		for _, rowRecordType, itemString, _, stackSize, quantity, price, otherPlayer, player, timestamp, source, saveTime in private.db:RawIterator() do
			if rowRecordType == recordType then
				-- add the save time
				if source == "Auction" then
					tinsert(saveTimes, saveTime ~= 0 and saveTime or time())
				end
				-- add to our list of CSV lines
				TSMAPI_FOUR.CSV.EncodeAddRowDataRaw(encodeContext, itemString, stackSize, quantity, price, otherPlayer, player, timestamp, source)
			end
		end
		return TSMAPI_FOUR.CSV.EncodeEnd(encodeContext), table.concat(saveTimes, ","), nil
	end
end

function private.InsertRecord(recordType, itemString, source, stackSize, price, otherPlayer, timestamp)
	private.dataChanged = true
	assert(itemString and source and stackSize and price and otherPlayer and timestamp)
	local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
	local matchingRow = private.db:NewQuery()
		:Equal("type", recordType)
		:Equal("itemString", itemString)
		:Equal("baseItemString", baseItemString)
		:Equal("stackSize", stackSize)
		:Equal("source", source)
		:Equal("price", price)
		:Equal("player", UnitName("player"))
		:Equal("otherPlayer", otherPlayer)
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
			:SetField("price", price)
			:SetField("otherPlayer", otherPlayer)
			:SetField("player", UnitName("player"))
			:SetField("time", timestamp)
			:SetField("source", source)
			:SetField("saveTime", 0)
			:Create()
	end
end
