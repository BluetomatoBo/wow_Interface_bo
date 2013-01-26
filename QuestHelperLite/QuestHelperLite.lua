---------------------------------------------------------------------------------------------
QHLVERSION = "QuestHelperLite v5.0.4.1"
---------------------------------------------------------------------------------------------
-- Author
--
--	WakeZero (based on QuestHelper by: zorbathut, smariot, vipersniper, nesher, lonadar, nconantj)
--
-- Website
--
--	http://questhelperlite.blogspot.com/
-- 
-- Description
--
--	Calculates an optimal route for you to follow while questing.
--
-- NOTE
--
--	QuestHelperLite is an unofficial branch of QuestHelper aimed at providing the core
--	subset of features in a slimmed down lighter version. Although some of the code and
--	art assets of QuestHelper have been utilized, QuestHelperLite has been rewritten
--	from the ground up and is in no other way affiliated with QuestHelper and those who
--	have worked on it in the past.
--
--	The main deviation from QuestHelper comes from not utilizing a custom database to
--	store quest objectives and locations. Instead QuestHelperLite gets all of it's info
--	from the game itself. This has the advantage of providing a more compact addon without
--	the need to update once new quests are available in game. If WoW knows about it, so does 
--	QuestHelperLite. Although this provides for a much lighter and compact addon, it is not
--	without faults and some features of the old QuestHelper are not currently possible.
--
--	The core subset of features included in QuestHelperLite are as follows:
--
--	Quest Pathing - Calculates an optimal route for you to follow while questing
--	Tracking Arrow 	- A configurable arrow guides you to your next objective
--	World Map Icons - Quest objectives are viewable outside of your current zone
--	Ant Trails - Ant trails show the best calculated optimal route
--	Context Menus - Context menus are displayed when you right-click objectives
--	Ignorable Objectives - Ignore unwanted objectives
--
-- TODO
--
--	* Minimap Icons/Blobs
--	* Objective Tracker Customization
--	* Add Portals/World Travel/Shortcuts
--	* Group tracking
--	* Lots of Testing!
--
-- Changelog
--
--	v5.0.4.1 [2012-09-02] : - Fixed Deepholm Quests Not Tracking
--
--	v5.0.4.0 [2012-08-31] : - Fixed for Mists of Pandaria
--
--	v4.2.0.0 [2011-06-29] : - Fixed some translations
--
--				- Fixed nil comparison
--
--	v4.1.0.0 [2011-05-09] : - Updated Astrolabe Library
--
--				- Fixed Objective Tracking In Orgrimmar 
--
--	v4.0.3.1 [2010-12-01] : - Added Group and Level Filters
--
--				- Added Support For Instance Maps
--
--				- Improved Performance
--
--	v4.0.3.0 [2010-11-23] : - Added GUI Options Panel
--
--				- Added Update Interval Option
--
--				- Fixed Performance Leak
--
--	v4.0.1.0 [2010-11-09] : - First Release
--
-- Shoutouts
--
--	Jesus Christ - For joy, life, eternal love and forgiveness of sins!
--
--	Curse (wow.curse.com) - For hosting this addon and many others.
--
--	WoWInterface (www.wowinterface.com) - For hosting this addon and many others.
--
--	Wowpedia (www.wowpedia.org) - Greatest resource and API for WoW addon developers.
--
-- Special Thanks
--
--	QuestHelperLite Donors - Thank you for your support!
--
--	QuestHelper Authors - zorbathut, smariot, vipersniper, nesher, lonadar, nconantj
--
--	Xinhuan - For amazing TSP code and the help needed to modify it for QuestHelperLite!
--
---------------------------------------------------------------------------------------------
-- QuestHelperLite Class
---------------------------------------------------------------------------------------------
QuestHelperLite = {}
QuestHelperLite.__index = QuestHelperLite;

