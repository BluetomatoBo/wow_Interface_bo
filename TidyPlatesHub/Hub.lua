
-- Rapid Panel Functions
local CreateQuickSlider = TidyPlatesHubRapidPanel.CreateQuickSlider
local CreateQuickCheckbutton = TidyPlatesHubRapidPanel.CreateQuickCheckbutton
local SetSliderMechanics = TidyPlatesHubRapidPanel.SetSliderMechanics
local CreateQuickEditbox = TidyPlatesHubRapidPanel.CreateQuickEditbox
local CreateQuickColorbox = TidyPlatesHubRapidPanel.CreateQuickColorbox
local CreateQuickDropdown = TidyPlatesHubRapidPanel.CreateQuickDropdown
local CreateQuickHeadingLabel = TidyPlatesHubRapidPanel.CreateQuickHeadingLabel
local CreateQuickItemLabel = TidyPlatesHubRapidPanel.CreateQuickItemLabel
local OnMouseWheelScrollFrame = TidyPlatesHubRapidPanel.OnMouseWheelScrollFrame
local CreateInterfacePanel = TidyPlatesHubRapidPanel.CreateInterfacePanel 

-- Modes
local ThemeList = TidyPlatesHubModes.ThemeList
local StyleModes = TidyPlatesHubModes.StyleModes
local TextModes = TidyPlatesHubModes.TextModes
local RangeModes = TidyPlatesHubModes.RangeModes
local AuraWidgetModes = TidyPlatesHubModes.AuraWidgetModes
local DebuffStyles = TidyPlatesHubModes.DebuffStyles
local OpacityModes = TidyPlatesHubModes.OpacityModes
local ScaleModes = TidyPlatesHubModes.ScaleModes
local HealthColorModes = TidyPlatesHubModes.HealthColorModes
local WarningGlowModes = TidyPlatesHubModes.WarningGlowModes
local ThreatWidgetModes = TidyPlatesHubModes.ThreatWidgetModes
local NameColorModes = TidyPlatesHubModes.NameColorModes
local TextPlateFieldModes = TidyPlatesHubModes.TextPlateFieldModes
local ArtStyles = TidyPlatesHubModes.ArtStyles
local ArtModes = TidyPlatesHubModes.ArtModes
local ThreatModes = TidyPlatesHubModes.ThreatModes

