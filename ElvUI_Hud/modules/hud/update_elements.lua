local addon, ns = ...
local oUF = ns.oUF
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local LSM = LibStub("LibSharedMedia-3.0");
local UF = E:GetModule('UnitFrames');

local warningTextShown = false;

function H:GetCastbar(frame)
	local hc = self.units[frame.unit].hcastbar
	local vc = self.units[frame.unit].vcastbar
	frame:DisableElement('Castbar')
	if (frame.unit ~= 'player' and frame.unit ~= 'target') or not self.db.units[frame.unit].horizCastbar then
		self.units[frame.unit].castbar = vc
		frame.Castbar = frame.VertCastbar
	else
		self.units[frame.unit].castbar = hc
		frame.Castbar = frame.HorizCastbar
	end
	frame:EnableElement('Castbar')
	if frame.Castbar.ForceUpdate then frame.Castbar:ForceUpdate() end
end

-- This function is only responsible for updating bar sizes for class bar children
-- textures work normally as does parent size
function H:UpdateClassBar(frame,element)
	if not self.db.units[frame.unit] then return end
	local config = self.db.units[frame.unit][element]
	local size = config['size']
	local numPoints, maxPoints, curPoints
	local spaced = config.spaced
	if element == 'mushroom' then
		numPoints = 3
		maxPoints = 3
	end

	if element == "cpoints" then
		numPoints = 5
		maxPoints = 5
	end

	if element == 'classbars' then
		if E.myclass == "DRUID" then
			frame.EclipseBar.LunarBar:SetMinMaxValues(0, 0)
			frame.EclipseBar.SolarBar:SetMinMaxValues(0, 0)
			frame.EclipseBar.LunarBar:SetStatusBarColor(unpack(ElvUF.colors.eclipseBar[1]))
			frame.EclipseBar.SolarBar:SetStatusBarColor(unpack(ElvUF.colors.eclipseBar[2]))
			frame.EclipseBar.LunarBar:Size(frame.EclipseBar:GetSize())
			frame.EclipseBar.SolarBar:Size(frame.EclipseBar:GetSize())
			frame.EclipseBar:ForceUpdate()
			return
		end

		if E.myclass == "WARLOCK" then
			local spec = GetSpecialization()
			if spec == SPEC_WARLOCK_DESTRUCTION then
				curPoints = UnitPower('player',SPELL_POWER_BURNING_EMBERS)
				numPoints = UnitPowerMax('player',SPELL_POWER_BURNING_EMBERS)
				maxPoints = 4
			elseif spec == SPEC_WARLOCK_DEMONOLOGY then
				curPoints = 1
				numPoints = 1
				maxPoints = 1
			else
				curPoints = UnitPower('player',SPELL_POWER_SOUL_SHARDS)
				numPoints = UnitPowerMax('player',SPELL_POWER_SOUL_SHARDS)
				maxPoints = 4
			end
			if not config['enabled'] then numPoints = 4; maxPoints = 4 end
			if not frame.WarlockSpecBars.PostUpdate then
				frame.WarlockSpecBars.PostUpdate = function(self)
					if config['enabled'] then
						H:UpdateClassBar(frame,element)
					else
						self:Hide()
					end
				end
			end
		end

		if E.myclass == "PALADIN" then
			curPoints = UnitPower('player',SPELL_POWER_HOLY_POWER)
			numPoints = UnitPowerMax('player',SPELL_POWER_HOLY_POWER)
			maxPoints = 5
		end

		if E.myclass == "DEATHKNIGHT" then
			curPoints = 6
			numPoints = 6
			maxPoints = 6
		end

		if E.myclass == "SHAMAN" then
			curPoints = 4
			numPoints = 4
			maxPoints = 4
		end

		if E.myclass == "MONK" then
			curPoints = UnitPower('player',SPELL_POWER_CHI)
			numPoints = UnitPowerMax('player',SPELL_POWER_CHI)
			maxPoints = 5
			if not frame.Harmony.PostUpdate then
				frame.Harmony.PostUpdate = function(self)
					H:UpdateClassBar(frame,element)
				end
			end
		end

		if E.myclass == "PRIEST" then
			curPoints = 3
			numPoints = 3
			maxPoints = 3
		end

		if E.myclass == "MAGE" then
			curPoints = 4
			numPoints = 4
			maxPoints = 4
		end
	end

	local totalspacing = (config['spacesettings'].offset * 2) + (config['spacesettings'].spacing * numPoints) - numPoints
	local e = H:GetElement(element)
	if not frame[e] then return end
	if spaced then
		frame[e]:SetAlpha(0)
	else
		frame[e]:SetAlpha(1)
	end
	if not maxPoints then maxPoints = numPoints end
	if not curPoints then curPoints = 0 end
	for i = 1, maxPoints do
		frame[e][i]:Size(size.width,(size.height - (spaced and totalspacing or 2)) / numPoints)
		if not frame[e][i].SetAlpha_ then frame[e][i].SetAlpha_ = frame[e][i].SetAlpha; frame[e][i].SetAlpha = function(self,alpha) self:SetAlpha_(self.enabled and alpha or self.alpha) end end
		if config['enabled'] and i <= numPoints then
			frame[e][i].enabled = true
			frame[e][i].alpha = 1
			frame[e][i]:SetAlpha(i <= curPoints and 1 or .2)
			if spaced then
				frame[e][i]:SetAlpha(i <= curPoints and 1 or .2)
				frame[e][i].backdrop:Show()
			else
				frame[e][i].backdrop:Hide()
			end
		else
			frame[e][i].enabled = false
			frame[e][i].backdrop:Hide()
			frame[e][i].alpha = 0
			frame[e][i]:SetAlpha(0)
		end
	end
