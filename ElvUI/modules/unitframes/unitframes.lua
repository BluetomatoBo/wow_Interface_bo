local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:NewModule('UnitFrames', 'AceTimer-3.0', 'AceEvent-3.0', 'AceHook-3.0');
local LSM = LibStub("LibSharedMedia-3.0");
UF.LSM = LSM

local _, ns = ...
local ElvUF = ns.oUF
local AceTimer = LibStub:GetLibrary("AceTimer-3.0")
assert(ElvUF, "ElvUI was unable to locate oUF.")

local opposites = {
	['DEBUFFS'] = 'BUFFS',
	['BUFFS'] = 'DEBUFFS'
}

local removeMenuOptions = {
	["SET_FOCUS"] = true,
	["CLEAR_FOCUS"] = true,
	["MOVE_FOCUS_FRAME"] = true,
	["LARGE_FOCUS"] = true,	
	["MOVE_PLAYER_FRAME"] = true,
	["MOVE_TARGET_FRAME"] = true,
	["PVP_REPORT_AFK"] = true,
	["PET_DISMISS"] = E.myclass == 'HUNTER',
}

UF['headerstoload'] = {}
UF['unitgroupstoload'] = {}
UF['unitstoload'] = {}

UF['headers'] = {}
UF['groupunits'] = {}
UF['units'] = {}

UF['statusbars'] = {}
UF['fontstrings'] = {}
UF['badHeaderPoints'] = {
	['TOP'] = 'BOTTOM',
	['LEFT'] = 'RIGHT',
	['BOTTOM'] = 'TOP',
	['RIGHT'] = 'LEFT',
}

UF['classMaxResourceBar'] = {
	['DEATHKNIGHT'] = 6,
	['PALADIN'] = 5,
	['WARLOCK'] = 4,
	['PRIEST'] = 3,
	['MONK'] = 5,
	['MAGE'] = 4,
}

UF['headerGroupBy'] = {
	['CLASS'] = function(header)
		header:SetAttribute("groupingOrder", "DEATHKNIGHT,DRUID,HUNTER,MAGE,PALADIN,PRIEST,SHAMAN,WARLOCK,WARRIOR")
		header:SetAttribute('sortMethod', 'NAME')
	end,
	['ROLE'] = function(header)
		header:SetAttribute("groupingOrder", "TANK,HEALER,DAMAGER,NONE")
		header:SetAttribute('sortMethod', 'INDEX')	
	end,
	['NAME'] = function(header)
		header:SetAttribute("groupingOrder", "1,2,3,4,5,6,7,8")
		header:SetAttribute('sortMethod', 'NAME')	
	end,
	['GROUP'] = function(header)
		header:SetAttribute("groupingOrder", "1,2,3,4,5,6,7,8")
		header:SetAttribute('sortMethod', 'INDEX')
	end,
}

local find, gsub, split, format = string.find, string.gsub, string.split, string.format
local min = math.min
local tremove, tinsert = table.remove, table.insert

function UF:Construct_UF(frame, unit)
	frame:SetScript('OnEnter', UnitFrame_OnEnter)
	frame:SetScript('OnLeave', UnitFrame_OnLeave)	
	
	frame.menu = self.SpawnMenu
	
	frame:SetFrameLevel(5)
	
	frame.RaisedElementParent = CreateFrame('Frame', nil, frame)
	frame.RaisedElementParent:SetFrameLevel(frame:GetFrameLevel() + 10)	
	
	if not self['groupunits'][unit] then
		local stringTitle = E:StringTitle(unit)
		if stringTitle:find('target') then
			stringTitle = gsub(stringTitle, 'target', 'Target')
		end
		self["Construct_"..stringTitle.."Frame"](self, frame, unit)
	else
		UF["Construct_"..E:StringTitle(self['groupunits'][unit]).."Frames"](self, frame, unit)
	end
	
	self:Update_StatusBars()
	self:Update_FontStrings()	
	return frame
end

function UF:GetPositionOffset(position, offset)
	if not offset then offset = 2; end
	local x, y = 0, 0
	if find(position, 'LEFT') then
		x = offset
	elseif find(position, 'RIGHT') then
		x = -offset
	end					
	
	if find(position, 'TOP') then
		y = -offset
	elseif find(position, 'BOTTOM') then
		y = offset
	end
	
	return x, y
