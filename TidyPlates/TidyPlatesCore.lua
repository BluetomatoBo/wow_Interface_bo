-- Tidy Plates - SMILE! :-D



TidyPlatesDebug = false
DebugCount = 1
---------------------------------------------------------------------------------------------------------------------
-- Variables and References
---------------------------------------------------------------------------------------------------------------------
TidyPlates = {}

-- Local References
local _
local select, pairs, tostring  = select, pairs, tostring 			    -- Local function copy
local CreateTidyPlatesStatusbar = CreateTidyPlatesStatusbar			    -- Local function copy
local WorldFrame, UIParent = WorldFrame, UIParent
local GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit

-- Internal Data
local Plates, PlatesVisible, PlatesFading, GUID = {}, {}, {}, {}	            	-- Plate Lists
local PlatesByUnit = {}
local nameplate, extended, bars, regions, visual, carrier, plateid			    	-- Temp/Local References
local unit, unitcache, style, stylename, unitchanged				    			-- Temp/Local References
local numChildren = -1                                                              -- Cache the current number of plates
local activetheme = {}                                                              -- Table Placeholder
local InCombat, HasTarget, HasMouseover = false, false, false					    -- Player State Data
local EnableFadeIn = true  
local ShowCastBars = true  
local EMPTY_TEXTURE = "Interface\\Addons\\TidyPlates\\Media\\Empty"
local ResetPlates, UpdateAll = false, false
local CompatibilityMode = false

-- Raid Icon Reference
local RaidIconCoordinate = {
		["STAR"] = { x = 0, y =0 },
		["CIRCLE"] = { x = 0.25, y = 0 },
		["DIAMOND"] = { x = 0.5, y = 0 },
		["TRIANGLE"] = { x = 0.75, y = 0},
		["MOON"] = { x = 0, y = 0.25}, 
		["SQUARE"] = { x = .25, y = 0.25},
		["CROSS"] = { x = .5, y = 0.25},
		["SKULL"] = { x = .75, y = 0.25}, 
}

---------------------------------------------------------------------------------------------------------------------
-- Core Function Declaration
---------------------------------------------------------------------------------------------------------------------
-- Helpers
local function ClearIndices(t) if t then for i,v in pairs(t) do t[i] = nil end return t end end
local function IsPlateShown(plate) return plate and plate:IsShown() end

-- Queueing
local function SetUpdateMe(plate) plate.UpdateMe = true end
local function SetUpdateAll() UpdateAll = true end
local function SetUpdateHealth(source) source.parentPlate.UpdateHealth = true end

-- Style
local UpdateStyle

-- Indicators
local UpdateIndicator_CustomScaleText, UpdateIndicator_Standard, UpdateIndicator_CustomAlpha
local UpdateIndicator_Level, UpdateIndicator_ThreatGlow, UpdateIndicator_RaidIcon
local UpdateIndicator_EliteIcon, UpdateIndicator_UnitColor, UpdateIndicator_Name
local UpdateIndicator_HealthBar, UpdateIndicator_Target
local OnUpdateCasting, OnStartCasting, OnStopCasting, OnUpdateCastMidway

-- Event Functions
local OnShowNameplate, OnHideNameplate, OnUpdateNameplate, OnResetNameplate
local OnHealthUpdate, UpdateUnitCondition
local UpdateUnitContext, OnRequestWidgetUpdate, OnRequestDelegateUpdate
local UpdateUnitIdentity
local OnNewNameplate

-- Main Loop
local OnUpdate
local OnNewNameplate
local ForEachPlate

-- UpdateReferences
local function UpdateReferences(plate)
	nameplate = plate
	extended = plate.extended

	carrier = plate.carrier
	bars = extended.bars
	regions = extended.regions
	unit = extended.unit
	unitcache = extended.unitcache
	visual = extended.visual
	style = extended.style
	threatborder = visual.threatborder
end

---------------------------------------------------------------------------------------------------------------------
-- Nameplate Detection & Update Loop
---------------------------------------------------------------------------------------------------------------------
do
	-- Local References
	local WorldGetNumChildren, WorldGetChildren = WorldFrame.GetNumChildren, WorldFrame.GetChildren

	-- ForEachPlate
	function ForEachPlate(functionToRun, ...)
		for plate in pairs(PlatesVisible) do
			if plate.extended.Active then
				functionToRun(plate, ...)
			end
		end
	end

        -- OnUpdate; This function is run frequently, on every clock cycle
	function OnUpdate(self, e)
		-- Poll Loop
        local plate, curChildren

        -- Detect when cursor leaves the mouseover unit
		if HasMouseover and not UnitExists("mouseover") then 
			HasMouseover = false
			SetUpdateAll() 
		end

		for plate in pairs(PlatesVisible) do
			local UpdateMe = UpdateAll or plate.UpdateMe
			local UpdateHealth = plate.UpdateHealth
			local carrier = plate.carrier
			local extended = plate.extended


			-- Check for an Update Request
			if UpdateMe or UpdateHealth then
				if not UpdateMe then
					OnHealthUpdate(plate)
				else
					OnUpdateNameplate(plate)
				end
				plate.UpdateMe = false
				plate.UpdateHealth = false

				extended:SetAlpha(extended.requestedAlpha)

			end
		end

		-- Reset Mass-Update Flag
		UpdateAll = false
	end

	
