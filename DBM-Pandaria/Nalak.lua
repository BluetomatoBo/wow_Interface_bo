if select(4, GetBuildInfo()) < 50200 then return end--Don't load on live
local mod	= DBM:NewMod(814, "DBM-Pandaria", nil, 322)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 8441 $"):sub(12, -3))
--mod:SetCreatureID(69161)--Not yet available in PTR, CID not known
--mod:SetModelID(41448)
mod:SetZone(928)--Lightning Isle

mod:RegisterCombat("combat")
mod:SetWipeTime(120)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START"
)

