﻿local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CH = E:NewModule('Chat', 'AceTimer-3.0', 'AceHook-3.0', 'AceEvent-3.0')
local LSM = LibStub("LibSharedMedia-3.0")
local CreatedFrames = 0;
local lines = {};
local msgList, msgCount, msgTime = {}, {}, {}
local good, maybe, filter, login = {}, {}, {}, false
local chatFilters = {};
local cvars = {
	["bnWhisperMode"] = true,
	["conversationMode"] = true,
	["whisperMode"] = true,
}

local len, gsub, find, sub, gmatch, format, random = string.len, string.gsub, string.find, string.sub, string.gmatch, string.format, math.random
local tinsert, tremove, tsort, twipe, tconcat = table.insert, table.remove, table.sort, table.wipe, table.concat

local TIMESTAMP_FORMAT
local DEFAULT_STRINGS = {
	GUILD = L['G'],
	PARTY = L['P'],
	RAID = L['R'],
	OFFICER = L['O'],
	PARTY_LEADER = L['PL'],
	RAID_LEADER = L['RL'],	
	INSTANCE_CHAT = L['I'],
	INSTANCE_CHAT_LEADER = L['IL'],
	PET_BATTLE_COMBAT_LOG = PET_BATTLE_COMBAT_LOG,
}

local hyperlinkTypes = {
	['item'] = true,
	['spell'] = true,
	['unit'] = true,
	['quest'] = true,
	['enchant'] = true,
	['achievement'] = true,
	['instancelock'] = true,
	['talent'] = true,
	['glyph'] = true,
}

local tabTexs = {
	'',
	'Selected',
	'Highlight'
}

local smileyPack = {
	["Angry"] = [[Interface\AddOns\ElvUI\media\textures\smileys\angry.blp]],
	["Grin"] = [[Interface\AddOns\ElvUI\media\textures\smileys\grin.blp]],
	["Hmm"] = [[Interface\AddOns\ElvUI\media\textures\smileys\hmm.blp]],
	["MiddleFinger"] = [[Interface\AddOns\ElvUI\media\textures\smileys\middle_finger.blp]],
	["Sad"] = [[Interface\AddOns\ElvUI\media\textures\smileys\sad.blp]],
	["Surprise"] = [[Interface\AddOns\ElvUI\media\textures\smileys\surprise.blp]],
	["Tongue"] = [[Interface\AddOns\ElvUI\media\textures\smileys\tongue.blp]],
	["Cry"] = [[Interface\AddOns\ElvUI\media\textures\smileys\weepy.blp]],
	["Wink"] = [[Interface\AddOns\ElvUI\media\textures\smileys\winky.blp]],
	["Happy"] = [[Interface\AddOns\ElvUI\media\textures\smileys\happy.blp]],
	["Heart"] = [[Interface\AddOns\ElvUI\media\textures\smileys\heart.blp]],
	['BrokenHeart'] = [[Interface\AddOns\ElvUI\media\textures\smileys\broken_heart.blp]],
}

local smileyKeys = {
	["%:%-%@"] = "Angry",
	["%:%@"] = "Angry",
	["%:%-%)"]="Happy",
	["%:%)"]="Happy",
	["%:D"]="Grin",
	["%:%-D"]="Grin",
	["%;%-D"]="Grin",
	["%;D"]="Grin",
	["%=D"]="Grin",
	["xD"]="Grin",
	["XD"]="Grin",
	["%:%-%("]="Sad",
	["%:%("]="Sad",
	["%:o"]="Surprise",
	["%:%-o"]="Surprise",
	["%:%-O"]="Surprise",
	["%:O"]="Surprise",
	["%:%-0"]="Surprise",
	["%:P"]="Tongue",
	["%:%-P"]="Tongue",
	["%:p"]="Tongue",
	["%:%-p"]="Tongue",
	["%=P"]="Tongue",
	["%=p"]="Tongue",
	["%;%-p"]="Tongue",
	["%;p"]="Tongue",
	["%;P"]="Tongue",
	["%;%-P"]="Tongue",
	["%;%-%)"]="Wink",
	["%;%)"]="Wink",
	["%:S"]="Hmm",
	["%:%-S"]="Hmm",
	["%:%,%("]="Cry",
	["%:%,%-%("]="Cry",
	["%:%'%("]="Cry",
	["%:%'%-%("]="Cry",
	["%:%F"]="MiddleFinger",
	["<3"]="Heart",
	["</3"]="BrokenHeart",
};

local specialChatIcons = {
	["Spirestone"] = {
		["Elvz"] = "|TInterface\\AddOns\\ElvUI\\media\\textures\\ElvUI_Chat_Logo:13:22|t"
	},
	["Illidan"] = {
		["Affinichi"] = "|TInterface\\AddOns\\ElvUI\\media\\textures\\Bathrobe_Chat_Logo.blp:15:15|t",
		["Uplift"] = "|TInterface\\AddOns\\ElvUI\\media\\textures\\Bathrobe_Chat_Logo.blp:15:15|t",
		["Affinitii"] = "|TInterface\\AddOns\\ElvUI\\media\\textures\\Bathrobe_Chat_Logo.blp:15:15|t",
		["Affinity"] = "|TInterface\\AddOns\\ElvUI\\media\\textures\\Bathrobe_Chat_Logo.blp:15:15|t"
	},
}

CH.Keywords = {};

local function ChatFrame_OnMouseScroll(frame, delta)
	if delta < 0 then
		if IsShiftKeyDown() then
			frame:ScrollToBottom()
		else
			for i = 1, 3 do
				frame:ScrollDown()
			end
		end
	elseif delta > 0 then
		if IsShiftKeyDown() then
			frame:ScrollToTop()
		else
			for i = 1, 3 do
				frame:ScrollUp()
			end
		end
		
		if CH.db.scrollDownInterval ~= 0 then
			if frame.ScrollTimer then
				CH:CancelTimer(frame.ScrollTimer, true)
			end

			frame.ScrollTimer = CH:ScheduleTimer('ScrollToBottom', CH.db.scrollDownInterval, frame)
		end		
	end
end

function CH:GetGroupDistribution()
	local inInstance, kind = IsInInstance()
	if inInstance and (kind == "pvp") then
		return "/bg "
	end
	if IsInRaid() then
		return "/ra "
	end
	if IsInGroup() then
		return "/p "
	end
	return "/s "
end

function CH:InsertEmotions(msg)
	for k,v in pairs(smileyKeys) do
		msg = gsub(msg,k,"|T"..smileyPack[v]..":16|t");
	end
	return msg;
end

function CH:GetSmileyReplacementText(msg)
	if not self.db.emotionIcons or msg:find('/run') or msg:find('/dump') or msg:find('/script') then return msg end
	local outstr = "";
	local origlen = len(msg);
	local startpos = 1;
	local endpos;
	
	while(startpos <= origlen) do
		endpos = origlen;
		local pos = find(msg,"|H",startpos,true);
		if(pos ~= nil) then
			endpos = pos;
		end
		outstr = outstr .. CH:InsertEmotions(sub(msg,startpos,endpos)); --run replacement on this bit
		startpos = endpos + 1;
		if(pos ~= nil) then
			endpos = find(msg,"|h]|r",startpos,-1) or find(msg,"|h",startpos,-1);
			endpos = endpos or origlen;
			if(startpos < endpos) then
				outstr = outstr .. sub(msg,startpos,endpos); --don't run replacement on this bit
				startpos = endpos + 1;
			end
		end
	end
	
	return outstr;
end


