----------------------------------------------------------------------------------------------------
-- Encounters module : Handle different boss encounters AddOns
--

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("encounters");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get locale
local L = Engine.Locale;

--get AceGUI library
local AceGUI = LibStub("AceGUI-3.0")

--not in use
function mod.OnEvent()

end

--ask a question and perform a function
function mod:question(question,okFunction)

	--set the ok function
	StaticPopupDialogs[mod.popupName].OnAccept = okFunction;

	--show the popup
	_G.StaticPopup_Show(mod.popupName,question);

end

--wipe all data
function mod.wipeAllData()

	--remove the data
	Engine.GLOBAL.encounters=nil;

	--remove all objects
	mod.browseRecordsFrame:ReleaseChildren();

	--create the widgets
	mod:createWidgets();
end

--
function mod.askWipeAllData()

	--ass to wipe all data
	mod:question(L["RECORD_WARNING_WIPE_ALL"],mod.wipeAllData);

end

--returns the encounter DB
function mod:getEncounterDB(encounter,instanceName,difficultyName)

	--init encounter db if not created
	if not Engine.GLOBAL.encounters then
		Engine.GLOBAL.encounters = {};
	end

	--init instance if not created
	if not Engine.GLOBAL.encounters[instanceName] then
		Engine.GLOBAL.encounters[instanceName] = {};
	end

	--init difficult if not created
	if not Engine.GLOBAL.encounters[instanceName][difficultyName] then
		Engine.GLOBAL.encounters[instanceName][difficultyName] = {};
	end

	--init difficult if not created
	if not Engine.GLOBAL.encounters[instanceName][difficultyName][encounter] then
		Engine.GLOBAL.encounters[instanceName][difficultyName][encounter] = {};
	end

	--get the db
	local encounterDB = Engine.GLOBAL.encounters[instanceName][difficultyName][encounter];


	if not encounterDB.records then
		encounterDB.records = {};
	end

	--if not topDPS
	if not encounterDB.records.DPS then
		encounterDB.records.DPS = {
			name = "",
			dps = 0,
			damage = 0,
			enclass = "",
			timestamp = 0,
		};
	end;

	--if not topHPS
	if not encounterDB.records.HPS then
		encounterDB.records.HPS = {
			name = "",
			hps = 0,
			healing = 0,
			enclass = "",
			timestamp = 0,
		};
	end;

	--if not playerMaxDPS
	if not encounterDB.records.playerDPS then
		encounterDB.records.playerDPS = {
			name = "",
			dps = 0,
			damage = 0,
			enclass = "",
			timestamp = 0,
		};
	end;

	--if not playerMaxHPS
	if not encounterDB.records.playerHPS then
		encounterDB.records.playerHPS = {
			name = "",
			hps = 0,
			healing = 0,
			enclass = "",
			timestamp = 0,
		};
	end;

	return encounterDB;

end

--notify a new record, if required
function mod:notifyNewRecord(current, new, mode,isPlayer)

	--init variables
	local formatStr = "";
	local channel = "";
	local line = "";

	--by default is a brand new record
	if(mode == Engine.TYPE_DPS) then
		formatStr = "ENCOUNTERS_NEW_RECORD_DPS";
	else
		formatStr = "ENCOUNTERS_NEW_RECORD_HPS";
	end

	--get the auto report settings
	if not isPlayer then
		if Engine.Profile.encounters.autoReportTop then
			channel = Engine.Profile.encounters.autoReportTopType;
		end
	else
		if Engine.Profile.encounters.autoReportPlayer then
			channel = Engine.Profile.encounters.autoReportPlayerType;
		end
	end

	--double check that we have a valid channel
	if not (channel == "") then

		--wer have a previous record
		if not (current.name == "") then
			formatStr = formatStr.."_OVER";
		end

		--format the line
		line = string.format(L[formatStr],
			_G.RAID_CLASS_COLORS[new.enclass].colorStr,
			new.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(new.dps) or mod.meter:FormatNumber(new.hps),
			_G.RAID_CLASS_COLORS[ (current.enclass == "") and "PRIEST" or current.enclass ].colorStr,
			current.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(current.dps) or mod.meter:FormatNumber(current.hps)
		);

		--report the record
		mod:reportLine(line,channel);

	end