function QuestHelperLite:new()

	-- Metatable
	local self = {};
	setmetatable(self, QuestHelperLite);
	
	-- Frame Variables
	self.name = "QuestHelperLite_Frame";
	self.frame = CreateFrame("Frame", self.name, UIParent);
	self.map_overlay = CreateFrame("FRAME", "QuestHelperLite_MapOverlayFrame", WorldMapButton);
	self.map_overlay:SetAllPoints();
	self.map_overlay:SetFrameStrata("FULLSCREEN");
	
	-- Reference Variables
	self.obj = self;
	self.parent = nil;
	self.frame.obj = self;
	
	-- Options Variables
	self.options = QHLOptions:new();
	self.profile = {};
	self.backupsettings = {};
	
	-- Update Variables
	self.updatestart = 0;
	self.updateend = 0;
	self.updatelast = 0;
	self.updatetime = 0;
	
	-- Libraries
	self.Astrolabe = DongleStub("Astrolabe-1.0");
	self.TSP = QHL_TSP;
	
	-- Player Position Variables
	self.continent = 0;
	self.zone = 0;
	self.pos_x = 0;
	self.pos_y = 0;
	self.world = 0;
	self.world_x = 0;
	self.world_y = 0;

	-- Set Fonts
	self:SetFonts();

	-- Setup Slash Commands
	self:SetupSlashCommands();

	-- Register Events
	self:RegisterForEvents();

	-- Report Status and Return
	self:Report();
     	return self;
end

---------------------------------------------------------------------------------------------
-- QuestHelperLite Methods
---------------------------------------------------------------------------------------------
function QuestHelperLite:GetGlobal(variable)

	if QuestHelperLiteProfile["GlobalSettings"] and variable then
		return QuestHelperLiteProfile["GlobalSettings"][variable];
	end
end

function QuestHelperLite:SetGlobal(variable, value)

	if not QuestHelperLiteProfile["GlobalSettings"] then
		QuestHelperLiteProfile["GlobalSettings"] = {};
	end
	
	if variable then
		QuestHelperLiteProfile["GlobalSettings"][variable] = value;
	end
end

function QuestHelperLite:GetSetting(variable)

	local profile = self:GetProfileName();
	if variable and QuestHelperLiteProfile[profile] then
		return QuestHelperLiteProfile[profile][variable];
	end
end

function QuestHelperLite:SetSetting(variable, value)

	local profile = self:GetProfileName();
	if QuestHelperLiteProfile[profile] and variable then
		if not value then QuestHelperLiteProfile[profile][variable] = false;
		else QuestHelperLiteProfile[profile][variable] = value; end
	end
end

function QuestHelperLite:ResetSettings()
	QuestHelperLiteProfile[self:GetProfileName()] = {};
end

function QuestHelperLite:LoadDefaultSettings()

	local profile = self:GetProfileName();
	QuestHelperLiteProfile[profile] = {};
	self:CopyTable(QuestHelperLiteProfile[profile], QHLDEFAULT);
end

function QuestHelperLite:GetProfileName()
	return self:Concat(UnitName("player"), "|", string.gsub(GetCVar("realmName"), "^%s*(.-)%s*$", "%1"));
end

function QuestHelperLite:SetupSlashCommands()

	-- Setup Slash Commands
	SlashCmdList["QuestHelperLite"] = function(args) QHL:ParseCommand(args); end;
	SLASH_QuestHelperLite1 = "/QH";
	SLASH_QuestHelperLite2 = "/QHL";
	SLASH_QuestHelperLite3 = "/QuestHelper";
	SLASH_QuestHelperLite4 = "/QuestHelperLite";
end

