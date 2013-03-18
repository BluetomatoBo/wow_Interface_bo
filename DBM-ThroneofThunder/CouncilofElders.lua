﻿local mod	= DBM:NewMod(816, "DBM-ThroneofThunder", nil, 362)
local L		= mod:GetLocalizedStrings()
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)
local sndSpirit	= mod:NewSound(nil, "Soundspirit", true)
local sndLS		= mod:NewSound(nil, "SoundLs", false)
local sndHS		= mod:NewSound(nil, "SoundHs", false)

mod:SetRevision(("$Revision: 8924 $"):sub(12, -3))
mod:SetCreatureID(69078, 69132, 69134, 69131)--69078 Sul the Sandcrawler, 69132 High Prestess Mar'li, 69131 Frost King Malakk, 69134 Kazra'jin --Adds: 69548 Shadowed Loa Spirit,
mod:SetModelID(47229)--Kazra'jin, 47505 Sul the Sandcrawler, 47506 Frost King Malakk, 47730 High Priestes Mar'li

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"UNIT_DIED",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local Sul = EJ_GetSectionInfo(7049)
local Malakk = EJ_GetSectionInfo(7047)
local Marli = EJ_GetSectionInfo(7050)
local Kazrajin = EJ_GetSectionInfo(7048)

mod:SetBossHealthInfo(
	69078, Sul,
	69131, Malakk,
	69132, Marli,
	69134, Kazrajin
)

--All
local warnPossessed					= mod:NewStackAnnounce(136442, 2, nil, nil, "warnPossessed")
--local warnSoulFragment				= mod:NewTargetAnnounce(137359, 3)--Could find no spellid in either wowhead or wowdb, so i'll need logs

--Sul the Sandcrawler
local warnSandBolt					= mod:NewStackAnnounce(136189, 3, nil, false, "warnSandBolt")--Spammy but important for heroic (and even normal if very melee heavy)
local warnQuicksand					= mod:NewSpellAnnounce(136521, 2)
local warnSandstorm					= mod:NewSpellAnnounce(136894, 3)
--High Prestess Mar'li
local warnBlessedLoaSpirit			= mod:NewSpellAnnounce(137203, 4)
local warnShadowedLoaSpirit			= mod:NewSpellAnnounce(137350, 4)
local warnMarkedSoul				= mod:NewTargetAnnounce(137359, 4)--Shadowed Loa Spirit fixate target, no need to warn for Shadowed Loa Spirit AND this, so we just warn for this
local warnTwistedFate				= mod:NewSpellAnnounce(137891, 4)--Heroic Only
--Frost King Malak
local warnBitingCold				= mod:NewTargetAnnounce(136992, 3)--136917 is cast ID version, 136992 is player debuff
local warnFrostBite					= mod:NewTargetAnnounce(136922, 4)--136990 is cast ID version, 136922 is player debuff
local warnFrigidAssault				= mod:NewStackAnnounce(136903, 3, nil, mod:IsTank() or mod:IsHealer())
--Kazra'jin
local warnRecklessCharge			= mod:NewCastAnnounce(137122, 3, 2, nil, false)

--All
local specWarnPossessed				= mod:NewSpecialWarning("specWarnPossessed", mod:IsDps())
--Sul the Sandcrawler
local specWarnSandBolt				= mod:NewSpecialWarningInterrupt(136189, false)--When it's targeting a melee, damage is pretty big. More important to interrupt than ones targeting ranged that SHOULD be spread out. Maybe add a bool menu option to choose ALL or melee only for heroic
local specWarnSandStorm				= mod:NewSpecialWarningSpell(136894, nil, nil, nil, 2)
local specWarnQuickSand				= mod:NewSpecialWarningMove(136860)
--High Prestess Mar'li
local specWarnBlessedLoaSpirit		= mod:NewSpecialWarningSwitch(137203, mod:IsRangedDps())--Ranged should handle this, melee chasing it around is huge dps loss for possessed. On 10 man 2 ranged was enough. If you do not have 2 ranged, 1 or 2 melee will have to help and probably turn this on manually
local specWarnShadowedLoaSpirit		= mod:NewSpecialWarningSwitch(137350, mod:IsRangedDps())
local specWarnMarkedSoul			= mod:NewSpecialWarningRun(137359)
local specWarnTwistedFate			= mod:NewSpecialWarningSwitch(137891)
--Frost King Malak
local specWarnBitingCold			= mod:NewSpecialWarningYou(136992)
local yellBitingCold				= mod:NewYell(136992)--This one you just avoid so chat bubble is useful
local specWarnFrostBite				= mod:NewSpecialWarningYou(136922)--This one you do not avoid you clear it hugging people so no chat bubble
local specWarnFrigidAssault			= mod:NewSpecialWarningStack(136903, mod:IsTank(), 8)
local specWarnFrigidAssaultOther	= mod:NewSpecialWarningTarget(136903, mod:IsTank())
local specWarnChilled				= mod:NewSpecialWarningYou(137085, false)--Heroic
local specWarnDDL					= mod:NewSpecialWarning("specWarnDDL")

