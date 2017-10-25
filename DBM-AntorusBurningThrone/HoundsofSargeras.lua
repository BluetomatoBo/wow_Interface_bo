local mod	= DBM:NewMod(1987, "DBM-AntorusBurningThrone", nil, 946)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 16773 $"):sub(12, -3))
mod:SetCreatureID(122477, 122135)--122477 F'harg, 122135 Shatug
mod:SetEncounterID(2074)
mod:SetZone()
mod:SetBossHPInfoToHighest()
--mod:SetUsedIcons(1, 2, 3, 4, 5, 6)
--mod:SetHotfixNoticeRev(16350)
mod.respawnTime = 4

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 244057 244056",
	"SPELL_CAST_SUCCESS 244072 251445 245098 254429",
	"SPELL_AURA_APPLIED 244768 248815 254429 248819 244054 244055 251356",
--	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED 244768 248815 254429 248819 251356",
--	"SPELL_PERIODIC_DAMAGE",
--	"SPELL_PERIODIC_MISSED",
--	"UNIT_DIED",
--	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED boss1 boss2"
)

--TODO, work the breath warnings to special warnings pre warnings for tanks?
--TODO, figure out who sphere is chasing with a constant threat/aggro monitor while it's out?
--TODO, more work on siphon targetting, it too may need icons/assignments. Same with Enflamed
--TODO, update all timers on Focused power, probably pause them all for 15 seconds
--TODO, cleanup timers same way as flame chick in foundry. Sequence the timers instead of CD them all
--[[
(ability.id = 244057 or ability.id = 244056) and type = "begincast"
 or (ability.id = 244072 or ability.id = 251445 or ability.id = 245098 or ability.id = 251356 or ability.id = 254429) and type = "cast"
--]]
--F'harg
local warnBurningMaw					= mod:NewTargetAnnounce(251448, 2, nil, false, 2)
local warnDesolateGaze					= mod:NewTargetAnnounce(244768, 3)
local warnEnflamedCorruption			= mod:NewSpellAnnounce(244057, 3)
local warnEnflamed						= mod:NewTargetAnnounce(248815, 3, nil, false, 2)
--Shatug
local warnCorruptingMaw					= mod:NewTargetAnnounce(251447, 2, nil, false, 2)
local warnWeightofDarkness				= mod:NewTargetAnnounce(254429, 3)
local warnSiphonCorruption				= mod:NewSpellAnnounce(244056, 3)
local warnSiphoned						= mod:NewTargetAnnounce(248819, 3, nil, false, 2)
--General/Mythic
local warnFocusingPower					= mod:NewTargetAnnounce(251356, 2)

--F'harg
local specWarnMoltenTouch				= mod:NewSpecialWarningDodge(244072, nil, nil, nil, 2, 2)
local specWarnDesolateGaze				= mod:NewSpecialWarningYou(244768, nil, nil, nil, 1, 2)
local yellDesolateGaze					= mod:NewYell(244768)
local specWarnEnflamed					= mod:NewSpecialWarningYou(248815, nil, nil, nil, 1, 2)
local yellEnflamed						= mod:NewShortFadesYell(248815)
--local specWarnGTFO					= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 2)
--Shatug
local specWarnComsumingSphere			= mod:NewSpecialWarningDodge(244131, nil, nil, nil, 2, 2)
local specWarnWeightOfDarkness			= mod:NewSpecialWarningMoveTo(254429, nil, nil, nil, 1, 2)
local yellWeightOfDarkness				= mod:NewPosYell(254429, DBM_CORE_AUTO_YELL_CUSTOM_POSITION)
local yellWeightOfDarknessFades			= mod:NewShortFadesYell(254429)
local specWarnSiphoned					= mod:NewSpecialWarningMoveTo(248819, nil, nil, nil, 1, 2)
local yellSiphoned						= mod:NewShortFadesYell(248819)
--Mythic
local specWarnFlameTouched				= mod:NewSpecialWarningYouPos(244054, nil, nil, nil, 3, 8)
local specWarnShadowtouched				= mod:NewSpecialWarningYouPos(244055, nil, nil, nil, 3, 8)
local yellTouched						= mod:NewPosYell(244054, DBM_CORE_AUTO_YELL_CUSTOM_POSITION)

