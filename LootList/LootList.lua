-- LootList
--
-- Created by Mackenz, Server: Dragonblight
--

-- Constant (non-localised) Global Data
--
-- LootList Scroll Frame Heights
LOOTLIST_LISTS_LIST_FRAME_HEIGHT			= 16;		-- Lists list frame
LOOTLIST_LISTS_EDIT_FRAME_HEIGHT			= 20;		-- Lists edit frame (w/ buttons, edits)

-- Constant (non-localised) Local Data
--
-- Version
local	LOOTLIST_VERSION					= GetAddOnMetadata("LootList", "Version");

-- WoW Constants
local	LOOTLIST_TEXT_PIPE					= "\124";
local	LOOTLIST_TEXT_PIPE_ENC				= "\124\124";

-- Enumerated Constants
local	LOOTLIST_ENTRY_TYPE					= { EDIT=1, LISTS=2 };
local	LOOTLIST_IMPORT_TYPE				= { ITEM=1, ALLAKHAZAM=2, ARMORY=3, THOTTBOT=4, WOWHEAD=5 };
local	LOOTLIST_EXPORT_TYPE				= { TEXT=1, LINK=2, HTML=3, BBC=4, ITEM=5 };
local	LOOTLIST_METRICS_TYPE				= { EDIT=1, VIEW=2 };

-- WoW Version/TOC Formats
local	LOOTLIST_VERSION_WOW				= "^(%d+)%.(%d+)%.(%d+)$";
local	LOOTLIST_VERSION_TOC				= "%d%02d%02d";

-- Regular Constants
local	LOOTLIST_CHECK_PERIOD				= 10.000;			-- 10 seconds between group loot/loot window reporting

local	LOOTLIST_METRIC_FORMAT				= "%0.1f";

local	LOOTLIST_ITEMID_FORMAT				= "|cff%s|Hitem:%s:0:0:0:0:0:0:0:0:0:0|h[%s]|h|r";

local	LOOTLIST_ITEMID_PATTERN				= "|c%x+|Hitem:(%d+):%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:%d+:%d+|h%[.-%]|h|r";
local	LOOTLIST_ITEMNAME_PATTERN			= "|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:%d+:%d+|h%[(.-)%]|h|r";
local	LOOTLIST_ITEMPART_PATTERN			= "|c%x%x(%x+)|Hitem:(%d+):.-|h%[(.-)%]|h|r";
local	LOOTLIST_ITEMFULL_PATTERN			= "|c%x%x(%x+)|Hitem:(%d+):%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:%d+:%d+|h%[(.-)%]|h|r";
local	LOOTLIST_ITEMFULLID_PATTERN			= "|c%x%x(%x+)|Hitem:(%d+:%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:%d+:%d+)|h%[(.-)%]|h|r";

local	LOOTLIST_ITEMQUAL_UNCACHED			= "ff0000";

local	LOOTLIST_TEXT_RED					= "|cffff0000";
local	LOOTLIST_TEXT_GREEN					= "|cff1eff00";
local	LOOTLIST_TEXT_BLUE					= "|cff0070dd";
local	LOOTLIST_TEXT_GREY					= "|cff999999";
local	LOOTLIST_TEXT_WHITE					= "|cffffffff";
local	LOOTLIST_TEXT_PURPLE				= "|cff9f3fff";
local	LOOTLIST_TEXT_ORANGE				= "|cffff8400";

local	LOOTLIST_COLOR_RED					= { r=1.00, g=0.00, b=0.00, a=1.00 };
local	LOOTLIST_COLOR_GREEN				= { r=0.12, g=1.00, b=0.00, a=1.00 };
local	LOOTLIST_COLOR_BLUE					= { r=0.00, g=0.44, b=0.87, a=1.00 };
local	LOOTLIST_COLOR_GREY					= { r=0.63, g=0.63, b=0.63, a=1.00 };
local	LOOTLIST_COLOR_WHITE				= { r=1.00, g=1.00, b=1.00, a=1.00 };
local	LOOTLIST_COLOR_PURPLE				= { r=0.63, g=0.25, b=1.00, a=1.00 };
local	LOOTLIST_COLOR_ORANGE				= { r=1.00, g=0.52, b=0.00, a=1.00 };

-- Import Constants
local	LOOTLIST_IMPORT_ITEMITEMID			= "%s*(%d+)(.-)\n";
local	LOOTLIST_IMPORT_ITEMITEMTEXT		= "%s*=%s*([^%s]+)%s*";

-- Allakhazam: = http://wow.allakhazam.com/db/item.html?witem=<itemid> -> ".-wow%.allakhazam%.com/db/item%.html%?witem=(%d+).-\n"
local	LOOTLIST_IMPORT_ALLAKHAZAMITEMID	= ".-%?witem=(%d+)\n";

-- Armory: = http://www.wowarmory.com/item-info.xml?i=<itemid> -> ".-[a-z]-%.wowarmory%.com/item%-info%.xml%?i=(%d+).-\n"
local	LOOTLIST_IMPORT_ARMORYITEMID		= ".-%?i=(%d+)\n";

-- Thottbot: = http://thottbot.com/i<itemid> -> ".-thottbot%.com/i(%d+).-\n"
local	LOOTLIST_IMPORT_THOTTBOTITEMID		= ".-/i(%d+)\n";

-- Wowhead: = http://www.wowhead.com/item=<itemid> -> ".-www%.wowhead%.com/item=(%d+).-\n
local	LOOTLIST_IMPORT_WOWHEADITEMID		= ".-/item=(%d+)\n";

-- Export Constants
local	LOOTLIST_EXPORT_NAMEITEM			= "%s\n";
local	LOOTLIST_EXPORT_NAMETEXT			= "%s\n\n";
local	LOOTLIST_EXPORT_NAMELINK			= "%s\n\n";
local	LOOTLIST_EXPORT_NAMEHTML			= "<p>%s</p>\n";
local	LOOTLIST_EXPORT_NAMEBBC				= "%s\n";
local	LOOTLIST_EXPORT_LISTOITEM			= "";
local	LOOTLIST_EXPORT_LISTOTEXT			= "";
local	LOOTLIST_EXPORT_LISTOLINK			= "";
local	LOOTLIST_EXPORT_LISTOHTML			= "<ol style=\"list-style-type: decimal\">\n";
local	LOOTLIST_EXPORT_LISTOBBC			= "[list=1]";
local	LOOTLIST_EXPORT_LISTCITEM			= "";
local	LOOTLIST_EXPORT_LISTCTEXT			= "";
local	LOOTLIST_EXPORT_LISTCLINK			= "";
local	LOOTLIST_EXPORT_LISTCHTML			= "</ol>\n";
local	LOOTLIST_EXPORT_LISTCBBC			= "[/list]";
local	LOOTLIST_EXPORT_ITEMITEM			= "%s=%s\n";
local	LOOTLIST_EXPORT_ITEMTEXT			= "%s - %s\n";
local	LOOTLIST_EXPORT_ITEMLINK			= "%s\n";
local	LOOTLIST_EXPORT_ITEMHTML			= "<li><span style=\"color: \#%s;\">[%s]</span> - %s</li>\n";
local	LOOTLIST_EXPORT_ITEMBBC				= "[*][item]%s[/item] - %s\n";

-- LootList Scroll Frame Lines
local	LOOTLIST_LISTS_LIST_LINES			= 5;
local	LOOTLIST_LISTS_EDIT_LINES			= 8;

-- LootList Metric Holders
local	LOOTLIST_LISTS_METRICS				= 3;

-- Initial Options
local	LootList_Options_Default			=
{
	MiniMap									= true;
	MiniMapPos								= 300;
	MiniMapRad								= 80;
	
	AutoAppend								= true;
	
	EchoNotice								= true;
	PlaySound								= false;
	FoundLoot								= true;
	FoundGroup								= true;
	FoundMLChat								= true;
	FoundLeadChat							= true;
	FoundWarnChat							= true;
	
	ImportFormat							= LOOTLIST_IMPORT_TYPE.ITEM;
	ExportFormat							= LOOTLIST_EXPORT_TYPE.TEXT;
};

-- Saved Variables
LootList_Options							= {};

LootList_Lists								= {};

-- Local Variables
local	LootList_Initialised				= false;	-- Lnitialised

local	LootList_VersionWoW					= nil;		-- WoW Version (TOC format)

local	LootList_ListsSel					= nil;		-- Lists list selected
local	LootList_ListsSort					= {};		-- Lists list sort

local	LootList_Edit						= nil;		-- List being edited
local	LootList_Name						= nil;		-- List name edited

local	LootList_EditSel					= nil;		-- Lists edit selected
local	LootList_EditMetrics				= LOOTLIST_METRICS_TYPE.VIEW;

local	LootList_ItemID						= nil;		-- Lists itemID
local	LootList_ItemLink					= nil;		-- Lists item link

local	LootList_Timer						= nil;		-- Check timer

local	LootList_ItemQueried				= {};		-- Queried item ID

local	LootList_MasterLooter				= nil;		-- Master Looter

-- Load handler
function LootList_OnLoad(self)
	-- hook events
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");

	self:RegisterEvent("CHAT_MSG_RAID");
	self:RegisterEvent("CHAT_MSG_PARTY");
	self:RegisterEvent("CHAT_MSG_RAID_LEADER");
	self:RegisterEvent("CHAT_MSG_RAID_WARNING");
	self:RegisterEvent("CHAT_MSG_PARTY_LEADER");
	
	self:RegisterEvent("RAID_ROSTER_UPDATE");
	self:RegisterEvent("PARTY_LEADER_CHANGED");
	self:RegisterEvent("PARTY_MEMBERS_CHANGED");
	self:RegisterEvent("PARTY_LOOT_METHOD_CHANGED");
	
	self:RegisterEvent("START_LOOT_ROLL");

	self:RegisterEvent("LOOT_OPENED");

	-- hook command handler
	SLASH_LOOTLIST1 = "/lootlist";
	SLASH_LOOTLIST2 = "/ll";

	SlashCmdList["LOOTLIST"] = LootList_OnCommand;

	-- create a dialog for item note
	StaticPopupDialogs["LOOTLIST_PROMPT_LIST_NOTE"] =
	{
		text					= TEXT(LOOTLIST_PROMPT_LIST_NOTE),
		button1					= TEXT(ACCEPT),
		button2					= TEXT(CANCEL),
		hasEditBox				= 1,
		maxLetters				= 127,
		editBoxWidth			= 350,
		countInvisibleLetters	= true,
		OnShow					=	function(self)
										local entry;

										-- get item entry
										entry = LootList_GetItemEntry();

										-- set the text from the passed data, which is the edit list item index
										if (entry.List[entry.Sort[self.data]].Note == nil) then
											self.editBox:SetText("");
										else
											self.editBox:SetText(entry.List[entry.Sort[self.data]].Note);
										end

										-- select and highlight current text
										self.editBox:SetFocus();
										self.editBox:HighlightText();
									end,
		OnHide					=	function(self)
										if (ChatEdit_GetActiveWindow() ~= nil) then
											ChatEdit_GetActiveWindow():SetFocus();
										end

										self.editBox:SetText("");
									end,
		OnAccept				=	function(self)
										local entry, note;

										-- get item entry
										entry = LootList_GetItemEntry();

										-- snarf the entered note, or reset it as required
										note = self.editBox:GetText();

										if (note == "") then
											-- reset note
											note = nil;
										end
										
										entry.List[entry.Sort[self.data]].Note = note;
	
										-- update the lists edit
										LootList_Lists_Edit_Update();
									end,
		EditBoxOnEnterPressed	=	function(self)
										local entry, note;

										-- get item entry
										entry = LootList_GetItemEntry();

										-- snarf the entered note, or reset it as required
										note = self:GetText();

										if (note == "") then
											-- reset note
											note = nil;
										end
										
										entry.List[entry.Sort[self:GetParent().data]].Note = note;
	
										-- update the lists edit
										LootList_Lists_Edit_Update();

										-- thats all folks
										self:GetParent():Hide();
									end,
		EditBoxOnEscapePressed	=	function(self)
										self:GetParent():Hide();
									end,
		timeout					= 0,
		exclusive				= 1,
		whileDead				= 1,
		hideOnEscape			= 1
	};	

	-- create a dialog for list deletion
	StaticPopupDialogs["LOOTLIST_PROMPT_LIST_DELETE"] =
	{
		text					= TEXT(LOOTLIST_PROMPT_LIST_DELETE),
		button1					= TEXT(YES),
		button2					= TEXT(CANCEL),
		OnAccept				=	function(self)
										LootList_Lists_ListDelete_OnAccept();
									end,
		OnCancel				=	function(self)
										LootList_Lists_ListDelete_OnCancel();
									end,
		timeout					= 0,
		exclusive				= 1,
		whileDead				= 1,
		hideOnEscape			= 1
	};

	-- echo current version
	print(string.format(LOOTLIST_MSG_LOAD, LOOTLIST_VERSION));
