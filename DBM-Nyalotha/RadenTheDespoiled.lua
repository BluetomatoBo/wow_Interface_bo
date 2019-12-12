local mod	= DBM:NewMod(2364, "DBM-Nyalotha", nil, 1180)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20191204235330")
mod:SetCreatureID(156866)
mod:SetEncounterID(2331)
mod:SetZone()
mod:SetUsedIcons(1, 2, 3, 4, 5, 6, 7, 8)
mod:SetHotfixNoticeRev(20191204000000)--2019, 12, 04
mod:SetMinSyncRevision(20191109000000)
--mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 306865 306819 306866 313213 310003 309985 317276",
	"SPELL_CAST_SUCCESS 310019 313213 306603",
	"SPELL_SUMMON 306866",
	"SPELL_AURA_APPLIED 312750 306090 306168 306732 306733 312996 306257 306279 306819 313227 309852 306207 306273 313077 315252 316065",
	"SPELL_AURA_APPLIED_DOSE 306819 313227",
	"SPELL_AURA_REMOVED 312750 306090 306168 306732 306733 312996 306257 306279 306207 306273 313077 316065",
	"UNIT_DIED",
	"UNIT_SPELLCAST_START boss2 boss3 boss4 boss5",--if you have 4 adds up, you're doing shit wrong. Just in case
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, fine tune range checker with more robust checks, if mythic has more than 1 add spawn at a time
--TODO, fix charged bonds if non heroic difficulties use a diff spellId
--TODO, Chain Lightning timer? at the moment add stutter casts it so coding it with success means only starting a 3 second timer. If stutter casting is fixed I might put the timer in at START event
--TODO, Remaining Mythic Phase to be tested and verified and updated
--Stage 1: Gathering Power
----Vita
local warnVitaPhase							= mod:NewSpellAnnounce(306732, 2)
local warnUnstableVita						= mod:NewTargetNoFilterAnnounce(306257, 4)
----Void
local warnVoidPhase							= mod:NewSpellAnnounce(306733, 2)
local warnUnstableVoid						= mod:NewStackAnnounce(306634, 2)
local warnNullifyingStrike					= mod:NewStackAnnounce(306819, 2, nil, "Tank")
local warnVoidCollapse						= mod:NewTargetNoFilterAnnounce(306881, 4)
----Nightmare
local warnNightmarePhase					= mod:NewSpellAnnounce(312996, 2)
local warnUnstableNightmare					= mod:NewTargetNoFilterAnnounce(313077, 4)
------Night Terror
local warnDreadInferno						= mod:NewTargetNoFilterAnnounce(315252, 4)
--Stage 2: Unleashed Wrath
local warnPhase2							= mod:NewPhaseAnnounce(2, 2, nil, nil, nil, nil, nil, 2)
local warnDecayingWound						= mod:NewTargetNoFilterAnnounce(313227, 4, nil, "Tank|Healer")
local warnVoidEruption						= mod:NewCountAnnounce(310003, 2)
local warnChargedBonds						= mod:NewTargetAnnounce(310019, 2)
local warnCorruptedExistence				= mod:NewTargetNoFilterAnnounce(316065, 4)

