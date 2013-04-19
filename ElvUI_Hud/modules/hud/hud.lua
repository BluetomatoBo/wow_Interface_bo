local addon, ns = ...
local oUF = ns.oUF
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local backdrop = {
	bgFile = E["media"].blankTex,
	insets = {top = -E.mult, left = -E.mult, bottom = -E.mult, right = -E.mult},
}

local function IsDefaultHelper( tbl1, tbl2 )
    --
    for k,v in pairs(tbl2) do
        --
        if (tbl1[k] ~= v) then
            
            if ((type(tbl1[k])~="table") or (type(v)~="table")) then
                --
                return false    -- some entry didn't exist or was different!
            end
            
            -- Subtables need to be dived into (different refs doesn't mean
            -- different contents).
            --
            if (not IsDefaultHelper( tbl1[k], v )) then
                return false
            end
        end
    end    

    return true     -- covered it all!
end

function H:IsDefault(settingstring)
	local settings = { string.split('.',settingstring) }
	local options,profile = self.db,P.unitframe.hud
	for _,setting in pairs(settings) do
		options = options[setting]
		profile = profile[setting]
		if not profile then -- this only happens for customTexts
			profile = {}
			E:CopyTable(profile,P.unitframe.hud.customtext)
		end
	end
	return IsDefaultHelper(options,profile)
end

function H:GetUnitFrame(unit)
	local stringTitle = E:StringTitle(unit)
	if stringTitle:find('target') then
		stringTitle = gsub(stringTitle, 'target', 'Target')
	end
	return "ElvUF_"..stringTitle.."Hud"
end

function H:GetClassBarName()
	if E.myclass == "DRUID" then
		return 'EclipseBar'
	end

	if E.myclass == "WARLOCK" then
		return 'ShardBar'
	end

	if E.myclass == "PALADIN" then
		return 'HolyPower'
	end

	if E.myclass == "DEATHKNIGHT" then
		return 'Runes'
	end

	if E.myclass == "MONK" then
		return 'Harmony'
	end

	if E.myclass == "PRIEST" then
		return 'ShadowOrbs'
	end

	if E.myclass == "MAGE" then
		return 'ArcaneChargeBar'
	end
end

local elements = {
	['health'] = 'Health',
	['power'] = 'Power',
	['castbar'] = 'Castbar',
	['name'] = 'Name',
	['aurabars'] = 'AuraBars',
	['cpoints'] = 'CPoints',
	['raidicon'] = 'RaidIcon',
	['resting'] = 'Resting',
	['combat'] = 'Combat',
	['pvp'] = 'PvPText',
	['healcomm'] = 'HealPrediction',
	['mushroom'] = 'WildMushroom',
	['gcd'] = 'GCD',
	['buffs'] = 'Buffs',
	['debuffs'] = 'Debuffs',
	['portrait'] = 'Portrait',
	['resurrecticon'] = 'ResurrectIcon',
}

H.Elements = elements

function H:GetElement(element)
	if element == 'classbars' then
		return H:GetClassBarName()
	else
		if self.Elements[element] then return self.Elements[element] else return nil end
	end
end

function H:AddCustomText(unit,name)
	local real_name = string.format('customtext_%s',name)
	local frame = self.units[unit]
	if frame[real_name] then return end
	self:AddElement(frame,name)
	if not self.Elements[name] then
		self.Elements[name] = real_name
	end
	frame[real_name] = self:ConfigureFontString(frame,name)
	if not E.db.unitframe.hud.units[unit][name] then
		E.db.unitframe.hud.units[unit][name] = {}
		E:CopyTable(E.db.unitframe.hud.units[unit][name],P.unitframe.hud.customtext)
		if not E.db.unitframe.hud.units[unit].customTexts then E.db.unitframe.hud.units[unit].customTexts = {} end
		E.db.unitframe.hud.units[unit].customTexts[name] = true
	end
	if E.Options.args.hud.args[unit] then
		E.Options.args.hud.args[unit].args[name] = H:GenerateElementOptionTable(unit,name,4000,E:StringTitle(name),true,false,false,true,false,false,true,false)
		E.Options.args.hud.args[unit].args[name].args['delete'] = {
			type = 'execute',
			order = 1,
			name = DELETE,
			func = function() 
				E.db.unitframe.hud.units[unit].customTexts[name] = nil;
				E.db.unitframe.hud.units[unit][name] = nil;
				E.Options.args.hud.args[unit].args[name] = nil;
				frame:Tag(frame[real_name],'')
				frame[real_name]:Hide()
				frame[real_name] = nil
			end,	
		}
	end
	frame[real_name]:Show()
