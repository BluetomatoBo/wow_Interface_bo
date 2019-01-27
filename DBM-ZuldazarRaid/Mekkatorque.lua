local mod	= DBM:NewMod(2334, "DBM-ZuldazarRaid", 3, 1176)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 18193 $"):sub(12, -3))
mod:SetCreatureID(144796)
mod:SetEncounterID(2276)
--mod:DisableESCombatDetection()
mod:SetZone()
--mod:SetBossHPInfoToHighest()
mod:SetUsedIcons(8, 7, 6, 5, 4, 3, 2, 1)
mod:SetHotfixNoticeRev(18175)
--mod:SetMinSyncRevision(16950)
mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 282205 287952 287929 282153 288410 287751 287797 287757 286693 288041 288049 289537 287691 286597",
	"SPELL_CAST_SUCCESS 287757 286597",
	"SPELL_AURA_APPLIED 287757 287167 284168 289023 286051 289699 286646",
	"SPELL_AURA_APPLIED_DOSE 289699",
	"SPELL_AURA_REMOVED 287757 284168 286646",
	"UNIT_DIED"
--	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--[[
(ability.id = 282205 or ability.id = 287952 or ability.id = 287929 or ability.id = 282153 or ability.id = 288410 or ability.id = 287751 or ability.id = 287797 or ability.id = 286693 or ability.id = 288041 or ability.id = 288049 or ability.id = 289537 or ability.id = 287691) and type = "begincast"
 or (ability.id = 287757 or ability.id = 286597) and type = "cast"
--]]
--TODO, Gigavolt Charge has 3 debuff spellIDs, all 3 used or what the deal?
--TODO, icon marking for poly morph dispel assignments?
--TODO, nameplate aura for tampering protocol, if it has actual debuff diration (wowhead does not)
--TODO, if number of bots can be counted, add additional "switch to bots" warnings when shrunk is applied if any are still up
--TODO, wormhole generator target scan? hidden aura scan?
--TODO, adjust electroshock stacks?
local warnPhase							= mod:NewPhaseChangeAnnounce(2, nil, nil, nil, nil, nil, 2)
--Ground Phase
local warnShrunk						= mod:NewTargetNoFilterAnnounce(284168, 1)
--Intermission: Evasive Maneuvers!

--Final Push
local warnHyperDrive					= mod:NewTargetNoFilterAnnounce(286051, 3)

--Ground Phase
local specWarnBusterCannon				= mod:NewSpecialWarningDodgeCount(282153, nil, nil, nil, 2, 2)
local specWarnBlastOff					= mod:NewSpecialWarningDodgeCount(282205, nil, nil, nil, 4, 2)
--local specWarnCrashDown					= mod:NewSpecialWarningDodge(287797, nil, nil, nil, 2, 2)
local specWarnElectroshockAmp			= mod:NewSpecialWarningCount(289699, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.stack:format(8, 270447), nil, 1, 2)
local specWarnElectroshockAmpOther		= mod:NewSpecialWarningTaunt(289699, nil, nil, nil, 1, 2)
local specWarnGigaVoltCharge			= mod:NewSpecialWarningYouPos(286646, nil, nil, nil, 1, 2)
local yellGigaVoltCharge				= mod:NewPosYell(286646)
local yellGigaVoltChargeFades			= mod:NewIconFadesYell(286646)
local specWarnGigaVoltChargeFading		= mod:NewSpecialWarningMoveTo(286646, nil, nil, nil, 3, 2)
local specWarnGigaVoltChargeTaunt		= mod:NewSpecialWarningTaunt(286646, nil, nil, nil, 1, 2)
local specWarnWormholeGenerator 		= mod:NewSpecialWarningCount(287952, nil, nil, nil, 2, 5)
local specWarnDiscombobulation			= mod:NewSpecialWarningDispel(287167, "Healer", nil, nil, 1, 2)--Mythic
local specWarnDeploySparkBot			= mod:NewSpecialWarningSwitch(288410, nil, nil, nil, 1, 2)
local specWarnShrunk					= mod:NewSpecialWarningYouPos(284168, nil, nil, nil, 1, 2)
local yellShrunk						= mod:NewShortYell(284168)--Shrunk will just say with white letters
local yellShrunkRepeater				= mod:NewYell(284168, UnitName("player"))
local specWarnShrunkTaunt				= mod:NewSpecialWarningTaunt(284168, nil, nil, nil, 1, 2)
local specWarnEnormous					= mod:NewSpecialWarningYou(289023, nil, nil, nil, 1, 2)--Mythic
local yellEnormous						= mod:NewYell(289023, nil, nil, nil, "YELL")--Enormous will shout with red letters
--Intermission: Evasive Maneuvers!
local specWarnExplodingSheep			= mod:NewSpecialWarningDodge(287929, nil, nil, nil, 2, 2)
--local specWarnGTFO					= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 8)

