local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables

--Just some test code
--[[local talkingHeadTextureKitRegionFormatStrings = {
	["TextBackground"] = "%s-TextBackground",
	["Portrait"] = "%s-PortraitFrame",
}
local talkingHeadDefaultAtlases = {
	["TextBackground"] = "TalkingHeads-TextBackground",
	["Portrait"] = "TalkingHeads-Alliance-PortraitFrame",
}
local talkingHeadFontColor = {
	["TalkingHeads-Horde"] = {Name = CreateColor(0.28, 0.02, 0.02), Text = CreateColor(0.0, 0.0, 0.0), Shadow = CreateColor(0.0, 0.0, 0.0, 0.0)},
	["TalkingHeads-Alliance"] = {Name = CreateColor(0.02, 0.17, 0.33), Text = CreateColor(0.0, 0.0, 0.0), Shadow = CreateColor(0.0, 0.0, 0.0, 0.0)},
	["TalkingHeads-Neutral"] = {Name = CreateColor(0.33, 0.16, 0.02), Text = CreateColor(0.0, 0.0, 0.0), Shadow = CreateColor(0.0, 0.0, 0.0, 0.0)},
	["Normal"] = {Name = CreateColor(1, 0.82, 0.02), Text = CreateColor(1, 1, 1), Shadow = CreateColor(0.0, 0.0, 0.0, 1.0)},
}

--test
function TestTalkingHead()
	local frame = TalkingHeadFrame;
	local model = frame.MainFrame.Model;

	if( frame.finishTimer ) then
		frame.finishTimer:Cancel();
		frame.finishTimer = nil;
	end
	if ( frame.voHandle ) then
		StopSound(frame.voHandle);
		frame.voHandle = nil;
	end

	local currentDisplayInfo = model:GetDisplayInfo();
	local displayInfo, cameraID, vo, duration, lineNumber, numLines, name, text, isNewTalkingHead, textureKitID

	displayInfo = 76291
	cameraID = 1240
	vo = 103175
	duration = 20.220001220703
	lineNumber = 0
	numLines = 4
	name = "Some Ugly Woman"
	text = "Testing this sheet out Testing this sheet out Testing this sheet out Testing this sheet out Testing this sheet out Testing this sheet out Testing this sheet out "
	isNewTalkingHead = true
	textureKitID = 0

	local textFormatted = string.format(text);
	if ( displayInfo and displayInfo ~= 0 ) then
		local textureKit;
		if ( textureKitID ~= 0 ) then
			SetupTextureKits(textureKitID, frame.BackgroundFrame, talkingHeadTextureKitRegionFormatStrings, false, true);
			SetupTextureKits(textureKitID, frame.PortraitFrame, talkingHeadTextureKitRegionFormatStrings, false, true);
			textureKit = GetUITextureKitInfo(textureKitID);
		else
			SetupAtlasesOnRegions(frame.BackgroundFrame, talkingHeadDefaultAtlases, true);
			SetupAtlasesOnRegions(frame.PortraitFrame, talkingHeadDefaultAtlases, true);
			textureKit = "Normal";
		end
		local nameColor = talkingHeadFontColor[textureKit].Name;
		local textColor = talkingHeadFontColor[textureKit].Text;
		local shadowColor = talkingHeadFontColor[textureKit].Shadow;
		frame.NameFrame.Name:SetTextColor(nameColor:GetRGB());
		frame.NameFrame.Name:SetShadowColor(shadowColor:GetRGBA());
		frame.TextFrame.Text:SetTextColor(textColor:GetRGB());
		frame.TextFrame.Text:SetShadowColor(shadowColor:GetRGBA());
		frame:Show();
		if ( currentDisplayInfo ~= displayInfo ) then
			model.uiCameraID = cameraID;
			model:SetDisplayInfo(displayInfo);
		else
			if ( model.uiCameraID ~= cameraID ) then
				model.uiCameraID = cameraID;
				Model_ApplyUICamera(model, model.uiCameraID);
			end
			TalkingHeadFrame_SetupAnimations(model);
		end

		if ( isNewTalkingHead ) then
			TalkingHeadFrame_Reset(frame, textFormatted, name);
			TalkingHeadFrame_FadeinFrames();
		else
			if ( name ~= frame.NameFrame.Name:GetText() ) then
				-- Fade out the old name and fade in the new name
				frame.NameFrame.Fadeout:Play();
				C_Timer.After(0.25, function()
					frame.NameFrame.Name:SetText(name);
				end);
				C_Timer.After(0.5, function()
					frame.NameFrame.Fadein:Play();
				end);

				frame.MainFrame.TalkingHeadsInAnim:Play();
			end

			if ( textFormatted ~= frame.TextFrame.Text:GetText() ) then
				-- Fade out the old text and fade in the new text
				frame.TextFrame.Fadeout:Play();
				C_Timer.After(0.25, function()
					frame.TextFrame.Text:SetText(textFormatted);
				end);
				C_Timer.After(0.5, function()
					frame.TextFrame.Fadein:Play();
				end);
			end
		end


		local success, voHandle = PlaySound(vo, "Talking Head", true, true);
		if ( success ) then
			frame.voHandle = voHandle;
		end
	end
end]]

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.talkinghead ~= true then return end

	local TalkingHeadFrame = _G.TalkingHeadFrame

	TalkingHeadFrame.BackgroundFrame.TextBackground:SetAtlas(nil)
	TalkingHeadFrame.PortraitFrame.Portrait:SetAtlas(nil)
	TalkingHeadFrame.MainFrame.Model.PortraitBg:SetAtlas(nil)
	TalkingHeadFrame.PortraitFrame:StripTextures()

	if E.db.general.talkingHeadFrameBackdrop then
		TalkingHeadFrame:StripTextures()
		TalkingHeadFrame.MainFrame:StripTextures()
		TalkingHeadFrame:CreateBackdrop("Transparent")
	else
		TalkingHeadFrame.MainFrame.Model:CreateBackdrop("Transparent")
		TalkingHeadFrame.MainFrame.Model.backdrop:ClearAllPoints()
		TalkingHeadFrame.MainFrame.Model.backdrop:SetPoint("CENTER")
		TalkingHeadFrame.MainFrame.Model.backdrop:SetSize(120, 119)
	end

	TalkingHeadFrame.BackgroundFrame.TextBackground.SetAtlas = E.noop
	TalkingHeadFrame.PortraitFrame.Portrait.SetAtlas = E.noop
	TalkingHeadFrame.MainFrame.Model.PortraitBg.SetAtlas = E.noop

	TalkingHeadFrame.NameFrame.Name:SetTextColor(1, 0.82, 0.02)
	TalkingHeadFrame.NameFrame.Name.SetTextColor = E.noop
	TalkingHeadFrame.NameFrame.Name:SetShadowColor(0, 0, 0, 1)
	TalkingHeadFrame.NameFrame.Name:SetShadowOffset(2, -2)

	TalkingHeadFrame.TextFrame.Text:SetTextColor(1, 1, 1)
	TalkingHeadFrame.TextFrame.Text.SetTextColor = E.noop
	TalkingHeadFrame.TextFrame.Text:SetShadowColor(0, 0, 0, 1)
	TalkingHeadFrame.TextFrame.Text:SetShadowOffset(2, -2)

	TalkingHeadFrame.MainFrame.CloseButton:Kill()
end

S:AddCallbackForAddon("Blizzard_TalkingHeadUI", "TalkingHead", LoadSkin)
