local mod	= DBM:NewMod(1743, "DBM-Nighthold", nil, 786)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 15097 $"):sub(12, -3))
mod:SetCreatureID(106643)
mod:SetEncounterID(1872)
mod:SetZone()
mod:SetUsedIcons(8, 7, 6, 5, 4, 3, 2, 1)--TODO< figure out debuff count cap
--mod:SetHotfixNoticeRev(12324)
mod.respawnTime = 30

mod:RegisterCombat("combat")
mod:RegisterEventsInCombat(
	"SPELL_CAST_START 209590 209620 221864 209568 209617 209595 208807 228877 210022 209168 209971",
	"SPELL_CAST_SUCCESS 209597 210387 214295 214278 209615",
	"SPELL_AURA_APPLIED 209615 209244 209973 209598 211261",
	"SPELL_AURA_REFRESH 209973",
	"SPELL_AURA_APPLIED_DOSE 209615 209973",
	"SPELL_AURA_REMOVED 209973 209598",
	"SPELL_PERIODIC_DAMAGE 209433",
	"SPELL_PERIODIC_MISSED 209433",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, figure out interrupt order/count assistant for stuff
--TODO, determine which interrupts are off by default, if any
--TODO, 209615/ablation is probably a swap mechanic that stacks. Coded as such for now until proven otherwise
--TODO, Adjust beam lines/warnings as needed. Figure out if there is ANY way possible to map echo locations for HUD
--TODO, Balls special warning on or off by default and for who?
--TODO, figure out if Ablating Explotion is from where tank WAS when they got debuff, or where tank is when it falls off.
--TODO, figure out how to do yell countdowns on Conflexive Burst. It'll probably require UNIT_AURA player scanning with constant checking of time remaining.
--TODO, are tanks enough to keep Ablative Pulse Interrupted? Dps have enough stuff to interrupt so hopefully tanks can worry about boss on their own
--TODO, auto assign conflexive burst. if always 3 targets have one stand out, 1 go to fast and one go to slow. this will perfectly stagger 3 explosions. assign by mark
--TODO, maybe hide specWarnTimeElementals from tank if SLOW add, if blizzard leaves the fight the poorly designed way it is now (where it's untankable and melee stand around with thumbs up ass)
--[[
--Data collected so far for Beam Echos
Echo 1: X: -3139.01, Y: 265.56 (Boss: -3118, 257) / X: -3164.99, Y: 267.16  (Boss: -3121.13, 266.74)
Echo 2: X: -3129.94, Y: 265.51 (Boss: -3151, 270) / X: -3166.81, Y: 272.54 (Boss: -3120, 285)
Echo 3: X: -3176.98, Y: 281.77 (Boss: -3148, 263)
Echo 4: X: -3155.47, Y: 257.20 (Boss: -3135, 257)
--]]
--(ability.id = 209595 or ability.id = 208807 or ability.id = 228877 or ability.id = 210022 or ability.id = 209168) and type = "begincast" or (ability.id = 209597 or ability.id = 210387 or ability.id = 214278 or ability.id = 214295 or ability.id = 208863) and type = "cast"
--Base
local warnTemporalisis				= mod:NewSpellAnnounce(209595, 3)
----Recursive Elemental
local warnCompressedTime			= mod:NewSpellAnnounce(209590, 3)
----Expedient Elemental
--Time Layer 1
local warnAblation					= mod:NewStackAnnounce(209615, 2, nil, "Tank")
--Time Layer 2
local warnPhase2					= mod:NewPhaseAnnounce(2, 2)
local warnDelphuricBeam				= mod:NewTargetAnnounce(214278, 3)
local warnAblatingExplosion			= mod:NewTargetAnnounce(209973, 3)
--Time Layer 3
local warnPhase3					= mod:NewPhaseAnnounce(3, 2)
local warnPermaliativeTorment		= mod:NewTargetAnnounce(210387, 3, nil, "Healer")
local warnConflexiveBurst			= mod:NewTargetAnnounce(209598, 4)

--Base
local specWarnTimeElementals		= mod:NewSpecialWarningSwitchCount(208887, "-Healer", DBM_CORE_AUTO_SPEC_WARN_OPTIONS.switch:format(208887))
----Recursive Elemental
local specWarnCompressedTime		= mod:NewSpecialWarningDodge(209590)
local specWarnRecursion				= mod:NewSpecialWarningInterrupt(209620, "HasInterrupt", nil, nil, 1, 2)
local specWarnBlast					= mod:NewSpecialWarningInterrupt(221864, "HasInterrupt", nil, nil, 1, 2)
----Expedient Elemental
local specWarnExoRelease			= mod:NewSpecialWarningInterrupt(209568, "HasInterrupt", nil, nil, 1, 2)
local specWarnExpedite				= mod:NewSpecialWarningInterrupt(209617, "HasInterrupt", nil, nil, 1, 2)
--Time Layer 1
local specWarnArcaneticRing			= mod:NewSpecialWarningDodge(208807, nil, nil, nil, 2, 5)
local specWarnSpanningSingularity	= mod:NewSpecialWarningDodge(209168, nil, nil, nil, 2, 2)
local specWarnSingularityGTFO		= mod:NewSpecialWarningMove(209168, nil, nil, nil, 1, 2)
--Time Layer 2
local specWarnDelphuricBeam			= mod:NewSpecialWarningYou(214278, nil, nil, nil, 1, 2)
local yellDelphuricBeam				= mod:NewYell(214278, nil, false)--off by default, because yells last longer than 3-4 seconds so yells from PERVIOUS beam are not yet gone when new beam is cast.
local specWarnEpochericOrb			= mod:NewSpecialWarningSpell(214278, "Dps", nil, nil, 1, 2)
local yellAblatingExplosion			= mod:NewFadesYell(209973)
--Time Layer 3
local specWarnConflexiveBurst		= mod:NewSpecialWarningYou(209598, nil, nil, nil, 1, 2)
local specWarnAblativePulse			= mod:NewSpecialWarningInterrupt(209971, "HasInterrupt", nil, nil, 1, 2)

--Base
local timerLeaveNightwell			= mod:NewCastTimer(9.8, 208863, nil, nil, nil, 6)
local timerTimeElementalsCD			= mod:NewNextSourceTimer(16, 208887, 141872, nil, nil, 1)--"Call Elemental" short text
--Time Layer 1
mod:AddTimerLine(SCENARIO_STAGE:format(1))
local timerArcaneticRing			= mod:NewNextCountTimer(6, 208807, nil, nil, nil, 2)
local timerAblationCD				= mod:NewCDTimer(6.1, 209615, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)--6.1-9.7
local timerSpanningSingularityCD	= mod:NewNextCountTimer(16, 209168, nil, nil, nil, 3)
--Time Layer 2
mod:AddTimerLine(SCENARIO_STAGE:format(2))
local timerDelphuricBeamCD			= mod:NewNextCountTimer(16, 214278, nil, nil, nil, 3)
local timerEpochericOrbCD			= mod:NewNextCountTimer(16, 210022, nil, nil, nil, 3, nil, DBM_CORE_DEADLY_ICON)
local timerAblatingExplosion		= mod:NewTargetTimer(6, 209973, nil, "Tank")
local timerAblatingExplosionCD		= mod:NewCDTimer(30.4, 209973, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)
--Time Layer 3
mod:AddTimerLine(SCENARIO_STAGE:format(3))
local timerConflexiveBurstCD		= mod:NewNextCountTimer(100, 209597, nil, nil, nil, 3, nil, DBM_CORE_DEADLY_ICON)
local timerAblativePulseCD			= mod:NewCDTimer(10.9, 209971, nil, "Tank", nil, 4, nil, DBM_CORE_TANK_ICON..DBM_CORE_INTERRUPT_ICON)--12 now?
local timerPermaliativeTormentCD	= mod:NewNextCountTimer(16, 210387, nil, "Healer", nil, 5, nil, DBM_CORE_DEADLY_ICON)

local berserkTimer					= mod:NewBerserkTimer(240)--4 minute berserk that resets when she changes layers.

--Base
--Time Layer 1
local countdownArcaneticRing		= mod:NewCountdown(30, 208807)
--Time Layer 2
local countdownDelphuricBeam		= mod:NewCountdown("Alt6", 214278)
--Time Layer 3
local countdownConflexiveBurst		= mod:NewCountdown("AltTwo6", 209597)

--Base
local voicePhaseChange				= mod:NewVoice(nil, nil, DBM_CORE_AUTO_VOICE2_OPTION_TEXT)
----Recursive Elemental
local voiceRecursion				= mod:NewVoice(209620, "HasInterrupt")--kickcast
local voiceBlast					= mod:NewVoice(221864, "HasInterrupt")--kickcast
----Expedient Elemental
local voiceExoRelease				= mod:NewVoice(209568, "HasInterrupt")--kickcast
local voiceExpedite					= mod:NewVoice(209617, "HasInterrupt")--kickcast
--Time Layer 1
local voiceArcaneticRing			= mod:NewVoice(208807)--watchorb
local voiceSpanningSingularity		= mod:NewVoice(209168)--watchstep/runaway
--Time Layer 2
local voiceDelphuricBeam			= mod:NewVoice(214278)--targetyou
local voiceEpochericOrb				= mod:NewVoice(210022, "Dps")--161612(catch balls)
--Time Layer 3
local voiceConflexiveBurst			= mod:NewVoice(209598)--targetyou (review for better voice)
local voiceAblativePulse			= mod:NewVoice(209971, "HasInterrupt")--kickcast

mod:AddRangeFrameOption(8, 209973)
mod:AddInfoFrameOption(209598)
mod:AddSetIconOption("SetIconOnConflexiveBurst", 209598)
mod:AddHudMapOption("HudMapOnDelphuricBeam", 214278)

--Exists in phase 2 and phase 3
local slowElementalTimers = {19.5, 70}--15.5, 79, 84 (OLD)
local fastElementalTimers = {24.7, 95}--15.5, 102, 91 (OLD)
local RingTimers = {51.8, 40, 30.0}--34.7, 30.0, 54.0, 25.0, 30.0 (OLD)
local BeamTimers = {34, 35.0, 70.0, 25.0}--45.0, 70.0, 19.0, 50.0, 30.0, 20.0 (OLD)
local SingularityTimers = {25, 60.0, 35.0}
--Only exist in phase 2
local OrbTimers = {70, 30}--76.9, 12.0, 80.0 (OLD)
--Only exist in phase 3 so first timer of course isn't variable
local BurstTimers = {27.6, 100}
local TormentTimers = {140, 30}-- 45.0, 79.0 (OLD)
local currentTank, tankUnitID = nil, nil--not recoverable on purpose
mod.vb.firstElementals = false
mod.vb.slowElementalCount = 0
mod.vb.fastElementalCount = 0
mod.vb.tormentCastCount = 0
mod.vb.ringCastCount = 0
mod.vb.beamCastCount = 0
mod.vb.orbCastCount = 0
mod.vb.burstCastCount = 0
mod.vb.burstDebuffCount = 0
mod.vb.singularityCount = 0
mod.vb.phase = 1
--Saved Information for echos
mod.vb.totalRingCasts = 0
mod.vb.totalbeamCasts = 0
mod.vb.totalsingularityCasts = 0
mod.vb.pos1X, mod.vb.pos1Y = nil, nil
mod.vb.pos2X, mod.vb.pos2Y = nil, nil
mod.vb.pos3X, mod.vb.pos3Y = nil, nil
mod.vb.pos4X, mod.vb.pos4Y = nil, nil
mod.vb.pos5X, mod.vb.pos5Y = nil, nil
mod.vb.pos6X, mod.vb.pos6Y = nil, nil
mod.vb.pos7X, mod.vb.pos7Y = nil, nil

local function checkPlayerDot(self, spellName)
	if not UnitDebuff("player", spellName) then
 		DBMHudMap:RegisterRangeMarkerOnPartyMember(209244, "party", UnitName("player"), 0.7, 3, nil, nil, nil, 1, nil, false):Appear()--Create Player Dot
	end
end

function mod:OnCombatStart(delay)
	currentTank, tankUnitID = nil, nil
	--self.vb.firstElementals = false
	self.vb.slowElementalCount = 0
	self.vb.fastElementalCount = 0
	self.vb.tormentCastCount = 0
	self.vb.ringCastCount = 0
	self.vb.burstDebuffCount = 0
	self.vb.phase = 1
	self.vb.totalRingCasts = 0
	self.vb.totalbeamCasts = 0
	self.vb.totalsingularityCasts = 0
	self.vb.pos1X, self.vb.pos1Y = nil, nil
	self.vb.pos2X, self.vb.pos2Y = nil, nil
	self.vb.pos3X, self.vb.pos3Y = nil, nil
	self.vb.pos4X, self.vb.pos4Y = nil, nil
	self.vb.pos5X, self.vb.pos5Y = nil, nil
	self.vb.pos6X, self.vb.pos6Y = nil, nil
	self.vb.pos7X, self.vb.pos7Y = nil, nil
	timerTimeElementalsCD:Start(10-delay, SLOW)
	timerTimeElementalsCD:Start(15-delay, FAST)
	timerAblationCD:Start(8.5-delay)--Verify/tweak
	timerSpanningSingularityCD:Start(25-delay, 1)
	timerArcaneticRing:Start(30-delay)
	countdownArcaneticRing:Start(30-delay)
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.HudMapOnDelphuricBeam then
		DBMHudMap:Disable()
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 209590 then
		warnCompressedTime:Show()
	elseif spellId == 209620 then
		if self:CheckInterruptFilter(args.sourceGUID) then
			specWarnRecursion:Show(args.sourceName)
			voiceRecursion:Play("kickcast")
		end
	elseif spellId == 221864 then
		if self:CheckInterruptFilter(args.sourceGUID) then
			specWarnBlast:Show(args.sourceName)
			voiceBlast:Play("kickcast")
		end
	elseif spellId == 209568 then
		if self:CheckInterruptFilter(args.sourceGUID) then
			specWarnExoRelease:Show(args.sourceName)
			voiceExoRelease:Play("kickcast")
		end
	elseif spellId == 209617 then
		if self:CheckInterruptFilter(args.sourceGUID) then
			specWarnExpedite:Show(args.sourceName)
			voiceExpedite:Play("kickcast")
		end
	elseif spellId == 209971 then
		timerAblativePulseCD:Start()
		if self:CheckInterruptFilter(args.sourceGUID) then
			specWarnAblativePulse:Show(args.sourceName)
			voiceAblativePulse:Play("kickcast")
		end
	elseif spellId == 209595 then
		warnTemporalisis:Show()
	elseif (spellId == 208807 or spellId == 228877) and self:AntiSpam(5, 1) then
		self.vb.ringCastCount = self.vb.ringCastCount + 1
		specWarnArcaneticRing:Show()
		voiceArcaneticRing:Play("watchorb")
		local nextCount = self.vb.ringCastCount + 1
		if self.vb.phase == 1 then
			self.vb.totalRingCasts = self.vb.totalRingCasts + 1
		else
			if nextCount > self.vb.totalRingCasts then return end--There won't be any more
		end
		local timer = RingTimers[nextCount]
		if timer then
			timerArcaneticRing:Start(timer, nextCount)
			countdownArcaneticRing:Start(timer)
		end
	elseif spellId == 210022 then
		self.vb.orbCastCount = self.vb.orbCastCount + 1
		specWarnEpochericOrb:Show()
		voiceEpochericOrb:Play("161612")
		local nextCount = self.vb.orbCastCount + 1
		local timer = OrbTimers[nextCount]
		if timer then
			timerEpochericOrbCD:Start(timer, nextCount)
		end
	elseif spellId == 209168 then
		self.vb.singularityCount = self.vb.singularityCount + 1
		specWarnSpanningSingularity:Show()
		voiceSpanningSingularity:Play("watchstep")
		local nextCount = self.vb.singularityCount + 1
		if self.vb.phase == 1 then
			self.vb.totalsingularityCasts = self.vb.totalsingularityCasts + 1
		else
			if nextCount > self.vb.totalsingularityCasts then return end--There won't be any more
		end
		local timer = SingularityTimers[nextCount]
		if timer then
			timerSpanningSingularityCD:Start(timer, nextCount)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 209597 then
		self.vb.burstCastCount = self.vb.burstCastCount + 1
		local nextCount = self.vb.burstCastCount + 1
		local timer = BurstTimers[nextCount]
		if timer then
			timerConflexiveBurstCD:Start(timer, nextCount)
			countdownConflexiveBurst:Start(timer)
		end
	elseif spellId == 210387 then
		self.vb.tormentCastCount = self.vb.tormentCastCount + 1
		local nextCount = self.vb.tormentCastCount + 1
		local timer = TormentTimers[nextCount]
		if timer then
			timerPermaliativeTormentCD:Start(timer, nextCount)
		end
	elseif spellId == 214278 or spellId == 214295 then--Boss: 214278, Echo: 214295
		self.vb.beamCastCount = self.vb.beamCastCount + 1
		local nextCount = self.vb.beamCastCount + 1
		if self.vb.phase == 2 then
			self.vb.totalbeamCasts = self.vb.totalbeamCasts + 1
			currentTank, tankUnitID = self:GetCurrentTank()
			if not currentTank then
				DBM:Debug("Tank Detection Failure in HudMapOnDelphuricBeam", 2)
				return
			end
			--Yes this could be in a table and be far prettier, but being ugly like this makes it recoverable by dbms timer recovery feature
			if self.vb.beamCastCount == 1 then
				self.vb.pos1X, self.vb.pos1Y = UnitPosition(tankUnitID)
			elseif self.vb.beamCastCount == 2 then
				self.vb.pos2X, self.vb.pos2Y = UnitPosition(tankUnitID)
			elseif self.vb.beamCastCount == 3 then
				self.vb.pos3X, self.vb.pos3Y = UnitPosition(tankUnitID)
			elseif self.vb.beamCastCount == 4 then
				self.vb.pos4X, self.vb.pos4Y = UnitPosition(tankUnitID)
			elseif self.vb.beamCastCount == 5 then
				self.vb.pos5X, self.vb.pos5Y = UnitPosition(tankUnitID)
			elseif self.vb.beamCastCount == 6 then
				self.vb.pos6X, self.vb.pos6Y = UnitPosition(tankUnitID)
			elseif self.vb.beamCastCount == 7 then
				self.vb.pos7X, self.vb.pos7Y = UnitPosition(tankUnitID)
			end
		else
			if nextCount > self.vb.totalbeamCasts then return end
		end
		local timer = BeamTimers[nextCount]
		if timer then
			timerDelphuricBeamCD:Start(timer, nextCount)
			countdownDelphuricBeam:Start(timer)
		end
	elseif spellId == 209615 then
		timerAblationCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 209615 then
		local uId = DBM:GetRaidUnitId(args.destName)
		if self:IsTanking(uId) then
			local amount = args.amount or 1
			if amount % 3 then--Every 3 stacks for now
				warnAblation:Show(args.destName, amount)
			end
		end
	elseif spellId == 211261 then
		warnPermaliativeTorment:CombinedShow(0.5, args.destName)
	elseif spellId == 209244 then--Could still use more, but this is only spell ID on heroic that was used for debuff.
		warnDelphuricBeam:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnDelphuricBeam:Show()
			voiceDelphuricBeam:Play("targetyou")
			yellDelphuricBeam:Yell()
		end
		--TODO, phase 3 lines need exact location of the echo ( map coords )
		if self.Options.HudMapOnDelphuricBeam then
			self:Unschedule(checkPlayerDot)
			self:Schedule(0.3, checkPlayerDot, self, args.spellName)--Give player just a dot if they don't end up with debuff
			--Always put dots up
			DBMHudMap:RegisterRangeMarkerOnPartyMember(213166, "party", args.destName, 0.35, 5, nil, nil, nil, 0.5, nil, false):Appear():SetLabel(args.destName, nil, nil, nil, nil, nil, 0.8, nil, -13, 8, nil)
			--Now attempt to do lines to best of ability using tanks position as an approximation to boss position
			if self.vb.phase == 2 then--use current tanks current position
				if not currentTank then return end
				if args:IsPlayer() then--Yellow Line
					DBMHudMap:AddEdge(1, 1, 0, 0.5, 4, currentTank, args.destName, nil, nil, nil, nil, 125)
				else--Red Line
					DBMHudMap:AddEdge(1, 0, 0, 0.5, 4, currentTank, args.destName, nil, nil, nil, nil, 125)
				end
			else--Echos, pull saved coords
				--Yes this could be in a table and be far prettier, but being ugly like this makes it recoverable by dbms timer recovery feature
				local EchoX, EchoY
				if self.vb.beamCastCount == 1 then
					EchoX, EchoY = self.vb.pos1X, self.vb.pos1Y
				elseif self.vb.beamCastCount == 2 then
					EchoX, EchoY = self.vb.pos2X, self.vb.pos2Y
				elseif self.vb.beamCastCount == 3 then
					EchoX, EchoY = self.vb.pos3X, self.vb.pos3Y
				elseif self.vb.beamCastCount == 4 then
					EchoX, EchoY = self.vb.pos4X, self.vb.pos4Y
				elseif self.vb.beamCastCount == 5 then
					EchoX, EchoY = self.vb.pos5X, self.vb.pos5Y
				elseif self.vb.beamCastCount == 6 then
					EchoX, EchoY = self.vb.pos6X, self.vb.pos6Y
				elseif self.vb.beamCastCount == 7 then
					EchoX, EchoY = self.vb.pos7X, self.vb.pos7Y
				end
				if not EchoX or not EchoY then return end
				if args:IsPlayer() then--Yellow Line
					DBMHudMap:AddEdge(1, 1, 0, 0.5, 4, nil, args.destName, EchoX, EchoY, nil, nil, 125)
				else--Red Line
					DBMHudMap:AddEdge(1, 0, 0, 0.5, 4, nil, args.destName, EchoX, EchoY, nil, nil, 125)
				end
			end
		end
	elseif spellId == 209973 then
		warnAblatingExplosion:Show(args.destName)
		timerAblatingExplosion:Start(args.destName)
		timerAblatingExplosionCD:Start()
		if args:IsPlayer() then
			yellAblatingExplosion:Cancel()
			yellAblatingExplosion:Schedule(3, 3)
			yellAblatingExplosion:Schedule(4, 2)
			yellAblatingExplosion:Schedule(5, 1)
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(8)
			end
		end
	elseif spellId == 209598 then
		self.vb.burstDebuffCount = self.vb.burstDebuffCount + 1
		warnConflexiveBurst:CombinedShow(0.5, args.destName)
		if args:IsPlayer() then
			specWarnConflexiveBurst:Show()
			voiceConflexiveBurst:Play("targetyou")
		end
		if self.Options.SetIconOnConflexiveBurst then
			self:SetAlphaIcon(0.5, args.destName)
		end
		if self.Options.InfoFrame and not DBM.InfoFrame:IsShown() then
			DBM.InfoFrame:SetHeader(args.spellName)
			DBM.InfoFrame:Show(10, "playerdebuffremaining", args.spellName)
		end
	end
end
mod.SPELL_AURA_RESFRESH = mod.SPELL_AURA_APPLIED
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 209973 then
		timerAblatingExplosion:Stop(args.destName)
		if args:IsPlayer() then
			yellAblatingExplosion:Cancel()
			if self.Options.RangeFrame then
				DBM.RangeCheck:Hide()
			end
		end
	elseif spellId == 209598 then
		self.vb.burstDebuffCount = self.vb.burstDebuffCount - 1
		warnConflexiveBurst:CombinedShow(0.5, args.destName)
		if args:IsPlayer() then
			--Cancel yells when they are added
		end
		if self.Options.SetIconOnConflexiveBurst then
			self:SetIcon(args.destName, 0)
		end
		if self.Options.InfoFrame and self.vb.burstDebuffCount == 0 then
			DBM.InfoFrame:Hide()
		end
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 209433 and destGUID == UnitGUID("player") and self:AntiSpam(2, 2) then
		specWarnSingularityGTFO:Show()
		voiceSpanningSingularity:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, spellGUID)
	local spellId = tonumber(select(5, strsplit("-", spellGUID)), 10)
	if spellId == 211647 then--Stop Time
		self.vb.phase = self.vb.phase + 1
		--self.vb.firstElementals = false
		self.vb.slowElementalCount = 0
		self.vb.fastElementalCount = 0
		self.vb.ringCastCount = 0
		self.vb.beamCastCount = 0
		self.vb.singularityCount = 0
		timerArcaneticRing:Stop()
		countdownArcaneticRing:Cancel()
		timerTimeElementalsCD:Stop()
		timerDelphuricBeamCD:Stop()
		countdownDelphuricBeam:Cancel()
		timerLeaveNightwell:Start()
		timerTimeElementalsCD:Start(19.5, SLOW)
		timerTimeElementalsCD:Start(24.7, FAST)
		timerDelphuricBeamCD:Start(34, 1)--30 for cast start
		countdownDelphuricBeam:Start(34)
		timerSpanningSingularityCD:Start(37, 1)
		timerArcaneticRing:Start(51.8, 1)
		countdownArcaneticRing:Start(51.8)
		if self.vb.phase == 2 then
			self.vb.orbCastCount = 0
			warnPhase2:Show()
			voicePhaseChange:Play("ptwo")
			timerAblatingExplosionCD:Start(22)
			timerEpochericOrbCD:Start(69.6, 1)
		elseif self.vb.phase == 3 then
			warnPhase3:Show()
			voicePhaseChange:Play("pthree")
			self.vb.burstCastCount = 0
			timerAblatingExplosionCD:Stop()
			timerEpochericOrbCD:Stop()
			timerAblativePulseCD:Start(22)
			timerPermaliativeTormentCD:Start(140)--really likely cast more often in not faceroll mode. need more data
			if not self:IsFaceroll() then
				--Wasn't used in LFR, assume normal is same way since that's generally how it is
				--Timer itself may need updating but been so long since seen heroic or mythic of this fight.
				timerConflexiveBurstCD:Start(31.6, 1)
				countdownConflexiveBurst:Start(31.6)
			end
		end
		berserkTimer:Cancel()
		berserkTimer:Start(258)
	elseif spellId == 209005 then--Summon Time Elemental - Slow
		self.vb.slowElementalCount = self.vb.slowElementalCount + 1
		--if self.vb.firstElementals then
			specWarnTimeElementals:Show(SLOW)
		--end
		local timer = slowElementalTimers[self.vb.slowElementalCount+1]
		if timer then
			timerTimeElementalsCD:Start(timer, SLOW)
		end
	elseif spellId == 209007 then--Summon Time Elemental - Fast
		self.vb.fastElementalCount = self.vb.fastElementalCount + 1
		--if self.vb.firstElementals then
			specWarnTimeElementals:Show(FAST)
		--end
		local timer = fastElementalTimers[self.vb.fastElementalCount+1]
		if timer then
			timerTimeElementalsCD:Start(timer, FAST)
		end
	elseif spellId == 208887 then--Summon Time Elementals (summons both of them, used at beginning of each phase)
		--self.vb.firstElementals = true
		--specWarnTimeElementals:Show(STATUS_TEXT_BOTH)
		DBM:Debug("Both elementals summoned, this event still exists, probably need custom code for certain difficulties")
--	elseif spellId == 208807 then--Arcanetic Ring (boss, echo only does yells). 1 second faster than combat log. Might switch to if it helps
		
	end
end

--Phase 2 and 3 do not have event for cast.
--Antispam protection added to both cast and yell in event they do fix cast, don't want to double warn/mess up timers
---"<441.20 14:04:16> [CHAT_MSG_MONSTER_YELL] Let the waves of time crash over you!#Echo of Elisande#####0#0##0#962#nil#0#false#false#false#false", -- [7359]
function mod:CHAT_MSG_MONSTER_YELL(msg, npc, _, _, target)
	if (msg == L.noCLEU4EchoRings or msg:find(L.noCLEU4EchoRings)) and self:AntiSpam(5, 1) then
		self:SendSync("ArcaneticRing")--Syncing to help unlocalized clients
	end
end

function mod:OnSync(msg, targetname)
	if not self:IsInCombat() then return end
	if msg == "ArcaneticRing" then
		self.vb.ringCastCount = self.vb.ringCastCount + 1
		specWarnArcaneticRing:Show()
		voiceArcaneticRing:Play("watchorb")
		local nextCount = self.vb.ringCastCount + 1
		if self.vb.phase > 1 and nextCount > self.vb.totalRingCasts then return end--There won't be any more
		local timer = RingTimers[nextCount]
		if timer then
			timerArcaneticRing:Start(timer, nextCount)
			countdownArcaneticRing:Start(timer)
		end
	end
end
