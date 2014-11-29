---------------------------------------------------------
-- Messaging options
---------------------------------------------------------
local AddonName = "HandyNotes_SpecialNPCsEtc"; -- Stores the addon Name (This MUST be this addon's folder name!)
local Debug_Level = 1; -- What level of debugging to use NOT USED CURRENTLY!!!!!!!!!!!!
local Debug_Show = true; -- Should any debug msgs be stored in the debug log?
local Debug_Frame = 4; -- Which frame should be used for the debug msg (1-7)


---------------------------------------------------------
-- Addon declaration
---------------------------------------------------------
HandyNotes_SpecialNPCsEtc = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_SpecialNPCsEtc","AceEvent-3.0")
local HNS = HandyNotes_SpecialNPCsEtc
local Astrolabe = DongleStub("Astrolabe-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes_SpecialNPCsEtc")


---------------------------------------------------------
-- Our db upvalue and db defaults
---------------------------------------------------------
local CURRENT_DB_VERSION = 2   -- added npcID
local db
local defaults = {
	profile = {
		icon_scale = 1.0,
		icon_alpha = 1.0,
	},
	faction = {
		dbversion = 0,
		nodes = {
			["*"] = {},
		}
	},
}


---------------------------------------------------------
-- Localize some globals
---------------------------------------------------------
local next = next
local select = select
local string_find = string.find
local GameTooltip = GameTooltip
local WorldMapTooltip = WorldMapTooltip
local HandyNotes = HandyNotes


---------------------------------------------------------
-- Constants
---------------------------------------------------------
local iconpath = "Interface\\AddOns\\HandyNotes_SpecialNPCsEtc\\Artwork\\"

local defkey = {}
local iconDB = {

	-- Classes
	["DRUID"]   = iconpath .. "Druid",
	["HUNTER"]  = iconpath .. "Hunter",
	["MAGE"]    = iconpath .. "Mage",
	["PALADIN"] = iconpath .. "Paladin",
	["PRIEST"]  = iconpath .. "Priest",
	["ROGUE"]   = iconpath .. "Rogue",
	["SHAMAN"]  = iconpath .. "Shaman",
	["WARLOCK"] = iconpath .. "Warlock",
	["WARRIOR"] = iconpath .. "Warrior",
	["DEATHKNIGHT"]  = iconpath .. "Deathknight",   -- TODO: Check the key from WotLK

	-- Primary
	["Alchemy"]        = iconpath .. "Alchemy",
	["Blacksmithing"]  = iconpath .. "Blacksmithing",
	["Armorsmith"]     = iconpath .. "Blacksmithing",
	["Weaponsmith"]    = iconpath .. "Blacksmithing",
	["Enchanting"]     = iconpath .. "Enchanting",
	["Engineering"]    = iconpath .. "Engineering",
	["Herbalism"]      = iconpath .. "Herbalism",
	["Inscription"]    = iconpath .. "Inscription",
	["Jewelcrafting"]  = iconpath .. "Jewelcrafting",
	["Leatherworking"] = iconpath .. "Leatherworking",
	["Mining"]         = iconpath .. "Mining",
	["Skinning"]       = iconpath .. "Skinning",
	["Tailoring"]      = iconpath .. "Tailoring",

	-- Secondary
	["Cooking"]        = iconpath .. "Cooking",
	["First Aid"]      = iconpath .. "Firstaid",
	["Fishing"]        = iconpath .. "Fishing",

	-- Special
	["WeaponMaster"]   = iconpath .. "Weaponmaster",
	["Riding"]         = iconpath .. "Riding",
	["ColdFlying"]     = iconpath .. "Riding",

	["Portal"]  = iconpath .. "Portal",

	["Pet"]     = iconpath .. "Pet",
	
	["Innkeeper"] = "Interface\\Minimap\\Tracking\\Innkeeper",
	["Auctioneer"] = "Interface\\Minimap\\Tracking\\Auctioneer",
	["Banker"] = "Interface\\Minimap\\Tracking\\Banker",
	["Battlemaster"] = "Interface\\Minimap\\Tracking\\BattleMaster",
	["Stable"] = "Interface\\Minimap\\Tracking\\StableMaster",
	["SpiritHealer"] = "Interface\\Minimap\\Tracking\\TrivialQuests",
	["GuildVault"] = "Interface\\GLUES\\LOGIN\\Glues-CheckBox-Check",
	
	-- Default
	[defkey]    = "Interface\\Minimap\\Tracking\\TrivialQuests", -- for any SpecialNPCsEtc without icon definition
}

setmetatable(iconDB, {__index = function (t, k)
					local v = t[defkey]
					rawset(t, k, v) -- cache the value for next retrievals
					return v
				end})

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
---------------------------------------------------------

local HNSHandler = {}

local function deletePin(button, mapFile, coord)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	local x, y = HandyNotes:getXY(coord)
	db.faction.nodes[mapFile][coord] = nil
	HNS:SendMessage("HandyNotes_NotifyUpdate", "SpecialNPCsEtc")
end

local function createWaypoint(button, mapFile, coord)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	local c, z = HandyNotes:GetCZ(mapFile)
	local x, y = HandyNotes:getXY(coord)
	local vType, vName, vGuild = strsplit(":", db.faction.nodes[mapFile][coord])
	if TomTom then
		TomTom:AddZWaypoint(c, z, x*100, y*100, vName)
	elseif Cartographer_Waypoints then
		Cartographer_Waypoints:AddWaypoint(NotePoint:new(HandyNotes:GetCZToZone(c, z), x, y, vName))
	end
end

local clickedNote, clickedNoteZone
local info = {}
local function generateMenu(button, level)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	if (not level) then return end
	for k in pairs(info) do info[k] = nil end
	if (level == 1) then
		-- Create the title of the menu
		info.isTitle      = 1
		info.text         = L["HandyNotes - SpecialNPCsEtc"]
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)

		if TomTom or Cartographer_Waypoints then
			-- Waypoint menu item
			info.disabled     = nil
			info.isTitle      = nil
			info.notCheckable = nil
			info.text = L["Create waypoint"]
			info.icon = nil
			info.func = createWaypoint
			info.arg1 = clickedNoteZone
			info.arg2 = clickedNote
			UIDropDownMenu_AddButton(info, level);
		end

		-- Delete menu item
		info.disabled     = nil
		info.isTitle      = nil
		info.notCheckable = nil
		info.text = L["Delete SpecialNPCsEtc"]
		info.icon = nil
		info.func = deletePin
		info.arg1 = clickedNoteZone
		info.arg2 = clickedNote
		UIDropDownMenu_AddButton(info, level);

		-- Close menu item
		info.text         = L["Close"]
		info.icon         = nil
		info.func         = function() CloseDropDownMenus() end
		info.arg1         = nil
		info.arg2         = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level);
	end