--F'harg
local timerBurningMawCD					= mod:NewCDTimer(10.1, 251448, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)--usually 11 but some pulls it's 10
local timerMoltenTouchCD				= mod:NewCDTimer(95.9, 244072, nil, nil, nil, 3)
local timerEnflamedCorruptionCD			= mod:NewCDTimer(95.9, 244057, nil, nil, nil, 3)
local timerDesolateGazeCD				= mod:NewCDTimer(95.9, 244064, nil, nil, nil, 3)
--Shatug
local timerCorruptingMawCD				= mod:NewCDTimer(10.1, 251447, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)--usually 11 but some pulls it's 10
local timerComsumingSphereCD			= mod:NewCDTimer(77, 244131, nil, nil, nil, 3)--Verify in transcritor
local timerWeightOfDarknessCD			= mod:NewCDTimer(77, 254429, nil, nil, nil, 3)
local timerSiphonCorruptionCD			= mod:NewCDTimer(77, 244056, nil, nil, nil, 3)
--General/Mythic
local timerFocusingPower				= mod:NewCastTimer(15, 251356, nil, nil, nil, 3)

--local berserkTimer					= mod:NewBerserkTimer(600)

--F'harg
--local countdownSingularity			= mod:NewCountdown(50, 235059)

--F'harg
local voiceMoltenTouch					= mod:NewVoice(244072)--watchstep
local voiceDesolateGaze					= mod:NewVoice(244768)--runout?
local voiceEnflamed						= mod:NewVoice(248815)--scatter
--local voiceGTFO						= mod:NewVoice(238028, nil, DBM_CORE_AUTO_VOICE4_OPTION_TEXT)--runaway
--Shatug
local voiceConsumingSphere				= mod:NewVoice(244131)--watchorb
local voiceWeightOfDarkness				= mod:NewVoice(254429)--targetyou
local voiceSiphoned						= mod:NewVoice(248819)--gathershare?/killmob on mythic?
--Mythic
local voiceFlameTouched					= mod:NewVoice(244054)--flameonyou
local voiceShadowtouched				= mod:NewVoice(244055)--shadowonyou

mod:AddSetIconOption("SetIconOnWeightofDarkness", 254429, true)
--mod:AddInfoFrameOption(239154, true)
mod:AddRangeFrameOption("5/8")
mod:AddBoolOption("SequenceTimers", false)

mod.vb.WeightDarkIcon = 1
mod.vb.longTimer = 95.9
mod.vb.mediumTimer = 77
--mod.vb.shortTimer = 10.1

--[[
local debuffFilter
local UnitDebuff = UnitDebuff
local playerDebuff = nil
do
	local spellName = GetSpellInfo(231311)
	debuffFilter = function(uId)
		if not playerDebuff then return true end
		if not select(11, UnitDebuff(uId, spellName)) == playerDebuff then
			return true
		end
	end
end

local expelLight, stormOfJustice = GetSpellInfo(228028), GetSpellInfo(227807)
local function updateRangeFrame(self)
	if not self.Options.RangeFrame then return end
	if self.vb.brandActive then
		DBM.RangeCheck:Show(15, debuffFilter)--There are no 15 yard items that are actually 15 yard, this will round to 18 :\
	elseif UnitDebuff("player", expelLight) or UnitDebuff("player", stormOfJustice) then
		DBM.RangeCheck:Show(8)
	elseif self.vb.hornCasting then--Spread for Horn of Valor
		DBM.RangeCheck:Show(5)
	else
		DBM.RangeCheck:Hide()
	end
end
--]]

