local mod	= DBM:NewMod(2031, "DBM-AntorusBurningThrone", nil, 946)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 16803 $"):sub(12, -3))
mod:SetCreatureID(125111)--or 124828
mod:SetEncounterID(2092)
mod:SetZone()
--mod:SetBossHPInfoToHighest()
mod:SetUsedIcons(1, 2, 3, 4)
--mod:SetHotfixNoticeRev(16350)
--mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 248165 248317 257296 255594 257645 252516 256542 255648 257619 255935",
	"SPELL_CAST_SUCCESS 248499 258039 251815 252729 252616 256388",
	"SPELL_AURA_APPLIED 248499 248396 250669 251570 255199 253021 255496 255496 255478 252729 252616",
	"SPELL_AURA_APPLIED_DOSE 248499",
	"SPELL_AURA_REMOVED 250669 251570 255199 253021 255496 255496 255478 252616",
--	"SPELL_PERIODIC_DAMAGE",
--	"SPELL_PERIODIC_MISSED",
--	"UNIT_DIED",
--	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED boss1 boss2 boss3 boss4 boss5"
)

--TODO, death fog GTFO
--TODO, icons or yells or both to help Soulburst and Soulbomb apart and gotten to right place.
--TODO, custom warning to combine soulburst and bomb into single message instead of two messages, while still separating targets
--TODO, interrupt warnings for Designates if not affected by Inevitability?
--TODO, taunt warning and icon setting when adds get blades, to help tank pickup?
--TODO, info frame for stage 4 (and other stages maybe) to show realms, and other stats, energy of boss and eonar's aid
--TODO, warnings when eonar transitions from gift to withering. other titan stuff?
--Stage One: Storm and Sky
local warnSweepingScythe			= mod:NewStackAnnounce(248499, 2, nil, "Tank")
local warnBlightOrb					= mod:NewSpellAnnounce(248317, 2)
local warnSoulblight				= mod:NewTargetAnnounce(248396, 1)
local warnSkyandSea					= mod:NewSpellAnnounce(255594, 1)
--Stage Two: The Protector Redeemed
local warnPhase2					= mod:NewPhaseAnnounce(2, 2)
local warnSoulburst					= mod:NewTargetAnnounce(250669, 2)
local warnSoulbomb					= mod:NewTargetAnnounce(251570, 3)
local warnAvatarofAggra				= mod:NewTargetAnnounce(255199, 1)
--Stage Three: The Arcane Masters
local warnPhase3					= mod:NewPhaseAnnounce(3, 2)
local warnCosmicRay					= mod:NewTargetAnnounce(252729, 3)
local warnCosmicBeacon				= mod:NewTargetAnnounce(252616, 2)
local warnDiscsofNorg				= mod:NewCastAnnounce(252516, 1)
--Stage Four: The Gift of Life, The Forge of Loss (Non Mythic)
local warnGiftOfLifebinder			= mod:NewCastAnnounce(257619, 1)
local warnPhase4					= mod:NewPhaseAnnounce(4, 2)
local warnDeadlyScythe				= mod:NewStackAnnounce(258039, 2, nil, "Tank")

