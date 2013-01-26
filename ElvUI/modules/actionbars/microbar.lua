local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local AB = E:GetModule('ActionBars');

local function Button_OnEnter(self)
	if AB.db.microbar.mouseover then
		E:UIFrameFadeIn(ElvUI_MicroBar, 0.2, ElvUI_MicroBar:GetAlpha(), AB.db.microbar.alpha)
	end
end

local function Button_OnLeave(self)
	if AB.db.microbar.mouseover then
		E:UIFrameFadeOut(ElvUI_MicroBar, 0.2, ElvUI_MicroBar:GetAlpha(), 0)
	end
end

function AB:HandleMicroButton(button)
	assert(button, 'Invalid micro button name.')

	local pushed = button:GetPushedTexture()
	local normal = button:GetNormalTexture()
	local disabled = button:GetDisabledTexture()
	
	button:SetParent(ElvUI_MicroBar)
	button.Flash:SetTexture(nil)
	button:GetHighlightTexture():Kill()
	button:HookScript('OnEnter', Button_OnEnter)
	button:HookScript('OnLeave', Button_OnLeave)

	local f = CreateFrame("Frame", nil, button)
	f:SetFrameLevel(1)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 2, 0)
	f:SetPoint("TOPRIGHT", button, "TOPRIGHT", -2, -28)
	f:SetTemplate("Default", true)
	button.backdrop = f
	
	pushed:SetTexCoord(0.17, 0.87, 0.5, 0.908)
	pushed:SetInside(f)

	normal:SetTexCoord(0.17, 0.87, 0.5, 0.908)
	normal:SetInside(f)
	
	if disabled then
		disabled:SetTexCoord(0.17, 0.87, 0.5, 0.908)
		disabled:SetInside(f)
	end
end

function AB:MainMenuMicroButton_SetNormal()
	MainMenuBarPerformanceBar:SetPoint("TOPLEFT", MainMenuMicroButton, "TOPLEFT", 9, -36);
end

function AB:MainMenuMicroButton_SetPushed()
	MainMenuBarPerformanceBar:SetPoint("TOPLEFT", MainMenuMicroButton, "TOPLEFT", 8, -37);
end

function AB:UpdateMicroButtonsParent(parent)
	if parent ~= ElvUI_MicroBar then parent = ElvUI_MicroBar end
	
	for i=1, #MICRO_BUTTONS do
		_G[MICRO_BUTTONS[i]]:SetParent(ElvUI_MicroBar);
	end
end

function AB:UpdateMicroPositionDimensions()
	if not ElvUI_MicroBar then return; end
	local numRows = 1
	for i=1, #MICRO_BUTTONS do
		local button = _G[MICRO_BUTTONS[i]]
		local prevButton = _G[MICRO_BUTTONS[i-1]] or ElvUI_MicroBar
		local lastColumnButton = _G[MICRO_BUTTONS[i-self.db.microbar.buttonsPerRow]];
		
		button:Width(28)
		button:Height(58)
		button:ClearAllPoints();

		if prevButton == ElvUI_MicroBar then
			button:SetPoint("TOPLEFT", prevButton, "TOPLEFT", -2, 28)
		elseif (i - 1) % self.db.microbar.buttonsPerRow == 0 then
			button:Point('TOP', lastColumnButton, 'BOTTOM', 0, 27);	
			numRows = numRows + 1
		else
			button:Point('LEFT', prevButton, 'RIGHT', -3, 0);
		end
	end

	if AB.db.microbar.mouseover then
		ElvUI_MicroBar:SetAlpha(0)
	else
		ElvUI_MicroBar:SetAlpha(self.db.microbar.alpha)
	end	
		
	ElvUI_MicroBar:SetWidth((((CharacterMicroButton:GetWidth() - 0.5) * (#MICRO_BUTTONS - 1)) - 3) / numRows)
	ElvUI_MicroBar:Height((CharacterMicroButton:GetHeight() - 27) * numRows)

	if self.db.microbar.enabled then
		ElvUI_MicroBar:Show()
	else
		ElvUI_MicroBar:Hide()
	end		
end

function AB:UpdateMicroButtons()
	GuildMicroButtonTabard:ClearAllPoints()
	GuildMicroButtonTabard:SetPoint("TOP", GuildMicroButton.backdrop, "TOP", 0, 25)
end

function AB:SetupMicroBar()
	local microBar = CreateFrame('Frame', 'ElvUI_MicroBar', E.UIParent)
	microBar:Point('TOPLEFT', E.UIParent, 'TOPLEFT', 4, -48)
	E.FrameLocks["ElvUI_MicroBar"] = true;
	for i=1, #MICRO_BUTTONS do
		self:HandleMicroButton(_G[MICRO_BUTTONS[i]])
	end

	MicroButtonPortrait:SetInside(CharacterMicroButton.backdrop)

	self:SecureHook('MainMenuMicroButton_SetPushed')
	self:SecureHook('MainMenuMicroButton_SetNormal')
	self:SecureHook('UpdateMicroButtonsParent')
	self:SecureHook('MoveMicroButtons', 'UpdateMicroPositionDimensions')
	self:SecureHook('UpdateMicroButtons')
	UpdateMicroButtonsParent(microBar)
	self:MainMenuMicroButton_SetNormal()
	self:UpdateMicroPositionDimensions()
	
	E:CreateMover(microBar, 'MicrobarMover', L['Micro Bar'], nil, nil, nil, 'ALL,ACTIONBARS');
end