--Fire doggy timer, 10, 33, 31
--Shadow doggy timers, every 25 seconds
function mod:OnCombatStart(delay)
	self.vb.WeightDarkIcon = 1
	--Fire doggo
	timerBurningMawCD:Start(8.2-delay)--was same on heroic/mythic, or now
	timerMoltenTouchCD:Start(18-delay)--was same on heroic/mythic, or now
	--Shadow doggo
	if self:IsMythic() then
		self.vb.longTimer = 89
		self.vb.mediumTimer = 71.9
		timerCorruptingMawCD:Start(8.9-delay)
		timerSiphonCorruptionCD:Start(25.5-delay)
	else
		self.vb.longTimer = 95.9
		self.vb.mediumTimer = 77
		timerCorruptingMawCD:Start(10.9-delay)
		timerSiphonCorruptionCD:Start(26.7-delay)
	end
	if not self.Options.SequenceTimers then
		if self:IsMythic() then
			--Fire doggo
			timerEnflamedCorruptionCD:Start(48.7-delay)
			timerDesolateGazeCD:Start(78-delay)
			--Shadow doggo
			timerComsumingSphereCD:Start(48.7-delay)
			timerWeightOfDarknessCD:Start(73.1-delay)
		else
			--Fire doggo
			timerEnflamedCorruptionCD:Start(51.1-delay)
			timerDesolateGazeCD:Start(82.4-delay)
			--Shadow doggo
			timerComsumingSphereCD:Start(51.1-delay)
			timerWeightOfDarknessCD:Start(77-delay)
		end
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(5)--Molten Touch (assumed)
	end
	local wowTOC, testBuild = DBM:GetTOC()
	if not testBuild then
		DBM:AddMsg(DBM_CORE_NEED_LOGS)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
--	if self.Options.InfoFrame then
--		DBM.InfoFrame:Hide()
--	end
	local wowTOC, testBuild = DBM:GetTOC()
	if not testBuild then
		DBM:AddMsg(DBM_CORE_NEED_LOGS)
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 244057 then
		warnEnflamedCorruption:Show()
		if not self.Options.SequenceTimers then
			timerEnflamedCorruptionCD:Start(self.vb.longTimer)
		else
			if self:IsMythic() then
				timerDesolateGazeCD:Start(29.2)
			else
				timerDesolateGazeCD:Start(30.5)--30.5-31.7
			end
		end
	elseif spellId == 244056 then
		warnSiphonCorruption:Show()
		if not self.Options.SequenceTimers then
			timerSiphonCorruptionCD:Start(self.vb.mediumTimer)
		else
			if self:IsMythic() then
				timerComsumingSphereCD:Start(23.2)--23.2
			else
				timerComsumingSphereCD:Start(24.4)--24.4-25.74
			end
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 244072 then
		specWarnMoltenTouch:Show()
		voiceMoltenTouch:Play("watchstep")
		if not self.Options.SequenceTimers then
			timerMoltenTouchCD:Start(self.vb.longTimer)
		else
			if self:IsMythic() then
				timerEnflamedCorruptionCD:Start(30.5)
			else
				timerEnflamedCorruptionCD:Start(33)--33-34.2
			end
		end
	elseif spellId == 251445 then
		warnBurningMaw:Show(args.destName)
		timerBurningMawCD:Start()
	elseif spellId == 245098 then
		warnCorruptingMaw:Show(args.destName)
		timerCorruptingMawCD:Start()
	elseif spellId == 254429 then
		self.vb.WeightDarkIcon = 1
		if not self.Options.SequenceTimers then
			timerWeightOfDarknessCD:Start()
		else
			if self:IsMythic() then
				timerSiphonCorruptionCD:Start(24.6)
			else
				timerSiphonCorruptionCD:Start(26.7)--26.7-26.9
			end
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 244768 then
		warnDesolateGaze:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnDesolateGaze:Show()
			voiceDesolateGaze:Play("runout")
			yellDesolateGaze:Yell()
		end
	elseif spellId == 251356 and self:AntiSpam(3, 1) then
		warnFocusingPower:Show()
		timerFocusingPower:Start()
	elseif spellId == 248815 then--Enflamed
		warnEnflamed:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnEnflamed:Show()
			voiceEnflamed:Play("scatter")
			yellEnflamed:Countdown(4)
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(8)
			end
		end
	elseif spellId == 248819 then--Siphoned
		warnSiphoned:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnSiphoned:Show(DBM_ALLY)
			voiceSiphoned:Play("gathershare")
			yellSiphoned:Countdown(4)
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(8)
			end
		end
	elseif spellId == 254429 then
		warnWeightofDarkness:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnWeightOfDarkness:Show(DBM_ALLY)
			voiceWeightOfDarkness:Play("gathershare")
			yellWeightOfDarkness:Yell(self.vb.WeightDarkIcon, args.spellName, self.vb.WeightDarkIcon)
			yellWeightOfDarknessFades:Countdown(5)
		end
		if self.Options.SetIconOnWeightofDarkness then
			self:SetIcon(args.destName, self.vb.WeightDarkIcon)
		end
		self.vb.WeightDarkIcon = self.vb.WeightDarkIcon + 1
	elseif spellId == 244054 then--Flametouched
		if args:IsPlayer() then
			specWarnFlameTouched:Show(self:IconNumToTexture(7))--Red X for flame (more voted on red x than orange circle)
			voiceFlameTouched:Play("flameonyou")
			yellTouched:Yell(7, "", 7)
		end
	elseif spellId == 244055 then--Shadowtouched
		if args:IsPlayer() then
			specWarnShadowtouched:Show(self:IconNumToTexture(3))--Purple diamond for shadow
			voiceShadowtouched:Play("shadowonyou")
			yellTouched:Yell(3, "", 3)
		end
	end
