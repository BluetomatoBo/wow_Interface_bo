----------------------------------------------------------------------------------------------------
-- meter module, manage the meters
--

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("meter");

--debug
local debug = Engine.AddOn:GetModule("debug")

--default toggle function do nothing
function mod.defaultToggle()
	return;
end

--default getMeterSumtable return empty values
function mod.defaultMeterGetSumtable()
	return {},0,0;
end

--default get segment name return empty
function mod.defaultGetMeterSegmentName()
	return "";
end

--event when we enter combat
function mod.InCombat()
	mod.combat = true;
	--set the boss name for the already seen boss (empty if none)
	mod.bossName = mod.NextCombatBoss;

	--hide out of combat
	mod.datatext.ControlVisibility();

end

--event when we exit combat
function mod.OutOfCombat()
	mod.combat = false;
	mod.NextCombatBoss = "";

	--hide out of combat
	mod.datatext.ControlVisibility();

	--ONLY FOR TESTING ENCOUNTER RECORDS
	--local encounters = Engine.AddOn:GetModule("encounters");
	--local encounterName = mod.getSegmentName(Engine.CURRENT_DATA);
	--encounters:recordEncounter(encounterName);

end

--event when we engage a boss
function mod.EngageBoss(...)
	--get the boss name and store it
	local victim = UnitName("boss1");

	if victim then

		--get the localized difficult name
		local name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapID = GetInstanceInfo();

		if not difficultyName then
			difficultyName = ""
		end

		--if we are not in combat the next combat event will set the boss name, ifnot set it now
		if not mod.combat then
			mod.NextCombatBoss = victim.." - "..difficultyName;
		else
			mod.NextCombatBoss = ""
			mod.bossName = victim.." - "..difficultyName;
		end
	end

end

--get the segment name
function mod.getSegmentName(tablename)

	local result = "";

	--if get the current data, if not get the localize segment name
	if tablename == Engine.CURRENT_DATA then

		--if we have a boss name set it, if not return segment name
		if mod.bossName and mod.bossName ~= "" then
			result = mod.bossName;
		else
			result = mod.getMeterSegmentName();
		end
		--if we do not have a segment name
		if result == "" then
			--return just the localized name
			result = Engine.ConvertDataSet[tablename];
		end

	else
		result = Engine.ConvertDataSet[tablename];
	end

	return result;

end

--get the sum table, and perform sorting
function mod.getSumtable(dataset, mode, sortData, sortType)
	local sumtable, totalsum, totalpersec = mod.getMeterSumtable(dataset, mode);

	--sort the results
	if sortData then

		if mode == Engine.TYPE_DPS then

			if(sortType==Engine.SORT_PERSEC) then
				table.sort(sumtable, function(a,b) return a.dps > b.dps end);
			else
				table.sort(sumtable, function(a,b) return a.damage > b.damage end);
			end

		elseif mode == Engine.TYPE_HEAL then

			if(sortType==Engine.SORT_PERSEC) then
				table.sort(sumtable, function(a,b) return a.hps > b.hps end);
			else
				table.sort(sumtable, function(a,b) return a.healing > b.healing end);
			end
		end

	end

	--return the values
	return sumtable, totalsum, totalpersec;
end

--initialize module
function mod:OnInitialize()

	--store the datatext
	mod.datatext = Engine.AddOn:GetModule("datatext");

	--we do not have any meter so set defaults
	mod.desc = Engine.Locale["NO_DATA"];
	mod.toggle = mod.defaultToggle;
	mod.getMeterSumtable = mod.defaultMeterGetSumtable;
	mod.getMeterSegmentName = mod.defaultGetMeterSegmentName;
	mod.registered=false;

	--get player and non localized class for latter use
	mod.myname = GetUnitName("player");
	mod.localclass,mod.myclass = UnitClass("player");

	--this will store the values for the tags
	mod.values = {};

	--In/Out Combat & boss name
	mod.combat = false;
	mod.bossName = "";
	mod.NextCombatBoss = "";

	Engine.AddOn:RegisterEvent("PLAYER_REGEN_ENABLED",mod.OutOfCombat);
	Engine.AddOn:RegisterEvent("PLAYER_REGEN_DISABLED",mod.InCombat);
	Engine.AddOn:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT",mod.EngageBoss);

