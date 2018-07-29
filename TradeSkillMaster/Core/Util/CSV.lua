-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- CSV TSMAPI_FOUR Functions
-- @module CSV

TSMAPI_FOUR.CSV = {}



-- ============================================================================
-- TSMAPI Functions
-- ============================================================================

function TSMAPI_FOUR.CSV.EncodeStart(keys)
	local context = { keys = keys, lines = {}, lineParts = {} }
	tinsert(context.lines, table.concat(keys, ","))
	return context
end

function TSMAPI_FOUR.CSV.EncodeAddRowData(context, data)
	wipe(context.lineParts)
	for _, key in ipairs(context.keys) do
		tinsert(context.lineParts, data[key] or "")
	end
	tinsert(context.lines, table.concat(context.lineParts, ","))
end

function TSMAPI_FOUR.CSV.EncodeAddRowDataRaw(context, ...)
	tinsert(context.lines, strjoin(",", ...))
end

function TSMAPI_FOUR.CSV.EncodeEnd(context)
	return table.concat(context.lines, "\n")
end

function TSMAPI_FOUR.CSV.Encode(keys, data)
	local context = TSMAPI_FOUR.CSV.EncodeStart(keys)
	for _, row in ipairs(data) do
		TSMAPI_FOUR.CSV.EncodeAddRowData(context, row)
	end
	return TSMAPI_FOUR.CSV.EncodeEnd(context)
end

function TSMAPI_FOUR.CSV.Decode(str)
	local keys = nil
	local result = {}
	local numResult = 0
	for line in gmatch(str, "[^\n]+") do
		if not keys then
			keys = { strsplit(",", line) }
		else
			local entry = {}
			local lineParts = { strsplit(",", line) }
			for i, key in ipairs(keys) do
				local linePart = lineParts[i]
				if linePart ~= "" then
					entry[key] = tonumber(linePart) or linePart
				end
			end
			numResult = numResult + 1
			result[numResult] = entry
		end
	end
	return keys, result
end
