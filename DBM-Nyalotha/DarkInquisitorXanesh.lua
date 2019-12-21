local mod	= DBM:NewMod(2377, "DBM-Nyalotha", nil, 1180)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20191215174316")
mod:SetCreatureID(160229)
mod:SetEncounterID(2328)
mod:SetZone()
mod:SetUsedIcons(1, 2, 3)
--mod:SetHotfixNoticeRev(20190716000000)--2019, 7, 16
--mod:SetMinSyncRevision(20190716000000)
--mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 312336 316211",
	"SPELL_CAST_SUCCESS 311551 306319 306208",
	"SPELL_AURA_APPLIED 312406 314179 306311 311551",
	"SPELL_AURA_APPLIED_DOSE 311551",
	"SPELL_AURA_REMOVED 312406",
	"SPELL_PERIODIC_DAMAGE 305575",
	"SPELL_PERIODIC_MISSED 305575",
	"CHAT_MSG_MONSTER_YELL",
	"UNIT_DIED"
--	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, see if heroic timers still faster. Considering mythic timers were same as normal, it may just be that timers same in all now. OR, mythic was bugged
--TODO, add https://ptr.wowhead.com/spell=313198/void-touched when it's put in combat log
--[[
(ability.id = 312336 or ability.id = 316211) and type = "begincast"
 or (ability.id = 311551 or ability.id = 306319 or ability.id = 306208) and type = "cast"
--]]
local warnAbyssalStrike						= mod:NewStackAnnounce(311551, 2, nil, "Tank")
local warnVoidRitual						= mod:NewCountAnnounce(312336, 2)--Fallback if specwarn is disabled
local warnFanaticism						= mod:NewTargetNoFilterAnnounce(314179, 3, nil, "Tank|Healer")
local warnSummonRitualObelisk				= mod:NewCountAnnounce(306495, 2)
local warnSoulFlay							= mod:NewTargetAnnounce(306311, 2)

local specWarnVoidRitual					= mod:NewSpecialWarningCount(312336, false, nil, nil, 1, 2)--Option in, since only certain players may be assigned
local specWarnAbyssalStrike					= mod:NewSpecialWarningStack(311551, nil, 1, nil, nil, 1, 6)
local specWarnAbyssalStrikeTaunt			= mod:NewSpecialWarningTaunt(311551, nil, nil, nil, 1, 2)
local specWarnSoulFlay						= mod:NewSpecialWarningRun(306311, nil, nil, nil, 4, 2)
local specWarnTorment						= mod:NewSpecialWarningDodgeCount(306208, nil, nil, nil, 2, 2)
local specWarnTerrorWave					= mod:NewSpecialWarningInterruptCount(316211, "HasInterrupt", nil, nil, 1, 2)
local specWarnGTFO							= mod:NewSpecialWarningGTFO(270290, nil, nil, nil, 1, 8)

local timerAbyssalStrikeCD					= mod:NewCDTimer(42.6, 311551, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON, nil, 2, 4)--42.9-47
local timerVoidRitualCD						= mod:NewNextCountTimer(79.7, 312336, nil, nil, nil, 5, nil, nil, nil, 1, 4)
local timerSummonRitualObeliskCD			= mod:NewNextCountTimer(79.7, 306495, nil, nil, nil, 3, nil, DBM_CORE_HEROIC_ICON)
local timerSoulFlayCD						= mod:NewCDTimer(46.7, 306319, nil, nil, nil, 3)
local timerTormentCD						= mod:NewNextCountTimer(46.7, 306208, nil, nil, nil, 3, nil, nil, nil, 3, 4)

--local berserkTimer						= mod:NewBerserkTimer(600)

--mod:AddRangeFrameOption(6, 264382)
mod:AddInfoFrameOption(312406, true)
mod:AddSetIconOption("SetIconOnVoidWoken", 312406, true, false, {1, 2, 3})

mod.vb.ritualCount = 0
mod.vb.obeliskCount = 0
mod.vb.tormentCount = 0
local voidWokenTargets = {}
local heroicTormentTimers = {20.5, 50.6, 29, 49.6, 30.2, 49.6, 31.1, 48.7}--Heroic
local normalTormentTimers = {20.5, 71.8, 30.4, 65.7, 30.6, 65.6, 30.5}--Normal and mythic
local castsPerGUID = {}

local updateInfoFrame
do
	local voidWoken = DBM:GetSpellInfo(312406)
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
		--Void Woken Targets
		if #voidWokenTargets > 0 then
			addLine("---"..voidWoken.."---")
			for i=1, #voidWokenTargets do
				local name = voidWokenTargets[i]
				local uId = DBM:GetRaidUnitId(name)
				if uId then
					local _, _, _, _, _, voidExpireTime = DBM:UnitDebuff(uId, 312406)
					if voidExpireTime then
						local voidRemaining = voidExpireTime-GetTime()
						local _, _, doomCount, _, _, doomExpireTime = DBM:UnitDebuff(uId, 314298)
						if doomCount and doomExpireTime then--Has Imminent Doom count, show count and doom remaining
							local doomRemaining = doomExpireTime-GetTime()
							addLine(i.."*"..name, doomCount.."("..floor(doomRemaining)..")-"..floor(voidRemaining))
						else--no Doom, just show void stuff
							addLine(i.."*"..name, floor(voidRemaining))
						end
					end
				end
			end
		end
		return lines, sortedLines
	end
end