function CH:StyleChat(frame)
	local name = frame:GetName()
	_G[name.."TabText"]:FontTemplate(LSM:Fetch("font", self.db.tabFont), self.db.tabFontSize, self.db.tabFontOutline)
	
	if frame.styled then return end
	
	frame:SetFrameLevel(4)
	
	local id = frame:GetID()
	
	local tab = _G[name..'Tab']
	local editbox = _G[name..'EditBox']
	
	for _, texName in pairs(tabTexs) do
		_G[tab:GetName()..texName..'Left']:SetTexture(nil)
		_G[tab:GetName()..texName..'Middle']:SetTexture(nil)
		_G[tab:GetName()..texName..'Right']:SetTexture(nil)
	end

	hooksecurefunc(tab, "SetAlpha", function(t, alpha)
		if alpha ~= 1 then
			tab:SetAlpha(1)
		end
	end)

	tab.text = _G[name.."TabText"]
	tab.text:SetTextColor(unpack(E["media"].rgbvaluecolor))
	hooksecurefunc(tab.text, "SetTextColor", function(t, r, g, b, a)
		local rR, gG, bB = unpack(E["media"].rgbvaluecolor)

		if r ~= rR or g ~= gG or b ~= bB then
			t:SetTextColor(rR, gG, bB)
		end
	end)
	
	if tab.conversationIcon then
		tab.conversationIcon:ClearAllPoints()
		tab.conversationIcon:Point('RIGHT', tab.text, 'LEFT', -1, 0)
	end
	
	frame:SetClampRectInsets(0,0,0,0)
	frame:SetClampedToScreen(false)
	frame:StripTextures(true)
	_G[name..'ButtonFrame']:Kill()

	local a, b, c = select(6, editbox:GetRegions()); a:Kill(); b:Kill(); c:Kill()
	_G[format(editbox:GetName().."FocusLeft", id)]:Kill()
	_G[format(editbox:GetName().."FocusMid", id)]:Kill()
	_G[format(editbox:GetName().."FocusRight", id)]:Kill()	
	editbox:SetTemplate('Default', true)
	editbox:SetAltArrowKeyMode(false)
	editbox:HookScript("OnEditFocusGained", function(self) self:Show(); if not LeftChatPanel:IsShown() then LeftChatPanel.editboxforced = true; LeftChatToggleButton:GetScript('OnEnter')(LeftChatToggleButton) end end)
	editbox:HookScript("OnEditFocusLost", function(self) if LeftChatPanel.editboxforced then LeftChatPanel.editboxforced = nil; if LeftChatPanel:IsShown() then LeftChatToggleButton:GetScript('OnLeave')(LeftChatToggleButton) end end self:Hide() end)	
	editbox:SetAllPoints(LeftChatDataPanel)
	self:SecureHook(editbox, "AddHistoryLine", "ChatEdit_AddHistory")
	editbox:HookScript("OnTextChanged", function(self)
		local text = self:GetText()
		
		if InCombatLockdown() then
			local MIN_REPEAT_CHARACTERS = 5
			if (len(text) > MIN_REPEAT_CHARACTERS) then
			local repeatChar = true;
			for i=1, MIN_REPEAT_CHARACTERS, 1 do 
				if ( sub(text,(0-i), (0-i)) ~= sub(text,(-1-i),(-1-i)) ) then
					repeatChar = false;
					break;
				end
			end
				if ( repeatChar ) then
					self:Hide()
					return;
				end
			end
		end
		
		if text:len() < 5 then
			if text:sub(1, 4) == "/tt " then
				local unitname, realm
				unitname, realm = UnitName("target")
				if unitname then unitname = gsub(unitname, " ", "") end
				if unitname and not UnitIsSameServer("player", "target") then
					unitname = unitname .. "-" .. gsub(realm, " ", "")
				end
				ChatFrame_SendTell((unitname or L['Invalid Target']), ChatFrame1)
			end

			if text:sub(1, 4) == "/gr " then
				self:SetText(CH:GetGroupDistribution() .. text:sub(5));
				ChatEdit_ParseText(self, 0)		  
			end
		end

		local new, found = gsub(text, "|Kf(%S+)|k(%S+)%s(%S+)|k", "%2 %3")
		if found > 0 then
			new = new:gsub('|', '')
			self:SetText(new)
		end
	end)
	
	for i, text in pairs(ElvCharacterDB.ChatEditHistory) do
		editbox:AddHistoryLine(text)
	end	
	
	hooksecurefunc("ChatEdit_UpdateHeader", function()
		local type = editbox:GetAttribute("chatType")
		if ( type == "CHANNEL" ) then
			local id = GetChannelName(editbox:GetAttribute("channelTarget"))
			if id == 0 then
				editbox:SetBackdropBorderColor(unpack(E.media.bordercolor))
			else
				editbox:SetBackdropBorderColor(ChatTypeInfo[type..id].r,ChatTypeInfo[type..id].g,ChatTypeInfo[type..id].b)
			end
		elseif type then
			editbox:SetBackdropBorderColor(ChatTypeInfo[type].r,ChatTypeInfo[type].g,ChatTypeInfo[type].b)
		end
	end)
		
	--copy chat button
	frame.button = CreateFrame('Frame', format("CopyChatButton%d", id), frame)
	frame.button:SetAlpha(0)
	frame.button:SetTemplate('Default', true)
	frame.button:Size(20, 22)
	frame.button:SetPoint('TOPRIGHT')
	
	frame.button.tex = frame.button:CreateTexture(nil, 'OVERLAY')
	frame.button.tex:SetInside()
	frame.button.tex:SetTexture([[Interface\AddOns\ElvUI\media\textures\copy.tga]])
	
	frame.button:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton" and id == 1 then
			ToggleFrame(ChatMenu)
		else
			CH:CopyChat(frame)
		end
	end)
	
	frame.button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	frame.button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)	
		
	CreatedFrames = id
	frame.styled = true
end

function CH:GetLines(...)
	local ct = 1
	for i = select("#", ...), 1, -1 do
		local region = select(i, ...)
		if region:GetObjectType() == "FontString" then
			lines[ct] = tostring(region:GetText())
			ct = ct + 1
		end
	end
	return ct - 1
end

function CH:CopyChat(frame)
	if not CopyChatFrame:IsShown() then
		local _, fontSize = FCF_GetChatWindowInfo(frame:GetID());
		FCF_SetChatWindowFontSize(frame, frame, 0.01)
		CopyChatFrame:Show()
		local lineCt = self:GetLines(frame:GetRegions())
		local text = tconcat(lines, "\n", 1, lineCt)
		FCF_SetChatWindowFontSize(frame, frame, fontSize)
		CopyChatFrameEditBox:SetText(text)
	else
		CopyChatFrame:Hide()
	end
end

function CH:OnEnter(frame)
	_G[frame:GetName().."Text"]:Show()
	
	if frame.conversationIcon then
		frame.conversationIcon:Show()
	end
end

function CH:OnLeave(frame)
	_G[frame:GetName().."Text"]:Hide()
	
	if frame.conversationIcon then
		frame.conversationIcon:Hide()
	end
end

local x = CreateFrame('Frame')
function CH:SetupChatTabs(frame, hook)
	if hook and (not self.hooks or not self.hooks[frame] or not self.hooks[frame].OnEnter) then
		self:HookScript(frame, 'OnEnter')
		self:HookScript(frame, 'OnLeave')
	elseif not hook and self.hooks and self.hooks[frame] and self.hooks[frame].OnEnter then
		self:Unhook(frame, 'OnEnter')
		self:Unhook(frame, 'OnLeave')	
	end
	
	if not hook then
		_G[frame:GetName().."Text"]:Show()
		
		if frame.conversationIcon then
			frame.conversationIcon:Show()
		end
	elseif GetMouseFocus() ~= frame then
		_G[frame:GetName().."Text"]:Hide()
		
		if frame.conversationIcon then 
			frame.conversationIcon:Hide()
		end
	end
end

function CH:UpdateAnchors()
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName..'EditBox']
		if not frame then break; end
		if E.db.datatexts.leftChatPanel and E.db.chat.editBoxPosition == 'BELOW_CHAT' then
			frame:SetAllPoints(LeftChatDataPanel)
		else
			frame:SetAllPoints(LeftChatTab)
		end
	end
	
	CH:PositionChat(true)
end

