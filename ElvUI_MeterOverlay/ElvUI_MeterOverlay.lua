if not IsAddOnLoaded( "ElvUI" )  then return end

local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')

local CURRENT_SEGMENT 	= "Current"
local OVERALL_SEGMENT 	= "Overall"

local CURRENT_SEGMENT_TXT 	= "Current/Last Fight"
local OVERALL_SEGMENT_TXT 	= "Overall Data"

local CURRENT_DATA 		= "CurrentFightData"
local LAST_DATA 		= "LastFightData"
local OVERALL_DATA 		= "OverallData"

local TYPE_DPS			= "TYPE_DPS"
local TYPE_HEAL			= "TYPE_HEAL"
local TYPE_BOTH			= "TYPE_BOTH"

local TYPE_DPS_TXT		= "DPS"
local TYPE_HEAL_TXT		= "Heal"
local TYPE_BOTH_TXT		= "DPS & Heal"

local FORMAT_OWN_DPS			= "FORMAT_OWN_DPS"
local FORMAT_OWN_HPS			= "FORMAT_OWN_HPS"
local FORMAT_RAID_DPS			= "FORMAT_RAID_DPS"
local FORMAT_RAID_HPS			= "FORMAT_RAID_HPS"
local FORMAT_OWN_DPS_OWN_HPS	= "FORMAT_OWN_DPS_OWN_HPS"
local FORMAT_RAID_DPS_OWN_DPS	= "FORMAT_RAID_DPS_OWN_DPS"
local FORMAT_RAID_HPS_OWN_HPS	= "FORMAT_RAID_HPS_OWN_HPS"
local FORMAT_RAID_HPS_OWN_DPS	= "FORMAT_RAID_HPS_OWN_DPS"
local FORMAT_RAID_DPS_OWN_HPS	= "FORMAT_RAID_DPS_OWN_HPS"

local FORMAT_OWN_DPS_TXT			= "Own DPS"
local FORMAT_OWN_HPS_TXT			= "Own HPS"
local FORMAT_RAID_DPS_TXT			= "Raid DPS"
local FORMAT_RAID_HPS_TXT			= "Raid HPS"
local FORMAT_OWN_DPS_OWN_HPS_TXT	= "Own DPS / Own HPS"
local FORMAT_RAID_DPS_OWN_DPS_TXT	= "Raid DPS / Own DPS"
local FORMAT_RAID_HPS_OWN_HPS_TXT	= "Raid HPS / Own HPS"
local FORMAT_RAID_HPS_OWN_DPS_TXT	= "Raid HPS / Own DPS"
local FORMAT_RAID_DPS_OWN_HPS_TXT	= "Raid DPS / Own HPS"

local DISPLAY_LABELS_TXT = "Display labels"

EMO = {
	desc = 'Damage Meter Overlay',
	config = {
		lines = 10,
		segment = CURRENT_SEGMENT,
		type= TYPE_DPS,
		format = FORMAT_OWN_DPS,
		labels = true,
		interval = 1,
	},
	init = false
}

_G.EMO = EMO

local lastPanel
local displayString = ''

local function OnEvent(self, event, ...)

	if event == nil then
		return	
	end
	
	if event == "ACTIVE_TALENT_GROUP_CHANGED" then
		EMO.init = false
	end	
	
	if not EMO.init then
		local active = GetActiveSpecGroup()
		if GetSpecialization(false, false, active) then	
			spec = select(2, GetSpecializationInfo(GetSpecialization(false, false, active)))
		else
			spec = "default"
		end

		if E.db.MeterOverlay==nil then
			E.db.MeterOverlay = {}
		end		

		local specdb = E.db.MeterOverlay[spec] 

		if specdb == nil then					
			E.db.MeterOverlay[spec] = {
				lines = 10,
				segment = CURRENT_SEGMENT,
				type = TYPE_DPS,
				format = FORMAT_OWN_DPS,
				labels = true,
				interval = 1,
			}
			specdb = E.db.MeterOverlay[spec]
		end								

		EMO.config = specdb
		
		if (EMO.config.interval == nil) then
			EMO.config.interval = 1
		end
		EMO.init = true		
	end
