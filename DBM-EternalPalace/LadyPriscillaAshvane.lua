local mod	= DBM:NewMod(2354, "DBM-EternalPalace", nil, 1179)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("2019051215229")
mod:SetCreatureID(152236)
mod:SetEncounterID(2304)
mod:SetZone()
--mod:SetHotfixNoticeRev(16950)
--mod:SetMinSyncRevision(16950)
--mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
--	"SPELL_CAST_START 297402 297398 297324",
	"SPELL_CAST_SUCCESS 296569 296662",
	"SPELL_AURA_APPLIED 296650 296725 296943 296940 296942 296939 296941 296938",
	"SPELL_AURA_REMOVED 296650 296943 296940 296942 296939 296941 296938",
	"SPELL_PERIODIC_DAMAGE 296752",
	"SPELL_PERIODIC_MISSED 296752",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--[[
(ability.id = 297402 or ability.id = 297398 or ability.id = 297324) and type = "begincast"
 or (ability.id = 296569 or ability.id = 296944 or ability.id = 296725 or ability.id = 296662) and type = "cast"
 or ability.id = 296650 and (type = "applybuff" or type = "removebuff")
 or ability.id = 296943 or ability.id = 296940 or ability.id = 296942 or ability.id = 296939 or ability.id = 296941 or ability.id = 296938
Orange: Circle and X
Purple: Diamond and moon
Green: Triangle and Square

Orange: Circle and star
Purple: Diamond and X
Green: Triangle and Square
--]]
local warnShield						= mod:NewTargetNoFilterAnnounce(296650, 2, nil, nil, nil, nil, nil, 2)
local warnShieldOver					= mod:NewEndAnnounce(296650, 2, nil, nil, nil, nil, nil, 2)
local warnCoral							= mod:NewCountAnnounce(296555, 2)
local warnCrushingDepths				= mod:NewTargetNoFilterAnnounce(297324, 4)
local warnUpsurge						= mod:NewSpellAnnounce(298055, 3)

local specWarnRipplingWave				= mod:NewSpecialWarningCount(296688, nil, nil, nil, 2, 2)
local specWarnCrushingDepths			= mod:NewSpecialWarningMoveAway(297324, nil, nil, nil, 1, 2)
local yellCrushingDepths				= mod:NewYell(297324)
local specWarnCrushingNear				= mod:NewSpecialWarningClose(297324, nil, nil, nil, 1, 2)
local specWarnBarnacleBash				= mod:NewSpecialWarningTaunt(296725, nil, nil, nil, 1, 2)
local specWarnArcingAzerite				= mod:NewSpecialWarningMoveTo(296944, nil, nil, nil, 3, 6)
local yellArcingAzerite					= mod:NewPosYell(296944, DBM_CORE_AUTO_YELL_CUSTOM_POSITION)
local yellArcingAzeriteFades			= mod:NewIconFadesYell(296944)
local specWarnGTFO						= mod:NewSpecialWarningGTFO(296752, nil, nil, nil, 1, 8)

--mod:AddTimerLine(BOSS)
local timerCoralGrowthCD				= mod:NewCDCountTimer(30, 296555, nil, nil, nil, 3)
local timerRipplingwaveCD				= mod:NewCDCountTimer(32.2, 296688, nil, nil, nil, 3)
local timerCrushingDepthsCD				= mod:NewCDCountTimer(15.9, 297324, nil, nil, nil, 3, nil, DBM_CORE_TANK_ICON..DBM_CORE_DAMAGE_ICON)
local timerUpsurgeCD					= mod:NewCDTimer(15.3, 298055, nil, nil, nil, 3)
local timerBarnacleBashCD				= mod:NewCDCountTimer(15.9, 296725, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON)
--Stage 2
local timerArcingAzeriteCD				= mod:NewCDCountTimer(39, 296944, nil, nil, nil, 3)
local timerShieldCD						= mod:NewCDTimer(66.1, 296650, nil, nil, nil, 6)

--local berserkTimer					= mod:NewBerserkTimer(600)

local countdownCoralGrowth				= mod:NewCountdown(58, 296555)
local countdownRipplingWave				= mod:NewCountdown("AltTwo16", 296688)
local countdownSpellPicker				= mod:NewCountdown("Alt16", 296725)
local countdownArcingAzerite			= mod:NewCountdown("AltTwo16", 296944)
local countdownShield					= mod:NewCountdown(58, 296650)

mod:AddRangeFrameOption("4/12")
mod:AddInfoFrameOption(296650, true)
--mod:AddSetIconOption("SetIconOnArcingAzerite", 296944, true)

mod.vb.coralGrowth = 0
mod.vb.ripplingWave = 0
mod.vb.spellPicker = 0
mod.vb.arcingCast = 0
mod.vb.purpleone, mod.vb.purpletwo = nil, nil
mod.vb.orangeone, mod.vb.orangetwo = nil, nil
mod.vb.greenone, mod.vb.greentwo = nil, nil