end

---------------------------------------------------------------------------------------------------------------------
--  Nameplate Extension: Applies scripts, hooks, and adds additional frame variables and regions
---------------------------------------------------------------------------------------------------------------------
do

	-- ApplyPlateExtesion
	function OnNewNameplate(plate, plateid)

        -- Tidy Plates Frame
        --------------------------------
        local bars, regions = {}, {}
		local carrier
		local frameName = "TidyPlatesCarrier"..numChildren

		carrier = CreateFrame("Frame", frameName, WorldFrame)
		local extended = CreateFrame("Frame", nil, carrier)

		plate.carrier = carrier
		plate.extended = extended

        -- Add Graphical Elements
		local visual = {}
		-- Status Bars
		local healthbar = CreateTidyPlatesStatusbar(extended)
		local castbar = CreateTidyPlatesStatusbar(extended)
		local textFrame = CreateFrame("Frame", nil, healthbar)
		local widgetFrame = CreateFrame("Frame", nil, textFrame)

		healthbar:SetFrameStrata("BACKGROUND")
		castbar:SetFrameStrata("BACKGROUND")
		widgetFrame:SetFrameStrata("LOW")

		textFrame:SetAllPoints()

		extended.widgetFrame = widgetFrame
		visual.healthbar = healthbar
		visual.castbar = castbar
		bars.healthbar = healthbar		-- For Threat Plates Compatibility
		bars.castbar = castbar			-- For Threat Plates Compatibility
		-- Parented to Health Bar - Lower Frame
		visual.healthborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.threatborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.highlight = healthbar:CreateTexture(nil, "OVERLAY")
		-- Parented to Extended - Middle Frame
		visual.raidicon = textFrame:CreateTexture(nil, "ARTWORK")
		visual.eliteicon = textFrame:CreateTexture(nil, "OVERLAY")
		visual.skullicon = textFrame:CreateTexture(nil, "OVERLAY")
		visual.target = textFrame:CreateTexture(nil, "BACKGROUND")
		-- TextFrame
		visual.customtext = textFrame:CreateFontString(nil, "OVERLAY")
		visual.name  = textFrame:CreateFontString(nil, "OVERLAY")
		visual.level = textFrame:CreateFontString(nil, "OVERLAY")
		-- Cast Bar Frame - Highest Frame
		visual.castborder = castbar:CreateTexture(nil, "ARTWORK")
		visual.castnostop = castbar:CreateTexture(nil, "ARTWORK")
		visual.spellicon = castbar:CreateTexture(nil, "OVERLAY")
		visual.spelltext = castbar:CreateFontString(nil, "OVERLAY")
		-- Set Base Properties
		visual.raidicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
		visual.highlight:SetAllPoints(visual.healthborder)
		visual.highlight:SetBlendMode("ADD")
		extended:SetFrameStrata("BACKGROUND")
		healthbar:SetFrameStrata("BACKGROUND")
		healthbar:SetFrameStrata("BACKGROUND")
		healthbar:SetFrameLevel(0)
		extended:SetFrameLevel(1)
		castbar:SetFrameLevel(0)
		castbar:Hide()
		castbar:SetStatusBarColor(1,.8,0)
		carrier:SetSize(16, 16)
		-- Default Fonts
		visual.customtext:SetFont(STANDARD_TEXT_FONT, 12, "NONE")
		visual.name:SetFont(STANDARD_TEXT_FONT, 12, "NONE")
		visual.level:SetFont(STANDARD_TEXT_FONT, 12, "NONE")
		visual.spelltext:SetFont(STANDARD_TEXT_FONT, 12, "NONE")

		-- Tidy Plates Frame References
		extended.regions = regions
		extended.bars = bars
		extended.visual = visual

		-- Allocate Tables
		extended.style,
		extended.unit,
		extended.unitcache,
		extended.stylecache,
		extended.widgets
			= {}, {}, {}, {}, {}

		extended.stylename = ""

		carrier:SetPoint("CENTER", plate, "CENTER")
	end

end