--Stage 1: Gathering Power
local specWarnCallEssence					= mod:NewSpecialWarningSpell(306091, "-Healer")
local specWarnNullifyingStrike				= mod:NewSpecialWarningStack(306819, nil, 2, nil, nil, 1, 6)
local specWarnNullifyingStrikeTaunt			= mod:NewSpecialWarningStack(306819, nil, nil, nil, 1, 2)
local specWarnExposure						= mod:NewSpecialWarningYou(306279, nil, nil, nil, 1, 2)
local specWarnGTFO							= mod:NewSpecialWarningGTFO(315258, nil, nil, nil, 1, 8)
----Vita
local specWarnUnstableVita					= mod:NewSpecialWarningYou(306257, nil, nil, nil, 3, 2)
local yellUnstableVita						= mod:NewYell(306257)
local yellUnstableVitaFades					= mod:NewShortFadesYell(306257)
local specWarnCallCracklingStalker			= mod:NewSpecialWarningSwitch(306865, "-Healer", nil, nil, 1, 2)
----Void
local specWarnCallVoidHunter				= mod:NewSpecialWarningSwitch(306866, "-Healer", nil, nil, 1, 2)
------Void Hunter
local specWarnVoidCollapse					= mod:NewSpecialWarningYou(306881, nil, nil, nil, 3, 2)
local yellVoidCollapse						= mod:NewYell(306881, nil, nil, nil, "YELL")
local yellVoidCollapseFades					= mod:NewShortFadesYell(306881, nil, nil, nil, "YELL")
----Nightmare
local specWarnUnstableNightmare				= mod:NewSpecialWarningYou(313077, nil, nil, nil, 3, 2)
local yellUnstableNightmare					= mod:NewYell(313077)
local yellUnstableNightmareFades			= mod:NewShortFadesYell(313077)
local specWarnCallNightTerror				= mod:NewSpecialWarningSwitch(314484, "-Healer", nil, nil, 1, 2)
------Night Terror
local specWarnDreadInferno					= mod:NewSpecialWarningYou(315252, nil, nil, nil, 1, 2)
local yellDreadInferno						= mod:NewYell(315252)
--Stage 2: Unleashed Wrath
local specWarnDecayingStrike				= mod:NewSpecialWarningDefensive(313213, nil, nil, nil, 1, 2)
local specWarnChargedBonds					= mod:NewSpecialWarningMoveAwayCount(310019, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.moveaway:format(310019), nil, 3, 2)
local yellChargedBonds						= mod:NewYell(310019)
local specWarnDecayingWoundTaunt			= mod:NewSpecialWarningTaunt(313227, nil, nil, nil, 1, 2)
local specWarnCorruptedExistence			= mod:NewSpecialWarningYou(316065, nil, nil, nil, 3, 2)--Mythic Only
--local yellCorruptedExistence				= mod:NewYell(316065)

--Stage 1: Gathering Power
mod:AddTimerLine(DBM:EJ_GetSectionInfo(20527))
local timerCallEssenceCD					= mod:NewCDCountTimer(44.9, 306091, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON, nil, 1, 5)--44.9-46.3
local timerNullifyingStrikeCD				= mod:NewCDTimer(16.0, 306819, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON, nil, 2, 3)--16-19
----Vita
mod:AddTimerLine(DBM:EJ_GetSectionInfo(20528))
local timerCallCracklingStalkerCD			= mod:NewCDTimer(30.1, 306865, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)
local timerUnstableVita						= mod:NewTargetTimer(5, 306257, nil, nil, nil, 5)
------Vita Add
--mod:AddTimerLine(DBM:EJ_GetSectionInfo(20546))
--local timerChainLightningCD						= mod:NewCDTimer(4.8, 306874, nil, nil, nil, 3)
----Void
mod:AddTimerLine(DBM:EJ_GetSectionInfo(20529))
local timerCallVoidHunterCD					= mod:NewCDTimer(30.1, 306866, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)
local timerUnstableVoidCD					= mod:NewNextCountTimer(5.9, 306634, nil, nil, nil, 5)
------Void Add
mod:AddTimerLine(DBM:EJ_GetSectionInfo(20549))
local timerVoidCollapseCD					= mod:NewCDTimer(10.8, 306881, nil, nil, nil, 3, nil, DBM_CORE_DEADLY_ICON)
----Nightmare
local timerCallNightTerrorCD				= mod:NewAITimer(30.1, 314484, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)
------Night Terror
--mod:AddTimerLine(DBM:EJ_GetSectionInfo(20549))
--local timerDreadInfernoCD					= mod:NewCDTimer(4.8, 315252, nil, nil, nil, 3)
--Stage 2: Unleashed Wrath
mod:AddTimerLine(DBM:EJ_GetSectionInfo(20853))
local timerDecayingStrikeCD					= mod:NewCDTimer(16.9, 313213, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON, nil, 2, 3)--9.6-13.3
local timerVoidEruptionCD					= mod:NewCDTimer(20.6, 310003, nil, nil, nil, 2)--20.6-23
local timerChargedBondsCD					= mod:NewCDTimer(10.8, 310019, nil, nil, nil, 3)--10.8-18.2
local timerGorgeEssenceCD					= mod:NewCDTimer(29.1, 309985, nil, nil, nil, 6)
local timerCorruptedExistenceCD				= mod:NewAITimer(10.8, 317276, nil, nil, nil, 3, nil, DBM_CORE_MYTHIC_ICON..DBM_CORE_DEADLY_ICON)
--local berserkTimer						= mod:NewBerserkTimer(600)