--TODO: Localize
function QuestHelperLite:ParseCommand(args, ...)

	-- Get Command
	local command, options = strmatch(args, "^(%S*)%s*(.-)$");
	command = strupper(command);
	
	-- Parse Commands
	if command == "ARROW" then
	
		QHL:ToggleArrow();
		
	elseif command == "TRAIL" then
	
		QHL:ToggleTrail();
		
	elseif command == "ZONE" then
	
		QHL:ToggleZone();
	
	elseif command == "GROUP" then
		
		QHL:ToggleGroup();
		
	elseif command == "LEVEL" then
		
		QHL:ToggleLevel();
		
	elseif command == "UNIGNORE" then
	
		QHL.quests:ResetIgnoredObjectives();
		QHL:PrintAll(0,1,0,QHL_LOCALE_MENU_OBJECTIVE_RESET);
		
	elseif command == "RESET" then
	
		QHL:LoadDefaultSettings();
		QHL_Arrow_Reset();
		QHL:PrintAll(0,1,0,QHL_LOCALE_DEFAULT_LOADED);
	else
		--QHL:Report();
		InterfaceOptionsFrame_OpenToCategory(QHL.options.panel);
	end
end

function QuestHelperLite:Report()

	self:Print("QuestHelperLite is |cFF00FF00ON".."|cFFFFFFFF ["..QHL_LOCALE_HELP.."]");
end

function QuestHelperLite:ShowOptions()

	InterfaceOptionsFrame_OpenToCategory(QHL.options.panel);
end

function QuestHelperLite:GetLabel()
	return "QuestHelperLite";
end

function QuestHelperLite:GetVersion()
	local version = string.gsub(QHLVERSION, "QuestHelperLite v", "");
	return version;
end

function QuestHelperLite:GetPrettyVersion()
	local pretty_version = self:Concat("Version ", self:GetVersion());
	return pretty_version;
end

function QuestHelperLite:CheckVersion()
	
	local pre_ver = self:GetGlobal("VERSION_NUM");
	local cur_ver = self:GetVersion();
	
	if not pre_ver or pre_ver ~= cur_ver then
		
		-- Display ThankYou Message
		self:ShowThankYouNotice();
	end
	
	-- Set Global Version Number
	self:SetGlobal("VERSION_NUM", cur_ver);
	
	-- Check For Newer Version
	local chatindex = GetChannelName("QuestHelperLiteMod");
	if chatindex then
	
		-- Send Version Information To Global Channel
		SendChatMessage(QHLVERSION, "CHANNEL", nil, chatindex);
	end
end

function QuestHelperLite:CompareVersion(version)

	local a = string.gsub(QHLVERSION, "QuestHelperLite2 v", "");
	local b = string.gsub(version, "QuestHelperLite2 v", "");
	
	-- This Is Latest Version
	if a > b then return -1;
		
	-- This Is Not Latest Version
	elseif a < b then return 1;
		
	-- Versions Are Equal
	else return 0; end
end

function QuestHelperLite:ShowThankYouNotice()
	
	if not QHL.thankyoumessage then
		QHL.thankyoumessage = true;
		local msg = QHL:Concat(QHL_LOCALE_THANKS, QHLVERSION, string.char(13), QHL_LOCALE_CONFIGURE, string.char(13,13), QHL_LOCALE_SUPPORT);
		QHL:ShowNotice(350, 130, msg, QHL_LOCALE_SUPPORTLINK);
	end
end

function QuestHelperLite:ShowUpdateNotice()

	if not QHL.updatemessage then
		QHL.updatemessage = true;
		local msg = QHL:Concat(QHL_LOCALE_UPDATENOTICE, string.char(13,13), QHL_LOCALE_UPDATEINSTRUCT);
		QHL:ShowNotice(350, 115, msg, QHL_LOCALE_SUPPORTLINK);
	end
end

