-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local AuctionDB = TSM:NewPackage("AuctionDB")
local L = TSM.L
local private = {
	region = nil,
	realmData = {},
	regionData = nil,
	realmScanTime = nil,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function AuctionDB.OnEnable()
	private.region = TSM.GetRegion()
	if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
		return
	end

	local realmAppData = nil
	local appData = TSMAPI.AppHelper and TSMAPI.AppHelper:FetchData("AUCTIONDB_MARKET_DATA") -- get app data from TSM_AppHelper if it's installed
	if appData then
		for _, info in ipairs(appData) do
			local realm, data = unpack(info)
			local downloadTime = "?"
			if realm == private.region then
				local regionData, lastUpdate = private.LoadRegionAppData(data)
				if regionData then
					private.regionData = regionData
					downloadTime = SecondsToTime(time() - lastUpdate).." ago"
				end
			elseif TSMAPI.AppHelper:IsCurrentRealm(realm) then
				realmAppData = private.ProcessRealmAppData(data)
				downloadTime = SecondsToTime(time() - realmAppData.downloadTime).." ago"
			end
			TSM:LOG_INFO("Got AppData for %s (isCurrent=%s, %s)", realm, tostring(TSMAPI.AppHelper:IsCurrentRealm(realm)), downloadTime)
		end
	end

	-- check if we can load realm data from the app
	if realmAppData then
		private.realmScanTime = realmAppData.downloadTime
		local fields = realmAppData.fields
		for _, data in ipairs(realmAppData.data) do
			local itemString
			for i, key in ipairs(fields) do
				if i == 1 then
					-- item string must be the first field
					if type(data[i]) == "number" then
						itemString = "i:"..data[i]
					else
						itemString = gsub(data[i], ":0:", "::")
					end
					private.realmData[itemString] = {}
				else
					private.realmData[itemString][key] = data[i]
				end
			end
			private.realmData[itemString].lastScan = realmAppData.downloadTime
		end
	end

	for itemString in pairs(private.realmData) do
		TSMAPI_FOUR.Item.FetchInfo(itemString)
	end
	if not next(private.realmData) then
		TSM:Print(L["TSM doesn't currently have any AuctionDB pricing data for your realm. We recommend you download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update your AuctionDB data (and auto-backup your TSM settings)."])
	end
	collectgarbage()
end

function AuctionDB.GetLastCompleteScanTime()
	return private.realmScanTime
end

function AuctionDB.LastScanIteratorThreaded()
	local itemNumAuctions = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	local itemMinBuyout = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	local baseItems = TSMAPI_FOUR.Thread.AcquireSafeTempTable()

	for itemString, data in pairs(private.realmData) do
		if data.lastScan >= private.realmScanTime then
			itemString = TSMAPI_FOUR.Item.ToItemString(itemString)
			local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
			if baseItemString ~= itemString then
				baseItems[baseItemString] = true
			end
			if not itemNumAuctions[itemString] then
				itemNumAuctions[itemString] = 0
			end
			itemNumAuctions[itemString] = itemNumAuctions[itemString] + data.numAuctions
			if data.minBuyout and data.minBuyout > 0 then
				itemMinBuyout[itemString] = min(itemMinBuyout[itemString] or math.huge, data.minBuyout)
			end
		end
		TSMAPI_FOUR.Thread.Yield()
	end

	-- remove the base items since they would be double-counted with the specific variants
	for itemString in pairs(baseItems) do
		itemNumAuctions[itemString] = nil
		itemMinBuyout[itemString] = nil
	end
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(baseItems)

	-- convert the remaining items into a list
	local itemList = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	itemList.numAuctions = itemNumAuctions
	itemList.minBuyout = itemMinBuyout
	for itemString in pairs(itemNumAuctions) do
		tinsert(itemList, itemString)
	end
	return TSMAPI_FOUR.Util.TableIterator(itemList, private.LastScanIteratorHelper, itemList, private.LastScanIteratorCleanup)
end

function AuctionDB.GetRealmItemData(itemString, key)
	return private.GetItemDataHelper(private.realmData, key, itemString)
end

function AuctionDB.GetRegionItemData(itemString, key)
	return private.GetRegionItemDataHelper(private.regionData, key, itemString)
end

function AuctionDB.GetRegionSaleInfo(itemString, key)
	-- need to divide the result by 100
	local result = private.GetRegionItemDataHelper(private.regionData, key, itemString)
	return result and (result / 100) or nil
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.ProcessRealmAppData(rawData)
	if #rawData < 3500000 then
		-- we can safely just use loadstring() for strings below 3.5M
		return assert(loadstring(rawData)())
	end
	-- load the data in chunks
	local leader, itemData, trailer = strmatch(rawData, "^(.+)data={({.+})}(.+)$")
	local resultData = {}
	local chunkStart, chunkEnd, nextChunkStart = 1, nil, nil
	while chunkStart do
		chunkEnd, nextChunkStart = strfind(itemData, "},{", chunkStart + 3400000)
		local chunkData = assert(loadstring("return {"..strsub(itemData, chunkStart, chunkEnd).."}")())
		for _, data in ipairs(chunkData) do
			tinsert(resultData, data)
		end
		chunkStart = nextChunkStart
	end
	__AUCTIONDB_IMPORT_TEMP = resultData
	local result = assert(loadstring(leader.."data=__AUCTIONDB_IMPORT_TEMP"..trailer)())
	__AUCTIONDB_IMPORT_TEMP = nil
	return result
end

function private.LoadRegionAppData(appData)
	local metaDataEndIndex, dataStartIndex = strfind(appData, ",data={")
	local itemData = strsub(appData, dataStartIndex + 1, -3)
	local metaDataStr = strsub(appData, 1, metaDataEndIndex - 1).."}"
	local metaData = assert(loadstring(metaDataStr))()
	local result = { fieldLookup = {}, itemLookup = {} }
	for i, field in ipairs(metaData.fields) do
		result.fieldLookup[field] = i
	end

	for itemString, otherData in gmatch(itemData, "{([^,]+),([^}]+)}") do
		if tonumber(itemString) then
			itemString = "i:"..itemString
		else
			itemString = gsub(strsub(itemString, 2, -2), ":0:", "::")
		end
		result.itemLookup[itemString] = otherData
	end

	return result, metaData.downloadTime
end

function private.LastScanIteratorHelper(index, itemString, tbl)
	return index, itemString, tbl.numAuctions[itemString], tbl.minBuyout[itemString]
end

function private.LastScanIteratorCleanup(tbl)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(tbl.numAuctions)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(tbl.minBuyout)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(tbl)
end

function private.GetItemDataHelper(tbl, key, itemString)
	if not itemString or not tbl then return end
	itemString = TSMAPI_FOUR.Item.FilterItemString(itemString)
	local value = nil
	if tbl[itemString] then
		value = tbl[itemString][key]
	else
		local quality = TSMAPI_FOUR.Item.GetQuality(itemString)
		local itemLevel = TSMAPI_FOUR.Item.GetItemLevel(itemString)
		local classId = TSMAPI_FOUR.Item.GetClassId(itemString)
		if quality and quality >= 2 and itemLevel and itemLevel >= TSM.CONST.MIN_BONUS_ID_ITEM_LEVEL and (classId == LE_ITEM_CLASS_WEAPON or classId == LE_ITEM_CLASS_ARMOR) then
			if strmatch(itemString, "^i:[0-9]+:[0-9%-]*:") then return end
		end
		local baseItemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
		if not baseItemString then return end
		value = tbl[baseItemString] and tbl[baseItemString][key]
	end
	if not value or value <= 0 then return end
	return value
end

function private.GetRegionItemDataHelper(tbl, key, itemString)
	if not itemString or not tbl then
		return
	end
	itemString = TSMAPI_FOUR.Item.FilterItemString(itemString)
	local fieldIndex = tbl.fieldLookup[key] - 1
	assert(fieldIndex and fieldIndex > 0)
	local data = tbl.itemLookup[itemString]
	if not data and not strmatch(itemString, "^[ip]:[0-9]+$") then
		-- for items with random enchants or for pets, get data for the base item
		local quality = TSMAPI_FOUR.Item.GetQuality(itemString)
		local itemLevel = TSMAPI_FOUR.Item.GetItemLevel(itemString)
		local classId = TSMAPI_FOUR.Item.GetClassId(itemString)
		if quality and quality >= 2 and itemLevel and itemLevel >= TSM.CONST.MIN_BONUS_ID_ITEM_LEVEL and (classId == LE_ITEM_CLASS_WEAPON or classId == LE_ITEM_CLASS_ARMOR) then
			if strmatch(itemString, "^i:[0-9]+:[0-9%-]*:") then
				return
			end
		end
		itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString)
		if not itemString then return end
		data = tbl.itemLookup[itemString]
	end
	if not data then
		return
	end
	if type(data) == "string" then
		local tblData = {strsplit(",", data)}
		for i = 1, #tblData do
			tblData[i] = tonumber(tblData[i])
		end
		tbl.itemLookup[itemString] = tblData
		data = tblData
	end
	local value = data[fieldIndex]
	if not value or value <= 0 then
		return
	end
	return value
end
