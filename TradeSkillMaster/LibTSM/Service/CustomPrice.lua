-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- Custom Price Functions
-- @module CustomPrice

local _, TSM = ...
local CustomPrice = TSM.Init("Service.CustomPrice")
local L = TSM.Include("Locale").GetTable()
local DisenchantInfo = TSM.Include("Data.DisenchantInfo")
local TempTable = TSM.Include("Util.TempTable")
local Table = TSM.Include("Util.Table")
local Math = TSM.Include("Util.Math")
local Money = TSM.Include("Util.Money")
local String = TSM.Include("Util.String")
local Log = TSM.Include("Util.Log")
local ItemString = TSM.Include("Util.ItemString")
local ItemInfo = TSM.Include("Service.ItemInfo")
local Settings = TSM.Include("Service.Settings")
local Conversions = TSM.Include("Service.Conversions")
local private = {
	context = {},
	priceSourceKeys = {},
	priceSourceInfo = {},
	customPriceCache = {},
	priceCache = {},
	priceCacheActive = nil,
	proxyData = {},
	settings = nil,
}
local ITEM_STRING_PATTERN = "[ip]:[0-9:%-]+"
local MONEY_PATTERNS = {
	"([0-9]+g[ ]*[0-9]+s[ ]*[0-9]+c)", -- g/s/c
	"([0-9]+g[ ]*[0-9]+s)", -- g/s
	"([0-9]+g[ ]*[0-9]+c)", -- g/c
	"([0-9]+s[ ]*[0-9]+c)", -- s/c
	"([0-9]+g)", -- g
	"([0-9]+s)", -- s
	"([0-9]+c)", -- c
}
local MATH_FUNCTIONS = {
	["avg"] = "self._avg",
	["min"] = "self._min",
	["max"] = "self._max",
	["first"] = "self._first",
	["check"] = "self._check",
	["ifgt"] = "self._ifgt",
	["ifgte"] = "self._ifgte",
	["iflt"] = "self._iflt",
	["iflte"] = "self._iflte",
	["ifeq"] = "self._ifeq",
	["round"] = "self._round",
	["roundup"] = "self._roundup",
	["rounddown"] = "self._rounddown",
}
local CUSTOM_PRICE_FUNC_TEMPLATE = [[
	return function(self, _item, _baseitem)
		local isTop
		local context = self.globalContext
		if not context.num then
			context.num = 0
			isTop = true
		end
		context.num = context.num + 1
		if context.num > 100 then
			if (context.lastPrint or 0) + 1 < time() then
				context.lastPrint = time()
				self.loopError(self.origStr)
			end
			return
		end

		local result = floor((%s) + 0.5)
		if context.num then
			context.num = context.num - 1
		end
		if isTop then
			context.num = nil
		end
		if not result or self.IsInvalid(result) or result <= 0 then return end
		return result
	end
]]
local NAN = math.huge * 0
local NAN_STR = tostring(NAN)
local function IsInvalid(num)
	-- We want to treat math.huge/-math.huge/NAN as invalid.
	return num == math.huge or num == -math.huge or tostring(num) == NAN_STR
end
-- Make sure our IsInvalid function continues to work as expected
assert(IsInvalid(NAN) and IsInvalid(math.huge) and IsInvalid(math.huge) and not IsInvalid(0) and not IsInvalid(1000))
local COMPARISONS = {
	["gt"] = 1,
	["gte"] = 2,
	["lt"] = 3,
	["lte"] = 4,
	["eq"] = 5,
}



-- ============================================================================
-- Module Loading
-- ============================================================================

CustomPrice:OnSettingsLoad(function()
	private.settings = Settings.NewView()
		:AddKey("global", "userData", "customPriceSources")

	for name in pairs(private.settings.customPriceSources) do
		if not CustomPrice.ValidateName(name, true) then
			Log.PrintfUser(L["Removed custom price source (%s) which has an invalid name."], name)
			CustomPrice.DeleteCustomPriceSource(name)
		end
	end
end)



-- ============================================================================
-- Module Functions
-- ============================================================================

