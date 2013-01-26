local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');
local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

local ceil = math.ceil
local tinsert = table.insert
function UF:Construct_TargetFrame(frame)	
	frame.Health = self:Construct_HealthBar(frame, true, true, 'RIGHT')
	frame.Health.frequentUpdates = true;
	
	frame.Power = self:Construct_PowerBar(frame, true, true, 'LEFT', false)
	frame.Power.frequentUpdates = true;
	
	frame.Name = self:Construct_NameText(frame)
	
	frame.Portrait3D = self:Construct_Portrait(frame, 'model')
	frame.Portrait2D = self:Construct_Portrait(frame, 'texture')
	
	frame.Buffs = self:Construct_Buffs(frame)

	frame.Debuffs = self:Construct_Debuffs(frame)

	frame.Castbar = self:Construct_Castbar(frame, 'RIGHT', L['Target Castbar'])
	frame.Castbar.SafeZone = nil
	frame.Castbar.LatencyTexture:Hide()
	frame.RaidIcon = UF:Construct_RaidIcon(frame)		
	frame.CPoints = self:Construct_Combobar(frame)
	frame.HealPrediction = self:Construct_HealComm(frame)
	frame.DebuffHighlight = self:Construct_DebuffHighlight(frame)
	
	tinsert(frame.__elements, UF.SmartAuraDisplay)
	frame:RegisterEvent('PLAYER_TARGET_CHANGED', UF.SmartAuraDisplay)
	
	frame.AuraBars = self:Construct_AuraBarHeader(frame)
	
	frame:Point('BOTTOMRIGHT', E.UIParent, 'BOTTOM', 413, 68)
	E:CreateMover(frame, frame:GetName()..'Mover', L['Target Frame'], nil, nil, nil, 'ALL,SOLO')
end