end

function H:UpdateClassBarAnchors(frame,element)
	local config = self.db.units[frame.unit][element]
	
	local spaced = config.spaced
	local spacing = config.spacesettings.spacing
	if not spaced then
		spacing = 1
	end

	if element == 'mushroom' then
		for i = 1,3 do
			if i == 1 then
	            frame.WildMushroom[i]:Point("BOTTOM",frame.WildMushroom)
	        else
	            frame.WildMushroom[i]:Point("BOTTOM",frame.WildMushroom[i-1], "TOP", 0, spacing)
	        end
		end
	end

	if element == "cpoints" then
		for i=1,5 do
			if i == 1 then
	            frame.CPoints[i]:Point("BOTTOM",frame.CPoints)
	        else
	            frame.CPoints[i]:Point("BOTTOM",frame.CPoints[i-1], "TOP", 0, spacing)
	        end
		end
	end

	if element == 'classbars' then
		if E.myclass == "WARLOCK" then
			for i=1,4 do
				if i == 1 then
		            frame.WarlockSpecBars[i]:Point("BOTTOM",frame.WarlockSpecBars)
		        else
		            frame.WarlockSpecBars[i]:Point("BOTTOM",frame.WarlockSpecBars[i-1], "TOP", 0, spacing)
		        end
			end
		end

		if E.myclass == "PALADIN" then
			for i=1,5 do
				if i == 1 then
		            frame.HolyPower[i]:Point("BOTTOM",frame.HolyPower)
		        else
		            frame.HolyPower[i]:Point("BOTTOM",frame.HolyPower[i-1], "TOP", 0, spacing)
		        end
			end
		end

		if E.myclass == "DEATHKNIGHT" then
			for i=1,6 do
				if i == 1 then
		            frame.Runes[i]:Point("BOTTOM",frame.Runes)
		        else
		            frame.Runes[i]:Point("BOTTOM",frame.Runes[i-1], "TOP", 0, spacing)
		        end
			end
		end

		if E.myclass == "SHAMAN" then
			for i=1,4 do
				if i == 1 then
		            frame.TotemBar[i]:Point("BOTTOM",frame.TotemBar)
		        else
		            frame.TotemBar[i]:Point("BOTTOM",frame.TotemBar[i-1], "TOP", 0, spacing)
		        end
			end
		end

		if E.myclass == "MONK" then
			for i=1,5 do
				if i == 1 then
		            frame.Harmony[i]:Point("BOTTOM",frame.Harmony)
		        else
		            frame.Harmony[i]:Point("BOTTOM",frame.Harmony[i-1], "TOP", 0, spacing)
		        end
			end
		end

		if E.myclass == "PRIEST" then
			for i=1,3 do
				if i == 1 then
		            frame.ShadowOrbsBar[i]:Point("BOTTOM",frame.ShadowOrbsBar)
		        else
		            frame.ShadowOrbsBar[i]:Point("BOTTOM",frame.ShadowOrbsBar[i-1], "TOP", 0, spacing)
		        end
			end
		end

		if E.myclass == "MAGE" then
			for i=1,4 do
				if i == 1 then
		            frame.ArcaneChargeBar[i]:Point("BOTTOM",frame.ArcaneChargeBar)
		        else
		            frame.ArcaneChargeBar[i]:Point("BOTTOM",frame.ArcaneChargeBar[i-1], "TOP", 0, spacing)
		        end
			end
		end
	end
end

local he = { ["castbar"] = true, ["aurabars"] = true }

