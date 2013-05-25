-- Tidy Plates - SMILE! :-D
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- I. Variables and Global Functions
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
TidyPlates = {}

-- Local Function Copies
local _
local select, pairs, tostring  = select, pairs, tostring 			    -- Local function copy
local WorldFrame, UIParent = WorldFrame, UIParent
local CreateTidyPlatesStatusbar = CreateTidyPlatesStatusbar			    -- Local function copy
local extendedSetAlpha, HighlightIsShown, HighlightSetAlpha			    -- Local function copy placeholders
local PlateSetAlpha, PlateGetAlpha						    -- Local function copy placeholders
--local PlateGetLeft, PlateGetBottom						    -- Local function copy placeholders
-- Internal Data
local Plates, PlatesVisible, PlatesFading, GUID = {}, {}, {}, {}	            -- Plate Lists
local nameplate, extended, bars, regions, visual				    -- Temp/Local References
local unit, unitcache, style, stylename, unitchanged				    -- Temp/Local References
local numChildren = -1                                                              -- Cache the current number of plates
local activetheme = {}                                                              -- Table Placeholder
local InCombat, HasTarget, CurrentTarget = false, false, nil                        -- Player State Data
local EnableFadeIn = true                                                           -- Enables Alpha Effects
local EMPTY_TEXTURE = "Interface\\Addons\\TidyPlates\\Media\\Empty"
local ResetPlates, UpdateAll = false, false

local ExclusiveMode = false

---------------------------------------------------------------------------------------------------------------------
-- Function Reference
---------------------------------------------------------------------------------------------------------------------

-- Helpers
local function ClearIndices(t) if t then for i,v in pairs(t) do t[i] = nil end return t end end
local function IsPlateShown(plate) return plate and plate:IsShown() end

-- Queueing
local function SetPlateQueue(plate) plate.UpdateMe = true end
local function SetUpdateAll() UpdateAll = true end
local function SetFunctionQueue(func) if func then FunctionQueue[func] = true end end

-- Style
local UpdateStyle

-- Indicators
local UpdateIndicator_CustomScaleText, UpdateIndicator_Standard, UpdateIndicator_CustomAlpha
local UpdateIndicator_Level, UpdateIndicator_ThreatGlow, UpdateIndicator_RaidIcon
local UpdateIndicator_EliteIcon, UpdateIndicator_UnitColor, UpdateIndicator_Name
local UpdateIndicator_HealthBar
local UpdateIndicator_UpdateCastBar, UpdateIndicator_ShowCastBar, UpdateIndicator_HideCastBar

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
		    
	bars = extended.bars
	regions = extended.regions 
	unit = extended.unit
	unitcache = extended.unitcache
	visual = extended.visual
	style = extended.style
	threatborder = visual.threatborder
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- Nameplate Detection & Update Loop
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
do
	-- Local References
	local WorldGetNumChildren, WorldGetChildren = WorldFrame.GetNumChildren, WorldFrame.GetChildren
	
	-- IsNameplate
	local function IsNameplate(frame)
		if frame:GetName() and strfind(frame:GetName(), '^NamePlate%d') then
			local nameTextChild = select(2, frame:GetChildren())
			if nameTextChild then
				local nameTextRegion = nameTextChild:GetRegions()
				return (nameTextRegion and nameTextRegion:GetObjectType() == 'FontString')
			end
		end
	end
	
	-- ForEachPlate
	function ForEachPlate(functionToRun, ...)
		for plate in pairs(PlatesVisible) do
			if plate.extended.Active then 
				functionToRun(plate, ...)
			end
		end
	end

	-- Nameplate Fade-In
        local fadeInRate, fadeOutRate = .07, .2
	local function UpdateNameplateFade(plate)
            local visibleAlpha, requestedAlpha
            extended = plate.extended
            visibleAlpha = extended.visibleAlpha
            requestedAlpha = extended.requestedAlpha
            if visibleAlpha < requestedAlpha then
                    visibleAlpha = visibleAlpha + fadeInRate
                    extended.visibleAlpha = visibleAlpha
                    extendedSetAlpha(extended, visibleAlpha)
            else
                    extended.visibleAlpha = requestedAlpha
                    extendedSetAlpha(extended, visibleAlpha)
                    PlatesFading[plate] = nil
            end
	end
        
        -- OnUpdate; This function is run frequently, on every clock cycle
	function OnUpdate(self, e)
		-- Poll Loop
               local plate, curChildren
                
		for plate in pairs(PlatesVisible) do
			local UpdateMe = plate.UpdateMe
			
			-- Alpha
			if (HasTarget) then 
				plate.alpha = PlateGetAlpha(plate)
                                if not ExclusiveMode then PlateSetAlpha(plate, 1) end
			end

			if HighlightIsShown(plate.extended.regions.highlight) then
				if not plate.isMouseover then
					plate.isMouseover = true
					UpdateMe = true
				end
			elseif plate.isMouseover then
				plate.isMouseover = false
				UpdateMe = true
			end
			
			if UpdateAll or UpdateMe then
				OnUpdateNameplate(plate)
			end
			
			plate.UpdateMe = false
		end
		
		-- Reset Mass-Update Flag
		UpdateAll = false

		-- Fade-In Loop
		for plate in pairs(PlatesFading) do
			UpdateNameplateFade(plate)
		end
		
		--------------------------------------------------------------------------------------------------------
		-- Detect New Nameplates
		--------------------------------------------------------------------------------------------------------
		curChildren = select('#', WorldFrame:GetChildren())
		if numChildren ~= curChildren then
			local i, f
			for i = 1, curChildren do
			    f = select(i, WorldFrame:GetChildren())
			    
				   if not Plates[f] and IsNameplate(f) then
						 OnNewNameplate(f)
				   end
			    
			end
			numChildren = curChildren
		end

	end

