-- Tidy Plates - SMILE! :-D
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- I. Variables and Global Functions
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
TidyPlates = {}
-- Local Function Copies (For speed)
local _
local select, pairs, tostring  = select, pairs, tostring 			    -- Local function copy
local WorldFrame, UIParent = WorldFrame, UIParent
local CreateTidyPlatesStatusbar = CreateTidyPlatesStatusbar			    -- Local function copy
local extendedSetAlpha, HighlightIsShown, HighlightSetAlpha			    -- Local function copy placeholders
local PlateSetAlpha, PlateGetAlpha						    -- Local function copy placeholders
--local PlateGetLeft, PlateGetBottom						    -- Local function copy placeholders
-- Internal Data
local Plates, PlatesVisible, PlatesFading, GUID = {}, {}, {}, {}	            -- Plate Lists
local massQueue, targetQueue = {}, {}		            -- Queue Lists
local nameplate, extended, bars, regions, visual				    -- Temp/Local References
local unit, unitcache, style, stylename, unitchanged				    -- Temp/Local References
local numChildren = -1                                                              -- Cache the current number of plates
local activetheme = {}                                                              -- Table Placeholder
local InCombat, HasTarget, CurrentTarget = false, false, nil                        -- Player State Data
local EnableFadeIn = true                                                           -- Enables Alpha Effects
local EMPTY_TEXTURE = "Interface\\Addons\\TidyPlates\\Media\\Empty"

---------------------------------------------------------------------------------------------------------------------
-- Internal Global Function Reference
---------------------------------------------------------------------------------------------------------------------
local function ClearIndices(t) if t then for i,v in pairs(t) do t[i] = nil end return t end end
local function IsPlateShown(plate) return plate and plate:IsShown() end
local function SetTargetQueue(plate, func) if func then targetQueue[plate] = func end end
local function SetMassQueue(func) if func then massQueue[func] = true end end
-- Indicator Functions
local UpdateIndicator_CustomScaleText, UpdateIndicator_Standard, UpdateIndicator_CustomAlpha
local UpdateIndicator_Level, UpdateIndicator_ThreatGlow, UpdateIndicator_RaidIcon
local UpdateIndicator_EliteIcon, UpdateIndicator_UnitColor, UpdateIndicator_Name
local UpdateIndicator_HealthBar
-- local UpdateHitboxShape
-- Event Functions
local Event_OnNewNameplate, Event_OnShowNameplate, Event_OnHideNameplate, Event_OnUpdateNameplate, Event_ResetNameplate, Event_EchoNewNameplate
local Event_HealthUpdate, Event_ThreatSituationUpdate
local Event_OnMouseover, Event_RequestWidgetUpdate, Event_RequestDelegateUpdate
-- Spell Casting

local UpdateIndicator_UpdateCastBar, UpdateIndicator_ShowCastBar, UpdateIndicator_HideCastBar

-- Main Loop 
local OnUpdate
local ApplyPlateExtension
local ForEachPlate  