------------------------------------------------------------------
-- Generate Panel
------------------------------------------------------------------
local function CreateInterfacePanelWidgets(panel)
	local objectName = panel.objectName
	local AlignmentColumn = panel.AlignmentColumn
	local OffsetColumnB = 200	-- 240
	
	
	--[[
	
	Style
		Enemy Nameplates
		Friendly Nameplates
	+Style ---
		Help Text
		Headline Options
		Healthbar Options
		
	Color		(This mode would be an added option under the color modes, called, Global?)
		Coloring Modes
	+Color Additional Options
		
	
	
	Alpha 
		Spotlight Modes
		Spotlight Scale
	+Alpha
		Additional Options
		
	Filter
	
	Scale
		Spotlight Mode
		Spotlight Scale
	+Scale
		
	Threat
		Enable Threat Coloring? 
		Highlight Group Member Aggro
	+Threat
		Custom Threat Colors
		
	Health (Color)
	
	Reaction Colors
	
	Aura
	
	Widgets
	
	Advanced Frame Settings
	  
	--]]
	------------------------------
	-- Style
	------------------------------
	panel.StyleLabel = CreateQuickHeadingLabel(nil, "Style", AlignmentColumn, nil, 0, 5)	
	panel.StyleEnemyMode =  CreateQuickDropdown(objectName.."StyleEnemyMode", "Enemy Nameplates:", StyleModes, 1, AlignmentColumn, panel.StyleLabel, 0, 2)
	panel.StyleFriendlyMode =  CreateQuickDropdown(objectName.."StyleFriendlyMode", "Friendly Nameplates:", StyleModes, 1, AlignmentColumn, panel.StyleEnemyMode)

	------------------------------
	--[[ Headline View
	------------------------------
	panel.HeadlineLabel = CreateQuickHeadingLabel(nil, "Headline Mode", AlignmentColumn, nil, OffsetColumnB, 5)
	panel.TextPlateNameColorMode =  CreateQuickDropdown(objectName.."TextPlateNameColorMode", "Name Text Color:", NameColorModes, 1, AlignmentColumn, panel.HeadlineLabel, OffsetColumnB)	-- |cffee9900Text-Only Style 
	panel.TextPlateFieldMode =  CreateQuickDropdown(objectName.."TextPlateFieldMode", "Optional Text Field:", TextPlateFieldModes, 1, AlignmentColumn, panel.TextPlateNameColorMode, OffsetColumnB)	-- |cffee9900Text-Only Style
	--]]
	
	------------------------------
	-- Headline View
	------------------------------
	panel.HeadlineLabel = CreateQuickHeadingLabel(nil, "Headline Mode", AlignmentColumn, panel.StyleFriendlyMode, 0, 5)
	panel.TextPlateNameColorMode =  CreateQuickDropdown(objectName.."TextPlateNameColorMode", "Name Text Color:", NameColorModes, 1, AlignmentColumn, panel.HeadlineLabel)	-- |cffee9900Text-Only Style 
	panel.TextPlateFieldMode =  CreateQuickDropdown(objectName.."TextPlateFieldMode", "Optional Text Field:", TextPlateFieldModes, 1, AlignmentColumn, panel.TextPlateNameColorMode)	-- |cffee9900Text-Only Style
	
	------------------------------
        -- Health Bar Mode:
	-- Color & Text: Column 1
	------------------------------
	panel.ColorLabel = CreateQuickHeadingLabel(nil, "Health Bar Mode", AlignmentColumn, panel.TextPlateFieldMode, 0, 5)
	--panel.ArtDefault  =  CreateQuickDropdown(objectName.."ArtDefault", "Health Bar Art:", ArtStyles, 1, AlignmentColumn, panel.ColorLabel)	-- 6.x Multi-Theme First stage
	panel.ColorHealthBarMode =  CreateQuickDropdown(objectName.."ColorHealthBarMode", "Health Bar Color:", HealthColorModes, 1, AlignmentColumn, panel.ColorLabel)
	panel.ColorDangerGlowMode =  CreateQuickDropdown(objectName.."ColorDangerGlowMode", "Warning Border/Glow:", WarningGlowModes, 1, AlignmentColumn, panel.ColorHealthBarMode)
	panel.TextNameColorMode =  CreateQuickDropdown(objectName.."TextNameColorMode", "Name Text Color:", NameColorModes, 1, AlignmentColumn, panel.ColorDangerGlowMode)	
	
	------------------------------
        -- Health Bar Mode:
	-- Color & Text: Column 2
	------------------------------
	panel.TextHealthTextMode =  CreateQuickDropdown(objectName.."TextHealthTextMode", "Optional Text Field:", TextModes, 1, AlignmentColumn, panel.ColorLabel, OffsetColumnB)
	panel.TextShowLevel = CreateQuickCheckbutton(objectName.."TextShowLevel", "Show Level", AlignmentColumn, panel.TextHealthTextMode, OffsetColumnB)
	panel.TextUseBlizzardFont = CreateQuickCheckbutton(objectName.."TextUseBlizzardFont", "Use Default Blizzard Font", AlignmentColumn, panel.TextShowLevel, OffsetColumnB)
	--panel.TextGreyWhenNoGUID = CreateQuickCheckbutton(objectName.."TextGreyWhenNoGUID", "Grey when GUID is Unknown", AlignmentColumn, panel.TextUseBlizzardFont, OffsetColumnB)
	
	-- [[  6.x Multi-Theme
	--panel.ArtDefault  =  CreateQuickDropdown(objectName.."ArtDefault", "Default Art:", ArtStyles, 1, AlignmentColumn, panel.ColorLabel, OffsetColumnB)
	--panel.ArtSpotlight  =  CreateQuickDropdown(objectName.."ArtSpotlight", "Spotlight Art:", ArtStyles, 1, AlignmentColumn, panel.ArtDefault, OffsetColumnB)
	--panel.ArtSpotlightMode  =  CreateQuickDropdown(objectName.."ArtSpotlightMode", "Art Spotlight Mode:", ArtModes, 1, AlignmentColumn, panel.ArtSpotlight, OffsetColumnB)
	--]]
	
	------------------------------
	--Opacity
	------------------------------
	panel.OpacityLabel = CreateQuickHeadingLabel(nil, "Opacity", AlignmentColumn, panel.TextNameColorMode, 0, 5)	
	panel.OpacityTarget = CreateQuickSlider(objectName.."OpacityTarget", "Current Target Opacity:", AlignmentColumn, panel.OpacityLabel, 0, 2)
	panel.OpacityNonTarget = CreateQuickSlider(objectName.."OpacityNonTarget", "Non-Target Opacity:", AlignmentColumn, panel.OpacityTarget, 0, 2)
	panel.OpacitySpotlightMode =  CreateQuickDropdown(objectName.."OpacitySpotlightMode", "Opacity Spotlight Mode:", OpacityModes, 1, AlignmentColumn, panel.OpacityNonTarget)
	panel.OpacitySpotlight = CreateQuickSlider(objectName.."OpacitySpotlight", "Spotlight Opacity:", AlignmentColumn, panel.OpacitySpotlightMode, 0, 2)
	panel.OpacityFullSpell = CreateQuickCheckbutton(objectName.."OpacityFullSpell", "Bring Casting Units to Target Opacity", AlignmentColumn, panel.OpacitySpotlight, 16)
	panel.OpacityFullMouseover = CreateQuickCheckbutton(objectName.."OpacityFullMouseover", "Bring Mouseovers to Target Opacity", AlignmentColumn, panel.OpacityFullSpell, 16)
	panel.OpacityFullNoTarget = CreateQuickCheckbutton(objectName.."OpacityFullNoTarget", "Use Target Opacity When No Target Exists", AlignmentColumn, panel.OpacityFullMouseover, 16)
	
	------------------------------
	-- Filter
	--------------------------------
	panel.FilterLabel = CreateQuickHeadingLabel(nil, "Filter", AlignmentColumn, panel.OpacityFullNoTarget, 0, 5)
	panel.OpacityFiltered = CreateQuickSlider(objectName.."OpacityFiltered", "Filtered Unit Opacity:", AlignmentColumn, panel.FilterLabel, 0, 2)
	panel.ScaleFiltered = CreateQuickSlider(objectName.."ScaleFiltered", "Filtered Unit Scale:", AlignmentColumn, panel.OpacityFiltered, 0, 2)
	panel.OpacityFilterNeutralUnits = CreateQuickCheckbutton(objectName.."OpacityFilterNeutralUnits", "Filter Neutral Units", AlignmentColumn, panel.ScaleFiltered, 16)
	panel.OpacityFilterNonElite = CreateQuickCheckbutton(objectName.."OpacityFilterNonElite", "Filter Non-Elite", AlignmentColumn, panel.OpacityFilterNeutralUnits, 16)
	panel.OpacityFilterNPC = CreateQuickCheckbutton(objectName.."OpacityFilterNPC", "Filter NPC", AlignmentColumn, panel.OpacityFilterNonElite, 16)
	panel.OpacityFilterFriendlyNPC = CreateQuickCheckbutton(objectName.."OpacityFilterFriendlyNPC", "Filter Friendly NPC", AlignmentColumn, panel.OpacityFilterNPC, 16)
        panel.OpacityFilterPlayers = CreateQuickCheckbutton(objectName.."OpacityFilterPlayers", "Filter Players", AlignmentColumn, panel.OpacityFilterFriendlyNPC, 16)
	panel.OpacityFilterInactive = CreateQuickCheckbutton(objectName.."OpacityFilterInactive", "Filter Inactive", AlignmentColumn, panel.OpacityFilterPlayers, 16)
	panel.OpacityFilterMini = CreateQuickCheckbutton(objectName.."OpacityFilterMini", "Filter Mini-Mobs", AlignmentColumn, panel.OpacityFilterInactive, 16)
	panel.OpacityCustomFilterLabel = CreateQuickItemLabel(nil, "Filter By Unit Name:", AlignmentColumn, panel.OpacityFilterMini, 8)	
	panel.OpacityFilterList = CreateQuickEditbox(objectName.."OpacityFilterList", AlignmentColumn, panel.OpacityCustomFilterLabel, 8)

	------------------------------
	--Scale
	------------------------------
	panel.ScaleLabel = CreateQuickHeadingLabel(nil, "Scale", AlignmentColumn, panel.OpacityFilterList, 0, 5)	
	panel.ScaleStandard = CreateQuickSlider(objectName.."ScaleStandard", "Normal Scale:", AlignmentColumn, panel.ScaleLabel, 0, 2)
	panel.ScaleSpotlightMode =  CreateQuickDropdown(objectName.."ScaleSpotlightMode", "Scale Spotlight Mode:", ScaleModes, 1, AlignmentColumn, panel.ScaleStandard)
	panel.ScaleSpotlight = CreateQuickSlider(objectName.."ScaleSpotlight", "Spotlight Scale:", AlignmentColumn, panel.ScaleSpotlightMode, 0, 2)
	panel.ScaleIgnoreNeutralUnits= CreateQuickCheckbutton(objectName.."ScaleIgnoreNeutralUnits", "Ignore Neutral Units", AlignmentColumn, panel.ScaleSpotlight, 16)
	panel.ScaleIgnoreNonEliteUnits= CreateQuickCheckbutton(objectName.."ScaleIgnoreNonEliteUnits", "Ignore Non-Elite Units", AlignmentColumn, panel.ScaleIgnoreNeutralUnits, 16)
	panel.ScaleIgnoreInactive= CreateQuickCheckbutton(objectName.."ScaleIgnoreInactive", "Ignore Inactive Units", AlignmentColumn, panel.ScaleIgnoreNonEliteUnits, 16)
	panel.ScaleCastingSpotlight= CreateQuickCheckbutton(objectName.."ScaleCastingSpotlight", "Bring Casting Units to Spotlight Scale", AlignmentColumn, panel.ScaleIgnoreInactive, 0)
	
        ------------------------------
	-- Reaction
	------------------------------
        
        panel.ReactionLabel = CreateQuickHeadingLabel(nil, "Reaction", AlignmentColumn, panel.ScaleCastingSpotlight, 0, 5)	        
	panel.ReactionColorLabel = CreateQuickItemLabel(nil, "Health Bar Color:", AlignmentColumn, panel.ReactionLabel, 0, 2)
	panel.ColorFriendlyNPC = CreateQuickColorbox(objectName.."ColorFriendlyNPC", "Friendly NPC", AlignmentColumn, panel.ReactionColorLabel , 16)
	panel.ColorFriendlyPlayer = CreateQuickColorbox(objectName.."ColorFriendlyPlayer", "Friendly Player", AlignmentColumn, panel.ColorFriendlyNPC , 16)
	panel.ColorNeutral= CreateQuickColorbox(objectName.."ColorNeutral", "Neutral", AlignmentColumn, panel.ColorFriendlyPlayer , 16)
	panel.ColorHostileNPC = CreateQuickColorbox(objectName.."ColorHostileNPC", "Hostile NPC", AlignmentColumn, panel.ColorNeutral , 16)
	panel.ColorHostilePlayer = CreateQuickColorbox(objectName.."ColorHostilePlayer", "Hostile Player", AlignmentColumn, panel.ColorHostileNPC , 16)
	panel.ColorGuildMember = CreateQuickColorbox(objectName.."ColorGuildMember", "Guild Member", AlignmentColumn, panel.ColorHostilePlayer , 16)

        panel.TextReactionColorLabel = CreateQuickItemLabel(nil, "Text Color:", AlignmentColumn, panel.ReactionLabel, OffsetColumnB )        	        
	panel.TextColorFriendlyNPC = CreateQuickColorbox(objectName.."TextColorFriendlyNPC", "Friendly NPC", AlignmentColumn, panel.ReactionColorLabel , OffsetColumnB + 16)
	panel.TextColorFriendlyPlayer = CreateQuickColorbox(objectName.."TextColorFriendlyPlayer", "Friendly Player", AlignmentColumn, panel.TextColorFriendlyNPC , OffsetColumnB + 16)
	panel.TextColorNeutral= CreateQuickColorbox(objectName.."TextColorNeutral", "Neutral", AlignmentColumn, panel.TextColorFriendlyPlayer , OffsetColumnB + 16)
	panel.TextColorHostileNPC = CreateQuickColorbox(objectName.."TextColorHostileNPC", "Hostile NPC", AlignmentColumn, panel.TextColorNeutral , OffsetColumnB + 16)
	panel.TextColorHostilePlayer = CreateQuickColorbox(objectName.."TextColorHostilePlayer", "Hostile Player", AlignmentColumn, panel.TextColorHostileNPC , OffsetColumnB + 16)
	panel.TextColorGuildMember = CreateQuickColorbox(objectName.."TextColorGuildMember", "Guild Member", AlignmentColumn, panel.TextColorHostilePlayer , OffsetColumnB + 16)
        
        
        
        -- , OffsetColumnB
        
        --[[
        -- Threat: Show Reaction Colors while Out-of-Combat
        
        -- Opt.
        -- Raid Member
        --]]
        
	------------------------------
	-- Threat
	------------------------------
	panel.ThreatLabel = CreateQuickHeadingLabel(nil, "Threat", AlignmentColumn, panel.ColorGuildMember, 0, 5)	
	panel.ThreatMode =  CreateQuickDropdown(objectName.."ThreatMode", "Threat Mode:", ThreatModes, 1, AlignmentColumn, panel.ThreatLabel, 0, 2)
	panel.ColorThreatColorLabels = CreateQuickItemLabel(nil, "Threat Colors:", AlignmentColumn, panel.ThreatMode, 0, 2)
	panel.ColorAttackingMe = CreateQuickColorbox(objectName.."ColorAttackingMe", "Warning", AlignmentColumn, panel.ColorThreatColorLabels , 16)
	panel.ColorAggroTransition = CreateQuickColorbox(objectName.."ColorAggroTransition", "Transition", AlignmentColumn, panel.ColorAttackingMe , 16)
	panel.ColorAttackingOthers = CreateQuickColorbox(objectName.."ColorAttackingOthers", "Safe", AlignmentColumn, panel.ColorAggroTransition, 16)
	
	panel.ColorEnableOffTank = CreateQuickCheckbutton(objectName.."ColorEnableOffTank", "Highlight Mobs Tanked by other Tanks", AlignmentColumn, panel.ColorAttackingOthers)
	panel.ColorAttackingOtherTank = CreateQuickColorbox(objectName.."ColorAttackingOtherTank", "Attacking another Tank", AlignmentColumn, panel.ColorEnableOffTank , 16)
	
	panel.ColorShowPartyAggro = CreateQuickCheckbutton(objectName.."ColorShowPartyAggro", "Highlight Group Members holding Aggro", AlignmentColumn, panel.ColorAttackingOtherTank)
	panel.ColorPartyAggro = CreateQuickColorbox(objectName.."ColorPartyAggro", "Group Member Aggro", AlignmentColumn, panel.ColorShowPartyAggro , 14)
	panel.ColorPartyAggroBar = CreateQuickCheckbutton(objectName.."ColorPartyAggroBar", "Health Bar Color", AlignmentColumn, panel.ColorPartyAggro, 16)
	panel.ColorPartyAggroGlow = CreateQuickCheckbutton(objectName.."ColorPartyAggroGlow", "Border/Warning Glow", AlignmentColumn, panel.ColorPartyAggroBar, 16)
	panel.ColorPartyAggroText = CreateQuickCheckbutton(objectName.."ColorPartyAggroText", "Name Text Color", AlignmentColumn, panel.ColorPartyAggroGlow, 16)

	------------------------------
	-- Health
	------------------------------
	panel.HealthLabel = CreateQuickHeadingLabel(nil, "Health", AlignmentColumn, panel.ColorPartyAggroText, 0, 5)	
	panel.HighHealthThreshold = CreateQuickSlider(objectName.."HighHealthThreshold", "High Health Threshold:", AlignmentColumn, panel.HealthLabel, 0, 2)
	panel.LowHealthThreshold =  CreateQuickSlider(objectName.."LowHealthThreshold", "Low Health Threshold:", AlignmentColumn, panel.HighHealthThreshold, 0, 2)
	panel.HealthColorLabels = CreateQuickItemLabel(nil, "Health Colors:", AlignmentColumn, panel.LowHealthThreshold, 0)
	panel.ColorHighHealth = CreateQuickColorbox(objectName.."ColorHighHealth", "High Health", AlignmentColumn, panel.HealthColorLabels , 16)
	panel.ColorMediumHealth = CreateQuickColorbox(objectName.."ColorMediumHealth", "Medium Health", AlignmentColumn, panel.ColorHighHealth , 16)
	panel.ColorLowHealth = CreateQuickColorbox(objectName.."ColorLowHealth", "Low Health", AlignmentColumn, panel.ColorMediumHealth , 16)
	
        ------------------------------
	-- Casting
	------------------------------
        panel.SpellCastLabel = CreateQuickHeadingLabel(nil, "Spell Casting", AlignmentColumn, panel.ColorLowHealth, 0, 5)	        
	panel.SpellCastColorLabel = CreateQuickItemLabel(nil, "Cast Bar Colors:", AlignmentColumn, panel.SpellCastLabel, 0, 2)
	panel.ColorNormalSpellCast = CreateQuickColorbox(objectName.."ColorNormalSpellCast", "Normal", AlignmentColumn, panel.SpellCastColorLabel , 16)
	panel.ColorUnIntpellCast = CreateQuickColorbox(objectName.."ColorUnIntpellCast", "Un-interruptible", AlignmentColumn, panel.ColorNormalSpellCast , 16)

	------------------------------
	-- Aura (Buff and Debuff) Widget
	------------------------------
	panel.DebuffsLabel = CreateQuickHeadingLabel(nil, "Buffs & Debuffs", AlignmentColumn, panel.ColorUnIntpellCast, 0, 5)
	panel.WidgetsDebuff = CreateQuickCheckbutton(objectName.."WidgetsDebuff", "Show Aura Timers", AlignmentColumn, panel.DebuffsLabel)
	panel.WidgetsDebuffStyle =  CreateQuickDropdown(objectName.."WidgetsDebuffStyle", "Icon Style:", DebuffStyles, 1, AlignmentColumn, panel.WidgetsDebuff, 16)
	panel.WidgetsAuraMode =  CreateQuickDropdown(objectName.."WidgetsAuraMode", "Filter Mode:", AuraWidgetModes, 1, AlignmentColumn, panel.WidgetsDebuffStyle, 16)		-- used to be WidgetsDebuffMode
	panel.WidgetsDebuffListLabel = CreateQuickItemLabel(nil, "Aura List:", AlignmentColumn, panel.WidgetsAuraMode, 16)	
	panel.WidgetsDebuffTrackList = CreateQuickEditbox(objectName.."WidgetsDebuffTrackList", AlignmentColumn, panel.WidgetsDebuffListLabel, 16)
	
	panel.WidgetAuraTrackDispelFriendly = CreateQuickCheckbutton(objectName.."WidgetAuraTrackDispelFriendly", "Track Dispellable Debuffs on Friendly Units", AlignmentColumn, panel.WidgetsDebuffTrackList, 0, 4)
	panel.WidgetAuraTrackCurse = CreateQuickCheckbutton(objectName.."WidgetAuraTrackCurse", "Curse", AlignmentColumn, panel.WidgetAuraTrackDispelFriendly, 16, -2)
	panel.WidgetAuraTrackDisease = CreateQuickCheckbutton(objectName.."WidgetAuraTrackDisease", "Disease", AlignmentColumn, panel.WidgetAuraTrackCurse, 16, -2)
	panel.WidgetAuraTrackMagic = CreateQuickCheckbutton(objectName.."WidgetAuraTrackMagic", "Magic", AlignmentColumn, panel.WidgetAuraTrackDisease, 16, -2)
	panel.WidgetAuraTrackPoison = CreateQuickCheckbutton(objectName.."WidgetAuraTrackPoison", "Poison", AlignmentColumn, panel.WidgetAuraTrackMagic, 16, -2)
	--panel.WidgetAuraColorDispelFriendly = CreateQuickCheckbutton(objectName.."WidgetAuraColorDispelFriendly", "Colored Highlight ", AlignmentColumn, panel.WidgetAuraTrackMagic, 16, -2)
	
	------------------------------
	-- Debuff Help Tip
	panel.DebuffHelpTip = CreateQuickItemLabel(nil, "Tip: |cffCCCCCCAuras should be listed with the exact name, or a spell ID number. "..
		"You can use the prefixes, 'My' or 'All', to distinguish personal damage spells from global crowd control spells. "..
		"Auras at the top of the list will get displayed before lower ones.", AlignmentColumn, panel.WidgetsDebuffListLabel, 225) -- 210, 275, )	
	panel.DebuffHelpTip:SetHeight(128)
	panel.DebuffHelpTip:SetWidth(200)
	panel.DebuffHelpTip.Text:SetJustifyV("TOP")
		
		
	--[[
		Stage 2:
			- Expand Options
			- Filtering mode: Show raid targets, show only my target
			
	--]]
	
	------------------------------
	--Widgets
	------------------------------
	panel.WidgetsLabel = CreateQuickHeadingLabel(nil, "Other Widgets", AlignmentColumn, panel.WidgetAuraTrackPoison, 0, 5)
	panel.WidgetTargetHighlight = CreateQuickCheckbutton(objectName.."WidgetTargetHighlight", "Show Highlight on Current Target", AlignmentColumn, panel.WidgetsLabel)
	panel.WidgetEliteIndicator = CreateQuickCheckbutton(objectName.."WidgetEliteIndicator", "Show Elite Indicator", AlignmentColumn, panel.WidgetTargetHighlight)
	panel.ClassEnemyIcon = CreateQuickCheckbutton(objectName.."ClassEnemyIcon", "Show Enemy Class Icons", AlignmentColumn, panel.WidgetEliteIndicator)
	panel.ClassPartyIcon = CreateQuickCheckbutton(objectName.."ClassPartyIcon", "Show Group Class Icons", AlignmentColumn, panel.ClassEnemyIcon)
	panel.WidgetsTotemIcon = CreateQuickCheckbutton(objectName.."WidgetsTotemIcon", "Show Totem Icons", AlignmentColumn, panel.ClassPartyIcon)
	panel.WidgetsComboPoints = CreateQuickCheckbutton(objectName.."WidgetsComboPoints", "Show Combo Points", AlignmentColumn, panel.WidgetsTotemIcon)
	panel.WidgetsThreatIndicator = CreateQuickCheckbutton(objectName.."WidgetsThreatIndicator", "Show Threat Indicator", AlignmentColumn, panel.WidgetsComboPoints)
	panel.WidgetsThreatIndicatorMode =  CreateQuickDropdown(objectName.."WidgetsThreatIndicatorMode", "Threat Indicator:", ThreatWidgetModes, 1, AlignmentColumn, panel.WidgetsThreatIndicator, 16)
	panel.WidgetsRangeIndicator = CreateQuickCheckbutton(objectName.."WidgetsRangeIndicator", "Show Party Range Warning", AlignmentColumn, panel.WidgetsThreatIndicatorMode)
	panel.WidgetsRangeMode =  CreateQuickDropdown(objectName.."WidgetsRangeMode", "Range:", RangeModes, 1, AlignmentColumn, panel.WidgetsRangeIndicator, 16)
	
	------------------------------
	--Frame
	------------------------------
	panel.AdvancedLabel = CreateQuickHeadingLabel(nil, "Advanced", AlignmentColumn, panel.WidgetsRangeMode, 0, 5)
	panel.AdvancedEnableUnitCache = CreateQuickCheckbutton(objectName.."AdvancedEnableUnitCache", "Enable Class & Title Caching ", AlignmentColumn, panel.AdvancedLabel)
        
	panel.FrameVerticalPosition = CreateQuickSlider(objectName.."FrameVerticalPosition", "Vertical Position of Artwork: (May cause targeting problems)", AlignmentColumn, panel.AdvancedEnableUnitCache, 0, 4)
	
	-- [[
	-- Blizz Button
	local BlizzOptionsButton = CreateFrame("Button", objectName.."BlizzButton", AlignmentColumn, "TidyPlatesPanelButtonTemplate")
	BlizzOptionsButton:SetPoint("TOPLEFT", panel.FrameVerticalPosition, "BOTTOMLEFT",-6, -18)
	BlizzOptionsButton:SetWidth(300)
	BlizzOptionsButton:SetText("Blizzard Nameplate Motion & Visibility...")
	BlizzOptionsButton:SetScript("OnClick", function() InterfaceOptionsFrame_OpenToCategory(_G["InterfaceOptionsNamesPanel"]) end)
	--]]
	
	panel.MainFrame:SetHeight(2800) 

	-- Slider Ranges
	SetSliderMechanics(panel.OpacityTarget, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacityNonTarget, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacitySpotlight, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacityFiltered, 1, 0, 1, .01)
	SetSliderMechanics(panel.ScaleFiltered, 1, .1, 3, .01)
	SetSliderMechanics(panel.ScaleStandard, 1, .1, 3, .01)
	SetSliderMechanics(panel.ScaleSpotlight, 1, .1, 3, .01)
	SetSliderMechanics(panel.FrameVerticalPosition, .5, 0, 1, .02)
	
	SetSliderMechanics(panel.HighHealthThreshold, .7, .5, 1, .01)
	SetSliderMechanics(panel.LowHealthThreshold, .3, 0, .5, .01)	
