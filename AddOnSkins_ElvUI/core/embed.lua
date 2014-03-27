local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow

local ChatHeight, ChatWidth = E.db.chat.panelHeight, E.db.chat.panelWidth

function AS:GetChatWindowInfo()
	local ChatTabInfo = {}
	for i = 1, NUM_CHAT_WINDOWS do
		local tab = _G["ChatFrame"..i.."Tab"];

		ChatTabInfo["ChatFrame"..i] = tab:GetText()
	end
	return ChatTabInfo
end

function AS:CreateEmbedSystem()
	if not AS.EmbedSystemCreated then
		EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
		EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
		EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

		EmbedSystem_MainWindow:SetScript('OnShow', AS.Embed_Show)
		EmbedSystem_MainWindow:SetScript('OnHide', AS.Embed_Hide)

		hooksecurefunc(RightChatPanel, 'SetSize', function()
			if ChatHeight ~= E.db.chat.panelHeight or ChatWidth ~= E.db.chat.panelWidth then
				ChatHeight, ChatWidth = E.db.chat.panelHeight, E.db.chat.panelWidth
				AS:EmbedSystem_WindowResize()
				AS:Embed_Check()
			end
		end)

		RightChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if not AS:CheckOption('EmbedLeftChat') then
					if EmbedSystem_MainWindow:IsShown() then
						EmbedSystem_MainWindow:Hide()
					else
						EmbedSystem_MainWindow:Show()
					end
				end
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		RightChatToggleButton:HookScript('OnEnter', function(self, ...)
			if not AS:CheckOption('EmbedLeftChat') then
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)

		LeftChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if AS:CheckOption('EmbedLeftChat') then
					if EmbedSystem_MainWindow:IsShown() then
						EmbedSystem_MainWindow:Hide()
					else
						EmbedSystem_MainWindow:Show()
					end
				end
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		LeftChatToggleButton:HookScript('OnEnter', function(self, ...)
			if AS:CheckOption('EmbedLeftChat') then
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)
		AS.EmbedSystemCreated = true
	end
end

function AS:EmbedInit()
	if AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual') then
		AS:CreateEmbedSystem()
		AS:Embed_Check(true)
	end
end

function AS:Embed_Show()
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Show() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Show()
		EmbedSystem_RightWindow:Show()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Show() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Show() end
	end
end

function AS:Embed_Hide()
	EmbedSystem_LeftWindow:Hide()
	EmbedSystem_RightWindow:Hide()
end

function AS:EmbedSystem_WindowResize()
	if UnitAffectingCombat('player') then return end
	local DataTextSize = AS:CheckOption('EmbedLeftChat') and E.db.datatexts.leftChatPanel and LeftChatDataPanel:GetHeight() or E.db.datatexts.rightChatPanel and RightChatDataPanel:GetHeight() or 0
	local ChatTabSize = AS:CheckOption('EmbedBelowTop') and RightChatTab:GetHeight() or 0
	local Width = E.PixelMode and 6 or 10
	local Height = E.PixelMode and 2 or 4
	local Spacing = E.PixelMode and 6 or 8
	local Total = AS.SLE and (Spacing + ChatTabSize + (E.PixelMode and 3 or 5)) or ((E.PixelMode and 11 or 16) + ChatTabSize + DataTextSize)

	local ChatPanel = AS:CheckOption('EmbedLeftChat') and LeftChatPanel or RightChatPanel

	EmbedSystem_MainWindow:SetParent(ChatPanel)

	EmbedSystem_MainWindow:SetSize(ChatPanel:GetWidth() - Width, ChatPanel:GetHeight() - Total)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth'), EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	EmbedSystem_LeftWindow:SetPoint('LEFT', EmbedSystem_MainWindow, 'LEFT', 0, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_MainWindow:SetPoint('BOTTOM', ChatPanel, 'BOTTOM', 0, (AS.SLE and (Spacing - 1) or (Spacing + DataTextSize)))

	-- Dynamic Range
	if IsAddOnLoaded('ElvUI_Config') then
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end

function AS:Embed_Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end
	if not AS.EmbedSystemCreated then
		AS:CreateEmbedSystem()
		Message = true
	end
	AS:Embed_Toggle(Message)
	if not UnitAffectingCombat('player') then
		if AS:CheckOption('EmbedOoC') then
			AS:Embed_Hide()
		else
			AS:Embed_Show()
		end
	end
	local MainEmbed, LeftEmbed, RightEmbed = AS:CheckOption('EmbedMain'), AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')
	if AS:CheckOption('EmbedOmen', 'Omen') and (strmatch(MainEmbed, 'Omen') or strmatch(LeftEmbed, 'Omen') or strmatch(RightEmbed, 'Omen')) then AS:Embed_Omen() end
	if AS:CheckOption('EmbedSkada', 'Skada') and (strmatch(MainEmbed, 'Skada') or strmatch(LeftEmbed, 'Skada') or strmatch(RightEmbed, 'Skada')) then AS:Embed_Skada() end
	if AS:CheckOption('EmbedTinyDPS', 'TinyDPS') and (strmatch(MainEmbed, 'TinyDPS') or strmatch(LeftEmbed, 'TinyDPS') or strmatch(RightEmbed, 'TinyDPS')) then AS:Embed_TinyDPS() end
	if AS:CheckOption('EmbedRecount', 'Recount') and (strmatch(MainEmbed, 'Recount') or strmatch(LeftEmbed, 'Recount') or strmatch(RightEmbed, 'Recount')) then AS:Embed_Recount() end
	if AS:CheckOption('EmbedalDamageMeter', 'alDamageMeter') and (strmatch(MainEmbed, 'alDamageMeter') or strmatch(LeftEmbed, 'alDamageMeter') or strmatch(RightEmbed, 'alDamageMeter')) then AS:Embed_alDamageMeter() end
	AS:EmbedSystem_WindowResize()
