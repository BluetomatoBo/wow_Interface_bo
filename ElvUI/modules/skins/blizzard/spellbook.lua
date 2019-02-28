local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.spellbook ~= true then return end

	local SpellBookFrame = _G.SpellBookFrame
	S:HandlePortraitFrame(SpellBookFrame, true)

	for _, object in pairs({ "SpellBookSpellIconsFrame", "SpellBookSideTabsFrame", "SpellBookPageNavigationFrame" }) do
		_G[object]:StripTextures()
	end

	if E.global.general.disableTutorialButtons then
		_G.SpellBookFrameTutorialButton:Kill()
	end

	if E.private.skins.parchmentRemover.enable then
		_G.SpellBookPage1:SetAlpha(0)
		_G.SpellBookPage2:SetAlpha(0)
		_G.SpellBookPageText:SetTextColor(0.6, 0.6, 0.6)
	else
		local pagebackdrop = CreateFrame("Frame", nil, SpellBookFrame)
		pagebackdrop:SetTemplate()
		pagebackdrop:Point("TOPLEFT", _G.SpellBookPage1, "TOPLEFT", -2, 2)
		pagebackdrop:Point("BOTTOMRIGHT", SpellBookFrame, "BOTTOMRIGHT", -8, 4)
		SpellBookFrame.pagebackdrop = pagebackdrop
		for i = 1, 2 do
			_G['SpellBookPage'..i]:SetParent(pagebackdrop)
			_G['SpellBookPage'..i]:SetDrawLayer('BACKGROUND', 3)
		end
	end

	S:HandleNextPrevButton(_G.SpellBookPrevPageButton, nil, nil, true)
	S:HandleNextPrevButton(_G.SpellBookNextPageButton, nil, nil, true)

	_G.SpellBookPageText:ClearAllPoints()
	_G.SpellBookPageText:SetPoint("RIGHT", _G.SpellBookPrevPageButton, "LEFT", -5, 0)

	for i = 1, _G.SPELLS_PER_PAGE do
		local button = _G["SpellButton"..i]
		local icon = _G["SpellButton"..i.."IconTexture"]
		local highlight =_G["SpellButton"..i.."Highlight"]

		for j = 1, button:GetNumRegions() do
			local region = select(j, button:GetRegions())
			if region:IsObjectType("Texture") then
				if region ~= button.FlyoutArrow and region ~= button.GlyphIcon and region ~= button.GlyphActivate
					and region ~= button.AbilityHighlight and region ~= button.SpellHighlightTexture then
					region:SetTexture()
				end
			end
		end

		S:HandleIcon(icon)
		icon:SetInside()
		E:RegisterCooldown(_G["SpellButton"..i.."Cooldown"])
		button:SetTemplate("Default", true)

		if button.SpellHighlightTexture then
			button.SpellHighlightTexture:SetColorTexture(0.8, 0.8, 0, 0.6)
			if icon then
				button.SpellHighlightTexture:SetOutside(button)
			end
			E:Flash(button.SpellHighlightTexture, 1, true)
		end

		if button.shine then
			button.shine:ClearAllPoints()
			button.shine:Point('TOPLEFT', button, 'TOPLEFT', -3, 3)
			button.shine:Point('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 3, -3)
		end

		highlight:SetAllPoints(icon)
		hooksecurefunc(highlight, "SetTexture", function(self, texture)
			if texture == "Interface\\Buttons\\ButtonHilight-Square" then
				self:SetColorTexture(1, 1, 1, 0.3)
			end
		end)
	end

	hooksecurefunc("SpellButton_UpdateButton", function()
		for i = 1, _G.SPELLS_PER_PAGE do
			local button = _G["SpellButton"..i]
			local icon = _G["SpellButton"..i.."IconTexture"]

			if button.SpellHighlightTexture then
				button.SpellHighlightTexture:SetColorTexture(0.8, 0.8, 0, 0.6)
				if icon then
					button.SpellHighlightTexture:SetOutside(button.backdrop)
				end
				E:Flash(button.SpellHighlightTexture, 1, true)
			end
			if E.private.skins.parchmentRemover.enable then
				button:SetHighlightTexture('')
				local r = button.SpellName:GetTextColor()
				if r < 0.8 then
					button.SpellName:SetTextColor(0.6, 0.6, 0.6)
				else
					button.SpellName:SetTextColor(1, 1, 1)
				end
				button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)
				button.RequiredLevelString:SetTextColor(0.6, 0.6, 0.6)
			end
		end
	end)

	_G.SpellBookSkillLineTab1:SetPoint('TOPLEFT', '$parent', 'TOPRIGHT', E.PixelMode and 0 or E.Border + E.Spacing, -36)

	for i = 1, 8 do
		local Tab = _G["SpellBookSkillLineTab"..i]
		Tab:StripTextures()
		Tab:SetTemplate()
		Tab:StyleButton(nil, true)
	end

	hooksecurefunc("SpellBookFrame_UpdateSkillLineTabs", function()
		for i = 1, 8 do
			local Tab = _G["SpellBookSkillLineTab"..i]
			if Tab:GetNormalTexture() then
				S:HandleIcon(Tab:GetNormalTexture())
				Tab:GetNormalTexture():SetInside()
			end
		end
	end)

	--Profession Tab
	for _, Frame in pairs({ _G.SpellBookProfessionFrame:GetChildren() }) do
		Frame.missingHeader:SetTextColor(1, 1, 0)

		if E.private.skins.parchmentRemover.enable then
			Frame.missingText:SetTextColor(1, 1, 1)
		else
			Frame.missingText:SetTextColor(0, 0, 0)
		end

		S:HandleStatusBar(Frame.statusBar, {0, .86, 0})
		Frame.statusBar.rankText:SetPoint("CENTER")

		local a, b, c, _, e = Frame.statusBar:GetPoint()
		Frame.statusBar:SetPoint(a, b, c, 0, e)

		if a == 'BOTTOMLEFT' then
			Frame.rank:SetPoint("BOTTOMLEFT", Frame.statusBar, "TOPLEFT", 0, 4)
		end

		if Frame.icon then
			Frame.professionName:SetPoint("TOPLEFT", 100, -4)
			Frame:StripTextures()
			S:HandleIcon(Frame.icon, true)
			Frame.icon:SetAlpha(1)
			Frame.icon:SetDesaturated(false)
		end

		for i = 1, 2 do
			S:HandleButton(Frame['button'..i], true)
			--Frame['button'..i]:StyleButton()

			if Frame['button'..i].iconTexture then
				S:HandleIcon(Frame['button'..i].iconTexture)
				Frame['button'..i].iconTexture:SetInside()
			end

			Frame['button'..i].highlightTexture:SetInside()
			hooksecurefunc(Frame['button'..i].highlightTexture, "SetTexture", function(self, texture)
				if texture == "Interface\\Buttons\\ButtonHilight-Square" then
					self:SetColorTexture(1, 1, 1, 0.3)
				end
			end)
		end
	end

	--Bottom Tabs
	for i = 1, 5 do
		S:HandleTab(_G["SpellBookFrameTabButton"..i])
	end

	_G.SpellBookFrameTabButton1:ClearAllPoints()
	_G.SpellBookFrameTabButton1:Point('TOPLEFT', SpellBookFrame, 'BOTTOMLEFT', 0, 2)
end

S:AddCallback("Spellbook", LoadSkin)