mod:AddRangeFrameOption(6, 306874)
mod:AddInfoFrameOption(306257, true)
mod:AddSetIconOption("SetIconOnUnstableVita", 306257, true, false, {1, 2})
mod:AddSetIconOption("SetIconOnChargedBonds", 310019, true, false, {1, 2})
mod:AddSetIconOption("SetIconOnVoidCollapse", 306881, true, false, {3})
mod:AddSetIconOption("SetIconOnUnstableNightmare", 313077, true, false, {4, 5})
mod:AddSetIconOption("SetIconOnCorruptedExistence", 316065, true, false, {6, 7, 8})
mod:AddNamePlateOption("NPAuraOnDraws", 312750)

mod.vb.callEssenceCount = 0
mod.vb.currentVita = nil
mod.vb.lastHighest = "Unknown"
mod.vb.unstableVoidCount = 0
mod.vb.voidEruptionCount = 0
mod.vb.currentNightmare = nil
mod.vb.lastLowest = "Unknown"
mod.vb.corruptedExistenceIcon = 6
local playerHasVita, playerHasNightmare = false, false
local ExposureTargets = {}
local consumingVoid = DBM:GetSpellInfo(306645)
local ChargedBondsTargets = {}

local furthestPlayerScanner, closestPlayerScanner
do
	--upvalues, this will be called a lot
	local Ambiguate, IsItemInRange, CheckInteractDistance, GetBestMapForUnit = Ambiguate, IsItemInRange, CheckInteractDistance, C_Map.GetBestMapForUnit
	local UnitIsDeadOrGhost, UnitIsConnected, UnitIsUnit = UnitIsDeadOrGhost, UnitIsConnected, UnitIsUnit

	local entireRaidDistancetable = {}
	local function updateRaidDistanceTable(self)
		for uId in DBM:GetGroupMembers() do
			local playerMapId = GetBestMapForUnit("player") or 0
			local mapId = GetBestMapForUnit(uId) or 0
			--Covers all bases, exists, same map, not self, not dead, and not DCed
			if UnitExists(uId) and playerMapId == mapId and not UnitIsUnit(uId, "player") and not UnitIsDeadOrGhost(uId) and UnitIsConnected(uId) then
				if IsItemInRange(90175, uId) then entireRaidDistancetable[uId] = 4
				elseif IsItemInRange(37727, uId) then entireRaidDistancetable[uId] = 6
				elseif IsItemInRange(8149, uId) then entireRaidDistancetable[uId] = 8
				elseif CheckInteractDistance(uId, 3) then entireRaidDistancetable[uId] = 10
				elseif CheckInteractDistance(uId, 2) then entireRaidDistancetable[uId] = 11
				elseif IsItemInRange(32321, uId) then entireRaidDistancetable[uId] = 13
				elseif IsItemInRange(6450, uId) then entireRaidDistancetable[uId] = 18
				elseif IsItemInRange(21519, uId) then entireRaidDistancetable[uId] = 23
				elseif CheckInteractDistance(uId, 1) then entireRaidDistancetable[uId] = 30
				elseif IsItemInRange(1180, uId) then entireRaidDistancetable[uId] = 33
				elseif UnitInRange(uId) then entireRaidDistancetable[uId] = 43
				elseif IsItemInRange(32698, uId)  then entireRaidDistancetable[uId] = 48
				elseif IsItemInRange(116139, uId)  then entireRaidDistancetable[uId] = 53
				elseif IsItemInRange(32825, uId) then entireRaidDistancetable[uId] = 60
				elseif IsItemInRange(35278, uId) then entireRaidDistancetable[uId] = 80
				else entireRaidDistancetable[uId] = 81 end
			end
		end
	end
	furthestPlayerScanner = function(self)
		updateRaidDistanceTable()
		local highestDistance = 0
		--Go through entireRaidDistancetable and establish who is highest distance
		--If multiple are at that distance, only first name is taken. Do to limited distance APIs, this lacks 100% accuracy but should be accurate most of time
		for uId, range in pairs(entireRaidDistancetable) do
			if range > highestDistance then
				highestDistance = range
				self.vb.lastHighest = DBM:GetUnitFullName(uId)
			end
		end
		self:SendSync("VitaUpdate", self.vb.lastHighest)
		if playerHasVita then--As long as debuff present, keep looping
			self:Schedule(0.5, furthestPlayerScanner, self)
		elseif not playerHasNightmare then
			table.wipe(entireRaidDistancetable)
		end
	end
	closestPlayerScanner = function(self)
		updateRaidDistanceTable()
		local lowestDistance = 1000
		--Go through entireRaidDistancetable and establish who is closest distance
		--If multiple are at that distance, only first name is taken. Do to limited distance APIs, this lacks 100% accuracy but should be accurate most of time
		for uId, range in pairs(entireRaidDistancetable) do
			if range < lowestDistance then
				lowestDistance = range
				self.vb.lastLowest = DBM:GetUnitFullName(uId)
			end
		end
		self:SendSync("NightmareUpdate", self.vb.lastLowest)
		if playerHasNightmare then--As long as debuff present, keep looping
			self:Schedule(0.5, closestPlayerScanner, self)
		elseif not playerHasVita then
			table.wipe(entireRaidDistancetable)
		end
	end
	function mod:OnSync(msg, target)
		if msg == "VitaUpdate" and target then
			target = Ambiguate(target, "None")--in cross realm situations, an off realmer would send -realmname on units for units for our realm, we need to correct this
			self.vb.lastHighest = target
			if self.Options.SetIconOnUnstableVita then
				self:SetIcon(self.vb.lastHighest, 2, 5)
			end
		elseif msg == "NightmareUpdate" and target then
			target = Ambiguate(target, "None")--in cross realm situations, an off realmer would send -realmname on units for units for our realm, we need to correct this
			self.vb.lastClosest = target
			if self.Options.SetIconOnUnstableNightmare then
				self:SetIcon(self.vb.lastClosest, 5, 5)
			end
		end
	end
