local mod	= DBM:NewMod(817, "DBM-ThroneofThunder", nil, 362)
local L		= mod:GetLocalizedStrings()
--BH ADD
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 8974 $"):sub(12, -3))
mod:SetCreatureID(68078, 68079, 68080, 68081)--Ro'shak 68079, Quet'zal 68080, Dam'ren 68081, Iron Qon 68078
mod:SetMainBossID(68078)
mod:SetModelID(46627) -- Iron Qon, 46628 Ro'shak, 46629 Quet'zal, 46630 Dam'ren

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS",
	--BH ADD
	"UNIT_POWER",
	"SPELL_SUMMON",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local warnImpale						= mod:NewStackAnnounce(134691, 2, nil, mod:IsTank() or mod:IsHealer())
local warnThrowSpear					= mod:NewSpellAnnounce(134926, 3)--Target scanning does not work for this.
local warnPhase1						= mod:NewPhaseAnnounce(1)
local warnMoltenInferno					= mod:NewSpellAnnounce(134664, 2, nil, false)--highly variables cd, also can be spammy. disbled by default.
local warnUnleashedFlame				= mod:NewSpellAnnounce(134611, 3, nil, false)--Spammy and unnesssary. Every 6 seconds is too often for a non important warning. people can turn it on if they want.
local warnMoltenOverload				= mod:NewSpellAnnounce(137221, 4)
local warnWhirlingWinds					= mod:NewSpellAnnounce(139167, 3)--Heroic Phase 1
local warnPhase2						= mod:NewPhaseAnnounce(2)
local warnWindStorm						= mod:NewSpellAnnounce(136577, 4)
local warnLightningStorm				= mod:NewTargetAnnounce(136192, 3)
local warnFrostSpike					= mod:NewSpellAnnounce(139180, 3)--Heroic Phase 2
local warnPhase3						= mod:NewPhaseAnnounce(3)
local warnDeadZone						= mod:NewAnnounce("warnDeadZone", 3, 137229)
local warnFreeze						= mod:NewTargetAnnounce(135145, 3, nil, false)--Spammy, more of a duh type warning I think
local warnPhase4						= mod:NewPhaseAnnounce(4)
local warnRisingAnger					= mod:NewStackAnnounce(136323, 2, nil, false)
local warnFistSmash						= mod:NewCountAnnounce(136146, 3)

local specWarnImpale					= mod:NewSpecialWarningStack(134691, mod:IsTank(), 3)
local specWarnImpaleOther				= mod:NewSpecialWarningTarget(134691, mod:IsTank())
local specWarnThrowSpear				= mod:NewSpecialWarningSpell(134926, nil, nil, nil, 2)
local specWarnScorched					= mod:NewSpecialWarningStack(134647, false, 3)--We do a 4 and 2 strat (4 melee 2 ranged). 3 is not an everyone strat.
local specWarnBurningCinders			= mod:NewSpecialWarningMove(137668)
local specWarnMoltenOverload			= mod:NewSpecialWarningSpell(137221, nil, nil, nil, 2)
local specWarnWindStorm					= mod:NewSpecialWarningSpell(136577, nil, nil, nil, 2)
local specWarnStormCloud				= mod:NewSpecialWarningMove(137669)
local specWarnLightningStorm			= mod:NewSpecialWarningYou(136192)
local yellLightningStorm				= mod:NewYell(136192)
local specWarnFrozenBlood				= mod:NewSpecialWarningMove(136520)
local specWarnFistSmash					= mod:NewSpecialWarningSpell(136146, nil, nil, nil, 2)
--BH ADD
local specWarnJSA						= mod:NewSpecialWarning("SpecWarnJSA")