--- Register a built-in price source.
-- @tparam string moduleName The name of the module which provides this source
-- @tparam string key The key for this price source (i.e. DBMarket)
-- @tparam string label The label which describes this price source for display to the user
-- @tparam function callback The price source callback
-- @tparam[opt=false] boolean fullLink Whether or not the full itemLink is required instead of just the itemString
-- @param[opt] arg An additional argument which is passed to the callback
function CustomPrice.RegisterSource(moduleName, key, label, callback, fullLink, arg)
	tinsert(private.priceSourceKeys, strlower(key))
	private.priceSourceInfo[strlower(key)] = {
		moduleName = moduleName,
		key = key,
		label = label,
		callback = callback,
		takeItemString = not fullLink,
		arg = arg,
	}
end

--- Create a new custom price source.
-- @tparam string name The name of the custom price source
-- @tparam string value The value of the custom price source
function CustomPrice.CreateCustomPriceSource(name, value)
	assert(name ~= "")
	assert(gsub(name, "([a-z]+)", "") == "")
	assert(not private.settings.customPriceSources[name])
	private.settings.customPriceSources[name] = value
	wipe(private.customPriceCache)
end

--- Rename a custom price source.
-- @tparam string oldName The old name of the custom price source
-- @tparam string newName The new name of the custom price source
function CustomPrice.RenameCustomPriceSource(oldName, newName)
	if oldName == newName then return end
	assert(private.settings.customPriceSources[oldName])
	private.settings.customPriceSources[newName] = private.settings.customPriceSources[oldName]
	private.settings.customPriceSources[oldName] = nil
	wipe(private.customPriceCache)
end

--- Delete a custom price source.
-- @tparam string name The name of the custom price source
function CustomPrice.DeleteCustomPriceSource(name)
	assert(private.settings.customPriceSources[name])
	private.settings.customPriceSources[name] = nil
	wipe(private.customPriceCache)
end