function QuestHelperLite:ShowNotice(width, height, msg, link)

	local frame = CreateFrame("Frame", nil, UIParent);
	frame:SetFrameStrata("HIGH");
	frame:SetWidth(width);
	frame:SetHeight(height);
	frame:SetPoint("TOP", 0, -230);
	frame:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32,
		insets = {left = 11, right = 12, top = 12, bottom = 11},
	});
	
	--[[
	local texture = frame:CreateTexture();
	texture:SetPoint("CENTER", 0, 0);
	texture:SetTexture(0, 0, 0, 1);
	texture:SetDrawLayer("BACKGROUND");
	texture:SetWidth(width - 12);
	texture:SetHeight(height -12);
	texture:Show();
	--]]
	
	local fontstring = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	fontstring:SetWidth(410);
	fontstring:SetHeight(0);
	fontstring:SetPoint("TOP", 0, -16);
	fontstring:SetText(msg);
	
	if link then
		local editBox = CreateFrame("EditBox", nil, frame);
		do
			local editBoxLeft = editBox:CreateTexture(nil, "BACKGROUND");
			local editBoxRight = editBox:CreateTexture(nil, "BACKGROUND");
			local editBoxMiddle = editBox:CreateTexture(nil, "BACKGROUND");
			editBoxLeft:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Left");
			editBoxLeft:SetHeight(32);
			editBoxLeft:SetWidth(32);
			editBoxLeft:SetPoint("LEFT", -14, 0);
			editBoxLeft:SetTexCoord(0, 0.125, 0, 1);
			editBoxRight:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right");
			editBoxRight:SetHeight(32);
			editBoxRight:SetWidth(32);
			editBoxRight:SetPoint("RIGHT", 6, 0);
			editBoxRight:SetTexCoord(0.875, 1, 0, 1);
			editBoxMiddle:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right");
			editBoxMiddle:SetHeight(32);
			editBoxMiddle:SetWidth(1);
			editBoxMiddle:SetPoint("LEFT", editBoxLeft, "RIGHT");
			editBoxMiddle:SetPoint("RIGHT", editBoxRight, "LEFT");
			editBoxMiddle:SetTexCoord(0, 0.9375, 0, 1);
		end
		editBox:SetHeight(32);
		editBox:SetWidth(250);
		editBox:SetPoint("TOP", fontstring, "BOTTOM", 0, 2);
		editBox:SetFontObject("GameFontHighlight");
		editBox:SetTextInsets(0, 0, 0, 1);
		editBox:SetFocus();
		editBox:SetText(link);
		editBox:HighlightText();
		editBox:SetScript("OnHide", function(self)
			ChatEdit_FocusActiveWindow();
		end);
		editBox:SetScript("OnTextChanged", function(self)
			editBox:SetText(link);
			editBox:HighlightText();
		end);
	end
	local button = CreateFrame("Button", nil, frame);
	button:SetHeight(24);
	button:SetWidth(75);
	button:SetPoint("BOTTOM", 0, 13);
	button:SetNormalFontObject("GameFontNormal");
	button:SetHighlightFontObject("GameFontHighlight");
	button:SetNormalTexture(button:CreateTexture(nil, nil, "UIPanelButtonUpTexture"));
	button:SetPushedTexture(button:CreateTexture(nil, nil, "UIPanelButtonDownTexture"));
	button:SetHighlightTexture(button:CreateTexture(nil, nil, "UIPanelButtonHighlightTexture"));
	button:SetText(QHL_LOCALE_OKAY);
	button:SetScript("OnClick", function(self)
		frame:Hide();
	end);
end

function QuestHelperLite:SetFonts()

	self.font = {serif=GameFontNormal:GetFont(), sans=ChatFontNormal:GetFont(), fancy=QuestTitleFont:GetFont()};
end

function QuestHelperLite:ToggleArrow()
  
	local arrow = not QHL:GetSetting("arrow");
	QHL:SetSetting("arrow", arrow)
	if arrow then
		QHL:PrintAll(0,1,0,QHL_LOCALE_ARROWLINK_ON);
	else
		QHL:PrintAll(1,0,0,QHL_LOCALE_ARROWLINK_OFF);
	end
end

