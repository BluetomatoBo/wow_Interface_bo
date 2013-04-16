local mod	= DBM:NewMod(818, "DBM-ThroneofThunder", nil, 362)
local L		= mod:GetLocalizedStrings()
--BH ADD
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 9288 $"):sub(12, -3))
mod:SetCreatureID(68036)--Crimson Fog 69050, 
mod:SetModelID(47189)
mod:SetUsedIcons(7, 6, 4, 1)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"SPELL_PERIODIC_DAMAGE",
	"SPELL_PERIODIC_MISS",
	"CHAT_MSG_MONSTER_EMOTE",
	"UNIT_DIED",
	"UNIT_AURA",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local warnHardStare					= mod:NewSpellAnnounce(133765, 3, nil, mod:IsTank() or mod:IsHealer())--Announce CAST not debuff, cause it misses a lot, plus we have 1 sec to hit an active mitigation
local warnForceOfWill				= mod:NewTargetAnnounce(136413, 4)
local warnLingeringGaze				= mod:NewTargetAnnounce(138467, 3)--Seems highly variable Cd so no timer for this yet
mod:AddBoolOption("warnBeam", nil, "announce")
local warnBeamNormal				= mod:NewAnnounce("warnBeamNormal", 4, 139204, true, false)
local warnBeamHeroic				= mod:NewAnnounce("warnBeamHeroic", 4, 139204, true, false)
local warnAddsLeft					= mod:NewAnnounce("warnAddsLeft", 2, 134123)
local warnDisintegrationBeam		= mod:NewSpellAnnounce("ej6882", 4)
local warnLifeDrain					= mod:NewTargetAnnounce(133795, 3)--Some times needs to block this even dps. So warn for everyone.
local warnDarkParasite				= mod:NewTargetAnnounce(133597, 3, nil, mod:IsHealer())--Heroic
local warnIceWall					= mod:NewSpellAnnounce(134587, 3)

local specWarnSeriousWound			= mod:NewSpecialWarningStack(133767, mod:IsTank(), 4)--This we will use debuff on though.
local specWarnSeriousWoundOther		= mod:NewSpecialWarningTarget(133767, mod:IsTank())
local specWarnForceOfWill			= mod:NewSpecialWarningYou(136413, nil, nil, nil, 3)--VERY important, if you get hit by this you are out of fight for rest of pull.
local specWarnForceOfWillNear		= mod:NewSpecialWarningClose(136413, nil, nil, nil, 3)
local yellForceOfWill				= mod:NewYell(136413)
local specWarnLingeringGaze			= mod:NewSpecialWarningYou(134044)
local yellLingeringGaze				= mod:NewYell(134044, nil, false)
local specWarnLingeringGazeMove		= mod:NewSpecialWarningMove(134044)
local specWarnBlueBeam				= mod:NewSpecialWarning("specWarnBlueBeam", nil, nil, nil, 3)
local specWarnBlueBeamLFR			= mod:NewSpecialWarningYou(139202, true, false)
local specWarnRedBeam				= mod:NewSpecialWarningYou(139204)
local specWarnYellowBeam			= mod:NewSpecialWarningYou(133738)
local specWarnDarkParasite			= mod:NewSpecialWarningYou(133597)
local yellDarkParasite				= mod:NewYell(133597)
local specWarnFogRevealed			= mod:NewSpecialWarning("specWarnFogRevealed", nil, nil, nil, 2)--Use another "Be Aware!" sound because Lingering Gaze comes on Spectrum phase.
local specWarnDisintegrationBeam	= mod:NewSpecialWarningSpell("ej6882", nil, nil, nil, 2)
local specWarnEyeSore				= mod:NewSpecialWarningMove(140502)
local specWarnLifeDrain				= mod:NewSpecialWarningTarget(133795, mod:IsTank())
local yellLifeDrain					= mod:NewYell(133795, nil, false)
local specWarnHold					= mod:NewSpecialWarning("specWarnHold", nil, nil, nil, 2)