local version, internalVersion, buildDate, tocVersion = GetBuildInfo()
local newVersion = (tocVersion >= 50300)
-- /run print((select(4, GetBuildInfo())));

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- II. Nameplate Styler: These functions parses the definition table for a nameplate's requested style.
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
local UpdateStyle
do
	-- Helper Declarations
	local SetFontGroupObject, SetAnchorGroupObject, SetTextureGroupObject, SetBarGroupObject
	-- UpdateStyle Variables
	local index, content
	local objectstyle, objectname, objectregion, objectenable
	-- Style Property Groups
	local fontgroup = {"name", "level", "spelltext", "customtext"}
	local anchorgroup = {"healthborder", "threatborder", "castborder", "castnostop",
						"name",  "spelltext", "customtext", "level",
						"spellicon", "raidicon", "skullicon", "eliteicon", "target"}		
	local bargroup = {"castbar", "healthbar"}
	local texturegroup = { "castborder", "castnostop", "healthborder", "threatborder", "eliteicon", 
						"skullicon", "highlight", "target", "spellicon", }
	-- UpdateStyle: 
	function UpdateStyle()
		-- Frame
		SetAnchorGroupObject(extended, style.frame, extended.PlateAnchor)                      -- STAGE 1
		--SetAnchorGroupObject(extended, style.frame, regions.name)                      -- STAGE 1
                
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
		--if activetheme.SetStatusbarWidthMatching then MatchTextWidth() end
	end
	
	-- Helper Functions
	local function SetObjectShape(object, width, height) object:SetWidth(width); object:SetHeight(height) end
	local function SetObjectFont(object,  font, size, flags) if not object:SetFont(font, size, flags) then object:SetFont("FONTS\\ARIALN.TTF", size or 12, flags) end end
	local function SetObjectJustify(object, horz, vert) object:SetJustifyH(horz); object:SetJustifyV(vert) end
	local function SetObjectAnchor(object, anchor, anchorTo, x, y) object:ClearAllPoints();object:SetPoint(anchor, anchorTo, anchor, x, y) end
	local function SetObjectTexture(object, texture) object:SetTexture(texture) end 
	local function SetObjectBartexture(obj, tex, ori, crop) obj:SetStatusBarTexture(tex); obj:SetOrientation(ori); end
	local function SetObjectShadow(object, shadow) if shadow then
	    object:SetShadowColor(0,0,0, tonumber(shadow) or 1); object:SetShadowOffset(.5, -.5)
				 else object:SetShadowColor(0,0,0,0) end
	end
	
	-- SetFontGroupObject
	function SetFontGroupObject(object, objectstyle)
		if objectstyle then
			SetObjectFont(object, objectstyle.typeface or "FONTS\\ARIALN.TTF",  objectstyle.size or 12, objectstyle.flags or "NONE")
			SetObjectJustify(object, objectstyle.align or "CENTER", objectstyle.vertical or "BOTTOM")
			SetObjectShadow(object, objectstyle.shadow or 1)
		end
	end
	-- SetAnchorGroupObject
	function SetAnchorGroupObject(object, objectstyle, anchorTo)
		if objectstyle and anchorTo then
			SetObjectShape(object, objectstyle.width or 128, objectstyle.height or 16) --end
			SetObjectAnchor(object, objectstyle.anchor or "CENTER", anchorTo, objectstyle.x or 0, objectstyle.y or 0)
		end
	end
	-- SetTextureGroupObject
	function SetTextureGroupObject(object, objectstyle)
		if objectstyle then
			if objectstyle.texture then SetObjectTexture(object, objectstyle.texture or EMPTY_TEXTURE) end
			object:SetTexCoord(objectstyle.left or 0, objectstyle.right or 1, objectstyle.top or 0, objectstyle.bottom or 1)
		end
	end
	-- SetBarGroupObject
	function SetBarGroupObject(object, objectstyle, anchorTo)
		if objectstyle then
			SetAnchorGroupObject(object, objectstyle, anchorTo)
			SetObjectBartexture(object, objectstyle.texture or EMPTY_TEXTURE, objectstyle.orientation or "HORIZONTAL")
			if objectstyle.backdrop then
				object:SetBackdropTexture(objectstyle.backdrop)
			end
			object:SetTexCoord(objectstyle.left, objectstyle.right, objectstyle.top, objectstyle.bottom)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- III. Indicators: These functions update the color, texture, strings, and frames within a style.
---------------------------------------------------------------------------------------------------------------------
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
		else extended.requestedAlpha = unit.alpha or 1 end
			
                if extended.requestedAlpha == 0 then extended:Hide()        -- FRAME HIDE TEST
                else extended:Show() end
                    
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
	-- UpdateIndicator_CustomScaleText: Updates the custom indicators (text, image, alpha, scale)
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
		if newVersion then unit.spellName = regions.spelltext:GetText() end
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
	
	function UpdateIndicator_ShowCastBar(bar)
		local castbar = bar.parentPlate.extended.bars.castbar
		
		unit.isCasting = true
		UpdateIndicator_UpdateCastBar(bar)
		castbar:Show()
		if newVersion then regions.spellshadow:Hide() end
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()
	end
	
	function UpdateIndicator_HideCastBar(bar)
		local castbar = bar.parentPlate.extended.bars.castbar
		castbar:Hide()
		unit.isCasting = false
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()
	end

end -- End Indicator section