---------------------------------------------------------------------------------------------------------------------
-- Nameplate Script Handlers
---------------------------------------------------------------------------------------------------------------------
do

	-- UpdateUnitCache
	local function UpdateUnitCache() for key, value in pairs(unit) do unitcache[key] = value end end

	-- CheckNameplateStyle
	local function CheckNameplateStyle()
		if activetheme.SetStyle then
			stylename = activetheme.SetStyle(unit); extended.style = activetheme[stylename]
		else extended.style = activetheme; stylename = tostring(activetheme) end

		style = extended.style

		if extended.stylename ~= stylename then
			UpdateStyle()
			extended.stylename = stylename
			unit.style = stylename
		end

	end

	-- ProcessUnitChanges
	local function ProcessUnitChanges()
			-- Unit Cache
			unitchanged = false
			for key, value in pairs(unit) do
				if unitcache[key] ~= value then
					unitchanged = true
				end
			end

			-- Update Style/Indicators
			if unitchanged or (not style)then
				CheckNameplateStyle()
				UpdateIndicator_Standard()
				UpdateIndicator_HealthBar()
				UpdateIndicator_Target()
			end

			-- Update Widgets
			if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end

			-- Update Delegates
			UpdateIndicator_ThreatGlow()
			UpdateIndicator_CustomAlpha()
			UpdateIndicator_CustomScaleText()

			-- Cache the old unit information
			UpdateUnitCache()
	end

	---------------------------------------------------------------------------------------------------------------------
	-- Create / Hide / Show Event Handlers
	---------------------------------------------------------------------------------------------------------------------

	-- OnShowNameplate
	function OnShowNameplate(plate, unitid)
		-- or unitid = plate.namePlateUnitToken
		UpdateReferences(plate)

		carrier:Show()
		--extended:Show()
		extended:SetAlpha(1)

		PlatesVisible[plate] = unitid
		PlatesByUnit[unitid] = plate

		unit.frame = extended
		unit.alpha = 0
		unit.isTarget = false
		unit.isMouseover = false
		unit.unitid = plateid
		extended.unitcache = ClearIndices(extended.unitcache)
		extended.stylename = ""
		extended.Active = true

		visual.highlight:Hide()

		wipe(extended.unit)
		wipe(extended.unitcache)


		-- For Fading In
		PlatesFading[plate] = EnableFadeIn
		extended.requestedAlpha = 0
		extended.visibleAlpha = 0
		extended:Hide()		-- Yes, it seems counterintuitive, but...
		extended:SetAlpha(0)

		-- Graphics
		unit.isCasting = false
		visual.castbar:Hide()
		visual.highlight:Hide()


		-- Widgets/Extensions
		-- This goes here because a user might change widget settings after nameplates have been created
		if activetheme.OnInitialize then activetheme.OnInitialize(extended, activetheme) end

		-- Initial Data Gather
		--UpdateUnitIdentity(unitid)
		--UpdateUnitContext(plate, unitid)
		--ProcessUnitChanges()

		-- Skip the initial data gather and let the second cycle do the work.
		plate.UpdateMe = true

	end


	-- OnHideNameplate
	function OnHideNameplate(plate, unitid)
		--plate.extended:Hide()
		plate.carrier:Hide()

		UpdateReferences(plate)

		extended.Active = false

		PlatesVisible[plate] = nil
		PlatesByUnit[unitid] = nil

		visual.castbar:Hide()
		visual.castbar:SetScript("OnUpdate", nil)
		unit.isCasting = false

		-- Remove anything from the function queue
		plate.UpdateMe = false

		for widgetname, widget in pairs(extended.widgets) do widget:Hide() end
	end

	-- OnUpdateNameplate
	function OnUpdateNameplate(plate)
		-- And stay down!
		plate:GetChildren():Hide()

		-- Gather Information
		unitid = PlatesVisible[plate]
		UpdateReferences(plate)

		UpdateUnitIdentity(unitid)
		UpdateUnitContext(plate, unitid)
		ProcessUnitChanges()
		OnUpdateCastMidway(plate, unitid)
	end

	-- OnHealthUpdate
	function OnHealthUpdate(plate)
		unitid = PlatesVisible[plate]

		UpdateUnitCondition(plate, unitid)
		ProcessUnitChanges()
		UpdateIndicator_HealthBar()		-- Just to be on the safe side
	end

     -- OnResetNameplate
	function OnResetNameplate(plate)
		local extended = plate.extended
		plate.UpdateMe = true
		extended.unitcache = ClearIndices(extended.unitcache)
		extended.stylename = ""
		unitid = PlatesVisible[plate]

		OnShowNameplate(plate, unitid)
	end

end