end

function UF:GetAuraOffset(p1, p2)
	local x, y = 0, 0
	if p1 == "RIGHT" and p2 == "LEFT" then
		x = -3
	elseif p1 == "LEFT" and p2 == "RIGHT" then
		x = 3
	end
	
	if find(p1, 'TOP') and find(p2, 'BOTTOM') then
		y = -1
	elseif find(p1, 'BOTTOM') and find(p2, 'TOP') then
		y = 1
	end
	
	return E:Scale(x), E:Scale(y)
end

function UF:GetAuraAnchorFrame(frame, attachTo, isConflict)
	if isConflict then
		E:Print(format(L['%s frame(s) has a conflicting anchor point, please change either the buff or debuff anchor point so they are not attached to each other. Forcing the debuffs to be attached to the main unitframe until fixed.'], E:StringTitle(frame:GetName())))
	end
	
	if isConflict or attachTo == 'FRAME' then
		return frame
	elseif attachTo == 'TRINKET' then
		if select(2, IsInInstance()) == "arena" then
			return frame.Trinket
		else
			return frame.PVPSpecIcon
		end	
	elseif attachTo == 'BUFFS' then
		return frame.Buffs
	elseif attachTo == 'DEBUFFS' then
		return frame.Debuffs
	else
		return frame
	end
end

function UF:ClearChildPoints(...)
	for i=1, select("#", ...) do
		local child = select(i, ...)
		child:ClearAllPoints()
	end
end

function UF:UpdateColors()
	local db = self.db.colors

	local good = E:GetColorTable(db.reaction.GOOD)
	local bad = E:GetColorTable(db.reaction.BAD)
	local neutral = E:GetColorTable(db.reaction.NEUTRAL)
	
	ElvUF.colors.tapped = E:GetColorTable(db.tapped);
	ElvUF.colors.disconnected = E:GetColorTable(db.disconnected);
	ElvUF.colors.health = E:GetColorTable(db.health);
	ElvUF.colors.power.MANA = E:GetColorTable(db.power.MANA);
	ElvUF.colors.power.RAGE = E:GetColorTable(db.power.RAGE);
	ElvUF.colors.power.FOCUS = E:GetColorTable(db.power.FOCUS);
	ElvUF.colors.power.ENERGY = E:GetColorTable(db.power.ENERGY);
	ElvUF.colors.power.RUNIC_POWER = E:GetColorTable(db.power.RUNIC_POWER);
	
	ElvUF.colors.runes = {}
	ElvUF.colors.runes[1] = E:GetColorTable(db.classResources.DEATHKNIGHT[1])
	ElvUF.colors.runes[2] = E:GetColorTable(db.classResources.DEATHKNIGHT[2])
	ElvUF.colors.runes[3] = E:GetColorTable(db.classResources.DEATHKNIGHT[3])
	ElvUF.colors.runes[4] = E:GetColorTable(db.classResources.DEATHKNIGHT[4])
	
	ElvUF.colors.holyPower = E:GetColorTable(db.classResources.PALADIN);
	
	ElvUF.colors.arcaneCharges = E:GetColorTable(db.classResources.MAGE);
	
	ElvUF.colors.shadowOrbs = E:GetColorTable(db.classResources.PRIEST);
	
	ElvUF.colors.eclipseBar = {}
	ElvUF.colors.eclipseBar[1] = E:GetColorTable(db.classResources.DRUID[1])
	ElvUF.colors.eclipseBar[2] = E:GetColorTable(db.classResources.DRUID[2])
	
	ElvUF.colors.harmony = {}
	ElvUF.colors.harmony[1] = E:GetColorTable(db.classResources.MONK[1])
	ElvUF.colors.harmony[2] = E:GetColorTable(db.classResources.MONK[2])
	ElvUF.colors.harmony[3] = E:GetColorTable(db.classResources.MONK[3])
	ElvUF.colors.harmony[4] = E:GetColorTable(db.classResources.MONK[4])
	ElvUF.colors.harmony[5] = E:GetColorTable(db.classResources.MONK[5])
	
	ElvUF.colors.WarlockResource = {}
	ElvUF.colors.WarlockResource[1] = E:GetColorTable(db.classResources.WARLOCK[1])
	ElvUF.colors.WarlockResource[2] = E:GetColorTable(db.classResources.WARLOCK[2])
	ElvUF.colors.WarlockResource[3] = E:GetColorTable(db.classResources.WARLOCK[3])
	
	ElvUF.colors.reaction[1] = bad
	ElvUF.colors.reaction[2] = bad
	ElvUF.colors.reaction[3] = bad
	ElvUF.colors.reaction[4] = neutral
	ElvUF.colors.reaction[5] = good
	ElvUF.colors.reaction[6] = good
	ElvUF.colors.reaction[7] = good
	ElvUF.colors.reaction[8] = good
	ElvUF.colors.smooth = {1, 0, 0,
	1, 1, 0,
	unpack(E:GetColorTable(db.health))}
	
	ElvUF.colors.castColor = E:GetColorTable(db.castColor);
	ElvUF.colors.castNoInterrupt = E:GetColorTable(db.castNoInterrupt);