--mod:AddTimerLine(DBM:EJ_GetSectionInfo(18527))
--Ground Phase
local timerBusterCannonCD				= mod:NewCDCountTimer(25, 282153, nil, nil, nil, 3)
local timerBlastOffCD					= mod:NewCDCountTimer(55, 282205, nil, nil, nil, 2)
local timerCrashDownCD					= mod:NewCastTimer(4.5, 287797, nil, nil, nil, 3)
local timerGigaVoltChargeCD				= mod:NewCDCountTimer(14.1, 286646, nil, nil, nil, 3, nil, DBM_CORE_TANK_ICON)
local timerWormholeGeneratorCD			= mod:NewCDCountTimer(55, 287952, nil, nil, nil, 3, nil, DBM_CORE_HEROIC_ICON)
local timerDeploySparkBotCD				= mod:NewCDCountTimer(55, 288410, nil, nil, nil, 1)
local timerWorldEnlargerCD				= mod:NewCDCountTimer(55, 288049, nil, nil, nil, 3)
--Intermission: Evasive Maneuvers!
local timerIntermission					= mod:NewPhaseTimer(49.9)
local timerExplodingSheepCD				= mod:NewCDCountTimer(55, 287929, nil, nil, nil, 3)

--local berserkTimer					= mod:NewBerserkTimer(600)

--local countdownCollapsingWorld			= mod:NewCountdown(50, 243983, true, 3, 3)
--local countdownRupturingBlood				= mod:NewCountdown("Alt12", 244016, false, 2, 3)
--local countdownFelstormBarrage			= mod:NewCountdown("AltTwo32", 244000, nil, nil, 3)

mod:AddSetIconOption("SetIconGigaVolt", 286646, true)
--mod:AddSetIconOption("SetIconShrunk2", 284168, false)
--mod:AddRangeFrameOption("8/10")
--mod:AddInfoFrameOption(258040, true)
--mod:AddNamePlateOption("NPAuraOnPresence", 276093)
--mod:AddSetIconOption("SetIconDarkRev", 273365, true)