function H:UpdateElement(frame,element)
	if element == 'castbar' then
		self:GetCastbar(frame)
	end
	
	local config = self.db.units[frame.unit][element]
	local size = config['size']
	local media = config['media']
	local e = self.units[frame.unit][element]
	if element == 'gcd' then
		if not frame.GCD then frame.GCD = self:ConstructGCD(frame) end
	end
	if size then
		if e.statusbars then
			if element == 'castbar' and size['vertical'] ~= nil then
				if not self.db.units[frame.unit].horizCastbar then
					size = size['vertical']
				else
					size = size['horizontal']
				end
			end
			
			for _,statusbar in pairs(e.statusbars) do
				statusbar:Size(size.width,size.height)
			end			
			if element == 'castbar' then
				if (frame.unit ~= 'player' and frame.unit ~= 'target') or not self.db.units[frame.unit].horizCastbar then
					frame.Castbar.Spark:Width(frame.Castbar:GetWidth()*2)
				else
					frame.Castbar.Spark:Height(frame.Castbar:GetHeight()*2)
				end
			end
		end
		if e.frame then
			local height = size.height
			if element == 'classbars' or element == 'cpoints' or element == 'mushroom' then
				if config['spaced'] then height = (height + 2) - (config['spacesettings'].offset*2) end
			end
			e.frame:Size(size.width,height)
			if element == 'classbars' or element == 'cpoints' or element == 'mushroom' then
				self:UpdateClassBar(frame,element)
			end
		end
	end
	local texture
	if he[element] and (element ~= "castbar" or (element == "castbar" and self.db.units[frame.unit].horizCastbar)) then
		texture = LSM:Fetch("statusbar",UF.db.statusbar)
	else
		texture = LSM:Fetch("statusbar",UF.db.vertstatusbar)
	end
	local font = LSM:Fetch("font",UF.db.font)
	if e.statusbars then
		for _,statusbar in pairs(e.statusbars) do
			statusbar:SetStatusBarTexture(texture)
		end
	end
	if e.textures then
		for _,texture in pairs(e.textures) do
			texture:SetTexture(E["media"].blankTex)
		end
	end
	if e.fontstrings then
		for n,fs in pairs(e.fontstrings) do
			fs:FontTemplate(font, UF.db.fontSize, "THINOUTLINE")
		end
	end
	if element == 'aurabars' then
		local buffColor = UF.db.colors.auraBarBuff
		local debuffColor = UF.db.colors.auraBarDebuff
		local aurabars = frame.AuraBars
		if not aurabars then return end
		aurabars.buffColor = {buffColor.r, buffColor.g, buffColor.b}
		aurabars.debuffColor = {debuffColor.r, debuffColor.g, debuffColor.b}
	end
end

H.enableAuraBars = false

