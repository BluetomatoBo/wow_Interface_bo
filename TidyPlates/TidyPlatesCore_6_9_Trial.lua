-- Tidy Plates - SMILE! :-D
--------------------------------------------------------------------------------------------------------------
-- I. Variables and Functions
--------------------------------------------------------------------------------------------------------------
TidyPlates = {}
local _
local numChildren = -1
local activetheme = {}
--local pollQueue = {}
local massQueue, targetQueue, functionQueue = {}, {}, {}		-- Queue Lists
local ForEachPlate												-- Allocated for Function (Defined later in file)
local EMPTY_TEXTURE = "Interface\\Addons\\TidyPlates\\Media\\Empty"
local select, pairs, tostring, wipe  = select, pairs, tostring, wipe 			-- Local function copies
local CreateTidyPlatesStatusbar = CreateTidyPlatesStatusbar			-- Local function copy
local InCombat, HasTarget, EnableFadeIn = false, false, true
local Plates, PlatesVisible, PlatesFading, GUID = {}, {}, {}, {}	-- Plate Lists
local PlatesScaling = {}	-- ScaleFade
local nameplate, extended, bars, regions, visual				-- Temp/Local/Current References
local unit, unitcache, style, stylename, unitchanged				-- Temp References
local currentTarget													-- Stores current target plate pointer
local extendedSetAlpha, HighlightIsShown, HighlightSetAlpha			-- Local copies of methods; faster than table lookups
local PlateSetAlpha, PlateGetAlpha									-- Local function copies
local FrameRate, NextRateSampling = 0, 0

----------------------------
-- Internal Functions
----------------------------
-- Simple Functions
local function ClearIndices(t) if t then for i,v in pairs(t) do t[i] = nil end return t end end
local function IsPlateShown(plate) return plate and plate:IsShown() end
local function SetTargetQueue(plate, func) if func then targetQueue[plate] = func end end
local function SetMassQueue(func) if func then massQueue[func] = true end end
local function SetFunctionQueue(func) if func then functionQueue[func] = true end end
-- Indicator Functions
local UpdateIndicator_CustomScaleText, UpdateIndicator_Standard, UpdateIndicator_CustomAlpha
local UpdateIndicator_Level, UpdateIndicator_ThreatGlow, UpdateIndicator_RaidIcon, UpdateIndicator_EliteIcon, UpdateIndicator_UnitColor, UpdateIndicator_Name
local UpdateIndicator_HealthBar
local UpdateHitboxShape     -- Deprecated
-- Data and Condition Functions
local OnNewNameplate, OnShowNameplate, OnHideNameplate, OnUpdateNameplate, OnResetNameplate, OnEchoNewNameplate
local OnUpdateHealth, OnUpdateLevel, OnUpdateThreatSituation, OnUpdateRaidIcon, OnUpdateHealthRange
local OnMouseoverNameplate, OnLeaveNameplate, OnRequestWidgetUpdate, OnRequestDelegateUpdate
-- Spell Casting
local UpdateCastAnimation, UpdateChannelAnimation, StartCastAnimation, StopCastAnimation, OnUpdateTargetCastbar
-- Main Loop
local OnUpdate
local ApplyPlateExtension

--------------------------------------------------------------------------------------------------------------
-- II. Frame/Layer Appearance Functions:  These functions set the appearance of specific object types
--------------------------------------------------------------------------------------------------------------

local function SetObjectShape(object, width, height) object:SetWidth(width); object:SetHeight(height) end
local function SetObjectFont(object,  font, size, flags) if not object:SetFont(font, size, flags) then object:SetFont("FONTS\\ARIALN.TTF", size or 12, flags) end end
local function SetObjectJustify(object, horz, vert) object:SetJustifyH(horz); object:SetJustifyV(vert) end
local function SetObjectShadow(object, shadow) if shadow then object:SetShadowColor(0,0,0, tonumber(shadow) or 1); object:SetShadowOffset(.5, -.5) else object:SetShadowColor(0,0,0,0) end  end
local function SetObjectAnchor(object, anchor, anchorTo, x, y) object:ClearAllPoints();object:SetPoint(anchor, anchorTo, anchor, x, y) end
local function SetObjectTexture(object, texture) object:SetTexture(texture) end -- object:SetTexCoord(0,1,0,1)  end
local function SetObjectBartexture(obj, tex, ori, crop) obj:SetStatusBarTexture(tex); obj:SetOrientation(ori); end
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
local backdropTable = {}
local function SetBarGroupObject(object, objectstyle, anchorTo)
	if objectstyle then
		SetAnchorGroupObject(object, objectstyle, anchorTo)
		SetObjectBartexture(object, objectstyle.texture or EMPTY_TEXTURE, objectstyle.orientation or "HORIZONTAL") -- objectstyle.texcoord)
		if objectstyle.backdrop then
			object:SetBackdropTexture(objectstyle.backdrop)
			--object:SetBackdropTexCoord(objectstyle.left, objectstyle.right, objectstyle.top, objectstyle.bottom)
		end
		object:SetTexCoord(objectstyle.left, objectstyle.right, objectstyle.top, objectstyle.bottom)
	end
