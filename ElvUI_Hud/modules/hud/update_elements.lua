local addon, ns = ...
local oUF = ns.oUF
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local LSM = LibStub("LibSharedMedia-3.0");
local UF = E:GetModule('UnitFrames');

local floor = math.floor
local sub = string.sub
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
	local colors, dcolors
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
			frame.EclipseBar.LunarBar:SetStatusBarColor(unpack(ElvUF.colors.EclipseBar[1]))
			frame.EclipseBar.SolarBar:SetStatusBarColor(unpack(ElvUF.colors.EclipseBar[2]))
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
			if frame.ShardBar and not frame.ShardBar.PostUpdate then
				frame.ShardBar.PostUpdate = function(self)
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
		if E.myclass ~= 'MONK' and E.myclass ~= 'WARLOCK' and E.myclass ~= 'DRUID' and E.myclass ~= 'DEATHKNIGHT' and E.myclass ~= 'ROGUE' then	
			frame[e][i]:SetStatusBarColor(unpack(ElvUF.colors[frame.ClassBar]))

			if frame[e][i].bg then
				frame[e][i].bg:SetTexture(unpack(ElvUF.colors[frame.ClassBar]))
			end
		end
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
		            frame.ShardBar[i]:Point("BOTTOM",frame.ShardBar)
		        else
		            frame.ShardBar[i]:Point("BOTTOM",frame.ShardBar[i-1], "TOP", 0, spacing)
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
		            frame.ShadowOrbs[i]:Point("BOTTOM",frame.ShadowOrbs)
		        else
		            frame.ShadowOrbs[i]:Point("BOTTOM",frame.ShadowOrbs[i-1], "TOP", 0, spacing)
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
		if element == 'portrait' and config.overlay then return end
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
		if element == 'health' then
			frame:Size(frame.Health:GetSize())
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
		aurabars.auraBarHeight = size.height
		aurabars.auraBarWidth = size.width
		aurabars:Size(size.width,size.height)
		if aurabars.SetAnchors then aurabars:SetAnchors() end
	end
end

H.enableAuraBars = false

function H:UpdateElementAnchor(frame,element)
	local e = H:GetElement(element)
	local config = self.db.units[frame.unit][element]
	local enabled = config['enabled']
	local enableAuraBars = H.enableAuraBars
	if element == 'resurrecticon' then
		if enabled then
			frame:EnableElement(e)
		else
			frame:DisableElement(e)
		end
		return
	end
	if element == 'healcomm' then
		local use_portrait = self.db.units[frame.unit].portrait and self.db.units[frame.unit].portrait.enabled
		local overlay_enabled = use_portrait and self.db.units[frame.unit].portrait.overlay
		local c = UF.db.colors.healPrediction
		local healPrediction = frame[e]
		if enabled then
			if not frame:IsElementEnabled('HealPrediction') then
				frame:EnableElement('HealPrediction')
			end		
			
			healPrediction.myBar:SetFrameLevel(frame:GetFrameLevel()+10)
			healPrediction.otherBar:SetFrameLevel(frame:GetFrameLevel()+10)
			healPrediction.absorbBar:SetFrameLevel(frame:GetFrameLevel()+10)
			
			healPrediction.myBar:SetStatusBarColor(c.personal.r, c.personal.g, c.personal.b, c.personal.a)
			healPrediction.otherBar:SetStatusBarColor(c.others.r, c.others.g, c.others.b, c.others.a)
			healPrediction.absorbBar:SetStatusBarColor(c.absorbs.r, c.absorbs.g, c.absorbs.b, c.absorbs.a)				
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
		local _frame = frame[e]
		if (element == 'classbars' or element == 'mushroom' or element == 'cpoints') then
			if config['spaced'] then yOffset = yOffset + config['spacesettings'].offset end
		end
		if not _frame then return end
		_frame:Point(pointFrom, attachTo, pointTo, xOffset, yOffset)
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
	elseif element == 'portrait' then
		local portrait = frame.Portrait
		if not portrait then return end
		portrait:ClearAllPoints()
		portrait:SetFrameLevel(frame.Health:GetFrameLevel())
		portrait.overlay:SetFrameLevel(portrait:GetFrameLevel() + 1)
		portrait.overlay:SetAllPoints()
		portrait.overlay:Point("TOP",frame.Health)
		portrait.overlay:Point("BOTTOM",frame.Health:GetStatusBarTexture(),"TOP")
		portrait:SetAllPoints(frame.Health)
		if config.enabled then
			portrait.overlay:Show()
			portrait:SetAlpha(0.3)
			portrait:Show()		
		else
			portrait.overlay:Hide()
			portrait:Hide()
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
		if element ~= 'aurabars' or enableAuraBars then frame:EnableElement(e); if element == 'aurabars' then frame[e]:SetAnchors() end end
		frame[e]:SetAlpha(1)
		if config['value'] and frame[e].value then
			if config['value']['enabled'] then
				frame[e].value:Show()
			else
				frame[e].value:Hide()
			end
		end
		if element ~= 'raidicon' then frame[e]:Show() else frame[e]:Size(frame:GetWidth()*.8) end
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
		if element == 'portrait' then frame[e]:ForceUpdate() end
	end
