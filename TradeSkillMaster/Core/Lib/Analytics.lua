-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local private = { events = {}, lastEventTime = nil }
local MAX_ANALYTICS_AGE = 14 * 24 * 60 * 60 -- 2 weeks



-- ============================================================================
-- Module Functions
-- ============================================================================

function TSM.AnalyticsEvent(event, arg)
	if arg == nil then
		arg = ""
	end
	assert(type(event) == "string" and strmatch(event, "^[A-Z_]+$"))
	assert(type(arg) == "string" or type(arg) == "number" or type(arg) == "boolean")
	arg = "\""..gsub(tostring(arg), "\"", "'").."\""
	event = "\""..event.."\""
	local name = "\"TradeSkillMaster\""
	local version = TSM:GetVersion()
	version = "\""..(version or "").."\""
	tinsert(private.events, "["..strjoin(",", name, event, version, arg, time()).."]")
	private.lastEventTime = time()
end

function TSM.SaveAnalytics(appDB)
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
