local mod	= DBM:NewMod(1664, "DBM-Party-Legion", 1, 740)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 14751 $"):sub(12, -3))
mod:SetCreatureID(98949)
mod:SetEncounterID(1834)
mod:SetZone()
mod:SetUsedIcons(1)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 198079",
	"SPELL_AURA_REMOVED 198079",
	"SPELL_CAST_START 198073",
--	"SPELL_PERIODIC_DAMAGE",
--	"SPELL_PERIODIC_MISSED",
	"UNIT_POWER_FREQUENT boss1"
)

--TODO, maybe inverse info frame, show who can soak still, vs those who cannot
--TODO, actually get heroic log and see timing of gaze/charge stuff so voices/warnings can be placed properly
local warnHatefulGaze				= mod:NewTargetAnnounce(198079, 4)

local specWarnStomp					= mod:NewSpecialWarningSpell(198073, nil, nil, nil, 2, 2)
local specWarnHatefulGaze			= mod:NewSpecialWarningYou(198079, nil, nil, nil, 1)
local yellHatefulGaze				= mod:NewYell(198079)
local specWarnBrutalHaymakerSoon	= mod:NewSpecialWarningSoon(198245, "Tank|Healer", nil, nil, 1)--Face fuck soon
local specWarnBrutalHaymaker		= mod:NewSpecialWarningSpell(198245, "Tank", nil, nil, 3, 2)--Incoming face fuck

local timerStompCD					= mod:NewNextTimer(17, 198073, nil, nil, nil, 2)

local voiceStomp					= mod:NewVoice(198073)--carefly
local voiceBrutalHeymaker			= mod:NewVoice(198073, "Tank|Healer")--defensive

mod:AddInfoFrameOption(198080)
mod:AddSetIconOption("SetIconOnHatefulGaze", 198079, true)

function mod:OnCombatStart(delay)
	timerStompCD:Start(12-delay)
	if not self:IsNormal() then
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(GetSpellInfo(198080))
			DBM.InfoFrame:Show(5, "playerbaddebuff", 198080)
		end
	end
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 198079 then
		warnHatefulGaze:Show(args.destName)
		if args:IsPlayer() then
			specWarnHatefulGaze:Show()
			yellHatefulGaze:Yell()
		end
		if self.Options.SetIconOnHatefulGaze then
			self:SetIcon(args.destName, 1)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 198079 and self.Options.SetIconOnHatefulGaze then
		self:SetIcon(args.destName, 0)
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 198073 then
		specWarnStomp:Show()
		timerStompCD:Start()
		voiceStomp:Play("carefly")
	elseif spellId == 198245 then
		specWarnBrutalHaymaker:Show()
		if self:IsTank() then
			voiceBrutalHeymaker:Play("defensive")
		else
			voiceBrutalHeymaker:Play("tankheal")
		end
	end
end

do
	local warnedSoon = false
	local UnitPower = UnitPower
	function mod:UNIT_POWER_FREQUENT(uId)
		local power = UnitPower(uId)
		if power >= 85 and not warnedSoon then
			warnedSoon = true
			specWarnBrutalHaymakerSoon:Show()
			voiceBrutalHeymaker:Play("energyhigh")
		elseif power < 50 and warnedSoon then
			warnedSoon = false
		end
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 153616 and destGUID == UnitGUID("player") and self:AntiSpam(2, 1) then

	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 153500 then

	end
end
--]]