end

function H:SetUpCustomTexts(frame)
	local unit = frame.unit
	if not E.db.unitframe.hud.units[unit] then return end
	if E.db.unitframe.hud.units[unit].customTexts then
		for textName,_ in pairs(E.db.unitframe.hud.units[unit].customTexts) do
			self:AddCustomText(unit,textName)
		end
	end
end

function H:GetAnchor(frame,anchor)
	if anchor == 'self' then
		return frame
	elseif anchor == 'ui' then
		return UIParent
	elseif string.find(anchor,':') then
		local f,e = string.split(':',anchor)
		f = H:GetUnitFrame(f)
		e = H:GetElement(e)
		return _G[f][e]
	else
		local e = anchor
		e = H:GetElement(e)
		if e then
			return frame[e]
		else
			e = H:GetUnitFrame(anchor)
			return e
		end
	end

	return frame
end

function H:CheckHealthValue(frame,eclipse)
	if not frame or not frame.Health then return end
	local config = self.db.units.player.health.value
	if config.enabled then
		if H:IsDefault('units.player.health.value.anchor') then
        	if eclipse then
        		frame.Health.value:Point('TOPRIGHT',frame.Health,'TOPLEFT',-30,0)
        	else
        		frame.Health.value:Point('TOPRIGHT',frame.Health,'TOPLEFT',-20,0)
        	end
        end
    end
end

function H:ConstructHudFrame(frame,unit)
	if not self.db.units then return end
	if not self.units then self.units = { } end
	self.units[unit] = frame
	self.units[unit]['elements'] = { }
	frame.unit = unit
	frame:RegisterForClicks("AnyUp")
	frame:SetScript('OnEnter', UnitFrame_OnEnter)
	frame:SetScript('OnLeave', UnitFrame_OnLeave)	
	if frame.unit ~= 'target' then
		frame:HookScript("OnEnter",function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() and UnitExists(self.unit) then H:Hide(frame,"PLAYER_REGEN_DISABLED") end end)
	    frame:HookScript("OnLeave",function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() and UnitExists(self.unit) then H:Hide(frame,"PLAYER_REGEN_ENABLED") end end)
	    frame:HookScript("OnShow",function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() then H:Hide(frame,"PLAYER_REGEN_ENABLED") end end)
	end
	frame.menu = UF.SpawnMenu
	frame.db = self.db.units[unit]
	
	local stringTitle = E:StringTitle(unit)
	if stringTitle:find('target') then
		stringTitle = gsub(stringTitle, 'target', 'Target')
	end
	self["Construct"..stringTitle.."Frame"](self, frame, unit)
	frame:SetParent(ElvUF_Parent)
	return frame
end