function CH:PositionChat(override)
	if not self.db.lockPositions or ((InCombatLockdown() and not override and self.initialMove) or (IsMouseButtonDown("LeftButton") and not override)) then return end
	if not RightChatPanel or not LeftChatPanel then return; end
	RightChatPanel:Size(E.db.chat.panelWidth, E.db.chat.panelHeight)
	LeftChatPanel:Size(E.db.chat.panelWidth, E.db.chat.panelHeight)	
	
	if E.private.chat.enable ~= true then return end
		
	local chat, chatbg, tab, id, point, button, isDocked, chatFound
	for _, frameName in pairs(CHAT_FRAMES) do
		chat = _G[frameName]
		id = chat:GetID()
		point = GetChatWindowSavedPosition(id)
		
		if point == "BOTTOMRIGHT" and chat:IsShown() then
			chatFound = true
			break
		end
	end	

	if chatFound then
		self.RightChatWindowID = id
	else
		self.RightChatWindowID = nil
	end

	for i=1, CreatedFrames do
		local BASE_OFFSET = 60
		if E.PixelMode then
			BASE_OFFSET = BASE_OFFSET - 3
		end	
		chat = _G[format("ChatFrame%d", i)]
		chatbg = format("ChatFrame%dBackground", i)
		button = _G[format("ButtonCF%d", i)]
		id = chat:GetID()
		tab = _G[format("ChatFrame%sTab", i)]
		point = GetChatWindowSavedPosition(id)
		isDocked = chat.isDocked
		
		if id > NUM_CHAT_WINDOWS then
			point = point or select(1, chat:GetPoint());
			if select(2, tab:GetPoint()):GetName() ~= bg then
				isDocked = true
			else
				isDocked = false
			end	
		end	

		
		if point == "BOTTOMRIGHT" and chat:IsShown() and not (id > NUM_CHAT_WINDOWS) and id == self.RightChatWindowID then
			chat:ClearAllPoints()
			if E.db.datatexts.rightChatPanel then
				chat:Point("BOTTOMLEFT", RightChatDataPanel, "TOPLEFT", 1, 3)
			else
				BASE_OFFSET = BASE_OFFSET - 24
				chat:Point("BOTTOMLEFT", RightChatDataPanel, "BOTTOMLEFT", 1, 1)
			end
			if id ~= 2 then
				chat:SetSize(E.db.chat.panelWidth - 11, (E.db.chat.panelHeight - BASE_OFFSET))
			else
				chat:Size(E.db.chat.panelWidth - 11, (E.db.chat.panelHeight - BASE_OFFSET) - CombatLogQuickButtonFrame_Custom:GetHeight())				
			end
			
			
			FCF_SavePositionAndDimensions(chat)			
			
			tab:SetParent(RightChatPanel)
			chat:SetParent(RightChatPanel)
			
			if chat:IsMovable() then
				chat:SetUserPlaced(true)
			end
			if E.db.chat.panelBackdrop == 'HIDEBOTH' or E.db.chat.panelBackdrop == 'LEFT' then
				CH:SetupChatTabs(tab, true)
			else
				CH:SetupChatTabs(tab, false)
			end
		elseif not isDocked and chat:IsShown() then
			tab:SetParent(UIParent)
			chat:SetParent(UIParent)
			
			CH:SetupChatTabs(tab, true)
		else
			if id ~= 2 and not (id > NUM_CHAT_WINDOWS) then
				chat:ClearAllPoints()
				if E.db.datatexts.leftChatPanel then
					chat:Point("BOTTOMLEFT", LeftChatToggleButton, "TOPLEFT", 1, 3)
				else
					BASE_OFFSET = BASE_OFFSET - 24
					chat:Point("BOTTOMLEFT", LeftChatToggleButton, "BOTTOMLEFT", 1, 1)
				end
				chat:Size(E.db.chat.panelWidth - 11, (E.db.chat.panelHeight - BASE_OFFSET))
				FCF_SavePositionAndDimensions(chat)		
			end
			chat:SetParent(LeftChatPanel)
			if i > 2 then
				tab:SetParent(GeneralDockManagerScrollFrameChild)
			else
				tab:SetParent(GeneralDockManager)
			end
			if chat:IsMovable() then
				chat:SetUserPlaced(true)
			end
			
			if E.db.chat.panelBackdrop == 'HIDEBOTH' or E.db.chat.panelBackdrop == 'RIGHT' then
				CH:SetupChatTabs(tab, true)
			else
				CH:SetupChatTabs(tab, false)
			end			
		end		
	end
	
	self.initialMove = true;
end

local function UpdateChatTabColor(hex, r, g, b)
	for i=1, CreatedFrames do
		_G['ChatFrame'..i..'TabText']:SetTextColor(r, g, b)
	end
end
E['valueColorUpdateFuncs'][UpdateChatTabColor] = true

function CH:ScrollToBottom(frame)
	frame:ScrollToBottom()
	
	self:CancelTimer(frame.ScrollTimer, true)
end

function CH:PrintURL(url)
	return "|cFFFFFFFF[|Hurl:"..url.."|h"..url.."|h]|r "
end

function CH:FindURL(event, msg, ...)
	if (event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_BN_WHISPER") and CH.db.whisperSound ~= 'None' and not CH.SoundPlayed then
		PlaySoundFile(LSM:Fetch("sound", CH.db.whisperSound), "Master")
		CH.SoundPlayed = true
		CH.SoundTimer = CH:ScheduleTimer('ThrottleSound', 1)
	end

	if not CH.db.url then 
		msg = CH:CheckKeyword(msg);
		msg = CH:GetSmileyReplacementText(msg);
		return false, msg, ... 
	end
	
	local newMsg, found = gsub(msg, "(%a+)://(%S+)%s?", CH:PrintURL("%1://%2"))
	if found > 0 then return false, CH:GetSmileyReplacementText(CH:CheckKeyword(newMsg)), ... end
	
	newMsg, found = gsub(msg, "www%.([_A-Za-z0-9-]+)%.(%S+)%s?", CH:PrintURL("www.%1.%2"))
	if found > 0 then return false, CH:GetSmileyReplacementText(CH:CheckKeyword(newMsg)), ... end

	newMsg, found = gsub(msg, "([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", CH:PrintURL("%1@%2%3%4"))
	if found > 0 then return false, CH:GetSmileyReplacementText(CH:CheckKeyword(newMsg)), ... end
	
	msg = CH:CheckKeyword(msg)
	msg = CH:GetSmileyReplacementText(msg)
	
	return false, msg, ...
end

local function URLChatFrame_OnHyperlinkShow(self, link, ...)
	CH.clickedframe = self
	if (link):sub(1, 3) == "url" then
		local ChatFrameEditBox = ChatEdit_ChooseBoxForSend()
		local currentLink = (link):sub(5)
		if (not ChatFrameEditBox:IsShown()) then
			ChatEdit_ActivateChat(ChatFrameEditBox)
		end
		ChatFrameEditBox:Insert(currentLink)
		ChatFrameEditBox:HighlightText()
		return;
	end
	
	ChatFrame_OnHyperlinkShow(self, link, ...)
end

local function WIM_URLLink(link)
	if (link):sub(1, 3) == "url" then
		local ChatFrameEditBox = ChatEdit_ChooseBoxForSend()
		local currentLink = (link):sub(5)
		if (not ChatFrameEditBox:IsShown()) then
			ChatEdit_ActivateChat(ChatFrameEditBox)
		end
		ChatFrameEditBox:Insert(currentLink)
		ChatFrameEditBox:HighlightText()
		return
	end
end

local hyperLinkEntered
function CH:OnHyperlinkEnter(frame, refString)
	if InCombatLockdown() then return; end
	local linkToken = refString:match("^([^:]+)")
	if hyperlinkTypes[linkToken] then
		ShowUIPanel(GameTooltip)
		GameTooltip:SetOwner(frame, "ANCHOR_CURSOR")
		GameTooltip:SetHyperlink(refString)
		hyperLinkEntered = frame;
		GameTooltip:Show()
	end
end

function CH:OnHyperlinkLeave(frame, refString)
	local linkToken = refString:match("^([^:]+)")
	if hyperlinkTypes[linkToken] then
		HideUIPanel(GameTooltip)
		hyperLinkEntered = nil;
	end
end

function CH:OnMessageScrollChanged(frame)
	if hyperLinkEntered == frame then
		HideUIPanel(GameTooltip)
		hyperLinkEntered = false;
	end
end

function CH:EnableHyperlink()
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName]
		if (not self.hooks or not self.hooks[frame] or not self.hooks[frame].OnHyperlinkEnter) then
			self:HookScript(frame, 'OnHyperlinkEnter')
			self:HookScript(frame, 'OnHyperlinkLeave')
			self:HookScript(frame, 'OnMessageScrollChanged')
		end
	end
end

function CH:DisableHyperlink()
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName]
		if self.hooks and self.hooks[frame] and self.hooks[frame].OnHyperlinkEnter then
			self:Unhook(frame, 'OnHyperlinkEnter')
			self:Unhook(frame, 'OnHyperlinkLeave')
			self:Unhook(frame, 'OnMessageScrollChanged')
		end
	end
end

function CH:DisableChatThrottle()
	twipe(msgList); twipe(msgCount); twipe(msgTime)
end

function CH:ShortChannel()
	return format("|Hchannel:%s|h[%s]|h", self, DEFAULT_STRINGS[self] or self:gsub("channel:", ""))
end

function CH:ConcatenateTimeStamp(msg)
	if (CH.db.timeStampFormat and CH.db.timeStampFormat ~= 'NONE' ) then
		local timeStamp = BetterDate(CH.db.timeStampFormat, CH.timeOverride or time());
		timeStamp = timeStamp:gsub(' ', '')
		timeStamp = timeStamp:gsub('AM', ' AM')
		timeStamp = timeStamp:gsub('PM', ' PM')
		msg = '|cffB3B3B3['..timeStamp..'] |r'..msg
		CH.timeOverride = nil;
	end
	
	return msg