local timerImpale						= mod:NewTargetTimer(40, 134691, mod:IsTank() or mod:IsHealer())
local timerImpaleCD						= mod:NewCDTimer(20, 134691, mod:IsTank() or mod:IsHealer())
local timerThrowSpearCD					= mod:NewCDTimer(30, 134926)--30-36 second variation observed (at last in phase 1)
local timerUnleashedFlameCD				= mod:NewCDTimer(6, 134611)
local timerScorched						= mod:NewBuffFadesTimer(30, 134647)
local timerMoltenOverload				= mod:NewBuffActiveTimer(10, 137221)
local timerLightningStormCD				= mod:NewCDTimer(20, 136192)
local timerWindStormCD					= mod:NewNextTimer(70, 136577)
local timerFreezeCD						= mod:NewCDTimer(7, 135145, nil, false)
local timerDeadZoneCD					= mod:NewCDTimer(15, 137229)
local timerRisingAngerCD				= mod:NewNextTimer(15, 136323, nil, false)
local timerFistSmashCD					= mod:NewNextCountTimer(20, 136146)
local timerWhirlingWindsCD				= mod:NewCDTimer(30, 139167)--Heroic Phase 1
local timerFrostSpikeCD					= mod:NewCDTimer(12, 139180)--Heroic Phase 2

local berserkTimer						= mod:NewBerserkTimer(720)

-- BH ADD
local Warned = false
local stormcount = 0
local senddr = {}
local warneddr = {}
local lightmaker = {}
local FireMarkers={}
mod:AddBoolOption("ReapetAP", true, "sound")
mod:AddBoolOption("SoundARAT", mod:IsDps(), "sound")
mod:AddBoolOption("HudMAP", true, "sound")
mod:AddBoolOption("HudMAP2", true, "sound")
-- BH ADD END
mod:AddBoolOption("RangeFrame", true)--One tooltip says 8 yards, other says 10. Confirmed it's 10 during testing though. Ignore the 8 on spellid 134611
mod:AddBoolOption("InfoFrame")

local Roshak = select(2, EJ_GetCreatureInfo(2, 817))
local Quetzal = select(2, EJ_GetCreatureInfo(3, 817))
local Damren = select(2, EJ_GetCreatureInfo(4, 817))
local arcingName = GetSpellInfo(136193)
local phase = 1--Not sure this is useful yet, coding it in, in case spear cd is different in different phases
local fistSmashCount = 0

local function updateHealthFrame()
	if DBM.BossHealth:IsShown() then
		DBM.BossHealth:Clear()
		if phase == 1 then
			DBM.BossHealth:AddBoss(68079, Roshak)
		elseif phase == 2 then
			DBM.BossHealth:AddBoss(68080, Quetzal)
		elseif phase == 3 then
			DBM.BossHealth:AddBoss(68081, Damren)
		elseif phase == 4 then
			DBM.BossHealth:AddBoss(68078, L.name)
		end
	end
end

local function checkArcing()
	local arcingDebuffs = 0
	for i = 1, GetNumGroupMembers() do
		local uId = "raid"..i
		if UnitDebuff(uId, arcingName) then
			arcingDebuffs = arcingDebuffs + 1
		end
	end
	if arcingDebuffs == 0 then
		mod:Unschedule(checkArcing)
		if mod.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		if mod.Options.InfoFrame then
			DBM.InfoFrame:Hide()
		end
	else
		mod:Schedule(5, checkArcing)
	end
end
local DBMHudMap = DBMHudMap
local free = DBMHudMap.free
local function register(e)	
	DBMHudMap:RegisterEncounterMarker(e)
	return e
end
function mod:checkmydebuff()
    if UnitDebuff("player", GetSpellInfo(136192)) then
		SendChatMessage(L.Helpme, "SAY")
		self:ScheduleMethod(4, "checkmydebuff")
	end
end
local function fixdebuffremovebug(checkplayer)
    if UnitDebuff(checkplayer, GetSpellInfo(136192)) then
		mod:Schedule(2, function()
			fixdebuffremovebug(checkplayer)
		end)
	else
		if lightmaker[checkplayer] then
			lightmaker[checkplayer] = free(lightmaker[checkplayer])
		end
	end
end

local function fixdebuffremovebug2(checkplayer)
    if UnitDebuff(checkplayer, GetSpellInfo(136193)) then
		mod:Schedule(2, function()
			fixdebuffremovebug2(checkplayer)
		end)
	else
		if FireMarkers[checkplayer] then
			FireMarkers[checkplayer] = free(FireMarkers[checkplayer])
		end
	end