end

-- Event handler
function LootList_OnEvent(self, event, ...)
	local	arg1, arg2 = ...;

	-- determine event
	if		(event == "ADDON_LOADED") then
		LootList_ADDON_Load(...);
	elseif	(event == "PLAYER_ENTERING_WORLD") then
		LootList_PLAYER_Enter();
	elseif	(event == "CHAT_MSG_RAID") then
		LootList_MSG_PartyRaid(arg1, arg2);
	elseif	(event == "CHAT_MSG_RAID_LEADER") then
		LootList_MSG_PartyRaid(arg1, arg2, LootList_Options.FoundLeadChat);
	elseif	(event == "CHAT_MSG_RAID_WARNING") then
		LootList_MSG_PartyRaid(arg1, arg2, LootList_Options.FoundWarnChat);
	elseif	(event == "CHAT_MSG_PARTY_LEADER") then
		LootList_MSG_PartyRaid(arg1, arg2, LootList_Options.FoundLeadChat);
	elseif	(event == "RAID_ROSTER_UPDATE") then
		LootList_GROUP_Change();
	elseif	(event == "PARTY_LEADER_CHANGED") then
		LootList_GROUP_Change();
	elseif	(event == "PARTY_MEMBERS_CHANGED") then
		LootList_GROUP_Change();
	elseif	(event == "PARTY_LOOT_METHOD_CHANGED") then
		LootList_GROUP_Change();
	elseif	(event == "START_LOOT_ROLL") then
		LootList_LOOT_Rolled(arg1, arg2);
	elseif	(event == "LOOT_OPENED") then
		LootList_LOOT_Opened();
	end
end

-- Addon Load handler
function LootList_ADDON_Load(addon)
	local	key, value;

	-- is this LootList?
	if (addon ~= LOOTLIST_LABEL_LOOTLIST) then
		-- not me
		return;
	end

	-- initialise session
	for key, value in pairs(LootList_Options_Default) do
		if (LootList_Options[key] == nil) then
			LootList_Options[key] = value;
		end
	end

	-- retrieve WoW version
	LootList_VersionWoW = LootList_GetWoWVersion();

	-- initialise frame
	LootList_FrameVersionFrameVersion:SetText(LOOTLIST_VERSION);
end

-- Player Enter handler
function LootList_PLAYER_Enter()
	-- don't bother to initialise twice
	if (LootList_Initialised == true) then
		return;
	end

	-- initialise attempted
	LootList_Initialised = true;

	-- secure hook chat edit insert link handler
	hooksecurefunc("ChatEdit_InsertLink", LootList_ChatEdit_InsertLink)

	-- initialise options tab
	LootList_OptionsFrameMiniMapButton:SetChecked(LootList_Options.MiniMap);

	LootList_OptionsFrameMiniMapPosSlider:SetValue(LootList_Options.MiniMapPos);
	LootList_OptionsFrameMiniMapPosSliderText:SetText(LootList_Options.MiniMapPos);

	LootList_OptionsFrameMiniMapRadSlider:SetValue(LootList_Options.MiniMapRad);
	LootList_OptionsFrameMiniMapRadSliderText:SetText(LootList_Options.MiniMapRad);

	LootList_OptionsFrameAutoAppendButton:SetChecked(LootList_Options.AutoAppend);

	LootList_OptionsFrameEchoNoticeButton:SetChecked(LootList_Options.EchoNotice);
	LootList_OptionsFramePlaySoundButton:SetChecked(LootList_Options.PlaySound);
	LootList_OptionsFrameFoundLootButton:SetChecked(LootList_Options.FoundLoot);
	LootList_OptionsFrameFoundGroupButton:SetChecked(LootList_Options.FoundGroup);
	LootList_OptionsFrameFoundMLChatButton:SetChecked(LootList_Options.FoundMLChat);
	LootList_OptionsFrameFoundLeadChatButton:SetChecked(LootList_Options.FoundLeadChat);
	LootList_OptionsFrameFoundWarnChatButton:SetChecked(LootList_Options.FoundWarnChat);
	
	-- initialise import frame
	LootList_ImportFrameFormatItem:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ITEM);
	LootList_ImportFrameFormatAllakhazam:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ALLAKHAZAM);
	LootList_ImportFrameFormatArmory:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ARMORY);
	LootList_ImportFrameFormatThottbot:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.THOTTBOT);
	LootList_ImportFrameFormatWowhead:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.WOWHEAD);
	
	-- initialise export frame
	LootList_ExportFrameFormatText:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.TEXT);
	LootList_ExportFrameFormatLink:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.LINK);
	LootList_ExportFrameFormatHTML:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.HTML);
	LootList_ExportFrameFormatBBC:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.BBC);
	LootList_ExportFrameFormatItem:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.ITEM);

	-- reflect the position
	LootList_MiniMapButton_Update();
	
	-- and show/hide the MiniMap button and hide/show the title
	LootList_MiniMapButton_SwitchState();
	
	-- lists frame is initially shown
	LootList_ChangeFrame_OnClick();
	
	-- update lists list
	LootList_Lists_List_Sort();
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists list UI
	LootList_Lists_List_UpdateUI();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Raid/Party Chat Message handler
function LootList_MSG_PartyRaid(msg, player, chatType)
	-- see if we are checking ML chat
	if		((LootList_Options.FoundMLChat == true) and (LootList_MasterLooter == player)) then
		-- this is the master looter
		LootList_GetTextItemIDs(msg);
	elseif	(chatType == true) then
		-- this is chat to be checked
		LootList_GetTextItemIDs(msg);
	end
end

-- Group Change handler
function LootList_GROUP_Change()
	local	_, partyIx, raidIx;
	
	-- no master looter yet
	LootList_MasterLooter = nil;

	-- grab the master looter party/raid index
	_, partyIx, raidIx = GetLootMethod();

	-- do we have a party index?
	if		(partyIx ~= nil) then
		-- is it us?
		if (partyIx == 0) then
			LootList_MasterLooter = UnitName("player");
		else
			LootList_MasterLooter = UnitName("party"..partyIx);
		end
	elseif	(raidIx ~= nil) then
		LootList_MasterLooter = UnitName("raid"..raidIx);
	end
end

-- Loot Rolling handler
function LootList_LOOT_Rolled(rollID, rollTime)
	local	_, itemIDSet, itemID;

	-- no item IDs yet
	itemIDSet= {};
	
	-- extract group loot item ID
	_, _, itemID = string.find(GetLootRollItemLink(rollID), LOOTLIST_ITEMID_PATTERN);
	
	-- add to set of items
	itemIDSet[itemID] = true;
	
	-- check lists for item IDs
	LootList_CheckListItems(itemIDSet, true);
end

-- Loot Opened handler
function LootList_LOOT_Opened()
	local	_, slotCount, slotIx, itemIDSet, itemID;
	
	-- get count of slots
	slotCount = GetNumLootItems();

	-- no item IDs yet
	itemIDSet= {};
	
	-- retrive the link to each loot item
	for slotIx=1, slotCount do
		-- make sure this is a loot item
		if (LootSlotHasItem(slotIx) == true) then
			-- extract this item ID
			_, _, itemID = string.find(GetLootSlotLink(slotIx), LOOTLIST_ITEMID_PATTERN);

			-- add to list of items
			itemIDSet[itemID] = true;
		end
	end
	
	-- check lists for item IDs
	LootList_CheckListItems(itemIDSet, true);
end

-- Chat Edit InsertLink handler
function LootList_ChatEdit_InsertLink(text)
	-- ignore nil links or if  the chat frame editbox is visible
	if ((text ~= nil) and not ChatEdit_GetActiveWindow()) then
		-- snarf item link
		LootList_SetItemLink(text);
	end
end

-- Command handler
function LootList_OnCommand(cmd)
	local	help, helpIx, msg;

	-- handle command
	if		(cmd == "") then
		-- show help
		help = true;
	elseif	(cmd == LOOTLIST_CMD_HELP) then
		-- show help
		help = true;
	elseif	(cmd == LOOTLIST_CMD_SHOW) then
		-- show UI
		LootList_OnToggle(self, true);
	elseif	(cmd == LOOTLIST_CMD_HIDE) then
		-- hide UI
		LootList_OnToggle(self, false);
	elseif	(cmd == LOOTLIST_CMD_RESETUI) then
		-- reset the position
		LootList_Options_ResetUI_OnClick(self);
	else
		-- show help
		help = true;
	end

	-- are we to show help?
	if (help == true) then
		-- hammer through displaying help lines
		helpIx = 1;

		while (_G["LOOTLIST_HELP_LINE"..helpIx] ~= nil) do
			print(_G["LOOTLIST_HELP_LINE"..helpIx]);

			-- bump index
			helpIx = helpIx + 1;
		end;
	end
end

-- UI Toggle handler
function LootList_OnToggle(self, visible)
	-- handle toggling of the UI
	if		((visible == false) or ((visible == nil) and LootList_Frame:IsVisible())) then
		PlaySound("igMiniMapClose");

		-- hide the loot list, import and export frame
		LootList_Frame:Hide();

		LootList_ImportClose_OnClick(LootList_ImportFrameClose);
		LootList_ExportClose_OnClick(LootList_ExportFrameClose);
	elseif	((visible == true) or ((visible == nil) and not LootList_Frame:IsVisible())) then
		PlaySound("igMiniMapOpen");

		-- show the loot list
		LootList_Frame:Show();
	end
end

-- Change Frame Click handler
function LootList_ChangeFrame_OnClick(self)
	-- determine which frame is visible, and flip to the other.  Lists frame is default
	if (LootList_OptionsFrame:IsVisible() or not LootList_ListsFrame:IsVisible()) then
		-- hide options frame
		LootList_OptionsFrame:Hide();
		
		-- show lists frame
		LootList_ListsFrame:Show();
		
		-- set change frame text
		LootList_FrameChange:SetText(LOOTLIST_LABEL_OPTIONS);
	else
		-- hide lists frame
		LootList_ListsFrame:Hide();
		
		-- show options frame
		LootList_OptionsFrame:Show();
		
		-- set change frame text
		LootList_FrameChange:SetText(LOOTLIST_LABEL_LISTS);
	end
