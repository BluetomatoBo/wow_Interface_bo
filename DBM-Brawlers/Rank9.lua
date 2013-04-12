local mod	= DBM:NewMod("BrawlRank9", "DBM-Brawlers")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 9223 $"):sub(12, -3))
--mod:SetCreatureID(60491)
--mod:SetModelID(46265)
mod:SetZone()

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS"
)

mod:RemoveOption("HealthFrame")
mod:RemoveOption("SpeedKillTimer")

local brawlersMod = DBM:GetModByName("Brawlers")