end

--notify that we have not beat the record
function mod:notifyNotRecord(current, new, mode,isPlayer)

	--init vaibles
	local formatStr = "";
	local channel = "";
	local line = "";

	--get the record string
	if(mode == Engine.TYPE_DPS) then
		formatStr = "ENCOUNTERS_FAIL_RECORD_DPS";
	else
		formatStr = "ENCOUNTERS_FAIL_RECORD_HPS";
	end

	--get the auto report settings
	if not isPlayer then
		if Engine.Profile.encounters.autoReportTop then
			channel = Engine.Profile.encounters.autoReportTopType;
		end
	else
		if Engine.Profile.encounters.autoReportPlayer then
			channel = Engine.Profile.encounters.autoReportPlayerType;
		end
	end

	--double check that we have a valid channel
	if not (channel == "") then

		--wer have a previous record
		if(current.name == "") then
			formatStr = formatStr.."_OVER";
		end

		--format the line
		line = string.format(L[formatStr],
			_G.RAID_CLASS_COLORS[current.enclass].colorStr,
			current.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(current.dps) or mod.meter:FormatNumber(current.hps),
			_G.RAID_CLASS_COLORS[new.enclass].colorStr,
			new.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(new.dps) or mod.meter:FormatNumber(new.hps)
		);

		--report the record
		mod:reportLine(line,channel);

	end

end

--analyse a recod to see if we need to report it
function mod:analyseRecord(current, possible, mode,isPlayer)

	--if not data return
	if not possible then return; end

	--do we have a new record?
	local newRecord = false;

	--check mode and if we have record
	if mode == Engine.TYPE_DPS then

		if current.dps == 0 then
			newRecord = true;
		else
			if possible.dps>current.dps then
				newRecord = true;
			end
		end

	elseif mode == Engine.TYPE_HEAL then

		if current.hps == 0 then
			newRecord = true;
		else
			if possible.hps>current.hps then
				newRecord = true;
			end
		end

	end

	--store our realm name if we do not have
	if(string.match(possible.name,"-")==nil) then
		possible.name=possible.name.."-"..GetRealmName();
	end

	if newRecord then

		--notify the record
		mod:notifyNewRecord(current, possible, mode,isPlayer);

		--copy the record
		current = possible;

		--store for this record the timestamp and group size
		current.timestamp = mod.timestamp;
		current.groupSize = mod.instanceGroupSize;

	else

		---notify attempt
		mod:notifyNotRecord(current, possible, mode,isPlayer);

	end

	--return the new (or same) record
	return current;

end

