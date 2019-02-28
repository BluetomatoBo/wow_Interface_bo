local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Lua functions
local _G = _G
local unpack = unpack
--WoW API / Variables
local hooksecurefunc = hooksecurefunc

local function SetPlayTexture()
	_G.StopwatchPlayPauseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\play")
end
local function SetPauseTexture()
	_G.StopwatchPlayPauseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\pause")
end

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.timemanager ~= true then return end

	local TimeManagerFrame = _G.TimeManagerFrame
	S:HandlePortraitFrame(TimeManagerFrame, true)

	S:HandleDropDownBox(_G.TimeManagerAlarmHourDropDown, 80)
	S:HandleDropDownBox(_G.TimeManagerAlarmMinuteDropDown, 80)
	S:HandleDropDownBox(_G.TimeManagerAlarmAMPMDropDown, 80)

	S:HandleEditBox(_G.TimeManagerAlarmMessageEditBox)
	S:HandleCheckBox(_G.TimeManagerAlarmEnabledButton)
	S:HandleCheckBox(_G.TimeManagerMilitaryTimeCheck)
	S:HandleCheckBox(_G.TimeManagerLocalTimeCheck)

	local TimeManagerStopwatchCheck = _G.TimeManagerStopwatchCheck
	_G.TimeManagerStopwatchFrame:StripTextures()
	TimeManagerStopwatchCheck:SetTemplate()
	TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
	TimeManagerStopwatchCheck:GetNormalTexture():SetInside()

	local hover = TimeManagerStopwatchCheck:CreateTexture() -- hover
	hover:SetColorTexture(1,1,1,0.3)
	hover:Point("TOPLEFT",TimeManagerStopwatchCheck,2,-2)
	hover:Point("BOTTOMRIGHT",TimeManagerStopwatchCheck,-2,2)
	TimeManagerStopwatchCheck:SetHighlightTexture(hover)

	local StopwatchFrame = _G.StopwatchFrame
	StopwatchFrame:StripTextures()
	StopwatchFrame:CreateBackdrop("Transparent")
	StopwatchFrame.backdrop:Point("TOPLEFT", 0, -17)
	StopwatchFrame.backdrop:Point("BOTTOMRIGHT", 0, 2)

	_G.StopwatchTabFrame:StripTextures()
	S:HandleCloseButton(_G.StopwatchCloseButton)

	--Play/Pause and Reset buttons
	local StopwatchPlayPauseButton = _G.StopwatchPlayPauseButton
	local StopwatchResetButton = _G.StopwatchResetButton
	StopwatchPlayPauseButton:CreateBackdrop("Default", true)
	StopwatchPlayPauseButton:SetSize(12, 12)
	StopwatchPlayPauseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\play")
	StopwatchPlayPauseButton:SetHighlightTexture("")
	StopwatchPlayPauseButton.backdrop:SetOutside(StopwatchPlayPauseButton, 2, 2)
	StopwatchPlayPauseButton:HookScript('OnEnter', S.SetModifiedBackdrop)
	StopwatchPlayPauseButton:HookScript('OnLeave', S.SetOriginalBackdrop)
	StopwatchPlayPauseButton:Point("RIGHT", StopwatchResetButton, "LEFT", -4, 0)
	S:HandleButton(StopwatchResetButton)
	StopwatchResetButton:SetSize(16,16)
	StopwatchResetButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\reset")
	StopwatchResetButton:Point("BOTTOMRIGHT", StopwatchFrame, "BOTTOMRIGHT", -4, 6)

	hooksecurefunc("Stopwatch_Play", SetPauseTexture)
	hooksecurefunc("Stopwatch_Pause", SetPlayTexture)
	hooksecurefunc("Stopwatch_Clear", SetPlayTexture)
end

S:AddCallbackForAddon("Blizzard_TimeManager", "TimeManager", LoadSkin)
