local mod	= DBM:NewMod(2166, "DBM-Uldir", nil, 1031)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 17821 $"):sub(12, -3))
mod:SetCreatureID(134442)--135016 Plague Amalgam
mod:SetEncounterID(2134)
mod:SetZone()
mod:SetUsedIcons(1, 2, 3, 4)
--mod:SetHotfixNoticeRev(16950)
--mod:SetMinSyncRevision(16950)
mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 267242 265217 265206",
	"SPELL_CAST_SUCCESS 265178 265212 266459 265209",
	"SPELL_AURA_APPLIED 265178 265129 265212 274990",
	"SPELL_AURA_APPLIED_DOSE 265178 265127",
	"SPELL_AURA_REMOVED 265178 265129 265212 265217",
	"SPELL_SUMMON 275055",
	"RAID_BOSS_WHISPER",
	"INSTANCE_ENCOUNTER_ENGAGE_UNIT",
--	"SPELL_PERIODIC_DAMAGE",
--	"SPELL_PERIODIC_MISSED",
	"UNIT_DIED"
)

--TODO, determine highest tolerable tank stacks. Need a better idea of raid numbers/tuning. Was wildly variable between 4 and 11 in testing, so leaving at 6 for now
--[[
(ability.id = 267242 or ability.id = 265217) and type = "begincast"
 or (ability.id = 265178 or ability.id = 266459 or ability.id = 265212 or ability.id = 265209) and type = "cast"
 or ability.id = 265217 and type = "removebuff"
--]]
--local warnXorothPortal					= mod:NewSpellAnnounce(244318, 2, nil, nil, nil, nil, nil, 7)
local warnEvolvingAffliction				= mod:NewStackAnnounce(265178, 2, nil, "Tank")
local warnGestate							= mod:NewTargetAnnounce(265212, 3)
local warnHypergenesis						= mod:NewSpellAnnounce(266926, 3)
local warnContagion							= mod:NewCountAnnounce(267242, 3)
local warnImmunoSupp						= mod:NewCountAnnounce(265206, 3)

local specWarnEvolvingAffliction			= mod:NewSpecialWarningStack(265178, nil, 2, nil, nil, 1, 6)
local specWarnEvolvingAfflictionOther		= mod:NewSpecialWarningTaunt(265178, nil, nil, nil, 1, 2)
--local yellEvolvingAffliction				= mod:NewShortFadesYell(265178)
local specWarnOmegaVector					= mod:NewSpecialWarningYou(265129, nil, nil, nil, 1, 2)
local yellOmegaVector						= mod:NewYell(265129)
local yellOmegaVectorFades					= mod:NewShortFadesYell(265129)
local specWarnGestate						= mod:NewSpecialWarningYou(265212, nil, nil, nil, 1, 2)
local yellGestate							= mod:NewYell(265212)
local specWarnGestateNear					= mod:NewSpecialWarningClose(265212, false, nil, 2, 1, 2)
local specWarnAmalgam						= mod:NewSpecialWarningSwitch("ej18007", "-Healer", nil, 2, 1, 2)
local specWarnSpawnParasite					= mod:NewSpecialWarningSwitch(275055, "Dps", nil, nil, 1, 2)--Mythic
--local specWarnContagion					= mod:NewSpecialWarningCount(267242, nil, nil, nil, 2, 2)
local specWarnBurstingLesions				= mod:NewSpecialWarningMoveAway(274990, nil, nil, nil, 1, 2)
local yellBurstingLesions					= mod:NewYell(274990, nil, false)--Mythic
local yellEngorgedParasite					= mod:NewYell(274983)--Mythic
local yellTerminalEruption					= mod:NewYell(274989, nil, nil, nil, "YELL")--Mythic
local specWarnLingeringInfection			= mod:NewSpecialWarningStack(265127, nil, 6, nil, nil, 1, 6)
local specWarnLiquefy						= mod:NewSpecialWarningSpell(265217, nil, nil, nil, 3, 2)
local specWarnTerminalEruption				= mod:NewSpecialWarningSpell(274989, nil, nil, nil, 2, 2)
--local specWarnGTFO						= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 2)

