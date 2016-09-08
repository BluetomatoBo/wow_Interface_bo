local mod	= DBM:NewMod(1485, "DBM-Party-Legion", 4, 721)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 15186 $"):sub(12, -3))
mod:SetCreatureID(94960)
mod:SetEncounterID(1805)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 191284 193235 188404",
	"SPELL_PERIODIC_DAMAGE 193234",
	"SPELL_PERIODIC_MISSED 193234",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--Honestly I think all his stuff is health based. timers are useless
local warnDancingBlade				= mod:NewSpellAnnounce(193235, 3)
local warnSweep						= mod:NewSpellAnnounce(193092, 2, nil, "Tank")

local specWarnHornOfValor			= mod:NewSpecialWarningSoon(188404, nil, nil, nil, 2, 2)
local specWarnDancingBlade			= mod:NewSpecialWarningMove(193235, nil, nil, nil, 1, 2)
local yellDancingBlade				= mod:NewYell(193235)

--local timerDancingBladeCD			= mod:NewCDTimer(10, 193235, nil, nil, nil, 3)--10-15
--local timerHornCD					= mod:NewCDTimer(31, 191284, nil, nil, nil, 3)--31-36, Very confident it's health based.

local voiceDancingBlade				= mod:NewVoice(193235)--runaway
local voiceBreath					= mod:NewVoice(188404)--watchstep? or breathsoon?

--[[
function mod:BladeTarget(targetname, uId)
	if not targetname then
		warnDancingBlade:Show(DBM_CORE_UNKNOWN)
		return
	end
	if targetname == UnitName("player") then
		specWarnDancingBlade:Show()
		voiceDancingBlade:Play("runaway")
		yellDancingBlade:Yell()
	else
		warnDancingBlade:Show(targetname)
	end
end
--]]

function mod:OnCombatStart(delay)
--	timerHornCD:Start(5.5-delay)
--	timerDancingBladeCD:Start(19-delay)
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 191284 then
		specWarnHornOfValor:Show()
		voiceBreath:Play("breathsoon")
--		timerHornCD:Start()
	elseif spellId == 193235 then
		--self:BossTargetScanner(94960, "BladeTarget", 0.1, 20, true, nil, nil, nil, true)
--		timerDancingBladeCD:Start()
		warnDancingBlade:Show()
	elseif spellId == 188404 and self:AntiSpam(5, 2) then
		voiceBreath:Play("watchstep")
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 193234 and destGUID == UnitGUID("player") and self:AntiSpam(2, 1) then
		specWarnDancingBlade:Show()
		voiceDancingBlade:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, spellGUID)
	local spellId = tonumber(select(5, strsplit("-", spellGUID)), 10)
	if spellId == 193092 then
		warnSweep:Show()
	end
end
