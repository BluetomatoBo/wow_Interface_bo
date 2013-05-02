local mod	= DBM:NewMod(831, "DBM-ThroneofThunder", nil, 362)
local L		= mod:GetLocalizedStrings()
-- BH ADD
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 9383 $"):sub(12, -3))
mod:SetCreatureID(69473)--69888
mod:SetModelID(47739)
mod:SetQuestID(32753)
mod:SetZone()
mod:SetUsedIcons(2, 6)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"UNIT_POWER",
	"SPELL_CAST_SUCCESS"
)

local warnMurderousStrike		= mod:NewSpellAnnounce(138333, 4, nil, mod:IsTank() or mod:IsHealer())--Tank (think thrash, like sha. Gains buff, uses on next melee attack)
local specWarnMurderousStrike	= mod:NewSpecialWarningSpell(138333, mod:IsTank() or mod:IsHealer(), nil, nil, 3)

local warnFatalStrike			= mod:NewSpellAnnounce(138334, 4, nil, mod:IsTank() or mod:IsHealer())--Tank (think thrash, like sha. Gains buff, uses on next melee attack)
local specWarnFatalStrike		= mod:NewSpecialWarningSpell(138334, mod:IsTank() or mod:IsHealer(), nil, nil, 3)--Do all need to switch? how dangerous adds? more info needed

local warnMaterialsofCreation					= mod:NewSpellAnnounce(138321, 3)
local specWarnMaterialsofCreation				= mod:NewSpecialWarningCast(138321)
local timerMaterialsofCreationCD				= mod:NewNextTimer(33, 138321)
local specWarnCreationSwitch					= mod:NewSpecialWarningSwitch(138321, not mod:IsHealer())

local warnUnstableVita							= mod:NewTargetAnnounce(138297, 4)
local timerUnstableVita							= mod:NewTargetTimer(12, 138297)
local specWarnUnstableVita						= mod:NewSpecialWarningYou(138297)
local specWarnUnstableVitaOther					= mod:NewSpecialWarningTarget(138297)

local warnUnstableAnima							= mod:NewTargetAnnounce(138288, 4)
local timerUnstableAnima						= mod:NewTimer(15, "timerAnima", 138295)
local specWarnUnstableAnima						= mod:NewSpecialWarningYou(138288)
local specWarnUnstableAnimaOther				= mod:NewSpecialWarningTarget(138288)

local warnRuinBolt						= mod:NewSpellAnnounce(139087)

local warnSummonSanguineHorror					= mod:NewSpellAnnounce(138338, 3)
local specWarnSummonSanguineHorror				= mod:NewSpecialWarningSpell(138338)
local timerSummonSanguineHorror					= mod:NewNextTimer(10, 138338)

local warnSummonCracklingStalker				= mod:NewSpellAnnounce(138339, 3)
local specWarnSummonCracklingStalker			= mod:NewSpecialWarningSpell(138339)
local timerSummonCracklingStalker				= mod:NewNextTimer(10, 138339)

local warnImbuedwithAnima						= mod:NewSpellAnnounce(138331, 3)
local warnImbuedwithVita						= mod:NewSpellAnnounce(138332, 3)

local warnUnleashedVita							= mod:NewSpellAnnounce(138330, 3)
local specWarnUnleashedVita						= mod:NewSpecialWarningSpell(138330)

local Warned = false
local UnstableAnimatarget = nil
local UnstableAnimaMarkers = {}

mod:AddBoolOption("SetIconOnUnstableVita", true)
mod:AddBoolOption("SetIconOnUnstableAnima", true)

mod:AddBoolOption("HudMAP", true, "sound")

