local mod	= DBM:NewMod(1983, "DBM-AntorusBurningThrone", nil, 946)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 16369 $"):sub(12, -3))
mod:SetCreatureID(122366)
mod:SetEncounterID(2069)
mod:SetZone()
--mod:SetBossHPInfoToHighest()
mod:SetUsedIcons(1)
--mod:SetHotfixNoticeRev(16350)
mod.respawnTime = 29

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
--	"SPELL_CAST_START 243999",
	"SPELL_CAST_SUCCESS 243960 244093 243999",
	"SPELL_AURA_APPLIED 243961 244042 244094 248732 243968 243977 243980 243973",
--	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED 244042 244094",
	"SPELL_PERIODIC_DAMAGE 244005 248740",
	"SPELL_PERIODIC_MISSED 244005 248740",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, icons on necrotic embrace?
--[[
(ability.id = 243960 or ability.id = 244093 or ability.id = 243999 or ability.id = 244042) and type = "cast"
 or (ability.id = 243968 or ability.id = 243977 or ability.id = 243980 or ability.id = 243973) and type = "applydebuff" and target.name = "Omegal"
 or ability.id = 26662
--]]
--Torments of the Shivarra
local warnTormentofFlames				= mod:NewSpellAnnounce(243967, 2)
local warnTormentofFrost				= mod:NewSpellAnnounce(243976, 2)
local warnTormentofFel					= mod:NewSpellAnnounce(243979, 2)
local warnTormentofShadows				= mod:NewSpellAnnounce(243974, 2)
--The Fallen Nathrezim
local warnShadowStrike					= mod:NewSpellAnnounce(243960, 2, nil, "Tank", 2)--Doesn't need special warning because misery should trigger special warning at same time
local warnMarkedPrey					= mod:NewTargetAnnounce(243974, 3)
local warnNecroticEmbrace				= mod:NewTargetAnnounce(244094, 4)
local warnEchoesofDoom					= mod:NewTargetAnnounce(248732, 3)

--Torments of the Shivarra
local specWarnGTFO						= mod:NewSpecialWarningGTFO(243968, nil, nil, nil, 1, 2)
--The Fallen Nathrezim
local specWarnMisery					= mod:NewSpecialWarningYou(243961, nil, nil, nil, 1, 2)
local specWarnMiseryTaunt				= mod:NewSpecialWarningTaunt(243961, nil, nil, nil, 1, 2)
local specWarnDarkFissure				= mod:NewSpecialWarningDodge(243999, nil, nil, nil, 2, 2)
local specWarnMarkedPrey				= mod:NewSpecialWarningYou(243974, nil, nil, nil, 1, 2)
local yellMarkedPrey					= mod:NewFadesYell(243974)
local specWarnNecroticEmbrace			= mod:NewSpecialWarningMoveAway(244094)
local yellNecroticEmbrace				= mod:NewFadesYell(244094)
local specWarnEchoesOfDoom				= mod:NewSpecialWarningMoveAway(248732)
local yellEchoesOfDoom					= mod:NewYell(248732)

--Torments of the Shivarra
--local timerTormentsCD					= mod:NewAITimer(61, "ej15778", nil, nil, nil, 6)--Temp, until order and actual cds of each torment are known and can be hardcoded
local timerTormentofFlamesCD			= mod:NewNextTimer(5, 243967, nil, nil, nil, 6)
local timerTormentofFrostCD				= mod:NewNextTimer(61, 243976, nil, nil, nil, 6)
local timerTormentofFelCD				= mod:NewNextTimer(61, 243979, nil, nil, nil, 6)
local timerTormentofShadowsCD			= mod:NewNextTimer(61, 243974, nil, nil, nil, 6)
--The Fallen Nathrezim
local timerShadowStrikeCD				= mod:NewCDTimer(9.7, 243960, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)
local timerDarkFissureCD				= mod:NewCDTimer(32, 243999, nil, nil, nil, 3)
local timerMarkedPreyCD					= mod:NewCDTimer(30.3, 244042, nil, nil, nil, 3)
local timerNecroticEmbraceCD			= mod:NewCDTimer(30.3, 244093, nil, nil, nil, 3)

local berserkTimer						= mod:NewBerserkTimer(390)

--The Fallen Nathrezim
local countdownShadowStrike				= mod:NewCountdown("Alt9", 243960, "Tank")
local countdownMarkedPrey				= mod:NewCountdown(30, 244042)
local countdownNecroticEmbrace			= mod:NewCountdown("AltTwo30", 244093)

--Torments of the Shivarra
local voiceGTFO							= mod:NewVoice(243968, nil, DBM_CORE_AUTO_VOICE4_OPTION_TEXT)--runaway
local voicePhaseChange					= mod:NewVoice(nil, nil, DBM_CORE_AUTO_VOICE2_OPTION_TEXT)
--The Fallen Nathrezim
local voiceMisery						= mod:NewVoice(243961)--defensive/tauntboss
local voiceDarkFissure					= mod:NewVoice(243999)--watchstep
local voiceMarkedPrey					= mod:NewVoice(243974)--targetyou
local voiceNecroticEmbrace				= mod:NewVoice(244094)--scatter
local voiceEchoesOfDoom					= mod:NewVoice(248732)--runout

mod:AddSetIconOption("SetIconOnMarkedPrey", 244042, true)
--mod:AddInfoFrameOption(239154, true)
mod:AddRangeFrameOption("8/10")

