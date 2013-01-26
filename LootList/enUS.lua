-- Default English Localization
--
-- Addon Name
LOOTLIST_LABEL_LOOTLIST = "LootList";
LOOTLIST_LABEL_LOOTLISTIMPORT = "LootList Import";
LOOTLIST_LABEL_LOOTLISTEXPORT = "LootList Export";

-- Addon Bindings
BINDING_HEADER_LOOTLIST = "LootList";
BINDING_NAME_LOOTLIST_TOGGLE = "Show/Hide LootList";
BINDING_NAME_LOOTLIST_TOGGLE_DESC = "Toggle Visibility of LootList";

-- Addon MotD
LOOTLIST_MSG_LOAD = "LootList v%s loaded";

-- Addon Dialog Colour
LOOTLIST_DIALOG_CLR = { r=0.00, g=0.00, b=0.00, acf=0.80, att=1.00 };

-- Addon Commands
LOOTLIST_CMD_HELP = "help";
LOOTLIST_CMD_SHOW = "show";
LOOTLIST_CMD_HIDE = "hide";
LOOTLIST_CMD_RESETUI = "resetui";

-- Addon Help
LOOTLIST_HELP_LINE1 = "LootList commands:";
LOOTLIST_HELP_LINE2 = " help - display this help";
LOOTLIST_HELP_LINE3 = " show - show LootList interface";
LOOTLIST_HELP_LINE4 = " hide - hide LootList interface";
LOOTLIST_HELP_LINE5 = " resetui - reset LootList interface window positions";

-- LootList Frame
LOOTLIST_FRAME_VERSION = "Version:";
LOOTLIST_LABEL_LISTS = "Lists";
LOOTLIST_FRAME_LISTS_TT = "Show LootList Lists";
LOOTLIST_LABEL_OPTIONS = "Options";
LOOTLIST_FRAME_OPTIONS_TT = "Show LootList Options";
LOOTLIST_FRAME_CLOSE_TT = "Close LootList Window";

-- LootList Import Frame
LOOTLIST_IMPORTFRAME_CLOSE_TT = "Close LootList Import Window";

-- LootList Export Frame
LOOTLIST_EXPORTFRAME_CLOSE_TT = "Close LootList Export Window";

-- LootList Lists Frame
LOOTLIST_LISTS_MANUAL = "Manual";

LOOTLIST_LISTS_PROCHELP = "\n\nWhen using a Pawn scale:\n|cff1eff00< 0.0|r  To use Pawn value. Appears |cff999999grey|r on Pawn error\n|cffff8400= 0.0|r  To show this metric blank\n|cffff0000> 0.0|r  To use this metric value\n\nWhen using Manual Only Scale:\n|cffff8400= 0.0|r  To show this metric blank\n|cff0070dd> 0.0|r  To use this metric value";

