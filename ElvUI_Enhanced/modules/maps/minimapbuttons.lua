local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local MB = E:NewModule('MinimapButtons', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');

-- Based on Square Minimap Buttons
-- Original authors:  Azilroka, Sinaris

local sub, len, find = string.sub, string.len, string.find

-- list of specific minimap frames ignored
local ignoreButtons = {
	"AsphyxiaUIMinimapHelpButton",
	"AsphyxiaUIMinimapVersionButton",
	"ElvConfigToggle",
	"ElvUIConfigToggle",
	"ElvUI_ConsolidatedBuffs",
	"GameTimeframe",
	"HelpOpenTicketButton",
	"MMHolder",
	"DroodFocusMinimapButton",
	"QueueStatusMinimapButton",
	"TimeManagerClockButton",
	"MinimapZoneTextButton",
}

-- list of frames that are ignored when they start with this text
local genericIgnores = {
	"Archy",
	"GatherMatePin",
	"GatherNote",
	"GuildInstance",
	"HandyNotesPin",
	"MinimMap",
	"Spy_MapNoteList_mini",
	"ZGVMarker",
}

-- ignore all frames where then name contains this text
local partialIgnores = {
	"Node",
	"Note",
	"Pin",
}

-- whitelist all frames starting with
local whiteList = {
	"LibDBIcon",
}

local moveButtons = {}
local minimapButtonBarAnchor, minimapButtonBar

local function OnEnter(self)
	if not E.minimapbuttons.db.mouseover or E.minimapbuttons.db.skinStyle == 'NOANCHOR' then return end
	UIFrameFadeIn(MinimapButtonBar, 0.2, MinimapButtonBar:GetAlpha(), 1)
	if self:GetName() ~= 'MinimapButtonBar' then
		self:SetBackdropBorderColor(.7, .7, 0)
	end
end

local function OnLeave(self)
	if not E.minimapbuttons.db.mouseover or E.minimapbuttons.db.skinStyle == 'NOANCHOR' then return end
	UIFrameFadeOut(MinimapButtonBar, 0.2, MinimapButtonBar:GetAlpha(), 0)
	if self:GetName() ~= 'MinimapButtonBar' then
		self:SetBackdropBorderColor(0, 0, 0)
	end
end

function MB:SkinButton(frame)
	if frame == nil or frame:GetName() == nil or (frame:GetObjectType() ~= "Button") or not frame:IsVisible() then return end
	
	local name = frame:GetName()
	local validIcon = false
	
	for i = 1, #whiteList do
		if sub(name, 1, len(whiteList[i])) == whiteList[i] then validIcon = true break end
	end
	
	if not validIcon then
		for i = 1, #ignoreButtons do
			if name == ignoreButtons[i] then return end
		end
		
		for i = 1, #genericIgnores do
			if sub(name, 1, len(genericIgnores[i])) == genericIgnores[i] then return end
		end
		
		for i = 1, #partialIgnores do
			if find(name, partialIgnores[i]) ~= nil then return end
		end
	end
	
	frame:SetPushedTexture(nil)
	frame:SetHighlightTexture(nil)
	frame:SetDisabledTexture(nil)
	
	if name == "DBMMinimapButton" then frame:SetNormalTexture("Interface\\Icons\\INV_Helmet_87") end
	if name == "SmartBuff_MiniMapButton" then frame:SetNormalTexture(select(3, GetSpellInfo(12051))) end

	if not frame.isSkinned then
		frame:HookScript('OnEnter', OnEnter)
		frame:HookScript('OnLeave', OnLeave)
		frame:HookScript('OnClick', MB.DelayedUpdateLayout)

		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			frame.original = {}
			frame.original.Width, frame.original.Height = frame:GetSize()
			frame.original.Point, frame.original.relativeTo, frame.original.relativePoint, frame.original.xOfs, frame.original.yOfs = frame:GetPoint()
			frame.original.Parent = frame:GetParent()
			frame.original.FrameStrata = frame:GetFrameStrata()
			frame.original.FrameLevel = frame:GetFrameLevel()
			frame.original.Scale = frame:GetScale()
			if frame:HasScript("OnDragStart") then
				frame.original.DragStart = frame:GetScript("OnDragStart")
			end
			if frame:HasScript("OnDragEnd") then
				frame.original.DragEnd = frame:GetScript("OnDragEnd")
			end
			
			if (region:GetObjectType() == "Texture") then
				local texture = region:GetTexture()
			
				if (texture and (texture:find("Border") or texture:find("Background") or texture:find("AlphaMask"))) then
					region:SetTexture(nil)
				else
					region:ClearAllPoints()
					region:Point("TOPLEFT", frame, "TOPLEFT", 2, -2)
					region:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
					region:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
					region:SetDrawLayer( "ARTWORK" )
					if (name == "PS_MinimapButton") then
						region.SetPoint = function() end
					end
				end
			end
		end
		frame:SetTemplate("Tranparent")

		tinsert(moveButtons, name)
		frame.isSkinned = true
	end
end

function MB:DelayedUpdateLayout()
	MB:ScheduleTimer("UpdateLayout", .05)
end

function MB:UpdateLayout()
	if not E.minimapbuttons then return end
	if InCombatLockdown() then
		MB:RegisterEvent("PLAYER_REGEN_ENABLED", "UpdateLayout")	
		return
	else
		MB:UnregisterEvent("PLAYER_REGEN_ENABLED")
 	end
	
	local direction = E.minimapbuttons.db.layoutDirection == 'NORMAL'
	local offset = direction and -2 or 2

	if E.minimapbuttons.db.skinStyle == 'HORIZONTAL' then
		minimapButtonBar:SetPoint(direction and 'LEFT' or 'RIGHT', minimapButtonBarAnchor, direction and 'LEFT' or 'RIGHT', -2, 0)
	else
		minimapButtonBar:SetPoint(direction and 'TOP' or 'BOTTOM', minimapButtonBarAnchor, direction and 'TOP' or 'BOTTOM', -2, 0)
	end
	minimapButtonBar:SetSize(E.minimapbuttons.db.buttonSize + 4, E.minimapbuttons.db.buttonSize + 4)
	
	local lastFrame, anchor1, anchor2, offsetX, offsetY
	
	for i = 1, #moveButtons do
		local frame =	_G[moveButtons[i]]
		
		if E.minimapbuttons.db.skinStyle == 'NOANCHOR' then
			frame:SetParent(frame.original.Parent)
			if frame.original.DragStart then
				frame:SetScript("OnDragStart", frame.original.DragStart)
			end
			if frame.original.DragEnd then
				frame:SetScript("OnDragStop", frame.original.DragEnd)
			end

			frame:ClearAllPoints()
			frame:SetSize(frame.original.Width, frame.original.Height)
			frame:SetPoint(frame.original.Point, frame.original.relativeTo, frame.original.relativePoint, frame.original.xOfs, frame.original.yOfs)
			frame:SetFrameStrata(frame.original.FrameStrata)
			frame:SetFrameLevel(frame.original.FrameLevel)
			frame:SetScale(frame.original.Scale)
			frame:SetMovable(true)
		else
			frame:SetParent(minimapButtonBar)
			frame:SetMovable(false)
			frame:SetScript("OnDragStart", nil)
			frame:SetScript("OnDragStop", nil)
			
			frame:ClearAllPoints()
			frame:SetFrameStrata("LOW")
			frame:SetFrameLevel(20)
			frame:Size(E.minimapbuttons.db.buttonSize)
			if E.minimapbuttons.db.skinStyle == 'HORIZONTAL' then
				anchor1 = direction and 'RIGHT' or 'LEFT'
				anchor2 = direction and 'LEFT' or 'RIGHT'
				offsetX = offset
				offsetY = 0
			else
				anchor1 = direction and 'TOP' or 'BOTTOM'
				anchor2 = direction and 'BOTTOM' or 'TOP'
				offsetX = 0
				offsetY = offset
			end
			
			if not lastFrame then
				frame:SetPoint(anchor1, minimapButtonBar, anchor1, offsetX, offsetY)
			else
				frame:SetPoint(anchor1, lastFrame, anchor2, offsetX, offsetY)
			end
		end
		lastFrame = frame	
	end
	
	if E.minimapbuttons.db.skinStyle ~= 'NOANCHOR' and #moveButtons > 0 then
		if E.minimapbuttons.db.skinStyle == "HORIZONTAL" then
			minimapButtonBar:SetWidth((E.minimapbuttons.db.buttonSize * #moveButtons) + (2 * #moveButtons + 1) + 1)
		else
			minimapButtonBar:SetHeight((E.minimapbuttons.db.buttonSize * #moveButtons) + (2 * #moveButtons + 1) + 1)
		end
		minimapButtonBarAnchor:SetSize(minimapButtonBar:GetSize())
		minimapButtonBar:Show()
		RegisterStateDriver(minimapButtonBar, "visibility", '[petbattle]hide;show')
	else
		UnregisterStateDriver(minimapButtonBar, "visibility")
		minimapButtonBar:Hide()
	end
	
	if E.minimapbuttons.db.backdrop then
		minimapButtonBar.backdrop:Show()
	else
		minimapButtonBar.backdrop:Hide()
	end
end

function MB:ChangeMouseOverSetting()
	if E.minimapbuttons.db.mouseover then
		minimapButtonBar:SetAlpha(0)
	else
		minimapButtonBar:SetAlpha(1)
	end
end

function MB:SkinMinimapButtons()
	MB:RegisterEvent("ADDON_LOADED", "StartSkinning")

	for i = 1, Minimap:GetNumChildren() do
		self:SkinButton(select(i, Minimap:GetChildren()))
	end
	MB:UpdateLayout()
end

function MB:StartSkinning()
	MB:UnregisterEvent("ADDON_LOADED")

	MB:ScheduleTimer("SkinMinimapButtons", 5)
end

function MB:CreateFrames()
	minimapButtonBarAnchor = CreateFrame("Frame", "MinimapButtonBarAnchor", E.UIParent)
	
	if E.db.auras.consolidatedBuffs.enable then
		minimapButtonBarAnchor:Point("TOPRIGHT", ElvConfigToggle, "BOTTOMRIGHT", 0, -2)
	else
		minimapButtonBarAnchor:Point("TOPRIGHT", RightMiniPanel, "BOTTOMRIGHT", 0, -2)
	end
	minimapButtonBarAnchor:Size(200, 32)
	minimapButtonBarAnchor:SetFrameStrata("BACKGROUND")
	
	E:CreateMover(minimapButtonBarAnchor, "MinimapButtonAnchor", L["Minimap Button Bar"])

	minimapButtonBar = CreateFrame("Frame", "MinimapButtonBar", E.UIParent)
	minimapButtonBar:SetFrameStrata('LOW')
	minimapButtonBar:CreateBackdrop('Transparent')
	minimapButtonBar:ClearAllPoints()
	minimapButtonBar:SetPoint("CENTER", minimapButtonBarAnchor, "CENTER", 0, 0)
	minimapButtonBar:SetScript("OnEnter", OnEnter)
	minimapButtonBar:SetScript("OnLeave", OnLeave)

	minimapButtonBar.backdrop:SetAllPoints()

	self:ChangeMouseOverSetting()
	self:SkinMinimapButtons()
end

function MB:Initialize()
	E.minimapbuttons = MB
	E.minimapbuttons.db = E.private.general.minimapbar

	if not E.minimapbuttons.db.skinButtons then return end

	self:CreateFrames()
end

E:RegisterModule(MB:GetName())