end

-- Change Frame Enter handler
function LootList_ChangeFrame_OnEnter(self)
	-- determine tooltip text
	if (LootList_OptionsFrame:IsVisible() or not LootList_ListsFrame:IsVisible()) then
		-- change to lists tab
		return LOOTLIST_FRAME_LISTS_TT;
	else
		-- change to options tab
		return LOOTLIST_FRAME_OPTIONS_TT;
	end
end

-- User Interface Close handler
function LootList_Close_OnClick(self)
	-- hide UI
	LootList_OnToggle(self, false);
end

-- Lists List Button Click handler
function LootList_Lists_List_Button_OnClick(self)
	-- ignore if we are editing
	if (LootList_Edit ~= nil) then
		return;
	end

	-- snarf selected list
	LootList_ListsSel = self:GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameListFrameScrollFrame);
	
	-- update lists list
	LootList_Lists_List_Sort();
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists list UI
	LootList_Lists_List_UpdateUI();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- refresh data export
	LootList_Export_Refresh_OnClick(LootList_ExportFrameRefresh);
end

-- Lists List Button Enter handler
function LootList_Lists_List_Button_OnEnter(self)
	-- no tooltip yet
	return "";
end

-- Lists List Create Click handler
function LootList_Lists_ListCreate_OnClick(self)
	-- start a new empty list
	LootList_Edit = LootList_NewEdit();
	
	-- new name prompt
	LootList_Name = LOOTLIST_LISTS_NAME_DEFAULT;

	-- set name text
	LootList_ListsFrameListName:SetText(LootList_Name);

	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists list UI
	LootList_Lists_List_UpdateUI();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();

	-- set focus to name and highlight current text
	LootList_ListsFrameListName:SetFocus(true);
	LootList_ListsFrameListName:HighlightText();

	-- set initial metrics toggle
	LootList_Lists_ChangeMetrics_OnClick();

	-- close export frame
	LootList_ExportClose_OnClick(LootList_ExportFrameClose);
end

-- Lists List Modify Click handler
function LootList_Lists_ListModify_OnClick(self)
	-- copy the selected list
	LootList_Edit = LootList_CopyTable(LootList_Lists[LootList_ListsSort[LootList_ListsSel]]);
	
	-- copy name
	LootList_Name = LootList_ListsSort[LootList_ListsSel];

	-- set name text
	LootList_ListsFrameListName:SetText(LootList_Name);

	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists list UI
	LootList_Lists_List_UpdateUI();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();

	-- set initial metrics toggle
	LootList_Lists_ChangeMetrics_OnClick();

	-- close export frame
	LootList_ExportClose_OnClick(LootList_ExportFrameClose);
end

-- Lists List Delete Click handler
function LootList_Lists_ListDelete_OnClick(self)
	-- show lists delete dialog
	StaticPopup_Show("LOOTLIST_PROMPT_LIST_DELETE");
end

-- Lists List Delete Accept handler
function LootList_Lists_ListDelete_OnAccept()
	-- smoke this lists entry
	LootList_Lists[LootList_ListsSort[LootList_ListsSel]] = nil;
	
	-- adjust selected list as necessary
	if		(#LootList_ListsSort == 1) then
		-- nothing selected
		LootList_ListsSel = nil;
	elseif	(LootList_ListsSel >= #LootList_ListsSort) then
		-- select previous guy
		LootList_ListsSel = LootList_ListsSel - 1;
	end
		
	-- update lists list
	LootList_Lists_List_Sort();
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists list UI
	LootList_Lists_List_UpdateUI();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();

	-- refresh export list as necessary
	LootList_Export_Refresh_OnClick(LootList_ExportFrameRefresh);
end

-- Lists List Delete Cancel handler
function LootList_Lists_ListDelete_OnCancel()
end

-- Lists List Name Focus Gained handler
function LootList_Lists_ListName_OnFocusGained(self)
end

-- Lists List Name Text Changed handler
function LootList_Lists_ListName_OnTextChanged(self)
	-- snarf new name
	LootList_Name = LootList_ListsFrameListName:GetText();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
end

-- Lists List Name Focus Lost handler
function LootList_Lists_ListName_OnFocusLost(self)
end

-- Lists Save handler
function LootList_Lists_Save_OnClick(self)
	-- add this guy to the lists
	LootList_Lists[LootList_Name] = LootList_Edit;
	
	-- update lists list
	LootList_Lists_List_Sort();
	
	-- and discard to reset editing
	LootList_Lists_Discard_OnClick(self);
end

-- Lists Discard handler
function LootList_Lists_Discard_OnClick(self)
	-- smoke the edit list and edit name
	LootList_Edit = nil;
	LootList_Name = nil;

	-- smoke list selection
	LootList_EditSel = nil;
	
	-- change metrics toggle back to start with edit
	LootList_EditMetrics = LOOTLIST_METRICS_TYPE.VIEW;

	-- update lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists list UI
	LootList_Lists_List_UpdateUI();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();

	-- close import frame
	LootList_ImportClose_OnClick(LootList_ImportFrameClose);
end

-- Lists Import handler
function LootList_Lists_Import_OnClick(self)
	-- show the import frame
	LootList_ImportFrame:Show();

	-- set focus to report
	LootList_ImportFrameReportFrameReport:SetFocus();
end

-- Lists Export handler
function LootList_Lists_Export_OnClick(self)
	-- show the export frame
	LootList_ExportFrame:Show();

	-- refresh the export
	LootList_Export_Refresh_OnClick(LootList_ExportFrameRefresh);
end

-- Lists Use Metric Toggle handler
function LootList_Lists_MUse_OnToggle(self)
	local	entry, metric;
	
	-- get item entry
	entry = LootList_GetItemEntry(LOOTLIST_ENTRY_TYPE.EDIT);
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- snarf the metric
	metric = self:GetID();
	
	-- toggle metric use
	entry["M"..metric.."Use"] = (self:GetChecked() ~= nil);
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists edit metric UI, no reload of dropdown
	LootList_Lists_Metric_UpdateUI(metric, false);
end

-- Lists Metric Scale Load handler
function LootList_Lists_MScale_OnLoad(self)
	-- set width
	UIDropDownMenu_SetWidth(self, 120);
	UIDropDownMenu_JustifyText(self, "LEFT");
end

-- Lists Metric Scale Show handler
function LootList_Lists_MScale_OnShow(self)
	local	entry, metric;
	
	-- get item entry
	entry = LootList_GetItemEntry();
	
	-- snarf the metric
	metric = self:GetID();
	
	-- setup the raid boss type drop down
	UIDropDownMenu_Initialize(self, LootList_Lists_MScale_Initialise);

	-- set initial selection if we have an entry
	if (entry ~= nil) then
		UIDropDownMenu_SetSelectedValue(self, entry["M"..metric.."Scale"]);
	else
		UIDropDownMenu_SetSelectedValue(self, "");
	end
end

-- Lists Metric Scale Load Initaliser handler
function LootList_Lists_MScale_Initialise(frame)
	local	scales, ix, scale, info;

	-- add our own scale
	info = {};
	info.text = LOOTLIST_LISTS_MANUAL;
	info.func = LootList_Lists_MScale_OnSelect;
	info.value = "";
	info.owner = frame;

	-- add manual scale button
	UIDropDownMenu_AddButton(info);
	
	-- get Pawn scales, if it exists
	if (PawnGetAllScalesEx ~= nil) then
		scales = PawnGetAllScalesEx();
	else
		scales = {};
	end
	
	-- and add Pawn scales, as they exist
	for ix, scale in ipairs(scales) do
		-- don't include non-visible scales
		if ((scale.IsVisible == true) or (scale.IsVisible == 1)) then
			-- form mode button
			info = {};
			info.text = scale.LocalizedName;
			info.func = LootList_Lists_MScale_OnSelect;
			info.value = scale.Name;
			info.owner = frame;

			-- add Pawn scale button
			UIDropDownMenu_AddButton(info);
		end
	end
end

-- Lists Metric Scale Select handler
function LootList_Lists_MScale_OnSelect(self)
	local	entry, metric, mScale, itemIx;

	-- get item entry
	entry = LootList_GetItemEntry(LOOTLIST_ENTRY_TYPE.EDIT);
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- snarf the metric
	metric = self.owner:GetID();
	
	-- snarf old metric scale
	mScale = entry["M"..metric.."Scale"];
	
	-- snarf new metric scale
	entry["M"..metric.."Scale"] = self.value;
	
	-- ensure all item basemetrics are consistent
	for itemIx=1, #entry.Sort, 1 do
		-- if going to a Pawn scale from manual, reset base to use Pawn
		if		((mScale == "") and (self.value ~= "") and (entry.List[entry.Sort[itemIx]]["M"..metric.."Base"] == 0.0)) then
			-- will use Pawn
			entry.List[entry.Sort[itemIx]]["M"..metric.."Base"] = -1.0;
		elseif	((mScale ~= "") and (self.value == "") and (entry.List[entry.Sort[itemIx]]["M"..metric.."Base"] == -1.0)) then
			-- will need manual entry
			entry.List[entry.Sort[itemIx]]["M"..metric.."Base"] = 0.0;
		end
	end
	
	-- update selection
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists edit metric UI, no reload of dropdown
	LootList_Lists_Metric_UpdateUI(metric, false);
end

-- Lists Override Metric Toggle handler
function LootList_Lists_MOverride_OnToggle(self)
	local	entry, metric;
	
	-- get item entry
	entry = LootList_GetItemEntry(LOOTLIST_ENTRY_TYPE.EDIT);
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- snarf the metric
	metric = self:GetID();
	
	-- toggle metric override
	entry["M"..metric.."Override"] = (self:GetChecked() ~= nil);
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists edit metric UI, no reload of dropdown
	LootList_Lists_Metric_UpdateUI(metric, false);
end

-- Change Metrics Click handler
function LootList_Lists_ChangeMetrics_OnClick(self)
	-- determine whether we are editing or viewing the metrics
	if		(LootList_EditMetrics == LOOTLIST_METRICS_TYPE.EDIT) then
		-- change to viewing metrics
		LootList_EditMetrics = LOOTLIST_METRICS_TYPE.VIEW;
		
		-- set change metrics text
		LootList_ListsFrameChangeMetrics:SetText(LOOTLIST_LISTS_METRICSEDIT);
	elseif	(LootList_EditMetrics == LOOTLIST_METRICS_TYPE.VIEW) then
		-- change to editing metrics
		LootList_EditMetrics = LOOTLIST_METRICS_TYPE.EDIT;
		
		-- set change metrics text
		LootList_ListsFrameChangeMetrics:SetText(LOOTLIST_LISTS_METRICSVIEW);
	else
		-- default is editing
		LootList_EditMetrics = LOOTLIST_METRICS_TYPE.EDIT;
		
		-- set change metrics text
		LootList_ListsFrameChangeMetrics:SetText(LOOTLIST_LISTS_METRICSVIEW);
	end
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
end

-- Change Metrics Enter handler
function LootList_Lists_ChangeMetrics_OnEnter(self)
	-- determine tooltip text
	if		(LootList_EditMetrics == LOOTLIST_METRICS_TYPE.EDIT) then
		-- change to metrics view
		return LOOTLIST_LISTS_METRICSVIEW_TT;
	elseif	(LootList_EditMetrics == LOOTLIST_METRICS_TYPE.VIEW) then
		-- change to metrics edit
		return LOOTLIST_LISTS_METRICSEDIT_TT;
	else
		-- change to metrics edit
		return LOOTLIST_LISTS_METRICSEDIT_TT;
	end
end

-- Lists Edit Button Click handler
function LootList_Lists_Edit_Button_OnClick(self, button)
	local	entry, isCached;
	
	-- snarf selected edit
	LootList_EditSel = self:GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);
	
	-- get item entry
	entry = LootList_GetItemEntry();
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();

	-- attempt to get the item information
	isCached = GetItemInfo(entry.List[entry.Sort[LootList_EditSel]].ItemID) ~= nil;

	-- dressup or chat link if we have a valid link and its the left mouse button.  We use
	-- the right mouse button if the item is uncached to request it from the server
    if		((isCached == true) and (button == "LeftButton") and IsControlKeyDown()) then
		-- they want to play dressup
        DressUpItemLink(entry.List[entry.Sort[LootList_EditSel]].Link);
	elseif	((isCached == true) and (button == "LeftButton") and IsShiftKeyDown()) then
		-- this will link back into our own item link
		ChatEdit_InsertLink(entry.List[entry.Sort[LootList_EditSel]].Link);
	elseif	((isCached ~= true) and (button == "RightButton")) then
		-- set query issued
		LootList_Tooltip.Queried = true;

		-- mark thisitem as being queried this session
		LootList_ItemQueried[entry.List[entry.Sort[LootList_EditSel]].ItemID] = true;
		
		-- attempt to query the item information from the server
		print(string.format(LOOTLIST_LISTS_QUERY, entry.List[entry.Sort[LootList_EditSel]].Link));
		
		-- set hyperlink into our tooltip
		LootList_Tooltip:SetHyperlink(entry.List[entry.Sort[LootList_EditSel]].Link);
	end
end

-- Lists Edit Button Enter handler
function LootList_Lists_Edit_Button_OnEnter(self)
	local	_, entry, itemIx, rowM1Base, itemText;
	
	-- get item entry
	entry = LootList_GetItemEntry();
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- snarf examined item
	itemIx = self:GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);

	-- retrieve the metric 1 base portion of the row
	rowM1Base = _G["LootList_ListsFrameEditFrameButton"..self:GetID().."M1Base"];
	
	-- has this item been cached?
 	if (GetItemInfo(entry.List[entry.Sort[itemIx]].ItemID) ~= nil) then
 		-- position tootip
		GameTooltip:SetOwner(rowM1Base, "ANCHOR_RIGHT", -50);

		-- use hyperlink and regular tooltip
		GameTooltip:SetHyperlink(entry.List[entry.Sort[itemIx]].Link);

		-- add a note if we have one
		if (entry.List[entry.Sort[itemIx]].Note ~= nil) then
			GameTooltip:AddLine(LOOTLIST_TEXT_ORANGE..LOOTLIST_LABEL_LOOTLIST..":|r "..entry.List[entry.Sort[itemIx]].Note, nil, nil, nil, 1);
		end
	
		-- and show
		GameTooltip:Show();
		
		-- if the item was uncached, update lists edit
		if (entry.List[entry.Sort[itemIx]].Uncached == true) then
			-- reset uncached flag
			entry.List[entry.Sort[itemIx]].Uncached = nil;
			
            -- update lists edit
            LootList_Lists_Edit_Update();
		end
	else
		-- set this item as uncached
		entry.List[entry.Sort[itemIx]].Uncached = true;

 		-- clear and position tootip
		LootList_Tooltip:ClearLines();
		LootList_Tooltip:SetOwner(rowM1Base, "ANCHOR_RIGHT", -50);

		-- attempt to extract the item name from the link
		_, _, itemText = string.find(entry.List[entry.Sort[itemIx]].Link, LOOTLIST_ITEMNAME_PATTERN);		

		-- add item text if we have some
		if (itemText ~= nil) then
			LootList_Tooltip:AddLine(itemText, 1.00, 1.00, 0.00);
		end

		-- format uncached tooltip.  Give them not found warning as appropriate
		if (LootList_ItemQueried[entry.List[entry.Sort[itemIx]].ItemID] ~= true) then
 			LootList_Tooltip:AddLine(LOOTLIST_LISTS_NOITEM, 1.00, 0.00, 0.00);
		else
 			LootList_Tooltip:AddLine(LOOTLIST_LISTS_NOITEMFOUND, 1.00, 0.00, 0.00);
		end

 		LootList_Tooltip:AddLine(LOOTLIST_LISTS_ITEMID..entry.List[entry.Sort[itemIx]].ItemID, 0.00, 0.44, 0.87);
 		LootList_Tooltip:AddLine(LOOTLIST_LISTS_UNSAFE, nil, nil, nil, 1);
 		LootList_Tooltip:AddLine(" ");
 		LootList_Tooltip:AddLine(LOOTLIST_LISTS_UNCACHED, nil, nil, nil, 1);
	
		-- and show
		LootList_Tooltip:Show();
	end
