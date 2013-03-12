local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

local ArenaHeader = CreateFrame('Frame', 'ArenaHeader', UIParent)

function UF:Construct_ArenaFrames(frame)	
	frame.Health = self:Construct_HealthBar(frame, true, true, 'RIGHT')
	
	frame.Power = self:Construct_PowerBar(frame, true, true, 'LEFT', false)
	
	frame.Name = self:Construct_NameText(frame)
	
	frame.Buffs = self:Construct_Buffs(frame)
	
	frame.Debuffs = self:Construct_Debuffs(frame)
	
	frame.Castbar = self:Construct_Castbar(frame, 'RIGHT')
	
	frame.Trinket = self:Construct_Trinket(frame)
	frame.PVPSpecIcon = self:Construct_PVPSpecIcon(frame)
	frame.Range = UF:Construct_Range(frame)
	frame:SetAttribute("type2", "focus")

	
	if not frame.PrepFrame then
		frame.prepFrame = CreateFrame('Frame', frame:GetName()..'PrepFrame', UIParent)
		frame.prepFrame:SetFrameStrata('BACKGROUND')
		frame.prepFrame:SetAllPoints(frame)
		frame.prepFrame.Health = CreateFrame('StatusBar', nil, frame.prepFrame)
		frame.prepFrame.Health:Point('BOTTOMLEFT', frame.prepFrame, 'BOTTOMLEFT', E.Border, E.Border)
		frame.prepFrame.Health:Point('TOPRIGHT', frame.prepFrame, 'TOPRIGHT', -(E.Border + E.db.unitframe.units.arena.height), -E.Border)
		frame.prepFrame.Health:CreateBackdrop()
		
		frame.prepFrame.Icon = frame.prepFrame:CreateTexture(nil, 'OVERLAY')
		frame.prepFrame.Icon.bg = CreateFrame('Frame', nil, frame.prepFrame)
		frame.prepFrame.Icon.bg:Point('TOPLEFT', frame.prepFrame.Health.backdrop, 'TOPRIGHT', E.PixelMode and -1 or 1, 0)
		frame.prepFrame.Icon.bg:Point('BOTTOMRIGHT', frame.prepFrame, 'BOTTOMRIGHT', 0, 0)
		frame.prepFrame.Icon.bg:SetTemplate('Default')
		frame.prepFrame.Icon:SetParent(frame.prepFrame.Icon.bg)
		frame.prepFrame.Icon:SetTexCoord(unpack(E.TexCoords))
		frame.prepFrame.Icon:SetInside(frame.prepFrame.Icon.bg)
		UF['statusbars'][frame.prepFrame.Health] = true;
		
		frame.prepFrame.SpecClass = frame.prepFrame.Health:CreateFontString(nil, "OVERLAY")
		frame.prepFrame.SpecClass:SetPoint("CENTER")
		UF:Configure_FontString(frame.prepFrame.SpecClass)
		--frame.prepFrame:Hide()
	end
	
	ArenaHeader:Point('BOTTOMRIGHT', E.UIParent, 'RIGHT', -105, -165) 
	E:CreateMover(ArenaHeader, ArenaHeader:GetName()..'Mover', L['Arena Frames'], nil, nil, nil, 'ALL,ARENA')	
end

