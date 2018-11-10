local AS = unpack(AddOnSkins)

function AS:Blizzard_BarbershopUI(event, addon)
	if addon ~= "Blizzard_BarbershopUI" then return end

	AS:SkinFrame(BarberShopFrame)
	BarberShopFrame:SetSize(BarberShopFrame:GetWidth() - 30, BarberShopFrame:GetHeight() - 56)

	AS:StripTextures(BarberShopFrameMoneyFrame)

	AS:SkinButton(BarberShopFrameOkayButton, true)
	AS:SkinButton(BarberShopFrameCancelButton, true)
	AS:SkinButton(BarberShopFrameResetButton, true)

	for i = 1, #BarberShopFrame.Selector do
		local selector = BarberShopFrame.Selector[i]
		local previousSelector = BarberShopFrame.Selector[i-1]

		if selector then
			selector:StripTextures()

			AS:SkinArrowButton(selector.Prev, nil, true)
			AS:SkinArrowButton(selector.Next)

			if i ~= 1 then
				selector:ClearAllPoints()
				selector:Point("TOP", previousSelector, "BOTTOM", 0, -3)
			end
		end
	end

	BarberShopFrameOkayButton:ClearAllPoints()
	BarberShopFrameOkayButton:SetPoint("RIGHT", BarberShopFrame, "BOTTOM", 0, 50)

	BarberShopFrameResetButton:ClearAllPoints()
	BarberShopFrameResetButton:SetPoint("CENTER", BarberShopFrame, 'BOTTOM', 0, 20)

	BarberShopBannerFrameBGTexture:Kill()
	BarberShopBannerFrame:Kill()

	AS:SkinFrame(BarberShopAltFormFrame)
	BarberShopAltFormFrame:SetPoint("BOTTOM", BarberShopFrame, "TOP", 0, 5)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_BarbershopUI', AS.Blizzard_BarbershopUI, 'ADDON_LOADED')