function QuestHelperLite:ToggleTrail()

	local trail = not QHL:GetSetting("trail_show");
	QHL:SetSetting("trail_show", trail);
	if trail then
		QHL:PrintAll(0,1,0,QHL_LOCALE_TRAIL_ON);
	else
		QHL:PrintAll(1,0,0,QHL_LOCALE_TRAIL_OFF);
	end	
end

function QuestHelperLite:ToggleZone()

	local zone = not QHL:GetSetting("track_by_zone");
	QHL:SetSetting("track_by_zone", zone);
	if zone then
		QHL:PrintAll(1,0,0,QHL_LOCALE_ZONE_ON);
	else
		QHL:PrintAll(0,1,0,QHL_LOCALE_ZONE_OFF);
	end
end

function QuestHelperLite:ToggleGroup()

	local group = not QHL:GetSetting("track_by_group");
	QHL:SetSetting("track_by_group", group);
	if group then
		QHL:PrintAll(1,0,0,QHL_LOCALE_GROUP_ON);
	else
		QHL:PrintAll(0,1,0,QHL_LOCALE_GROUP_OFF);
	end
end

function QuestHelperLite:ToggleLevel()

	local level = not QHL:GetSetting("track_by_level");
	QHL:SetSetting("track_by_level", level);
	if level then
		QHL:PrintAll(1,0,0,QHL_LOCALE_LEVEL_ON);
	else
		QHL:PrintAll(0,1,0,QHL_LOCALE_LEVEL_OFF);
	end
end

function QuestHelperLite:UpdateArrow()

	QHL_Arrow_SetScale();
	QHL_Arrow_SetTextScale();

	if QHL.quests then
	
		local objective = QHL.quests:GetNextObjective();
		if objective then
			
			QHL_Arrow_SetActivePoint(objective.map, objective.floor, objective.pos_x, objective.pos_y, objective.questTitle);
		else
			QHL_Arrow_SetActivePoint();
		end
	end
end

function QuestHelperLite:UpdatePosition()

	if not QHL.Astrolabe.WorldMapVisible then

		-- Set Map To Current
		local lastMapID, lastFloor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
		SetMapToCurrentZone();
		
		-- Check For Broken Map
		local x, y = GetPlayerMapPosition("player");
		local floor, floors = GetCurrentMapDungeonLevel(), GetNumDungeonMapLevels();
		if (x and y) and (x > 0 and x < 1) and (y > 0 and y < 1) and (floors == 0 or floor > 0) then
		
			-- Update Player Position
			QHL.InBrokenMap = false;
			QHL.InBrokenInstance = false;
			QHL.pos_x, QHL.pos_y = x, y;
			QHL.continent, QHL.zone = GetCurrentMapContinent(), GetCurrentMapZone();
			QHL.map, QHL.floor, QHL.floors = GetCurrentMapAreaID(), floor, floors;

			-- Update World Position
			QHL.world, QHL.world_floor, QHL.world_x, QHL.world_y = QHL:GetWorldPosition(QHL.map, QHL.floor, QHL.pos_x, QHL.pos_y);		
		else
			QHL.InBrokenMap = true;
			if GetNumDungeonMapLevels() <= 0 then QHL.InBrokenInstance = true; end
		end
		
		-- Restore Last Map Position
		SetMapByID(lastMapID);
		SetDungeonMapLevel(lastFloor);
		
	elseif QHL.map and QHL.floor then
	
		-- Get Player Position
		local x, y = GetPlayerMapPosition("player");
		local floor, floors = GetCurrentMapDungeonLevel(), GetNumDungeonMapLevels();
		if (x and y) and (x > 0 and x < 1) and (y > 0 and y < 1) and (floors == 0 or floor > 0) then
				
			-- Try Translating Position
			local map, floor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
			local nx, ny = QHL.Astrolabe:TranslateWorldMapPosition(map, floor, x, y, QHL.map, QHL.floor);
			if (nx and nx > 0) or (ny and ny > 0) then
			
				-- Update Player Position
				QHL.pos_x, QHL.pos_y = nx, ny;
				QHL.world, QHL.world_floor, QHL.world_x, QHL.world_y = QHL:GetWorldPosition(QHL.map, QHL.floor, QHL.pos_x, QHL.pos_y);
			end
		end
	end