mod.vb.phase = 1
--mod.vb.shrunkIcon = 8
--Count variables for every timer, because stupid sequence mod
mod.vb.botCount = 0
mod.vb.cannonCount = 0
mod.vb.blastOffcount = 0
mod.vb.ripperCount = 0
mod.vb.gigaCount = 0
mod.vb.gigaIcon = 1
mod.vb.shrinkCount = 0
mod.vb.sheepCount = 0
mod.vb.difficultyName = "None"
--Normal and heroic are ALMOST identical but have at least 2 differences (which is why they are separate, for fine tuning)
local sparkBotTimers = {
	["lfr"] = {
		[1] = {},
		[1.5] = {},
		[2] = {},
	},
	["normal"] = {
		[1] = {5, 22, 27.5, 42.5, 22.5, 25, 42, 22.5, 22.5},
		[1.5] = {},
		[2] = {15.7, 40, 42.5, 47.5},
	},
	["heroic"] = {
		[1] = {5, 22, 27.5, 42.5, 22.5, 25, 42, 22.5, 22.5},
		[1.5] = {19.8},--Actual difference on heroic, normal omits this
		[2] = {15.7, 40, 42.5, 47.5},
	},
	["mythic"] = {
		[1] = {},
		[1.5] = {},
		[2] = {},
	},
}
local busterCannonTimers = {
	["lfr"] = {
		[1] = {},
		[2] = {},
	},
	["normal"] = {
		[1] = {13, 32.9, 64.5, 40, 26.5, 65},
		[2] = {17.8, 29.0, 64.5, 40.0, 26.5},
	},
	["heroic"] = {
		[1] = {13, 32.9, 64.5, 40, 26.5, 65},
		[2] = {17.8, 29.0, 64.5, 40.0, 26.5},
	},
	["mythic"] = {
		[1] = {10.1, 26.4, 12.9, 20.9, 24.5, 15.4},--REDO?
		[2] = {},
	},
}
local blastOffTimers = {
	["lfr"] = {
		[1] = {},
		[2] = {},
	},
	["normal"] = {
		[1] = {37.1, 31.0, 37.5, 34.1, 50.4},
		[2] = {41.8, 29.0, 35.5, 34.1},
	},
	["heroic"] = {
		[1] = {37.1, 31.0, 37.5, 34.1, 50.4},
		[2] = {41.8, 29.0, 35.5, 34.1},
	},
	["mythic"] = {
		[1] = {29.8, 60.2},--REDO?
		[2] = {},
	},
}
local wormholeTimers = {
	--Not used on normal/lfr
	["heroic"] = {
		[1] = {38, 98.7},
		[1.5] = {46.8},
		[2] = {38.8, 88.6},
	},
	["mythic"] = {
		[1] = {41.7, 17.1, 39.5, 27.5},--REDO?
		[1.5] = {},
		[2] = {},
	},
}
local gigaVoltTimers = {
	["lfr"] = {
		[1] = {},
		[1.5] = {},
		[2] = {},
	},
	["normal"] = {
		[1] = {21.5, 40, 40, 33, 41.9, 40.5},
		[1.5] = {16.9, 33.5},
		[2] = {22.2, 40, 40, 35, 39.9},
	},
	["heroic"] = {
		[1] = {21.5, 40, 40, 33, 41.9, 40.5},
		[1.5] = {16.9, 33.5},
		[2] = {22.2, 40, 40, 35, 39.9},
	},
	["mythic"] = {
		[1] = {16.9, 80.5},--REDO?
		[1.5] = {},
		[2] = {},
	},
}
local worldEnlargerTimers = {
	["lfr"] = {
		[1] = {},
		[1.5] = {},
		[2] = {},
	},
	["normal"] = {
		[1] = {75, 90},
		[1.5] = {7.4, 31},
		[2] = {75.8, 90},
	},
	["heroic"] = {
		[1] = {75, 90},
		[1.5] = {7.4, 31},
		[2] = {75.8, 90},
	},
	["mythic"] = {
		[1] = {78.2},--REDO?
		[1.5] = {},
		[2] = {},
	},
}
local explodingSheepTimers = {
	["lfr"] = {
		[1.5] = {},
	},
	["normal"] = {
		[1.5] = {12.5, 29.9, 12},
	},
	["heroic"] = {
		[1.5] = {12.5, 29.9, 12},
		[2] = {28.3, 100},--Another heroic vs normal difference
	},
	["mythic"] = {
		[1.5] = {},
		[2] = {},
	},
}

local function shrunkYellRepeater(self, icon)
	yellShrunkRepeater:Yell()
	self:Schedule(2, shrunkYellRepeater, self)
