﻿if select(4, GetBuildInfo()) < 50200 then return end--Don't load on live
local mod	= DBM:NewMod(826, "DBM-Pandaria", nil, 322)
local L		= mod:GetLocalizedStrings()
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 8525 $"):sub(12, -3))
mod:SetCreatureID(69161)--Not yet available in PTR, CID not known
--mod:SetModelID(41448)
mod:SetZone(929)--No map ID for area yet. Lightning Isle

mod:RegisterCombat("combat")
mod:SetWipeTime(120)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED"
)

local warnCrush					= mod:NewStackAnnounce(137504, 2, nil, mod:IsTank() or mod:IsHealer())--Cast every 30 seconds roughly, lasts 1 minute. you need 3 tanks to be able to tank the boss without debuff. 2 tanks CAN do but they will always have 1 stack and take 25% more damage
local warnPiercingRoar			= mod:NewSpellAnnounce(137457, 2, nil)
local warnSpiritfireBeam		= mod:NewTargetAnnounce(137511, 3)
local warnFrillBlast			= mod:NewSpellAnnounce(137505, 4, mod:IsTank() or mod:IsHealer())

local specWarnCrush				= mod:NewSpecialWarningTarget(137504, mod:IsTank())--This should not go over 1 stack so don't need stack warning just a "taunt the boss" warning
local specWarnFrillBlast		= mod:NewSpecialWarningSpell(137505, mod:IsTank())
local specWarnPiercingRoar		= mod:NewSpecialWarningSpell(137457)

local timerCrush				= mod:NewTargetTimer(60, 137504, nil, mod:IsTank() or mod:IsHealer())
local timerCrushCD				= mod:NewCDTimer(32, 137504)
local timerPiercingRoarCD		= mod:NewCDTimer(29, 137457)--29-34sec variation
local timerSpiritfireBeamCD		= mod:NewCDTimer(25, 137511)--25-30sec variation
local timerFrillBlastCD			= mod:NewCDTimer(25, 137505, nil, mod:IsTank() or mod:IsHealer())--25-30sec variation

mod:AddBoolOption("RangeFrame", true)

local numberTanks = 0

local function isTank(unit)
	-- 1. check blizzard tanks first
	-- 2. check blizzard roles second
	-- 3. check boss1's highest threat target
	if GetPartyAssignment("MAINTANK", unit, 1) then
		return true
	end
	if UnitGroupRolesAssigned(unit) == "TANK" then
		return true
	end
	if UnitExists("boss1target") and UnitDetailedThreatSituation(unit, "boss1") then
		return true
	end
	return false
end

local function findTanks()
	for i=1, MAX_RAID_MEMBERS do
		if isTank(i) then
			numberTanks = numberTanks + 1
		end
	end
	--If we could not find at least 2, set it to 2
	if numberTanks < 2 then
		numberTanks = 2
	end
end

function mod:OnCombatStart(delay)
	findTanks()
--	timerCrushCD:Start(-delay)
--	timerPiercingRoarCD:Start(-delay)
--	timerSpiritfireBeamCD:Start(-delay)
--	timerFrillBlastCD:Start(-delay)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)--range is guessed. spell tooltip and EJ do not save what range is right now.
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(137457) then --咆哮
		warnPiercingRoar:Show()
		timerPiercingRoarCD:Start()
		if mod:IsManaUser() and mod:IsRanged() then
			DBM.Flash:Show(1, 0, 0)
			specWarnPiercingRoar:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\stopcast.mp3") --停止施法
		end
	elseif args:IsSpellID(137505) then --衝擊
		warnFrillBlast:Show()
		specWarnFrillBlast:Show()
		timerFrillBlastCD:Start()
		if mod:IsTank() then
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop2_cjkd.mp3") --衝擊快躲(待錄)
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop2_cjzb.mp3") --衝擊準備(待錄)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(137511) then  --眼棱
		warnSpiritfireBeam:Show(args.destName)
		timerSpiritfireBeamCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(137504) then --破甲
		if numberTanks == 0 then--We DCed and need to check again
			findTanks()
		end
		warnCrush:Show(args.destName, args.amount or 1)
		timerCrush:Start(args.destName)
		timerCrushCD:Start()
		if not UnitDebuff("player", GetSpellInfo(137504)) and not UnitIsDeadOrGhost("player") then--We don't have debuff so we should taunt from other tank now. Likely this is a 3 or more tank scenario
			specWarnCrush:Show(args.destName)
			if mod:IsTank() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\changemt.mp3") --換坦嘲諷
			end
		elseif numberTanks == 2 then--Only 2 tanks, you will always taunt at 1 stack, but drop that stack before it refreshes. You alternate and both just maintain 1 stack entire fight
			specWarnCrush:Show(args.destName)
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED--<--if this happens you're doing fight wrong. But we announce it anyways to identify the problem

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(137504) then
		timerCrush:Cancel(args.destName)
	end
end

