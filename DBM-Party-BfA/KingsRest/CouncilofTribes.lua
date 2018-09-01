local mod	= DBM:NewMod(2170, "DBM-Party-BfA", 3, 1041)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 17732 $"):sub(12, -3))
mod:SetCreatureID(135475, 135470, 135472)
mod:SetEncounterID(2140)
mod:SetZone()
mod:SetUsedIcons(1)
mod:SetBossHPInfoToHighest()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 267256 266231",
	"SPELL_CAST_START 266206 266951 266237 267273 267060",
	"SPELL_CAST_SUCCESS 266231",
--	"UNIT_DIED",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED boss1 boss2 boss3",
	"UNIT_TARGETABLE_CHANGED boss1 boss2 boss3"
)

--TODO, accurate detection of who starts fight, and bosses swapping in and out
--TODO, figure out what to do with Severing Axe
--TODO, fix events, especially barrel Through, with logs
local warnSeveringAxe				= mod:NewTargetNoFilterAnnounce(266231, 3, nil, "Healer")

--Kula the Butcher
local specWarnWhirlingAxes			= mod:NewSpecialWarningDodge(266206, nil, nil, nil, 2, 1)
local specWarnSeveringAxe			= mod:NewSpecialWarningDefensive(266231, nil, nil, nil, 1, 1)
--local specWarnGTFO				= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 2)
--Aka'ali the Conqueror
local specWarnBarrelThrough			= mod:NewSpecialWarningYou(266951, nil, nil, nil, 1, 1)
local yellBarrelThrough				= mod:NewYell(266951)
local yellBarrelThroughFades		= mod:NewShortFadesYell(266951)
local specWarnBarrelThroughSoak		= mod:NewSpecialWarningMoveTo(266951, nil, nil, nil, 1, 1)
local specWarnDebilitatingBackhand	= mod:NewSpecialWarningYou(266237, nil, nil, nil, 1, 1)
--Zanazal the Wise
local specWarnPoisonNova			= mod:NewSpecialWarningInterrupt(267273, "HasInterrupt", nil, nil, 1, 2)
local specWarnTotems				= mod:NewSpecialWarningSwitch(267060, nil, nil, nil, 1, 2)
local specWarnEarthwall				= mod:NewSpecialWarningDispel(267256, "MagicDispeller", nil, nil, 1, 2)

--Kula the Butcher
local timerWhirlingAxesCD			= mod:NewCDTimer(10.8, 266206, nil, nil, nil, 3)
local timerSeveringAxeCD			= mod:NewCDTimer(13, 266231, nil, nil, nil, 3)--Actual timer needs doing
--Aka'ali the Conqueror
local timerBarrelThroughCD			= mod:NewCDTimer(23.1, 266951, nil, nil, nil, 3)
local timerDebilitatingBackhandCD	= mod:NewCDTimer(24.3, 266237, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON..DBM_CORE_DEADLY_ICON)
--Zanazal the Wise
local timerPoisonNovaCD				= mod:NewCDTimer(13, 267273, nil, nil, nil, 4, nil, DBM_CORE_INTERRUPT_ICON)--Actual timer needs doing
local timerTotemsCD					= mod:NewCDTimer(13, 267060, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)--Actual timer needs doing

--mod:AddRangeFrameOption(5, 194966)
mod:AddSetIconOption("SetIconOnBarrel", 266951, true)

mod.vb.phase = 1
mod.vb.bossOne = 0
mod.vb.bossTwo = 0

--Engage Timers
local function whoDat(self, delay)
	for i = 1, 3 do--Might actually only need to check boss 1
		local bossUID = "boss"..i
		if UnitCanAttack(bossUID) then
			local cid = self:GetUnitCreatureId(bossUID)
			if cid == 135475 then -- Kula the Butcher
				timerWhirlingAxesCD:Start(6-delay)
				timerSeveringAxeCD:Start(22.2-delay)--SUCCESS
			elseif cid == 135470 then -- Aka'ali the Conqueror
				--timerBarrelThroughCD:Start(1-delay)
				--timerDebilitatingBackhandCD:Start(1-delay)
			elseif cid == 135472 then -- Zanazal the Wise
				--timerPoisonNovaCD:Start(1-delay)
				--timerTotemsCD:Start(1-delay)
			end
		end
	end
end

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	self.vb.bossOne = 0
	self.vb.bossTwo = 0
	self:Schedule(2, whoDat, self, delay)
end

function mod:OnCombatEnd()
--	if self.Options.RangeFrame then
--		DBM.RangeCheck:Hide()
--	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 267256 then
		specWarnEarthwall:Show(args.destName)
		specWarnEarthwall:Play("dispelboss")
	elseif spellId == specWarnSeveringAxe then
		if args:IsPlayer() then
			specWarnSeveringAxe:Show()
			specWarnSeveringAxe:Play("defensive")
		else
			warnSeveringAxe:Show(args.destName)
		end
	end