--function to analyse/store/report a encounter as record
function mod:recordEncounter(encounter)

	--if we dont want to store records exit
	if (not Engine.Profile.encounters.store) then return; end

	debug("recordEncounter: '%s'", encounter);

	--get the localized difficult name
	local instanceName, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapID, instanceGroupSize  = GetInstanceInfo();

	--some times the wow API dont returns a difficulty so we set to normal
	if(difficultyID == 0 ) then
		difficultyName  = "Normal";
		maxPlayers = 40;
		instanceGroupSize = 40;
	end

	--get the DB for this encounter
	mod.encounterDB = mod:getEncounterDB(encounter,instanceName,difficultyName);

	--store encounter data
	mod.encounterDB.name				= encounter;
	mod.encounterDB.instanceName 		= instanceName;
	mod.encounterDB.instanceType 		= instanceType;
	mod.encounterDB.difficultyID 		= difficultyID;
	mod.encounterDB.difficultyName 		= difficultyName;
	mod.encounterDB.maxPlayers 			= maxPlayers;

	--store in the mode the instance group size for record saving
	mod.instanceGroupSize = instanceGroupSize;

	--set timestamp for record saving
	mod.timestamp = time();

	--get top players
	local topDPS = mod.meter:GetTopPlayerData( Engine.CURRENT_DATA, Engine.TYPE_DPS );
	local topHPS = mod.meter:GetTopPlayerData( Engine.CURRENT_DATA, Engine.TYPE_HEAL );

	--get our player data
	local playerDPS = mod.meter:GetPlayerData( Engine.CURRENT_DATA, Engine.TYPE_DPS );
	local playerHPS = mod.meter:GetPlayerData( Engine.CURRENT_DATA, Engine.TYPE_HEAL );

	--get the current records
	local currentTopDPS 	= mod.encounterDB.records.DPS;
	local currentTopHPS 	= mod.encounterDB.records.HPS;
	local currentPlayerDPS 	= mod.encounterDB.records.playerDPS;
	local currentPlayerHPS 	= mod.encounterDB.records.playerHPS;

	local line=""
	local channel = ""

	--display top records header
	if Engine.Profile.encounters.autoReportTop then
		channel = Engine.Profile.encounters.autoReportTopType;
		line = string.format(L["REPORT_ENCOUNTER_RECORDS_TOP"],Engine.Name,encounter,difficultyName);
		mod:reportLine(line,channel);
	end

	--analyse top records
	mod.encounterDB.records.DPS = mod:analyseRecord(currentTopDPS, topDPS, Engine.TYPE_DPS,false);
	mod.encounterDB.records.HPS = mod:analyseRecord(currentTopHPS, topHPS, Engine.TYPE_HEAL,false);

	--display player records header
	if Engine.Profile.encounters.autoReportPlayer then
		channel = Engine.Profile.encounters.autoReportPlayerType;
		line = string.format(L["REPORT_ENCOUNTER_RECORDS_PLAYER"],Engine.Name,encounter,difficultyName);
		mod:reportLine(line,channel);
	end

	--analyse player records
	mod.encounterDB.records.playerDPS = mod:analyseRecord(currentPlayerDPS, playerDPS, Engine.TYPE_DPS,true);
	mod.encounterDB.records.playerHPS = mod:analyseRecord(currentPlayerHPS, playerHPS, Engine.TYPE_HEAL,true);

end


--initialize module
function mod:OnInitialize()

	--store the meter
	mod.meter = Engine.AddOn:GetModule("meter");

	--we don't have boss mod by default
	mod.hasBossMod = false;

	--calculate a unique popup name
	mod.popupName = Engine.Name.."_QUESTION";

	StaticPopupDialogs[mod.popupName] = {
		text = "%s",
		button1 = _G.YES,
		button2 = _G.NO,
		OnAccept = function()
		print("hello world");
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
		showAlert = true,
	}


	debug("Encounters module loaded");
end


--return the list of stored instances
function mod:GetInstances()

	local result = {};

	if(Engine.GLOBAL.encounters) then
		local key,value;

		for key,value in pairs(Engine.GLOBAL.encounters) do

			table.insert(result,key);

		end
	end

	table.sort(result);

	return result;
end

--return the list of stored instances in a difficult
function mod:getDifficultyList(instance)

	local result = {};

	if(Engine.GLOBAL.encounters) then

		local key,value;

		if(instance) then

			local difficultyList = Engine.GLOBAL.encounters[instance];

			if ( difficultyList ) then

				for key,value in pairs(difficultyList) do

					table.insert(result,key);

				end

			end

		end
	end

	table.sort(result);

	return result;

end

--rerturn the encounters list in a isntance an difficult
function mod:getEncounterList(instance,difficulty)

	local result = {};

		if(Engine.GLOBAL.encounters) then

			local key,value;

			if(instance) then

				local difficultyList = Engine.GLOBAL.encounters[instance];
				if ( difficultyList ) then

					if(difficulty) then

						local encounterList = difficultyList[difficulty];

						if ( encounterList ) then
							for key,value in pairs(encounterList) do

								table.insert(result,key);

							end
						end

					end

				end

			end

		end

	table.sort(result);

	return result;

end

--return the record object
function mod:getRecords(instance,difficulty,encounter)

	local records = nil;

	if instance and difficulty and encounter then

		if(Engine.GLOBAL.encounters) then

			local difficultyList = Engine.GLOBAL.encounters[instance];

			if ( difficultyList ) then

				local encounterList = difficultyList[difficulty];

				if ( encounterList ) then

					local encounterItem = encounterList[encounter];

					if (encounterItem) then
						records = encounterItem.records;
					end

				end

			end

		end

	end

	return records;

