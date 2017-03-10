local ALName, ALPrivate = ...
local _G = _G
local AtlasLoot = _G.AtlasLoot
local AL = AtlasLoot.Locales
local GetAlTooltip = AtlasLoot.Tooltip.GetTooltip

-- Only instance related module will be handled
local ATLASLOOT_MODULE_LIST = {
	"AtlasLoot_Legion",
	"AtlasLoot_WarlordsofDraenor",
	"AtlasLoot_MistsofPandaria",
	"AtlasLoot_Cataclysm",
	"AtlasLoot_WrathoftheLichKing",
	"AtlasLoot_BurningCrusade",
	"AtlasLoot_Classic",
}

function AtlasLoot:ToggleFromWorldMap_OnEnter(self)
	local tooltip = GetAlTooltip() 
	tooltip:ClearLines()
	if owner and type(owner) == "table" then
		tooltip:SetOwner(owner[1], owner[2], owner[3], owner[4])
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() * 0.5), 5)
	end
	tooltip:AddLine(AL["Click to open AtlasLoot window"])
	tooltip:Show()
end

function AtlasLoot:ToggleFromWorldMap_OnLeave(self)
	GetAlTooltip():Hide()
end

function AtlasLoot:ToggleFromWorldMap_OnClick(self, button)
	if (not AtlasLoot.GUI.frame:IsVisible()) then
		AtlasLoot.GUI.frame:Show();
	end
	ToggleFrame(WorldMapFrame);
end

function AtlasLoot:AutoSelect()
	local db = AtlasLoot.db.GUI;

	SetMapToCurrentZone();
	local wowMapID, _ = GetCurrentMapAreaID();
	local o_moduleName = db.selected[1];
	local o_dataID = db.selected[2];
	local o_bossID = db.selected[3];
	local o_diffID = db.selected[4];
	local moduleName, dataID;
	local refresh = false;

	for i = 1, #ATLASLOOT_MODULE_LIST do
		local enabled = GetAddOnEnableState(UnitName("player"), ATLASLOOT_MODULE_LIST[i]);
		if (enabled > 0) then
			AtlasLoot.GUI.frame.moduleSelect:SetSelected(ATLASLOOT_MODULE_LIST[i]);
			local moduleData = AtlasLoot.ItemDB:Get(ATLASLOOT_MODULE_LIST[i]);
			for ka, va in pairs(moduleData) do
				if (type(va) == "table" and moduleData[ka].MapID and moduleData[ka].MapID == wowMapID) then
					moduleName = ATLASLOOT_MODULE_LIST[i];
					dataID = ka;
					refresh = true;
					break;
				end
			end
		end
		if (dataID) then break; end
	end
	
	if (refresh and (o_moduleName ~= moduleName or o_dataID ~= dataID)) then
		AtlasLoot.GUI.frame.moduleSelect:SetSelected(moduleName);
		AtlasLoot.GUI.frame.subCatSelect:SetSelected(dataID);
		AtlasLoot.GUI.ItemFrame:Refresh(true);
	else
		AtlasLoot.GUI.frame.moduleSelect:SetSelected(o_moduleName);
		AtlasLoot.GUI.frame.subCatSelect:SetSelected(o_dataID);
		AtlasLoot.GUI.frame.boss:SetSelected(o_bossID);
		AtlasLoot.GUI.frame.difficulty:SetSelected(o_diffID)
		AtlasLoot.GUI.ItemFrame:Refresh(true);
	end
end