end

function UF:Update_StatusBars()
	local statusBarTexture = LSM:Fetch("statusbar", self.db.statusbar)
	for statusbar in pairs(UF['statusbars']) do
		if statusbar and statusbar:GetObjectType() == 'StatusBar' and not statusbar.isTransparent then
			statusbar:SetStatusBarTexture(statusBarTexture)
		elseif statusBar and statusbar:GetObjectType() == 'Texture' then
			statusbar:SetTexture(statusBarTexture)
		end
	end
end

function UF:Update_StatusBar(bar)
	bar:SetStatusBarTexture(LSM:Fetch("statusbar", self.db.statusbar))
end

function UF:Update_FontString(object)
	object:FontTemplate(LSM:Fetch("font", self.db.font), self.db.fontSize, self.db.fontOutline)
end

function UF:Update_FontStrings()
	local stringFont = LSM:Fetch("font", self.db.font)
	for font in pairs(UF['fontstrings']) do
		font:FontTemplate(stringFont, self.db.fontSize, self.db.fontOutline)
	end
end

function UF:Configure_FontString(obj)
	UF['fontstrings'][obj] = true
	obj:FontTemplate() --This is temporary.
end

function UF:ChangeVisibility(header, visibility)
	if(visibility) then
		local type, list = split(' ', visibility, 2)
		if(list and type == 'custom') then
			RegisterAttributeDriver(header, 'state-visibility', list)
		end
	end	
end

function UF:Update_AllFrames()
	if InCombatLockdown() then self:RegisterEvent('PLAYER_REGEN_ENABLED'); return end
	if E.private["unitframe"].enable ~= true then return; end
	self:UpdateColors()
	self:Update_FontStrings()
	self:Update_StatusBars()	
	
	for unit in pairs(self['units']) do
		if self.db['units'][unit].enable then
			self[unit]:Enable()
			self[unit]:Update()
		else
			self[unit]:Disable()
		end
	end

	for unit, group in pairs(self['groupunits']) do
		if self.db['units'][group].enable then
			self[unit]:Enable()
			self[unit]:Update()
		else
			self[unit]:Disable()
		end
	end	
	
	self:UpdateAllHeaders()
end

function UF:CreateAndUpdateUFGroup(group, numGroup)
	if InCombatLockdown() then self:RegisterEvent('PLAYER_REGEN_ENABLED'); return end

	for i=1, numGroup do
		local unit = group..i
		local frameName = E:StringTitle(unit)
		frameName = frameName:gsub('t(arget)', 'T%1')		
		if not self[unit] then
			self['groupunits'][unit] = group;	
			self[unit] = ElvUF:Spawn(unit, 'ElvUF_'..frameName)
			self[unit].index = i
			self[unit]:SetParent(ElvUF_Parent)
			self[unit]:SetID(i)
		end
		
		local frameName = E:StringTitle(group)
		frameName = frameName:gsub('t(arget)', 'T%1')		
		self[unit].Update = function()
			UF["Update_"..E:StringTitle(frameName).."Frames"](self, self[unit], self.db['units'][group])	
		end
		
		if self.db['units'][group].enable then
			self[unit]:Enable()
			self[unit].Update()
			
			if self[unit].isForced then
				self:ForceShow(self[unit])		
			end
		else
			self[unit]:Disable()
		end
	end
end

