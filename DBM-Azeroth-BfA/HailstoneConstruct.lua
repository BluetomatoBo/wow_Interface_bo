local mod	= DBM:NewMod(2197, "DBM-KulTiras", nil, 1028)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 17462 $"):sub(12, -3))
mod:SetCreatureID(140252)
--mod:SetEncounterID(1880)
mod:SetReCombatTime(20)
mod:SetZone()
--mod:SetMinSyncRevision(11969)

mod:RegisterCombat("combat")

--[[
mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
--	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED"
)

--local warnMothersEmbrace			= mod:NewTargetAnnounce(219045, 3)

--local specWarnWingBuffet			= mod:NewSpecialWarningSpell(260908, nil, nil, nil, 2, 2)
--local specWarnHurricaneCrash		= mod:NewSpecialWarningRun(261088, nil, nil, nil, 4, 2)
--local specWarnMatriarchsCall		= mod:NewSpecialWarningSwitch(261467, nil, nil, nil, 1, 2)
--local specWarnClutch				= mod:NewSpecialWarningYou(261509, nil, nil, nil, 1, 2)
--local yellClutch					= mod:NewYell(261509)
--local specWarnGTFO				= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 2)

--local timerWingBuffetCD				= mod:NewAITimer(16, 260908, nil, nil, nil, 2)
--local timerHurricaneCrashCD			= mod:NewAITimer(16, 261088, nil, nil, nil, 2, nil, DBM_CORE_DEADLY_ICON)
--local timerMatriarchCallCD			= mod:NewAITimer(16, 261467, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)

--mod:AddRangeFrameOption(5, 194966)
--mod:AddReadyCheckOption(37460, false)

function mod:OnCombatStart(delay, yellTriggered)
	if yellTriggered then

	end
end

function mod:OnCombatEnd()
--	if self.Options.RangeFrame then
--		DBM.RangeCheck:Hide()
--	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 260908 then

	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 261092 then

	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 1) then
		specWarnGTFO:Show()
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 124396 then
		
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 257939 then
	end
end
--]]
