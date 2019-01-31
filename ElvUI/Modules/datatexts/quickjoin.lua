local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

--Cache global variables
--Lua functions
local next, pairs, select, type = next, pairs, select, type
local format, strjoin, wipe = string.format, strjoin, wipe
--WoW API / Variables
local SocialQueueUtil_GetRelationshipInfo = SocialQueueUtil_GetRelationshipInfo
local SocialQueueUtil_GetQueueName = SocialQueueUtil_GetQueueName
local SocialQueueUtil_SortGroupMembers = SocialQueueUtil_SortGroupMembers
local ToggleQuickJoinPanel = ToggleQuickJoinPanel
local C_SocialQueue_GetAllGroups = C_SocialQueue.GetAllGroups
local C_SocialQueue_GetGroupMembers = C_SocialQueue.GetGroupMembers
local C_SocialQueue_GetGroupQueues = C_SocialQueue.GetGroupQueues
local C_LFGList_GetSearchResultInfo = C_LFGList.GetSearchResultInfo
local UNKNOWN, QUICK_JOIN = UNKNOWN, QUICK_JOIN

local displayModifierString, lastPanel = ''
local quickJoinGroups, quickJoin = nil, {}

local function OnEnter(self)
	DT:SetupTooltip(self)

	if not next(quickJoin) then return end

	DT.tooltip:AddLine(QUICK_JOIN, nil, nil, nil, true);
	DT.tooltip:AddLine(" ");
	for name, activity in pairs(quickJoin) do
		DT.tooltip:AddDoubleLine(name, activity, nil, nil, nil, 1, 1, 1);
	end

	DT.tooltip:Show()
end

local CHAT
local function OnEvent(self)
	wipe(quickJoin)
	quickJoinGroups = C_SocialQueue_GetAllGroups()

	if not CHAT then CHAT = E:GetModule("Chat") end --load order issue requires this to be here, could probably change load order to fix...
	local coloredName, players, members, playerName, nameColor, firstMember, numMembers, extraCount, isLFGList, firstQueue, queues, numQueues, activityName, leaderName, isLeader, activity, output, queueCount, queueName, searchResultInfo

	for _, guid in pairs(quickJoinGroups) do
		members = nil -- clear it
		players = C_SocialQueue_GetGroupMembers(guid)
		if players and next(players) then
			if type(players[1]) == 'table' and type(players[2]) == 'table' then
				members = SocialQueueUtil_SortGroupMembers(players)
			else
				members = players
			end
		end
		if members then
			firstMember, numMembers, extraCount = members[1], #members, ''
			playerName, nameColor = SocialQueueUtil_GetRelationshipInfo(firstMember.guid, nil, firstMember.clubId)
			if numMembers > 1 then
				extraCount = format('[+%s]', numMembers - 1)
			end
			if playerName then
				coloredName = format('%s%s|r%s', nameColor, playerName, extraCount)
			else
				coloredName = format('{%s%s}', UNKNOWN, extraCount)
			end

			queues = C_SocialQueue_GetGroupQueues(guid)
			firstQueue, numQueues = queues and queues[1], queues and #queues or 0
			isLFGList = firstQueue and firstQueue.queueData and firstQueue.queueData.queueType == 'lfglist'

			if isLFGList and firstQueue and firstQueue.eligible then
				if firstQueue.queueData.lfgListID then
					searchResultInfo = C_LFGList_GetSearchResultInfo(firstQueue.queueData.lfgListID)
					if searchResultInfo then
						activityName, leaderName = searchResultInfo.name, searchResultInfo.leaderName
						isLeader = CHAT:SocialQueueIsLeader(playerName, leaderName)
					end
				end

				if isLeader then
					coloredName = format("|TInterface\\GroupFrame\\UI-Group-LeaderIcon:16:16|t%s", coloredName)
				end

				activity = activityName or UNKNOWN
				if numQueues > 1 then
					activity = format("[+%s]%s", numQueues - 1, activity)
				end
			elseif firstQueue then
				output, queueCount = '', 0
				for _, queue in pairs(queues) do
					if type(queue) == 'table' and queue.eligible then
						queueName = (queue.queueData and SocialQueueUtil_GetQueueName(queue.queueData)) or ''
						if queueName ~= '' then
							if output == '' then
								output = queueName:gsub('\n.+','') -- grab only the first queue name
								queueCount = queueCount + select(2, queueName:gsub('\n','')) -- collect additional on single queue
							else
								queueCount = queueCount + 1 + select(2, queueName:gsub('\n','')) -- collect additional on additional queues
							end
						end
					end
				end
				if output ~= '' then
					if queueCount > 0 then
						activity = format("%s[+%s]", output, queueCount)
					else
						activity = output
					end
				end
			end

			quickJoin[coloredName] = activity
		end
	end

	self.text:SetFormattedText(displayModifierString, QUICK_JOIN, #quickJoinGroups)

	lastPanel = self
end

local function ValueColorUpdate(hex)
	displayModifierString = strjoin("", "%s: ", hex, "%s|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext('Quick Join', {"SOCIAL_QUEUE_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, ToggleQuickJoinPanel, OnEnter, nil, QUICK_JOIN)