end
--mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 266206 then
		specWarnWhirlingAxes:Show()
		specWarnWhirlingAxes:Play("watchstep")
		timerWhirlingAxesCD:Start()
	elseif spellId == 266951 then
		timerBarrelThroughCD:Start()
	elseif spellId == 266237 then
		if self:IsTanking("player", "boss1", nil, true) then
			specWarnDebilitatingBackhand:Show()
			specWarnDebilitatingBackhand:Play("carefly")
			specWarnDebilitatingBackhand:ScheduleVoice(3.5, "justrun")
		end
		timerDebilitatingBackhandCD:Start()
	elseif spellId == 267273 then
		--timerPoisonNovaCD:Start()--Not enough data
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnPoisonNova:Show(args.sourceName)
			specWarnPoisonNova:Play("kickcast")
		end
	elseif spellId == 267060 then
		specWarnTotems:Show()
		specWarnTotems:Play("changetarget")
		--timerTotemsCD:Start()--Not enough data
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 266231 then
		--timerSeveringAxeCD:Start()--Not enough data
	end
end

--[[
function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 135475 then -- Kula the Butcher
		timerWhirlingAxesCD:Stop()
	elseif cid == 135470 then -- Aka'ali the Conqueror
		timerBarrelThroughCD:Stop()
		timerDebilitatingBackhandCD:Stop()
	elseif cid == 135472 then -- Zanazal the Wise
		timerPoisonNovaCD:Stop()
		timerTotemsCD:Stop()
	end
end
--]]

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, npc, _, _, target)
	if msg:find("spell:266951") then
		local targetname = DBM:GetUnitFullName(target)
		if targetname then
			if targetname == UnitName("player") then
				specWarnBarrelThrough:Show()
				specWarnBarrelThrough:Play("targetyou")
				yellBarrelThrough:Yell()
				yellBarrelThroughFades:Countdown(8)
			else
				specWarnBarrelThroughSoak:Show(targetname)
				specWarnBarrelThroughSoak:Play("gathershare")
			end
			if self.Options.SetIconOnBarrel then
				self:SetIcon(targetname, 1, 8)
			end
		end
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
--]]

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 34098 then--ClearAllDebuffs
		timerWhirlingAxesCD:Stop()
		timerBarrelThroughCD:Stop()
		timerDebilitatingBackhandCD:Stop()
		timerPoisonNovaCD:Stop()
		timerTotemsCD:Stop()
		self.vb.phase = self.vb.phase + 1
		local cid = self:GetUnitCreatureId(uId)
		if self.vb.phase == 2 then
			self.vb.bossOne = cid
			--Start Boss 1 Timer (17sec)
			if cid == 135475 then -- Kula the Butcher
				timerWhirlingAxesCD:Start(17)
			elseif cid == 135470 then -- Aka'ali the Conqueror
				timerBarrelThroughCD:Start(17)
			elseif cid == 135472 then -- Zanazal the Wise
				timerPoisonNovaCD:Start(17)
			end
		else
			self.vb.bossTwo = cid
			--Start Boss 1 Timer (25.5sec)
			if self.vb.bossOne == 135475 then -- Kula the Butcher
				timerWhirlingAxesCD:Start(25.5)
			elseif self.vb.bossOne == 135470 then -- Aka'ali the Conqueror
				timerBarrelThroughCD:Start(25.5)
			elseif self.vb.bossOne == 135472 then -- Zanazal the Wise
				timerPoisonNovaCD:Start(25.5)
			end
			--Start Boss 2 Timer
			if cid == 135475 then -- Kula the Butcher
				--timerWhirlingAxesCD:Start(25.5)
			elseif cid == 135470 then -- Aka'ali the Conqueror
				--timerBarrelThroughCD:Start(25.5)
			elseif cid == 135472 then -- Zanazal the Wise
				--timerPoisonNovaCD:Start(25.5)
			end
		end
	--[[elseif spellID == 267422 then--Boss 1 Assist
		if self.vb.bossOne == 135475 then -- Kula the Butcher

		elseif self.vb.bossOne == 135470 then -- Aka'ali the Conqueror

		elseif self.vb.bossOne == 135472 then -- Zanazal the Wise

		end
	elseif spellId == 267437 then--Boss 2 Assist
		if cid == 135475 then -- Kula the Butcher

		elseif cid == 135470 then -- Aka'ali the Conqueror

		elseif cid == 135472 then -- Zanazal the Wise

		end--]]
	end
end

--2nd and 3rd Boss timers
function mod:UNIT_TARGETABLE_CHANGED(uId)
	if UnitCanAttack(uId) then
		local cid = self:GetUnitCreatureId(uId)
		if cid == 135475 then -- Kula the Butcher (only seen on engage, need a pull boss isn't first to verify)
			timerWhirlingAxesCD:Start(8)
			timerSeveringAxeCD:Start(24.2)
		elseif cid == 135470 then -- Aka'ali the Conqueror
			timerBarrelThroughCD:Start(6)
			timerDebilitatingBackhandCD:Start(15.7)
		elseif cid == 135472 then -- Zanazal the Wise
			timerPoisonNovaCD:Start(18.1)
			timerTotemsCD:Start(19.2)
		end
	end
end	
