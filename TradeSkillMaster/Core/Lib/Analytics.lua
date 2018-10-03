-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Analytics = TSM:NewPackage("Analytics")
local private = { events = {}, lastEventTime = nil, argsTemp = {} }
local MAX_ANALYTICS_AGE = 14 * 24 * 60 * 60 -- 2 weeks
local HIT_TYPE_IS_VALID = {
	PV = true,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Analytics.PageView(path)
	assert(type(path) == "string" and strmatch(path, "^[a-zA-Z_%-0-9/]+$"))
	private.InsertHit("PV", path)
end

function Analytics.Save(appDB)
	appDB.analytics = appDB.analytics or {updateTime=0, data={}}
	if private.lastEventTime then
		appDB.analytics.updateTime = private.lastEventTime
	end
	-- remove any events which are too old
	for i = #appDB.analytics.data, 1, -1 do
		local eventTime = strmatch(appDB.analytics.data[i], "([0-9]+)%]$") or ""
		if (tonumber(eventTime) or 0) < time() - MAX_ANALYTICS_AGE then
			tremove(appDB.analytics.data, i)
		end
	end
	for _, event in ipairs(private.events) do
		tinsert(appDB.analytics.data, event)
	end
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.InsertHit(hitType, ...)
	assert(HIT_TYPE_IS_VALID[hitType])
	wipe(private.argsTemp)
	for i = 1, select("#", ...) do
		local arg = select(i, ...)
		local argType = type(arg)
		if argType == "string" then
			arg = private.AddQuotes(arg)
		elseif argType == "number" then
			-- pass
		else
			error("Invalid arg type: "..argType)
		end
		tinsert(private.argsTemp, arg)
	end
	tinsert(private.events, "["..strjoin(",", private.AddQuotes(hitType), private.AddQuotes(TSM:GetVersion() or "???"), time(), unpack(private.argsTemp)).."]")
	private.lastEventTime = time()
end

function private.AddQuotes(str)
	return "\""..str.."\""
end
