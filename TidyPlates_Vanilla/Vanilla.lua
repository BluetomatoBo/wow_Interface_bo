
---------------------------------------------
-- Style Definition
---------------------------------------------
local ArtworkPath = "Interface\\Addons\\TidyPlates_Vanilla\\"
--local font = "Interface\\Addons\\TidyPlatesHub\\shared\\AccidentalPresidency.ttf"; local fontsize = 12;
local font = "Interface\\Addons\\TidyPlatesHub\\shared\\RobotoCondensed-Bold.ttf"; local fontsize = 10;
--print(font, fontsize)
--local fontsize = 12;
local EmptyTexture = "Interface\\Addons\\TidyPlatesHub\\shared\\Empty"
local VerticalAdjustment = 12
local CastBarHorizontalAdjustment = 22
local CastBarVerticalAdjustment = VerticalAdjustment - 18
local NameTextVerticalAdjustment = VerticalAdjustment - 9

-- Non-Latin Font Bypass
local NonLatinLocales = { ["koKR"] = true, ["zhCN"] = true, ["zhTW"] = true, }
if NonLatinLocales[GetLocale()] == true then font = STANDARD_TEXT_FONT end


--   /run print(TidyPlates.ActiveThemeTable["Default"].frame.y)
---------------------------------------------
-- Default Style
---------------------------------------------
local Theme = {}
local StyleDefault = {}

------------------------------------------------
--	Blizzard-Style (Used for the default/fallback theme)
------------------------------------------------

local BlizzardTheme = {}

BlizzardTheme.highlight.texture = ArtworkPath.."NameplateGlow"
BlizzardTheme.highlight.width = 256
BlizzardTheme.highlight.height = 32

BlizzardTheme.healthborder.texture		 =			ArtworkPath.."NameplateBorder"
BlizzardTheme.healthborder.width = 128
BlizzardTheme.healthborder.height = 32
BlizzardTheme.healthborder.x = 0
BlizzardTheme.healthborder.y = 0 + BlizzardThemeVertical
BlizzardTheme.healthborder.right = .50

BlizzardTheme.eliteicon.texture =					ArtworkPath.."NameplateEliteIcon"
BlizzardTheme.eliteicon.width = 32
BlizzardTheme.eliteicon.height = 32
BlizzardTheme.eliteicon.x = 22
BlizzardTheme.eliteicon.y = -8.5 + BlizzardThemeVertical
BlizzardTheme.eliteicon.anchor = "RIGHT"
BlizzardTheme.eliteicon.show = true
BlizzardTheme.eliteicon.left = 0
BlizzardTheme.eliteicon.right = .578125
BlizzardTheme.eliteicon.top = 0
BlizzardTheme.eliteicon.bottom = .84375

BlizzardTheme.threatborder.texture =				ArtworkPath.."NameplateGlow"
BlizzardTheme.threatborder.width = 140
BlizzardTheme.threatborder.height = 32
BlizzardTheme.threatborder.x = 0
BlizzardTheme.threatborder.y = -10 + BlizzardThemeVertical
BlizzardTheme.threatborder.left = 0
BlizzardTheme.threatborder.right = .555
BlizzardTheme.threatborder.top = .53
BlizzardTheme.threatborder.bottom = .6

BlizzardTheme.castborder.texture =					ArtworkPath.."NameplateCastNormal"
BlizzardTheme.castborder.width = 128
BlizzardTheme.castborder.height = 32
BlizzardTheme.castborder.x = -17
BlizzardTheme.castborder.y = -24 + BlizzardThemeVertical

BlizzardTheme.castnostop.texture = 					ArtworkPath.."NameplateCastProtected"
BlizzardTheme.castnostop.width = 128
BlizzardTheme.castnostop.height = 32
BlizzardTheme.castnostop.x = -17
BlizzardTheme.castnostop.y = -24 + BlizzardThemeVertical

BlizzardTheme.name.typeface = NAMEPLATE_FONT
BlizzardTheme.name.size = 12
BlizzardTheme.name.width = 200
BlizzardTheme.name.height = 16
BlizzardTheme.name.x = 0
BlizzardTheme.name.y = 8 + BlizzardThemeVertical
BlizzardTheme.name.align = "CENTER"
BlizzardTheme.name.anchor = "CENTER"
BlizzardTheme.name.shadow = true
BlizzardTheme.name.vertical = "BOTTOM"
BlizzardTheme.name.flags = "OUTLINE"

BlizzardTheme.level.typeface = NAMEPLATE_FONT
BlizzardTheme.level.size = 9
BlizzardTheme.level.width = 25
BlizzardTheme.level.height = 10
BlizzardTheme.level.x = 15
BlizzardTheme.level.y = -6.5 + BlizzardThemeVertical
BlizzardTheme.level.align = "CENTER"
BlizzardTheme.level.anchor = "RIGHT"
BlizzardTheme.level.vertical = "BOTTOM"
BlizzardTheme.level.shadow = true
BlizzardTheme.level.flags = "NONE"

