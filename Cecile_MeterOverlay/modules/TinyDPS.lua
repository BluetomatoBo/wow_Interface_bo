----------------------------------------------------------------------------------------------------
-- TinyDPS module
--

--if TinyDPS its not present, dont use this module
if not IsAddOnLoaded( "TinyDPS" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("TinyDPS");

--debug
local debug = Engine.AddOn:GetModule("debug");

--toggle window
function mod.Toggle()
	if _G.tdpsFrame:IsVisible() then
		_G.tdpsFrame:Hide();
	else
		_G.tdpsFrame:Show()
		_G.tdpsRefresh();
	end
end

--get the sum table
function mod.GetSumtable(tablename, mode)
	
	--default values
	local totalsum=0;
	local totalpersec=0	;
	local sumtable={};
	local report_set = nil;		
	
	--get the set
	if(tablename==Engine.CURRENT_DATA) then
		report_set = 2;
	elseif(tablename==Engine.OVERALL_DATA) then
		report_set = 1;
	end

	--check the set
	if report_set and (not tdpsFight[report_set]) then
		report_set = nil;
	end 	
	local data = nil;
	
	--get the data
	if (mode==Engine.TYPE_DPS) then
		data = mod.tdpsDamageData;
	else
		data = mod.tdpsHealdata;
	end
	
	if(report_set) then		
					
		-- For each item in dataset
		local nr = 1		
		for k, v in pairs(_G.tdpsPlayer) do
			
			--se the values in the player data
			local templable = {
				name = strsplit("-", _G.tdpsPlayer[k].name),
				n = _G.tdpsPlayer[k].fight[report_set][data],
				t = _G.tdpsPlayer[k].fight[report_set].t,
				enclass = _G.tdpsPlayer[k].class,
			};
			--merge the pets
			local pet = _G.tdpsPlayer[k].pet;
			for i = 1, #pet do
				-- add pet detail
				templable.n = templable.n + _G.tdpsPet[pet[i]].fight[report_set][data];
				-- check time
				if _G.tdpsPet[pet[i]].fight[report_set].t > templable.t then
					templable.t = _G.tdpsPet[pet[i]].fight[report_set].t;
				end
			end
			
			--calculate persec
			if (mode==Engine.TYPE_DPS) then
				templable.damage = templable.n;
				templable.dps = templable.damage / math.max(1,templable.t );
				totalsum = totalsum + templable.damage;
				totalpersec = totalpersec + templable.dps;
			else
				templable.healing = templable.n;
				templable.hps = templable.healing / math.max(1,templable.t );
				totalsum = totalsum + templable.healing;
				totalpersec = totalpersec + templable.hps;
			end
			--if we hve a valid entry insert in the result
			if(templable.n>0) then
				table.insert(sumtable,templable);
			end
		end		

	end						
	
	--return values
	return sumtable, totalsum, totalpersec;
end

function mod.GetSegmentName()
	
	--current set
	local report_set = 2;
	
	--check if we have a valid set
	if not tdpsFight[report_set] then
		report_set = nil;
	end 
	
	if(report_set) then
		--return the name
		if ( tdpsFight[report_set].name ) then
			return tdpsFight[report_set].name ;
		else
			return "";
		end
	else
		return "";
	end
	
end

--initialize module
function mod:OnInitialize()

	--some const
	mod.tdpsDamageData = 'd';
	mod.tdpsHealdata = 'h';

	--get the generic meter
	mod.meter = Engine.AddOn:GetModule("meter");
			
	--register our damage meter
	mod.meter:RegisterMeter("TinyDPS",mod.GetSumtable,mod.GetSegmentName,mod.Toggle);

end