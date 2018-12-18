-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_AppHelper                           --
--                          https://tradeskillmaster.com                          --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
TSMAPI.AppHelper = {}
local private = { data = {} }



function TSM.LoadData(tag, ...)
	private.data[tag] = private.data[tag] or {}
	tinsert(private.data[tag], {...})
end

function TSMAPI.AppHelper:FetchData(tag)
	local data = private.data[tag]
	private.data[tag] = nil
	return data
end

function TSMAPI.AppHelper:IsCurrentRealm(realm)
	return strlower(gsub(realm, "\226", "'")) == strlower(gsub(GetRealmName(), "\226", "'"))
end
