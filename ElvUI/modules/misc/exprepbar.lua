local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local M = E:GetModule('Misc');

FACTION_STANDING_LABEL100 = UNKNOWN

local format = string.format
local min, max = math.min, math.max

function M:UpdateExpRepAnchors()
	local repBar = ReputationBarMover
	local expBar = ExperienceBarMover

	if (E:HasMoverBeenMoved('ExperienceBarMover') or E:HasMoverBeenMoved('ReputationBarMover')) or not repBar or not expBar then return; end
	repBar:ClearAllPoints()
	expBar:ClearAllPoints()
	
	if self.expBar:IsShown() and self.repBar:IsShown() then
		expBar:Point('TOP', E.UIParent, 'TOP', 0, -1)
		repBar:Point('TOP', self.expBar, 'BOTTOM', 0, -1)
	elseif self.expBar:IsShown() then
		expBar:Point('TOP', E.UIParent, 'TOP', 0, -1)
	else
		repBar:Point('TOP', E.UIParent, 'TOP', 0, -1)
	end
end

function M:GetXP(unit)
	if(unit == 'pet') then
		return GetPetExperience()
	else
		return UnitXP(unit), UnitXPMax(unit)
	end
end

function M:UpdateExperience(event)
	local bar = self.expBar

	if(UnitLevel('player') == MAX_PLAYER_LEVEL) or IsXPUserDisabled() then
		bar:Hide()
	else
		bar:Show()
		
		local cur, max = self:GetXP('player')
		bar.statusBar:SetMinMaxValues(0, max)
		bar.statusBar:SetValue(cur - 1 >= 0 and cur - 1 or 0)
		bar.statusBar:SetValue(cur)
		
		local rested = GetXPExhaustion()
		local text = ''
		local textFormat = E.db.general.experience.textFormat
		
		if rested and rested > 0 then
			bar.rested:SetMinMaxValues(0, max)
			bar.rested:SetValue(min(cur + rested, max))
			
			if textFormat == 'PERCENT' then
				text = format('%d%% R:%d%%', cur / max * 100, rested / max * 100)
			elseif textFormat == 'CURMAX' then
				text = format('%s - %s R:%s', E:ShortValue(cur), E:ShortValue(max), E:ShortValue(rested))
			elseif textFormat == 'CURPERC' then
				text = format('%s - %d%% R:%s [%d%%]', E:ShortValue(cur), cur / max * 100, E:ShortValue(rested), rested / max * 100)
			end
		else
			bar.rested:SetMinMaxValues(0, 1)
			bar.rested:SetValue(0)	

			if textFormat == 'PERCENT' then
				text = format('%d%%', cur / max * 100)
			elseif textFormat == 'CURMAX' then
				text = format('%s - %s', E:ShortValue(cur), E:ShortValue(max))
			elseif textFormat == 'CURPERC' then
				text = format('%s - %d%%', E:ShortValue(cur), cur / max * 100)
			end			
		end
		
		bar.text:SetText(text)
	end
	
	self:UpdateExpRepAnchors()
end

function M:UpdateReputation(event)
	local bar = self.repBar
	
	local ID = 100
	local name, reaction, min, max, value = GetWatchedFactionInfo()
	local numFactions = GetNumFactions();

	if not name then
		bar:Hide()
	else
		bar:Show()

		local text = ''
		local textFormat = E.db.general.reputation.textFormat		
		local color = FACTION_BAR_COLORS[reaction]
		bar.statusBar:SetStatusBarColor(color.r, color.g, color.b)	

		bar.statusBar:SetMinMaxValues(min, max)
		bar.statusBar:SetValue(value)
		
		for i=1, numFactions do
			local factionName, _, standingID = GetFactionInfo(i);
			if factionName == name then
				ID = standingID
			end
		end
		
		
		
		if textFormat == 'PERCENT' then
			text = format('%s: %d%% [%s]', name, ((value - min) / (max - min) * 100), _G['FACTION_STANDING_LABEL'..ID])
		elseif textFormat == 'CURMAX' then
			text = format('%s: %s - %s [%s]', name, E:ShortValue(value - min), E:ShortValue(max - min), _G['FACTION_STANDING_LABEL'..ID])
		elseif textFormat == 'CURPERC' then
			text = format('%s: %s - %d%% [%s]', name, E:ShortValue(value - min), ((value - min) / (max - min) * 100), _G['FACTION_STANDING_LABEL'..ID])
		end					
		
		bar.text:SetText(text)		
	end
	
	self:UpdateExpRepAnchors()
end

local function ExperienceBar_OnEnter(self)
	if E.db.general.experience.mouseover then
		E:UIFrameFadeIn(self, 0.4, self:GetAlpha(), 1)
	end
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOM', 0, -4)
	
	local cur, max = M:GetXP('player')
	local rested = GetXPExhaustion()
	GameTooltip:AddLine(L['Experience'])
	GameTooltip:AddLine(' ')
	
	GameTooltip:AddDoubleLine(L['XP:'], format(' %d / %d (%d%%)', cur, max, cur/max * 100), 1, 1, 1)
	GameTooltip:AddDoubleLine(L['Remaining:'], format(' %d (%d%% - %d '..L['Bars']..')', max - cur, (max - cur) / max * 100, 20 * (max - cur) / max), 1, 1, 1)	
	
	if rested then
		GameTooltip:AddDoubleLine(L['Rested:'], format('+%d (%d%%)', rested, rested / max * 100), 1, 1, 1)	
	end
	
	GameTooltip:Show()