end

function H:PostUpdateHealth(unit, min, max)
	if unit == "vehicle" then unit = "player" end
	if not E.db.unitframe.hud.units[unit] then return end
	local parent = self:GetParent()

    if parent.ResurrectIcon then
		parent.ResurrectIcon:SetAlpha(min == 0 and 1 or 0)
	end
	
	local r, g, b = self:GetStatusBarColor()
	local colors = E.db['unitframe']['colors'];
	if (colors.healthclass == true and colors.colorhealthbyvalue == true) or (colors.colorhealthbyvalue and parent.isForced) or not (UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
		local newr, newg, newb = ElvUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

		self:SetStatusBarColor(newr, newg, newb)
		if self.bg and self.bg.multiplier then
			local mu = self.bg.multiplier
			self.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
		end
	end

	if E.db.unitframe.hud.units[unit].portrait and E.db.unitframe.hud.units[unit].portrait.enabled then
		if self:GetParent().Portrait then
			local overlay = self:GetParent().Portrait.overlay
			local r, g, b = self:GetStatusBarColor()
			local mu=self.bg.multiplier
			overlay:SetBackdropColor(r*mu,g*mu,b*mu)
		end
	end

	if colors.classbackdrop then
		local reaction = UnitReaction(unit, 'player')
		local t
		if UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			t = parent.colors.class[class]
		elseif reaction then
			t = parent.colors.reaction[reaction]
		end

		if t then
			self.bg:SetVertexColor(t[1], t[2], t[3])
		end
	end
	
	--Backdrop
	if colors.customhealthbackdrop then
		local backdrop = colors.health_backdrop
		self.bg:SetVertexColor(backdrop.r, backdrop.g, backdrop.b)		
	end

    -- Flash health below threshold %
    if max == 0 then return end
	if (min / max * 100) < (E.db.unitframe.hud.lowThreshold) then
		E:Flash(parent, 0.6)
		if (not warningTextShown and unit == "player") and E.db.unitframe.hud.warningText then
			ElvUIHudWarning:AddMessage("|cffff0000LOW HEALTH")
			warningTextShown = true
		else
			ElvUIHudWarning:Clear()
			warningTextShown = false
		end
		if unit == "player" and E.db.unitframe.hud.screenflash then
			ElvUIHudScreenFlash:SetAlpha(1)
			E:Flash(ElvUIHudScreenFlash, 0.6)
		end
	else
		E:StopFlash(parent)
		E:StopFlash(ElvUIHudScreenFlash)
		ElvUIHudScreenFlash:SetAlpha(0)
	end
end

function H:CustomCastDelayText(duration)
	local db = H.db.units[self:GetParent().unit]
	if not db then return end
	
	if self.channeling then
		if db.castbar.format == 'CURRENT' then
			self.Time:SetText(("%.1f |cffaf5050%.1f|r"):format(abs(duration - self.max), self.delay))
		elseif db.castbar.format == 'CURRENTMAX' then
			self.Time:SetText(("%.1f / %.1f |cffaf5050%.1f|r"):format(duration, self.max, self.delay))
		elseif db.castbar.format == 'REMAINING' then
			self.Time:SetText(("%.1f |cffaf5050%.1f|r"):format(duration, self.delay))
		end			
	else
		if db.castbar.format == 'CURRENT' then
			self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(duration, "+", self.delay))
		elseif db.castbar.format == 'CURRENTMAX' then
			self.Time:SetText(("%.1f / %.1f |cffaf5050%s %.1f|r"):format(duration, self.max, "+", self.delay))
		elseif db.castbar.format == 'REMAINING' then
			self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(abs(duration - self.max), "+", self.delay))
		end		
	end