end

---------------------------------------------------------------------------------------------
-- QuestHelperLite Events
---------------------------------------------------------------------------------------------
function QuestHelperLite:RegisterForEvents()

	-- Register Event Handler
	self.frame:SetScript("OnEvent", self.OnEvent);
	self.frame:SetScript("OnUpdate", self.OnUpdate);
	self.map_overlay:SetScript("OnUpdate", self.OnMapOverlayUpdate);

	-- System Events
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("CHANNEL_UI_UPDATE");
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE");
	self:RegisterEvent("CHAT_MSG_CHANNEL");
	self:RegisterEvent("CHAT_MSG_ADDON");

	-- Quest Events
	self:RegisterEvent("QUEST_ACCEPTED");
	self:RegisterEvent("QUEST_POI_UPDATE");
	self:RegisterEvent("UNIT_QUEST_LOG_CHANGED");
	self:RegisterEvent("QUEST_LOG_UPDATE");
	self:RegisterEvent("QUEST_WATCH_UPDATE");
end

function QuestHelperLite:RegisterEvent(event)
	self.frame:RegisterEvent(event);
end

function QuestHelperLite:OnUpdate(elapsed)

	QHL.updatelast = QHL.updatelast + elapsed;
	if (QHL.updatelast > QHL:GetSetting("update_interval")) then
		QHL:OnEvent("UPDATE", QHL.updatelast);
		QHL.updatelast = 0;
		QHL.updatetime = 0;
	end
	QHL.quests:UpdateCoroutine(elapsed);
	QHL.quests:UpdateObjectiveIcons();
	QHL.quests:UpdateAntTrail(elapsed);
	
end

function QuestHelperLite:OnMapOverlayUpdate(elapsed)

	-- Keep Updating Even When UIParent Is Hidden
	if not UIParent:IsVisible() then
	
		QHL.updatelast = QHL.updatelast + elapsed;
		if (QHL.updatelast > QHL:GetSetting("update_interval")) then
			QHL:OnEvent("UPDATE", QHL.updatelast);
			QHL.updatelast = 0;
			QHL.updatetime = 0;
		end
		QHL.quests:UpdateCoroutine(elapsed);
		QHL.quests:UpdateObjectiveIcons();
		QHL.quests:UpdateAntTrail(elapsed);
	end
end

function QuestHelperLite:OnEvent(event, ...)

	local estart = GetTime();
	if (type(self.obj[event]) == 'function') then
	
		-- Call Event Specific Function
		self.obj[event](self.obj, event, ...);
	end
	QHL.updatetime = QHL.updatetime + (GetTime() - estart);
end

function QuestHelperLite:UPDATE(event, elapsed, ...)
	
	-- Set Update Start Time
	QHL.updatestart = GetTime();
	
	-- Update Player Position
	self:UpdatePosition();

	-- Update Quest Objectives
	self.quests:Update(elapsed, ...);

	-- Update Arrow
	self:UpdateArrow();
	
	-- Set Update End Time
	QHL.updateend = GetTime();
	QHL.updatetime = QHL.updatetime + (QHL.updateend - QHL.updatestart);
	QHL.fps = 1 / QHL.updatetime;
end

function QuestHelperLite:ADDON_LOADED(event, addon, ...)

	if addon == "QuestHelperLite" then

		-- Load Settings
		local profile = self:GetProfileName();
		if not QuestHelperLiteProfile[profile] then QuestHelperLiteProfile[profile] = {}; end

		-- Backup Current Settings
		wipe(self.backupsettings);
		self:CopyTable(self.backupsettings, QuestHelperLiteProfile[profile]);

		-- Load Default Settings
		self:LoadDefaultSettings();

		-- Restore Backup Settings
		for index,value in pairs(self.backupsettings) do
			if value ~= nil then QuestHelperLiteProfile[profile][index] = value; end
		end

		-- Initialize Options
		--QHLOptions:SetupOptions();
		
		-- Initialize Quests
		self.quests = QHLQuests:new();
	end
