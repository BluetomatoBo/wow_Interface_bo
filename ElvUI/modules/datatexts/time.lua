local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')

local format = string.format
local join = string.join
local floor = math.floor
local wipe = table.wipe

local APM = { TIMEMANAGER_PM, TIMEMANAGER_AM }
local europeDisplayFormat = '';
local ukDisplayFormat = '';
local europeDisplayFormat_nocolor = join("", "%02d", ":|r%02d")
local ukDisplayFormat_nocolor = join("", "", "%d", ":|r%02d", " %s|r")
local timerLongFormat = "%d:%02d:%02d"
local timerShortFormat = "%d:%02d"
local lockoutInfoFormat = "%s%s |cffaaaaaa(%s, %s/%s)"
local lockoutInfoFormatNoEnc = "%s%s |cffaaaaaa(%s)"
local formatBattleGroundInfo = "%s: "
local lockoutColorExtended, lockoutColorNormal = { r=0.3,g=1,b=0.3 }, { r=.8,g=.8,b=.8 }
local lockoutFormatString = { "%dd %02dh %02dm", "%dd %dh %02dm", "%02dh %02dm", "%dh %02dm", "%dh %02dm", "%dm" }
local curHr, curMin, curAmPm
local enteredFrame = false;

local Update, lastPanel; -- UpValue
local localizedName, isActive, canQueue, startTime, canEnter
local name, reset, locked, extended, isRaid, maxPlayers, difficulty, numEncounters, encounterProgress
local quests = {}
local updateQuestTable = false

local function ValueColorUpdate(hex, r, g, b)
	europeDisplayFormat = join("", "%02d", hex, ":|r%02d")
	ukDisplayFormat = join("", "", "%d", hex, ":|r%02d", hex, " %s|r")
	
	if lastPanel ~= nil then
		Update(lastPanel, 20000)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

local function ConvertTime(h, m)
	local AmPm
	if E.db.datatexts.time24 == true then
		return h, m, -1
	else
		if h >= 12 then
			if h > 12 then h = h - 12 end
			AmPm = 1
		else
			if h == 0 then h = 12 end
			AmPm = 2
		end
	end
	return h, m, AmPm
end

local function CalculateTimeValues(tooltip)
	if (tooltip and E.db.datatexts.localtime) or (not tooltip and not E.db.datatexts.localtime) then
		return ConvertTime(GetGameTime())
	else
		local	dateTable =	date("*t")
		return ConvertTime(dateTable["hour"], dateTable["min"])
	end
end

local function CalculateTimeLeft(time)
	local hour = floor(time / 3600)
	local min = floor(time / 60 - (hour*60))
	local sec = time - (hour * 3600) - (min * 60)
	
	return hour, min, sec
end

local function formatResetTime(sec)
	local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
	if not type(d) == 'number' or not type(h)== 'number' or not type(m) == 'number' or not type(s) == 'number' then
		return 'N/A'
	end
	
	if d > 0 and lockoutFormatString[h>10 and 1 or 2] then 
		return format(lockoutFormatString[h>10 and 1 or 2], d, h, m)
	end
	if h > 0 and lockoutFormatString[h>10 and 3 or 4] then
		return format(lockoutFormatString[h>10 and 3 or 4], h, m)
	end
	if m > 0 and lockoutFormatString[m>10 and 5 or 6] then 
		return format(lockoutFormatString[m>10 and 5 or 6], m) 
	end
end

local function OnEvent(self, event)
	if event == "QUEST_COMPLETE" then
		updateQuestTable = true
	elseif (event == "QUEST_LOG_UPDATE" and updateQuestTable) or event == "ELVUI_FORCE_RUN" then
		wipe(quests)
		quests = GetQuestsCompleted()
		updateQuestTable = false
	end
end

local function Click()
	GameTimeFrame:Click();
end