end

local updateInfoFrame
do
	local unstableVita, unstableNightmare, Exposure = DBM:GetSpellInfo(306257), DBM:GetSpellInfo(313077), DBM:GetSpellInfo(306279)
	local floor = math.floor
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
		--Unstable Vita Tracker
		if mod.vb.currentVita then
			addLine(unstableVita, mod.vb.currentVita)
			addLine(L.Furthest, mod.vb.lastHighest)
		end
		--Unstable Nightmare Tracker
		if mod.vb.currentNightmare then
			addLine(unstableNightmare, mod.vb.currentNightmare)
			addLine(L.Closest, mod.vb.lastClosest)
		end
		--Vulnerability
		if #ExposureTargets > 0 then
			addLine("---"..Exposure.."---")
			for i=1, #ExposureTargets do
				local name = ExposureTargets[i]
				local uId = DBM:GetRaidUnitId(name)
				if uId then
					local _, _, _, _, _, ExposureExpireTime = DBM:UnitDebuff(uId, 306279)
					if ExposureExpireTime then
						local vitaRemaining = ExposureExpireTime-GetTime()
						addLine(i.."*"..name, floor(vitaRemaining))
					end
				end
			end
		end
		return lines, sortedLines
	end
end

local function warnChargedBondsTargets()
	warnChargedBonds:Show(table.concat(ChargedBondsTargets, "<, >"))
	table.wipe(ChargedBondsTargets)
end

function mod:CollapseTarget(targetname, uId)
	if not targetname then return end
	if targetname == UnitName("player") then
		specWarnVoidCollapse:Show()
		specWarnVoidCollapse:Play("targetyou")
		yellVoidCollapse:Yell()
		yellVoidCollapseFades:Countdown(3.5)
	else
		warnVoidCollapse:Show(targetname)
	end
	if self.Options.SetIconOnVoidCollapse then
		self:SetIcon(targetname, 3, 3.5)
	end