end

-- Lists Edit Button Leave handler
function LootList_Lists_Edit_Button_OnLeave(self)
	-- hide tooltips
	GameTooltip:Hide();
	LootList_Tooltip:Hide();
end

-- Lists Edit Note Click handler
function LootList_Lists_Note_OnClick(self)
	local	entry, itemIx;

	-- get item entry
	entry = LootList_GetItemEntry();
	
	-- calculate selected item
	itemIx = self:GetParent():GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);

	-- make sure we don't toggle state yet
	self:SetChecked(entry.List[entry.Sort[itemIx]].Note ~= nil);

	-- show edit box for item note
	StaticPopup_Show("LOOTLIST_PROMPT_LIST_NOTE", entry.List[entry.Sort[itemIx]].Link, nil, itemIx);
end

-- Lists Edit Note Enter handler
function LootList_Lists_Note_OnEnter(self)
	local	entry, itemIx;
	
	-- calculate selected item
	itemIx = self:GetParent():GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);

	-- get item entry
	entry = LootList_GetItemEntry();

	-- do we have a note yet?
	if (entry.List[entry.Sort[itemIx]].Note == nil) then
		-- simply show tooltip
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
        GameTooltip:SetText(LOOTLIST_LISTS_NOTE_TT);
	else
		-- show note
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
        GameTooltip:SetText(entry.List[entry.Sort[itemIx]].Note, nil, nil, nil, nil, 1);
	end
end

-- Lists Edit Note Leave handler
function LootList_Lists_Note_OnLeave(self)
    -- easy
	GameTooltip:Hide();
end

-- Lists Edit Metric Base Focus Gained handler
function LootList_Lists_EditMBase_OnFocusGained(self)
	-- select the current text
	self:HighlightText();
end

-- Lists Edit Metric Base Text Changed handler
function LootList_Lists_EditMBase_OnTextChanged(self)
	local	itemIx, mBase, mScale;
	
	-- calculate selected item
	itemIx = self:GetParent():GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);
	
	-- get the metric base
	mBase = tonumber(self:GetText());
	
	-- grab the current scale
	mScale = LootList_Edit["M"..self:GetID().."Scale"];
	
	-- snarf updated metric base if we have a number
	if		(mBase == nil) then
		return;
	elseif	(mBase < 0.0) then
		-- reset to a Pawn scale if we have one
		LootList_Edit.List[LootList_Edit.Sort[itemIx]]["M"..self:GetID().."Base"] = (mScale == "") and 0.0 or -1.0;
	elseif	(mBase >= 0.0) then
		LootList_Edit.List[LootList_Edit.Sort[itemIx]]["M"..self:GetID().."Base"] = mBase;
	end

	-- generate the metric color
	clrBase = LootList_GetMetricColor(mScale, mBase);
					
	-- and set edit appropriately
	self:SetTextColor(clrBase.r, clrBase.g, clrBase.b, clrBase.a);
end

-- Lists Edit Metric Base Focus Lost handler
function LootList_Lists_EditMBase_OnFocusLost(self)
end

-- Lists Edit Metric Proc Focus Gained handler
function LootList_Lists_EditMProc_OnFocusGained(self)
	-- select the current text
	self:HighlightText();
end

-- Lists Edit Metric Proc Text Changed handler
function LootList_Lists_EditMProc_OnTextChanged(self)
	local	itemIx, mProc;
	
	-- calculate selected item
	itemIx = self:GetParent():GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);

	-- get the metric proc
	mProc = tonumber(self:GetText());
	
	-- snarf updated metric proc if we have a number
	if (mProc == nil) then
		return;
	else
		LootList_Edit.List[LootList_Edit.Sort[itemIx]]["M"..self:GetID().."Proc"] = (mProc < 0.0) and 0.0 or mProc;
	end
end

-- Lists Edit Metric Proc Focus Lost handler
function LootList_Lists_EditMProc_OnFocusLost(self)
end

-- Lists Edit Trash Click handler
function LootList_Lists_Trash_OnClick(self)
	local	entry, itemIx;
	
	-- get item entry
	entry = LootList_GetItemEntry(LOOTLIST_ENTRY_TYPE.EDIT);
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- calculate selected item
	itemIx = self:GetParent():GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);
	
	-- first, kill the list's item entry
	entry.List[entry.Sort[itemIx]] = nil;
	
	-- and remove from the sort
	table.remove(entry.Sort, itemIx);

	-- update the lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Lists Edit Complete Click handler
function LootList_Lists_Complete_OnClick(self)
	local	entry, itemIx;
	
	-- get item entry
	entry = LootList_GetItemEntry(LOOTLIST_ENTRY_TYPE.LISTS);
	
	-- no entry is done
	if (entry == nil) then
		-- no list
		return;
	end
	
	-- calculate selected item
	itemIx = self:GetParent():GetID() + FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);
	
	-- set the item's completed state
	entry.List[entry.Sort[itemIx]].Completed = (self:GetChecked() ~= nil);

	-- update the lists edit
	LootList_Lists_Edit_Update();
end

-- Lists Edit Item Move Up handler
function LootList_Lists_Edit_MoveUp(self)
	local	itemID;
	
	-- cannot move above first row
	if (LootList_EditSel > 1) then
		-- swap the item order in the edit list
		itemID = LootList_Edit.Sort[LootList_EditSel];
		LootList_Edit.Sort[LootList_EditSel] = LootList_Edit.Sort[LootList_EditSel - 1];
		LootList_Edit.Sort[LootList_EditSel - 1] = itemID;
		
		-- decrement selected item
		LootList_EditSel = LootList_EditSel - 1;

		-- update the lists edit
		LootList_Lists_Edit_Update();
		
		-- update lists edit UI
		LootList_Lists_Edit_UpdateUI();
	end
end

