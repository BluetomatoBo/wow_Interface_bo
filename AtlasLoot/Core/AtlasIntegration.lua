-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0)

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local ALName, ALPrivate = ...
local AtlasLoot = _G.AtlasLoot
local Atlas = {}
AtlasLoot.Atlas = Atlas

local ATLAS_SMALLFRAME_SELECTED_ORIG

function Atlas.IsEnabled()
	local loadable = select(4, GetAddOnInfo("Atlas"));

	return loadable;
end

function Atlas.ShowMap(mapID)
	ATLAS_SMALLFRAME_SELECTED_ORIG = ATLAS_SMALLFRAME_SELECTED;
	ATLAS_SMALLFRAME_SELECTED = true;

	local foundMatch = false;
	for k, v in pairs(ATLAS_DROPDOWNS) do
		for k2, v2 in pairs(v) do
			if (v2 == mapID) then
				AtlasOptions.AtlasType = k;
				AtlasOptions.AtlasZone = k2;
				foundMatch = true;
				break;
			end
		end
		if foundMatch then break; end
	end

	if ( AtlasFrameLarge:IsVisible() ) then
		HideUIPanel(AtlasFrameLarge);
	end
	if ( AtlasFrame:IsVisible() ) then
		HideUIPanel(AtlasFrame);
	end
	if (not AtlasFrameSmall:IsVisible() ) then
		ShowUIPanel(AtlasFrameSmall);
	end
	AtlasFrameDropDownType_OnShow();
	AtlasFrameDropDown_OnShow();
	Atlas_Refresh();
	
	ATLAS_SMALLFRAME_SELECTED = ATLAS_SMALLFRAME_SELECTED_ORIG;
end