function H:UpdateFrame(unit)
	frame = self.units[unit]
	if not self.db or not self.db.units then self.db = E.db.unitframe.hud end
	if not self.db.units[frame.unit] then return end
	frame:Size(self.db.units[frame.unit].width,self.db.units[frame.unit].height)
	_G[frame:GetName()..'Mover']:Size(frame:GetSize())

	if E.db.unitframe.hud.enabled and self.db.units[frame.unit].enabled then
		frame:EnableMouse(self.db.hideElv or self.db.enableMouse)
		frame:Enable()
		if not frame then H:ScheduleTimer("UpdateFrame", 1, unit); return end
		if unit == "target" then
			local db = E.db.unitframe.units.target
			if not IsAddOnLoaded("Clique") then
				if db.middleClickFocus then
					frame:SetAttribute("type3", "focus")
				elseif frame:GetAttribute("type3") == "focus" then
					frame:SetAttribute("type3", nil)
				end
			end
		end
		frame:SetAlpha(self.db.alpha)
		local event
		if InCombatLockdown() then
			event = "PLAYER_REGEN_DISABLED"
		else
			event = "PLAYER_REGEN_ENABLED"
		end
		if self.db.hideOOC then H:Hide(frame, event) end
		if not frame.AuraBars then frame.AuraBars = frame.DummyAuraBars end
		self:UpdateAllElements(frame)
		self:UpdateAllElementAnchors(frame)

		if E.myclass == 'DRUID' and unit == 'player' then
			local spec = GetSpecialization()
			self:CheckHealthValue(frame,spec==1)
		end
		if not frame then return end -- don't know, fuck this shit

		if H.enableAuraBars then
			frame:UpdateAllElements()
		end
	else
		if frame:IsVisible() then frame:Hide() end
		frame:SetAlpha(0)
		frame:Disable()
		H:ScheduleTimer('DisableThisShit',1)
	end
end

function H:DisableThisShit()
	for _,f in pairs(self.frames) do
		if(not self.db.units[frame.unit].enabled) then
			f:Disable()
		end
	end
end

function H:UpdateAllFrames()
	if not self.db then return end
	for unit,_ in pairs(self.units) do
		self:UpdateFrame(unit)
	end
end

function H:UpdateAllElements(frame)
	local elements = self.units[frame.unit]
	local seenClassbars = false
	for element,_ in pairs(elements) do
		if self:GetElement(element) then
			self:UpdateElement(frame,element)
		end
	end
end

function H:UpdateAllElementAnchors(frame)
	if not frame then return end
	local elements = self.units[frame.unit]
	local seenClassbars = false

	for element,_ in pairs(elements) do
		if self:GetElement(element) then
			if element == 'mushroom' then
				if not seenClassbars then
					self:UpdateElementAnchor(frame,'classbars')
					seenClassbars = true
				end
				self:UpdateElementAnchor(frame,element)
			elseif element == 'classbars' then
				if not seenClassbars then
					self:UpdateElementAnchor(frame,element)
					seenClassbars = true
				end
			else
				self:UpdateElementAnchor(frame,element)
			end
		end
	end
end

function H:AddElement(frame,element)
	if not self.units[frame.unit][element] then
		self.units[frame.unit][element] = { }
	end
end

function H:ConfigureStatusBar(frame,element,parent,name,t)
	if parent == nil then parent = frame end
	if name == nil then name = "statusbar" end
	local sbname = frame.unit..'_hud_'..element..'_'..name

	-- Create the status bar
	local sb = CreateFrame('StatusBar', sbname, parent)
	if not t then
		sb:SetTemplate("Default")
		sb:CreateBackdrop("Default")
	end

	-- Dummy texture so we can set colors
	sb:SetStatusBarTexture(E['media'].blankTex)
	sb:GetStatusBarTexture():SetHorizTile(false)
 
	-- Frame strata/level
	sb:SetFrameStrata(parent:GetFrameStrata())
	sb:SetFrameLevel(parent:GetFrameLevel())

	if not t then
		-- Create the status bar background
	    local bg = sb:CreateTexture(nil, 'BORDER')
	    bg:SetAllPoints()
	    bg:SetTexture(E['media'].blankTex)
	    if element == 'gcd' then
	    	bg:SetTexture(.1,.1,.1)
	    end
	    bg:SetAlpha(.2)
	    bg.multiplier = 0.25
	    sb.bg = bg
	end

	if not self.units[frame.unit][element].statusbars then
		self.units[frame.unit][element].statusbars =  { }
	end

    self.units[frame.unit][element].statusbars[name] = sb
    return sb
end

function H:ConfigureFontString(frame,element,parent,name)
	if parent == nil then parent = frame end
	if name == nil then name = 'value' end
	local fsname = frame.unit..'_hud_'..element..'_'..name

	if not self.units[frame.unit][element].fontstrings then
		self.units[frame.unit][element].fontstrings=  { }
	end

	local fs = parent:CreateFontString(fsname, "THINOUTLINE")
	-- Dummy font
	fs:FontTemplate(LSM:Fetch("font", "ElvUI Font"), 12, "THINOUTLINE")
	self.units[frame.unit][element].fontstrings[name] = fs

	return fs