LOOTLIST_LISTS_LIST = "List Name";
LOOTLIST_LISTS_CREATE = "Create";
LOOTLIST_LISTS_CREATE_TT = "Create a New Loot List";
LOOTLIST_LISTS_MODIFY = "Modify";
LOOTLIST_LISTS_MODIFY_TT = "Modify Selected Loot List";
LOOTLIST_LISTS_DELETE = "Delete";
LOOTLIST_LISTS_DELETE_TT = "Delete Selected Loot List";
LOOTLIST_LISTS_NAME = "List Name:";
LOOTLIST_LISTS_NAME_DEFAULT = "<list name>";
LOOTLIST_LISTS_SAVE = "Save";
LOOTLIST_LISTS_SAVE_TT = "Save the Changes to List";
LOOTLIST_LISTS_DISCARD = "Discard";
LOOTLIST_LISTS_DISCARD_TT = "Discard the Changes to List";
LOOTLIST_LISTS_IMPORT = "Import";
LOOTLIST_LISTS_IMPORT_TT = "Import the Copied List";
LOOTLIST_LISTS_EXPORT = "Export";
LOOTLIST_LISTS_EXPORT_TT = "Export the List for Copying";
LOOTLIST_LISTS_M1USE = "Use Metric 1:";
LOOTLIST_LISTS_M1USE_TT = "Use Metric 1 Values Items";
LOOTLIST_LISTS_M1SCALE_TT = "Select Metric 1 Scale";
LOOTLIST_LISTS_M1OVERRIDE = "Allow Overrides";
LOOTLIST_LISTS_M1OVERRIDE_TT = "Allow Manual Override of Metric 1 Values";
LOOTLIST_LISTS_M2USE = "Use Metric 2:";
LOOTLIST_LISTS_M2USE_TT = "Use Metric 2 Values Items";
LOOTLIST_LISTS_M2SCALE_TT = "Select Metric 2 Scale";
LOOTLIST_LISTS_M2OVERRIDE = "Allow Overrides";
LOOTLIST_LISTS_M2OVERRIDE_TT = "Allow Manual Override of Metric 2 Values";
LOOTLIST_LISTS_M3USE = "Use Metric 3:";
LOOTLIST_LISTS_M3USE_TT = "Use Metric 3 Values Items";
LOOTLIST_LISTS_M3SCALE_TT = "Select Metric 3 Scale";
LOOTLIST_LISTS_M3OVERRIDE = "Allow Overrides";
LOOTLIST_LISTS_M3OVERRIDE_TT = "Allow Manual Override of Metric 3 Values";
LOOTLIST_LISTS_METRICS = "Metrics:";
LOOTLIST_LISTS_METRICSVIEW = "View";
LOOTLIST_LISTS_METRICSVIEW_TT = "Show Metrics Values";
LOOTLIST_LISTS_METRICSEDIT = "Edit";
LOOTLIST_LISTS_METRICSEDIT_TT = "Allow Metrics Editing";
LOOTLIST_LISTS_NOTE_TT = "Click to Enter a Note for this Item";
LOOTLIST_LISTS_M1BASE = "Metric 1\nBase";
LOOTLIST_LISTS_M1BASE_TT = "Metric 1 Base Value"..LOOTLIST_LISTS_PROCHELP;
LOOTLIST_LISTS_M1PROC = "Metric 1\nProc";
LOOTLIST_LISTS_M1PROC_TT = "Metric 1 Proc Value";
LOOTLIST_LISTS_M1TOTAL = "Metric 1\nTotal";
LOOTLIST_LISTS_M1TOTAL_TT = "Metric 1 Total Value";
LOOTLIST_LISTS_M2BASE = "Metric 2\nBase";
LOOTLIST_LISTS_M2BASE_TT = "Metric 2 Base Value"..LOOTLIST_LISTS_PROCHELP;
LOOTLIST_LISTS_M2PROC = "Metric 2\nProc";
LOOTLIST_LISTS_M2PROC_TT = "Metric 2 Proc Value";
LOOTLIST_LISTS_M2TOTAL = "Metric 2\nTotal";
LOOTLIST_LISTS_M2TOTAL_TT = "Metric 2 Total Value";
LOOTLIST_LISTS_M3BASE = "Metric 3\nBase";
LOOTLIST_LISTS_M3BASE_TT = "Metric 3 Base Value"..LOOTLIST_LISTS_PROCHELP;
LOOTLIST_LISTS_M3PROC = "Metric 3\nProc";
LOOTLIST_LISTS_M3PROC_TT = "Metric 3 Proc Value";
LOOTLIST_LISTS_M3TOTAL = "Metric 3\nTotal";
LOOTLIST_LISTS_M3TOTAL_TT = "Metric 3 Total Value";
LOOTLIST_LISTS_EDITMOVEUP_TT = "Move Selected Item Up One Position";
LOOTLIST_LISTS_EDITMOVEDOWN_TT = "Move Selected Item Down One Position";
LOOTLIST_LISTS_NOITEM = "Item Uncached";
LOOTLIST_LISTS_NOITEMFOUND = "Item Uncached - Not Found";
LOOTLIST_LISTS_ITEMID = "ItemID: ";
LOOTLIST_LISTS_UNSAFE = "This item is unsafe. To view this item without the risk of disconnection, you need to have first seen it in the game world.";
LOOTLIST_LISTS_UNCACHED = "Right-click this link to attempt to query the server for data. Note that you may be disconnected.";
LOOTLIST_LISTS_QUERY = "|cffff8400"..LOOTLIST_LABEL_LOOTLIST.."|r is querying server for %s";
LOOTLIST_LISTS_NOTFOUND = " - Not Found";
LOOTLIST_LISTS_LINK = "Item:";
LOOTLIST_LISTS_CLEAR_TT = "Clear Item Link";
LOOTLIST_LISTS_INSERT = "Insert";
LOOTLIST_LISTS_INSERT_TT = "Insert Item into List Before Selected Item (or First)";
LOOTLIST_LISTS_APPEND = "Append";
LOOTLIST_LISTS_APPEND_TT = "Append Item onto List After Selected Item (or Last)";
LOOTLIST_LISTS_REMOVE = "Remove";
LOOTLIST_LISTS_REMOVE_TT = "Remove Item from List";
LOOTLIST_LISTS_ITEM = "Item Name";
LOOTLIST_LISTS_TRASH = "D\ne\nl";
LOOTLIST_LISTS_TRASH_TT = "Remove Item from List";
LOOTLIST_LISTS_COMPLETE = "W\no\nn";
LOOTLIST_LISTS_COMPLETE_TT = "Don't Notify as Item is Won/Obsolete";

