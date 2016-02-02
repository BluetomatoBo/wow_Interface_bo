local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');

--Cache global variables
--Lua functions
local _G = _G
local unpack, pairs = unpack, pairs
local format = format
--WoW API / Variables
local C_TimerAfter = C_Timer.After
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

local CAN_HAVE_CLASSBAR = (E.myclass == "PALADIN" or E.myclass == "DRUID" or E.myclass == "DEATHKNIGHT" or E.myclass == "WARLOCK" or E.myclass == "PRIEST" or E.myclass == "MONK" or E.myclass == 'MAGE' or E.myclass == 'ROGUE')

function UF:Construct_PlayerFrame(frame)
	frame.Threat = self:Construct_Threat(frame, true)

	frame.Health = self:Construct_HealthBar(frame, true, true, 'RIGHT')
	frame.Health.frequentUpdates = true;

	frame.Power = self:Construct_PowerBar(frame, true, true, 'LEFT')
	frame.Power.frequentUpdates = true;

	frame.Name = self:Construct_NameText(frame)

	frame.Portrait3D = self:Construct_Portrait(frame, 'model')
	frame.Portrait2D = self:Construct_Portrait(frame, 'texture')

	frame.Buffs = self:Construct_Buffs(frame)

	frame.Debuffs = self:Construct_Debuffs(frame)

	frame.Castbar = self:Construct_Castbar(frame, 'LEFT', L["Player Castbar"])

	if E.myclass == "PALADIN" then
		frame.HolyPower = self:Construct_ResourceBar(frame)
		frame.ClassBar = 'HolyPower'
	elseif E.myclass == "WARLOCK" then
		frame.ShardBar = self:Construct_WarlockResourceBar(frame)
		frame.ClassBar = 'ShardBar'
	elseif E.myclass == "DEATHKNIGHT" then
		frame.Runes = self:Construct_DeathKnightResourceBar(frame)
		frame.ClassBar = 'Runes'
	elseif E.myclass == "DRUID" then
		frame.EclipseBar = self:Construct_DruidResourceBar(frame)
		frame.DruidAltMana = self:Construct_DruidAltManaBar(frame)
		frame.ClassBar = 'EclipseBar'
	elseif E.myclass == "MONK" then
		frame.Harmony = self:Construct_MonkResourceBar(frame)
		frame.Stagger = self:Construct_Stagger(frame)
		frame.ClassBar = 'Harmony'
	elseif E.myclass == "PRIEST" then
		frame.ShadowOrbs = self:Construct_PriestResourceBar(frame)
		frame.ClassBar = 'ShadowOrbs'
	elseif E.myclass == 'MAGE' then
		frame.ArcaneChargeBar = self:Construct_MageResourceBar(frame)
		frame.ClassBar = 'ArcaneChargeBar'
	elseif E.myclass == 'ROGUE' then
		frame.Anticipation = self:Construct_RogueResourceBar(frame)
		frame.ClassBar = 'Anticipation'
	end

	frame.RaidIcon = UF:Construct_RaidIcon(frame)
	frame.Resting = self:Construct_RestingIndicator(frame)
	frame.Combat = self:Construct_CombatIndicator(frame)
	frame.PvPText = self:Construct_PvPIndicator(frame)
	frame.DebuffHighlight = self:Construct_DebuffHighlight(frame)
	frame.HealPrediction = self:Construct_HealComm(frame)

	frame.AuraBars = self:Construct_AuraBarHeader(frame)

	frame.CombatFade = true

	frame.customTexts = {}

	frame:Point('BOTTOMLEFT', E.UIParent, 'BOTTOM', -413, 68) --Set to default position
	E:CreateMover(frame, frame:GetName()..'Mover', L["Player Frame"], nil, nil, nil, 'ALL,SOLO')
end