function UF:HeaderUpdateSpecificElement(group, elementName)
	assert(self[group], "Invalid group specified.")
	for i=1, self[group]:GetNumChildren() do
		local frame = select(i, self[group]:GetChildren())
		if frame and frame.Health then
			frame:UpdateElement(elementName)
		end
	end
end

function UF:CreateAndUpdateHeaderGroup(group, groupFilter, template)
	if InCombatLockdown() then self:RegisterEvent('PLAYER_REGEN_ENABLED'); return end

	local db = self.db['units'][group]
	if not self[group] then
		ElvUF:RegisterStyle("ElvUF_"..E:StringTitle(group), UF["Construct_"..E:StringTitle(group).."Frames"])
		ElvUF:SetActiveStyle("ElvUF_"..E:StringTitle(group))

		local maxUnits, startingIndex = MAX_RAID_MEMBERS, -1
		if db.maxColumns and db.unitsPerColumn then
			startingIndex = -min(db.maxColumns * db.unitsPerColumn, maxUnits) + 1			
		end

		if template then
			self[group] = ElvUF:SpawnHeader("ElvUF_"..E:StringTitle(group), nil, 'raid', 
				'point', db.point, 
				'oUF-initialConfigFunction', ([[self:SetWidth(%d); self:SetHeight(%d); self:SetFrameLevel(5)]]):format(db.width, db.height), 
				'template', template, 
				'columnAnchorPoint', db.columnAnchorPoint,
				'maxColumns', db.maxColumns,
				'unitsPerColumn', db.unitsPerColumn,
				'point', db.point,
				'columnSpacing', db.columnSpacing,
				'xOffset', db.xOffset,
				'yOffset', db.yOffset,
				'startingIndex', startingIndex,
				'groupFilter', groupFilter)
		else
			self[group] = ElvUF:SpawnHeader("ElvUF_"..E:StringTitle(group), nil, 'raid', 
				'point', db.point, 
				'oUF-initialConfigFunction', ([[self:SetWidth(%d); self:SetHeight(%d); self:SetFrameLevel(5)]]):format(db.width, db.height), 
				'columnAnchorPoint', db.columnAnchorPoint,
				'maxColumns', db.maxColumns,
				'unitsPerColumn', db.unitsPerColumn,
				'point', db.point,
				'columnSpacing', db.columnSpacing,
				'xOffset', db.xOffset,
				'yOffset', db.yOffset,
				'startingIndex', startingIndex,
				'groupFilter', groupFilter)
		end
		
		self[group]:SetParent(ElvUF_Parent)
		RegisterAttributeDriver(self[group], 'state-visibility', 'show')	
		self[group].dirtyWidth, self[group].dirtyHeight = self[group]:GetSize()
		RegisterAttributeDriver(self[group], 'state-visibility', 'hide')	

		if not db.maxColumns then
			self[group]:SetAttribute('startingIndex', 1)
		end
		
		self['headers'][group] = self[group]
		self[group].groupName = group
	end
	
	self[group].db = db
	
	self[group].Update = function()
		local db = self.db['units'][group]
		if db.enable ~= true then 
			self[group]:SetAttribute("showParty", false)
			self[group]:SetAttribute("showRaid", false)
			self[group]:SetAttribute("showSolo", false)			
			return
		end
		UF["Update_"..E:StringTitle(group).."Header"](self, self[group], db)
		
		for i=1, self[group]:GetNumChildren() do
			local child = select(i, self[group]:GetChildren())
			UF["Update_"..E:StringTitle(group).."Frames"](self, child, self.db['units'][group])

			if _G[child:GetName()..'Pet'] then
				UF["Update_"..E:StringTitle(group).."Frames"](self, _G[child:GetName()..'Pet'], self.db['units'][group])
			end
			
			if _G[child:GetName()..'Target'] then
				UF["Update_"..E:StringTitle(group).."Frames"](self, _G[child:GetName()..'Target'], self.db['units'][group])
			end			
		end			
	end	
	
	self[group].Update()
end

function UF:PLAYER_REGEN_ENABLED()
	self:Update_AllFrames()
	self:UnregisterEvent('PLAYER_REGEN_ENABLED')
end