function H:UpdateElementAnchor(frame,element)
	local e = H:GetElement(element)
	local config = self.db.units[frame.unit][element]
	local enabled = config['enabled']
	local enableAuraBars = H.enableAuraBars
	if element == 'healcomm' then
		if enabled then
			frame:EnableElement(e)
		else
			frame:DisableElement(e)
		end
		return
	end
	if element == 'aurabars' then
		local growthDirection = config.growthDirection
		if not frame.AuraBars then return end
		frame.AuraBars.down = growthDirection == "DOWN"
	end
 	local anchor = config['anchor']
	if element == 'cpoints' and not (E.myclass == "ROGUE" or E.myclass == "DRUID") then return end;
	if element == 'mushroom' then
		local WMFrame = CreateFrame('Frame',nil,frame)
		WMFrame:RegisterEvent('PLAYER_TALENT_UPDATE')
		WMFrame:SetScript('OnEvent',function(self,event)
			local config = E.db.unitframe.hud.units[frame.unit]['mushroom']
			local anchor = config['anchor']
			local eclipse
			local spec = GetSpecialization()
			if spec == 1 then
				anchor = anchor['eclipse']
				eclipse = true
			else
				anchor = anchor['default']
				eclipse = false
			end
			local pointFrom = anchor['pointFrom']
			local attachTo = H:GetAnchor(frame,anchor['attachTo'])
			local pointTo = anchor['pointTo']
			local xOffset = anchor['xOffset']
			local yOffset = anchor['yOffset']
			if config['spaced'] then yOffset = yOffset + config['spacesettings'].offset end
			frame.WildMushroom:SetPoint(pointFrom, attachTo, pointTo, xOffset, yOffset)
			H:CheckHealthValue(frame,eclipse)
		end)
		local spec = GetSpecialization()
		if spec == 1 then
			anchor = anchor['eclipse']
		else
			anchor = anchor['default']
		end
	end
	local hasAnchor = anchor ~= nil
	if element == 'castbar' then
		if frame.unit == 'player' or frame.unit == 'target' then
			if self.db.units[frame.unit].horizCastbar then
				hasAnchor = false
			end
		end
	end
	if hasAnchor then
		local pointFrom = anchor['pointFrom']
		local attachTo = H:GetAnchor(frame,anchor['attachTo'])
		local pointTo = anchor['pointTo']
		local xOffset = anchor['xOffset']
		local yOffset = anchor['yOffset']
		if (element == 'classbars' or element == 'mushroom' or element == 'cpoints') then
			if config['spaced'] then yOffset = yOffset + config['spacesettings'].offset end
		end
		if not frame[e] then return end
		frame[e]:Point(pointFrom, attachTo, pointTo, xOffset, yOffset)
		if (element == 'classbars' or element == 'mushroom' or element == 'cpoints') then
			self:UpdateClassBarAnchors(frame,element)
		end
	elseif element == 'aurabars' or element == 'castbar' then
		local f,format,moverFormat
		if element == 'aurabars' then
			f = frame.AuraBars
			format = '%s Hud AuraBar Header'
			moverFormat = '%s AuraBar Mover'
		else
			f = frame.Castbar
			format = '%s Hud Castbar'
			moverFormat = '%s Castbar Mover'
		end
	    local stringTitle = E:StringTitle(frame.unit)
    	if stringTitle:find('target') then
    	   stringTitle = gsub(stringTitle, 'target', 'Target')
    	end
    	local name = string.format(format,stringTitle)
    	if not self.moversCreated then self.moversCreated = {} end
    	if not self.moversCreated[frame.unit] then self.moversCreated[frame.unit] = {} end
    	if not self.moversCreated[frame.unit][element] then
			local holder = CreateFrame('Frame', nil, f)
			holder:Size(f:GetWidth(),f:GetHeight())
			if element == 'aurabars' then
		    	holder:Point("TOP", frame.Health, "BOTTOM", 9, -60) --Set to default position
		    else
		    	if frame.unit == 'player' then
		    		holder:Point("CENTER", E.UIParent, "CENTER", 0, -170)
		    	else
		    		holder:Point("CENTER", E.UIParent, "CENTER", 0, -200)
		    	end
		    end
		    f:ClearAllPoints()
		    f:SetPoint("TOPLEFT", holder, "BOTTOMLEFT", 0, 0)
		    f:SetPoint("TOPRIGHT", holder, "BOTTOMRIGHT", 0, 0)
		    f.Holder = holder

		    E:CreateMover(f.Holder, string.format(moverFormat,frame:GetName()), name, nil, nil, nil, 'ALL,SOLO')
		    self.moversCreated[frame.unit][element] = true
		end
	end
	if config['tag'] then
		frame:Tag(frame[e], config['tag'])
	end
	if config['value'] and frame[e].value then
		local venable = config['value']['enabled']
		local vanchor = config['value']['anchor']
		local vpointFrom = vanchor['pointFrom']
		local vattachTo = H:GetAnchor(frame,vanchor['attachTo'])
		local vpointTo = vanchor['pointTo']
		local vxOffset = vanchor['xOffset']
		local vyOffset = vanchor['yOffset']
		frame[e].value:SetPoint(vpointFrom, vattachTo, vpointTo, vxOffset, vyOffset)
		if config['value']['tag'] then
			frame:Tag(frame[e].value,config['value']['tag'])
		end
		if venable then
			frame[e].value:Show()
		else
			frame[e].value:Hide()
		end
	end

	if enabled then
		if element ~= 'aurabars' or enableAuraBars then frame:EnableElement(e) end
		frame[e]:SetAlpha(1)
		if config['value'] and frame[e].value then
			if config['value']['enabled'] then
				frame[e].value:Show()
			else
				frame[e].value:Hide()
			end
		end
		if element ~= 'raidicon' then frame[e]:Show() end
		if frame[e].ForceUpdate and (element ~= 'aurabars') then frame[e]:ForceUpdate() end
	else
		frame:DisableElement(e)
		frame[e]:SetAlpha(0)
		if element == 'gcd' then
			frame.GCD:Hide()
			frame.GCD = nil -- Ugh fuck this don't know why it won't disable
		end
		if config['value'] and frame[e].value then
			frame[e].value:Hide()
		end
		if element ~= 'gcd' then
			frame[e]:Hide()
		end
		if element == 'classbars' then -- Dirty hack for DKs
			H:ScheduleTimer(function()
				local oldValue = E.db.unitframe.units.player.classbar.enable
				E.db.unitframe.units.player.classbar.enable = false
				UF:CreateAndUpdateUF('player')
				E.db.unitframe.units.player.classbar.enable = oldValue
				UF:CreateAndUpdateUF('player')
			end, 1)
		end
	end
end

