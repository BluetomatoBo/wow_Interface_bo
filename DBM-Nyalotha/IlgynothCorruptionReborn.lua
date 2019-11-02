local mod	= DBM:NewMod(2374, "DBM-Nyalotha", nil, 1180)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20191024000147")
mod:SetCreatureID(158328)
mod:SetEncounterID(2345)
mod:SetZone()
mod:SetUsedIcons(1, 2, 3)--Unknown number of targets, guessed for now
mod:SetBossHPInfoToHighest()
mod.noBossDeathKill = true--Instructs mod to ignore 158328 deaths, since it might die 4x on this fight
--mod:SetHotfixNoticeRev(20190716000000)--2019, 7, 16
--mod:SetMinSyncRevision(20190716000000)
--mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 309961 311401 310788",
	"SPELL_CAST_SUCCESS 311401 310319 311159 310788",
	"SPELL_AURA_APPLIED 309961 311367 310322 315094 311159",
	"SPELL_AURA_APPLIED_DOSE 309961",
	"SPELL_AURA_REMOVED 311367 315094 311159",
	"SPELL_PERIODIC_DAMAGE 310322",
	"SPELL_PERIODIC_MISSED 310322",
	"SPELL_INTERRUPT",
	"UNIT_DIED",
	"RAID_BOSS_WHISPER",
	"UNIT_SPELLCAST_SUCCEEDED boss1 boss2 boss3 boss4"
)

--TODO, adjust tank stacks as needed
--TODO, make sure 158328 doesn't fire UNIT_DIED until fight is open. Remove 999999 when appropriate
--TODO, number of icons needed by MC targets. Also todo, probably change icons when BW adds icons that probably break compatability
--TODO, Corruptors gaze has no actual unit debuff, so if it's detectable at all, it'll be by RAID_BOSS_WHISPER, or blizzard is going for an amber shaper situation
--TODO, obviously better phase code, unless my guesses end up miraculously perfect
--TODO, https://ptr.wowhead.com/spell=312486/recurring-nightmare need DBM hand holding? Maybe we can track them on infoframe if required?
--TODO, accurate mythic tracking of mythic version of CursedBlood
--Stage 01: The Corruptor, Reborn
local warnEyeofNZoth						= mod:NewStackAnnounce(309961, 2, nil, "Tank")
local warnTouchoftheCorruptor				= mod:NewTargetNoFilterAnnounce(311367, 4)
local warnFixate							= mod:NewTargetAnnounce(315094, 2)
--Stage 02: The Organs of Corruption
local warnCursedBlood						= mod:NewTargetAnnounce(311159, 2)

--Stage 01: The Corruptor, Reborn
local specWarnEyeofNZoth					= mod:NewSpecialWarningStack(309961, nil, 2, nil, nil, 1, 6)
local specWarnEyeofNZothTaunt				= mod:NewSpecialWarningTaunt(309961, nil, nil, nil, 1, 2)
local specWarnTouchoftheCorruptor			= mod:NewSpecialWarningYou(311367, nil, nil, nil, 1, 2)
local yellTouchoftheCorruptor				= mod:NewYell(311367)
local specWarnCorruptorsGaze				= mod:NewSpecialWarningMoveAway(310319, nil, nil, nil, 1, 2)
local yellCorruptorsGaze					= mod:NewYell(310319)
local specWarnGTFO							= mod:NewSpecialWarningGTFO(310322, nil, nil, nil, 1, 8)
local specWarnFixate						= mod:NewSpecialWarningYou(315094, nil, nil, nil, 1, 2)
--Stage 02: The Organs of Corruption
local specWarnCursedBlood					= mod:NewSpecialWarningMoveAway(311159, nil, nil, nil, 1, 2)
local yellCursedBlood						= mod:NewYell(311159)
local yellCursedBloodFades					= mod:NewShortFadesYell(311159)
local specWarnPumpingBlood					= mod:NewSpecialWarningInterruptCount(310788, "HasInterrupt", nil, nil, 1, 2)

--mod:AddTimerLine(BOSS)
--Stage 01: The Corruptor, Reborn
local timerEyeofNZothCD						= mod:NewAITimer(5.3, 309961, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON, nil, 2, 4)
local timerTouchoftheCorruptorCD			= mod:NewAITimer(30.1, 311401, nil, nil, nil, 3, nil, DBM_CORE_HEROIC_ICON)
local timerCorruptorsGazeCD					= mod:NewAITimer(30.1, 310319, nil, nil, nil, 3)
--Stage 02: The Organs of Corruption
local timerCursedBloodCD					= mod:NewAITimer(30.1, 311159, nil, nil, nil, 3, nil, DBM_CORE_DEADLY_ICON)

