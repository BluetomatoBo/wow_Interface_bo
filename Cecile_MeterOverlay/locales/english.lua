----------------------------------------------------------------------------------------------------
-- localized English (default) strings
--

--get the addon engine
local AddOnName, Engine = ...;

--_G.GAME_LOCALE = "esMX"

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end 

--set the localized strings
L["LOAD_MESSAGE"] = "%s (version |cff0070de%s|r) loaded, type /%s or /%s for options."
L["CONFIG_NAME"] = "Cecile Meter Overlay"
L["GENERAL"] = "General"
L["PROFILES"] = "Profiles"
L["GENERAL_SETTINGS"] = "General Settings"
L["DEV_SETTINGS"] = "Developer Settings"
L["DEBUGGING"] = "Enable Debugging"
L["DEBUGGING_DESC"] = "Enable AddOn debugging and show the debug window."
L["DATATEXT"] = "Floating Datatext"
L["ENABLE_DATATEXT"] ="Enabled"
L["ENABLE_DATATEXT_DESC"] ="Enable the floating datatext."
L["LOCKDATATEXT"] = "Lock"
L["LOCKDATATEXT_DESC"] = "Lock the floating datatext position."
L["OPEN_CONFIG"] = "Open Config"
L["OPEN_CONFIG_DESC"] = "Open the configuration window."
L["CONFIG_WINDOW"] = "%s (version |cff0070de%s|r) configuration tool."
L["NO_DATA"] = "No Data"
L["NO_METER"] = "There is not damage meter active, please activate Recount, Skada or TinyDPS."
L["OVERALL_DATA"] = "Overall Data"
L["CURRENT_DATA"] = "Current Fight"
L["LAST_DATA"] = "Last Fight"
L["DAMAGE_DONE"] = "Damage Done"
L["HEALING_DONE"] = "Healing Done"
L["FORMAT_OWN_DPS"] = "Own DPS"
L["FORMAT_OWN_HPS"] = "Own HPS"
L["FORMAT_OWN_DPS_OWN_HPS"] = "Own DPS - Own HPS"
L["FORMAT_RAID_DPS"] = "Raid DPS"
L["FORMAT_RAID_HPS"] = "Raid HPS"
L["FORMAT_OWN_DPS_RAID_DPS"] = "Own DPS - Raid DPS"
L["FORMAT_OWN_HPS_RAID_HPS"] = "Own HPS - Raid HPS"
L["FORMAT_OWN_HPS_RAID_DPS"] = "Own HPS - Raid DPS"
L["FORMAT_OWN_DPS_RAID_HPS"] = "Own DPS - Raid HPS"
L["FORMAT_RAID_DPS_RAID_HPS"] = "Raid DPS - Raid HPS"
L["FORMAT_OWN_DPS_RAID_DPS_OWN_HPS_RAID_HPS"] = "Own DPS - Raid DPS - Own HPS - Raid HPS"
L["FORMAT_DEFAULT_DPS"] = "Position Player Name : Damage (dps)"
L["FORMAT_DEFAULT_HEALER"] = "Position Player Name :  Healing (hps)"
L["FORMAT_CUSTOM"] = "Custom Format"
L["FORMAT"] = "Datatext Format"
L["FORMAT_DESC"] = "Define the datatext format"
L["FORMAT_CUSTOM_DESC"] = "Define custom format"
L["UPDATE_INTERVAL"] = "Update Interval"
L["UPDATE_INTERVAL_DESC"] = "Set the update interval, in seconds"
L["EXAMPLE"] = "Example"
L["SEGMENT"] = "Data Segment"
L["SEGMENT_DESC"] = "Set the source data segment."
L["TAGS"] = "Tags"
L.tags = [[
This are the liste for the supported tags.

|cff0070de[dps]|r - Your current |cffff2020DPS|r.
|cff0070de[rdps]|r - Your raid |cffff2020DPS|r.
|cff0070de[damage]|r - Your current |cffff2020damage|r.
|cff0070de[rdamage]|r - Your raid |cffff2020damage|r.
|cff0070de[ndps]|r - Your position in the |cffff2020Dps|r list.

|cff0070de[hps]|r - Your current |cff44ff44HPS|r.
|cff0070de[rhps]|r - Your raid |cff44ff44HPS|r.
|cff0070de[healing]|r - Your current |cff44ff44healing|r.
|cff0070de[rhealing]|r - Your raid |cff44ff44healing|r.
|cff0070de[nhps]|r - Your position in the |cff44ff44Healers|r list.

|cff0070de[meter]|r - The name of the active |cff82c5ffdamage meter|r.
|cff0070de[combat]|r - The current |cffffff00combat|r.
|cff0070de[dataset]|r - The active |cffffff00data segment|r.
|cff0070de[player]|r - The player |cffff7f3fname|r.
]]
L["OVERLAY_TYPE"] = "Overlay Type"
L["OVERLAY_TYPE_DESC"] = "Sets the overlay type."
L["OVERLAY_TYPE_DPS"] = "Damage Done"
L["OVERLAY_TYPE_HEAL"] = "Healing Done"
L["OVERLAY_TYPE_BOTH"] = "Damage & Healing Done"
L["NUM_LINES"] = "Overlay Lines"
L["NUM_LINES_DESC"] = "Set the maximum number of line to show in the overlay."
L["TIP_UNLOCK"] = [[
|cffaaaaaaleft click to move
right click for options.|r
]]
L["TIP_LOCK"] = [[
|cffaaaaaaleft click toggle damage metter
right click for options.|r
]]
L["FONT_NAME"] = "Font Name"
L["FONT_NAME_DESC"] = "Sets the font name."
L["FONT_SIZE"] = "Font Size"
L["FONT_SIZE_DESC"] = "Sets the font size."
L["OVERLAY_SETTINGS"] = "Overlay Settings"
L["HEIGHT"] = "Height"
L["HEIGHT_DESC"] = "Sets the height."
L["WIDTH"] = "Width"
L["WIDTH_DESC"] = "Sets the Width."
L["TIP"] = "Show Click Tips"
L["TIP_DESC"] = "Show mouse click tips in the overlay."
L["TOTALS"] = "Show Totals"
L["TOTALS_DESC"] = "Show a total line in the overlay."
L["TUKUI_CONFIG"] = "Cecile_MeterOverlay position (0 for disabled)"
L["DEBUG_WINDOW_HELP"] = "Mouse wheel to scroll (with shift scroll top/bottom). Title bar drags. Bottom-right corner resizes."
L["WRONG_VERSION"] = "%s - A new version (|cff0070de%s|r) for this addon its available, please update your version."
L["PLAYER_VERSION"] = "%s - Player %s has a outdated version (|cff0070de%s|r) for this addon."
L["ELV_TUK_OVERRIDE"] = "Override ElvUI/TukUI format"
L["ELV_TUK_OVERRIDE_DESC"] = "Override ElvUI/TukUI tooltip format, changing font and background."
L["OVERLAY_BG_COLOR"] = "Backgroud Color"
L["OVERLAY_BG_COLOR_DESC"] = "Change the background color, including blend (alpha)."
L["OVERLAY_HIDE_TYPE"] = "Hide Mode"
L["OVERLAY_HIDE_TYPE_DESC"] = "Change the overlay hide mode."
L["OVERLAY_HIDE_NORMAL"] = "Hide"
L["OVERLAY_HIDE_FADE"] = "Fade Out"
L["ENABLE_DATATEXT_BACGROUND"] ="Enable Background"
L["ENABLE_DATATEXT_BACGROUND_DESC"] ="Enable the floating datatext Background."

--get ordinal sufix for a number (1st,2nd,3rd,4th...) (english locale)
function Engine:OrdinalSuffix(number)
    local modnumber = math.fmod(number, 100)
    local d = math.fmod(modnumber, 10)
    if d == 1 and modnumber ~= 11 then
        return "st";
    elseif d == 2 and modnumber ~= 12 then
        return "nd";
    elseif d == 3 and modnumber ~= 13 then
        return "rd";
    else
        return "th";
    end
end