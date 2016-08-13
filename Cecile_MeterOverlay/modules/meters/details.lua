----------------------------------------------------------------------------------------------------
-- details module
--  original code by shadowphoenix : https://github.com/shadowphoenix

--if Details its not present, dont use this module
if not IsAddOnLoaded( "Details" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("details");

--debug
local debug = Engine.AddOn:GetModule("debug");

--toggle details window
function mod.Toggle()
	local Details = _G._detalhes;

	local opened = Details:GetOpenedWindowsAmount()

	if (opened == 0) then
		Details:ReabrirTodasInstancias()
	else
		Details:ShutDownAllInstances()
	end
end

--get sum table
function mod.GetSumtable(tablename, mode)

	--get details
	local Details = _G._detalhes;

	--default values
	local totalsum=0;
	local totalpersec=0;
	local sumtable={};
	local report_set = nil;

	--get the set
	if(tablename==Engine.CURRENT_DATA) then
		report_set = Details:GetCombat("current")
	elseif(tablename==Engine.OVERALL_DATA) then
		report_set = Details:GetCombat("overall")
	end

	if(report_set) then
		-- For each item in dataset
		local nr = 1;
		local templable = {};

		local attribute;
		if (mode == Engine.TYPE_DPS) then
			attribute = DETAILS_ATTRIBUTE_DAMAGE;
		else
			attribute = DETAILS_ATTRIBUTE_HEAL;
		end

		local container = report_set:GetContainer(attribute)
		for i, player in container:ListActors() do
			if player:IsPlayer() and player:IsGroupPlayer() then

				--get the data from the player
				templable = {enclass=player:Class() or "UNKNOWN",name=player:Name(),damage = 0 , mode == mode, healing = 0,dps=0,hps=0};

				--time for DPS/HPS calculation
				local totaltime = 0;

				--get the player active time or elapsed time
				if (Details.time_type == 1) then
					totaltime = player:Tempo() or 0;
				else
					totaltime = report_set:GetCombatTime() or 0;
				end

				--get player values
				local playerTotal = math.floor(player.total or 0)
				local playerPersec = playerTotal / math.max(1,totaltime);

				--we dont want empty results
				if(playerTotal>0) then

					--set the value in DPS/HPS
					if (mode==Engine.TYPE_DPS) then
						templable.damage =  playerTotal;
						templable.dps = playerPersec;
					else
						templable.healing =  playerTotal;
						templable.hps = playerPersec
					end

					--calculate totals
					totalsum = totalsum + playerTotal;
					totalpersec = totalpersec + playerPersec;

					--insert the player
					table.insert(sumtable,templable);

				end
			end
		end
	end

	--return values
	return sumtable, totalsum, totalpersec;
end

--return segment name
function mod.GetSegmentName()

	--final value
	local result = ""

	--return details
	local Details = _G._detalhes;

	--find the set
	local report_set = Details:GetCombat("current")

	--get the name
	if(report_set) then
		result = report_set:GetCombatName(true);
	end

	return result;

end

--initialize module
function mod:OnInitialize()

	--get the generic meter
	mod.meter = Engine.AddOn:GetModule("meter");

	---register the damage meter
	mod.meter:RegisterMeter("Details",mod.GetSumtable,mod.GetSegmentName,mod.Toggle);

end