-- Lists Edit Item Move Down handler
function LootList_Lists_Edit_MoveDown(self)
	local	itemID;
	
	-- cannot move below last row
	if (LootList_EditSel < #LootList_Edit.Sort) then
		-- swap the item order in the edit list
		itemID = LootList_Edit.Sort[LootList_EditSel];
		LootList_Edit.Sort[LootList_EditSel] = LootList_Edit.Sort[LootList_EditSel + 1];
		LootList_Edit.Sort[LootList_EditSel + 1] = itemID;
		
		-- increment selected item
		LootList_EditSel = LootList_EditSel + 1;

		-- update the lists edit
		LootList_Lists_Edit_Update();
		
		-- update lists edit UI
		LootList_Lists_Edit_UpdateUI();
	end
end

-- Lists Item Click handler
function LootList_Lists_Item_OnClick(self, button)
	-- do we have a link?
	if (LootList_ItemLink ~= nil) then
		-- I wonder what they think they are doing...
		if (button == "LeftButton") then
			-- are they trying to link to chat?
			if (IsShiftKeyDown()) then
				-- make sure chat window is visible
				if (ChatFrame1EditBox:IsVisible()) then
					ChatFrame1EditBox:Insert(LootList_ItemLink);
				end
			else
				-- show item reference tooltip and
				ShowUIPanel(ItemRefTooltip);

				-- make sure we can see it
				if (not ItemRefTooltip:IsShown()) then
					ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
				end

				-- set the link
				ItemRefTooltip:SetHyperlink(LootList_ItemLink);
			end
		end
	end
end

-- Lists Item Enter handler
function LootList_Lists_Item_OnEnter(self)
	-- do we havean item link?
	if (LootList_ItemLink ~= nil) then
		-- show tooltip
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
		GameTooltip:SetHyperlink(LootList_ItemLink);
	end
end

-- Lists Item Leave handler
function LootList_Lists_Item_OnLeave(self)
	-- hide tooltip
	GameTooltip:Hide();
end

-- Lists Clear Item handler
function LootList_Lists_Clear_OnClick(self)
	-- reset item link
	LootList_SetItemLink(nil);
end

-- Lists Insert Item handler
function LootList_Lists_Insert_OnClick(self)
	local	itemIx;
	
	-- determine where to shove this item
	if ((LootList_EditSel == nil) or (LootList_EditSel <= 1)) then
		itemIx = 1;
	else
		itemIx = LootList_EditSel;
	end
	
	-- create a new item entry
	LootList_CreateItem(itemIx, LootList_ItemID, LootList_ItemLink);
	
	-- update lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Lists Append Item handler
function LootList_Lists_Append_OnClick(self)
	local	itemIx;
	
	-- determine where to shove this item
	if ((LootList_EditSel ~= nil) and (LootList_EditSel <= #LootList_Edit.Sort)) then
		itemIx = LootList_EditSel + 1;
	else
		itemIx = #LootList_Edit.Sort + 1;
	end
	
	-- create a new item entry
	LootList_CreateItem(itemIx, LootList_ItemID, LootList_ItemLink);
	
	-- update lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Lists Remove Item handler
function LootList_Lists_Remove_OnClick(self)
	-- delete this item
	LootList_DeleteItem(LootList_ItemID);
	
	-- update lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Option MiniMap Button Toggle handler
function LootList_Option_MiniMapButton_OnToggle(self)
	-- retrieve value
	LootList_Options.MiniMap = (LootList_OptionsFrameMiniMapButton:GetChecked() ~= nil);

	-- and show/hide the actual button
	if (LootList_Options.MiniMap == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end

	-- and show/hide the MiniMap button
	LootList_MiniMapButton_SwitchState();
end

-- Option MiniMap Button Position Value handler
function LootList_Option_MiniMapButtonPos_OnValueChanged(self)
	-- retrieve value
	LootList_Options.MiniMapPos = LootList_OptionsFrameMiniMapPosSlider:GetValue();

	-- update slidertext
	LootList_OptionsFrameMiniMapPosSliderText:SetText(LootList_Options.MiniMapPos);

	-- reflect the position
	LootList_MiniMapButton_Update();
end

-- Option MiniMap Button Radius Value handler
function LootList_Option_MiniMapButtonRad_OnValueChanged(self)
	-- retrieve value
	LootList_Options.MiniMapRad = LootList_OptionsFrameMiniMapRadSlider:GetValue();

	-- update slidertext
	LootList_OptionsFrameMiniMapRadSliderText:SetText(LootList_Options.MiniMapRad);

	-- reflect the position
	LootList_MiniMapButton_Update();
end

-- Option Reset UI Click handler
function LootList_Options_ResetUI_OnClick(self)
	-- reset UI, the user has lost the window off the screen.  Reset the anchors to center
	LootList_Frame:ClearAllPoints();
	LootList_Frame:SetPoint("CENTER");
end

-- Option Auto Append Toggle handler
function LootList_Option_AutoAppend_OnToggle(self)
	-- retrieve value
	LootList_Options.AutoAppend = (LootList_OptionsFrameAutoAppendButton:GetChecked() ~= nil);

	-- play selectionsound
	if (LootList_Options.AutoAppend == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Option Echo Notice Toggle handler
function LootList_Option_EchoNotice_OnToggle(self)
	-- retrieve value
	LootList_Options.EchoNotice = (LootList_OptionsFrameEchoNoticeButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.EchoNotice == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Option Play Sound Toggle handler
function LootList_Option_PlaySound_OnToggle(self)
	-- retrieve value
	LootList_Options.PlaySound = (LootList_OptionsFramePlaySoundButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.PlaySound == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Option Play Sound Now Button handler
function LootList_Options_PlaySoundNow_OnClick(self)
	-- easy peasy
	PlaySound("G_GongTroll01");
end


-- Option Found Loot Toggle handler
function LootList_Option_FoundLoot_OnToggle(self)
	-- retrieve value
	LootList_Options.FoundLoot = (LootList_OptionsFrameFoundLootButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.FoundLoot == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Option Found Group Toggle handler
function LootList_Option_FoundGroup_OnToggle(self)
	-- retrieve value
	LootList_Options.FoundGroup = (LootList_OptionsFrameFoundGroupButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.FoundGroup == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end
-- Option Found ML Chat Toggle handler
function LootList_Option_FoundMLChat_OnToggle(self)
	-- retrieve value
	LootList_Options.FoundMLChat = (LootList_OptionsFrameFoundMLChatButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.FoundMLChat == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Option Found Lead Chat Toggle handler
function LootList_Option_FoundLeadChat_OnToggle(self)
	-- retrieve value
	LootList_Options.FoundLeadChat = (LootList_OptionsFrameFoundLeadChatButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.FoundLeadChat == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Option Found Raid Warning Chat Toggle handler
function LootList_Option_FoundWarnChat_OnToggle(self)
	-- retrieve value
	LootList_Options.FoundWarnChat = (LootList_OptionsFrameFoundWarnChatButton:GetChecked() ~= nil);

	-- play selection sound
	if (LootList_Options.FoundWarnChat == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end
end

-- Import Close handler
function LootList_ImportClose_OnClick(self)
	-- hide UI
	LootList_ImportFrame:Hide();
end

-- Import Format Click handler
function LootList_Import_Format_RadioButton_OnClick(self, index)
	-- snarf new import format
	LootList_Options.ImportFormat = index;
	
	-- determine the import format by button
	LootList_ImportFrameFormatItem:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ITEM);
	LootList_ImportFrameFormatAllakhazam:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ALLAKHAZAM);
	LootList_ImportFrameFormatArmory:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ARMORY);
	LootList_ImportFrameFormatThottbot:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.THOTTBOT);
	LootList_ImportFrameFormatWowhead:SetChecked(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.WOWHEAD);
	
	-- play sound if selected
	if (index ~= nil) then
		PlaySound("igMainMenuOptionCheckBoxOn");
	end
end

-- Import Insert Click handler
function LootList_Import_Insert_OnClick(self)
	local	entry, txtImport, itemIx, itemList;
	
	-- get the exported list
	entry = LootList_Lists[LootList_ListsSort[LootList_ListsSel]];
	
	-- retrieve import text
	txtImport = LootList_ImportFrameReportFrameReport:GetText();
	
	-- determine where to shove this item
	if ((LootList_EditSel == nil) or (LootList_EditSel <= 1)) then
		itemIx = 1;
	else
		itemIx = LootList_EditSel;
	end

	-- import the list according to required format
	if		(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ITEM) then
		-- extract item item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_ITEMITEMID, LOOTLIST_IMPORT_ITEMITEMTEXT);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ALLAKHAZAM) then
		-- extract Allakhazam item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_ALLAKHAZAMITEMID);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ARMORY) then
		-- extract Armory item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_ARMORYITEMID);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.THOTTBOT) then
		-- extract Thottbot item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_THOTTBOTITEMID);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.WOWHEAD) then
		-- extract Wowhead item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_WOWHEADITEMID);
	else
		-- no import
		return;
	end
	
	-- insert extracted items into edited list
	LootList_CreateItems(itemIx, itemList);

	-- update lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Import Append Click handler
function LootList_Import_Append_OnClick(self)
	local	entry, txtImport, itemIx, itemList;
	
	-- get the exported list
	entry = LootList_Lists[LootList_ListsSort[LootList_ListsSel]];
	
	-- retrieve import text
	txtImport = LootList_ImportFrameReportFrameReport:GetText();
	
	-- determine where to shove this item
	if ((LootList_EditSel ~= nil) and (LootList_EditSel <= #LootList_Edit.Sort)) then
		itemIx = LootList_EditSel + 1;
	else
		itemIx = #LootList_Edit.Sort + 1;
	end

	-- import the list according to required format
	if		(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ITEM) then
		-- extract item item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_ITEMITEMID, LOOTLIST_IMPORT_ITEMITEMTEXT);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ALLAKHAZAM) then
		-- extract Allakhazam item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_ALLAKHAZAMITEMID);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.ARMORY) then
		-- extract Armory item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_ARMORYITEMID);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.THOTTBOT) then
		-- extract Thottbot item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_THOTTBOTITEMID);
	elseif	(LootList_Options.ImportFormat == LOOTLIST_IMPORT_TYPE.WOWHEAD) then
		-- extract Wowhead item list
		itemList = LootList_GetItemList(txtImport, LOOTLIST_IMPORT_WOWHEADITEMID);
	else
		-- no import
		return;
	end
	
	-- append extracted items into edited list
	LootList_CreateItems(itemIx, itemList);

	-- update lists edit
	LootList_Lists_Edit_Update();
	
	-- update lists edit UI
	LootList_Lists_Edit_UpdateUI();
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- Export Close handler
function LootList_ExportClose_OnClick(self)
	-- hide UI
	LootList_ExportFrame:Hide();
end

-- Export Format Click handler
function LootList_Export_Format_RadioButton_OnClick(self, index)
	-- snarf new export format
	LootList_Options.ExportFormat = index;
	
	-- determine the export format by button
	LootList_ExportFrameFormatText:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.TEXT);
	LootList_ExportFrameFormatLink:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.LINK);
	LootList_ExportFrameFormatHTML:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.HTML);
	LootList_ExportFrameFormatBBC:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.BBC);
	LootList_ExportFrameFormatItem:SetChecked(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.ITEM);
	
	-- play sound if selected
	if (index ~= nil) then
		PlaySound("igMainMenuOptionCheckBoxOn");
	end
	
	-- refresh data export
	LootList_Export_Refresh_OnClick(LootList_ExportFrameRefresh);
end