end

--help function that remove wow color codes
function mod:removeColors(line)
	local str=line;
	local k,v;

	local escapes = {
		["|c%x%x%x%x%x%x%x%x"] = "", -- color start
		["|r"] = "", -- color end
	}

    for k, v in pairs(escapes) do
        str = gsub(str, k, v);
    end

    return str;

end

--report a line to a channel
function mod:reportLine(line,channel)

	--if the channel is self just print
	if(channel==Engine.REPORT_SELF) then

		print(line);

	--if its guild sent it to guild
	elseif(channel==Engine.REPORT_GUILD) then

		SendChatMessage(mod:removeColors(line),"GUILD");

	--if we wnat instance channel
	elseif(channel==Engine.REPORT_INSTANCE) then

		--get instnace information
		local InInstance, InstanceType = IsInInstance();
		local instanceChannel = "";

		--if we are in a LFR party / raid send it to the instance channel
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) or IsInRaid(LE_PARTY_CATEGORY_INSTANCE) then

			instanceChannel = "INSTANCE_CHAT";

		--if we are in a instanced pvp
		elseif InstanceType == "pvp" or InstanceType == "arena" then

			instanceChannel = "INSTANCE_CHAT";

		--if we are just grouped
		elseif GetNumGroupMembers() > 0 then

			--if we are in raid
			if IsInRaid(LE_PARTY_CATEGORY_HOME) then

				instanceChannel = "RAID";

			--if we are in party
			elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then

				instanceChannel = "PARTY";

			end

		--we are in instance but not a group, just print
		else

			print(line)

		end

		--if we have a channel send it
		if(instanceChannel~="") then
			SendChatMessage(mod:removeColors(line),instanceChannel);
		end

	end

end

--report a record line in a channel
function mod:reportRecordsItem(records,top,channel)

	local line = "";

	if (top) then

		if(records.DPS and records.DPS.dps) then

			line = string.format(L["ENCOUNTERS_RECORD_DPS_LINE"],
				_G.RAID_CLASS_COLORS[records.DPS.enclass].colorStr,
				records.DPS.name,
				mod.meter:FormatNumber(records.DPS.dps),
				date("%d/%m/%y %H:%M:%S",records.DPS.timestamp),
				records.DPS.groupSize
			);

			mod:reportLine(line,channel);

		end

		if(records.HPS  and records.HPS.hps) then

			line = string.format(L["ENCOUNTERS_RECORD_HPS_LINE"],
				_G.RAID_CLASS_COLORS[records.HPS.enclass].colorStr,
				records.HPS.name,
				mod.meter:FormatNumber(records.HPS.hps),
				date("%d/%m/%y %H:%M:%S",records.HPS.timestamp),
				records.HPS.groupSize
			);

			mod:reportLine(line,channel);

		end
	else

		if(records.playerDPS and records.playerDPS.dps) then

			line = string.format(L["ENCOUNTERS_RECORD_DPS_LINE"],
				_G.RAID_CLASS_COLORS[records.playerDPS.enclass].colorStr,
				records.playerDPS.name,
				mod.meter:FormatNumber(records.playerDPS.dps),
				date("%d/%m/%y %H:%M:%S",records.playerDPS.timestamp),
				records.playerDPS.groupSize
			);

			mod:reportLine(line,channel);

		end

		if(records.playerHPS and records.playerHPS.hps) then

			line = string.format(L["ENCOUNTERS_RECORD_HPS_LINE"],
				_G.RAID_CLASS_COLORS[records.playerHPS.enclass].colorStr,
				records.playerHPS.name,
				mod.meter:FormatNumber(records.playerHPS.hps),
				date("%d/%m/%y %H:%M:%S",records.playerHPS.timestamp),
				records.playerHPS.groupSize
			);

			mod:reportLine(line,channel);

		end

	end
end