end

function UF:CustomTimeText(duration)
	local db = H.db.units[self:GetParent().unit]
	if not db then return end

	if self.channeling then
		if db.castbar.format == 'CURRENT' then
			self.Time:SetText(("%.1f"):format(abs(duration - self.max)))
		elseif db.castbar.format == 'CURRENTMAX' then
			self.Time:SetText(("%.1f / %.1f"):format(duration, self.max))
			self.Time:SetText(("%.1f / %.1f"):format(abs(duration - self.max), self.max))
		elseif db.castbar.format == 'REMAINING' then
			self.Time:SetText(("%.1f"):format(duration))
		end				
	else
		if db.castbar.format == 'CURRENT' then
			self.Time:SetText(("%.1f"):format(duration))
		elseif db.castbar.format == 'CURRENTMAX' then
			self.Time:SetText(("%.1f / %.1f"):format(duration, self.max))
		elseif db.castbar.format == 'REMAINING' then
			self.Time:SetText(("%.1f"):format(abs(duration - self.max)))
		end		
	end
end

function H:PreUpdatePowerHud(unit)
    local _, pType = UnitPowerType(unit)

    local color = oUF["colors"].power[pType]
    if color then
        self:SetStatusBarColor(color[1], color[2], color[3])
    end
end

function H:PostUpdatePowerHud(unit, min, max)
	-- Flash mana below threshold %
	local powerMana, _ = UnitPowerType(unit)
	if (min / max * 100) < (E.db.unitframe.hud.lowThreshold) and (powerMana == SPELL_POWER_MANA) and H.db.flash then
		if H.db.warningText then
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

local hticks = {}
local vticks = {}
function H:HideTicks()
	for i=1, #hticks do
		hticks[i]:Hide()
	end	
	for i=1, #vticks do
		vticks[i]:Hide()
	end	
end

function H:SetCastTicks(frame, numTicks, extraTickRatio)
	extraTickRatio = extraTickRatio or 0
	H:HideTicks()
	if numTicks and numTicks <= 0 then return end;
	local w = frame:GetOrientation() == "HORIZONTAL" and frame:GetWidth() or frame:GetHeight()
	local d = w / (numTicks + extraTickRatio)
	local color = H.db.units[frame:GetParent().unit].castbar.tickcolor
	local ticks = frame:GetOrientation() == "HORIZONTAL" and hticks or vticks
	--local _, _, _, ms = GetNetStats()
	for i = 1, numTicks do
		if not ticks[i] then
			ticks[i] = frame:CreateTexture(nil, 'OVERLAY')
			ticks[i]:SetTexture(E["media"].normTex)
			ticks[i]:SetVertexColor(color.r, color.g, color.b, 0.8)
			if frame:GetOrientation() == "HORIZONTAL" then
				ticks[i]:Width(1)
				ticks[i]:SetHeight(frame:GetHeight())
			else
				ticks[i]:Height(1)
				ticks[i]:SetWidth(frame:GetWidth())
			end
		end
		
		--[[if(ms ~= 0) then
			local perc = (w / frame.max) * (ms / 1e5)
			if(perc > 1) then perc = 1 end

			ticks[i]:SetWidth((w * perc) / (numTicks + extraTickRatio))
		else
			ticks[i]:Width(1)
		end]]
		
		ticks[i]:ClearAllPoints()
		if frame:GetOrientation() == "HORIZONTAL" then
			ticks[i]:SetPoint("RIGHT", frame, "LEFT", d * i, 0)
		else
			ticks[i]:SetPoint("TOP", frame, "BOTTOM", 0, d * i)
		end
		ticks[i]:Show()
	end
