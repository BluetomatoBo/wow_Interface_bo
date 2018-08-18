local mod	= DBM:NewMod(2147, "DBM-Uldir", nil, 1031)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 17682 $"):sub(12, -3))
mod:SetCreatureID(132998)
mod:SetEncounterID(2122)
mod:SetZone()
--mod:SetBossHPInfoToHighest()
mod:SetUsedIcons(6)
--mod:SetHotfixNoticeRev(16950)
--mod:SetMinSyncRevision(16950)
--mod.respawnTime = 35

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 272505 267509 267427 267412 273406 273405 267409 267462 267579 263482 263503 263307 275160",
	"SPELL_CAST_SUCCESS 263235 263482 263503 263373 270373 270428 276839 274582",
	"SPELL_AURA_APPLIED 268074 267813 277079 272506 274262 263372 270447 263235 270443",
	"SPELL_AURA_APPLIED_DOSE 270447",
	"SPELL_AURA_REMOVED 268074 267813 277079 272506 274262 263235 263372",
	"SPELL_PERIODIC_DAMAGE 270287",
	"SPELL_PERIODIC_MISSED 270287",
--	"SPELL_DAMAGE 263326",
--	"SPELL_MISSED 263326",
	"UNIT_DIED",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, adjust icons when other boss mods add them
--TODO, add "torment" timer?
--TODO, add "burrow" cd timer?
--TODO, add timers for host, when ORIGIN cast can be detected (not spread/fuckup casts)
--TODO, cast event for Matrix Surge and possible aoe warning (with throttle)
--TODO, how does http://bfa.wowhead.com/spell=268174/tendrils-of-corruption work? warning/yell? is it like yogg squeeze?
--TODO, Bursting Boil CAST detection
--TODO, find right balance for automating specWarnBloodFeastMoveTo. Right now don't want to assume EVERYONE goes to target, maybe only players above x stacks?
--TODO, timers for Mind Numbing Chatter?
--TODO, detecting cores that FAIL to deposit and get destroyed instead (to determin when next core timer is)
--[[
(ability.id = 272505 or ability.id = 267509 or ability.id = 273406 or ability.id = 273405 or ability.id = 267579 or ability.id = 263482 or ability.id = 263503 or ability.id = 275160) and type = "begincast"
 or (ability.id = 263235 or ability.id = 263482 or ability.id = 263503 or ability.id = 263373 or ability.id = 270373 or ability.id = 270428 or ability.id = 276839 or ability.id = 274582) and type = "cast"
 or ability.id = 270443
 or ability.name = "Wave of Corruption"
 or (ability.id = 267462 or ability.id = 267412 or ability.id = 267409) and type = "begincast"
--]]
--Arena Floor
--local warnXorothPortal				= mod:NewSpellAnnounce(244318, 2, nil, nil, nil, nil, nil, 7)
local warnBloodHost						= mod:NewTargetAnnounce(267813, 3)--Mythic
local warnDarkPurpose					= mod:NewTargetAnnounce(268074, 4, nil, false)--Mythic
local warnDarkBargain					= mod:NewSpellAnnounce(267409, 1)
local warnBurrow						= mod:NewSpellAnnounce(267579, 2)
local warnPowerMatrix					= mod:NewTargetNoFilterAnnounce(263420, 2, nil, false)--No Filter announce, but off by default since infoframe is more productive way of showing it