local timerHardStareCD				= mod:NewCDTimer(12, 133765, mod:IsTank() or mod:IsHealer())--10 second cd but delayed by everything else. Example variation, 12, 15, 9, 25, 31
local timerSeriousWound				= mod:NewTargetTimer(60, 133767, mod:IsTank() or mod:IsHealer())
local timerLingeringGazeCD			= mod:NewCDTimer(46, 138467)
local timerForceOfWillCD			= mod:NewCDTimer(20, 136413)--Actually has a 20 second cd but rarely cast more than once per phase because of how short the phases are (both beams phases cancel this ability)
local timerLightSpectrumCD			= mod:NewNextTimer(60, "ej6891")--Don't know when 2nd one is cast.
local timerDarkParasite				= mod:NewTargetTimer(30, 133597, mod:IsHealer())--Only healer/dispeler needs to know this.
local timerDarkParasiteCD			= mod:NewNextTimer(62, 133597)
local timerDarkPlague				= mod:NewTargetTimer(30, 133598)--EVERYONE needs to know this, if dispeler messed up and dispelled parasite too early you're going to get a new add every 3 seconds for remaining duration of this bar.
local timerDisintegrationBeam		= mod:NewBuffActiveTimer(64, "ej6882")
local timerDisintegrationBeamCD		= mod:NewNextTimer(127, "ej6882")
local timerLifeDrainCD				= mod:NewCDTimer(40, 133795)
local timerLifeDrain				= mod:NewBuffActiveTimer(18, 133795)
local timerIceWallCD				= mod:NewNextTimer(120, 134587)
local timerObliterateCD				= mod:NewNextTimer(80, 137747)--Heroic

--BH DELETE local soundLingeringGaze			= mod:NewSound(134044)

local berserkTimer					= mod:NewBerserkTimer(600)

--mod:AddBoolOption("ArrowOnBeam", true)
mod:AddBoolOption("SetIconRays", true)
mod:AddBoolOption("SetIconLifeDrain", true)
mod:AddBoolOption("InfoFrameLife", not mod:IsHealer()) -- may be need special warning or generic warning high stack player? or do not needed at all?
mod:AddBoolOption("InfoFrame", mod:IsHealer()) -- may be need special warning or generic warning high stack player? or do not needed at all?
mod:AddBoolOption("Sayam", true, "sound")

local totalFogs = 3
local lingeringGazeTargets = {}
local lingeringGazeCD = 46
local lastRed = nil
local lastBlue = nil
local lastYellow = nil
local spectrumStarted = false
local lifeDrained = false
local lfrCrimsonFogRevealed = false
local lfrAmberFogRevealed = false
local lfrAzureFogRevealed = false
local lfrEngaged = false
local blueTracking = GetSpellInfo(139202)
local redTracking = GetSpellInfo(139204)
local crimsonFog = EJ_GetSectionInfo(6892)
local amberFog = EJ_GetSectionInfo(6895)
local azureFog = EJ_GetSectionInfo(6898)

--BH ADD
local rgbcount = 0
local lifecount = 0
local paracount = 0
local lightmaker = {}
local linemaker = {}
mod:AddBoolOption("HudMAP", true, "sound")
mod:AddBoolOption("DXsound", false, "sound")
mod:AddDropdownOption("optDD", {"nodd", "DD1", "DD2", "DD3"}, "nodd", "sound")
mod:AddEditBoxOption("soundhold", 50, "20", "sound")
mod:AddEditBoxOption("xx1", 300, L.xx1noset, "sound")
mod:AddEditBoxOption("xx2", 300, L.xx2noset, "sound")
mod:AddEditBoxOption("xx3", 300, L.xx3noset, "sound")
local DBMHudMap = DBMHudMap
local free = DBMHudMap.free
local function register(e)	
	DBMHudMap:RegisterEncounterMarker(e)
	return e
end