--- Print built-in price sources to chat.
function CustomPrice.PrintSources()
	Log.PrintfUser(L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."], "|cff99ffff")
	local moduleList = TempTable.Acquire()

	for _, info in pairs(private.priceSourceInfo) do
		if not tContains(moduleList, info.moduleName) then
			tinsert(moduleList, info.moduleName)
		end
	end
	sort(moduleList, private.ModuleSortFunc)

	for _, module in ipairs(moduleList) do
		Log.PrintUserRaw("|cffffff00"..module..":|r")
		local lines = TempTable.Acquire()
		for _, info in pairs(private.priceSourceInfo) do
			if info.moduleName == module then
				tinsert(lines, format("  %s%s|r (%s)", "|cff99ffff", info.key, info.label))
			end
		end
		sort(lines)
		for _, line in ipairs(lines) do
			Log.PrintfUserRaw(line)
		end
		TempTable.Release(lines)
	end

	TempTable.Release(moduleList)
end

function CustomPrice.GetDescription(key)
	local info = private.priceSourceInfo[key]
	return info and info.label or nil
end

--- Validate a custom price name.
-- @tparam string customPriceName The custom price name
-- @tparam[opt=false] boolean ignoreExistingCustomPriceSources Whether or not to ignore existing custom price sources
-- @treturn boolean Whether or not the custom price name is valid
function CustomPrice.ValidateName(customPriceName, ignoreExistingCustomPriceSources)
	-- custom price names must be lowercase
	if strlower(customPriceName) ~= customPriceName then
		return false
	end
	-- User defined price sources
	if not ignoreExistingCustomPriceSources and private.settings.customPriceSources[customPriceName] then
		return false
	end
	-- TSM defined price sources
	for source in CustomPrice.Iterator() do
		if strlower(source) == strlower(customPriceName) then
			return false
		end
	end
	-- Math Functions
	for mathFunction in pairs(MATH_FUNCTIONS) do
		if strlower(mathFunction) == strlower(customPriceName) then
			return false
		end
	end
	-- Comparisons
	for comparison in pairs(COMPARISONS) do
		if strlower(comparison) == strlower(customPriceName) then
			return false
		end
	end
	return true
end

--- Validate a custom price string.
-- @tparam string customPriceStr The custom price string
-- @tparam ?table badPriceSources A table of price sources (as keys) which aren't allowed to be used
-- @treturn boolean Whether or not the custom price string is valid
-- @treturn ?string The error message if the custom price string was invalid
function CustomPrice.Validate(customPriceStr, badPriceSources)
	local func, err = private.ParseCustomPrice(customPriceStr, badPriceSources)
	return func and true or false, err
end

--- Evaulates a custom price source for an item.
-- @tparam string customPriceStr The custom price string
-- @tparam string itemString The item to evalulate the custom price string for
-- @treturn ?number The resulting value or nil if the custom price string is invalid
-- @treturn ?string The error message if the custom price string was invalid
function CustomPrice.GetValue(customPriceStr, itemString)
	local func, err = private.ParseCustomPrice(customPriceStr)
	if not func then
		return nil, err
	end
	local value = nil
	if not private.priceCacheActive then
		assert(not next(private.priceCache))
		private.priceCacheActive = true
		value = func(itemString)
		wipe(private.priceCache)
		private.priceCacheActive = nil
	else
		value = func(itemString)
	end
	return value
end

--- Gets a built-in price source's value for an item.
-- @tparam string itemString The item to evalulate the price source for
-- @tparam string key The key of the price source
-- @treturn ?number The resulting value or nil if no price was found for the item
function CustomPrice.GetItemPrice(itemString, key)
	itemString = ItemString.Get(itemString)
	if not itemString then return end

	local info = private.priceSourceInfo[strlower(key)]
	if not info then return end
	if not info.takeItemString then
		-- this price source does not take an itemString, so pass it an itemLink instead
		itemString = ItemInfo.GetLink(itemString)
		if not itemString then return end
	end
	local value = info.callback(itemString, info.arg)
	return type(value) == "number" and value or nil
end

function CustomPrice.GetConversionsValue(sourceItemString, customPrice, method)
	if not customPrice then return end

	-- calculate disenchant value first
	if (not method or method == Conversions.METHOD.DISENCHANT) and ItemInfo.IsDisenchantable(sourceItemString) then
		local quality = ItemInfo.GetQuality(sourceItemString)
		local ilvl = ItemInfo.GetItemLevel(ItemString.GetBase(sourceItemString)) or 0
		local classId = ItemInfo.GetClassId(sourceItemString)
		local value = 0
		if quality and ilvl and classId then
			for targetItemString in DisenchantInfo.TargetItemIterator() do
				local amountOfMats = DisenchantInfo.GetTargetItemSourceInfo(targetItemString, classId, quality, ilvl)
				if amountOfMats then
					local matValue = CustomPrice.GetValue(customPrice, targetItemString)
					if not matValue or matValue == 0 then
						return
					end
					value = value + matValue * amountOfMats
				end
			end
		end

		value = floor(value)
		if value > 0 then
			return value
		end
	end

	-- calculate other conversion values
	local value = 0
	for targetItemString, rate in Conversions.TargetItemsByMethodIterator(sourceItemString, method) do
		local matValue = CustomPrice.GetValue(customPrice, targetItemString)
		value = value + (matValue or 0) * rate
	end

	value = Math.Round(value)
	return value > 0 and value or nil
end

local function CustomPriceIteratorHelper(_, key)
	local info = private.priceSourceInfo[key]
	return info.key, info.moduleName, info.label
end
--- Iterate over the price sources.
-- @return An iterator which provides the following fields: `key, moduleName, label`
function CustomPrice.Iterator()
	return Table.Iterator(private.priceSourceKeys, CustomPriceIteratorHelper)
end

--- Iterate over the custom price sources needed to make this custom price string calculable.
-- @param string customPriceStr The custom price string
-- @return An iterator of custom price names
function CustomPrice.DependentCustomPriceSourceIterator(customPriceStr)
	local queue = TempTable.Acquire()
	local results = TempTable.Acquire()

	private.AddToCustomPriceDependencyQueue(queue, customPriceStr)
	local name, value = next(queue)
	while value do
		queue[name] = nil
		if private.settings.customPriceSources[name] and not results[name] then
			results[name] = true
			private.AddToCustomPriceDependencyQueue(queue, private.settings.customPriceSources[name])
			tinsert(results, name)
		end
		name, value = next(queue)
	end
	TempTable.Release(queue)
	return TempTable.Iterator(results)
end



-- ============================================================================
-- Helper Functions
-- ============================================================================

private.customPriceFunctions = {
	IsInvalid = IsInvalid,
	loopError = function(str)
		Log.PrintfUser("%s |cff99ffff%s|r", L["Loop detected in the following custom price:"], str)
	end,
	_avg = function(...)
		local total, count = 0, 0
		for i = 1, select('#', ...) do
			local num = select(i, ...)
			if type(num) == "number" and not IsInvalid(num) then
				total = total + num
				count = count + 1
			end
		end
		return count == 0 and NAN or (total / count)
	end,
	_min = function(...)
		local minVal
		for i = 1, select('#', ...) do
			local num = select(i, ...)
			if type(num) == "number" and not IsInvalid(num) and (not minVal or num < minVal) then
				minVal = num
			end
		end
		return minVal or NAN
	end,
	_max = function(...)
		local maxVal
		for i = 1, select('#', ...) do
			local num = select(i, ...)
			if type(num) == "number" and not IsInvalid(num) and (not maxVal or num > maxVal) then
				maxVal = num
			end
		end
		return maxVal or NAN
	end,
	_first = function(...)
		for i = 1, select('#', ...) do
			local num = select(i, ...)
			if type(num) == "number" and not IsInvalid(num) then
				return num
			end
		end
		return NAN
	end,
	_check = function(check, ...)
		return private.RunComparison(COMPARISONS.gt, check, 0, ...)
	end,
	_ifgt = function(...)
		return private.RunComparison(COMPARISONS.gt, ...)
	end,
	_ifgte = function(...)
		return private.RunComparison(COMPARISONS.gte, ...)
	end,
	_iflt = function(...)
		return private.RunComparison(COMPARISONS.lt, ...)
	end,
	_iflte = function(...)
		return private.RunComparison(COMPARISONS.lte, ...)
	end,
	_ifeq = function(...)
		return private.RunComparison(COMPARISONS.eq, ...)
	end,
	_round = function(...)
		if select('#', ...) < 1 or select('#', ...) > 2 then return NAN end
		return Math.Round(...)
	end,
	_roundup = function(...)
		if select('#', ...) < 1 or select('#', ...) > 2 then return NAN end
		return Math.Ceil(...)
	end,
	_rounddown = function(...)
		if select('#', ...) < 1 or select('#', ...) > 2 then return NAN end
		return Math.Floor(...)
	end,
	_priceHelper = function(itemString, key, extraParam)
		itemString = ItemString.Get(itemString)
		if not itemString then
			return NAN
		end
		local cacheKey = itemString..key..tostring(extraParam)
		if not private.priceCache[cacheKey] then
			if key == "convert" then
				local minPrice = nil
				local conversions = Conversions.GetSourceItems(itemString)
				if conversions then
					for sourceItemString, rate in pairs(conversions) do
						local price = CustomPrice.GetItemPrice(sourceItemString, extraParam)
						if price then
							price = price / rate
							minPrice = min(minPrice or price, price)
						end
					end
				end
				private.priceCache[cacheKey] = minPrice or NAN
			elseif extraParam == "custom" then
				private.priceCache[cacheKey] = CustomPrice.GetValue(private.settings.customPriceSources[key], itemString) or NAN
			else
				private.priceCache[cacheKey] = CustomPrice.GetItemPrice(itemString, key) or NAN
			end
		end
		return private.priceCache[cacheKey] or NAN
	end,
}
private.proxyMT = {
	__index = function(self, index)
		local data = private.proxyData[self]
		if private.customPriceFunctions[index] then
			return private.customPriceFunctions[index]
		elseif index == "globalContext" or index == "origStr" then
			-- these keys can always be accessed
			return data[index]
		end
		if not data.isUnlocked then error("Attempt to access a hidden table", 2) end
		return data[index]
	end,
	__newindex = function(self, index, value)
		local data = private.proxyData[self]
		if not data.isUnlocked then error("Attempt to modify a hidden table", 2) end
		data[index] = value
	end,
	__call = function(self, item)
		local data = private.proxyData[self]
		data.isUnlocked = true
		local result = self.func(self, item, ItemString.GetBase(item))
		data.isUnlocked = false
		return result
	end,
	__metatable = false,
}

function private.RunComparison(comparison, ...)
	if select('#', ...) > 4 then return NAN end

	local leftCheck, rightCheck, ifValue, elseValue = ...
	leftCheck = leftCheck or NAN
	rightCheck = rightCheck or NAN
	ifValue = ifValue or NAN
	elseValue = elseValue or NAN

	if IsInvalid(leftCheck) or IsInvalid(rightCheck) then
		return NAN
	elseif comparison == COMPARISONS.gt then
		return leftCheck > rightCheck and ifValue or elseValue
	elseif comparison == COMPARISONS.gte then
		return leftCheck >= rightCheck and ifValue or elseValue
	elseif comparison == COMPARISONS.lt then
		return leftCheck < rightCheck and ifValue or elseValue
	elseif comparison == COMPARISONS.lte then
		return leftCheck <= rightCheck and ifValue or elseValue
	elseif comparison == COMPARISONS.eq then
		return leftCheck == rightCheck and ifValue or elseValue
	else
		error("Error in custom price comparison")
	end
end

function private.CreateCustomPriceObj(func, origStr)
	local proxy = newproxy(true)
	private.proxyData[proxy] = {
		isUnlocked = false,
		globalContext = private.context,
		origStr = origStr,
		func = func,
	}
	local mt = getmetatable(proxy)
	for key, value in pairs(private.proxyMT) do
		mt[key] = value
	end
	return proxy
end

function private.ParsePriceString(str, badPriceSources)
	if tonumber(str) then
		return private.CreateCustomPriceObj(function() return tonumber(str) end, str)
	end

	local origStr = str
	-- put a space at the start and end
	str = " "..str.." "
	-- remove any colors around gold/silver/copper
	while true do
		local num1, num2, num3
		str, num1 = gsub(str, "\124cff[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]g\124r", "g")
		str, num2 = gsub(str, "\124cff[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]s\124r", "s")
		str, num3 = gsub(str, "\124cff[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]c\124r", "c")
		if num1 + num2 + num3 == 0 then break end
	end
	-- replace old itemStrings with the new format
	str = gsub(str, "([^h]i)tem:([0-9:%-]+)", "%1:%2")

	-- replace all formatted gold amount with their copper value
	local start = 1
	local goldAmountContinue = true
	while goldAmountContinue do
		goldAmountContinue = false
		local minFindStart, minFindEnd, minFindSub = nil, nil, nil
		for _, pattern in ipairs(MONEY_PATTERNS) do
			local s, e, sub = strfind(str, pattern, start)
			if s and (not minFindStart or minFindStart > s) then
				minFindStart = s
				minFindEnd = e
				minFindSub = sub
			end
		end
		if minFindStart then
			if strmatch(strsub(str, minFindStart-1, minFindStart-1), "[0-9a-zA-Z]") or strmatch(strsub(str, minFindEnd+1, minFindEnd+1), "[0-9a-zA-Z]") then
				return nil, L["Invalid gold value."]
			end
			local value = Money.FromString(minFindSub)
			if not value then
				-- sanity check
				return nil, L["Invalid function."]
			end
			local preStr = strsub(str, 1, minFindStart - 1)
			local postStr = strsub(str, minFindEnd + 1)
			str = preStr .. value .. postStr
			start = #str - #postStr + 1
			goldAmountContinue = true
		end
	end

	-- remove up to 1 occurance of convert(priceSource[, item])
	local convertPriceSource, convertItem
	local convertParams = strmatch(str, "[^a-z]convert%((.-)%)")
	if convertParams then
		local convertItemLink = strmatch(convertParams, "\124c.-\124r")
		local convertItemString = strmatch(convertParams, ITEM_STRING_PATTERN)
		if convertItemLink then -- check for itemLink in convert params
			convertItem = ItemString.Get(convertItemLink)
			if not convertItem then
				return nil, L["Invalid item link."]  -- there's an invalid item link in the convertParams
			end
			convertPriceSource = strmatch(convertParams, "^ *(.-) *,")
		elseif convertItemString then -- check for itemString in convert params
			convertItem = convertItemString
			convertPriceSource = strmatch(convertParams, "^ *(.-) *,")
		else
			convertPriceSource = gsub(convertParams, ", *$", "")
			convertPriceSource = strtrim(convertPriceSource)
		end
		if convertPriceSource and ((badPriceSources and badPriceSources[convertPriceSource]) or convertPriceSource == "matprice") then
			return nil, format(L["You cannot use %s within convert() as part of this custom price."], convertPriceSource)
		end

		-- can't allow custom price sources in convert, so just check regular ones
		if not private.priceSourceInfo[convertPriceSource] then
			return nil, L["Invalid price source in convert."]
		end
		local num = 0
		str, num = gsub(str, "([^a-z])convert%(.-%)", "%1~convert~")
		if num > 1 then
			return nil, L["A maximum of 1 convert() function is allowed."]
		end
	end

	while true do
		local itemLink = strmatch(str, "\124c.*\124r")
		if not itemLink then break end
		local _, endIndex = strfind(itemLink, "\124r")
		itemLink = strsub(itemLink, 1, endIndex)
		local itemString = ItemString.Get(itemLink)
		if not itemString then
			-- there's an invalid item link in the str
			return nil, L["Invalid item link."]
		end
		str = gsub(str, String.Escape(itemLink), itemString)
	end

	-- make sure there's spaces on either side of math operators
	str = gsub(str, "[%-%+%/%*%^]", " %1 ")
	-- make sure there's a space to the right of % signs
	str = gsub(str, "[%%]", "%1 ")
	-- convert percentages to decimal numbers
	str = gsub(str, "([0-9%.]+)%%", "( %1 / 100 ) *")
	-- ensure a space on either side of item strings and remove parentheses around them
	str = gsub(str, "%([ ]*("..ITEM_STRING_PATTERN..")[ ]*%)", " %1 ")
	-- ensure a space on either side of baseitem arguments and remove parentheses around them
	str = gsub(str, "%([ ]*(baseitem)[ ]*%)", " ~baseitem~ ")
	-- ensure a space on either side of parentheses and commas
	str = gsub(str, "[%(%),]", " %1 ")
	-- remove any occurances of more than one consecutive space
	str = gsub(str, " [ ]+", " ")

	-- ensure equal number of left/right parenthesis
	if select(2, gsub(str, "%(", "")) ~= select(2, gsub(str, "%)", "")) then
		return nil, L["Unbalanced parentheses."]
	end

	-- validate all words in the string
	local parts = String.SafeSplit(strtrim(str), " ")
	local i = 1
	while i <= #parts do
		local word = parts[i]
		if strmatch(word, "^[%-%+%/%*%^]$") then
			if i == #parts then
				return nil, L["Invalid operator at end of custom price."]
			end
			-- valid math operator
		elseif badPriceSources and badPriceSources[word] then
			-- price source that's explicitly invalid
			return nil, format(L["You cannot use %s as part of this custom price."], word)
		elseif private.priceSourceInfo[word] or private.settings.customPriceSources[word] then
			-- make sure we're not trying to take the price source of a number
			if parts[i+1] == "(" and type(parts[i+2]) == "string" and not strfind(parts[i+2], "^[ip].*:") then
				return nil, L["Invalid parameter to price source."]
			end
			-- valid price source
		elseif tonumber(word) then
			-- make sure it's not an itemID (incorrect)
			if i > 2 and parts[i-1] == "(" and (private.priceSourceInfo[parts[i-2]] or private.settings.customPriceSources[parts[i-2]]) then
				return nil, L["Invalid parameter to price source."]
			end
			-- valid number
		elseif strmatch(word, "^"..ITEM_STRING_PATTERN.."$") or word == "~baseitem~" then
			-- make sure previous word was a price source
			if i > 1 and (private.priceSourceInfo[parts[i-1]] or private.settings.customPriceSources[parts[i-1]]) then
				-- valid item parameter
			else
				return nil, L["Item links may only be used as parameters to price sources."]
			end
		elseif word == "(" then
			-- empty parenthesis are not allowed
			if not parts[i+1] or parts[i+1] == ")" then
				return nil, L["Empty parentheses are not allowed"]
			end
			-- should never have ") ("
			if i > 1 and parts[i-1] == ")" then
				return nil, L["Missing operator between sets of parenthesis"]
			end
		elseif word == ")" then
			-- valid parenthesis
		elseif word == "," then
			if not parts[i+1] or parts[i+1] == ")" then
				return nil, L["Misplaced comma"]
			else
				-- we're hoping this is a valid comma within a function, will be caught by loadstring otherwise
			end
		elseif MATH_FUNCTIONS[word] then
			if not parts[i+1] or parts[i+1] ~= "(" then
				return nil, format(L["Invalid word: '%s'"], word)
			end
			-- valid math function
		elseif word == "~convert~" then
			-- valid convert statement
		elseif strtrim(word) == "" then
			-- harmless extra spaces
		else
			-- check if this is an operation export that they tried to use as a custom price
			if strfind(word, "^%^1%^t%^") then
				return nil, L["This looks like an exported operation and not a custom price."]
			end
			return nil, format(L["Invalid word: '%s'"], word)
		end
		i = i + 1
	end

	for key in pairs(private.settings.customPriceSources) do
		str = private.PriceSourceParsingHelper(str, strlower(key), "custom")
	end

	for key in pairs(private.priceSourceInfo) do
		str = private.PriceSourceParsingHelper(str, key)
	end

	-- replace "~convert~" appropriately
	if convertPriceSource then
		convertItem = convertItem and ('"'..convertItem..'"') or "_item"
		str = gsub(str, "~convert~", format("self._priceHelper(%s, \"convert\", \"%s\")", convertItem, convertPriceSource))
	end

	-- replace math functions with special custom function names
	for word, funcName in pairs(MATH_FUNCTIONS) do
		str = gsub(str, " "..word.." ", " "..funcName.." ")
	end

	-- finally, create and return the function
	local func, loadErr = loadstring(format(CUSTOM_PRICE_FUNC_TEMPLATE, str), "TSMCustomPrice: "..origStr)
	if loadErr then
		loadErr = gsub(strtrim(loadErr), "([^:]+):.", "")
		return nil, L["Invalid function."].." "..L["Details"]..": "..loadErr
	end
	local success = nil
	success, func = pcall(func)
	if not success then
		return nil, L["Invalid function."]
	end
	return private.CreateCustomPriceObj(func, origStr)
end

function private.PriceSourceParsingHelper(str, key, extraArg)
	extraArg = extraArg and (",\""..extraArg.."\"") or ""
	-- replace all "<priceSource> <itemString>" occurances with the proper parameters (with the itemString)
	str = gsub(str, format(" %s (%s) ", key, ITEM_STRING_PATTERN), format(" self._priceHelper(\"%%1\",\"%s\"%s) ", key, extraArg))
	-- replace all "<priceSource> baseitem" occurances with the proper parameters (with _baseitem for the item)
	str = gsub(str, format(" %s ~baseitem~ ", key), format(" self._priceHelper(_baseitem,\"%s\"%s) ", key, extraArg))
	-- replace all "<priceSource>" occurances with the proper parameters (with _item for the item)
	str = gsub(str, format(" %s ", key), format(" self._priceHelper(_item,\"%s\"%s) ", key, extraArg))
	return str
end

function private.ParseCustomPrice(customPriceStr, badPriceSources)
	customPriceStr = customPriceStr and strlower(strtrim(tostring(customPriceStr)))
	customPriceStr = Money.FromString(customPriceStr) and gsub(customPriceStr, String.Escape(LARGE_NUMBER_SEPERATOR), "") or customPriceStr
	if not customPriceStr or customPriceStr == "" then
		return nil, L["Empty price string."]
	end

	if badPriceSources then
		return private.ParsePriceString(customPriceStr, badPriceSources)
	end

	if not private.customPriceCache[customPriceStr] then
		private.customPriceCache[customPriceStr] = {private.ParsePriceString(customPriceStr)}
	end
	return unpack(private.customPriceCache[customPriceStr])
end

function private.ModuleSortFunc(a, b)
	if a == "TradeSkillMaster" then
		return true
	elseif b == "TradeSkillMaster" then
		return false
	else
		return a < b
	end
end

function private.AddToCustomPriceDependencyQueue(queue, value)
	value = strlower(value)
	for piece in gmatch(value, "[a-z]+") do
		queue[piece] = true
	end
end
