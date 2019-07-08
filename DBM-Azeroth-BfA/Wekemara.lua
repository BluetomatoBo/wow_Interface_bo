local mod	= DBM:NewMod(2363, "DBM-Azeroth-BfA", nil, 1028)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("2019070712251")
mod:SetCreatureID(152671)--155702/spawn-of-wekemara
mod:SetEncounterID(2318)
mod:SetReCombatTime(20)
mod:SetZone()
--mod:SetMinSyncRevision(11969)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 303319",
	"SPELL_CAST_SUCCESS 303488",
	"SPELL_AURA_APPLIED 303488 303451",
	"SPELL_AURA_REMOVED 303488"
)

--TODO, fix event for electric Discharge
--TODO, Upon reaching 50% health, Wekemara will submerge and summon Spawns of Wekemara. Boss doesn't return until all adds dead
--https://www.wowhead.com/spell=303379/electrified-splash is probably way to detect submerge, but not coded yet in case wrong event (wrong one would spam)
local warnElectricDischarge			= mod:NewSpellAnnounce(303451, 2)

local specWarnBioelectricBlast		= mod:NewSpecialWarningRun(303319, "Melee", nil, nil, 4, 2)
local specWarnShockBurst			= mod:NewSpecialWarningMoveAway(303488, nil, nil, nil, 1, 2)
local yellShockBurst				= mod:NewYell(303488)
local yellShockBurstFades			= mod:NewShortFadesYell(303488)
--local specWarnGTFO				= mod:NewSpecialWarningGTFO(238028, nil, nil, nil, 1, 8)

local timerBioelectricblastCD		= mod:NewCDTimer(23.2, 303319, nil, nil, nil, 3, nil, DBM_CORE_DEADLY_ICON)
local timerShockburstCD				= mod:NewCDTimer(23.6, 303488, nil, nil, nil, 3)
local timerElectricDischargeCD		= mod:NewCDTimer(23.6, 303451, nil, nil, nil, 2, nil, DBM_CORE_HEALER_ICON)

--mod:AddReadyCheckOption(37460, false)

function mod:OnCombatStart(delay, yellTriggered)
	if yellTriggered then
		timerBioelectricblastCD:Start(1-delay)
		timerShockburstCD:Start(1-delay)
		timerElectricDischargeCD:Start(1-delay)
	end
end

function mod:OnCombatEnd()

end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 303319 then
		specWarnBioelectricBlast:Show()
		specWarnBioelectricBlast:Play("justrun")
		timerBioelectricblastCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 303488 then
		timerShockburstCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 303488 then
		if args:IsPlayer() then
			specWarnShockBurst:Show()
			specWarnShockBurst:Play("runout")
			yellShockBurst:Yell()
			yellShockBurstFades:Countdown(spellId)
		end
	elseif spellId == 303451 then
		warnElectricDischarge:Show()
		timerElectricDischargeCD:Start()
	end
end

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 303488 then
		if args:IsPlayer() then
			yellShockBurstFades:Cancel()
		end
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 228007 and destGUID == UnitGUID("player") and self:AntiSpam(2, 1) then
		specWarnGTFO:Show()
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 257939 then
	end
end
--]]
