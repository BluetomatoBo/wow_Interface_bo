-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- String Functions
-- @module String

local _, TSM = ...
local String = TSM.Init("Util.String")
local MAGIC_CHARACTERS = {
	["["] = true,
	["]"] = true,
	["("] = true,
	[")"] = true,
	["."] = true,
	["+"] = true,
	["-"] = true,
	["*"] = true,
	["?"] = true,
	["^"] = true,
	["$"] = true,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

--- Splits a string in a way which won't cause stack overflows for large inputs.
-- The lua strsplit function causes a stack overflow if passed large inputs. This API fixes that issue and also supports
-- separators which are more than one character in length.
-- @tparam string str The string to be split
-- @tparam string sep The separator to use to split the string
-- @?tparam[opt=nil] table resultTbl An optional table to store the result in
-- @treturn table The result as a list of substrings
function String.SafeSplit(str, sep, resultTbl)
	resultTbl = resultTbl or {}
	local s = 1
	local sepLength = #sep
	if sepLength == 0 then
		tinsert(resultTbl, str)
		return resultTbl
	end
	while true do
		local e = strfind(str, sep, s)
		if not e then
			tinsert(resultTbl, strsub(str, s))
			break
		end
		tinsert(resultTbl, strsub(str, s, e - 1))
		s = e + sepLength
	end
	return resultTbl
end

--- Escapes any magic characters used by lua's pattern matching.
-- @tparam string str The string to be escaped
-- @treturn string The escaped string
function String.Escape(str)
	assert(not strmatch(str, "\001"), "Input string must not contain '\\001' characters")
	str = gsub(str, "%%", "\001")
	for char in pairs(MAGIC_CHARACTERS) do
		str = gsub(str, "%"..char, "%%"..char)
	end
	str = gsub(str, "\001", "%%%%")
	return str
end

--- Check if a string which contains multiple values separated by a specific string contains the value.
-- @tparam string str The string to be searched
-- @tparam string sep The separating string
-- @tparam string value The value to search for
-- @treturn boolean Whether or not the value was found
-- @within String
function String.SeparatedContains(str, sep, value)
	return str == value or strmatch(str, "^"..value..sep) or strmatch(str, sep..value..sep) or strmatch(str, sep..value.."$")
end

--- Iterates over the parts of a string which are separated by a character.
-- @tparam string str The string to be split
-- @tparam string sep The separator to use to split the string
-- @return An iterator with fields: `part`
-- @within String
function String.SplitIterator(str, sep)
	assert(#sep == 1)
	if MAGIC_CHARACTERS[sep] then
		sep = "%"..sep
	end
	return gmatch(str, "([^"..sep.."]+)")
end