end
--mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 248815 then--Enflamed
		if args:IsPlayer() then
			yellEnflamed:Cancel()
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(5)
			end
		end
	elseif spellId == 248819 then--Siphoned
		if args:IsPlayer() then
			yellSiphoned:Cancel()
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(5)
			end
		end
	elseif spellId == 254429 then
		if self.Options.SetIconOnWeightofDarkness then
			self:SetIcon(args.destName, 0)
		end
		if args:IsPlayer() then
			yellWeightOfDarknessFades:Cancel()
		end
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnGTFO:Show()
		voiceGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, npc, _, _, target)
	if msg:find("spell:238502") then

	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 121193 then

	end
end
--]]

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 244159 then--Consuming Sphere
		specWarnComsumingSphere:Show()
		voiceConsumingSphere:Play("watchorb")
		if not self.Options.SequenceTimers then
			timerComsumingSphereCD:Start(self.vb.mediumTimer)
		else
			if self:IsMythic() then
				timerWeightOfDarknessCD:Start(24.3)
			else
				timerWeightOfDarknessCD:Start(25.6)--25.6-27
			end
		end
	elseif spellId == 244064 then--Desolate Gaze
		if not self.Options.SequenceTimers then
			timerDesolateGazeCD:Start(self.vb.longTimer)
		else
			if self:IsMythic() then
				timerMoltenTouchCD:Start(29.2)
			else
				timerMoltenTouchCD:Start(31.6)--31.6-33
			end
		end
	elseif spellId == 244069 then--Weight of Darkness
		if not self.Options.SequenceTimers then
			timerWeightOfDarknessCD:Start(self.vb.mediumTimer)
		else
			if self:IsMythic() then
				timerSiphonCorruptionCD:Start(24.3)
			else
				timerSiphonCorruptionCD:Start(26.7)--26.7-26.9
			end
		end
	end
end