local function LoopUnstableAnima()
	mod:Unschedule(LoopUnstableAnima)
	timerUnstableAnima:Start()
	sndWOP:Schedule(10,"Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_wmxn.mp3") --5秒心能爆炸
	mod:Schedule(15, LoopUnstableAnima)
	if mod.Options.HudMAP and UnstableAnimatarget then
		UnstableAnimaMarkers[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", UnstableAnimatarget, 8, 5, 1, 1, 0, 0.8):Appear():RegisterForAlerts():Rotate(360, 5.5):SetAlertColor(0, 0, 1, 0.5))
	end
end

function mod:OnCombatStart(delay)
	table.wipe(UnstableAnimaMarkers)
	Warned = false
	timerMaterialsofCreationCD:Start(10-delay)
end

function mod:OnCombatEnd()
	if self.Options.HudMAP then
		DBMHudMap:FreeEncounterMarkers()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 138321 then --造物材料
		warnMaterialsofCreation:Show()
		specWarnMaterialsofCreation:Show()
		timerMaterialsofCreationCD:Start()
		specWarnCreationSwitch:Schedule(2)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_zbdq.mp3") --準備打球
	elseif args.spellId == 138338 then --召喚恐魔
		warnSummonSanguineHorror:Show()
		specWarnSummonSanguineHorror:Show()
		if self:AntiSpam(2, 1) then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xgkd.mp3") --小怪快打
		end
	elseif args.spellId == 138339 then --召唤龟裂追踪者
		warnSummonCracklingStalker:Show()
		specWarnSummonCracklingStalker:Show()
		if self:AntiSpam(2, 1) then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xgkd.mp3")
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 138297 then --不穩定的生命
		warnUnstableVita:Show(args.destName)
		timerUnstableVita:Start(args.destName)
		if args:IsPlayer() then
			specWarnUnstableVita:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_smdn.mp3") --生命點你
		else
			specWarnUnstableVitaOther:Show(args.destName)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bwsm.mp3") --不穩定生命
		end
		if self.Options.SetIconOnUnstableVita then
			self:SetIcon(args.destName, 5)
		end
	elseif args.spellId == 138308 then --生命轉移
		warnUnstableVita:Show(args.destName)
		timerUnstableVita:Start(args.destName)
		if args:IsPlayer() then
			specWarnUnstableVita:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_smdn.mp3") --生命點你
		else
			specWarnUnstableVitaOther:Show(args.destName)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_smzy.mp3") --生命轉移
		end
		if self.Options.SetIconOnUnstableVita then
			self:SetIcon(args.destName, 5)
		end
	elseif args.spellId == 138288 then --不稳定的心能
		warnUnstableAnima:Show(args.destName)
		UnstableAnimatarget = args.destName
		if args:IsPlayer() then
			specWarnUnstableAnima:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xndn.mp3") --心能點你
		else
			specWarnUnstableAnimaOther:Show(args.destName)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bwxn.mp3") --不穩定心能
		end
		if self.Options.SetIconOnUnstableAnima then
			self:SetIcon(args.destName, 2)
		end
		LoopUnstableAnima()
	elseif args.spellId == 138331 then --灌输心能
		warnImbuedwithAnima:Show()
		timerSummonSanguineHorror:Start()
	elseif args.spellId == 138332 then --灌输生命
		warnImbuedwithVita:Show()
		timerSummonCracklingStalker:Start()
	elseif args.spellId == 139087 then --毀滅箭
		warnRuinBolt:Show()
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 138297 then
		if self.Options.SetIconOnUnstableVita then
			self:SetIcon(args.destName, 0)
		end
	elseif args.spellId == 138288 then
		self:Unschedule(LoopUnstableAnima)
		timerUnstableAnima:Cancel()
		if self.Options.SetIconOnUnstableAnima then
			self:SetIcon(args.destName, 0)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 138330 then
		warnUnleashedVita:Show()
		specWarnUnleashedVita:Show()
	elseif args.spellId == 138333 then
		warnMurderousStrike:Show()
		specWarnMurderousStrike:Show()
	elseif args.spellId == 138334 then
		warnFatalStrike:Show()
		specWarnFatalStrike:Show()
	end
end

function mod:UNIT_POWER(uId)
	if (self:GetUnitCreatureId(uId) == 69473) and UnitPower(uId) > 80 and not Warned then
		Warned = true
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_mop_nlgg.mp3") --能量過高
	elseif (self:GetUnitCreatureId(uId) == 69473) and UnitPower(uId) < 20 and Warned then
		Warned = false
	end
end