--local berserkTimer						= mod:NewBerserkTimer(600)

mod:AddRangeFrameOption(11, 311159)
mod:AddInfoFrameOption(315094, true)
mod:AddSetIconOption("SetIconOnMC", 311367, true, false, {1, 2, 3})
mod:AddSetIconOption("SetIconOnOoze", "ej20988", false)--Perma disabled in LFR
mod:AddBoolOption("SetIconOnlyOnce", true)--If disabled, as long as living oozes are up, the skull will bounce around to lowest health mob continually, which is likely not desired by most, thus this defaulted on
mod:AddNamePlateOption("NPAuraOnPumpingBlood", 296914)
mod:AddMiscLine(DBM_CORE_OPTION_CATEGORY_DROPDOWNS)
mod:AddDropdownOption("InterruptBehavior", {"Three", "Four", "Five"}, "Three", "misc")

mod.vb.phase = 1
mod.vb.TouchofCorruptorIcon = 1
mod.vb.IchorCount = 0
mod.vb.interruptBehavior = "Three"

local addsTable = {}
local autoMarkScannerActive = false
local autoMarkBlocked = false
local fixatedTargets = {}
local castsPerGUID = {}
local interruptTextures = {[1] = 2178508, [2] = 2178501, [3] = 2178502, [4] = 2178503, [5] = 2178504, [6] = 2178505, [7] = 2178506, [8] = 2178507,}--Fathoms Deck (better icons still needed)

