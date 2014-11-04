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

--not in use
function mod.OnEvent()

end

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

function mod:notifyNewRecord(current, new, mode,isPlayer)
	
	local formatStr = "";
	local channel = "";
	local line = "";
	
	if(mode == Engine.TYPE_DPS) then			
		formatStr = "ENCOUNTERS_NEW_RECORD_DPS";		
	else			
		formatStr = "ENCOUNTERS_NEW_RECORD_HPS";						
	end	
	
	if not isPlayer then					
		if Engine.Profile.encounters.autoReportTop then		
			channel = Engine.Profile.encounters.autoReportTopType;								
		end		
	else				
		if Engine.Profile.encounters.autoReportPlayer then		
			channel = Engine.Profile.encounters.autoReportPlayerType;		
		end											
	end 
	
	if not (channel == "") then
	
		if not (current.name == "") then
			formatStr = formatStr.."_OVER";
		end
		
		line = string.format(L[formatStr],			
			_G.RAID_CLASS_COLORS[new.enclass].colorStr,
			new.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(new.dps) or mod.meter:FormatNumber(new.hps),
			_G.RAID_CLASS_COLORS[ (current.enclass == "") and "PRIEST" or current.enclass ].colorStr,
			current.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(current.dps) or mod.meter:FormatNumber(current.hps)
		);	

		mod:reportLine(line,channel);
	end
	
end

function mod:notifyNotRecord(current, new, mode,isPlayer)

	local formatStr = "";
	local channel = "";
	local line = "";
	
	if(mode == Engine.TYPE_DPS) then			
		formatStr = "ENCOUNTERS_FAIL_RECORD_DPS";		
	else			
		formatStr = "ENCOUNTERS_FAIL_RECORD_HPS";						
	end	
	
	if not isPlayer then					
		if Engine.Profile.encounters.autoReportTop then		
			channel = Engine.Profile.encounters.autoReportTopType;								
		end		
	else				
		if Engine.Profile.encounters.autoReportPlayer then		
			channel = Engine.Profile.encounters.autoReportPlayerType;		
		end											
	end 
	
	if not (channel == "") then
	
		if(current.name == "") then
			formatStr = formatStr.."_OVER";
		end
		
		line = string.format(L[formatStr],			
			_G.RAID_CLASS_COLORS[current.enclass].colorStr,
			current.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(current.dps) or mod.meter:FormatNumber(current.hps),
			_G.RAID_CLASS_COLORS[new.enclass].colorStr,
			new.name,
			(mode == Engine.TYPE_DPS) and mod.meter:FormatNumber(new.dps) or mod.meter:FormatNumber(new.hps)
		);	

		mod:reportLine(line,channel);
	end	
	
	

end

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

function mod:recordEncounter(encounter)

	debug("recordEncounter: '%s'", encounter);

	--get the localized difficult name
	local instanceName, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapID, instanceGroupSize  = GetInstanceInfo();

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

function mod.dbmCallback(event, dbmModule)

	debug("dbmCallback: %s %s", event, dbmModule.combatInfo.name);

	mod:recordEncounter(dbmModule.combatInfo.name);

end

function mod.bwCallback(event, bwModule)

	debug("bwCallback: %s %s", event, bwModule.displayName);

	mod:recordEncounter(bwModule.displayName);

end

--initialize module
function mod:OnInitialize()

	--store the meter
	mod.meter = Engine.AddOn:GetModule("meter");
	
	--check boss mods
	mod.hasDBM 		= IsAddOnLoaded( "DBM-Core" );
	mod.hasBigWigs 	= IsAddOnLoaded( "BigWigs" );
	
	mod.hasBossMod = mod.hasDBM or mod.hasBigWigs;

	if (mod.hasBossMod and Engine.Profile.encounters.store) then
	
		-- register DBM callbacks
		if mod.hasDBM then

			DBM:RegisterCallback("kill", mod.dbmCallback);
			debug("DBM callback registered");

		-- register BigWigs callbacks
		elseif mod.hasBigWigs then
			
			BigWigsLoader.RegisterMessage(mod, "BigWigs_OnBossWin", mod.bwCallback)
			debug("BigWigs message listener registered");

		end
		
	end

	debug("Encounters module loaded");
end

function mod:GetInstances()

	local result = {};

	if(Engine.GLOBAL.encounters) then
		local key,value;

		for key,value in pairs(Engine.GLOBAL.encounters) do

			result[key] = key;

		end
	end

	return result;
end

function mod:getDifficultyList(instance)

	local result = {};

	if(Engine.GLOBAL.encounters) then

		local key,value;

		if(instance) then

			local difficultyList = Engine.GLOBAL.encounters[instance];

			if ( difficultyList ) then

				for key,value in pairs(difficultyList) do

					result[key] = key;

				end

			end

		end
	end

	return result;

end

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

								result[key] = key;

							end
						end

					end

				end

			end

		end

	return result;

end

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

function mod:reportLine(line,channel)
	
	if(channel==Engine.REPORT_SELF) then

		print(line);

	elseif(channel==Engine.REPORT_GUILD) then

		SendChatMessage(mod:removeColors(line),"GUILD");

	elseif(channel==Engine.REPORT_INSTANCE) then

		local InInstance, InstanceType = IsInInstance();
		local instanceChannel = "";

		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) or IsInRaid(LE_PARTY_CATEGORY_INSTANCE) then

			instanceChannel = "INSTANCE_CHAT";

		elseif InstanceType == "pvp" or InstanceType == "arena" then

			instanceChannel = "INSTANCE_CHAT";

		elseif GetNumGroupMembers() > 0 then

			if IsInRaid(LE_PARTY_CATEGORY_HOME) then

				instanceChannel = "RAID";

			elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then

				instanceChannel = "PARTY";

			end

		end

		if(instanceChannel~="") then
			SendChatMessage(mod:removeColors(line),instanceChannel);
		end

	end

end
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