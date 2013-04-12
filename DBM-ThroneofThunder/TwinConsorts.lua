local mod	= DBM:NewMod(829, "DBM-ThroneofThunder", nil, 362)
local L		= mod:GetLocalizedStrings()
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)
local sndWOPCX	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 9264 $"):sub(12, -3))
mod:SetCreatureID(68905, 68904)--Lu'lin 68905, Suen 68904
mod:SetModelID(46975)--Lu'lin, 46974 Suen

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_DAMAGE",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS",
	"SPELL_PERIODIC_DAMAGE",
	"SPELL_PERIODIC_MISSED",
	"SPELL_SUMMON",
	"CHAT_MSG_MONSTER_YELL",
	"UNIT_DIED",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local Lulin = EJ_GetSectionInfo(7629)
local Suen = EJ_GetSectionInfo(7642)

mod:SetBossHealthInfo(
	68905, Lulin,
	68904, Suen
)

--Darkness
local warnNight							= mod:NewAnnounce("warnNight", 1, 108558)
local warnCrashingStarSoon				= mod:NewSoonAnnounce(137129, 2)
local warnTearsOfSun					= mod:NewSpellAnnounce(137404, 3)
local warnBeastOfNightmares				= mod:NewTargetAnnounce(137375, 3, nil, mod:IsTank() or mod:IsHealer())
--Light
local warnDay							= mod:NewAnnounce("warnDay", 1, 122789)
local warnLightOfDay					= mod:NewSpellAnnounce(137403, 2, nil, false)--Spammy, but leave it as an option at least
local warnFanOfFlames					= mod:NewStackAnnounce(137408, 2, nil, mod:IsTank() or mod:IsHealer())
local warnFlamesOfPassion				= mod:NewSpellAnnounce(137414, 3)--Todo, check target scanning
local warnIceComet						= mod:NewSpellAnnounce(137419, 2)
local warnNuclearInferno				= mod:NewCastAnnounce(137491, 4)--Heroic
--Dusk
local warnDusk							= mod:NewAnnounce("warnDusk", 1, "Interface\\Icons\\achievement_zone_easternplaguelands")--"achievement_zone_easternplaguelands" (best Dusk icon i could find)
local warnTidalForce					= mod:NewCastAnnounce(137531, 3)

--Darkness
local specWarnCrashingStarSoon			= mod:NewSpecialWarningSoon(137129, false, nil, nil, 2)
local specWarnTearsOfSun				= mod:NewSpecialWarningSpell(137404, nil, nil, nil, 2)
local specWarnBeastOfNightmares			= mod:NewSpecialWarningSpell(137375, mod:IsTank())
--Light
local specWarnFanOfFlames				= mod:NewSpecialWarningStack(137408, mod:IsTank(), 2)
local specWarnFanOfFlamesOther			= mod:NewSpecialWarningTarget(137408, mod:IsTank())
local specWarnFlamesofPassionMove		= mod:NewSpecialWarningMove(137417)
local specWarnIceComet					= mod:NewSpecialWarningSpell(137419, false)
local specWarnNuclearInferno			= mod:NewSpecialWarningSpell(137491, nil, nil, nil, 2)--Heroic
--Dusk
local specWarnTidalForce				= mod:NewSpecialWarningSpell(137531, nil, nil, nil, 2)--Maybe switch to a stop dps warning, or a switch to Suen?

local specWarnTT1						= mod:NewSpecialWarningSpell(138300)
local specWarnTT2						= mod:NewSpecialWarningSpell(138855)
local specWarnTT3						= mod:NewSpecialWarningSpell(138306)


