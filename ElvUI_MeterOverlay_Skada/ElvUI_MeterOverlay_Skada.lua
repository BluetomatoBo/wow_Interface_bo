if not IsAddOnLoaded( "ElvUI" )  then return end
if not IsAddOnLoaded( "Skada" )  then return end
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

local Skada = _G.Skada		

function skadaToggle()
	Skada:ToggleWindow()
end
		
function skadaGetSumtable(tablename, mode)

	local totalsum=0
	local totalpersec=0
	
	local sumtable = {}
		
	if(tablename==CURRENT_DATA) then
		report_set = Skada.current
	elseif(tablename==LAST_DATA) then
		report_set = Skada.last
	elseif(tablename==OVERALL_DATA) then
		report_set = Skada.total
	else
		report_set = nil
	end
			
	if(report_set) then		
					
		-- For each item in dataset
		local nr = 1
		local templable = {}
		
		for i, player in ipairs(report_set.players) do
			if player.id then			
			
				templable = {}
				
				templable = {enclass=player.class,name=player.name,damage=player.damage,healing=player.healing,dps=0,hps=0}						
				
				--templable.healing = templable.healing+player.totalabsorbs					
				
				local totaltime = Skada:PlayerActiveTime(report_set, player)
				
				if (mode==TYPE_DPS) then
					if (templable.damage>0) then
						templable.dps = templable.damage / math.max(1,totaltime)												
						totalsum = totalsum + templable.damage
						totalpersec = totalpersec + templable.dps	
						table.insert(sumtable,templable)
					end
				else
					if (templable.healing>0) then
						templable.hps = templable.healing / math.max(1,totaltime)
					
						totalsum = totalsum + templable.healing
						totalpersec = totalpersec + templable.hps			
						table.insert(sumtable,templable)
					end
				end																												
			end
		end		
		if (mode==TYPE_DPS) then
			table.sort(sumtable, function(a,b) return a.damage > b.damage end)
		else
			table.sort(sumtable, function(a,b) return a.healing > b.healing end)
		end
	end						
	
	return sumtable, totalsum, totalpersec
end		

function skadaGetSegmentName(tablename)

	if(tablename==CURRENT_DATA) then
		report_set = Skada.current
	elseif(tablename==LAST_DATA) then
		report_set = Skada.last
	elseif(tablename==OVERALL_DATA) then
		report_set = nil -- not name for overall
	else
		report_set = nil
	end
			
	if(report_set) then	

		if (report_set.mobname) then
			return report_set.mobname
		else
			if (report_set.name) then
				return report_set.name			
			else
				return ConvertDataSet[tablename]			
			end
		end
	else
		return ConvertDataSet[tablename]			
	end		
end

EMO.desc = "Skada Overlay"
EMO.toggle = skadaToggle
EMO.getSumtable = skadaGetSumtable
EMO.getSegmentName = skadaGetSegmentName