end
local HNS_Dropdown = CreateFrame("Frame", "HandyNotes_SpecialNPCsEtcDropdownMenu")
HNS_Dropdown.displayMode = "MENU"
HNS_Dropdown.initialize = generateMenu

function HNSHandler:OnClick(button, down, mapFile, coord)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	if button == "RightButton" and not down then
		clickedNoteZone = mapFile
		clickedNote = coord
		ToggleDropDownMenu(1, nil, HNS_Dropdown, self, 0, 0)
	end
end

function HNSHandler:OnEnter(mapFile, coord)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end
	local vType, vName, vGuild = strsplit(":", db.faction.nodes[mapFile][coord])
	tooltip:AddLine("|cffe0e0e0"..vName.."|r")
	if (vGuild ~= "") then tooltip:AddLine(vGuild) end
	tooltip:Show()
end

function HNSHandler:OnLeave(mapFile, coord)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

do
	-- This is a custom iterator we use to iterate over every node in a given zone
	local function iter(t, prestate)
		if not t then return nil end
		local state, value = next(t, prestate)
		while state do
			if value then
				local vType, vName, vGuild = strsplit(":", value)
				local icon = iconDB[vType]
				return state, nil, icon, db.profile.icon_scale, db.profile.icon_alpha
			end
			state, value = next(t, state)
		end
		return nil, nil, nil, nil
	end
	function HNSHandler:GetNodes(mapFile)
		return iter, db.faction.nodes[mapFile], nil
	end