end
local function MatchTextWidth()
        --[[
	local stringwidth = visual.name:GetStringWidth() or 100
	bars.healthbar:SetWidth(stringwidth+style.healthbar.width )
	visual.healthborder:SetWidth(stringwidth+style.healthborder.width)
	visual.target:SetWidth(stringwidth+style.target.width)
	extended:SetWidth(stringwidth+style.frame.width)
        --]]
end

--------------------------------------------------------------------------------------------------------------
-- III. Nameplate Style: These functions request updates for the appearance of the various graphical objects
--------------------------------------------------------------------------------------------------------------
local UpdateStyle
do
	-- UpdateStyle Variables
	local index, content
	local objectstyle, objectname, objectregion, objectenable
	-- Style Property Groups
	local fontgroup = {"name", "level", "spelltext", "customtext"}
	local anchorgroup = {"healthborder", "threatborder", "castborder", "castnostop",
						"name",  "spelltext", "customtext", "level",
						"customart", "spellicon", "skullicon", "eliteicon", "target"}
	local bargroup = {"castbar", "healthbar"}
	local texturegroup = { "castborder", "castnostop", "healthborder", "threatborder", "eliteicon",
						"skullicon", "highlight", "target", "customart", "spellicon", }
	-- UpdateStyle:
	function UpdateStyle()
		-- Frame
		SetAnchorGroupObject(extended, style.frame, nameplate)

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
                -- Raid Icon (special case)
                SetAnchorGroupObject(visual["raidicon"], style["raidicon"], extended)
	end
end
--------------------------------------------------------------------------------------------------------------
-- IV. Indicators: These functions update the actual data shown on the graphical objects
--------------------------------------------------------------------------------------------------------------

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

		if unit.isBoss and style.skullicon.show then
			visual.skullicon:Show()
			visual.level:Hide()
		else
			visual.skullicon:Hide()
			--visual.level:Show() 			-- Level indicators are shown via the UpdateStyle function
		end

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
			UpdateIndicator_EliteIcon()
			--if unitcache.isElite ~= unit.isElite then UpdateIndicator_EliteIcon() end
		end
	end
	-- UpdateIndicator_CustomAlpha: Calls the alpha delegate to get the requested alpha
	function UpdateIndicator_CustomAlpha()
		if activetheme.SetAlpha then
			extended.requestedAlpha = activetheme.SetAlpha(unit) or unit.alpha or 1                        
		else extended.requestedAlpha = unit.alpha or 1 end
                
		if EnableFadeIn then
                        extended.visibleAlpha = extended:GetAlpha()                 -- Just to be sure the values haven't been messed up
                        if extended.requestedAlpha ~= extended.visibleAlpha then
				PlatesFading[nameplate] = true
			end
                else
                    extended:SetAlpha(extended.requestedAlpha or 1)   
                end
                
                -- Better Layering
                if unit.isMouseover then
                    extended:SetFrameLevel(1)
                elseif not unit.isTarget then
                    extended:SetFrameLevel(0)
                end
	end

	-- UpdateIndicator_CustomScaleText: Updates the custom indicators (text, image, alpha, scale)
	function UpdateIndicator_CustomScaleText()
		threatborder = visual.threatborder

		if unit.health and (extended.requestedAlpha > 0) then
			-- Scale
			if activetheme.SetScale then

				extended.requestedScale = tonumber(activetheme.SetScale(unit)) or 0
                                
				if EnableFadeIn then
                                        extended.visibleScale = extended:GetScale()                     -- Just to be sure!
					if extended.visibleScale ~= extended.requestedScale then 	-- ScaleFade
						PlatesScaling[nameplate] = true
					end
                                else
                                    extended:SetScale( extended.requestedScale or 1)
				end
                                

			end

			-- Set Special-Case Regions
			if style.customtext.show then
				if activetheme.SetCustomText then
					local text, r, g, b, a = activetheme.SetCustomText(unit)
					visual.customtext:SetText( text or "")
					visual.customtext:SetTextColor(r or 1, g or 1, b or 1, a or 1)
				else visual.customtext:SetText("") end
			end
			if style.customart.show then
				if activetheme.SetCustomArt then visual.customart:SetTexture(activetheme.SetCustomArt(unit))
				else visual.customart:SetTexture(EMPTY_TEXTURE) end
			end
			UpdateIndicator_UnitColor()
		end
	end
	-- UpdateHitboxShape:  Updates the nameplate's hitbox, but only out of combat
        --[[
	function UpdateHitboxShape()
		if not InCombat then
			--nameplate:EnableMouse(true)	-- The logic is reversed. ODD.
			objectstyle = style.hitbox
			SetObjectShape(nameplate, objectstyle.width, objectstyle.height)
		end
	end
        --]]
end

