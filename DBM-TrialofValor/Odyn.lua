local mod	= DBM:NewMod(1819, "DBM-TrialofValor", nil, 861)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 15390 $"):sub(12, -3))
mod:SetCreatureID(116760, 116761, 116830)--116760 (114263) Odyn, 116761 Hymdall, 116830 Hyrja
mod:SetEncounterID(1958)
mod:SetZone()
mod:SetBossHPInfoToHighest()
mod:SetUsedIcons(1)
--mod:SetHotfixNoticeRev(14922)
mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 228003 228012 228171 231013",
	"SPELL_CAST_SUCCESS 228012 228028 228162",
	"SPELL_AURA_APPLIED 228029 227807 227959 227626 228918 227490 227491 227498 227499 227500",
	"SPELL_AURA_APPLIED_DOSE 227626",
	"SPELL_AURA_REMOVED 228029 227807 227959 227490 227491 227498 227499 227500",
	"SPELL_PERIODIC_DAMAGE 228007 228683",
	"SPELL_PERIODIC_MISSED 228007 228683",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED boss1 boss2 boss3"
)

--TODO, phase 3 storms (area of affect). not in combat log or even transcriptor. appears every 30 seconds give or take. verify in more attempts and add scheduler for it
--TODO, Cleansing flame timers/target announces?
--Stage 1: Halls of Valor was merely a set back
local warnDancingBlade				= mod:NewCountAnnounce(228003, 3)--Change if target scanning works, but considering it doesn't in 5 man version of this spell, omitting for now
local warnRevivify					= mod:NewCastAnnounce(228171, 4)
local warnExpelLight				= mod:NewTargetAnnounce(228028, 3)
local warnShieldofLight				= mod:NewTargetAnnounce(228270, 3)
--Stage 2: Stuff
local warnPhase2					= mod:NewPhaseAnnounce(2, 2)
--Stage 3: Odyn immitates lei shen
local warnStormofJustice			= mod:NewTargetAnnounce(227807, 3)

--Stage 1: Halls of Valor was merely a set back
local specWarnDancingBlade			= mod:NewSpecialWarningMove(228003, nil, nil, nil, 1, 2)
--local yellDancingBlade			= mod:NewYell(228003)
local specWarnHornOfValor			= mod:NewSpecialWarningMoveAway(228012, nil, nil, nil, 1, 2)
local specWarnExpelLight			= mod:NewSpecialWarningMoveAway(228028, nil, nil, nil, 1, 2)
local yellExpelLight				= mod:NewYell(228028)
local specWarnShieldofLight			= mod:NewSpecialWarningYou(228270, nil, nil, nil, 1, 2)
local yellShieldofLightFades		= mod:NewFadesYell(228270)
local specWarnDrawPower				= mod:NewSpecialWarningMoveTo(227503, nil, nil, nil, 2, 6)
--Stage 2: Odyn immitates margok
local specWarnOdynsTest				= mod:NewSpecialWarningCount(227626, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.stack:format(5, 159515))
local specWarnOdynsTestOther		= mod:NewSpecialWarningTaunt(227626, nil, nil, nil, 1, 2)
local specWarnShatterSpears			= mod:NewSpecialWarningDodge(231013, nil, nil, nil, 2, 2)

--Stage 3: Odyn immitates lei shen
local specWarnStormofJustice		= mod:NewSpecialWarningMoveAway(227807, nil, nil, nil, 1, 2)
local yellStormofJustice			= mod:NewYell(227807)
local specWarnStormforgedSpear		= mod:NewSpecialWarningRun(228918, nil, nil, nil, 4, 2)
local specWarnStormforgedSpearOther	= mod:NewSpecialWarningTaunt(228918, nil, nil, nil, 1, 2)
local specWarnCleansingFlame		= mod:NewSpecialWarningMove(228683, nil, nil, nil, 1, 2)