-- Export Refresh Click handler
function LootList_Export_Refresh_OnClick(self)
	local	_, entry, txtExport, itemIx, itemQual, itemID, itemText, itemLink, itemEquipLoc;

	-- ignore if not visible
	if (not LootList_ExportFrame:IsVisible()) then
		return;
	end
	
	-- get the exported list
	entry = LootList_Lists[LootList_ListsSort[LootList_ListsSel]];
	
	-- format the current list according to required format
	if		(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.TEXT) then
		-- text.  Heading first
		txtExport = string.format(LOOTLIST_EXPORT_NAMETEXT, LootList_ListsSort[LootList_ListsSel]);
		
		-- open list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTOTEXT);
		
		-- export each list, just with the text name
		for itemIx, itemID in ipairs(entry.Sort) do
			-- extract item name
			_, _, itemText = string.find(entry.List[itemID].Link, LOOTLIST_ITEMNAME_PATTERN);
			
			-- retrieve sub-type: note, may return nil
			_, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(entry.List[itemID].Link);

			-- if equipment location is nil, we haven't see this item yet.  Set to unknown
			if		(itemEquipLoc == nil) then
				itemEquipLoc = LOOTLIST_EXPORT_UNKNOWN;
			elseif	(itemEquipLoc == "") then
				itemEquipLoc = LOOTLIST_EXPORT_NOEQUIP;
			else
				itemEquipLoc = _G[itemEquipLoc];
			end

			-- and add to export
			txtExport = txtExport..string.format(LOOTLIST_EXPORT_ITEMTEXT, itemText, itemEquipLoc);
		end
		
		-- close list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTCTEXT);
	elseif	(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.LINK) then
		-- link.  Heading first
		txtExport = string.format(LOOTLIST_EXPORT_NAMELINK, LootList_ListsSort[LootList_ListsSel]);
		
		-- open list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTOLINK);
		
		-- export each list, just with the text name
		for itemIx, itemID in ipairs(entry.Sort) do
			-- reformat the link so it is displayable as text
			itemLink = gsub(entry.List[itemID].Link, LOOTLIST_TEXT_PIPE, LOOTLIST_TEXT_PIPE_ENC);
			
			-- add to export
			txtExport = txtExport..string.format(LOOTLIST_EXPORT_ITEMLINK, itemLink);
		end
		
		-- close list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTCLINK);
	elseif	(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.HTML) then
		-- HTML.  Heading first
		txtExport = string.format(LOOTLIST_EXPORT_NAMEHTML, LootList_ListsSort[LootList_ListsSel]);
		
		-- open list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTOHTML);
		
		-- export each list, just with the text name
		for itemIx, itemID in ipairs(entry.Sort) do
			-- extract item name
			_, _, itemQual, _, itemText = string.find(entry.List[itemID].Link, LOOTLIST_ITEMFULLID_PATTERN);
			
			-- retrieve sub-type: note, may return nil
			_, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(entry.List[itemID].Link);
			
			-- if equipment location is nil, we haven't see this item yet.  Set to unknown
			if		(itemEquipLoc == nil) then
				itemEquipLoc = LOOTLIST_EXPORT_UNKNOWN;
			elseif	(itemEquipLoc == "") then
				itemEquipLoc = LOOTLIST_EXPORT_NOEQUIP;
			else
				itemEquipLoc = _G[itemEquipLoc];
			end
			
			-- add to export
			txtExport = txtExport..string.format(LOOTLIST_EXPORT_ITEMHTML, itemQual, itemText, itemEquipLoc);
		end
		
		-- close list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTCHTML);
	elseif	(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.BBC) then
		-- BBC.  Heading first
		txtExport = string.format(LOOTLIST_EXPORT_NAMEBBC, LootList_ListsSort[LootList_ListsSel]);
		
		-- open list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTOBBC);
		
		-- export each list, just with the text name
		for itemIx, itemID in ipairs(entry.Sort) do
			-- extract item name
			_, _, itemText = string.find(entry.List[itemID].Link, LOOTLIST_ITEMNAME_PATTERN);
			
			-- retrieve sub-type: note, may return nil
			_, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(entry.List[itemID].Link);
			
			-- if equipment location is nil, we haven't see this item yet.  Set to unknown
			if		(itemEquipLoc == nil) then
				itemEquipLoc = LOOTLIST_EXPORT_UNKNOWN;
			elseif	(itemEquipLoc == "") then
				itemEquipLoc = LOOTLIST_EXPORT_NOEQUIP;
			else
				itemEquipLoc = _G[itemEquipLoc];
			end
			
			-- add to export
			txtExport = txtExport..string.format(LOOTLIST_EXPORT_ITEMBBC, itemText, itemEquipLoc);
		end
		
		-- close list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTCBBC);
	elseif	(LootList_Options.ExportFormat == LOOTLIST_EXPORT_TYPE.ITEM) then
		-- Item ID.  Heading first
		txtExport = string.format(LOOTLIST_EXPORT_NAMEITEM, LootList_ListsSort[LootList_ListsSel]);
		
		-- open list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTOITEM);
		
		-- export each list, just with the text name
		for itemIx, itemID in ipairs(entry.Sort) do
			-- extract item name
			_, _, itemText = string.find(entry.List[itemID].Link, LOOTLIST_ITEMNAME_PATTERN);
			
			-- add to export
			txtExport = txtExport..string.format(LOOTLIST_EXPORT_ITEMITEM, itemID, itemText);
		end
		
		-- close list
		txtExport = txtExport..string.format(LOOTLIST_EXPORT_LISTCITEM);
	else
		-- no export
		return;
	end
	
	-- and send to export frame
	LootList_ExportFrameReportFrameReport:SetText(txtExport);
	
	-- set focus and select all the text
	LootList_ExportFrameReportFrameReport:SetFocus();
	LootList_ExportFrameReportFrameReport:HighlightText();
end

-- Switch MiniMap Button State handler
function LootList_MiniMapButton_SwitchState(state)
	-- show/hide the button according to toggle
	if (LootList_Options.MiniMap == false) then
		-- hide the mini map frames
		LootList_MiniMapButton:Hide();
	else
		-- show the mini map button frame
		LootList_MiniMapButton:Show();
	end
end

-- MiniMap Button handler
function LootList_MiniMapButton_Update()		
	-- update the MiniMap button position
	LootList_MiniMapButton:SetPoint("TOPLEFT", "Minimap", "TOPLEFT",
									(52 - (LootList_Options.MiniMapRad * cos(LootList_Options.MiniMapPos))),
									((LootList_Options.MiniMapRad * sin(LootList_Options.MiniMapPos)) - 52));
end

