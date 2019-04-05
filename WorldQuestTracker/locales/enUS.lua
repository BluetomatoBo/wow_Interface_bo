local L = LibStub("AceLocale-3.0"):NewLocale("WorldQuestTrackerAddon", "enUS", true) 
if not L then return end 

L["S_APOWER_AVAILABLE"] = "Available"
L["S_APOWER_NEXTLEVEL"] = "Next Level"
L["S_DECREASESIZE"] = "Decrease Size"
L["S_ENABLED"] = "Enabled"
L["S_ERROR_NOTIMELEFT"] = "This quest has no time left."
L["S_ERROR_NOTLOADEDYET"] = "This quest isn't loaded yet, please wait few seconds."
L["S_FACTION_TOOLTIP_SELECT"] = "Click: select this faction"
L["S_FACTION_TOOLTIP_TRACK"] = "Shift + Click: track this faction quests"
L["S_FLYMAP_SHOWTRACKEDONLY"] = "Tracked Only"
L["S_FLYMAP_SHOWTRACKEDONLY_DESC"] = "Show only quests being tracked"
L["S_FLYMAP_SHOWWORLDQUESTS"] = "Show World Quests"
L["S_GROUPFINDER_ACTIONS_CANCEL_APPLICATIONS"] = "click to cancel applications..."
L["S_GROUPFINDER_ACTIONS_CANCELING"] = "canceling..."
L["S_GROUPFINDER_ACTIONS_CREATE"] = "no group found?, click to start one"
L["S_GROUPFINDER_ACTIONS_CREATE_DIRECT"] = "create group"
L["S_GROUPFINDER_ACTIONS_LEAVEASK"] = "Leave the group?"
L["S_GROUPFINDER_ACTIONS_LEAVINGIN"] = "Leaving the group in (click to leave now):"
L["S_GROUPFINDER_ACTIONS_RETRYSEARCH"] = "retry search"
L["S_GROUPFINDER_ACTIONS_SEARCH"] = "click to start searching for groups"
L["S_GROUPFINDER_ACTIONS_SEARCH_RARENPC"] = "search for a group to kill this rare"
L["S_GROUPFINDER_ACTIONS_SEARCH_TOOLTIP"] = "Join a group doing this quest"
L["S_GROUPFINDER_ACTIONS_SEARCHING"] = "searching..."
L["S_GROUPFINDER_ACTIONS_SEARCHMORE"] = "click to search for more group members"
L["S_GROUPFINDER_ACTIONS_SEARCHOTHER"] = "Leave and Search a different group?"
L["S_GROUPFINDER_ACTIONS_UNAPPLY1"] = "click to remove the apply so we can create a new group"
L["S_GROUPFINDER_ACTIONS_UNLIST"] = "click to unlist your current group"
L["S_GROUPFINDER_ACTIONS_UNLISTING"] = "unlisting..."
L["S_GROUPFINDER_ACTIONS_WAITING"] = "waiting..."
L["S_GROUPFINDER_AUTOOPEN_RARENPC_TARGETED"] = "Auto Open on Target a Rare Mob"
L["S_GROUPFINDER_ENABLED"] = "Auto Open On New Quest"
L["S_GROUPFINDER_LEAVEOPTIONS"] = "Leave Group Options"
L["S_GROUPFINDER_LEAVEOPTIONS_AFTERX"] = "Leave After X Seconds"
L["S_GROUPFINDER_LEAVEOPTIONS_ASKX"] = "Don't Auto Leave, Just Ask for X Seconds"
L["S_GROUPFINDER_LEAVEOPTIONS_DONTLEAVE"] = "Don't Show Leave Panel"
L["S_GROUPFINDER_LEAVEOPTIONS_IMMEDIATELY"] = "Leave Immediately on Quest Completed"
L["S_GROUPFINDER_NOPVP"] = "Avoid PVP Servers"
L["S_GROUPFINDER_OT_ENABLED"] = "Show Buttons on the Objective Tracker"
L["S_GROUPFINDER_QUEUEBUSY"] = "you are already in a queue."
L["S_GROUPFINDER_QUEUEBUSY2"] = "couldn't show the group finder window: you're already in group or in queue."
L["S_GROUPFINDER_RESULTS_APPLYING"] = "There's %d remaining groups, click again"
L["S_GROUPFINDER_RESULTS_APPLYING1"] = "There's 1 remaining group to join, click again"
L["S_GROUPFINDER_RESULTS_FOUND"] = [=[found %d groups
click to start joining]=]
L["S_GROUPFINDER_RESULTS_FOUND1"] = [=[found 1 group
click to start joining]=]
L["S_GROUPFINDER_RESULTS_UNAPPLY"] = "%d applications remaining..."
L["S_GROUPFINDER_RIGHTCLICKCLOSE"] = "right click to close"
L["S_GROUPFINDER_SECONDS"] = "Seconds"
L["S_GROUPFINDER_TITLE"] = "Group Finder"
L["S_GROUPFINDER_TUTORIAL1"] = "Do world quests faster by joining a group doing the same quest!"
L["S_INCREASESIZE"] = "Increase Size"
L["S_MAPBAR_FILTER"] = "Filter"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES"] = "Faction Objectives"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES_DESC"] = "Show faction quests even if they has been filtered out."
L["S_MAPBAR_OPTIONS"] = "Options"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED"] = "Arrow Update Speed"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_HIGH"] = "Fast"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_MEDIUM"] = "Medium"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_REALTIME"] = "Real Time"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_SLOW"] = "Slow"
L["S_MAPBAR_OPTIONSMENU_EQUIPMENTICONS"] = "Equipment Icons"
L["S_MAPBAR_OPTIONSMENU_QUESTTRACKER"] = "Enable Quest Tracker"
L["S_MAPBAR_OPTIONSMENU_REFRESH"] = "Refresh"
L["S_MAPBAR_OPTIONSMENU_SOUNDENABLED"] = "Enable Sound"
L["S_MAPBAR_OPTIONSMENU_STATUSBAR_ONDISABLE"] = "use '/wqt statusbar' or the addon option under the Interface options to restore the statusbar."
L["S_MAPBAR_OPTIONSMENU_STATUSBAR_VISIBILITY"] = "Show Statusbar"
L["S_MAPBAR_OPTIONSMENU_STATUSBARANCHOR"] = "Anchor on Top"
L["S_MAPBAR_OPTIONSMENU_TOMTOM_WPPERSISTENT"] = "Waypoint Persistent"
L["S_MAPBAR_OPTIONSMENU_TRACKER_CURRENTZONE"] = "Current Zone Only"
L["S_MAPBAR_OPTIONSMENU_TRACKER_SCALE"] = "Tracker Scale: %s"
L["S_MAPBAR_OPTIONSMENU_TRACKERCONFIG"] = "Tracker Config"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_AUTO"] = "Automatic"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_CUSTOM"] = "Custom Position"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_LOCKED"] = "Locked"
L["S_MAPBAR_OPTIONSMENU_UNTRACKQUESTS"] = "Untrack All Quests"
L["S_MAPBAR_OPTIONSMENU_WORLDMAPCONFIG"] = "World Map Config"
L["S_MAPBAR_OPTIONSMENU_YARDSDISTANCE"] = "Show Yards Distance"
L["S_MAPBAR_OPTIONSMENU_ZONE_QUESTSUMMARY"] = "Quest Summary"
L["S_MAPBAR_OPTIONSMENU_ZONEMAPCONFIG"] = "Zone Map Config"
L["S_MAPBAR_RESOURCES_TOOLTIP_TRACKALL"] = "Click to track all: |cFFFFFFFF%s|r quests."
L["S_MAPBAR_SORTORDER"] = "Sort Order"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_FADE"] = "Fade Quests"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_OPTION"] = "Less Than %d Hours"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SHOWTEXT"] = "Time Left Text"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SORTBYTIME"] = "Sort by Time"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_TITLE"] = "Time Left"
L["S_MAPBAR_SUMMARY"] = "Summary"
L["S_MAPBAR_SUMMARYMENU_ACCOUNTWIDE"] = "Account Wide"
L["S_MAPBAR_SUMMARYMENU_MOREINFO"] = "Click for more info"
L["S_MAPBAR_SUMMARYMENU_NOATTENTION"] = [=[No quest being tracked on your other
characters has less than 2 hours left!]=]
L["S_MAPBAR_SUMMARYMENU_REQUIREATTENTION"] = "Require Attention"
L["S_MAPBAR_SUMMARYMENU_TODAYREWARDS"] = "Today's Rewards"
L["S_OPTIONS_ACCESSIBILITY"] = "Accessibility"
L["S_OPTIONS_ACCESSIBILITY_EXTRATRACKERMARK"] = "Extra Tracker Mark"
L["S_OPTIONS_ACCESSIBILITY_SHOWBOUNTYRING"] = "Show Bounty Ring"
L["S_OPTIONS_ANIMATIONS"] = "Do Animations"
L["S_OPTIONS_MAPFRAME_ALIGN"] = "Map Window Centralized"
L["S_OPTIONS_MAPFRAME_ERROR_SCALING_DISABLED"] = "You need to enable 'Map Window Scale' first, no value has changed."
L["S_OPTIONS_MAPFRAME_SCALE"] = "Map Window Scale"
L["S_OPTIONS_MAPFRAME_SCALE_ENABLED"] = "Enable Map Window Scaling"
L["S_OPTIONS_QUESTBLACKLIST"] = "Quest Blacklist"
L["S_OPTIONS_RESET"] = "Reset"
L["S_OPTIONS_SHOWFACTIONS"] = "Show Factions"
L["S_OPTIONS_TIMELEFT_NOPRIORITY"] = "No Priority by Time Left"
L["S_OPTIONS_TRACKER_RESETPOSITION"] = "Reset Position"
L["S_OPTIONS_WORLD_ANCHOR_LEFT"] = "Anchor to Left Side"
L["S_OPTIONS_WORLD_ANCHOR_RIGHT"] = "Anchor to Right Side"
L["S_OPTIONS_WORLD_DECREASEICONSPERROW"] = "Decrease Squares per Row"
L["S_OPTIONS_WORLD_INCREASEICONSPERROW"] = "Increase Squares per Row"
L["S_OPTIONS_WORLD_ORGANIZE_BYMAP"] = "Organize by Map"
L["S_OPTIONS_WORLD_ORGANIZE_BYTYPE"] = "Organize by Quest Type"
L["S_OPTIONS_ZONE_SHOWONLYTRACKED"] = "Only Tracked"
L["S_OVERALL"] = "Overall"
L["S_PARTY"] = "Party"
L["S_PARTY_DESC1"] = "Quests with a blue star means all party members have the quest."
L["S_PARTY_DESC2"] = "If a red star is shown, a party member isn't elegible to world quests or doesn't have WQT installed yet."
L["S_PARTY_PLAYERSWITH"] = "Players in the party With WQT:"
L["S_PARTY_PLAYERSWITHOUT"] = "Players in the party Without WQT:"
L["S_QUESTSCOMPLETED"] = "Quests Completed"
L["S_QUESTTYPE_ARTIFACTPOWER"] = "Artifact Power"
L["S_QUESTTYPE_DUNGEON"] = "Dungeon"
L["S_QUESTTYPE_EQUIPMENT"] = "Equipment"
L["S_QUESTTYPE_GOLD"] = "Gold"
L["S_QUESTTYPE_PETBATTLE"] = "Pet Battle"
L["S_QUESTTYPE_PROFESSION"] = "Profession"
L["S_QUESTTYPE_PVP"] = "PvP"
L["S_QUESTTYPE_RESOURCE"] = "Resources"
L["S_QUESTTYPE_TRADESKILL"] = "Trade Skill"
L["S_RAREFINDER_ADDFROMPREMADE"] = "Add Rares Found on Premade Groups"
L["S_RAREFINDER_NPC_NOTREGISTERED"] = "rare not in the database"
L["S_RAREFINDER_OPTIONS_ENGLISHSEARCH"] = "Always Search in English"
L["S_RAREFINDER_OPTIONS_SHOWICONS"] = "Show Icons for Active Rares"
L["S_RAREFINDER_SOUND_ALWAYSPLAY"] = "Play Even When Sound Effects Are Disabled"
L["S_RAREFINDER_SOUND_ENABLED"] = "Play Sound for Rare on Minimap"
L["S_RAREFINDER_SOUNDWARNING"] = "sound played due to a rare on the minimap, you may disable this sound at the options menu > rare finder sub menu."
L["S_RAREFINDER_TITLE"] = "Rare Finder"
L["S_RAREFINDER_TOOLTIP_REMOVE"] = "Remove"
L["S_RAREFINDER_TOOLTIP_SEACHREALM"] = "Search on other realms"
L["S_RAREFINDER_TOOLTIP_SPOTTEDBY"] = "Spotted By"
L["S_RAREFINDER_TOOLTIP_TIMEAGO"] = "minutes ago"
L["S_SUMMARYPANEL_EXPIRED"] = "EXPIRED"
L["S_SUMMARYPANEL_LAST15DAYS"] = "Last 15 Days"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_ACCOUNT"] = "Account Life Time Statistics"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_CHARACTER"] = "Character Life Time Statistics"
L["S_SUMMARYPANEL_OTHERCHARACTERS"] = "Other Characters"
L["S_TUTORIAL_AMOUNT"] = "indicates the amount to receive"
L["S_TUTORIAL_CLICKTOTRACK"] = "Click to track a quest."
L["S_TUTORIAL_PARTY"] = "When in party, a blue star is shown on quests that all party members have!"
L["S_TUTORIAL_TIMELEFT"] = "indicates the time left (+4 hours, +90 minutes, +30 minutes, less than 30 minutes)"
L["S_TUTORIAL_WORLDBUTTONS"] = [=[Click here to cycle among three types of summaries:

- |cFFFFAA11By Quest Type|r
- |cFFFFAA11By Zone|r
- |cFFFFAA11None|r

Click |cFFFFAA11Toggle Quests|r to hide quest locations.]=]
L["S_TUTORIAL_WORLDMAPBUTTON"] = "This button brings to you the Broken Isles map."
L["S_UNKNOWNQUEST"] = "Unknown Quest"
L["S_WORLDBUTTONS_SHOW_NONE"] = "Hide Summary"
L["S_WORLDBUTTONS_SHOW_TYPE"] = "Show Summary"
L["S_WORLDBUTTONS_SHOW_ZONE"] = "Order by Zone"
L["S_WORLDBUTTONS_TOGGLE_QUESTS"] = "Toggle Quests"
L["S_WORLDMAP_QUESTLOCATIONS"] = "Show Quest Locations"
L["S_WORLDMAP_QUESTSUMMARY"] = "Show Quest Summary"
L["S_WORLDMAP_TOOGLEQUESTS"] = "Toggle Quests"
L["S_WORLDMAP_TOOLTIP_TRACKALL"] = "track all quests on this list"
L["S_WORLDQUESTS"] = "World Quests"