end

function AS:Embed_Toggle(Message)
	local MainEmbed, LeftEmbed, RightEmbed = 'NONE', 'NONE', 'NONE'
	EmbedSystem_MainWindow.FrameName = nil
	EmbedSystem_LeftWindow.FrameName = nil
	EmbedSystem_RightWindow.FrameName = nil
	if AS:CheckOption('EmbedSystem') then
		local MainLowered = strlower(AS:CheckOption('EmbedMain'))
		local MainOption = MainLowered == 'skada' and 'Skada' or MainLowered == 'omen' and 'Omen' or MainLowered == 'recount' and 'Recount' or MainLowered == 'tinydps' and 'TinyDPS' or MainLowered == 'aldamagemeter' and 'alDamageMeter' or nil
		if MainOption then AS:SetOption('EmbedMain', MainOption) end
		MainEmbed = AS:CheckOption('EmbedMain')
		if MainEmbed ~= 'Skada' and MainEmbed ~= 'Omen' and MainEmbed ~= 'Recount' and MainEmbed ~= 'TinyDPS' and MainEmbed ~= 'alDamageMeter' then
			EmbedSystem_MainWindow.FrameName = MainEmbed
		end
	end
	if AS:CheckOption('EmbedSystemDual') then
		local LeftLowered, RightLowered = strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight'))
		local LeftOption = LeftLowered == 'skada' and 'Skada' or LeftLowered == 'omen' and 'Omen' or LeftLowered == 'recount' and 'Recount' or LeftLowered == 'tinydps' and 'TinyDPS' or LeftLowered == 'aldamagemeter' and 'alDamageMeter' or nil
		local RightOption = RightLowered == 'skada' and 'Skada' or RightLowered == 'omen' and 'Omen' or RightLowered == 'recount' and 'Recount' or RightLowered == 'tinydps' and 'TinyDPS' or RightLowered == 'aldamagemeter' and 'alDamageMeter' or nil
		if LeftOption then AS:SetOption('EmbedLeft', LeftOption) end
		if RightOption then AS:SetOption('EmbedRight', RightOption) end
		LeftEmbed, RightEmbed = AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')
		if LeftEmbed ~= 'Skada' and LeftEmbed ~= 'Omen' and LeftEmbed ~= 'Recount' and LeftEmbed ~= 'TinyDPS' and LeftEmbed ~= 'alDamageMeter' then
			EmbedSystem_LeftWindow.FrameName = LeftEmbed
		end
		if RightEmbed ~= 'Skada' and RightEmbed ~= 'Omen' and RightEmbed ~= 'Recount' and RightEmbed ~= 'TinyDPS' and RightEmbed ~= 'alDamageMeter' then
			EmbedSystem_RightWindow.FrameName = RightEmbed
		end
	end
	local Frame = nil
	if EmbedSystem_MainWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_MainWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_MainWindow)
			Frame:SetInside(EmbedSystem_MainWindow, 0, 0)
		end
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_LeftWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_LeftWindow)
			Frame:SetInside(EmbedSystem_LeftWindow, 0, 0)
		end
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_RightWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_RightWindow)
			Frame:SetInside(EmbedSystem_RightWindow, 0, 0)
		end
	end
	AS:DisableOption('EmbedalDamageMeter')
	AS:DisableOption('EmbedOmen')
	AS:DisableOption('EmbedRecount')
	AS:DisableOption('EmbedTinyDPS')
	AS:DisableOption('EmbedSkada')
	if MainEmbed == 'Skada' or LeftEmbed == 'Skada' or RightEmbed == 'Skada' then
		AS:EnableOption('EmbedSkada')
	end
	if MainEmbed == 'Omen' or LeftEmbed == 'Omen' or RightEmbed == 'Omen' then
		AS:EnableOption('EmbedOmen')
	end
	if MainEmbed == 'Recount' or LeftEmbed == 'Recount' or RightEmbed == 'Recount' then
		AS:EnableOption('EmbedRecount')
	end
	if MainEmbed == 'TinyDPS' or LeftEmbed  == 'TinyDPS' or RightEmbed == 'TinyDPS' then
		AS:EnableOption('EmbedTinyDPS')
	end
	if MainEmbed == 'alDamageMeter' or LeftEmbed  == 'alDamageMeter' or RightEmbed == 'alDamageMeter' then
		AS:EnableOption('EmbedalDamageMeter')
	end
	if Message then
		local Message = format("Main: '%s'", AS:CheckOption('EmbedMain'))
		if AS:CheckOption('EmbedSystemDual') then Message = format("Left: '%s' | Right: '%s'", AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')) end
		AS:Print(format('Embed System: - %s', Message))
	end
end

function AS:Embed_Recount()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Recount' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = 'Recount_MainWindow'

	Recount_MainWindow:SetParent(EmbedParent)
	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 6)
	Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	local Backdrop = Recount.MainWindow.backdrop
	if AS:CheckOption('RecountBackdrop') then
		Backdrop:Show()
		Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	else
		Backdrop:Hide()
	end

	Recount.db.profile.Locked = true
	Recount.db.profile.Scaling = 1
	Recount.db.profile.ClampToScreen = true
	Recount.db.profile.FrameStrata = '2-LOW'
	Recount:SetStrataAndClamp()
	Recount:LockWindows(true)
	Recount:ResizeMainWindow()