-- Static Dialog Prompts
LOOTLIST_PROMPT_LIST_NOTE = "Enter Note for %s:"
LOOTLIST_PROMPT_LIST_DELETE = "Are you sure you want to delete this Loot List?"

-- LootList Options Headings
LOOTLIST_OPTION_UIMANAGE = "Interface Management:";
LOOTLIST_OPTION_LISTEDIT = "List Edit:";
LOOTLIST_OPTION_LOOTWATCH = "Loot Watch:";

-- LootList Options UI Management
LOOTLIST_OPTION_MINIMAP = "Minimap button:";
LOOTLIST_OPTION_MINIMAP_TT = "Toggle Minimap Button";
LOOTLIST_OPTION_MINIMAPPOS = "Position Around Minimap";
LOOTLIST_OPTION_MINIMAPRAD = "Radius Outside Minimap";
LOOTLIST_OPTION_RESETUI = "Reset UI";
LOOTLIST_OPTION_RESETUI_TT = "Reset UI Window Locations";
LOOTLIST_OPTION_RESETUI_EXP = "Reset all LootList UI windows to center of screen";
LOOTLIST_OPTION_AUTOAPPEND = "Automatically append Left-Shift-Click items into list";
LOOTLIST_OPTION_AUTOAPPEND_TT = "Automatically Append a Left-Shift-Click Loot Item into Edited List";
LOOTLIST_OPTION_ECHONOTICE = "Echo notification on detection of listed loot";
LOOTLIST_OPTION_ECHONOTICE_TT = "Echo Notification to Chat on Detection of a Listed Loot Item";
LOOTLIST_OPTION_PLAYSOUND = "Play a sound on detection of listed loot:";
LOOTLIST_OPTION_PLAYSOUND_TT = "Play a Sound on Detection of a Listed Loot Item";
LOOTLIST_OPTION_PLAYSOUNDNOW_TT = "Play Detected List Item Sound Now";
LOOTLIST_OPTION_FOUNDLOOT = "Echo/play when found in an opened loot window";
LOOTLIST_OPTION_FOUNDLOOT_TT = "Echo/Play when Found in a Loot Window Opened by Player ";
LOOTLIST_OPTION_FOUNDGROUP = "Echo/play when found in a group loot window";
LOOTLIST_OPTION_FOUNDGROUP_TT = "Echo/Play when Found in a Group Loot Window";
LOOTLIST_OPTION_FOUNDMLCHAT = "Echo/play when found in Master Looter chat messages";
LOOTLIST_OPTION_FOUNDMLCHAT_TT = "Echo/Play when Found Linked into Master Looter Chat Messages";
LOOTLIST_OPTION_FOUNDLEADCHAT = "Echo/play when found in Party/Raid Leader chat messages";
LOOTLIST_OPTION_FOUNDLEADCHAT_TT = "Echo/Play when Found Linked into Party/Raid Leader Chat Messages";
LOOTLIST_OPTION_FOUNDWARNCHAT = "Echo/play when found in Raid Warning chat messages";
LOOTLIST_OPTION_FOUNDWARNCHAT_TT = "Echo/Play when Found Linked into Raid Warning Chat Messages";