end
-- BH ADD END

function mod:OnCombatStart(delay)
	phase = 1
	fistSmashCount = 0
	updateHealthFrame()
	warnPhase1:Show()
	--BH ADD
	Warned = false
	stormcount = 0
	table.wipe(lightmaker)
	table.wipe(FireMarkers)
	table.wipe(senddr)
	table.wipe(warneddr)
	sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hyxt.mp3") --火焰形态
	--BH ADD END
	timerThrowSpearCD:Start(-delay)
	if self.Options.RangeFrame then
		if self:IsDifficulty("normal10", "heroic10") then
			DBM.RangeCheck:Show(10, nil, nil, 2)
		else
			DBM.RangeCheck:Show(10, nil, nil, 4)
		end
	end
	if self:IsDifficulty("heroic10", "heroic25") then
		timerWhirlingWindsCD:Start(20-delay)
		timerLightningStormCD:Start(22-delay)
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(GetSpellInfo(136193))
			DBM.InfoFrame:Show(5, "playerbaddebuff", 136193)
		end
	else
		self:RegisterShortTermEvents(
			"UNIT_DIED"--Alternate phase detection for normal (not sure if needed, but just in case, i deleted my normal mode log and don't remember if they fired "eject all passengers" there.
		)
	end
	berserkTimer:Start(-delay)
end

function mod:OnCombatEnd()
	self:UnregisterShortTermEvents()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	--BH ADD
	if self.Options.HudMAP or self.Options.HudMAP2 then
		DBMHudMap:FreeEncounterMarkers()
	end
	--BH ADD END
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(134691) then
		warnImpale:Show(args.destName, args.amount or 1)
		timerImpaleCD:Start()
		if args:IsPlayer() then
			if (args.amount or 1) >= 3 then
				specWarnImpale:Show(args.amount)
			end
		else
			if (args.amount or 1) >= 2 and not UnitDebuff("player", GetSpellInfo(134691)) and not UnitIsDeadOrGhost("player") then
				specWarnImpaleOther:Show(args.destName)
			end
		end
	elseif args:IsSpellID(134647) and args:IsPlayer() then
		timerScorched:Start()
		if (args.amount or 1) > 2 then
			specWarnScorched:Show(args.amount or 1)
		end
	elseif args:IsSpellID(137221) then
		warnMoltenOverload:Show()
		specWarnMoltenOverload:Show()
		timerMoltenOverload:Start()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_rycz.mp3") --熔岩超載
	elseif args:IsSpellID(136192) then
		warnLightningStorm:Show(args.destName)
		if phase == 1 then--Heroic
			timerLightningStormCD:Start(38)
		else
			timerLightningStormCD:Start()
		end
		--BH ADD
		if args:IsPlayer() then
			specWarnLightningStorm:Show()
			yellLightningStorm:Yell()
			if self.Options.ReapetAP then
				self:ScheduleMethod(4, "checkmydebuff")
			end
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\helpme.mp3") --救我
			if self.Options.HudMAP then
				lightmaker[args.destName] = register(DBMHudMap:AddEdge(0, 0, 1, 1, nil, "player", args.destName))
				fixdebuffremovebug(args.destName)
			end			
		end
		--BH ADD END
	elseif args:IsSpellID(135145) then
		warnFreeze:Show(args.destName)
		if phase == 2 then--Heroic
			timerFreezeCD:Start(36)
		else
			timerFreezeCD:Start()
		end
	elseif args:IsSpellID(136323) then
		warnRisingAnger:Show(args.destName, args.amount or 1)
		timerRisingAngerCD:Start()
	elseif args:IsSpellID(136193) then
		if phase > 2 then
			if self.Options.HudMAP2 and not FireMarkers[args.destName] then
				FireMarkers[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("highlight", args.destName, 10, nil, 1, 1 ,1 ,0.8):Appear():RegisterForAlerts())
				fixdebuffremovebug2(args.destName)
			end
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(134647) and args:IsPlayer() then
		timerScorched:Cancel()
	--BH ADD
	elseif args:IsSpellID(136192) then
		if lightmaker[args.destName] then
			lightmaker[args.destName] = free(lightmaker[args.destName])
		end
	--BH ADD END
	elseif args:IsSpellID(136193) then
		if FireMarkers[args.destName] then
			FireMarkers[args.destName] = free(FireMarkers[args.destName])
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(134664) then
		warnMoltenInferno:Show()
	--Dead zone IDs, each dead zone has two shields and two openings. Each spellid identifies those openings.
	elseif args:IsSpellID(137226) then--Front, Right Shielded
		warnDeadZone:Show(args.spellName, DBM_CORE_FRONT, DBM_CORE_RIGHT)
		timerDeadZoneCD:Start()
		if self.Options.SoundARAT then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\attmid.mp3")
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mq.mp3")
		end
		--Attack left or Behind (maybe add special warning that says where you can attack, for dps?)
	elseif args:IsSpellID(137227) then--Left, Right Shielded
		warnDeadZone:Show(args.spellName, DBM_CORE_LEFT, DBM_CORE_RIGHT)
		timerDeadZoneCD:Start()
		if self.Options.SoundARAT then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\attmid.mp3")
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mq.mp3")
		end
		--Attack Front or Behind
	elseif args:IsSpellID(137228) then--Left, Front Shielded
		warnDeadZone:Show(args.spellName, DBM_CORE_LEFT, DBM_CORE_FRONT)
		timerDeadZoneCD:Start()
		if self.Options.SoundARAT then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\attmid.mp3")
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mq.mp3")
		end
		--Attack Right or Behind
	elseif args:IsSpellID(137229) then--Back, Front Shielded
		warnDeadZone:Show(args.spellName, DBM_CORE_BACK, DBM_CORE_FRONT)
		timerDeadZoneCD:Start()
		if self.Options.SoundARAT then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\attleft.mp3")
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mq.mp3")
		end
		--Attack left or Right
	elseif args:IsSpellID(137230) then--Back, Left Shielded
		warnDeadZone:Show(args.spellName, DBM_CORE_BACK, DBM_CORE_LEFT)
		timerDeadZoneCD:Start()
		if self.Options.SoundARAT then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\attright.mp3")
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mq.mp3")
		end
		--Attack Front or Right
	elseif args:IsSpellID(137231) then--Back, Right Shielded
		warnDeadZone:Show(args.spellName, DBM_CORE_BACK, DBM_CORE_RIGHT)
		timerDeadZoneCD:Start()
		if self.Options.SoundARAT then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\attleft.mp3")
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mq.mp3")
		end
		--Attack Front or Left
	end
end

function mod:SPELL_SUMMON(args)
	if args:IsSpellID(134926) and phase < 4 then
		warnThrowSpear:Show()
		specWarnThrowSpear:Show()
		timerThrowSpearCD:Start()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\spear.mp3") --投擲長矛
	end
end

--[[
--One of these is standing in fire and you need to move,other is dot you can't do anything about cause you stood in it too long. I'm not sure which is which so mod may be backwards, if it is, swap the damage events
"<54.8 20:15:39> [CLEU] SPELL_PERIODIC_DAMAGE#true##nil#1297#2#0x0100000000001E03#Omegal#1297#2#137668#Burning Cinders#4#15972#-1#4#nil#nil#nil#nil#nil#nil#nil", -- [3846]
"<55.4 20:15:39> [CLEU] SPELL_DAMAGE#true##nil#1298#8#0x01000000000036C3#Ixila#1298#8#137668#Burning Cinders#4#8896#-1#4#nil#nil#17562#nil#nil#nil#nil", -- [3905]
--]]
function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 137668 and destGUID == UnitGUID("player") and self:AntiSpam(3, 2) then
		specWarnBurningCinders:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	elseif spellId == 137669 and destGUID == UnitGUID("player") and self:AntiSpam(3, 3) then
		specWarnStormCloud:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3")
	elseif spellId == 137664 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnFrozenBlood:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3")
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 134611 and self:AntiSpam(2, 5) then--Unleashed Flame internal CD. He cannot use more often than every 6 seconds. 137991 is ability activation on pull, before 137991 is cast, he can't use ability at all
		warnUnleashedFlame:Show()
		timerUnleashedFlameCD:Start()
	elseif spellId == 50630 and self:AntiSpam(2, 6) then--Eject All Passengers (heroic phase change trigger)
		local cid = self:GetCIDFromGUID(UnitGUID(uId))
		timerThrowSpearCD:Start()
		if cid == 68079 then--Ro'shak
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(10, nil, nil, 1)--Switch range frame back to 1. Range is assumed 10, no spell info
			end
			--Only one log, but i looks like spear cd from phase 1 remains intact
			phase = 2
			updateHealthFrame()
			if self:IsDifficulty("heroic10", "heroic25") then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_sdxt.mp3") --閃電形态
			end
			timerUnleashedFlameCD:Cancel()
			timerMoltenOverload:Cancel()
			timerWhirlingWindsCD:Cancel()
			warnPhase2:Show()
			if self:IsDifficulty("heroic10", "heroic25") then
				timerFreezeCD:Start(13)
				timerFrostSpikeCD:Start(18)
			end
			timerLightningStormCD:Start()
			warnWindStorm:Schedule(52)
			specWarnWindStorm:Schedule(52)
			sndWOP:Schedule(52, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\wwsoon.mp3")
			timerWindStormCD:Start(52)
		elseif cid == 68080 then--Quet'zal
			phase = 3
			if self.Options.HudMAP2 then
				for i = 1, DBM:GetNumGroupMembers() do
					if UnitDebuff("raid"..i, GetSpellInfo(136193)) then
						if UnitName("raid"..i) ~= UnitName("player") then
							FireMarkers[UnitName("raid"..i)] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("highlight", UnitName("raid"..i), 10, nil, 1, 1 ,1 ,0.8):Appear():RegisterForAlerts())
						else
							FireMarkers[UnitName("raid"..i)] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("highlight", UnitName("raid"..i), 10, nil, 1, 1 ,1 ,0.4):Appear():RegisterForAlerts())
						end
						fixdebuffremovebug2(UnitName("raid"..i))
					end
				end
			end
			updateHealthFrame()
			if self:IsDifficulty("heroic10", "heroic25") then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bsxt.mp3") --冰霜形態
			end
			timerLightningStormCD:Cancel()
			timerWindStormCD:Cancel()
			timerFrostSpikeCD:Cancel()
			warnPhase3:Show()
			timerDeadZoneCD:Start(8.5)
			if self:IsDifficulty("heroic10", "heroic25") then--On heroic, the fire guy returns and attacks clumps again
				if self.Options.RangeFrame then--So on heroic we need to restore the grouping range frame
					if self:IsDifficulty("heroic25") then
						DBM.RangeCheck:Show(10, nil, nil, 4)--You can have 1 person in range safely. Frame goes red at 4
					else
						DBM.RangeCheck:Show(10, nil, nil, 2)--You can have 1 person in range safely. Frame goes red at 2
					end
				end
			end
			checkArcing()
		elseif cid == 68081 then--Dam'ren
			phase = 4
			updateHealthFrame()
			timerDeadZoneCD:Cancel()
			timerFreezeCD:Cancel()
			warnPhase4:Show()
			timerRisingAngerCD:Start(15)
			timerFistSmashCD:Start(25, 1)
			if self:IsDifficulty("heroic10", "heroic25") then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ptwo.mp3") --2階段
			end
		end
	elseif spellId == 139172 and self:AntiSpam(2, 7) then--Whirling Winds (Phase 1 Heroic)
		warnWhirlingWinds:Show()
		timerWhirlingWindsCD:Start()
	elseif spellId == 139181 and self:AntiSpam(2, 7) then--Frost Spike (Phase 2 Heroic)
		warnFrostSpike:Show()
		timerFrostSpikeCD:Start()
	--"<168.1 19:53:31> [UNIT_SPELLCAST_SUCCEEDED] Quet'zal [[boss3:Rushing Winds::0:137656]]", -- [13876]
	--"<170.1 19:29:36> [CLEU] SPELL_MISSED#true##nil#2632#0#0x010000000003A244#Oxey#1300#8#136577#Wind Storm#8#MISS#nil", -- [11314]
	elseif spellId == 137656 and self:AntiSpam(2, 1) then--Rushing Winds (Wind Storm pre trigger)
		warnWindStorm:Cancel()
		specWarnWindStorm:Cancel()
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\wwsoon.mp3") 
		warnWindStorm:Schedule(70)
		specWarnWindStorm:Schedule(70)
		sndWOP:Schedule(70, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\wwsoon.mp3") --準備旋風
		timerWindStormCD:Start()
	elseif spellId == 136146 and self:AntiSpam(2, 5) then
		fistSmashCount = fistSmashCount + 1
		warnFistSmash:Show(fistSmashCount)
		specWarnFistSmash:Show()
		timerFistSmashCD:Start(nil, fistSmashCount+1)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\aesoon.mp3")
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 68079 then--Ro'shak
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(10, nil, nil, 1)--Switch range frame back to 1. Range is assumed 10, no spell info
		end
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(arcingName)
			DBM.InfoFrame:Show(5, "playerbaddebuff", 136193)
		end
		--Only one log, but i looks like spear cd from phase 1 remains intact
		phase = 2
		updateHealthFrame()
		timerUnleashedFlameCD:Cancel()
		timerMoltenOverload:Cancel()
		timerLightningStormCD:Start(17)
		timerThrowSpearCD:Start()
		warnPhase2:Show()
		warnWindStorm:Schedule(49.5)
		specWarnWindStorm:Schedule(49.5)
		sndWOP:Schedule(49.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\wwsoon.mp3")
		timerWindStormCD:Start(49.5)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_sdxt.mp3") --閃電形态
	elseif cid == 68080 then--Quet'zal
		phase = 3
		if self.Options.HudMAP2 then
			for i = 1, DBM:GetNumGroupMembers() do
				if UnitDebuff("raid"..i, GetSpellInfo(136193)) then
					if UnitName("raid"..i) ~= UnitName("player") then
						FireMarkers[UnitName("raid"..i)] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("highlight", UnitName("raid"..i), 10, nil, 1, 1 ,1 ,0.8):Appear():RegisterForAlerts())
					else
						FireMarkers[UnitName("raid"..i)] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("highlight", UnitName("raid"..i), 10, nil, 1, 1 ,1 ,0.4):Appear():RegisterForAlerts())
					end
					fixdebuffremovebug2(UnitName("raid"..i))
				end
			end
		end
		updateHealthFrame()
		timerLightningStormCD:Cancel()
		warnWindStorm:Cancel()
		specWarnWindStorm:Cancel()
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\wwsoon.mp3")
		timerWindStormCD:Cancel()
		warnPhase3:Show()
		timerDeadZoneCD:Start(6)
		timerThrowSpearCD:Start()
		checkArcing()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bsxt.mp3") --冰霜形態
	elseif cid == 68081 then--Dam'ren
		phase = 4
		updateHealthFrame()
		self:UnregisterShortTermEvents()
		timerDeadZoneCD:Cancel()
		timerFreezeCD:Cancel()
		--BH MODIFY
		warnPhase4:Show()
		timerRisingAngerCD:Start()
		if self:IsDifficulty("normal25", "lfr25") then --lfr not comfirms
			timerFistSmashCD:Start(22.5, 1)
		else
			timerFistSmashCD:Start(31.5, 1)
		end
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ptwo.mp3") --2階段
	end
end

--BH ADD
function mod:UNIT_POWER(uId)
	if self:IsDifficulty("lfr25") then return end
	if (self:GetUnitCreatureId(uId) == 68079) and UnitPower(uId) > 50 and not Warned then
		Warned = true
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_mop_nlgg.mp3") --能量過高
	elseif (self:GetUnitCreatureId(uId) == 68079) and UnitPower(uId) < 20 and Warned then
		Warned = false
	end
end