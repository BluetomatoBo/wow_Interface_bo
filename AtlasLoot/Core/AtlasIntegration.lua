local ALName, ALPrivate = ...
local _G = _G
local AtlasLoot = _G.AtlasLoot
local GUI = {}
local AL = AtlasLoot.Locales

local ATLAS_SMALLFRAME_SELECTED_ORIG

function AtlasLoot:Atlas_IsEnabled()
	local loadable = select(4, GetAddOnInfo("Atlas"));

	return loadable;
end

function AtlasLoot:Atlas_ShowMap(mapID)
	ATLAS_SMALLFRAME_SELECTED_ORIG = ATLAS_SMALLFRAME_SELECTED;
	ATLAS_SMALLFRAME_SELECTED = true;

	for k, v in pairs(ATLAS_DROPDOWNS) do
		for k2, v2 in pairs(v) do
			if (v2 == mapID) then
				AtlasOptions.AtlasType = k;
				AtlasOptions.AtlasZone = k2;
				break;
			end
		end
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