end


---------------------------------------------------------
-- Options table
---------------------------------------------------------

local options = {
	type = "group",
	name = "SpecialNPCsEtc",
	desc = "SpecialNPCsEtc",
	get = function(info) return db.profile[info.arg] end,
	set = function(info, v)
		db.profile[info.arg] = v
		HNS:SendMessage("HandyNotes_NotifyUpdate", "SpecialNPCsEtc")
	end,
	args = {
		desc = {
			name = L["These settings control the look and feel of the SpecialNPCsEtc icons."],
			type = "description",
			order = 0,
		},
		icon_scale = {
			type = "range",
			name = L["Icon Scale"],
			desc = L["The scale of the icons"],
			min = 0.25, max = 2, step = 0.01,
			arg = "icon_scale",
			order = 10,
		},
		icon_alpha = {
			type = "range",
			name = L["Icon Alpha"],
			desc = L["The alpha transparency of the icons"],
			min = 0, max = 1, step = 0.01,
			arg = "icon_alpha",
			order = 20,
		},
	},
}


---------------------------------------------------------
-- NPC info tracking - TT handling
---------------------------------------------------------

local tt = CreateFrame("GameTooltip")
tt:SetOwner(UIParent, "ANCHOR_NONE")
tt.left = {}
tt.right = {}

for i = 1, 30 do
	tt.left[i] = tt:CreateFontString()
	tt.left[i]:SetFontObject(GameFontNormal)
	tt.right[i] = tt:CreateFontString()
	tt.right[i]:SetFontObject(GameFontNormal)
	tt:AddFontStrings(tt.left[i], tt.right[i])
end


local LEVEL_start = "^" .. (type(LEVEL) == "string" and LEVEL or "Level")
local function FigureNPCGuild(unit)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	tt:ClearLines()
	tt:SetUnit(unit)
	if not tt:IsOwned(UIParent) then
		tt:SetOwner(UIParent, "ANCHOR_NONE")
	end
	local left_2 = tt.left[2]:GetText()
	if not left_2 or left_2:find(LEVEL_start) then
		return ""
	end
	return left_2
end