function UF:CreateAndUpdateUF(unit)
	assert(unit, 'No unit provided to create or update.')
	if InCombatLockdown() then self:RegisterEvent('PLAYER_REGEN_ENABLED'); return end

	local frameName = E:StringTitle(unit)
	frameName = frameName:gsub('t(arget)', 'T%1')
	if not self[unit] then
		self[unit] = ElvUF:Spawn(unit, 'ElvUF_'..frameName)
		self['units'][unit] = unit
	end

	self[unit].Update = function()
		UF["Update_"..frameName.."Frame"](self, self[unit], self.db['units'][unit])
	end

	if self.db['units'][unit].enable then
		self[unit]:Enable()
		self[unit].Update()
	else
		self[unit]:Disable()
	end
	
	if self[unit]:GetParent() ~= ElvUF_Parent then
		self[unit]:SetParent(ElvUF_Parent)
	end
end


function UF:LoadUnits()
	for _, unit in pairs(self['unitstoload']) do
		self:CreateAndUpdateUF(unit)
	end	
	self['unitstoload'] = nil
	
	for group, numGroup in pairs(self['unitgroupstoload']) do
		self:CreateAndUpdateUFGroup(group, numGroup)
	end
	self['unitgroupstoload'] = nil
	
	for group, groupOptions in pairs(self['headerstoload']) do
		local groupFilter, template
		if type(groupOptions) == 'table' then
			groupFilter, template = unpack(groupOptions)
		end

		self:CreateAndUpdateHeaderGroup(group, groupFilter, template)
	end
	self['headerstoload'] = nil
end

function UF:UpdateAllHeaders(event)	
	if InCombatLockdown() then
		self:RegisterEvent('PLAYER_REGEN_ENABLED', 'UpdateAllHeaders')
		return
	end
	
	if event == 'PLAYER_REGEN_ENABLED' then
		self:UnregisterEvent('PLAYER_REGEN_ENABLED')
	end
		
	local _, instanceType = IsInInstance();
	local ORD = ns.oUF_RaidDebuffs or oUF_RaidDebuffs
	if ORD then
		ORD:ResetDebuffData()
		
		if instanceType == "party" or instanceType == "raid" then
			ORD:RegisterDebuffs(E.global.unitframe.aurafilters.RaidDebuffs.spells)
		else
			ORD:RegisterDebuffs(E.global.unitframe.aurafilters.CCDebuffs.spells)
		end
	end	
	
	for _, header in pairs(UF['headers']) do
		header:Update()
	end	
	
	if E.private.unitframe.disableBlizzard then
		ElvUF:DisableBlizzard('party')	
	end
end

function HideRaid()
	if InCombatLockdown() then return end
	CompactRaidFrameManager:Kill()
	local compact_raid = CompactRaidFrameManager_GetSetting("IsShown")
	if compact_raid and compact_raid ~= "0" then 
		CompactRaidFrameManager_SetSetting("IsShown", "0")
	end
end

function UF:DisableBlizzard(event)
	hooksecurefunc("CompactRaidFrameManager_UpdateShown", HideRaid)
	CompactRaidFrameManager:HookScript('OnShow', HideRaid)
	CompactRaidFrameContainer:UnregisterAllEvents()
	
	HideRaid()
	hooksecurefunc("CompactUnitFrame_RegisterEvents", CompactUnitFrame_UnregisterEvents)
end

local hiddenParent = CreateFrame("Frame")
hiddenParent:Hide()

local HandleFrame = function(baseName)
	local frame
	if(type(baseName) == 'string') then
		frame = _G[baseName]
	else
		frame = baseName
	end

	if(frame) then
		frame:UnregisterAllEvents()
		frame:Hide()

		-- Keep frame hidden without causing taint
		frame:SetParent(hiddenParent)

		local health = frame.healthbar
		if(health) then
			health:UnregisterAllEvents()
		end

		local power = frame.manabar
		if(power) then
			power:UnregisterAllEvents()
		end

		local spell = frame.spellbar
		if(spell) then
			spell:UnregisterAllEvents()
		end

		local altpowerbar = frame.powerBarAlt
		if(altpowerbar) then
			altpowerbar:UnregisterAllEvents()
		end
	end
end