--report records in a channel
function mod:reportRecords(instance,difficulty,encounter,top,channel)

	local records = nil;
	local line = "";

	if instance and difficulty and encounter then

		if(Engine.GLOBAL.encounters) then

			local difficultyList = Engine.GLOBAL.encounters[instance];

			if ( difficultyList ) then

				local encounterList = difficultyList[difficulty];

				if ( encounterList ) then

					local encounterItem = encounterList[encounter];

					if (encounterItem) then
						records = encounterItem.records;
						if (records) then

							if(top) then
								line = string.format(L["REPORT_ENCOUNTER_RECORDS_TOP"],Engine.Name,encounter,difficulty);
							else
								line = string.format(L["REPORT_ENCOUNTER_RECORDS_PLAYER"],Engine.Name,encounter,difficulty);
							end

							mod:reportLine(line,channel);
							mod:reportRecordsItem(records,top,channel);
						end
					end

				end

			end

		end

	end


end

--build the tree table
function mod:buildTreeTable()
	local tree = {};

	local instancesList = mod:GetInstances();

	local instanceItem;
	local difficultyList;
	local difficultyItem;
	local encounterList;
	local encounterItem;

	for instanceKey,instanceValue in pairs(instancesList) do

		instanceItem = { text = string.format(L["RECORDS_TREE_INSTANCE_FORMAT"],instanceValue), value = instanceValue, children = {} };

		difficultyList = mod:getDifficultyList(instanceValue);

		for difficultKey,difficultValue in pairs(difficultyList) do

			difficultyItem = { text = string.format(L["RECORDS_TREE_DIFFICULT_FORMAT"],difficultValue), value = difficultValue, children = {} };

			encounterList = mod:getEncounterList(instanceValue,difficultValue);

			for encounterKey,encounterValue in pairs(encounterList) do

				encounterItem = { text = string.format(L["RECORDS_TREE_ENCOUNTER_FORMAT"],encounterValue), value = encounterValue };

				table.insert(difficultyItem.children,encounterItem);

			end

			table.insert(instanceItem.children,difficultyItem);

		end

		table.insert(tree,instanceItem);

	end

	return tree;
end

--count the encounters in a particular instance & difficulty
function mod:getEncountersCount(instance,difficulty)

	local encounterList = mod:getEncounterList(instance,difficulty);

	local count = 0;

	for encounterKey,encounterValue in pairs(encounterList) do
		count = count + 1;
	end

	return count;
end

--count the encounters in a particular instance
function mod:getEncountersInInstance(instance)

	local count = 0;

	local difficultyList = mod:getDifficultyList(instance);

	for difficultKey,difficultValue in pairs(difficultyList) do

		count = count + mod:getEncountersCount(instance,difficultValue);

	end

	return count;
end

--get a record string
function mod:getRecordsString(records,top)

	local result="";
	local line="";

	if (top) then

		if(records.DPS and records.DPS.dps) then

			line = string.format(L["ENCOUNTERS_RECORD_DPS_LINE"],
				_G.RAID_CLASS_COLORS[records.DPS.enclass].colorStr,
				records.DPS.name,
				mod.meter:FormatNumber(records.DPS.dps),
				date("%d/%m/%y %H:%M:%S",records.DPS.timestamp),
				records.DPS.groupSize
			);

			result = result .. line .. "\n";

		end

		if(records.HPS and records.HPS.hps) then

			line = string.format(L["ENCOUNTERS_RECORD_HPS_LINE"],
				_G.RAID_CLASS_COLORS[records.HPS.enclass].colorStr,
				records.HPS.name,
				mod.meter:FormatNumber(records.HPS.hps),
				date("%d/%m/%y %H:%M:%S",records.HPS.timestamp),
				records.HPS.groupSize
			);

			result = result .. line .. "\n";

		end
	else

		if(records.playerDPS and records.playerDPS.dps) then

			line = string.format(L["ENCOUNTERS_RECORD_DPS_LINE"],
				_G.RAID_CLASS_COLORS[records.playerDPS.enclass].colorStr,
				records.playerDPS.name,
				mod.meter:FormatNumber(records.playerDPS.dps),
				date("%d/%m/%y %H:%M:%S",records.playerDPS.timestamp),
				records.playerDPS.groupSize
			);

			result = result .. line .. "\n";

		end

		if(records.playerHPS and records.playerHPS.hps) then

			line = string.format(L["ENCOUNTERS_RECORD_HPS_LINE"],
				_G.RAID_CLASS_COLORS[records.playerHPS.enclass].colorStr,
				records.playerHPS.name,
				mod.meter:FormatNumber(records.playerHPS.hps),
				date("%d/%m/%y %H:%M:%S",records.playerHPS.timestamp),
				records.playerHPS.groupSize
			);

			result = result .. line .. "\n";

		end

	end

	return result;