function UF:UpdatePlayerFrameAnchors(frame, isShown)

	
	
	--Everything below here is going away
	local db = E.db['unitframe']['units'].player
	local health = frame.Health
	local threat = frame.Threat
	local power = frame.Power
	local stagger = frame.Stagger
	local USE_PORTRAIT = db.portrait.enable
	local PORTRAIT_POSITION = db.portrait.position
	local USE_PORTRAIT_OVERLAY = USE_PORTRAIT and PORTRAIT_POSITION == "OVERLAY"
	local PORTRAIT_WIDTH = (USE_PORTRAIT_OVERLAY or not USE_PORTRAIT) and 0 or db.portrait.width
	local CLASSBAR_HEIGHT = db.classbar.height
	local CLASSBAR_HEIGHT_SPACING
	local CLASSBAR_DETACHED = db.classbar.detachFromFrame
	local USE_CLASSBAR = db.classbar.enable
	local USE_MINI_CLASSBAR = db.classbar.fill == "spaced" and USE_CLASSBAR
	local USE_POWERBAR = db.power.enable
	local USE_INSET_POWERBAR = db.power.width == 'inset' and USE_POWERBAR
	local USE_MINI_POWERBAR = db.power.width == 'spaced' and USE_POWERBAR
	local POWERBAR_DETACHED = db.power.detachFromFrame
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR and not POWERBAR_DETACHED
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local SPACING = E.Spacing;
	local BORDER = E.Border;
	local SHADOW_SPACING = (BORDER*3 - SPACING*2)
	local USE_STAGGER = stagger and stagger:IsShown();
	local STAGGER_WIDTH = USE_STAGGER and (db.stagger.width + (BORDER*2)) or 0;

	if not USE_POWERBAR then
		POWERBAR_HEIGHT = 0
	end

	if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
		PORTRAIT_WIDTH = 0
	end

	if USE_MINI_CLASSBAR then
		CLASSBAR_HEIGHT = CLASSBAR_HEIGHT / 2
	end

	CLASSBAR_HEIGHT_SPACING = CLASSBAR_HEIGHT + SPACING

	if CLASSBAR_DETACHED then
		CLASSBAR_HEIGHT_SPACING = 0
	end

	if USE_STAGGER then
		if not USE_MINI_POWERBAR and not USE_INSET_POWERBAR and not POWERBAR_DETACHED then
			stagger:Point('BOTTOMLEFT', power, 'BOTTOMRIGHT', BORDER*2 + (-BORDER + SPACING*3), 0)
		else
			stagger:Point('BOTTOMLEFT', health, 'BOTTOMRIGHT', BORDER*2 + (-BORDER + SPACING*3), 0)
		end
		stagger:Point('TOPRIGHT', health, 'TOPRIGHT', STAGGER_WIDTH, 0)


		if not USE_POWERBAR_OFFSET and not USE_MINI_POWERBAR and not USE_INSET_POWERBAR and not POWERBAR_DETACHED then
			power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BORDER - STAGGER_WIDTH, BORDER)
		end
	elseif not USE_POWERBAR_OFFSET and not USE_MINI_POWERBAR and not USE_INSET_POWERBAR and not POWERBAR_DETACHED then
	
	end
end