function ElvUF:DisableBlizzard(unit)
	if(not unit) or InCombatLockdown() then return end

	if(unit == 'player') then
		HandleFrame(PlayerFrame)

		-- For the damn vehicle support:
		PlayerFrame:RegisterUnitEvent('UNIT_ENTERING_VEHICLE', "player")
		PlayerFrame:RegisterUnitEvent('UNIT_ENTERED_VEHICLE', "player")
		PlayerFrame:RegisterUnitEvent('UNIT_EXITING_VEHICLE', "player")
		PlayerFrame:RegisterUnitEvent('UNIT_EXITED_VEHICLE', "player")
		PlayerFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
		
		-- User placed frames don't animate
		PlayerFrame:SetUserPlaced(true)
		PlayerFrame:SetDontSavePosition(true)
	elseif(unit == 'pet') then
		HandleFrame(PetFrame)
	elseif(unit == 'target') then
		HandleFrame(TargetFrame)
		HandleFrame(ComboFrame)
	elseif(unit == 'focus') then
		HandleFrame(FocusFrame)
		HandleFrame(TargetofFocusFrame)
	elseif(unit == 'targettarget') then
		HandleFrame(TargetFrameToT)
	elseif(unit:match'(boss)%d?$' == 'boss') then
		local id = unit:match'boss(%d)'
		if(id) then
			HandleFrame('Boss' .. id .. 'TargetFrame')
		else
			for i=1, 4 do
				HandleFrame(('Boss%dTargetFrame'):format(i))
			end
		end
	elseif(unit:match'(party)%d?$' == 'party') then
		local id = unit:match'party(%d)'
		if(id) then
			HandleFrame('PartyMemberFrame' .. id)
		else
			for i=1, 4 do
				HandleFrame(('PartyMemberFrame%d'):format(i))
			end
		end
	elseif(unit:match'(arena)%d?$' == 'arena') then
		local id = unit:match'arena(%d)'

		if(id) then
			HandleFrame('ArenaEnemyFrame' .. id)
			HandleFrame('ArenaPrepFrame'..id)
			HandleFrame('ArenaEnemyFrame'..id..'PetFrame')
		else
			for i=1, 5 do
				HandleFrame(('ArenaEnemyFrame%d'):format(i))
				HandleFrame(('ArenaPrepFrame%d'):format(i))
				HandleFrame(('ArenaEnemyFrame%dPetFrame'):format(i))
			end
		end
	end
end

function UF:ADDON_LOADED(event, addon)
	if addon ~= 'Blizzard_ArenaUI' then return; end
	ElvUF:DisableBlizzard('arena')
	self:UnregisterEvent("ADDON_LOADED");
end

function UF:PLAYER_ENTERING_WORLD(event)
	self:Update_AllFrames()
	self:UpdatePrep(event)
end

function UF:UnitFrameThreatIndicator_Initialize(_, unitFrame)
	unitFrame:UnregisterAllEvents() --Arena Taint Fix
end

function UF:RemoveDismissPet()
	--This *should* make it so if you are in the Kara Event you can still use the dismiss pet from right click menu
	--Otherwise hunters need to use the spell Dismiss Pet
	if not PetCanBeAbandoned() then
		if UnitPopupMenus["PET"][4] ~= "PET_DISMISS" then
			tinsert(UnitPopupMenus["PET"], 4, "PET_DISMISS")
		end		
	else
		if UnitPopupMenus["PET"][4] == "PET_DISMISS" then
			tremove(UnitPopupMenus["PET"], 4)
		end		
	end
end