function mod:OnCombatStart(delay)
	self.vb.ritualCount = 0
	self.vb.obeliskCount = 0
	self.vb.tormentCount = 0
	table.wipe(voidWokenTargets)
	table.wipe(castsPerGUID)
	if self:IsHard() then
		timerSummonRitualObeliskCD:Start(12-delay, 1)
	end
	timerAbyssalStrikeCD:Start(32.9-delay)--SUCCESS
	if self:IsHeroic() then
		timerSoulFlayCD:Start(14-delay)--SUCCESS
		timerVoidRitualCD:Start(52.9-delay, 1)
	else
		timerSoulFlayCD:Start(18.5-delay)--SUCCESS
		timerVoidRitualCD:Start(62-delay, 1)
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(OVERVIEW)
		DBM.InfoFrame:Show(8, "function", updateInfoFrame, false, false)
	end
	if self.Options.NPAuraOnTerrorWave then
		DBM:FireEvent("BossMod_EnableHostileNameplates")
	end
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
--	if self.Options.RangeFrame then
--		DBM.RangeCheck:Hide()
--	end
	if self.Options.NPAuraOnTerrorWave then
		DBM.Nameplate:Hide(true, nil, nil, nil, true, true)
	end
end

--function mod:OnTimerRecovery()

--end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 312336 then
		self.vb.ritualCount = self.vb.ritualCount + 1
		if self.Options.SpecWarn312336count then
			specWarnVoidRitual:Show(self.vb.ritualCount)
			specWarnVoidRitual:Play("specialsoon")
		else
			warnVoidRitual:Show(self.vb.ritualCount)
		end
		timerVoidRitualCD:Start(self:IsHeroic() and 79.7 or 95.2, self.vb.ritualCount+1)
	elseif spellId == 316211 then
		if not castsPerGUID[args.sourceGUID] then
			castsPerGUID[args.sourceGUID] = 0
		end
		castsPerGUID[args.sourceGUID] = castsPerGUID[args.sourceGUID] + 1
		local count = castsPerGUID[args.sourceGUID]
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnTerrorWave:Show(args.sourceName, count)
			if count == 1 then
				specWarnTerrorWave:Play("kick1r")
			elseif count == 2 then
				specWarnTerrorWave:Play("kick2r")
			elseif count == 3 then
				specWarnTerrorWave:Play("kick3r")
			elseif count == 4 then
				specWarnTerrorWave:Play("kick4r")
			elseif count == 5 then
				specWarnTerrorWave:Play("kick5r")
			else--Shouldn't happen, but fallback rules never hurt
				specWarnTerrorWave:Play("kickcast")
			end
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 311551 then
		timerAbyssalStrikeCD:Start()
	elseif spellId == 306319 then
		timerSoulFlayCD:Start(self:IsHeroic() and 46.7 or 57.2)
	elseif spellId == 306208 then
		self.vb.tormentCount = self.vb.tormentCount + 1
		specWarnTorment:Show(self.vb.tormentCount)
		specWarnTorment:Play("watchstep")
		local timer = self:IsHeroic() and heroicTormentTimers[self.vb.tormentCount+1] or normalTormentTimers[self.vb.tormentCount+1]
		if timer then
			timerTormentCD:Start(timer, self.vb.tormentCount+1)
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 312406 then
		if not tContains(voidWokenTargets, args.destName) then
			table.insert(voidWokenTargets, args.destName)
		end
		if self.Options.SetIconOnVoidWoken then
			self:SetIcon(args.destName, #voidWokenTargets)
		end
	elseif spellId == 314179 then
		warnFanaticism:Show(args.destName)
	elseif spellId == 311551 then
		local amount = args.amount or 1
		if args:IsPlayer() then
			specWarnAbyssalStrike:Show(amount)
			specWarnAbyssalStrike:Play("stackhigh")
		else
			if not UnitIsDeadOrGhost("player") then
				specWarnAbyssalStrikeTaunt:Show(args.destName)
				specWarnAbyssalStrikeTaunt:Play("tauntboss")
			else
				warnAbyssalStrike:Show(args.destName, amount)
			end
		end
	elseif spellId == 306311 then
		warnSoulFlay:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnSoulFlay:Show()
			specWarnSoulFlay:Play("justrun")
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 312406 then
		tDeleteItem(voidWokenTargets, args.destName)
		if self.Options.SetIconOnVoidWoken then
			self:SetIcon(args.destName, 0)
		end
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 305575 and destGUID == UnitGUID("player") and self:AntiSpam(2, 2) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

do
	--"<185.26 22:54:22> [CHAT_MSG_MONSTER_YELL] Obelisks of shadow, rise!#Dark Inquisitor Xanesh###Dark Inquisitor Xanesh##0#0##0#920#nil#0#false#false#false#false", -- [1338]
	local bossName = DBM:EJ_GetSectionInfo(20786)
	function mod:CHAT_MSG_MONSTER_YELL(msg, _, _, _, target)
		if not self:IsInCombat() then return end
		--Boss only targets himself during a yell for Obelisk spawns, any other yells he targets a playername, azshara, or nobody
		if msg == L.ObeliskSpawn then--Localized backup only if simply scanning auto translated target doesn't work forever or in all locals
			self.vb.obeliskCount = self.vb.obeliskCount + 1
			warnSummonRitualObelisk:Show(self.vb.obeliskCount)
			timerSummonRitualObeliskCD:Start(80, self.vb.obeliskCount+1)
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 160937 then--TODO, FIXME
		castsPerGUID[args.destGUID] = nil
	end
end

--[[
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 298689 then--Absorb Fluids

	end
end
--]]