do
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	-- IV. Data Gathering
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

	-- UpdateUnitCache
	local function UpdateUnitCache() for key, value in pairs(unit) do unitcache[key] = value end end
	-- UpdateReferences
	function UpdateReferences(plate)
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

		
	-- ColorToString: Converts a color to a string with a C- prefix
	local function ColorToString(r,g,b) return "C"..math.floor((100*r) + 0.5)..math.floor((100*g) + 0.5)..math.floor((100*b) + 0.5) end
	--local function ColorToString(r,g,b) return "C"..floor(100*r)..floor(100*g)..floor(100*b) end
	-- GetUnitCombatStatus: Determines if a unit is in combat by checking the name text color
	local function GetUnitCombatStatus(r, g, b) return (r > .5 and g < .5) end
	-- GetUnitAggroStatus: Determines if a unit is attacking, by looking at aggro glow region
	local GetUnitAggroStatus
	do
		local shown 
		local red, green, blue
		function GetUnitAggroStatus( region)
			-- High = 1, 0, 0	-- Medium High = 1, .6, 0  -- Medium Low = 1, 1, .47
			shown = region:IsShown()
			if not shown then return "LOW", 0 end
			red, green, blue = region:GetVertexColor()
			if red > 0 then
				if green > 0 then
					if blue > 0 then return "MEDIUM", 1 end
					return "MEDIUM", 2
				end
				return "HIGH", 3
			end
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
        
	-- Raid Icon Lookup table
	local ux, uy
	local RaidIconCoordinate = { --from GetTexCoord. input is ULx and ULy (first 2 values).
		[0]		= { [0]		= "STAR", [0.25]	= "MOON", },
		[0.25]	= { [0]		= "CIRCLE", [0.25]	= "SQUARE",	},
		[0.5]	= { [0]		= "DIAMOND", [0.25]	= "CROSS", },
		[0.75]	= { [0]		= "TRIANGLE", [0.25]	= "SKULL", }, }
	
	-- Populates the class color lookup table
	local ClassReference = {}	
	for classname, color in pairs(RAID_CLASS_COLORS) do 
		local r, g, b = color.r, color.g, color.b
		local colorstring = ColorToString(r, g, b)
		ClassReference[colorstring] = classname 
	end
	ClassReference["C010060"] = "MONK"

	---------------------------------------------------------------------------------------------------------------------
	-- Mass Data-Gather Functions:  Called during big changes to a nameplate's status
	---------------------------------------------------------------------------------------------------------------------
	local function GatherData_Alpha(plate)
          if extended.BarGroup:GetScale() > .9 then unit.platetype = 1 else unit.platetype = 2 end
		if HasTarget then unit.alpha = plate.alpha else unit.alpha = 1 end	-- Active Alpha

		unit.isTarget = HasTarget and unit.alpha == 1
		unit.isMouseover = (regions.highlight:IsShown() == 1)
		
		-- GUID
		if unit.isTarget then 
			CurrentTarget = plate
			if not unit.guid then
				-- UpdateCurrentGUID
				unit.guid = UnitGUID("target") 
				if unit.guid then GUID[unit.guid] = plate end
			end
		--else
		--	extended:SetFrameLevel(0)
		end
		
		UpdateIndicator_Target()
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
	end
	
	-- GatherData_BasicInfo: Updates Unit Variables
	local function GatherData_BasicInfo()
		unit.name = regions.name:GetText()
		unit.isBoss = regions.skullicon:IsShown()
		unit.isDangerous = unit.isBoss
		unit.isElite = (regions.eliteicon:IsShown() or 0) == 1
		
		if unit.isBoss then 
			unit.level = "??"
			unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue = 1, 0, 0
		else 
			unit.level = regions.level:GetText() 
			unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue = regions.level:GetTextColor()
		end
		
		unit.health = bars.health:GetValue() or 0
		unit.healthmax = select(2, bars.health:GetMinMaxValues())
		
		if InCombat then
			unit.threatSituation, unit.threatValue = GetUnitAggroStatus(regions.threatglow) 
		else unit.threatSituation = "LOW"; unit.threatValue = 0 end

		unit.isMarked = regions.raidicon:IsShown() or false
		unit.isInCombat = GetUnitCombatStatus(regions.name:GetTextColor())
		unit.red, unit.green, unit.blue = bars.health:GetStatusBarColor()
		unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
		unit.class = ClassReference[ColorToString(unit.red, unit.green, unit.blue)] or "UNKNOWN"
		unit.InCombatLockdown = InCombat
		
		if unit.isMarked then 
			ux, uy = regions.raidicon:GetTexCoord()
			unit.raidIcon = RaidIconCoordinate[ux][uy]
		else unit.raidIcon = nil end
	end
	
	
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- I. Nameplate Extension Init: Applies scripts, hooks, and adds additional frame variables and elements
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