local function lightchoose()
	if ((rgbcount == 1) and (mod.Options.optDD == "DD1")) or ((rgbcount == 2) and (mod.Options.optDD == "DD3")) or ((rgbcount == 3) and (mod.Options.optDD == "DD2"))then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hsfd.mp3") --紅色分擔
		if mod.Options.HudMAP then
			lightmaker[lastRed] = register(DBMHudMap:AddEdge(0, 0, 1, 1, 10, "player", lastRed))
		end
	elseif ((rgbcount == 1) and (mod.Options.optDD == "DD2")) or ((rgbcount == 2) and (mod.Options.optDD == "DD1")) or ((rgbcount == 3) and (mod.Options.optDD == "DD3"))then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hufd.mp3") --黃色分擔
		if mod.Options.HudMAP then
			lightmaker[lastYellow] = register(DBMHudMap:AddEdge(0, 0, 1, 1, 10, "player", lastYellow))
		end
	elseif ((rgbcount == 1) and (mod.Options.optDD == "DD3")) or ((rgbcount == 2) and (mod.Options.optDD == "DD2")) or ((rgbcount == 3) and (mod.Options.optDD == "DD1"))then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_lsfd.mp3") --藍色分擔
		if mod.Options.HudMAP then
			lightmaker[lastBlue] = register(DBMHudMap:AddEdge(0, 0, 1, 1, 10, "player", lastBlue))
		end
	end
end

--BH ADD END

local function warnLingeringGazeTargets()
	warnLingeringGaze:Show(table.concat(lingeringGazeTargets, "<, >"))
	table.wipe(lingeringGazeTargets)
end

local function warnBeam()
	if mod:IsDifficulty("heroic10", "heroic25", "lfr25") then
		warnBeamHeroic:Show(lastRed, lastBlue, lastYellow)
	else
		warnBeamNormal:Show(lastRed, lastBlue)
	end
end