--Stage 1: Halls of Valor was merely a set back
local timerDancingBladeCD			= mod:NewCDTimer(31, 228003, nil, nil, nil, 3)--Alternating two times
local timerHornOfValorCD			= mod:NewCDTimer(32, 228012, nil, nil, nil, 2)--Alternating two times
local timerExpelLightCD				= mod:NewCDTimer(32, 228028, nil, nil, nil, 3)--Alternating two times
local timerShieldofLightCD			= mod:NewCDTimer(32, 228270, nil, nil, nil, 3)--Alternating two times
local timerDrawPowerCD				= mod:NewNextTimer(70, 227503, nil, nil, nil, 6)
local timerDrawPower				= mod:NewCastTimer(30, 227629, nil, nil, nil, 2, nil, DBM_CORE_DEADLY_ICON)
--Stage 2: Odyn immitates margok
local timerSpearCD					= mod:NewNextTimer(10, 227697, nil, nil, nil, 3)
local timerShatterSpearsCD			= mod:NewCDTimer(40, 231013, nil, nil, nil, 2)
--Stage 3: Odyn immitates lei shen
local timerStormOfJusticeCD			= mod:NewNextTimer(10.9, 227807, nil, nil, nil, 3)
local timerStormforgedSpearCD		= mod:NewNextTimer(10.9, 228918, nil, "Tank|Healer", nil, 5, nil, DBM_CORE_TANK_ICON..DBM_CORE_DEADLY_ICON)

--local berserkTimer				= mod:NewBerserkTimer(300)

--Stage 1: Halls of Valor was merely a set back
local countdownDrawPower			= mod:NewCountdown(30, 227629)

--Stage 1: Halls of Valor was merely a set back
local voiceDancingBlade				= mod:NewVoice(228003)--runaway
local voiceHornOfValor				= mod:NewVoice(228012)--scatter
local voiceExpelLight				= mod:NewVoice(228028)--runout
local voiceShieldofLight			= mod:NewVoice(228270)--targetyou
local voiceDrawPower				= mod:NewVoice(227503)--locations
--Stage 2: Odyn immitates margok
local voiceOdynsTest				= mod:NewVoice(227626)--changemt
local voiceShatterSpears			= mod:NewVoice(231013)--watchorb
--Stage 3: Odyn immitates lei shen
local voiceStormofJustice			= mod:NewVoice(227807)--runout
local voiceStormforgedSpear			= mod:NewVoice(228918)--justrun
local voiceCleansingFlame			= mod:NewVoice(228683)--runaway

mod:AddSetIconOption("SetIconOnShield", 228270, true)
--mod:AddInfoFrameOption(198108, false)
mod:AddRangeFrameOption("5/8")

mod.vb.phase = 1
mod.vb.hornCasting = false
mod.vb.hornCast = 0
mod.vb.shieldCast = 0
mod.vb.expelLightCast = 0
mod.vb.dancingBladeCast = 0

local expelLight, stormOfJustice = GetSpellInfo(228028), GetSpellInfo(227807)
local function updateRangeFrame(self)
	if not self.Options.RangeFrame then return end
	if UnitDebuff("player", expelLight) or UnitDebuff("player", stormOfJustice) then
		DBM.RangeCheck:Show(8)
	elseif self.vb.hornCasting then--Spread for Horn of Valor
		DBM.RangeCheck:Show(5)
	else
		DBM.RangeCheck:Hide()
	end