end

--set a value for the tags, we could set a var o a function and color
function mod:SetValue(name,value,color)

	mod.values[name] = {value = value, color = color};

end

--set a tag value using human readable format
function mod:SetNumberValue(name,value,color)

	mod:SetValue(name,mod:FormatNumber(value),color);

end

--set a tag value appending the ordinal of that number
function mod:SetOrdinalValue(name,value,color)

	mod:SetValue(name,value..Engine:OrdinalSuffix(value),color);

end

--register a damage meter, if is not registered yet
function mod:RegisterMeter(desc,getSumtable,getSegmentName,toggle)

	if not(mod.registered) then

		mod.desc = desc;
		mod.toggle = toggle;
		mod.getMeterSumtable = getSumtable;
		mod.getMeterSegmentName = getSegmentName;

		--set the tag value for the meter name
		mod:SetValue("meter",mod.desc,Engine.CONFIG_COLOR_OTHER);

		--set the tag value for get the current segment name
		mod:SetValue("combat",function ()
				return mod.getSegmentName(Engine.Profile.segment)
			end,Engine.CONFIG_COLOR_OTHER);

		--set the tag value for get the current datatext
		mod:SetValue("dataset",function ()
				return Engine.ConvertDataSet[Engine.Profile.segment]
			end,Engine.CONFIG_COLOR_OTHER);

		--set the tag for player name, using his class color
		mod:SetValue("player",mod.myname,"|c".._G["RAID_CLASS_COLORS"][mod.myclass].colorStr );

		--we have a meter registered
		mod.registered = true;

		debug("Meter %s registered",desc);
	end

end

--return values per second using a table set and mode
function mod:ValuePerSecond(tablename, mode)

	--default values
	local value,persec,StatsTable,totalsum,totalpersec,mypos=0,0,nil,0,0,1;

	--get the table and totals, we do need sorting the table
	StatsTable,totalsum,totalpersec = mod.getSumtable(tablename, mode,true,Engine.SORT_RAW);

	--loop the table
	local numofcombatants = #StatsTable;

	for i = 1, numofcombatants do

		--check if we want the dps o hps data until we found our player data
		if StatsTable[i].name == mod.myname then
			if mode == Engine.TYPE_DPS then
				persec = StatsTable[i].dps;
				value  = StatsTable[i].damage;
				mypos = i;
			else
				persec = StatsTable[i].hps;
				value  = StatsTable[i].healing;
				mypos = i;
			end
			break;
		end

	end

	return totalsum,totalpersec,persec,value,mypos;
end

--return top player data using a table set and mode
function mod:GetTopPlayerData(tablename, mode)


	--default values
	local result = nil;

	--get the table and totals, we need sorting
	StatsTable,totalsum,totalpersec = mod.getSumtable(tablename, mode, true, Engine.SORT_RAW);

	--loop the table
	local numofcombatants = #StatsTable;

	if numofcombatants>0 then
		result = StatsTable[1];
	end


	return result;
end

--return the player data using a table set and mode
function mod:GetPlayerData(tablename,mode)

	--default values
	local result = nil;

	--get the table and totals, we don't need sorting the table
	StatsTable,totalsum,totalpersec = mod.getSumtable(tablename, mode, false);

	--loop the table
	local numofcombatants = #StatsTable;

	for i = 1, numofcombatants do

		--until we found our player data
		if StatsTable[i].name == mod.myname then
			result = StatsTable[i];
			break;
		end

	end

	return result;
end

-- Formats a number into human readable format
function mod:FormatNumber(number)
	if number then
		if number > 1000000 then
			return 	("%02.2fM"):format(number / 1000000);
		else
			if number > 1000 then
				return 	("%02.1fK"):format(number / 1000);
			else
				return math.floor(number);
			end
		end
	else
		return 0;
	end
end

