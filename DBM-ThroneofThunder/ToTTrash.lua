local mod	= DBM:NewMod("ToTTrash", "DBM-ThroneofThunder")
local L		= mod:GetLocalizedStrings()
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 9003 $"):sub(12, -3))
--mod:SetModelID(39378)
mod:SetZone()

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"UNIT_DIED",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local warnStormEnergy			= mod:NewTargetAnnounce(139322, 4)
local warnSpiritFire			= mod:NewTargetAnnounce(139895, 3)--This is morchok entryway trash that throws rocks at random poeple.
local warnStormCloud			= mod:NewTargetAnnounce(139900, 4)
local warnFixated				= mod:NewSpellAnnounce(140306, 3)
local warnConductiveShield		= mod:NewTargetAnnounce(140296, 4)

local specWarnStormEnergy		= mod:NewSpecialWarningYou(139322)
local specWarnStormCloud		= mod:NewSpecialWarningYou(139900)
local specWarnSonicScreech		= mod:NewSpecialWarningInterrupt(136751)
local specWarnConductiveShield	= mod:NewSpecialWarningTarget(140296)

local timerSpiritfireCD			= mod:NewCDTimer(12, 139895)
local timerFixatedCD			= mod:NewNextTimer(15.7, 140306)
local timerConductiveShieldCD	= mod:NewNextSourceTimer(20, 140296)

mod:RemoveOption("HealthFrame")
mod:RemoveOption("SpeedKillTimer")
mod:AddBoolOption("RangeFrame")

mod:AddBoolOption("HudMAP", true, "sound")

local DBMHudMap = DBMHudMap
local free = DBMHudMap.free
local function register(e)	
	DBMHudMap:RegisterEncounterMarker(e)
	return e
end
local lightmaker = {}

local stormEnergyTargets = {}
local stormCloudTargets = {}

local function warnStormEnergyTargets()
	warnStormEnergy:Show(table.concat(stormEnergyTargets, "<, >"))
	table.wipe(stormEnergyTargets)
end

local function warnStormCloudTargets()
	warnStormCloud:Show(table.concat(stormCloudTargets, "<, >"))
	table.wipe(stormCloudTargets)
end

function mod:SpiritFireTarget(sGUID)
	local targetname = nil
	for i=1, DBM:GetNumGroupMembers() do
		if UnitGUID("raid"..i.."target") == sGUID then
			targetname = DBM:GetUnitFullName("raid"..i.."targettarget")
			break
		end
	end
	if targetname and self:AntiSpam(2, targetname) then--Anti spam using targetname as an identifier, will prevent same target being announced double/tripple but NOT prevent multiple targets being announced at once :)
		warnSpiritFire:Show(targetname)
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 139895 then
		self:ScheduleMethod(0.2, "SpiritFireTarget", args.sourceGUID)--Untested scan timing (don't even know if scanning works
		timerSpiritfireCD:Start()
		if self.Options.RangeFrame and not DBM.RangeCheck:IsShown() then
			DBM.RangeCheck:Show(3)
		end
	elseif args.spellId == 136751 and (args.sourceGUID == UnitGUID("target") or args.sourceGUID == UnitGUID("focus")) then
		specWarnSonicScreech:Show(args.sourceName)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\kickcast.mp3")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 139322 then--Or 139559, not sure which
		stormEnergyTargets[#stormEnergyTargets + 1] = args.destName
		if args:IsPlayer() then
			DBM.Flash:Show(1, 0, 0)
			specWarnStormEnergy:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runout.mp3")
		else
			lightmaker[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", args.destName, 10, 10, 1, 1, 1, 0.7):RegisterForAlerts())
		end
		if self.Options.RangeFrame and not DBM.RangeCheck:IsShown() then
			DBM.RangeCheck:Show(10)
		end
		self:Unschedule(warnStormEnergyTargets)
		self:Schedule(1, warnStormEnergyTargets)
	elseif args.spellId == 139900 then
		stormCloudTargets[#stormCloudTargets + 1] = args.destName
		if args:IsPlayer() then
			DBM.Flash:Show(1, 0, 0)			
			specWarnStormCloud:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runout.mp3")
		else
			lightmaker[args.destName] = register(DBMHudMap:PlaceRangeMarkerOnPartyMember("timer", args.destName, 10, 60, 1, 1, 1, 0.7):RegisterForAlerts())
		end
		if self.Options.RangeFrame and not DBM.RangeCheck:IsShown() then
			DBM.RangeCheck:Show(10)
		end
		self:Unschedule(warnStormCloudTargets)
		self:Schedule(0.5, warnStormCloudTargets)
	elseif args.spellId == 140296 then
		warnConductiveShield:Show(args.destName)
		specWarnConductiveShield:Show(args.destName)
		timerConductiveShieldCD:Start(20, args.destName, args.sourceGUID)
		if args.sourceGUID == UnitGUID("target") then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\stopattack.mp3")
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 70308 then--Soul-Fed Construct
		timerSpiritfireCD:Cancel()
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
		end
	elseif cid == 70236 then--Zandalari Storm-Caller
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
		end
	elseif cid == 70445 then--Stormbringer Draz'kil
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		if self.Options.HudMAP then
			DBMHudMap:FreeEncounterMarkers()
		end
	elseif cid == 69834 or cid == 69821 then
		timerConductiveShieldCD:Cancel(args.destName, args.destGUID)
	elseif cid == 68220 then--Gastropod
		timerFixatedCD:Cancel(args.destGUID)
	end
end

--"<1.0 17:57:05> [UNIT_SPELLCAST_SUCCEEDED] Gastropod [[target:Fixated::0:140306]]", -- [23]
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 140306 and self:AntiSpam() then
		self:SendSync("OMGSnail", UnitGUID(uId))
	end
end

function mod:OnSync(msg, guid)
	if msg == "OMGSnail" and guid  then
		warnFixated:Show()
		timerFixatedCD:Start(nil, guid)
	end
end
