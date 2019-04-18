local mod	= DBM:NewMod("Heigan", "DBM-Naxx", 3)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("2019041705949")
mod:SetCreatureID(15936)
mod:SetEncounterID(1112)
mod:SetModelID(16309)
mod:RegisterCombat("combat_yell", L.Pull)

local warnTeleportSoon	= mod:NewAnnounce("WarningTeleportSoon", 2, 46573)
local warnTeleportNow	= mod:NewAnnounce("WarningTeleportNow", 3, 46573)

local timerTeleport		= mod:NewTimer(90, "TimerTeleport", 46573, nil, nil, 6)

function mod:DancePhase()
	timerTeleport:Show(47)
	warnTeleportSoon:Schedule(37, 10)
	warnTeleportNow:Schedule(47)
	self:ScheduleMethod(47, "BackInRoom", 88)
end

function mod:BackInRoom(time)
	timerTeleport:Show(time)
	warnTeleportSoon:Schedule(time - 15, 15)
	warnTeleportNow:Schedule(time)
	self:ScheduleMethod(time, "DancePhase")
end

function mod:OnCombatStart(delay)
	self:BackInRoom(90 - delay)
end