local function OnLeave(self)
	DT.tooltip:Hide();
	enteredFrame = false;
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	enteredFrame = true;
	
	DT.tooltip:AddLine(VOICE_CHAT_BATTLEGROUND);
	for i = 1, GetNumWorldPVPAreas() do
		_, localizedName, isActive, canQueue, startTime, canEnter = GetWorldPVPAreaInfo(i)
		if canEnter then
			if isActive then
				startTime = WINTERGRASP_IN_PROGRESS
			elseif startTime == nil then
				startTime = QUEUE_TIME_UNAVAILABLE
			else
				local h, m, s = CalculateTimeLeft(startTime)
				if h > 0 then 
					startTime = format(timerLongFormat, h, m, s) 
				else 
					startTime = format(timerShortFormat, m, s)
				end
			end
			DT.tooltip:AddDoubleLine(format(formatBattleGroundInfo, localizedName), startTime, 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)	
		end
	end	

	local oneraid, lockoutColor
	for i = 1, GetNumSavedInstances() do
		name, _, reset, _, locked, extended, _, isRaid, maxPlayers, difficulty, numEncounters, encounterProgress  = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) and name then
			local tr,tg,tb,diff
			if not oneraid then
				DT.tooltip:AddLine(" ")
				DT.tooltip:AddLine(L["Saved Raid(s)"])
				oneraid = true
			end
			if extended then lockoutColor = lockoutColorExtended else lockoutColor = lockoutColorNormal end
			
			if (numEncounters and numEncounters > 0) and (encounterProgress and encounterProgress > 0) then
				DT.tooltip:AddDoubleLine(format(lockoutInfoFormat, maxPlayers, (difficulty:match("Heroic") and "H" or "N"), name, encounterProgress, numEncounters), formatResetTime(reset), 1,1,1, lockoutColor.r,lockoutColor.g,lockoutColor.b)
			else
				DT.tooltip:AddDoubleLine(format(lockoutInfoFormatNoEnc, maxPlayers, (difficulty:match("Heroic") and "H" or "N"), name), formatResetTime(reset), 1,1,1, lockoutColor.r,lockoutColor.g,lockoutColor.b)
			end			
		end
	end	
	
	DT.tooltip:AddLine(" ")
	DT.tooltip:AddLine(L["World Boss(s)"])	
	DT.tooltip:AddDoubleLine(L['Sha of Anger']..':', quests[32099] and L['Defeated'] or L['Undefeated'], 1, 1, 1, 0.8, 0.8, 0.8)
	DT.tooltip:AddDoubleLine(L['Galleon']..':', quests[32098] and L['Defeated'] or L['Undefeated'], 1, 1, 1, 0.8, 0.8, 0.8)
	DT.tooltip:AddDoubleLine(L['Oondasta']..':', quests[32519] and L['Defeated'] or L['Undefeated'], 1, 1, 1, 0.8, 0.8, 0.8)
	DT.tooltip:AddDoubleLine(L['Nalak']..':', quests[32518] and L['Defeated'] or L['Undefeated'], 1, 1, 1, 0.8, 0.8, 0.8)

	local timeText
	local Hr, Min, AmPm = CalculateTimeValues(true)

	DT.tooltip:AddLine(" ")
	if AmPm == -1 then
		DT.tooltip:AddDoubleLine(E.db.datatexts.localtime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME, 
			format(europeDisplayFormat_nocolor, Hr, Min), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	else
		DT.tooltip:AddDoubleLine(E.db.datatexts.localtime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME,
			format(ukDisplayFormat_nocolor, Hr, Min, APM[AmPm]), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	end	
	
	DT.tooltip:Show()
end

local int = 3
function Update(self, t)
	int = int - t
	
	if enteredFrame then
		OnEnter(self)
	end
	
	--[[if GameTimeFrame.flashInvite then
		E:Flash(self, 0.53)
	else
		E:StopFlash(self)
	end]]
	
	if int > 0 then return end
	
	local Hr, Min, AmPm = CalculateTimeValues(false)

	-- no update quick exit
	if (Hr == curHr and Min == curMin and AmPm == curAmPm) and not (int < -15000) then
		int = 5
		return
	end
	
	curHr = Hr
	curMin = Min
	curAmPm = AmPm
		
	if AmPm == -1 then
		self.text:SetFormattedText(europeDisplayFormat, Hr, Min)
	else
		self.text:SetFormattedText(ukDisplayFormat, Hr, Min, APM[AmPm])
	end
	lastPanel = self
	int = 5
end

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext('Time', { "QUEST_COMPLETE", "QUEST_LOG_UPDATE" }, OnEvent, Update, Click, OnEnter, OnLeave)