--======================================================================================================================================================
-- Zasurus' Message Function
--[[====================================================================================================================================================
	---------------------------------------------------------------------------------------
	-- Information
	---------------------------------------------------------------------------------------
		Version: 1.3
		Description: This is to control the displaying of messages to the user and also the
						control of debugging messages.
						
						It allows you to display debug messages on a spacific chat window (1-7)
						and easly turn them on/off for each function individually or/and store
						all messages from all functions into a debug log so you can debug a users
						function without them having to see all the messages and tell you whats
						going on!
		
		
		Use: Add everything between THIS LINE!!!!!!!!!!!!!!!!!
				----------------------------------------------
				-- Default: If DebugTxt is set to true all of
				-- the debug msgs in THIS function will apear!
				----------------------------------------------
				local DebugTxt = false;
				-- DebugTxt = true; -- Uncomment this to debug
				----------------------------------------------
				!!!!!!!!!!!!!!!!!!AND THIS LINE to the top of EVERY function in this file/project.
				(Remove the comment tags from the start of each line as they are just for this header!)
				
				Then when you want to debug that function simply uncomment the line bellow that
				starting with "DebugTxt =..."! I have done it this way as it's quicker than changing
				the false to true on the first line for me as it's just a shortcut to uncomment a
				line in the text editor it use. But you could just put the first line in and change
				the false to a true when you wanted to debug that function...
				
				There are also some other settings in the "Messaging options" section bellow that need
				changing.
				
				(Remove the comment tags from the start of each line as they are just for this header!)
	----------------------------------------------------------------------------------------]]

	----------------------------------------------
	-- Messaging options
	----------------------------------------------
		-- Initializes HandyNotes_StoreDebugMsgs if it doesn't already exist
		if (HandyNotes_StoreDebugMsgs == nil) then
			HandyNotes_StoreDebugMsgs = false; -- Defaults to false (so no debug logs are stored)
		end;
		
		local Debug_Frame = 4; -- Which frame should be used for the debug msg (1-7)
	----------------------------------------------

	----------------------------------------------
	-- Chat Frame Colours
	----------------------------------------------
		local COLOUR_YELLOW 	= "|cffffff00";
		local COLOUR_WHITE 	= "|cffffffff";
		local COLOUR_LTGREY 	= "|caaaaaaaa";
		local COLOUR_MEDGRAY	= "|cff808080";
		local COLOUR_DKGRAY	= "|cff555555";
		local COLOUR_BLUEGREY	= "|cffa6a6ff";
		local COLOUR_LTBLUE	= "|cff00d7e4";
		local COLOUR_BLUE 	= "|cff3366ff";	
		local COLOUR_DKBLUE	= "|cff0000ff";
		local COLOUR_TEAL		= "|cff00ffbb";
		local COLOUR_BLUGREEN	= "|cffa4d7ea";
		local COLOUR_LTGREEN	= "|cff70ff6d";
		local COLOUR_GREEN 	= "|cff00ff00";
		local COLOUR_DRKGREEN	= "|cff005000";
		local COLOUR_PINK		= "|cffff00ff";
		local COLOUR_LTPURPLE = "|cffb56dff";
		local COLOUR_PURPLE	= "|cffaa00ff";
		local COLOUR_DKPURPLE = "|cff742fff";
		local COLOUR_RED 		= "|cffff0000";
		local COLOUR_ORANGE	= "|cffff9900";
		local COLOUR_BROWN	= "|cff764e31";
		
		local COLOUR_CLOSE 	= "|r";
		
		local DEFAULT_COLOUR_1 = COLOUR_LTBLUE
		local DEFAULT_COLOUR_2 = COLOUR_GREEN
		local DEFAULT_ERROR_COLOUR = COLOUR_RED
	----------------------------------------------

	local function Msg(sMessage, bDebug, bDebugOn, bError, bSimple) -- Controls the displaying of messages to the user and debugging messages.
		----------------------------------------------------------------------------------------
		-- DebugLog setup
		----------------------------------------------------------------------------------------
		-- Initializes DebugLog if it doesn't already exist
		if (DebugLog == nil) then
			DebugLog = {};
		end;
		----------------------------------------------------------------------------------------
		
		
		
		
		----------------------------------------------------------------------------------------
		-- Defaults
		----------------------------------------------------------------------------------------
		local AddonDetails = "";
		local sFullMessage = "";
		
		if bError == nil then
			bError = false
		end;
		
		if bDebug == nil then
			bDebug = false
		end;
		
		if bDebugOn == nil then
			bDebugOn = false
		end;
		
		if (not(bSimple)) then
			AddonDetails = tostring(AddonName).." V"..tostring(GetAddOnMetadata(AddonName, "Version"))..": "
		end;
		----------------------------------------------------------------------------------------
		
		
		
		
		
		
		
		----------------------------------------------------------------------------------------
		-- Makes sure a message has been passed to the function
		----------------------------------------------------------------------------------------
		if (sMessage ~= nil) then
			if bError then
				sFullMessage = DEFAULT_COLOUR_1..AddonDetails..COLOUR_CLOSE..DEFAULT_ERROR_COLOUR..sMessage..COLOUR_CLOSE;
			else
				sFullMessage = DEFAULT_COLOUR_1..AddonDetails..COLOUR_CLOSE..DEFAULT_COLOUR_2..sMessage..COLOUR_CLOSE;
			end;
		else
			sMessage = "Message function called with a nil value! (Did you use self.Msg() instead of self:Msg()?";
			sFullMessage = DEFAULT_COLOUR_1..AddonDetails..COLOUR_CLOSE..DEFAULT_ERROR_COLOUR..sMessage..COLOUR_CLOSE;
		end;
		----------------------------------------------------------------------------------------
		
		
		
		if (sMessage == "Test") then
			ChatFrame4:AddMessage("Test is here! bDebug "..tostring(bDebug).." bDebugOn = "..tostring(bDebugOn).." Debug_Frame = "..tostring(Debug_Frame));
		end;
		
		
		
		--------------------------------------------------------------------------------------------
		-- Debug code that prints the debug messages in the window specified in the project header
		--------------------------------------------------------------------------------------------
		if bDebug and bDebugOn then -- This is a debug msg and the debug function for that function is turned on
			if (Debug_Frame == 1) then
				ChatFrame1:AddMessage(sFullMessage);
			elseif (Debug_Frame == 2) then
				ChatFrame2:AddMessage(sFullMessage);
			elseif (Debug_Frame == 3) then
				ChatFrame3:AddMessage(sFullMessage);
			elseif (Debug_Frame == 4) then
				ChatFrame4:AddMessage(sFullMessage);
			elseif (Debug_Frame == 5) then
				ChatFrame5:AddMessage(sFullMessage);
			elseif (Debug_Frame == 6) then
				ChatFrame6:AddMessage(sFullMessage);
			elseif (Debug_Frame == 7) then
				ChatFrame7:AddMessage(sFullMessage);
			end;
		end;
		--------------------------------------------------------------------------------------------
		
		
		
		
		--------------------------------------------------------------------------------------------
		-- Stores all messages in the debug log if it's turned on
		--------------------------------------------------------------------------------------------
		if HandyNotes_StoreDebugMsgs then
			local CurrentDebugLogNum = #(DebugLog);
			if CurrentDebugLogNum > 200000 then -- The array is HUGE! Stop debugging until this is deleted and inform the user
				HandyNotes_StoreDebugMsgs = false; -- Stops storing the debug msgs
				Msg("WARNING: The DebugLog is HUGE! To prevent errors debugging has been switched off. If you wern't asked to turn it on by an author then you should run '/FM WipeDebugLog' to clear this log and reduce memory usage.",false,DebugTxt,true);
			else -- Log is not to big so add to it as normal
				if (DebugLog[CurrentDebugLogNum + 1] == nil) then
					DebugLog[CurrentDebugLogNum + 1] = {};
				end;
				DebugLog[CurrentDebugLogNum + 1][time()] = sMessage
			end;
		end;
		--------------------------------------------------------------------------------------------
		
		
		
		
		
		
		--------------------------------------------------------------------------------------------
		-- Prints all normal messages in the normal chat window
		--------------------------------------------------------------------------------------------
		if (not bDebug) then -- If this is not a debug message
			print(sFullMessage); --Print the message in a normal chat frame
		end;
		--------------------------------------------------------------------------------------------
	end;