end

function H:ConfigureTexture(frame,element,parent,name)
	if parent == nil then parent = frame end
	if name == nil then name = 'texture' end
	local texname = frame.unit..'_hud_'..element..'_'..name
	if not self.units[frame.unit][element].textures then
		self.units[frame.unit][element].textures =  { }
	end

	local t = parent:CreateTexture(texname, "OVERLAY")
	-- Dummy texture
	t:SetTexture(E['media'].blankTex)
	self.units[frame.unit][element].textures[name] = t
	return t
end

function H:ConfigureFrame(frame,element,visible,parent)
	if visible == nil then visible = false end
	if parent == nil then parent = frame end
	local name = frame.unit..'_hud_'..element
	local f = CreateFrame('Frame',name,parent)
	self.units[frame.unit][element].frame = f
	return f
end

function H:ResetUnitSettings(unit)
	local frame = self.units[unit]
	if not frame then return end
	E:CopyTable(self.db.units[unit],P.unitframe.hud.units[unit])
    self:UpdateAllFrames()
end

function H:OldDefault()
	self.db.units.player.width = 39
	self.db.units.player.health.size.width = 15
	self.db.units.player.portrait.enabled = false
	self.db.units.target.width = 39
	self.db.units.target.health.size.width = 15
	self.db.units.target.portrait.enabled = false
end

function H:SimpleLayout()
	self.db.units.target.enabled = false
	self.db.units.targettarget.enabled = false
	self.db.units.pet.enabled = false
	self.db.units.pettarget.enabled = false
	for element,_ in pairs(self.db.units.player) do
		if self:GetElement(element) then
			self.db.units.player[element].enabled = false
		end
	end
	self.db.units.player.width = 39
	self.db.units.player.health.enabled = true
	self.db.units.player.health.size.width = 15
	self.db.units.player.power.enabled = true
	self.db.units.player.power.anchor.xOffset = 550
	self.db.units.player.classbars.enabled = true
	self.db.units.player.cpoints.enabled = true
	self.db.units.player.castbar.enabled = true
end

function H:ComboLayout()
	self.db.hideElv = false
	self.db.hideOOC = true
	self.db.enableMouse = false
	self.db.units.focus.enabled = false
	self.db.units.focustarget.enabled = false
	self.db.units.targettarget.enabled = false
	self.db.units.pettarget.enabled = false
	self.db.units.player.enabled = true
	self.db.units.target.enabled = true
	self.db.units.pet.enabled = true
	for element,_ in pairs(self.db.units.player) do
		if self:GetElement(element) then
			self.db.units.player[element].enabled = false
		end
	end
	for element,_ in pairs(self.db.units.target) do
		if self:GetElement(element) then
			self.db.units.target[element].enabled = false
		end
	end
	for element,_ in pairs(self.db.units.pet) do
		if self:GetElement(element) then
			self.db.units.pet[element].enabled = false
		end
	end
	self.db.units.player.health.enabled = true
	self.db.units.player.castbar.enabled = true
	self.db.units.player.aurabars.enabled = true
	self.db.units.target.health.enabled = true
	self.db.units.target.name.enabled = true
	self.db.units.target.raidicon.enabled = true
	self.db.units.target.aurabars.enabled = true
	self.db.units.target.castbar.enabled = true
	self.db.units.pet.health.enabled = true
	self.db.units.player.horizCastbar = true
	self.db.units.target.horizCastbar = true
	self.db.units.player.width = 39
	self.db.units.player.health.size.width = 15
	self.db.units.target.width = 39
	self.db.units.target.health.size.width = 15
	local db = E.db['unitframe']['units']
	db.player.castbar.enable = false
	db.target.castbar.enable = false
	db.player.aurabar.enable = false
	db.target.aurabar.enable = false
	UF:Update_AllFrames()
end