mod.vb.currentTorment = 0--Can't antispam, cause it'll just break if someone dies and gets brezzed

function mod:OnCombatStart(delay)
	self.vb.currentTorment = 0
	timerTormentofFlamesCD:Start(5-delay)
	timerShadowStrikeCD:Start(9.6-delay)
	countdownShadowStrike:Start(9.6-delay)
	timerDarkFissureCD:Start(17.9-delay)--success
	timerMarkedPreyCD:Start(25.7-delay)
	countdownMarkedPrey:Start(25.7-delay)
	if self:IsHard() then
		timerNecroticEmbraceCD:Start(35-delay)
		countdownNecroticEmbrace:Start(35-delay)
		berserkTimer:Start(390-delay)--Assumed until proven otherwise
	else
		berserkTimer:Start(390-delay)--Confirmed on normal, 30 seconds after shadows soft enrage
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(8)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
--	if self.Options.InfoFrame then
--		DBM.InfoFrame:Hide()
--	end
end

--[[
function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 243999 then
		specWarnDarkFissure:Show()
		voiceDarkFissure:Play("watchstep")
		timerDarkFissureCD:Start()
	end
end
--]]

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 243960 then
		warnShadowStrike:Show()
		timerShadowStrikeCD:Show()
		countdownShadowStrike:Start(9.7)
	elseif spellId == 244093 then--Necrotic Embrace Cast
		timerNecroticEmbraceCD:Start()
		countdownNecroticEmbrace:Start(30.3)
	elseif spellId == 243999 then
		specWarnDarkFissure:Show()
		voiceDarkFissure:Play("watchstep")
		timerDarkFissureCD:Start()
	elseif spellId == 122366 then
		timerMarkedPreyCD:Start()
		countdownMarkedPrey:Start(30.3)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 243961 and self.vb.currentTorment ~= 4 then--If current torment is shadow, disable these warnings, Because entire raid now has misery rest of fight
		if args:IsPlayer() then
			specWarnMisery:Show()
			voiceMisery:Play("defensive")
		else
			local uId = DBM:GetRaidUnitId(args.destName)
			--Applied to a tank that's not you and you don't have it, taunt
			if uId and self:IsTanking(uId) and not UnitDebuff("player", args.spellName) then
				specWarnMiseryTaunt:Show(args.destName)
				voiceMisery:Play("tauntboss")
			end
		end
	elseif spellId == 244042 then
		if args:IsPlayer() then
			specWarnMarkedPrey:Show()
			voiceMarkedPrey:Play("targetyou")
			yellMarkedPrey:Yell(5)
			yellMarkedPrey:Countdown(5)
		else
			warnMarkedPrey:Show(args.destName)
		end
	elseif spellId == 244094 then
		if args:IsPlayer() then
			specWarnNecroticEmbrace:Show()
			voiceNecroticEmbrace:Play("scatter")
			yellNecroticEmbrace:Countdown(4, 4)
		else
			warnNecroticEmbrace:CombinedShow(0.3, args.destName)--Combined message because even if it starts on 1, people are gonna fuck it up
		end
	elseif spellId == 248732 then
		warnEchoesofDoom:CombinedShow(0.5, args.destName)--In case multiple shadows up
		if args:IsPlayer() then
			specWarnEchoesOfDoom:Show()
			voiceEchoesOfDoom:Play("runout")
			yellEchoesOfDoom:Yell()
		end
	elseif spellId == 243968 and self.vb.currentTorment ~= 1 then--Flame
		self.vb.currentTorment = 1
		warnTormentofFlames:Show()
		voicePhaseChange:Play("phasechange")
		if not self:IsEasy() then--No frost or fel in normal, LFR assumed
			timerTormentofFrostCD:Start(120)
		else
			timerTormentofShadowsCD:Start(361)
		end
	elseif spellId == 243977 and self.vb.currentTorment ~= 2 then--Frost
		self.vb.currentTorment = 2
		warnTormentofFrost:Show()
		voicePhaseChange:Play("phasechange")
		timerTormentofFelCD:Start(115)--No fel or frost in normal, no reason to filter cause forst won't even happen
	elseif spellId == 243980 and self.vb.currentTorment ~= 3 then--Fel
		self.vb.currentTorment = 3
		warnTormentofFel:Show()
		voicePhaseChange:Play("phasechange")
		timerTormentofShadowsCD:Start(121)--(361 after pull technically, same as normal). No fel or frost in normal, no reason to filter cause fel won't even happen
	elseif spellId == 243973 and self.vb.currentTorment ~= 4 then--Shadow
		self.vb.currentTorment = 4
		warnTormentofShadows:Show()
		voicePhaseChange:Play("phasechange")
	end
end
--mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 244042 then
		if args:IsPlayer() then
			yellMarkedPrey:Cancel()
		end
	elseif spellId == 244094 then
		if args:IsPlayer() then
			yellNecroticEmbrace:Cancel()
		end
	end
end

--Dark Fissure & Echoes of Doom
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if (spellId == 244005 or spellId == 248740) and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnGTFO:Show()
		voiceGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

--[[
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 243967 then--Torment of Flames
		--warnTormentofFlames:Show()
	elseif spellId == 243976 then--Torment of Frost
		--warnTormentofFrost:Show()
	elseif spellId == 243979 then--Torment of Fel
		--warnTormentofFel:Show()
	elseif spellId == 243974 then--Torment of Shadows
		--warnTormentofShadows:Show()
	end
end
--]]