local updateInfoFrame
do
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
		if mod.vb.purpleone and mod.vb.purpletwo then--Purple K (NE)
			addLine("|TInterface\\Icons\\Boss_OdunRunes_Purple.blp:12:12|tNE|TInterface\\Icons\\Boss_OdunRunes_Purple.blp:12:12|t--"..mod.vb.purpleone, mod.vb.purpletwo)
		end
		if mod.vb.orangeone and mod.vb.orangetwo then--Orange N (SE)
			addLine("|TInterface\\Icons\\Boss_OdunRunes_Orange.blp:12:12|tSE|TInterface\\Icons\\Boss_OdunRunes_Orange.blp:12:12|t--"..mod.vb.orangeone, mod.vb.orangetwo)
		end
		if mod.vb.greenone and mod.vb.greentwo then--Green box (N)
			addLine("|TInterface\\Icons\\Boss_OdunRunes_Green.blp:12:12|tN|TInterface\\Icons\\Boss_OdunRunes_Green.blp:12:12|t--"..mod.vb.greenone, mod.vb.greentwo)
		end
		return lines, sortedLines
	end
end

function mod:OnCombatStart(delay)
	self.vb.coralGrowth = 0
	self.vb.ripplingWave = 0
	self.vb.spellPicker = 0
	self.vb.arcingCast = 0
	self.vb.purpleone, self.vb.purpletwo = nil, nil
	self.vb.orangeone, self.vb.orangetwo = nil, nil
	self.vb.greenone, self.vb.greentwo = nil, nil
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