end

function CH:ChatFrame_MessageEventHandler(event, ...)
	if ( strsub(event, 1, 8) == "CHAT_MSG" ) then
		local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14 = ...;
		local type = strsub(event, 10);
		local info = ChatTypeInfo[type];

		local filter = false;
		if ( chatFilters[event] ) then
			local newarg1, newarg2, newarg3, newarg4, newarg5, newarg6, newarg7, newarg8, newarg9, newarg10, newarg11, newarg12, newarg13, newarg14;
			for _, filterFunc in next, chatFilters[event] do
				filter, newarg1, newarg2, newarg3, newarg4, newarg5, newarg6, newarg7, newarg8, newarg9, newarg10, newarg11, newarg12, newarg13, newarg14 = filterFunc(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
				if ( filter ) then
					return true;
				elseif ( newarg1 ) then
					arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14 = newarg1, newarg2, newarg3, newarg4, newarg5, newarg6, newarg7, newarg8, newarg9, newarg10, newarg11, newarg12, newarg13, newarg14;
				end
			end
		end
		
		local coloredName = GetColoredName(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
		
		local channelLength = strlen(arg4);
		local infoType = type;
		if ( (strsub(type, 1, 7) == "CHANNEL") and (type ~= "CHANNEL_LIST") and ((arg1 ~= "INVITE") or (type ~= "CHANNEL_NOTICE_USER")) ) then
			if ( arg1 == "WRONG_PASSWORD" ) then
				local staticPopup = _G[StaticPopup_Visible("CHAT_CHANNEL_PASSWORD") or ""];
				if ( staticPopup and strupper(staticPopup.data) == strupper(arg9) ) then
					-- Don't display invalid password messages if we're going to prompt for a password (bug 102312)
					return;
				end
			end
			
			local found = 0;
			for index, value in pairs(self.channelList) do
				if ( channelLength > strlen(value) ) then
					-- arg9 is the channel name without the number in front...
					if ( ((arg7 > 0) and (self.zoneChannelList[index] == arg7)) or (strupper(value) == strupper(arg9)) ) then
						found = 1;
						infoType = "CHANNEL"..arg8;
						info = ChatTypeInfo[infoType];
						if ( (type == "CHANNEL_NOTICE") and (arg1 == "YOU_LEFT") ) then
							self.channelList[index] = nil;
							self.zoneChannelList[index] = nil;
						end
						break;
					end
				end
			end
			if ( (found == 0) or not info ) then
				return true;
			end
		end

		local chatGroup = Chat_GetChatCategory(type);
		local chatTarget;
		if ( chatGroup == "CHANNEL" or chatGroup == "BN_CONVERSATION" ) then
			chatTarget = tostring(arg8);
		elseif ( chatGroup == "WHISPER" or chatGroup == "BN_WHISPER" ) then
			if(not(strsub(arg2, 1, 2) == "|K")) then
				chatTarget = strupper(arg2);
			else
				chatTarget = arg2;
			end
		end
		
		if ( FCFManager_ShouldSuppressMessage(self, chatGroup, chatTarget) ) then
			return true;
		end
			
		if ( chatGroup == "WHISPER" or chatGroup == "BN_WHISPER" ) then
			if ( self.privateMessageList and not self.privateMessageList[strlower(arg2)] ) then
				return true;
			elseif ( self.excludePrivateMessageList and self.excludePrivateMessageList[strlower(arg2)] 
				and ( (chatGroup == "WHISPER" and GetCVar("whisperMode") ~= "popout_and_inline") or (chatGroup == "BN_WHISPER" and GetCVar("bnWhisperMode") ~= "popout_and_inline") ) ) then
				return true;
			end
		elseif ( chatGroup == "BN_CONVERSATION" ) then
			if ( self.bnConversationList and not self.bnConversationList[arg8] ) then
				return true;
			elseif ( self.excludeBNConversationList and self.excludeBNConversationList[arg8] and GetCVar("conversationMode") ~= "popout_and_inline") then
				return true;
			end
		end
		
		if (self.privateMessageList) then
			-- Dedicated BN whisper windows need online/offline messages for only that player
			if ( (chatGroup == "BN_INLINE_TOAST_ALERT" or chatGroup == "BN_WHISPER_PLAYER_OFFLINE") and not self.privateMessageList[strlower(arg2)] ) then
				return true;
			end
			
			-- HACK to put certain system messages into dedicated whisper windows
			if ( chatGroup == "SYSTEM") then
				local matchFound = false;
				local message = strlower(arg1);
				for playerName, _ in pairs(self.privateMessageList) do
					local playerNotFoundMsg = strlower(format(ERR_CHAT_PLAYER_NOT_FOUND_S, playerName));
					local charOnlineMsg = strlower(format(ERR_FRIEND_ONLINE_SS, playerName, playerName));
					local charOfflineMsg = strlower(format(ERR_FRIEND_OFFLINE_S, playerName));
					if ( message == playerNotFoundMsg or message == charOnlineMsg or message == charOfflineMsg) then
						matchFound = true;
						break;
					end
				end

				if (not matchFound) then
					return true;
				end
			end
		end
	
		if ( type == "SYSTEM" or type == "SKILL" or type == "LOOT" or type == "CURRENCY" or type == "MONEY" or
		     type == "OPENING" or type == "TRADESKILLS" or type == "PET_INFO" or type == "TARGETICONS" or type == "BN_WHISPER_PLAYER_OFFLINE") then
			self:AddMessage(CH:ConcatenateTimeStamp(arg1), info.r, info.g, info.b, info.id);
		elseif ( strsub(type,1,7) == "COMBAT_" ) then
			self:AddMessage(CH:ConcatenateTimeStamp(arg1), info.r, info.g, info.b, info.id);
		elseif ( strsub(type,1,6) == "SPELL_" ) then
			self:AddMessage(CH:ConcatenateTimeStamp(arg1), info.r, info.g, info.b, info.id);
		elseif ( strsub(type,1,10) == "BG_SYSTEM_" ) then
			self:AddMessage(CH:ConcatenateTimeStamp(arg1), info.r, info.g, info.b, info.id);
		elseif ( strsub(type,1,11) == "ACHIEVEMENT" ) then
			self:AddMessage(format(CH:ConcatenateTimeStamp(arg1), "|Hplayer:"..arg2.."|h".."["..coloredName.."]".."|h"), info.r, info.g, info.b, info.id);
		elseif ( strsub(type,1,18) == "GUILD_ACHIEVEMENT" ) then
			self:AddMessage(format(CH:ConcatenateTimeStamp(arg1), "|Hplayer:"..arg2.."|h".."["..coloredName.."]".."|h"), info.r, info.g, info.b, info.id);
		elseif ( type == "IGNORED" ) then
			self:AddMessage(format(CH:ConcatenateTimeStamp(CHAT_IGNORED), arg2), info.r, info.g, info.b, info.id);
		elseif ( type == "FILTERED" ) then
			self:AddMessage(format(CH:ConcatenateTimeStamp(CHAT_FILTERED), arg2), info.r, info.g, info.b, info.id);
		elseif ( type == "RESTRICTED" ) then
			self:AddMessage(CH:ConcatenateTimeStamp(CHAT_RESTRICTED), info.r, info.g, info.b, info.id);
		elseif ( type == "CHANNEL_LIST") then
			if(channelLength > 0) then
				self:AddMessage(format(CH:ConcatenateTimeStamp(_G["CHAT_"..type.."_GET"]..arg1), tonumber(arg8), arg4), info.r, info.g, info.b, info.id);
			else
				self:AddMessage(CH:ConcatenateTimeStamp(arg1), info.r, info.g, info.b, info.id);
			end
		elseif (type == "CHANNEL_NOTICE_USER") then
			local globalstring = _G["CHAT_"..arg1.."_NOTICE_BN"];
			if ( not globalstring ) then
				globalstring = _G["CHAT_"..arg1.."_NOTICE"];
			end
			
			globalString = CH:ConcatenateTimeStamp(globalstring);
			
			if(strlen(arg5) > 0) then
				-- TWO users in this notice (E.G. x kicked y)
				self:AddMessage(format(globalstring, arg8, arg4, arg2, arg5), info.r, info.g, info.b, info.id);
			elseif ( arg1 == "INVITE" ) then
				self:AddMessage(format(globalstring, arg4, arg2), info.r, info.g, info.b, info.id);
			else
				self:AddMessage(format(globalstring, arg8, arg4, arg2), info.r, info.g, info.b, info.id);
			end
		elseif (type == "CHANNEL_NOTICE") then
			local globalstring = _G["CHAT_"..arg1.."_NOTICE_BN"];
			if ( not globalstring ) then
				globalstring = _G["CHAT_"..arg1.."_NOTICE"];
			end
			if ( arg10 > 0 ) then
				arg4 = arg4.." "..arg10;
			end
			
			globalString = CH:ConcatenateTimeStamp(globalstring);
			
			local accessID = ChatHistory_GetAccessID(Chat_GetChatCategory(type), arg8);
			local typeID = ChatHistory_GetAccessID(infoType, arg8, arg12);
			self:AddMessage(format(globalstring, arg8, arg4), info.r, info.g, info.b, info.id, false, accessID, typeID);
		elseif ( type == "BN_CONVERSATION_NOTICE" ) then
			local channelLink = format(CHAT_BN_CONVERSATION_GET_LINK, arg8, MAX_WOW_CHAT_CHANNELS + arg8);
			local playerLink = format("|HBNplayer:%s:%s:%s:%s:%s|h[%s]|h", arg2, arg13, arg11, Chat_GetChatCategory(type), arg8, arg2);
			local message = format(_G["CHAT_CONVERSATION_"..arg1.."_NOTICE"], channelLink, playerLink)
			
			local accessID = ChatHistory_GetAccessID(Chat_GetChatCategory(type), arg8);
			local typeID = ChatHistory_GetAccessID(infoType, arg8, arg12);
			self:AddMessage(CH:ConcatenateTimeStamp(message), info.r, info.g, info.b, info.id, false, accessID, typeID);
		elseif ( type == "BN_CONVERSATION_LIST" ) then
			local channelLink = format(CHAT_BN_CONVERSATION_GET_LINK, arg8, MAX_WOW_CHAT_CHANNELS + arg8);
			local message = format(CHAT_BN_CONVERSATION_LIST, channelLink, arg1);
			self:AddMessage(CH:ConcatenateTimeStamp(message), info.r, info.g, info.b, info.id, false, accessID, typeID);
		elseif ( type == "BN_INLINE_TOAST_ALERT" ) then	
			if ( arg1 == "FRIEND_OFFLINE" and not BNet_ShouldProcessOfflineEvents() ) then
				return true;
			end
			local globalstring = _G["BN_INLINE_TOAST_"..arg1];
			local message;
			if ( arg1 == "FRIEND_REQUEST" ) then
				message = globalstring;
			elseif ( arg1 == "FRIEND_PENDING" ) then
				message = format(BN_INLINE_TOAST_FRIEND_PENDING, BNGetNumFriendInvites());
			elseif ( arg1 == "FRIEND_REMOVED" or arg1 == "BATTLETAG_FRIEND_REMOVED" ) then
				message = format(globalstring, arg2);
			elseif ( arg1 == "FRIEND_ONLINE" or arg1 == "FRIEND_OFFLINE") then
				local hasFocus, toonName, client, realmName, realmID, faction, race, class, guild, zoneName, level, gameText = BNGetToonInfo(arg13);
				if (toonName and toonName ~= "" and client and client ~= "") then
					local toonNameText = BNet_GetClientEmbeddedTexture(client, 14)..toonName;
					local playerLink = format("|HBNplayer:%s:%s:%s:%s:%s|h[%s] (%s)|h", arg2, arg13, arg11, Chat_GetChatCategory(type), 0, arg2, toonNameText);
					message = format(globalstring, playerLink);
				else
					local playerLink = format("|HBNplayer:%s:%s:%s:%s:%s|h[%s]|h", arg2, arg13, arg11, Chat_GetChatCategory(type), 0, arg2);
					message = format(globalstring, playerLink);
				end
			else
				local playerLink = format("|HBNplayer:%s:%s:%s:%s:%s|h[%s]|h", arg2, arg13, arg11, Chat_GetChatCategory(type), 0, arg2);
				message = format(globalstring, playerLink);
			end
			self:AddMessage(CH:ConcatenateTimeStamp(message), info.r, info.g, info.b, info.id);
		elseif ( type == "BN_INLINE_TOAST_BROADCAST" ) then
			if ( arg1 ~= "" ) then
				arg1 = RemoveExtraSpaces(arg1);
				local playerLink = format("|HBNplayer:%s:%s:%s:%s:%s|h[%s]|h", arg2, arg13, arg11, Chat_GetChatCategory(type), 0, arg2);
				self:AddMessage(format(CH:ConcatenateTimeStamp(BN_INLINE_TOAST_BROADCAST), playerLink, arg1), info.r, info.g, info.b, info.id);
			end
		elseif ( type == "BN_INLINE_TOAST_BROADCAST_INFORM" ) then
			if ( arg1 ~= "" ) then
				arg1 = RemoveExtraSpaces(arg1);
				self:AddMessage(CH:ConcatenateTimeStamp(BN_INLINE_TOAST_BROADCAST_INFORM), info.r, info.g, info.b, info.id);
			end
		elseif ( type == "BN_INLINE_TOAST_CONVERSATION" ) then
			self:AddMessage(format(CH:ConcatenateTimeStamp(BN_INLINE_TOAST_CONVERSATION), arg1), info.r, info.g, info.b, info.id);
		else
			local body;

			local _, fontHeight = FCF_GetChatWindowInfo(self:GetID());
			
			if ( fontHeight == 0 ) then
				--fontHeight will be 0 if it's still at the default (14)
				fontHeight = 14;
			end
			
			-- Add AFK/DND flags
			local pflag;
			if(strlen(arg6) > 0) then
				if ( arg6 == "GM" ) then
					--If it was a whisper, dispatch it to the GMChat addon.
					if ( type == "WHISPER" ) then
						return;
					end
					--Add Blizzard Icon, this was sent by a GM
					pflag = "|TInterface\\ChatFrame\\UI-ChatIcon-Blizz:12:20:0:0:32:16:4:28:0:16|t ";
				elseif ( arg6 == "DEV" ) then
					--Add Blizzard Icon, this was sent by a Dev
					pflag = "|TInterface\\ChatFrame\\UI-ChatIcon-Blizz:12:20:0:0:32:16:4:28:0:16|t ";
				else					
					pflag = _G["CHAT_FLAG_"..arg6];
				end
			else
				if specialChatIcons[E.myrealm] then
					for character, texture in pairs(specialChatIcons[E.myrealm]) do
						if arg2 == character then
							pflag = texture
						end							
					end
					
					for realm, _ in pairs(specialChatIcons) do
						if realm ~= E.myrealm then
							for character, texture in pairs(specialChatIcons[realm]) do
								if arg2 == character.."%-"..realm then
									pflag = texture
								end			
							end
						end
					end			
				else
					for realm, _ in pairs(specialChatIcons) do
						for character, texture in pairs(specialChatIcons[realm]) do
							if arg2 == character.."%-"..realm then
								pflag = texture
							end		
						end
					end		
				end	

				if not pflag then
					pflag = "";
				end
			end
			if ( type == "WHISPER_INFORM" and GMChatFrame_IsGM and GMChatFrame_IsGM(arg2) ) then
				return;
			end

			local showLink = 1;
			if ( strsub(type, 1, 7) == "MONSTER" or strsub(type, 1, 9) == "RAID_BOSS") then
				showLink = nil;
			else
				arg1 = gsub(arg1, "%%", "%%%%");
			end
			
			-- Search for icon links and replace them with texture links.
			for tag in gmatch(arg1, "%b{}") do
				local term = strlower(gsub(tag, "[{}]", ""));
				if ( ICON_TAG_LIST[term] and ICON_LIST[ICON_TAG_LIST[term]] ) then
					arg1 = gsub(arg1, tag, ICON_LIST[ICON_TAG_LIST[term]] .. "0|t");
				elseif ( GROUP_TAG_LIST[term] ) then
					local groupIndex = GROUP_TAG_LIST[term];
					local groupList = "[";
					for i=1, GetNumGroupMembers() do
						local name, rank, subgroup, level, class, classFileName = GetRaidRosterInfo(i);
						if ( name and subgroup == groupIndex ) then
							local classColorTable = RAID_CLASS_COLORS[classFileName];
							if ( classColorTable ) then
								name = format("\124cff%.2x%.2x%.2x%s\124r", classColorTable.r*255, classColorTable.g*255, classColorTable.b*255, name);
							end
							groupList = groupList..(groupList == "[" and "" or PLAYER_LIST_DELIMITER)..name;
						end
					end
					groupList = groupList.."]";
					arg1 = gsub(arg1, tag, groupList);
				end
			end
			
			--Remove groups of many spaces
			arg1 = RemoveExtraSpaces(arg1);
			
			local playerLink;

			if ( type ~= "BN_WHISPER" and type ~= "BN_WHISPER_INFORM" and type ~= "BN_CONVERSATION" ) then
				playerLink = "|Hplayer:"..arg2..":"..arg11..":"..chatGroup..(chatTarget and ":"..chatTarget or "").."|h";
			else
				playerLink = "|HBNplayer:"..arg2..":"..arg13..":"..arg11..":"..chatGroup..(chatTarget and ":"..chatTarget or "").."|h";
			end
			
			local message = arg1;
			if ( arg14 ) then	--isMobile
				message = ChatFrame_GetMobileEmbeddedTexture(info.r, info.g, info.b)..message;
			end
			
			if ( (strlen(arg3) > 0) and (arg3 ~= self.defaultLanguage) ) then
				local languageHeader = "["..arg3.."] ";
				if ( showLink and (strlen(arg2) > 0) ) then
					body = format(_G["CHAT_"..type.."_GET"]..languageHeader..message, pflag..playerLink.."["..coloredName.."]".."|h");
				else
					body = format(_G["CHAT_"..type.."_GET"]..languageHeader..message, pflag..arg2);
				end
			else
				if ( not showLink or strlen(arg2) == 0 ) then
					if ( type == "TEXT_EMOTE" ) then
						body = message;
					else
						body = format(_G["CHAT_"..type.."_GET"]..message, pflag..arg2, arg2);
					end
				else
					if ( type == "EMOTE" ) then
						body = format(_G["CHAT_"..type.."_GET"]..message, pflag..playerLink..coloredName.."|h");
					elseif ( type == "TEXT_EMOTE") then
						body = gsub(message, arg2, pflag..playerLink..coloredName.."|h", 1);
					else
						body = format(_G["CHAT_"..type.."_GET"]..message, pflag..playerLink.."["..coloredName.."]".."|h");
					end
				end
			end

			-- Add Channel
			arg4 = gsub(arg4, "%s%-%s.*", "");
			if( chatGroup  == "BN_CONVERSATION" ) then
				body = format(CHAT_BN_CONVERSATION_GET_LINK, arg8, MAX_WOW_CHAT_CHANNELS + arg8)..body;
			elseif(channelLength > 0) then
				body = "|Hchannel:channel:"..arg8.."|h["..arg4.."]|h "..body;
			end
			
			local accessID = ChatHistory_GetAccessID(chatGroup, chatTarget);
			local typeID = ChatHistory_GetAccessID(infoType, chatTarget, arg12 == "" and arg13 or arg12);
			if CH.db.shortChannels then
				body = body:gsub("|Hchannel:(.-)|h%[(.-)%]|h", CH.ShortChannel)
				body = body:gsub('CHANNEL:', '')
				body = body:gsub("^(.-|h) "..L['whispers'], "%1")
				body = body:gsub("^(.-|h) "..L['says'], "%1")
				body = body:gsub("^(.-|h) "..L['yells'], "%1")
				body = body:gsub("<"..AFK..">", "[|cffFF0000"..L['AFK'].."|r] ")
				body = body:gsub("<"..DND..">", "[|cffE7E716"..L['DND'].."|r] ")
				body = body:gsub("%[BN_CONVERSATION:", '%['..L["BN:"])			
				body = body:gsub("^%["..RAID_WARNING.."%]", '['..L['RW']..']')	
			end
			self:AddMessage(CH:ConcatenateTimeStamp(body), info.r, info.g, info.b, info.id, false, accessID, typeID);
		end
 
		if ( type == "WHISPER" or type == "BN_WHISPER" ) then
			--BN_WHISPER FIXME
			ChatEdit_SetLastTellTarget(arg2, type);
			if ( self.tellTimer and (GetTime() > self.tellTimer) ) then
				PlaySound("TellMessage");
			end
			self.tellTimer = GetTime() + CHAT_TELL_ALERT_TIME;
			--FCF_FlashTab(self);
		end
		
		if ( not self:IsShown() ) then
			if ( (self == DEFAULT_CHAT_FRAME and info.flashTabOnGeneral) or (self ~= DEFAULT_CHAT_FRAME and info.flashTab) ) then
				if ( not CHAT_OPTIONS.HIDE_FRAME_ALERTS or type == "WHISPER" or type == "BN_WHISPER" ) then	--BN_WHISPER FIXME
					if (not (type == "BN_CONVERSATION" and BNIsSelf(arg13))) then
						if (not FCFManager_ShouldSuppressMessageFlash(self, chatGroup, chatTarget) ) then
							--FCF_StartAlertFlash(self); THIS TAINTS<<<<<<<
							_G[self:GetName().."Tab"].glow:Show()
							_G[self:GetName().."Tab"]:SetScript("OnUpdate", CH.ChatTab_OnUpdate)
						end
					end
				end
			end
		end

		return true;
	end
end

function CH:ChatTab_OnUpdate(elapsed)
	if self.glow:IsShown() then
		E:Flash(self.glow, 1)
	else
		E:StopFlash(self.glow);
		self:SetScript("OnUpdate", nil)
	end
end

function CH:ChatFrame_OnEvent(event, ...)
	if ( ChatFrame_ConfigEventHandler(self, event, ...) ) then
		return;
	end
	if ( ChatFrame_SystemEventHandler(self, event, ...) ) then
		return
	end
	if ( CH.ChatFrame_MessageEventHandler(self, event, ...) ) then
		return
	end
end

function CH:FloatingChatFrame_OnEvent(event, ...)
	CH.ChatFrame_OnEvent(self, event, ...);
	FloatingChatFrame_OnEvent(self, event, ...);
end

function CH:SetupChat(event, ...)
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName]
		local id = frame:GetID();
		local _, fontSize = FCF_GetChatWindowInfo(id);
		self:StyleChat(frame)
		FCFTab_UpdateAlpha(frame)
		frame:SetFont(LSM:Fetch("font", self.db.font), fontSize, self.db.fontOutline)
		if self.db.fontOutline ~= 'NONE' then
			frame:SetShadowColor(0, 0, 0, 0.2)
		else
			frame:SetShadowColor(0, 0, 0, 1)
		end
		frame:SetTimeVisible(100)
		frame:SetShadowOffset((E.mult or 1), -(E.mult or 1))	
		frame:SetFading(self.db.fade)
		
		frame:SetScript("OnHyperlinkClick", URLChatFrame_OnHyperlinkShow)
		frame:SetScript("OnMouseWheel", ChatFrame_OnMouseScroll)
		
		if id > NUM_CHAT_WINDOWS then
			frame:SetScript("OnEvent", CH.FloatingChatFrame_OnEvent)
		elseif id ~= 2 then
			frame:SetScript("OnEvent", CH.ChatFrame_OnEvent)
		end
		
		hooksecurefunc(frame, "SetScript", function(f, script, func)
			if script == "OnMouseWheel" and func ~= ChatFrame_OnMouseScroll then
				f:SetScript(script, ChatFrame_OnMouseScroll)
			end
		end)
	
		if not _G[frameName.."Tab"].glow.anim then
			E:SetUpAnimGroup(_G[frameName.."Tab"].glow)
		end
	end	
	
	if self.db.hyperlinkHover then
		self:EnableHyperlink()
	end

	GeneralDockManager:SetParent(LeftChatPanel)
	self:ScheduleRepeatingTimer('PositionChat', 1)
	self:PositionChat(true)
	
	if not self.HookSecured then
		self:SecureHook('FCF_OpenTemporaryWindow', 'SetupChat')
		self.HookSecured = true;
	end
end

local sizes = {
	":14:14",
	":15:15",
	":16:16",
	":13:22",
	":14",
	":16",
}

local function PrepareMessage(author, message)
	return author:upper() .. message
end

function CH:ChatThrottleHandler(event, ...)
	local arg1, arg2 = ...
	
	if arg2 ~= "" then
		local message = PrepareMessage(arg2, arg1)
		if msgList[message] == nil then
			msgList[message] = true
			msgCount[message] = 1
			msgTime[message] = time()
		else
			msgCount[message] = msgCount[message] + 1
		end
	end
end

local locale = GetLocale()
function CH:CHAT_MSG_CHANNEL(event, message, author, ...)
	
	local isSpam = nil
	if locale == 'enUS' or locale == 'enGB' then
		isSpam = CH.SpamFilter(self, event, message, author, ...)
	end
	
	if isSpam then
		return true;
	else
		local blockFlag = false
		local msg = PrepareMessage(author, message)

		-- ignore player messages
		if author == UnitName("player") then return CH.FindURL(self, event, message, author, ...) end
		if msgList[msg] and CH.db.throttleInterval ~= 0 then
			if difftime(time(), msgTime[msg]) <= CH.db.throttleInterval then
				blockFlag = true
			end
		end
		
		if blockFlag then
			return true;
		else
			if CH.db.throttleInterval ~= 0 then
				msgTime[msg] = time()
			end
			
			return CH.FindURL(self, event, message, author, ...)
		end
	end
end

function CH:CHAT_MSG_YELL(event, message, author, ...)
	local isSpam = nil
	if locale == 'enUS' or locale == 'enGB' then
		isSpam = CH.SpamFilter(self, event, message, author, ...)
	end
	
	if isSpam then
		return true;
	else
		local blockFlag = false
		local msg = PrepareMessage(author, message)
		
		if msg == nil then return CH.FindURL(self, event, message, author, ...) end	

		-- ignore player messages
		if author == UnitName("player") then return CH.FindURL(self, event, message, author, ...) end
		if msgList[msg] and msgCount[msg] > 1 and CH.db.throttleInterval ~= 0 then
			if difftime(time(), msgTime[msg]) <= CH.db.throttleInterval then
				blockFlag = true
			end
		end
		
		if blockFlag then
			return true;
		else
			if CH.db.throttleInterval ~= 0 then
				msgTime[msg] = time()
			end
			
			return CH.FindURL(self, event, message, author, ...)
		end
	end
end

function CH:CHAT_MSG_SAY(event, message, author, ...)
	local isSpam = nil
	if locale == 'enUS' or locale == 'enGB' then
		isSpam = CH.SpamFilter(self, event, message, author, ...)
	end
	
	if isSpam then
		return true;
	else
		return CH.FindURL(self, event, message, author, ...)
	end
end

function CH:ThrottleSound()
	self.SoundPlayed = nil;
end

function CH:CheckKeyword(message)
	local replaceWords = {};

	for i=1, #{string.split(' ', message)} do
		local word = select(i, string.split(' ', message));
		if not word:find('|') then
			for keyword, _ in pairs(CH.Keywords) do
				if word:lower() == keyword:lower() then
					replaceWords[word] = E.media.hexvaluecolor..word..'|r'
					if self.db.keywordSound ~= 'None' and not self.SoundPlayed  then
						PlaySoundFile(LSM:Fetch("sound", self.db.keywordSound), "Master")
						self.SoundPlayed = true
						self.SoundTimer = CH:ScheduleTimer('ThrottleSound', 1)			
					end
				end	
			end
		end
	end
	
	for word, replaceWord in pairs(replaceWords) do
		if message == word then
			message = message:gsub(word, replaceWord)
		elseif message:find(' '..word) then
			message = message:gsub(' '..word, ' '..replaceWord)
		elseif message:find(word..' ') then
			message = message:gsub(word..' ', replaceWord..' ')
		end
	end
	
	return message
end

function CH:AddLines(lines, ...)
  for i=select("#", ...),1,-1 do
    local x = select(i, ...)
    if x:GetObjectType() == "FontString" and not x:GetName() then
        tinsert(lines, x:GetText())
    end
  end
end

function CH:ChatEdit_OnEnterPressed(editBox)
	local type = editBox:GetAttribute("chatType");
	local chatFrame = editBox:GetParent();
	if not chatFrame.isTemporary and ChatTypeInfo[type].sticky == 1 then
		if not self.db.sticky then type = 'SAY'; end
		editBox:SetAttribute("chatType", type);
	end
end

function CH:SetChatFont(dropDown, chatFrame, fontSize)
	if ( not chatFrame ) then
		chatFrame = FCF_GetCurrentChatFrame();
	end
	if ( not fontSize ) then
		fontSize = dropDown.value;
	end
	chatFrame:SetFont(LSM:Fetch("font", self.db.font), fontSize, self.db.fontOutline)
	if self.db.fontOutline ~= 'NONE' then
		chatFrame:SetShadowColor(0, 0, 0, 0.2)
	else
		chatFrame:SetShadowColor(0, 0, 0, 1)
	end
	chatFrame:SetShadowOffset((E.mult or 1), -(E.mult or 1))	
end

function CH:ChatEdit_AddHistory(editBox, line)
	if line:find("/rl") then return; end
	
	if ( strlen(line) > 0 ) then
		for i, text in pairs(ElvCharacterDB.ChatEditHistory) do
			if text == line then
				return
			end
		end
		
		tinsert(ElvCharacterDB.ChatEditHistory, #ElvCharacterDB.ChatEditHistory + 1, line)
		if #ElvCharacterDB.ChatEditHistory > 5 then
			tremove(ElvCharacterDB.ChatEditHistory, 1)
		end
	end
end

function CH:UpdateChatKeywords()
	twipe(CH.Keywords)
	local keywords = self.db.keywords
	keywords = keywords:gsub(',%s', ',')

	for i=1, #{string.split(',', keywords)} do
		local stringValue = select(i, string.split(',', keywords));
		if stringValue == '%MYNAME%' then
			stringValue = E.myname;
		end
		
		if stringValue ~= '' then
			CH.Keywords[stringValue] = true;
		end
	end
end

function CH:PET_BATTLE_CLOSE()
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName]
		if frame and _G[frameName.."Tab"]:GetText():match(PET_BATTLE_COMBAT_LOG) then
			FCF_Close(frame)
		end
	end
end

function CH:UpdateFading()
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName]
		if frame then
			frame:SetFading(self.db.fade)
		end
	end
