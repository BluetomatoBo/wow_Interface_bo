local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetTracker') then return end

local name = "PetTrackerSkin"
function AS:SkinPetTracker()
	if not IsAddOnLoaded('Carbonite.Quests') then
		--PetTrackerProgressBar:CreateBackdrop()
		AS:Delay(1, function()
			PetTrackerProgressBar1.Overlay:StripTextures(true)
			PetTrackerProgressBar1.Overlay:CreateBackdrop()
			local Backdrop = PetTrackerProgressBar1.Overlay.backdrop or PetTrackerProgressBar1.Overlay.Backdrop
			Backdrop:SetBackdropColor(0,0,0,0)
			for i = 1, PetTracker.MaxQuality do
				PetTrackerProgressBar1[i]:SetStatusBarTexture(AS.NormTex)
			end
		end)
	end

	PetTrackerMapFilter:StripTextures(true)
	AS:SkinEditBox(PetTrackerMapFilter)
	AS:SkinTooltip(PetTrackerMapFilterSuggestions)
	for i = 1, PetTrackerMapFilterSuggestions:GetNumChildren() do
		local Button = select(i, PetTrackerMapFilterSuggestions:GetChildren())
		Button:SetFrameLevel(PetTrackerMapFilterSuggestions:GetFrameLevel() + 1)
	end

	WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button:HookScript('OnClick', function(self)
		SushiDropdownFrame1:ClearAllPoints()
		SushiDropdownFrame1:SetPoint('BOTTOMRIGHT', self, 'TOPRIGHT', 0, 4)
		if SushiDropdownFrame1.IsDone then return end
		for i = 1, SushiDropdownFrame1:GetNumChildren() do
			local Region = select(i, SushiDropdownFrame1:GetChildren())
			if Region:IsObjectType('Frame') then
				Region:SetBackdrop(nil)
				Region.SetBackdrop = AS.Noop
				SushiDropdownFrame1:CreateBackdrop()
				SushiDropdownFrame1.IsDone = true
			end
		end
	end)

	for i = 1, 6 do
        local button = _G["PetTrackerAbilityAction"..i]
        if button then
            AS:SkinIconButton(button)
			AS:SkinTexture(button.Icon)
        end
    end

	if AS:CheckAddOn('PetTracker_Switcher') then
		AS:SkinFrame(PetTrackerSwap)
		AS:SkinCloseButton(PetTrackerSwapCloseButton)
		PetTrackerSwap:HookScript('OnUpdate', function(self)
			PetTrackerSwapInset:StripTextures()
			for i = 1, self:GetNumChildren() do
				local Region = select(i, self:GetChildren())
				if Region and Region:IsObjectType('Frame') and not Region.IsSkinned then
					local a, b, c, d, e = Region:GetPoint()
					if a == 'TOP' and c == 'TOP' and d == 0 and e == 2 then
						Region:Kill()
						Region.IsSkinned = true
					end
				end
			end
			for i = 1, 6 do
				if not _G['PetTrackerBattleSlot'..i].IsSkinned then
					_G['PetTrackerBattleSlot'..i]:SetTemplate('Transparent')
					_G['PetTrackerBattleSlot'..i].Bg:Hide()
					AS:SkinTexture(_G['PetTrackerBattleSlot'..i].Icon)
					_G['PetTrackerBattleSlot'..i].IconBorder:Hide()
					_G['PetTrackerBattleSlot'..i].Quality:Hide()
					_G['PetTrackerBattleSlot'..i].Highlight:StripTextures()
					_G['PetTrackerBattleSlot'..i].Highlight:HookScript('OnShow', function() _G['PetTrackerBattleSlot'..i]:SetBackdropBorderColor(1, 1, 0) end)
					_G['PetTrackerBattleSlot'..i].Highlight:HookScript('OnHide', function() _G['PetTrackerBattleSlot'..i]:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
					AS:SkinStatusBar(_G['PetTrackerBattleSlot'..i].Health)
					AS:SkinStatusBar(_G['PetTrackerBattleSlot'..i].Xp)
					_G['PetTrackerBattleSlot'..i].IsSkinned = true
				end
			end
			for i = 1, 45 do
				local Ability = _G['PetTrackerAbilityButton'..i]
				if Ability and not Ability.IsSkinned then
					for i = 1, Ability:GetNumRegions() do
						local Region = select(i, Ability:GetRegions())
						if Region and Region:IsObjectType('Texture') then
							if Region:GetTexture() == 'Interface\\Spellbook\\Spellbook-Parts' then
								Region:SetTexture(nil)
							end
						end
					end
					AS:SkinTexture(Ability.Icon)
					Ability.IsSkinned = true
				end
			end
		end)
	end
	if AS:CheckAddOn('PetTracker_Journal') then
		LoadAddOn('Blizzard_PetJournal')
		AS:SkinCheckBox(PetTracker_JournalTrackToggle)
		AS:SkinTab(PetJournalParentTab3)
		PetTrackerTamerJournal:HookScript('OnShow', function(self)
			if not self.IsSkinned then
				PetTrackerTamerJournal.Count:StripTextures()
				PetTrackerTamerJournal.ListInset:StripTextures()
				AS:SkinEditBox(PetTrackerTamerJournalSearchBox)
				AS:SkinScrollBar(PetTrackerTamerJournalListScrollBar)
				AS:SkinFrame(PetTrackerTamerJournalCard)
				PetTrackerTamerJournal.Team.Border:StripTextures()
				for i = 1, 11 do
					local b = _G["PetTrackerTamerJournalListButton"..i]
					b:StripTextures()
					b:StyleButton()
					b.model:SetTemplate()
					b.model.quality:Hide()
					hooksecurefunc(PetTrackerTamerJournalList, 'update', function(...) b.model:SetBackdropBorderColor(b.model.quality:GetVertexColor()) end)
					b.model.levelRing:SetAlpha(0)
				end
				self.IsSkinned = true
				for i = 1, 3 do
					_G['PetTrackerJournalSlot'..i]:SetTemplate('Transparent')
					_G['PetTrackerJournalSlot'..i].Bg:Hide()
					_G['PetTrackerJournalSlot'..i].Quality:Hide()
					_G['PetTrackerJournalSlot'..i].Hover:Kill()
					--_G['PetTrackerJournalSlot'..i..'Highlight']:Kill()
 					AS:SkinTexture(_G['PetTrackerJournalSlot'..i].Icon)
					_G['PetTrackerJournalSlot'..i].IconBorder:Hide()
					_G['PetTrackerJournalSlot'..i].LevelBG:Hide()
					_G['PetTrackerJournalSlot'..i].IsSkinned = true
					for i = 1, 15 do
						local Ability = _G['PetTrackerAbilityButton'..i]
						for i = 1, Ability:GetNumRegions() do
							local Region = select(i, Ability:GetRegions())
							if Region and Region:IsObjectType('Texture') then
								if Region:GetTexture() == 'Interface\\Spellbook\\Spellbook-Parts' then
									Region:SetTexture(nil)
								end
							end
						end
						_G['PetTrackerAbilityButton'..i]:StyleButton()
						AS:SkinTexture(_G['PetTrackerAbilityButton'..i].Icon)
					end
				end
			end
		end)
	end
	for i = 1, 2 do
		local MapTip = _G['PetTrackerMapTip'..i]
		if MapTip then
			AS:SkinTooltip(MapTip)
			MapTip:HookScript('OnUpdate', function(self)
				for i = 1, self:NumLines() do
					local Line = self:GetLine(i)
					local Texture, Text = strmatch(Line:GetText(), '^|T(.-)|t(.+)')
					if Texture then
						Texture = strsplit(':', Texture)
						self:GetLine(i):SetFormattedText('|T%s:20:20:0:0:64:64:4:60:4:60|t %s', Texture, Text)
					end
				end
			end)
		end
	end
end

AS:RegisterSkin(name, AS.SkinPetTracker)