end

local function ReputationBar_OnEnter(self)
	if E.db.general.reputation.mouseover then
		E:UIFrameFadeIn(self, 0.4, self:GetAlpha(), 1)
	end
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOM', 0, -4)
	
	local name, reaction, min, max, value = GetWatchedFactionInfo()
	if name then
		GameTooltip:AddLine(name)
		GameTooltip:AddLine(' ')
		
		GameTooltip:AddDoubleLine(STANDING..':', _G['FACTION_STANDING_LABEL'..reaction], 1, 1, 1)
		GameTooltip:AddDoubleLine(REPUTATION..':', format('%d / %d (%d%%)', value - min, max - min, (value - min) / (max - min) * 100), 1, 1, 1)
	end
	GameTooltip:Show()
end

local function OnLeave(self)
	if (self == ElvUI_ExperienceBar and E.db.general.experience.mouseover) or (self == ElvUI_ReputationBar and E.db.general.reputation.mouseover) then
		E:UIFrameFadeOut(self, 1, self:GetAlpha(), 0)
	end
	GameTooltip:Hide()
end

function M:CreateBar(name, onEnter, ...)
	local bar = CreateFrame('Button', name, E.UIParent)
	bar:Point(...)
	bar:SetScript('OnEnter', onEnter)
	bar:SetScript('OnLeave', OnLeave)
	bar:SetFrameStrata('LOW')
	bar:SetTemplate('Default')
	bar:Hide()
	
	bar.statusBar = CreateFrame('StatusBar', nil, bar)
	bar.statusBar:SetInside()
	bar.statusBar:SetStatusBarTexture(E.media.normTex)
	
	bar.text = bar.statusBar:CreateFontString(nil, 'OVERLAY')
	bar.text:FontTemplate()
	bar.text:SetPoint('CENTER')
	
	E.FrameLocks[name] = true
	
	return bar
end

function M:UpdateExpRepDimensions()
	self.expBar:Width(E.db.general.experience.width)
	self.expBar:Height(E.db.general.experience.height)
	
	self.repBar:Width(E.db.general.reputation.width)
	self.repBar:Height(E.db.general.reputation.height)
	
	self.repBar.text:FontTemplate(nil, E.db.general.reputation.textSize)
	self.expBar.text:FontTemplate(nil, E.db.general.experience.textSize)
	
	self.expBar.statusBar:SetOrientation(E.db.general.experience.orientation)
	self.repBar.statusBar:SetOrientation(E.db.general.reputation.orientation)

	if E.db.general.experience.mouseover then
		self.expBar:SetAlpha(0)
	else
		self.expBar:SetAlpha(1)
	end
	
	if E.db.general.reputation.mouseover then
		self.repBar:SetAlpha(0)
	else
		self.repBar:SetAlpha(1)
	end
end

function M:EnableDisable_ExperienceBar()
	if UnitLevel('player') ~= MAX_PLAYER_LEVEL and E.db.general.experience.enable then
		self:RegisterEvent('PLAYER_XP_UPDATE', 'UpdateExperience')
		self:RegisterEvent('PLAYER_LEVEL_UP', 'UpdateExperience')
		self:RegisterEvent("DISABLE_XP_GAIN", 'UpdateExperience')
		self:RegisterEvent("ENABLE_XP_GAIN", 'UpdateExperience')
		self:RegisterEvent('UPDATE_EXHAUSTION', 'UpdateExperience')
		self:UpdateExperience()	
	else
		self:UnregisterEvent('PLAYER_XP_UPDATE')
		self:UnregisterEvent('PLAYER_LEVEL_UP')
		self:UnregisterEvent("DISABLE_XP_GAIN")
		self:UnregisterEvent("ENABLE_XP_GAIN")
		self:UnregisterEvent('UPDATE_EXHAUSTION')
		self.expBar:Hide()
	end
	
	self:UpdateExpRepAnchors()
end

function M:EnableDisable_ReputationBar()
	if E.db.general.reputation.enable then
		self:RegisterEvent('UPDATE_FACTION', 'UpdateReputation')
		self:UpdateReputation()
	else
		self:UnregisterEvent('UPDATE_FACTION')
		self.repBar:Hide()
	end
end

function M:LoadExpRepBar()
	self.expBar = self:CreateBar('ElvUI_ExperienceBar', ExperienceBar_OnEnter, 'TOP', E.UIParent, 'TOP', 0, -1)
	self.expBar.statusBar:SetStatusBarColor(0, 0.4, 1, .8)
	self.expBar.rested = CreateFrame('StatusBar', nil, self.expBar)
	self.expBar.rested:SetInside()
	self.expBar.rested:SetStatusBarTexture(E.media.normTex)
	self.expBar.rested:SetStatusBarColor(1, 0, 1, 0.2)

	self.repBar = self:CreateBar('ElvUI_ReputationBar', ReputationBar_OnEnter, 'TOP', self.expBar, 'BOTTOM', 0, -1)

	self:UpdateExpRepDimensions()
	
	self:EnableDisable_ExperienceBar()
	self:EnableDisable_ReputationBar()

	E:CreateMover(self.expBar, "ExperienceBarMover", L["Experience Bar"])
	E:CreateMover(self.repBar, "ReputationBarMover", L["Reputation Bar"])
	
	self:UpdateExpRepAnchors()
end