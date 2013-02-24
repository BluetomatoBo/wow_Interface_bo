if not IsAddOnLoaded( "ElvUI" )  then return end
if not IsAddOnLoaded( "TinyDPS" )  then return end
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

local tdpsDamageData = 'd'
local tdpsHealdata = 'h'

function TinyDPSToggle()

	if _G.tdpsFrame:IsVisible() then
		_G.tdpsFrame:Hide()
	else
		_G.tdpsFrame:Show()
		_G.tdpsRefresh()
	end
	
end
		
function TinyDPSGetSumtable(tablename, mode)

	local totalsum=0
	local totalpersec=0
	
	local sumtable = {}
		
	if(tablename==CURRENT_DATA) then
		report_set = 2
	elseif(tablename==LAST_DATA) then
		report_set = 2
	elseif(tablename==OVERALL_DATA) then
		report_set = 1
	else
		report_set = nil
	end

	if not tdpsFight[report_set] then
		report_set = nil
	end 	
	local data = nil
	
	if (mode==TYPE_DPS) then
		data = tdpsDamageData
	else
		data = tdpsHealdata
	end
	
	if(report_set) then		
					
		-- For each item in dataset
		local nr = 1
		
		for k, v in pairs(_G.tdpsPlayer) do
			
			local templable = {
				name = strsplit("-", _G.tdpsPlayer[k].name),
				n = _G.tdpsPlayer[k].fight[report_set][data],
				t = _G.tdpsPlayer[k].fight[report_set].t,
				enclass = _G.tdpsPlayer[k].class,
			}
			local pet = _G.tdpsPlayer[k].pet
			for i = 1, #pet do
				-- add pet number
				templable.n = templable.n + _G.tdpsPet[pet[i]].fight[report_set][data]
				-- check time
				if _G.tdpsPet[pet[i]].fight[report_set].t > templable.t then
					templable.t = _G.tdpsPet[pet[i]].fight[report_set].t
				end
			end
			
			if (mode==TYPE_DPS) then
				templable.damage = templable.n
				templable.dps = templable.damage / math.max(1,templable.t )	
				totalsum = totalsum + templable.damage
				totalpersec = totalpersec + templable.dps					
			else
				templable.healing = templable.n
				templable.hps = templable.healing / math.max(1,templable.t )
				totalsum = totalsum + templable.healing
				totalpersec = totalpersec + templable.hps					
			end

			if(templable.n>0) then
				table.insert(sumtable,templable)
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

function TinyDPSGetSegmentName(tablename)

	if(tablename==CURRENT_DATA) then
		report_set = 2
	elseif(tablename==LAST_DATA) then
		report_set = 2
	elseif(tablename==OVERALL_DATA) then
		report_set = 1
	else
		report_set = nil
	end
	
	if not tdpsFight[report_set] then
		report_set = nil
	end 
	
	if(report_set) then
		if ( tdpsFight[report_set].name ) then
			return tdpsFight[report_set].name 
		else
			return ConvertDataSet[tablename]
		end
	else
		return ConvertDataSet[tablename]
	end
		
end

EMO.desc = "TinyDPS Overlay"
EMO.toggle = TinyDPSToggle
EMO.getSumtable = TinyDPSGetSumtable
EMO.getSegmentName = TinyDPSGetSegmentName