--Stage One: Storm and Sky
local specWarnTorturedRage			= mod:NewSpecialWarningCount(257296, nil, nil, nil, 2, 2)
local specWarnSweepingScythe		= mod:NewSpecialWarningStack(248499, nil, 2, nil, nil, 1, 2)
local specWarnSweepingScytheTaunt	= mod:NewSpecialWarningTaunt(248499, nil, nil, nil, 1, 2)
local specWarnConeofDeath			= mod:NewSpecialWarningDodge(248165, nil, nil, nil, 1, 2)
local specWarnSoulblight			= mod:NewSpecialWarningMoveAway(248396, nil, nil, nil, 1, 2)
local yellSoulblight				= mod:NewYell(248396)
--local yellBurstingDreadflame		= mod:NewPosYell(238430, DBM_CORE_AUTO_YELL_CUSTOM_POSITION)
--local specWarnMalignantAnguish		= mod:NewSpecialWarningInterrupt(236597, "HasInterrupt")
--local specWarnGTFO					= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 2)
--Stage Two: The Protector Redeemed
local specWarnSoulburst				= mod:NewSpecialWarningMoveAway(250669, nil, nil, nil, 1, 2)
local yellSoulburst					= mod:NewPosYell(250669)
local yellSoulburstFades			= mod:NewIconFadesYell(250669)
local specWarnSoulbomb				= mod:NewSpecialWarningYou(251570, nil, nil, nil, 1, 2)
local specWarnSoulbombMoveTo		= mod:NewSpecialWarningMoveTo(251570, nil, nil, nil, 1, 8)
local yellSoulbomb					= mod:NewYell(251570)
local yellSoulbombFades				= mod:NewFadesYell(251570)
local specWarnEdgeofObliteration	= mod:NewSpecialWarningSpell(251815, nil, nil, nil, 2, 2)
local specWarnAvatarofAggra			= mod:NewSpecialWarningYou(255199, nil, nil, nil, 1, 2)
--Stage Three: The Arcane Masters
local specWarnCosmicRay				= mod:NewSpecialWarningYou(252729, nil, nil, nil, 1, 2)
local yellCosmicRay					= mod:NewYell(252729)
local specWarnCosmicBeacon			= mod:NewSpecialWarningMoveAway(252616, nil, nil, nil, 1, 2)
local yellCosmicBeacon				= mod:NewYell(252616)
local yellCosmicBeaconFades			= mod:NewShortFadesYell(252616)
--Stage Four: The Gift of Life, The Forge of Loss (Non Mythic)
local specWarnEmberofRage			= mod:NewSpecialWarningDodge(257299, nil, nil, nil, 2, 2)
local specWarnDeadlyScythe			= mod:NewSpecialWarningStack(258039, nil, 2, nil, nil, 1, 2)
--local specWarnDeadlyScytheTaunt		= mod:NewSpecialWarningTaunt(258039, nil, nil, nil, 1, 2)
local specWarnReorgModule			= mod:NewSpecialWarningSwitch(256389, "RangedDps", nil, nil, 1, 2)--Ranged only?


local timerNextPhase				= mod:NewPhaseTimer(74)
--Stage One: Storm and Sky
mod:AddTimerLine(SCENARIO_STAGE:format(1))
local timerSweepingScytheCD			= mod:NewCDTimer(5.6, 248499, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)--5.6-15.7
local timerConeofDeathCD			= mod:NewCDTimer(20, 248165, nil, nil, nil, 3)--20-24
local timerBlightOrbCD				= mod:NewCDTimer(22, 248317, nil, nil, nil, 3)--22-32
local timerTorturedRageCD			= mod:NewCDTimer(13.5, 257296, nil, nil, nil, 2, nil, DBM_CORE_HEALER_ICON)--13-16
local timerSkyandSeaCD				= mod:NewCDTimer(25.9, 255594, nil, nil, nil, 5)--25.9-27.8
--Stage Two: The Protector Redeemed
mod:AddTimerLine(SCENARIO_STAGE:format(2))
local timerVolatileSoulCD			= mod:NewCDTimer(42, 252280, nil, nil, nil, 3)
local timerEdgeofObliterationCD		= mod:NewCDTimer(30.5, 251815, nil, nil, nil, 2)
local timerAvatarofAggraCD			= mod:NewCDTimer(59.9, 255199, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON)
--Stage Three: The Arcane Masters
mod:AddTimerLine(SCENARIO_STAGE:format(3))
local timerCosmicRayCD				= mod:NewCDTimer(19.9, 252729, nil, nil, nil, 3)--All adds seem to cast it at same time, so one timer for all
local timerCosmicBeaconCD			= mod:NewCDTimer(19.9, 252616, nil, nil, nil, 3)--All adds seem to cast it at same time, so one timer for all
--local timerCosmicPowerCD			= mod:NewCDTimer(19.9, 255935, nil, nil, nil, 3)--All adds seem to cast it at same time, so one timer for all
local timerDiscsofNorgCD			= mod:NewCDTimer(12, 252516, nil, nil, nil, 6)
local timerDiscsofNorg				= mod:NewCastTimer(12, 252516, nil, nil, nil, 6)
--Stage Four: The Gift of Life, The Forge of Loss (Non Mythic)
mod:AddTimerLine(SCENARIO_STAGE:format(4))
--local timerEmberofRageCD			= mod:NewAITimer(20, 257299, nil, nil, nil, 3)
local timerDeadlyScytheCD			= mod:NewCDTimer(5.5, 258039, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)
local timerReorgModuleCD			= mod:NewCDTimer(50, 256389, nil, nil, nil, 1)