--[[
function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 297402 or spellId == 297398 or spellId == 297324 then--297398 verified, other two unknown
		--timerCrushingDepthsCD:Start()
	end
end
--]]

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 296569 then
		self.vb.coralGrowth = self.vb.coralGrowth + 1
		warnCoral:Show(self.vb.coralGrowth)
		timerCoralGrowthCD:Start(30, self.vb.coralGrowth+1)
		countdownCoralGrowth:Start(30)
	--elseif spellId == 296944 then
	--	timerArcingAzeriteCD:Start()
	--elseif spellId == 296725 then
	--	timerBarnacleBashCD:Start()
	elseif spellId == 296662 then
		self.vb.ripplingWave = self.vb.ripplingWave + 1
		specWarnRipplingWave:Show(self.vb.ripplingWave)
		specWarnRipplingWave:Play("watchwave")
		timerRipplingwaveCD:Start(32.2, self.vb.ripplingWave+1)
		countdownRipplingWave:Start(32.2)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 296650 then
		warnShield:Show(args.destName)
		warnShield:Play("phasechange")
		self.vb.coralGrowth = 0
		self.vb.ripplingWave = 0
		self.vb.spellPicker = 0
		timerUpsurgeCD:Stop()
		timerBarnacleBashCD:Stop()
		countdownSpellPicker:Cancel()
		timerCrushingDepthsCD:Stop()
		timerArcingAzeriteCD:Stop()
		countdownArcingAzerite:Cancel()
		timerShieldCD:Stop()
		countdownShield:Cancel()
		timerUpsurgeCD:Start(3.1)
		timerBarnacleBashCD:Start(7.3, 1)
		if self:IsTank() then
			countdownSpellPicker:Start(7.3)
		end
		timerRipplingwaveCD:Start(13.5, 1)
		countdownRipplingWave:Start(13.5)
		timerCoralGrowthCD:Start(30.5, 1)
		countdownCoralGrowth:Start(30.5)
		--timerCrushingDepthsCD:Start(45.2)--Not started here
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(args.spellName)
			DBM.InfoFrame:Show(2, "enemyabsorb", nil, UnitGetTotalAbsorbs("boss1"))
		end
		if self.Options.RangeFrame then
			if self:IsRanged() then
				DBM.RangeCheck:Show(12)
			else
				DBM.RangeCheck:Show(4)
			end
		end
	elseif spellId == 296725 then
		if not args:IsPlayer() then
			specWarnBarnacleBash:Show(args.destName)
			specWarnBarnacleBash:Play("tauntboss")
		end
	elseif spellId == 296943 or spellId == 296940 or spellId == 296942 or spellId == 296939 or spellId == 296941 or spellId == 296938 then--Arcing Azerite
		--Not in combat log, blizzard hates combat log
		if self:AntiSpam(5, 1) then
			self.vb.arcingCast = self.vb.arcingCast + 1
			if self.vb.arcingCast == 1 then
				timerArcingAzeriteCD:Start(39, 2)
				countdownArcingAzerite:Start(39)
			end
		end
		if (spellId == 296943 or spellId == 296940) then--Purple K
			if args:IsPlayer() then
				specWarnArcingAzerite:Show("|TInterface\\Icons\\Boss_OdunRunes_Purple.blp:12:12|tPurple|TInterface\\Icons\\Boss_OdunRunes_Purple.blp:12:12|t")
				specWarnArcingAzerite:Play("mm3")
				yellArcingAzerite:Yell(3, "", 3)
				yellArcingAzeriteFades:Countdown(8, nil, 3)
			end
			if spellId == 296943 then
				self.vb.purpleone = args.destName
			else
				self.vb.purpletwo = args.destName
			end
		elseif (spellId == 296942 or spellId == 296939) then--Orange N
			if args:IsPlayer() then
				specWarnArcingAzerite:Show("|TInterface\\Icons\\Boss_OdunRunes_Orange.blp:12:12|tOrange|TInterface\\Icons\\Boss_OdunRunes_Orange.blp:12:12|t")
				specWarnArcingAzerite:Play("mm2")
				yellArcingAzerite:Yell(2, "", 2)
				yellArcingAzeriteFades:Countdown(8, nil, 2)
			end
			if spellId == 296942 then
				self.vb.orangeone = args.destName
			else
				self.vb.orangetwo = args.destName
			end
		elseif (spellId == 296941 or spellId == 296938) then--Green box
			if args:IsPlayer() then
				specWarnArcingAzerite:Show("|TInterface\\Icons\\Boss_OdunRunes_Green.blp:12:12|tGreen|TInterface\\Icons\\Boss_OdunRunes_Green.blp:12:12|t")
				specWarnArcingAzerite:Play("mm4")
				yellArcingAzerite:Yell(4, "", 4)
				yellArcingAzeriteFades:Countdown(8, nil, 4)
			end
			if spellId == 296941 then
				self.vb.greenone = args.destName
			else
				self.vb.greentwo = args.destName
			end
		end
		if self.Options.InfoFrame then
			if not DBM.InfoFrame:IsShown() then
				DBM.InfoFrame:SetHeader(args.spellName)
				DBM.InfoFrame:Show(6, "function", updateInfoFrame, false, false, true)
			else
				DBM.InfoFrame:Update()
			end
		end
	elseif spellId == 297397 then
		if args:IsPlayer() then
			specWarnCrushingDepths:Show()
			specWarnCrushingDepths:Play("runout")
			yellCrushingDepths:Yell()
		elseif self:CheckNearby(12, args.destname) then
			specWarnCrushingNear:Show(args.destname)
			specWarnCrushingNear:Play("runaway")
		else
			warnCrushingDepths:Show(args.destname)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 296650 then
		self.vb.spellPicker = 0
		warnShieldOver:Show()
		warnShieldOver:Play("phasechange")
		timerCoralGrowthCD:Stop()
		countdownCoralGrowth:Cancel()
		timerRipplingwaveCD:Stop()
		countdownRipplingWave:Cancel()
		timerCrushingDepthsCD:Stop()
		timerUpsurgeCD:Stop()
		timerBarnacleBashCD:Stop()
		countdownSpellPicker:Cancel()
		--timerCrushingDepthsCD:Start(2)--Not started here
		timerBarnacleBashCD:Start(8.6, 1)
		if self:IsTank() then
			countdownSpellPicker:Start(8.6)
		end
		timerArcingAzeriteCD:Start(16.6, 1)
		countdownArcingAzerite:Start(16.6)
		timerUpsurgeCD:Start(32.6)--Upsurge is cast in this phase, but only event for it is spell_damage. timer is estimation
		timerShieldCD:Start(66.1)
		countdownShield:Start(66.1)
		if self.Options.InfoFrame then
			DBM.InfoFrame:Hide()
		end
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(4)
		end
	elseif spellId == 296943 or spellId == 296940 or spellId == 296942 or spellId == 296939 or spellId == 296941 or spellId == 296938 then--Arcing Azerite
		if args:IsPlayer() then
			yellArcingAzeriteFades:Cancel()
		end
		if (spellId == 296943 or spellId == 296940) then--Purple K
			if spellId == 296943 then
				self.vb.purpleone = nil
			else
				self.vb.purpletwo = nil
			end
		elseif (spellId == 296942 or spellId == 296939) then--Orange N
			if spellId == 296942 then
				self.vb.orangeone = nil
			else
				self.vb.orangetwo = nil
			end
		elseif (spellId == 296941 or spellId == 296938) then--Green box
			if spellId == 296941 then
				self.vb.greenone = nil
			else
				self.vb.greentwo = nil
			end
		end
		if self.Options.InfoFrame then
			DBM.InfoFrame:Update()
		end
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 296752 and destGUID == UnitGUID("player") and self:AntiSpam(2, 2) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 298056 then--Upsurge
		warnUpsurge:Show()
		timerUpsurgeCD:Start()
	elseif spellId == 297437 then--Lady Ashvane Spell Picker
		self.vb.spellPicker = self.vb.spellPicker + 1
		if self.vb.spellPicker == 3 then
			self.vb.spellPicker = 0
			timerBarnacleBashCD:Start(15.9, self.vb.spellPicker+1)
			if self:IsTank() then
				countdownSpellPicker:Start(15.9)
			end
		elseif self.vb.spellPicker == 2 then--Two bash been cast, crushing is next
			timerCrushingDepthsCD:Start(15.9, self.vb.spellPicker+1)
			countdownSpellPicker:Start(15.9)
		end
	end
end