end

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	self.vb.hornCasting = false
	self.vb.hornCast = 0
	self.vb.shieldCast = 0
	self.vb.expelLightCast = 0
	self.vb.dancingBladeCast = 0
	timerHornOfValorCD:Start(8-delay)
	if not self:IsLFR() then
		timerDancingBladeCD:Start(16-delay)
		timerShieldofLightCD:Start(23-delay)
		timerExpelLightCD:Start(32-delay)
		timerDrawPowerCD:Start(40-delay)
	else
		timerDancingBladeCD:Start(20-delay)
		timerShieldofLightCD:Start(30-delay)
		timerExpelLightCD:Start(40-delay)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 228003 then
		self.vb.dancingBladeCast = self.vb.dancingBladeCast + 1
		warnDancingBlade:Show(self.vb.dancingBladeCast)
		if self:IsLFR() then
			if self.vb.dancingBladeCast == 1 or self.vb.dancingBladeCast == 5 or self.vb.dancingBladeCast == 9 then
				timerDancingBladeCD:Start(30)
			else
				timerDancingBladeCD:Start(20)
			end
		else
			if self.vb.dancingBladeCast % 2 == 0 then
				timerDancingBladeCD:Start(39)
			else
				timerDancingBladeCD:Start(31)
			end
		end
	elseif spellId == 228012 then
		self.vb.hornCasting = true
		self.vb.hornCast = self.vb.hornCast + 1
		specWarnHornOfValor:Show()
		voiceHornOfValor:Play("scatter")
		if self.vb.phase == 1 then
			if self:IsLFR() then
				if self.vb.hornCast % 2 == 0 then
					--timerHornOfValorCD:Start(43)--More data needed. Probably has an alternation
				else
					timerHornOfValorCD:Start(70)
				end
			else
				if self.vb.hornCast % 2 == 0 then
					timerHornOfValorCD:Start(43)
				else
					timerHornOfValorCD:Start(27)
				end
			end
		else
			timerHornOfValorCD:Start(21)--Unknown but def shorter than 27
		end
		updateRangeFrame(self)
	elseif spellId == 228171 and self:AntiSpam(2, 2) then
		warnRevivify:Show()
	elseif spellId == 231013 then
		specWarnShatterSpears:Show()
		voiceShatterSpears:Play("watchorb")
		--timerShatterSpearsCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 228012 then
		self.vb.hornCasting = false
		updateRangeFrame(self)
	elseif spellId == 228028 then
		self.vb.expelLightCast = self.vb.expelLightCast + 1
		if self:IsLFR() then
			if self.vb.expelLightCast % 2 == 0 then
				timerExpelLightCD:Start(50)
			else
				timerExpelLightCD:Start(20)
			end
		else
			if self.vb.expelLightCast % 2 == 0 then
				timerExpelLightCD:Start(38)
			else
				timerExpelLightCD:Start(32)
			end
		end
	elseif spellId == 228162 then--Cast finished, cleanup icons
		if self.Options.SetIconOnShield then
			self:SetIcon(args.destName, 0)
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 228029 then
		warnExpelLight:CombinedShow(0.3, args.destName)--TODO: Confirm can be more than one target
		if args:IsPlayer() then
			specWarnExpelLight:Show()
			voiceExpelLight:Play("runout")
			yellExpelLight:Yell()
			updateRangeFrame(self)
		end
	elseif spellId == 227807 or spellId == 227959 then--Add and non add version
		warnStormofJustice:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnStormofJustice:Show()
			voiceStormofJustice:Play("runout")
			yellStormofJustice:Yell()
			updateRangeFrame(self)
		end
	elseif spellId == 227626 then
		local amount = args.amount or 1
		if (amount == 5 or amount >= 9) and not self.vb.noTaunt and self:AntiSpam(3, 3) then--First warning at 5, then a decent amount of time until 8. then spam every 3 seconds at 8 and above.
			local tanking, status = UnitDetailedThreatSituation("player", "boss1")
			if tanking or (status == 3) then
				specWarnOdynsTest:Show(amount)
			else
				specWarnOdynsTestOther:Show(L.name)
			end
			voiceOdynsTest:Play("changemt")
		end
	elseif spellId == 228918 then
		timerStormforgedSpearCD:Start()--If this can miss, move it to a success event.
		if args:IsPlayer() then
			specWarnStormforgedSpear:Show()
			voiceStormforgedSpear:Play("justrun")
		else
			specWarnStormforgedSpearOther:Show(args.destName)
			voiceStormforgedSpear:Play("tauntboss")
		end
	elseif spellId == 227490 or spellId == 227491 or spellId == 227498 or spellId == 227499 or spellId == 227500 then--Branded (Draw Power Runes)
		if spellId == 227490 and args:IsPlayer() then--Purple K (NE)
			specWarnDrawPower:Show("|TInterface\\Icons\\Boss_OdunRunes_Purple.blp:12:12|tNE|TInterface\\Icons\\Boss_OdunRunes_Purple.blp:12:12|t")
			voiceDrawPower:Play("frontright")
		elseif spellId == 227491 and args:IsPlayer() then--Orange N (SE)
			specWarnDrawPower:Show("|TInterface\\Icons\\Boss_OdunRunes_Orange.blp:12:12|tSE|TInterface\\Icons\\Boss_OdunRunes_Orange.blp:12:12|t")
			voiceDrawPower:Play("backright")
		elseif spellId == 227498 and args:IsPlayer() then--Yellow H (SW)
			specWarnDrawPower:Show("|TInterface\\Icons\\Boss_OdunRunes_Yellow.blp:12:12|tSW|TInterface\\Icons\\Boss_OdunRunes_Yellow.blp:12:12|t")
			voiceDrawPower:Play("backleft")
		elseif spellId == 227499 and args:IsPlayer() then--Blue fishies (NW)
			specWarnDrawPower:Show("|TInterface\\Icons\\Boss_OdunRunes_Blue.blp:12:12|tNW|TInterface\\Icons\\Boss_OdunRunes_Blue.blp:12:12|t")
			voiceDrawPower:Play("frontleft")
		elseif spellId == 227500 and args:IsPlayer() then--Green box (N)
			specWarnDrawPower:Show("|TInterface\\Icons\\Boss_OdunRunes_Green.blp:12:12|tN|TInterface\\Icons\\Boss_OdunRunes_Green.blp:12:12|t")
			voiceDrawPower:Play("frontcenter")
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 228029 then
		if args:IsPlayer() then
			updateRangeFrame(self)
		end
	elseif spellId == 227807 or spellId == 227959 then--Add and non add version
		if args:IsPlayer() then
			updateRangeFrame(self)
		end
	elseif spellId == 227503 then--Draw power, assumed
		timerDrawPower:Stop()
		countdownDrawPower:Cancel()
	elseif spellId == 227490 or spellId == 227491 or spellId == 227498 or spellId == 227499 or spellId == 227500 then--Branded (Draw Power Runes)
		--Do things?
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 1) then
		specWarnDancingBlade:Show()
		voiceDancingBlade:Play("runaway")
	elseif spellId == 228683 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnCleansingFlame:Show()
		voiceCleansingFlame:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