--Darkness
--Light of Day (137403) has a HIGHLY variable cd variation, every 6-14 seconds. Not to mention it requires using SPELL_DAMAGE and SPELL_MISSED. for now i'm excluding it on purpose
local timerDayCD						= mod:NewTimer(183, "timerDayCD", 122789) -- timer is 183 or 190 (confirmed in 10 man. variable)
local timerCrashingStar					= mod:NewNextTimer(5.5, 137129)
--local timerCosmicBarrageCD				= mod:NewCDTimer(22, 136752)--Very high variation. (22~38s) Changed to Crashing Star stuff.
local timerTearsOfTheSunCD				= mod:NewCDTimer(41, 137404)
local timerTearsOfTheSun				= mod:NewBuffActiveTimer(10, 137404)
local timerBeastOfNightmaresCD			= mod:NewCDTimer(51, 137375)
--Light
local timerDuskCD						= mod:NewTimer(360, "timerDuskCD", "Interface\\Icons\\achievement_zone_easternplaguelands")--it seems always 360s after combat entered. (day timer is variables, so not reliable to day phase)
local timerLightOfDayCD					= mod:NewCDTimer(6, 137403, nil, false)--Trackable in day phase using UNIT event since boss1 can be used in this phase. Might be useful for heroic to not run behind in shadows too early preparing for a special
local timerFanOfFlamesCD				= mod:NewNextTimer(12, 137408, nil, mod:IsTank() or mod:IsHealer())
local timerFanOfFlames					= mod:NewTargetTimer(30, 137408, nil, mod:IsTank())
--local timerFlamesOfPassionCD			= mod:NewCDTimer(30, 137414)--Also very high variation. (31~65). Can be confuse, no use.
local timerIceCometCD					= mod:NewCDTimer(20.5, 137419)--Every 20.5-25 seconds on normal. On 10 heroic, variables 20.5~41s. Maybe 25 heroic same?
local timerNuclearInfernoCD				= mod:NewCDTimer(49.5, 137491)
--Dusk
local timerTidalForce					= mod:NewBuffActiveTimer(18 ,137531)
local timerTidalForceCD					= mod:NewCDTimer(74, 137531)

local timerTT1CD						= mod:NewCDTimer(300, 138254)
local timerTT2CD						= mod:NewCDTimer(300, 123904)
local timerTT3CD						= mod:NewCDTimer(300, 138267)
local timerTT4CD						= mod:NewCDTimer(300, 138189)

local berserkTimer						= mod:NewBerserkTimer(600)

mod:AddBoolOption("RangeFrame")--For various abilities that target even melee. UPDATE, cosmic barrage (worst of the 3 abilities) no longer target melee. However, light of day and tears of teh sun still do. melee want to split into 2-3 groups (depending on how many) but no longer have to stupidly spread about all crazy and out of range of boss during cosmic barrage to avoid dying. On that note, MAYBE change this to ranged default instead of all.
local phase3Started = false

mod:AddBoolOption("HudMAP", true, "sound")
mod:AddBoolOption("HudMAP2", true, "sound")

local DBMHudMap = DBMHudMap
local free = DBMHudMap.free
local function register(e)	
	DBMHudMap:RegisterEncounterMarker(e)
	return e
end
local lightmaker = {}
local CBMarkers = {}

