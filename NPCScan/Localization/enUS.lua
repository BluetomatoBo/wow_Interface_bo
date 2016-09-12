local AddOnFolderName, private = ...

local isReleaseVersion = true
--[===[@debug@
isReleaseVersion = false
--@end-debug@]===]

local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "enUS", isReleaseVersion, isReleaseVersion)
if not L then return end

L["Alerts"] = true
L["BOTTOM"] = "Bottom"
L["BOTTOMLEFT"] = "Bottom Left"
L["BOTTOMRIGHT"] = "Bottom Right"
L["CENTER"] = "Center"
L["Completed Achievement Criteria"] = true
L["Completed Quest Objectives"] = true
L["Detection"] = true
L["Drag to set the spawn point for targeting buttons."] = true
L["Duration"] = true
L["Hide Anchor"] = true
L["Horizontal offset from the anchor point."] = true
L["Ignore Mute"] = true
L["Interval"] = true
L["LEFT"] = "Left"
L["NPCs"] = true
L["Play alert sounds when sound is muted."] = true
L["Reset Position"] = true
L["RIGHT"] = "Right"
L["Screen Flash"] = true
L["Screen Location"] = true
L["Show Anchor"] = true
L["Spawn Point"] = true
L["The number of minutes a targeting button will exist before fading out."] = true
L["The number of minutes before an NPC will be detected again."] = true
L["TOP"] = "Top"
L["TOPLEFT"] = "Top Left"
L["TOPRIGHT"] = "Top Right"
L["Vertical offset from the anchor point."] = true
L["X Offset"] = true
L["Y Offset"] = true
L["Vignette/Abandoned Fishing Pole"] = "Abandoned Fishing Pole"
L["Vignette/Amateur Hunters"] = "Amateur Hunters"
L["Vignette/Beastmaster Pao'lek"] = "Beastmaster Pao'lek"
L["Vignette/Cache of Infernals"] = "Cache of Infernals"
L["Vignette/Coura, Master of Arcana"] = "Coura, Master of Arcana"
L["Vignette/Forsaken Deathsquad"] = "Forsaken Deathsquad"
L["Vignette/Helmouth Raiders"] = "Helmouth Raiders"
L["Vignette/Hook & Sinker"] = "Hook & Sinker"
L["Vignette/Horn of the Siren"] = "Horn of the Siren"
L["Vignette/Invasion Point: Devastation"] = "Invasion Point: Devastation"
L["Vignette/Lost Ettin"] = "Lost Ettin"
L["Vignette/Perrexx the Corruptor"] = "Perrexx the Corruptor"
L["Vignette/Sea Giant King"] = "Sea Giant King"
L["Vignette/Seek & Destroy Squad"] = "Seek & Destroy Squad"
L["Vignette/Shivering Ashmaw Cub"] = "Shivering Ashmaw Cub"
L["Vignette/Stormdrake Matriarch"] = "Stormdrake Matriarch"
L["Vignette/Syphonus & Leodrath"] = "Syphonus & Leodrath"
L["Vignette/Thane's Mead Hall"] = "Thane's Mead Hall"
L["Vignette/The Beastly Boxer"] = "The Beastly Boxer"
L["Vignette/Trecherous Stallions"] = "Trecherous Stallions"
L["Vignette/Undgrell Attack"] = "Undgrell Attack"
L["Vignette/Worgen Stalkers"] = "Worgen Stalkers"
L["Vignette/Worg Pack"] = "Worg Pack"


local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "enUS", isReleaseVersion, isReleaseVersion)
if not VL then return end

VL["Abandoned Fishing Pole"] = true
VL["Amateur Hunters"] = true
VL["Beastmaster Pao'lek"] = true
VL["Cache of Infernals"] = true
VL["Coura, Master of Arcana"] = true
VL["Forsaken Deathsquad"] = true
VL["Helmouth Raiders"] = true
VL["Hook & Sinker"] = true
VL["Horn of the Siren"] = true
VL["Invasion Point: Devastation"] = true
VL["Lost Ettin"] = true
VL["Perrexx the Corruptor"] = true
VL["Sea Giant King"] = true
VL["Seek & Destroy Squad"] = true
VL["Shivering Ashmaw Cub"] = true
VL["Stormdrake Matriarch"] = true
VL["Syphonus & Leodrath"] = true
VL["Thane's Mead Hall"] = true
VL["The Beastly Boxer"] = true
VL["Trecherous Stallions"] = true
VL["Undgrell Attack"] = true
VL["Worgen Stalkers"] = true
VL["Worg Pack"] = true