--[[
function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 114363 or cid == 114996 then--Valarjar Runebearer

	end
end
--]]

--"<35.57 16:56:12> [CHAT_MSG_RAID_BOSS_EMOTE] |TInterface\\Icons\\ABILITY_PRIEST_FLASHOFLIGHT.BLP:20|t Hyrja targets |cFFFF0000Wakmagic|r with |cFFFF0404|Hspell:228162|h[Shield of Light]|h|r!#Hyrja###Wakmagic##0#0##0#476#nil#0#false#false#false#false", -- [241]
function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, _, _, _, target)
	if msg:find("spell:228162") then
		self.vb.shieldCast = self.vb.shieldCast + 1
		if self.vb.phase == 1 then
			if self.vb.shieldCast % 2 == 0 then
				timerShieldofLightCD:Start(38)
			else
				timerShieldofLightCD:Start(32)
			end
		else
			timerShieldofLightCD:Start(26)
		end
		local targetname = DBM:GetUnitFullName(target)
		if targetname then
			if targetname == UnitName("player") then
				specWarnShieldofLight:Show()
				voiceShieldofLight:Play("targetyou")
				yellShieldofLightFades:Schedule(2.8, 1)
				yellShieldofLightFades:Schedule(1.8, 2)
				yellShieldofLightFades:Schedule(0.8, 3)
			else
				warnShieldofLight:Show(targetname)
			end
			if self.Options.SetIconOnShield then
				self:SetIcon(targetname, 1)
			end
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, spellGUID)
	local spellId = tonumber(select(5, strsplit("-", spellGUID)), 10)
	--"<51.36 16:56:28> [UNIT_SPELLCAST_SUCCEEDED] Odyn(??) [[boss1:Draw Power::3-3198-1648-10280-227503-000A6050FC:227503]]", -- [376]
	if spellId == 227503 then--Draw Power
		timerDrawPower:Start()
		countdownDrawPower:Start()
		if self:IsLFR() then
			timerDrawPowerCD:Start(75)--LFR phase 2 verified. Might still be 70 in heroic though. no logs long enough for phase 2
		else
			timerDrawPowerCD:Start()
		end
		if self.vb.phase == 2 then
			timerSpearCD:Stop()
			timerSpearCD:Start(35)
		end
	--"<150.12 16:58:07> [UNIT_SPELLCAST_SUCCEEDED] Odyn(??) [[boss1:Test for Players::3-3198-1648-10280-229168-000660515F:229168]]", -- [1347]
	--"<156.10 16:58:13> [UNIT_SPELLCAST_SUCCEEDED] Odyn(??) [[boss1:Leap into Battle::3-3198-1648-10280-227882-0001605165:227882]]", -- [1382]
	--"<159.34 16:58:16> [UNIT_SPELLCAST_SUCCEEDED] Odyn(??) [[boss1:Spear Transition - Holy::3-3198-1648-10280-228734-0004E05168:228734]]", -- [1395]
	elseif spellId == 229168 then--Test for Players (Phase 2 begin)
		self.vb.phase = 2
		warnPhase2:Show()
		self.vb.hornCast = 0--Verify
		self.vb.shieldCast = 0--Verify
		self.vb.expelLightCast = 0--Verify
		self.vb.dancingBladeCast = 0--Verify
		timerDancingBladeCD:Stop()
		timerHornOfValorCD:Stop()
		timerExpelLightCD:Stop()
		timerShieldofLightCD:Stop()
		timerSpearCD:Start(13)
		--time = timer + 8 for the 8 seconds during transition he stops gaining power
		if self:IsLFR() then
			timerDrawPowerCD:Start(53)
		else
			timerDrawPower:Stop()
			countdownDrawPower:Stop()
			--TODO, verify this still happens or if it hard resetes CD now
			local elapsed, total = timerDrawPowerCD:GetTime()
			timerDrawPowerCD:Stop()
			timerDrawPowerCD:Update(elapsed, total+8)
			timerShatterSpearsCD:Start(72)--Only a single log, needs more data to verify. Might have been delayed by draw power timings
		end
	elseif spellId == 227697 then--Spear of Light
		timerSpearCD:Start()
		if self:IsLFR() then
			--In LFR, there is no shatter spears, instead they all shatter on spear cast
			--specWarnShatterSpears:Show()
			voiceShatterSpears:Play("watchorb")
		end
	--"<487.37 21:38:02> [CHAT_MSG_MONSTER_YELL] It seems I have been too gentle. Have at thee!#Odyn#####0#0##0#191#nil#0#false#false#false#false", -- [2839]
	--"<489.60 21:38:04> [UNIT_SPELLCAST_SUCCEEDED] Odyn(??) [[boss1:Spear Transition - Thunder::3-2012-1648-3815-228740-00058AC2FC:228740]]", -- [2940]
	--"<489.60 21:38:04> [UNIT_SPELLCAST_SUCCEEDED] Odyn(??) [[boss1:Arcing Storm::3-2012-1648-3815-229254-00060AC2FC:229254]]", -- [2941]
	elseif spellId == 228740 then--Spear Transition - Thunder (Phase 3 begin)
		timerDrawPower:Stop()
		countdownDrawPower:Stop()
		timerDrawPowerCD:Stop()
		timerStormOfJusticeCD:Start(4)
		timerStormforgedSpearCD:Start(9)
	end
end