end

---------------------------------------------------------------------------------------------------------------------
--  Nameplate Extension: Applies scripts, hooks, and adds additional frame variables and regions
---------------------------------------------------------------------------------------------------------------------
do
	local PlateCount = 0
	local CachePlateFunctions = true
	
	-- ApplyPlateExtesion
	function OnNewNameplate(plate)
		local bars, regions, health, castbar, healthbar, visual
		
          PlateCount = PlateCount + 1
		Plates[plate] = true
                
		-- Blizzard Bars
		local bargroup, namegroup = plate:GetChildren()

          -- Tidy Plates Frame
		if ExclusiveMode then 
			plate.extended = CreateFrame("Frame", nil, WorldFrame)
		else
			plate.extended = CreateFrame("Frame", nil, plate)		-- bargroup vs plate
		end
		
		plate.extended.BarGroup = plate:GetChildren()
		local extended = plate.extended
		extended.PlateParent = plate
		extended:SetFrameStrata("BACKGROUND")
		extended.PlateLevel = mod(PlateCount*2, 100)
		
		-- Unit Data, Cache, Widget Tables
		extended.style, extended.unit, extended.unitcache = {}, {}, {}
		extended.stylecache, extended.widgets = {}, {}
		extended.regions, extended.bars, extended.visual = {}, {}, {}
		extended.stylename = ""
		regions = extended.regions
		bars = extended.bars
                
		-- Blizzard References
		bars.health, bars.cast = bargroup:GetChildren()
		health, cast = bars.health, bars.cast		                    -- Blizzard bars
                extended.BarGroup = bargroup

		-- Regions
		regions.threatglow, regions.healthborder, regions.highlight, 
		regions.level, regions.skullicon, regions.raidicon, regions.eliteicon 
			= bargroup:GetRegions()
			
				
		regions.name
			= namegroup:GetRegions()
			
		regions.castborder, regions.castnostop, regions.spellicon, regions.spelltext, regions.spellshadow
			= select(2, cast:GetRegions())

		-- This block makes the Blizz nameplate invisible           -- Do not reuse objects; Other nameplate addons may depend on this data
		regions.threatglow:SetTexture(nil)     
		--regions.healthborder:SetTexCoord( 0, 0, 0, 0 )   
		regions.healthborder:Hide()                   		
		regions.castborder:SetTexture(nil)
		regions.castnostop:SetTexture(nil)
		regions.skullicon:SetTexture(nil)       
		regions.eliteicon:SetTexture(nil)       
		regions.name:Hide()                   
		                 
		regions.level:SetWidth( 000.1 )                     
		regions.level:Hide()                    
		regions.spellicon:SetTexCoord( 0, 0, 0, 0 )         
		regions.spellicon:SetWidth(.001)
		regions.raidicon:SetAlpha( 0 )                      
		regions.highlight:SetTexture(nil)
		
		regions.spellshadow:SetTexture(nil)
		regions.spellshadow:Hide()
		regions.spelltext:Hide()
		
		bars.health:SetStatusBarTexture(EMPTY_TEXTURE)
		bars.cast:SetStatusBarTexture(EMPTY_TEXTURE)
		if ExclusiveMode then
			bars.health:Hide()
		end
          
          -- Anchoring
          extended.PlateAnchor = bargroup                                       -- Anchor Tidy Plates' Frame to the Health Bar/Statusbar                         -- STAGE 1

          -- Add Independent Graphical Elements
		-- Create Statusbars: Uses custom statusbar solution to avoid some Blizz template issues
		bars.healthbar = CreateTidyPlatesStatusbar(extended)        
		bars.castbar = CreateTidyPlatesStatusbar(extended)
		health, cast, healthbar, castbar = bars.health, bars.cast, bars.healthbar, bars.castbar                
		healthbar:SetFrameStrata("BACKGROUND")
		castbar:SetFrameStrata("BACKGROUND")
		visual = extended.visual
                
		-- Health Bar/Lowest Frame
		visual.healthborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.threatborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.highlight = healthbar:CreateTexture(nil, "OVERLAY")
		-- Extended/Tidy Plates Root Frame
		visual.raidicon = extended:CreateTexture(nil, "ARTWORK")
		visual.eliteicon = extended:CreateTexture(nil, "OVERLAY")
		visual.skullicon = extended:CreateTexture(nil, "OVERLAY")
		visual.target = extended:CreateTexture(nil, "BACKGROUND")       -- ARTWORK
		-- Cast Bar Frame
		visual.castborder = castbar:CreateTexture(nil, "ARTWORK")
		visual.castnostop = castbar:CreateTexture(nil, "ARTWORK")
		visual.spellicon = castbar:CreateTexture(nil, "OVERLAY")
		-- Some extra fun stuff
		visual.raidicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")	
		visual.highlight:SetAllPoints(visual.healthborder)
		visual.highlight:SetBlendMode("ADD")                
		for i, v in pairs(visual) do v:SetNonBlocking(true) end

		-- Health Bar Texture
		visual.customtext = extended:CreateFontString(nil, "OVERLAY")
		visual.name  = extended:CreateFontString(nil, "OVERLAY")
		visual.level = extended:CreateFontString(nil, "OVERLAY")
		
		-- Cast Bar Text
		visual.spelltext = castbar:CreateFontString(nil, "OVERLAY")
		
		-- Defaault Fonts
		visual.customtext:SetFont(NAMEPLATE_FONT, 12, "NONE")
		visual.name:SetFont(NAMEPLATE_FONT, 12, "NONE")
		visual.level:SetFont(NAMEPLATE_FONT, 12, "NONE")
		visual.spelltext:SetFont(NAMEPLATE_FONT, 12, "NONE")
		
		healthbar, castbar = bars.healthbar, bars.castbar	-- Tidy Plates bars
		castbar:Hide()
		castbar:SetStatusBarColor(1,.8,0)

                
		extended.parentPlate = plate
		health.parentPlate = plate
		cast.parentPlate = plate
		castbar.parentPlate = plate

		healthbar:SetFrameLevel(0)
		extended:SetFrameLevel(0)
		castbar:SetFrameLevel(0)
                
          -- Make local references of certain nameplate functions
          if CachePlateFunctions then
			PlateSetAlpha = plate.SetAlpha
			PlateGetAlpha = plate.GetAlpha
			extendedSetAlpha = plate.extended.SetAlpha
			extendedSetScale = plate.extended.SetScale  	-- ScaleFade
			HighlightIsShown = plate.extended.visual.highlight.IsShown
                        CachePlateFunctions = false
		end
   
   		-- Hook for Updates	
		plate:HookScript("OnShow", OnShowNameplate )
		plate:HookScript("OnHide", OnHideNameplate )
		
		-- In 6.9.9, the 'health' object was hooked for OnShow and OnHide
		-- In 6.10, this has been changed to plate, to allow us to hide 'health' to gain some FPS
		
		health:HookScript("OnValueChanged", OnHealthUpdate) 
		health:HookScript("OnMinMaxChanged", OnHealthUpdate)
		
		cast:HookScript("OnShow", UpdateIndicator_ShowCastBar)
		cast:HookScript("OnHide", UpdateIndicator_HideCastBar)
		cast:HookScript("OnValueChanged", UpdateIndicator_UpdateCastBar)
		
		OnShowNameplate(plate)
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
	-- Create/Hide/Show Events
	---------------------------------------------------------------------------------------------------------------------	
	
	-- OnShowNameplate
	function OnShowNameplate(plate)
		UpdateReferences(plate)
		
		PlatesVisible[plate] = true
		wipe(extended.unit)
		wipe(extended.unitcache)
		
		unit.frame = extended
		unit.alpha = 1
		unit.isTarget = false
		unit.isMouseover = false
		extended.unitcache = ClearIndices(extended.unitcache)				
		extended.stylename = ""	
		extended.Active = true
		
		-- For Fading In
		PlatesFading[plate] = EnableFadeIn
		extended.requestedAlpha = 0
		extended.visibleAlpha = 0
		extended:SetAlpha(0)
          extended:Hide()		-- Yes, it seems counterintuitive, but 
		
		-- Graphics
		unit.isCasting = false
		bars.castbar:Hide()
		visual.highlight:Hide()
		regions.highlight:Hide()

		-- Widgets/Extensions
		if activetheme.OnInitialize then activetheme.OnInitialize(extended) end	

		-- Initial Data Gather
		UpdateUnitIdentity()
		UpdateUnitContext(plate)
		ProcessUnitChanges()
		
		plate.UpdateMe = true
	end

	
	-- OnHideNameplate
	function OnHideNameplate(plate)		
		plate.extended:Hide()
		UpdateReferences(plate)
		
		extended.Active = false
		
		PlatesVisible[plate] = nil
		if unit.guid then GUID[unit.guid] = nil end
		
		bars.castbar:Hide()	
		bars.castbar:SetScript("OnUpdate", nil)
		unit.isCasting = false
		
		-- Remove anything from the function queue
		plate.UpdateMe = false
		
		for widgetname, widget in pairs(extended.widgets) do widget:Hide() end
		if plate == CurrentTarget then CurrentTarget = nil end
	end
	
	
	-- OnUpdateNameplate
	function OnUpdateNameplate(plate)		
		--if not plate:IsShown() then extended:Hide();  print(unit.name, "UU"); return end	
		
		-- Gather Information
		UpdateReferences(plate)
		UpdateUnitIdentity()
		UpdateUnitContext(plate)
		
		ProcessUnitChanges()
		
		-- Keep Regions Hidden
		regions.level:Hide()
	end
        
	-- OnHealthUpdate
	function OnHealthUpdate(source)
		UpdateUnitCondition(source.parentPlate)
		ProcessUnitChanges()
		UpdateIndicator_HealthBar()		-- Just to be on the safe side
	end
	
     -- OnResetNameplate
	function OnResetNameplate(plate)
		local extended = plate.extended
		plate.UpdateMe = true
		extended.unitcache = ClearIndices(extended.unitcache)				
		extended.stylename = ""
		OnShowNameplate(plate)
	end
        