--mod:AddTimerLine(Nexus)
local timerEvolvingAfflictionCD				= mod:NewCDTimer(8.5, 265178, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)
local timerGestateCD						= mod:NewCDTimer(25.5, 265212, nil, nil, nil, 3)
local timerContagionCD						= mod:NewCDCountTimer(23, 267242, nil, nil, nil, 2, nil, DBM_CORE_DEADLY_ICON)
local timerLiquefyCD						= mod:NewCDTimer(90.9, 265217, nil, nil, nil, 6)
local timerHypergenesisCD					= mod:NewCDCountTimer(11.4, 266459, nil, nil, nil, 5)--11.4 or 12.2, not sure which one blizz decided on, find out later
local timerImmunoSuppCD						= mod:NewCDCountTimer(25.5, 265206, nil, nil, nil, 5, nil, DBM_CORE_HEALER_ICON)

--local berserkTimer						= mod:NewBerserkTimer(600)

local countdownGestate						= mod:NewCountdown(25.5, 265212, true, nil, 3)
--local countdownEvolvingAffliction			= mod:NewCountdown("Alt12", 265178, "Tank", 2, 3)
local countdownLiquefy						= mod:NewCountdown("AltTwo90", 265217, nil, nil, 3)

mod:AddSetIconOption("SetIconVector", 265129, true)
mod:AddRangeFrameOption("5/8")
mod:AddInfoFrameOption(265127, true)
mod:AddBoolOption("ShowHighestFirst", true)--The priority for mythic, non mythic will probably turn off

mod.vb.ContagionCount = 0
mod.vb.hyperGenesisCount = 0
mod.vb.omegaIcon = 1
local playerHasSix, playerHasTwelve, playerHasTwentyFive = false, false, false
local seenAdds = {}
local castsPerGUID = {}

function mod:OnCombatStart(delay)
	table.wipe(seenAdds)
	table.wipe(castsPerGUID)
	playerHasSix, playerHasTwelve, playerHasTwentyFive = false, false, false
	self.vb.ContagionCount = 0
	self.vb.hyperGenesisCount = 0
	self.vb.omegaIcon = 1
	timerEvolvingAfflictionCD:Start(4.7-delay)--Instantly on engage
	timerGestateCD:Start(10-delay)--SUCCESS
	countdownGestate:Start(10-delay)
	timerContagionCD:Start(20.5-delay, 1)
	timerLiquefyCD:Start(90.8-delay)
	countdownLiquefy:Start(90.8-delay)
	if self.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(DBM:GetSpellInfo(265127))
		DBM.InfoFrame:Show(8, "playerdebuffstacks", 265127, self.Options.ShowHighestFirst and 1 or 2)
	end
end

function mod:OnCombatEnd()
	table.wipe(seenAdds)
	table.wipe(castsPerGUID)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end