--local berserkTimer					= mod:NewBerserkTimer(600)

--Stage One: Storm and Sky
--local countdownSingularity			= mod:NewCountdown(50, 235059)
--Stage Two: The Protector Redeemed

--Stage One: Storm and Sky
local voiceSweepingScythe				= mod:NewVoice(248499)--tauntboss
local voiceConeofDeath					= mod:NewVoice(248165)--aesoon
local voiceTorturedRage					= mod:NewVoice(257296)--aesoon
local voiceSoulblight					= mod:NewVoice(248396)--runout
--local voiceMalignantAnguish			= mod:NewVoice(236597, "HasInterrupt")--kickcast
--local voiceGTFO						= mod:NewVoice(238028, nil, DBM_CORE_AUTO_VOICE4_OPTION_TEXT)--runaway
--Stage Two: The Protector Redeemed
local voiceSoulburst					= mod:NewVoice(250669)--targetyou/runout (on delay)
local voiceSoulbomb						= mod:NewVoice(251570)--targetyou/movetotank (on delay)
local voiceEdgeofObliteration			= mod:NewVoice(251815)--watchwave?
local voiceAvatarofAgrra				= mod:NewVoice(255199)--targetyou
--Stage Three: The Arcane Masters
local voiceCosmicRay					= mod:NewVoice(252729)--targetyou
local voiceCosmicBeacon					= mod:NewVoice(252616)--runout
--Stage Four: The Gift of Life, The Forge of Loss (Non Mythic)
local voiceEmberofRage					= mod:NewVoice(257299)--watchstep
local voiceDeadlyScythe					= mod:NewVoice(258039)--tauntboss
local voiceReorgModule					= mod:NewVoice(256389)--killmob


mod:AddSetIconOption("SetIconOnAvatar", 255199, true)
mod:AddSetIconOption("SetIconOnSoulBomb", 251570, true)
mod:AddSetIconOption("SetIconOnSoulBurst", 250669, true)
mod:AddInfoFrameOption(258040, true)--Change to EJ entry since spell not localized
mod:AddNamePlateOption("NPAuraOnInevitability", 253021)
mod:AddNamePlateOption("NPAuraOnCosmosSword", 255496)
mod:AddNamePlateOption("NPAuraOnEternalBlades", 255478)
--mod:AddRangeFrameOption("5/10")

local avatarOfAggramar, aggramarsBoon = GetSpellInfo(255199), GetSpellInfo(255200)
mod.vb.phase = 1
mod.vb.TorturedRage = 0
mod.vb.soulBurstIcon = 1

--[[
local debuffFilter
local UnitDebuff = UnitDebuff
local playerDebuff = nil
do
	local spellName = GetSpellInfo(231311)
	debuffFilter = function(uId)
		if not playerDebuff then return true end
		if not select(11, UnitDebuff(uId, spellName)) == playerDebuff then
			return true
		end
	end
end

local expelLight, stormOfJustice = GetSpellInfo(228028), GetSpellInfo(227807)
local function updateRangeFrame(self)
	if not self.Options.RangeFrame then return end
	if self.vb.brandActive then
		DBM.RangeCheck:Show(15, debuffFilter)--There are no 15 yard items that are actually 15 yard, this will round to 18 :\
	elseif UnitDebuff("player", expelLight) or UnitDebuff("player", stormOfJustice) then
		DBM.RangeCheck:Show(8)
	elseif self.vb.hornCasting then--Spread for Horn of Valor
		DBM.RangeCheck:Show(5)
	else
		DBM.RangeCheck:Hide()
	end
end
--]]