end

function mod:OnCombatStart(delay)
	self.vb.callEssenceCount = 0
	self.vb.currentVita = nil
	self.vb.lastHighest = "Unknown"
	self.vb.voidEruptionCount = 0
	self.vb.currentNightmare = nil
	self.vb.lastLowest = "Unknown"
	playerHasVita, playerHasNightmare = false, false
	table.wipe(ExposureTargets)
	table.wipe(ChargedBondsTargets)
	timerCallEssenceCD:Start(10-delay)
	timerNullifyingStrikeCD:Start(15.5-delay)
	if self.Options.NPAuraOnDraws then
		DBM:FireEvent("BossMod_EnableHostileNameplates")
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(OVERVIEW)
		DBM.InfoFrame:Show(8, "function", updateInfoFrame, false, false)
	end
	if self:IsMythic() then
		self:RegisterShortTermEvents(
			"SPELL_PERIODIC_DAMAGE 315258",
			"SPELL_PERIODIC_MISSED 315258"
		)
	end
end

function mod:OnCombatEnd()
	self:UnregisterShortTermEvents()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.NPAuraOnDraws then
		DBM.Nameplate:Hide(true, nil, nil, nil, true, true)
	end
end

function mod:OnTimerRecovery()
	if DBM:UnitDebuff("player", 306257) then
		playerHasVita = true
		furthestPlayerScanner(self)
	end
	if DBM:UnitDebuff("player", 313077) then
		playerHasNightmare = true
		closestPlayerScanner(self)
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 306865 then
		specWarnCallCracklingStalker:Show()
		specWarnCallCracklingStalker:Play("bigmob")
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(self:IsMythic() and 8 or 6)
		end
	elseif spellId == 306819 then
		timerNullifyingStrikeCD:Start(16)
	elseif spellId == 306866 then
		specWarnCallVoidHunter:Show()
		specWarnCallVoidHunter:Play("bigmob")
	elseif spellId == 306881 then
		warnVoidCollapse:Show()
	elseif spellId == 313213 then
		if UnitDetailedThreatSituation("player", "boss1") then--We are highest threat target
			specWarnDecayingStrike:Show()
			specWarnDecayingStrike:Play("defensive")
		end
	elseif spellId == 310003 then
		self.vb.voidEruptionCount = self.vb.voidEruptionCount + 1
		warnVoidEruption:Show(self.vb.voidEruptionCount)
		timerVoidEruptionCD:Start()
	elseif spellId == 309985 then
		timerGorgeEssenceCD:Start()
	elseif spellId == 314484 then
		specWarnCallNightTerror:Show()
		specWarnCallNightTerror:Play("bigmob")
	elseif spellId == 317276 then
		self.vb.corruptedExistenceIcon = 6
		timerCorruptedExistenceCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 310019 then
		timerChargedBondsCD:Start()
	elseif spellId == 306603 then
		self.vb.unstableVoidCount = self.vb.unstableVoidCount + 1
		warnUnstableVoid:Show(args.sourceName, self.vb.unstableVoidCount)
		if self.vb.unstableVoidCount < 6 then
			timerUnstableVoidCD:Start(7, self.vb.unstableVoidCount)
		end
	elseif spellId == 313213 then--Because he can stutter cast and restart cast, timer can't be reliable started in SPELL_CAST_START
		timerDecayingStrikeCD:Start(8.1)
	end
end