end

function AS:Embed_Omen()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = 'OmenAnchor'

	local db = Omen.db
	db.profile.Scale = 1
	db.profile.Bar.Spacing = 1
	db.profile.Background.EdgeSize = 2
	db.profile.Background.BarInset = 2
	db.profile.TitleBar.UseSameBG = true
	db.profile.ShowWith.UseShowWith = false
	db.profile.Locked = true
	db.profile.TitleBar.ShowTitleBar = true
	db.profile.FrameStrata = '2-LOW'
	Omen:OnProfileChanged(nil, db)

	OmenAnchor:StripTextures()
	AS:SkinTitleBar(OmenTitle, 'Default')

	if AS:CheckOption('OmenBackdrop') then
		AS:SkinFrame(OmenBarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	else
		OmenBarList:StripTextures()
	end

	OmenAnchor:SetParent(EmbedParent)
	OmenAnchor:ClearAllPoints()
	OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end

function AS:Embed_TinyDPS()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = 'tdpsFrame'

	AS:SkinFrame(tdpsFrame, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	tdpsFrame:SetParent(EmbedParent)
	tdpsFrame:SetFrameStrata('LOW')
	tdpsAnchor:ClearAllPoints()
	tdpsAnchor:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	tdpsAnchor:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	tdps.hideOOC = false
	tdps.hideIC = false
	tdps.hideSolo = false
	tdps.hidePvP = false
	tdpsRefresh()
end

function AS:Embed_alDamageMeter()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'alDamageMeter' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = 'alDamagerMeterFrame'

	dmconf.barheight = floor((EmbedParent:GetHeight() / dmconf.maxbars) - dmconf.spacing)
	dmconf.width = EmbedParent:GetWidth()

	alDamageMeterFrame.backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	alDamageMeterFrame.bg:Kill()
	alDamageMeterFrame:ClearAllPoints()
	alDamageMeterFrame:SetInside(EmbedParent)
	alDamageMeterFrame:SetParent(EmbedParent)
	alDamageMeterFrame:SetFrameStrata('LOW')
end

function AS:Embed_Skada()
	AS.SkadaWindows = {}
	for k, window in pairs(Skada:GetWindows()) do
		tinsert(AS.SkadaWindows, window)
	end

	local NumberToEmbed = 0
	if AS:CheckOption('EmbedSystem') then
		NumberToEmbed = 1
	end
	if AS:CheckOption('EmbedSystemDual') then
		if AS:CheckOption('EmbedRight') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
		if AS:CheckOption('EmbedLeft') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	end

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		if not window then return end
		local barmod = Skada.displays['bar']
		local offsety = (window.db.enabletitle and window.db.title.height or 0) + (E.PixelMode and 1 or 0)
		window.db.barwidth = width - 4
		window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - (E.PixelMode and 1 or 0)
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
		window.bargroup:SetParent(relativeFrame)
		window.bargroup:SetFrameStrata('LOW')
		local Backdrop = window.bargroup.backdrop
		if Backdrop then
			if AS:CheckOption('SkadaBackdrop') then
				Backdrop:Show()
				Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
			else
				Backdrop:Hide()
			end
		end
		barmod.ApplySettings(barmod, window)
	end

	if NumberToEmbed == 1 then
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedWindow(AS.SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
	elseif NumberToEmbed == 2 then
		EmbedWindow(AS.SkadaWindows[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
		EmbedWindow(AS.SkadaWindows[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPLEFT', EmbedSystem_RightWindow, 'TOPLEFT', 2, 0)
	end
end

local EmbedOoCCombatStart
function AS:EmbedEnterCombat(event)
	EmbedOoCCombatStart = true
	if AS:CheckOption('EmbedOoC') then
		EmbedSystem_MainWindow:Show()
	end
end

function AS:EmbedExitCombat(event)
	EmbedOoCCombatStart = false
	if AS:CheckOption('EmbedOoC') then
		AS:Delay(10, function()
			if not EmbedOoCCombatStart then
				EmbedSystem_MainWindow:Hide()
			end
		end)
	end
end