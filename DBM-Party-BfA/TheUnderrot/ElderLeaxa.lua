local mod	= DBM:NewMod(2157, "DBM-Party-BfA", 8, 1001)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 17588 $"):sub(12, -3))
mod:SetCreatureID(131318)
mod:SetEncounterID(2111)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 260879 260894 264757 264603"
)

--local warnSwirlingScythe			= mod:NewTargetAnnounce(195254, 2)

local specWarnBloodBolt				= mod:NewSpecialWarningInterrupt(260879, "HasInterrupt", nil, nil, 1, 2)
local specWarnCreepingRot			= mod:NewSpecialWarningDodge(260894, nil, nil, nil, 2, 2)
local specWarnSanguineFeast			= mod:NewSpecialWarningDodge(264757, nil, nil, nil, 2, 2)
--local yellSwirlingScythe			= mod:NewYell(195254)
--local specWarnGTFO				= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 2)

--TODO: Use NewNextSourceTimer to split adds from boss
local timerBloodBoltCD				= mod:NewAITimer(13, 260879, nil, nil, nil, 4, nil, DBM_CORE_INTERRUPT_ICON)
local timerCreepingRotCD			= mod:NewAITimer(13, 260894, nil, nil, nil, 3)
local timerSanguineFeastCD			= mod:NewAITimer(13, 264757, nil, nil, nil, 3, nil, DBM_CORE_HEROIC_ICON)
local timerBloodMirrorCD			= mod:NewAITimer(13, 264603, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)

mod:AddInfoFrameOption(260685, "Healer")

function mod:OnCombatStart(delay)
	timerBloodBoltCD:Start(1-delay)
	timerCreepingRotCD:Start(1-delay)
	timerBloodMirrorCD:Start(1-delay)
	if not self:IsNormal() then--Exclude normal, but allow heroic/mythic/mythic+
		timerSanguineFeastCD:Start(1-delay)
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(DBM:GetSpellInfo(260685))
		DBM.InfoFrame:Show(5, "playerdebuffstacks", 260685, 1)
	end
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 260879 and self:CheckInterruptFilter(args.sourceGUID, false, true) then
		specWarnBloodBolt:Show(args.sourceName)
		specWarnBloodBolt:Play("kickcast")
		local cid = self:GetCIDFromGUID(args.sourceGUID)
		if cid == 131318 then--Main boss
			timerBloodBoltCD:Start()
		else
		
		end
	elseif spellId == 260894 and self:AntiSpam(3, 1) then
		specWarnCreepingRot:Show()
		specWarnCreepingRot:Play("watchwave")
		local cid = self:GetCIDFromGUID(args.sourceGUID)
		if cid == 131318 then--Main boss
			timerCreepingRotCD:Start()
		else
		
		end
	elseif spellId == 264757 then
		specWarnSanguineFeast:Show()
		specWarnSanguineFeast:Play("watchstep")
		local cid = self:GetCIDFromGUID(args.sourceGUID)
		if cid == 131318 then--Main boss
			timerSanguineFeastCD:Start()
		else
		
		end
	elseif spellId == 264603 then
		timerBloodMirrorCD:Start()
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then
		specWarnGTFO:Show()
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 124396 then
		
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 257939 then
	end
end
--]]