end

function QuestHelperLite:CHANNEL_UI_UPDATE(event, ...)
	
	-- Join Global QuestHelperLite Channel
	if GetChannelName("QuestHelperLiteMod") == 0 then
		JoinChannelByName("QuestHelperLiteMod", "i<3QuestHelperLite");
	else
		self:CheckVersion();
	end
end

function QuestHelperLite:CHAT_MSG_CHANNEL_NOTICE(event, msg, arg2, arg3, namenum, arg5, arg6, chantype, channum, channel, ...)

	-- Check QuestHelperLiteMod Global Channel
	if msg == "YOU_JOINED" and channel == "QuestHelperLiteMod" then
	
		-- Check QuestHelperLite Version
		self:CheckVersion();
	end
end

function QuestHelperLite:CHAT_MSG_CHANNEL(event, msg, author, language, namenum, target, flags, zoneid, num, channel, lineid, guid, ...)

	-- Check QuestHelperLiteMod Global Channel
	if author ~= UnitName("player") and channel == "QuestHelperLiteMod" then
	
		-- Check Reported Version
		local compare = self:CompareVersion(msg);
		if compare > 0 then
		
			-- Display Update Notice
			self:ShowUpdateNotice();
		
		elseif compare < 0 then
		
			-- Whisper New Version Notice
			SendAddonMessage("QHL", QHLVERSION, "WHISPER", author);
		end
	end
end

function QuestHelperLite:CHAT_MSG_ADDON(event, addon, msg, distribution, author, ...)

	-- Check QuestHelperLiteMod Global Channel
	if addon == "QHL" and author ~= UnitName("player") then
	
		-- Check Reported Version
		local compare = self:CompareVersion(msg);
		if compare > 0 then
		
			-- Display Update Notice
			self:ShowUpdateNotice();
		
		elseif compare < 0 then
		
			-- Whisper New Version Notice
			SendAddonMessage("QHL", QHLVERSION, "WHISPER", author);
		end
	end
end

function QuestHelperLite:QUEST_ACCEPTED(event, questLogIndex, ...)

	--QHL:PrintAll(1,1,1,"QUEST_ACCEPTED:",questLogIndex,":",...);
	
	-- Objective Added, Set Quest For Update (On Next QUEST_LOG_UPDATE)
	QHL.quests:SetQuestForUpdate(select(9, GetQuestLogTitle(questLogIndex)));
end

function QuestHelperLite:QUEST_POI_UPDATE(event, ...)

	--QHL:PrintAll(1,1,1,"QUEST_POI_UPDATE:",...);
	
	-- Update Quest Maps
	QHL.quests:SetQuestsForUpdate();
	QHL.quests:UpdateQuestMaps();
end

function QuestHelperLite:UNIT_QUEST_LOG_CHANGED(event, unit, ...)

	--QHL:Print("UNIT_QUEST_LOG_CHANGED");
end

function QuestHelperLite:QUEST_WATCH_UPDATE(event, questLogIndex, ...)

	--QHL:PrintAll(1,1,1,"QUEST_WATCH_UPDATE",questLogIndex,":",...);

	-- Objective Completed, Set Quest For Update (On Next QUEST_LOG_UPDATE)
	QHL.quests:SetQuestForUpdate(select(9, GetQuestLogTitle(questLogIndex)));
end

function QuestHelperLite:QUEST_LOG_UPDATE(event, ...)

	--QHL:PrintAll(1,1,1,"QUEST_LOG_UPDATE:",...);

	-- Update Quest Maps
	QHL.quests:UpdateQuestMaps();
end