end

function H:PostCastStart(unit, name, rank, castid)
	local db = H.db.units[unit]
	if not db or not db.castbar then return; end
	
	if unit == "vehicle" then unit = "player" end
	
	if db.castbar.displayTarget and self.curTarget then
		self.Text:SetText(sub(name..' --> '..self.curTarget, 0, floor((((32/245) * self:GetWidth()) / E.db['unitframe'].fontSize) * 12)))
	else
		self.Text:SetText(sub(name, 0, floor((((32/245) * self:GetWidth()) / E.db['unitframe'].fontSize) * 12)))
	end

	if self:GetOrientation() == "HORIZONTAL" then
		self.Spark:Height(self:GetHeight() * 2)
	else
		self.Spark:Width(self:GetWidth() * 2)
	end
		
	self.unit = unit

	if db.castbar.ticks and unit == "player" then
		local unitframe = E.global.unitframe
		local baseTicks = unitframe.ChannelTicks[name]
		
        -- Detect channeling spell and if it's the same as the previously channeled one
        if baseTicks and name == prevSpellCast then
            self.chainChannel = true
        elseif baseTicks then
            self.chainChannel = nil
            self.prevSpellCast = name
        end
		
		if baseTicks and unitframe.ChannelTicksSize[name] and unitframe.HastedChannelTicks[name] then
			local tickIncRate = 1 / baseTicks
			local curHaste = UnitSpellHaste("player") * 0.01
			local firstTickInc = tickIncRate / 2
			local bonusTicks = 0
			if curHaste >= firstTickInc then
				bonusTicks = bonusTicks + 1
			end
			
			local x = tonumber(E:Round(firstTickInc + tickIncRate, 2))
			while curHaste >= x do
				x = tonumber(E:Round(firstTickInc + (tickIncRate * bonusTicks), 2))
				if curHaste >= x then
					bonusTicks = bonusTicks + 1
				end
			end

            local baseTickSize = unitframe.ChannelTicksSize[name]
            local hastedTickSize = baseTickSize / (1 + curHaste)
            local extraTick = self.max - hastedTickSize * (baseTicks + bonusTicks)
            local extraTickRatio = extraTick / hastedTickSize

			H:SetCastTicks(self, baseTicks + bonusTicks, extraTickRatio)
		elseif baseTicks and unitframe.ChannelTicksSize[name] then
			local curHaste = UnitSpellHaste("player") * 0.01
            local baseTickSize = unitframe.ChannelTicksSize[name]
            local hastedTickSize = baseTickSize / (1 +  curHaste)
            local extraTick = self.max - hastedTickSize * (baseTicks)
            local extraTickRatio = extraTick / hastedTickSize

			H:SetCastTicks(self, baseTicks, extraTickRatio)
		elseif baseTicks then
			H:SetCastTicks(self, baseTicks)
		else
			H:HideTicks()
		end
	elseif unit == 'player' then
		H:HideTicks()			
	end	
	
	local colors = ElvUF.colors
	local r, g, b = colors.castColor[1], colors.castColor[2], colors.castColor[3]
	if UF.db.colors.castClassColor then
		local t
		if UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			t = ElvUF.colors.class[class]
		elseif UnitReaction(unit, 'player') then
			t = ElvUF.colors.reaction[UnitReaction(unit, "player")]
		end
			
		if(t) then
			r, g, b = t[1], t[2], t[3]
		end		
	end
	
	if self.interrupt and unit ~= "player" and UnitCanAttack("player", unit) then
		r, g, b = colors.castNoInterrupt[1], colors.castNoInterrupt[2], colors.castNoInterrupt[3]
	end
	
	self:SetStatusBarColor(r, g, b)
	UF:ToggleTransparentStatusBar(UF.db.colors.transparentCastbar, self, self.bg, nil, true)
	if self.bg:IsShown() then
		self.bg:SetTexture(r * 0.25, g * 0.25, b * 0.25)
		
		local _, _, _, alpha = self.backdrop:GetBackdropColor()
		self.backdrop:SetBackdropColor(r * 0.58, g * 0.58, b * 0.58, alpha)
	end

	if self:GetOrientation() == "VERTICAL" then
		local sz = self.SafeZone
		if sz then
			updateSafeZone(self,true)
		end
	end