CompactUnitFrameProfiles:UnregisterEvent('VARIABLES_LOADED') 	--Re-Register this event only if disableblizzard is turned off.
function UF:Initialize()	
	self.db = E.db["unitframe"]
	
	CompactUnitFrameProfiles:RegisterEvent('VARIABLES_LOADED')
	if E.private["unitframe"].enable ~= true then return; end
	E.UnitFrames = UF;
	
	local ElvUF_Parent = CreateFrame('Frame', 'ElvUF_Parent', E.UIParent, 'SecureHandlerStateTemplate');
	ElvUF_Parent:SetAllPoints(E.UIParent)
	ElvUF_Parent:SetAttribute("_onstate-show", [[		
		if newstate == "hide" then
			self:Hide();
		else
			self:Show();
		end	
	]]);

	RegisterStateDriver(ElvUF_Parent, "show", '[petbattle] hide;show');	
	
	self:UpdateColors()
	ElvUF:RegisterStyle('ElvUF', function(frame, unit)
		self:Construct_UF(frame, unit)
	end)
	
	self:LoadUnits()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('ARENA_PREP_OPPONENT_SPECIALIZATIONS', 'UpdatePrep')
	self:RegisterEvent('ARENA_OPPONENT_UPDATE', 'UpdatePrep')

	if E.private["unitframe"].disableBlizzard then
		self:DisableBlizzard()	
		self:SecureHook('UnitFrameThreatIndicator_Initialize')
		InterfaceOptionsFrameCategoriesButton9:SetScale(0.0001)
		InterfaceOptionsFrameCategoriesButton10:SetScale(0.0001)
		InterfaceOptionsFrameCategoriesButton11:SetScale(0.0001)

		if not IsAddOnLoaded('Blizzard_ArenaUI') then
			self:RegisterEvent('ADDON_LOADED')
		else
			ElvUF:DisableBlizzard('arena')
		end
		
		if E.myclass == "HUNTER" then
			self:RegisterEvent("UPDATE_POSSESS_BAR", "RemoveDismissPet")
		end
		
		--index #4 is PET_DISMISS for PET UnitPopupMenus
		for name, menu in pairs(UnitPopupMenus) do
			for index = #menu, 1, -1 do
				if removeMenuOptions[menu[index]] then
					tremove(menu, index)
				end
			end
		end				

		self:RegisterEvent('GROUP_ROSTER_UPDATE', 'DisableBlizzard')
		UIParent:UnregisterEvent('GROUP_ROSTER_UPDATE') --This may fuck shit up.. we'll see...
	else
		CompactUnitFrameProfiles:RegisterEvent('VARIABLES_LOADED')
	end
		
	local ORD = ns.oUF_RaidDebuffs or oUF_RaidDebuffs
	if not ORD then return end
	ORD.ShowDispelableDebuff = true
	ORD.FilterDispellableDebuff = true
	ORD.MatchBySpellName = true
end

function UF:ResetUnitSettings(unit)
	E:CopyTable(self.db['units'][unit], P['unitframe']['units'][unit]); 
	
	if self.db['units'][unit].buffs and self.db['units'][unit].buffs.sizeOverride then
		self.db['units'][unit].buffs.sizeOverride = P.unitframe.units[unit].buffs.sizeOverride or 0
	end
	
	if self.db['units'][unit].debuffs and self.db['units'][unit].debuffs.sizeOverride then
		self.db['units'][unit].debuffs.sizeOverride = P.unitframe.units[unit].debuffs.sizeOverride or 0
	end
	
	self:Update_AllFrames()
end

function UF:ToggleForceShowGroupFrames(unitGroup, numGroup)
	for i=1, numGroup do
		if self[unitGroup..i] and not self[unitGroup..i].isForced then
			UF:ForceShow(self[unitGroup..i])
		elseif self[unitGroup..i] then
			UF:UnforceShow(self[unitGroup..i])
		end
	end
end

local ignoreSettings = {
	['position'] = true,
	['playerOnly'] = true,
	['noConsolidated'] = true,
	['useBlacklist'] = true,
	['useWhitelist'] = true,
	['noDuration'] = true,
	['onlyDispellable'] = true,
	['useFilter'] = true,
}

local ignoreSettingsGroup = {
	['visibility'] = true,
}

local allowPass = {
	['sizeOverride'] = true,
}

function UF:MergeUnitSettings(fromUnit, toUnit, isGroupUnit)
	local db = self.db['units']
	local filter = ignoreSettings
	if isGroupUnit then
		filter = ignoreSettingsGroup 
	end
	if fromUnit ~= toUnit then
		for option, value in pairs(db[fromUnit]) do
			if type(value) ~= 'table' and not filter[option] then
				if db[toUnit][option] ~= nil then
					db[toUnit][option] = value
				end
			elseif not filter[option] then
				if type(value) == 'table' then
					for opt, val in pairs(db[fromUnit][option]) do
						--local val = db[fromUnit][option][opt]
						if type(val) ~= 'table' and not filter[opt] then
							if db[toUnit][option] ~= nil and (db[toUnit][option][opt] ~= nil or allowPass[opt]) then
								db[toUnit][option][opt] = val
							end				
						elseif not filter[opt] then
							if type(val) == 'table' then
								for o, v in pairs(db[fromUnit][option][opt]) do
									if not filter[o] then
										if db[toUnit][option] ~= nil and db[toUnit][option][opt] ~= nil and db[toUnit][option][opt][o] ~= nil then
											db[toUnit][option][opt][o] = v	
										end
									end
								end		
							end
						end
					end
				end
			end
		end
	else
		E:Print(L['You cannot copy settings from the same unit.'])
	end

	self:Update_AllFrames()
