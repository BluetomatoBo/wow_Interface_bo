local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

local sub, find = string.sub, string.find
local abs, atan2, cos, sin, sqrt2, random, floor, ceil, random = math.abs, math.atan2, math.cos, math.sin, math.sqrt(2), math.random, math.floor, math.ceil, math.random
local pairs, type, select, unpack = pairs, type, select, unpack
local GetPlayerMapPosition, GetPlayerFacing = GetPlayerMapPosition, GetPlayerFacing
local unitframeFont

local roleIconTextures = {
	TANK = [[Interface\AddOns\ElvUI\media\textures\tank.tga]],
	HEALER = [[Interface\AddOns\ElvUI\media\textures\healer.tga]],
	DAMAGER = [[Interface\AddOns\ElvUI\media\textures\dps.tga]],
	DC = [[Interface\AddOns\ElvUI_Enhanced\media\textures\dc.tga]],
}

local classes = {	DEATHKNIGHT, DRUID, HUNTER,	MAGE, MONK, PALADIN, PRIEST, ROGUE, SHAMAN, WARLOCK, WARRIOR }
local specializations = { }

for classID = 1, MAX_CLASSES do
	local _, classTag = GetClassInfoByID(classID)
	local numTabs = GetNumSpecializationsForClassID(classID)
	classes[classTag] = {}
	for i = 1, numTabs do
		local id, name = GetSpecializationInfoForClassID(classID, i)
		local role = GetSpecializationRoleByID(id)
		classes[classTag][i] = { role = role, specName = name }
		specializations[id] = role
	end
end

local function CalculateCorner(r)
	return 0.5 + cos(r) / sqrt2, 0.5 + sin(r) / sqrt2;
end

local function RotateTexture(texture, angle)
	local LRx, LRy = CalculateCorner(angle + 0.785398163);
	local LLx, LLy = CalculateCorner(angle + 2.35619449);
	local ULx, ULy = CalculateCorner(angle + 3.92699082);
	local URx, URy = CalculateCorner(angle - 0.785398163);
	
	texture:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy);
end

function UF:UpdateGPS(frame)
	local gps = frame.gps
	if not gps then return end
	
	-- GPS Disabled or not GPS parent frame visible or not in Party or Raid, Hide gps
	if not frame:IsVisible() or UnitIsUnit(gps.unit, 'player') or not (UnitInParty(gps.unit) or UnitInRaid(gps.unit)) then
		gps:Hide()
		return
	end

	-- Arbitrary method to determine if we should try to calculate the map position
	local x, y = GetPlayerMapPosition(gps.unit)
	local distance, angle
	if not (x == 0 and y == 0) then
		-- Unit is in acceptable range, calculate position fast
		distance, angle = E:GetDistance('player', gps.unit, true)
	end
	if not angle then
		-- no bearing show - to indicate we are lost :)
		gps.Text:SetText("-")
		gps.Texture:Hide()
		gps:Show()
		return
	end
	
	RotateTexture(gps.Texture, angle)
	gps.Texture:Show()

	gps.Text:SetFormattedText("%d", distance)
	gps:Show()
end

function UF:UpdateRoleIconEnhanced(event)
	-- rehook self from timer event
	if event and type(event) == "table" then
		self = event
	end

	local lfdrole = self.LFDRole
	local db = self.db.roleIcon
	local autochange = false
	
	if (not db) or (db and not db.enable) then 
		lfdrole:Hide()
		return
	end
	
	local role = UnitGroupRolesAssigned(self.unit)
	if role == 'NONE' then
		if self.isForced then
			local rnd = random(1, 4)
			role = rnd == 1 and "TANK" or (rnd == 2 and "HEALER" or (rnd == 3 and "DAMAGER" or (rnd == 4 and "DC")))
		else
			role = nil
			local specId = nil
			local inInstance, instanceType = IsInInstance()
			
			if UnitIsUnit(self.unit, "player") then
				specId = GetSpecialization()
				if specId then
					role = select(6, GetSpecializationInfo(specId))
				end
			elseif (inInstance and (instanceType == "pvp")) then
				local unitName = UnitName(self.unit)
				if unitName then
					local playerFaction, numScores = GetBattlefieldArenaFaction(), GetNumBattlefieldScores()
					local name, faction, classToken, talentSpec
					for index = 1, numScores do
						name, _, _, _, _, faction, _, _, classToken, _, _, _, _, _, _, talentSpec = GetBattlefieldScore(index)
						if name and find(name, unitName) and playerFaction == faction and classes[classToken] and talentSpec then
							for i = 1, 4 do
								if classes[classToken][i] and talentSpec == classes[classToken][i].specName then
									role = classes[classToken][i].role
									break
								end
							end
						end
						if role then break end
					end
				end
			else	
				specId = GetInspectSpecialization(self.unit)
				if specId and specializations[specId] then
					role = specializations[specId]
				end
			end

			role = (role == nil) and 'NONE' or role			
			autochange = role ~= 'NONE' 
		end
	end
	
	if not UnitIsConnected(self.unit) then role = "DC" end
	
	if role and role ~= 'NONE' then
		lfdrole:SetTexture(roleIconTextures[role])
		lfdrole:Show()
		if E.db.unitframe.autoRoleSet and autochange and not InCombatLockdown() and (UnitIsGroupLeader('player') or UnitIsGroupAssistant('player')) and role ~= "DC" then
			UnitSetRole(self.unit, role)
		end	
	else
		lfdrole:Hide()
		if not lfdrole.timer or UF:TimeLeft(lfdrole.timer) == 0 then
			lfdrole.timer = UF:ScheduleTimer("UpdateRoleIconEnhanced", random(10, 20), self)
		end
	end	
end