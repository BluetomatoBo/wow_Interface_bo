local AS = unpack(AddOnSkins)

function AS:Blizzard_AlliedRacesUI(event, addon)
	if addon ~= 'Blizzard_AlliedRacesUI' then return end

	AlliedRacesFrame:CreateBackdrop("Transparent")
	AlliedRacesFrameBg:Hide()
	AlliedRacesFramePortrait:Hide()
	AlliedRacesFramePortraitFrame:Hide()
	AlliedRacesFrameTitleBg:Hide()
	AlliedRacesFrameTopBorder:Hide()
	AlliedRacesFrameTopRightCorner:Hide()
	AlliedRacesFrameRightBorder:Hide()
	AlliedRacesFrameBotRightCorner:Hide()
	AlliedRacesFrameBotLeftCorner:Hide()
	AlliedRacesFrameBtnCornerRight:Hide()
	AlliedRacesFrameBtnCornerLeft:Hide()
	AlliedRacesFrameButtonBottomBorder:Hide()
	AlliedRacesFrameBottomBorder:Hide()
	AlliedRacesFrameLeftBorder:Hide()
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.Border:Hide()
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.ScrollUpBorder:Hide()
	AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.ScrollDownBorder:Hide()
	AlliedRacesFrame.ModelFrame:StripTextures()

	AS:SkinCloseButton(AlliedRacesFrameCloseButton)
	AS:SkinScrollBar(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_Gossip()
	AS:SkinFrame(GossipFrame)
	GossipFrame:SetHeight(500)

	AS:SkinCloseButton(GossipFrame.CloseButton)
	GossipFramePortrait:SetAlpha(0)

	AS:StripTextures(GossipFrameGreetingPanel)
	AS:SkinButton(GossipFrameGreetingGoodbyeButton)

	AS:SkinFrame(GossipGreetingScrollFrame)
	AS:SkinScrollBar(GossipGreetingScrollFrame.ScrollBar)

	if AS.ParchmentEnabled then
		GossipGreetingScrollFrame.Background = GossipGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		GossipGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		GossipGreetingScrollFrame.Background:SetInside()
		GossipGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		local r, g, b = unpack(AS.ClassColor)

		for i = 1, NUMGOSSIPBUTTONS do
			_G["GossipTitleButton"..i]:GetFontString():SetTextColor(1, 1, 1)
			_G["GossipTitleButton"..i]:GetHighlightTexture():SetColorTexture(r, g, b, .3)
			_G["GossipTitleButton"..i]:GetHighlightTexture():SetInside(_G["GossipTitleButton"..i], 2, 0)
		end

		GossipGreetingText:SetTextColor(1, 1, 1)

		hooksecurefunc("GossipFrameUpdate", function()
			for i = 1, NUMGOSSIPBUTTONS do
				local button = _G["GossipTitleButton"..i]
				if button:GetFontString() then
					local Text = button:GetFontString():GetText()
					if Text and strfind(Text, '|cff000000') then
						button:GetFontString():SetText(string.gsub(Text, '|cff000000', '|cffffe519'))
					end
				end
			end
		end)
	end

	AS:SkinStatusBar(NPCFriendshipStatusBar)
end

function AS:Blizzard_Quest()
	AS:SkinFrame(QuestFrame)
	QuestFrame.portrait:SetAlpha(0)
	QuestFrame:SetHeight(500)

	AS:SkinCloseButton(QuestFrame.CloseButton)

	AS:StripTextures(QuestFrameDetailPanel, true)
	AS:StripTextures(QuestDetailScrollChildFrame, true)
	AS:StripTextures(QuestFrameProgressPanel, true)
	AS:StripTextures(QuestFrameGreetingPanel, true)
	AS:StripTextures(QuestFrameRewardPanel, true)
	AS:SkinFrame(QuestProgressScrollFrame)
	AS:SkinFrame(QuestRewardScrollFrame)
	AS:SkinBackdropFrame(QuestDetailScrollFrame, nil, nil, true)
	QuestDetailScrollFrame.Backdrop:SetPoint("TOPLEFT", 0, 0)
	QuestDetailScrollFrame.Backdrop:SetPoint("BOTTOMRIGHT", 4, 0)
	AS:SkinFrame(QuestGreetingScrollFrame)

	AS:SkinScrollBar(QuestDetailScrollFrameScrollBar)
	AS:SkinScrollBar(QuestNPCModelTextScrollFrameScrollBar)
	AS:SkinScrollBar(QuestGreetingScrollFrameScrollBar)
	AS:SkinScrollBar(QuestProgressScrollFrameScrollBar)
	AS:SkinScrollBar(QuestRewardScrollFrameScrollBar)

	AS:SkinButton(QuestFrameAcceptButton)
	AS:SkinButton(QuestFrameDeclineButton)
	AS:SkinButton(QuestFrameCompleteButton)
	AS:SkinButton(QuestFrameGoodbyeButton)
	AS:SkinButton(QuestFrameGreetingGoodbyeButton)
	AS:SkinButton(QuestFrameCompleteQuestButton)

	AS:StripTextures(QuestInfoItemHighlight)

	hooksecurefunc("QuestInfoItem_OnClick", function(self)
		self.Backdrop:SetBackdropBorderColor(1,.9,.1)
		self.Name:SetTextColor(1, .8, .1)

		for _, Button in ipairs(QuestInfoRewardsFrame.RewardButtons) do
			if (Button ~= self) then
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Name:SetTextColor(1, 1, 1)
			end
		end
	end)

	AS:SkinBackdropFrame(QuestInfoRewardsFrame.SkillPointFrame)
	AS:SkinTexture(QuestInfoRewardsFrame.SkillPointFrame.Icon, true)

	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('TOPLEFT', QuestInfoRewardsFrame.SkillPointFrame.Icon, 'TOPRIGHT', 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('BOTTOMLEFT', QuestInfoRewardsFrame.SkillPointFrame.Icon, 'BOTTOMRIGHT', 0, 0)
	QuestInfoRewardsFrame.SkillPointFrame.Backdrop:SetPoint('RIGHT', QuestInfoRewardsFrame.SkillPointFrame.NameFrame, 'RIGHT', -12, 0)

	QuestInfoRewardsFrame.SkillPointFrame.ValueText:SetDrawLayer('OVERLAY', 7)

	for i = 1, 6 do
		local Button = _G["QuestProgressItem"..i]
		AS:SkinBackdropFrame(Button)
		AS:SkinTexture(Button.Icon, true)

		Button.Backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
		Button.Backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
		Button.Backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
	end

	local function HandleReward(frame)
		if (not frame) then return end

		if frame.Icon then
			AS:SkinTexture(frame.Icon, true)

			AS:CreateBackdrop(frame)
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon, 'TOPRIGHT', -1, 0)
			frame.Backdrop:SetPoint('BOTTOMLEFT', frame.Icon, 'BOTTOMRIGHT', -1, 0)
			frame.Backdrop:SetPoint('RIGHT', frame, 'RIGHT', -5, 0)

			frame.Count:ClearAllPoints()
			frame.Count:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)
		end

		if frame.NameFrame then
			frame.NameFrame:SetAlpha(0)
		end

		if (frame.CircleBackground) then
			frame.CircleBackground:SetAlpha(0)
			frame.CircleBackgroundGlow:SetAlpha(0)
		end
	end

	local Rewards = { 'MoneyFrame', 'HonorFrame', 'XPFrame', 'SpellFrame', 'SkillPointFrame' }

	for _, frame in pairs(Rewards) do
		HandleReward(MapQuestInfoRewardsFrame[frame])
	end

	hooksecurefunc('QuestInfo_ShowRewards', function(self)
		for _, frame in pairs(Rewards) do
			HandleReward(QuestInfoFrame.rewardsFrame[frame])
		end
	end)

	hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
		local RewardButton = rewardsFrame.RewardButtons[index]

		if (not RewardButton.Backdrop) then
			AS:CreateBackdrop(RewardButton)

			AS:SkinTexture(RewardButton.Icon, true)

			RewardButton.IconBorder:SetAlpha(0)
			RewardButton.NameFrame:Hide()

			RewardButton.Backdrop:SetPoint('TOPLEFT', RewardButton.Icon, 'TOPRIGHT', 1, 0)
			RewardButton.Backdrop:SetPoint('BOTTOMLEFT', RewardButton.Icon, 'BOTTOMRIGHT', 1, 0)
			RewardButton.Backdrop:SetPoint('RIGHT', RewardButton, 'RIGHT', -5, 0)

			hooksecurefunc(RewardButton.IconBorder, 'SetVertexColor', function(self, r, g, b) RewardButton.Icon.Backdrop:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(RewardButton.IconBorder, 'Hide', function(self) RewardButton.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end)

	AS:SkinFrame(QuestNPCModel)
	AS:SkinBackdropFrame(QuestNPCModelTextFrame)
	QuestNPCModelTextFrame.Backdrop:SetPoint("TOPLEFT", QuestNPCModel, "BOTTOMLEFT", 0, -2)
	QuestNPCModelTextFrame.Backdrop:SetPoint("TOPRIGHT", QuestNPCModel, "BOTTOMRIGHT", 0, -2)

	AS:SkinFrame(QuestLogPopupDetailFrame)
	AS:SkinButton(QuestLogPopupDetailFrameAbandonButton)
	AS:SkinButton(QuestLogPopupDetailFrameShareButton)
	AS:SkinButton(QuestLogPopupDetailFrameTrackButton)
	AS:StripTextures(QuestLogPopupDetailFrameInset)
	AS:SkinBackdropFrame(QuestLogPopupDetailFrameScrollFrame)
	QuestLogPopupDetailFrameScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, 0)
	AS:SkinScrollBar(QuestLogPopupDetailFrameScrollFrameScrollBar)
	AS:SkinCloseButton(QuestLogPopupDetailFrameCloseButton)

	AS:StripTextures(QuestLogPopupDetailFrame.ShowMapButton)
	AS:SkinButton(QuestLogPopupDetailFrame.ShowMapButton)
	QuestLogPopupDetailFrame.ShowMapButton.Text:ClearAllPoints()
	QuestLogPopupDetailFrame.ShowMapButton.Text:SetPoint("CENTER", AS.Mult, 0)
	QuestLogPopupDetailFrame.ShowMapButton:SetSize(QuestLogPopupDetailFrame.ShowMapButton:GetWidth() - 30, QuestLogPopupDetailFrame.ShowMapButton:GetHeight() - 5)

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(QuestFrame, parentFrame, portrait, text, name, x, y)
		QuestNPCModel:ClearAllPoints()
		QuestNPCModel:SetPoint("TOPLEFT", QuestFrame, "TOPRIGHT", x + 10, y)
	end)

	if AS.ParchmentEnabled then
		QuestDetailScrollFrame.Background = QuestDetailScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestDetailScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestDetailScrollFrame.Background:SetInside()
		QuestDetailScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestGreetingScrollFrame.Background = QuestGreetingScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestGreetingScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestGreetingScrollFrame.Background:SetInside()
		QuestGreetingScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestProgressScrollFrame.Background = QuestProgressScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestProgressScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestProgressScrollFrame.Background:SetInside()
		QuestProgressScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestRewardScrollFrame.Background = QuestRewardScrollFrame:CreateTexture(nil, 'ARTWORK')
		QuestRewardScrollFrame.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestRewardScrollFrame.Background:SetInside()
		QuestRewardScrollFrame.Background:SetTexCoord(0, .585, 0.02, .655)
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background = QuestLogPopupDetailFrameScrollFrame.Backdrop:CreateTexture(nil, 'ARTWORK')
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetTexture('Interface\\QuestFrame\\QuestBG')
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetInside()
		QuestLogPopupDetailFrameScrollFrame.Backdrop.Background:SetTexCoord(0, .585, 0.02, .655)
	else
		GreetingText:SetTextColor(1, 1, 1)
		GreetingText.SetTextColor = AS.Noop
		CurrentQuestsText:SetTextColor(1, .8, .1)
		CurrentQuestsText.SetTextColor = AS.Noop
		AvailableQuestsText:SetTextColor(1, .8, .1)
		AvailableQuestsText.SetTextColor = AS.Noop

		for i = 1, 16 do
			local button = _G['QuestTitleButton'..i]
			if button then
				hooksecurefunc(button, 'SetFormattedText', function(self)
					if self:GetFontString() then
						local Text = self:GetFontString():GetText()
						if Text and strfind(Text, '|cff000000') then
							button:GetFontString():SetText(string.gsub(Text, '|cff000000', '|cffffe519'))
						end
					end
				end)
			end
		end

		hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)
			QuestInfoTitleHeader:SetTextColor(1, .8, .1)
			QuestInfoDescriptionHeader:SetTextColor(1, .8, .1)
			QuestInfoObjectivesHeader:SetTextColor(1, .8, .1)
			QuestInfoRewardsFrame.Header:SetTextColor(1, .8, .1)
			QuestInfoDescriptionText:SetTextColor(1, 1, 1)
			QuestInfoObjectivesText:SetTextColor(1, 1, 1)
			QuestInfoGroupSize:SetTextColor(1, 1, 1)
			QuestInfoRewardText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1)

			QuestInfoQuestType:SetTextColor(1, 1, 1)

			if QuestInfoRewardsFrame.SpellLearnText then
				QuestInfoRewardsFrame.SpellLearnText:SetTextColor(1, 1, 1)
			end

			QuestInfoRewardsFrame.spellHeaderPool.textR, QuestInfoRewardsFrame.spellHeaderPool.textG, QuestInfoRewardsFrame.spellHeaderPool.textB = 1, 1, 1

			QuestInfoRewardsFrame.PlayerTitleText:SetTextColor(1, 1, 1)
			QuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(1, 1, 1)
			local numObjectives = GetNumQuestLeaderBoards()
			local numVisibleObjectives = 0
			for i = 1, numObjectives do
				local _, type, finished = GetQuestLogLeaderBoard(i)
				if type ~= 'spell' then
					numVisibleObjectives = numVisibleObjectives + 1
					local objective = _G['QuestInfoObjective'..numVisibleObjectives]
					if objective then
						if finished then
							objective:SetTextColor(1, .8, .1)
						else
							objective:SetTextColor(0.6, 0.6, 0.6)
						end
					end
				end
			end

			QuestInfo_ShowRequiredMoney()
		end)

		hooksecurefunc('QuestInfo_ShowRequiredMoney', function()
			local requiredMoney = GetQuestLogRequiredMoney()
			if requiredMoney > 0 then
				if requiredMoney > GetMoney() then
					QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
				else
					QuestInfoRequiredMoneyText:SetTextColor(1, .8, .1)
				end
			end
		end)

		hooksecurefunc("QuestFrameProgressItems_Update", function()
			QuestProgressTitleText:SetTextColor(1, .8, .1)
			QuestProgressText:SetTextColor(1, 1, 1)
			QuestProgressRequiredItemsText:SetTextColor(1, .8, .1)
			QuestProgressRequiredMoneyText:SetTextColor(1, .8, .1)
		end)

		for i = 1, C_QuestLog.GetMaxNumQuestsCanAccept() do
			local button = _G['QuestTitleButton'..i]
			if button then
				hooksecurefunc(button, 'SetFormattedText', function()
					if button:GetFontString() then
						if button:GetFontString():GetText() and button:GetFontString():GetText():find('|cff000000') then
							button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), '|cff000000', '|cffffe519'))
						end
					end
				end)
			end
		end

		if (QuestInfoRewardsFrame.spellHeaderPool) then
			for _, pool in pairs({"followerRewardPool", "spellRewardPool"}) do
				QuestInfoRewardsFrame[pool]._acquire = QuestInfoRewardsFrame[pool].Acquire
				QuestInfoRewardsFrame[pool].Acquire = function(self)
					local frame = QuestInfoRewardsFrame[pool]:_acquire()
					frame.Name:SetTextColor(1, 1, 1)
					return frame
				end
			end
			QuestInfoRewardsFrame.spellHeaderPool._acquire = QuestInfoRewardsFrame.spellHeaderPool.Acquire
			QuestInfoRewardsFrame.spellHeaderPool.Acquire = function(self)
				local frame = self:_acquire()
				frame:SetTextColor(1, 1, 1)
				return frame
			end
		end
	end