end

local function updateColor(self, r, g, b)
	if not self.isTransparent then return end
	if self.backdrop then
		local _, _, _, a = self.backdrop:GetBackdropColor()
		self.backdrop:SetBackdropColor(r * 0.58, g * 0.58, b * 0.58, a)
	elseif self:GetParent().template then
		local _, _, _, a = self:GetParent():GetBackdropColor()
		self:GetParent():SetBackdropColor(r * 0.58, g * 0.58, b * 0.58, a)
	end
	
	if self.bg and self.bg:GetObjectType() == 'Texture' and not self.bg.multiplier then
		self.bg:SetTexture(r * 0.35, g * 0.35, b * 0.35)
	end
end

function UF:ToggleTransparentStatusBar(isTransparent, statusBar, backdropTex, adjustBackdropPoints, invertBackdropTex)
	statusBar.isTransparent = isTransparent
	
	local statusBarTex = statusBar:GetStatusBarTexture()
	local statusBarOrientation = statusBar:GetOrientation()
	if isTransparent then
		if statusBar.backdrop then
			statusBar.backdrop:SetTemplate("Transparent")
			statusBar.backdrop.ignoreUpdates = true
		elseif statusBar:GetParent().template then
			statusBar:GetParent():SetTemplate("Transparent")	
			statusBar:GetParent().ignoreUpdates = true
		end
		
		statusBar:SetStatusBarTexture(0, 0, 0, 0)
		backdropTex:ClearAllPoints()
		if statusBarOrientation == 'VERTICAL' then
			backdropTex:SetPoint("TOPLEFT", statusBar, "TOPLEFT")
			backdropTex:SetPoint("BOTTOMLEFT", statusBarTex, "TOPLEFT")
			backdropTex:SetPoint("BOTTOMRIGHT", statusBarTex, "TOPRIGHT")			
		else
			backdropTex:SetPoint("TOPLEFT", statusBarTex, "TOPRIGHT")
			backdropTex:SetPoint("BOTTOMLEFT", statusBarTex, "BOTTOMRIGHT")
			backdropTex:SetPoint("BOTTOMRIGHT", statusBar, "BOTTOMRIGHT")
		end
		
		if invertBackdropTex then
			backdropTex:Show()
		end
		
		if not invertBackdropTex and not statusBar.hookedColor then
			hooksecurefunc(statusBar, "SetStatusBarColor", updateColor)
			statusBar.hookedColor = true
		end
		
		if backdropTex.multiplier then
			backdropTex.multiplier = 0.25
		end
	else
		if statusBar.backdrop then
			statusBar.backdrop:SetTemplate("Default")
			statusBar.backdrop.ignoreUpdates = nil
		elseif statusBar:GetParent().template then
			statusBar:GetParent():SetTemplate("Default")
			statusBar:GetParent().ignoreUpdates = nil
		end
		statusBar:SetStatusBarTexture(LSM:Fetch("statusbar", self.db.statusbar))
		if adjustBackdropPoints then
			backdropTex:ClearAllPoints()
			if statusBarOrientation == 'VERTICAL' then
				backdropTex:SetPoint("TOPLEFT", statusBar, "TOPLEFT")
				backdropTex:SetPoint("BOTTOMLEFT", statusBarTex, "TOPLEFT")
				backdropTex:SetPoint("BOTTOMRIGHT", statusBarTex, "TOPRIGHT")				
			else			
				backdropTex:SetPoint("TOPLEFT", statusBarTex, "TOPRIGHT")
				backdropTex:SetPoint("BOTTOMLEFT", statusBarTex, "BOTTOMRIGHT")
				backdropTex:SetPoint("BOTTOMRIGHT", statusBar, "BOTTOMRIGHT")
			end
		end
		
		if invertBackdropTex then
			backdropTex:Hide()
		end
		
		if backdropTex.multiplier then
			backdropTex.multiplier = 0.25	
		end
	end
end

E:RegisterInitialModule(UF:GetName())