local function BeamEnded()
--[[	if mod.Options.ArrowOnBeam then
		DBM.Arrow:Hide()
	end--]]
	timerLingeringGazeCD:Start(17)
	timerForceOfWillCD:Start(19)
	if mod:IsDifficulty("heroic10", "heroic25") then
		timerIceWallCD:Start(26)
	end
	if mod:IsDifficulty("lfr25") then
		timerLightSpectrumCD:Start(66)
		timerDisintegrationBeamCD:Start(186)
		mod:Schedule(176, function()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_tenwj.mp3") --10秒後瓦解光束
			sndWOP:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(6, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")	
			sndWOP:Schedule(7, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(8, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(9, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		end)
	else
		timerLightSpectrumCD:Start(33)
		timerDisintegrationBeamCD:Start()
		mod:Schedule(117, function()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_tenwj.mp3") --10秒後瓦解光束
			sndWOP:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(6, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")	
			sndWOP:Schedule(7, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(8, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(9, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		end)
	end
	--Life Drain comes beam ended after 1~3 sec.
end

local function HideInfoFrame()
	if mod.Options.InfoFrameLife then
		DBM.InfoFrame:Hide()
	end
	if mod.Options.InfoFrame and mod:IsDifficulty("heroic10", "heroic25") then
		DBM.InfoFrame:SetHeader(GetSpellInfo(133597).."("..paracount..")")
		DBM.InfoFrame:Show(3, "playerdebuffstackstime", 133597)
	end
end

function mod:OnCombatStart(delay)
	lingeringGazeCD = 46
	lastRed = nil
	lastBlue = nil
	lastYellow = nil
	spectrumStarted = false
	lifeDrained = false
	lfrCrimsonFogRevealed = false
	lfrAmberFogRevealed = false
	lfrAzureFogRevealed = false
	--BH ADD
	rgbcount = 0
	lifecount = 0
	paracount = 0	
	table.wipe(lightmaker)
	table.wipe(linemaker)
	--BH ADD END
	table.wipe(lingeringGazeTargets)
	timerHardStareCD:Start(5-delay)
	timerLingeringGazeCD:Start(15.5-delay)
	timerForceOfWillCD:Start(33.5-delay)
	timerLightSpectrumCD:Start(41-delay)
	timerDarkParasiteCD:Start(-delay)
	if self:IsDifficulty("heroic10", "heroic25") then
		timerIceWallCD:Start(128-delay)
	end
	if mod:IsDifficulty("lfr25") then
		lfrEngaged = true
		timerLifeDrainCD:Start(151)
		timerDisintegrationBeamCD:Start(161-delay)
		self:Schedule(151, function()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_tenwj.mp3") --10秒後瓦解光束
			sndWOP:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(6, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")	
			sndWOP:Schedule(7, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(8, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(9, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		end)
	else
		timerLifeDrainCD:Start(210)
		timerDisintegrationBeamCD:Start(135-delay)
		self:Schedule(125, function()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_tenwj.mp3") --10秒後瓦解光束
			sndWOP:Schedule(5, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(6, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")	
			sndWOP:Schedule(7, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(8, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(9, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
		end)
	end
	berserkTimer:Start(-delay)
end

function mod:OnCombatEnd()
--[[	if self.Options.ArrowOnBeam then
		DBM.Arrow:Hide()
	end--]]
	lfrEngaged = false
	if self.Options.SetIconRays and lastRed then
		self:SetIcon(lastRed, 0)
		self:SetIcon(lastBlue, 0)
	end
	if self.Options.InfoFrame or self.Options.InfoFrameLife then
		DBM.InfoFrame:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 133765 then
		warnHardStare:Show()
		timerHardStareCD:Start()
	elseif args.spellId == 138467 then
		timerLingeringGazeCD:Start(lingeringGazeCD)
	elseif args.spellId == 136154 and self:IsDifficulty("lfr25") and not lfrCrimsonFogRevealed then--Only use in lfr.
		lfrCrimsonFogRevealed = true
		specWarnFogRevealed:Show(crimsonFog)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_hong.mp3") --紅色快打
	elseif args.spellId == 134587 and self:AntiSpam(3, 3) then
		warnIceWall:Show()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 133767 then
		timerSeriousWound:Start(args.destName)
		if (args.amount or 1) >= 5 then
			if args:IsPlayer() then
				specWarnSeriousWound:Show(args.amount)
			else
				if not UnitDebuff("player", GetSpellInfo(133767)) and not UnitIsDeadOrGhost("player") then
					specWarnSeriousWoundOther:Show(args.destName)
					if mod:IsTank() then
						sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\changemt.mp3") --換坦嘲諷
					end
				end
			end
		end
	elseif args.spellId == 133597 then--Dark Parasite
		warnDarkParasite:Show(args.destName)
		local _, _, _, _, _, duration, expires = UnitDebuff(args.destName, args.spellName)
		timerDarkParasite:Start(duration)
		if args:IsPlayer() then
			specWarnDarkParasite:Show()
			yellDarkParasite:Yell()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_nbjs.mp3")--你被寄生
			local soundholdtime = tonumber(mod.Options.soundhold)
			if soundholdtime > 0 then
				sndWOP:Schedule(soundholdtime, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\holdit.mp3") --快開自保
				specWarnHold:Schedule(soundholdtime,soundholdtime)
				self:Schedule(soundholdtime, function()
					if UnitDebuff("player", GetSpellInfo(133597)) then
						DBM.Flash:Show(1, 0, 0)
					end
				end)
			end
		elseif mod:IsHealer() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hajs.mp3")--黑暗寄生
		end
		if self:AntiSpam(5, 4) then
			paracount = paracount + 1
			if paracount == 1 then
				timerDarkParasiteCD:Start(60)
			elseif paracount == 2 then
				timerDarkParasiteCD:Start(78)
			elseif paracount == 3 then
				timerDarkParasiteCD:Start(72)
			elseif paracount == 4 then
				timerDarkParasiteCD:Start(117)
			elseif paracount == 5 then
				timerDarkParasiteCD:Start(72)
			end
			if mod.Options.InfoFrame then
				DBM.InfoFrame:SetHeader(GetSpellInfo(133597).."("..paracount..")")
				DBM.InfoFrame:Show(3, "playerdebuffstackstime", 133597)
			end
		end	
	elseif args.spellId == 133598 then--Dark Plague
		local _, _, _, _, _, duration, expires = UnitDebuff(args.destName, args.spellName)
		--maybe add a warning/special warning for everyone if duration is too high and many adds expected
		timerDarkPlague:Start(duration)
	elseif args.spellId == 134626 then
		lingeringGazeTargets[#lingeringGazeTargets + 1] = args.destName
		if args:IsPlayer() then
			specWarnLingeringGaze:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xxns.mp3")--小心凝視
			yellLingeringGaze:Yell()
--BH DELETE		soundLingeringGaze:Play()
		end
		self:Unschedule(warnLingeringGazeTargets)
		if #lingeringGazeTargets >= 5 and self:IsDifficulty("normal25", "heroic25") or #lingeringGazeTargets >= 2 and self:IsDifficulty("normal10", "heroic10") then--TODO, add LFR number of targets
			warnLingeringGazeTargets()
		else
			self:Schedule(0.5, warnLingeringGazeTargets)
		end
	elseif args.spellId == 137727 and self.Options.SetIconLifeDrain then -- Life Drain current target. If target warning needed, insert into this block. (maybe very spammy)
		self:SetIcon(args.destName, 4)--Triangle
	elseif args.spellId == 133798 then
		if (args.amount or 1) >= 2 and (args.amount or 1) % 2 == 0 then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_bmdx.mp3")--幫忙擋線
		end
		if args:IsPlayer() then
			if self.Options.Sayam then
				if (args.amount or 1) == 1 then
					local sayxx1 = mod.Options.xx1
					SendChatMessage(sayxx1, "SAY")
				elseif (args.amount or 1) == 2 then
					local sayxx2 = mod.Options.xx2
					SendChatMessage(sayxx2, "SAY")
				else
					local sayxx3 = mod.Options.xx3
					sayxx3 = sayxx3.."("..args.amount..args.amount..args.amount..args.amount..args.amount..args.amount..args.amount..")"
					SendChatMessage(sayxx3, "SAY")
				end
			end
		end
		if self.Options.InfoFrameLife then
			DBM.InfoFrame:Update("playerdebuffstacks")
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 133767 then
		timerSeriousWound:Cancel(args.destName)
	elseif args.spellId == 137727 and self.Options.SetIconLifeDrain then -- Life Drain current target.
		self:SetIcon(args.destName, 0)
	elseif args.spellId == 133597 then
		if args:IsPlayer() then
			sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\holdit.mp3")
			specWarnHold:Cancel()
		end
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, destName, _, _, spellId)
	if spellId == 134044 and destGUID == UnitGUID("player") and self:AntiSpam(3, 1) then
		specWarnLingeringGazeMove:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	end
	if not lfrEngaged or lfrAmberFogRevealed then return end -- To reduce cpu usage normal and heroic.
	if destName == amberFog and not lfrAmberFogRevealed then -- Lfr Amger fog do not have CLEU, no unit events and no emote.
		lfrAmberFogRevealed = true
		specWarnFogRevealed:Show(amberFog)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_huang.mp3") --黃色快打
	end
end

function mod:SPELL_MISSED(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 134044 and destGUID == UnitGUID("player") and self:AntiSpam(3, 1) then
		specWarnLingeringGazeMove:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 134755 and destGUID == UnitGUID("player") and self:AntiSpam(3, 2) then
		specWarnEyeSore:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3") --快躲開
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

--Blizz doesn't like combat log anymore
--Currently very bugged too so warnings aren't working right (since fight isn't working right)
--Beams wildly jump targets and don't give new target a warning at all nor does it even show in damn combat log.
function mod:CHAT_MSG_MONSTER_EMOTE(msg, npc, _, _, target)
	if msg:find("spell:136932") then--Force of Will
		local target = DBM:GetFullNameByShortName(target)
		warnForceOfWill:Show(target)
		if timerLightSpectrumCD:GetTime() > 22 or timerDisintegrationBeamCD:GetTime() > 110 then--Don't start timer if either beam or spectrum will come first (cause both disable force ability)
			timerForceOfWillCD:Start()
		end
		if target == UnitName("player") then
			specWarnForceOfWill:Show()
			yellForceOfWill:Yell()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\runaway.mp3")
			if not self:IsDifficulty("lfr25") then
				DBM.Flash:Show(1, 0, 0)				
			end
		else
			if not self:IsDifficulty("lfr25") then
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_xxjf.mp3") --小心擊飛
			end
			local uId = DBM:GetRaidUnitId(target)
			if uId then
				local x, y = GetPlayerMapPosition(uId)
				if x == 0 and y == 0 then
					SetMapToCurrentZone()
					x, y = GetPlayerMapPosition(uId)
				end
				local inRange = DBM.RangeCheck:GetDistance("player", x, y)
				if inRange and inRange < 16 then--Range hard to get perfect, a player 30 yards away might still be in it. I say 15 is probably good middle ground to catch most of the "near"
					specWarnForceOfWillNear:Show(target)
				end
			end
		end
	elseif msg:find("spell:134122") then--Blue Rays
		local target = DBM:GetFullNameByShortName(target)
		lingeringGazeCD = not spectrumStarted and 25 or 40 -- First spectrum Lingering Gaze CD = 25, second = 40
		spectrumStarted = true
		lastBlue = target
		--BH ADD
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_syg.mp3") --三原光準備		
		if rgbcount == 3 then rgbcount = 0 end
		rgbcount = rgbcount + 1
		--BH ADD END
		if target == UnitName("player") then
			if self:IsDifficulty("lfr25") and self.Options.specWarnBlueBeam then
				specWarnBlueBeamLFR:Show()
			else
				specWarnBlueBeam:Show()
			end
			DBM.Flash:Show(0, 0, 1)
			sndWOP:Schedule(1, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_lgzb.mp3") --藍光
		end
		if self.Options.SetIconRays then
			self:SetIcon(target, 6)--Square
		end
		self:Schedule(0.5, warnBeam)
	elseif msg:find("spell:134123") then--Infrared Light (red)
		local target = DBM:GetFullNameByShortName(target)
		lastRed = target
		if target == UnitName("player") then
			specWarnRedBeam:Show()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Schedule(1, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hgzb.mp3") --紅光
		end
		if self.Options.SetIconRays then
			self:SetIcon(target, 7)--Cross
		end
	elseif msg:find("spell:134124") then--useful only on heroic and LFR since there are only amber adds in them. Normal 10 and normal 25 do not have amber adds (why LFR does is beyond me)
		local target = DBM:GetFullNameByShortName(target)
		lastYellow = target
		totalFogs = 3
		lfrCrimsonFogRevealed = false
		lfrAmberFogRevealed = false
		lfrAzureFogRevealed = false
		timerForceOfWillCD:Cancel()
		if self:IsDifficulty("heroic10", "heroic25") then
			timerObliterateCD:Start()
			sndWOP:Schedule(80, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\dead.mp3")
			if lifeDrained then -- Check 1st Beam ended.
				timerIceWallCD:Start(87)--NO, Ice wall always comes before 8s do phase change(only igroned first spectrum). So it is not duplicate timer. Ice wall has nothing to do with 3rd red.
			end
		end
		--BH MODIFY
		if target == UnitName("player") then
			specWarnYellowBeam:Show()
			DBM.Flash:Show(1, 1, 0)			
			sndWOP:Schedule(1, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hgsd.mp3") --黃光
		end
		mod:Schedule(1.5, function()
			if (lastRed ~= UnitName("player")) and (lastBlue ~= UnitName("player")) and (lastYellow ~= UnitName("player")) then
				lightchoose()
			end
		end)
		--BH MODIFY END
		if self.Options.SetIconRays then
			self:SetIcon(target, 1, 10)--Star (auto remove after 10 seconds because this beam untethers one initial person positions it.
		end
	elseif npc == crimsonFog or npc == amberFog or npc == azureFog then
		if self:IsDifficulty("lfr25") and npc == azureFog and not lfrAzureFogRevealed then
			lfrAzureFogRevealed = true
			specWarnFogRevealed:Show(npc)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_lan.mp3") --藍色快打
		elseif not lfrAzureFogRevealed or not self:IsDifficulty("lfr25") then
			specWarnFogRevealed:Show(npc)
			--BH ADD
			if npc == azureFog then
				if lastBlue == UnitName("player") then
					DBM.Flash:Show(0, 1, 0)
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\stopmove.mp3") --停止移動
				else
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_lan.mp3") --藍色快打
				end
			elseif npc == crimsonFog then
				if lastRed == UnitName("player") then
					DBM.Flash:Show(1, 0, 0)
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\stopmove.mp3") --停止移動
				else
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_hong.mp3") --紅色快打
				end
			elseif npc == amberFog then
				DBM.Flash:Show(1, 1, 0)
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_huang.mp3") --黃色快打
			end
			--BH ADD END
		end
	elseif msg:find("spell:133795") then
		local target = DBM:GetFullNameByShortName(target)
		warnLifeDrain:Show(target)
		specWarnLifeDrain:Show(target)
		timerLifeDrain:Start()
		lifecount = lifecount + 1
		if lifecount == 3 then
			timerLifeDrainCD:Start(105)
		else
			timerLifeDrainCD:Start()
		end
		lifeDrained = true
		if target == UnitName("player") then
			yellLifeDrain:Yell()
		end
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_smxq.mp3") --生命吸取
		if self.Options.SetIconLifeDrain then
			self:SetIcon(target, 4) -- Triangle
		end
		if self.Options.InfoFrameLife then
			DBM.InfoFrame:SetHeader(GetSpellInfo(133795))
			DBM.InfoFrame:Show(5, "playerdebuffstacks", 133798)
		end
		self:Schedule(21, HideInfoFrame)
		if mod.Options.DXsound then
			linemaker[target] = register(DBMHudMap:AddEdge(1, 0, 0, 1, 1, "player", target))
			self:Schedule(1.5, function()
				linemaker[target] = register(DBMHudMap:AddEdge(1, 0, 0, 1, 1, "player", target))
			end)
			self:Schedule(3, function()
				linemaker[target] = register(DBMHudMap:AddEdge(1, 0, 0, 1, 1, "player", target))
			end)
			self:Schedule(4.5, function()
				linemaker[target] = register(DBMHudMap:AddEdge(1, 0, 0, 1, 1, "player", target))
			end)
		end
	elseif msg:find("spell:134169") then
		lingeringGazeCD = 46 -- Return to Original CD.
		timerForceOfWillCD:Cancel()
		timerLingeringGazeCD:Cancel()
		warnDisintegrationBeam:Show()
		specWarnDisintegrationBeam:Show()
		--Best to start next phase bars when this one ends, so artifically create a "phase end" trigger
		if self:IsDifficulty("lfr25") then
			timerDisintegrationBeam:Start(55)
			sndWOP:Schedule(51, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(52, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")	
			sndWOP:Schedule(53, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(54, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(55, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
			self:Schedule(55, BeamEnded)
		else
			timerDisintegrationBeam:Start()
			sndWOP:Schedule(60, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfive.mp3")
			sndWOP:Schedule(61, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countfour.mp3")	
			sndWOP:Schedule(62, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countthree.mp3")
			sndWOP:Schedule(63, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\counttwo.mp3")
			sndWOP:Schedule(64, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\countone.mp3")
			self:Schedule(64, BeamEnded)
		end
	end
end

--Because blizz sucks and these do NOT show in combat log AND the emote only fires for initial application, but not for when a player dies and beam jumps.
--Reports are this is majorly fucked up in LFR, because the antispam in name doesn't work with server names (wtf? maybe only happens if server name strip is turned on?)
--I will not be able to debug for several hours but commenting in case someone else runs LFR before I do in 5 hours
function mod:UNIT_AURA(uId)
	local name = DBM:GetUnitFullName(uId)
	if UnitDebuff(uId, blueTracking) and lastBlue ~= name then
--		print("DBM Debug - UnitName(): "..UnitName(uId))
--		print("DBM Debug - DBM:GetUnitFullName: "..DBM:GetUnitFullName(uId))
--		print("DBM Debug - lastBlue: "..lastBlue)
		lastBlue = name
		if name == UnitName("player") then
			if self:IsDifficulty("lfr25") and self.Options.specWarnBlueBeam then
				specWarnBlueBeamLFR:Show()
			else
				specWarnBlueBeam:Show()
			end
			DBM.Flash:Show(0, 0, 1)
			sndWOP:Schedule(1, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_lgzb.mp3") --藍光
		end
		if self.Options.SetIconRays then
			self:SetIcon(name, 6)--Square
		end
	elseif UnitDebuff(uId, redTracking) and lastRed ~= name then
		lastRed = name
		if name == UnitName("player") then
			specWarnRedBeam:Show()
			DBM.Flash:Show(1, 0, 0)
			sndWOP:Schedule(1, "Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\ex_tt_hgzb.mp3") --紅光
		end
		if self.Options.SetIconRays then
			self:SetIcon(name, 7)--Cross
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 69050 then--Crimson Fog
		totalFogs = totalFogs - 1
		if totalFogs >= 1 then
			warnAddsLeft:Show(totalFogs)
		else--No adds left, force ability is re-enabled
			timerObliterateCD:Cancel()
			sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\dead.mp3")
			timerForceOfWillCD:Start(15)
			if self.Options.SetIconRays and lastRed then
				self:SetIcon(lastRed, 0)
				self:SetIcon(lastBlue, 0)
			end
			lastRed = nil
			lastBlue = nil
			lastYellow = nil
		end
	elseif cid == 69051 then--Amber Fog
		--Maybe do something for heroic here too, if timers for the crap this thing does gets added.
		if self:IsDifficulty("lfr25") then
			totalFogs = totalFogs - 1
			if totalFogs >= 1 then
				--LFR does something completely different than kill 3 crimson adds to end phase. in LFR, they kill 1 of each color (which is completely against what you do in 10N, 25N, 10H, 25H)
				warnAddsLeft:Show(totalFogs)
			else--No adds left, force ability is re-enabled
				timerObliterateCD:Cancel()
				sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\dead.mp3")
				timerForceOfWillCD:Start(15)
				if self.Options.SetIconRays and lastRed then
					self:SetIcon(lastRed, 0)
					self:SetIcon(lastBlue, 0)
				end
				lastRed = nil
				lastBlue = nil
				lastYellow = nil
			end
		end
	elseif cid == 69052 then--Azure Fog (endlessly respawn in all but LFR, so we ignore them dying anywhere else)
		--Maybe do something for heroic here too, if timers for the crap this thing does gets added.
		if self:IsDifficulty("lfr25") then
			totalFogs = totalFogs - 1
			if totalFogs >= 1 then
				--LFR does something completely different than kill 3 crimson adds to end phase. in LFR, they kill 1 of each color (which is completely against what you do in 10N, 25N, 10H, 25H)
				warnAddsLeft:Show(totalFogs)
			else--No adds left, force ability is re-enabled
				timerObliterateCD:Cancel()
				sndWOP:Cancel("Interface\\AddOns\\DBM-Core\\extrasounds\\"..DBM.Options.CountdownVoice.."\\dead.mp3")
				timerForceOfWillCD:Start(15)
				if self.Options.SetIconRays and lastRed then
					self:SetIcon(lastRed, 0)
					self:SetIcon(lastBlue, 0)
				end
				lastRed = nil
				lastBlue = nil
				lastYellow = nil
			end
		end
	end
end

--As of live, they removed ability to detect this thus ability to detect beam direction also gone.
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, spellName, _, _, spellId)
	if spellId == 136316 and self:AntiSpam(2, 2) then--Disintegration Beam (clockwise)
--[[		timerLingeringGazeCD:Cancel()
		warnDisintegrationBeam:Show()
		specWarnDisintegrationBeam:Show(spellName, DBM_CORE_LEFT)
		timerDisintegrationBeam:Start()
		if self.Options.ArrowOnBeam then
			DBM.Arrow:ShowStatic(90)
		end
		self:Schedule(64, BeamEnded)--Best to start next phase bars when this one ends, so artifically create a "phase end" trigger--]]
		print("DBM Debug: Clockwise beam spellid re-enabled by blizzard.")
	elseif spellId == 133775 and self:AntiSpam(2, 2) then--Disintegration Beam (counter-clockwise)
--[[		timerLingeringGazeCD:Cancel()
		warnDisintegrationBeam:Show()
		specWarnDisintegrationBeam:Show(spellName, DBM_CORE_RIGHT)
		timerDisintegrationBeam:Start()
		if self.Options.ArrowOnBeam then
			DBM.Arrow:ShowStatic(270)
		end
		self:Schedule(64, BeamEnded)--Best to start next phase bars when this one ends, so artifically create a "phase end" trigger--]]
		print("DBM Debug: Counter-Clockwise beam spellid re-enabled by blizzard.")
	end
end