--======================================================================================================================================================


---------------------------------------------------------
-- Addon initialization, enabling and disabling
---------------------------------------------------------

function HNS:OnInitialize()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	-- Set up our database
	db = LibStub("AceDB-3.0"):New("HandyNotes_SpecialNPCsEtcDB", defaults)
	self.db = db

	if db.faction.dbversion > CURRENT_DB_VERSION then
		print("|cff6fafffHandyNotes_SpecialNPCsEtc:|r |cffff4f00Warning:|r Unknown database version. Please update to newer version.")
		print("|cff6fafffHandyNotes_SpecialNPCsEtc:|r |cffff4f00Warning:|r Addon has been disabled to protect your database.")
		self:Disable()
		return
	end

	if db.faction.dbversion ~= CURRENT_DB_VERSION then
		if db.faction.dbversion == 0 then 
			-- addon was just installed or using pre-versioned DB 
			if next(db.faction.nodes, nil) then -- DB not empty -> first version
				db.faction.dbversion = 1
			else
				db.faction.dbversion = CURRENT_DB_VERSION 
			end
		end

		if db.faction.dbversion == 1 then
			db.faction.dbversion = 2 -- just adds npcID to the end of info string
		end
	end

	-- Initialize our database with HandyNotes
	HandyNotes:RegisterPluginDB("SpecialNPCsEtc", HNSHandler, options)