--------------------------------------------------------------------------------------------------------------
-- V. Data Gather: Gathers Information about the unit and requests updates, if needed
--------------------------------------------------------------------------------------------------------------
do
	--------------------------------
	-- References and Cache
	--------------------------------
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

	--------------------------------
	-- Data Conversion Functions
	local ClassReference = {}
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
		[0]	= { [0]		= "STAR", [0.25]	= "MOON", },
		[0.25]	= { [0]		= "CIRCLE", [0.25]	= "SQUARE",	},
		[0.5]	= { [0]		= "DIAMOND", [0.25]	= "CROSS", },
		[0.75]	= { [0]		= "TRIANGLE", [0.25]	= "SKULL", }, }

	-- Populates the class color lookup table
	for classname, color in pairs(RAID_CLASS_COLORS) do
		local r, g, b = color.r, color.g, color.b
		local colorstring = ColorToString(r, g, b)
		ClassReference[colorstring] = classname
	end

	-- Custom lookups
	ClassReference["C010060"] = "MONK"

	--------------------------------
	-- Mass Gather Functions
	--------------------------------
	local function GatherData_Alpha(plate)
		if extended.bargroup:GetScale() > .9 then unit.platetype = 1 else unit.platetype = 2 end
		if HasTarget then unit.alpha = plate.alpha else unit.alpha = 1 end	-- Active Alpha

		unit.isTarget = HasTarget and unit.alpha == 1
		unit.isMouseover = (regions.highlight:IsShown() == 1)
		-- GUID
		if unit.isTarget then
			currentTarget = plate
			OnUpdateTargetCastbar(plate)
			if not unit.guid then
				-- UpdateCurrentGUID
				unit.guid = UnitGUID("target")
				if unit.guid then GUID[unit.guid] = plate end
			end

                else
			extended:SetFrameLevel(0)
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

	--------------------------------
	-- Graphical Updates
	--------------------------------
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
	local function ProcessUnitChanges(forceUpdate)
			-- Unit Cache
			unitchanged = forceUpdate or false
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

	--------------------------------
	-- Setup
	--------------------------------
	local function PrepareNameplate(plate)
		GatherData_BasicInfo()
		unit.frame = extended
		unit.alpha = 1
		unit.isTarget = false
		unit.isMouseover = false
                extended.unit = wipe(extended.unit)
		--extended.unitcache = ClearIndices(extended.unitcache)
		extended.unitcache = wipe(extended.unitcache)       -- Gonna try the native 'wipe' function
		extended.stylename = ""

		-- For Fading In
		PlatesFading[plate] = EnableFadeIn
		extended.requestedAlpha = 0
		extended.visibleAlpha = 0
		extended:SetAlpha(0)
                
                PlatesScaling[plate] = EnableFadeIn  		-- ScaleFade
                extended.requestedScale = 1
		extended.visibleScale = 1          -- Inital scale
		extended:SetScale(1)

		-- Graphics
		unit.isCasting = false
		bars.castbar:Hide()
		visual.highlight:Hide()
		regions.highlight:Hide()
                visual.raidicon:Hide()
                visual.target:Hide()
                
		-- Widgets/Extensions       -- Moved to OnEchoNewNameplate
		if activetheme.OnInitialize then activetheme.OnInitialize(extended) end
	end
        
	--------------------------------
	-- Individual Gather/Entry-Point Functions
	--------------------------------
	-- OnHideNameplate
	function OnHideNameplate(source)
		local plate = source.parentPlate
		UpdateReferences(plate)
		if unit.guid then GUID[unit.guid] = nil end
		--  StopCastAnimation(plate) -- The following is an alternative, to reduce the processing required for cleanup...
		bars.castbar:Hide()
		bars.castbar:SetScript("OnUpdate", nil)
		unit.isCasting = false
		PlatesVisible[plate] = nil
		extended.unit = ClearIndices(extended.unit)
		extended.unitcache = ClearIndices(extended.unitcache)
		for widgetname, widget in pairs(extended.widgets) do widget:Hide() end
		if plate == currentTarget then currentTarget = nil end
	end

	-- OnEchoNewNameplate
        --[[
        This function takes care of the full update after the TidyP lates plate has
        been prepared, and the parent plate has been fully populated with data.
        --]]
        
        
    
	local function OnEchoNewNameplate(plate)
                UpdateReferences(plate)
                local health, cast = bars.health, bars.cast
                health:HookScript("OnShow", OnShowNameplate )
                health:HookScript("OnHide", OnHideNameplate)
                health:HookScript("OnValueChanged", OnUpdateHealth)
                health:HookScript("OnMinMaxChanged", OnUpdateHealthRange)
                extended.isHooked = true
                
                --[[
                Hook for Updates Note:
                This used to be done in OnNewNameplate.  It has been moved because
                the event handler would sometimes call for events right after the
                nameplate was created, but before the data was populated.
                
                This hooking function has been placed prior to the IsShown check
                because sometimes the nameplate gets created and hidden in a single
                frame.
                --]]
                
		--if not plate:IsShown() then print("Hook would have Failed", plate); return else print("Hook suceeded", plate) end
		if not plate:IsShown() then return else end
                PlatesVisible[plate] = true
                
                -- Gather Information
                GatherData_BasicInfo()      
		GatherData_Alpha(plate)         
		ProcessUnitChanges(true)        -- Forces an update
	end
        
	-- OnNewNameplate:
        --[[
        When a nameplate is created, this function prepares the conditions
        and queues the plate for a more complete update.  Why?  On the
        cycle that the nameplate is created, its data hasn't been
        completely populated by Blizzard's client.  The data is complete
        on the next frame, so we keep the unfinished plate hidden.
        --]]
	function OnNewNameplate(plate)
		UpdateReferences(plate)
		PrepareNameplate(plate)                
		SetTargetQueue(plate, OnEchoNewNameplate) -- Echo for a full update (alpha only)
	end

	-- OnShowNameplate: This occurs when a nameplate is Reused
	function OnShowNameplate(source)
		local plate = source.parentPlate
		-- Activate Plate
		PlatesVisible[plate] = true
		UpdateReferences(plate)
		PrepareNameplate(plate)
		GatherData_BasicInfo()

		CheckNameplateStyle()
		--UpdateIndicator_CustomAlpha()     -- Gone: This is updated on Echo. 
		--UpdateHitboxShape()               -- Gone: This doesn't work anymore; The hitbox size is locked by the client

		SetTargetQueue(plate, OnUpdateNameplate)		-- Echo for a full update
	end

	-- OnUpdateNameplate
	function OnUpdateNameplate(plate)
		if not plate:IsShown() then return end
		-- Gather Information
		UpdateReferences(plate)
		GatherData_Alpha(plate)     -- Gathers opacity and scale, for target, mouseover
		GatherData_BasicInfo()      -- Gathers name, level, etc.
		ProcessUnitChanges()        -- Updates indicators
	end
	-- OnUpdateLevel
	function OnUpdateLevel(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if unit.isBoss then unit.level = "??"
		else unit.level = regions.level:GetText() end
		UpdateIndicator_Level()
	end

	-- OnUpdateThreatSituation
	function OnUpdateThreatSituation(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)

		if InCombat then unit.threatSituation, unit.threatValue = GetUnitAggroStatus(regions.threatglow)
		else unit.threatSituation = "LOW"; unit.threatValue = 0 end
		unit.isInCombat = GetUnitCombatStatus(regions.name:GetTextColor())
                unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
                
		CheckNameplateStyle()
		UpdateIndicator_ThreatGlow()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
	end

	-- OnUpdateRaidIcon
	function OnUpdateRaidIcon(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		unit.isMarked = regions.raidicon:IsShown() or false
		if unit.isMarked then
			ux, uy = regions.raidicon:GetTexCoord()
			unit.raidIcon = RaidIconCoordinate[ux][uy]
		else unit.raidIcon = nil end
		UpdateIndicator_RaidIcon()
		UpdateIndicator_UnitColor()
	end

	-- OnUpdateReaction
	function OnUpdateReaction(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		unit.red, unit.green, unit.blue = bars.health:GetStatusBarColor()
		unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
		unit.class = ClassReference[ColorToString(unit.red, unit.green, unit.blue)] or "UNKNOWN"
		UpdateIndicator_CustomScaleText()
	end

	-- OnMouseoverNameplate
	function OnMouseoverNameplate(plate)
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

		OnUpdateThreatSituation(plate)	-- This updates a bunch of properties
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- OnRequestWidgetUpdate: Updates just the widgets
	function OnRequestWidgetUpdate(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if activetheme.OnContextUpdate then activetheme.OnContextUpdate(extended, unit) end
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- OnRequestDelegateUpdate: Updates just the delegate function indicators (excluding Style?)
	function OnRequestDelegateUpdate(plate)
			if not IsPlateShown(plate) then return end
			UpdateReferences(plate)
			UpdateIndicator_ThreatGlow()
			UpdateIndicator_CustomAlpha()
			UpdateIndicator_CustomScaleText()
	end

	-- OnUpdateHealth
	function OnUpdateHealth(source)
		local plate = source.parentPlate
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		unit.health = bars.health:GetValue() or 0
		unit.healthmax = select(2,bars.health:GetMinMaxValues())
		UpdateIndicator_HealthBar()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
	end

	-- OnUpdateHealthRange
	function OnUpdateHealthRange(source)
		local plate = source.parentPlate
		OnUpdateNameplate(plate)
	end

	-- Update the Animation
	function UpdateCastAnimation(castbar)
		local currentTime = GetTime()
		if currentTime > (castbar.endTime or 0) then
			StopCastAnimation(castbar.parentPlate)
		else castbar:SetValue(currentTime) end
	end

	function UpdateChannelAnimation(castbar)
		local currentTime = GetTime()
		if currentTime > (castbar.endTime or 0) then
			StopCastAnimation(castbar.parentPlate)
		else castbar:SetValue(castbar.startTime + (castbar.endTime - currentTime)) end
	end

	-- Shows the Cast Animation (requires references)
	function StartCastAnimation(plate, spell, spellid, icon, startTime, endTime, notInterruptible, channel)
		UpdateReferences(plate)
		if (tonumber(GetCVar("showVKeyCastbar")) == 1) and spell then
			local castbar = bars.castbar
			local r, g, b, a = 1, .8, 0, 1
			unit.isCasting = true
			unit.spellName = spell
			unit.spellID = spellid
			unit.spellIsShielded = notInterruptible
			unit.spellInterruptible = not notInterruptible

			if activetheme.SetCastbarColor then
				r, g, b, a = activetheme.SetCastbarColor(unit)
				if not (r and g and b) then return end
			end

			castbar.endTime = endTime
			castbar.startTime = startTime
			castbar:SetStatusBarColor( r, g, b, a or 1)
			castbar:SetMinMaxValues(startTime, endTime)
			visual.spelltext:SetText(spell)

			visual.spellicon:SetTexture(icon)
			if notInterruptible then
				visual.castnostop:Show(); visual.castborder:Hide()
			else visual.castnostop:Hide(); visual.castborder:Show() end

			castbar:Show()
			if channel then
				castbar:SetValue(endTime - GetTime())
				castbar:SetScript("OnUpdate", UpdateChannelAnimation)
			else
				castbar:SetValue(GetTime())
				castbar:SetScript("OnUpdate", UpdateCastAnimation)
			end


			UpdateIndicator_CustomScaleText()
			UpdateIndicator_CustomAlpha()
		end
	end

	-- Hides the Cast Animation (requires references)
	function StopCastAnimation(plate)
		UpdateReferences(plate)
		bars.castbar:Hide()
		bars.castbar:SetScript("OnUpdate", nil)
		unit.isCasting = false
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_CustomAlpha()
	end

	-- OnUpdateTargetCastbar: Called from hooking into the original nameplate castbar's "OnValueChanged"
	function OnUpdateTargetCastbar(source)
		if not source then return end
		local plate
		if PlatesVisible[source] then plate = source else plate = source.parentPlate end

		if plate.extended.unit.isTarget then
			-- Grabs the target's casting information
			local spell, name, icon, start, finish, nonInt, channel, spellid, _

			--name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo("target")
			spell, _, name, icon, start, finish, _, spellid, nonInt = UnitCastingInfo("target")

			if not spell then spell, _, name, icon, start, finish, spellid, nonInt = UnitChannelInfo("target"); channel = true end

			if spell then StartCastAnimation(plate, spell, spellid, icon, start/1000, finish/1000, nonInt, channel)
			else StopCastAnimation(plate) end
		end
	end

	-- OnResetNameplate
	function OnResetNameplate(plate)
		local extended = plate.extended
		extended.unitcache = ClearIndices(extended.unitcache)
		extended.stylename = ""
		OnShowNameplate(extended)
	end
end

--------------------------------------------------------------------------------------------------------------
-- VI. Nameplate Extension: Applies scripts, hooks, and adds additional frame variables and elements
--------------------------------------------------------------------------------------------------------------


do
	local bars, regions, health, castbar, healthbar, visual
	local platelevels = 125

	local function CreateGraphicalElements(extended)
		-- Create Statusbars
		bars.healthbar = CreateTidyPlatesStatusbar(extended)
		bars.castbar = CreateTidyPlatesStatusbar(extended)
		healthbar, castbar = bars.healthbar, bars.castbar

		healthbar:SetFrameStrata("BACKGROUND")
		castbar:SetFrameStrata("BACKGROUND")

		-- Textures
		local upperlayer = CreateFrame("Frame", nil, healthbar)
		visual = extended.visual

                --[[
                -- Create Edge (Cube Frame)
                --]]
                
                --[[
                Proposed Layer Order
                --------------------
                .customlayer
                customtext      - Overlay
                customart       - Artwork
                
                .upperlayer
                Raid Icon       - Overlay
                Level           - Overlay
                Name            - Artwork
                Skull Icon      - Artwork
                Elite Icon      - Background
                
                .extended
                Highlight           - Overlay
                ThreatAggro Border  - Artwork
                
                .healthbar
                Target          - Overlay
                Health Border   - Artwork
                Health Bar
                
                --------------------                
                --]]
                
                -- Top Level
		visual.target = extended:CreateTexture(nil, "ARTWORK")
                
                -- Middle Level
		visual.raidicon = extended:CreateTexture(nil, "OVERLAY")
		visual.raidicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
		visual.eliteicon = extended:CreateTexture(nil, "OVERLAY")
		visual.skullicon = extended:CreateTexture(nil, "OVERLAY")
                
                -- Health Bar Level (Low) 
		visual.healthborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.threatborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.highlight = healthbar:CreateTexture(nil, "OVERLAY")
                visual.highlight:SetAllPoints(visual.healthborder)
		visual.highlight:SetBlendMode("ADD")
                
		visual.customart = upperlayer:CreateTexture(nil, "OVERLAY")

                -- Cast Bar
                visual.spellicon = castbar:CreateTexture(nil, "OVERLAY")                
		visual.castborder = castbar:CreateTexture(nil, "ARTWORK")
		visual.castnostop = castbar:CreateTexture(nil, "ARTWORK")

                -- Additional Config, Only works on Textures
		for i, v in pairs(visual) do v:SetNonBlocking(true) end
                    
		-- Formatted Text (Must come after Non-Blocking)
		visual.spelltext = castbar:CreateFontString(nil, "OVERLAY")
                visual.customtext = extended:CreateFontString(nil, "OVERLAY")
		visual.name  = extended:CreateFontString(nil, "OVERLAY")
		visual.level = extended:CreateFontString(nil, "OVERLAY")
		
	end

	function ApplyPlateExtension(plate)
		Plates[plate] = GetTime()
		--Plates[plate] = true
		plate.extended = CreateFrame("Frame", nil, plate)
		local extended = plate.extended
		platelevels = platelevels - 1; if platelevels < 1 then platelevels = 1 end
		extended.frameLevel = platelevels
		--extended:SetFrameLevel(platelevels)
		extended:SetFrameStrata("BACKGROUND")
		extended.style, extended.unit, extended.unitcache, extended.stylecache, extended.widgets = {}, {}, {}, {}, {}
		extended.regions, extended.bars, extended.visual = {}, {}, {}
		extended.stylename = ""
		regions = extended.regions
		bars = extended.bars

		-- Bars
		local bargroup, namegroup = plate:GetChildren()
		bars.health, bars.cast = bargroup:GetChildren()
		health, cast = bars.health, bars.cast		-- Blizzard bars
		extended.bargroup = bargroup

		-- Regions
		regions.threatglow, regions.healthborder, regions.highlight, regions.level, regions.skullicon, regions.raidicon, regions.eliteicon = bargroup:GetRegions()
		regions.name = namegroup:GetRegions()

		regions.castborder, regions.castnostop, regions.spellicon =  select(2, cast:GetRegions())

		-- This block makes the Blizz nameplate invisible
		regions.threatglow:SetTexCoord( 0, 0, 0, 0 )
		regions.healthborder:SetTexCoord( 0, 0, 0, 0 )
		regions.castborder:SetTexCoord( 0, 0, 0, 0 )
		regions.castnostop:SetTexCoord( 0, 0, 0, 0 )
		regions.skullicon:SetTexCoord( 0, 0, 0, 0 )
		regions.eliteicon:SetTexCoord( 0, 0, 0, 0 )
		regions.name:SetWidth( 000.1 )
		regions.level:SetWidth( 000.1 )
		regions.spellicon:SetTexCoord( 0, 0, 0, 0 )
		regions.spellicon:SetWidth(.001)
		regions.raidicon:SetAlpha( 0 )
		regions.highlight:SetTexture(EMPTY_TEXTURE)
		bars.health:SetStatusBarTexture(EMPTY_TEXTURE)
		bars.cast:SetStatusBarTexture(EMPTY_TEXTURE)

		CreateGraphicalElements(extended)
		healthbar, castbar = bars.healthbar, bars.castbar	-- Tidy Plates bars

		-- Visible Bars
		castbar:Hide()
		castbar:SetStatusBarColor(1,.8,0)

		healthbar:SetFrameLevel(0)
		extended:SetFrameLevel(0)
		castbar:SetFrameLevel(0)

		extended.parentPlate = plate
		health.parentPlate = plate
		cast.parentPlate = plate
		castbar.parentPlate = plate

		if not extendedSetAlpha then
			PlateSetAlpha = plate.SetAlpha
			PlateGetAlpha = plate.GetAlpha
			extendedSetAlpha = plate.extended.SetAlpha
			extendedSetScale = plate.extended.SetScale  	-- ScaleFade
			HighlightIsShown = plate.extended.visual.highlight.IsShown
		end

		OnNewNameplate(plate)
	end
		--[[
	-- Creates a standalone frame for using Tidy Plates to create and style fixed-position unit frames
	local function UpdateStandalonePlate(parentFrame, customStyle)
		if unitTable and customStyle then
			extended = parentFrame
			style = customStyle
			visual = parentFrame.visual
			bars = parentFrame.bars

			UpdateStyle()
		end
	end

	local function CreateStandalonePlate(parentFrame)
			parentFrame.bars = {}
			parentFrame.visual = {}

			bars = parentFrame.bars

			CreateGraphicalElements(parentFrame)
			parentFrame.UpdatePlate = UpdateStandalonePlate
	end

	TidyPlates.CreateStandalonePlate = CreateStandalonePlate
	--]]

end

--------------------------------------------------------------------------------------------------------------
-- VII. World Update Functions: Refers new plates to 'ApplyPlateExtension()', and watches for Alpha/Transparency
-- and Highlight/Mouseover changes, and sends those changes to the appropriate handler.
-- Also processes the update queue (ie. echos)
--------------------------------------------------------------------------------------------------------------

do
	local plate, curChildren
	local WorldGetNumChildren, WorldGetChildren = WorldFrame.GetNumChildren, WorldFrame.GetChildren

	-- if ((string.find(frame:GetName() or "", "NamePlate")) ~= nil) then ListChildren(frame, "") end
	local ListChildren
	function ListChildren(frame, prefix)
		if frame then
			print(prefix, frame, frame:GetName(), frame:GetObjectType(), "-->")
			--if frame:GetObjectType() == "Frame" then
			if frame:IsObjectType("Frame") then

				-- Regions
				local regions = frame:GetNumRegions()
				if regions and regions > 0 then
					print(prefix.."  ", "Regions of", frame, ":")
					for i = 1, regions do
						local r = select(i, frame:GetRegions())
						print(prefix.."  ", r:GetObjectType(), r.GetTexture and r:GetTexture())

					end
				end

				-- Children
				local children = frame:GetNumChildren()
				if children and children > 0 then
					print(prefix.."  ", "Children of", frame, ":")
					for i = 1, children do
						ListChildren(select(i, frame:GetChildren()), "    "..prefix)
					end
				end



			end
		end
	end

	-- IsFrameNameplate: Checks to see if the frame is a Blizz nameplate
	local function IsFrameNameplate(frame)
		--if ((string.find(frame:GetName() or "", "NamePlate")) ~= nil) then ListChildren(frame, "") end

		local bars, name = frame:GetChildren()
		if bars then
			local border = select(2, bars:GetRegions() )
			--print(frame:GetName(), border.GetTexture and border:GetTexture() == "Interface\\Tooltips\\Nameplate-Border")
			-- Test: /run local DummyFrame1 = CreateFrame("Frame", "DummyFrame", WorldFrame); CreateFrame("Frame", "DummyFrameChild", DummyFrame1)
			return border and border.GetTexture and border:GetTexture() == "Interface\\Tooltips\\Nameplate-Border"
		end
	end



	-- OnWorldFrameChange: Checks for new Blizz Plates
	local function OnWorldFrameChange(...)
		for index = 1, select("#", ...) do
			plate = select(index, ...)

			--IsFrameNameplate(plate)

			if not Plates[plate] and IsFrameNameplate(plate) then
				ApplyPlateExtension(plate)
			end
		end
	end

	-- ForEachPlate
	function ForEachPlate(functionToRun, ...)
		for plate in pairs(PlatesVisible) do
			if plate.extended:IsShown() then -- Plate and extended frame both explicitly visible
				functionToRun(plate, ...)
			end
		end
	end

	-- Fade Function
	local function UpdateFade(frame, func, visible, requested, rate)
		if visible == requested then return nil, requested end
		
		local scaledRate = rate * (30/FrameRate)
		if visible < requested then
			visible = min(visible + scaledRate, requested)
		elseif visible > requested then
			visible = max(visible - scaledRate, requested)
		end
				
		func(frame, visible)
		return true, visible
	end

	-- OnUpdate: This function is processed every frame!
	local queuedFunction
	local HasMouseover, LastMouseover, CurrentMouseover
	local CurrentTime, PollTime, PollIndex = 0, 0, 0

	function OnUpdate(self)
		CurrentTime = GetTime()
		HasMouseover = false
                
                -- Sample Frame Rate for Performance Adjustment
                if CurrentTime > NextRateSampling then
                    FrameRate = GetFramerate()
                    NextRateSampling = CurrentTime + 2
                end
                
		-- Alpha - Highlight - Poll Loop
		for plate in pairs(PlatesVisible) do

			-- Alpha
			if (HasTarget) then
				plate.alpha = PlateGetAlpha(plate)
				PlateSetAlpha(plate, 1)
			end

			-- Highlight: CURSOR_UPDATE events are unreliable for GUID updates.  This provides a much better experience.
			highlightRegion = plate.extended.regions.highlight
			if HighlightIsShown(highlightRegion) then
				HasMouseover = true
				CurrentMouseover = plate
			end
		end

		-- Fade/Scale Transition Loops
		for plate in pairs(PlatesFading) do 
			local extended = plate.extended
			PlatesFading[plate] , extended.visibleAlpha = UpdateFade(extended, extendedSetAlpha, extended.visibleAlpha, extended.requestedAlpha, .22)
		end
		
                --  [[            Disabled
		for plate in pairs(PlatesScaling) do 
			local extended = plate.extended
			PlatesScaling[plate], extended.visibleScale = UpdateFade(extended, extendedSetScale, extended.visibleScale, extended.requestedScale, .15)
		end
                --]]

		-- Process the Update Request Queues
		if massQueue[OnResetNameplate] then
			ForEachPlate(OnResetNameplate)
			for queuedFunction in pairs(massQueue) do massQueue[queuedFunction] = nil end
		else
			-- Function Queue: Runs the specified function
			for queuedFunction, run in pairs(functionQueue) do
				queuedFunction()
				functionQueue[queuedFunction] = nil
			end
			-- Mass Update Queue: Run the specified function on ALL visible plates
			if massQueue[OnUpdateNameplate] then
				for queuedFunction in pairs(massQueue) do massQueue[queuedFunction] = nil end
				ForEachPlate(OnUpdateNameplate)
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

		-- Process Mouseover
		if HasMouseover then
			if LastMouseover ~= CurrentMouseover then
				--ForEachPlate(OnLeaveNameplate)		-- Resets the highlight regions
				if LastMouseover then OnMouseoverNameplate(LastMouseover) end
				OnMouseoverNameplate(CurrentMouseover)
				LastMouseover = CurrentMouseover
			end
		elseif LastMouseover then
			OnMouseoverNameplate(LastMouseover)
			LastMouseover = nil
		end

		-- Detect New Nameplates
		curChildren = WorldGetNumChildren(WorldFrame)
		if (curChildren ~= numChildren) then
			numChildren = curChildren
			OnWorldFrameChange(WorldGetChildren(WorldFrame))
		end

	end
end
--------------------------------------------------------------------------------------------------------------
-- VIII. Event Handlers: sends event-driven changes to  the appropriate gather/update handler.
--------------------------------------------------------------------------------------------------------------
do
	local events = {}
	local function EventHandler(self, event, ...)
		events[event](event, ...)
	end
	--local PlateHandler = CreateFrame("Frame")
	local PlateHandler = CreateFrame("Frame", nil, WorldFrame)
	PlateHandler:SetFrameStrata("TOOLTIP") -- When parented to WorldFrame, causes OnUpdate handler to run close to last
	PlateHandler:SetScript("OnEvent", EventHandler)

	-- Events
	function events:PLAYER_ENTERING_WORLD() PlateHandler:SetScript("OnUpdate", OnUpdate); end
	function events:PLAYER_REGEN_ENABLED() InCombat = false; SetMassQueue(OnUpdateNameplate) end
	function events:PLAYER_REGEN_DISABLED() InCombat = true; SetMassQueue(OnUpdateNameplate) end

	function events:PLAYER_TARGET_CHANGED()
		HasTarget = UnitExists("target") == 1 -- Must be bool, never nil!
		if (not HasTarget) then currentTarget = nil end
		SetMassQueue(OnUpdateNameplate)		-- Could be "SetMassQueue(UpdateTarget), someday...  :-o
	end

	--function events:RAID_TARGET_UPDATE() ForEachPlate(OnUpdateRaidIcon) end
	function events:RAID_TARGET_UPDATE() SetMassQueue(OnUpdateNameplate) end
	function events:UNIT_THREAT_SITUATION_UPDATE() 	SetMassQueue(OnUpdateThreatSituation) end  -- Only fired when a target changes
	function events:UNIT_LEVEL() ForEachPlate(OnUpdateLevel) end
	function events:PLAYER_CONTROL_LOST() ForEachPlate(OnUpdateReaction) end
	events.PLAYER_CONTROL_GAINED = events.PLAYER_CONTROL_LOST
	events.UNIT_FACTION = events.PLAYER_CONTROL_LOST

	function events:UNIT_SPELLCAST_START(unitid,  spell, ...) if unitid == "target" and currentTarget then OnUpdateTargetCastbar(currentTarget) end  end
	events.UNIT_SPELLCAST_STOP = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_INTERRUPTED = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_FAILED = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_DELAYED = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_CHANNEL_START = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_NOT_INTERRUPTIBLE = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_INTERRUPTIBLE = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_CHANNEL_STOP = events.UNIT_SPELLCAST_START
	events.UNIT_SPELLCAST_FAILED_QUIET = events.UNIT_SPELLCAST_START

	-- Registration of Blizzard Events
	for eventname in pairs(events) do PlateHandler:RegisterEvent(eventname) end
	TidyPlates.PlateHandler = PlateHandler
end

--------------------------------------------------------------------------------------------------------------
-- IX. External Commands: Allows widgets and themes to request updates to the plates.
-- Useful to make a theme respond to externally-captured data (such as the combat log)
--------------------------------------------------------------------------------------------------------------
function TidyPlates:ForceUpdate() SetMassQueue(OnResetNameplate) end
function TidyPlates:Update() SetMassQueue(OnUpdateNameplate) end
function TidyPlates:RequestWidgetUpdate() SetMassQueue(OnRequestWidgetUpdate) end
function TidyPlates:RequestDelegateUpdate() SetMassQueue(OnRequestDelegateUpdate) end
function TidyPlates:ActivateTheme(theme) if theme and type(theme) == 'table' then TidyPlates.ActiveThemeTable, activetheme = theme, theme; SetMassQueue(OnResetNameplate) end end
function TidyPlates:EnableFadeIn(rate) EnableFadeIn = true; FadeRate = rate or FadeRate or .2; end
function TidyPlates:DisableFadeIn() EnableFadeIn = nil; end
TidyPlates.StartCastAnimationOnNameplate = StartCastAnimation
TidyPlates.StopCastAnimationOnNameplate = StopCastAnimation
TidyPlates.NameplatesByGUID, TidyPlates.NameplatesAll, TidyPlates.NameplatesByVisible = GUID, Plates, PlatesVisible