--Arena Floor
local specWarnBloodHost					= mod:NewSpecialWarningClose(267813, nil, nil, nil, 1, 2)--Mythic
--local specWarnSpawnofGhuun			= mod:NewSpecialWarningSwitch("ej13699", "RangedDps", nil, nil, 1, 2)
local yellBloodHost						= mod:NewYell(267813)--Mythic
local specWarnDarkPurpose				= mod:NewSpecialWarningRun(268074, nil, nil, nil, 4, 2)--Mythic
local yellDarkPurpose					= mod:NewYell(268074)--Mythic
local specWarnExplosiveCorruption		= mod:NewSpecialWarningMoveAway(272506, nil, nil, nil, 4, 2)
local yellExplosiveCorruption			= mod:NewYell(272506)
local yellExplosiveCorruptionFades		= mod:NewShortFadesYell(272506)
local specWarnThousandMaws				= mod:NewSpecialWarningSwitch(267509, nil, nil, nil, 1, 2)
local specWarnTorment					= mod:NewSpecialWarningInterrupt(267427, "HasInterrupt", nil, nil, 1, 2)
local specWarnMassiveSmash				= mod:NewSpecialWarningSpell(267412, nil, nil, nil, 1, 2)
local specWarnDarkBargain				= mod:NewSpecialWarningDodge(267409, nil, nil, nil, 1, 2)
local specWarnGTFO						= mod:NewSpecialWarningGTFO(270287, nil, nil, nil, 1, 2)
local specWarnDecayingEruption			= mod:NewSpecialWarningInterrupt(267462, "HasInterrupt", nil, nil, 1, 2)--Mythic
----Arena Floor P2+
local specWarnGrowingCorruption			= mod:NewSpecialWarningCount(270447, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.stack:format(5, 270447), nil, 1, 2)
local specWarnGrowingCorruptionOther	= mod:NewSpecialWarningTaunt(270447, nil, nil, nil, 1, 2)
local specWarnBloodFeast				= mod:NewSpecialWarningYou(263235, nil, nil, nil, 1, 2)
local yellBloodFeast					= mod:NewYell(263235)
local yellBloodFeastFades				= mod:NewFadesYell(263235)
local specWarnBloodFeastMoveTo			= mod:NewSpecialWarningMoveTo(263235, nil, nil, nil, 1, 2)
local specWarnMindNumbingChatter		= mod:NewSpecialWarningCast(263307, "SpellCaster", nil, nil, 1, 2)
----Arena Floor P3
local specWarnCollapse					= mod:NewSpecialWarningDodge(276839, nil, nil, nil, 2, 2)
local specWarnMalignantGrowth			= mod:NewSpecialWarningDodge(274582, nil, nil, nil, 2, 2)
local specWarnGazeofGhuun				= mod:NewSpecialWarningLookAway(275160, nil, nil, nil, 2, 2)
--Upper Platforms
local specWarnPowerMatrix				= mod:NewSpecialWarningYou(263420, nil, nil, nil, 1, 8)--New voice "Matrix on you"
local yellPowerMatrix					= mod:NewYell(263420)
local specWarnReorginationBlast			= mod:NewSpecialWarningSpell(263482, nil, nil, nil, 2, 2)

mod:AddTimerLine("Arena Floor")--Dungeon journal later
local timerExplosiveCorruptionCD		= mod:NewCDCountTimer(13, 272506, nil, nil, nil, 3)
local timerThousandMawsCD				= mod:NewCDCountTimer(23.9, 267509, nil, nil, nil, 1)--23.9-26.7
----Adds
local timerMassiveSmashCD				= mod:NewCDTimer(9.7, 267412, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)
local timerDarkBargainCD				= mod:NewCDTimer(23.1, 267409, nil, nil, nil, 3, nil, DBM_CORE_DAMAGE_ICON)
mod:AddTimerLine(SCENARIO_STAGE:format(2))
local timerWaveofCorruptionCD			= mod:NewCDCountTimer(15, 270373, nil, nil, nil, 3)
local timerBloodFeastCD					= mod:NewCDTimer(15, 263235, nil, nil, nil, 2)
mod:AddTimerLine(SCENARIO_STAGE:format(3))
local timerMalignantGrowthCD			= mod:NewCDTimer(20.5, 274582, nil, nil, nil, 3)
local timerGazeofGhuunCD				= mod:NewCDTimer(21.9, 275160, nil, nil, nil, 2)
mod:AddTimerLine("Upper Platforms")--Dungeon journal later
local timerMatrixCD						= mod:NewNextCountTimer(12.1, 263420, nil, nil, nil, 5)
local timerReOrgBlast					= mod:NewBuffActiveTimer(25, 263482, nil, nil, nil, 6)