function mod:OnCombatStart(delay)
	phase3Started = false
	table.wipe(lightmaker)
	table.wipe(CBMarkers)
	berserkTimer:Start(-delay)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(8)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.HudMAP or self.Options.HudMAP2 then
		DBMHudMap:FreeEncounterMarkers()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 137491 then
		self:SendSync("Inferno")
	elseif args.spellId == 137531 then
		self:SendSync("TidalForce")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 136752 then
		self:SendSync("CosmicBarrage")
	elseif args.spellId == 137404 then
		warnTearsOfSun:Show()
		specWarnTearsOfSun:Show()
		timerTearsOfTheSun:Start()
		if timerDayCD:GetTime() < 145 then
			timerTearsOfTheSunCD:Start()
		end
	elseif args.spellId == 137375 then
		warnBeastOfNightmares:Show(args.destName)
		specWarnBeastOfNightmares:Show()
		if args:IsPlayer() or mod:IsHealer() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_mys.mp3") --夢魘獸出現
		else
			if not UnitDebuff("player", GetSpellInfo(137375)) and not UnitIsDeadOrGhost("player") then
				if mod:IsTank() then
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\changemt.mp3") --換坦嘲諷
				end
			end
		end
		if timerDayCD:GetTime() < 135 then
			timerBeastOfNightmaresCD:Start()
		end
	elseif args.spellId == 137408 then
		local amount = args.amount or 1
		warnFanOfFlames:Show(args.destName, amount)
		timerFanOfFlames:Start(args.destName)
		timerFanOfFlamesCD:Start()
		if args:IsPlayer() then
			if amount >= 2 then
				specWarnFanOfFlames:Show(amount)
			end
		else
			if amount >= 2 and not UnitDebuff("player", GetSpellInfo(137408)) and not UnitIsDeadOrGhost("player") then
				specWarnFanOfFlamesOther:Show(args.destName)
				if mod:IsTank() then
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\changemt.mp3") --換坦嘲諷
				end
			end
		end
	elseif args.spellId == 137417 and args:IsPlayer() and self:AntiSpam(3, 4) then
		specWarnFlamesofPassionMove:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	elseif args.spellId == 138264 and args:IsPlayer() then  --白虎
		if self.Options.HudMAP then
			lightmaker["1"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,705,352,731,381))
			lightmaker["2"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,731,381,709,377))
			lightmaker["3"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,709,377,686,373))
			lightmaker["4"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,686,373,712,398))
			lightmaker["5"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,712,398,709,376))
			lightmaker["6"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,709,376,705,354))
		end
	elseif args.spellId == 138267 and args:IsPlayer() then  --青龍
		if self.Options.HudMAP then
			lightmaker["1"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,693,393,686,371))
			lightmaker["2"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,686,371,710,377))
			lightmaker["3"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,710,377,704,353))
			lightmaker["4"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,704,353,725,361))
		end
	elseif args.spellId == 138254 and args:IsPlayer() then  --玄牛
		if self.Options.HudMAP then
			lightmaker["1"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,713,401,709,376))
			lightmaker["2"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,709,376,705,352))
			lightmaker["3"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,705,352,688,370))
			lightmaker["4"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,688,370,709,376))
			lightmaker["5"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,709,376,732,383))
		end
	elseif args.spellId == 138189 and args:IsPlayer() then  --红鹤
		if self.Options.HudMAP then
			lightmaker["1"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,733,382,705,353))
			lightmaker["2"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,705,353,687,371))
			lightmaker["3"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,687,371,709,377))
			lightmaker["4"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,709,377,732,383))
			lightmaker["5"] = register(DBMHudMap:AddEdge(1, 1, 1, 1, nil, nil, nil,732,383,713,401))
		end		
	elseif args.spellId == 138300 and self:AntiSpam(40, 10) then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xntt.mp3")--玄牛圖騰
		specWarnTT1:Show()
		timerTT1CD:Start()
	elseif args.spellId == 138855 and self:AntiSpam(40, 11) then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bhtt.mp3")--白虎圖騰
		specWarnTT2:Show()
		timerTT2CD:Start()
	elseif args.spellId == 138306 and self:AntiSpam(40, 12) then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_yjtt.mp3")--玉蛟圖騰
		specWarnTT3:Show()
		timerTT3CD:Start()
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 137408 then
		timerFanOfFlames:Cancel(args.destName)
	elseif args.spellId == 138264 and args:IsPlayer() then
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
			table.wipe(lightmaker)
		end
	elseif args.spellId == 138267 and args:IsPlayer() then
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
			table.wipe(lightmaker)
		end
	elseif args.spellId == 138254 and args:IsPlayer() then
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
			table.wipe(lightmaker)
		end
	elseif args.spellId == 138189 and args:IsPlayer() then
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
			table.wipe(lightmaker)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 137414 then
		warnFlamesOfPassion:Show()
		--timerFlamesOfPassionCD:Start()
	end
end

function mod:SPELL_SUMMON(args)
	if args.spellId == 137419 then
		warnIceComet:Show()
		specWarnIceComet:Show()
		timerIceCometCD:Start()
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, _, _, _, _, spellId)
	if spellId == 138318 and self:AntiSpam(40, 13) then
		timerTT4CD:Start()
	end
end


--"<333.5 18:37:56> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#Lu'lin! Lend me your strength!#Suen#####0#0##0#247#nil#0#false#false", -- [71265]
--"<339.3 18:38:02> [INSTANCE_ENCOUNTER_ENGAGE_UNIT] Fake Args:#1#1#Suen#0xF1310D2800005863#worldboss#410952978#nil#1#Unknown#0xF1310D2900005864#worldboss#310232488
function mod:CHAT_MSG_MONSTER_YELL(msg) -- Switch to yell. INSTANCE_ENCOUNTER_ENGAGE_UNIT fires too late. also yell ranage covers all rooms. Not need sync.
	if (msg == L.DuskPhase or msg:find(L.DuskPhase)) then
		self:SendSync("Phase3Yell")
	end
end