function mod:OnTimerRecovery()
	if self:IsMythic() then
		local _, _, count = DBM:UnitDebuff("player", 265127)--Lingering Infection Recovery
		if count then
			if count >= 6 then
				playerHasSix = true
				if self.Options.RangeFrame then
					DBM.RangeCheck:Show(5)
				end
			end
			if count >= 12 then--Spawning Parasite (274983) will begin
				playerHasTwelve = true
			end
			if count >= 25 then
				playerHasTwentyFive = true
			end
		end
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 267242 then
		self.vb.ContagionCount = self.vb.ContagionCount + 1
		warnContagion:Show(self.vb.ContagionCount)
		--specWarnContagion:Play("aesoon")
		timerContagionCD:Start(nil, self.vb.ContagionCount+1)
		if self:IsMythic() then
			if playerHasSix then
				specWarnBurstingLesions:Show()
				specWarnBurstingLesions:Play("range5")
				--Yell Priorities
				if playerHasTwentyFive then
					yellTerminalEruption:Yell()
				elseif playerHasTwelve then
					yellEngorgedParasite:Yell()
				else
					yellBurstingLesions:Yell()
				end
			end
			for uId in DBM:GetGroupMembers() do
				local _, _, count = DBM:UnitDebuff("player", 265127)
				if count and count >= 25 then
					specWarnTerminalEruption:Show()
					specWarnTerminalEruption:Play("aesoon")
					break
				end
			end
		end
	elseif spellId == 265217 then
		specWarnLiquefy:Show()
		specWarnLiquefy:Play("phasechange")
		self.vb.ContagionCount = 0
		self.vb.hyperGenesisCount = 0
		timerGestateCD:Stop()
		countdownGestate:Cancel()
		timerEvolvingAfflictionCD:Stop()
		timerContagionCD:Stop()
		timerHypergenesisCD:Start(9.8, 1)
	elseif spellId == 265206 then
		castsPerGUID[args.sourceGUID] = castsPerGUID[args.sourceGUID] + 1
		warnImmunoSupp:Show(castsPerGUID[args.sourceGUID])
		timerImmunoSuppCD:Start(9.7, castsPerGUID[args.sourceGUID]+1, args.sourceGUID)
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 265178 then
		timerEvolvingAfflictionCD:Start()
	elseif spellId == 266459 then
		self.vb.hyperGenesisCount = self.vb.hyperGenesisCount + 1
		warnHypergenesis:Show(self.vb.hyperGenesisCount)
		if self.vb.hyperGenesisCount == 1 then
			timerHypergenesisCD:Start(nil, 2)
		end
	elseif spellId == 265212 or spellId == 265209 then
		timerGestateCD:Start()
		countdownGestate:Start()
	end
end

