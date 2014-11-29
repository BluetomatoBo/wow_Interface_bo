-----------------------------------------------------------------
-- Header
-----------------------------------------------------------------
	do
		--Creates a new UI frame called "HandyNotes_Carbonite"
		HandyNotes_Carbonite = CreateFrame("Frame", "HandyNotes_Carbonite", UIParent);
		-- Sets the name of the addon
		HandyNotes_Carbonite.Name = "HandyNotes_Carbonite";
		-- Pulls back the title of the addon from the TOC file
		HandyNotes_Carbonite.Title = GetAddOnMetadata(HandyNotes_Carbonite.Name, "Title");
		-- Pulls back the current version of the file from the TOC file
		HandyNotes_Carbonite.Version = GetAddOnMetadata(HandyNotes_Carbonite.Name, "Version");
		-- Says what stage the addon loading is at.
		HandyNotes_Carbonite.LoadedStatus = {};
		-- Say that the addon has not loaded yet.
		HandyNotes_Carbonite.LoadedStatus["Initialized"] = 0;
		-- Specifies what level the addon is "Running"
		HandyNotes_Carbonite.LoadedStatus["RunLevel"] = 1;
	end;
-----------------------------------------------------------------


-----------------------------------------------------------------
-- Libraries
-----------------------------------------------------------------
	-- Registering local variables outside hidder do
	local BE2F, BF2E, ZasName, Msg, ErrMsg, DBugMsg, ErrDBugMsg, InitDBug, ZMC_COLOURS, ZMC_Settings, TableCount, TableMax, Round, CopyTable, AddonVersion, HN_DB;
	do
		-- Just to store this one until we use it
		local GetAddonVersion;
		-- Get some useful functions and store them locally to make it easyer to use them
		TableCount, TableMax, CopyTable, GetAddonVersion, Round = LibStub("LibZasUsefulFuncs-0.1"):GetFunctions("TableCount", "TableMax", "CopyTable", "GetAddonVersion", "Round");
		ZasGetAddonVersion = GetAddonVersion
		-- Pull back the addon version and version type
		HandyNotes_Carbonite.CurAddOnVer, HandyNotes_Carbonite.CurAddOnVerType, HandyNotes_Carbonite.AddonVerTypeColour = GetAddonVersion(HandyNotes_Carbonite.Name);
		-------------------------------------------------------------------------------------------------------------------
		-- Library: Zasurus' Message Control
		-------------------------------------------------------------------------------------------------------------------
			Msg, ErrMsg, DBugMsg, ErrDBugMsg, InitDBug, ZMC_COLOURS, ZMC_Settings = LibStub("LibZasMsgCtr-1.1"):Initialize(HandyNotes_Carbonite, nil, "COLOUR_LTBLUE");
			
			-- Store the coloured version of "Zasurus"
			ZasName = ZMC_COLOURS.BLUE.."Zas"..ZMC_COLOURS.CLOSE..ZMC_COLOURS.LTBLUE.."ur"..ZMC_COLOURS.CLOSE..ZMC_COLOURS.LTGREEN.."us"..ZMC_COLOURS.CLOSE;
			-- Store the coloured version of the addon's name
			HandyNotes_Carbonite.ColName = ZMC_Settings.DefaultAddonNameColour..tostring(HandyNotes_Carbonite.Name)..ZMC_COLOURS.CLOSE;
			-- Store the colour of the addon version
			AddonVersion = ZMC_COLOURS[HandyNotes_Carbonite.AddonVerTypeColour]..strupper(HandyNotes_Carbonite.Version).." "..HandyNotes_Carbonite.CurAddOnVerType..ZMC_COLOURS.CLOSE;
			
			-----------------------------------------------------------
			-- Valid Msg Formats
			--[[-------------------------------------------------------
				Msg(sMessage[, bSimple, FrameOverride]); -- This is the original format.
				ErrMsg(sMessage[, bSimple, FrameOverride]); -- For displaying standard ERROR messages to the user. (In RED)
				DBugMsg(sMessage[, bSimple, FrameOverride]); -- For displaying debugging messages to the user.
				ErrDBugMsg(sMessage[, bSimple, FrameOverride]); -- For displaying debugging ERROR messages to the user. (In RED)
			-----------------------------------------------------------
			
			-----------------------------------------------------------
			-- AddOn Setting Values
			-----------------------------------------------------------
				ZMCOpt.DefaultAddonNameColour = Default Colour for the AddOn's Name/Alias Before Standard Messages
				ZMCOpt.DefaultMsgColour = Default Colour for Standard Messages
				ZMCOpt.DefaultDBugMsgColour = Default Colour for Standard Debug Messages
				ZMCOpt.DefaultErrorMsgColour = Default Colour for Standard Err Messages
				ZMCOpt.DefaultDBugErrorMsgColour = Default Colour for Debug Err Messages
				
				ZMCOpt.MsgFrameNum = Sets the frame that messages will be DBugMsged in by default (If not overwritten on calling msg function).
				ZMCOpt.DebugMsgFrameNum = Stores the addon Name for the msg function. This is what is DBugMsged at the start of the message
			--]]-------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------
		
		---------------------------------------------------------
		-- Zone Translation using LibBabble-SubZone-3.0
		---------------------------------------------------------
			local BSZ = LibStub("LibBabble-SubZone-3.0");
			BE2F = BSZ:GetUnstrictLookupTable();
			BF2E = BSZ:GetReverseLookupTable();
		---------------------------------------------------------
		
		HN_DB = HandyNotes.db.profile
	end;