function H.PostUpdateHealth(health, unit, min, max)
	if not E.db.unitframe.hud.units[unit] then return end
    if UF.db.colors.colorhealthbyvalue then
		local dc = UF.db.colors.health
		local r = dc.r
		local g = dc.g
		local b = dc.b
		local newr, newg, newb = oUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

		health:SetStatusBarColor(newr, newg, newb)
	end

    -- Flash health below threshold %
    if max == 0 then return end
	if (min / max * 100) < (E.db.unitframe.hud.lowThreshold) then
		H.Flash(health, 0.6)
		if (not warningTextShown and unit == "player") and E.db.unitframe.hud.warningText then
			ElvUIHudWarning:AddMessage("|cffff0000LOW HEALTH")
			warningTextShown = true
		else
			ElvUIHudWarning:Clear()
			warningTextShown = false
		end
		if unit == "player" and E.db.unitframe.hud.screenflash then
			local f = H.lowHealthFlash
			if not f then return end
			f:SetAlpha(1)
			H.Flash(f, 0.6)
		end
	else
		local f = H.lowHealthFlash
		if not f then return end
		f:SetAlpha(0)
	end
end

local ticks = {}
hooksecurefunc(UF,'SetCastTicks',function(self,frame,numTicks,extraTickRatio)
	extraTickRatio = extraTickRatio or 0
	local color = E.db.unitframe.hud.units.player['castbar']['tickcolor']
	UF:HideTicks()
	if numTicks and numTicks > 0 then
		local d = frame:GetWidth() / (numTicks + extraTickRatio)
		for i = 1, numTicks do
			if not ticks[i] then
				ticks[i] = frame:CreateTexture(nil, 'OVERLAY')
				ticks[i]:SetTexture(E["media"].normTex)
				ticks[i]:SetVertexColor(color.r, color.g, color.b)
				ticks[i]:SetWidth(1)
				ticks[i]:SetHeight(frame:GetHeight())
			end
			ticks[i]:ClearAllPoints()
			ticks[i]:SetPoint("CENTER", frame, "LEFT", d * i, 0)
			ticks[i]:Show()
		end
	end
end)

-- used to check if a spell is interruptable
function H:CheckInterrupt(unit)
	if unit == "vehicle" then unit = "player" end
	if self.interrupt and UnitCanAttack("player", unit) then
		local c = E.db.unitframe.colors.castColor
		if not c then return end
		self:SetStatusBarColor(c.r,c.g,c.b)	
	else
		local c = E.db.unitframe.colors.castNoInterrupt
		if not c then return end
		self:SetStatusBarColor(c.r,c.g,c.b)	
	end
end

-- check if we can interrupt on cast
function H:CheckCast(unit, name, rank, castid)
	H.CheckInterrupt(self,unit)
end

-- display casting time
function H:CustomCastTimeText(duration)
	self.Time:SetText(("%.1f / %.1f"):format(self.channeling and duration or self.max - duration, self.max))
end

-- display delay in casting time
function H:CustomCastDelayText(duration)
	self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(self.channeling and duration or self.max - duration, self.channeling and "- " or "+", self.delay))
end

function H.PreUpdatePowerHud(power, unit)
    local _, pType = UnitPowerType(unit)

    local color = oUF["colors"].power[pType]
    if color then
        power:SetStatusBarColor(color[1], color[2], color[3])
    end
end

function H.PostUpdatePowerHud(power, unit, min, max)
    local self = power:GetParent()

	-- Flash mana below threshold %
	local powerMana, _ = UnitPowerType(unit)
	if (min / max * 100) < (E.db.unitframe.hud.lowThreshold) and (powerMana == SPELL_POWER_MANA) and self.db.flash then
		H.Flash(power, 0.4)
		if self.db.warningText then
			if not warningTextShown and unit == "player" then
				ElvUIHudWarning:AddMessage("|cff00ffffLOW MANA")
				warningTextShown = true
			else
				ElvUIHudWarning:Clear()
				warningTextShown = false
			end
		end
	end
end

function H:ComboDisplay(event, unit)
	if(unit == 'pet') then return end
	
	local cpoints = self.CPoints
	local cp
	if(UnitExists'vehicle') then
		cp = GetComboPoints('vehicle', 'target')
	else
		cp = GetComboPoints('player', 'target')
	end

	for i=1, MAX_COMBO_POINTS do
		if(i <= cp) then
			cpoints[i]:SetAlpha(1)
		else
			cpoints[i]:SetAlpha(0.15)
		end
	end
	
	if cpoints[1]:GetAlpha() == 1 then
		for i=1, MAX_COMBO_POINTS do
			cpoints[i]:Show()
		end
	else
		for i=1, MAX_COMBO_POINTS do
			cpoints[i]:Hide()
		end
	end
end