-- Lists List handler
function LootList_Lists_List_Update()
	local	offset, row, listIx, rowButton, rowName;
	
	-- retrieve the scroll offset for editing hierarchy view
	offset = FauxScrollFrame_GetOffset(LootList_ListsFrameListFrameScrollFrame);
	
	-- handle each list row
	for row=1, LOOTLIST_LISTS_LIST_LINES, 1 do
		-- calculate actual the list item index
		listIx = row + offset;

		-- retrieve the list row
		rowButton = _G["LootList_ListsFrameListFrameButton"..row];
		
		-- do we have a list for this guy?
		if (listIx <= #LootList_ListsSort) then
			-- get the name button
			rowName = _G["LootList_ListsFrameListFrameButton"..row.."Name"];
			
			-- set the list name
			rowName:SetText(LootList_ListsSort[listIx]);

			-- is this the current list?
			if (listIx == LootList_ListsSel) then
				-- highlight the row
				rowButton:LockHighlight();
			else
				-- normalise the row
				rowButton:UnlockHighlight();
			end
			
			-- show the button
			rowButton:Show();
		else
			-- hide this row
			rowButton:Hide();
		end
	end
	
	-- update the scroll frame appropriately
	FauxScrollFrame_Update(LootList_ListsFrameListFrameScrollFrame, #LootList_ListsSort, LOOTLIST_LISTS_LIST_LINES, LOOTLIST_LISTS_LIST_FRAME_HEIGHT);
end

-- Lists Edit Update handler
function LootList_Lists_Edit_Update()
	local	offset, entry, count, itemIx, metric, row, rowButton, rowNote, rowItem, rowTrash, rowComplete;
	local	rowMBase, rowMBaseRO, rowMProc, rowMProcRO, rowMTotalRO;
	local	_, itemColor, itemID, itemText, itemLink, mUse, mBase, mProc, mScale, mOverride, isBlank, itemPawn, clrBase;
	
	-- retrieve the scroll offset for editing source view
	offset = FauxScrollFrame_GetOffset(LootList_ListsFrameEditFrameScrollFrame);
	
	-- get item entry
	entry = LootList_GetItemEntry();
	
	-- get count of items in list
	if (entry ~= nil) then
		count = #entry.Sort;
	else
		count = 0;
	end
	
	-- handle each list row
	for row=1, LOOTLIST_LISTS_EDIT_LINES, 1 do
		-- calculate actual the edit item index
		itemIx = row + offset;

		-- retrieve the source row
		rowButton = _G["LootList_ListsFrameEditFrameButton"..row];
		
		-- do we have a item for this guy?
		if (itemIx <= count) then
			-- get the item and metric base objects
			rowNote = _G["LootList_ListsFrameEditFrameButton"..row.."Note"];
			rowItem = _G["LootList_ListsFrameEditFrameButton"..row.."Item"];
			rowTrash = _G["LootList_ListsFrameEditFrameButton"..row.."Trash"];
			rowComplete = _G["LootList_ListsFrameEditFrameButton"..row.."Complete"];

			-- have we a note for this item?
			rowNote:SetChecked(entry.List[entry.Sort[itemIx]].Note ~= nil);

			-- retrieve the item info
			_, itemLink = GetItemInfo(entry.List[entry.Sort[itemIx]].ItemID);

			-- has this item be cached?
			if		(itemLink == nil) then
				-- this link is unsafe - extract item data
				_, _, itemColor, itemID, itemText = string.find(entry.List[entry.Sort[itemIx]].Link, LOOTLIST_ITEMPART_PATTERN);

				-- if there is no item text, use item id
				if (itemText == "") then
					_, _, _, itemText = string.find(entry.List[entry.Sort[itemIx]].Link, LOOTLIST_ITEMFULL_PATTERN);
				end

				-- have we queried for this guy this session?
				if (LootList_ItemQueried[entry.List[entry.Sort[itemIx]].ItemID] == true) then
					-- append not found text
					itemText = itemText..LOOTLIST_LISTS_NOTFOUND;
				end
				
				-- reformat as red to indicate uncached
				itemLink = string.format(LOOTLIST_ITEMID_FORMAT, LOOTLIST_ITEMQUAL_UNCACHED, itemID, itemText);
			elseif	(itemLink ~= entry.List[entry.Sort[itemIx]].Link) then
				-- the encoded link does not correspond to the returned link.  This was probably an imported link, so
				-- update our list's link
				entry.List[entry.Sort[itemIx]].Link = itemLink;
			end	
			
			-- set the item name
			rowItem:SetText(itemLink);
				
			-- show trash/hide complete if we are editing
			if (LootList_Edit ~= nil) then
				-- show trash
				rowTrash:Show();

				-- hide complete
				rowComplete:Hide();
			else
				-- hide trash
				rowTrash:Hide();

				-- set item's completed state
				rowComplete:SetChecked(entry.List[entry.Sort[itemIx]].Completed);

				-- show complete
				rowComplete:Show();
			end
			
			-- get Pawn data if using a Pawn scale and we are not editing or editing and viewing metrics
			if (((PawnGetItemData ~= nil) and ((LootList_Edit == nil) or (LootList_EditMetrics == LOOTLIST_METRICS_TYPE.VIEW))) and 
				(((entry.M1Use == true) and (entry.List[entry.Sort[itemIx]].M1Scale ~= "")) or 
				 ((entry.M2Use == true) and (entry.List[entry.Sort[itemIx]].M2Scale ~= "")) or
				 ((entry.M3Use == true) and (entry.List[entry.Sort[itemIx]].M3Scale ~= "")))) then
				-- get Pawn item data
				itemPawn = PawnGetItemData(itemLink);
			else
				-- no Pawn data required
				itemPawn = nil;
			end

			-- handle each item mteric
			for metric=1, LOOTLIST_LISTS_METRICS, 1 do
				-- get the item and metric base objects
				rowMBase = _G["LootList_ListsFrameEditFrameButton"..row.."M"..metric.."Base"];
				rowMBaseRO = _G["LootList_ListsFrameEditFrameButton"..row.."M"..metric.."BaseRO"];
				rowMProc = _G["LootList_ListsFrameEditFrameButton"..row.."M"..metric.."Proc"];
				rowMProcRO = _G["LootList_ListsFrameEditFrameButton"..row.."M"..metric.."ProcRO"];
				rowMTotalRO = _G["LootList_ListsFrameEditFrameButton"..row.."M"..metric.."TotalRO"];
				
				-- get use, scale and overridden
				mUse = entry["M"..metric.."Use"];
				mScale = entry["M"..metric.."Scale"];
				mOverride = entry["M"..metric.."Override"];
				
				-- get base and proc
				mBase = entry.List[entry.Sort[itemIx]]["M"..metric.."Base"];
				mProc = entry.List[entry.Sort[itemIx]]["M"..metric.."Proc"];
				
				-- a zero base means we blank this value
				isBlank = mBase == 0.0;

				-- generate values as necessary
				if		(mUse == false) then
					-- always blank
					isBlank = true;
				else
					-- generate the metric color
					clrBase = LootList_GetMetricColor(mScale, mBase);
					
					-- generate Pawn value if necessary
					if ((itemPawn ~= nil) and (mScale ~= "") and (mBase < 0.0) and (PawnGetSingleValueFromItem ~= nil)) then
						-- use Pawn to calculate scale value, if it exists
						if (PawnDoesScaleExist(mScale)) then
							mBase = PawnGetSingleValueFromItem(itemPawn, mScale);
						else
							mBase = nil;
						end
						
						-- make sure we have a value
						if (mBase == nil) then						
							-- reset base
							mBase = 0.0;
							
							-- grey for no Pawn value
							clrBase = LOOTLIST_COLOR_GREY;
						end
					end
				end

				-- show editboxes if we are using metric and editing and editing metrics, else just normal text
				if ((mUse == true) and (LootList_Edit ~= nil) and (LootList_EditMetrics == LOOTLIST_METRICS_TYPE.EDIT)) then
					-- set editing values
					rowMBase:SetText(string.format(LOOTLIST_METRIC_FORMAT, mBase));
					rowMBase:SetTextColor(clrBase.r, clrBase.g, clrBase.b, clrBase.a);
					
					rowMProc:SetText(string.format(LOOTLIST_METRIC_FORMAT, mProc));
					
					-- show editbox, hide normal and total text
					rowMBase:Show();
					rowMProc:Show();
					rowMBaseRO:Hide();
					rowMProcRO:Hide();
					rowMTotalRO:Hide();
				else
					-- set metric value unless we are to blank them
					if (isBlank) then
						-- hide them
						rowMBaseRO:Hide();
						rowMProcRO:Hide();
						rowMTotalRO:Hide();
					else
						rowMBaseRO:SetText(string.format(LOOTLIST_METRIC_FORMAT, mBase));
						rowMBaseRO:SetTextColor(clrBase.r, clrBase.g, clrBase.b, clrBase.a);
						
						rowMProcRO:SetText(string.format(LOOTLIST_METRIC_FORMAT, mProc));
						
						rowMTotalRO:SetText(string.format(LOOTLIST_METRIC_FORMAT, (mBase + mProc)));
						rowMTotalRO:SetTextColor(clrBase.r, clrBase.g, clrBase.b, clrBase.a);
						
						-- and show them
						rowMBaseRO:Show();
						rowMProcRO:Show();
						rowMTotalRO:Show();
					end
					
					-- hide editboxes
					rowMBase:Hide();
					rowMProc:Hide();
				end
			end
			
			-- is this the current list?
			if (itemIx == LootList_EditSel) then
				-- highlight the row
				rowButton:LockHighlight();
			else
				-- normalise the row
				rowButton:UnlockHighlight();
			end
			
			-- show the button
			rowButton:Show();
		else
			-- hide this row
			rowButton:Hide();
		end
	end
	
	-- update the scroll frame appropriately
	FauxScrollFrame_Update(LootList_ListsFrameEditFrameScrollFrame, count, LOOTLIST_LISTS_EDIT_LINES, LOOTLIST_LISTS_EDIT_FRAME_HEIGHT);
end

-- Lists List Sort handler
function LootList_Lists_List_Sort()
	local	key, value;
	
	-- setup sort indirection
	LootList_ListsSort = {};

	-- get each of the list records
	for key, value in pairs(LootList_Lists) do
		LootList_ListsSort[#LootList_ListsSort + 1] = key;
	end

	-- resort the lists list.  We use a sorted indirection table
	table.sort(LootList_ListsSort, LootList_ListsListTest);

	-- and update screen
	LootList_Lists_List_Update();
end

-- Lists List Test handler
function LootList_ListsListTest(i1, i2)
	-- easy test
	return i1 < i2;
end

-- Lists List Update UI handler
function LootList_Lists_List_UpdateUI()
	local	metric;
	
	-- do we have an existing edit or selected list?
	if		(LootList_Edit ~= nil) then
		-- disable create, modify and remove
		LootList_ListsFrameListCreateList:Disable();
		LootList_ListsFrameListModifyList:Disable();
		LootList_ListsFrameListDeleteList:Disable();
		
		-- enable import
		LootList_ListsFrameListImportList:Enable();
		
		-- disable export
		LootList_ListsFrameListExportList:Disable();
	elseif	(LootList_ListsSel ~= nil) then
		-- enable create, modify and remove
		LootList_ListsFrameListCreateList:Enable();
		LootList_ListsFrameListModifyList:Enable();
		LootList_ListsFrameListDeleteList:Enable();
	
		-- set name text
		LootList_ListsFrameListNameRO:SetText(LootList_ListsSort[LootList_ListsSel]);
		
		-- disable import
		LootList_ListsFrameListImportList:Disable();
		
		-- enable export
		LootList_ListsFrameListExportList:Enable();
	else
		-- enable create, disable modify and remove
		LootList_ListsFrameListCreateList:Enable();
		LootList_ListsFrameListModifyList:Disable();
		LootList_ListsFrameListDeleteList:Disable();
	
		-- reset name text
		LootList_ListsFrameListNameRO:SetText("");
		
		-- disable import and export
		LootList_ListsFrameListImportList:Disable();
		LootList_ListsFrameListExportList:Disable();
	end
	
	-- setup the metrics
	for metric=1, LOOTLIST_LISTS_METRICS, 1 do
		-- update lists metric UI
		LootList_Lists_Metric_UpdateUI(metric);
	end
end

-- Lists Edit Update UI handler
function LootList_Lists_Edit_UpdateUI()
	-- do we have a list being edited?
	if (LootList_Edit ~= nil) then
		-- make list name editable
		LootList_ListsFrameListName:Show();
		LootList_ListsFrameListNameFrameRO:Hide();
		
		-- have we a list name?
		if (LootList_Name ~= "") then
			-- enable save
			LootList_ListsFrameSaveList:Enable();
		else
			-- disable save
			LootList_ListsFrameSaveList:Disable();
		end
		
		-- enable discard
		LootList_ListsFrameDiscardList:Enable();

		-- show metric toggle button
		LootList_ListsFrameChangeMetrics:Show();
		
		-- current edit row is after top row or before last row?
		if		(LootList_EditSel == nil) then
			-- disable item row move buttons
			LootList_ListFrameEditMoveUp:Disable();
			LootList_ListFrameEditMoveDown:Disable();
		elseif	(LootList_EditSel <= 1) then
			-- disable item row move up and enable row move down buttons
			LootList_ListFrameEditMoveUp:Disable();
			LootList_ListFrameEditMoveDown:Enable();
		elseif	(LootList_EditSel >= #LootList_Edit.Sort) then
			-- enable item row move up and disable row move down buttons
			LootList_ListFrameEditMoveUp:Enable();
			LootList_ListFrameEditMoveDown:Disable();
		else
			-- enable item row move buttons
			LootList_ListFrameEditMoveUp:Enable();
			LootList_ListFrameEditMoveDown:Enable();
		end

		-- editing list means you can trash an item
		LootList_ListsFrameEditColumnHeader12:SetText(LOOTLIST_LISTS_TRASH);
	else
		-- make list name non-editable
		LootList_ListsFrameListName:Hide();
		LootList_ListsFrameListNameFrameRO:Show();
		
		-- disable save and discard
		LootList_ListsFrameSaveList:Disable();
		LootList_ListsFrameDiscardList:Disable();

		-- hide metric toggle button
		LootList_ListsFrameChangeMetrics:Hide();
		
		-- disable item row move buttons
		LootList_ListFrameEditMoveUp:Disable();
		LootList_ListFrameEditMoveDown:Disable();

		-- showing list means you can mark item completed
		LootList_ListsFrameEditColumnHeader12:SetText(LOOTLIST_LISTS_COMPLETE);
	end
end

-- Lists Metric Update UI handler
function LootList_Lists_Metric_UpdateUI(metric, reload)
	local	entry, mUse, mScale, mOverride, mScaleButton;
	
	-- get item entry
	entry = LootList_GetItemEntry();
	
	-- get metric widgets
	mUse = _G["LootList_ListsFrameM"..metric.."Use"];
	mScale = _G["LootList_ListsFrameM"..metric.."Scale"];
	mOverride = _G["LootList_ListsFrameM"..metric.."Override"];
	mScaleButton = _G["LootList_ListsFrameM"..metric.."ScaleButton"];
	
	-- initialise from entry if we have one
	if (entry ~= nil) then
		-- setup the metric options
		mUse:SetChecked(entry["M"..metric.."Use"] == true);
		mOverride:SetChecked(entry["M"..metric.."Override"] == true);
	
		-- using this scale?
		if		(LootList_Edit == nil) then
			-- disable use, scale and override
			mUse:Disable();
			mScale:Disable();
			mOverride:Disable();
			mScaleButton:Disable();
		elseif	(entry["M"..metric.."Use"] == true) then
			-- enable use, scale and override
			mUse:Enable();
			mScale:Enable();
			mOverride:Enable();
			mScaleButton:Enable();
		else
			-- enable use, disable scale and override
			mUse:Enable();
			mScale:Disable();
			mOverride:Disable();
			mScaleButton:Disable();
		end
	else
		-- reset the metric options
		mUse:SetChecked(false);
		mOverride:SetChecked(false);
	
		-- disable use, scale and override
		mUse:Disable();
		mScale:Disable();
		mOverride:Disable();
		mScaleButton:Disable();
	end
	
	-- reload dropdown as required
	if (reload ~= false) then
		-- set up the metric scale
		LootList_Lists_MScale_OnShow(mScale);
	end
end

-- Lists Item Update UI handler
function LootList_Lists_Item_UpdateUI()
	-- do we have a linked item
	if (LootList_ItemLink ~= nil) then
		-- show clear item
		LootList_ListsFrameClearItem:Show();
	else
		-- hide clear item
		LootList_ListsFrameClearItem:Hide();
	end
		
	-- are we editing a list and we have a link?
	if ((LootList_Edit ~= nil) and (LootList_ItemLink ~= nil)) then
		-- is item already in the editing list?
		if (LootList_Edit.List[LootList_ItemID] == nil) then
			-- enable insert, append
			LootList_ListsFrameInsertItem:Enable();
			LootList_ListsFrameAppendItem:Enable();
			
			-- disable remove
			LootList_ListsFrameRemoveItem:Disable();
		else
			-- disable insert, append
			LootList_ListsFrameInsertItem:Disable();
			LootList_ListsFrameAppendItem:Disable();
			
			-- enable remove
			LootList_ListsFrameRemoveItem:Enable();
		end
	else
		-- disable insert, append and remove
		LootList_ListsFrameInsertItem:Disable();
		LootList_ListsFrameAppendItem:Disable();
		LootList_ListsFrameRemoveItem:Disable();
	end
end

-- Get Item Entry handler
function LootList_GetItemEntry(eType)
	-- determine which list to use (existing lists or editing list).  Optional entry restricts which one we can return
	if		((LootList_Edit ~= nil) and (eType ~= LOOTLIST_ENTRY_TYPE.LISTS)) then
		-- use editing list
		return LootList_Edit;
	elseif	((LootList_ListsSel ~= nil) and (eType ~= LOOTLIST_ENTRY_TYPE.EDIT)) then
		-- use existing list
		return LootList_Lists[LootList_ListsSort[LootList_ListsSel]];
	else
		return nil;
	end
end

-- Get Item ID handler
function LootList_GetItemID(link)
	local	_, itemID;
	
	-- extract item ID
	_, _, itemID = string.find(link, LOOTLIST_ITEMID_PATTERN);
	
	return itemID;
end

-- Get Text Item IDs handler
function LootList_GetTextItemIDs(text)
	local	itemIDSet, itemID;

	-- if no text we are done
	if (text == nil) then
		return;
	end
	
	-- no items IDs yet
	itemIDSet = {};

	-- extract each item ID from the text string
	for itemID in string.gmatch(text, LOOTLIST_ITEMID_PATTERN) do
		-- add to set of items
		itemIDSet[itemID] = true;
	end
	
	-- check lists for item IDs
	LootList_CheckListItems(itemIDSet);
end

-- Check List Items handler
function LootList_CheckListItems(itemIDSet, timer)
	local	listIx, listName, itemIx, itemID, isEcho, isPlay, lootList, lootEcho, lootIx, loot;
	
	-- don't bother if not echoing notification or playing sound
	if ((LootList_Options.EchoNotice ~= true) and (LootList_Options.PlaySound ~= true)) then
		return;
	end
	
	-- have we received a check recently?  This prvents a double notification for group loot
	-- and loot window handling
	if ((timer == true) and (LootList_Timer ~= nil) and ((LootList_Timer + LOOTLIST_CHECK_PERIOD) >= time())) then
		-- ignore since we have reported this before
		return;
	end
	
	-- reset timer
	LootList_Timer = nil;
	
	-- inspect each list
	for listIx, listName in ipairs(LootList_ListsSort) do
		-- no loot found yet in this list
		lootList = {};
		
		-- hammer through the list items looking for located item IDs
		for itemIx, itemID in ipairs(LootList_Lists[listName].Sort) do
			-- item ID in found set and item is not yet completed?
			if ((itemIDSet[itemID] ~= nil) and (LootList_Lists[listName].List[itemID].Completed ~= true)) then
				-- add this item's link to the list
				lootList[#lootList + 1] = { Rank=itemIx, Link=LootList_Lists[listName].List[itemID].Link };
				isPlay = true;
			end
		end
		
		-- are we echoing notifications?
		if ((LootList_Options.EchoNotice == true) and (#lootList > 0)) then
			-- determine prefix
			if (#lootList == 1) then
				lootEcho = LOOTLIST_NOTICE_ITEM;
			else
				lootEcho = LOOTLIST_NOTICE_ITEMS;
			end

			-- format message of loot
			for lootIx, loot in ipairs(lootList) do
				-- add link
				lootEcho = lootEcho..string.format(LOOTLIST_NOTICE_LOOT, loot.Rank, loot.Link);
				
				-- add suffix as required
				if		((#lootList > 1) and (lootIx == (#lootList - 1)))  then
					lootEcho = lootEcho..LOOTLIST_NOTICE_AND;
				elseif	((#lootList > 1) and (lootIx < (#lootList - 1)))  then
					lootEcho = lootEcho..LOOTLIST_NOTICE_SEP;
				end				
			end
			
			-- initial hit printed?
			if (isEcho ~= true) then
				-- print blank lines before lists
				print(" ");
				isEcho = true;
			end
			
			-- print this list's hits
			print(string.format(LOOTLIST_NOTICE_MESSAGE, listName, lootEcho));
		end
	end
	
	-- print blank lines after lists
	if (isEcho == true) then
		print(" ");
	end
	
	-- are we to play a found sound?
	if ((LootList_Options.PlaySound == true) and (isPlay == true)) then
		-- yay!
		LootList_Options_PlaySoundNow_OnClick(LootList_OptionsFramePlaySoundNow);
	end
	
	-- if we are to time reporting, set timer now
	if (timer == true) then
		LootList_Timer = time();
	end	
end

-- Get Metric Color handler
function LootList_GetMetricColor(mScale, mBase)
	local	clrBase;
	
	-- determine what color this metric should be
	if		((mScale ~= "") and (mBase < 0.0)) then
		-- Pawn is running?
		if (PawnGetSingleValueFromItem ~= nil) then
			-- green for Pawn
			clrBase = LOOTLIST_COLOR_GREEN;
		else
			-- grey for no Pawn
			clrBase = LOOTLIST_COLOR_GREY;
		end
	elseif	((mScale ~= "") and (mBase > 0.0)) then
		-- red for override
		clrBase = LOOTLIST_COLOR_RED;
	elseif	((mScale == "") and (mBase > 0.0)) then
		-- blue for manual
		clrBase = LOOTLIST_COLOR_BLUE;
	else
		-- orange for blank
		clrBase = LOOTLIST_COLOR_ORANGE;
	end

	return clrBase;
end

-- Set Item Link handler
function LootList_SetItemLink(link)
	local	itemID;
	
	-- set the item text as appropriate
	if (link ~= nil) then
		-- extract the itemID
		itemID = LootList_GetItemID(link);
		
		-- snarf item link if we have an item
		if (itemID ~= nil) then
			-- it is an item
			LootList_ItemID = itemID;
			LootList_ItemLink = link;
		
			-- set link text
			LootList_ListsFrameItemName:SetText(LootList_ItemLink);
			
			-- are we editing a list, item not in list and have auto append?
			if ((LootList_Edit ~= nil and (LootList_Edit.List[LootList_ItemID] == nil)) and (LootList_Options.AutoAppend == true)) then
				-- append this item
				LootList_Lists_Append_OnClick(LootList_ListsFrameAppendItem);
			end
		end
	else
		-- reset the itemID and link
		LootList_ItemID = nil;
		LootList_ItemLink = nil;
		
		-- reset link text
		LootList_ListsFrameItemName:SetText("");
	end
	
	-- update lists item UI
	LootList_Lists_Item_UpdateUI();
end

-- New Edit handler
function LootList_NewEdit()
	-- create new edit entry
	return { Sort={}, List={}, M1Use=false, M1Scale="", M1Override=false, M2Use=false, M2Scale="", M2Override=false, M3Use=false, M3Scale="", M3Override=false };
end

-- New Item handler
function LootList_NewItem(itemID, link)
	local	m1Base, m2Base, m3Base;
	
	-- determine initial base value according to scale
	m1Base = (LootList_Edit.M1Scale == "") and 0.0 or -1.0;
	m2Base = (LootList_Edit.M2Scale == "") and 0.0 or -1.0;
	m3Base = (LootList_Edit.M3Scale == "") and 0.0 or -1.0;
	
	-- create new item entry
	return { ItemID=itemID, Link=link, M1Base=m1Base, M1Proc=0.0, M2Base=m2Base, M2Proc=0.0, M3Base=m3Base, M3Proc=0.0, Completed=false };
end

-- Create Item handler
function LootList_CreateItem(itemIx, itemID, link)
	-- first, add item's key to sort
	table.insert(LootList_Edit.Sort, itemIx, itemID);
	
	-- second, add item ID to list
	LootList_Edit.List[itemID] = LootList_NewItem(itemID, link);
end

-- Create Item handler
function LootList_CreateItems(itemIx, itemList)
	local	_, item;

	-- add each item
	for _, item in ipairs(itemList) do
		-- make sure this guy is not already in list
		if (LootList_Edit.List[item.ItemID] == nil) then
			-- first, add item's key to sort
			table.insert(LootList_Edit.Sort, itemIx, item.ItemID);
	
			-- second, add item ID to list
			LootList_Edit.List[item.ItemID] = LootList_NewItem(item.ItemID, item.Link);

			-- next
			itemIx = itemIx + 1;
		end
	end
end

-- Delete Item handler
function LootList_DeleteItem(itemID)
	local itemIx, value;
	
	-- first, remove item from list
	LootList_Edit.List[itemID] = nil;
	
	-- second, locate item's ID in sort
	for itemIx, value in ipairs(LootList_Edit.Sort) do
		-- this our guy?
		if (value == itemID) then
			-- remove from sort
			table.remove(LootList_Edit.Sort, itemIx);
			break;
		end			
	end
end

-- Get Item List handler
function LootList_GetItemList(text, patId, patText)
	local	_, itemList, itemID, itemText, itemLink;

	-- make sure the text is terminated
	text = text.."\n";

	-- no items initially
	itemList= {};

	-- extract each item ID from the text string
	for itemID, itemText in string.gmatch(text, patId) do
		-- are we extracting text as well?
		if (patText ~= nil) then
			-- see if we have a name
			_, _, itemText = string.find(itemText, patText);
		end

		-- do we have item text?
		if ((itemText == nil) or (itemText == "")) then
			-- use item ID instead
			itemText = itemID;
		end

		-- form the (temporary) item link
		itemLink = string.format(LOOTLIST_ITEMID_FORMAT, LOOTLIST_ITEMQUAL_UNCACHED, itemID, itemText);

		-- add to set of items
		itemList[#itemList + 1] = LootList_NewItem(itemID, itemLink);
	end

	return itemList;
end

-- Get WoW Version in TOC Format
function LootList_GetWoWVersion()
	local	versionWoW, versionTOC;
	local	_, major, minor, patch;

	-- retrieve WoW version
	versionWoW = GetBuildInfo();

	-- tease apart the version into components
	_, _, major, minor, patch = string.find(versionWoW, LOOTLIST_VERSION_WOW);

	-- ensure we are valid
	if ((major == nil) or (minor == nil) or (patch == nil)) then
		-- use default
		major = 0;
		minor = 0;
		patch = 0;
	else
		-- convert to numeric
		major = tonumber(major);
		minor = tonumber(minor);
		patch = tonumber(patch);
	end

	-- convert to TOC format
	versionTOC = string.format(LOOTLIST_VERSION_TOC, major, minor, patch);

	return tonumber(versionTOC);
end

-- Test WoW Version
function LootList_IsWoWVersion(version)
	-- are we on a PTR or WoW's version is equal or higher than than the test?
	if ((LootList_VersionWoW < 10000) or (LootList_VersionWoW >= version)) then
		-- return the requisite update value in the options
		return (LootList_Options["Updated"..version] == nil) or (LootList_Options["Updated"..version] == false);
	else
		-- not our time
		return false;
	end
end

-- Set Column Width handler
function LootList_SetColWidth(self, width)
	-- force it's width
 	self:SetWidth(width);

	-- and the text area
 	_G[self:GetName().."Middle"]:SetWidth(width - 8);
end

-- Copy Table handler
function LootList_CopyTable(srcTable)
	local	desTable = {};
	local	key, val;

	-- hammer through attribute, copying each value/table
	for key, val in pairs(srcTable) do
		-- if this is an embedded table, recurse copying it
		if (type(val) == "table") then
			-- copy the embedded table
			desTable[key] = LootList_CopyTable(val);
		else
			-- simply copy the value
			desTable[key] = val;
		end
	end

	return desTable;
end
