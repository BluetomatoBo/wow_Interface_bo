local AtlasLoot = _G.AtlasLoot
local MiniMapButton = {}
AtlasLoot.MiniMapButton = MiniMapButton
local SlashCommands = AtlasLoot.SlashCommands
local AL = AtlasLoot.Locales
local profile
local ALButton = LibStub("LibDBIcon-1.0")

-- lua
local type = type
local abs, sqrt = math.abs, math.sqrt

-- LDB
if not LibStub:GetLibrary("LibDataBroker-1.1", true) then return end

--Make an LDB object
local MiniMapLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("AtlasLoot", {
	type = "launcher",
	text = AL["AtlasLoot"],
	icon = "Interface\\Icons\\INV_Box_01",
	OnTooltipShow = function(tooltip)
		tooltip:AddLine("|cff00FF00"..AL["AtlasLoot"].."|r");
		tooltip:AddLine(AL["AtlasLoot_Minimap_Clicks"]);
	end,
	OnClick = function(self, button)
		if button == "RightButton" then return end
		if IsShiftKeyDown() then
			SlashCommands:Run("options")
		else
			SlashCommands:Run("")
		end
	end,
})

function MiniMapButton.Init()
	SlashCommands:Add("mmb", MiniMapButton.Toggle, AL["/al mmb - Toggle MiniMapButton"])
	SlashCommands:AddResetFunction(MiniMapButton.ResetFrames, "frames", "mmb")

	profile = AtlasLoot.db
	local defaults = {
		shown = true,
		locked = false,
		minimapPos = 218,
	};
	if (profile.minimap == nil) then
		profile.minimap = defaults;
		-- below to be removed in the later release
		if (profile.MiniMapButton.shown == false) then
			profile.minimap.shown = false;
		else
			profile.minimap.shown = true;
		end
		if (not profile.minimap.shown) then
			profile.minimap.hide = true;
		end
		if (profile.MiniMapButton.locked == true) then
			profile.minimap.locked = true;
		else
			profile.minimap.locked = false;
		end
		if (profile.minimap.locked) then
			profile.minimap.lock = true;
		end
	end
	ALButton:Register("AtlasLoot", MiniMapLDB, profile.minimap);
end
AtlasLoot:AddInitFunc(MiniMapButton.Init)

function MiniMapButton.ResetFrames()
	profile.minimap.minimapPos = 218;
	ALButton:Refresh("AtlasLoot");
end

function MiniMapButton.Toggle()
	profile.minimap.shown = not profile.minimap.shown
	profile.minimap.hide = not profile.minimap.hide
	if not profile.minimap.hide then
		ALButton:Show("AtlasLoot")
	else
		ALButton:Hide("AtlasLoot")
	end
end

function MiniMapButton.Options_Toggle()
	if profile.minimap.shown then
		ALButton:Show("AtlasLoot")
		profile.minimap.hide = nil
	else
		ALButton:Hide("AtlasLoot")
		profile.minimap.hide = true
	end
end

function MiniMapButton.Lock_Toggle()
	if profile.minimap.locked then
		ALButton:Lock("AtlasLoot");
	else
		ALButton:Unlock("AtlasLoot");
	end
end