function mod:SPELL_SUMMON(args)
	local spellId = args.spellId
	if spellId == 275055 and self:AntiSpam(5, 1) then
		specWarnSpawnParasite:Show()
		specWarnSpawnParasite:Play("killmob")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 265178 then
		local uId = DBM:GetRaidUnitId(args.destName)
		if self:IsTanking(uId) then
			local amount = args.amount or 1
			if amount >= 2 then
				if args:IsPlayer() then
					warnEvolvingAffliction:Show(args.destName, amount)
					specWarnEvolvingAffliction:Show(amount)
					specWarnEvolvingAffliction:Play("stackhigh")
					--yellEvolvingAffliction:Cancel()
					--yellEvolvingAffliction:Countdown(12)
				else
					local _, _, _, _, expireTime = DBM:UnitDebuff("player", spellId)
					local remaining
					if expireTime then
						remaining = expireTime-GetTime()
					end
					if not UnitIsDeadOrGhost("player") and (not remaining or remaining and remaining < 8) then
						specWarnEvolvingAfflictionOther:Show(args.destName)
						specWarnEvolvingAfflictionOther:Play("tauntboss")
					else
						warnEvolvingAffliction:Show(args.destName, amount)
					end
				end
			else
				warnEvolvingAffliction:Show(args.destName, amount)
			end
		end
	elseif spellId == 265129 then
		if args:IsPlayer() and self:AntiSpam(1.5, 2) then
			specWarnOmegaVector:Show()
			specWarnOmegaVector:Play("targetyou")
			yellOmegaVector:Yell()
			local _, _, _, _, _, expireTime = DBM:UnitDebuff("player", spellId)--Flex debuff, have to live pull duration
			if expireTime then--Done this way so hotfix automatically goes through
				local remaining = expireTime-GetTime()
				yellOmegaVectorFades:Countdown(remaining, 3)
			end
		end
		if self.Options.SetIconVector then
			self:SetIcon(args.destName, self.vb.omegaIcon)
		end
		self.vb.omegaIcon = self.vb.omegaIcon + 1
		local expectedDebuffs = self:IsMythic() and 5 or 4
		if self.vb.omegaIcon == expectedDebuffs then
			self.vb.omegaIcon = 1
		end
	elseif spellId == 265212 and self:AntiSpam(4, args.destName) then
		if args:IsPlayer() then
			specWarnGestate:Show()
			specWarnGestate:Play("targetyou")
			yellGestate:Yell()
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(8)
			end
		elseif self:CheckNearby(5, args.destName) then
			specWarnGestateNear:Show(args.destName)
			specWarnGestateNear:Play("runaway")
		else
			warnGestate:Show(args.destName)
		end
		specWarnAmalgam:Show()
		specWarnAmalgam:Play("killmob")
	elseif spellId == 265127 then
		if args:IsPlayer() and self:IsMythic() then
			local amount = args.amount or 1
			if not playerHasSix and amount >= 6 then
				playerHasSix = true
				specWarnLingeringInfection:Show(amount)
				specWarnLingeringInfection:Play("stackhigh")
				if self.Options.RangeFrame then
					DBM.RangeCheck:Show(5)
				end
			elseif not playerHasTwelve and amount >= 12 then--Spawning Parasite (274983) will begin
				playerHasTwelve = true
				specWarnLingeringInfection:Show(amount)
				specWarnLingeringInfection:Play("stackhigh")
				--yellEngorgedParasite:Yell()
			elseif not playerHasTwentyFive and amount >= 25 then
				playerHasTwentyFive = true
				specWarnLingeringInfection:Show(amount)
				specWarnLingeringInfection:Play("stackhigh")
				--yellTerminalEruption:Yell()
			end
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 265178 then
		if args:IsPlayer() then
			--yellEvolvingAffliction:Cancel()
		end
	elseif spellId == 265129 then
		if args:IsPlayer() then
			yellOmegaVectorFades:Cancel()
		end
		if self.Options.SetIconVector then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 265212 then
		--specWarnAmalgam:Show()
		--specWarnAmalgam:Play("killmob")
		if args:IsPlayer() then
			if self.Options.RangeFrame then
				if playerHasSix then
					DBM.RangeCheck:Show(5)
				else
					DBM.RangeCheck:Hide()
				end
			end
		end
	elseif spellId == 265217 then
		timerEvolvingAfflictionCD:Start(8.5)
		timerGestateCD:Start(14.6)--SUCCESS
		countdownGestate:Start(14.6)
		timerContagionCD:Start(24.3, 1)
		timerLiquefyCD:Start(94.8)
		countdownLiquefy:Start(94.8)
	end
end

--2.5 seconds faster than APPLIED/SUCCESS, giving you a little time to move out of melee before stun
function mod:RAID_BOSS_WHISPER(msg)
	if msg:find("265212") then
		specWarnGestate:Show()
		specWarnGestate:Play("targetyou")
		yellGestate:Yell()
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(8)
		end
	end
end

function mod:OnTranscriptorSync(msg, targetName)
	if msg:find("265212") and targetName then
		targetName = Ambiguate(targetName, "none")
		if self:AntiSpam(4, targetName) then
			if UnitName("player") == targetName then return end--Player already got warned
			if self:CheckNearby(5, targetName) then
				specWarnGestateNear:Show(targetName)
				specWarnGestateNear:Play("runaway")
			else
				warnGestate:Show(targetName)
			end
			specWarnAmalgam:Show()
			specWarnAmalgam:Play("killmob")
		end
	end
end

function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
	for i = 1, 5 do
		local unitID = "boss"..i
		local GUID = UnitGUID(unitID)
		if GUID and not seenAdds[GUID] then
			seenAdds[GUID] = true
			local cid = self:GetCIDFromGUID(GUID)
			if cid == 135016 then--Big Adds
				castsPerGUID[GUID] = 0
				timerImmunoSuppCD:Start(5.4, 1, GUID)
			end
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 135016 then
		timerImmunoSuppCD:Stop(castsPerGUID[args.destGUID]+1, args.destGUID)
		castsPerGUID[args.destGUID] = nil
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnGTFO:Show()
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 265291 then--Liquefy Cancel Cosmetic

	end
end
--]]
