local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'FactionizerSkin'
function AS:SkinFactionizer()
	local StripAllTextures = {
		FIZ_ReputationDetailFrame,
		FIZ_OptionsFrame,
	}

	local SetTemplateT = {
		FIZ_OptionsFrame,
		FIZ_ReputationDetailFrame,
	}	

	local buttons = {
		FIZ_OptionsButton,
		FIZ_ShowAllButton,
		FIZ_ExpandButton,
		FIZ_ShowNoneButton,
		FIZ_CollapseButton,
		FIZ_SupressNoneFactionButton,
		FIZ_SupressNoneGlobalButton,
		FIZ_ClearSessionGainButton,
	}

	local checkboxes = {
		FIZ_OrderByStandingCheckBox,
		FIZ_EnableMissingBox,
		FIZ_ExtendDetailsBox,
		FIZ_GainToChatBox,
		FIZ_NoGuildGainBox,
		FIZ_SupressOriginalGainBox,
		FIZ_ShowPreviewRepBox,
		FIZ_SwitchFactionBarBox,
		FIZ_SilentSwitchBox,
		FIZ_NoGuildSwitchBox,
		FIZ_ReputationDetailInactiveCheckBox,
		FIZ_ReputationDetailMainScreenCheckBox,
		FIZ_ShowQuestButton,
		FIZ_ShowInstancesButton,
		FIZ_ShowMobsButton,
		FIZ_ShowItemsButton,
		FIZ_ShowGeneralButton,
	}

	for _, object in pairs(StripAllTextures) do
		object:StripTextures()
	end	

	for _, object in pairs(SetTemplateT) do
		AS:SkinFrame(object)
	end			

	for _, button in pairs(buttons) do
		AS:SkinButton(button)
	end		

	for _, checkbox in pairs(checkboxes) do
		AS:SkinCheckBox(checkbox)
	end	

	FIZ_ReputationDetailAtWarCheckBox:StripTextures()
	FIZ_ReputationDetailAtWarCheckBox:CreateBackdrop()
	FIZ_ReputationDetailAtWarCheckBox.backdrop:SetInside(FIZ_ReputationDetailAtWarCheckBox, 0, 0)
	FIZ_ReputationDetailAtWarCheckBox:SetScript('OnUpdate', function(frame)
		if frame.SetCheckedTexture then
			frame:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
		end
		if frame.SetDisabledCheckedTexture then
			frame:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')
		end
	end)

	FIZ_OptionsFrame:CreateShadow('Default')
	AS:SkinCloseButton(FIZ_OptionsFrameClose)
	AS:SkinCloseButton(FIZ_ReputationDetailCloseButton)
	AS:SkinScrollBar(FIZ_UpdateListScrollFrameScrollBar, 5)

	for i = 1, 15 do
		AS:Desaturate(_G['ReputationBar'..i..'ExpandOrCollapseButton'])
	end

	for i = 1, 13 do
		AS:Desaturate(_G['FIZ_UpdateEntry'..i])
	end

	FIZ_OptionsFrameClose:Point('TOPRIGHT', FIZ_OptionsFrame, 'TOPRIGHT', 4, 5)
	FIZ_OptionsFrame:SetWidth(360)
	FIZ_ReputationDetailCloseButton:Point('TOPRIGHT', FIZ_ReputationDetailFrame, 'TOPRIGHT', 4, 5)
	FIZ_ShowNoneButton:Point('TOPLEFT', FIZ_ReputationDetailDivider3, 'BOTTOMLEFT', 230, -5)
	FIZ_SupressNoneGlobalButton:Point('TOPLEFT', FIZ_SupressNoneFactionButton, 'BOTTOMLEFT', 0, -5)
	FIZ_ReputationDetailFrame:Point('TOPLEFT', ReputationFrame, 'TOPRIGHT', 5, 0)
	FIZ_OptionsFrame:Point('TOPLEFT', ReputationFrame, 'TOPRIGHT', 5, 0)
end

AS:RegisterSkin(name, AS.SkinFactionizer)