function UF:Update_PlayerFrame(frame, db)
	frame.db = db
	frame.Portrait = db.portrait.style == '2D' and frame.Portrait2D or frame.Portrait3D
	
	frame:RegisterForClicks(self.db.targetOnMouseDown and 'AnyDown' or 'AnyUp')
	local BORDER = E.Border
	local SPACING = E.Spacing
	local SHADOW_SPACING = (BORDER*3 - SPACING*2)
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height

	local USE_POWERBAR = db.power.enable
	local POWERBAR_DETACHED = db.power.detachFromFrame
	local USE_INSET_POWERBAR = not POWERBAR_DETACHED and db.power.width == 'inset' and USE_POWERBAR
	local USE_MINI_POWERBAR = not POWERBAR_DETACHED and db.power.width == 'spaced' and USE_POWERBAR
	
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR and not POWERBAR_DETACHED
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = not USE_POWERBAR and 0 or db.power.height
	local POWERBAR_WIDTH = USE_MINI_POWERBAR and (db.width - (BORDER*2))/2 or (POWERBAR_DETACHED and db.power.detachedWidth or (db.width - (BORDER*2)))

	local USE_PORTRAIT = db.portrait.enable
	local PORTRAIT_POSITION = db.portrait.position
	local USE_PORTRAIT_OVERLAY = USE_PORTRAIT and PORTRAIT_POSITION == "OVERLAY"
	local PORTRAIT_WIDTH = (USE_PORTRAIT_OVERLAY or not USE_PORTRAIT) and 0 or db.portrait.width
	
	local USE_CLASSBAR = db.classbar.enable and CAN_HAVE_CLASSBAR
	local CLASSBAR_DETACHED = db.classbar.detachFromFrame
	local USE_MINI_CLASSBAR = db.classbar.fill == "spaced" and USE_CLASSBAR and CLASSBAR_DETACHED ~= true
	local CLASSBAR_HEIGHT = db.classbar.height
	local CLASSBAR_WIDTH = UNIT_WIDTH - (BORDER*2) - PORTRAIT_WIDTH - POWERBAR_OFFSET

	local unit = self.unit
	
	--new method for storing frame variables, will remove other variables when done
	do
		frame.ORIENTATION = db.orientation --allow this value to change when unitframes position changes on screen?
		frame.BORDER = E.Border
		frame.SPACING = E.Spacing
		frame.SHADOW_SPACING = (frame.BORDER*7 - frame.SPACING*6)
		frame.UNIT_WIDTH = db.width
		frame.UNIT_HEIGHT = db.height

		frame.USE_POWERBAR = db.power.enable
		frame.POWERBAR_DETACHED = db.power.detachFromFrame
		frame.USE_INSET_POWERBAR = not frame.POWERBAR_DETACHED and db.power.width == 'inset' and frame.USE_POWERBAR
		frame.USE_MINI_POWERBAR = (not frame.POWERBAR_DETACHED and db.power.width == 'spaced' and frame.USE_POWERBAR)
		frame.USE_POWERBAR_OFFSET = db.power.offset ~= 0 and frame.USE_POWERBAR and not frame.POWERBAR_DETACHED
		frame.POWERBAR_OFFSET_DIRECTION = db.power.offsetDirection
		frame.POWERBAR_OFFSET = frame.USE_POWERBAR_OFFSET and db.power.offset or 0

		frame.POWERBAR_HEIGHT = not frame.USE_POWERBAR and 0 or db.power.height
		frame.POWERBAR_WIDTH = frame.USE_MINI_POWERBAR and (frame.UNIT_WIDTH - (BORDER*2))/2 or (frame.POWERBAR_DETACHED and db.power.detachedWidth or (frame.UNIT_WIDTH - (frame.BORDER*2)))

		frame.USE_PORTRAIT = db.portrait and db.portrait.enable
		frame.PORTRAIT_POSITION = db.portrait.position
		frame.USE_PORTRAIT_OVERLAY = frame.USE_PORTRAIT and (db.portrait.overlay or frame.ORIENTATION == "MIDDLE")
		frame.PORTRAIT_WIDTH = (frame.USE_PORTRAIT_OVERLAY or not frame.USE_PORTRAIT) and 0 or db.portrait.width
		
		frame.USE_CLASSBAR = db.classbar.enable and CAN_HAVE_CLASSBAR
		frame.CLASSBAR_DETACHED = db.classbar.detachFromFrame
		frame.USE_MINI_CLASSBAR = db.classbar.fill == "spaced" and frame.USE_CLASSBAR and frame.CLASSBAR_DETACHED ~= true
		frame.CLASSBAR_HEIGHT = self.USE_CLASSBAR and db.classbar.height or 0
		frame.CLASSBAR_WIDTH = frame.UNIT_WIDTH - (frame.BORDER*2) - frame.PORTRAIT_WIDTH  - frame.POWERBAR_OFFSET	
		frame.CLASSBAR_YOFFSET = (not frame.USE_CLASSBAR) and 0 or (frame.USE_MINI_CLASSBAR and ((frame.SPACING+(frame.CLASSBAR_HEIGHT/2))) or frame.CLASSBAR_HEIGHT)

		frame.STAGGER_WIDTH = frame.Stagger and frame.Stagger:IsShown() and (db.stagger.width + (frame.BORDER*2)) or 0;
	end
	
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
	_G[frame:GetName()..'Mover']:Size(frame:GetSize())

	--Adjust some variables
	do
		if not USE_POWERBAR_OFFSET then
			POWERBAR_OFFSET = 0
		end
	end

	local mini_classbarY = 0
	if USE_MINI_CLASSBAR then
		mini_classbarY = -(SPACING+(CLASSBAR_HEIGHT/2))
	end

	--Threat
	do
		UF:SizeAndPosition_Threat(frame)
	end

	--Rest Icon
	do
		local rIcon = frame.Resting
		if db.restIcon then
			if not frame:IsElementEnabled('Resting') then
				frame:EnableElement('Resting')
			end
		elseif frame:IsElementEnabled('Resting') then
			frame:DisableElement('Resting')
			rIcon:Hide()
		end
	end

	--Combat Icon
	do
		local cIcon = frame.Combat
		if db.combatIcon and not frame:IsElementEnabled('Combat') then
			frame:EnableElement('Combat')
		elseif not db.combatIcon and frame:IsElementEnabled('Combat') then
			frame:DisableElement('Combat')
			cIcon:Hide()
		end
	end

	--Health
	do
		UF:SizeAndPosition_HealthBar(frame)
	end

	--Name
	UF:UpdateNameSettings(frame)

	--PvP
	do
		local pvp = frame.PvPText
		local x, y = self:GetPositionOffset(db.pvp.position)
		pvp:ClearAllPoints()
		pvp:Point(db.pvp.position, frame.Health, db.pvp.position, x, y)

		frame:Tag(pvp, db.pvp.text_format)
	end

	--Power
	do
		UF:SizeAndPosition_Power(frame)
	end

	--Portrait
	do
		UF:SizeAndPosition_Portrait(frame)
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
			buffs:Width(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			buffs:Width(UNIT_WIDTH)
		end

		buffs.forceShow = frame.forceShowAuras
		buffs.num = db.buffs.perrow * rows
		buffs.size = db.buffs.sizeOverride ~= 0 and db.buffs.sizeOverride or ((((buffs:GetWidth() - (buffs.spacing*(buffs.num/rows - 1))) / buffs.num)) * rows)

		if db.buffs.sizeOverride and db.buffs.sizeOverride > 0 then
			buffs:Width(db.buffs.perrow * db.buffs.sizeOverride)
		end

		local x, y = E:GetXYOffset(db.buffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.buffs.attachTo)

		buffs:Point(E.InversePoints[db.buffs.anchorPoint], attachTo, db.buffs.anchorPoint, x + db.buffs.xOffset, y + db.buffs.yOffset)
		buffs:Height(buffs.size * rows)
		buffs["growth-y"] = db.buffs.anchorPoint:find('TOP') and 'UP' or 'DOWN'
		buffs["growth-x"] = db.buffs.anchorPoint == 'LEFT' and 'LEFT' or  db.buffs.anchorPoint == 'RIGHT' and 'RIGHT' or (db.buffs.anchorPoint:find('LEFT') and 'RIGHT' or 'LEFT')
		buffs.initialAnchor = E.InversePoints[db.buffs.anchorPoint]

		buffs.attachTo = attachTo
		buffs.point = E.InversePoints[db.buffs.anchorPoint]
		buffs.anchorPoint = db.buffs.anchorPoint
		buffs.xOffset = x + db.buffs.xOffset
		buffs.yOffset = y + db.buffs.yOffset

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
			debuffs:Width(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			debuffs:Width(UNIT_WIDTH)
		end

		debuffs.forceShow = frame.forceShowAuras
		debuffs.num = db.debuffs.perrow * rows
		debuffs.size = db.debuffs.sizeOverride ~= 0 and db.debuffs.sizeOverride or ((((debuffs:GetWidth() - (debuffs.spacing*(debuffs.num/rows - 1))) / debuffs.num)) * rows)

		if db.debuffs.sizeOverride and db.debuffs.sizeOverride > 0 then
			debuffs:Width(db.debuffs.perrow * db.debuffs.sizeOverride)
		end

		local x, y = E:GetXYOffset(db.debuffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.debuffs.attachTo, db.debuffs.attachTo == 'BUFFS' and db.buffs.attachTo == 'DEBUFFS')

		debuffs:Point(E.InversePoints[db.debuffs.anchorPoint], attachTo, db.debuffs.anchorPoint, x + db.debuffs.xOffset, y + db.debuffs.yOffset)
		debuffs:Height(debuffs.size * rows)
		debuffs["growth-y"] = db.debuffs.anchorPoint:find('TOP') and 'UP' or 'DOWN'
		debuffs["growth-x"] = db.debuffs.anchorPoint == 'LEFT' and 'LEFT' or  db.debuffs.anchorPoint == 'RIGHT' and 'RIGHT' or (db.debuffs.anchorPoint:find('LEFT') and 'RIGHT' or 'LEFT')
		debuffs.initialAnchor = E.InversePoints[db.debuffs.anchorPoint]

		debuffs.attachTo = attachTo
		debuffs.point = E.InversePoints[db.debuffs.anchorPoint]
		debuffs.anchorPoint = db.debuffs.anchorPoint
		debuffs.xOffset = x + db.debuffs.xOffset
		debuffs.yOffset = y + db.debuffs.yOffset

		if db.debuffs.enable then
			debuffs:Show()
			UF:UpdateAuraIconSettings(debuffs)
		else
			debuffs:Hide()
		end
	end

	--Smart Aura Position
	do
		local position = db.smartAuraPosition

		if position == "BUFFS_ON_DEBUFFS" then
			if db.debuffs.attachTo == "BUFFS" then
				E:Print(format(L["This setting caused a conflicting anchor point, where '%s' would be attached to itself. Please check your anchor points. Setting '%s' to be attached to '%s'."], L["Buffs"], L["Debuffs"], L["Frame"]))
				db.debuffs.attachTo = "FRAME"
				frame.Debuffs.attachTo = frame
			end
			frame.Buffs.PostUpdate = nil
			frame.Debuffs.PostUpdate = UF.UpdateBuffsHeaderPosition
		elseif position == "DEBUFFS_ON_BUFFS" then
			if db.buffs.attachTo == "DEBUFFS" then
				E:Print(format(L["This setting caused a conflicting anchor point, where '%s' would be attached to itself. Please check your anchor points. Setting '%s' to be attached to '%s'."], L["Debuffs"], L["Buffs"], L["Frame"]))
				db.buffs.attachTo = "FRAME"
				frame.Buffs.attachTo = frame
			end
			frame.Buffs.PostUpdate = UF.UpdateDebuffsHeaderPosition
			frame.Debuffs.PostUpdate = nil
		else
			frame.Buffs.PostUpdate = nil
			frame.Debuffs.PostUpdate = nil
		end
	end

	--Castbar
	do
		local castbar = frame.Castbar
		castbar:Width(db.castbar.width - (BORDER*2))
		castbar:Height(db.castbar.height - (BORDER*2))
		castbar.Holder:Width(db.castbar.width)
		castbar.Holder:Height(db.castbar.height)
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
			castbar.Icon.bg:Width(db.castbar.height)
			castbar.Icon.bg:Height(db.castbar.height)

			castbar:Width(db.castbar.width - castbar.Icon.bg:GetWidth() - (BORDER + SPACING*3))
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

	--Resource Bars
	do
		local bars = frame[frame.ClassBar]
		if bars then
			--Store original parent reference needed in classbars.lua
			bars.origParent = frame

			if bars.UpdateAllRuneTypes then
				bars.UpdateAllRuneTypes(frame)
			end
			local c = UF.db.colors.classResources.bgColor
			bars.backdrop.ignoreUpdates = true
			bars.backdrop.backdropTexture:SetVertexColor(c.r, c.g, c.b)
			if(not E.PixelMode) then
				c = E.db.general.bordercolor
				bars.backdrop:SetBackdropBorderColor(c.r, c.g, c.b)
			end
			local MAX_CLASS_BAR = UF.classMaxResourceBar[E.myclass]
			if USE_MINI_CLASSBAR and not CLASSBAR_DETACHED then
				bars:ClearAllPoints()
				bars:Point("CENTER", frame.Health.backdrop, "TOP", 0, 0)
				if E.myclass == 'DRUID' then
					CLASSBAR_WIDTH = CLASSBAR_WIDTH * 2/3
				else
					CLASSBAR_WIDTH = CLASSBAR_WIDTH * (MAX_CLASS_BAR - BORDER) / MAX_CLASS_BAR
				end
				bars:SetFrameStrata("MEDIUM")

				if bars.mover then
					bars.mover:SetScale(0.000001)
					bars.mover:SetAlpha(0)
				end
			elseif not CLASSBAR_DETACHED then
				bars:ClearAllPoints()
				bars:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, SPACING*3)
				bars:SetFrameStrata("LOW")

				if bars.mover then
					bars.mover:SetScale(0.000001)
					bars.mover:SetAlpha(0)
				end
			else
				CLASSBAR_WIDTH = db.classbar.detachedWidth - (BORDER*2)

				if not bars.mover then
					bars:Width(CLASSBAR_WIDTH)
					bars:Height(CLASSBAR_HEIGHT - (BORDER + SPACING*2))
					bars:ClearAllPoints()
					bars:Point("BOTTOM", E.UIParent, "BOTTOM", 0, 150)
					E:CreateMover(bars, 'ClassBarMover', L["Classbar"], nil, nil, nil, 'ALL,SOLO')
				else
					bars:ClearAllPoints()
					bars:Point("BOTTOMLEFT", bars.mover, "BOTTOMLEFT")
					bars.mover:SetScale(1)
					bars.mover:SetAlpha(1)
				end

				bars:SetFrameStrata("LOW")
			end

			bars:Width(CLASSBAR_WIDTH)
			bars:Height(CLASSBAR_HEIGHT - (BORDER + SPACING*2))

			if E.myclass ~= 'MONK' and E.myclass ~= 'WARLOCK' and E.myclass ~= 'DRUID' then
				for i = 1, MAX_CLASS_BAR do
					bars[i].backdrop.ignoreUpdates = true
					bars[i].backdrop.backdropTexture:SetVertexColor(c.r, c.g, c.b)
					if(not E.PixelMode) then
						c = E.db.general.bordercolor
						bars[i].backdrop:SetBackdropBorderColor(c.r, c.g, c.b)
					end
					bars[i]:Height(bars:GetHeight())
					if db.classbar.fill == "spaced" then
						bars[i]:Width((bars:GetWidth() - ((SPACING+(BORDER*2)+BORDER)*(MAX_CLASS_BAR - 1)))/MAX_CLASS_BAR)
					elseif i ~= MAX_CLASS_BAR then
						bars[i]:Width((CLASSBAR_WIDTH - (MAX_CLASS_BAR*(BORDER-SPACING))+(BORDER-SPACING)) / MAX_CLASS_BAR)
					end

					bars[i]:GetStatusBarTexture():SetHorizTile(false)
					bars[i]:ClearAllPoints()
					if i == 1 then
						bars[i]:Point("LEFT", bars)
					else
						if db.classbar.fill == "spaced" then
							bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING+(BORDER*2)+2, 0)
						elseif i == MAX_CLASS_BAR then
							bars[i]:Point("LEFT", bars[i-1], "RIGHT", BORDER-SPACING, 0)
							bars[i]:Point("RIGHT", bars)
						else
							bars[i]:Point("LEFT", bars[i-1], "RIGHT", BORDER-SPACING, 0)
						end
					end

					if db.classbar.fill ~= "spaced" then
						bars[i].backdrop:Hide()
					else
						bars[i].backdrop:Show()
					end

					if E.myclass == 'ROGUE' then
						bars[i]:SetStatusBarColor(unpack(ElvUF.colors[frame.ClassBar][i]))

						if bars[i].bg then
							bars[i].bg:SetTexture(unpack(ElvUF.colors[frame.ClassBar][i]))
						end
					elseif E.myclass ~= 'DEATHKNIGHT' then
						bars[i]:SetStatusBarColor(unpack(ElvUF.colors[frame.ClassBar]))

						if bars[i].bg then
							bars[i].bg:SetTexture(unpack(ElvUF.colors[frame.ClassBar]))
						end
					end
				end
			elseif E.myclass == 'DRUID' then
				--?? Apparent bug fix for the width after in-game settings change
				bars.LunarBar:SetMinMaxValues(0, 0)
				bars.SolarBar:SetMinMaxValues(0, 0)
				bars.LunarBar:SetStatusBarColor(unpack(ElvUF.colors.EclipseBar[1]))
				bars.SolarBar:SetStatusBarColor(unpack(ElvUF.colors.EclipseBar[2]))
				bars.LunarBar:Size(CLASSBAR_WIDTH, CLASSBAR_HEIGHT - (BORDER + SPACING*2))
				bars.SolarBar:Size(CLASSBAR_WIDTH, CLASSBAR_HEIGHT - (BORDER + SPACING*2))
			end

			if E.myclass ~= 'DRUID' then
				if db.classbar.fill ~= "spaced" then
					bars.backdrop:Show()
				else
					bars.backdrop:Hide()
				end
			end

			if CLASSBAR_DETACHED and db.classbar.parent == "UIPARENT" then
				E.FrameLocks[bars] = true
				bars:SetParent(E.UIParent)
			else
				E.FrameLocks[bars] = nil
				bars:SetParent(frame)
			end

			if USE_CLASSBAR and not frame:IsElementEnabled(frame.ClassBar) then
				frame:EnableElement(frame.ClassBar)
				bars:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled(frame.ClassBar) then
				frame:DisableElement(frame.ClassBar)
				bars:Hide()
			end
		end
	end

	--Stagger
	do
		if E.myclass == "MONK" then
			local stagger = frame.Stagger
			if db.stagger.enable then
				if not frame:IsElementEnabled('Stagger') then
					frame:EnableElement('Stagger')
				end
			else
				if frame:IsElementEnabled('Stagger') then
					frame:DisableElement('Stagger')
				end
			end
		end
	end

	--Combat Fade
	do
		if db.combatfade and not frame:IsElementEnabled('CombatFade') then
			frame:EnableElement('CombatFade')
		elseif not db.combatfade and frame:IsElementEnabled('CombatFade') then
			frame:DisableElement('CombatFade')
		end
	end

	--Debuff Highlight
	do
		local dbh = frame.DebuffHighlight
		if E.db.unitframe.debuffHighlighting ~= 'NONE' then
			frame:EnableElement('DebuffHighlight')
			frame.DebuffHighlightFilterTable = E.global.unitframe.DebuffHighlightColors
			if E.db.unitframe.debuffHighlighting == 'GLOW' then
				frame.DebuffHighlightBackdrop = true
				frame.DBHGlow:SetAllPoints(frame.Threat.glow)
			else
				frame.DebuffHighlightBackdrop = false
			end
		else
			frame:DisableElement('DebuffHighlight')
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

	--OverHealing
	do
		local healPrediction = frame.HealPrediction
		local c = UF.db.colors.healPrediction
		if db.healPrediction then
			if not frame:IsElementEnabled('HealPrediction') then
				frame:EnableElement('HealPrediction')
			end

			if not USE_PORTRAIT_OVERLAY then
				healPrediction.myBar:SetParent(frame)
				healPrediction.otherBar:SetParent(frame)
				healPrediction.absorbBar:SetParent(frame)
			else
				healPrediction.myBar:SetParent(frame.Portrait.overlay)
				healPrediction.otherBar:SetParent(frame.Portrait.overlay)
				healPrediction.absorbBar:SetParent(frame.Portrait.overlay)
			end
			healPrediction.myBar:SetStatusBarColor(c.personal.r, c.personal.g, c.personal.b, c.personal.a)
			healPrediction.otherBar:SetStatusBarColor(c.others.r, c.others.g, c.others.b, c.others.a)
			healPrediction.absorbBar:SetStatusBarColor(c.absorbs.r, c.absorbs.g, c.absorbs.b, c.absorbs.a)
		else
			if frame:IsElementEnabled('HealPrediction') then
				frame:DisableElement('HealPrediction')
			end
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
			auraBars.scaleTime = db.aurabar.uniformThreshold

			local buffColor = UF.db.colors.auraBarBuff
			local debuffColor = UF.db.colors.auraBarDebuff
			local attachTo = frame

			if(E:CheckClassColor(buffColor.r, buffColor.g, buffColor.b)) then
				buffColor = E.myclass == 'PRIEST' and E.PriestColors or (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[E.myclass] or RAID_CLASS_COLORS[E.myclass])
			end

			if(E:CheckClassColor(debuffColor.r, debuffColor.g, debuffColor.b)) then
				debuffColor = E.myclass == 'PRIEST' and E.PriestColors or (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[E.myclass] or RAID_CLASS_COLORS[E.myclass])
			end

			if db.aurabar.attachTo == 'BUFFS' then
				attachTo = frame.Buffs
			elseif db.aurabar.attachTo == 'DEBUFFS' then
				attachTo = frame.Debuffs
			end

			local anchorPoint, anchorTo = 'BOTTOM', 'TOP'
			if db.aurabar.anchorPoint == 'BELOW' then
				anchorPoint, anchorTo = 'TOP', 'BOTTOM'
			end

			local yOffset = 0;
			if db.aurabar.anchorPoint == 'BELOW' then
				yOffset = BORDER - SPACING*2;
			else
				yOffset = -BORDER + SPACING*2;
			end


			auraBars.auraBarHeight = db.aurabar.height
			auraBars:ClearAllPoints()
			auraBars:Point(anchorPoint..'LEFT', attachTo, anchorTo..'LEFT', (attachTo == frame and anchorTo == 'BOTTOM') and POWERBAR_OFFSET or 0, yOffset)
			auraBars:Point(anchorPoint..'RIGHT', attachTo, anchorTo..'RIGHT', attachTo == frame and POWERBAR_OFFSET * (anchorTo == 'BOTTOM' and 0 or -1) or 0, yOffset)
			auraBars.buffColor = {buffColor.r, buffColor.g, buffColor.b}
			if UF.db.colors.auraBarByType then
				auraBars.debuffColor = nil;
				auraBars.defaultDebuffColor = {debuffColor.r, debuffColor.g, debuffColor.b}
			else
				auraBars.debuffColor = {debuffColor.r, debuffColor.g, debuffColor.b}
				auraBars.defaultDebuffColor = nil;
			end
			auraBars.down = db.aurabar.anchorPoint == 'BELOW'

			if db.aurabar.sort == 'TIME_REMAINING' then
				auraBars.sort = true --default function
			elseif db.aurabar.sort == 'TIME_REMAINING_REVERSE' then
				auraBars.sort = UF.SortAuraBarReverse
			elseif db.aurabar.sort == 'TIME_DURATION' then
				auraBars.sort = UF.SortAuraBarDuration
			elseif db.aurabar.sort == 'TIME_DURATION_REVERSE' then
				auraBars.sort = UF.SortAuraBarDurationReverse
			elseif db.aurabar.sort == 'NAME' then
				auraBars.sort = UF.SortAuraBarName
			else
				auraBars.sort = nil
			end

			auraBars.maxBars = db.aurabar.maxBars
			auraBars.forceShow = frame.forceShowAuras
			auraBars:SetAnchors()
		else
			if frame:IsElementEnabled('AuraBars') then
				frame:DisableElement('AuraBars')
				auraBars:Hide()
			end
		end
	end

	for objectName, object in pairs(frame.customTexts) do
		if (not db.customTexts) or (db.customTexts and not db.customTexts[objectName]) then
			object:Hide()
			frame.customTexts[objectName] = nil
		end
	end

	if db.customTexts then
		local customFont = UF.LSM:Fetch("font", UF.db.font)
		for objectName, _ in pairs(db.customTexts) do
			if not frame.customTexts[objectName] then
				frame.customTexts[objectName] = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')
			end

			local objectDB = db.customTexts[objectName]

			if objectDB.font then
				customFont = UF.LSM:Fetch("font", objectDB.font)
			end

			frame.customTexts[objectName]:FontTemplate(customFont, objectDB.size or UF.db.fontSize, objectDB.fontOutline or UF.db.fontOutline)
			frame:Tag(frame.customTexts[objectName], objectDB.text_format or '')
			frame.customTexts[objectName]:SetJustifyH(objectDB.justifyH or 'CENTER')
			frame.customTexts[objectName]:ClearAllPoints()
			frame.customTexts[objectName]:Point(objectDB.justifyH or 'CENTER', frame, objectDB.justifyH or 'CENTER', objectDB.xOffset, objectDB.yOffset)
		end
	end

	if UF.db.colors.transparentHealth then
		UF:ToggleTransparentStatusBar(true, frame.Health, frame.Health.bg)
	else
		UF:ToggleTransparentStatusBar(false, frame.Health, frame.Health.bg, (USE_PORTRAIT and USE_PORTRAIT_OVERLAY) ~= true)
	end

	UF:ToggleTransparentStatusBar(UF.db.colors.transparentPower, frame.Power, frame.Power.bg)

	E:SetMoverSnapOffset(frame:GetName()..'Mover', -(12 + db.castbar.height))
	frame:UpdateAllElements()
end

tinsert(UF['unitstoload'], 'player')

--Bugfix: Death Runes show as Blood Runes on first login ( http://git.tukui.org/Elv/elvui/issues/411 )
--For some reason the registered "PLAYER_ENTERING_WORLD" in runebar.lua doesn't trigger on first login.
local function UpdateAllRunes()
	local frame = _G["ElvUF_Player"]
	if frame and frame.Runes and frame.Runes.UpdateAllRuneTypes then
		frame.Runes.UpdateAllRuneTypes(frame)
	end
end
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent(event)

	C_TimerAfter(5, UpdateAllRunes) --Delay it, since the WoW client updates Death Runes after PEW
end)