end

function HNS:OnEnable()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	self:RegisterEvent("GOSSIP_SHOW")
	self:RegisterEvent("AUCTION_HOUSE_SHOW")
	self:RegisterEvent("GUILDBANKFRAME_OPENED")
	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("BATTLEFIELDS_SHOW")
	self:RegisterEvent("PET_STABLE_SHOW")
	self:RegisterEvent("CONFIRM_XP_LOSS")
	self:RegisterEvent("TRAINER_SHOW")
end


function HNS:TRAINER_SHOW()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:TRAINER_SHO",true,DebugTxt);
	self:Opened_NPC("TRAINER_SHOW");
end

function HNS:AUCTION_HOUSE_SHOW()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:AUCTION_HOUSE_SHOW",true,DebugTxt);
	self:Opened_NPC(L["Auctioneer"]);

end

function HNS:BANKFRAME_OPENED()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:BANKFRAME_OPENED",true,DebugTxt);
	self:Opened_NPC(L["Banker"]);
end

function HNS:GUILDBANKFRAME_OPENED()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:GUILDBANKFRAME_OPENED",true,DebugTxt);
	local vNpcid = 0; -- As this is not a real NPC or person then they don't have a NPC ID
	local vName = GetRealZoneText();
	local vGuild = "Guild Vault";
	local vType = "GuildVault";
	self:AddSpecialNPCsEtcNote(vNpcid, vName, vGuild, vType);
end

function HNS:BATTLEFIELDS_SHOW()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:BATTLEFIELDS_SHOW",true,DebugTxt);
	self:Opened_NPC(L["Battlemaster"]);
end

function HNS:PET_STABLE_SHOW()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:PET_STABLE_SHOW",true,DebugTxt);
	self:Opened_NPC(L["Stable Master"]);

end

function HNS:CONFIRM_XP_LOSS()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:CONFIRM_XP_LOSS",true,DebugTxt);
	self:Opened_NPC(L["SpiritHealer"]);
end

function HNS:GOSSIP_SHOW()
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	
	Msg("HNS:GOSSIP_SHOW",true,DebugTxt);
	self:Opened_NPC();
end

local filters = {"available", "unavailable", "used"}
local filtersrestore = {}

