local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")
local tinsert = table.insert
for i=10, 40, 15 do
	UF['Construct_Raid'..i..'Frames'] = function (self, unitGroup)
		self:SetScript('OnEnter', UnitFrame_OnEnter)
		self:SetScript('OnLeave', UnitFrame_OnLeave)	


		self.RaisedElementParent = CreateFrame('Frame', nil, self)
		self.RaisedElementParent:SetFrameStrata("MEDIUM")
		self.RaisedElementParent:SetFrameLevel(self:GetFrameLevel() + 10)		
		
		self.Health = UF:Construct_HealthBar(self, true, true, 'RIGHT')
		
		self.Power = UF:Construct_PowerBar(self, true, true, 'LEFT', false)
		self.Power.frequentUpdates = false;
			
		self.Name = UF:Construct_NameText(self)
		self.Buffs = UF:Construct_Buffs(self)
		self.Debuffs = UF:Construct_Debuffs(self)
		self.AuraWatch = UF:Construct_AuraWatch(self)
		self.RaidDebuffs = UF:Construct_RaidDebuffs(self)
		self.DebuffHighlight = UF:Construct_DebuffHighlight(self)
		self.ResurrectIcon = UF:Construct_ResurectionIcon(self)
		self.LFDRole = UF:Construct_RoleIcon(self)
		self.RaidRoleFramesAnchor = UF:Construct_RaidRoleFrames(self)
		self.TargetGlow = UF:Construct_TargetGlow(self)
		tinsert(self.__elements, UF.UpdateTargetGlow)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', UF.UpdateTargetGlow)
		self:RegisterEvent('PLAYER_ENTERING_WORLD', UF.UpdateTargetGlow)		
		
		self.Threat = UF:Construct_Threat(self)
		self.RaidIcon = UF:Construct_RaidIcon(self)
		self.ReadyCheck = UF:Construct_ReadyCheckIcon(self)	
		self.HealPrediction = UF:Construct_HealComm(self)
		self.GPS = UF:Construct_GPS(self)
		self.Range = UF:Construct_Range(self)

		UF:Update_StatusBars()
		UF:Update_FontStrings()	
		
		return self
	end

	UF['Raid'..i..'SmartVisibility'] = function (self, event)	
		if not self.db or (self.db and not self.db.enable) or (UF.db and not UF.db.smartRaidFilter) or self.isForced then return; end
		local inInstance, instanceType = IsInInstance()
		local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()
		if event == "PLAYER_REGEN_ENABLED" then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end

		if not InCombatLockdown() then		
			if inInstance and instanceType == "raid" and maxPlayers == i then
				UnregisterStateDriver(self, "visibility")
				self:Show()
			elseif inInstance and instanceType == "raid" then
				UnregisterStateDriver(self, "visibility")
				self:Hide()
			elseif self.db.visibility then
				RegisterStateDriver(self, "visibility", self.db.visibility)
			end
		else
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
			return
		end
	end

	UF['Update_Raid'..i..'Header'] = function (self, header, db)
		header:GetParent().db = db

		local headerHolder = header:GetParent()
		headerHolder.db = db

		if not headerHolder.positioned then
			headerHolder:ClearAllPoints()
			headerHolder:Point("BOTTOMLEFT", E.UIParent, "BOTTOMLEFT", 4, 195)	

			E:CreateMover(headerHolder, headerHolder:GetName()..'Mover', L['Raid 1-']..i..L[' Frames'], nil, nil, nil, 'ALL,RAID'..i)

			headerHolder:RegisterEvent("PLAYER_ENTERING_WORLD")
			headerHolder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
			headerHolder:SetScript("OnEvent", UF['Raid'..i..'SmartVisibility'])
			headerHolder.positioned = true;
		end
				
		UF['Raid'..i..'SmartVisibility'](headerHolder)
	end

	UF['Update_Raid'..i..'Frames'] = function (self, frame, db)
		frame.db = db
		local BORDER = E.Border;
		local SPACING = E.Spacing;
		local SHADOW_SPACING = E.PixelMode and 3 or 4
		local UNIT_WIDTH = db.width
		local UNIT_HEIGHT = db.height
		
		local USE_POWERBAR = db.power.enable
		local USE_MINI_POWERBAR = db.power.width == 'spaced' and USE_POWERBAR
		local USE_INSET_POWERBAR = db.power.width == 'inset' and USE_POWERBAR
		local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
		local POWERBAR_OFFSET = db.power.offset
		local POWERBAR_HEIGHT = db.power.height
		local POWERBAR_WIDTH = db.width - (BORDER*2)
		
		frame.db = db
		frame.colors = ElvUF.colors
		frame:RegisterForClicks(self.db.targetOnMouseDown and 'AnyDown' or 'AnyUp')
		
		if not InCombatLockdown() then
			frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
		end
		frame.Range = {insideAlpha = 1, outsideAlpha = E.db.unitframe.OORAlpha}
		if not frame:IsElementEnabled('Range') then
			frame:EnableElement('Range')
		end		
		
		
		--Adjust some variables
		do
			if not USE_POWERBAR then
				POWERBAR_HEIGHT = 0
			end	
		
			if USE_MINI_POWERBAR then
				POWERBAR_WIDTH = POWERBAR_WIDTH / 2
			end
		end
		
		--Health
		do
			local health = frame.Health
			health.Smooth = self.db.smoothbars
			health.frequentUpdates = db.health.frequentUpdates

			--Position this even if disabled because resurrection icon depends on the position
			local x, y = self:GetPositionOffset(db.health.position)
			health.value:ClearAllPoints()
			health.value:Point(db.health.position, health, db.health.position, x + db.health.xOffset, y + db.health.yOffset)
			frame:Tag(health.value, db.health.text_format)
			
			--Colors
			health.colorSmooth = nil
			health.colorHealth = nil
			health.colorClass = nil
			health.colorReaction = nil
			
			if db.colorOverride == "FORCE_ON" then
				health.colorClass = true
				health.colorReaction = true
			elseif db.colorOverride == "FORCE_OFF" then
				if self.db['colors'].colorhealthbyvalue == true then
					health.colorSmooth = true
				else
					health.colorHealth = true
				end		
			else
				if self.db['colors'].healthclass ~= true then
					if self.db['colors'].colorhealthbyvalue == true then
						health.colorSmooth = true
					else
						health.colorHealth = true
					end		
				else
					health.colorClass = true
					health.colorReaction = true
				end				
			end
			
			--Position
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
			if USE_POWERBAR_OFFSET then			
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			elseif USE_INSET_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER)				
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
			
			health:SetOrientation(db.health.orientation)
		end
		
		--Name
		UF:UpdateNameSettings(frame)
		
		--Power
		do
			local power = frame.Power
			if USE_POWERBAR then
				frame:EnableElement('Power')
				power.Smooth = self.db.smoothbars
				power:Show()	
				--Text
				local x, y = self:GetPositionOffset(db.power.position)
				power.value:ClearAllPoints()
				power.value:Point(db.power.position, frame.Health, db.power.position, x + db.power.xOffset, y + db.power.yOffset)		
				frame:Tag(power.value, db.power.text_format)
				
				--Colors
				power.colorClass = nil
				power.colorReaction = nil	
				power.colorPower = nil
				if self.db['colors'].powerclass then
					power.colorClass = true
					power.colorReaction = true
				else
					power.colorPower = true
				end		
				
				--Position
				power:ClearAllPoints()
				if USE_POWERBAR_OFFSET then
					power:Point("TOPLEFT", frame.Health, "TOPLEFT", -POWERBAR_OFFSET, -POWERBAR_OFFSET)
					power:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", -POWERBAR_OFFSET, -POWERBAR_OFFSET)
					power:SetFrameStrata("LOW")
					power:SetFrameLevel(2)
				elseif USE_MINI_POWERBAR then
					power:Width(POWERBAR_WIDTH - BORDER*2)
					power:Height(POWERBAR_HEIGHT - BORDER*2)
					power:Point("LEFT", frame, "BOTTOMLEFT", (BORDER*2 + 4), BORDER + (POWERBAR_HEIGHT/2))
					power:SetFrameStrata("MEDIUM")
					power:SetFrameLevel(frame:GetFrameLevel() + 3)
				elseif USE_INSET_POWERBAR then
					power:Height(POWERBAR_HEIGHT - BORDER*2)
					power:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", BORDER + (BORDER*2), BORDER + (BORDER*2))
					power:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", -(BORDER + (BORDER*2)), BORDER + (BORDER*2))
					power:SetFrameStrata("MEDIUM")
					power:SetFrameLevel(frame:GetFrameLevel() + 3)							
				else
					power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(E.PixelMode and 0 or (BORDER + SPACING)))
					power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -(BORDER), BORDER)
				end
			else
				frame:DisableElement('Power')
				power:Hide()
			end
		end
		
		--Threat
		do
			local threat = frame.Threat

			if db.threatStyle ~= 'NONE' and db.threatStyle ~= nil then
				if not frame:IsElementEnabled('Threat') then
					frame:EnableElement('Threat')
				end

				if db.threatStyle == "GLOW" then
					threat:SetFrameStrata('BACKGROUND')
					threat.glow:ClearAllPoints()
					threat.glow:SetBackdropBorderColor(0, 0, 0, 0)
					threat.glow:Point("TOPLEFT", frame.Health.backdrop, "TOPLEFT", -SHADOW_SPACING, SHADOW_SPACING)
					threat.glow:Point("TOPRIGHT", frame.Health.backdrop, "TOPRIGHT", SHADOW_SPACING, SHADOW_SPACING)
					threat.glow:Point("BOTTOMLEFT", frame.Power.backdrop, "BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING)
					threat.glow:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)	
					
					if USE_MINI_POWERBAR or USE_POWERBAR_OFFSET or USE_INSET_POWERBAR then
						threat.glow:Point("BOTTOMLEFT", frame.Health.backdrop, "BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING)
						threat.glow:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)	
					end
					
					if USE_PORTRAIT and not USE_PORTRAIT_OVERLAY then
						threat.glow:Point("TOPRIGHT", frame.Portrait.backdrop, "TOPRIGHT", SHADOW_SPACING, -SHADOW_SPACING)
						threat.glow:Point("BOTTOMRIGHT", frame.Portrait.backdrop, "BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)
					end
				elseif db.threatStyle == "ICONTOPLEFT" or db.threatStyle == "ICONTOPRIGHT" or db.threatStyle == "ICONBOTTOMLEFT" or db.threatStyle == "ICONBOTTOMRIGHT" or db.threatStyle == "ICONTOP" or db.threatStyle == "ICONBOTTOM" or db.threatStyle == "ICONLEFT" or db.threatStyle == "ICONRIGHT" then
					threat:SetFrameStrata('HIGH')
					local point = db.threatStyle
					point = point:gsub("ICON", "")
					
					threat.texIcon:ClearAllPoints()
					threat.texIcon:SetPoint(point, frame.Health, point)
				end
			elseif frame:IsElementEnabled('Threat') then
				frame:DisableElement('Threat')
			end
		end		
		
		--Target Glow
		do
			local tGlow = frame.TargetGlow
			tGlow:ClearAllPoints()
			tGlow:Point("TOPLEFT", -SHADOW_SPACING, SHADOW_SPACING)
			tGlow:Point("TOPRIGHT", SHADOW_SPACING, SHADOW_SPACING)
			
			if USE_MINI_POWERBAR then
				tGlow:Point("BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING + (POWERBAR_HEIGHT/2))
				tGlow:Point("BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING + (POWERBAR_HEIGHT/2))		
			else
				tGlow:Point("BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING)
				tGlow:Point("BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)
			end
			
			if USE_POWERBAR_OFFSET then
				tGlow:Point("TOPLEFT", -SHADOW_SPACING+POWERBAR_OFFSET, SHADOW_SPACING)
				tGlow:Point("TOPRIGHT", SHADOW_SPACING, SHADOW_SPACING)
				tGlow:Point("BOTTOMLEFT", -SHADOW_SPACING+POWERBAR_OFFSET, -SHADOW_SPACING+POWERBAR_OFFSET)
				tGlow:Point("BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING+POWERBAR_OFFSET)				
			end				
		end			

		--Auras Disable/Enable
		--Only do if both debuffs and buffs aren't being used.
		do
			if db.debuffs.enable or db.buffs.enable then
				frame:EnableElement('Aura')
			else
				frame:DisableElement('Aura')		
			end
			
			frame.Buffs:ClearAllPoints()
			frame.Debuffs:ClearAllPoints()
		end
		
		--Buffs
		do
			local buffs = frame.Buffs
			local rows = db.buffs.numrows
			
			if USE_POWERBAR_OFFSET then
				buffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
			else
				buffs:SetWidth(UNIT_WIDTH)
			end
			
			buffs.forceShow = frame.forceShowAuras
			buffs.num = db.buffs.perrow * rows
			buffs.size = db.buffs.sizeOverride ~= 0 and db.buffs.sizeOverride or ((((buffs:GetWidth() - (buffs.spacing*(buffs.num/rows - 1))) / buffs.num)) * rows)
			
			if db.buffs.sizeOverride and db.buffs.sizeOverride > 0 then
				buffs:SetWidth(db.buffs.perrow * db.buffs.sizeOverride)
			end
			
			local x, y = E:GetXYOffset(db.buffs.anchorPoint)
			local attachTo = self:GetAuraAnchorFrame(frame, db.buffs.attachTo)
			
			buffs:Point(E.InversePoints[db.buffs.anchorPoint], attachTo, db.buffs.anchorPoint, x + db.buffs.xOffset, y + db.buffs.yOffset + (E.PixelMode and (db.buffs.anchorPoint:find('TOP') and -1 or 1) or 0))
			buffs:Height(buffs.size * rows)
			buffs["growth-y"] = db.buffs.anchorPoint:find('TOP') and 'UP' or 'DOWN'
			buffs["growth-x"] = db.buffs.anchorPoint == 'LEFT' and 'LEFT' or  db.buffs.anchorPoint == 'RIGHT' and 'RIGHT' or (db.buffs.anchorPoint:find('LEFT') and 'RIGHT' or 'LEFT')
			buffs.initialAnchor = E.InversePoints[db.buffs.anchorPoint]

			if db.buffs.enable then			
				buffs:Show()
				UF:UpdateAuraIconSettings(buffs)
			else
				buffs:Hide()
			end
		end
		
		--Debuffs
		do
			local debuffs = frame.Debuffs
			local rows = db.debuffs.numrows
			
			if USE_POWERBAR_OFFSET then
				debuffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
			else
				debuffs:SetWidth(UNIT_WIDTH)
			end
			
			debuffs.forceShow = frame.forceShowAuras
			debuffs.num = db.debuffs.perrow * rows
			debuffs.size = db.debuffs.sizeOverride ~= 0 and db.debuffs.sizeOverride or ((((debuffs:GetWidth() - (debuffs.spacing*(debuffs.num/rows - 1))) / debuffs.num)) * rows)
			
			if db.debuffs.sizeOverride and db.debuffs.sizeOverride > 0 then
				debuffs:SetWidth(db.debuffs.perrow * db.debuffs.sizeOverride)
			end
			
			local x, y = E:GetXYOffset(db.debuffs.anchorPoint)
			local attachTo = self:GetAuraAnchorFrame(frame, db.debuffs.attachTo, db.debuffs.attachTo == 'BUFFS' and db.buffs.attachTo == 'DEBUFFS')
			
			debuffs:Point(E.InversePoints[db.debuffs.anchorPoint], attachTo, db.debuffs.anchorPoint, x + db.debuffs.xOffset, y + db.debuffs.yOffset)
			debuffs:Height(debuffs.size * rows)
			debuffs["growth-y"] = db.debuffs.anchorPoint:find('TOP') and 'UP' or 'DOWN'
			debuffs["growth-x"] = db.debuffs.anchorPoint == 'LEFT' and 'LEFT' or  db.debuffs.anchorPoint == 'RIGHT' and 'RIGHT' or (db.debuffs.anchorPoint:find('LEFT') and 'RIGHT' or 'LEFT')
			debuffs.initialAnchor = E.InversePoints[db.debuffs.anchorPoint]

			if db.debuffs.enable then			
				debuffs:Show()
				UF:UpdateAuraIconSettings(debuffs)
			else
				debuffs:Hide()
			end
		end	
		
		--RaidDebuffs
		do
			local rdebuffs = frame.RaidDebuffs
			if db.rdebuffs.enable then
				frame:EnableElement('RaidDebuffs')				

				rdebuffs:Size(db.rdebuffs.size)
				rdebuffs:Point('BOTTOM', frame, 'BOTTOM', db.rdebuffs.xOffset, db.rdebuffs.yOffset)
				rdebuffs.count:FontTemplate(nil, db.rdebuffs.fontSize, 'OUTLINE')
				rdebuffs.time:FontTemplate(nil, db.rdebuffs.fontSize, 'OUTLINE')
			else
				frame:DisableElement('RaidDebuffs')
				rdebuffs:Hide()				
			end
		end

		--Raid Icon
		do
			local RI = frame.RaidIcon
			if db.raidicon.enable then
				frame:EnableElement('RaidIcon')
				RI:Show()
				RI:Size(db.raidicon.size)
				
				local x, y = self:GetPositionOffset(db.raidicon.attachTo)
				RI:ClearAllPoints()
				RI:Point(db.raidicon.attachTo, frame, db.raidicon.attachTo, x + db.raidicon.xOffset, y + db.raidicon.yOffset)	
			else
				frame:DisableElement('RaidIcon')	
				RI:Hide()
			end
		end			
		
		--Debuff Highlight
		do
			local dbh = frame.DebuffHighlight
			if E.db.unitframe.debuffHighlighting then
				frame:EnableElement('DebuffHighlight')
			else
				frame:DisableElement('DebuffHighlight')
			end
		end

		--Role Icon
		do
			local role = frame.LFDRole
			if db.roleIcon.enable then
				frame:EnableElement('LFDRole')				
				
				local x, y = self:GetPositionOffset(db.roleIcon.position, 1)
				role:ClearAllPoints()
				role:Point(db.roleIcon.position, frame.Health, db.roleIcon.position, x, y)
			else
				frame:DisableElement('LFDRole')	
				role:Hide()
			end
		end
		
		--OverHealing
		do
			local healPrediction = frame.HealPrediction
			local c = UF.db.colors.healPrediction
			if db.healPrediction then
				if not frame:IsElementEnabled('HealPrediction') then
					frame:EnableElement('HealPrediction')
				end

				healPrediction.myBar:SetOrientation(db.health.orientation)
				healPrediction.otherBar:SetOrientation(db.health.orientation)
				healPrediction.absorbBar:SetOrientation(db.health.orientation)

				healPrediction.myBar:SetStatusBarColor(c.personal.r, c.personal.g, c.personal.b, c.personal.a)
				healPrediction.otherBar:SetStatusBarColor(c.others.r, c.others.g, c.others.b, c.others.a)
				healPrediction.absorbBar:SetStatusBarColor(c.absorbs.r, c.absorbs.g, c.absorbs.b, c.absorbs.a)				
			else
				if frame:IsElementEnabled('HealPrediction') then
					frame:DisableElement('HealPrediction')
				end		
			end
		end
		
		--GPSArrow
		do
			local GPS = frame.GPS
			if db.GPSArrow.enable then
				if not frame:IsElementEnabled('GPS') then
					frame:EnableElement('GPS')
				end

				GPS:Size(db.GPSArrow.size)
				GPS.onMouseOver = db.GPSArrow.onMouseOver
				GPS.outOfRange = db.GPSArrow.outOfRange
				
				GPS:SetPoint("CENTER", frame, "CENTER", db.GPSArrow.xOffset, db.GPSArrow.yOffset)
			else
				if frame:IsElementEnabled('GPS') then
					frame:DisableElement('GPS')
				end				
			end
		end	
		
		--Raid Roles
		do
			local raidRoleFrameAnchor = frame.RaidRoleFramesAnchor
			
			if db.raidRoleIcons.enable then
				raidRoleFrameAnchor:Show()
				frame:EnableElement('Leader')
				frame:EnableElement('MasterLooter')
				
				raidRoleFrameAnchor:ClearAllPoints()
				if db.raidRoleIcons.position == 'TOPLEFT' then
					raidRoleFrameAnchor:Point('LEFT', frame, 'TOPLEFT', 2, 0)
				else
					raidRoleFrameAnchor:Point('RIGHT', frame, 'TOPRIGHT', -2, 0)
				end
			else
				raidRoleFrameAnchor:Hide()
				frame:DisableElement('Leader')
				frame:DisableElement('MasterLooter')
			end
		end		
		
		--Range
		do
			local range = frame.Range
			if db.rangeCheck then
				if not frame:IsElementEnabled('Range') then
					frame:EnableElement('Range')
				end

				range.outsideAlpha = E.db.unitframe.OORAlpha
			else
				if frame:IsElementEnabled('Range') then
					frame:DisableElement('Range')
				end				
			end
		end		
		
		UF:UpdateAuraWatch(frame)
		
		frame:EnableElement('ReadyCheck')		

		if db.customTexts then
			local customFont = UF.LSM:Fetch("font", UF.db.font)
			for objectName, _ in pairs(db.customTexts) do
				if not frame[objectName] then
					frame[objectName] = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')
				end
				
				local objectDB = db.customTexts[objectName]

				if objectDB.font then
					customFont = UF.LSM:Fetch("font", objectDB.font)
				end
							
				frame[objectName]:FontTemplate(customFont, objectDB.size or UF.db.fontSize, objectDB.fontOutline or UF.db.fontOutline)
				frame:Tag(frame[objectName], objectDB.text_format or '')
				frame[objectName]:SetJustifyH(objectDB.justifyH or 'CENTER')
				frame[objectName]:ClearAllPoints()
				frame[objectName]:SetPoint(objectDB.justifyH or 'CENTER', frame, 'CENTER', objectDB.xOffset, objectDB.yOffset)
			end
		end		

		UF:ToggleTransparentStatusBar(UF.db.colors.transparentHealth, frame.Health, frame.Health.bg)
		UF:ToggleTransparentStatusBar(UF.db.colors.transparentPower, frame.Power, frame.Power.bg)	
		
		frame:UpdateAllElements()
	end

	UF['headerstoload']['raid'..i] = true
end