---------------------------------------------------------------------------------------------------------------------
--  Unit Updates: Updates Unit Data, Requests indicator updates
---------------------------------------------------------------------------------------------------------------------
do
	local RaidIconList = { "STAR", "CIRCLE", "DIAMOND", "TRIANGLE", "MOON", "SQUARE", "CROSS", "SKULL" }

	-- GetUnitAggroStatus: Determines if a unit is attacking, by looking at aggro glow region
	local function GetUnitAggroStatus( threatRegion )
		if not  threatRegion:IsShown() then return "LOW", 0 end

		local red, green, blue, alpha = threatRegion:GetVertexColor()
		local opacity = threatRegion:GetVertexColor()

		if threatRegion:IsShown() and (alpha < .9 or opacity < .9) then
			-- Unfinished
		end

		if red > 0 then
			if green > 0 then
				if blue > 0 then return "MEDIUM", 1 end
				return "MEDIUM", 2
			end
			return "HIGH", 3
		end
	end

	-- GetUnitReaction: Determines the reaction, and type of unit from the health bar color
	local function GetUnitReaction(red, green, blue)
		if red < .01 then 	-- Friendly
			if blue < .01 and green > .99 then return "FRIENDLY", "NPC"
			elseif blue > .99 and green < .01 then return "FRIENDLY", "PLAYER"
			end
		elseif red > .99 then
			if blue < .01 and green > .99 then return "NEUTRAL", "NPC"
			elseif blue < .01 and green < .01 then return "HOSTILE", "NPC"
			end
		elseif red > .5 and red < .6 then
			if green > .5 and green < .6 and blue > .5 and blue < .6 then return "TAPPED", "NPC" end 	-- .533, .533, .99	-- Tapped Mob
		end
		return "HOSTILE", "PLAYER"
	end
		
	local EliteReference = {
		["elite"] = true,
		["rareelite"] = true,
		["worldboss"] = true,
	}

	local RareReference = {
		["rare"] = true,
		["rareelite"] = true,
	}

	local ThreatReference = {
		[0] = "LOW",
		[1] = "MEDIUM",
		[2] = "MEDIUM",
		[3] = "HIGH",
	}

	-- UpdateUnitIdentity: Updates Low-volatility Unit Data
	-- (This is essentially static data)
	--------------------------------------------------------
	function UpdateUnitIdentity(unitid)

		unit.unitid = unitid
		unit.name = UnitName(unitid)
		unit.rawName = unit.name  -- gsub(unit.name, " %(%*%)", "")

		local classification = UnitClassification(unitid)

		unit.isBoss = UnitLevel(unitid) == -1
		unit.isDangerous = unit.isBoss

		unit.isElite = EliteReference[classification]
		unit.isRare = RareReference[classification]
		unit.isTrivial = UnitIsTrivial(unitid)

		if UnitIsPlayer(unitid) then
			_, unit.class = UnitClass(unitid)
			unit.type = "PLAYER"
		else 
			unit.class = "" 
			unit.type = "NPC"
		end
	end


        -- UpdateUnitContext: Updates Target/Mouseover
	function UpdateUnitContext(plate, unitid)
		local guid

		UpdateReferences(plate)

		unit.isMouseover = UnitIsUnit("mouseover", unitid)
		unit.isTarget = UnitIsUnit("target", unitid)
		
		unit.guid = UnitGUID(unitid)

		UpdateUnitCondition(plate, unitid)	-- This updates a bunch of properties
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- UpdateUnitCondition: High volatility data
	function UpdateUnitCondition(plate, unitid)
		UpdateReferences(plate)

		unit.level = UnitEffectiveLevel(unitid) 
		local c = GetCreatureDifficultyColor(unit.level)
		unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue = c.r, c.g, c.b

		unit.red, unit.green, unit.blue = UnitSelectionColor(unitid)

		--- Working on this...  there's a better way to do it.
		unit.reaction = GetUnitReaction(unit.red, unit.green, unit.blue)

		-- UnitCanAttack("unit", "unit")
		-- UnitFactionGroup("name")
		--UnitCanAttack("player", unit)
		--isFriends = UnitIsFriend("unit", "unit")

