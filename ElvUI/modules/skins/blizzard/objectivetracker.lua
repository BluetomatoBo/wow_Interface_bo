local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local unpack = unpack

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.objectiveTracker ~= true then return end

	ObjectiveTrackerBlocksFrame.QuestHeader:StripTextures()
	ObjectiveTrackerBlocksFrame.QuestHeader.Text:FontTemplate()
	ObjectiveTrackerBlocksFrame.AchievementHeader:StripTextures()
	ObjectiveTrackerBlocksFrame.AchievementHeader.Text:FontTemplate()
	ObjectiveTrackerBlocksFrame.ScenarioHeader:StripTextures()
	ObjectiveTrackerBlocksFrame.ScenarioHeader.Text:FontTemplate()

	BONUS_OBJECTIVE_TRACKER_MODULE.Header:StripTextures()
	BONUS_OBJECTIVE_TRACKER_MODULE.Header.Text:FontTemplate()
	WORLD_QUEST_TRACKER_MODULE.Header:StripTextures()
	WORLD_QUEST_TRACKER_MODULE.Header.Text:FontTemplate()

	local function OnClick(self)
		local textObject = self.text

		if ObjectiveTrackerFrame.collapsed then
			textObject:SetText("+")
		else
			textObject:SetText("-")
		end
	end

	local minimizeButton = ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
	S:HandleButton(minimizeButton)
	minimizeButton:Size(16, 14)
	minimizeButton.text = minimizeButton:CreateFontString(nil, "OVERLAY")
	minimizeButton.text:FontTemplate()
	minimizeButton.text:Point("CENTER", minimizeButton, "CENTER", 0, 0)
	minimizeButton.text:SetText("-")
	minimizeButton.text:SetJustifyH("CENTER")
	minimizeButton.text:SetJustifyV("MIDDLE")
	minimizeButton:HookScript('OnClick', OnClick)

	-- Various stuff I experimented with
	--[[
	ObjectiveTrackerBlocksFrame:CreateBackdrop("Transparent")
	ObjectiveTrackerBlocksFrame.backdrop:Point("TOPLEFT", -30, 0)

	local b = CreateFrame("Button", nil, ObjectiveTrackerFrame)
	b.text = b:CreateFontString(nil, 'OVERLAY')
	b.text:Point('CENTER', b, 'CENTER')
	b.text:FontTemplate()
	b.text:SetText(HIDE)
	b:Size(50, 20)
	S:HandleButton(b)
	b:SetTemplate("Transparent")
	b:Point("BOTTOMRIGHT", ObjectiveTrackerFrame.HeaderMenu.MinimizeButton, "BOTTOMRIGHT",0, 0)
	b:SetScript("OnClick", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:GetScript("OnClick")()

		if ObjectiveTrackerBlocksFrame.QuestHeader:IsVisible() then
			b:Width(50)
			b.text:SetText(HIDE)
			b:ClearAllPoints()
			b:Point("BOTTOMRIGHT", ObjectiveTrackerFrame.HeaderMenu.MinimizeButton, "BOTTOMRIGHT",0, 0)
		else
			b.text:SetText("")
			b:Point("TOPLEFT", ObjectiveTrackerFrame.HeaderMenu.Title, "TOPLEFT", -10, 5)
		end
	end)

	ObjectiveTrackerBlocksFrame.QuestHeader.Text:SetTextColor(unpack(E.media.rgbvaluecolor))
	ObjectiveTrackerBlocksFrame.AchievementHeader:CreateBackdrop("Transparent")
	ObjectiveTrackerBlocksFrame.AchievementHeader.backdrop:Point("TOPLEFT", 0, -2)
	ObjectiveTrackerBlocksFrame.AchievementHeader.backdrop:Point("BOTTOMRIGHT", 0, 2)
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetAlpha(0)
	]]

	--Skin ObjectiveTrackerFrame item buttons
	hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
		local item = block.itemButton
		if item and not item.skinned then
			item:SetSize(25, 25)
			item:SetTemplate("Transparent")
			item:StyleButton()
			item:SetNormalTexture(nil)
			item.icon:SetTexCoord(unpack(E.TexCoords))
			item.icon:SetInside()
			item.Cooldown:SetInside()
			item.Count:ClearAllPoints()
			item.Count:SetPoint("TOPLEFT", 1, -1)
			item.Count:SetFont(E["media"].normFont, 14, "OUTLINE")
			item.Count:SetShadowOffset(5, -5)
			E:RegisterCooldown(item.Cooldown)
			item.skinned = true
		end
	end)

	--World Quest Tracker item buttons
	hooksecurefunc(WORLD_QUEST_TRACKER_MODULE, "AddObjective", function(_, block)
		local item = block.itemButton
		if item and not item.skinned then
			item:SetSize(25, 25)
			item:SetTemplate("Transparent")
			item:StyleButton()
			item:SetNormalTexture(nil)
			item.icon:SetTexCoord(unpack(E.TexCoords))
			item.icon:SetInside()
			item.Cooldown:SetInside()
			item.Count:ClearAllPoints()
			item.Count:SetPoint("TOPLEFT", 1, -1)
			item.Count:SetFont(E["media"].normFont, 14, "OUTLINE")
			item.Count:SetShadowOffset(5, -5)
			E:RegisterCooldown(item.Cooldown)
			item.skinned = true
		end
	end)

	--Quest Tracker ProgressBar
	hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", function(self, block, line, questID)
		local progressBar = self.usedProgressBars[block] and self.usedProgressBars[block][line];
		if not progressBar.Bar.backdrop then
			progressBar.Bar:CreateBackdrop("Transparent")
			progressBar.Bar:SetStatusBarTexture(E["media"].normTex)
			E:RegisterStatusBar(progressBar.Bar)
			progressBar.Bar:DisableDrawLayer("ARTWORK")
			progressBar.Bar.Label:SetDrawLayer("OVERLAY")
		end
	end)

	--World Quest Tracker ProgressBar
	hooksecurefunc(WORLD_QUEST_TRACKER_MODULE, "AddProgressBar", function(_, _, line)
		if not line.ProgressBar.Bar.backdrop then
			line.ProgressBar.Bar:Height(18)
			line.ProgressBar.Bar:CreateBackdrop("Transparent")
			line.ProgressBar.Bar:SetStatusBarTexture(E["media"].normTex)
			E:RegisterStatusBar(line.ProgressBar.Bar)
			line.ProgressBar.Bar.BarFrame:Hide()
			line.ProgressBar.Bar.IconBG:SetAlpha(0)
			line.ProgressBar.Bar.BarFrame2:Hide()
			line.ProgressBar.Bar.BarFrame3:Hide()

			line.ProgressBar.Bar.Icon:ClearAllPoints()
			line.ProgressBar.Bar.Icon:SetPoint("LEFT", line.ProgressBar.Bar, "RIGHT", E.Border*3, 0)
			line.ProgressBar.Bar.Icon:SetMask("")
			line.ProgressBar.Bar.Icon:SetTexCoord(unpack(E.TexCoords))

			line.ProgressBar:CreateBackdrop("Default")
			line.ProgressBar.backdrop:SetOutside(line.ProgressBar.Bar.Icon)

			--Sometimes the glow effect looks weird, so hide them
			line.ProgressBar.Bar.BarGlow:Hide()
			line.ProgressBar.Bar.Starburst:Hide()
			line.ProgressBar.Bar.Sheen:Hide()
			line.ProgressBar.FullBarFlare1.BarGlow:Hide()
			line.ProgressBar.FullBarFlare2.BarGlow:Hide()
		end

		line.ProgressBar.backdrop:SetShown(line.ProgressBar.Bar.Icon:IsShown())
	end)

	--Bonus Objective Tracker ProgressBar
	hooksecurefunc(BONUS_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", function(_, _, line)
		if not line.ProgressBar.Bar.backdrop then
			line.ProgressBar.Bar:Height(18)
			line.ProgressBar.Bar:CreateBackdrop("Transparent")
			line.ProgressBar.Bar:SetStatusBarTexture(E["media"].normTex)
			E:RegisterStatusBar(line.ProgressBar.Bar)
			line.ProgressBar.Bar.BarFrame:Hide()
			line.ProgressBar.Bar.IconBG:SetAlpha(0)
			line.ProgressBar.Bar.BarFrame2:Hide()
			line.ProgressBar.Bar.BarFrame3:Hide()

			line.ProgressBar.Bar.Icon:ClearAllPoints()
			line.ProgressBar.Bar.Icon:SetPoint("LEFT", line.ProgressBar.Bar, "RIGHT", E.Border*3, 0)
			line.ProgressBar.Bar.Icon:SetMask("")
			line.ProgressBar.Bar.Icon:SetTexCoord(unpack(E.TexCoords))

			line.ProgressBar:CreateBackdrop("Default")
			line.ProgressBar.backdrop:SetOutside(line.ProgressBar.Bar.Icon)
		end

		line.ProgressBar.backdrop:SetShown(line.ProgressBar.Bar.Icon:IsShown())
	end)

	--Scenario Tracker ProgressBar
	hooksecurefunc(SCENARIO_TRACKER_MODULE, "AddProgressBar", function(_, _, line)
		if not line.ProgressBar.Bar.backdrop then
			line.ProgressBar.Bar:Height(18)
			line.ProgressBar.Bar:CreateBackdrop("Transparent")
			line.ProgressBar.Bar:SetStatusBarTexture(E["media"].normTex)
			E:RegisterStatusBar(line.ProgressBar.Bar)
			line.ProgressBar.Bar.BarFrame:Hide()
			line.ProgressBar.Bar.IconBG:SetAlpha(0)
			line.ProgressBar.Bar.BarFrame2:Hide()
			line.ProgressBar.Bar.BarFrame3:Hide()

			line.ProgressBar.Bar.Icon:ClearAllPoints()
			line.ProgressBar.Bar.Icon:SetPoint("LEFT", line.ProgressBar.Bar, "RIGHT", E.Border*3, 0)
			line.ProgressBar.Bar.Icon:SetMask("")
			line.ProgressBar.Bar.Icon:SetTexCoord(unpack(E.TexCoords))

			line.ProgressBar:CreateBackdrop("Default")
			line.ProgressBar.backdrop:SetOutside(line.ProgressBar.Bar.Icon)
		end

		line.ProgressBar.backdrop:SetShown(line.ProgressBar.Bar.Icon:IsShown())
	end)
end

S:AddCallback("ObjectiveTracker", LoadSkin)