end

--list item change
function mod.reporNowClick(object,event)

	--get the list object
	local list = object:GetUserData("listObj");

	--get the destination
	local destination = list:GetUserData("destination");

	--get if we want top or player record
	local isTop = object:GetUserData("isTop");

	--report the record
	mod:reportRecords(	mod.selectedInstance,
						mod.selectedDifficulty,
						mod.selectedEncounter,
						isTop,
						destination);
end

--list item change
function mod.reporToChange(object,event,value)

	--store the value in destination
	object:SetUserData("destination", value);

end

--mouse over a widget
function mod.widgetMouseOver(widget, event)

	--get the tooltip text
	local tooltip = widget:GetUserData("custom_tooltip");

	--if we get a text
	if tooltip then

		--get the widget text
		local text = widget.text and widget.text:GetText() or "";

		--show using the game tooltip
		GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT");
		GameTooltip:ClearLines();
		GameTooltip:AddLine(text, 1, .82, 0, true)
		GameTooltip:AddLine(tooltip, 1, 1, 1, true);
		GameTooltip:Show();

	end
end

--mouse leave a widget
function mod.widgetMouseLeave(widget, event)

	--hide tooltip
	GameTooltip:Hide();

end


--add tooltip to a widget
function mod:addTooltip(widget,tooltip)

	--if we have a tooltip
	if tooltip then

		--set the tooltip as user data
		widget:SetUserData("custom_tooltip",tooltip);

		--set the mouse callbacks
		widget:SetCallback("OnEnter",mod.widgetMouseOver);
		widget:SetCallback("OnLeave",mod.widgetMouseLeave);

	end

end