function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT(event) -- still remains backup trigger for phase3.
	if UnitExists("boss2") and tonumber(UnitGUID("boss2"):sub(6, 10), 16) == 68905 then--Make sure we don't trigger it off another engage such as wipe engage event
		self:SendSync("Phase3")
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 68905 then--Lu'lin
		--timerCosmicBarrageCD:Cancel()
		timerTidalForceCD:Cancel()
		timerLightOfDayCD:Start()
		timerFanOfFlamesCD:Start(19)
		--She also does Flames of passion, but this is done 3 seconds after Lu'lin dies, is a 3 second timer worth it?
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
	elseif cid == 68904 then--Suen
		--timerFlamesOfPassionCD:Cancel()
		--timerBeastOfNightmaresCD:Start()--My group kills Lu'lin first. Need log of Suen being killed first to get first beast timer value
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 137105 and self:AntiSpam(2, 1) then--Suen Ports away (Night Phase)
		timerLightOfDayCD:Cancel()
		timerFanOfFlamesCD:Cancel()
		--timerFlamesOfPassionCD:Cancel()
		warnNight:Show()
		sndWOP:Schedule(180, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_mop_btzb.mp3")--白天準備
		sndWOP:Schedule(181, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
		sndWOP:Schedule(182, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
		sndWOP:Schedule(183, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		timerDayCD:Start()
		timerDuskCD:Start()
		--timerCosmicBarrageCD:Start(17)
		timerTearsOfTheSunCD:Start(28.5)
		timerBeastOfNightmaresCD:Start()
	elseif spellId == 137187 and self:AntiSpam(2, 2) then--Lu'lin Ports away (Day Phase)
		self:SendSync("Phase2")
	elseif spellId == 138823 and self:AntiSpam(2, 3) then
		warnLightOfDay:Show()
		timerLightOfDayCD:Start()
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 137417 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnFlamesofPassionMove:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:OnSync(msg)
	if msg == "Phase2" then
		--timerCosmicBarrageCD:Cancel()
		timerTearsOfTheSunCD:Cancel()
		timerBeastOfNightmaresCD:Cancel()
		warnDay:Show()
		timerLightOfDayCD:Start()
		timerIceCometCD:Start()
		timerFanOfFlamesCD:Start()
		--timerFlamesOfPassionCD:Start(12.5)
		if self:IsDifficulty("heroic10", "heroic25") then
			timerNuclearInfernoCD:Start(50)
		end
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_mop_btzb.mp3")
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
		sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bzjd.mp3")--白晝開始
		self:RegisterShortTermEvents(
			"INSTANCE_ENCOUNTER_ENGAGE_UNIT"
		)
	elseif msg == "Phase3Yell" and not phase3Started then -- Split from phase3 sync to prevent who running older version not to show bad timers.
		phase3Started = true
		warnDusk:Show()
		timerIceCometCD:Start(17)--This seems to reset, despite what last CD was (this can be a bad thing if it was do any second)
		timerTidalForceCD:Start(26)
		--timerCosmicBarrageCD:Start(54)
		sndWOP:Schedule(2, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hhzb.mp3")--黃昏準備
		sndWOP:Schedule(3, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
		sndWOP:Schedule(4, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
		sndWOP:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		sndWOP:Schedule(6, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hhjd.mp3") --黃昏開始
		self:Schedule(20, function()
			if UnitAura("player", GetSpellInfo(138264)) then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_kkbh.mp3")--快開白虎
			else
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_cxzb.mp3") --潮汐準備
			end
			sndWOPCX:Schedule(1, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOPCX:Schedule(2, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
			sndWOPCX:Schedule(3, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOPCX:Schedule(4, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOPCX:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		end)
	elseif msg == "Phase3" then
		self:UnregisterShortTermEvents()
		timerFanOfFlamesCD:Cancel()--DO NOT CANCEL THIS ON YELL
	--[[if not phase3Started then
			warnDusk:Show()
			phase3Started = true
			timerIceCometCD:Start(11)--This seems to reset, despite what last CD was (this can be a bad thing if it was do any second)
			timerTidalForceCD:Start(20)
			--timerCosmicBarrageCD:Start(48)
		end]]
	elseif msg == "TidalForce" then
		warnTidalForce:Show()
		specWarnTidalForce:Show()
		timerTidalForce:Start()
		timerTidalForceCD:Start()
		sndWOPCX:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
		sndWOPCX:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
		sndWOPCX:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
		sndWOPCX:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
		sndWOPCX:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_cxzl.mp3") --潮汐之力
	elseif msg == "CosmicBarrage" then
		warnCrashingStarSoon:Show()
		specWarnCrashingStarSoon:Show()
		timerCrashingStar:Start()
		--if timerDayCD:GetTime() < 165 then
			--timerCosmicBarrageCD:Start()
		--end
		if mod:IsRanged() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\scattersoon.mp3")--注意分散
		else
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xzzb.mp3")--星宙准备
		end
		sndWOP:Schedule(1.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")
		sndWOP:Schedule(2.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
		sndWOP:Schedule(3.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
		sndWOP:Schedule(4.5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
	elseif msg == "Inferno" then
		warnNuclearInferno:Show()
		specWarnNuclearInferno:Show()
		timerNuclearInfernoCD:Start()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hzly.mp3") --核子煉獄
	end
end