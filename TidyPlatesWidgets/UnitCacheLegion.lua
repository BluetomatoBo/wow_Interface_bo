

local ReputationStringList = {
	[FACTION_STANDING_LABEL1] = true, -- "Hated";
	[FACTION_STANDING_LABEL2] = true, -- "Hostile";
	[FACTION_STANDING_LABEL3] = true, -- "Unfriendly";
	[FACTION_STANDING_LABEL4] = true, -- "Neutral";
	[FACTION_STANDING_LABEL5] = true, -- "Friendly";
	[FACTION_STANDING_LABEL6] = true, -- "Honored";
	[FACTION_STANDING_LABEL7] = true, -- "Revered";
	[FACTION_STANDING_LABEL8] = true, -- "Exalted";
}

local myRealm = GetRealmName("player")
local inInstance

local function DumbFunction()
	return false
end

TidyPlatesUtility.CachedUnitDescription = DumbFunction

TidyPlatesUtility.IsFriend = DumbFunction
TidyPlatesUtility.IsGuildmate = DumbFunction

TidyPlatesUtility.InstanceStatus = DumbFunction
TidyPlatesUtility.EnableUnitCache = DumbFunction
TidyPlatesUtility.DisableUnitCache = DumbFunction