end

function H:PostChannelUpdate(unit, name)
	local db = H.db.units[unit]
	if not db then return; end
    if not (unit == "player" or unit == "vehicle") then return end
	
	if db.castbar.ticks then
		local unitframe = E.global.unitframe
		local baseTicks = unitframe.ChannelTicks[name]
		
		if baseTicks and unitframe.ChannelTicksSize[name] and unitframe.HastedChannelTicks[name] then
			local tickIncRate = 1 / baseTicks
			local curHaste = UnitSpellHaste("player") * 0.01
			local firstTickInc = tickIncRate / 2
			local bonusTicks = 0
			if curHaste >= firstTickInc then
				bonusTicks = bonusTicks + 1
			end

			local x = tonumber(E:Round(firstTickInc + tickIncRate, 2))
			while curHaste >= x do
				x = tonumber(E:Round(firstTickInc + (tickIncRate * bonusTicks), 2))
				if curHaste >= x then
					bonusTicks = bonusTicks + 1
				end
			end

			local baseTickSize = unitframe.ChannelTicksSize[name]
			local hastedTickSize = baseTickSize / (1 + curHaste)
			local extraTick = self.max - hastedTickSize * (baseTicks + bonusTicks)
			if self.chainChannel then
				self.extraTickRatio = extraTick / hastedTickSize
				self.chainChannel = nil
			end

			H:SetCastTicks(self, baseTicks + bonusTicks, self.extraTickRatio)
		elseif baseTicks and unitframe.ChannelTicksSize[name] then
			local curHaste = UnitSpellHaste("player") * 0.01
			local baseTickSize = unitframe.ChannelTicksSize[name]
			local hastedTickSize = baseTickSize / (1 + curHaste)
			local extraTick = self.max - hastedTickSize * (baseTicks)
			if self.chainChannel then
				self.extraTickRatio = extraTick / hastedTickSize
				self.chainChannel = nil
			end

			H:SetCastTicks(self, baseTicks, self.extraTickRatio)
		elseif baseTicks then
			H:SetCastTicks(self, baseTicks)
		else
			H:HideTicks()
		end
	else
		H:HideTicks()			
	end

	if self:GetOrientation() == "VERTICAL" then
		local sz = self.SafeZone
		if sz then
			updateSafeZone(self,false)
		end
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
	if unit == "vehicle" then unit = "player" end
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
	if unit == "vehicle" then unit = "player" end
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

function H:PortraitUpdate(unit)
	if unit == "vehicle" then unit = "player" end
	local db = E.db.unitframe.hud.units[unit]
	
	if not db then return end
	
	local portrait = db.portrait
	if portrait.enabled and portrait.overlay then
		self:SetAlpha(0); 
		self:SetAlpha(0.35);
	else
		self:SetAlpha(1)
	end
	
	if self:GetObjectType() ~= 'Texture' then
		local model = self:GetModel()
		if model and model.find and model:find("worgenmale") then
			self:SetCamera(1)
		end	
		
		if self:GetFacing() ~= (portrait.rotation / 60) then
			self:SetFacing(portrait.rotation / 60)
		end

		self:SetCamDistanceScale(portrait.camDistanceScale)
	end
end

function H:PostUpdateArcaneChargeBar(event, arcaneCharges, maxCharges)
	local talentSpecialization = GetSpecialization()

	local alpha;
	if (talentSpecialization ~= 1) then
		alpha = 0;
	else
		alpha = 1;
	end
	for i = 1,4 do
		self[i]:SetAlpha(alpha);
	end
end