end


---------------------------------------------------------------------------------------------------------------------
--  Unit Updates: Updates Unit Data, Requests indicator updates
---------------------------------------------------------------------------------------------------------------------
do
	-- Raid Icon Lookup table
	local RaidIconCoordinate = { --from GetTexCoord. input is ULx and ULy (first 2 values).
		[0]		= { [0]		= "STAR", [0.25]	= "MOON", },
		[0.25]	= { [0]		= "CIRCLE", [0.25]	= "SQUARE",	},
		[0.5]	= { [0]		= "DIAMOND", [0.25]	= "CROSS", },
		[0.75]	= { [0]		= "TRIANGLE", [0.25]	= "SKULL", }, }

	-- ColorToString: Converts a color to a string with a C- prefix (For Color Lookup)
	local function ColorToString(r,g,b) return "C"..math.floor((100*r) + 0.5)..math.floor((100*g) + 0.5)..math.floor((100*b) + 0.5) end
	
	
	-- Class Color Lookup Table
	local ClassReference = {}
	do	
		for classname, color in pairs(RAID_CLASS_COLORS) do 
			local r, g, b = color.r, color.g, color.b
			local colorstring = ColorToString(r, g, b)
			ClassReference[colorstring] = classname 
		end
		ClassReference["C010060"] = "MONK"
	end
	
	-- GetUnitCombatStatus: Determines if a unit is in combat by checking the name text color
	local function GetUnitCombatStatus(r, g, b) return (r > .5 and g < .5) end
	
	-- GetUnitAggroStatus: Determines if a unit is attacking, by looking at aggro glow region
	local function GetUnitAggroStatus( threatRegion )
		if not  threatRegion:IsShown() then return "LOW", 0 end
		local red, green, blue = threatRegion:GetVertexColor()
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
	
	-- UpdateUnitIdentity: Updates Low-volatility Unit Data
	function UpdateUnitIdentity()
		unit.name = regions.name:GetText()
		unit.isBoss = regions.skullicon:IsShown()
		unit.isDangerous = unit.isBoss
		unit.isElite = (regions.eliteicon:IsShown() or 0) == 1
		
		if extended.BarGroup:GetScale() > .9 then 
			unit.platetype = 1 
			unit.isTrivial = false
		else 
			unit.platetype = 2 
			unit.isTrivial = true
		end
				
		if unit.isBoss then 
			unit.level = "??"
			unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue = 1, 0, 0
		else 
			unit.level = regions.level:GetText() 
			unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue = regions.level:GetTextColor()
		end
	end

        -- UpdateUnitContext: Updates Target/Mouseover
	function UpdateUnitContext(plate)
		--if not plate:IsShown() then extended:Hide(); print(unit.name, "UX"); return end	
		
		UpdateReferences(plate)
		
		unit.isMouseover = plate.isMouseover
		if HasTarget then unit.alpha = plate.alpha else unit.alpha = 1 end
		
		-- Context Indicators
		unit.isMouseover = (regions.highlight:IsShown() == 1)
		unit.isTarget = HasTarget and unit.alpha == 1
		
		if unit.isMouseover then
			visual.highlight:Show()
			if (not unit.guid) then 
				unit.guid = UnitGUID("mouseover") 
				if unit.guid then GUID[unit.guid] = plate end
			end
		else visual.highlight:Hide() end
		
		if unit.isTarget then 
			CurrentTarget = plate
			if not unit.guid then
				-- UpdateCurrentGUID
				unit.guid = UnitGUID("target") 
				if unit.guid then GUID[unit.guid] = plate end
			end
		end
		
		UpdateUnitCondition(plate)	-- This updates a bunch of properties
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- UpdateUnitCondition: High volatility data
	function UpdateUnitCondition(plate)
		--if not plate:IsShown() then extended:Hide(); print(unit.name, "UC"); return end	
		
		UpdateReferences(plate)
                
		if InCombat then unit.threatSituation, unit.threatValue = GetUnitAggroStatus(regions.threatglow)
		else unit.threatSituation = "LOW"; unit.threatValue = 0 end
                
		unit.red, unit.green, unit.blue = bars.health:GetStatusBarColor()
		
		unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
		unit.isInCombat = GetUnitCombatStatus(regions.name:GetTextColor())
		unit.class = ClassReference[ColorToString(unit.red, unit.green, unit.blue)] or "UNKNOWN"

		unit.health = bars.health:GetValue() or 0
		unit.healthmax = select(2, bars.health:GetMinMaxValues())

		unit.isMarked = regions.raidicon:IsShown() or false
		
		if unit.isMarked then 
			local ux, uy = regions.raidicon:GetTexCoord()
			unit.raidIcon = RaidIconCoordinate[ux][uy]
		else unit.raidIcon = nil end
		
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
		bars.healthbar:SetMinMaxValues(bars.health:GetMinMaxValues())
		bars.healthbar:SetValue(bars.health:GetValue())
	end
	
	
	-- UpdateIndicator_Name: 
	function UpdateIndicator_Name() 
		visual.name:SetText(unit.name)	
		-- Name Color
		if activetheme.SetNameColor then
			visual.name:SetTextColor(activetheme.SetNameColor(unit))
		else visual.name:SetTextColor(1,1,1,1) end
		--if activetheme.SetStatusbarWidthMatching then MatchTextWidth() end
	end
	
	
	-- UpdateIndicator_Level:
	function UpdateIndicator_Level() 
		visual.level:SetText(unit.level)
		local tr, tg, tb = regions.level:GetTextColor()
		visual.level:SetTextColor(tr, tg, tb)
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
	end
	
	
	-- UpdateIndicator_RaidIcon
	function UpdateIndicator_RaidIcon() 
		if unit.isMarked and style.raidicon.show then 
			visual.raidicon:Show()
			visual.raidicon:SetTexCoord(regions.raidicon:GetTexCoord()) 
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
			bars.healthbar:SetAllColors(activetheme.SetHealthbarColor(unit))
		else bars.healthbar:SetStatusBarColor(bars.health:GetStatusBarColor()) end
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
                    
		if not PlatesFading[nameplate] then
			extended:SetAlpha(extended.requestedAlpha)
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
	
	
    -- UpdateIndicator_UpdateCastBar
	function UpdateIndicator_UpdateCastBar(bar)
		UpdateReferences(bar.parentPlate)
		local castbar = bars.castbar
		local r, g, b, a = 1, .8, 0, 1
		
		unit.isCasting = true
		if regions.spelltext then unit.spellName = regions.spelltext:GetText() end
		unit.spellIsShielded = regions.castnostop:IsShown()
		unit.spellInterruptible = not unit.spellIsShielded
		
		if activetheme.SetCastbarColor then  
			r, g, b, a = activetheme.SetCastbarColor(unit)  
			if not (r and g and b) then return end
		end	
		
		castbar:SetValue( bar:GetValue())
		castbar:SetMinMaxValues(bar:GetMinMaxValues())
		castbar:SetStatusBarColor( r, g, b, a or 1)
		
		visual.spelltext:SetText(unit.spellName)

		visual.spellicon:SetTexture(regions.spellicon:GetTexture())

		if unit.spellIsShielded then 
			   visual.castnostop:Show(); visual.castborder:Hide()
		else visual.castnostop:Hide(); visual.castborder:Show() end
	end
	
	
	-- UpdateIndicator_ShowCastBar
	function UpdateIndicator_ShowCastBar(bar)
		local castbar = bar.parentPlate.extended.bars.castbar
		
		unit.isCasting = true
		UpdateIndicator_UpdateCastBar(bar)
		castbar:Show()
		regions.spellshadow:Hide()
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()
	end
	
	
	-- UpdateIndicator_HideCastBar
	function UpdateIndicator_HideCastBar(bar)
		local castbar = bar.parentPlate.extended.bars.castbar
		castbar:Hide()
		unit.isCasting = false
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()
	end

