local mod	= DBM:NewMod(1236, "DBM-Party-WoD", 4, 558)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 12103 $"):sub(12, -3))
mod:SetCreatureID(80805, 80816, 80808)
mod:SetEncounterID(1748)
mod:SetZone()
mod:SetBossHPInfoToHighest()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 163665 163390",
	"SPELL_CAST_SUCCESS 165152",
	"SPELL_AURA_APPLIED 163689",
	"SPELL_AURA_REMOVED 163689",
	"UNIT_DIED"
)

mod:SetBossHealthInfo(80816, 80805, 80808)

local warnSanguineSphere		= mod:NewTargetAnnounce(163689, 3)
local warnFlamingSlash			= mod:NewCastAnnounce(163665, 4)
local warnLavaSwipe				= mod:NewTargetAnnounce(165152, 2)
local warnOgreTraps				= mod:NewCastAnnounce(163390, 3)

local specWarnSanguineSphere	= mod:NewSpecialWarningReflect(163689)
local specWarnSanguineSphereEnd	= mod:NewSpecialWarningEnd(163689)
local specWarnFlamingSlash		= mod:NewSpecialWarningSpell(163665, nil, nil, nil, 3)--Devastating in challenge modes. move or die.
local specWarnLavaSwipe			= mod:NewSpecialWarningSpell(165152, nil, nil, nil, 2)
local specWarnLavaSwipeYou		= mod:NewSpecialWarningSpell(165152)
local yellLavaSwipe				= mod:NewYell(165152)
local specWarnOgreTraps			= mod:NewSpecialWarningSpell(163390, mod:IsRanged())--Pre warning for bomb immediately after. Maybe change to a Soon warning with bomb spellid instead so that's clear?

local timerSanguineSphere		= mod:NewTargetTimer(15, 163689)
local timerFlamingSlashCD		= mod:NewNextTimer(29, 163665)
local timerLavaSwipeCD			= mod:NewNextTimer(29, 165152)
local timerOgreTrapsCD			= mod:NewCDTimer(25, 163390)--25-30 variation.

local countdownFlamingSlash		= mod:NewCountdown(29, 163665)

local voiceSanguineSphere		= mod:NewVoice(163689, not mod:IsHealer())

function mod:OnCombatStart(delay)
	timerFlamingSlashCD:Start(5-delay)
	countdownFlamingSlash:Start(5-delay)
	timerOgreTrapsCD:Start(19.5-delay)
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 163665 then
		warnFlamingSlash:Show()
		specWarnFlamingSlash:Show()
		timerFlamingSlashCD:Start()
		countdownFlamingSlash:Start()
	elseif spellId == 163390 then
		warnOgreTraps:Show()
		specWarnOgreTraps:Show()
		timerOgreTrapsCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 165152 then
		warnLavaSwipe:Show(args.destName)
		timerLavaSwipeCD:Start()
		if args:IsPlayer() then
			specWarnLavaSwipeYou:Show()
			yellLavaSwipe:Yell()
		else
			specWarnLavaSwipe:Show()
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 163689 then
		warnSanguineSphere:Show(args.destName)
		specWarnSanguineSphere:Show(args.destName)
		voiceSanguineSphere:Play("stopattack")
		local unitid
		for i = 1, 3 do
			if UnitGUID("boss"..i) == args.destGUID then
				unitid = "boss"..i
			end
		end
		if unitid then
			local _, _, _, _, _, duration, expires, _, _ = UnitBuff(unitid, args.spellName)
			if expires then
				timerSanguineSphere:Start(expires-GetTime(), args.destName)
			end
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 163689 then
		timerSanguineSphere:Cancel(args.destName)
		specWarnSanguineSphereEnd:Show()
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 80805 then--Makogg Emberblade
		timerFlamingSlashCD:Cancel()
		countdownFlamingSlash:Cancel()
	elseif cid == 80808 then--Neesa Nox
		timerOgreTrapsCD:Cancel()
	end
end