--returna a color string for a giving color in rgba(floats)
function mod:getColorString(color)

	local result = string.format("|c%02X%02X%02X%02X",
		color.a and color.a*255 or 255,
		color.r*255,
		color.g*255,
		color.b*255)

	return result;
end

--return a configurable color
function mod:getConfigurableColor(name)

	local configValue = Engine.Profile.datatext.colors[name];

	local result = configValue and mod:getColorString(configValue) or name;

	return result

end

--parse a tage string returing a string with the values
function mod:PaseString(taged)

	--get the general color
	local generalColor = mod:getConfigurableColor(Engine.CONFIG_COLOR_GENERAL);

	--make a copy of the origina string
	local result = generalColor..taged;

	--temporal var
	local v,k,c;

	--find any [key] in a string
	for k in string.gmatch(taged, "%[%w+%]") do

		--default value
		v = "";
		--lowercase the key
		k = string.lower(k);

		--remove the brackets
		k = string.gsub(k,"%[","");
		k = string.gsub(k,"%]","");

		--check if we have a value for that key
		if(mod.values[k]) then

			--get the current value
			v = mod.values[k].value;

			--if is a function call to it
			if(type(v)=="function") then
				v = v();
			end

			--if has color, colorize it
			if mod.values[k].color then
				c = mod:getConfigurableColor(mod.values[k].color)
				v = FONT_COLOR_CODE_CLOSE..c..v..FONT_COLOR_CODE_CLOSE..generalColor;
			end

		end

		--replace the tag in the result string
		k = "%["..k.."%]";
		result = string.gsub(result,k,v);

	end

	result = result .. FONT_COLOR_CODE_CLOSE;

	--remove unwanted color strings
	result = string.gsub(result,generalColor..FONT_COLOR_CODE_CLOSE,"");
	result = string.gsub(result,generalColor.." "..FONT_COLOR_CODE_CLOSE," ");

	--return the new string
	return result;
end

--return a formated string for the selected table set
function mod:GetValues(tablename,taged)

	--get the values from the meter
	local rdamage,rdps,dps,damage,ndps 		= mod:ValuePerSecond(tablename, Engine.TYPE_DPS);
	local rhealing,rhps,hps,healing,nhps 	= mod:ValuePerSecond(tablename, Engine.TYPE_HEAL);

	--calculate % dps
	local pdps = 100;
	if (rdamage~=0) then
		pdps = math.floor(1000*damage/rdamage)/10;
	end

	--calculate % heal
	local pheal = 100;
	if (rhealing~=0) then
		pheal = math.floor(1000*healing/rhealing)/10;
	end

	--set the tag values
	mod:SetNumberValue( 	"dps",		dps,		Engine.CONFIG_COLOR_DAMAGE);
	mod:SetNumberValue( 	"rdps",		rdps,		Engine.CONFIG_COLOR_DAMAGE);
	mod:SetNumberValue( 	"damage",	damage,		Engine.CONFIG_COLOR_DAMAGE);
	mod:SetNumberValue( 	"rdamage",	rdamage,	Engine.CONFIG_COLOR_DAMAGE);
	mod:SetNumberValue( 	"pdps",		pdps,		Engine.CONFIG_COLOR_DAMAGE);
	mod:SetOrdinalValue(	"ndps",		ndps,		Engine.CONFIG_COLOR_DAMAGE);

	mod:SetNumberValue(		"hps",		hps,		Engine.CONFIG_COLOR_HEALING);
	mod:SetNumberValue(		"rhps",		rhps,		Engine.CONFIG_COLOR_HEALING);
	mod:SetNumberValue(		"healing",	healing,	Engine.CONFIG_COLOR_HEALING);
	mod:SetNumberValue(		"rhealing",	rhealing,	Engine.CONFIG_COLOR_HEALING);
	mod:SetNumberValue(		"pheal",	pheal,		Engine.CONFIG_COLOR_HEALING);
	mod:SetOrdinalValue(	"nhealer",	nhps,		Engine.CONFIG_COLOR_HEALING);

	--return the string
	return mod:PaseString(taged);
end