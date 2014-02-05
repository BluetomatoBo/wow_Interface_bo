----------------------------------------------------------------------------------------------------
-- recount module
--

--if Recount its not present, dont use this module
if not IsAddOnLoaded( "Recount" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("recount");

--debug
local debug = Engine.AddOn:GetModule("debug");

--toggle recount window
function mod.Toggle()
	local Recount = _G.Recount;
	
	if Recount.MainWindow:IsShown() then 
		Recount.MainWindow:Hide();
	else 
		Recount.MainWindow:Show();
		Recount:RefreshMainWindow();
	end
end

-- match pets such as elementals with no proper owner, using their unique GUID
function mod:matchUnitGUID(unitname, guid)

	local Recount = _G.Recount;
	
	for _,data in pairs(Recount.db2.combatants) do
	
		if data.GuardianReverseGUIDs and data.GuardianReverseGUIDs[unitname] 
			and data.GuardianReverseGUIDs[unitname].GUIDs then
			
			for k,v in pairs(data.GuardianReverseGUIDs[unitname].GUIDs) do
			
				if v == guid then 
					return true ;
				end
				
			end
			
		end
		
	end
	
	return false;
end		

---get the table from recount for a dataset and mode
function mod.GetSumtable(dataset, mode)

	--get reccount
	local Recount = _G.Recount;
	
	--get the data set table
	local tablename = dataset;
	
	if tablename==Engine.CURRENT_DATA then
		if Recount.InCombat then
			tablename =  Engine.CURRENT_DATA;
		else
			tablename =  Engine.LAST_DATA;
		end
	end	
	
	--default values
	local data, fullname, totalsum, totalpersec, cursum, curpersec = nil, "", 0, 0, 0, 0;
	local temptable = {};
	local sumtable = {};
	
	--get trought all the partincipans
	for _,data in pairs(Recount.db2.combatants) do
		if data.Fights and data.Fights[tablename] and (data.type=="Self" or data.type=="Grouped" or data.type=="Pet" or data.type=="Ungrouped") then
			
			--merge the pets
			if mode == Engine.TYPE_DPS then
				cursum,curpersec = Recount:MergedPetDamageDPS(data,tablename);
			elseif mode == Engine.TYPE_HEAL then
				cursum,curpersec = Recount:MergedPetHealingDPS(data,tablename);
			end
			--only calculate non pets data
			if data.type ~= "Pet" or (not Recount.db.profile.MergePets and data.Owner and (Recount.db2.combatants[data.Owner].type=="Self" or 
				Recount.db2.combatants[data.Owner].type=="Grouped" or Recount.db2.combatants[data.Owner].type=="Ungrouped")) or 
				(not Recount.db.profile.MergePets and data.Name and data.GUID and mod:matchUnitGUID(Recount,data.Name, data.GUID)) then
				
				--if we have data
				if cursum > 0 then
				
					--caculate persec and values
					totalsum = totalsum + cursum;
					curpersec = math.floor(curpersec + 0.5);
					totalpersec = totalpersec + curpersec;
					
					--get the name
					fullname = data.Name or _G["UNKNOWN"];
					if data.type == "Pet" then fullname = data.Name.." <"..data.Owner..">" end;
					
					--set the data in the temp table
					if mode == Engine.TYPE_DPS then
						temptable = {name = fullname, damage = cursum, dps = curpersec, enclass = data.enClass};
					elseif mode == Engine.TYPE_HEAL then
						temptable = {name = fullname, healing = cursum, hps = curpersec, enclass = data.enClass};
					end
					
					--insert the player
					tinsert(sumtable, temptable);
				end
			end
		end
	end
	
	--return the valuesz
	return sumtable, totalsum, totalpersec;
end

--get the segment name from recount
function mod.GetSegmentName()


	--get recount
	local Recount = _G.Recount;
	
	if (Recount.FightingWho and Recount.InCombat) then
		return Recount.FightingWho;
	else
		if (Recount.db2.FoughtWho[1]) then
		
			if (string.gmatch(Recount.db2.FoughtWho[1],"(%w):(%w):(%w) (%w):(%w):(%w)")) then
				return string.sub(Recount.db2.FoughtWho[1],1,string.len(Recount.db2.FoughtWho[1])-17);
			else 
				return Recount.db2.FoughtWho[1];
			end;
		else
			return "";
		end	
	end	
	

end

--initialize module
function mod:OnInitialize()

	--store the generic meter
	mod.meter = Engine.AddOn:GetModule("meter");			
	
	--register our damage meter module
	mod.meter:RegisterMeter("Recount",mod.GetSumtable,mod.GetSegmentName,mod.Toggle);

end