local function delayedBoonCheck(self, stage4)
	if not UnitBuff("player", aggramarsBoon) then
		if stage4 then
			specWarnSoulbombMoveTo:Show(DBM_CORE_ROOM_EDGE)
			voiceSoulbomb:Play("runtoedge")
		else
			specWarnSoulbombMoveTo:Show(avatarOfAggramar)
			voiceSoulbomb:Play("movetotank")
		end
	end
end

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	self.vb.TorturedRage = 0
	self.vb.soulBurstIcon = 1
	timerSweepingScytheCD:Start(5.8-delay)
	timerSkyandSeaCD:Start(10.8-delay)
	timerTorturedRageCD:Start(12-delay)
	timerConeofDeathCD:Start(30.9-delay)
	timerBlightOrbCD:Start(35.2-delay)
	if self.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(_G["7.3_ARGUS_RAID_DEATH_TITAN_ENERGY"])--Validator won't accept this global so disabled for now
		DBM.InfoFrame:Show(2, "enemypower", 2)
		--DBM.InfoFrame:Show(7, "function", updateInfoFrame, false, false)
	end
	local wowTOC, testBuild = DBM:GetTOC()
	if not testBuild then
		DBM:AddMsg(DBM_CORE_NEED_LOGS)
	end
	if self.Options.NPAuraOnInevitability or self.Options.NPAuraOnCosmosSword or self.Options.NPAuraOnEternalBlades then
		DBM:FireEvent("BossMod_EnableHostileNameplates")
	end
end