end

function AS:Blizzard_WorldMap()
	AS:SkinBackdropFrame(WorldMapFrame)
	AS:CreateShadow(WorldMapFrame.Backdrop)
	AS:SkinCloseButton(WorldMapFrameCloseButton)

	WorldMapFrame.BorderFrame.Tutorial:Kill()

	AS:StripTextures(WorldMapFrame.NavBar)
	AS:StripTextures(WorldMapFrame.NavBar.overlay)

	AS:SkinButton(WorldMapFrameHomeButton)
	WorldMapFrameHomeButton.xoffset = 1
	WorldMapFrameHomeButton:SetPoint('LEFT', -60, 0)
	WorldMapFrameHomeButton.text:SetFont(AS.Font, 13)
	WorldMapFrameHomeButton.text:ClearAllPoints()
	WorldMapFrameHomeButton.text:SetPoint('CENTER')

	AS:SkinScrollBar(QuestScrollFrameScrollBar)

	AS:SkinButton(QuestMapFrame.DetailsFrame.BackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.AbandonButton)
	--AS:SkinButton(QuestMapFrame.DetailsFrame.IgnoreButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	AS:SkinButton(QuestMapFrame.DetailsFrame.TrackButton)
	AS:SkinButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)

	AS:SkinFrame(QuestMapFrame.QuestsFrame.StoryTooltip)
	AS:StripTextures(QuestMapFrame.DetailsFrame.CompleteQuestFrame)

	AS:SkinMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)

	if not AS.ParchmentEnabled then
		AS:StripTextures(QuestMapFrame.DetailsFrame, true)
		AS:StripTextures(QuestMapFrame.DetailsFrame.RewardsFrame)
		AS:SkinScrollBar(QuestMapFrame.DetailsFrame.ScrollFrame.ScrollBar)
	end
end

AS:RegisterSkin("Blizzard_AlliedRacesUI", AS.Blizzard_AlliedRacesUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)
AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)
AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)
