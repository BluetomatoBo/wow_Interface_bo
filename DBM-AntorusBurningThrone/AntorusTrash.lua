local mod	= DBM:NewMod("AntorusTrash", "DBM-AntorusBurningTomb")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 16034 $"):sub(12, -3))
--mod:SetModelID(47785)
mod:SetZone()
mod.isTrashMod = true


mod:RegisterEvents(
--	"SPELL_CAST_START",
--	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED 252760",
--	"SPELL_AURA_APPLIED_DOSE"
	"SPELL_AURA_REMOVED 252760"
)

local warnDemolish						= mod:NewTargetAnnounce(252760, 4)

local specWarnDemolish					= mod:NewSpecialWarningYou(252760, nil, nil, nil, 1, 2)
local yellDemolish						= mod:NewYell(252760)
local yellDemolishFades					= mod:NewShortFadesYell(252760)
--local specWarnShadowBoltVolley		= mod:NewSpecialWarningInterrupt(243171, "HasInterrupt", nil, nil, 1, 2)

local voiceDemolish						= mod:NewVoice(252760)--gathershare/targetyou
--local voiceShadowBoltVolley			= mod:NewVoice(243171, "HasInterrupt")--kickcast

mod:RemoveOption("HealthFrame")

--[[
function mod:SPELL_CAST_START(args)
	if not self.Options.Enabled then return end
	local spellId = args.spellId
	if spellId == 243171 and self:CheckInterruptFilter(args.sourceGUID) then
		specWarnShadowBoltVolley:Show(args.sourceName)
		voiceShadowBoltVolley:Play("kickcast")
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if not self.Options.Enabled then return end
	local spellId = args.spellId
	if spellId == 241360 then

	end
end
--]]

function mod:SPELL_AURA_APPLIED(args)
	if not self.Options.Enabled then return end
	local spellId = args.spellId
	if spellId == 252760 then
		warnDemolish:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnDemolish:Show()
			voiceDemolish:Play("targetyou")
			yellDemolish:Yell()
			local _, _, _, _, _, _, expires = UnitDebuff("player", args.spellName)
			local remaining = expires-GetTime()
			yellDemolishFades:Countdown(remaining)
		end
	end
end
--mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if not self.Options.Enabled then return end
	local spellId = args.spellId
	if spellId == 252760 then
		if args:IsPlayer() then
			yellDemolishFades:Cancel()
		end
	end
end