function mod:OnCombatEnd()
--	if self.Options.RangeFrame then
--		DBM.RangeCheck:Hide()
--	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	local wowTOC, testBuild = DBM:GetTOC()
	if not testBuild then
		DBM:AddMsg(DBM_CORE_NEED_LOGS)
	end
	if self.Options.NPAuraOnInevitability or self.Options.NPAuraOnCosmosSword or self.Options.NPAuraOnEternalBlades then
		DBM.Nameplate:Hide(true, nil, nil, nil, true, true)
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 248165 then
		specWarnConeofDeath:Show()
		voiceConeofDeath:Play("shockwave")
		timerConeofDeathCD:Start()
	elseif spellId == 248317 then
		warnBlightOrb:Show()
		timerBlightOrbCD:Start()
	elseif spellId == 257296 then
		self.vb.TorturedRage = self.vb.TorturedRage + 1
		specWarnTorturedRage:Show(self.vb.TorturedRage)
		voiceTorturedRage:Play("aesoon")
		timerTorturedRageCD:Start()
	elseif spellId == 255594 then
		warnSkyandSea:Show()
		timerSkyandSeaCD:Start()
	elseif spellId == 252516 then
		warnDiscsofNorg:Show()
		timerDiscsofNorg:Start()
	elseif spellId == 255648 then--Golganneth's Wrath
		self.vb.phase = 2
		warnPhase2:Show()
		timerConeofDeathCD:Stop()
		timerBlightOrbCD:Stop()
		timerTorturedRageCD:Stop()
		timerSweepingScytheCD:Stop()
		timerSkyandSeaCD:Stop()
		timerNextPhase:Start(16)
		timerSweepingScytheCD:Start(17.3)
		--timerTorturedRageCD:Start(2)--No longer used in P2?
		timerAvatarofAggraCD:Start(21.4)
		timerEdgeofObliterationCD:Start(22.61)
		timerVolatileSoulCD:Start(37.2)
	elseif spellId == 257645 then--Temporal Blast (Stage 3)
		self.vb.phase = 3
		warnPhase3:Show()
		timerSweepingScytheCD:Stop()
		timerTorturedRageCD:Stop()
		timerVolatileSoulCD:Stop()
		timerEdgeofObliterationCD:Stop()
		timerAvatarofAggraCD:Stop()
		timerDiscsofNorgCD:Start(15)
		timerCosmicRayCD:Start(30)
		--timerCosmicPowerCD:Start(36.5)
		timerCosmicBeaconCD:Start(40)
	elseif spellId == 256542 then--Reap Soul
		self.vb.phase = 4
		warnPhase4:Show()
		timerCosmicRayCD:Stop()
		--timerCosmicPowerCD:Stop()
		timerCosmicBeaconCD:Stop()
		timerDiscsofNorg:Stop()
		timerDiscsofNorgCD:Stop()
		timerNextPhase:Start(35)--or 53.8
	elseif spellId == 257619 then--Gift of the Lifebinder (p4)
		warnGiftOfLifebinder:Show()
	elseif spellId == 255935 then
		--timerCosmicPowerCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 248499 then
		timerSweepingScytheCD:Start()
	elseif spellId == 258039 then
		timerDeadlyScytheCD:Start()
	elseif spellId == 251815 then
		specWarnEdgeofObliteration:Show()
		voiceEdgeofObliteration:Play("watchwave")
		timerEdgeofObliterationCD:Start()
	elseif spellId == 252729 and self:AntiSpam(5, 3) then
		timerCosmicRayCD:Start()
	elseif spellId == 252616 and self:AntiSpam(5, 4) then
		timerCosmicBeaconCD:Start()
	elseif spellId == 256388 and self:AntiSpam(5, 5) then--Initialization Sequence
		specWarnReorgModule:Show()
		voiceReorgModule:Play("killmob")
		timerReorgModuleCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 248499 then--Heroic/non mythic
		local uId = DBM:GetRaidUnitId(args.destName)
		if uId and self:IsTanking(uId) then
			local amount = args.amount or 1
			if amount >= 2 then
				if args:IsPlayer() then
					specWarnSweepingScythe:Show(amount)
					voiceSweepingScythe:Play("stackhigh")
				else--Taunt as soon as stacks are clear, regardless of stack count.
					if not UnitIsDeadOrGhost("player") and not UnitDebuff("player", args.spellName) then
						specWarnSweepingScytheTaunt:Show(args.destName)
						voiceSweepingScythe:Play("tauntboss")
					else
						warnSweepingScythe:Show(args.destName, amount)
					end
				end
			else
				warnSweepingScythe:Show(args.destName, amount)
			end
		end
	elseif spellId == 258039 then--Heroic/Mythic?
		local uId = DBM:GetRaidUnitId(args.destName)
		if uId and self:IsTanking(uId) then
			local amount = args.amount or 1
			if amount >= 2 then
				if args:IsPlayer() then
					specWarnDeadlyScythe:Show(amount)
					voiceDeadlyScythe:Play("stackhigh")
				else
					warnDeadlyScythe:Show(args.destName, amount)
					--specWarnDeadlyScytheTaunt:Show(args.destName)
					--voiceDeadlyScythe:Play("tauntboss")
				end
			else
				warnDeadlyScythe:Show(args.destName, amount)
			end
		end
	elseif spellId == 248396 then
		warnSoulblight:Show(args.destName)
		if args:IsPlayer() then
			specWarnSoulblight:Show()
			voiceSoulblight:Play("runout")
			yellSoulblight:Yell()
		end
	elseif spellId == 250669 then
		warnSoulburst:CombinedShow(0.3, args.destName)--2 Targets
		local icon = self.vb.soulBurstIcon
		if args:IsPlayer() then
			specWarnSoulburst:Show()
			voiceSoulburst:Play("targetyou")
			voiceSoulburst:Schedule(10, "runout")
			yellSoulburst:Yell(icon, icon, icon)
			yellSoulburstFades:Countdown(15, nil, icon)
		end
		if self.Options.SetIconOnSoulBurst then
			self:SetIcon(args.destName, icon)
		end
		self.vb.soulBurstIcon = self.vb.soulBurstIcon + 1
	elseif spellId == 251570 then
		if args:IsPlayer() then
			specWarnSoulbomb:Show()
			voiceSoulbomb:Play("targetyou")
			self:Schedule(10, delayedBoonCheck, self)
			yellSoulbomb:Yell()
			yellSoulbombFades:Countdown(15)
		else
			warnSoulbomb:Show(args.destName)
		end
		if self.Options.SetIconOnSoulBomb then
			self:SetIcon(args.destName, 3)
		end
	elseif spellId == 255199 then
		if args:IsPlayer() then
			specWarnAvatarofAggra:Show()
			voiceAvatarofAgrra:Play("targetyou")
		else
			warnAvatarofAggra:Show(args.destName)
		end
		if self.Options.SetIconOnAvatar then
			self:SetIcon(args.destName, 4)
		end
	elseif spellId == 253021 then--Inevitability
		if self.Options.NPAuraOnInevitability then
			DBM.Nameplate:Show(true, args.destGUID, spellId, nil, 20)
		end
	elseif spellId == 255496 then--Sword of the Cosmos
		if self.Options.NPAuraOnCosmosSword then
			DBM.Nameplate:Show(true, args.destGUID, spellId)
		end
	elseif spellId == 255478 then--Blades of the Eternal
		if self.Options.NPAuraOnEternalBlades then
			DBM.Nameplate:Show(true, args.destGUID, spellId, nil, 40)
		end
	elseif spellId == 252729 then
		if args:IsPlayer() then
			specWarnCosmicRay:Show()
			voiceCosmicRay:Play("targetyou")
			yellCosmicRay:Yell()
		else
			warnCosmicRay:CombinedShow(0.3, args.destName)
		end
	elseif spellId == 252616 then
		if args:IsPlayer() then
			specWarnCosmicBeacon:Show()
			voiceCosmicBeacon:Play("runout")
			yellCosmicBeacon:Yell()
			yellCosmicBeaconFades:Countdown(8)
		else
			warnCosmicBeacon:CombinedShow(0.3, args.destName)
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 250669 then
		if args:IsPlayer() then
			yellSoulburstFades:Cancel()
			voiceSoulburst:Cancel()
		end
		if self.Options.SetIconOnSoulBurst then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 251570 then
		if args:IsPlayer() then
			self:Unschedule(delayedBoonCheck)
			yellSoulbombFades:Cancel()
		end
		if self.Options.SetIconOnSoulBomb then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 255199 then
		if self.Options.SetIconOnAvatar then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 253021 then--Inevitability
		if self.Options.NPAuraOnInevitability then
			DBM.Nameplate:Hide(true, args.destGUID, spellId)
		end
	elseif spellId == 255496 then--Sword of the Cosmos
		if self.Options.NPAuraOnCosmosSword then
			DBM.Nameplate:Hide(true, args.destGUID, spellId)
		end
	elseif spellId == 255478 then--Blades of the Eternal
		if self.Options.NPAuraOnEternalBlades then
			DBM.Nameplate:Hide(true, args.destGUID, spellId)
		end
	elseif spellId == 252616 then
		if args:IsPlayer() then
			yellCosmicBeaconFades:Cancel()
		end
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 5) then
		specWarnGTFO:Show()
		voiceGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, npc, _, _, target)
	if msg:find("spell:238502") then

	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 121193 then

	end