---------------------------------------------------------------------------------------------
-- Global Utility Functions
---------------------------------------------------------------------------------------------
function QuestHelperLite:Print(msg, red, green, blue)
	DEFAULT_CHAT_FRAME:AddMessage(msg, red, green, blue);
end

function QuestHelperLite:PrintAll(red, green, blue, ...)
	local msg = QHL:Concat(...);
	DEFAULT_CHAT_FRAME:AddMessage(msg, red, green, blue);
end

function QuestHelperLite:Concat(...)

	local s = "";
	for n = 1, select("#", ...) do
		local value = select(n, ...);
		if value == true then s = s .. "true";
		elseif value == false then s = s.."false";
		elseif type(value) == "table" then s = s;
		elseif value ~= nil then s = s..value; end
	end
	return s;
end

function QuestHelperLite:ConcatWithDelim(delim,...)

	local s = "";
	if not delim then delim = ""; end
	for n = 1, select("#", ...) do
		if n > 1 then s = s .. delim; end
		local value = select(n, ...);
		if value == true then s = s .. "true";
		elseif value == false then s = s.."false";
		elseif type(value) == "table" then s = s;
		elseif type(value) == "userdata" then s = s;
		elseif value ~= nil then s = s..value; end
	end
	return s;
end

function QuestHelperLite:Wrap(min, max, value)

	if value > max then value = min + (value - max) - 1; end
	if value < min then value = max - (min - value) + 1; end
	return value;
end

function QuestHelperLite:CopyTable(to, from)
	
	if not to then to = {}; end
	for k,v in pairs(from) do
		if type(v) == "table" then
			to[k] = {}
			QuestHelperLite:CopyTable(to[k], v);
		else
			to[k] = v;
		end
	end
end

--------------------------
-- CONTINENTS
--------------------------
-- Unknown: 		<0
-- Azeroth: 		 0
-- Kalimdor:		 1
-- Eastern Kingdoms:	 2
-- Outland:		 3
-- Northrend:		 4
-- The Maelstrom:	 5
-- Pandaria:		 6
--------------------------
local ContinentZones = { [0]={} }
local Continents = { [0]='Azeroth',GetMapContinents() };
for _cid,_cont in ipairs(Continents) do

	-- Construct Table Of Zones By Continent
	ContinentZones[_cid] = {};
	for _,_z in pairs({GetMapZones(_cid)}) do
		ContinentZones[_cid][_z] = _z;
	end
end
local WorldMapIDs = { [-1]=-1, [0]=0, [1]=0, [2]=0, [3]=466, [4]=0, [5]=-1, [6]=0 };

-- /run QHL:PrintAll(1,1,1,QHL:GetWorld(GetCurrentMapAreaID(),GetCurrentMapDungeonLevel()))
function QuestHelperLite:GetWorld(map, floor)
	
	-- Get Continent ID
	local continent_id = -1;
	local map_name = GetMapNameByID(map);
	for n,zones in ipairs(ContinentZones) do
	
		-- Check If Zone Is In Continent
		if zones[map_name] ~= nil then 
			continent_id = n; 
			break;
		end
	end
	
	-- Return World MapID
	local world_id = WorldMapIDs[continent_id];
	if world_id >= 0 then return world_id, 0;
	else return map, floor; end
end

function QuestHelperLite:GetWorldPosition(map, floor, x, y)

	local world, world_floor = QHL:GetWorld(map, floor);
	local world_x, world_y = QHL.Astrolabe:TranslateWorldMapPosition(map, floor, x, y, world, world_floor);
	
	if map == 640 then
	
		--QHL:PrintAll(1,1,1,GetMapNameByID(map)," : ",map," : ",floor," : ",world," : ",world_floor);
	
	end
	
	return world, world_floor, world_x, world_y;
end

function QuestHelperLite:GetMapWidthAndHeight(map, floor)

	local system, systemParent, width, height, xOffset, yOffset = QHL.Astrolabe:GetMapInfo(map, floor);
	return width, height;
end