--[[
		if UnitCanAttack("player", unitid) then
			unit.reaction = "HOSTILE"
		else
			unit.reaction = "FRIENDLY"
		end
--]]

		--[[
		local reaction = UnitReaction(unit, "player");
		if ( reaction ) then
			r = FACTION_BAR_COLORS[reaction].r;
			g = FACTION_BAR_COLORS[reaction].g;
			b = FACTION_BAR_COLORS[reaction].b;

					local reaction = UnitReaction("player", unit);
		if reaction and reaction <= 4 then
		-- Reaction 4 is neutral and less than 4 becomes increasingly more hostile
			filter = "HARMFUL|INCLUDE_NAME_PLATE_ONLY";
		else
			filter = "NONE";
		end
		--]]

		unit.health = UnitHealth(unitid) or 0
		unit.healthmax = UnitHealthMax(unitid) or 1

		unit.threatValue = UnitThreatSituation("player", unitid) or 0
		unit.threatSituation = ThreatReference[unit.threatValue]
		unit.isInCombat = UnitAffectingCombat(unitid)
		

		local raidIconIndex = GetRaidTargetIndex(unitid)

		if raidIconIndex then 
			unit.raidIcon = RaidIconList[raidIconIndex] 
			unit.isMarked = true
		else
			unit.isMarked = false
		end
		
		-- Unfinished....
		unit.isTapped = false		--not UnitIsTappedByPlayer(unitid)
		--unit.isInCombat = false
		--unit.platetype = 2 -- trivial mini mob
		
	end

	-- OnRequestWidgetUpdate: Calls Update on just the Widgets
	function OnRequestWidgetUpdate(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- OnRequestDelegateUpdate: Updates just the delegate function indicators
	function OnRequestDelegateUpdate(plate)
			if not IsPlateShown(plate) then return end
			UpdateReferences(plate)
			UpdateIndicator_ThreatGlow()
			UpdateIndicator_CustomAlpha()
			UpdateIndicator_CustomScaleText()
	end

end		-- End of Nameplate/Unit Events


---------------------------------------------------------------------------------------------------------------------
-- Indicators: These functions update the color, texture, strings, and frames within a style.
---------------------------------------------------------------------------------------------------------------------
do
	local color = {}
	local threatborder, alpha, forcealpha, scale


	-- UpdateIndicator_HealthBar: Updates the value on the health bar
	function UpdateIndicator_HealthBar()
		visual.healthbar:SetMinMaxValues(0, unit.healthmax)
		visual.healthbar:SetValue(unit.health)
	end


	-- UpdateIndicator_Name:
	function UpdateIndicator_Name()
		visual.name:SetText(unit.name)

		-- Name Color
		if activetheme.SetNameColor then
			visual.name:SetTextColor(activetheme.SetNameColor(unit))
		else visual.name:SetTextColor(1,1,1,1) end
	end


	-- UpdateIndicator_Level:
	function UpdateIndicator_Level()
		if unit.level < 0 then visual.level:SetText("")
		else visual.level:SetText(unit.level) end
		visual.level:SetTextColor(unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue)
	end


	-- UpdateIndicator_ThreatGlow: Updates the aggro glow
	function UpdateIndicator_ThreatGlow()
		if not style.threatborder.show then return end
		threatborder = visual.threatborder
		if activetheme.SetThreatColor then

			threatborder:SetVertexColor(activetheme.SetThreatColor(unit) )
		else
			if InCombat and unit.reaction ~= "FRIENDLY" and unit.type == "NPC" then
				local color = style.threatcolor[unit.threatSituation]
				threatborder:Show()
				threatborder:SetVertexColor(color.r, color.g, color.b, (color.a or 1))
			else threatborder:Hide() end
		end
	end


	-- UpdateIndicator_Target
	function UpdateIndicator_Target()
		if unit.isTarget and style.target.show then visual.target:Show() else visual.target:Hide() end
		if unit.isMouseover and not unit.isTarget then visual.highlight:Show() else visual.highlight:Hide() end
	end


	-- UpdateIndicator_RaidIcon
	function UpdateIndicator_RaidIcon()
		if unit.isMarked and style.raidicon.show then
			visual.raidicon:Show()
			local iconCoord = RaidIconCoordinate[unit.raidIcon]
			visual.raidicon:SetTexCoord(iconCoord.x, iconCoord.x + 0.25, iconCoord.y,  iconCoord.y + 0.25)
		else visual.raidicon:Hide() end
	end


	-- UpdateIndicator_EliteIcon: Updates the border overlay art and threat glow to Elite or Non-Elite art
	function UpdateIndicator_EliteIcon()
		threatborder = visual.threatborder
		if unit.isElite and style.eliteicon.show then visual.eliteicon:Show() else visual.eliteicon:Hide() end
	end


	-- UpdateIndicator_UnitColor: Update the health bar coloring, if needed
	function UpdateIndicator_UnitColor()
		-- Set Health Bar
		if activetheme.SetHealthbarColor then
			visual.healthbar:SetAllColors(activetheme.SetHealthbarColor(unit))

		else visual.healthbar:SetStatusBarColor(unit.red, unit.green, unit.blue) end

		-- Name Color
		if activetheme.SetNameColor then
			visual.name:SetTextColor(activetheme.SetNameColor(unit))
		else visual.name:SetTextColor(1,1,1,1) end
	end


	-- UpdateIndicator_Standard: Updates Non-Delegate Indicators
	function UpdateIndicator_Standard()
		if IsPlateShown(nameplate) then
			if unitcache.name ~= unit.name then UpdateIndicator_Name() end
			if unitcache.level ~= unit.level then UpdateIndicator_Level() end
			UpdateIndicator_RaidIcon()
			if unitcache.isElite ~= unit.isElite then UpdateIndicator_EliteIcon() end
		end
	end


	-- UpdateIndicator_CustomAlpha: Calls the alpha delegate to get the requested alpha
	function UpdateIndicator_CustomAlpha(event)
		if activetheme.SetAlpha then
			local previousAlpha = extended.requestedAlpha
			extended.requestedAlpha = activetheme.SetAlpha(unit) or previousAlpha or unit.alpha or 1
		else
			extended.requestedAlpha = unit.alpha or 1
		end

		if extended.requestedAlpha > 0 then
			if nameplate:IsShown() then extended:Show() end
		else
			extended:Hide()        -- FRAME HIDE TEST
		end

		-- Better Layering
		if unit.isTarget then
			extended:SetFrameLevel(3)
		elseif unit.isMouseover then
			extended:SetFrameLevel(2)
		else
			extended:SetFrameLevel(0)
		end
	end


	-- UpdateIndicator_CustomScaleText: Updates indicators for custom text and scale
	function UpdateIndicator_CustomScaleText()
		threatborder = visual.threatborder

		if unit.health and (extended.requestedAlpha > 0) then
			-- Scale
			if activetheme.SetScale then
				scale = activetheme.SetScale(unit)
				if scale then extended:SetScale( scale )end
			end

			-- Set Special-Case Regions
			if style.customtext.show then
				if activetheme.SetCustomText then
					local text, r, g, b, a = activetheme.SetCustomText(unit)
					visual.customtext:SetText( text or "")
					visual.customtext:SetTextColor(r or 1, g or 1, b or 1, a or 1)
				else visual.customtext:SetText("") end
			end

			UpdateIndicator_UnitColor()
		end
	end


	local function OnUpdateCastBarForward(self)
		local currentTime = GetTime() * 1000
		--local startTime, endTime = self:GetMinMaxValues()

		--if currentTime > endTime then OnStopCasting(self)
		--else self:SetValue(currentTime) end

		self:SetValue(currentTime)
	end


	local function OnUpdateCastBarReverse(self)
		local currentTime = GetTime() * 1000
		local startTime, endTime = self:GetMinMaxValues()

		--if currentTime > endTime then OnStopCasting(self)
		--else self:SetValue((endTime + startTime) - currentTime) end

		self:SetValue((endTime + startTime) - currentTime)
	end

	

	-- OnShowCastbar
	function OnStartCasting(plate, unitid, channeled)
		UpdateReferences(plate)
		--if not extended:IsShown() then return end
		if not extended:IsShown() then return end

		local castBar = extended.visual.castbar

		local name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible
		
		if channeled then
			name, subText, text, texture, startTime, endTime, isTradeSkill, notInterruptible = UnitChannelInfo(unitid)
			castBar:SetScript("OnUpdate", OnUpdateCastBarReverse)
		else
			name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(unitid)
			castBar:SetScript("OnUpdate", OnUpdateCastBarForward)
		end

		if isTradeSkill then return end

		unit.isCasting = true
		unit.spellIsShielded = notInterruptible
		unit.spellInterruptible = not unit.spellIsShielded

		visual.spelltext:SetText(text)
		visual.spellicon:SetTexture(texture)
		castBar:SetMinMaxValues( startTime, endTime )

		local r, g, b, a = 1, 1, 0, 1

		if activetheme.SetCastbarColor then
			r, g, b, a = activetheme.SetCastbarColor(unit)
			if not (r and g and b and a) then return end
		end

		castBar:SetStatusBarColor( r, g, b)

		castBar:SetAlpha(a or 1)

		if unit.spellIsShielded then
			   visual.castnostop:Show(); visual.castborder:Hide()
		else visual.castnostop:Hide(); visual.castborder:Show() end
		
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()

		castBar:Show()

	end


	-- OnHideCastbar
	function OnStopCasting(plate)

		UpdateReferences(plate)
		
		if not extended:IsShown() then return end
		local castBar = extended.visual.castbar

		castBar:Hide()
		castBar:SetScript("OnUpdate", nil)

		unit.isCasting = false
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()
	end



	function OnUpdateCastMidway(plate, unitid)
		if not ShowCastBars then return end

		local currentTime = GetTime() * 1000

		-- Check to see if there's a spell being cast
		if UnitCastingInfo(unitid) then OnStartCasting(plate, unitid, false)
		else
		-- See if one is being channeled...
			if UnitCastingInfo(unitid) then OnStartCasting(plate, unitid, true) end
		end
	end


end -- End Indicator section


--------------------------------------------------------------------------------------------------------------
-- WoW Event Handlers: sends event-driven changes to the appropriate gather/update handler.
--------------------------------------------------------------------------------------------------------------
do
	local events = {}
	local function EventHandler(self, event, ...)
		events[event](event, ...)

	end

	local TidyPlatesCore = CreateFrame("Frame", nil, WorldFrame)
	TidyPlatesCore:SetFrameStrata("TOOLTIP") 	-- When parented to WorldFrame, causes OnUpdate handler to run close to last
	TidyPlatesCore:SetScript("OnEvent", EventHandler)

	-- Events
	function events:PLAYER_ENTERING_WORLD() 
		TidyPlatesCore:SetScript("OnUpdate", OnUpdate);

		--NamePlateDriverFrame:UnregisterAllEvents();					-- DH Method

	end

	function events:NAME_PLATE_CREATED(...)
		local plate = ...

		OnNewNameplate(plate)
	 end

	function events:NAME_PLATE_UNIT_ADDED(...) 
		local unitid = ...
		local plate = GetNamePlateForUnit(unitid);

		--if plate then OnShowNameplate(plate, unitid) end
													
		if UnitIsUnit("player", unitid) then 		-- DH Method
			plate:GetChildren():Show()
		else
			plate:GetChildren():Hide()
			OnShowNameplate(plate, unitid)
		end
		
	end
	
	function events:NAME_PLATE_UNIT_REMOVED(...) 
		local unitid = ...
		local plate = GetNamePlateForUnit(unitid);

		OnHideNameplate(plate, unitid)
	end

	function events:PLAYER_TARGET_CHANGED() 
		HasTarget = UnitExists("target") == true; 
		SetUpdateAll() 

	end	

	function events:UNIT_HEALTH_FREQUENT(...)
		local unitid = ...
		local plate = PlatesByUnit[unitid]

		if plate then OnHealthUpdate(plate) end
	end

	function events:PLAYER_REGEN_ENABLED() 
		InCombat = false
		SetUpdateAll() 
	end

	function events:PLAYER_REGEN_DISABLED() 
		InCombat = true
		SetUpdateAll() 
	end

	function events:UPDATE_MOUSEOVER_UNIT(...) 
		if UnitExists("mouseover") then 
			HasMouseover = true
			SetUpdateAll() 
		end
	end

	function events:UNIT_LEVEL() SetUpdateAll() end
	function events:RAID_TARGET_UPDATE() SetUpdateAll() end
	function events:UNIT_THREAT_SITUATION_UPDATE() SetUpdateAll() end  -- Fired when target changes?


	-- Spell Casting Function
	local function UNIT_SPELLCAST_MIDWAY(...)
		local unitid = ...

		if UnitIsUnit("player", unitid) or not ShowCastBars then return end

		local plate = GetNamePlateForUnit(unitid);

		if plate then 
			OnUpdateCastMidway(plate, unitid)
		end
	 end

	 events.UNIT_SPELLCAST_DELAYED = UNIT_SPELLCAST_MIDWAY
	 events.UNIT_SPELLCAST_CHANNEL_UPDATE = UNIT_SPELLCAST_MIDWAY
	 events.UNIT_SPELLCAST_INTERRUPTIBLE = UNIT_SPELLCAST_MIDWAY
	 events.UNIT_SPELLCAST_NOT_INTERRUPTIBLE = UNIT_SPELLCAST_MIDWAY


	function events:UNIT_SPELLCAST_START(...)
		local unitid = ...
		if UnitIsUnit("player", unitid) or not ShowCastBars then return end

		local plate = GetNamePlateForUnit(unitid)

		if plate then 
			OnStartCasting(plate, unitid, false)
		end
	end


	 function events:UNIT_SPELLCAST_STOP(...)
		local unitid = ...
		if UnitIsUnit("player", unitid) or not ShowCastBars then return end

		local plate = GetNamePlateForUnit(unitid)

		if plate then 
			OnStopCasting(plate)
		end
	 end

	 

	function events:UNIT_SPELLCAST_CHANNEL_START(...)
		local unitid = ...
		if UnitIsUnit("player", unitid) or not ShowCastBars then return end

		local plate = GetNamePlateForUnit(unitid)

		if plate then 
			OnStartCasting(plate, unitid, true)
		end
	end

	function events:UNIT_SPELLCAST_CHANNEL_STOP(...)
		local unitid = ...
		if UnitIsUnit("player", unitid) or not ShowCastBars then return end

		local plate = GetNamePlateForUnit(unitid)

		if plate then 
			OnStopCasting(plate)
		end
	end



	--events.UNIT_SPELLCAST_SUCCEEDED = events.UNIT_SPELLCAST_STOP

	--[[

	function events:PLAYER_CONTROL_LOST() SetUpdateAll() end
	events.PLAYER_CONTROL_GAINED = events.PLAYER_CONTROL_LOST
	events.UNIT_FACTION = events.PLAYER_CONTROL_LOST

	--]]

	-- Registration of Blizzard Events
	for eventname in pairs(events) do TidyPlatesCore:RegisterEvent(eventname) end
end


---------------------------------------------------------------------------------------------------------------------
--  Nameplate Styler: These functions parses the definition table for a nameplate's requested style.
---------------------------------------------------------------------------------------------------------------------
do
	-- Helper Functions
	local function SetObjectShape(object, width, height) object:SetWidth(width); object:SetHeight(height) end
	local function SetObjectFont(object,  font, size, flags) if not object:SetFont(font, size, flags) then object:SetFont("FONTS\\ARIALN.TTF", size or 12, flags) end end
	local function SetObjectJustify(object, horz, vert) object:SetJustifyH(horz); object:SetJustifyV(vert) end
	local function SetObjectAnchor(object, anchor, anchorTo, x, y) object:ClearAllPoints();object:SetPoint(anchor, anchorTo, anchor, x, y) end
	local function SetObjectTexture(object, texture) object:SetTexture(texture) end
	local function SetObjectBartexture(obj, tex, ori, crop) obj:SetStatusBarTexture(tex); obj:SetOrientation(ori); end

	-- SetObjectShadow:
	local function SetObjectShadow(object, shadow)
		if shadow then
			object:SetShadowColor(0,0,0, tonumber(shadow) or 1)
			object:SetShadowOffset(.5, -.5)
		else object:SetShadowColor(0,0,0,0) end
	end

	-- SetFontGroupObject
	local function SetFontGroupObject(object, objectstyle)
		if objectstyle then
			SetObjectFont(object, objectstyle.typeface or "FONTS\\ARIALN.TTF",  objectstyle.size or 12, objectstyle.flags or "NONE")
			SetObjectJustify(object, objectstyle.align or "CENTER", objectstyle.vertical or "BOTTOM")
			SetObjectShadow(object, objectstyle.shadow or 1)
		end
	end

	-- SetAnchorGroupObject
	local function SetAnchorGroupObject(object, objectstyle, anchorTo)
		if objectstyle and anchorTo then
			SetObjectShape(object, objectstyle.width or 128, objectstyle.height or 16) --end
			SetObjectAnchor(object, objectstyle.anchor or "CENTER", anchorTo, objectstyle.x or 0, objectstyle.y or 0)
		end
	end

	-- SetTextureGroupObject
	local function SetTextureGroupObject(object, objectstyle)
		if objectstyle then
			if objectstyle.texture then SetObjectTexture(object, objectstyle.texture or EMPTY_TEXTURE) end
			object:SetTexCoord(objectstyle.left or 0, objectstyle.right or 1, objectstyle.top or 0, objectstyle.bottom or 1)
		end
	end


	-- SetBarGroupObject
	local function SetBarGroupObject(object, objectstyle, anchorTo)
		if objectstyle then
			SetAnchorGroupObject(object, objectstyle, anchorTo)
			SetObjectBartexture(object, objectstyle.texture or EMPTY_TEXTURE, objectstyle.orientation or "HORIZONTAL")
			if objectstyle.backdrop then
				object:SetBackdropTexture(objectstyle.backdrop)
			end
			object:SetTexCoord(objectstyle.left, objectstyle.right, objectstyle.top, objectstyle.bottom)
		end
	end

	-- Style Groups
	local fontgroup = {"name", "level", "spelltext", "customtext"}

	local anchorgroup = {"healthborder", "threatborder", "castborder", "castnostop",
						"name",  "spelltext", "customtext", "level",
						"spellicon", "raidicon", "skullicon", "eliteicon", "target"}

	local bargroup = {"castbar", "healthbar"}

	local texturegroup = { "castborder", "castnostop", "healthborder", "threatborder", "eliteicon",
						"skullicon", "highlight", "target", "spellicon", }


	-- UpdateStyle:
	function UpdateStyle()
		local index
		local objectstyle, objectname, objectregion, objectenable

		-- Frame
		SetAnchorGroupObject(extended, style.frame, carrier)

		-- Anchorgroup
		for index = 1, #anchorgroup do
			objectname = anchorgroup[index]; SetAnchorGroupObject(visual[objectname], style[objectname], extended)
			objectenable = style[objectname].show
			if objectenable then visual[objectname]:Show() else visual[objectname]:Hide() end
		end
		-- Bars
		for index = 1, #bargroup do objectname = bargroup[index]; SetBarGroupObject(visual[objectname], style[objectname], extended) end
		-- Texture
		for index = 1, #texturegroup do objectname = texturegroup[index]; SetTextureGroupObject(visual[objectname], style[objectname]) end
		-- Raid Icon Texture
		visual.raidicon:SetTexture(style.raidicon.texture)
		-- Font Group
		for index = 1, #fontgroup do objectname = fontgroup[index];SetFontGroupObject(visual[objectname], style[objectname]) end
		-- Hide Stuff
		if unit.isElite then visual.eliteicon:Hide() else visual.eliteicon:Hide() end
		if unit.isBoss then visual.level:Hide() else visual.skullicon:Hide() end
		if not unit.isTarget then visual.target:Hide() end
		if not unit.isMarked then visual.raidicon:Hide() end

	end


end

--------------------------------------------------------------------------------------------------------------
-- External Commands: Allows widgets and themes to request updates to the plates.
-- Useful to make a theme respond to externally-captured data (such as the combat log)
--------------------------------------------------------------------------------------------------------------
function TidyPlates:DisableCastBars() ShowCastBars = false end
function TidyPlates:EnableCastBars() ShowCastBars = true end

function TidyPlates:ForceUpdate() ForEachPlate(OnResetNameplate) end
function TidyPlates:Update() SetUpdateAll() end
function TidyPlates:RequestWidgetUpdate(plate) if plate then SetUpdateMe(plate) else SetUpdateAll() end end
function TidyPlates:RequestDelegateUpdate(plate) if plate then SetUpdateMe(plate) else SetUpdateAll() end end
function TidyPlates:ActivateTheme(theme) if theme and type(theme) == 'table' then TidyPlates.ActiveThemeTable, activetheme = theme, theme; ResetPlates = true; end end
function TidyPlates:EnableFadeIn() EnableFadeIn = true; end
function TidyPlates:DisableFadeIn() EnableFadeIn = nil; end
function TidyPlates:EnableCompatibilityMode() CompatibilityMode = true; end
TidyPlates.NameplatesByGUID, TidyPlates.NameplatesAll, TidyPlates.NameplatesByVisible = GUID, Plates, PlatesVisible