end -- End Indicator section


--------------------------------------------------------------------------------------------------------------
-- VIII. WoW Event Handlers: sends event-driven changes to the appropriate gather/update handler.
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
	function events:PLAYER_ENTERING_WORLD() TidyPlatesCore:SetScript("OnUpdate", OnUpdate); end
	function events:PLAYER_REGEN_ENABLED() InCombat = false; SetUpdateAll(OnUpdateNameplate) end
	function events:PLAYER_REGEN_DISABLED() InCombat = true; SetUpdateAll(OnUpdateNameplate) end
	
	function events:PLAYER_TARGET_CHANGED()
		HasTarget = UnitExists("target") == 1 -- Must be bool, never nil!
		if (not HasTarget) then CurrentTarget = nil end
		SetUpdateAll(OnUpdateNameplate)
	end
	
	function events:RAID_TARGET_UPDATE() SetUpdateAll(OnUpdateNameplate) end
	function events:UNIT_THREAT_SITUATION_UPDATE() SetUpdateAll(OnUpdateNameplate) end  -- Only fired when a target changes
	function events:UNIT_LEVEL() SetUpdateAll(OnUpdateNameplate) end
	function events:PLAYER_CONTROL_LOST() ForEachPlate(OnUpdateNameplate) end
	events.PLAYER_CONTROL_GAINED = events.PLAYER_CONTROL_LOST
	events.UNIT_FACTION = events.PLAYER_CONTROL_LOST	

	-- Registration of Blizzard Events
	for eventname in pairs(events) do TidyPlatesCore:RegisterEvent(eventname) end	
	--TidyPlates.TidyPlatesCore = TidyPlatesCore
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
		SetAnchorGroupObject(extended, style.frame, extended.PlateAnchor)
                
		-- Anchorgroup
		for index = 1, #anchorgroup do 
			objectname = anchorgroup[index]; SetAnchorGroupObject(visual[objectname], style[objectname], extended) 
			objectenable = style[objectname].show
			if objectenable then visual[objectname]:Show() else visual[objectname]:Hide() end
		end
		-- Bars
		for index = 1, #bargroup do objectname = bargroup[index]; SetBarGroupObject(bars[objectname], style[objectname], extended) end
		-- Texture
		for index = 1, #texturegroup do objectname = texturegroup[index]; SetTextureGroupObject(visual[objectname], style[objectname]) end
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
-- IX. External Commands: Allows widgets and themes to request updates to the plates.
-- Useful to make a theme respond to externally-captured data (such as the combat log)
--------------------------------------------------------------------------------------------------------------
function TidyPlates:ForceUpdate() ForEachPlate(OnResetNameplate) end
function TidyPlates:Update() SetUpdateAll(OnUpdateNameplate) end
function TidyPlates:RequestWidgetUpdate(plate) if plate then SetPlateQueue(plate) else SetUpdateAll(OnUpdateNameplate) end end
function TidyPlates:RequestDelegateUpdate(plate) if plate then SetPlateQueue(plate) else SetUpdateAll(OnUpdateNameplate) end end
function TidyPlates:ActivateTheme(theme) if theme and type(theme) == 'table' then TidyPlates.ActiveThemeTable, activetheme = theme, theme; ResetPlates = true; end end
function TidyPlates:EnableFadeIn() EnableFadeIn = true; end
function TidyPlates:DisableFadeIn() EnableFadeIn = nil; end
function TidyPlates:EnableExclusiveMode() ExclusiveMode = true; end
TidyPlates.NameplatesByGUID, TidyPlates.NameplatesAll, TidyPlates.NameplatesByVisible = GUID, Plates, PlatesVisible





--[[

Detection Loop
    - Core Frame
    - Core Script OnUpdate
    - IsNameplate
    
Hooking Function
    - Plate Scripts
        - OnPlateShow
        - OnPlateHide
        - OnNewNameplate
    - HookPlate/OnNewNameplate
        - Add References to Base Plate
        - Call "OnShow" procedure
        - Plate Tables
            - UnitData
            - UnitCache
            - BlizPlate, BlizRegions, Components, 
    
Script Functions
    - OnFrameNew
    - OnFrameShow
    - OnFrameHide

Event Functions
    - OnUnitHealth
    - OnUnitContext
    - OnUnitIdentity
    - OnUnitCondition
    - * Compares each value to the cache, calls for updates

Indicator Functions

Styler Functions

External Interface

--]]









