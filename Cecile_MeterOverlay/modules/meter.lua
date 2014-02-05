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
end

--event when we exit combat
function mod.OutOfCombat()
	mod.combat = false;	
	mod.NextCombatBoss = "";
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
function mod.getSumtable(dataset, mode, sortData)
	local sumtable, totalsum, totalpersec = mod.getMeterSumtable(dataset, mode);
	
	--sort the results
	if sortData then	
		
		if mode == Engine.TYPE_DPS then
		
			table.sort(sumtable, function(a,b) return a.damage > b.damage end);
			
		elseif mode == Engine.TYPE_HEAL then
		
			table.sort(sumtable, function(a,b) return a.healing > b.healing end);
		end	
		
	end
	
	--return the values
	return sumtable, totalsum, totalpersec;	
end

--initialize module
function mod:OnInitialize()

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
		mod:SetValue("meter",mod.desc,BATTLENET_FONT_COLOR_CODE);
		
		--set the tag value for get the current segment name
		mod:SetValue("combat",function () 
				return mod.getSegmentName(Engine.Profile.segment)
			end,ACHIEVEMENT_COLOR_CODE);
		
		--set the tag value for get the current datatext
		mod:SetValue("dataset",function () 
				return Engine.ConvertDataSet[Engine.Profile.segment]		
		end,ACHIEVEMENT_COLOR_CODE);				
		
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
	
	--get the table and totals, we do not need sorting the table
	StatsTable,totalsum,totalpersec = mod.getSumtable(tablename, mode,true);
	
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

--parse a tage string returing a string with the values
function mod:PaseString(taged)

	--make a copy of the origina string
	local result = taged

	--temporal var
	local v
	
	--find any [key] in a string
	for k in string.gmatch(taged, "%[%w+%]") do
		
		--default value
		v = ""
		--lowercase the key
		k = string.lower(k)
		
		--remove the brackets
		k = string.gsub(k,"%[","")
		k = string.gsub(k,"%]","")
		
		--check if we have a value for that key
		if(mod.values[k]) then			
			
			--get the current value
			v = mod.values[k].value

			--if is a function call to it
			if(type(v)=="function") then
				v = v()
			end
			
			--if has color, colorize it
			if mod.values[k].color then
				v = mod.values[k].color..v..FONT_COLOR_CODE_CLOSE;			
			end
			
		end
		
		--replace the tag in the result string
		k = "%["..k.."%]";
		result = string.gsub(result,k,v);
		
	end
	
	--return the new string
	return result;
end

--return a formated string for the selected table set
function mod:GetValues(tablename,taged)

	--get the values from the meter
	local rdamage,rdps,dps,damage,ndps 		= mod:ValuePerSecond(tablename, Engine.TYPE_DPS);
	local rhealing,rhps,hps,healing,nhps 	= mod:ValuePerSecond(tablename, Engine.TYPE_HEAL);		

	--set the tag values
	mod:SetNumberValue( "dps",		dps,		RED_FONT_COLOR_CODE);
	mod:SetNumberValue( "rdps",		rdps,		RED_FONT_COLOR_CODE);
	mod:SetNumberValue( "damage",	damage,		RED_FONT_COLOR_CODE);	
	mod:SetNumberValue( "rdamage",	rdamage,	RED_FONT_COLOR_CODE);
	mod:SetOrdinalValue( "ndps",	ndps,		RED_FONT_COLOR_CODE);
	
	mod:SetNumberValue("hps",		hps,		GREEN_FONT_COLOR_CODE);
	mod:SetNumberValue("rhps",		rhps,		GREEN_FONT_COLOR_CODE);
	mod:SetNumberValue("healing",	healing,	GREEN_FONT_COLOR_CODE);
	mod:SetNumberValue("rhealing",	rhealing,	GREEN_FONT_COLOR_CODE);
	mod:SetOrdinalValue("nhealer",	nhps,		GREEN_FONT_COLOR_CODE);
	
	--return the string
	return mod:PaseString(taged);
end