end

function CH:DisplayChatHistory()	
	local temp, data = {}
	for id, _ in pairs(ElvCharacterDB.ChatHistory) do
		tinsert(temp, tonumber(id))
	end
	
	tsort(temp, function(a, b)
		return a < b
	end)
	
	for i = 1, #temp do
		data = ElvCharacterDB.ChatHistory[tostring(temp[i])]

		if type(data) == "table" and data[20] ~= nil then
			CH.timeOverride = temp[i]
			CH.ChatFrame_MessageEventHandler(DEFAULT_CHAT_FRAME, data[20], unpack(data))
		end
	end
end

local function GetTimeForSavedMessage()
	local randomTime = select(2, ("."):split(GetTime() or "0."..random(1, 999), 2)) or 0
	return time().."."..randomTime
end

function CH:SaveChatHistory(event, ...)
	if self.db.throttleInterval ~= 0 and (event == 'CHAT_MESSAGE_SAY' or event == 'CHAT_MESSAGE_YELL' or event == 'CHAT_MSG_CHANNEL') then	
		self:ChatThrottleHandler(event, ...)		
		
		local message, author = ...
		local msg = PrepareMessage(author, message)
		if author ~= UnitName("player") and msgList[msg] then
			if difftime(time(), msgTime[msg]) <= CH.db.throttleInterval then
				return;
			end
		end		
	end
	
	local temp = {...}
	if #temp > 0 then
	  temp[20] = event
	  local timeForMessage = GetTimeForSavedMessage()
	  ElvCharacterDB.ChatHistory[timeForMessage] = temp
	  
		local c, k = 0
		for id, data in pairs(ElvCharacterDB.ChatHistory) do
			c = c + 1
			if (not k) or k > id then
				k = id
			end
		end
		
		if c > 128 then
			ElvCharacterDB.ChatHistory[k] = nil
		end	  
	end
