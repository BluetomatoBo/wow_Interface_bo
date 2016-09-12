-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local tonumber = _G.tonumber
local tostring = _G.tostring

-- Libraries
local math = _G.math

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local AddOnFolderName, private = ...

local LibStub = _G.LibStub
local NPCScan = LibStub("AceAddon-3.0"):GetAddon(AddOnFolderName)
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local LibWindow = LibStub("LibWindow-1.1")

-- ----------------------------------------------------------------------------
-- Constants.
-- ----------------------------------------------------------------------------
local SPAWN_POINTS = {
	"CENTER",
	"BOTTOM",
	"BOTTOMLEFT",
	"BOTTOMRIGHT",
	"LEFT",
	"RIGHT",
	"TOP",
	"TOPLEFT",
	"TOPRIGHT",
}

local SPAWN_INDICES = {}
local LOCALIZED_SPAWN_POINTS = {}

for index = 1, #SPAWN_POINTS do
	LOCALIZED_SPAWN_POINTS[index] = L[SPAWN_POINTS[index]]
	SPAWN_INDICES[SPAWN_POINTS[index]] = index
end

-- ----------------------------------------------------------------------------
-- Variables.
-- ----------------------------------------------------------------------------
local profile

-- ----------------------------------------------------------------------------
-- Helpers.
-- ----------------------------------------------------------------------------
local function round(num, idp)
	local mult = 10 ^ (idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

-- ----------------------------------------------------------------------------
-- TargetButton anchor frame.
-- ----------------------------------------------------------------------------
local function CreateAnchorFrame()
	local anchorFrame = _G.CreateFrame("Frame", nil, _G.UIParent)
	anchorFrame:SetSize(302, 119)
	anchorFrame:SetFrameStrata("DIALOG")
	anchorFrame:SetBackdrop({
		bgFile = [[Interface\FriendsFrame\UI-Toast-Background]],
		edgeFile = [[Interface\FriendsFrame\UI-Toast-Border]],
		tile = true,
		tileSize = 12,
		edgeSize = 12,
		insets = {
			left = 5,
			right = 5,
			top = 5,
			bottom = 5,
		},
	})

	anchorFrame:EnableMouse(true)
	anchorFrame:RegisterForDrag("LeftButton")
	anchorFrame:SetClampedToScreen(true)
	anchorFrame:Hide()

	local title = anchorFrame:CreateFontString(nil, "BORDER", "FriendsFont_Normal")
	title:SetJustifyH("CENTER")
	title:SetJustifyV("MIDDLE")
	title:SetWordWrap(true)
	title:SetPoint("TOPLEFT", anchorFrame, "TOPLEFT", 15, -10)
	title:SetPoint("RIGHT", anchorFrame, "RIGHT", -20, 10)
	title:SetText(AddOnFolderName)
	title:SetWidth(anchorFrame:GetWidth())

	local text = anchorFrame:CreateFontString(nil, "BORDER", "FriendsFont_Normal")
	text:SetSize(anchorFrame:GetWidth() - 20, 32)
	text:SetJustifyH("LEFT")
	text:SetJustifyV("MIDDLE")
	text:SetWordWrap(true)
	text:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
	text:SetText(L["Drag to set the spawn point for targeting buttons."])

	local dismissButton = _G.CreateFrame("Button", nil, anchorFrame)
	dismissButton:SetSize(18, 18)
	dismissButton:SetPoint("TOPRIGHT", anchorFrame, "TOPRIGHT", -4, -4)
	dismissButton:SetFrameStrata("DIALOG")
	dismissButton:SetFrameLevel(anchorFrame:GetFrameLevel() + 2)
	dismissButton:SetNormalTexture([[Interface\FriendsFrame\UI-Toast-CloseButton-Up]])
	dismissButton:SetPushedTexture([[Interface\FriendsFrame\UI-Toast-CloseButton-Down]])
	dismissButton:SetHighlightTexture([[Interface\FriendsFrame\UI-Toast-CloseButton-Highlight]])
	dismissButton:SetScript("OnClick", function()
		anchorFrame:Hide()
	end)

	anchorFrame:SetHeight(text:GetStringHeight() + title:GetStringHeight() + 25)

	LibWindow.RegisterConfig(anchorFrame, profile.targetButtonGroup)
	LibWindow.RestorePosition(anchorFrame)
	LibWindow.MakeDraggable(anchorFrame)

	anchorFrame:HookScript("OnDragStop", function()
		AceConfigRegistry:NotifyChange(AddOnFolderName)
	end)

	private.TargetButtonAnchor = anchorFrame

	return anchorFrame
end

-- ----------------------------------------------------------------------------
-- Initialization.
-- ----------------------------------------------------------------------------
local TargetingOptions
local anchorFrame

local function GetTargetingOptions()
	profile = private.db.profile
	anchorFrame = anchorFrame or CreateAnchorFrame()

	TargetingOptions = TargetingOptions or {
		name = _G.BINDING_HEADER_TARGETING,
		order = 3,
		type = "group",
		descStyle = "inline",
		args = {
			duration = {
				order = 1,
				name = L["Duration"],
				desc = L["The number of minutes a targeting button will exist before fading out."],
				type = "range",
				width = "full",
				min = 0.5,
				max = 5,
				get = function(info)
					return profile.targetButtonGroup.durationSeconds / 60
				end,
				set = function(info, value)
					profile.targetButtonGroup.durationSeconds = value * 60
				end,
			},
			scale = {
				order = 2,
				name = _G.UI_SCALE,
				type = "range",
				width = "full",
				min = 0.5,
				max = 2,
				get = function(info)
					return profile.targetButtonGroup.scale
				end,
				set = function(info, value)
					profile.targetButtonGroup.scale = value
					LibWindow.SetScale(anchorFrame, value)

					NPCScan:SendMessage("NPCScan_TargetButtonScaleChanged")
				end,
			},
			targetButtons = {
				order = 3,
				name = L["Screen Location"],
				type = "group",
				guiInline = true,
				args = {
					spawnPoint = {
						order = 60,
						type = "select",
						name = L["Spawn Point"],
						descStyle = "inline",
						get = function()
							return SPAWN_INDICES[profile.targetButtonGroup.point]
						end,
						set = function(info, value)
							profile.targetButtonGroup.point = SPAWN_POINTS[value]
							LibWindow.RestorePosition(anchorFrame)
						end,
						values = LOCALIZED_SPAWN_POINTS,
					},
					x = {
						order = 70,
						type = "input",
						name = L["X Offset"],
						desc = L["Horizontal offset from the anchor point."],
						get = function()
							return tostring(round(profile.targetButtonGroup.x))
						end,
						set = function(info, value)
							profile.targetButtonGroup.x = tonumber(value)
							LibWindow.RestorePosition(anchorFrame)
						end,
						dialogControl = "EditBox",
					},
					y = {
						order = 80,
						type = "input",
						name = L["Y Offset"],
						desc = L["Vertical offset from the anchor point."],
						get = function()
							return tostring(round(profile.targetButtonGroup.y))
						end,
						set = function(info, value)
							profile.targetButtonGroup.y = tonumber(value)
							LibWindow.RestorePosition(anchorFrame)
						end,
						dialogControl = "EditBox",
					},
					empty_4 = {
						order = 81,
						type = "description",
						width = "full",
						name = " ",
					},
					reset = {
						order = 90,
						type = "execute",
						name = L["Reset Position"],
						descStyle = "inline",
						func = function()
							profile.targetButtonGroup = _G.copyTable(private.DatabaseDefaults.profile.targetButtonGroup)
							LibWindow.RegisterConfig(anchorFrame, profile.targetButtonGroup)
							LibWindow.RestorePosition(anchorFrame)
						end,
					},
					showAnchor = {
						order = 100,
						type = "execute",
						descStyle = "inline",
						name = function()
							return anchorFrame:IsShown() and L["Hide Anchor"] or L["Show Anchor"]
						end,
						func = function()
							anchorFrame[anchorFrame:IsShown() and "Hide" or "Show"](anchorFrame)
							AceConfigRegistry:NotifyChange(AddOnFolderName)
						end,
					},
				},
			},
		},
	}

	return TargetingOptions
end

private.GetTargetingOptions = GetTargetingOptions