--create the widgets for the record details
function mod:createRecordsDetailsWidgets()

	--if we have the widget return
	if mod.hasRecordDetailsWidgets then return; end

	--create top records header
	mod.topRecordsHeaderWidget = AceGUI:Create("Label");
	mod.topRecordsHeaderWidget:SetText(L["ENCOUNTERS_TOP_RECORDS_DESC"]);
	mod.topRecordsHeaderWidget:SetFullWidth(true);
	mod.containerWidget:AddChild(mod.topRecordsHeaderWidget);

	--create top records widget
	mod.topRecordsWidget = AceGUI:Create("Label");
	mod.topRecordsWidget:SetText("");
	mod.topRecordsWidget:SetFullWidth(true);
	mod.containerWidget:AddChild(mod.topRecordsWidget);

	--create the report top button
	mod.reportTopButon = AceGUI:Create("Button");
	mod.reportTopButon:SetText(L["REPORT_NOW"]);
	mod.reportTopButon:SetCallback("OnClick", mod.reporNowClick)
	mod.reportTopButon:SetUserData("isTop", true);
	mod:addTooltip(mod.reportTopButon,L["REPORT_NOW_TOP_DESC"]);
	mod.containerWidget:AddChild(mod.reportTopButon);

	--create the report to top list
	mod.reportTopList = AceGUI:Create("Dropdown");
	mod.reportTopList:SetLabel(L["REPORT_NOW_TO"]);
	mod.reportTopList:SetList(Engine.ReportTypeList);
	mod.reportTopList:SetCallback("OnValueChanged", mod.reporToChange)
	mod.reportTopList:SetValue(Engine.REPORT_SELF);
	mod.reportTopList:SetUserData("destination", Engine.REPORT_SELF);
	mod.reportTopButon:SetUserData("listObj",mod.reportTopList);
	mod.containerWidget:AddChild(mod.reportTopList);

	--create player records header
	mod.playerRecordsHeaderWidget = AceGUI:Create("Label");
	mod.playerRecordsHeaderWidget:SetText(L["ENCOUNTERS_PLAYER_RECORDS_DESC"]);
	mod.playerRecordsHeaderWidget:SetFullWidth(true);
	mod.containerWidget:AddChild(mod.playerRecordsHeaderWidget);

	--create player records widget
	mod.playerRecordsWidget = AceGUI:Create("Label");
	mod.playerRecordsWidget:SetText("");
	mod.playerRecordsWidget:SetFullWidth(true);
	mod.containerWidget:AddChild(mod.playerRecordsWidget);

	--create the report player button
	mod.reportPlasyerButon = AceGUI:Create("Button");
	mod.reportPlasyerButon:SetText(L["REPORT_NOW"]);
	mod.reportPlasyerButon:SetCallback("OnClick", mod.reporNowClick)
	mod.reportPlasyerButon:SetUserData("isTop", false);
	mod:addTooltip(mod.reportPlasyerButon,L["REPORT_NOW_PLAYER_DESC"]);
	mod.containerWidget:AddChild(mod.reportPlasyerButon);

	--create the report to player list
	mod.reportPlayerList = AceGUI:Create("Dropdown");
	mod.reportPlayerList:SetLabel(L["REPORT_NOW_TO"]);
	mod.reportPlayerList:SetList(Engine.ReportTypeList);
	mod.reportPlayerList:SetCallback("OnValueChanged", mod.reporToChange)
	mod.reportPlayerList:SetValue(Engine.REPORT_SELF);
	mod.reportPlayerList:SetUserData("destination", Engine.REPORT_SELF);
	mod.reportPlasyerButon:SetUserData("listObj",mod.reportPlayerList);
	mod.containerWidget:AddChild(mod.reportPlayerList);

	--we have record details widgets
	mod.hasRecordDetailsWidgets = true;

end

--release the widgets for the record details
function mod:releaseRecordsDetailsWidgets()

	--if we don't have the widget return
	if not mod.hasRecordDetailsWidgets then return; end

	--release the childresn
	mod.containerWidget:ReleaseChildren();

	--we dont have record details widgets
	mod.hasRecordDetailsWidgets = false;

end

--encounter selected
function mod:instanceSelected(instance)

	--set the header text
	mod.headerWidget:SetText(string.format(L["HEADER_RECORDS_INSTANCE"],instance));

	--release the details if we need to
	mod:releaseRecordsDetailsWidgets();

	--count and displayer the encounters
	local count = mod:getEncountersInInstance(instance);
	mod.descWidget:SetText(string.format(L["RECORDS_INSTANCE_DESC"],count));

end

--encounter selected
function mod:difficultySelected(instance,difficulty)

	--set the header text
	mod.headerWidget:SetText(string.format(L["HEADER_RECORDS_INSTANCE_DIFFICULT"],instance,difficulty));

	--release the details if we need to
	mod:releaseRecordsDetailsWidgets();

	--count and displayer the encounters
	local count = mod:getEncountersCount(instance,difficulty);
	mod.descWidget:SetText(string.format(L["RECORDS_INSTANCE_DIFIFICULT_DESC"],count));

end

--encounter selected
function mod:encounterSelected(instance,difficulty,encounter)

	--set the header text
	mod.headerWidget:SetText(string.format(L["HEADER_RECORDS_INSTANCE_DIFFICULT_ENCOUNTER"],instance,difficulty,encounter));

	--store values
	mod.selectedInstance 	= instance;
	mod.selectedDifficulty 	= difficulty;
	mod.selectedEncounter 	= encounter;

	--create the details widget if needed
	mod:createRecordsDetailsWidgets();

	local topRecordsStr = L["NO_DATA"];
	local playerRecordsStr = L["NO_DATA"];

	--get the recor data
	local records = mod:getRecords(instance,difficulty,encounter);

	--get the records details
	if (records) then

		topRecordsStr 		= mod:getRecordsString(records,true);
		playerRecordsStr 	= mod:getRecordsString(records,false);

	end;

	--set the record details
	mod.topRecordsWidget:SetText(topRecordsStr);
	mod.playerRecordsWidget:SetText(playerRecordsStr);

	--since we change some control redo the layout
	mod.containerWidget:DoLayout();