local updateSafeZone = function(self,c)
	local sz = self.SafeZone
	local height = self:GetHeight()
	local _, _, _, ms = GetNetStats()

	sz:ClearAllPoints()
	if c then sz:SetPoint('TOP') else sz:SetPoint('BOTTOM') end
	sz:SetPoint('LEFT')
	sz:SetPoint('RIGHT')

	-- Guard against GetNetStats returning latencies of 0.
	if(ms ~= 0) then
		-- MADNESS!
		local safeZonePercent = (height / self.max) * (ms / 1e5)
		if(safeZonePercent > 1) then safeZonePercent = 1 end
		sz:SetHeight(height * safeZonePercent)
		sz:Show()
	else
		sz:Hide()
	end
end

function H:PostCastStart(unit, name, rank, castid)
	H.CheckInterrupt(self,unit)
	local sz = self.SafeZone
	if sz then
		updateSafeZone(self,true)
	end
end

function H:PostChannelStart(unit, name, rank, castid)
	H.CheckInterrupt(self,unit)
	local sz = self.SafeZone
	if sz then
		updateSafeZone(self,false)
	end
end

function H:CastbarUpdate(elapsed)
	if(self.casting) then
		local duration = self.duration + elapsed
		if(duration >= self.max) then
			self.casting = nil
			self:Hide()

			if(self.PostCastStop) then self:PostCastStop(self.__owner.unit) end
			return
		end

		if(self.Time) then
			if(self.delay ~= 0) then
				if(self.CustomDelayText) then
					self:CustomDelayText(duration)
				else
					self.Time:SetFormattedText("%.1f|cffff0000-%.1f|r", duration, self.delay)
				end
			else
				if(self.CustomTimeText) then
					self:CustomTimeText(duration)
				else
					self.Time:SetFormattedText("%.1f", duration)
				end
			end
		end

		self.duration = duration
		self:SetValue(duration)

		if(self.Spark) then
			self.Spark:SetPoint("CENTER", self, "BOTTOM", 0, (duration / self.max) * self:GetHeight())
		end
	elseif(self.channeling) then
		local duration = self.duration - elapsed

		if(duration <= 0) then
			self.channeling = nil
			self:Hide()

			if(self.PostChannelStop) then self:PostChannelStop(self.__owner.unit) end
			return
		end

		if(self.Time) then
			if(self.delay ~= 0) then
				if(self.CustomDelayText) then
					self:CustomDelayText(duration)
				else
					self.Time:SetFormattedText("%.1f|cffff0000-%.1f|r", duration, self.delay)
				end
			else
				if(self.CustomTimeText) then
					self:CustomTimeText(duration)
				else
					self.Time:SetFormattedText("%.1f", duration)
				end
			end
		end

		self.duration = duration
		self:SetValue(duration)
		if(self.Spark) then
			self.Spark:SetPoint("CENTER", self, "BOTTOM", 0, (duration / self.max) * self:GetHeight())
		end
	else
		self.unitName = nil
		self.casting = nil
		self.castid = nil
		self.channeling = nil

		self:SetValue(1)
		self:Hide()
	end
end

function H:UpdateHoly(event,unit,powerType)
	if(self.unit ~= unit or (powerType and powerType ~= 'HOLY_POWER')) then return end
	local num = UnitPower(unit, SPELL_POWER_HOLY_POWER)
	for i = 1, 5 do
		if(i <= num) then
			self.HolyPower[i]:SetAlpha(1)
		else
			self.HolyPower[i]:SetAlpha(.2)
		end
	end
end

function H:UpdateShards(event, unit, powerType)
	if(self.unit ~= unit or (powerType and powerType ~= 'SOUL_SHARDS')) then return end
	local num = UnitPower(unit, SPELL_POWER_SOUL_SHARDS)
	for i = 1, SHARD_BAR_NUM_SHARDS do
		if(i <= num) then
			self.SoulShards[i]:SetAlpha(1)
		else
			self.SoulShards[i]:SetAlpha(.2)
		end
	end
end

local function FormatTime(s)
	local day, hour, minute = 86400, 3600, 60
	if s >= day then
		return format("%dd", ceil(s / day))
	elseif s >= hour then
		return format("%dh", ceil(s / hour))
	elseif s >= minute then
		return format("%dm", ceil(s / minute))
	elseif s >= minute / 12 then
		return floor(s)
	end
	return format("%.1f", s)
end

-- create a timer on a buff or debuff
local function CreateAuraTimer(self, elapsed)
	if self.timeLeft then
		self.elapsed = (self.elapsed or 0) + elapsed
		if self.elapsed >= 0.1 then
			if not self.first then
				self.timeLeft = self.timeLeft - self.elapsed
			else
				self.timeLeft = self.timeLeft - GetTime()
				self.first = false
			end
			if self.timeLeft > 0 then
				local time = FormatTime(self.timeLeft)
				self.remaining:SetText(time)
				if self.timeLeft <= 5 then
					self.remaining:SetTextColor(0.99, 0.31, 0.31)
				else
					self.remaining:SetTextColor(1, 1, 1)
				end
			else
				self.remaining:Hide()
				self:SetScript("OnUpdate", nil)
			end
			self.elapsed = 0
		end
	end
