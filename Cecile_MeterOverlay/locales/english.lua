----------------------------------------------------------------------------------------------------
-- localized English (default) strings
--

--get the addon engine
local AddOnName, Engine = ...;

--force localization to Spanish (only for testing)
--_G.GAME_LOCALE = "esES"

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
L["NO_METER"] = "There is not damage meter active, please activate Details, Recount, Skada, TinyDPS or Numeration."
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
L["FORMAT_COMBAT_DPS"] = "Position - Combat - DPS - % Damange"
L["FORMAT_COMBAT_HEAL"] = "Position - Combat - HPS - % Heal"
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
L["TAGS_LIST"] = [[
This are the liste for the supported tags.

|cff0070de[dps]|r - Your current |cffff2020DPS|r.
|cff0070de[rdps]|r - Your raid |cffff2020DPS|r.
|cff0070de[damage]|r - Your current |cffff2020damage|r.
|cff0070de[rdamage]|r - Your raid |cffff2020damage|r.
|cff0070de[pdps]|r - Your % of raid |cffff2020damage|r. (Does not include % symbol)
|cff0070de[ndps]|r - Your position in the |cffff2020Dps|r list.

|cff0070de[hps]|r - Your current |cff44ff44HPS|r.
|cff0070de[rhps]|r - Your raid |cff44ff44HPS|r.
|cff0070de[healing]|r - Your current |cff44ff44healing|r.
|cff0070de[rhealing]|r - Your raid |cff44ff44healing|r.
|cff0070de[pheal]|r - Your % of raid |cff44ff44healing|r. (Does not include % symbol)
|cff0070de[nhealer]|r - Your position in the |cff44ff44Healers|r list.

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
L["ENABLE_DATATEXT_HIDE_OCC"] = "Hide Out Of Combat"
L["ENABLE_DATATEXT_HIDE_OCC_DESC"] = "Hide the floating datatext when we are Out Of Combat"
L["ENABLE_DATATEXT_BACGROUND"] ="Enable Background"
L["ENABLE_DATATEXT_BACGROUND_DESC"] ="Enable the floating datatext Background."
L["DATATEXT_HIDE_TYPE"] = "Hide Mode"
L["DATATEXT_HIDE_TYPE_DESC"] = "Change the datatext hide mode."
L["DATATEXT_HIDE_NORMAL"] = "Hide"
L["DATATEXT_HIDE_FADE"] = "Fade Out"
L["ENCOUNTERS_SETTINGS"] = "Encounters Records"
L["ENCOUNTERS_WARNING"] = [[
To use this options you need to have a Boss Encounter Module.

Current supported modules:

- |cff0070deDeadly Boss Mods|r
- |cff0070deBigWigs|r
]]
L["REPORT_SELF"]="Self";
L["REPORT_GUILD"]="Guild chat";
L["REPORT_INSTANCE"]="Instance chat";
L["ENCOUNTERS_STORE"]="Store boss encounters"
L["ENCOUNTERS_STORE_DESC"]="Enable to store boss encounters records"
L["ENCOUNTERS_WIPE"]="Wipe all data"
L["ENCOUNTERS_WIPE_DESC"]="Delete all stored information for all encounters"
L["ENCOUNTERS_INSTANCE"]="Instance"
L["ENCOUNTERS_INSTANCE_DESC"]="Select instance"
L["ENCOUNTERS_DIFFICULTY"]="Difficulty"
L["ENCOUNTERS_DIFFICULTY_DESC"]="Select difficulty"
L["ENCOUNTERS_CHOOSE"]="Encounter"
L["ENCOUNTERS_CHOOSE_DESC"]="Select encounter"
L["ENCOUNTERS_BROWSE"]="Browse saved encounters"
L["ENCOUNTERS_TOP_RECORDS_DESC"]="Encounter records"
L["ENCOUNTERS_PLAYER_RECORDS_DESC"]="Encounter personal records"
L["ENCOUNTERS_RECORD_DPS_LINE"]="|c%s%s|r |cffff2020%s DPS |r on |cff0070de%s|r with a group size of |cff0070de%s|r"
L["ENCOUNTERS_RECORD_HPS_LINE"]="|c%s%s|r |cff44ff44%s HPS |r on |cff0070de%s|r with a group size of |cff0070de%s|r"
L["REPORT_NOW"]="Report now"
L["REPORT_NOW_TOP_DESC"]="Report records now"
L["REPORT_NOW_PLAYER_DESC"]="Report personal records now"
L["REPORT_NOW_TO"]="Report now to.."
L["REPORT_TO_DESC"]="Select which channel to report"
L["REPORT_ENCOUNTER_RECORDS_TOP"]="|cfffff569%s|r records for |cff0070de%s|r (%s):"
L["REPORT_ENCOUNTER_RECORDS_PLAYER"]="|cfffff569%s|r personal records for |cff0070de%s|r (%s):"
L["ENCOUNTERS_AUTO_REPORT_TOP"]="Auto report records"
L["ENCOUNTERS_AUTO_REPORT_TOP_DESC"]="Enable to auto report new records"
L["ENCOUNTERS_AUTO_REPORT_PLAYER"]="Auto report personal"
L["ENCOUNTERS_AUTO_REPORT_PLAYER_DESC"]="Enable to auto report new personal records"
L["ENCOUNTERS_AUTO_REPORT_TYPE"]="Auto report to.."
L["ENCOUNTERS_AUTO_REPORT_TYPE_DESC"]="Select which channel to auto report"
L["ENCOUNTERS_NEW_RECORD_DPS"]="- new |c%s%s|r |cffff2020%s DPS|r"
L["ENCOUNTERS_NEW_RECORD_HPS"]="- new |c%s%s|r |cff44ff44%s HPS|r"
L["ENCOUNTERS_NEW_RECORD_DPS_OVER"]="- new |c%s%s|r |cffff2020%s DPS|r, was |c%s%s|r |cffff2020%s DPS|r"
L["ENCOUNTERS_NEW_RECORD_HPS_OVER"]="- new |c%s%s|r |cff44ff44%s HPS|r, was |c%s%s|r |cff44ff44%s HPS|r"
L["ENCOUNTERS_FAIL_RECORD_DPS"]="- retained |c%s%s|r |cffff2020%s DPS|r, attempt |c%s%s|r |cffff2020%s DPS|r"
L["ENCOUNTERS_FAIL_RECORD_HPS"]="- retained |c%s%s|r |cff44ff44%s HPS|r, attempt |c%s%s|r |cff44ff44%s HPS|r"
L["STRATA_BACKGROUND"] = "Background"
L["STRATA_LOW"] = "Low"
L["STRATA_MEDIUM"] = "Medium"
L["STRATA_HIGH"] = "High"
L["STRATA_DIALOG"] = "Dialog"
L["STRATA_FULLSCREEN"] = "Full Screen"
L["STRATA_FULLSCREEN_DIALOG"] = "Full Screen Dialog"
L["STRATA_TOOLTIP"] = "Tooltip"
L["STRATA_TYPE"] = "Frame Strata"
L["STRATA_TYPE_DESC"] = "Change the datatext frame strata"
L["COLOR"] = "Datatext Colors"
L["COLOR_DESC"] = "Change the datatext colors"
L["DATATEXT_GENERAL_COLOR"] = "General Text Color"
L["DATATEXT_GENERAL_COLOR_DESC"] = "Change the color for general text"
L["DATATEXT_DAMAGE_COLOR"] = "Damage Tags Color"
L["DATATEXT_DAMAGE_COLOR_DESC"] = "Change the color for damage tags"
L["DATATEXT_HEALING_COLOR"] = "Healing Tags Color"
L["DATATEXT_HEALING_COLOR_DESC"] = "Change the color for healing tags"
L["DATATEXT_OTHER_COLOR"] = "Other Tags Color"
L["DATATEXT_OTHER_COLOR_DESC"] = "Change the color for other tags"
L["BROWSE_RECORDS"] = "Browse Records"
L["BROWSE_RECORDS_DESC"] = "Opens a window to browse saved records"
L["BROWSE_RECORDS_WINDOW"] = "Encounters Records"
L["BROWSE_RECORDS_STATUS"] = "Browsign Stored Encounters Records"
L["HEADER_RECORDS_INSTANCE"] = "Records for |cff0070de%s|r"
L["HEADER_RECORDS_INSTANCE_DIFFICULT"] = "Records for |cff0070de%s|r (|cffffff00%s|r)"
L["HEADER_RECORDS_INSTANCE_DIFFICULT_ENCOUNTER"] = "Records for |cff0070de%s|r (|cffffff00%s|r) : |cffff7f3f%s|r"
L["RECORDS_INSTANCE_DESC"] = "You have |cffff7f3f%d|r encounters records in this instance."
L["RECORDS_INSTANCE_DIFIFICULT_DESC"] = "You have |cffff7f3f%d|r encounter records in this instance & difficulty."
L["RECORDS_TREE_INSTANCE_FORMAT"] = "|cff0070de%s|r"
L["RECORDS_TREE_DIFFICULT_FORMAT"] = "|cffffff00%s|r"
L["RECORDS_TREE_ENCOUNTER_FORMAT"] = "|cffff7f3f%s|r"
L["RECORD_WARNING_WIPE_ALL"] = [[
|cffff2020Wipping all data|r will erase all saved encounters records.

Are you really sure to |cffff2020delete all data|r?"
]]

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