--local berserkTimer					= mod:NewBerserkTimer(600)

--local countdownCollapsingWorld			= mod:NewCountdown(50, 243983, true, 3, 3)
--local countdownRealityTear				= mod:NewCountdown("Alt12", 244016, false, 2, 3)
--local countdownFelstormBarrage			= mod:NewCountdown("AltTwo32", 244000, nil, nil, 3)

mod:AddRangeFrameOption(5, 270428)
--mod:AddBoolOption("ShowAllPlatforms", false)
mod:AddInfoFrameOption(nil, true)
mod:AddNamePlateOption("NPAuraOnFixate", 268074)
mod:AddNamePlateOption("NPAuraOnUnstoppable", 275204)
mod:AddSetIconOption("SetIconOnBloodHost", 267813, true)

mod.vb.phase = 1
mod.vb.mawCastCount = 0
mod.vb.matrixCount = 0
mod.vb.explosiveCount = 0
mod.vb.waveCast = 0
local matrixTargets, bloodFeastTarget = {}, {}
local thousandMawsTimers = {25.4, 26.3, 25.5, 24.2, 23.9, 23.1, 21.5, 21.9, 19.4}

local updateInfoFrame
do
	local matrixSpellName, bloodFeastName = DBM:GetSpellInfo(263372), DBM:GetSpellInfo(263235)
	local lines = {}
	local sortedLines = {}
	local function addLine(key, value)
		-- sort by insertion order
		lines[key] = value
		sortedLines[#sortedLines + 1] = key
	end
	updateInfoFrame = function()
		table.wipe(lines)
		table.wipe(sortedLines)
		--Boss Powers first
		--TODO, eliminate main or alternate if it's not needed (drycode checking both to ensure everything is covered)
		--TODO, eliminate worthless tentacles and stuff
		for i = 1, 2 do
			local uId = "boss"..i
			--Primary Power
			local currentPower, maxPower = UnitPower(uId), UnitPowerMax(uId)
			if maxPower and maxPower ~= 0 then
				if currentPower / maxPower * 100 >= 1 then
					addLine(UnitName(uId), currentPower)
				end
			end
			--Alternate Power
			local currentAltPower, maxAltPower = UnitPower(uId, 10), UnitPowerMax(uId, 10)
			if maxAltPower and maxAltPower ~= 0 then
				if currentAltPower / maxAltPower * 100 >= 1 then
					addLine(UnitName(uId), currentAltPower)
				end
			end
		end
		--Scan raid for notable debuffs and add them
		for i=1, #matrixTargets do
			local name = matrixTargets[i]
			local uId = DBM:GetRaidUnitId(name)
			if not uId then break end
			addLine(matrixSpellName, UnitName(uId))
		end
		for i=1, #bloodFeastTarget do
			local name = bloodFeastTarget[i]
			local uId = DBM:GetRaidUnitId(name)
			if not uId then break end
			addLine(bloodFeastName, UnitName(uId))
		end
		--Player personal checks
		local spellName3, _, _, _, _, expireTime = DBM:UnitDebuff("player", 263436)
		if spellName3 and expireTime then--Personal Imperfect Physiology
			local remaining = expireTime-GetTime()
			addLine(spellName3, math.floor(remaining))
		end
		local spellName4, _, currentStack = DBM:UnitDebuff("player", 263227, 269301)
		if spellName4 and currentStack then--Personal Putrid Blood count
			addLine(spellName4, currentStack)
		end
		local spellName5, _, _, _, _, expireTime2 = DBM:UnitDebuff("player", 277007)
		if spellName5 and expireTime2 then--Personal Bursting Boil
			local remaining2 = expireTime2-GetTime()
			addLine(spellName5, math.floor(remaining2))
		end
		local spellName6, _, _, _, _, expireTime3 = DBM:UnitDebuff("player", 273405, 267409)
		if spellName6 and expireTime3 then--Personal Dark Bargain
			local remaining3 = expireTime3-GetTime()
			addLine(spellName6, math.floor(remaining3))
		end
		return lines, sortedLines
	end
end

function mod:OnCombatStart(delay)
	table.wipe(matrixTargets)
	table.wipe(bloodFeastTarget)
	self.vb.phase = 1
	self.vb.mawCastCount = 0
	self.vb.matrixCount = 0
	self.vb.explosiveCount = 0
	self.vb.waveCast = 0
	timerMatrixCD:Start(5.3, 1)
	timerExplosiveCorruptionCD:Start(6-delay, 1)
	timerThousandMawsCD:Start(25.4-delay, 1)
	if self.Options.InfoFrame then
		DBM.InfoFrame:Show(8, "function", updateInfoFrame, false, false)
	end
	if self.Options.NPAuraOnFixate or self.Options.NPAuraOnUnstoppable then
		DBM:FireEvent("BossMod_EnableHostileNameplates")
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	if self.Options.NPAuraOnFixate or self.Options.NPAuraOnUnstoppable then
		DBM.Nameplate:Hide(false, nil, nil, nil, true, true)
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 272505 then
		self.vb.explosiveCount = self.vb.explosiveCount + 1
		timerExplosiveCorruptionCD:Start(13, self.vb.explosiveCount+1)
	elseif spellId == 267509 then
		self.vb.mawCastCount = self.vb.mawCastCount + 1
		specWarnThousandMaws:Show()
		specWarnThousandMaws:Play("killmob")
		local timer = thousandMawsTimers[self.vb.mawCastCount+1]
		if timer then
			timerThousandMawsCD:Start(timer, self.vb.mawCastCount+1)
		end
	elseif spellId == 267427 and self:CheckInterruptFilter(args.sourceGUID, false, true) then
		specWarnTorment:Show(args.sourceName)
		specWarnTorment:Play("kickcast")
	elseif spellId == 267462 and self:CheckInterruptFilter(args.sourceGUID, false, true) then
		specWarnDecayingEruption:Show(args.sourceName)
		specWarnDecayingEruption:Play("kickcast")
	elseif spellId == 267412 and self:CheckInterruptFilter(args.sourceGUID, true) then
		specWarnMassiveSmash:Show()
		specWarnMassiveSmash:Play("carefly")
		timerMassiveSmashCD:Start(9.7, args.sourceGUID)
	elseif (spellId == 273406 or spellId == 273405 or spellId == 267409) then
		timerDarkBargainCD:Start(23, args.sourceGUID)
		if self:AntiSpam(3.5, 1) then--Dark Bargains
			if spellId ~= 273406 and DBM:UnitDebuff("player", 273405, 267409) then--Run out or get MCed
				specWarnDarkBargain:Show()
				specWarnDarkBargain:Play("runaway")
			else
				warnDarkBargain:Show()
			end
		end
	elseif spellId == 267579 then
		warnBurrow:Show()
	elseif (spellId == 263482 or spellId == 263503) then
		specWarnReorginationBlast:Show()
		specWarnReorginationBlast:Play("aesoon")--Or phase change
		timerMatrixCD:Stop()
		timerMatrixCD:Start(30, self.vb.matrixCount+1)
	elseif spellId == 263307 then
		specWarnMindNumbingChatter:Show()
		specWarnMindNumbingChatter:Play("stopcast")
	elseif spellId == 275160 then
		specWarnGazeofGhuun:Show()
		specWarnGazeofGhuun:Play("turnaway")
		timerGazeofGhuunCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 263235 then--Blood Feast
		self.vb.waveCast = 0
		timerWaveofCorruptionCD:Start(16, 1)--Wave of corruption is next, not blood Feast
	elseif (spellId == 263482 or spellId == 263503) then
		self.vb.matrixCount = 0
		timerReOrgBlast:Start()
		if self.vb.phase < 2 then--Phase 2
			self.vb.phase = 2
			self.vb.explosiveCount = 0
			timerThousandMawsCD:Stop()
			timerExplosiveCorruptionCD:Stop()
			timerMassiveSmashCD:Stop()--Technically should AddTime(25) each add, but honestly, if the adds don't die in this 25 second window you done fucked up
			timerDarkBargainCD:Stop()--Technically should AddTime(25) each add, but honestly, if the adds don't die in this 25 second window you done fucked up
			timerExplosiveCorruptionCD:Start(25, 1)--Casts it instantly on stun end
		else
			if self.vb.waveCast == 2 then--Current timer is blood feast
				timerBloodFeastCD:AddTime(24)
			else--Current timer is wave of corruption
				timerWaveofCorruptionCD:AddTime(24, self.vb.waveCast+1)
			end
			timerExplosiveCorruptionCD:AddTime(24, self.vb.explosiveCount+1)
		end
	elseif spellId == 263373 then
		timerMatrixCD:Stop()
		timerMatrixCD:Start(11.5, self.vb.matrixCount+1)
	elseif spellId == 270373 or spellId == 270428 then--Wave of Corruption
		DBM:Debug("Wave of corruptino back in combat log")
	elseif spellId == 276839 then
		self.vb.phase = 3
		self.vb.explosiveCount = 0
		self.vb.waveCast = 0
		specWarnCollapse:Show()
		specWarnCollapse:Play("watchstep")
		timerBloodFeastCD:Stop()
		timerWaveofCorruptionCD:Stop()
		timerExplosiveCorruptionCD:Stop()
		timerExplosiveCorruptionCD:Start(27.6, 1)
		timerMalignantGrowthCD:Start(33.7)
		timerWaveofCorruptionCD:Start(37, 1)--30
		timerGazeofGhuunCD:Start(43.3)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 268074 then
		warnDarkPurpose:CombinedShow(0.5, args.destName)
		if args:IsPlayer() then
			specWarnDarkPurpose:Show()
			specWarnDarkPurpose:Play("justrun")
			yellDarkPurpose:Yell()
		end
		if self.Options.NPAuraOnFixate then
			DBM.Nameplate:Show(true, args.sourceGUID, spellId)
		end
	elseif spellId == 275204 then
		if self.Options.NPAuraOnUnstoppable then
			DBM.Nameplate:Show(true, args.sourceGUID, spellId)
		end
	elseif spellId == 267813 then
		if args:IsPlayer() then
			yellBloodHost:Yell()
		end
		if self:CheckNearby(20, args.destName) and self:AntiSpam(3.5, 3) then
			specWarnBloodHost:Show(args.destName)
			specWarnBloodHost:Play("runaway")
		else
			warnBloodHost:CombinedShow(0.5, args.destName)
		end
		if self.Options.SetIconOnBloodHost and not self:IsLFR() then
			--This assumes no fuckups. Because honestly coding this around fuckups is not worth the effort
			self:SetIcon(args.destName, 6)
		end
	elseif spellId == 277079 or spellId == 272506 or spellId == 274262 then
		if args:IsPlayer() then
			specWarnExplosiveCorruption:Show()
			specWarnExplosiveCorruption:Play("runout")
			yellExplosiveCorruption:Yell()
			yellExplosiveCorruptionFades:Countdown(spellId == 277079 and 6 or spellId == 272506 and 5 or 4)
		end
	elseif spellId == 263372 then
		if args:IsPlayer() then
			specWarnPowerMatrix:Show()
			specWarnPowerMatrix:Play("newmatrix")
			yellPowerMatrix:Yell()
		else
			if self:IsMythic() then
				warnPowerMatrix:CombinedShow(1, args.destName)
			else
				warnPowerMatrix:Show(args.destName)
			end
		end
		if not tContains(matrixTargets, args.destName) then
			table.insert(matrixTargets, args.destName)
		end
	elseif spellId == 270447 then
		local amount = args.amount or 1
		if (amount == 5 or amount >= 8) and self:AntiSpam(3, 4) then--First warning at 4, then a decent amount of time until 8. then spam every 3 seconds
			if self:IsTanking("player", "boss1", nil, true) then
				specWarnGrowingCorruption:Show(amount)
				specWarnGrowingCorruption:Play("changemt")
			else
				specWarnGrowingCorruptionOther:Show(L.name)
				specWarnGrowingCorruptionOther:Play("changemt")
			end
		end
	elseif spellId == 263235 then
		if args:IsPlayer() then
			specWarnBloodFeast:Show()
			specWarnBloodFeast:Play("targetyou")
			yellBloodFeast:Yell()
			yellBloodFeastFades:Countdown(8)
		else
			--specWarnBloodFeastMoveTo:Show(args.destName)
		end
		if not tContains(bloodFeastTarget, args.destName) then
			table.insert(bloodFeastTarget, args.destName)
		end
	elseif spellId == 270443 then
		--Start wave timer when boss activates, vs when he's first stunned.
		self.vb.waveCast = 0
		timerWaveofCorruptionCD:Start(15, 1)--10
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(5)
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 268074 then
		if self.Options.NPAuraOnFixate then
			DBM.Nameplate:Hide(true, args.sourceGUID, spellId)
		end
	elseif spellId == 275204 then
		if self.Options.NPAuraOnUnstoppable then
			DBM.Nameplate:Hide(true, args.sourceGUID, spellId)
		end
	elseif spellId == 267813 then
		if self:AntiSpam(5, 5) and not DBM:UnitDebuff("player", 267813) then
			--specWarnSpawnofGhuun:Show()
			--specWarnSpawnofGhuun:Play("killmob")
		end
		if self.Options.SetIconOnBloodHost and not self:IsLFR() then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 277079 or spellId == 272506 or spellId == 274262 then
		if args:IsPlayer() then
			yellExplosiveCorruptionFades:Cancel()
		end
	elseif spellId == 263235 then
		if args:IsPlayer() then
			yellBloodFeastFades:Cancel()
		end
		tDeleteItem(bloodFeastTarget, args.destName)
	elseif spellId == 263372 then
		tDeleteItem(matrixTargets, args.destName)
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 270287 and destGUID == UnitGUID("player") and self:AntiSpam(2, 6) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 263326 and destGUID == UnitGUID("player") and self:AntiSpam(2, 6) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 136461 then--spawn of ghuun
	
	elseif cid == 138531 or cid == 134634 then--Cyclopean Terror (P1, P2)
	
	elseif cid == 138529 or cid == 134635 then--Dark Young (P1, P2)
		timerMassiveSmashCD:Stop(args.destGUID)
		timerDarkBargainCD:Stop(args.destGUID)
	elseif cid == 134590 then--Blightspreader Tendril

	elseif cid == 141265 then--Amorphus Cyst (cat)
	
	elseif cid == 134010 then--Gibbering Horror
	
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, npc, _, _, target)
	if msg:find("spell:263420") and self:AntiSpam(15, 7) then
		self.vb.matrixCount = self.vb.matrixCount + 1
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 274582 then--Malignant Growth
		specWarnMalignantGrowth:Show()
		specWarnMalignantGrowth:Play("watchstep")
		timerMalignantGrowthCD:Start()
	--elseif spellId == 268251 then--Phase 2

	--elseif spellId == 269803 then--Phase 3
		
	--elseif spellId == 274318 then--Spell Picker (Wave of Corruption & Blood Feast alternating)
	
	elseif spellId == 270373 or spellId == 270428 then--Wave of Corruption (since blizzard decided to remove it from combat log) 270428
		self.vb.waveCast = self.vb.waveCast + 1
		if self.vb.phase == 2 then
			if self.vb.waveCast == 1 then
				timerWaveofCorruptionCD:Start(15, 2)
			else
				timerBloodFeastCD:Start(15)
			end
		else--No more blood feast, only waves
			timerWaveofCorruptionCD:Start(17, self.vb.waveCast+1)
		end
	end
end