--Kazra'jin
local timerRecklessChargeCD			= mod:NewCDTimer(6, 137122, nil, false)
--Sul the Sandcrawler
local timerQuickSandCD				= mod:NewCDTimer(35, 136521)
local timerSandStormCD				= mod:NewCDTimer(35, 136894)
--High Prestess Mar'li
local timerBlessedLoaSpiritCD		= mod:NewCDTimer(33, 137203)--Every 33-35 seconds.
local timerShadowedLoaSpiritCD		= mod:NewCDTimer(33, 137350)--Possessed version of above, shared CD
local timerTwistedFateCD			= mod:NewCDTimer(33, 137891)--On heroic, this replaces shadowed loa spirit
local timerMarkedSoul				= mod:NewTargetTimer(20, 137359)
--Frost King Malak
local timerBitingColdCD				= mod:NewCDTimer(45, 136917)--10 man Cds (and probably LFR), i have no doubt on 25 man this will either have a shorter cd or affect 3 targets with same CD. Watch for timer diffs though
local timerFrostBiteCD				= mod:NewCDTimer(45, 136990)--^same comment as above
local timerFrigidAssault			= mod:NewTargetTimer(15, 136903)
local timerFrigidAssaultCD			= mod:NewCDTimer(30, 136904)--30 seconds after last one ended (maybe even a next timer, i'll change it with more logs.)
--Kazra'jin

--local soundMarkedSoul				= mod:NewSound(137359)

--local berserkTimer				= mod:NewBerserkTimer(490)

mod:AddBoolOption("PHealthFrame", true)
mod:AddBoolOption("RangeFrame")--For Sand Bolt and charge and biting cold

mod:AddBoolOption("HudMAP", true, "sound")
mod:AddBoolOption("HudMAP2", true, "sound")
mod:AddDropdownOption("optDD", {"nodd", "DD1", "DD2", "DD3"}, "nodd", "sound")

local DBMHudMap = DBMHudMap
local free = DBMHudMap.free
local function register(e)	
	DBMHudMap:RegisterEncounterMarker(e)
	return e
end
local BitingColdMarkers = {}
local FrostBiteMarkers = {}

local SulsName = EJ_GetSectionInfo(7049)
local boltCasts = 0
local scansDone = 0
local kazraPossessed = false
local possessesDone = 0
local chilledWarned = false
local chilledDebuff = GetSpellInfo(137085)

local function isTank(unit)
	if GetPartyAssignment("MAINTANK", unit, 1) then
		return true
	end
	if UnitGroupRolesAssigned(unit) == "TANK" then
		return true
	end
	local uId = DBM:GetBossUnitId()
	if uId and UnitExists(uId.."target") and UnitDetailedThreatSituation(unit, uId) then
		return true
	end
	return false
end

local showDamagedHealthBar, hideDamagedHealthBar
do
	local frame = CreateFrame("Frame") -- using a separate frame avoids the overhead of the DBM event handlers which are not meant to be used with frequently occuring events like all damage events...
	local damagedMob
	local hpRemaining = 0
	local maxhp = 0
	local function getDamagedHP()
		return math.max(1, math.floor(hpRemaining / maxhp * 100))
	end
	frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	frame:SetScript("OnEvent", function(self, event, timestamp, subEvent, _, _, _, _, _, destGUID, _, _, _, ...)
		if damagedMob == destGUID then
			local damage
			if subEvent == "SWING_DAMAGE" then 
				damage = select( 1, ... ) 
			elseif subEvent == "RANGE_DAMAGE" or subEvent == "SPELL_DAMAGE" or subEvent == "SPELL_PERIODIC_DAMAGE" then 
				damage = select( 4, ... )
			end
			if damage then
				hpRemaining = hpRemaining - damage
			end
		end
	end)
	
	function showDamagedHealthBar(self, mob, spellName, health)
		damagedMob = mob
		hpRemaining = health
		maxhp = health
		DBM.BossHealth:RemoveBoss(getDamagedHP)
		DBM.BossHealth:AddBoss(getDamagedHP, spellName)
	end
	
	function hideDamagedHealthBar()
		DBM.BossHealth:RemoveBoss(getDamagedHP)
	end
end

function mod:BoltTarget()
	scansDone = scansDone + 1
	local targetname, uId = self:GetBossTarget(69078)
	if targetname and uId then
		if isTank(uId) and scansDone < 15 then--Make sure no infinite loop.
			self:ScheduleMethod(0.1, "BoltTarget")--Check multiple times to find a target that isn't a player.
		else
			warnSandBolt:Show(targetname, boltCasts)
			local targetedClass = UnitClass(uId)
			--Todo, add hybrid melee class checks somehow? Inspect throttling won't allow that here though, too often. Maybe on pull inspect just those classes and cache their specs?
			if targetedClass == "WARRIOR" or targetedClass == "DEATHKNIGHT" or targetedClass == "MONK" or targetedClass == "ROGUE" then--This bolt is targeting a melee, it is a priority interrupt
				specWarnSandBolt:Show(SulsName)
			end
		end
	else--target was nil, lets schedule a rescan here too.
		if scansDone < 15 then--Make sure not to infinite loop here as well.
			self:ScheduleMethod(0.1, "BoltTarget")
		end
	end
end

function mod:OnCombatStart(delay)
	table.wipe(BitingColdMarkers)
	table.wipe(FrostBiteMarkers)
	kazraPossessed = false
	chilledWarned = false
	possessesDone = 0
	boltCasts = 0
	timerQuickSandCD:Start(8-delay)
	sndLS:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_lszb.mp3") --流沙準備
	sndLS:Schedule(6, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
	sndLS:Schedule(7, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
	sndLS:Schedule(8, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	timerRecklessChargeCD:Start(10-delay)--the trigger is 6 seconds from pull, charge will happen at 10. I like timer ending at cast finish for this one though vs tryng to have TWO timers for something that literally only has 6 second cd
	timerBitingColdCD:Start(15-delay)--15 seconds until debuff, 13 til cast.
	timerBlessedLoaSpiritCD:Start(25-delay)
	sndSpirit:Schedule(21, "Interface\\AddOns\\DBM-Core\\extrasounds\\ghostsoon.mp3")
	sndSpirit:Schedule(22, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
	sndSpirit:Schedule(23, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
	sndSpirit:Schedule(24, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(5)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.HudMAP then
		DBMHudMap:FreeEncounterMarkers()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(136189) then
		scansDone = 0
		if boltCasts == 3 then boltCasts = 0 end
		boltCasts = boltCasts + 1
		self:BoltTarget()
		if ((mod.Options.optDD == "DD1") and (boltCasts == 1)) or ((mod.Options.optDD == "DD2") and (boltCasts == 2)) or ((mod.Options.optDD == "DD3") and (boltCasts == 3)) then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\kickcast.mp3") --快打斷
			specWarnSandBolt:Show(args.sourceName)
		end	
		if ((mod.Options.optDD == "DD1") and (boltCasts == 3)) or ((mod.Options.optDD == "DD2") and (boltCasts == 1)) or ((mod.Options.optDD == "DD3") and (boltCasts == 2)) then
			specWarnDDL:Schedule(2)
			sndWOP:Schedule(2, "Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_ddzb.mp3") --打斷準備
		end
	elseif args:IsSpellID(136521) and args:GetSrcCreatureID() == 69078 then--Filter the ones cast by adds dying.
		warnQuicksand:Show()
		timerQuickSandCD:Start()
		sndLS:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_zyls.mp3")
		sndLS:Schedule(32, "Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_lszb.mp3") --流沙準備
		sndLS:Schedule(33, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndLS:Schedule(34, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndLS:Schedule(35, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	elseif args:IsSpellID(136894) then
		warnSandstorm:Show()
		specWarnSandStorm:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_scfb.mp3")  --沙塵風暴
		timerSandStormCD:Start()
	elseif args:IsSpellID(137203) then
		warnBlessedLoaSpirit:Show()
		specWarnBlessedLoaSpirit:Show()
		timerBlessedLoaSpiritCD:Start()
		sndSpirit:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\killspirit.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
		sndSpirit:Schedule(29, "Interface\\AddOns\\DBM-Core\\extrasounds\\ghostsoon.mp3")
		sndSpirit:Schedule(30, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndSpirit:Schedule(31, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndSpirit:Schedule(32, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	elseif args:IsSpellID(137350) then
		warnShadowedLoaSpirit:Show()
		specWarnShadowedLoaSpirit:Show()
		timerShadowedLoaSpiritCD:Start()
		sndSpirit:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\killspirit.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
		sndSpirit:Schedule(29, "Interface\\AddOns\\DBM-Core\\extrasounds\\ghostsoon.mp3")
		sndSpirit:Schedule(30, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndSpirit:Schedule(31, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndSpirit:Schedule(32, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	elseif args:IsSpellID(137891) then
		warnTwistedFate:Show()
		specWarnTwistedFate:Show()
		timerTwistedFateCD:Start()
		DBM.Flash:Show(1, 0, 0)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\killspirit.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndSpirit:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
		sndSpirit:Schedule(29, "Interface\\AddOns\\DBM-Core\\extrasounds\\ghostsoon.mp3")
		sndSpirit:Schedule(30, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndSpirit:Schedule(31, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndSpirit:Schedule(32, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	elseif args:IsSpellID(136990) then
		sndHS:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_zyjt.mp3")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(136442) then--Possessed
		local cid = args:GetDestCreatureID()
		possessesDone = possessesDone + 1
		warnPossessed:Show(args.destName, possessesDone)
		specWarnPossessed:Show(args.spellName, args.destName)
		if cid == 69078 then--Sul the Sandcrawler
			if mod:IsDps() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_sxzk.mp3")  --沙行者快打
			else
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_sxz.mp3") 	 --沙行者強化
			end
			--Do nothing. He just casts sand storm right away and continues his quicksand cd as usual
			self:UnregisterShortTermEvents()
		elseif cid == 69132 then--High Prestess Mar'li				
			if mod:IsDps() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_njsk.mp3")  --女祭祀快打
			else
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_njs.mp3") 	 --女祭祀強化
			end
			--Swap timers. While possessed 
			local elapsed, total = timerBlessedLoaSpiritCD:GetTime()
			timerBlessedLoaSpiritCD:Cancel()
			if elapsed and total then--If for some reason it was nil, like it JUST came off cd, do nothing, she should cast loa spirit right away.
				if self:IsDifficulty("heroic10", "heroic25") then
					timerTwistedFateCD:Update(elapsed, total)
				else
					timerShadowedLoaSpiritCD:Update(elapsed, total)
				end
			end
			self:UnregisterShortTermEvents()
		elseif cid == 69131 then--Frost King Malakk
			if mod:IsDps() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_shwk.mp3")	--霜王快打
			else
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_shw.mp3")	--霜王強化
			end
			--Swap timers. While possessed 
			local elapsed, total = timerBitingColdCD:GetTime()
			timerBitingColdCD:Cancel()
			if elapsed and total and total ~= 0 then--If for some reason it was nil, like it JUST came off cd, do nothing, he should cast frost bite right away.
				timerFrostBiteCD:Update(elapsed, total)
				sndHS:Schedule(total-elapsed-3.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_hszb.mp3") --寒霜準備
				sndHS:Schedule(total-elapsed-2.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
				sndHS:Schedule(total-elapsed-1.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
				sndHS:Schedule(total-elapsed-0.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
			end
			self:RegisterShortTermEvents(
				"UNIT_AURA"
			)
		elseif cid == 69134 then--Kazra'jin
			if mod:IsDps() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_ljrk.mp3")  --綠巨人快打
			else
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_ljr.mp3") 	 --綠巨人強化
			end
			kazraPossessed = true
			self:UnregisterShortTermEvents()
		end
		if (self.Options.HealthFrame or DBM.Options.AlwaysShowHealthFrame) and self.Options.PHealthFrame then
			local boss1cid = tonumber(UnitGUID("boss1"):sub(6, 10), 16)
			local bossHealth
			if (boss1cid == 69078 or boss1cid == 69132 or boss1cid == 69131 or boss1cid == 69134) then
				bossHealth = math.floor(UnitHealthMax("boss1") * 0.25)
			else
				bossHealth = math.floor(UnitHealthMax("boss2") * 0.25) 
			end
			showDamagedHealthBar(self, args.destGUID, args.spellName.." : "..args.destName, bossHealth)
		end
	elseif args:IsSpellID(136903) then--Player Debuff version, not cast version
		timerFrigidAssault:Start(args.destName)
		if self:AntiSpam(3, 1) then--Might need to adjust slightly to 2 or 4.
			warnFrigidAssault:Show(args.destName, args.amount or 1)
			if args:IsPlayer() then
				if (args.amount or 1) >= 8 then
					specWarnFrigidAssault:Show(args.amount)
				end
			else
				if (args.amount or 1) >= 8 and not UnitDebuff("player", GetSpellInfo(136903)) and not UnitIsDeadOrGhost("player") then
					specWarnFrigidAssaultOther:Show(args.destName)
					if mod:IsTank() then
						sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\changemt.mp3") --換坦嘲諷
					end
				end
			end
		end
	elseif args:IsSpellID(136992) then--Player Debuff version, not cast version
		warnBitingCold:Show(args.destName)
		timerBitingColdCD:Start()
		if args:IsPlayer() then
			specWarnBitingCold:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runout.mp3") --離開人群 (刺骨之寒)
			yellBitingCold:Yell()
		end
		if self.Options.HudMAP then
			BitingColdMarkers[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", args.destName, 4, 30, 1, 1, 1, 0.8):Appear():RegisterForAlerts():Rotate(360, 31))
		end
	elseif args:IsSpellID(136922) and (args.amount or 1) == 1 then--Player Debuff version, not cast version (amount is just a spam filter for ignoring SPELL_AURA_APPLIED_DOSE on this event)
		warnFrostBite:Show(args.destName)
		timerFrostBiteCD:Start()
		sndHS:Schedule(41.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_hszb.mp3") --寒霜準備
		sndHS:Schedule(42.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndHS:Schedule(43.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndHS:Schedule(44.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
		if args:IsPlayer() then
			specWarnFrostBite:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_zrkj.mp3") --找人靠近 (寒霜刺骨)
		else
			if mod:IsRanged() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_jhfd.mp3")
			end
		end
		if self.Options.HudMAP2 then
			FrostBiteMarkers[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", args.destName, 4, 30, 1, 1, 0, 0.8):Appear():RegisterForAlerts():Rotate(360, 31):SetAlertColor(0, 0, 1, 0.5))
		end
	elseif args:IsSpellID(136860, 136878) and args:IsPlayer() and self:AntiSpam(2, 3) then--Trigger off initial quicksand debuff and ensnared stacks. much less cpu them registering damage events and just as effective.
		specWarnQuickSand:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_xj.mp3") --陷阱跑開
	elseif args:IsSpellID(137359) then
		warnMarkedSoul:Show(args.destName)
		timerMarkedSoul:Start(args.destName)
		if args:IsPlayer() then
			specWarnMarkedSoul:Show()
--			soundMarkedSoul:Play()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_aydn.mp3") --快跑 暗影點你
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(136442) then--Possessed
		if args:GetDestCreatureID() == 69078 then--Sul the Sandcrawler
			timerSandStormCD:Cancel()
		elseif args:GetDestCreatureID() == 69132 then--High Prestess Mar'li
			--Swap timer back
			local elapsed, total
			if self:IsDifficulty("heroic10", "heroic25") then
				elapsed, total = timerTwistedFateCD:GetTime()
			else
				elapsed, total = timerShadowedLoaSpiritCD:GetTime()
			end
			timerTwistedFateCD:Cancel()
			timerShadowedLoaSpiritCD:Cancel()
			if elapsed and total and total ~= 0 then
				timerBlessedLoaSpiritCD:Update(elapsed, total)
			end
		elseif args:GetDestCreatureID() == 69131 then--Frost King Malakk
			--Swap timer back
			local elapsed, total  = timerFrostBiteCD:GetTime()
			timerFrostBiteCD:Cancel()
			sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_hszb.mp3")
			sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
			sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
			sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
			if elapsed and total then
				timerBitingColdCD:Update(elapsed, total)
			end
		elseif args:GetDestCreatureID() == 69134 then--Kazra'jin
			kazraPossessed = false
			timerRecklessChargeCD:Cancel()--Because it's not going to be 25 sec anymore. It'll go back to 6 seconds. He'll probably do it right away since more than likely it'll be off CD
		end
		if (self.Options.HealthFrame or DBM.Options.AlwaysShowHealthFrame) and self.Options.PHealthFrame then
			hideDamagedHealthBar()
		end
	elseif args:IsSpellID(136903) then
		timerFrigidAssault:Cancel(args.destName)
	elseif args:IsSpellID(136904) then
		timerFrigidAssaultCD:Start()
	elseif args:IsSpellID(136992)  then
		if BitingColdMarkers[args.destName] then
			BitingColdMarkers[args.destName] = free(BitingColdMarkers[args.destName])
		end
	elseif args:IsSpellID(136922)  then
		if FrostBiteMarkers[args.destName] then
			FrostBiteMarkers[args.destName] = free(FrostBiteMarkers[args.destName])
		end
	elseif args:IsSpellID(137359) then
		timerMarkedSoul:Cancel(args.destName)
	end
end

function mod:UNIT_AURA(uId)
	if uId ~= "player" then return end
	if UnitDebuff("player", chilledDebuff) and not chilledWarned then
		specWarnChilled:Show()
		chilledWarned = true
	elseif not UnitDebuff("player", chilledDebuff) and chilledWarned then
		chilledWarned = false
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 69078 then--Sul the Sandcrawler
		timerSandStormCD:Cancel()
		sndLS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_lszb.mp3")
		sndLS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndLS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndLS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
	elseif cid == 69132 then--High Prestess Mar'li
		timerTwistedFateCD:Cancel()
		timerBlessedLoaSpiritCD:Cancel()
		timerShadowedLoaSpiritCD:Cancel()
	elseif cid == 69131 then--Frost King Malakk
		timerFrostBiteCD:Cancel()
		sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_tt_hszb.mp3")
		sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countthree.mp3")
		sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\counttwo.mp3")
		sndHS:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\countone.mp3")
		timerBitingColdCD:Cancel()
		timerFrigidAssaultCD:Cancel()
	elseif cid == 69134 then--Kazra'jin
		timerRecklessChargeCD:Cancel()
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 137107 and self:AntiSpam(2, 2) then--Pre cast trigger. there are other later spellids but they aren't consistent, only this one is.
		warnRecklessCharge:Schedule(2)--warning 4 seconds early on something cast every 6 seconds seems silly. Lets warn 2 seconds early.
		if kazraPossessed then--While possessed he gains "Overload" which will make his charge cd way different.
			timerRecklessChargeCD:Schedule(4, 25)--Will have timer actualy sync up to the cast finish so it also kind serves as a cast bar.
		else
			timerRecklessChargeCD:Schedule(4)--Will have timer actualy sync up to the cast finish so it also kind serves as a cast bar.
		end
	end
end