function HNS:Opened_NPC(sType)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
		
	Msg("HNS:Opened_NPC",true,DebugTxt);
	local vName = UnitName("npc")
	local vGuild = FigureNPCGuild("npc")
	local vType = nil
	
	local vGUID = UnitGUID("npc")
	local vNpcid = "";
	
	if (not(vGUID == nil)) then
		vNpcid = tonumber(vGUID:sub(-12, -7), 16);
	end;
	
	Msg("VGuild = "..tostring(VGuild),true,DebugTxt);
	if ((vGuild == nil) and (sType ~= nil or strlen(sType) > 0)) then
		vGuild = sType;
	end
	
	if (sType == "TRAINER_SHOW") and IsTradeskillTrainer() then
		for i,f in ipairs(filters) do
			if GetTrainerServiceTypeFilter(f) ~= 1 then
				SetTrainerServiceTypeFilter(f, 1)
				filtersrestore[f] = true
			else
				filtersrestore[f] = nil
			end
		end

		vType = GetTrainerServiceSkillLine(2)

		for f,v in pairs(filtersrestore) do
			if v then
				SetTrainerServiceTypeFilter(f, 0)
			end
		end
	elseif string_find(vGuild, L["Weapon Master"]) then
		Msg("HT:Opened_NPC() - WeaponMaster",true,DebugTxt);
		vType = "WeaponMaster"
	elseif string_find(vGuild, L["Portal Trainer"]) then
		Msg("HT:Opened_NPC() - Portal",true,DebugTxt);
		vType = "Portal"
	elseif string_find(vGuild, L["Pet Trainer"]) then
		Msg("HT:Opened_NPC() - Pet",true,DebugTxt);
		vType = "Pet"
	elseif string_find(vGuild, L["Riding Trainer"]) or string_find(vGuild, L["Mechanostrider Pilot"]) then
		Msg("HT:Opened_NPC() - Riding",true,DebugTxt);
		vType = "Riding"
	elseif string_find(vGuild, L["Cold Weather Flying Trainer"]) then
		Msg("HT:Opened_NPC() - ColdFlying",true,DebugTxt);
		vType = "ColdFlying"
		
	-- These are for when you don't have the ablity to learn this skill so it adds it anyway.
	elseif string_find(vGuild, L["Paladin Trainer"]) then
		Msg("HT:Opened_NPC() - PALADIN",true,DebugTxt);
		vType = "PALADIN"
	elseif string_find(vGuild, L["Mage Trainer"]) then
		Msg("HT:Opened_NPC() - MAGE",true,DebugTxt);
		vType = "MAGE"
	elseif string_find(vGuild, L["Druid Trainer"]) then
		Msg("HT:Opened_NPC() - DRUID",true,DebugTxt);
		vType = "DRUID"
	elseif string_find(vGuild, L["Hunter Trainer"]) then
		Msg("HT:Opened_NPC() - HUNTER",true,DebugTxt);
		vType = "HUNTER"
	elseif string_find(vGuild, L["Priest Trainer"]) then
		Msg("HT:Opened_NPC() - PRIEST",true,DebugTxt);
		vType = "PRIEST"
	elseif string_find(vGuild, L["Rogue Trainer"]) then
		Msg("HT:Opened_NPC() - ROGUE",true,DebugTxt);
		vType = "ROGUE"
	elseif string_find(vGuild, L["Sharman Trainer"]) then
		Msg("HT:Opened_NPC() - SHAMAN",true,DebugTxt);
		vType = "SHAMAN"
	elseif string_find(vGuild, L["Warlock Trainer"]) then
		Msg("HT:Opened_NPC() - WARLOCK",true,DebugTxt);
		vType = "WARLOCK"
	elseif string_find(vGuild, L["Warrior Trainer"]) then
		Msg("HT:Opened_NPC() - WARRIOR",true,DebugTxt);
		vType = "WARRIOR"
	elseif string_find(vGuild, L["Deathknight Trainer"]) then
		Msg("HT:Opened_NPC() - DEATHKNIGHT",true,DebugTxt);
		vType = "DEATHKNIGHT"
		
		
		
	elseif string_find(vGuild, L["Mining Trainer"]) then
		Msg("HT:Opened_NPC() - Mining Trainer",true,DebugTxt);
		vType = "Mining"
	elseif string_find(vGuild, L["Armorsmith"]) then
		Msg("HT:Opened_NPC() - Armorsmith",true,DebugTxt);
		vType = "Armorsmith"
	elseif string_find(vGuild, L["Blacksmithing Trainer"]) then
		Msg("HT:Opened_NPC() - Blacksmithing",true,DebugTxt);
		vType = "Blacksmithing"
	elseif string_find(vGuild, L["Weaponsmith Trainer"]) then
		Msg("HT:Opened_NPC() - Blacksmithing",true,DebugTxt);
		vType = "Weaponsmith"
	elseif string_find(vGuild, L["Axesmithing"]) then
		Msg("HT:Opened_NPC() - Blacksmithing",true,DebugTxt);
		vType = "Axesmithing"
	elseif string_find(vGuild, L["Hammersmithing"]) then
		Msg("HT:Opened_NPC() - Hammersmithing",true,DebugTxt);
		vType = "Hammersmithing"
	elseif string_find(vGuild, L["Swordsmithing"]) then
		Msg("HT:Opened_NPC() - Swordsmithing",true,DebugTxt);
		vType = "Swordsmithing"
		
		
		
	-- Non-Trainer NPCs
	elseif string_find(vGuild, L["Innkeeper"]) then
	Msg("HNS:Opened_NPC - Innkeeper",true,DebugTxt);
		vType = "Innkeeper"
	elseif string_find(vGuild, L["Auctioneer"]) then
	Msg("HNS:Opened_NPC - Auctioneer",true,DebugTxt);
		vType = "Auctioneer"
	elseif string_find(vGuild, L["Banker"]) then
	Msg("HNS:Opened_NPC - Banker",true,DebugTxt);
		vType = "Banker"
	elseif string_find(vGuild, L["Stable Master"]) then
	Msg("HNS:Opened_NPC - Stable",true,DebugTxt);
		vType = "Stable"
	elseif string_find(vGuild, L["Battlemaster"]) then
	Msg("HNS:Opened_NPC - Battlemaster",true,DebugTxt);
		vType = "Battlemaster"
	end
    
	Msg("vGuild = "..tostring(vGuild).." vName = "..tostring(vName).." vGUID = "..tostring(vGUID),true,DebugTxt);
	
	if vType then
		Msg("HNS:Opened_NPC() - vNpcid = "..tostring(vNpcid)..", vName = "..tostring(vName)..", vGuild = "..tostring(vGuild)..", vType = "..tostring(vType),true,DebugTxt);
		self:AddSpecialNPCsEtcNote(vNpcid, vName, vGuild, vType)
	end
