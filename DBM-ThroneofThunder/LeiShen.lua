local mod	= DBM:NewMod(832, "DBM-ThroneofThunder", nil, 362)
local L		= mod:GetLocalizedStrings()
-- BH ADD
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 9350 $"):sub(12, -3))
mod:SetCreatureID(68397)--Diffusion Chain Conduit 68696, Static Shock Conduit 68398, Bouncing Bolt conduit 68698, Overcharge conduit 68697
mod:SetModelID(46770)
mod:SetQuestID(32756)
mod:SetUsedIcons(8, 7, 6, 5, 4, 3, 2, 1)--All icons can be used, because if a pillar is level 3, it puts out 4 debuffs on 25 man (if both are level 3, then you will have 8)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"SPELL_PERIODIC_DAMAGE",
	"SPELL_PERIODIC_MISSED",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED"
)

mod:RegisterEvents(
	"CHAT_MSG_SAY"
)

--Conduits (All phases)
local warnStaticShock					= mod:NewTargetAnnounce(135695, 4)
local warnDiffusionChain				= mod:NewTargetAnnounce(135991, 3)--More informative than actually preventative. (you need to just spread out, and that's it. can't control who it targets only that it doesn't spread)
local warnOvercharged					= mod:NewTargetAnnounce(136295, 3)
local warnBouncingBolt					= mod:NewSpellAnnounce(136361, 3)

local warnHelmofCommand					= mod:NewTargetAnnounce(139011, 3)
--Phase 1
local warnDecapitate					= mod:NewTargetAnnounce(134912, 4, nil, mod:IsTank() or mod:IsHealer())
local warnThunderstruck					= mod:NewSpellAnnounce(135095, 3)--Target scanning seems to not work
--Phase 2
local warnPhase2						= mod:NewPhaseAnnounce(2)
local warnFusionSlash					= mod:NewSpellAnnounce(136478, 4, nil, mod:IsTank() or mod:IsHealer())
local warnLightningWhip					= mod:NewSpellAnnounce(136850, 3)
local warnSummonBallLightning			= mod:NewSpellAnnounce(136543, 3)--This seems to be VERY important to spread for. It spawns an orb for every person who takes damage. MUST range 6 this.
--Phase 3
local warnPhase3						= mod:NewPhaseAnnounce(3)
local warnViolentGaleWinds				= mod:NewSpellAnnounce(136889, 3)
local warnElectricalShock				= mod:NewStackAnnounce(136914, 3, nil, mod:IsTank())

--Conduits (All phases)
local specWarnStaticShock				= mod:NewSpecialWarningYou(135695)
local yellStaticShock					= mod:NewYell(135695)
local specWarnStaticShockNear			= mod:NewSpecialWarningClose(135695)
local specWarnOvercharged				= mod:NewSpecialWarningYou(136295)
local yellOvercharged					= mod:NewYell(136295)
local specWarnOverchargedNear			= mod:NewSpecialWarningClose(136295)
local specWarnBouncingBolt				= mod:NewSpecialWarningSpell(136361, false)

local specWarnHelmofCommand				= mod:NewSpecialWarningYou(139011)
--Phase 1
local specWarnDecapitate				= mod:NewSpecialWarningRun(134912, mod:IsTank())
local specWarnDecapitateOther			= mod:NewSpecialWarningTarget(134912, mod:IsTank())
-- BH ADD
local specWarnDiffusionChain			= mod:NewSpecialWarningTarget(135991)
local specWarnThunderstruck				= mod:NewSpecialWarningSpell(135095, nil, nil, nil, 2)
local specWarnCrashingThunder			= mod:NewSpecialWarningMove(135150)
local specWarnIntermissionSoon			= mod:NewSpecialWarning("specWarnIntermissionSoon")
--Phase 2
local specWarnFusionSlash				= mod:NewSpecialWarningSpell(136478, mod:IsTank(), nil, nil, 3)--Cast (394514 is debuff. We warn for cast though because it knocks you off platform if not careful)
local specWarnLightningWhip				= mod:NewSpecialWarningSpell(136850, nil, nil, nil, 2)
local specWarnSummonBallLightning		= mod:NewSpecialWarningSpell(136543, nil, nil, nil, 2)
local specWarnOverloadedCircuits		= mod:NewSpecialWarningMove(137176)
--Phase 3
local specWarnElectricalShock			= mod:NewSpecialWarningStack(136914, mod:IsTank(), 12)--You get about 12 stacks in 8 seconds, which is about how often you'll swap
local specWarnElectricalShockOther		= mod:NewSpecialWarningTarget(136914, mod:IsTank())

--Conduits (All phases)
local timerStaticShock					= mod:NewBuffFadesTimer(8, 135695)
local timerStaticShockCD				= mod:NewCDTimer(40, 135695)
local timerDiffusionChainCD				= mod:NewCDTimer(40, 135991)
local timerOvercharge					= mod:NewCastTimer(6, 136295)
local timerOverchargeCD					= mod:NewCDTimer(40, 136295)
local timerBouncingBoltCD				= mod:NewCDTimer(40, 136361)
local timerSuperChargedConduits			= mod:NewBuffActiveTimer(47, 137045)--Actually intermission only, but it fits best with conduits

local timerHelmofCommand				= mod:NewTargetTimer(8, 139011)
local timerHelmofCommandCD				= mod:NewNextTimer(24, 139011)
--Phase 1
local timerDecapitateCD					= mod:NewCDTimer(50, 134912)--Cooldown with some variation. 50-57ish or so.
local timerThunderstruck				= mod:NewCastTimer(4.8, 135095)--4 sec cast. + landing 0.8~1.3 sec.
local timerThunderstruckCD				= mod:NewNextTimer(46, 135095)--Seems like an exact bar
--Phase 2
local timerFussionSlashCD				= mod:NewCDTimer(42.5, 136478)
local timerLightningWhip				= mod:NewCastTimer(4, 136850)
local timerLightningWhipCD				= mod:NewNextTimer(45.5, 136850)--Also an exact bar
local timerSummonBallLightningCD		= mod:NewNextTimer(45.5, 136543)--Seems exact on live, versus the variable it was on PTR
--Phase 3
local timerViolentGaleWinds				= mod:NewBuffActiveTimer(18, 136889)
local timerViolentGaleWindsCD			= mod:NewNextTimer(30.5, 136889)

local berserkTimer						= mod:NewBerserkTimer(900)--Confirmed in LFR, probably the same in all modes though?
mod:AddBoolOption("RangeFrame")
mod:AddBoolOption("OverchargeArrow")--On by default because the overcharge target is always pinned and unable to run away. You must always run to them, so everyone will want this arrow on
mod:AddBoolOption("StaticShockArrow", false)--Off by default as most static shock stack points are pre defined and not based on running to player, but rathor running to a raid flare on ground
mod:AddBoolOption("SetIconOnOvercharge", true)
mod:AddBoolOption("SetIconOnStaticShock", true)
--BH ADD
mod:AddBoolOption("HudMAP", true, "sound")
mod:AddBoolOption("HudMAP2", true, "sound")
mod:AddEditBoxOption("cancelhud", 150, "", "sound")
local stormcount = 0
local lightp2count = 0
local lightp3count = 0
local StaticShockMarkers = {}
local OverchargedMarkers = {}
local canceledshock = {}
local checkmsg = ""
local DBMHudMap = DBMHudMap
local free = DBMHudMap.free
local function register(e)	
	DBMHudMap:RegisterEncounterMarker(e)
	return e
end
--BH ADD END

local phase = 1
local warnedCount = 0
local intermissionActive = false--Not in use yet, but will be. This will be used (once we have CD bars for regular phases mapped out) to prevent those cd bars from starting during intermissions and messing up the custom intermission bars
local northDestroyed = false
local eastDestroyed = false
local southDestroyed = false
local westDestroyed = false
local staticshockTargets = {}
local overchargeTarget = {}
local overchargeIcon = 1--Start low and count up
local staticIcon = 8--Start high and count down

local function warnStaticShockTargets()
	warnStaticShock:Show(table.concat(staticshockTargets, "<, >"))
	table.wipe(staticshockTargets)
	staticIcon = 8
	stormcount = stormcount + 1
end

local function warnOverchargeTargets()
	warnOvercharged:Show(table.concat(overchargeTarget, "<, >"))
	table.wipe(overchargeTarget)
	overchargeIcon = 1
end

function mod:OnCombatStart(delay)
	table.wipe(staticshockTargets)
	table.wipe(overchargeTarget)
	--BH ADD
	stormcount = 0
	lightp3count = 0
	lightp2count = 0
	checkmsg = mod.Options.cancelhud
	table.wipe(StaticShockMarkers)
	table.wipe(OverchargedMarkers)
	table.wipe(canceledshock)
	--BH ADD END
	phase = 1
	warnedCount = 0
	staticIcon = 8
	overchargeIcon = 1
	intermissionActive = false
	northDestroyed = false
	eastDestroyed = false
	southDestroyed = false
	westDestroyed = false
	timerThunderstruckCD:Start(25-delay)
	timerDecapitateCD:Start(40-delay)--First seems to be 45, rest 50. it's a CD though, not a "next"
	berserkTimer:Start(-delay)
	self:RegisterShortTermEvents(
		"UNIT_HEALTH_FREQUENT"
	)-- Do not use on phase 3.
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.OverchargeArrow or self.Options.StaticShockArrow then
		DBM.Arrow:Hide()
	end
	self:UnregisterShortTermEvents()
	if self.Options.HudMAP or self.Options.HudMAP2 then
		DBMHudMap:FreeEncounterMarkers()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 135095 then
		warnThunderstruck:Show()
		specWarnThunderstruck:Show()
		timerThunderstruck:Start()
		if phase < 3 then
			timerThunderstruckCD:Start()
		else
			timerThunderstruckCD:Start(30)
		end
		DBM.Flash:Show(1, 0, 0)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_yllj.mp3") --遠離雷擊
	--"<206.2 20:38:58> [UNIT_SPELLCAST_SUCCEEDED] Lei Shen [[boss1:Lightning Whip::0:136845]]", -- [13762] --This event comes about .5 seconds earlier than SPELL_CAST_START. Maybe worth using?
	elseif args.spellId == 136850 then
		warnLightningWhip:Show()
		specWarnLightningWhip:Show()
		timerLightningWhip:Start()
		if phase < 3 then
			timerLightningWhipCD:Start()
		else
			timerLightningWhipCD:Start(30)
		end
		DBM.Flash:Show(1, 0, 0)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_sdb.mp3") --閃電鞭
	elseif args.spellId == 136478 then
		warnFusionSlash:Show()
		specWarnFusionSlash:Show()
		timerFussionSlashCD:Start()
		if UnitName("boss1target") == UnitName("player") then
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xxjf.mp3") --小心擊飛
		elseif mod:IsTank() or mod:IsHealer() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_jlz.mp3") --巨雷斬
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(135000, 134912) then--Is 135000 still used on 10 man?
		warnDecapitate:Show(args.destName)
		timerDecapitateCD:Start()
		if args:IsPlayer() then
			specWarnDecapitate:Show()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_zs.mp3")--斬首快跑
		else
			specWarnDecapitateOther:Show(args.destName)
			if mod:IsTank() or mod:IsHealer() then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\changemt.mp3") --換坦嘲諷
			end
		end
	--Conduit activations
	elseif args.spellId == 135695 then
		staticshockTargets[#staticshockTargets + 1] = args.destName
		if self.Options.SetIconOnStaticShock then
			self:SetIcon(args.destName, staticIcon)
			staticIcon = staticIcon - 1
		end
		if not intermissionActive then
			timerStaticShockCD:Start()
		end
		if args:IsPlayer() then
			specWarnStaticShock:Show()
			yellStaticShock:Yell()
			timerStaticShock:Start()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\targetyou.mp3") --目標是你
			sndWOP:Schedule(1.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countseven.mp3")
			sndWOP:Schedule(2.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countsix.mp3")
			sndWOP:Schedule(3.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(4.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
			sndWOP:Schedule(5.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(6.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(7.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		else
			if not intermissionActive and self:IsMelee() then return end--Melee do not help soak these during normal phases, only during intermissions
			local uId = DBM:GetRaidUnitId(args.destName)
			if uId then
				local x, y = GetPlayerMapPosition(uId)
				if x == 0 and y == 0 then
					SetMapToCurrentZone()
					x, y = GetPlayerMapPosition(uId)
				end
				local inRange = DBM.RangeCheck:GetDistance("player", x, y)
				--BH MODIFY
				if inRange and inRange < 50 then
					specWarnStaticShockNear:Show(args.destName)
					if self.Options.StaticShockArrow then
						DBM.Arrow:ShowRunTo(args.destName, 3, 3, 8)
					end
					if self:AntiSpam(3, 5) then
						sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_jhfd.mp3") --集合分擔
						sndWOP:Schedule(1.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countseven.mp3")
						sndWOP:Schedule(2.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countsix.mp3")
						sndWOP:Schedule(3.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
						sndWOP:Schedule(4.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
						sndWOP:Schedule(5.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
						sndWOP:Schedule(6.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
						sndWOP:Schedule(7.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
					end
					if self.Options.HudMAP then
						StaticShockMarkers[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", args.destName, 8, 8, 1, 1, 1, 0.8):Appear():RegisterForAlerts():Rotate(360, 8.5):SetAlertColor(0, 0, 1, 0.5))
						StaticShockMarkers[args.destName.."Edge"] = register(DBMHudMap:AddEdge(0, 0, 1, 1, 8, "player", args.destName))
					end
				end
				--BH MODIFY END
			end
		end
		self:Unschedule(warnStaticShockTargets)
		self:Schedule(0.3, warnStaticShockTargets)
	elseif args.spellId == 139011 then --聖令
		warnHelmofCommand:Show(args.destName)
		timerHelmofCommand:Start(args.destName)
		timerHelmofCommandCD:Start()
		if args:IsPlayer() then
			specWarnHelmofCommand:Show()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_jtzy.mp3") --注意擊退
		end
	elseif args.spellId == 136295 then
		overchargeTarget[#overchargeTarget + 1] = args.destName
		timerOvercharge:Start()
		if self.Options.SetIconOnOvercharge then
			self:SetIcon(args.destName, overchargeIcon)
			overchargeIcon = overchargeIcon + 1
		end
		if not intermissionActive then
			timerOverchargeCD:Start()
		end
		if args:IsPlayer() then
			specWarnOvercharged:Show()
			yellOvercharged:Yell()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\targetyou.mp3") --目標是你
			sndWOP:Schedule(1.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(2.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
			sndWOP:Schedule(3.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(4.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(5.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		else
			if not intermissionActive and self:IsMelee() then return end--Melee do not help soak these during normal phases, only during intermissions
			local uId = DBM:GetRaidUnitId(args.destName)
			if uId then
				local x, y = GetPlayerMapPosition(uId)
				if x == 0 and y == 0 then
					SetMapToCurrentZone()
					x, y = GetPlayerMapPosition(uId)
				end
				local inRange = DBM.RangeCheck:GetDistance("player", x, y)
				--BH MODIFY
				if inRange and inRange < 50 then
					specWarnOverchargedNear:Show(args.destName)
					if self:AntiSpam(3, 6) then
						sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_czjh.mp3") --超載集合
						sndWOP:Schedule(1.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
						sndWOP:Schedule(2.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
						sndWOP:Schedule(3.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
						sndWOP:Schedule(4.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
					end
					if self.Options.HudMAP2 then
						OverchargedMarkers[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", args.destName, 5, 6, 1, 1, 1, 0.8):Appear():RegisterForAlerts():Rotate(360, 6.5):SetAlertColor(0, 0, 1, 0.5))
						OverchargedMarkers[args.destName.."Edge"] = register(DBMHudMap:AddEdge(0, 0, 1, 1, 6, "player", args.destName))
					end
					if self.Options.OverchargeArrow then
						DBM.Arrow:ShowRunTo(args.destName, 3, 3, 6)
					end
				end
				--BH MODIFY END
			end
		end
		self:Unschedule(warnOverchargeTargets)
		self:Schedule(0.3, warnOverchargeTargets)
	elseif args.spellId == 135680 and args:GetDestCreatureID() == 68397 then--North (Static Shock)
		--start timers here when we have em
	elseif args.spellId == 135681 and args:GetDestCreatureID() == 68397 then--East (Diffusion Chain)
		if self.Options.RangeFrame and self:IsRanged() then--Shouldn't target melee during a normal pillar, only during intermission when all melee are with ranged and out of melee range of boss
			DBM.RangeCheck:Show(8)--Assume 8 since spell tooltip has no info
		end
		-- BH ADD
		if self:IsRanged() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\scattersoon.mp3")--注意分散
		end
		-- BH ADD END
	elseif args.spellId == 136914 then
		--TODO add prints to figure out how this remotely doesn't work, when it's impossible.
		--http://worldoflogs.com/reports/rt-gankfbp409i7qpvw/xe/?s=13273&e=13760&x=spellid+%3D+136914
		--In above log, with warnings turned on, never saw a single one. not warnElectricalShock, not specWarnElectricalShock and certainly not specWarnElectricalShockOther
		local amount = args.amount or 1
		if not (amount % 3 == 0) then return end
		warnElectricalShock:Show(args.destName, amount)
		if amount >= 12 then
			if args:IsPlayer() then
				specWarnElectricalShock:Show(amount)
			else
				if not UnitDebuff("player", GetSpellInfo(136914)) and not UnitIsDeadOrGhost("player") then
					specWarnElectricalShockOther:Show(args.destName)
					if mod:IsTank() then
						sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\changemt.mp3") --換坦嘲諷
					end
				end
			end
		end
	elseif args.spellId == 137176 and self:AntiSpam(3, 5) and args:IsPlayer() then
		specWarnOverloadedCircuits:Show()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 135991 then
		warnDiffusionChain:Show(args.destName)
		specWarnDiffusionChain:Show(args.destName)
		if not intermissionActive then
			timerDiffusionChainCD:Start()
		end
	elseif args.spellId == 136543 and self:AntiSpam(2, 1) then
		warnSummonBallLightning:Show()
		specWarnSummonBallLightning:Show()
		if self.Options.RangeFrame then
			if self:IsDifficulty("heroic10", "heroic25") then
				DBM.RangeCheck:Show(3)
			end
		end
		if phase < 3 then
			self:Schedule(35, function()
				DBM.RangeCheck:Show(6)
			end)
			lightp2count = lightp2count + 1
			timerSummonBallLightningCD:Start()
			sndWOP:Schedule(40, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_wmdq.mp3") --5秒後電球
		else
			self:Schedule(20, function()
				DBM.RangeCheck:Show(6)
			end)
			lightp3count = lightp3count + 1
			timerSummonBallLightningCD:Start(30)
			sndWOP:Schedule(25, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_wmdq.mp3") --5秒後電球
		end
	end
end


function mod:SPELL_AURA_REMOVED(args)
	--Conduit deactivations
	if args.spellId == 135680 and args:GetDestCreatureID() == 68397 and not intermissionActive then--North (Static Shock)
		timerStaticShockCD:Cancel()
	elseif args.spellId == 135681 and args:GetDestCreatureID() == 68397 and not intermissionActive then--East (Diffusion Chain)
		timerDiffusionChainCD:Cancel()
		if self.Options.RangeFrame and self:IsRanged() then--Shouldn't target melee during a normal pillar, only during intermission when all melee are with ranged and out of melee range of boss
			if phase == 1 then
				DBM.RangeCheck:Hide()
			else
				DBM.RangeCheck:Show(6)--Switch back to Summon Lightning Orb spell range
			end
		end
	elseif args.spellId == 135682 and args:GetDestCreatureID() == 68397 and not intermissionActive then--South (Overcharge)
		timerOverchargeCD:Cancel()
	elseif args.spellId == 135683 and args:GetDestCreatureID() == 68397 and not intermissionActive then--West (Bouncing Bolt)
		timerBouncingBoltCD:Cancel()
	--Conduit deactivations
	--BH MODIFY
	elseif args.spellId == 135695 then
		if self.Options.SetIconOnStaticShock then
			self:SetIcon(args.destName, 0)
		end
		if StaticShockMarkers[args.destName] then
			StaticShockMarkers[args.destName] = free(StaticShockMarkers[args.destName])
			StaticShockMarkers[args.destName.."Edge"] = free(StaticShockMarkers[args.destName.."Edge"])
		end
		if canceledshock[args.destName] then
			canceledshock[args.destName] = free(canceledshock[args.destName])
		end
	elseif args.spellId == 136295 then
		if self.Options.SetIconOnOvercharge then
			self:SetIcon(args.destName, 0)
		end
		if OverchargedMarkers[args.destName] then
			OverchargedMarkers[args.destName] = free(OverchargedMarkers[args.destName])
			OverchargedMarkers[args.destName.."Edge"] = free(OverchargedMarkers[args.destName.."Edge"])
		end
	elseif args.spellId == 139011 then --聖令
		timerHelmofCommand:Cancel(args.destName)
	--BH MODIFY END
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 135150 and destGUID == UnitGUID("player") and self:AntiSpam(3, 4) then
		specWarnCrashingThunder:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 135153 and destGUID == UnitGUID("player") and self:AntiSpam(3, 4) then
		specWarnCrashingThunder:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, _, _, _, target)
	if msg:find("spell:137176") then--Overloaded Circuits (Intermission ending and next phase beginning)
		intermissionActive = false
		phase = phase + 1
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		timerHelmofCommandCD:Cancel()
		--"<174.8 20:38:26> [CHAT_MSG_RAID_BOSS_EMOTE] CHAT_MSG_RAID_BOSS_EMOTE#|TInterface\\Icons\\spell_nature_unrelentingstorm.blp:20|t The |cFFFF0000|Hspell:135683|h[West Conduit]|h|r has burned out and caused |cFFFF0000|Hspell:137176|h[Overloaded Circuits]|h|r!#Bouncing Bolt Conduit
		if msg:find("spell:135680") then--North (Static Shock)
			northDestroyed = true
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_jdsh.mp3") --靜電震擊損毀
		elseif msg:find("spell:135681") then--East (Diffusion Chain)
			eastDestroyed = true
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_sssh.mp3") --散射電練損毀
		elseif msg:find("spell:135682") then--South (Overcharge)
			southDestroyed = true
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_czsh.mp3") --電能超載損毀
		elseif msg:find("spell:135683") then--West (Bouncing Bolt)
			westDestroyed = true
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_ttsh.mp3") --彈跳閃電損毀
		end
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ptwo.mp3")
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\pthree.mp3")
		if phase == 2 then--Start Phase 2 timers
			warnPhase2:Show()
			lightp2count = 0
			timerSummonBallLightningCD:Start(15)
			sndWOP:Schedule(10, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_wmdq.mp3") --5秒後電球
			timerLightningWhipCD:Start(30)
			timerFussionSlashCD:Start(44)
			if self.Options.RangeFrame and self:IsRanged() then--Only ranged need it in phase 2 and 3
				DBM.RangeCheck:Show(6)--Needed for phase 2 AND phase 3
			end
		elseif phase == 3 then--Start Phase 3 timers
			warnPhase3:Show()
			lightp3count = 0
			timerViolentGaleWindsCD:Start(20)
			sndWOP:Schedule(17, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_qfzb.mp3") --強風準備
			timerLightningWhipCD:Start(21.5)
			timerThunderstruckCD:Start(36)
			timerSummonBallLightningCD:Start(41.5)
			sndWOP:Schedule(36, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_wmdq.mp3") --5秒後電球
		end
	end
end

function mod:CHAT_MSG_SAY(msg, sender)
	if checkmsg == "" then return end
	if msg:find(checkmsg) then
		if StaticShockMarkers[sender] and not canceledshock[sender] then
			StaticShockMarkers[sender] = free(StaticShockMarkers[sender])
			StaticShockMarkers[sender.."Edge"] = free(StaticShockMarkers[sender.."Edge"])
			StaticShockMarkers[sender] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("highlight", sender, 8, 8, 1, 1, 1, 0.8):Appear():RegisterForAlerts())
			if sender ~= UnitName("player") then
				canceledshock[sender] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("cross2", sender, 8, 8, 1, 1, 1, 1))
			end
		end
	end
end

local function LoopIntermission()
	if not southDestroyed then
		timerOverchargeCD:Start(6.5)
	end
	if not eastDestroyed then
		timerDiffusionChainCD:Start(8)
		sndWOP:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\scattersoon.mp3")--注意分散
	end
	if not westDestroyed then
		warnBouncingBolt:Schedule(15)
		specWarnBouncingBolt:Schedule(15)
		timerBouncingBoltCD:Start(15)
		sndWOP:Schedule(15, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_fscq.mp3")
	end
	if not northDestroyed then
		timerStaticShockCD:Start(16)
	end
end

function mod:UNIT_HEALTH_FREQUENT(uId)
	if UnitName(uId) == L.name then
		local hp = UnitHealth(uId) / UnitHealthMax(uId) * 100
		if hp > 65 and hp < 66.5 and warnedCount == 0 then
			warnedCount = 1
			specWarnIntermissionSoon:Show()
		elseif hp > 30 and hp < 31.5 and warnedCount == 1 then
			warnedCount = 2
			specWarnIntermissionSoon:Show()
			self:UnregisterShortTermEvents()
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 137146 and self:AntiSpam(2, 2) then--Supercharge Conduits (comes earlier than other events so we use this one)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_cjcn.mp3") --超級充能		
		intermissionActive = true
		stormcount = 0
		timerThunderstruckCD:Cancel()
		timerDecapitateCD:Cancel()
		timerFussionSlashCD:Cancel()
		timerLightningWhipCD:Cancel()
		timerSummonBallLightningCD:Cancel()
		if self:IsDifficulty("heroic10", "heroic25") then
			timerHelmofCommandCD:Start(13.5)
		end
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_wmdq.mp3")
		if phase == 1 then
			sndWOP:Schedule(45, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ptwo.mp3")--2階段準備
		elseif phase == 2 then
			sndWOP:Schedule(45, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\pthree.mp3")--3階段準備
		end
		timerSuperChargedConduits:Start()
		timerStaticShockCD:Cancel()
		timerDiffusionChainCD:Cancel()
		timerOverchargeCD:Cancel()
		timerBouncingBoltCD:Cancel()
		if not eastDestroyed then
			timerDiffusionChainCD:Start(6)
			sndWOP:Schedule(3, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\scattersoon.mp3")--注意分散
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(8)
			end
		end
		if not southDestroyed then
			timerOverchargeCD:Start(6)
		end
		if not westDestroyed then
			warnBouncingBolt:Schedule(14)
			specWarnBouncingBolt:Schedule(14)
			sndWOP:Schedule(14, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_fscq.mp3")
			timerBouncingBoltCD:Start(14)
		end
		if not northDestroyed then
			timerStaticShockCD:Start(19)
		end
		self:Schedule(23, LoopIntermission)--Fire function to start second wave of specials timers
	elseif spellId == 136395 and self:AntiSpam(2, 3) and not intermissionActive then--Bouncing Bolt (During intermission phases, it fires randomly, use scheduler and filter this :\)
		warnBouncingBolt:Show()
		specWarnBouncingBolt:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_fscq.mp3")
		timerBouncingBoltCD:Start()
	elseif spellId == 136869 and self:AntiSpam(2, 4) then--Violent Gale Winds
		warnViolentGaleWinds:Show()
		timerViolentGaleWinds:Start()
		timerViolentGaleWindsCD:Start()
		sndWOP:Schedule(27, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_qfzb.mp3") --強風準備
	end
end