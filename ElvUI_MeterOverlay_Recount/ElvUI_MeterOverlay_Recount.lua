if not IsAddOnLoaded( "ElvUI" )  then return end
if not IsAddOnLoaded( "Recount" )  then return end
if not IsAddOnLoaded( "ElvUI_MeterOverlay" )  then return end

local TYPE_DPS			= "TYPE_DPS"
local TYPE_HEAL			= "TYPE_HEAL"

local CURRENT_DATA 		= "CurrentFightData"
local LAST_DATA 		= "LastFightData"
local OVERALL_DATA 		= "OverallData"

local ConvertDataSet={}
ConvertDataSet[OVERALL_DATA] = "Overall Data"
ConvertDataSet[CURRENT_DATA]= "Current Fight"
ConvertDataSet[LAST_DATA] = "Last Fight"

local EMO = _G.EMO	

local Recount = _G.Recount	

function recountToggle()

	if Recount.MainWindow:IsShown() then 
		Recount.MainWindow:Hide() 
	else 
		Recount.MainWindow:Show();Recount:RefreshMainWindow() 
	end
end

-- match pets such as elementals with no proper owner, using their unique GUID
function matchUnitGUID(unitname, guid)
	for _,data in pairs(Recount.db2.combatants) do
		if data.GuardianReverseGUIDs and data.GuardianReverseGUIDs[unitname] and data.GuardianReverseGUIDs[unitname].GUIDs then
			for k,v in pairs(data.GuardianReverseGUIDs[unitname].GUIDs) do
				if v == guid then return true end
			end
		end
	end
	return false
end		

function recountGetSumtable(tablename, mode)
	
	local data, fullname, totalsum, totalpersec, cursum, curpersec = nil, "", 0, 0, 0, 0
	local temptable = {}
	local sumtable = {}
	for _,data in pairs(Recount.db2.combatants) do
		if data.Fights and data.Fights[tablename] and (data.type=="Self" or data.type=="Grouped" or data.type=="Pet" or data.type=="Ungrouped") then
			if mode == TYPE_DPS then
				cursum,curpersec = Recount:MergedPetDamageDPS(data,tablename)
			elseif mode == TYPE_HEAL then
				cursum,curpersec = Recount:MergedPetHealingDPS(data,tablename)
			end
			if data.type ~= "Pet" or (not Recount.db.profile.MergePets and data.Owner and (Recount.db2.combatants[data.Owner].type=="Self" or Recount.db2.combatants[data.Owner].type=="Grouped" or Recount.db2.combatants[data.Owner].type=="Ungrouped")) or (not Recount.db.profile.MergePets and data.Name and data.GUID and self:matchUnitGUID(Recount,data.Name, data.GUID)) then
				if cursum > 0 then
					totalsum = totalsum + cursum
					curpersec = math.floor(curpersec + 0.5)
					totalpersec = totalpersec + curpersec
					fullname = data.Name or _G["UNKNOWN"]
					if data.type == "Pet" then fullname = data.Name.." <"..data.Owner..">" end
					if mode == TYPE_DPS then
						temptable = {name = fullname, damage = cursum, dps = curpersec, enclass = data.enClass}
					elseif mode == TYPE_HEAL then
						temptable = {name = fullname, healing = cursum, hps = curpersec, enclass = data.enClass}
					end
					tinsert(sumtable, temptable)
				end
			end
		end
	end
	if mode == TYPE_DPS then
		table.sort(sumtable, function(a,b) return a.damage > b.damage end)
	elseif mode == TYPE_HEAL then
		table.sort(sumtable, function(a,b) return a.healing > b.healing end)
	end
	return sumtable, totalsum, totalpersec
end	

function recountSegmentName(tablename)

	if tablename == LAST_DATA then
			if (Recount.FightingWho) then
				return Recount.FightingWho
			else
				if (Recount.db2.FoughtWho[1]) then
					return Recount.db2.FoughtWho[1]		
				else
					return ConvertDataSet[tablename]		
				end	
			end		
	else
		if tablename == CURRENT_DATA then		
			if (Recount.FightingWho) then
				return Recount.FightingWho
			else
				return ConvertDataSet[tablename]		
			end					
		else
			return ConvertDataSet[tablename]		
		end
	end
	
end

EMO.desc = "Recount Overlay"
EMO.toggle = recountToggle
EMO.getSumtable = recountGetSumtable
EMO.getSegmentName = recountSegmentName