end

--select something in the tree
function mod.treeSelected(object,event,path)

	--empty the description
	mod.descWidget:SetText("");

	if path then

		--split the path to get the items selected
		local instance,difficulty,encounter = ("\001"):split(path);

		--call the clicked event
		if(difficulty) then

			if(encounter) then

				mod:encounterSelected(instance,difficulty,encounter);

			else

				mod:difficultySelected(instance,difficulty);

			end

		else

				mod:instanceSelected(path);

		end

	end

end

--create the records tree
function mod:createRecordsTree(frame)

	local tree = mod:buildTreeTable();

	local treewidget = AceGUI:Create("TreeGroup")
	treewidget:SetTree(tree);
	treewidget:SetFullWidth(true);
	treewidget:SetFullHeight(true);
	treewidget:EnableButtonTooltips(false);
	treewidget:SetCallback("OnGroupSelected", mod.treeSelected);

	return treewidget;
end

--windows close
function mod.closeRecordsWindow(object,event)

	--release objects
	AceGUI:Release(object)

	--hide tooltip if was present
	GameTooltip:Hide();

	debug("browse records frame closed")
end

--create the widgets
function mod:createWidgets()

	--status or not data
	local status = Engine.GLOBAL.encounters and L["BROWSE_RECORDS_STATUS"] or L["NO_DATA"];

	mod.browseRecordsFrame:SetTitle(L["BROWSE_RECORDS_WINDOW"]);
	mod.browseRecordsFrame:SetStatusText(status);
	mod.browseRecordsFrame:SetCallback("OnClose", mod.closeRecordsWindow);
	mod.browseRecordsFrame:SetLayout("Flow");

	--create tree
	mod.treeWidget = mod:createRecordsTree(mod.browseRecordsFrame);
	mod.browseRecordsFrame:AddChild(mod.treeWidget);

	--create header widget
	mod.headerWidget = AceGUI:Create("Label");
	mod.headerWidget:SetText(status);
	mod.headerWidget:SetFullWidth(true);
	mod.headerWidget:SetFontObject(_G.GameFontHighlightLarge);
	mod.treeWidget:AddChild(mod.headerWidget);

	--create desc widget
	mod.descWidget = AceGUI:Create("Label");
	mod.descWidget:SetText("");
	mod.descWidget:SetFullWidth(true);
	mod.treeWidget:AddChild(mod.descWidget);

	--create wipe All Widget
	mod.wippeAllButton = AceGUI:Create("Button");
	mod.wippeAllButton:SetText(L["ENCOUNTERS_WIPE"]);
	mod:addTooltip(mod.wippeAllButton,L["ENCOUNTERS_WIPE_DESC"]);
	mod.wippeAllButton:SetCallback("OnClick", mod.askWipeAllData);
	mod.wippeAllButton:SetDisabled(not (Engine.GLOBAL.encounters));
	mod.treeWidget:AddChild(mod.wippeAllButton);

	--line break
	mod.lineBreak = AceGUI:Create("Heading");
	mod.lineBreak:SetText("");
	mod.lineBreak:SetFullWidth(true);
	mod.treeWidget:AddChild(mod.lineBreak);

	--create container widget
	mod.containerWidget = AceGUI:Create("SimpleGroup");
	mod.containerWidget:SetFullWidth(true);
	mod.containerWidget:SetLayout("Flow");
	mod.treeWidget:AddChild(mod.containerWidget);

	--we dont have record details
	mod.hasRecordDetailsWidgets = false;

end

--create the browse records window
function mod:browseRecords()

	--create frame
	mod.browseRecordsFrame = AceGUI:Create("Frame");

	--create the widgets
	mod:createWidgets();

	debug("browse records frame created");

end