end

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	--self.vb.shrunkIcon = 8
	self.vb.botCount = 0
	self.vb.cannonCount = 0
	self.vb.blastOffcount = 0
	self.vb.ripperCount = 0
	self.vb.gigaCount = 0
	self.vb.gigaIcon = 1
	self.vb.shrinkCount = 0
	if self:IsMythic() then
		self.vb.difficultyName = "mythic"
		timerBusterCannonCD:Start(10-delay, 1)
		timerGigaVoltChargeCD:Start(16.5-delay, 1)--Success
		timerDeploySparkBotCD:Start(19.8-delay, 1)
		timerBlastOffCD:Start(29.8-delay, 1)
		timerWormholeGeneratorCD:Start(41-delay, 1)
		timerWorldEnlargerCD:Start(75-delay, 1)--Start
	else
		timerDeploySparkBotCD:Start(5-delay, 1)
		timerBusterCannonCD:Start(13-delay, 1)
		timerGigaVoltChargeCD:Start(21.5-delay, 1)--Success
		timerBlastOffCD:Start(37-delay, 1)
		if self:IsHeroic() then
			self.vb.difficultyName = "heroic"
			timerWormholeGeneratorCD:Start(53-delay, 1)
		elseif self:IsNormal() then
			self.vb.difficultyName = "normal"
		else
			self.vb.difficultyName = "lfr"
		end
		timerWorldEnlargerCD:Start(75-delay, 1)--Start
	end
--	if self.Options.NPAuraOnPresence then
--		DBM:FireEvent("BossMod_EnableHostileNameplates")
--	end
	DBM:AddMsg("This Boss was redone from 5 stage boss to 3 stage boss after most of testing, so timers need reworking and may not be correct. They will be updated as quickly as possible on live")
end