end

--local function OnLogin()
	-- Init 
	--InitializeTidyPlatesHubModes()
	
	-- Create Instances of Panels
	local TankPanel = CreateInterfacePanel( "HubPanelSettingsTank", "Tidy Plates Hub: |cFF3782D1Tank", nil ) 
	CreateInterfacePanelWidgets(TankPanel)
	InterfaceOptions_AddCategory(TankPanel)
	function ShowTidyPlatesHubTankPanel() InterfaceOptionsFrame_OpenToCategory(TankPanel) end

	local DamagePanel = CreateInterfacePanel( "HubPanelSettingsDamage", "Tidy Plates Hub: |cFFFF1100Damage", nil ) 
	CreateInterfacePanelWidgets(DamagePanel)
	InterfaceOptions_AddCategory(DamagePanel)
	function ShowTidyPlatesHubDamagePanel() InterfaceOptionsFrame_OpenToCategory(DamagePanel) end
--end
	
--local HubHandler = CreateFrame("Frame")
--HubHandler:SetScript("OnEvent", OnLogin)
--HubHandler:RegisterEvent("PLAYER_LOGIN")

	
	


--[[
local GladiatorPanel = CreateInterfacePanel( "HubPanelSettingsGladiator", "Tidy Plates Hub: |cFFAA6600Gladiator", nil ) 
CreateInterfacePanelWidgets(GladiatorPanel)
function ShowTidyPlatesHubGladiatorPanel() InterfaceOptionsFrame_OpenToCategory(GladiatorPanel) end
--]]
--[[

-- Testing

/run print(HubDamageConfigFrame:GetParent())
/run HubDamageConfigFrame:SetParent(UIParent); HubDamageConfigFrame:SetPoint("TOPLEFT")

HubDamageConfigFrame = DamagePanel

local HealerPanel = CreateInterfacePanel( "HubPanelSettingsHealer", "Tidy Plates Hub: |cFF44DD55Healer", nil ) 
CreateInterfacePanelWidgets(HealerPanel)
function ShowTidyPlatesHubHealerPanel() InterfaceOptionsFrame_OpenToCategory(HealerPanel) end
--]]