-- LootList Import Frame
LOOTLIST_IMPORT_FORMAT = "Format:";
LOOTLIST_IMPORT_FORMATITEM = "Item ID";
LOOTLIST_IMPORT_FORMATITEM_TT = "List of Item IDs with Optional Item Name:\n\n|cff1eff00<item id>|r[|cff0070dd=|r|cff1eff00<item name>|r]";
LOOTLIST_IMPORT_FORMATARMORY = "Armory";
LOOTLIST_IMPORT_FORMATARMORY_TT = "List of WoW Armory URLs:\n\n|cff0070ddhttp://www.wowarmory.com/item-info.xml?i=|r|cff1eff00<item id>|r\n|cff0070ddhttp://eu.wowarmory.com/item-info.xml?i=|r|cff1eff00<item id>|r";
LOOTLIST_IMPORT_FORMATALLAKHAZAM = "Allakhazam";
LOOTLIST_IMPORT_FORMATALLAKHAZAM_TT = "List of Allakhazam URLs:\n\n|cff0070ddhttp://wow.allakhazam.com/db/item.html?witem=|r|cff1eff00<item id>|r";
LOOTLIST_IMPORT_FORMATTHOTTBOT = "Thottbot";
LOOTLIST_IMPORT_FORMATTHOTTBOT_TT = "List of Thottbot URLs:\n\n|cff0070ddhttp://thottbot.com/i|r|cff1eff00<item id>|r";
LOOTLIST_IMPORT_FORMATWOWHEAD = "Wowhead";
LOOTLIST_IMPORT_FORMATWOWHEAD_TT = "List of Wowhead URLs:\n\n|cff0070ddhttp://www.wowhead.com/item=|r|cff1eff00<item id>|r";
LOOTLIST_IMPORT_INSERT = "Insert";
LOOTLIST_IMPORT_INSERT_TT = "Insert Item IDs into List";
LOOTLIST_IMPORT_APPEND = "Append";
LOOTLIST_IMPORT_APPEND_TT = "Append Item IDs into List";

-- LootList Export Frame
LOOTLIST_EXPORT_FORMAT = "Format:";
LOOTLIST_EXPORT_FORMATITEM = "Item ID";
LOOTLIST_EXPORT_FORMATITEM_TT = "List of Item IDs with Item Name";
LOOTLIST_EXPORT_FORMATTEXT = "Text";
LOOTLIST_EXPORT_FORMATTEXT_TT = "Text Format of Item Names";
LOOTLIST_EXPORT_FORMATLINK = "Link";
LOOTLIST_EXPORT_FORMATLINK_TT = "Blizzard Link Format of Items";
LOOTLIST_EXPORT_FORMATHTML = "HTML";
LOOTLIST_EXPORT_FORMATHTML_TT = "HTML List Format";
LOOTLIST_EXPORT_FORMATBBC = "BBC";
LOOTLIST_EXPORT_FORMATBBC_TT = "Bulletin Board Code List Format";
LOOTLIST_EXPORT_REFRESH = "Refresh";
LOOTLIST_EXPORT_REFRESH_TT = "Refresh Export of Selected List";
LOOTLIST_EXPORT_UNKNOWN = "Unknown";
LOOTLIST_EXPORT_NOEQUIP = "No Equip";

-- LootList Notification Prompts
LOOTLIST_NOTICE_MESSAGE = "|cffff8400"..LOOTLIST_LABEL_LOOTLIST.."|r detected list '|cffff0000%s|r' contains found %s";
LOOTLIST_NOTICE_ITEMS = "items ";
LOOTLIST_NOTICE_ITEM = "item ";
LOOTLIST_NOTICE_LOOT = "(#%d)%s";
LOOTLIST_NOTICE_SEP = ", ";
LOOTLIST_NOTICE_AND = " and ";