-----------------------------------------------------------------

--------------------------------------------
-- Store all names for all Zones & Continent
--------------------------------------------
	do
		-- Array that stores the Continent & Zone Names Use WorldExplorer.ContNZoneNames[##Continent Number##][##Zone Number##]
		HandyNotes_Carbonite.ContNZoneNames = {GetMapContinents()};
		-- DBugMsg("HandyNotes_Carbonite.ContNZoneNames = "..tostring(HandyNotes_Carbonite.ContNZoneNames).."");
		
		for Key,Value in pairs(HandyNotes_Carbonite.ContNZoneNames) do
			-- DBugMsg("Key = "..tostring(Key)..",Value = "..tostring(Value).."");
			
			HandyNotes_Carbonite.ContNZoneNames[Key] = {GetMapZones(Key)};
			-- Moves the name up a level
			HandyNotes_Carbonite.ContNZoneNames[Key]["Name"] = Value;
		end;
	end;
--------------------------------------------

local pinsHandler = {}
function pinsHandler:OnEnter(motion)
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	-- DBugMsg("pinsHandler:OnEnter(motion = '"..tostring(motion).."')");
	
	-- override default UI to hide the tooltip
	WorldMapBlobFrame:SetScript("OnUpdate", nil)
	safecall(HandyNotes.plugins[self.pluginName].OnEnter, self, self.mapFile, self.coord)
end
function pinsHandler:OnLeave(motion)
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	-- DBugMsg("pinsHandler:OnLeave(motion = '"..tostring(motion).."')");
	
	-- restore default UI
	WorldMapBlobFrame:SetScript("OnUpdate", WorldMapBlobFrame_OnUpdate)
	safecall(HandyNotes.plugins[self.pluginName].OnLeave, self, self.mapFile, self.coord)
end

-- This function updates all the icons of one plugin on the world map
function HandyNotes_Carbonite:UpdateWorldMapPlugin(pluginName)
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	DBugMsg("HandyNotes_Carbonite:UpdateWorldMapPlugin(pluginName = "..tostring(pluginName)..")");
	
	-- Don't bother doing anything if Carbonite's map is closed
	if not(NxMap1 and NxMap1:IsVisible()) then return end
	-- Ensure this specific HandyNote plugin is enabled
	if not HN_DB.enabledPlugins[pluginName] then return end
	
	local continent, zone, level = GetCurrentMapContinent(), GetCurrentMapZone(), GetCurrentMapDungeonLevel()
	-- Fallback for "Cosmic" and "World"
	local mapFile = GetMapInfo() or HandyNotes:GetMapFile(continent, zone)
	local pluginHandler = HandyNotes.plugins[pluginName]
    -- Ensure pluginHandler exists
	if not(pluginHandler) then return end;
	
    -- Setup Carbonite
	local ZoneName,icT;
	if ((continent > 0) and (zone > 0)) then
		ZoneName = BF2E[HandyNotes_Carbonite.ContNZoneNames[continent][zone]];
		icT =  "!ZasHandyNotes_Icons_"..tostring(pluginName);
		HandyNotes_Carbonite:RegCarbPoints(nil, nil, icT);
	end
	
	for coord, mapFile2, iconpath, scale, alpha, level2 in pluginHandler:GetNodes(mapFile, false, level) do
		if (not(mapFile2 == "ScarletEnclave") or (mapFile2 == mapFile)) then
			local icon = HandyNotes_Carbonite.icon or CreateFrame("Frame", "HandyNotes_Carbonite_ToolTipIcon", UIParent);
			HandyNotes_Carbonite.icon = icon;
			icon:SetParent(WorldMapButton)
			icon:SetHeight(scale)
			icon:SetWidth(scale)
			icon:SetScript("OnEnter", pinsHandler.OnEnter)
			icon:SetScript("OnLeave", pinsHandler.OnLeave)
			local x, y = floor(coord / 10000) / 10000, (coord % 10000) / 10000
			local mapID2 = HandyNotes:GetMapFiletoMapID(mapFile2 or mapFile)
			if (mapID2) then
				-- Setup the icon's location as it will be needed by some of the HandyNotes addons OnEnter functions which we need to get the ToolTip they want out of them. :(
				icon:ClearAllPoints()
				icon:SetPoint("CENTER", WorldMapButton, "TOPLEFT", x*WorldMapButton:GetWidth(), -y*WorldMapButton:GetHeight())
				-- Carbonite exits so add the icons to that as well
				if (Nx and ZoneName and icT) then
					----------------------------------------------------------
					-- Creates an icon
					----------------------------------------------------------
						-- Work out the texture to use
						local Texture;
						if type(iconpath) == "table" then
							Texture = iconpath.icon;
						else
							Texture = iconpath;
						end
						
						-- Get the Icon Note to use...
						local IconNote = HandyNotes_Carbonite:GetIconToolTip(icon, pluginName, mapFile2 or mapFile, coord);
						
						DBugMsg("IconNote = '"..tostring(IconNote).."'");
						
						
						DBugMsg("HandyNotes_Carbonite:AddPointToCarbMap("..tostring(ZoneName)..", "..tostring(x)..", "..tostring(y)..", "..tostring(Texture)..", "..tostring(IconNote)..", "..tostring(icT)..", FFFFFF);")
						
						HandyNotes_Carbonite:AddPointToCarbMap(ZoneName, x, y, Texture, IconNote, icT, "FFFFFF");
					----------------------------------------------------------
				end;
			end;
		end;
	end;
end;
hooksecurefunc(HandyNotes, "UpdateWorldMapPlugin", HandyNotes_Carbonite.UpdateWorldMapPlugin);

-- Ensure the WorldMap is updated if Carbonite's map is showing but the worldmap isn't...
function HandyNotes_Carbonite:UpdateWorldMap()
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	DBugMsg("HandyNotes_Carbonite:UpdateWorldMap()");
	
	if (not(WorldMapButton:IsVisible()) and (NxMap1 and NxMap1:IsVisible())) then
		DBugMsg("Running...");
		for pluginName, pluginHandler in pairs(HandyNotes.plugins) do
			DBugMsg("HandyNotes:UpdateWorldMapPlugin(pluginName = '"..tostring(pluginName).."')");
			HandyNotes:UpdateWorldMapPlugin(pluginName);
		end;
	end;
end;
hooksecurefunc(HandyNotes, "UpdateWorldMap", HandyNotes_Carbonite.UpdateWorldMap);

function HandyNotes_Carbonite:AddPointToCarbMap(MapName, CordX, CordY, Texture, IconNote, icT_Icons, Colour)
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	DBugMsg("HandyNotes_Carbonite:AddPointToCarbMap(MapName = '"..tostring(MapName).."', CordX = '"..tostring(CordX).."', CordY = '"..tostring(CordY).."', Texture = '"..tostring(Texture).."', IconNote = '"..tostring(IconNote).."', icT_Icons = '"..tostring(icT_Icons).."', Colour = '"..tostring(Colour).."')");
    
	-- Register our point's details with Carbonite before we try to and them!
    HandyNotes_Carbonite:RegCarbPoints(nil, true);
    
	if (Nx) then
		----------------------------------------------------------
		-- Creates an icon
		----------------------------------------------------------
			-- This is how from the left to the right of the zone the icon is in %. So if this was 0 it would be the far left if it was 100 it would be far right and if it was 50 it would be half way across
            local zoneX = CordX * 100;
			-- This is a % of the Hight of the zone (same as the width)
            local zoneY = CordY * 100;
			
			DBugMsg("MapName = '"..tostring(MapName).."' zoneX = '"..tostring(zoneX).."' zoneY = '"..tostring(zoneY).."' Texture = '"..tostring(Texture).."' IconNote = '"..tostring(IconNote).."'");
			
			local map2=Nx.Map:GeM(1);
			local maI=Nx.MNTI1[MapName];
			if maI then
				local wx,wy=map2:GWP(maI,zoneX,zoneY);
				DBugMsg("wx = '"..tostring(wx).."',wy = '"..tostring(wy).."'");
				local icon = map2:AIP(icT_Icons, wx, wy, Colour, Texture);
				
				-- This sets the note(the text that pops up when you mouse over the icon)
                map2:SIT(icon, IconNote);
			end;
		----------------------------------------------------------
	end;
end;

-- Register our point's details with Carbonite before we try to and them!
function HandyNotes_Carbonite:RegCarbPoints(bKeep, bCheck, icT)
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	DBugMsg("HandyNotes_Carbonite:RegCarbPoints(bKeep = '"..tostring(bKeep).."', bCheck = '"..tostring(bCheck).."', icT = '"..tostring(icT).."')");
    
    -- Name of the addon
	local icT_Icons = icT or "!ZasHandyNotes_Icons";
    
    DBugMsg("Nx = '"..tostring(not(not(Nx))).."', not(HandyNotes.CarbReged) = '"..tostring(not(HandyNotes.CarbReged)).."', not(bKeep) = '"..tostring(not(bKeep)).."'((bCheck and not(HandyNotes.CarbReged)) or not(bCheck)) = '"..tostring(((bCheck and not(HandyNotes.CarbReged)) or not(bCheck))).."'");
    
    
    -- Carbonite exits so setup the icon types for it (Also clears any existing icons)
    if (Nx and (not(HandyNotes.CarbReged) or (not(bKeep) and ((bCheck and not(HandyNotes.CarbReged)) or not(bCheck))))) then
        DBugMsg("Carbonite exits so setup the icon types for it");
        
        ----------------------------------------------------------
        -- Setup the icon values for this addon (also wipes all old
        -- icons from the same addon)
        ----------------------------------------------------------
            local CarbMap=Nx.Map:GeM(1);
            -- This specifies it's a "World point"
            local drM = "WP";
            -- This is a texture. Don't know what this is for as it's almost always blank.
            local tex = "";
            -- This is the Width of the icon
            local w = 15;
            -- This is the Hight of the icon
            local h = 15;
            CarbMap:IIT(icT_Icons,drM,tex,w,h);
            -- Set the Alpha of these points.
            CarbMap:SITA(icT_Icons, 1);
            -- Sets the scale these points disapears at.
            CarbMap:SITAS(icT_Icons, 1);
            -- Say we have registered with Carbonite and can use it
            HandyNotes.CarbReged = true;
        ----------------------------------------------------------
    end;
end;

-- Takes an icon, plugin's name, mapfile name & coord and returns the icon's tooltip
function HandyNotes_Carbonite:GetIconToolTip(icon, pluginName, mapFile, coord)
	-------------------------------------------------
	-- ZMC Debug: If bDBug is set to true all of the
	-- debug msgs in THIS function will apear!
	-------------------------------------------------
	-- local bDBug = true; -- Uncomment this to debug
	local DBugMsg, ErrDBugMsg, DBState = InitDBug(bDBug);
	-------------------------------------------------
	
	DBugMsg("HandyNotes_Carbonite:GetIconToolTip(icon, pluginName = '"..tostring(pluginName).."', mapFile = '"..tostring(mapFile).."', coord = '"..tostring(coord).."')");
    
	local IconNote = "";
	
	DBugMsg("HandyNotes.plugins[pluginName].OnEnter(icon = '"..tostring(icon).."', mapFile2 = '"..tostring(mapFile2).."' or mapFile = '"..tostring(mapFile).."', coord = '"..tostring(coord).."')");
	HandyNotes.plugins[pluginName].OnEnter(icon, mapFile2 or mapFile, coord)
	DBugMsg("icon.mapFile = "..tostring(icon.mapFile)..", icon.coord = "..tostring(icon.coord).."")
	
	local tooltipName;
	if icon:GetParent() == WorldMapButton then
		tooltipName = "WorldMapTooltip";
	else
		tooltipName = "GameTooltip";
	end
	
	local function decToHex(IN)
		local B,K,OUT,I,D=16,"0123456789ABCDEF","",0
		while IN>0 do
			I=I+1
			IN,D=floor(IN/B), mod(IN,B)+1
			OUT=strsub(K,D,D)..OUT
		end
		
		return OUT..strrep("0", 2 - strlen(OUT))
	end
	
	local function rgbToHex(c)
		local output = decToHex(c["r"]) .. decToHex(c["g"]) .. decToHex(c["b"]);
		return output
	end
	
	for idx = 1, 10 do
		local ttextLeft = getglobal(tooltipName.."TextLeft"..idx);
		ttextLeft = getglobal(tooltipName.."TextLeft"..idx);
		if(ttextLeft and ttextLeft:IsShown()) then
			textLeft = ttextLeft:GetText();
			if (textLeft) then
				local textLeftColorR, textLeftColorG, textLeftColorB, textLeftColorA = ttextLeft:GetTextColor();
				
				-- local textLeftColor = {r=r, g=g, b=b, a=a};
				DBugMsg("textLeftColorR = "..tostring(textLeftColorR)..", textLeftColorG = "..tostring(textLeftColorG)..", textLeftColorB = "..tostring(textLeftColorB)..", textLeftColorA = "..tostring(textLeftColorA).."");
				
				DBugMsg("decToHex(textLeftColorR) = '"..decToHex(textLeftColorR * 255).."'");
				local Colour = decToHex(textLeftColorR * 255)..decToHex(textLeftColorG * 255)..decToHex(textLeftColorB * 255)
				DBugMsg("#"..Colour);
				if (strlen(IconNote) == 0) then
					IconNote = "|cff"..Colour..textLeft.."|r"
				else
					IconNote = IconNote.."\n".."|cff"..Colour..textLeft.."|r"
				end
			end
		end
	end
	
	getglobal(tooltipName):Hide();
	
	DBugMsg("IconNote = '"..tostring(IconNote).."'");
	
	return IconNote;
end