end

function CH:ChatFrame_AddMessageEventFilter (event, filter)
	assert(event and filter);
	
	if ( chatFilters[event] ) then
		-- Only allow a filter to be added once
		for index, filterFunc in next, chatFilters[event] do
			if ( filterFunc == filter ) then
				return;
			end
		end
	else
		chatFilters[event] = {};
	end
	
	tinsert(chatFilters[event], filter);
end

function CH:ChatFrame_RemoveMessageEventFilter (event, filter)
	assert(event and filter);
	
	if ( chatFilters[event] ) then
		for index, filterFunc in next, chatFilters[event] do
			if ( filterFunc == filter ) then
				tremove(chatFilters[event], index);
			end
		end
		
		if ( #chatFilters[event] == 0 ) then
			chatFilters[event] = nil;
		end
	end
end

function CH:FCF_SetWindowAlpha(frame, alpha, doNotSave)
	frame.oldAlpha = alpha or 1;
end

DEFAULT_CHAT_FRAME:UnregisterEvent("GUILD_MOTD")
function CH:Initialize()
	self.db = E.db.chat
	local msg = GetGuildRosterMOTD() or ""
	if E.private.chat.enable ~= true then 
		DEFAULT_CHAT_FRAME:RegisterEvent("GUILD_MOTD")
		ChatFrame_SystemEventHandler(DEFAULT_CHAT_FRAME, "GUILD_MOTD", msg)
		return 
	end
	if not ElvCharacterDB.ChatEditHistory then
		ElvCharacterDB.ChatEditHistory = {};
	end
	
	if not ElvCharacterDB.ChatHistory or not self.db.chatHistory then
		ElvCharacterDB.ChatHistory = {};
	end
	
	self:UpdateChatKeywords()
	
	self:UpdateFading()
	E.Chat = self
	self:SecureHook('ChatEdit_OnEnterPressed')
	FriendsMicroButton:Kill()
	ChatFrameMenuButton:Kill()

		
    if WIM then
      WIM.RegisterWidgetTrigger("chat_display", "whisper,chat,w2w,demo", "OnHyperlinkClick", function(self) CH.clickedframe = self end);
	  WIM.RegisterItemRefHandler('url', WIM_URLLink)
    end

	self:SecureHook('FCF_SetChatWindowFontSize', 'SetChatFont')
	self:RegisterEvent('UPDATE_CHAT_WINDOWS', 'SetupChat')
	self:RegisterEvent('UPDATE_FLOATING_CHAT_WINDOWS', 'SetupChat')
	self:RegisterEvent('PET_BATTLE_CLOSE')
	self:SetupChat()
	self:UpdateAnchors()
	
	self:RegisterEvent('CHAT_MSG_INSTANCE_CHAT', 'SaveChatHistory')
	self:RegisterEvent('CHAT_MSG_INSTANCE_CHAT_LEADER', 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_BN_WHISPER", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_BN_WHISPER_INFORM", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_CHANNEL", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_EMOTE", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_GUILD", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_OFFICER", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_PARTY", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_PARTY_LEADER", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_RAID", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_RAID_LEADER", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_RAID_WARNING", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_SAY", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_WHISPER", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM", 'SaveChatHistory')
	self:RegisterEvent("CHAT_MSG_YELL", 'SaveChatHistory')
	
	--First get all pre-existing filters and copy them to our version of chatFilters using ChatFrame_GetMessageEventFilters
	for name, _ in pairs(ChatTypeGroup) do
		for i=1, #ChatTypeGroup[name] do
			local filterFuncTable = ChatFrame_GetMessageEventFilters(ChatTypeGroup[name][i])
			if filterFuncTable then
				chatFilters[ChatTypeGroup[name][i]] = {};

				for j=1, #filterFuncTable do
					local filterFunc = filterFuncTable[j]
					tinsert(chatFilters[ChatTypeGroup[name][i]], filterFunc);
				end
			end
		end
	end
	
	--CHAT_MSG_CHANNEL isn't located inside ChatTypeGroup
	local filterFuncTable = ChatFrame_GetMessageEventFilters("CHAT_MSG_CHANNEL")
	if filterFuncTable then
		chatFilters["CHAT_MSG_CHANNEL"] = {};

		for j=1, #filterFuncTable do
			local filterFunc = filterFuncTable[j]
			tinsert(chatFilters["CHAT_MSG_CHANNEL"], filterFunc);
		end
	end
			
	--Now hook onto Blizzards functions for other addons
	self:SecureHook("ChatFrame_AddMessageEventFilter");
	self:SecureHook("ChatFrame_RemoveMessageEventFilter");
	
	self:SecureHook("FCF_SetWindowAlpha")
	
	
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", CH.CHAT_MSG_CHANNEL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", CH.CHAT_MSG_YELL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", CH.CHAT_MSG_SAY)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", CH.FindURL)	
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_CONVERSATION", CH.FindURL)	
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", CH.FindURL)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_INLINE_TOAST_BROADCAST", CH.FindURL)
	

	GeneralDockManagerOverflowButton:ClearAllPoints()
	GeneralDockManagerOverflowButton:Point('BOTTOMRIGHT', LeftChatTab, 'BOTTOMRIGHT', -2, 2)
	GeneralDockManagerOverflowButtonList:SetTemplate('Transparent')
	hooksecurefunc(GeneralDockManagerScrollFrame, 'SetPoint', function(self, point, anchor, attachTo, x, y)
		if anchor == GeneralDockManagerOverflowButton and x == 0 and y == 0 then
			self:SetPoint(point, anchor, attachTo, -2, -6)
		end
	end)	
	
	if self.db.chatHistory then
		self.SoundPlayed = true;
		self:DisplayChatHistory()
		self.SoundPlayed = nil;
		local f = CreateFrame('Frame')
		local OnUpdate = function(self)
			local msg = GetGuildRosterMOTD()
			if (msg and msg:len() > 0) then
				ChatFrame_SystemEventHandler(DEFAULT_CHAT_FRAME, "GUILD_MOTD", msg)		
				DEFAULT_CHAT_FRAME:RegisterEvent("GUILD_MOTD")
				self:SetScript('OnUpdate', nil)
			end		
		end
		f:SetScript('OnUpdate', OnUpdate)
	end
		
	
	local S = E:GetModule('Skins')
	S:HandleNextPrevButton(CombatLogQuickButtonFrame_CustomAdditionalFilterButton, true)
	local frame = CreateFrame("Frame", "CopyChatFrame", E.UIParent)
	frame:SetTemplate('Transparent')
	frame:Size(700, 200)
	frame:Point('BOTTOM', E.UIParent, 'BOTTOM', 0, 3)
	frame:Hide()
	frame:EnableMouse(true)
	frame:SetFrameStrata("DIALOG")


	local scrollArea = CreateFrame("ScrollFrame", "CopyChatScrollFrame", frame, "UIPanelScrollFrameTemplate")
	scrollArea:Point("TOPLEFT", frame, "TOPLEFT", 8, -30)
	scrollArea:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)
	S:HandleScrollBar(CopyChatScrollFrameScrollBar)

	local editBox = CreateFrame("EditBox", "CopyChatFrameEditBox", frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(false)
	editBox:SetFontObject(ChatFontNormal)
	editBox:Width(scrollArea:GetWidth())
	editBox:Height(200)
	editBox:SetScript("OnEscapePressed", function() frame:Hide() end)
	scrollArea:SetScrollChild(editBox)
	
	--EXTREME HACK..
	editBox:SetScript("OnTextSet", function(self)
		local text = self:GetText()
		
		for _, size in pairs(sizes) do
			if find(text, size) and not find(text, size.."]") then
				if size == ':13:22' then
					self:SetText(gsub(text, size, ":12:20"))
				else
					self:SetText(gsub(text, size, ":12:12"))
				end
			end		
		end
	end)

	local close = CreateFrame("Button", "CopyChatFrameCloseButton", frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT")
	close:SetFrameLevel(close:GetFrameLevel() + 1)
	close:EnableMouse(true)
	
	S:HandleCloseButton(close)	

	--Disable Blizzard
	InterfaceOptionsSocialPanelTimestampsButton:SetAlpha(0)
	InterfaceOptionsSocialPanelTimestampsButton:SetScale(0.000001)
	InterfaceOptionsSocialPanelTimestamps:SetAlpha(0)
	InterfaceOptionsSocialPanelTimestamps:SetScale(0.000001)
	--[[InterfaceOptionsSocialPanelWhisperMode:SetScale(0.000001)
	InterfaceOptionsSocialPanelWhisperMode:SetAlpha(0)
	InterfaceOptionsSocialPanelBnWhisperMode:SetScale(0.000001)
	InterfaceOptionsSocialPanelBnWhisperMode:SetAlpha(0)
	InterfaceOptionsSocialPanelConversationMode:SetScale(0.000001)
	InterfaceOptionsSocialPanelConversationMode:SetAlpha(0)]]
	
	InterfaceOptionsSocialPanelChatStyle:EnableMouse(false)
	InterfaceOptionsSocialPanelChatStyleButton:Hide()
	InterfaceOptionsSocialPanelChatStyle:SetAlpha(0)

 	CombatLogQuickButtonFrame_CustomAdditionalFilterButton:Size(20, 22)
 	CombatLogQuickButtonFrame_CustomAdditionalFilterButton:Point("TOPRIGHT", CombatLogQuickButtonFrame_Custom, "TOPRIGHT", 0, -1)
	
	--[[if GetCVar("conversationMode") ~= "inline" then
		SetCVar("conversationMode", "inline")
	end

	for cvar, _ in pairs(cvars) do
		if GetCVar(cvar) ~= "inline" then
			SetCVar(cvar, "inline")
		end
	end
	
	if GetCVar("showTimestamps") ~= "none" then
		SetCVar("showTimestamps", "none")
	end]]
end

E:RegisterModule(CH:GetName())