local updateInfoFrame
do
	local lines = {}
	local sortedLines = {}
	local function addLine(key, value)
		-- sort by insertion order
		lines[key] = value
		sortedLines[#sortedLines + 1] = key
	end
	local OozeName, fixateName = DBM:EJ_GetSectionInfo(20988), DBM:GetSpellInfo(315094)
	updateInfoFrame = function()
		table.wipe(lines)
		table.wipe(sortedLines)
		--Ooze Count
		if mod.vb.IchorCount > 0 then
			addLine(OozeName, mod.vb.IchorCount)
		end
		--Fixate target names
		if #fixatedTargets > 0 then
			addLine("---"..fixateName.."---")
			for i=1, #fixatedTargets do
				local name = fixatedTargets[i]
				addLine(name, "")
			end
		end
		--No Oozes alive and no fixates left, auto hide infoframe
		if #sortedLines == 0 then
			DBM.InfoFrame:Hide()
		end
		return lines, sortedLines
	end
end

local autoMarkOozes
do
	local UnitHealth, UnitHealthMax = UnitHealth, UnitHealthMax
	autoMarkOozes = function(self)
		self:Unschedule(autoMarkOozes)
		if self.vb.IchorCount == 0 then
			autoMarkScannerActive = false
			return
		end--None left, abort scans
		local lowestUnitID = nil
		local lowestHealth = 100
		local found = false
		for i = 1, 40 do
			local UnitID = "nameplate"..i
			local GUID = UnitGUID(UnitID)
			if GUID then
				local cid = self:GetCIDFromGUID(GUID)
				if cid == 159514 then
					local unitHealth = UnitHealth(UnitID) / UnitHealthMax(UnitID)
					if unitHealth < lowestHealth then
						lowestHealth = unitHealth
						lowestUnitID = UnitID
					end
				end
			end
		end
		if lowestUnitID then
			SetRaidTarget(lowestUnitID, 8)
			found = true
		end
		if found and self.Options.SetIconOnlyOnce then
			--Abort until invoked again
			autoMarkScannerActive = false
			autoMarkBlocked = true
			return
		end
		self:Schedule(1, autoMarkOozes, self)
	end
end

function mod:OnCombatStart(delay)
	--DBM Core Special Variables
	self.vb.bossLeft = 4--Ilgynoth plus 3 organs
	self.numBoss = 4--^^
	--Regular Variables
	self.vb.phase = 1
	self.vb.TouchofCorruptorIcon = 1
	self.vb.IchorCount = 0
	self.vb.interruptBehavior = self.Options.InterruptBehavior--Default it to whatever user has it set to, until group leader overrides it
	autoMarkScannerActive = false
	autoMarkBlocked = false
	table.wipe(addsTable)
	table.wipe(fixatedTargets)
	table.wipe(castsPerGUID)
	timerEyeofNZothCD:Start(1-delay)
	if self:IsHard() then
		timerTouchoftheCorruptorCD:Start(1-delay)
		--[[if self:IsMythic() then
			timerCursedBloodCD:Start(1-delay)
			timerCursedBloodCD:UpdateInline(DBM_CORE_MAGIC_ICON)
		end--]]
	end
	timerCorruptorsGazeCD:Start(1-delay)
	if UnitIsGroupLeader("player") and not self:IsLFR() then
		if self.Options.InterruptBehavior == "Three" then
			self:SendSync("Three")
		elseif self.Options.InterruptBehavior == "Four" then
			self:SendSync("Four")
		elseif self.Options.InterruptBehavior == "Five" then
			self:SendSync("Five")
		end
	end
	if self.Options.NPAuraOnPumpingBlood then
		DBM:FireEvent("BossMod_EnableHostileNameplates")
	end
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.NPAuraOnPumpingBlood then
		DBM.Nameplate:Hide(true, nil, nil, nil, true, true)
	end
end

--function mod:OnTimerRecovery()

--end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 309961 then
		timerEyeofNZothCD:Start()
	elseif spellId == 311401 then
		self.vb.TouchofCorruptorIcon = 1
	elseif spellId == 310788 then
		if not castsPerGUID[args.sourceGUID] then
			castsPerGUID[args.sourceGUID] = 0
		end
		if (self.vb.interruptBehavior == "Three" and castsPerGUID[args.sourceGUID] == 3) or (self.vb.interruptBehavior == "Four" and castsPerGUID[args.sourceGUID] == 4) or (self.vb.interruptBehavior == "Five" and castsPerGUID[args.sourceGUID] == 5) then
			castsPerGUID[args.sourceGUID] = 0
		end
		castsPerGUID[args.sourceGUID] = castsPerGUID[args.sourceGUID] + 1
		local count = castsPerGUID[args.sourceGUID]
		--timerPumpingBloodCD:Start(nil, count+1, args.sourceGUID)
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnPumpingBlood:Show(args.sourceName, count)
			if count == 1 then
				specWarnPumpingBlood:Play("kick1r")
			elseif count == 2 then
				specWarnPumpingBlood:Play("kick2r")
			elseif count == 3 then
				specWarnPumpingBlood:Play("kick3r")
			elseif count == 4 then
				specWarnPumpingBlood:Play("kick4r")
			elseif count == 5 then
				specWarnPumpingBlood:Play("kick5r")
			else--Shouldn't happen, but fallback rules never hurt
				specWarnPumpingBlood:Play("kickcast")
			end
		end
		if self.Options.NPAuraOnPumpingBlood then
			DBM.Nameplate:Show(true, args.sourceGUID, spellId, interruptTextures[count])
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 311401 then
		timerTouchoftheCorruptorCD:Start()
	elseif spellId == 310319 then
		timerCorruptorsGazeCD:Start()
	elseif spellId == 311159 then--or spellId == 314396
		timerCursedBloodCD:Start()
		if self:IsMythic() then
			timerCursedBloodCD:UpdateInline(DBM_CORE_MAGIC_ICON)
		end
	elseif spellId == 310788 then
		if self.Options.NPAuraOnPumpingBlood then
			DBM.Nameplate:Hide(true, args.sourceGUID)
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 309961 then
		local uId = DBM:GetRaidUnitId(args.destName)
		if self:IsTanking(uId) then
			local amount = args.amount or 1
			if amount >= 2 then
				if args:IsPlayer() then
					specWarnEyeofNZoth:Show(amount)
					specWarnEyeofNZoth:Play("stackhigh")
				else
					--Don't show taunt warning if you're 3 tanking and aren't near the boss (this means you are the add tank)
					--Show taunt warning if you ARE near boss, or if number of alive tanks is less than 3
					if (self:CheckNearby(8, args.destName) or self:GetNumAliveTanks() < 3) and not DBM:UnitDebuff("player", spellId) and not UnitIsDeadOrGhost("player") then--Can't taunt less you've dropped yours off, period.
						specWarnEyeofNZothTaunt:Show(args.destName)
						specWarnEyeofNZothTaunt:Play("tauntboss")
					else
						warnEyeofNZoth:Show(args.destName, amount)
					end
				end
			else
				warnEyeofNZoth:Show(args.destName, amount)
			end
		end
	elseif spellId == 311367 then
		warnTouchoftheCorruptor:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnTouchoftheCorruptor:Show()
			specWarnTouchoftheCorruptor:Play("targetyou")
			yellTouchoftheCorruptor:Yell()
		end
		if self.Options.SetIconOnMC then
			self:SetIcon(args.destName, self.vb.TouchofCorruptorIcon)
		end
		self.vb.TouchofCorruptorIcon = self.vb.TouchofCorruptorIcon + 1
	elseif spellId == 310322 and args:IsPlayer() and self:AntiSpam(2, 2) then
		specWarnGTFO:Show(args.spellName)
		specWarnGTFO:Play("watchfeet")
	elseif spellId == 315094 then--Ooze Fixate
		warnFixate:CombinedShow(1, args.destName)
		if args:IsPlayer() then
			specWarnFixate:Show()
			specWarnFixate:Play("targetyou")
		end
		if not addsTable[args.sourceGUID] then
			addsTable[args.sourceGUID] = true
			self.vb.IchorCount = self.vb.IchorCount + 1
			if self.Options.SetIconOnOoze and not self:IsLFR() and not autoMarkScannerActive and not autoMarkBlocked then
				autoMarkScannerActive = true
				self:Schedule(2.5, autoMarkOozes, self)--TODO, maybe speed up or slow down slightly
			end
		end
		if not tContains(fixatedTargets, args.destName) then
			table.insert(fixatedTargets, args.destName)
		end
		if self.Options.InfoFrame then
			if not DBM.InfoFrame:IsShown() then
				DBM.InfoFrame:SetHeader(args.spellName)
				DBM.InfoFrame:Show(6, "function", updateInfoFrame, false, false, true)
			else
				DBM.InfoFrame:Update()
			end
		end
	elseif spellId == 311159 then
		warnCursedBlood:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnCursedBlood:Show()
			specWarnCursedBlood:Play("runout")
			yellCursedBlood:Yell()
			yellCursedBloodFades:Countdown(spellId)
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(11)
			end
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 311367 then
		if self.Options.SetIconOnMC then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 315094 then
		local uId = DBM:GetRaidUnitId(args.destName)
		--Person could have more than one fixate, so we need to see if they still have one before removing from table
		if uId and not DBM:UnitDebuff(uId, spellId) then
			tDeleteItem(fixatedTargets, args.destName)
			if self.Options.InfoFrame then
				DBM.InfoFrame:Update()
			end
		end
	elseif spellId == 311159 then
		if args:IsPlayer() then
			yellCursedBloodFades:Cancel()
			if self.Options.RangeFrame then
				DBM.RangeCheck:Hide()
			end
		end
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 310322 and destGUID == UnitGUID("player") and self:AntiSpam(2, 2) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:SPELL_INTERRUPT(args)
	if type(args.extraSpellId) == "number" and args.extraSpellId == 310788 then
		if self.Options.NPAuraOnPumpingBlood then
			DBM.Nameplate:Hide(true, args.destGUID)
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 158343 then--Organ of Corruption
		self.vb.bossLeft = self.vb.bossLeft - 1
		self.vb.phase = self.vb.phase + 0.5
		table.wipe(castsPerGUID)
		timerCursedBloodCD:Stop()
		timerEyeofNZothCD:Start(2)
		if self:IsHard() then
			timerTouchoftheCorruptorCD:Start(2)
			--[[if self:IsMythic() then
				timerCursedBloodCD:Start()
				timerCursedBloodCD:UpdateInline(DBM_CORE_MAGIC_ICON)
			end--]]
		end
		timerCorruptorsGazeCD:Start(2)
		if self.Options.NPAuraOnPumpingBlood then
			DBM.Nameplate:Hide(true, args.destGUID)
		end
	--In off chance he does die 4x, we only want to count his final death as a win
	elseif cid == 158328 then--Ilgynoth himself
		if self.vb.bossLeft == 1 then--None of organs left, then this is true death
			self.vb.bossLeft = 0
			DBM:EndCombat(self)
		else
			self.vb.phase = self.vb.phase + 0.5
			timerCursedBloodCD:Start(2)
			if self:IsMythic() then
				timerCursedBloodCD:UpdateInline(DBM_CORE_MAGIC_ICON)
			end
		end
	elseif cid == 159514 then--blood-of-nyalotha
		self.vb.IchorCount = self.vb.IchorCount - 1
		addsTable[args.destGUID] = nil
		if self.Options.SetIconOnOoze and not self:IsLFR() then
			autoMarkBlocked = false
			autoMarkOozes(self)
		end
		if self.Options.InfoFrame then
			DBM.InfoFrame:Update()
		end
	end
end

function mod:RAID_BOSS_WHISPER(msg)
	if msg:find("310319") then
		specWarnCorruptorsGaze:Show()
		specWarnCorruptorsGaze:Play("justrun")
		yellCorruptorsGaze:Yell()
	end
end

--Placeholder. Maybe correct maybe totally wrong
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 312204 or spellId == 312203 then--Il'gynoth's Morass
		DBM:Debug("Il'gynoth's Morass fired with "..spellId)
	elseif spellId == 311577 then--Damaged Organ
		DBM:Debug("Damaged Organ fired")
	end
end

function mod:OnSync(msg)
	if self:IsLFR() then return end
	if msg == "Three" then
		self.vb.interruptBehavior = "Three"
	elseif msg == "Four" then
		self.vb.interruptBehavior = "Four"
	elseif msg == "Five" then
		self.vb.interruptBehavior = "Five"
	end
end
