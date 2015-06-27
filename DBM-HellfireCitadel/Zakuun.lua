local mod	= DBM:NewMod(1391, "DBM-HellfireCitadel", nil, 669)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 13929 $"):sub(12, -3))
mod:SetCreatureID(89890)
mod:SetEncounterID(1777)
mod:SetZone()
mod:SetUsedIcons(8, 7, 6, 5, 4, 3, 2, 1)
mod:SetRespawnTime(30)

mod:RegisterCombat("combat")


mod:RegisterEventsInCombat(
	"SPELL_CAST_START 179406 179582",
	"SPELL_CAST_SUCCESS 181508 181515 179709",
	"SPELL_AURA_APPLIED 181508 181515 182008 179670 179711 179681 179407 179667",
	"SPELL_AURA_REMOVED 179711 181508 181515 179667",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, two versions of seed? one with shorter duration? shorter one mythic?
--TODO, need voice for "centerleft" and "centerright"
--TODO, auto send latent energy targets down for disembodied?
--TODO, see where guilds commonly put the 5 raid flares, then use HUD run to features for it as well
--TODO, if blizzard keeps Befouled hidden from combat log, use a stupid "finddebuff" method
--Encounter-Wide Mechanics
local warnLatentEnergy					= mod:NewTargetAnnounce(182008, 3, nil, false)--Spammy, optional
local warnEnrage						= mod:NewSpellAnnounce(179681, 3)
--Armed
local warnRumblingFissure				= mod:NewCountAnnounce(179582, 2)
local warnBefouled						= mod:NewTargetCountAnnounce(179711, 2, nil, "Healer")--Only healer really needs list of targets, player only needs to know if it's on self
local warnDisembodied					= mod:NewTargetCountAnnounce(179407, 2)--Needed to know for transport down.
--Disarmed
local warnSeedofDestruction				= mod:NewTargetCountAnnounce(181508, 4)

--Encounter-Wide Mechanics
local specWarnWakeofDestruction			= mod:NewSpecialWarningSpell(181499, nil, nil, nil, 2, 2)--Triggered by 3 different things
--Armed
local specWarnDisarmedEnd				= mod:NewSpecialWarningEnd(179667)
local specWarnSoulCleave				= mod:NewSpecialWarningCount(179406, "Melee", nil, nil, 1, 5)
local specWarnDisembodied				= mod:NewSpecialWarningTaunt(179407)
local specWarnBefouled					= mod:NewSpecialWarningMoveAway(179711)--Aoe damage was disabled on ptr, bug?
local specWarnBefouledOther				= mod:NewSpecialWarningTargetCount(179711, false)
--Disarmed
local specWarnDisarmed					= mod:NewSpecialWarningSpell(179667)
local specWarnSeedofDestruction			= mod:NewSpecialWarningYou(181508, nil, nil, nil, 3, 2)
local specWarnSeedPosition				= mod:NewSpecialWarning("specWarnSeedPosition", nil, false, nil, 1, 4)--Mythic Position Assignment. No option, connected to specWarnMarkedforDeath
local yellSeedsofDestruction			= mod:NewYell(181508)

--Armed
local timerRumblingFissureCD			= mod:NewCDTimer(40, 179582)
local timerBefouledCD					= mod:NewCDTimer(38, 179711)
local timerSoulCleaveCD					= mod:NewCDTimer(40, 179406)
local timerCavitationCD					= mod:NewCDTimer(40, 181461)
--Disarmed
local timerDisarmCD						= mod:NewCDTimer(85.8, 179667)
local timerSeedsofDestructionCD			= mod:NewCDCountTimer(14.5, 181508)--14.5-16

--local berserkTimer					= mod:NewBerserkTimer(360)

local countdownDisarm					= mod:NewCountdown(85.8, 179667)
local countdownDisembodied				= mod:NewCountdownFades("AltTwo10", 179407, false)--Depends on whether or not you are going down.
local countdownSeedsofDestructionCD		= mod:NewCountdown(14.5, 181508)--Seeds cannot be cast while disarm countdown is running, so this is fine.
local countdownSeedsofDestruction		= mod:NewCountdownFades("Alt5", 181508)--Alt voice for expiring is good.

local voiceSoulCleave					= mod:NewVoice(179406)--"179406"
local voiceWakeofDestruction			= mod:NewVoice(181499)--watchwave
local voiceSeedsofDestruction			= mod:NewVoice(181508)--Runout
local voiceEnrage						= mod:NewVoice(179681)--enrage

--mod:AddRangeFrameOption(10, 179711)
--Icon options will conflict on mythic or 25-30 players (when you get 5 targets for each debuff). Below that, they can coexist.
--mod:AddSetIconOption("SetIconOnBefouled", 179711, false)--Start at 1, ascending--Disabled for now to avoid conflict, seeds icons are too important to create conflicts
mod:AddSetIconOption("SetIconOnSeeds", 181508, true)--Start at 8, descending. On by default, because it's quite imperative to know who/where seed targets are at all times.
mod:AddHudMapOption("HudMapOnSeeds", 181508)
mod:AddDropdownOption("SeedsBehavior", {"Iconed", "Numbered", "DirectionLine", "FreeForAll"}, "Iconed", "misc")--CrossPerception, CrossCardinal, ExCardinal

mod.vb.befouledTargets = 0
mod.vb.FissureCount = 0
mod.vb.BefouledCount = 0
mod.vb.SoulCleaveCount = 0
mod.vb.CavitationCount = 0
mod.vb.SeedsCount = 0
mod.vb.Enraged = false
local yellSeeds2 = mod:NewYell(181508, L.customSeedsSay, true, false)
local seedTargets = 0
local seedsName = GetSpellInfo(181508)
local befouledName = GetSpellInfo(179711)
local UnitDebuff = UnitDebuff
local debuffFilter
do
	local UnitDebuff = UnitDebuff
	debuffFilter = function(uId)
		if UnitDebuff(uId, befouledName) then
			return true
		end
	end
end

--[[
local function updateRangeFrame(self)
	if not self.Options.RangeFrame then return end
	if UnitDebuff("player", befouledName) then
		DBM.RangeCheck:Show(10)
	elseif self.vb.befouledTargets > 0 then
		DBM.RangeCheck:Show(10, debuffFilter)
	else
		DBM.RangeCheck:Hide()
	end
end--]]

local function findBefouled(self)
	local BefouledTargets = {}
	local found = 0
	for uId in DBM:GetGroupMembers() do
		if UnitDebuff(uId, befouledName) then--Fixate with just name very usual debuff, so check spellId also.
			found = found + 1
			local targetname = GetUnitName(uId, true)
			BefouledTargets[#BefouledTargets + 1] = targetname
			if targetname == UnitName("player") then
				specWarnBefouled:Show()
			end
		end
	end
	if found == 0 then return end--Did not find any, failed
	if self.Options.SpecWarn179771targetcount then
		specWarnBefouledOther:Show(self.vb.BefouledCount, table.concat(BefouledTargets, "<, >"))
	else
		warnBefouled:Show(self.vb.BefouledCount, table.concat(BefouledTargets, "<, >"))
	end
end

local playerName = UnitName("player")
local yellType = "Icon"
local iconedAssignments = {RAID_TARGET_8, RAID_TARGET_7, RAID_TARGET_6, RAID_TARGET_5, RAID_TARGET_4}
local iconedVoiceAssignments = {"mm8", "mm7", "mm6", "mm5", "mm4"}
local numberedAssignments = {1, 2, 3, 4, 5}
local numberedVoiceAssignments = {"\\count\\1", "\\count\\2", "\\count\\3", "\\count\\4", "\\count\\5"}
local DirectionLineAssignments = {DBM_CORE_LEFT, DBM_CORE_MIDDLE..DBM_CORE_LEFT, DBM_CORE_MIDDLE, DBM_CORE_MIDDLE..DBM_CORE_RIGHT, DBM_CORE_RIGHT}
local DirectionVoiceAssignments = {"left", "centerleft", "center", "centerright", "right"}
local function warnSeeds(self)
	seedTargets = 0
	--Sort by raidid since combat log order may diff person to person
	if self:IsLFR() then return end
	local seedsFound = 0
	local numGroupMembers = DBM:GetNumGroupMembers()
	local expectedTotal = self:IsMythic() and 5 or 4--TODO, verify it's always 4, flexible shit sucks for this
	if numGroupMembers < expectedTotal+1 then return end--Future proofing solo raid. can't assign 3 positions if less than 3 people
	--Generate type
	local currentType
	local currentVoice
	if yellType == "Icon" then
		currentType = iconedAssignments
		currentVoice = iconedVoiceAssignments
	elseif yellType == "Numbered" then
		currentType = numberedAssignments
		currentVoice = numberedVoiceAssignments
	elseif yellType == "DirectionLine" then
		currentType = DirectionLineAssignments
		currentVoice = DirectionVoiceAssignments
	end
	for i = 1, numGroupMembers do
		if UnitDebuff("raid"..i, seedsName) then
			seedsFound = seedsFound + 1
			local targetName = UnitName("raid"..i)
			DBM:Debug(targetName.." is seeds "..seedsFound.."They are assigned "..currentType[seedsFound], 2)
			if targetName == playerName then
				if self.Options.SpecWarn181508you then
					specWarnSeedPosition:Show(currentType[seedsFound])
				end
				if self.Options.Yell181508 then
					yellSeeds2:Yell(currentType[seedsFound], playerName)
				end
				if currentVoice and currentVoice[seedsFound] then
					voiceSeedsofDestruction:Play(currentVoice[seedsFound])
				end
			end
			if seedsFound == expectedTotal then break end
		end
	end
end

local function warnWake(self)
	if self:AntiSpam(3, 1) then
		specWarnWakeofDestruction:Show()
		voiceWakeofDestruction:Play("watchwave")
	end
end

function mod:OnCombatStart(delay)
	seedTargets = 0
	self.vb.befouledTargets = 0
	self.vb.FissureCount = 0
	self.vb.BefouledCount = 0
	self.vb.SoulCleaveCount = 0
	self.vb.CavitationCount = 0
	self.vb.SeedsCount = 0
	self.vb.Enraged = false
	timerRumblingFissureCD:Start(5.5-delay, 1)
	timerBefouledCD:Start(17-delay, 1)
	timerSoulCleaveCD:Start(25-delay, 1)
	timerCavitationCD:Start(35-delay, 1)
	timerDisarmCD:Start(86.7-delay)
	countdownDisarm:Start(86.7-delay)
	if UnitIsGroupLeader("player") and not self:IsLFR() then
		if self.Options.SeedsBehavior == "Iconed" then
			self:SendSync("Iconed")
		elseif self.Options.SeedsBehavior == "Numbered" then
			self:SendSync("Numbered")
		elseif self.Options.SeedsBehavior == "DirectionLine" then
			self:SendSync("DirectionLine")
		elseif self.Options.SeedsBehavior == "FreeForAll" then
			self:SendSync("FreeForAll")
		end
	else
		--Fancy stuff to check boss mod version of group leader, find out if it's DBM or Bigwigs
		--DBM:AddMsg(L.BWConfigMsg)
	end
end

function mod:OnCombatEnd()
	yellType = "Icon"--Reset on combat end, resetting on combat start could accidentally overright raid leaders assignment set on combat start.
--	if self.Options.RangeFrame then
--		DBM.RangeCheck:Hide()
--	end
	if self.Options.HudMapOnSeeds then
		DBMHudMap:Disable()
	end
end 

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 179406 then
		self.vb.SoulCleaveCount = self.vb.SoulCleaveCount + 1
		specWarnSoulCleave:Show(self.vb.SoulCleaveCount)
		voiceSoulCleave:Play("179406")
		if self.vb.Enraged or self.vb.SoulCleaveCount == 1 then--Only casts two between phases, unless enraged
			timerSoulCleaveCD:Start(nil, self.vb.SoulCleaveCount+1)
		end
	elseif spellId == 179582 then
		self.vb.FissureCount = self.vb.FissureCount + 1
		warnRumblingFissure:Show(self.vb.FissureCount)
		if self.vb.Enraged or self.vb.FissureCount == 1 then--Only casts two between phases, unless enraged
			timerRumblingFissureCD:Start(nil, self.vb.FissureCount+1)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 181508 or spellId == 181515 then--181508 disarmed version, 181515 enraged version
		self.vb.SeedsCount = self.vb.SeedsCount + 1
		if self.vb.Enraged then
			timerSeedsofDestructionCD:Start(40, self.vb.SeedsCount+1)
			countdownSeedsofDestructionCD:Start(40)
		elseif self.vb.SeedsCount < 2 then--Only casts two between phases, unless enraged
			timerSeedsofDestructionCD:Start(nil, self.vb.SeedsCount+1)
			countdownSeedsofDestructionCD:Start(14.5)
		end
	elseif spellId == 179709 then--Foul
		self.vb.BefouledCount = self.vb.BefouledCount + 1
		if self.vb.Enraged or self.vb.BefouledCount < 2 then--Only casts two between phases, unless enraged
			timerBefouledCD:Start(nil, self.vb.BefouledCount+1)
		end
		self:Schedule(0.3, findBefouled, self)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 181508 or spellId == 181515 then--181508 disarmed version, 181515 enraged version
		warnSeedofDestruction:CombinedShow(0.3, self.vb.SeedsCount, args.destName)
		if args:IsPlayer() then
			specWarnSeedofDestruction:Show()
			if self:IsLFR() or yellType == "FreeForAll" then
				yellSeedsofDestruction:Yell()
				voiceSeedsofDestruction:Play("runout")
			end
		end
		if self:AntiSpam(5, 2) then
			self:Schedule(3.5, warnWake, self)
			countdownSeedsofDestruction:Start()--Everyone, because waves occur.
		end
		if self.Options.SetIconOnSeeds and not self:IsLFR() then
			self:SetSortedIcon(0.7, args.destName, 8, 5, true)
		end
		if self.Options.HudMapOnSeeds then
			DBMHudMap:RegisterRangeMarkerOnPartyMember(spellId, "highlight", args.destName, 5, 13, 1, 1, 0, 0.5, nil, true, 1):Pulse(0.5, 0.5)
		end
		if yellType == "FreeForAll" then return end--Free for all, don't do any of fancy stuff
		seedTargets = seedTargets + 1
		self:Unschedule(warnSeeds)
		local expectedCount = self:IsMythic() and 5 or 4
		if seedTargets == expectedCount then--Have all targets, warn immediately
			warnSeeds(self)
		else
			self:Schedule(1.5, warnSeeds, self)--1.5 is probably a bit high, but not risking fragmentation again
		end
	elseif spellId == 182008 then
		warnLatentEnergy:CombinedShow(1, args.destName)
	elseif spellId == 179667 then--Disarmed
		self.vb.SeedsCount = 0
		specWarnDisarmed:Show()
		timerSeedsofDestructionCD:Start(8.5, 1)--8.5-10
		countdownSeedsofDestructionCD:Start(8.5)
	elseif spellId == 179681 then--Enrage (has both armed and disarmed abilities)
		timerDisarmCD:Cancel()--Assumed
		countdownDisarm:Cancel()
		timerCavitationCD:Cancel()
		timerSeedsofDestructionCD:Cancel()
		countdownSeedsofDestructionCD:Cancel()
		self.vb.Enraged = true
		self.vb.CavitationCount = 0
		self.vb.SeedsCount = 0
		warnEnrage:Show()
		voiceEnrage:Play("enrage")
		timerSeedsofDestructionCD:Start(27, 1)
		countdownSeedsofDestructionCD:Start(27)
		timerCavitationCD:Start(35.5, 1)
	elseif spellId == 179711 then
		DBM:Debug("Befouled is in combat log again, refactor mod!")
--[[		self.vb.befouledTargets = self.vb.befouledTargets + 1
		if args:IsPlayer() then
			specWarnBefouled:Show()
		end
		if self.Options.SpecWarn179771targetcount then
			specWarnBefouledOther:CombinedShow(0.3, self.vb.BefouledCount, args.destName)
		else
			warnBefouled:CombinedShow(0.3, self.vb.BefouledCount, args.destName)
		end
		updateRangeFrame(self)
--		if self.Options.SetIconOnBefouled and not self:IsLFR() then
--			self:SetSortedIcon(0.7, args.destName, 1)
--		end--]]
	elseif spellId == 179407 then
		warnDisembodied:Show(self.vb.SoulCleaveCount, args.destName)
		countdownDisembodied:Start()
		if not args:IsPlayer() then
			specWarnDisembodied:Show(args.destName)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 179711 then
--		self.vb.befouledTargets = self.vb.befouledTargets - 1
--		updateRangeFrame(self)
--		if self.Options.SetIconOnBefouled and not self:IsLFR() then
--			self:SetIcon(args.destName, 0)
--		end
	elseif spellId == 181508 or spellId == 181515 then
		if self.Options.SetIconOnSeeds and not self:IsLFR() then
			self:SetIcon(args.destName, 0)--Number of targets not known yet, probably never will be if it's flexible and not mythic
		end
		if self.Options.HudMapOnSeeds then
			DBMHudMap:FreeEncounterMarkerByTarget(spellId, args.destName)
		end
	elseif spellId == 179667 then--Disarmed removed (armed)
		self.vb.FissureCount = 0
		self.vb.BefouledCount = 0
		self.vb.SoulCleaveCount = 0
		self.vb.CavitationCount = 0
		specWarnDisarmedEnd:Show()
		timerRumblingFissureCD:Start(3.5, 1)
		timerBefouledCD:Start(13.5, 1)
		timerSoulCleaveCD:Start(23, 1)
		timerCavitationCD:Start(33, 1)
		timerDisarmCD:Start()
		countdownDisarm:Start()
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 181461 then--Sometimes does NOT show in combat log, this is only accurate way
		self.vb.CavitationCount = self.vb.CavitationCount + 1
		warnWake(self)
		if self.vb.Enraged or self.vb.CavitationCount == 1 then--Only casts two between phases, unless enraged
			timerCavitationCD:Start(nil, self.vb.CavitationCount+1)
		end	
	end
end

function mod:OnSync(msg)
	if self:IsLFR() then return end
	if msg == "Iconed" then
		yellType = "Icon"
		DBM:AddMsg(L.DBMConfigMsg:format(msg))
	elseif msg == "Numbered" then
		yellType = "Numbered"
		DBM:AddMsg(L.DBMConfigMsg:format(msg))
	elseif msg == "DirectionLine" then
		yellType = "DirectionLine"
		DBM:AddMsg(L.DBMConfigMsg:format(msg))
	elseif msg == "FreeForAll" then
		yellType = "FreeForAll"
		DBM:AddMsg(L.DBMConfigMsg:format(msg))
	end	
end
