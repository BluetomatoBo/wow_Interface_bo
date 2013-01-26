---------------------------------------------------------------------------------------------
-- QuestHelperLite Constant And Default Variables
---------------------------------------------------------------------------------------------
QHLDEFAULT = {};
QHLCONSTANTS = {};

-- ARROW SETTINGS
QHLDEFAULT["arrow"]			= true;
QHLDEFAULT["arrow_pos_x"]		= 0;
QHLDEFAULT["arrow_pos_y"]		= 300;
QHLDEFAULT["arrow_hide"]		= false;
QHLDEFAULT["arrow_locked"]		= false;
QHLDEFAULT["arrow_size"]		= 1;
QHLDEFAULT["arrow_textsize"]		= 1;
QHLDEFAULT["arrow_meters"]		= false;

-- QUEST TRACKER SETTINGS
QHLDEFAULT["update_interval"]		= 0.15;
QHLDEFAULT["track_quests"]		= true;
QHLDEFAULT["track_by_zone"]		= false;
QHLDEFAULT["track_by_group"]		= false;
QHLDEFAULT["track_by_level"]		= false;
QHLDEFAULT["track_level_offset"]	= 3;
QHLDEFAULT["track_change_offset"]	= 0;

-- ANT TRAIL SETTINGS
QHLDEFAULT["trail_show"]		= true;

---------------------------------------------------------------------------------------------
-- QuestHelperLite Binding Variables
---------------------------------------------------------------------------------------------
BINDING_NAME_QUESTHELPERLITE = QHL_LOCALE_BINDING;
BINDING_HEADER_QUESTHELPERLITE = QHL_LOCALE_HEADER;

QuestHelperLiteProfile = {};
QHL = QuestHelperLite:new();