end



function getRaidValuePerSecond(tablename, mode)		
	local persec,StatsTable,totalsum,totalpersec=0,nil,0,0
	
	StatsTable,totalsum,totalpersec = EMO.getSumtable(tablename, mode)
	
	local numofcombatants = #StatsTable
	
	for i = 1, numofcombatants do
		if StatsTable[i].name == E.myname then
			if mode == TYPE_DPS then
				persec = StatsTable[i].dps
			else
				persec = StatsTable[i].hps
			end
			break
		end
	end

	return totalpersec,persec
end

local DTRMenu = CreateFrame("Frame", "DTRMenu", E.UIParent, "UIDropDownMenuTemplate")

local lastSegment=0

local function OnUpdate(self, t)

	local rdps = 0
	local mydps = 0
	local rhps = 0
	local myhps = 0	
	
	lastPanel = self

	local now = time()

	if now - lastSegment > EMO.config.interval then

		local dataset = OVERALL_DATA

		if EMO.config.segment==CURRENT_SEGMENT then
			if InCombatLockdown() then
				dataset=CURRENT_DATA
			else
				dataset=LAST_DATA
			end
		end		
						
		if (EMO.config.format == FORMAT_OWN_DPS ) then
		
			rdps,mydps = getRaidValuePerSecond(dataset, TYPE_DPS)
			if EMO.config.labels then
				self.text:SetFormattedText(displayString, "DPS: ", mydps/1000)
			else
				self.text:SetFormattedText(displayString, "", mydps/1000)
			end
			
		elseif (EMO.config.format == FORMAT_OWN_HPS ) then
		
			rhps,myhps = getRaidValuePerSecond(dataset, TYPE_HEAL)
			if EMO.config.labels then
				self.text:SetFormattedText(displayString, "HPS: ", myhps/1000)
			else
				self.text:SetFormattedText(displayString, "", myhps/1000)
			end
			
		elseif (EMO.config.format == FORMAT_RAID_DPS ) then
		
			rdps,mydps = getRaidValuePerSecond(dataset, TYPE_DPS)
			if EMO.config.labels then
				self.text:SetFormattedText(displayString, "RDPS: ", rdps/1000)
			else
				self.text:SetFormattedText(displayString, "", rdps/1000)
			end
			
		elseif (EMO.config.format == FORMAT_RAID_HPS ) then
		
			rhps,myhps = getRaidValuePerSecond(dataset, TYPE_HEAL)
			
			if EMO.config.labels then
				self.text:SetFormattedText(displayString, "RHPS: ", rhps/1000)
			else
				self.text:SetFormattedText(displayString, "", rhps/1000)
			end
			
		elseif (EMO.config.format == FORMAT_OWN_DPS_OWN_HPS ) then
		
			rdps,mydps = getRaidValuePerSecond(dataset, TYPE_DPS)
			rhps,myhps = getRaidValuePerSecond(dataset, TYPE_HEAL)
			
			if EMO.config.labels then
				self.text:SetText(string.join(displayString:format("DPS: ",mydps/1000)," ",displayString:format(" HPS: ",myhps/1000)))			
			else
				self.text:SetText(string.join(displayString:format("",mydps/1000)," ",displayString:format("-",myhps/1000)))			
			end
			
		elseif (EMO.config.format == FORMAT_RAID_DPS_OWN_DPS ) then
		
			rdps,mydps = getRaidValuePerSecond(dataset, TYPE_DPS)
		
			if EMO.config.labels then
				self.text:SetText(string.join(displayString:format("RDPS: ",rdps/1000)," ",displayString:format(" DPS: ",mydps/1000)))			
			else
				self.text:SetText(string.join(displayString:format("",rdps/1000)," ",displayString:format("-",mydps/1000)))			
			end
			
		elseif (EMO.config.format == FORMAT_RAID_HPS_OWN_HPS ) then
		
			rhps,myhps = getRaidValuePerSecond(dataset, TYPE_HEAL)
			
			if EMO.config.labels then
				self.text:SetText(string.join(displayString:format("RHPS: ",rhps/1000)," ",displayString:format(" HPS: ",myhps/1000)))			
			else
				self.text:SetText(string.join(displayString:format("",rhps/1000)," ",displayString:format("-",myhps/1000)))			
			end
			
		elseif (EMO.config.format == FORMAT_RAID_HPS_OWN_DPS ) then
		
			rdps,mydps = getRaidValuePerSecond(dataset, TYPE_DPS)
			rhps,myhps = getRaidValuePerSecond(dataset, TYPE_HEAL)					
			
			if EMO.config.labels then
				self.text:SetText(string.join(displayString:format("RHPS: ",rhps/1000)," ",displayString:format(" DPS: ",mydps/1000)))			
			else
				self.text:SetText(string.join(displayString:format("",rhps/1000)," ",displayString:format("-",mydps/1000)))			
			end		
			
		elseif (EMO.config.format == FORMAT_RAID_DPS_OWN_HPS ) then
		
			rdps,mydps = getRaidValuePerSecond(dataset, TYPE_DPS)
			rhps,myhps = getRaidValuePerSecond(dataset, TYPE_HEAL)					
			
			if EMO.config.labels then
				self.text:SetText(string.join(displayString:format("RDPS: ",rdps/1000)," ",displayString:format(" HPS: ",myhps/1000)))			
			else
				self.text:SetText(string.join(displayString:format("",rdps/1000)," ",displayString:format("-",myhps/1000)))			
			end	
			
		end
		
		lastSegment = now
	end