do
	local bars, regions, health, castbar, healthbar, visual
	local CreateGraphicalElements
	local PlateCount = 0
	local CachePlateFunctions = true
	
	function ApplyPlateExtension(plate)
          PlateCount = PlateCount + 1
		Plates[plate] = true
  
		-- Blizzard Bar Reference
		local barGroup, namegroup = plate:GetChildren()
		healthBar, castBar = barGroup:GetChildren()
          
		-- Regions
		threatglowRegion, healthborderRegion, highlightRegion, levelRegion, skulliconRegion, raidiconRegion, eliteiconRegion 
			= barGroup:GetRegions()
				
		nameRegion
			= namegroup:GetRegions()
			
		castborderRegion, castnostopRegion, spelliconRegion, spelltextRegion, spellshadowRegion
			= select(2, cast:GetRegions())

		-- This block makes the Blizz nameplate invisible
		-- Do not reuse objects; Other nameplate addons may depend on this data
		threatglowRegion:SetTexture(nil)     
		healthborderRegion:Hide()                   		
		castborderRegion:SetTexture(nil)
		castnostopRegion:SetTexture(nil)
		skulliconRegion:SetTexture(nil)       
		eliteiconRegion:SetTexture(nil)       
		nameRegion:Hide()                                    
		levelRegion:Hide()                    
		spelliconRegion:SetTexCoord( 0, 0, 0, 0 )         
		raidiconRegion:SetAlpha( 0 )                      
		highlightRegion:SetTexture(nil)
		if spellshadowRegion and spelltextRegion then
			regions.spellshadow:Hide()
			regions.spelltext:Hide()  
		end
		bars.health:SetStatusBarTexture(EMPTY_TEXTURE)
		--bars.health:Hide()
		bars.cast:SetStatusBarTexture(EMPTY_TEXTURE)
		          
          -- Anchoring
          extended.PlateAnchor = barGroup                                       -- Anchor Tidy Plates' Frame to the Health Bar/Statusbar                         -- STAGE 1

		--[[
				-- Blizzard Bar Reference
		local barGroup, namegroup = plate:GetChildren()
		healthBar, castBar = barGroup:GetChildren()
          
		-- Regions
		threatglowRegion, healthborderRegion, highlightRegion, levelRegion, skulliconRegion, raidiconRegion, eliteiconRegion 
			= barGroup:GetRegions()
				
		nameRegion
			= namegroup:GetRegions()
			
		castborderRegion, castnostopRegion, spelliconRegion, spelltextRegion, spellshadowRegion
			= select(2, cast:GetRegions())
			--]]
			
		-- Tidy Plates Frame
		local frame = CreateFrame("Frame", nil, WorldFrame)
		TidyPlatesFrame:SetFrameStrata("BACKGROUND")
		
		plate.TidyPlatesFrame = frame
		plate.extended = frame	-- Compatibility; Eventually, I'd like to remove the 'extended' pointer
		frame.Plate = plate
		frame.BarGroup = barGroup

		-- Unit, Cache, Widget Tables
		frame.style, frame.unit, frame.unitcache = {}, {}, {}
		frame.stylecache, frame.widgets = {}, {}
		frame.regions, frame.bars, frame.visual = {}, {}, {}
		frame.stylename = ""
		
		regions = extended.regions
		bars = extended.bars
		
          -- Add Independent Graphical Elements
		-- Create Statusbars: Uses custom statusbar solution to avoid some Blizz template issues
		local newHealthBar = CreateTidyPlatesStatusbar(extended)        
		local newCastBar = CreateTidyPlatesStatusbar(extended)
		
		newHealthBar:SetFrameStrata("BACKGROUND")
		newCastBar:SetFrameStrata("BACKGROUND")
		
		local visual = {                
				-- Health Bar/Lowest Frame
				["healthborder"] = healthbar:CreateTexture(nil, "ARTWORK"),
				["threatborder"] = healthbar:CreateTexture(nil, "ARTWORK"),
				["highlight"] = healthbar:CreateTexture(nil, "OVERLAY"),
				-- Extended/Tidy Plates Root Frame
				["raidicon"] = extended:CreateTexture(nil, "ARTWORK"),
				["eliteicon"] = extended:CreateTexture(nil, "OVERLAY"),
				["skullicon"] = extended:CreateTexture(nil, "OVERLAY"),
				["target"] = extended:CreateTexture(nil, "BACKGROUND"),       -- ARTWORK
				-- Cast Bar Frame
				["castborder"] = castbar:CreateTexture(nil, "ARTWORK"),
				["castnostop"] = castbar:CreateTexture(nil, "ARTWORK"),
				["spellicon"] = castbar:CreateTexture(nil, "OVERLAY"),
				-- Some extra fun stuff
				--["raidicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")	
				--["highlight:SetAllPoints(visual.healthborder)
				--["highlight:SetBlendMode("ADD")                
			

				["customtext"] = extended:CreateFontString(nil, "OVERLAY"),
				["name"]  = extended:CreateFontString(nil, "OVERLAY"),
				["level"] = extended:CreateFontString(nil, "OVERLAY"),
			}
		
		-- for i, v in pairs(visual) do v:SetNonBlocking(true) end
		
		-- Cast Bar Frame
		visual.spelltext = castbar:CreateFontString(nil, "OVERLAY")
		
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
   
		Event_OnNewNameplate(plate)
	end
        

		
end


	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	-- V. Nameplate Event Handling: Handles OnCreate and OnShow events, gathers information  
	-- about the unit, and requests updates.
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
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
		--UpdateHitboxShape()
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
			if unitchanged then
				CheckNameplateStyle()
				UpdateIndicator_Standard()
				UpdateIndicator_HealthBar()
			end
			
			-- Update Widgets 
			if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
			
			-- Update Delegates
			UpdateIndicator_Target()
			UpdateIndicator_ThreatGlow()
			UpdateIndicator_CustomAlpha()
			UpdateIndicator_CustomScaleText()
			
			-- Cache the old unit information
			UpdateUnitCache()
	end

	---------------------------------------------------------------------------------------------------------------------
	-- Prepare a nameplate for active duty; This is called for both New and Returning/Re-Shown nameplates
	---------------------------------------------------------------------------------------------------------------------
	local function PrepareNameplate(plate)
		GatherData_BasicInfo()
		unit.frame = extended
		unit.alpha = 1
		unit.isTarget = false
		unit.isMouseover = false
		extended.unitcache = ClearIndices(extended.unitcache)				
		extended.stylename = ""	
		
		-- For Fading In
		PlatesFading[plate] = EnableFadeIn
		extended.requestedAlpha = 0
		extended.visibleAlpha = 0
		extended:SetAlpha(0)
          extended:Hide()     -- FRAME HIDE TEST
		
		-- Graphics
		unit.isCasting = false
		bars.castbar:Hide()
		visual.highlight:Hide()
		regions.highlight:Hide()

		-- Widgets/Extensions
		if activetheme.OnInitialize then activetheme.OnInitialize(extended) end	
	end
        
	---------------------------------------------------------------------------------------------------------------------
	-- Create/Hide/Show Events
	---------------------------------------------------------------------------------------------------------------------	
	-- Event_OnHideNameplate
	function Event_OnHideNameplate(health)
		local plate = health.parentPlate
		plate.extended:Hide()
		UpdateReferences(plate)
		if unit.guid then GUID[unit.guid] = nil end
		--  UpdateIndicator_StopCastAnimation(plate) -- The following is an alternative, to reduce the processing required for cleanup...
		bars.castbar:Hide()	
		bars.castbar:SetScript("OnUpdate", nil)
		unit.isCasting = false

		PlatesVisible[plate] = nil
		extended.unit = ClearIndices(extended.unit)
		extended.unitcache = ClearIndices(extended.unitcache)
		for widgetname, widget in pairs(extended.widgets) do widget:Hide() end
		if plate == CurrentTarget then CurrentTarget = nil end
	end
	
	-- Event_EchoNewNameplate: Intended to reduce CPU by bypassing the full update, and only checking the alpha value
	local function Event_EchoNewNameplate(plate)
		if not plate:IsShown() then return end	
		-- Gather Information
		UpdateReferences(plate)
		GatherData_Alpha(plate)
		ProcessUnitChanges()
	end
    
	-- Event_OnNewNameplate: When a new nameplate is generated, this function hooks the appropriate functions
	function Event_OnNewNameplate(plate)
		--local health, cast = plate:GetChildren()
		UpdateReferences(plate)
		PrepareNameplate(plate)
		GatherData_BasicInfo()
		
		local health, cast = bars.health, bars.cast
		
		-- Alternative to reduce initial CPU load
		CheckNameplateStyle()
		UpdateIndicator_CustomAlpha()
			
		-- Hook for Updates	
		--plate:HookScript("OnShow", Event_OnShowNameplate )
		--plate:HookScript("OnHide", Event_OnHideNameplate)
		
		health:HookScript("OnShow", Event_OnShowNameplate )
		health:HookScript("OnHide", Event_OnHideNameplate)
		
		health:HookScript("OnValueChanged", Event_HealthUpdate) 
		health:HookScript("OnMinMaxChanged", Event_HealthUpdate)
		
		cast:HookScript("OnShow", UpdateIndicator_ShowCastBar)
		cast:HookScript("OnHide", UpdateIndicator_HideCastBar)
		cast:HookScript("OnValueChanged", UpdateIndicator_UpdateCastBar)
		
		-- Activates nameplate visibility
		PlatesVisible[plate] = true
		SetTargetQueue(plate, Event_EchoNewNameplate)		-- Echo for a partial update (alpha only)
	end
	
	-- Event_OnShowNameplate
	function Event_OnShowNameplate(health)
		local plate = health.parentPlate
		
		-- Activate Plate
		PlatesVisible[plate] = true
		UpdateReferences(plate)
		PrepareNameplate(plate)
		GatherData_BasicInfo()

		CheckNameplateStyle()
		UpdateIndicator_CustomAlpha()
		--UpdateHitboxShape()
		
		
		SetTargetQueue(plate, Event_OnUpdateNameplate)		-- Echo for a full update
	end

	-- Event_OnUpdateNameplate
	function Event_OnUpdateNameplate(plate)		
		if not plate:IsShown() then return end	
		-- Gather Information
		UpdateReferences(plate)
		GatherData_Alpha(plate)
		GatherData_BasicInfo()
		ProcessUnitChanges()
		
		-- Keep Regions Hidden
		regions.level:Hide()
	end
        
        -- Event_ResetNameplate
	function Event_ResetNameplate(plate)
		local extended = plate.extended
		extended.unitcache = ClearIndices(extended.unitcache)				
		extended.stylename = ""
		Event_OnShowNameplate(extended)
	end
        
        ---------------------------------------------------------------------------------------------------------------------
        -- Update on Specific Events
        ---------------------------------------------------------------------------------------------------------------------
        
	-- Event_OnMouseover
	-- Converting this function to be: UpdateUnitContext?
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        -- Event_OnMouseover
	function Event_OnMouseover(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		unit.isMouseover = (regions.highlight:IsShown() == 1)
		
		if unit.isMouseover then
			visual.highlight:Show()
			if (not unit.guid) then 
				unit.guid = UnitGUID("mouseover") 
				if unit.guid then GUID[unit.guid] = plate end
			end
		else visual.highlight:Hide() end
		
		Event_ThreatSituationUpdate(plate)	-- This updates a bunch of properties
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- Event_ThreatSituationUpdate
	-- Converting this function to be: UpdateUnitCondition
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	function Event_ThreatSituationUpdate(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
                
		if InCombat then unit.threatSituation, unit.threatValue = GetUnitAggroStatus(regions.threatglow)
		else unit.threatSituation = "LOW"; unit.threatValue = 0 end
                
		unit.red, unit.green, unit.blue = bars.health:GetStatusBarColor()
		
		unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
		unit.isInCombat = GetUnitCombatStatus(regions.name:GetTextColor())
		unit.class = ClassReference[ColorToString(unit.red, unit.green, unit.blue)] or "UNKNOWN"
				
		CheckNameplateStyle()
		UpdateIndicator_ThreatGlow()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
	end
	
	-- Event_RequestWidgetUpdate: Updates just the widgets
	function Event_RequestWidgetUpdate(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end
	
	-- Event_RequestDelegateUpdate: Updates just the delegate function indicators (excluding Style?)
	function Event_RequestDelegateUpdate(plate)
			if not IsPlateShown(plate) then return end
			UpdateReferences(plate)
			UpdateIndicator_ThreatGlow()
			UpdateIndicator_CustomAlpha()
			UpdateIndicator_CustomScaleText()
	end

	-- Event_HealthUpdate
	function Event_HealthUpdate(source)
		local plate = source.parentPlate
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		unit.health = bars.health:GetValue() or 0
		unit.healthmax = select(2,bars.health:GetMinMaxValues())
                
		UpdateIndicator_HealthBar()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
	end

end     --  End Nameplate Event Handling section


---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-- VII. World Update Functions: Refers new plates to 'ApplyPlateExtension()', watches for Alpha/Transparency
-- and Highlight/Mouseover changes and sends those changes to the appropriate handler, and processes
-- the update queue/echos.
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
do
	local plate, curChildren
	local WorldGetNumChildren, WorldGetChildren = WorldFrame.GetNumChildren, WorldFrame.GetChildren
	
        
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
			--if plate.extended:IsShown() then -- Plate and extended frame both explicitly visible      -- FRAME HIDE TEST
			if plate:IsShown() then -- Plate and extended frame both explicitly visible
				functionToRun(plate, ...)
			end
		end
	end

	-- Nameplate Fade-In
	local visibleAlpha, requestedAlpha
	local fadeInRate, fadeOutRate = .07, .2
	local function UpdateNameplateFade(plate)
		extended = plate.extended
		--if extended then
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
		--end
	end
        
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------	
-- OnUpdate: This function is processed every frame, and handles the Alpha Override, Highlight/Mouseover
-- Fade-In, Scale & Alpha Effects, and (most importantly) queueing of update events.
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
	local queuedFunction
	local HasMouseover, LastMouseover, CurrentMouseover
	local CurrentTime, PollTime, PollIndex = 0, 0, 0
	local elapsed = 0
	local uiscale = UIParent:GetEffectiveScale()
	
	function OnUpdate(self, e)

	-- [[
		HasMouseover = false

		--------------------------------------------------------------------------------------------------------
		-- For All Visible Nameplates ....
		--------------------------------------------------------------------------------------------------------
		-- Alpha - Highlight - Poll Loop
		for plate in pairs(PlatesVisible) do
			-- Alpha
			if (HasTarget) then 
				plate.alpha = PlateGetAlpha(plate)	
				--PlateSetAlpha(plate, 1) 			-- No need for this, since the plate frames are now independent
			end
			
			-- Mouseover/Highlight: CURSOR_UPDATE events are unreliable for GUID updates.  This provides a much better experience.
			--local highlightRegion = plate.extended.regions.highlight
			if HighlightIsShown(plate.extended.regions.highlight) then
				HasMouseover = true
				CurrentMouseover = plate
			end
				    
		end

		--------------------------------------------------------------------------------------------------------
		-- Fade/Animation Effects
		--------------------------------------------------------------------------------------------------------
		-- Fade-In Loop
		for plate in pairs(PlatesFading) do
			UpdateNameplateFade(plate)
		end
		
		--------------------------------------------------------------------------------------------------------
		-- Function Queue ....
		--------------------------------------------------------------------------------------------------------
		-- Process the Update Request Queues
		if massQueue[Event_ResetNameplate] then
			ForEachPlate(Event_ResetNameplate)
			for queuedFunction in pairs(massQueue) do massQueue[queuedFunction] = nil end
		else
                        
			-- Mass Update Queue: Run the specified function on ALL visible plates
			if massQueue[Event_OnUpdateNameplate] then 
				for queuedFunction in pairs(massQueue) do massQueue[queuedFunction] = nil end
				ForEachPlate(Event_OnUpdateNameplate)
			else
				for queuedFunction in pairs(massQueue) do
					massQueue[queuedFunction] = nil
					ForEachPlate(queuedFunction)
				end	
			end
                        
			-- Spefific Nameplate Function Queue: Runs the function on a specific plate
			for plate, queuedFunction in pairs(targetQueue) do
				targetQueue[plate] = nil
				queuedFunction(plate)
			end
		end	
		
		--------------------------------------------------------------------------------------------------------
		-- Mousover Event Routing
		--------------------------------------------------------------------------------------------------------
		if HasMouseover then 
			if LastMouseover ~= CurrentMouseover then
				if LastMouseover then Event_OnMouseover(LastMouseover) end
				Event_OnMouseover(CurrentMouseover)
				LastMouseover = CurrentMouseover
			end
		elseif LastMouseover then 
			Event_OnMouseover(LastMouseover)
			LastMouseover = nil 
		end
                
		--]]
		
		--------------------------------------------------------------------------------------------------------
		-- Detect New Nameplates
		--------------------------------------------------------------------------------------------------------
		curChildren = select('#', WorldFrame:GetChildren())
		if numChildren ~= curChildren then
			local i, f
			for i = 1, curChildren do
			    f = select(i, WorldFrame:GetChildren())
			    
				   if not Plates[f] and IsNameplate(f) then
						 ApplyPlateExtension(f)
				   end
			    
			end
			numChildren = curChildren
		end

	end

end
--------------------------------------------------------------------------------------------------------------
-- VIII. WoW Event Handlers: sends event-driven changes to the appropriate gather/update handler.
--------------------------------------------------------------------------------------------------------------
do
	local events = {}
	local function EventHandler(self, event, ...)
		events[event](event, ...)
	end

	local PlateHandler = CreateFrame("Frame", nil, WorldFrame)
	PlateHandler:SetFrameStrata("TOOLTIP") -- When parented to WorldFrame, causes OnUpdate handler to run close to last
	PlateHandler:SetScript("OnEvent", EventHandler)
	
	-- Events
	function events:PLAYER_ENTERING_WORLD() PlateHandler:SetScript("OnUpdate", OnUpdate); end
	function events:PLAYER_REGEN_ENABLED() InCombat = false; SetMassQueue(Event_OnUpdateNameplate) end
	function events:PLAYER_REGEN_DISABLED() InCombat = true; SetMassQueue(Event_OnUpdateNameplate) end
	
	function events:PLAYER_TARGET_CHANGED()
		HasTarget = UnitExists("target") == 1 -- Must be bool, never nil!
		if (not HasTarget) then CurrentTarget = nil end
		SetMassQueue(Event_OnUpdateNameplate)		-- Could be "SetMassQueue(UpdateTarget), someday...  :-o
	end
	
	function events:RAID_TARGET_UPDATE() SetMassQueue(Event_OnUpdateNameplate) end
	function events:UNIT_THREAT_SITUATION_UPDATE() SetMassQueue(Event_ThreatSituationUpdate) end  -- Only fired when a target changes
	function events:UNIT_LEVEL() SetMassQueue(Event_OnUpdateNameplate) end
	function events:PLAYER_CONTROL_LOST() ForEachPlate(Event_ThreatSituationUpdate) end
	events.PLAYER_CONTROL_GAINED = events.PLAYER_CONTROL_LOST
	events.UNIT_FACTION = events.PLAYER_CONTROL_LOST	

	-- Registration of Blizzard Events
	for eventname in pairs(events) do PlateHandler:RegisterEvent(eventname) end	
	TidyPlates.PlateHandler = PlateHandler
end

--------------------------------------------------------------------------------------------------------------
-- IX. External Commands: Allows widgets and themes to request updates to the plates.
-- Useful to make a theme respond to externally-captured data (such as the combat log)
--------------------------------------------------------------------------------------------------------------
function TidyPlates:ForceUpdate() SetMassQueue(Event_ResetNameplate) end
function TidyPlates:Update() SetMassQueue(Event_OnUpdateNameplate) end
function TidyPlates:RequestWidgetUpdate(plate) if plate then SetTargetQueue(plate, Event_RequestWidgetUpdate) else SetMassQueue(Event_RequestWidgetUpdate) end end
function TidyPlates:RequestDelegateUpdate(plate) if plate then SetTargetQueue(plate, Event_RequestDelegateUpdate) else SetMassQueue(Event_RequestDelegateUpdate) end end
function TidyPlates:ActivateTheme(theme) if theme and type(theme) == 'table' then TidyPlates.ActiveThemeTable, activetheme = theme, theme; SetMassQueue(Event_ResetNameplate) end end
function TidyPlates:EnableFadeIn() EnableFadeIn = true; end
function TidyPlates:DisableFadeIn() EnableFadeIn = nil; end
TidyPlates.NameplatesByGUID, TidyPlates.NameplatesAll, TidyPlates.NameplatesByVisible = GUID, Plates, PlatesVisible