function UF:Update_TargetFrame(frame, db)
	frame.db = db

	if frame.Portrait then
		frame.Portrait:Hide()
		frame.Portrait:ClearAllPoints()
		frame.Portrait.backdrop:Hide()
	end
	frame.Portrait = db.portrait.style == '2D' and frame.Portrait2D or frame.Portrait3D	
	
	local BORDER = E.Border;
	local SPACING = E.Spacing;	
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height
	
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)
	
	local USE_COMBOBAR = db.combobar.enable
	local USE_MINI_COMBOBAR = db.combobar.fill == "spaced" and USE_COMBOBAR
	local COMBOBAR_HEIGHT = db.combobar.height
	local COMBOBAR_WIDTH = db.width - (BORDER*2)
	
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_WIDTH = db.portrait.width
	
	local unit = self.unit
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
	_G[frame:GetName()..'Mover']:Size(frame:GetSize())
	
	--Adjust some variables
	do
		if not USE_POWERBAR then
			POWERBAR_HEIGHT = 0
		end	
	
		if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
			PORTRAIT_WIDTH = 0
			if USE_POWERBAR_OFFSET then
				COMBOBAR_WIDTH = COMBOBAR_WIDTH - POWERBAR_OFFSET
			end			
		elseif USE_PORTRAIT then
			COMBOBAR_WIDTH = ceil((UNIT_WIDTH - (BORDER*2)) - PORTRAIT_WIDTH)
			
			if USE_POWERBAR_OFFSET then
				COMBOBAR_WIDTH = COMBOBAR_WIDTH - POWERBAR_OFFSET
			end
		elseif USE_POWERBAR_OFFSET then
			COMBOBAR_WIDTH = COMBOBAR_WIDTH - POWERBAR_OFFSET
		end

		if USE_MINI_COMBOBAR then
			COMBOBAR_WIDTH = COMBOBAR_WIDTH * 4/5
		end	
		
		if USE_MINI_POWERBAR then
			POWERBAR_WIDTH = POWERBAR_WIDTH / 2
		end
	end
	
	--Health
	do
		local health = frame.Health
		health.Smooth = self.db.smoothbars

		--Text
		local x, y = self:GetPositionOffset(db.health.position)
		health.value:ClearAllPoints()
		health.value:Point(db.health.position, health, db.health.position, x, y)
		frame:Tag(health.value, db.health.text_format)
		
		--Colors
		health.colorSmooth = nil
		health.colorHealth = nil
		health.colorClass = nil
		health.colorReaction = nil
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
		
		--Position
		health:ClearAllPoints()
		health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
		
		if USE_POWERBAR_OFFSET then			
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
		elseif USE_MINI_POWERBAR then
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
		else
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
		end

		health.bg:ClearAllPoints()
		if not USE_PORTRAIT_OVERLAY then
			health:Point("TOPRIGHT", -(PORTRAIT_WIDTH+BORDER), -BORDER)
			health.bg:SetParent(health)
			health.bg:SetAllPoints()
		else
			health.bg:Point('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT')
			health.bg:Point('TOPRIGHT', health)		
			health.bg:SetParent(frame.Portrait.overlay)			
		end
	end
	
	--Name
	do
		local name = frame.Name
		if not db.power.hideonnpc then
			local x, y = self:GetPositionOffset(db.name.position)
			name:ClearAllPoints()
			name:Point(db.name.position, frame.Health, db.name.position, x, y)				
		end
		
		frame:Tag(name, db.name.text_format)
	end	
	
	--Power
	do
		local power = frame.Power
		
		if USE_POWERBAR then
			if not frame:IsElementEnabled('Power') then
				frame:EnableElement('Power')
				power:Show()
			end				
			power.Smooth = self.db.smoothbars
			
			--Text
			local x, y = self:GetPositionOffset(db.power.position)
			power.value:ClearAllPoints()
			power.value:Point(db.power.position, frame.Health, db.power.position, x, y)		
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
			else
				power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(E.PixelMode and 0 or (BORDER + SPACING)))
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -(BORDER + PORTRAIT_WIDTH), BORDER)
			end
		elseif frame:IsElementEnabled('Power') then
			frame:DisableElement('Power')
			power:Hide()
		end
	end
	
	--Portrait
	do
		local portrait = frame.Portrait
		
		--Set Points
		if USE_PORTRAIT then
			if not frame:IsElementEnabled('Portrait') then
				frame:EnableElement('Portrait')
			end
			
			portrait:ClearAllPoints()
			
			if USE_PORTRAIT_OVERLAY then
				if db.portrait.style == '3D' then
					portrait:SetFrameLevel(frame.Health:GetFrameLevel() + 1)
				end
				portrait:SetAllPoints(frame.Health)
				portrait:SetAlpha(0.3)
				portrait:Show()		
				portrait.backdrop:Hide()
			else
				portrait:SetAlpha(1)
				portrait:Show()
				portrait.backdrop:Show()
				portrait.backdrop:ClearAllPoints()
				portrait.backdrop:SetPoint("TOPRIGHT", frame, "TOPRIGHT", E.PixelMode and -1 or 0, 0)
					
				if db.portrait.style == '3D' then
					portrait:SetFrameLevel(frame:GetFrameLevel() + 5)
				end		
				
				if USE_MINI_POWERBAR or USE_POWERBAR_OFFSET or not USE_POWERBAR then
					portrait.backdrop:Point("BOTTOMLEFT", frame.Health.backdrop, "BOTTOMRIGHT", E.PixelMode and -1 or SPACING, 0)
				else
					portrait.backdrop:Point("BOTTOMLEFT", frame.Power.backdrop, "BOTTOMRIGHT", E.PixelMode and -1 or SPACING, 0)
				end	
							
				portrait:Point('BOTTOMLEFT', portrait.backdrop, 'BOTTOMLEFT', BORDER, BORDER)		
				portrait:Point('TOPRIGHT', portrait.backdrop, 'TOPRIGHT', -BORDER, -BORDER)				
			end
		else
			if frame:IsElementEnabled('Portrait') then
				frame:DisableElement('Portrait')
				portrait:Hide()
				portrait.backdrop:Hide()
			end		
		end
	end

	--Auras Disable/Enable
	--Only do if both debuffs and buffs aren't being used.
	do
		if db.debuffs.enable or db.buffs.enable then
			if not frame:IsElementEnabled('Aura') then
				frame:EnableElement('Aura')
			end	
		else
			if frame:IsElementEnabled('Aura') then
				frame:DisableElement('Aura')
			end			
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
		
		buffs:Point(E.InversePoints[db.buffs.anchorPoint], attachTo, db.buffs.anchorPoint, x + db.buffs.xOffset, y + db.buffs.yOffset)
		buffs:Height(buffs.size * rows)
		buffs["growth-y"] = db.buffs.anchorPoint:find('TOP') and 'UP' or 'DOWN'
		buffs["growth-x"] = db.buffs.anchorPoint == 'LEFT' and 'LEFT' or  db.buffs.anchorPoint == 'RIGHT' and 'RIGHT' or (db.buffs.anchorPoint:find('LEFT') and 'RIGHT' or 'LEFT')
		buffs.initialAnchor = E.InversePoints[db.buffs.anchorPoint]

		if db.buffs.enable then			
			buffs:Show()
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
		else
			debuffs:Hide()
		end
	end	
	
	do
		local castbar = frame.Castbar
		castbar:Width(db.castbar.width - (E.PixelMode and 2 or (BORDER * 2)))
		castbar:Height(db.castbar.height)
		castbar.Holder:Width(db.castbar.width + (E.PixelMode and 0 or (BORDER * 2)))
		castbar.Holder:Height(db.castbar.height + (E.PixelMode and 2 or (BORDER * 2)))
		castbar.Holder:GetScript('OnSizeChanged')(castbar.Holder)
		
		--Latency
		if db.castbar.latency then
			castbar.SafeZone = castbar.LatencyTexture
			castbar.LatencyTexture:Show()
		else
			castbar.SafeZone = nil
			castbar.LatencyTexture:Hide()
		end
		
		--Icon
		if db.castbar.icon then
			castbar.Icon = castbar.ButtonIcon
			castbar.Icon.bg:Width(db.castbar.height + (E.Border * 2))
			castbar.Icon.bg:Height(db.castbar.height + (E.Border * 2))
			
			castbar:Width(db.castbar.width - castbar.Icon.bg:GetWidth() - (E.PixelMode and 1 or 5))
			castbar.Icon.bg:Show()
		else
			castbar.ButtonIcon.bg:Hide()
			castbar.Icon = nil
		end

		if db.castbar.spark then
			castbar.Spark:Show()
		else
			castbar.Spark:Hide()
		end

		if db.castbar.enable and not frame:IsElementEnabled('Castbar') then
			frame:EnableElement('Castbar')
		elseif not db.castbar.enable and frame:IsElementEnabled('Castbar') then
			frame:DisableElement('Castbar')	
		end			
	end
	
	--Combo Bar
	do
		local CPoints = frame.CPoints
		CPoints:ClearAllPoints()
		if USE_MINI_COMBOBAR then
			CPoints:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
			CPoints:SetFrameStrata("MEDIUM")
		else
			CPoints:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, (E.PixelMode and 0 or (BORDER + SPACING)))
			CPoints:SetFrameStrata("LOW")
		end

		CPoints:Width(COMBOBAR_WIDTH)
		CPoints:Height(COMBOBAR_HEIGHT - (BORDER*2))			
		
		for i = 1, MAX_COMBO_POINTS do
			CPoints[i]:SetHeight(CPoints:GetHeight())
			CPoints[i]:SetWidth(E:Scale(CPoints:GetWidth() - (MAX_COMBO_POINTS - 1)) / MAX_COMBO_POINTS)	
			if USE_MINI_COMBOBAR then
				CPoints[i].backdrop:Show()
			else
				CPoints[i].backdrop:Hide()	
			end
			
			CPoints[i]:ClearAllPoints()
			if i == 1 then
				CPoints[i]:SetPoint("LEFT", CPoints)
			else
				if USE_MINI_COMBOBAR then
					CPoints[i]:Point("LEFT", CPoints[i-1], "RIGHT", SPACING+(BORDER*2)+2, 0)
				else
					CPoints[i]:Point("LEFT", CPoints[i-1], "RIGHT", 1, 0)
				end
			end	
			
			if not USE_MINI_COMBOBAR then
				CPoints[i].backdrop:Hide()
			else
				CPoints[i].backdrop:Show()
			end					
		end
		
		if not USE_MINI_COMBOBAR then
			CPoints.backdrop:Show()
		else
			CPoints.backdrop:Hide()
		end		

		if USE_COMBOBAR and not frame:IsElementEnabled('CPoints') then
			frame:EnableElement('CPoints')
		elseif not USE_COMBOBAR and frame:IsElementEnabled('CPoints') then
			frame:DisableElement('CPoints')	
			CPoints:Hide()
		end				
	end
	
	--Debuff Highlight
	do
		local dbh = frame.DebuffHighlight
		if E.db.unitframe.debuffHighlighting then
			if not frame:IsElementEnabled('DebuffHighlight') then
				frame:EnableElement('DebuffHighlight')
			end
		else
			if frame:IsElementEnabled('DebuffHighlight') then
				frame:DisableElement('DebuffHighlight')
			end		
		end
	end
	
	--OverHealing
	do
		local healPrediction = frame.HealPrediction
		
		if db.healPrediction then
			if not frame:IsElementEnabled('HealPrediction') then
				frame:EnableElement('HealPrediction')
			end

			healPrediction.myBar:ClearAllPoints()
			healPrediction.myBar:Width(db.width - (BORDER*2))
			healPrediction.myBar:SetPoint('BOTTOMLEFT', frame.Health:GetStatusBarTexture(), 'BOTTOMRIGHT')
			healPrediction.myBar:SetPoint('TOPLEFT', frame.Health:GetStatusBarTexture(), 'TOPRIGHT')	

			healPrediction.otherBar:ClearAllPoints()
			healPrediction.otherBar:SetPoint('TOPLEFT', healPrediction.myBar:GetStatusBarTexture(), 'TOPRIGHT')	
			healPrediction.otherBar:SetPoint('BOTTOMLEFT', healPrediction.myBar:GetStatusBarTexture(), 'BOTTOMRIGHT')	
			healPrediction.otherBar:Width(db.width - (BORDER*2))
			
			if not USE_PORTRAIT_OVERLAY then
				healPrediction.myBar:SetParent(frame)
				healPrediction.otherBar:SetParent(frame)
			else	
				healPrediction.myBar:SetParent(frame.Portrait.overlay)		
				healPrediction.otherBar:SetParent(frame.Portrait.overlay)					
			end			
		else
			if frame:IsElementEnabled('HealPrediction') then
				frame:DisableElement('HealPrediction')
			end		
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
	
	--AuraBars
	do
		local auraBars = frame.AuraBars
		
		if db.aurabar.enable then
			if not frame:IsElementEnabled('AuraBars') then
				frame:EnableElement('AuraBars')
			end
			auraBars:Show()
			auraBars.friendlyAuraType = db.aurabar.friendlyAuraType
			auraBars.enemyAuraType = db.aurabar.enemyAuraType
			
			local buffColor = UF.db.colors.auraBarBuff
			local debuffColor = UF.db.colors.auraBarDebuff
			local attachTo = frame
			
			if db.aurabar.attachTo == 'BUFFS' then
				attachTo = frame.Buffs
			elseif db.aurabar.attachTo == 'DEBUFFS' then
				attachTo = frame.Debuffs
			elseif db.aurabar.attachTo == 'PLAYER_AURABARS' and ElvUF_Player then
				attachTo = ElvUF_Player.AuraBars
			end
			
			local anchorPoint, anchorTo = 'BOTTOM', 'TOP'
			if db.aurabar.anchorPoint == 'BELOW' then
				anchorPoint, anchorTo = 'TOP', 'BOTTOM'
			end
			
			local yOffset = 0;
			if E.PixelMode then
				if db.aurabar.anchorPoint == 'BELOW' then
					yOffset = 1;
				else
					yOffset = -1;
				end
			end			
			
			auraBars:ClearAllPoints()
			auraBars:SetPoint(anchorPoint..'LEFT', attachTo, anchorTo..'LEFT', attachTo == frame and -POWERBAR_OFFSET * (anchorTo == 'BOTTOM' and 0 or -1) or 0, db.aurabar.attachTo == 'PLAYER_AURABARS' and 5 or yOffset)
			auraBars:SetPoint(anchorPoint..'RIGHT', attachTo, anchorTo..'RIGHT', (attachTo == frame and anchorTo == 'BOTTOM') and -POWERBAR_OFFSET or 0, db.aurabar.attachTo == 'PLAYER_AURABARS' and 5 or yOffset)			

			auraBars.buffColor = {buffColor.r, buffColor.g, buffColor.b}
			if UF.db.colors.auraBarByType then
				auraBars.debuffColor = nil;
				auraBars.defaultDebuffColor = {debuffColor.r, debuffColor.g, debuffColor.b}
			else
				auraBars.debuffColor = {debuffColor.r, debuffColor.g, debuffColor.b}
				auraBars.defaultDebuffColor = nil;
			end
			auraBars.down = db.aurabar.anchorPoint == 'BELOW'
			auraBars:SetAnchors()
		else
			if frame:IsElementEnabled('AuraBars') then
				frame:DisableElement('AuraBars')
				auraBars:Hide()
			end		
		end
	end

	
	if db.customTexts then
		local customFont = UF.LSM:Fetch("font", UF.db.font)
		for objectName, _ in pairs(db.customTexts) do
			if not frame[objectName] then
				frame[objectName] = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')
			end
			
			local objectDB = db.customTexts[objectName]
			UF:CreateCustomTextGroup('target', objectName)
			
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
	
	E:SetMoverSnapOffset(frame:GetName()..'Mover', -(12 + db.castbar.height))
	frame:UpdateAllElements()
end

tinsert(UF['unitstoload'], 'target')