function UF:Update_ArenaFrames(frame, db)
	frame.db = db
	local BORDER = E.Border;
	local SPACING = E.Spacing;
	local INDEX = frame.index
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height
	local PVPINFO_WIDTH = db.pvpSpecIcon and UNIT_HEIGHT or 0
	
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width == 'spaced' and USE_POWERBAR
	local USE_INSET_POWERBAR = db.power.width == 'inset' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)
			
	local unit = self.unit
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
	frame:RegisterForClicks(self.db.targetOnMouseDown and 'AnyDown' or 'AnyUp')
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

		--Text
		local x, y = self:GetPositionOffset(db.health.position)
		health.value:ClearAllPoints()
		health.value:Point(db.health.position, health, db.health.position, x + db.health.xOffset, y + db.health.yOffset)
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
		health:Point("TOPRIGHT", frame, "TOPRIGHT", -(PVPINFO_WIDTH + BORDER), -BORDER)
		frame.prepFrame.Health:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -(PVPINFO_WIDTH + BORDER), -BORDER)
		if USE_POWERBAR_OFFSET then			
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
		elseif USE_MINI_POWERBAR then
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
		elseif USE_INSET_POWERBAR then
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER)
		else
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
		end
		
		health.bg:ClearAllPoints()
		health.bg:SetParent(health)
		health.bg:SetAllPoints()
	end
	
	--Name
	UF:UpdateNameSettings(frame)
	
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
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -(BORDER + PVPINFO_WIDTH), BORDER)
			end
		elseif frame:IsElementEnabled('Power') then
			frame:DisableElement('Power')
			power:Hide()
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
		
		buffs:Point(E.InversePoints[db.buffs.anchorPoint], attachTo, db.buffs.anchorPoint, x + db.buffs.xOffset, y + db.buffs.yOffset + (E.PixelMode and (db.buffs.anchorPoint:find('TOP') and -1 or 1) or 0))
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
	
	--Castbar
	do
		local castbar = frame.Castbar
		castbar:Width(db.castbar.width - (E.PixelMode and 2 or (BORDER * 2)))
		castbar:Height(db.castbar.height)
		
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
		
		castbar:ClearAllPoints()
		castbar:Point("TOPLEFT", frame, "BOTTOMLEFT", BORDER, -(BORDER*2+BORDER))
		
		if db.castbar.enable and not frame:IsElementEnabled('Castbar') then
			frame:EnableElement('Castbar')
		elseif not db.castbar.enable and frame:IsElementEnabled('Castbar') then
			frame:DisableElement('Castbar')	
		end			
	end
	
	--Trinket
	do	
		local trinket = frame.Trinket
		trinket.bg:Size(db.pvpTrinket.size)
		trinket.bg:ClearAllPoints()
		if db.pvpTrinket.position == 'RIGHT' then
			trinket.bg:Point('LEFT', frame, 'RIGHT', db.pvpTrinket.xOffset, db.pvpTrinket.yOffset)
		else
			trinket.bg:Point('RIGHT', frame, 'LEFT', db.pvpTrinket.xOffset, db.pvpTrinket.yOffset)
		end
		
		if db.pvpTrinket.enable and not frame:IsElementEnabled('Trinket') then
			frame:EnableElement('Trinket')
		elseif not db.pvpTrinket.enable and frame:IsElementEnabled('Trinket') then
			frame:DisableElement('Trinket')	
		end				
	end
	
	--PVPSpecIcon
	do	
		local specIcon = frame.PVPSpecIcon
		specIcon.bg:Point("TOPRIGHT", frame, "TOPRIGHT")
		if USE_MINI_POWERBAR or USE_POWERBAR_OFFSET or USE_INSET_POWERBAR then
			specIcon.bg:SetPoint("BOTTOMLEFT", frame.Health.backdrop, "BOTTOMRIGHT", E.PixelMode and -1 or SPACING, 0)
		else
			specIcon.bg:SetPoint("BOTTOMLEFT", frame.Power.backdrop, "BOTTOMRIGHT", E.PixelMode and -1 or SPACING, 0)	
		end
		
		if db.pvpSpecIcon and not frame:IsElementEnabled('PVPSpecIcon') then
			frame:EnableElement('PVPSpecIcon')
		elseif not db.pvpSpecIcon and frame:IsElementEnabled('PVPSpecIcon') then
			frame:DisableElement('PVPSpecIcon')	
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
	
	frame:ClearAllPoints()
	if INDEX == 1 then
		if db.growthDirection == 'UP' then
			frame:Point('BOTTOMRIGHT', ArenaHeaderMover, 'BOTTOMRIGHT') --Set to default position
		else
			frame:Point('TOPRIGHT', ArenaHeaderMover, 'TOPRIGHT') --Set to default position
		end
	else
		if db.growthDirection == 'UP' then
			frame:Point('BOTTOMRIGHT', _G['ElvUF_Arena'..INDEX-1], 'TOPRIGHT', 0, 12 + db.castbar.height)
		else
			frame:Point('TOPRIGHT', _G['ElvUF_Arena'..INDEX-1], 'BOTTOMRIGHT', 0, -(12 + db.castbar.height))
		end
	end	

	ArenaHeader:Width(UNIT_WIDTH)
	ArenaHeader:Height(UNIT_HEIGHT + (UNIT_HEIGHT + 12 + db.castbar.height) * 4)
	
	UF:ToggleTransparentStatusBar(UF.db.colors.transparentHealth, frame.Health, frame.Health.bg)
	UF:ToggleTransparentStatusBar(UF.db.colors.transparentPower, frame.Power, frame.Power.bg)		
	
	frame:UpdateAllElements()
end

function UF:UpdatePrep(event)
	if event == "ARENA_OPPONENT_UPDATE" then
		for i=1, 5 do
			local f = _G["ElvUF_PrepArena"..i]
			if f then
				f:Hide()
			end
		end
	else
		local numOpps = GetNumArenaOpponentSpecs()

		if numOpps > 0 then
			for i=1, 5 do
				if not _G["ElvUF_Arena"..i] then return; end
				local s = GetArenaOpponentSpec(i)
				local _, spec, class, texture = nil, "UNKNOWN", "UNKNOWN", [[INTERFACE\ICONS\INV_MISC_QUESTIONMARK]]

				if s and s > 0 then
					_, spec, _, texture, _, _, class = GetSpecializationInfoByID(s)
				end

				if (i <= numOpps) then
					if class and spec then
						local color = RAID_CLASS_COLORS[class]
						_G["ElvUF_Arena"..i].prepFrame.SpecClass:SetText(spec.."  -  "..LOCALIZED_CLASS_NAMES_MALE[class])
						_G["ElvUF_Arena"..i].prepFrame.Health:SetStatusBarColor(color.r, color.g, color.b)
						_G["ElvUF_Arena"..i].prepFrame.Icon:SetTexture(texture)
						_G["ElvUF_Arena"..i].prepFrame:Show()
					end
				else
					_G["ElvUF_Arena"..i].prepFrame:Hide()
				end
			end
		else
			for i=1, 5 do
				if not _G["ElvUF_Arena"..i] then return; end
				_G["ElvUF_Arena"..i].prepFrame:Hide()
			end
		end
	end
end

UF['unitgroupstoload']['arena'] = 5