end


local function ValueColorUpdate(hex, r, g, b)
	displayString = string.join("", "%s", hex, "%.1fK|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end

E['valueColorUpdateFuncs'][ValueColorUpdate] = true;

local tthead = {r=0.4,g=0.78,b=1}
local theal = {r=0,g=1,b=0}
local tdamage = {r=1,g=0,b=0}
local notgroup = {r = 0.35686274509804, g = 0.56470588235294, b = 0.031372549019608}
local colortable = {}
for class, color in pairs(_G["RAID_CLASS_COLORS"]) do
 colortable[class] = { r = color.r, g = color.g, b = color.b }
end

colortable["PET"] = {r = 0.09, g = 0.61, b = 0.55}
colortable["UNKNOWN"] = {r = 0.49803921568627, g = 0.49803921568627, b = 0.49803921568627}
colortable["MOB"] = {r = 0.58, g = 0.24, b = 0.63}
colortable["UNGROUPED"] = {r = 0.63, g = 0.58, b = 0.24}
colortable["HOSTILE"] = {r = 0.7, g = 0.1, b = 0.1}

-- Formats a number into human readable form.
function FormatNumber(number)
	if number then

		if number > 1000000 then
			return 	("%02.2fM"):format(number / 1000000)
		else
			if number > 10000 then
				return 	("%02.1fK"):format(number / 1000)
			else
				return math.floor(number)
			end
		end
	else
		return 0
	end
end

function DisplayTable(mode,repotType,amount)

	StatsTable,totalsum, totalpersec = EMO.getSumtable(mode, repotType)


	name = EMO.getSegmentName(mode)		
	
	if repotType == TYPE_DPS then
		DT.tooltip:AddDoubleLine("Damage Done",name,tdamage.r,tdamage.g,tdamage.b,tthead.r,tthead.g,tthead.b)
	elseif repotType == TYPE_HEAL then
		DT.tooltip:AddDoubleLine("Healing Done",name,theal.r,theal.g,theal.b,tthead.r,tthead.g,tthead.b)
	end

	local numofcombatants = #StatsTable

	if numofcombatants == 0 then
		DT.tooltip:AddLine("No data to display")
	else
		if numofcombatants > amount then
			numofcombatants = amount
		end

		local value = FormatNumber(totalsum)
		local vps = FormatNumber(totalpersec)
		local percent = 100

		DT.tooltip:AddDoubleLine("Total",format("%s (%s) 100.0%%",value,vps))

		for i = 1, numofcombatants do

			if StatsTable[i].enclass then
				classc = colortable[StatsTable[i].enclass]
			else
				classc = notgroup
			end

			if repotType == TYPE_DPS then
				value = FormatNumber(StatsTable[i].damage)
				vps = FormatNumber(StatsTable[i].dps)
				percent = math.floor(1000*StatsTable[i].damage/totalsum)/10
			else
				value = FormatNumber(StatsTable[i].healing)
				vps = FormatNumber(StatsTable[i].hps)
				percent = math.floor(1000*StatsTable[i].healing/totalsum)/10
			end

			DT.tooltip:AddDoubleLine(StatsTable[i].name,format("%s (%s) %.1f%%",value,vps,percent),classc.r,classc.g,classc.b,classc.r,classc.g,classc.b)

		end
	end
end





local function changeType (self,arg1)

	EMO.config.type = arg1

	CloseDropDownMenus()

	lastSegment=0
end

local function changeMode (self,arg1)

	EMO.config.segment = arg1

	CloseDropDownMenus()

	lastSegment=0
end

local function changeFormat (self,arg1)

	EMO.config.format = arg1

	CloseDropDownMenus()

	lastSegment=0
end

local function changeAmount (self,arg1)

	EMO.config.lines = arg1

	CloseDropDownMenus()

end

local function changeLabels (self,arg1)

	EMO.config.labels = arg1

	CloseDropDownMenus()

	lastSegment=0
	
end

local function changeInterval (self,arg1)

	EMO.config.interval = arg1

	CloseDropDownMenus()

	lastSegment=0
end

menuList = {
	{ text = "Meter Overlay", isTitle = true, notCheckable=true},
	{ text = "Data Segment", hasArrow = true, notCheckable=true,
		menuList = {}
	},
	{ text = "Overlay Type", hasArrow = true, notCheckable=true,
		menuList = {}
	},
	{ text = "Overlay Lines", hasArrow = true, notCheckable=true,
		menuList = {}
	},	
	{ text = "Datatext Format", hasArrow = true, notCheckable=true,
		menuList = {}
	},	
	{ text = "Datatext Update Frequency", hasArrow = true, notCheckable=true,
		menuList = {}
	}
}

local function CreateMenu(self)

	if(EMO.config.segment==CURRENT_SEGMENT) then

		menuList[2].menuList = {
				{ notCheckable=false,text = CURRENT_SEGMENT_TXT,checked=true,func = changeMode, arg1=CURRENT_SEGMENT},
				{ notCheckable=false,text = OVERALL_SEGMENT_TXT,func = changeMode, arg1=OVERALL_SEGMENT},
			}
	else
		menuList[2].menuList = {
				{ notCheckable=false,text = CURRENT_SEGMENT_TXT,func = changeMode, arg1=CURRENT_SEGMENT},
				{ notCheckable=false,text = OVERALL_SEGMENT_TXT,checked=true,func = changeMode, arg1=OVERALL_SEGMENT},
			}

	end

	if(EMO.config.type==TYPE_DPS) then
		menuList[3].menuList = {
				{ notCheckable=false,text = TYPE_DPS_TXT,checked=true,func = changeType, arg1=TYPE_DPS},
				{ notCheckable=false,text = TYPE_HEAL_TXT,func = changeType, arg1=TYPE_HEAL},
				{ notCheckable=false,text = TYPE_BOTH_TXT,func = changeType, arg1=TYPE_BOTH},
			}
	elseif (EMO.config.type==TYPE_HEAL) then
		menuList[3].menuList = {
				{ notCheckable=false,text = TYPE_DPS_TXT,func = changeType, arg1=TYPE_DPS},
				{ notCheckable=false,text = TYPE_HEAL_TXT,checked=true,func = changeType, arg1=TYPE_HEAL},
				{ notCheckable=false,text = TYPE_BOTH_TXT,func = changeType, arg1=TYPE_BOTH},
			}
	else
		menuList[3].menuList = {
				{ notCheckable=false,text = TYPE_DPS_TXT,func = changeType, arg1=TYPE_DPS},
				{ notCheckable=false,text = TYPE_HEAL_TXT,func = changeType, arg1=TYPE_HEAL},
				{ notCheckable=false,text = TYPE_BOTH_TXT,checked=true,func = changeType, arg1=TYPE_BOTH},
			}
	end

	if(EMO.config.lines==5) then
		menuList[4].menuList = {
				{ notCheckable=false,text = "5",checked=true,func = changeAmount, arg1=5},
				{ notCheckable=false,text = "10",func = changeAmount, arg1=10},
				{ notCheckable=false,text = "15",func = changeAmount, arg1=15},
				{ notCheckable=false,text = "20",func = changeAmount, arg1=20},
				{ notCheckable=false,text = "25",func = changeAmount, arg1=25},
			}
	elseif (EMO.config.lines==10) then
		menuList[4].menuList = {
				{ notCheckable=false,text = "5",func = changeAmount, arg1=5},
				{ notCheckable=false,text = "10",checked=true,func = changeAmount, arg1=10},
				{ notCheckable=false,text = "15",func = changeAmount, arg1=15},
				{ notCheckable=false,text = "20",func = changeAmount, arg1=20},
				{ notCheckable=false,text = "25",func = changeAmount, arg1=25},
			}
	elseif (EMO.config.lines==15) then
		menuList[4].menuList = {
				{ notCheckable=false,text = "5",func = changeAmount, arg1=5},
				{ notCheckable=false,text = "10",func = changeAmount, arg1=10},
				{ notCheckable=false,text = "15",checked=true,func = changeAmount, arg1=15},
				{ notCheckable=false,text = "20",func = changeAmount, arg1=20},
				{ notCheckable=false,text = "25",func = changeAmount, arg1=25},
			}
	elseif (EMO.config.lines==20) then
		menuList[4].menuList = {
				{ notCheckable=false,text = "5",func = changeAmount, arg1=5},
				{ notCheckable=false,text = "10",func = changeAmount, arg1=10},
				{ notCheckable=false,text = "15",func = changeAmount, arg1=15},
				{ notCheckable=false,text = "20",checked=true,func = changeAmount, arg1=20},
				{ notCheckable=false,text = "25",func = changeAmount, arg1=25},
			}
	else
		menuList[4].menuList = {
				{ notCheckable=false,text = "5",func = changeAmount, arg1=5},
				{ notCheckable=false,text = "10",func = changeAmount, arg1=10},
				{ notCheckable=false,text = "15",func = changeAmount, arg1=15},
				{ notCheckable=false,text = "20",func = changeAmount, arg1=20},
				{ notCheckable=false,text = "25",checked=true,func = changeAmount, arg1=25},
			}
	end	
	
	if(EMO.config.format==FORMAT_OWN_DPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},
			}
	elseif (EMO.config.format==FORMAT_OWN_HPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},		
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},				
			}
	elseif (EMO.config.format==FORMAT_RAID_DPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},				
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},				
			}			
	elseif (EMO.config.format==FORMAT_OWN_DPS_OWN_HPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},	
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},
			}
	elseif (EMO.config.format==FORMAT_RAID_DPS_OWN_DPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},	
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},				
			}
	elseif (EMO.config.format==FORMAT_RAID_HPS_OWN_HPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},
			}		
	elseif (EMO.config.format==FORMAT_RAID_HPS_OWN_DPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},
			}
	elseif (EMO.config.format==FORMAT_RAID_DPS_OWN_HPS) then
		menuList[5].menuList = {
				{ notCheckable=false,text = FORMAT_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS},
				{ notCheckable=false,text = FORMAT_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS},
				{ notCheckable=false,text = FORMAT_OWN_DPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_OWN_DPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_HPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_HPS},
				{ notCheckable=false,text = FORMAT_RAID_HPS_OWN_DPS_TXT,func = changeFormat, arg1=FORMAT_RAID_HPS_OWN_DPS},
				{ notCheckable=false,text = FORMAT_RAID_DPS_OWN_HPS_TXT,checked=true,func = changeFormat, arg1=FORMAT_RAID_DPS_OWN_HPS},
			}			
	end	
	
	if(EMO.config.labels==true) then
		menuList[5].menuList[10]={notCheckable=false,checked=true,isNotRadio=true,text = DISPLAY_LABELS_TXT,func = changeLabels, arg1=false}
	else
		menuList[5].menuList[10]={notCheckable=false,checked=false,isNotRadio=true,text = DISPLAY_LABELS_TXT,func = changeLabels, arg1=true}
	end
	
	if(EMO.config.interval==1) then
		menuList[6].menuList = {
				{ notCheckable=false,text = "1 sec",checked=true,func = changeInterval, arg1=1},
				{ notCheckable=false,text = "5 sec",func = changeInterval, arg1=5},
				{ notCheckable=false,text = "10 sec",func = changeInterval, arg1=10},
				{ notCheckable=false,text = "15 sec",func = changeInterval, arg1=15},
				{ notCheckable=false,text = "30 sec",func = changeInterval, arg1=30},
			}
	elseif (EMO.config.interval==2) then
		menuList[6].menuList = {
				{ notCheckable=false,text = "1 sec",func = changeInterval, arg1=1},
				{ notCheckable=false,text = "5 sec",checked=true,func = changeInterval, arg1=5},
				{ notCheckable=false,text = "10 sec",func = changeInterval, arg1=10},
				{ notCheckable=false,text = "15 sec",func = changeInterval, arg1=15},
				{ notCheckable=false,text = "30 sec",func = changeInterval, arg1=30},
			}
	elseif (EMO.config.interval==5) then
		menuList[6].menuList = {
				{ notCheckable=false,text = "1 sec",func = changeInterval, arg1=1},
				{ notCheckable=false,text = "5 sec",func = changeInterval, arg1=5},
				{ notCheckable=false,text = "10 sec",checked=true,func = changeInterval, arg1=10},
				{ notCheckable=false,text = "15 sec",func = changeInterval, arg1=15},
				{ notCheckable=false,text = "30 sec",func = changeInterval, arg1=30},
			}
	elseif (EMO.config.interval==10) then
		menuList[6].menuList = {
				{ notCheckable=false,text = "1 sec",func = changeInterval, arg1=1},
				{ notCheckable=false,text = "5 sec",func = changeInterval, arg1=5},
				{ notCheckable=false,text = "10 sec",func = changeInterval, arg1=10},
				{ notCheckable=false,text = "15 sec",checked=true,func = changeInterval, arg1=15},
				{ notCheckable=false,text = "30 sec",func = changeInterval, arg1=30},
			}
	else
		menuList[6].menuList = {
				{ notCheckable=false,text = "1 sec",func = changeInterval, arg1=1},
				{ notCheckable=false,text = "5 sec",func = changeInterval, arg1=5},
				{ notCheckable=false,text = "10 sec",func = changeInterval, arg1=10},
				{ notCheckable=false,text = "15 sec",func = changeInterval, arg1=15},
				{ notCheckable=false,text = "30 sec",checked=true,func = changeInterval, arg1=30},
			}
	end	
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	DT.tooltip:AddLine(EMO.desc,tthead.r,tthead.g,tthead.b)
	DT.tooltip:AddLine(" ")

	local dataset = OVERALL_DATA

	if EMO.config.segment==CURRENT_SEGMENT then
		if InCombatLockdown() then
			dataset=CURRENT_DATA
		else
			dataset=LAST_DATA
		end
	end

	if EMO.config.type==TYPE_BOTH then
		DisplayTable(dataset, TYPE_DPS,EMO.config.lines)

		DT.tooltip:AddLine(" ")

		DisplayTable(dataset, TYPE_HEAL,EMO.config.lines)		
	else
		DisplayTable(dataset, EMO.config.type,EMO.config.lines)

	end

	DT.tooltip:Show()
	DTRMenu:Hide()
end

function OnLeave(self)
	DT.tooltip:Hide();
	DTRMenu:Hide()
end
local function OnClick(self,btn)
	if btn == "RightButton" then
		DT.tooltip:Hide()
		CreateMenu()
		EasyMenu(menuList, DTRMenu, "cursor", 0, 0, "MENU",2)
	else
		EMO.toggle()
	end
end

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc)

	name - name of the datatext (required)
	events - must be a table with string values of event names to register
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
]]
DT:RegisterDatatext(EMO.desc, { "PLAYER_ENTERING_WORLD","ACTIVE_TALENT_GROUP_CHANGED" }, OnEvent, OnUpdate, OnClick,OnEnter,OnLeave)