end

-- create a skin for all unitframes buffs/debuffs
function H:PostCreateAura(button)
	button:SetTemplate("Default")
	
	button.remaining = button:CreateFontString(nil, "THINOUTLINE")
	-- Dummy font
	button.remaining:FontTemplate(LSM:Fetch("font", "ElvUI Font"), 12, "THINOUTLINE")
	button.remaining:Point("CENTER", 1, 0)
	
	button.cd.noOCC = true -- hide OmniCC CDs, because we  create our own cd with CreateAuraTimer()
	button.cd.noCooldownCount = true -- hide CDC CDs, because we create our own cd with CreateAuraTimer()
	
	button.cd:SetReverse()
	button.icon:Point("TOPLEFT", 2, -2)
	button.icon:Point("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	button.icon:SetDrawLayer('ARTWORK')
	
	button.count:Point("BOTTOMRIGHT", 3, 3)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(LSM:Fetch("font", "ElvUI Font"), 9, "THICKOUTLINE")
	button.count:SetTextColor(0.84, 0.75, 0.65)
	
	button.overlayFrame = CreateFrame("frame", nil, button, nil)
	button.cd:SetFrameLevel(button:GetFrameLevel() + 1)
	button.cd:ClearAllPoints()
	button.cd:Point("TOPLEFT", button, "TOPLEFT", 2, -2)
	button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
	button.overlayFrame:SetFrameLevel(button.cd:GetFrameLevel() + 1)	   
	button.overlay:SetParent(button.overlayFrame)
	button.count:SetParent(button.overlayFrame)
	button.remaining:SetParent(button.overlayFrame)
			
	button.Glow = CreateFrame("Frame", nil, button)
	button.Glow:Point("TOPLEFT", button, "TOPLEFT", -3, 3)
	button.Glow:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 3, -3)
	button.Glow:SetFrameStrata("BACKGROUND")	
	button.Glow:SetBackdrop{edgeFile = E["media"].blankTex, edgeSize = 3, insets = {left = 0, right = 0, top = 0, bottom = 0}}
	button.Glow:SetBackdropColor(0, 0, 0, 0)
	button.Glow:SetBackdropBorderColor(0, 0, 0)
	
	local Animation = button:CreateAnimationGroup()
	Animation:SetLooping("BOUNCE")

	local FadeOut = Animation:CreateAnimation("Alpha")
	FadeOut:SetChange(-.9)
	FadeOut:SetDuration(.6)
	FadeOut:SetSmoothing("IN_OUT")

	button.Animation = Animation
end

-- update cd, border color, etc on buffs / debuffs
function H:PostUpdateAura(unit, icon, index, offset, filter, isDebuff, duration, timeLeft)
	local _, _, _, _, dtype, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, index, icon.filter)
	if icon then
		if(icon.filter == "HARMFUL") then
			if(not UnitIsFriend("player", unit) and icon.owner ~= "player" and icon.owner ~= "vehicle") then
				icon.icon:SetDesaturated(true)
				icon:SetBackdropBorderColor(unpack(E.media.bordercolor))
			else
				local color = DebuffTypeColor[dtype] or DebuffTypeColor.none
				icon.icon:SetDesaturated(false)
				icon:SetBackdropBorderColor(color.r * 0.8, color.g * 0.8, color.b * 0.8)
			end
		else
			if (isStealable or ((E.myclass == "MAGE" or E.myclass == "PRIEST" or E.myclass == "SHAMAN") and dtype == "Magic")) and not UnitIsFriend("player", unit) then
				if not icon.Animation:IsPlaying() then
					icon.Animation:Play()
				end
			else
				if icon.Animation:IsPlaying() then
					icon.Animation:Stop()
				end
			end
		end
		
		if duration and duration > 0 then
			icon.remaining:Show()
		else
			icon.remaining:Hide()
		end
	 
		icon.duration = duration
		icon.timeLeft = expirationTime
		icon.first = true
		icon:SetScript("OnUpdate", CreateAuraTimer)
	end
end

local function CheckFilter(filterType, isFriend)
	local FRIENDLY_CHECK, ENEMY_CHECK = false, false
	if type(filterType) == 'string' then
		error('Database conversion failed! Report to Elv.')
	elseif type(filterType) == 'boolean' then
		FRIENDLY_CHECK = filterType
		ENEMY_CHECK = filterType
	elseif filterType then
		FRIENDLY_CHECK = filterType.friendly
		ENEMY_CHECK = filterType.enemy
	end
	
	if (FRIENDLY_CHECK and isFriend) or (ENEMY_CHECK and not isFriend) then
		return true
	end
	
	return false