function mod:OnCombatEnd()
--	if self.Options.RangeFrame then
--		DBM.RangeCheck:Hide()
--	end
--	if self.Options.InfoFrame then
--		DBM.InfoFrame:Hide()
--	end
--	if self.Options.NPAuraOnPresence then
--		DBM.Nameplate:Hide(true, nil, nil, nil, true, true)
--	end
	DBM:AddMsg("This Boss was redone from 5 stage boss to 3 stage boss after most of testing, so timers need reworking and may not be correct. They will be updated as quickly as possible on live")
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 282205 then
		self.vb.blastOffcount = self.vb.blastOffcount + 1
		specWarnBlastOff:Show(self.vb.blastOffcount)
		specWarnBlastOff:Play("justrun")
		timerCrashDownCD:Start(4.5)
		local timer = blastOffTimers[self.vb.difficultyName][self.vb.phase][self.vb.blastOffcount+1]
		if timer then
			timerBlastOffCD:Start(timer, self.vb.blastOffcount+1)
		end
	elseif spellId == 287952 then
		self.vb.ripperCount = self.vb.ripperCount + 1
		specWarnWormholeGenerator:Show(self.vb.ripperCount)
		specWarnWormholeGenerator:Play("teleyou")
		local timer = wormholeTimers[self.vb.difficultyName][self.vb.phase][self.vb.ripperCount+1]
		if timer then
			timerWormholeGeneratorCD:Start(timer, self.vb.ripperCount+1)
		end
	elseif spellId == 287929 then
		self.vb.sheepCount = self.vb.sheepCount + 1
		specWarnExplodingSheep:Show()
		specWarnExplodingSheep:Play("watchstep")
		local timer = explodingSheepTimers[self.vb.difficultyName][self.vb.phase][self.vb.sheepCount+1]
		if timer then
			timerExplodingSheepCD:Start(timer, self.vb.sheepCount+1)
		end
	elseif spellId == 282153 then
		self.vb.cannonCount = self.vb.cannonCount + 1
		specWarnBusterCannon:Show(self.vb.cannonCount)
		specWarnBusterCannon:Play("shockwave")
		local timer = busterCannonTimers[self.vb.difficultyName][self.vb.phase][self.vb.cannonCount+1]
		if timer then
			timerBusterCannonCD:Start(timer, self.vb.cannonCount+1)
		end
	elseif spellId == 288410 or spellId == 287691 then
		self.vb.botCount = self.vb.botCount + 1
		if DBM:UnitDebuff("player", 284168) then--Shrunk
			specWarnDeploySparkBot:Show()
			specWarnDeploySparkBot:Play("targetchange")
		end
		local timer = sparkBotTimers[self.vb.difficultyName][self.vb.phase][self.vb.botCount+1]
		if timer then
			timerDeploySparkBotCD:Start(timer, self.vb.botCount+1)
		end
	elseif spellId == 287751 then--Evasive Maneuvers (intermission Start)
		self.vb.phase = 1.5
		--These happen in intermission too so intermission counters needed
		self.vb.botCount = 0
		self.vb.ripperCount = 0
		self.vb.gigaCount = 0
		self.vb.shrinkCount = 0
		self.vb.sheepCount = 0
		warnPhase:Show(DBM_CORE_AUTO_ANNOUNCE_TEXTS.stage:format(self.vb.phase))
		warnPhase:Play("phasechange")
		timerCrashDownCD:Stop()
		timerDeploySparkBotCD:Stop()
		timerBusterCannonCD:Stop()
		timerGigaVoltChargeCD:Stop()--Success
		timerBlastOffCD:Stop()
		timerWorldEnlargerCD:Stop()
		if self:IsMythic() then
			timerWormholeGeneratorCD:Start(16.9, 1)
		else
			timerWorldEnlargerCD:Start(7.9, 1)
			timerExplodingSheepCD:Start(12.8, 1)
			timerGigaVoltChargeCD:Start(16.9, 1)
			if self:IsHeroic() then
				timerDeploySparkBotCD:Start(19.8, 1)
				timerWormholeGeneratorCD:Start(46.8, 1)
			end
		end
		timerIntermission:Start(49.9)--Seems time based but journal says when generators die
	elseif spellId == 287797 then--Crash Down (intermission end)
		self.vb.phase = 2
		--Reset everything but sheep, for next ground phase
		self.vb.botCount = 0
		self.vb.cannonCount = 0
		self.vb.blastOffcount = 0
		self.vb.ripperCount = 0
		self.vb.gigaCount = 0
		self.vb.shrinkCount = 0
		self.vb.sheepCount = 0
		warnPhase:Show(DBM_CORE_AUTO_ANNOUNCE_TEXTS.stage:format(self.vb.phase))
		warnPhase:Play("phasechange")
		timerExplodingSheepCD:Stop()
		timerDeploySparkBotCD:Stop()
		timerGigaVoltChargeCD:Stop()
		timerWorldEnlargerCD:Stop()
		timerWormholeGeneratorCD:Stop()
		if self:IsMythic() then

		else
			timerDeploySparkBotCD:Start(15.7, 1)
			timerBusterCannonCD:Start(17.8, 1)
			timerGigaVoltChargeCD:Start(22.2, 1)--Success
			timerBlastOffCD:Start(41.8, 1)
			timerWorldEnlargerCD:Start(75.7, 1)--Start
			if self:IsHeroic() then
				timerExplodingSheepCD:Start(28.3, 1)
				timerWormholeGeneratorCD:Start(38.8, 1)
			end
		end
	elseif spellId == 287757 or spellId == 286597 then
		self.vb.gigaIcon = 1
	elseif spellId == 286693 or spellId == 288041 or spellId == 288049 or spellId == 289537 then--288041 used in intermission first, 288049 second in intermission, 286693 outside intermission
		self.vb.shrinkCount = self.vb.shrinkCount + 1
		--self.vb.shrunkIcon = 8
		local timer = worldEnlargerTimers[self.vb.difficultyName][self.vb.phase][self.vb.shrinkCount+1]
		if timer then
			timerWorldEnlargerCD:Start(timer, self.vb.shrinkCount+1)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 287757 or spellId == 286597 then
		self.vb.gigaCount = self.vb.gigaCount + 1
		local timer = gigaVoltTimers[self.vb.difficultyName][self.vb.phase][self.vb.gigaCount+1]
		if timer then
			timerGigaVoltChargeCD:Start(timer, self.vb.gigaCount+1)
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 287757 or spellId == 286646 then--283409?
		local icon = self.vb.gigaIcon
		if args:IsPlayer() then
			specWarnGigaVoltCharge:Show(self:IconNumToTexture(icon))
			specWarnGigaVoltCharge:Play("targetyou")
			specWarnGigaVoltChargeFading:Schedule(10, DBM_CORE_BREAK_LOS)--Or self:IconNumToTexture(icon)
			specWarnGigaVoltChargeFading:ScheduleVoice(10, "mm"..icon)--TODO, more specific voice
			yellGigaVoltCharge:Yell(icon, icon, icon)
			yellGigaVoltChargeFades:Countdown(15, nil, icon)
		else
			local uId = DBM:GetRaidUnitId(args.destName)
			if self:IsTanking(uId) then
				specWarnGigaVoltChargeTaunt:Show(args.destName)
				specWarnGigaVoltChargeTaunt:Play("tauntboss")
			end
		end
		if self.Options.SetIconGigaVolt then
			self:SetIcon(args.destName, icon)
		end
		self.vb.gigaIcon = self.vb.gigaIcon + 1
	elseif spellId == 287167 then
		specWarnDiscombobulation:CombinedShow(0.3, args.destName)
		specWarnDiscombobulation:ScheduleVoice(0.3, "helpdispel")
	elseif spellId == 284168 then
		warnShrunk:CombinedShow(0.5, args.destName)
		--local icon = self.vb.shrunkIcon
		if args:IsPlayer() then
			specWarnShrunk:Show()
			specWarnShrunk:Play("targetyou")
			yellShrunk:Yell()
			if not self:IsLFR() then
				self:Unschedule(shrunkYellRepeater)
				self:Schedule(2, shrunkYellRepeater, self)
			end
		else
			local uId = DBM:GetRaidUnitId(args.destName)
			if self:IsTanking(uId) then
				specWarnShrunkTaunt:Show(args.destName)
				specWarnShrunkTaunt:Play("tauntboss")
			end
		end
		--if self.Options.SetIconShrunk2 then
		--	self:SetIcon(args.destName, icon)
		--end
		--self.vb.shrunkIcon = self.vb.shrunkIcon - 1
	elseif spellId == 289023 then
		if args:IsPlayer() then
			specWarnEnormous:Show()
			specWarnEnormous:Play("watchstep")
			yellEnormous:Yell()
		end
	elseif spellId == 286051 then
		warnHyperDrive:Show(args.destName)
	elseif spellId == 270447 then
		local amount = args.amount or 1
		if amount >= 8 and self:AntiSpam(5, 4) then
			if self:IsTanking("player", "boss1", nil, true) then
				specWarnElectroshockAmp:Show(amount)
				specWarnElectroshockAmp:Play("changemt")
			elseif not DBM:UnitDebuff("player", 284168, 287757) then--Don't have shrunk or giga
				specWarnElectroshockAmpOther:Show(args.destName)
				specWarnElectroshockAmpOther:Play("tauntboss")
			end
		end
	end
end
--mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 287757 or spellId == 286646 then--283409?
		if args:IsPlayer() then
			specWarnGigaVoltChargeFading:Cancel()
			specWarnGigaVoltChargeFading:CancelVoice()
			yellGigaVoltChargeFades:Cancel()
		end
		if self.Options.SetIconGigaVolt then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 284168 then
		--if self.Options.SetIconShrunk2 then
			--self:SetIcon(args.destName, 0)
		--end
		if args:IsPlayer() then
			self:Unschedule(shrunkYellRepeater)
		end
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE
--]]

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 146440 then--Shield Generator
	
	--elseif cid == 148123 then--Evil Twin (Mythic)

	end
end

--[[
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 274315 then

	end
end
--]]
