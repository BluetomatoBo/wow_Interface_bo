----------------------------------------------------------------------------------------------------
-- skada module
--

--if Skada its not present, dont use this module
if not IsAddOnLoaded( "Skada" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("skada");

--debug
local debug = Engine.AddOn:GetModule("debug");

--toggle skada window
function mod.Toggle()
	local Skada = _G.Skada;
	Skada:ToggleWindow();
end

--get sum table
function mod.GetSumtable(tablename, mode)
	
	--get skada
	local Skada = _G.Skada;
	
	--default values
	local totalsum=0;
	local totalpersec=0;
	local sumtable={};
	local report_set = nil;
	
	--get the set
	if(tablename==Engine.CURRENT_DATA) then
		report_set = Skada:find_set("current");
	elseif(tablename==Engine.OVERALL_DATA) then
		report_set = Skada:find_set("total");
	end
			
	if(report_set) then		
		-- For each item in dataset
		local nr = 1;
		local templable = {};
		
		for i, player in ipairs(report_set.players) do
			if player.id then			
			
				--get the data from the player
				templable = {enclass=player.class,name=player.name,damage=player.damage or 0,healing=player.healing or 0,dps=0,hps=0};										
				
				--get the player active time
				local totaltime = Skada:PlayerActiveTime(report_set, player) or 0;
				
				--calculate hps or dps
				if (mode==Engine.TYPE_DPS) then
					if (templable.damage>0) then
						templable.dps = templable.damage / math.max(1,totaltime);
						totalsum = totalsum + templable.damage;
						totalpersec = totalpersec + templable.dps;
						
						--insert the player
						table.insert(sumtable,templable);						
					end
				else
					if (templable.healing>0) then
						templable.hps = templable.healing / math.max(1,totaltime);					
						totalsum = totalsum + templable.healing;
						totalpersec = totalpersec + templable.hps;
						
						--insert the player
						table.insert(sumtable,templable);						
					end
				end
			end
		end
	end						
	
	--return values
	return sumtable, totalsum, totalpersec;
end

--return segment name
function mod.GetSegmentName()

	--return skada
	local Skada = _G.Skada;
	
	--find the set
	local report_set = Skada:find_set("current");
	
	--get the name
	if(report_set) then	

		if (report_set.mobname) then
			return report_set.mobname;
		else
			if (report_set.name) then
				return report_set.name;			
			else
				return "";
			end
		end		
	else
		return "";
	end	
	
end

--initialize module
function mod:OnInitialize()

	--get the generic meter
	mod.meter = Engine.AddOn:GetModule("meter");
			
	---register the damage meter
	mod.meter:RegisterMeter("Skada",mod.GetSumtable,mod.GetSegmentName,mod.Toggle);

end