end

function H:AuraFilter(unit, icon, name, rank, texture, count, dtype, duration, timeLeft, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff)	
	if E.global.unitframe.InvalidSpells[spellID] then
		return false;
	end

	local isPlayer, isFriend

	if not E.db.unitframe.units[unit] then return end
	local db = E.db.unitframe.units[unit]
	if not db or not db[self.type] then return; end
	
	db = db[self.type]

	local returnValue = true;
	local returnValueChanged = false;
	if caster == 'player' or caster == 'vehicle' then isPlayer = true end
	if UnitIsFriend('player', unit) then isFriend = true end
	
	icon.isPlayer = isPlayer
	icon.owner = caster
	icon.name = name
	
	--This should be sorted as least priority checked first
	--most priority last
	
	if CheckFilter(db.playerOnly, isFriend) then
		if isPlayer then
			returnValue = true;
		elseif not returnValueChanged then
			returnValue = false;
		end
		returnValueChanged = true;
	end
	
	if CheckFilter(db.onlyDispellable, isFriend) then
		if (self.type == 'buffs' and isStealable) or (self.type == 'debuffs' and dtype and E:IsDispellableByMe(dtype)) then
			returnValue = true;
		elseif not returnValueChanged then
			returnValue = false;
		end
		returnValueChanged = true;
	end
	
	if CheckFilter(db.noConsolidated, isFriend) then
		if shouldConsolidate == 1 then
			returnValue = false;
		elseif not returnValueChanged then
			returnValue = true;
		end
		
		returnValueChanged = true;
	end
	
	if CheckFilter(db.noDuration, isFriend) then
		if (duration == 0 or not duration) then
			returnValue = false;
		elseif not returnValueChanged then
			returnValue = true;
		end
		
		returnValueChanged = true;
	end
	
	if CheckFilter(db.useBlacklist, isFriend) then
		if E.global['unitframe']['aurafilters']['Blacklist'].spells[name] and E.global['unitframe']['aurafilters']['Blacklist'].spells[name].enable then
			returnValue = false;
		elseif not returnValueChanged then
			returnValue = true;
		end
		
		returnValueChanged = true;
	end
	
	if CheckFilter(db.useWhitelist, isFriend) then
		if E.global['unitframe']['aurafilters']['Whitelist'].spells[name] and E.global['unitframe']['aurafilters']['Whitelist'].spells[name].enable then
			returnValue = true;
		elseif not returnValueChanged then
			returnValue = false;
		end
		
		returnValueChanged = true;
	end	

	if db.useFilter and E.global['unitframe']['aurafilters'][db.useFilter] then
		local type = E.global['unitframe']['aurafilters'][db.useFilter].type
		local spellList = E.global['unitframe']['aurafilters'][db.useFilter].spells

		if type == 'Whitelist' then
			if spellList[name] and spellList[name].enable then
				returnValue = true	
			elseif not returnValueChanged then
				returnValue = false
			end

		elseif type == 'Blacklist' and spellList[name] and spellList[name].enable then
			returnValue = false				
		end
	end		

	return returnValue	
end

function H:AuraBarFilter(unit, name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate)
	if not E.db.unitframe.units[unit] then return end
	local db = E.db.unitframe.units[unit].aurabar
	if not db then return; end
		
	local isPlayer, isFriend

	if unitCaster == 'player' or unitCaster == 'vehicle' then isPlayer = true end
	if UnitIsFriend('player', unit) then isFriend = true end

	if E.global['unitframe']['aurafilters']['Blacklist'].spells[name] and CheckFilter(db.useBlacklist, isFriend) then
		return false
	end	
	
	if E.global['unitframe']['aurafilters']['Whitelist'].spells[name] and CheckFilter(db.useWhitelist, isFriend) then
		return true
	end

	if (duration == 0 or not duration) and CheckFilter(db.noDuration, isFriend) then
		return false
	end	

	if shouldConsolidate == 1 and CheckFilter(db.noConsolidated, isFriend) then
		return false
	end	

	if not isPlayer and CheckFilter(db.playerOnly, isFriend) then
		return false
	end
	
	if db.useFilter and E.global['unitframe']['aurafilters'][db.useFilter] then
		local type = E.global['unitframe']['aurafilters'][db.useFilter].type
		local spellList = E.global['unitframe']['aurafilters'][db.useFilter].spells

		if type == 'Whitelist' then
			if spellList[name] and spellList[name].enable then
				return true
			else
				return false
			end		
		elseif type == 'Blacklist' then
			if spellList[name] and spellList[name].enable then
				return false
			else
				return true
			end				
		end
	end	
	
	return true
end