BlizzardTheme.healthbar.texture =					 "Interface\\TARGETINGFRAME\\UI-StatusBar"
BlizzardTheme.healthbar.backdrop = 				EMPTY_TEXTURE
BlizzardTheme.healthbar.height = 9
BlizzardTheme.healthbar.width = 104
BlizzardTheme.healthbar.x = -8.5
BlizzardTheme.healthbar.y = -7	+ BlizzardThemeVertical

BlizzardTheme.castbar.texture =					"Interface\\TARGETINGFRAME\\UI-StatusBar"
BlizzardTheme.castbar.backdrop = 				EMPTY_TEXTURE
BlizzardTheme.castbar.height = 9
BlizzardTheme.castbar.width = 102
BlizzardTheme.castbar.x = -8.5
BlizzardTheme.castbar.y = -24 + BlizzardThemeVertical

BlizzardTheme.spellicon.width = 14
BlizzardTheme.spellicon.height = 14
BlizzardTheme.spellicon.x = -25.5
BlizzardTheme.spellicon.y = -24 + BlizzardThemeVertical
BlizzardTheme.spellicon.anchor = "LEFT"
BlizzardTheme.spellicon.show = true

BlizzardTheme.raidicon.width = 20
BlizzardTheme.raidicon.height = 20
BlizzardTheme.raidicon.x = 0
BlizzardTheme.raidicon.y = 8 + BlizzardThemeVertical
BlizzardTheme.raidicon.anchor = "TOP"
BlizzardTheme.raidicon.show = true

BlizzardTheme.skullicon.texture = "Interface\\TargetingFrame\\UI-TargetingFrame-Skull"
BlizzardTheme.skullicon.width = 15
BlizzardTheme.skullicon.height = 15
BlizzardTheme.skullicon.x = 53
BlizzardTheme.skullicon.y = -7 + BlizzardThemeVertical
BlizzardTheme.skullicon.anchor = "CENTER"
BlizzardTheme.skullicon.show = true

BlizzardTheme.customtext.size = 9
BlizzardTheme.customtext.y = -6.5 + BlizzardThemeVertical
BlizzardTheme.customtext.x = -7
BlizzardTheme.customtext.align = "CENTER"
BlizzardTheme.customtext.anchor = "CENTER"
BlizzardTheme.customtext.height = 10
BlizzardTheme.customtext.width = 100

BlizzardTheme.frame.width = 101
BlizzardTheme.frame.height = 45
BlizzardTheme.frame.x = 0
BlizzardTheme.frame.y = 0
BlizzardTheme.frame.anchor = "CENTER"

--]]

--[[
BlizzardTheme.target = {
	texture = EMPTY_TEXTURE,
	width = 128,
	height = 64,
	x = 0,
	y = -5,
	anchor = "CENTER",
	show = false,
}


BlizzardTheme.spelltext = {
	typeface =					font,
	size = 9,
	width = 93,
	height = 10,
	x = 0,
	y = 11,
	align = "RIGHT",
	anchor = "CENTER",
	vertical = "BOTTOM",
	shadow = true,
	flags = "NONE",
	show = false,
}

BlizzardTheme.customtext = {
	typeface =					font,
	size = 8,
	width = 100,
	height = 10,
	x = 1,
	y = -19,
	align = "LEFT",
	anchor = "CENTER",
	vertical = "BOTTOM",
	shadow = true,
	flags = "NONE",
	show = false,
}


-- Active Styles
Theme["Default"] = StyleDefault
Theme["NameOnly"] = StyleTextOnly

--[[
Theme["Default-NoAura"] = DefaultNoAura

Theme["NameOnly-NoAura"] = TextNoAura
Theme["NameOnly-NoDescription"] = TextNoDescription
--]]

-- Widget
local WidgetConfig = {}
WidgetConfig.ClassIcon = { anchor = "TOP" , x = 30 ,y = VerticalAdjustment -1 }
WidgetConfig.TotemIcon = { anchor = "TOP" , x = 0 ,y = VerticalAdjustment + 2 }
WidgetConfig.ThreatLineWidget = { anchor =  "CENTER", x = 0 ,y = VerticalAdjustment + 4 }
WidgetConfig.ThreatWheelWidget = { anchor =  "CENTER", x = 36 ,y = VerticalAdjustment + 12 } -- "CENTER", plate, 30, 18
WidgetConfig.ComboWidget = { anchor = "CENTER" , x = 0 ,y = VerticalAdjustment + 9.5 }
WidgetConfig.RangeWidget = { anchor = "CENTER" , x = 0 ,y = VerticalAdjustment + 0 }
WidgetConfig.DebuffWidget = { anchor = "CENTER" , x = 15 ,y = VerticalAdjustment + 17 }
--if (UnitClassBase("player") == "Druid") or (UnitClassBase("player") == "Rogue") then
	WidgetConfig.DebuffWidgetPlus = { anchor = "CENTER" , x = 15 ,y = VerticalAdjustment + 24 }
--end

WidgetConfig._meta = true		-- tells the parser to ignore this table; ie. don't convert to "style" template
Theme.WidgetConfig = WidgetConfig
local ThemeName = "Neon"

---------------------------------------------
-- Tidy Plates Hub Integration
---------------------------------------------
TidyPlatesThemeList[ThemeName] = Theme
TidyPlatesHubFunctions.ApplyHubFunctions(Theme)