end

local thres = 5 -- in yards
function HNS:AddSpecialNPCsEtcNote(vNpcid, vName, vGuild, vType)
	----------------------------------------------
	-- Default: If DebugTxt is set to true all of
	-- the debug msgs in THIS function will apear!
	----------------------------------------------
	local DebugTxt = false;
	-- DebugTxt = true; -- Uncomment this to debug
	----------------------------------------------
	
	Msg("HNS:AddSpecialNPCsEtcNote: "..tostring(vName),true,DebugTxt);
    
    local mapID, floor, x, y = Astrolabe:GetCurrentPlayerPosition()
	if not vName or not mapID then
		Msg("HNS:AddSpecialNPCsEtcNote: not vName("..tostring(vName)..") or not mapID("..tostring(mapID)..")",true,DebugTxt);
		return
	end
    
	local vInfo1 = vType .. ":" .. vName .. ":" .. vGuild
	local vInfo2 = vType .. ":" .. vName .. ":" .. vGuild .. ":" .. vNpcid
    
	local coord = HandyNotes:getCoord(x, y)
	local mapFile = HandyNotes:GetMapIDtoMapFile(mapID)
	if mapFile then
		for coords, name in pairs(db.faction.nodes[mapFile]) do
			if vInfo1 == name or vInfo2 == name then
				local cx, cy = HandyNotes:getXY(coords)
                local dist = Astrolabe:ComputeDistance(mapID, floor, x, y, mapID, floor, cx, cy)
				-- SpecialNPCsEtc already exists here
                if dist <= thres then
					-- Let's not move, just update vInfo
                    coord = coords
				-- If this is def an NPC and the SpecialNPCsEtc exists on different location = has moved -> delete old info
                elseif (vNpcid > 0) then
					db.faction.nodes[mapFile][coords] = nil
				end
			end
		end
		
		Msg("vInfo2 = "..tostring(vInfo2),true,DebugTxt);
		
		db.faction.nodes[mapFile][coord] = vInfo2
		self:SendMessage("HandyNotes_NotifyUpdate", "SpecialNPCsEtc")
	end
end