function mod:SPELL_SUMMON(args)
	local spellId = args.spellId
	if spellId == 306866 then--Call Void Hunter#
		timerVoidCollapseCD:Start(5, args.destGUID)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 312750 or spellId == 306090 or spellId == 306168 then
		if self.Options.NPAuraOnDraws then
			DBM.Nameplate:Show(true, args.destGUID, spellId, nil, 60)
		end
	elseif spellId == 306732 then--Vita Empowered
		warnVitaPhase:Show()
		timerCallCracklingStalkerCD:Start(5.8)--5.8-6.1
	elseif spellId == 306733 then--Void Empowered
		warnVoidPhase:Show()
		self.vb.unstableVoidCount = 0
		--timerUnstableVoidCD:Start(6, 1)--No longer started here, ra-den's cast will trigger first timer
		timerCallVoidHunterCD:Start(6.9)--6.9-7.1
		--timerNullifyingStrikeCD:Start(10.3)
	elseif spellId == 312996 then--Nightmare Empowered
		warnNightmarePhase:Show()
		timerCallNightTerrorCD:Start(1)
	elseif spellId == 306207 or spellId == 306273 then--Unstable Vita (Initial, hop)
		self.vb.currentVita = args.destName
		if args:IsPlayer() then
			playerHasVita = true
			furthestPlayerScanner(self)
			specWarnUnstableVita:Show()
			specWarnUnstableVita:Play("targetyou")
			yellUnstableVita:Yell()
			yellUnstableVitaFades:Countdown(spellId)
		else
			warnUnstableVita:Show(args.destName)
		end
		if self.Options.SetIconOnUnstableVita then
			self:SetIcon(args.destName, 1)
		end
		timerUnstableVita:Start(self:IsMythic() and 6 or 7, args.destName)
	elseif spellId == 313077 then--Unstable Nightmare
		self.vb.currentNightmare = args.destName
		if args:IsPlayer() then
			playerHasNightmare = true
			closestPlayerScanner(self)
			specWarnUnstableNightmare:Show()
			specWarnUnstableNightmare:Play("targetyou")
			yellUnstableNightmare:Yell()
			yellUnstableNightmareFades:Countdown(spellId)
		else
			warnUnstableNightmare:Show(args.destName)
		end
		if self.Options.SetIconOnUnstableNightmare then
			self:SetIcon(args.destName, 4)
		end
	elseif spellId == 306279 then
		if args:IsPlayer() then
			specWarnExposure:Show()
			specWarnExposure:Play("targetyou")
		end
		if not tContains(ExposureTargets, args.destName) then
			table.insert(ExposureTargets, args.destName)
		end
	elseif spellId == 306819 then
		local amount = args.amount or 1
		if amount >= 2 then
			if args:IsPlayer() then
				specWarnNullifyingStrike:Show(amount)
				specWarnNullifyingStrike:Play("stackhigh")
			else
				--Don't show taunt warning if you're 3 tanking and aren't near the boss (this means you are the add tank)
				--Show taunt warning if you ARE near boss, or if number of alive tanks is less than 3
				if (self:CheckNearby(8, args.destName) or self:GetNumAliveTanks() < 3) and not DBM:UnitDebuff("player", spellId) and not UnitIsDeadOrGhost("player") then--Can't taunt less you've dropped yours off, period.
					specWarnNullifyingStrikeTaunt:Show(args.destName)
					specWarnNullifyingStrikeTaunt:Play("tauntboss")
				else
					warnNullifyingStrike:Show(args.destName, amount)
				end
			end
		else
			warnNullifyingStrike:Show(args.destName, amount)
		end
	elseif spellId == 313227 then
		if not args:IsPlayer() and not UnitIsDeadOrGhost("player") then--Can't taunt less you've dropped yours off, period.
			specWarnDecayingWoundTaunt:Show(args.destName)
			specWarnDecayingWoundTaunt:Play("tauntboss")
		else
			warnDecayingWound:Show(args.destName)
		end
	elseif spellId == 309852 then--Ruin
		warnPhase2:Show()
		warnPhase2:Play("ptwo")
		timerCallEssenceCD:Stop()
		timerNullifyingStrikeCD:Stop()
		timerChargedBondsCD:Start(10.6)
		timerVoidEruptionCD:Start(14.5)
		timerDecayingStrikeCD:Start(17)
		--timerGorgeEssenceCD:Start(25.5)--Instantly on ruin now
		if self:IsMythic() then
			timerCorruptedExistenceCD:start(2)
		end
	elseif spellId == 310019 or spellId == 310022 then--310019 heroic confirmed, 310022 unknown, not used on heroic
		ChargedBondsTargets[#ChargedBondsTargets + 1] = args.destName
		self:Unschedule(warnChargedBondsTargets)
		if #ChargedBondsTargets == 2 then
			warnChargedBondsTargets()
			if ChargedBondsTargets[1] == UnitName("player") then
				specWarnChargedBonds:Show(ChargedBondsTargets[2])
				specWarnChargedBonds:Play("linegather")
			elseif ChargedBondsTargets[2] == UnitName("player") then
				specWarnChargedBonds:Show(ChargedBondsTargets[1])
				specWarnChargedBonds:Play("linegather")
			end
		else
			self:Schedule(0.3, warnChargedBondsTargets)
		end
		if self.Options.SetIconOnChargedBonds then
			self:SetIcon(args.destName, #ChargedBondsTargets)
		end
	elseif spellId == 315252 then
		if args:IsPlayer() then
			specWarnDreadInferno:Show()
			specWarnDreadInferno:Play("runout")
			yellDreadInferno:Yell()
		else
			warnDreadInferno:Show(args.destName)
		end
	elseif spellId == 316065 then
		warnCorruptedExistence:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnCorruptedExistence:Show()
			specWarnCorruptedExistence:Play("targetyou")
		end
		if self.Options.SetIconOnCorruptedExistence then
			self:SetIcon(args.destName, self.vb.corruptedExistenceIcon)
		end
		self.vb.corruptedExistenceIcon = self.vb.corruptedExistenceIcon + 1
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 312750 or spellId == 306090 or spellId == 306168 then
		if self.Options.NPAuraOnDraws then
			DBM.Nameplate:Hide(true, args.destGUID, spellId)
		end
	elseif spellId == 306732 then--Vita Empowered
		timerCallCracklingStalkerCD:Stop()
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
	elseif spellId == 306733 then--Void Empowered
		timerCallVoidHunterCD:Stop()
	elseif spellId == 312996 then--Nightmare Empowered

	elseif spellId == 306207 or spellId == 306273 then--Unstable Vita (Initial, hop)
		self.vb.currentVita = nil
		if args:IsPlayer() then
			playerHasVita = false
			self:Unschedule(furthestPlayerScanner)
			yellUnstableVitaFades:Cancel()
		end
		if self.Options.SetIconOnUnstableVita then
			self:SetIcon(args.destName, 0)
		end
		timerUnstableVita:Stop(args.destName)
	elseif spellId == 313077 then--Unstable Nightmare
		self.vb.currentNightmare = nil
		if args:IsPlayer() then
			playerHasNightmare = false
			self:Unschedule(closestPlayerScanner)
			yellUnstableNightmareFades:Cancel()
		end
		if self.Options.SetIconOnUnstableNightmare then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 306279 then
		tDeleteItem(ExposureTargets, args.destName)
	elseif spellId == 316065 then
		if self.Options.SetIconOnCorruptedExistence then
			self:SetIcon(args.destName, 0)
		end
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 315258 and destGUID == UnitGUID("player") and self:AntiSpam(2, 2) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 157366 then--void-hunter
		timerVoidCollapseCD:Stop(args.destGUID)
	elseif cid == 69872 then--crackling-stalker
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
	--elseif cid == 160663 then--essence-of-nightmare

	--elseif cid == 156884 then--essence-of-vita

	--elseif cid == 156980 then--essence-of-void

	end
end

--306881 is in combat log, this is just faster and auto acquirs unit ID
--Absolute fastest auto target scan using UNIT_TARGET events
function mod:UNIT_SPELLCAST_START(uId, _, spellId)
	if spellId == 306881 then--Void Collapse
		self:BossUnitTargetScanner(uId, "CollapseTarget")
		timerVoidCollapseCD:Start(10.9, UnitGUID(uId))
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 306091 then--Materials of Destruction
		self.vb.callEssenceCount = self.vb.callEssenceCount + 1
		specWarnCallEssence:Show(self.vb.callEssenceCount)
		timerCallEssenceCD:Start(self:IsHard() and 45 or 56, self.vb.callEssenceCount+1)
	end
end
