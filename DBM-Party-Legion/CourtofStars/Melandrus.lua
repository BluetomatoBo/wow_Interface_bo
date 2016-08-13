local mod	= DBM:NewMod(1720, "DBM-Party-Legion", 7, 800)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 15008 $"):sub(12, -3))
mod:SetCreatureID(104218)
mod:SetEncounterID(1870)
mod:SetZone()

mod.onlyMythic = true

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 209602 209676 209628"
)

local warnSurge						= mod:NewTargetAnnounce(209602, 4)

local specWarnSurge					= mod:NewSpecialWarningYou(209602, nil, nil, nil, 1, 2)
local yellSurge						= mod:NewYell(209602)
local specWarnSlicingMaelstrom		= mod:NewSpecialWarningSpell(209676, nil, nil, nil, 2, 2)
local specWarnGale					= mod:NewSpecialWarningDodge(209676, nil, nil, nil, 2, 2)

local timerSurgeCD					= mod:NewNextTimer(19.3, 153396, nil, nil, nil, 3)
local timerMaelstromCD				= mod:NewNextTimer(19.3, 209676, nil, nil, nil, 3)
local timerGaleCD					= mod:NewNextTimer(19.3, 209628, nil, nil, nil, 2)

local voiceSurge					= mod:NewVoice(209602)--targetyou
local voiceMaelstrom				= mod:NewVoice(209676)--aesoon
local voiceGale						= mod:NewVoice(209676)--watchstep

function mod:SurgeTarget(targetname, uId)
	if not targetname then
		warnSurge:Show(DBM_CORE_UNKNOWN)
		return
	end
	if targetname == UnitName("player") then
		specWarnSurge:Show()
		voiceSurge:Play("targetyou")
		yellSurge:Yell()
	else
		warnSurge:Show(targetname)
	end
end

function mod:OnCombatStart(delay)
	timerGaleCD:start(5.7-delay)
	timerMaelstromCD:Start(11.8-delay)
	timerSurgeCD:Start(19-delay)
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 209602 then
		timerSurgeCD:Start()
		self:BossTargetScanner(104218, "SurgeTarget", 0.1, 16, true, nil, nil, nil, true)
	elseif spellId == 209676 then
		specWarnSlicingMaelstrom:Show()
		voiceMaelstrom:Play("aesoon")
		timerMaelstromCD:Start()
	elseif spellId == 209628 and self:AntiSpam(5, 1) then
		specWarnGale:Show()
		voiceGale:Play("watchstep")
		timerGaleCD:Start()
	end
end