end
--]]

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, spellName, _, _, spellId)
	if spellId == 257300 and self:AntiSpam(5, 1) then--Ember of Rage
		specWarnEmberofRage:Show()
		voiceEmberofRage:Play("watchstep")
		--timerEmberofRageCD:Start()
	--elseif spellId == 256389 and self:AntiSpam(5, 2) then--Reorgination Module
		--specWarnReorgModule:Show()
		--voiceReorgModule:Play("killmob")
		--timerReorgModuleCD:Start()
	elseif spellId == 252280 then--Volatile Soul
		timerVolatileSoulCD:Start()
	elseif spellId == 258042 then--Argus P2 Energy Controller (16 seconds after Fury)
		--Alternate and valid timer start point
		--timerAvatarofAggraCD:Start(5)
		--timerEdgeofObliterationCD:Start(6.2)
		--timerVolatileSoulCD:Start(20.8)
	elseif spellId == 34098 then--ClearAllDebuffs (12 before Tempoeral Blast)
	
	elseif spellId == 258044 then--Argus P4 Energy Controller (54 seconds after Reap Soul, 27 seconds after Gift of the Lifebinder)
		--timerDiscsofNorgCD:Stop()
		if not self:IsHeroic() then
			timerSweepingScytheCD:Start(5)
		else
			timerDeadlyScytheCD:Start(5)
		end
		--timerEmberofRageCD:Start(4)--used instantly
		timerTorturedRageCD:Start(10)
		timerReorgModuleCD:Start(13.4)
		timerVolatileSoulCD:Start(17.5)
	elseif spellId == 258104 then--Argus Mythic Transform
		
	end
end
