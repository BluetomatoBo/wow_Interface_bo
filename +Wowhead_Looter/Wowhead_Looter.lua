-----------------------------------------
--                                     --
--     W o w h e a d   L o o t e r     --
--                                     --
--                                     --
--    Patch: 5.4.1                     --
--    Updated: October 31, 2013        --
--    E-mail: feedback@wowhead.com     --
--                                     --
-----------------------------------------


local WL_NAME = "|cffffff7fWowhead Looter|r";
local WL_VERSION = 50014;
local WL_VERSION_PATCH = 3;


-- SavedVariables
wlVersion, wlUploaded, wlStats, wlExportData, wlRealmList = 0, 0, "", "", {};
wlAuction, wlEvent, wlItemSuffix, wlObject, wlProfile, wlUnit, wlBaseStats, wlItemDurability, wlBattlePetStats = {}, {}, {}, {}, {}, {}, {}, {}, {};

-- SavedVariablesPerCharacter
wlSetting = {};
wlScans = {
	guid = nil,
	glyphs = "",
	archaeology = {},
	timePlayedTotal = 0,
};
wlPetBlacklist = nil;
wlUIReloaded = nil;

-- Constants
local WL_LOREMASTER_ID_ALLIANCE = 1681;
local WL_LOREMASTER_ID_HORDE = 1682;
local WL_FORGE_ID = 1685;
local WL_ANVIL_ID = 192628;
local WL_PING_MAX = 300;
local WL_SPELL_BLACKLIST = {
	[0] = true,     -- ??
	[1] = true,     -- Word of Recall (OLD)
	[4] = true,     -- Word of Recall Other
	[1604] = true,  -- Dazed
	[15571] = true, -- Dazed
	[61394] = true, -- Frozen Wake (Glyph of Freezing Trap)
	[121308] = true, -- Disguise (Glyph of Disguise)
	[132951] = true,-- Flare
	[135299] = true, -- Ice Trap
	[135373] = true, -- Entrapment
};
local WL_LOOT_TOAST_BAGS = {
    [142397] = 98134, 	-- Heroic Cache of Treasures
    [143506] = 98095, 	-- Brawler's Pet Supplies
    [143507] = 94207, 	-- Fabled Pandaren Pet Supplies
	[143508] = 89125, 	-- Sack of Pet Supplies
	[143509] = 93146, 	-- Pandaren Spirit Pet Supplies
	[143510] = 93147, 	-- Pandaren Spirit Pet Supplies
    [143511] = 93149, 	-- Pandaren Spirit Pet Supplies
	[143512] = 93148, 	-- Pandaren Spirit Pet Supplies
    [147598] = 104014, 	-- Pouch of Timeless Coins
	[149222] = 105911,  -- Pouch of Enduring Wisdom
    [149223] = 105912,  -- Oversized Pouch of Enduring Wisdom
};
local WL_REP_MODS = {
	[GetSpellInfo(61849)] = {nil, 0.1},
	[GetSpellInfo(24705)] = {nil, 0.1},
	[GetSpellInfo(30754)] = {GetFactionInfoByID(609), 0.25},
	[GetSpellInfo(39953)] = {GetFactionInfoByID(935), 0.1},
	[GetSpellInfo(32098)] = {GetFactionInfoByID(946), 0.25},
	[GetSpellInfo(39913)] = {GetFactionInfoByID(947), 0.1},
	[GetSpellInfo(32096)] = {GetFactionInfoByID(947), 0.25},
	[GetSpellInfo(39911)] = {GetFactionInfoByID(946), 0.1},
	[GetSpellInfo(95987)] = {nil, 0.1},
	[GetSpellInfo(100951)] = {nil, 0.08},
};
-- Map icon_file_name to currency ID
local WL_CURRENCIES = {
	["trade_archaeology_draenei_artifactfragment"] = 398,
	["trade_archaeology_dwarf_artifactfragment"] = 384,
	["trade_archaeology_fossil_fern"] = 393,
	["trade_archaeology_nerubian_artifactfragment"] = 400,
	["trade_archaeology_highborne_artifactfragment"] = 394,
	["trade_archaeology_orc_artifactfragment"] = 397,
	["trade_archaeology_titan_fragment"] = 401,
	["trade_archaeology_troll_artifactfragment"] = 385,
	["trade_archaeology_vrykul_artifactfragment"] = 399,
	["inv_misc_token_argentdawn3"] = 361,
	["pvecurrency-justice"] = 395,
	["pvecurrency-valor"] = 396,
	["ability_paladin_artofwar"] = 241,
	["achievement_profession_chefhat"] = 402,
	["inv_misc_ribbon_01"] = 81,
	["inv_misc_gem_variety_01"] = 61,
	["pvpcurrency-conquest-horde"] = 390,
	["pvpcurrency-honor-horde"] = 392,
	["achievement_zone_tolbarad"] = 391,
	["inv_misc_markoftheworldtree"] = 416,
	["inv_misc_ticket_darkmoon_01"] = 515, -- Darkmoon Prize Ticket
	["inv_misc_coin_17"] = 697, -- Elder Charm of Good Fortune
	["inv_misc_coin_18"] = 738, -- Lesser Charm of Good Fortune
	["archaeology_5_0_mogucoin"] = 752, -- Mogu Rune of Fate
	["inv_misc_archaeology_mantidstatue_01"] = 754, -- Mantid Archaeology Fragment
	["inv_arcane_orb"] = 776, -- Warforged Seal
	["timelesscoin"] = 777, -- Timeless Coin
	["timelesscoin-bloody"] = 789, -- Bloody Coin
};
local VALOR_TIER1_LFG_ID = 301;
-- Random Dungeon IDs extracted from LFGDungeons.dbc
local WL_AREAID_TO_DUNGEONID = {
	[2] = {
		-- Random Cata Normal : 300
		[769] = 300, -- Vortex Pinnacle
		[768] = 300, -- The Stonecore
		[759] = 300, -- Halls of Origination
		[757] = 300, -- Grim Batol
		[753] = 300, -- Blackrock Caverns
		[767] = 300, -- Throne of the Tides
		[747] = 300, -- Lost City of the Tol'vir
		-- Random LK Normal: 261
		[523] = 261, -- Utgarde Keep
		[524] = 261, -- Utgarde Pinnacle
		[533] = 261, -- Azjol-Nerub
		[528] = 261, -- The Oculus
		[525] = 261, -- Halls of Lightning
		[526] = 261, -- Halls of Stone
		[521] = 261, -- The Culling of Stratholme
		[534] = 261, -- Drak'tharon Keep
		[530] = 261, -- Gundrak
		[522] = 261, -- Ahn'kahet
		[536] = 261, -- Violet Hold
		[520] = 261, -- The Nexus
	},
	[3] = {
		-- Random Zandalari Heroic: 341
		[793] = 301, -- ZG
		[781] = 301, -- ZA
		-- Random Cata Heroic: 301
		[769] = 301, -- Vortex Pinnacle
		[768] = 301, -- The Stonecore
		[759] = 301, -- Halls of Origination
		[757] = 301, -- Grim Batol
		[753] = 301, -- Blackrock Caverns
		[767] = 301, -- Throne of the Tides
		[747] = 301, -- Lost City of the Tol'vir
		[756] = 301, -- The Deadmines
		[764] = 301, -- ShadowFang Keep
		-- Random LK Heroic: 262
		[524] = 262, -- Utgarde Pinnacle
		[521] = 262, -- The Culling of Stratholme
		[528] = 262, -- The Oculus
		[525] = 262, -- Halls of Lightning
		[526] = 262, -- Halls of Stone
		[534] = 262, -- Drak'tharon Keep
		[530] = 262, -- Gundrak
		[522] = 262, -- Ahn'kahet
		[536] = 262, -- Violet Hold
		[520] = 262, -- The Nexus
		[533] = 262, -- Azjol-Nerub
		[523] = 262, -- Utgarde Keep
		[542] = 262, -- Trial of the Champion
		[601] = 262, -- Forge of Souls
		[602] = 262, -- Pit of Saron
		[603] = 262, -- Halls of Reflection
	},
};
local WL_REP_DISCOUNT = {
	[5] = 0.05, -- Friend:   5%
	[6] = 0.10, -- Honored: 10%
	[7] = 0.15, -- Revered: 15%
	[8] = 0.20, -- Exalted: 20%
};

-- Speed optimizations
local CheckInteractDistance = CheckInteractDistance;
local DungeonUsesTerrainMap = DungeonUsesTerrainMap;
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo;
local GetArtifactInfoByRace = GetArtifactInfoByRace;
local GetCurrentMapDungeonLevel = GetCurrentMapDungeonLevel;
local GetCursorPosition = GetCursorPosition;
local GetFactionInfo = GetFactionInfo;
local GetInstanceInfo = GetInstanceInfo;
local GetItemCount = GetItemCount;
local GetItemInfo = GetItemInfo;
local GetLanguageByIndex = GetLanguageByIndex;
local GetLootSlotInfo = GetLootSlotInfo;
local GetLootSlotLink = GetLootSlotLink;
local GetMerchantItemCostInfo = GetMerchantItemCostInfo;
local GetMerchantItemCostItem = GetMerchantItemCostItem;
local GetMerchantItemInfo = GetMerchantItemInfo;
local GetMerchantItemLink = GetMerchantItemLink;
local GetNetStats = GetNetStats;
local GetNumArchaeologyRaces = GetNumArchaeologyRaces;
local GetNumArtifactsByRace = GetNumArtifactsByRace;
local GetNumDungeonMapLevels = GetNumDungeonMapLevels;
local GetNumLootItems = GetNumLootItems;
local GetNumPartyMembers = GetNumPartyMembers;
local GetNumQuestLeaderBoards = GetNumQuestLeaderBoards;
local GetNumQuestLogEntries = GetNumQuestLogEntries;
local GetNumRaidMembers = GetNumRaidMembers;
local GetPlayerMapPosition = GetPlayerMapPosition;
local GetProgressText = GetProgressText;
local GetQuestID = GetQuestID;
local GetQuestLogLeaderBoard = GetQuestLogLeaderBoard;
local GetQuestLogPushable = GetQuestLogPushable;
local GetQuestLogSelection = GetQuestLogSelection;
local GetQuestLogTimeLeft = GetQuestLogTimeLeft;
local GetQuestLogTitle = GetQuestLogTitle;
local GetRealZoneText = GetRealZoneText;
local GetRewardText = GetRewardText;
local GetSpellInfo = GetSpellInfo;
local GetTradeSkillInfo = GetTradeSkillInfo;
local GetTradeSkillRecipeLink = GetTradeSkillRecipeLink;
local GetTrainerServiceCost = GetTrainerServiceCost;
local GetTrainerServiceInfo = GetTrainerServiceInfo;
local GetTrainerServiceSkillReq = GetTrainerServiceSkillReq;
local IsEquippedItem = IsEquippedItem;
local IsFishingLoot = IsFishingLoot;
local LootSlotIsCoin = LootSlotIsCoin;
local LootSlotIsCurrency = LootSlotIsCurrency;
local LootSlotIsItem = LootSlotIsItem;
local SelectQuestLogEntry = SelectQuestLogEntry;
local SendAddonMessage = SendAddonMessage;
local SetDungeonMapLevel = SetDungeonMapLevel;
local SetMapToCurrentZone = SetMapToCurrentZone;
local UnitClass = UnitClass;
local UnitExists = UnitExists;
local UnitFactionGroup = UnitFactionGroup;
local UnitGUID = UnitGUID;
local UnitHealthMax = UnitHealthMax;
local UnitIsDead = UnitIsDead;
local UnitIsFriend = UnitIsFriend;
local UnitIsPlayer = UnitIsPlayer;
local UnitIsTapped = UnitIsTapped;
local UnitIsTappedByPlayer = UnitIsTappedByPlayer;
local UnitIsTrivial = UnitIsTrivial;
local UnitLevel = UnitLevel;
local UnitManaMax = UnitManaMax;
local UnitName = UnitName;
local UnitPlayerControlled = UnitPlayerControlled;
local UnitPowerType = UnitPowerType;
local UnitRace = UnitRace;
local UnitReaction = UnitReaction;
local UnitSex = UnitSex;
local floor, ceil, abs = floor, ceil, abs;
local format = format;
local pairs, ipairs = pairs, ipairs;
local type = type;
local select = select;
local tonumber = tonumber;
local tinsert, sort, wipe = tinsert, sort, wipe;
local bit_band, bit_bor = bit.band, bit.bor;
local match, gmatch = match, gmatch;
local find = find;
local sub, gsub = sub, gsub;
local lower = lower;
local time = time;

-- Local Variables
local wlTracker = {};
local wlNpcInfo = {};
local wlLootCooldown = {};
local wlFaction = {};
local wlCurrentMindControlTarget = nil;
local wlTimers = {};
local wlMsgCollected = "";
local wlPlayerCurrencies = {};
local wlLootedCurrencyBlacklist = {};
local wlIsDrunk = false;
local wlId = nil;
local wlN = 0;
local wlEventId = 1;
local wlForgeSpells = {};
local wlAnvilSpells = {};
local wlRegisterCooldown = {};
local wlLootToastSourceId = nil;
local wlCurrentLootToastEventId = nil;

-- local isBetaClient = false;
-- if (tonumber(select(4, GetBuildInfo())) >= 50001) then
	-- isBetaClient = true;
-- end

-- Hooks
local wlDefaultGetQuestReward;
local wlDefaultChatFrame_DisplayTimePlayed;
local wlDefaultReloadUI;
local wlDefaultConsoleExec;


--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--


function wlGetNextEventId()
	if not wlEvent or not wlEvent[wlId] or not wlEvent[wlId][wlN] or not wlEvent[wlId][wlN][wlEventId] then
		return wlEventId;
	else
		wlEventId = wlEventId + 1;
		return wlEventId;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PLAYER_LOGIN(self)
	if wlVersion ~= WL_VERSION or wlUploaded ~= 0 then
		wlReset();
	end

	-- hunter pets after being tamed retain their NPC GUID until next relog
	-- reloadui however doesn't change a pet guid
	if not wlUIReloaded then
		wlPetBlacklist = nil;
	end
	
	wlUIReloaded = nil;

	wlHook();
	wlClearTracker("quest", "rep", "spell");

	wlRealmList[GetCVar("realmList") or "nil"] = 1;

	wlId = wlConcat(wlSelectOne(1, UnitName("player")), GetRealmName());
	
	-- Only add the data to the wlProfile if the character is level 10 or above
	if UnitLevel("player") > 10 then
		wlUpdateVariable(wlProfile, wlId, "init", {
			faction = UnitFactionGroup("player"),
			race = select(2, UnitRace("player")),
			class = select(2, UnitClass("player")),
			sex = UnitSex("player"),
			n = 0,
		});
		wlN = wlUpdateVariable(wlProfile, wlId, "n", "add", 1);
	end
	
	wlUpdateVariable(wlEvent, wlId, wlN, wlGetNextEventId(), "set", {
		what = "login",
		date = wlConcat(wlGetDate()),
	});

	-- Restore settings
	if wlSetting.locMap then
		wlLocMapFrame:Show();
	end

	if wlSetting.locTooltip then
		wlLocTooltipFrame:Show();
	end

	if wlSetting.idTooltip then
		wlIdTooltipFrame:Show();
	end
	
	wlUpdateMiniMapButtonPosition(_G["wlMinimapButton"]);
	if wlSetting.minimap then
		wlMinimapButton:Show();
		_G["wlminimapCheckbox"]:SetChecked(true);
	elseif wlSetting.minimap == nil then
		wlMinimapButton:Show();
		_G["wlminimapCheckbox"]:SetChecked(true);
	else
		_G["wlminimapCheckbox"]:SetChecked(false);
	end
	
	_G["wllocMapCheckbox"]:SetChecked(wlSetting.locMap);
	_G["wllocTooltipCheckbox"]:SetChecked(wlSetting.locTooltip);
	_G["wlidTooltipCheckbox"]:SetChecked(wlSetting.idTooltip);

	wlNumQuestCompleted = wlGetNumLoremasterQuestCompleted();

	-- We're not going to use historical data for the uploads anymore
	-- If a field is "" in the upload, the server will not touch
	-- the database for that field.  (i.e. we didn't scan that data)
	-- If a field is "-1", it means we've scanned for the data, but
	-- there is none (i.e. they don't have any mounts, for example)
	-- The server will wipe any data it had, and replace it with nothing
	-- Otherwise, the field will contain ALL the pertinent data, so the
	-- server wipes what it had and replaces it with what's in the upload

	wlScans = {};
	wlScans.guid = UnitGUID("player");
	wlScans.glyphs = "";
	wlScans.archaeology = {};
	wlScans.timePlayedTotal = 0;
	
	-- to make sure the item cache is available
	wlTimers.baseStats = wlGetTime() + 10000;
	
	-- to make sure bag info is available
	wlTimers.itemDurability = wlGetTime() + 20000;

	wlMessage(WL_LOADED:format(WL_NAME, WL_VERSION), true);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PLAYER_ALIVE(self)
	if not wlTimers.baseStats then
		if not UnitIsGhost("player") then
			return;
		end

		for i=1, DEBUFF_MAX_DISPLAY do
			local debuff = UnitDebuff("player", i);
			local debuffId = select(11, UnitDebuff("player", i));
			if debuff and debuffId ~= 8326 and debuffId ~= 20584 and debuffId ~= 9036 then -- Ghost spell ids
				return;
			end
		end

		wlGetBaseStats();
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PLAYER_LOGOUT(self)
	wlRefreshExportData();
	wlUnhook();
	wlRegisterStats();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_ADDON_LOADED(self, name)
	if name == "+Wowhead_Looter" then
		wlTimers.autoCollect = wlGetTime() + 60000; -- 60 seconds timeout
	end
end

--**--**--**--**--**--**--**-- **--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PET_BATTLE_LEVEL_CHANGED(self)
	scanBattlePetData();
end

--**--**--**--**--**--**--**-- **--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PET_JOURNAL_LIST_UPDATE(self)
	scanBattlePetData();
end

--**--**--**--**--**--**--**-- **--**--**--**--**--**--**--**--**--**--**--

function scanBattlePetData()
	local numPets, numOwned = C_PetJournal.GetNumPets(false);
	for index = 1, numOwned do
		local petID, speciesID, owned = C_PetJournal.GetPetInfoByIndex(index, false);		
		if owned then
			local speciesID, customName, level, xp, maxXp, displayID, name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable = C_PetJournal.GetPetInfoByPetID(petID);
			if speciesID then
				local health, maxHealth, power, speed, rarity = C_PetJournal.GetPetStats(petID);
				if not wlBattlePetStats[petID] then
					wlBattlePetStats[petID] = {};
				end
				wlBattlePetStats[petID][level] = { speciesID, rarity, maxXp, maxHealth, power, speed };
			end
		end
	end
end


function wlEvent_BLACK_MARKET_ITEM_UPDATE(self)
    local numItems = C_BlackMarket.GetNumItems();
    for index = 1, numItems do
		local name, texture, quantity, itemType, usable, level, levelType, sellerName, minBid, minIncrement, currBid, youHaveHighBid, numBids, timeLeft, link, marketID = C_BlackMarket.GetItemInfoByIndex(index);
        if link then
			local eventId = wlGetNextEventId();
			wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);
			wlEvent[wlId][wlN][eventId].what = "blackmarket";
			wlEvent[wlId][wlN][eventId].item = wlParseItemLink(link);
			wlEvent[wlId][wlN][eventId].seller = sellerName;
        end
    end
end


-------------------------
-------------------------
--                     --
--   UNIT  FUNCTIONS   --
--                     --
-------------------------
-------------------------

-- UnitLevel("unit") returns wrong lvl if the player is drunk
local DRUNK_ITEM1, DRUNK_ITEM2, DRUNK_ITEM3, DRUNK_ITEM4 = DRUNK_MESSAGE_ITEM_SELF1:gsub("%%s", ".+"), DRUNK_MESSAGE_ITEM_SELF2:gsub("%%s", ".+"), DRUNK_MESSAGE_ITEM_SELF3:gsub("%%s", ".+"), DRUNK_MESSAGE_ITEM_SELF4:gsub("%%s", ".+");
function wlEvent_CHAT_MSG_SYSTEM(self, msg)
	if wlIsDrunk and (msg == DRUNK_MESSAGE_SELF1 or msg:match(DRUNK_ITEM1)) then
		wlIsDrunk = false;
	elseif not wlIsDrunk and (msg == DRUNK_MESSAGE_SELF2 or msg == DRUNK_MESSAGE_SELF3 or msg == DRUNK_MESSAGE_SELF3) then
		wlIsDrunk = true;
	elseif not wlIsDrunk and (msg:match(DRUNK_ITEM2) or msg:match(DRUNK_ITEM3) or msg:match(DRUNK_ITEM4)) then
		wlIsDrunk = true;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlUnitName(unit)
	local name = UnitName(unit);

	if wlIsValidName(name) then
		return name;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlUnitGUID(unit)
	local name = wlUnitName(unit);
	local id, kind = wlParseGUID(UnitGUID(unit));

	if name and id and kind == "npc" then
		wlUpdateVariable(wlNpcInfo, name, "time", "set", wlGetTime());
		wlUpdateVariable(wlNpcInfo, name, "id", "set", id);
		wlUpdateVariable(wlNpcInfo, name, "isTrivial", "set", UnitIsTrivial(unit));
	end

	return id, kind;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PLAYER_TARGET_CHANGED(self)
	
	if not UnitExists("target") or UnitPlayerControlled("target") or wlIsDrunk then
		return;
	end

	local id, kind = wlUnitGUID("target");

	if not id or kind ~= "npc" then
		return;
	end

	wlUpdateVariable(wlUnit, id, "init", {
		class = select(2, UnitClass("target")),
		isPvp = UnitIsPVP("target") and true or false,
	});
	
	if not wlUnit[id].class then
		wlUpdateVariable(wlUnit, id, "class", "set", select(2, UnitClass("target")));
		wlUpdateVariable(wlUnit, id, "isPvp", "set", UnitIsPVP("target") and true or false);
	end

	wlUpdateVariable(wlUnit, id, "sex", UnitSex("target"), "add", 1);

	if not wlUnit[id].faction then
		wlUnit[id].faction = wlUnitFaction("target");
	end

	wlUpdateVariable(wlUnit, id, "reaction", wlConcat(UnitLevel("player"), UnitFactionGroup("player"), UnitReaction("player", "target")), "init", wlGetTime());

	local dd, level = wlGetInstanceDifficulty(), UnitLevel("target");

	wlUpdateVariable(wlUnit, id, "spec", dd, level, "init", {
		health = UnitHealthMax("target"),
		powermax = UnitManaMax("target"),
		powertype = UnitPowerType("target"),
	});
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlUnitIsClose(unit)
	return CheckInteractDistance(unit, 1) and CheckInteractDistance(unit, 2) and CheckInteractDistance(unit, 3) and CheckInteractDistance(unit, 4);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRegisterUnitLocation(id, level)
	
	local now = wlGetTime();
	
	-- Clean cooldowns
	for k, v in pairs(wlRegisterCooldown) do
		if v < now - 30000 then -- 30 seconds
			wlRegisterCooldown[k] = nil;
		end
	end
	
	-- Check for CD
	if wlRegisterCooldown[id] then
		return;
	end
	
	-- Start CD
	wlRegisterCooldown[id] = now;
	
	local dd = wlGetInstanceDifficulty();
	local mapAreaID = wlGetCurrentMapAreaID();
	local zone, x, y, dl = wlGetLocation();

	wlUpdateVariable(wlUnit, id, "spec", dd, level, "loc", zone, mapAreaID, "init", { n = 0 });

	local i = wlGetLocationIndex(wlUnit[id].spec[dd][level].loc[zone][mapAreaID], x, y, dl, 5);
	if i then
		local n = wlUnit[id].spec[dd][level].loc[zone][mapAreaID][i].n;

		wlUnit[id].spec[dd][level].loc[zone][mapAreaID][i].x = floor((wlUnit[id].spec[dd][level].loc[zone][mapAreaID][i].x * n + x) / (n + 1) + 0.5);
		wlUnit[id].spec[dd][level].loc[zone][mapAreaID][i].y = floor((wlUnit[id].spec[dd][level].loc[zone][mapAreaID][i].y * n + y) / (n + 1) + 0.5);
		wlUnit[id].spec[dd][level].loc[zone][mapAreaID][i].n = n + 1;
	else
		i = wlUpdateVariable(wlUnit, id, "spec", dd, level, "loc", zone, mapAreaID, "n", "add", 1);
		wlUpdateVariable(wlUnit, id, "spec", dd, level, "loc", zone, mapAreaID, i, "set", {
			x = x,
			y = y,
			dl = dl,
			n = 1,
		});
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CHAT_MSG_MONSTER_SAY(self, text, name, language)
	wlRegisterUnitQuote(name, "say", language, text);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CHAT_MSG_MONSTER_WHISPER(self, text, name, language)
	wlRegisterUnitQuote(name, "whisper", language, text);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CHAT_MSG_MONSTER_YELL(self, text, name, language)
	wlRegisterUnitQuote(name, "yell", language, text);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlReplaceWord(word)
	if word == GetUnitName("player", false) or word == GetUnitName("player", true) then
		return "<name>";
	end
	if word == UnitClass("player") then
		return "<class>";
	end
end

local wlLanguage = nil;
function wlRegisterUnitQuote(name, how, language, text)
	-- Init
	text = text:gsub("(%w+-?%w*)", wlReplaceWord);

	if not wlLanguage then
		wlLanguage = {};

		for i=1, GetNumLanguages() do
			wlLanguage[GetLanguageByIndex(i)] = 1;
		end
	end

	-- language -> language known
	if (language ~= "" and not wlLanguage[language]) or not name or not wlNpcInfo[name] or not wlUnit[wlNpcInfo[name].id] then
		return;
	end

	wlUpdateVariable(wlUnit, wlNpcInfo[name].id, "quote", how, text, "set", language);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_GOSSIP_SHOW(self)
	local gossips = { GetGossipOptions() };

	for i=1, #gossips, 2 do
		if gossips[i + 1] ~= "gossip" then
			wlRegisterUnitGossip(gossips[i + 1]);
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_AUCTION_HOUSE_SHOW(self)
	wlRegisterUnitGossip("auctioneer");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_BANKFRAME_OPENED(self)
	wlRegisterUnitGossip("banker");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_BATTLEFIELDS_SHOW(self)
	wlRegisterUnitGossip("battlemaster");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CONFIRM_BINDER(self)
	wlRegisterUnitGossip("binder");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CONFIRM_PET_UNLEARN(self)
	wlRegisterUnitGossip("pettrainer");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CONFIRM_TALENT_WIPE(self)
	wlRegisterUnitGossip("talentwiper");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_GOSSIP_ENTER_CODE(self, codeId)
	wlRegisterUnitGossip("code"..codeId);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_OPEN_TABARD_FRAME(self)
	wlRegisterUnitGossip("tabard");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PET_STABLE_SHOW(self)
	wlRegisterUnitGossip("stable");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_TAXIMAP_OPENED(self)
	wlRegisterUnitGossip("taxi");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRegisterUnitGossip(gossip)
	if not gossip or gossip == "" then
		return;
	end

	local id, kind = wlUnitGUID("npc");

	if not id or kind ~= "npc" or not wlUnit[id] then
		return;
	end

	wlUpdateVariable(wlUnit, id, "gossip", gossip, "add", 1);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_PET_BAR_UPDATE(self)
	local id, kind = wlUnitGUID("pet");
	if wlCurrentMindControlTarget and wlCurrentMindControlTarget ~= id then
		wlCurrentMindControlTarget = nil;
	end
	
	if wlTracker.spell and wlTracker.spell.time and wlTracker.spell.action == "MindControl" and wlTracker.spell.event == "SUCCEEDED" then
		if id and kind == "npc" and wlUnit[id] and id == wlTracker.spell.id then
			wlCurrentMindControlTarget = id;
		end
		
		wlClearTracker("spell");
		wlTrackerClearedTime = wlGetTime();
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- fires whenever the player tames a new pet
function wlEvent_LOCALPLAYER_PET_RENAMED(self)
	if UnitGUID("pet"):match("^0xF.[3]") then
		local id = wlUnitGUID("pet");
		wlPetBlacklist = nil;
		if id then
			wlPetBlacklist = id;
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_MERCHANT_SHOW(self)
	wlRegisterUnitGossip("vendor");
	wlEvent_MERCHANT_UPDATE(self);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_MERCHANT_UPDATE(self)

	local id, kind = wlUnitGUID("npc");

	if not id or kind ~= "npc" or not wlUnit[id] then
		return;
	end

	if CanMerchantRepair() then
		wlUpdateVariable(wlUnit, id, "canRepair", "init", 1);
	end

	local standing = select(2, wlUnitFaction("npc"));
	
	local merchantFilters = GetMerchantFilter();
    SetMerchantFilter(LE_LOOT_FILTER_ALL);
    MerchantFrame_Update();

	local merchantItemList = {};
	local currencies = { GetMerchantCurrencies() };
	local numCurrencies = #currencies;
	local currencyInfos = {};
	for index = 1, numCurrencies do
		local cName, cCount, cIcon = GetCurrencyInfo(currencies[index]);
		currencyInfos[cName] = { currencies[index], cIcon };
	end

	for slot=1, GetMerchantNumItems() do
		local name, icon, price, stack, numAvailable, _, extendedCost = GetMerchantItemInfo(slot);
		local id, subId = wlParseItemLink(GetMerchantItemLink(slot));
		if (id ~= 0 or ((currencyInfos[name] ~= nil) and (currencyInfos[name][2] == icon))) then
			
			if (id == 0) then
				id = currencyInfos[name][1];
				subId = -2; -- this is a currency
			end
			
			price = wlGetFullCost(price, standing);

			if extendedCost then
				local personalRating, battlegroundRating = 0, 0;

				wlGameTooltip:ClearLines();
				wlGameTooltip:SetMerchantItem(slot);

				for i=2, wlGameTooltip:NumLines() do
					local line = _G["wlGameTooltipTextLeft"..i];

					if not line then
						break;
					end

					local pts = wlParseString("^"..ITEM_REQ_ARENA_RATING.."$", line:GetText());
					if pts then
						personalRating = pts;
						break;
					end

					local pts = wlParseString("^"..ITEM_REQ_ARENA_RATING_3V3.."$", line:GetText());
					if pts then
						personalRating = pts + 1000000; -- 3v3 or 5v5 flag
						break;
					end

					local pts = wlParseString("^"..ITEM_REQ_ARENA_RATING_5V5.."$", line:GetText());
					if pts then
						personalRating = pts + 2000000; -- 5v5 flag
						break;
					end

					if type(ITEM_REQ_ARENA_RATING_BG) == "string" and type(ITEM_REQ_ARENA_RATING_3V3_BG) == "string" then
						local pts1, pts2 = wlParseString("^"..ITEM_REQ_ARENA_RATING_BG.."$", line:GetText());
						if pts1 and pts2 then
							personalRating = pts1;
							battlegroundRating = pts2;
							break;
						end

						local pts1, pts2 = wlParseString("^"..ITEM_REQ_ARENA_RATING_3V3_BG.."$", line:GetText());
						if pts1 and pts2 then
							personalRating = pts1 + 1000000; -- 3v3 or 5v5 flag
							battlegroundRating = pts2;
							break;
						end
					end
				end

				extendedCost = personalRating.."#"..battlegroundRating;

				local merchantCurrencies = {};

				for i=1, GetMerchantItemCostInfo(slot) do

					local currencyId;
					local texture, qty, link = GetMerchantItemCostItem(slot, i);

					if link then
						currencyId = wlParseItemLink(link);
					end

					if not currencyId or currencyId == 0 then
						wlGameTooltip:ClearLines();
						wlGameTooltip:SetMerchantCostItem(slot, i);

						if not texture or not wlGameTooltipTextLeft1:GetText() or wlGameTooltipTextLeft1:GetText() == "" then
							return; -- error
						end

						-- Create a unique ID using the icon name and the currency localized name
						currencyId = texture:match("[^\\]+$"):lower().."<>"..wlGameTooltipTextLeft1:GetText();
					end

					tinsert(merchantCurrencies, { qty, currencyId });
				end

				sort(merchantCurrencies,function(l, r) return l[1] < r[1] end);

				for _, currency in ipairs(merchantCurrencies) do
					extendedCost = extendedCost.."#"..currency[1].."<>"..currency[2];
				end

				price = wlConcat(price, extendedCost);
			end

			merchantItemList[wlConcat(id, subId, stack, price)] = numAvailable;
		end
	end

	for link, numAvailable in pairs(merchantItemList) do
		wlUpdateVariable(wlUnit, id, "merchant", link, "max", numAvailable);
	end
	
	SetMerchantFilter(merchantFilters);
    MerchantFrame_Update();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_TRAINER_SHOW(self)
	wlRegisterUnitGossip("trainer");

	local id, kind = wlUnitGUID("npc");

	if not id or kind ~= "npc" or not wlUnit[id] then
		return;
	end
	
	local oldIndex = GetTrainerSelectionIndex();

	local fAvail, fUnavail, fUsed = GetTrainerServiceTypeFilter("available"), GetTrainerServiceTypeFilter("unavailable"), GetTrainerServiceTypeFilter("used");
	SetTrainerServiceTypeFilter("available", 1);
	SetTrainerServiceTypeFilter("unavailable", 1);
	SetTrainerServiceTypeFilter("used", 1);

	local standing = select(2, wlUnitFaction("npc"));
	local isTradeSkill = IsTradeskillTrainer();
	local spellId, skill, skillRank, cost;

	for i=1, GetNumTrainerServices() do
		local spellName, spellSubText, _, _, reqLevel = GetTrainerServiceInfo(i);

		if spellName then
			wlGameTooltip:ClearLines();
			wlGameTooltip:SetTrainerService(i);
			spellId = select(3, wlGameTooltip:GetSpell());

			if isTradeSkill then
				skill, skillRank = GetTrainerServiceSkillReq(i);
				skill, skillRank = skill or "", skillRank or 0;
			else
				skill, skillRank = "", 0;
			end

			cost = wlGetFullCost(wlSelectOne(1, GetTrainerServiceCost(i)), standing);

			wlUpdateVariable(wlUnit, id, "training", wlSelectOne(2, UnitClass("player")), wlConcat(spellId, skill, skillRank, reqLevel, cost), "init", 1);
		end
	end

	SetTrainerServiceTypeFilter("available", fAvail or 0);
	SetTrainerServiceTypeFilter("unavailable", fUnavail or 0);
	SetTrainerServiceTypeFilter("used", fUsed or 0);
	
	ClassTrainerFrame.selectedService = oldIndex >= 1 and oldIndex or 1;
	SelectTrainerService(oldIndex >= 1 and oldIndex or 1);
	ClassTrainerFrame.scrollFrame.scrollBar:SetValue((ClassTrainerFrame.selectedService-1)*CLASS_TRAINER_SKILL_HEIGHT);
	ClassTrainerFrame_Update();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CHAT_MSG_MONSTER_EMOTE(self, emote, name)
	if emote == WL_RUNSAWAY then
		if not name or not wlNpcInfo[name] or not wlUnit[wlNpcInfo[name].id] then
			return;
		end

		wlUpdateVariable(wlUnit, wlNpcInfo[name].id, "runsaway", "init", 1);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlCheckUnitForRep(guid, name)
	wlClearTracker("rep");
		
	local id = wlParseGUID(guid);
	local now = wlGetTime();
	
	-- npc check
	if not guid:match("^0xF.[35]") or not id or id == 0 or not wlUnit[id] then
		return id, now;
	end
	
	-- critter check
	wlGameTooltip:ClearLines();
	wlGameTooltip:SetHyperlink("unit:"..guid);
	for line=2, wlGameTooltip:NumLines() do
		local creatureType = _G["wlGameTooltipTextLeft"..line]:GetText();
		if creatureType:match(WL_CRITTER) then
			return id, now;
		end
	end
	
	if wlNpcInfo[name] and wlNpcInfo[name].id == id and wlIsValidInterval(wlNpcInfo[name].time, now, 15000) then
		wlTracker.rep.time = now;
		wlTracker.rep.id = id;
		wlTracker.rep.flags = wlNpcInfo[name].isTrivial and 1 or 0;
	end
	
	return id, now;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local WL_NPC_FLAGS = bit_bor(COMBATLOG_OBJECT_TYPE_NPC, COMBATLOG_OBJECT_TYPE_GUARDIAN);
local WL_NPC_CONTROL_FLAGS = bit_bor(COMBATLOG_OBJECT_CONTROL_NPC, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER);
local WL_PET_FLAGS = bit_bor(COMBATLOG_OBJECT_TYPE_GUARDIAN, COMBATLOG_OBJECT_TYPE_PET);
local WL_PET_CONTROL_FLAGS = bit_bor(COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_AFFILIATION_MINE);
local WL_MINDCONTROL_FLAGS = bit_bor(COMBATLOG_OBJECT_TYPE_PET, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_AFFILIATION_MINE);
local WL_PURE_NPC_FLAGS = bit_bor(COMBATLOG_OBJECT_TYPE_NPC, COMBATLOG_OBJECT_CONTROL_NPC, COMBATLOG_OBJECT_REACTION_HOSTILE, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER);
local wlMostRecentEliteKilled = {};
local wlConsecutiveNpcKills = 0;
function wlEvent_COMBAT_LOG_EVENT_UNFILTERED(self, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
	-- Extract Gas (Cloud)
	if event == "SPELL_CAST_SUCCESS" and select(1, ...) == 30427 and sourceGUID == UnitGUID("player") then
		wlClearTracker("spell");
		local now = wlGetTime();
		wlTrackerClearedTime = now;
		wlTracker.spell.time = now;
		wlTracker.spell.action = 30427;

	elseif event == "SPELL_CAST_START" or event == "SPELL_CAST_SUCCESS" or event == "SPELL_AURA_APPLIED" then
		local unitId = wlParseGUID(sourceGUID);
		local spellId, spellName = ...;
		
		-- Spell ID is blacklisted
		if not spellId or WL_SPELL_BLACKLIST[spellId] then
			return;
		end
		
		-- npc check
		if not sourceGUID:match("^0xF.[35]") or not unitId or unitId == 0 then
			return;
		end
		
		if bit_band(WL_NPC_FLAGS, sourceFlags) ~= 0 and bit_band(WL_NPC_CONTROL_FLAGS, sourceFlags) == WL_NPC_CONTROL_FLAGS then
		
			wlUpdateVariable(wlUnit, unitId, "spec", wlGetInstanceDifficulty(), "spell", spellId, "add", 1);
			
		elseif not wlCurrentMindControlTarget and bit_band(WL_PET_FLAGS, sourceFlags) ~= 0 and bit_band(WL_PET_CONTROL_FLAGS, sourceFlags) == WL_PET_CONTROL_FLAGS then
		
			-- spell_aura_applied is too dangerous for pets/guardians
			-- exit if the pet is a freshly tamed npc
			if event == "SPELL_AURA_APPLIED" or unitId == wlPetBlacklist then
				return;
			end
			
			local isBpet = false;
			if (bit_band(COMBATLOG_OBJECT_TYPE_PET, sourceFlags) == COMBATLOG_OBJECT_TYPE_PET) then
				isBpet = true;
				for i=1, NUM_PET_ACTION_SLOTS do
					local petSpellName, _, _, _, _, autoCastAllowed = GetPetActionInfo(i);
					if petSpellName == spellName then
						isBpet = false;
						break;
					end
				end
			end	
			if (isBpet) then
				return;
			end
			
			wlUpdateVariable(wlUnit, unitId, "spec", wlGetInstanceDifficulty(), "spell", spellId, "add", 1);

		elseif bit_band(WL_MINDCONTROL_FLAGS, sourceFlags) == WL_MINDCONTROL_FLAGS and wlCurrentMindControlTarget == unitId and wlUnit[unitId] then
		
			for i=1, NUM_PET_ACTION_SLOTS do
				local petSpellName, _, _, _, _, autoCastAllowed = GetPetActionInfo(i);

				if petSpellName == spellName then
					wlUpdateVariable(wlUnit, unitId, "spec", wlGetInstanceDifficulty(), "mcspell", i, "init", wlConcat(spellId, autoCastAllowed or 0));
					break;
				end
			end
		end

	elseif event == "UNIT_DISSIPATES" then
		-- Register cloud's location
		if wlTracker.spell.action == 30427 and wlIsValidInterval(wlTracker.spell.time or 0, wlGetTime(), 5000) then
			local unitId = wlParseGUID(destGUID);
			wlRegisterUnitLocation(unitId, 1);
			wlTrackerClearedTime = wlGetTime();
			wlClearTracker("spell");
		end

	elseif event == "UNIT_DIED" then -- or event == "UNIT_DESTROYED" 
		local id, now = wlCheckUnitForRep(destGUID, destName);
		if bit_band(destFlags, WL_PURE_NPC_FLAGS) ~= WL_PURE_NPC_FLAGS then
			return;
		end
		-- counter to invalidate currency gains if more than 1 kill/sec
		if wlMostRecentEliteKilled.timeOfDeath and wlMostRecentEliteKilled.timeOfDeath + 1000 >= now then
			wlConsecutiveNpcKills = wlConsecutiveNpcKills + 1;
		else
			wlConsecutiveNpcKills = 0;
		end
		wlMostRecentEliteKilled = {
			["guid"] = destGUID,
			["id"] = id,
			["timeOfDeath"] = now,
		};
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--


----------------------------
----------------------------
--                        --
--   FACTION  FUNCTIONS   --
--                        --
----------------------------
----------------------------

function wlUpdateFaction()
	for i=1, 500 do
		local name, _, standing, _, _, _, _, _, header = GetFactionInfo(i);
		if not name then
			break;
		end
		if name and not header then
			wlFaction[name] = standing;
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlUnitFaction(unit)
	wlUpdateFaction();
	wlGameTooltip:ClearLines();
	wlGameTooltip:SetUnit(unit);

	for line=2, wlGameTooltip:NumLines() do
		local faction = _G["wlGameTooltipTextLeft"..line]:GetText();
		if wlFaction[faction] then
			return faction, wlFaction[faction];
		end
	end

	return nil, nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



---------------------------
---------------------------
--                       --
--   OBJECT  FUNCTIONS   --
--                       --
---------------------------
---------------------------

function wlEvent_ITEM_TEXT_BEGIN(self)
	local id, kind = wlUnitGUID("npc");

	if wlUnitName("npc") == ItemTextGetItem() and id and kind == "object" then
		wlRegisterObject(id);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_MAIL_SHOW(self)
	wlRegisterObject(wlUnitGUID("npc"));
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRegisterObject(id)
	if not id then
		return;
	end

	local zone, x, y, dl = wlGetLocation();
	local mapAreaID = wlGetCurrentMapAreaID();

	zone = wlConcat(wlGetInstanceDifficulty(), zone);

	wlUpdateVariable(wlObject, id, zone, mapAreaID, "init", { n = 0 });

	local i = wlGetLocationIndex(wlObject[id][zone][mapAreaID], x, y, dl, 5);
	if i then
		local n = wlObject[id][zone][mapAreaID][i].n;

		wlObject[id][zone][mapAreaID][i].x = floor((wlObject[id][zone][mapAreaID][i].x * n + x) / (n + 1) + 0.5);
		wlObject[id][zone][mapAreaID][i].y = floor((wlObject[id][zone][mapAreaID][i].y * n + y) / (n + 1) + 0.5);
		wlObject[id][zone][mapAreaID][i].n = n + 1;
	else
		i = wlUpdateVariable(wlObject, id, zone, mapAreaID, "n", "add", 1);
		wlUpdateVariable(wlObject, id, zone, mapAreaID, i, "set", {
			x = x,
			y = y,
			dl = dl,
			n = 1,
		});
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



--------------------------
--------------------------
--                      --
--   QUEST  FUNCTIONS   --
--                      --
--------------------------
--------------------------

function wlEvent_UNIT_QUEST_LOG_CHANGED(self, unit)
	if unit ~= "player" then
		return;
	end
	self:RegisterEvent("QUEST_LOG_UPDATE");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local wlQuestLog, wlQuestObjectives, wlCurrentQuestObj = {}, { {}, {} }, 1;
local wlNumQuestCompleted = 0;
function wlEvent_QUEST_LOG_UPDATE(self)
	self:UnregisterEvent("QUEST_LOG_UPDATE");
	
	if not wlEvent or not wlId or not wlEvent[wlId] or not wlN or not wlEvent[wlId][wlN] then
		return;
	end

	local eventId = wlGetNextEventId();
	
	local selectedQuest = GetQuestLogSelection();
	
	wlCurrentQuestObj = 3 - wlCurrentQuestObj; -- toggle: 1 <-> 2
	
	for k, _ in ipairs(wlQuestObjectives[wlCurrentQuestObj]) do
		wlQuestObjectives[wlCurrentQuestObj][k] = nil;
	end
	
	local foundQuests, numQuests, idx, objCounter = 0, select(2, GetNumQuestLogEntries()), 1, 0;
	while foundQuests <= numQuests do
		local title, _, _, _, isHeader, _, _, _, questId = GetQuestLogTitle(idx);
		if not title then 
			break;
		end
		if not isHeader then
			SelectQuestLogEntry(idx);
		
			foundQuests = foundQuests + 1;
		
			wlUpdateVariable(wlQuestLog, foundQuests, "title", "set", title);
			wlQuestLog[foundQuests].id = questId;
			wlQuestLog[foundQuests].timer = ceil((GetQuestLogTimeLeft() or 0) / 15) * 15;
			wlQuestLog[foundQuests].sharable = GetQuestLogPushable() or 0;	

			for objId=1, GetNumQuestLeaderBoards(idx) do
				local _, kind, done = GetQuestLogLeaderBoard(objId, idx);

				if kind == "event" then
				
					objCounter = objCounter + 1;
					
					wlUpdateVariable(wlQuestObjectives, wlCurrentQuestObj, objCounter, "questId", "set", questId);
					wlQuestObjectives[wlCurrentQuestObj][objCounter].objId = objId;
					wlQuestObjectives[wlCurrentQuestObj][objCounter].done = done;

					local index = wlTableFind(wlQuestObjectives[3 - wlCurrentQuestObj], function(a, questId, objId) return a.questId == questId and a.objId == objId; end, questId, objId)
					if index and done and wlQuestObjectives[3 - wlCurrentQuestObj][index].done ~= done then
						wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);
						wlEvent[wlId][wlN][eventId].what = "questStatus";
						wlEvent[wlId][wlN][eventId][wlConcat(questId, objId, done)] = wlConcat(wlGetLocation(),wlGetCurrentMapAreaID());
					end
				end
			end
		end
		idx = idx + 1;
	end
	
	SelectQuestLogEntry(selectedQuest);
	
	if wlTracker.quest.time and wlTracker.quest.action == "accept" then
		i = wlTableFind(wlQuestLog, function(a, v) return a.id and a.id == v; end, wlTracker.quest.id);
		if i and wlIsValidInterval(wlTracker.quest.time, wlGetTime(), 5000) then
			wlRegisterQuestAccept(i);
		end
	end
	
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- Build loremaster quest achievements list
local WL_LOREMASTER_CRITERIA = {};
local wlAllianceNumCrit, wlHordeNumCrit = GetAchievementNumCriteria(WL_LOREMASTER_ID_ALLIANCE), GetAchievementNumCriteria(WL_LOREMASTER_ID_HORDE);
for i=1, wlAllianceNumCrit do
	local _, _, _, _, _, _, _, achID1 = GetAchievementCriteriaInfo(WL_LOREMASTER_ID_ALLIANCE, i);
	local numCrit = GetAchievementNumCriteria(achID1);
	for j=1, numCrit do
		local _, _, _, _, _, _, _, achID2 = GetAchievementCriteriaInfo(achID1, j);
		WL_LOREMASTER_CRITERIA[achID2] = true;
	end
end
for i=1, wlHordeNumCrit do
	local _, _, _, _, _, _, _, achID1 = GetAchievementCriteriaInfo(WL_LOREMASTER_ID_HORDE, i);
	local numCrit = GetAchievementNumCriteria(achID1);
	for j=1, numCrit do
		local _, _, _, _, _, _, _, achID2 = GetAchievementCriteriaInfo(achID1, j);
		if not WL_LOREMASTER_CRITERIA[achID2] then
			WL_LOREMASTER_CRITERIA[achID2] = true;
		end
	end
end
function wlGetNumLoremasterQuestCompleted()
	local nQuestCompleted = 0;

	for id, _ in pairs(WL_LOREMASTER_CRITERIA) do
		nQuestCompleted = nQuestCompleted + (wlSelectOne(4, GetAchievementCriteriaInfo(id, 1)) or 0);
	end

	return nQuestCompleted;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_QUEST_DETAIL(self)
	wlClearTracker("quest");

	local name, id, kind = wlUnitName("questnpc"), wlUnitGUID("questnpc");
	if not name or not id then
		return;
	end

	if kind == "object" then
		wlRegisterObject(id);
	end

	wlTracker.quest.time = wlGetTime();
	wlTracker.quest.action = "accept";
	wlTracker.quest.id = GetQuestID();
	wlTracker.quest.targetname = name;
	wlTracker.quest.targetkind = kind;
	wlTracker.quest.targetid = id;

	-- ...Wait for the quest log refresh to register the quest
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_QUEST_PROGRESS(self)
	wlClearTracker("quest");

	wlTracker.quest.id = GetQuestID();
	wlTracker.quest.progress = wlGetSourceText(GetProgressText());

	wlTracker.quest.time = wlGetTime();
	wlTracker.quest.action = "progress";
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_QUEST_COMPLETE(self)
	if wlTracker.quest.action ~= "progress" or wlTracker.quest.id ~= GetQuestID() then
		wlClearTracker("quest"); -- Not the same quest

		wlTracker.quest.id = GetQuestID();
		wlTracker.quest.progress = "";
	end

	wlTracker.quest.complete = wlGetSourceText(GetRewardText());

	wlTracker.quest.time = wlGetTime();
	wlTracker.quest.action = "complete";
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetQuestReward(...) -- Turn-in
	local success, msg = pcall(wlRegisterQuestReturn);

	if not success then
		error(msg);
	end

	return wlDefaultGetQuestReward(...);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRegisterQuestAccept(index)
	if not wlEvent or not wlId or not wlEvent[wlId] or not wlN or not wlEvent[wlId][wlN] then
		return;
	end

	local eventId = wlGetNextEventId();

	wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);

	wlEvent[wlId][wlN][eventId].what = "quest";
	wlEvent[wlId][wlN][eventId].action = "accept";

	wlEvent[wlId][wlN][eventId].timer = wlQuestLog[index].timer;
	wlEvent[wlId][wlN][eventId].sharable = wlQuestLog[index].sharable;

	wlEvent[wlId][wlN][eventId].questid = wlTracker.quest.id;
	wlEvent[wlId][wlN][eventId].targetname = wlTracker.quest.targetname;
	wlEvent[wlId][wlN][eventId].targetkind = wlTracker.quest.targetkind;
	wlEvent[wlId][wlN][eventId].targetid = wlTracker.quest.targetid;

	wlClearTracker("quest");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRegisterQuestReturn()
	if wlTracker.quest.action ~= "complete" then
		return;
	end

	local name, id, kind = wlUnitName("questnpc"), wlUnitGUID("questnpc");

	if not name or not id then
		return;
	end

	if kind == "object" then
		wlRegisterObject(id);
	end

	if not wlEvent or not wlId or not wlEvent[wlId] or not wlN or not wlEvent[wlId][wlN] then
		return;
	end

	local eventId = wlGetNextEventId();

	wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);

	wlEvent[wlId][wlN][eventId].what = "quest";
	wlEvent[wlId][wlN][eventId].action = "turn-in";

	wlEvent[wlId][wlN][eventId].questid = wlTracker.quest.id;
	wlEvent[wlId][wlN][eventId].progress = wlTracker.quest.progress;
	wlEvent[wlId][wlN][eventId].complete = wlTracker.quest.complete;

	wlEvent[wlId][wlN][eventId].targetname = name;
	wlEvent[wlId][wlN][eventId].targetkind = kind;
	wlEvent[wlId][wlN][eventId].targetid = id;

	local oldNumQuestCompleted = wlNumQuestCompleted;
	wlNumQuestCompleted = wlGetNumLoremasterQuestCompleted();

	if oldNumQuestCompleted == wlNumQuestCompleted - 1 then
		wlEvent[wlId][wlN][eventId].loremaster = 1;
	end

	wlTracker.quest.time = wlGetTime();
	wlTracker.quest.eventId = eventId;
	wlTracker.quest.action = "turn-in";
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_COMBAT_TEXT_UPDATE(self, messageType, param1, param2)
	if messageType == "FACTION" then
		wlUpdateFaction();
		if wlIsValidInterval(wlTracker.quest.time or 0, wlGetTime(), 1000) and wlTracker.quest.action == "turn-in" then
			return; -- Quest reputation
		elseif not wlIsValidInterval(wlTracker.rep.time or 0, wlGetTime(), 1000) or not wlFaction[param1] then
			return; -- Not kill reputation
		end
		
		if param2 == 0 then -- for safety
			return;
		end
		
		local repMod = 1;
		if IsSpellKnown(20599) then -- Diplomacy
			repMod = repMod + 0.1;
		end
		if IsSpellKnown(78634) then -- Guild lvl 4
			repMod = repMod + 0.05;
		elseif IsSpellKnown(78635) then -- Guild lvl 12
			repMod = repMod + 0.1;
		end
		for buffName, factMod in pairs(WL_REP_MODS) do
			if UnitBuff("player", buffName) then
				if param1 == factMod[1] or factMod == nil then
					repMod = repMod + factMod[2];
				end
			end
		end
		
		param2 = floor((param2/repMod) + 0.5);
		wlUpdateVariable(wlUnit, wlTracker.rep.id, "spec", wlGetInstanceDifficulty(), "rep", wlConcat(param1, wlFaction[param1], param2, wlTracker.rep.flags), "add", 1);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetInstanceDifficulty()
	local _, instanceType, instanceDifficulty, _, maxPlayers, dynamicDifficulty = GetInstanceInfo();

	if type(dynamicDifficulty) ~= "nil" and dynamicDifficulty == 1 then
		if instanceDifficulty == 1 then
			instanceDifficulty = 3;
		elseif instanceDifficulty == 2 then
			instanceDifficulty = 4;
		end
	end

	if instanceType == "party"  or (instanceType == nil and maxPlayers == 3) then
		return -instanceDifficulty;
	elseif instanceType == "raid" then
		if instanceDifficulty == 2 and IsPartyLFG() and IsInLFGDungeon() then
			return 7; -- LFR 25
		end
		return instanceDifficulty;
	else
		return 0;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--


-------------------------
-------------------------
--                     --
--   LOOT  FUNCTIONS   --
--                     --
-------------------------
-------------------------

local WL_NPC, WL_OBJECT, WL_ITEM, WL_ZONE = 1, 2, 4, 64;

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

--	ID = { spellName, sourceFlags, isLootSpell }
local wlSpells = {
	Disenchanting = { GetSpellInfo(13262) or "", WL_ITEM, 1 },
	Engineering = { GetSpellInfo(49383) or "", WL_NPC, 1 },
	Fishing = { GetSpellInfo(131476) or "", WL_ZONE, 1 },
	HerbGathering = { GetSpellInfo(2366) or "", WL_NPC + WL_OBJECT, 1 },
	Milling = { GetSpellInfo(51005) or "", WL_ITEM, 1 },
	Mining = { GetSpellInfo(2575) or "", WL_NPC + WL_OBJECT, 1 },
	Opening = { GetSpellInfo(3365) or "", WL_OBJECT, 2 },
	PickPocketing = { GetSpellInfo(921) or "", WL_NPC, 2 },
	Prospecting = { GetSpellInfo(31252) or "", WL_ITEM, 1 },
	Skinning = { GetSpellInfo(8613) or "", WL_NPC, 1 },
	MindControl = { GetSpellInfo(605) or "", WL_NPC, nil },
	Archaeology = { GetSpellInfo(73979) or "", WL_OBJECT, 1 },
	-- BeastLore = { GetSpellInfo(1462) or "", WL_NPC, nil },
	-- PickLocking = { GetSpellInfo(1804) or "", WL_OBJECT, 1 }, 
};

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlFindSpell(name)
	for k,v in pairs(wlSpells) do
		if name:match("^"..v[1]) then
			return k;
		end
	end

	return nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--
local spellCastID = nil;
local wlTrackerClearedTime = 0;
function wlEvent_UNIT_SPELLCAST_SENT(self, unit, spell, rank, target, lineID)
	if unit ~= "player" or not target or spellCastID then
		return;
	end
	
	wlPotentialBagTimer = nil;

	local spellId = wlFindSpell(spell);

	if spellId then
	
		wlClearTracker("spell");
		local now = wlGetTime();
		wlTrackerClearedTime = now;
		
		local npcName, npcUnit = GameTooltip:GetUnit();
		if not npcName and wlUnitName("target") == target then
			npcName, npcUnit = target, "target";
		end
		
		local itemName, itemLink = GameTooltip:GetItem();

		-- npc
		if bit_band(wlSpells[spellId][2], WL_NPC) ~= 0 and npcName and not itemName then

			local name, id = wlUnitName(npcUnit or ""), wlUnitGUID(npcUnit or "");

			if npcName ~= target or name ~= target or not id then
				return;
			end
			
			wlTracker.spell.kind = "npc";
			wlTracker.spell.id = id;
			wlTracker.spell.name = name;

		-- item
		elseif bit_band(wlSpells[spellId][2], WL_ITEM) ~= 0 then

			wlTracker.spell.kind = "item";

			if itemName and itemName == target then
				wlTracker.spell.id = wlParseItemLink(itemLink);
				wlTracker.spell.name = itemName;

			elseif target ~= "" then
				wlTracker.spell.id = wlParseItemLink(wlSelectOne(2, GetItemInfo(target)));
				wlTracker.spell.name = target;

			else
				wlTracker.spell.id = nil;
				wlTracker.spell.name = nil;
			end

		-- object
		elseif bit_band(wlSpells[spellId][2], WL_OBJECT) ~= 0 and not npcName and not itemName then

			if target == "" then
				return;
			end

			local zone, x, y, dl = wlGetLocation();

			-- wlRegisterObject(wlConcat(spellId, zone, target)); moved to LOOT_OPENED for more precision
			
			wlTracker.spell.kind = "object";
			wlTracker.spell.name = target;
			wlTracker.spell.zone = zone;
			wlTracker.spell.x = x;
			wlTracker.spell.y = y;
			wlTracker.spell.dl = dl;

		-- zone (fishing)
		elseif bit_band(wlSpells[spellId][2], WL_ZONE) ~= 0 and not npcName and not itemName then

			if target ~= "" then
				return;
			end

			local zone, x, y, dl = wlGetLocation();

			wlTracker.spell.kind = "zone";
			wlTracker.spell.zone = zone;
			wlTracker.spell.x = x;
			wlTracker.spell.y = y;
			wlTracker.spell.dl = dl;

		else
			return;
		end

		wlTracker.spell.time = now;
		wlTracker.spell.event = "SENT";
		wlTracker.spell.action = spellId;
		
		-- associate unit_spellcast_* events
		spellCastID = lineID;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_UNIT_SPELLCAST_SUCCEEDED(self, unit, spell, rank, lineID, spellId)
	if unit ~= "player" then
		return;
	end
	
	spellCastID = nil;
	
	local now = wlGetTime();
	if WL_LOOT_TOAST_BAGS[spellId] then
		wlClearTracker("spell");
		wlTrackerClearedTime = now;
		wlLootToastSourceId = WL_LOOT_TOAST_BAGS[spellId];
		wlCurrentLootToastEventId = nil;
		wlTimers.clearLootToastSource = now + 250;
		return;
	end

	if wlForgeSpells[spellId] then
		wlRegisterObject(WL_FORGE_ID);
	end
	if wlAnvilSpells[spellId] then
		wlRegisterObject(WL_ANVIL_ID);
	end
	
	if wlTracker.spell.time and wlTracker.spell.event == "SENT" and wlTracker.spell.action == wlFindSpell(spell) then
		wlTracker.spell.event = "SUCCEEDED";
		wlTracker.spell.time = wlGetTime();
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_UNIT_SPELLCAST_FAILED(self, unit, spell, rank, lineID, spellID)
	-- only reset wlTracker.spell if the 'failed' comes from an associated 'sent'
	if unit == "player" and spellCastID == lineID then
		spellCastID = nil;
		wlClearTracker("spell");
		wlTrackerClearedTime = wlGetTime();
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_SHOW_LOOT_TOAST(self, typeIdentifier, itemLink, quantity, specID)
	if not typeIdentifier or (typeIdentifier ~= "item" and typeIdentifier ~= "money") then
        return;
    end
	
	if wlLootToastSourceId then
	
		if not wlEvent or not wlId or not wlEvent[wlId] or not wlN or not wlEvent[wlId][wlN] then
			return;
		end
			
		local _, _, mshome, msworld = GetNetStats();
		if mshome > WL_PING_MAX or msworld > WL_PING_MAX then
			return;
		end
		
		if not wlCurrentLootToastEventId then
			wlCurrentLootToastEventId = wlGetNextEventId();
		end
		local eventId = wlCurrentLootToastEventId;	
	
		wlTracker.spell.action = "Opening";
		wlTracker.spell.kind = "item";
		wlTracker.spell.id = wlLootToastSourceId;
		wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);
		wlEvent[wlId][wlN][eventId].what = "loot";
		wlTableCopy(wlEvent[wlId][wlN][eventId], wlTracker.spell);
		wlEvent[wlId][wlN][eventId].dd = wlGetInstanceDifficulty();
		wlEvent[wlId][wlN][eventId].flags = 0;
		
		local typeId = nil;
		if typeIdentifier == "item" then
			typeId = wlParseItemLink(itemLink);
		elseif typeIdentifier == "money" then
			typeId = "coin";
		end
		
		wlEvent[wlId][wlN][eventId]["drop"] = wlEvent[wlId][wlN][eventId]["drop"] or {};	
		wlEvent[wlId][wlN][eventId].fromLootToast = 1;		
		wlUpdateVariable(wlEvent, wlId, wlN, eventId, "drop", #wlEvent[wlId][wlN][eventId]["drop"] + 1, "set", wlConcat(typeId, quantity));
		
	end
	
	wlClearTracker("spell");
	wlTrackerClearedTime = wlGetTime();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlBagItemOnUse(link, bag, slot)
	local now = wlGetTime();
	if wlIsValidInterval(wlTracker.spell.time or 0, now, 250) and wlTracker.spell.kind == "item" and wlTracker.spell.event == "SENT" then
		local id, _, _, _, _, _, _, name = wlParseItemLink(link);

		if (wlTracker.spell.id and wlTracker.spell.id ~= id) or (wlTracker.spell.name and wlTracker.spell.name ~= name) then
			return;
		end

		if not wlTracker.spell.id or not wlTracker.spell.name then
			wlTracker.spell.id = id;
			wlTracker.spell.name = name;
		end

		return;
	end
	
	if link and (not bag or not slot) then
		bag, slot = wlGuessBagAndSlot(link);
	end
	
	local id = wlParseItemLink(link);
	if bag and slot then
		local openable = select(6, GetContainerItemInfo(bag, slot));
		if openable then
			wlGameTooltip:ClearLines();
			wlGameTooltip:SetBagItem(bag, slot);
			for i=2, wlGameTooltip:NumLines() do
				local text = _G["wlGameTooltipTextLeft"..i]:GetText();
				if text == ITEM_OPENABLE then
					wlClearTracker("spell");
					wlTrackerClearedTime = now;

					wlTracker.spell.time = now;
					wlTracker.spell.event = "SUCCEEDED";
					wlTracker.spell.action = "Opening";
					wlTracker.spell.kind = "item";
					wlTracker.spell.id = id;
					wlTracker.spell.name = wlGameTooltipTextLeft1:GetText();
					break;
				end
			end
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGuessBagAndSlot(link)
	local itemID = wlParseItemLink(link);
	for bag = NUM_BAG_FRAMES, 0, -1 do
		for slot=1, GetContainerNumSlots(bag) do
			if wlParseItemLink(GetContainerItemLink(bag, slot)) == itemID then
				return bag, slot;
			end
		end
	end
	return nil, nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetLockedID()
	-- an item becomes locked (grayed out) when it is being looted
	for bag = NUM_BAG_FRAMES, 0, -1 do
		for slot=1, GetContainerNumSlots(bag) do
			if select(3, GetContainerItemInfo(bag, slot)) then
				local link = GetContainerItemLink(bag, slot);
				return wlParseItemLink(link);
			end
		end
	end
	return nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_LOOT_CLOSED(self)
	wlClearTracker("spell");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_LOOT_OPENED(self)

	if not wlEvent or not wlId or not wlEvent[wlId] or not wlN or not wlEvent[wlId][wlN] then
		return;
	end
	
	local _, _, mshome, msworld = GetNetStats();
	if mshome > WL_PING_MAX or msworld > WL_PING_MAX then
		wlClearTracker("spell");
		return;
	end
	
	wipe(wlLootedCurrencyBlacklist);
	
	local now = wlGetTime();
	local eventId = wlGetNextEventId();
	local fromFishing = IsFishingLoot();


	-- Clean wlLootCooldown variable
	for k, v in pairs(wlLootCooldown) do
		if v < now - 300000 then -- 5min
			wlLootCooldown[k] = nil;
		end
	end
	
	if wlTracker.spell.time then

		if (not wlIsValidInterval(wlTracker.spell.time or 0, now, 1000) and not fromFishing) or wlTracker.spell.event ~= "SUCCEEDED" or not wlSpells[wlTracker.spell.action][3] then
			wlClearTracker("spell");
			return;
		end
		
		if fromFishing and wlTracker.spell.kind ~= "zone" then
			wlClearTracker("spell");
			return;
		end
		
		if wlTracker.spell.id then
			wlTracker.spell.name = nil;
		end
		
		if wlTracker.spell.kind == "item" then
			-- double check ID for bag items, we're never too sure
			local lockedID = wlGetLockedID();
			if not wlTracker.spell.id or lockedID ~= wlTracker.spell.id then
				wlClearTracker("spell");
				return;
			end
			
			if wlLootCooldown[wlTracker.spell.id] then
				wlClearTracker("spell");
				return;
			end
			wlLootCooldown[wlTracker.spell.id] = now;
		end
		
		wlTracker.spell.time = nil;
		wlTracker.spell.event = nil;

	elseif wlIsValidName(UnitName("target")) and UnitIsTappedByPlayer("target") and wlUnitIsClose("target") and UnitIsDead("target") and not UnitIsFriend("player", "target") and not fromFishing then
		if UnitIsPlayer("target") then
			-- not used
			-- wlTracker.spell.action = "Killing";
			-- wlTracker.spell.kind = "player";
			-- wlTracker.spell.id = wlConcat(wlSelectOne(2, UnitRace("target")), wlSelectOne(2, UnitClass("target")));
			return;

		elseif not UnitPlayerControlled("target") then

			-- let's make sure there are no interferences
			if wlTrackerClearedTime >= now - 2000 then
				return;
			end
		
			wlTracker.spell.action = "Killing";
			wlTracker.spell.kind = "npc";
			wlTracker.spell.id = wlUnitGUID("target");
			

		else -- pets
			return;
		end

	else
		return;
	end

	-- Loot cooldown
	if wlTracker.spell.action == "Killing" or (wlSpells[wlTracker.spell.action] and wlSpells[wlTracker.spell.action][3] == 1) then
		local guid = nil;

		if wlTracker.spell.kind == "npc" then
			guid = wlConcat(wlTracker.spell.action, UnitGUID("target"));
		elseif wlTracker.spell.kind == "object" then
			guid = wlConcat(wlTracker.spell.action, wlTracker.spell.zone, wlTracker.spell.name);
		end

		if wlLootCooldown[guid] then
			wlClearTracker("spell");
			return;
		end

		if wlIsInParty() then
			SendAddonMessage("WL_LOOT_COOLDOWN", guid, "RAID");
		else
			wlEvent_CHAT_MSG_ADDON(self, "WL_LOOT_COOLDOWN", guid, "RAID", UnitName("player"));
		end
	end

	wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);
	wlEvent[wlId][wlN][eventId].what = "loot";
	wlTableCopy(wlEvent[wlId][wlN][eventId], wlTracker.spell);

	local instanceDiff = wlGetInstanceDifficulty();
	wlEvent[wlId][wlN][eventId].dd = instanceDiff;

	if wlEvent[wlId][wlN][eventId].zone ~= nil then
		wlEvent[wlId][wlN][eventId].mapAreaID = wlGetCurrentMapAreaID();
	end
	
	local flags = 0;

	-- Alliance or Horde
	local faction = UnitFactionGroup("player");
	if faction == "Alliance" then
		flags = flags + 1024;
	elseif faction == "Horde" then
		flags = flags + 2048;
	end

	wlEvent[wlId][wlN][eventId].flags = flags;

	local targetLoots = {};
	local aoeNpcs = {};
	local targetGUID = UnitGUID("target");
	local objectId = nil;

	local i = 1;
	for slot=1, GetNumLootItems() do
		local lootSources = { GetLootSourceInfo(slot) };
			
		local slotType = GetLootSlotType(slot);
		if slotType ~= LOOT_SLOT_NONE then
			local itemId = nil;
			local currencyId = nil;
			
			if slotType == LOOT_SLOT_ITEM then 
				itemId = wlParseItemLink(GetLootSlotLink(slot));
				-- for sourceIndex = 1, #lootSources, 2 do
				--	 print(("%s looted %d of %s"):format(wlParseGUID(lootSources[sourceIndex]), lootSources[sourceIndex + 1], GetItemInfo(itemId)));
				-- end
			elseif slotType == LOOT_SLOT_MONEY then
				itemId = "coin";
			else -- Currency
				itemId = "currency";
				
				local icon_file_name, currencyName, currencyQuantity, currencyRarity, currencyLocked = GetLootSlotInfo(slot);
				icon_file_name = icon_file_name:match("[^\\]+$"):lower();
				currencyId = WL_CURRENCIES[icon_file_name];
				
				wlLootedCurrencyBlacklist = {
					["currencyId"] = currencyId,
					["currencyQuantity"] = currencyQuantity,
				};
			end
			
			for sourceIndex = 1, #lootSources, 2 do
				local qty = lootSources[sourceIndex + 1];
				local aoeGUID = lootSources[sourceIndex];
				if ((wlTracker.spell.action == "Killing" and targetGUID == aoeGUID) or wlTracker.spell.action ~= "Killing") then
					if not targetLoots[itemId] then
						targetLoots[itemId] = {};
					end
					targetLoots[itemId][1] = (targetLoots[itemId][1] or 0) + qty;
					targetLoots[itemId][2] = (targetLoots[itemId][2] or 0) + wlSelectOne(3, GetLootSlotInfo(slot));
					targetLoots[itemId][3] = (currencyId or 0);
					if wlTracker.spell.kind == "object" then
						local guidId, guidKind = wlParseGUID(aoeGUID);
						if (guidKind == "object") then
							objectId = guidId;
						end
					end
				else
					if not aoeNpcs[aoeGUID] then
						aoeNpcs[aoeGUID] = {};
					end
					if not aoeNpcs[aoeGUID][itemId] then
						aoeNpcs[aoeGUID][itemId] = {};
					end
					aoeNpcs[aoeGUID][itemId][1] = (aoeNpcs[aoeGUID][itemId][1] or 0) + qty;
					aoeNpcs[aoeGUID][itemId][2] = (currencyId or 0);
				end
			end
		end
	end
	
	if objectId then
		wlEvent[wlId][wlN][eventId].id = objectId;
		wlRegisterObject(objectId);
	end
	
	local isAoeLoot = (next(aoeNpcs) ~= nil) and 1 or 0;
	wlEvent[wlId][wlN][eventId].isAoeLoot = isAoeLoot;

	for itemId, qtyInfo in pairs(targetLoots) do
		local qty = qtyInfo[1] or qtyInfo[2];
		local currencyId = qtyInfo[3];
		if currencyId > 0 then
			wlUpdateVariable(wlEvent, wlId, wlN, eventId, "drop", i, "set", wlConcat(itemId, qty, currencyId));
		else 
			wlUpdateVariable(wlEvent, wlId, wlN, eventId, "drop", i, "set", wlConcat(itemId, qty));
		end
		i = i + 1;
	end
	
	for aoeGUID, dropInfo in pairs(aoeNpcs) do
		-- Enclosing loop for wlLootCooldown purposes
		repeat
			local guidMsg = wlConcat(wlTracker.spell.action, aoeGUID);
			if wlLootCooldown[guidMsg] then
				-- wlClearTracker("spell");
				-- The next line jumps to the enclosing "for" loop
				-- Equivalent to "continue;"
				do break end;
			end
			if wlIsInParty() then
				SendAddonMessage("WL_LOOT_COOLDOWN", guidMsg, "RAID");
			else
				wlEvent_CHAT_MSG_ADDON(self, "WL_LOOT_COOLDOWN", guidMsg, "RAID", UnitName("player"));
			end

			local npcId = wlParseGUID(aoeGUID);
			local aoeEventId = wlGetNextEventId();
			local aoeCounter = 1;
			wlUpdateVariable(wlEvent, wlId, wlN, aoeEventId, "initArray", 0);
			wlEvent[wlId][wlN][aoeEventId].what = "loot";
			wlEvent[wlId][wlN][aoeEventId].isAoeLoot = isAoeLoot;
			wlTableCopy(wlEvent[wlId][wlN][aoeEventId], wlTracker.spell);
			wlEvent[wlId][wlN][aoeEventId].dd = instanceDiff;
			wlEvent[wlId][wlN][aoeEventId].flags = flags;
			wlEvent[wlId][wlN][aoeEventId].id = npcId;
			-- Add Drops
			for itemId, qty in pairs(dropInfo) do
				if qty[2] > 0 then -- Currency 
					wlUpdateVariable(wlEvent, wlId, wlN, aoeEventId, "drop", aoeCounter, "set", wlConcat(itemId, qty[1], qty[2]));
				else -- Money or Item
					wlUpdateVariable(wlEvent, wlId, wlN, aoeEventId, "drop", aoeCounter, "set", wlConcat(itemId, qty[1]));
				end
				aoeCounter = aoeCounter + 1;
			end
			-- End inner loop
			break;
		until true
	end
	
	-- wlDebugFrame:Show();
	-- wlPrint("-------------------------------");
	-- wlTablePrint(wlTracker.spell);
	-- wlTablePrint(wlEvent[wlId][wlN]);
	-- wlTablePrint(aoeNpcs);
	-- for slot=1, GetNumLootItems() do
	--	 wlPrint("------GetLootSourceInfo(" .. slot .. ")------");
	--	 wlPrint(GetLootSourceInfo(slot));
	-- end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CHAT_MSG_ADDON(self, id, msg, channel, source)
	if id == "WL_LOOT_COOLDOWN" and msg and msg ~= "" then
		wlLootCooldown[msg] = wlGetTime();
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlIsInParty()
	return GetNumSubgroupMembers() > 0 or GetNumGroupMembers() > 1;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



----------------------------
----------------------------
--                        --
--   AUCTION  FUNCTIONS   --
--                        --
----------------------------
----------------------------

function wlPlaceAuctionBid(aType, aIndex, bid)
	local id, subId, enchant, socket1, socket2, socket3, socket4 = wlParseItemLink(GetAuctionItemLink(aType, aIndex));
	local count, _, _, _, _, _, _, buyoutPrice = select(3, GetAuctionItemInfo(aType, aIndex));

	if bid == buyoutPrice and id ~= 0 and enchant == 0 and socket1 == 0 and socket2 == 0 and socket3 == 0 and socket4 == 0 and count > 0 then
		-- checking for cross faction auction house
		local oldAreaId = GetCurrentMapAreaID();
		SetMapToCurrentZone();
		local currentAreaId = GetCurrentMapAreaID();
		SetMapByID(oldAreaId);
		-- 161 Tanaris
		-- 281 Winterspring
		-- 673 The Cape of Stranglethorn
		if currentAreaId == 161 or currentAreaId == 281 or currentAreaId == 673 then
			return;
		end
		local server = GetRealmName();
		local zone = wlGetLocation();

		wlUpdateVariable(wlAuction, server, zone, wlConcat(id, subId, floor(buyoutPrice / count)), "add", 1);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



-------------------------------
-------------------------------
--                           --
--   COMPLETIST  FUNCTIONS   --
--                           --
-------------------------------
-------------------------------

function wlCollect(userInitiated)
	wlQueryTimePlayed();
	
	if wlScanArchaeology() then
		if userInitiated then
			wlAppendMsgCollected(WL_COLLECT_ARCHAEOLOGY);
		end
	end

	if wlScanGlyphs() then
		if userInitiated then
			wlAppendMsgCollected(WL_COLLECT_GLYPHS);
		end
	end
	
	if userInitiated then
		wlTimers.printCollected = wlGetTime() + 1000;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlAppendMsgCollected(value)
	if wlMsgCollected == "" then
		wlMsgCollected = value;
	elseif wlMsgCollected:match(value) then
	-- do nothing
	elseif not wlMsgCollected:match(WL_COLLECT_LASTSEP) then
		wlMsgCollected = value..WL_COLLECT_LASTSEP..wlMsgCollected;
	else
		wlMsgCollected = value..", "..wlMsgCollected;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local wlTimePlayed_SkipNext = false;
function wlChatFrame_DisplayTimePlayed(self, totalTime, ...)
	if wlTimePlayed_SkipNext then
		wlScans.timePlayedTotal = totalTime;
		wlTimePlayed_SkipNext = false;
	else
		wlDefaultChatFrame_DisplayTimePlayed(self, totalTime, ...);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetAddedCurrency(delta)
	for k, v in pairs(delta.changed) do
		if v > 0 then 
			return k, v;
		end
	end
	for k, v in pairs(delta.added) do
		if v > 0 then 
			return k, v;
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_CURRENCY_DISPLAY_UPDATE(...)
	-- generate current list of owned currencies
	local delta = wlScanCurrencies();

	-- see if a boss awarded some currency
	-- don't clean up wlMostRecentEliteKilled here - this may get called several times w/ varying currency awards
	local now = wlGetTime();
	if wlMostRecentEliteKilled and wlMostRecentEliteKilled.id and wlMostRecentEliteKilled.timeOfDeath and wlConsecutiveNpcKills == 0 then
		if now <= (wlMostRecentEliteKilled.timeOfDeath + 1000) then -- 1 second to get currency reward from last elite killed
			local currencyId, currencyAmount = wlGetAddedCurrency(delta);

			-- make sure we have something to report
			if currencyId and currencyAmount then
			
				-- make sure there's no interference with looted currencies
				if wlLootedCurrencyBlacklist.currencyId == currencyId and wlLootedCurrencyBlacklist.currencyQuantity == currencyAmount then
					return;
				end
			
				local isInstance, instanceType = IsInInstance();
				if isInstance == 0 or (instanceType ~= "party" and instanceType ~= "raid") then
					return;
				end
				
				-- make sure the player isn't capped
				local currencyName, currentQ, currencyIcon, currencyEarnedThisWeek, currencyEarnablePerWeek, currencyCap, currencyIsDiscovered = GetCurrencyInfo(currencyId);
				if currentQ == (currencyCap/100) or (currencyEarnablePerWeek ~= 0 and currencyEarnedThisWeek == (currencyEarnablePerWeek/100)) then
					return;
				end
				
				-- make sure the player isn't capped volume 2 (is the info here updated instantly?)
				local currID, tier1DungeonID, tier1Quantity, tier1Limit, overallQuantity, overallLimit, periodPurseQuantity, periodPurseLimit = GetLFGDungeonRewardCapBarInfo(VALOR_TIER1_LFG_ID);
				if currencyId == currID and (tier1Quantity == tier1Limit or overallQuantity == overallLimit or periodPurseQuantity == periodPurseLimit) then
					return;
				end
				
				-- check if the currency combo id+amount is a reward from the random dungeon
				if instanceType == "party" then
					local oldAreaId = GetCurrentMapAreaID();
					SetMapToCurrentZone();
					local areaId = GetCurrentMapAreaID();
					SetMapByID(oldAreaId);
					local diff = (wlSelectOne(3, GetInstanceInfo()) + 1);
					local dungeonGroupId = 0;
					if WL_AREAID_TO_DUNGEONID[diff] then
						dungeonGroupId = WL_AREAID_TO_DUNGEONID[diff][areaId] or 0;
					end
					if dungeonGroupId ~= 0 then
						local _, _, _, _, _, numRewards = GetLFGDungeonRewards(dungeonGroupId);
						for i=1, numRewards do
							local name, currencyFileName, currencyQuantity = GetLFGDungeonRewardInfo(dungeonGroupId, i); -- 1 is the index of the currency if present
							if currencyFileName then
								currencyFileName = currencyFileName:match("[^\\]+$"):lower();
								if WL_CURRENCIES[currencyFileName] and WL_CURRENCIES[currencyFileName] == currencyId and currencyQuantity == currencyAmount then
									return;
								end
							end
						end
					else
						return;
					end
				end
				
				-- check if the player has wintergrasp buff which gives honor WoTlk Dungeons
				local buffName = UnitBuff("player", GetSpellInfo(57940));
				if buffName and currencyId == 392 then
					return;
				end
			
				-- check if the player has guild bonuses and remove them if necessary
				local guildLevel = UnitGetGuildLevel("player");
				if currencyId == 395 and guildLevel >= 18 then -- Justice Points
					currencyAmount = floor(currencyAmount / 1.1);
				elseif currencyId == 392 and guildLevel >= 13 and guildLevel < 19 then -- Honor Points
					currencyAmount = floor(currencyAmount / 1.05);
				elseif currencyId == 392 and guildLevel >= 19 then -- Honor Points
					currencyAmount = floor(currencyAmount / 1.1);
				end
			
				local eventId = wlGetNextEventId();

				wlUpdateVariable(wlEvent, wlId, wlN, eventId, "initArray", 0);
				wlEvent[wlId][wlN][eventId].action = "Killing";
				wlEvent[wlId][wlN][eventId].kind = "npc";
				wlEvent[wlId][wlN][eventId].what = "reward";
				wlEvent[wlId][wlN][eventId].id = wlMostRecentEliteKilled.id;
				wlEvent[wlId][wlN][eventId].dd = wlGetInstanceDifficulty();

				-- Alliance or Horde
				local flags = 0;
				local faction = UnitFactionGroup("player");
				if faction == "Alliance" then
					flags = flags + 1024;
				elseif faction == "Horde" then
					flags = flags + 2048;
				end

				wlEvent[wlId][wlN][eventId].flags = flags;

				-- Add what kind of currency and how much there was
				wlUpdateVariable(wlEvent, wlId, wlN, eventId, "drop", 1, "set", wlConcat("currency", currencyAmount, currencyId));
			end
		end
	end
	
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlScanCurrencies()
	
	local oldScannedCurrencies = wlPlayerCurrencies;
	if type(oldScannedCurrencies) ~= "table" then
		oldScannedCurrencies = {};
	end

	local scannedCurrencies = {};

	-- collect current currency information
	for k, currencyIndex in pairs(WL_CURRENCIES) do
		local localized_label, amount, icon_file_name = GetCurrencyInfo(currencyIndex);
		icon_file_name = icon_file_name:lower();
		if localized_label and "" ~= localized_label and k == icon_file_name and amount > 0 then
			scannedCurrencies[currencyIndex] = amount;
		end
	end

	-- build a profile currency string
	if next(scannedCurrencies) ~= nil then
		wlPlayerCurrencies = scannedCurrencies;
	else
		wlPlayerCurrencies = "-1";
	end

	-- generate the list of currency changes
	-- .changed => { currencyId = delta }
	-- .missing => { currencyId = 0 }
	-- .added => { currencyId = amount }
	-- first 'changed' and 'missing'
	local delta = {
		changed = {},
		missing = {},
		added = {},
	};
	for k, v in pairs(scannedCurrencies) do
		if oldScannedCurrencies[k] then -- possibly changed
			delta.changed[k] = v - oldScannedCurrencies[k];
		else -- added
			delta.added[k] = v;
		end
		oldScannedCurrencies[k] = nil;
	end
	-- missing
	for k, v in pairs(oldScannedCurrencies) do
		delta.missing[k] = 0;
	end

	return delta;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--
local wlArchaeologyProjects = {};
function wlScanArtifacts()
	for raceIndex=1, GetNumArchaeologyRaces() do	
		for artifactIndex=1, GetNumArtifactsByRace(raceIndex) do
			local name, _, _, _, _,  _, _, _, completionCount = GetArtifactInfoByRace(raceIndex, artifactIndex);
			if name and WL_ARTIFACTS[name] and completionCount > 0 then
				wlArchaeologyProjects[WL_ARTIFACTS[name]] = completionCount;
			end	
		end
	end

	if next(wlArchaeologyProjects) ~= nil then
		wlScans.archaeology = wlArchaeologyProjects;
	else
		wlScans.archaeology = "-1"; -- WARNING - it is a string now!
	end
end

function wlEvent_ARTIFACT_COMPLETE(...)
	wlScanArtifacts();
end

function wlEvent_ARTIFACT_HISTORY_READY(...)
	wlScanArtifacts();
end

function wlScanArchaeology()
	local _, _, arch = GetProfessions();
	if arch then
		if not IsArtifactCompletionHistoryAvailable() then
			-- request missing archaeology completion history
			RequestArtifactCompletionHistory();
		else
			wlScanArtifacts();
		end
		return true;
	else
		-- successful scan with nothing to report
		wlScans.archaeology = "-1"; -- WARNING - it's a string now!
		return false;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlQueryTimePlayed()
	-- Don't display time played in chat frame if not queried by player
	wlTimePlayed_SkipNext = true;
	RequestTimePlayed();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_TRADE_SKILL_SHOW(self, ...)
	-- it's okay to run this now even if we can't guarantee all the spells are available at this time
	wlScanProfessionWindow(wlGrabTradeSkillTools);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- a trade skill spell handler
function wlGrabTradeSkillTools(skillLineName, spellId, tradeSkillIndex)
	-- Process Anvil and Forge detection
	local tools = GetTradeSkillTools(tradeSkillIndex);

	if tools then
		if tools:find("Anvil") ~= nil then
			wlAnvilSpells[tonumber(spellId)] = true;
		end
		if tools:find("Forge") ~= nil then
			wlForgeSpells[tonumber(spellId)] = true;
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- roll through the trade skill window, doing something interesting with each spell found
function wlScanProfessionWindow(...)
	-- do some sanity checking
	local parameterCount = select('#', ...)
	if parameterCount <= 0 then 
		return;
	end
	for funcIndex = 1, parameterCount do
		if "function" ~= type(select(funcIndex, ...)) then 
			return;
		end
	end

	local skillLineName = GetTradeSkillLine();

	-- plow through the display list

	local wlCollapsedHeaders = {};
	TradeSkillFrame:UnregisterEvent("TRADE_SKILL_UPDATE");

	-- Clear all filters
	TradeSkillOnlyShowMakeable(false);
	TradeSkillOnlyShowSkillUps(false);

	local invSlot = 0;
	for i=0, select("#", GetTradeSkillInvSlots()) - 1 do
		if GetTradeSkillInvSlotFilter(i) then
			invSlot = i;
			break;
		end
	end

	local subClass = 0;
	for i=0, select("#", GetTradeSkillSubClasses()) - 1 do
		if GetTradeSkillCategoryFilter(i) then
			subClass = i;
			break;
		end
	end

	TradeSkillOnlyShowMakeable(false);
	SetTradeSkillCategoryFilter(0);
	SetTradeSkillInvSlotFilter(0, 1, 1);

	for tradeSkillIndex = 1, GetNumTradeSkills() do
		local name, category, _, isExpanded = GetTradeSkillInfo(tradeSkillIndex);
		if name then
			if category == "header" or category == "subheader" then
				if not isExpanded then
					ExpandTradeSkillSubClass(tradeSkillIndex);
					wlCollapsedHeaders[name] = 1;
				end
			else
				local _, _, spellId = GetTradeSkillRecipeLink(tradeSkillIndex):find("^|%x+|Henchant:(.+)|h%[.+%]");

				-- run the handlers for this trade skill spell
				for funcIndex = 1, parameterCount do
					select(funcIndex, ...)(skillLineName, spellId, tradeSkillIndex);
				end
			end
		end
	end

	-- Restore headers
	for i=1, GetNumTradeSkills() do
		local name, category, _, isExpanded = GetTradeSkillInfo(i);

		if name and (category == "header" or category == "subheader") and wlCollapsedHeaders[name] then
			CollapseTradeSkillSubClass(i);
		end
	end

	-- Restore filters
	TradeSkillOnlyShowMakeable(TradeSkillFrame.filterTbl.hasMaterials);
	TradeSkillOnlyShowSkillUps(TradeSkillFrame.filterTbl.hasSkillUp);
	SetTradeSkillCategoryFilter(subClass);
	SetTradeSkillInvSlotFilter(invSlot, 1, 1);

	TradeSkillFrame:RegisterEvent("TRADE_SKILL_UPDATE");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlScanGlyphs()
	if not IsAddOnLoaded("Blizzard_GlyphUI") then
		TalentFrame_LoadUI();
		LoadAddOn("Blizzard_GlyphUI");
	end

	local ids = "";

	local filterText = GlyphFrameSearchBox:GetText();
	SetGlyphNameFilter("");

	local filterKnown, filterUnknown = IsGlyphFlagSet(GLYPH_FILTER_KNOWN), IsGlyphFlagSet(GLYPH_FILTER_UNKNOWN);

	--	That function is bugged, so I use ToggleGlyphFilter instead... +o(
	--	SetGlyphFilter(GLYPH_FILTER_KNOWN, true);
	--	SetGlyphFilter(GLYPH_FILTER_UNKNOWN, true);

	if not filterKnown then
		ToggleGlyphFilter(GLYPH_FILTER_KNOWN); -- Show
	end

	if filterKnown then
		ToggleGlyphFilter(GLYPH_FILTER_UNKNOWN); -- Hide
	end

	local toggleFilter1, toggleFilter2, toggleFilter4 = not IsGlyphFlagSet(1), not IsGlyphFlagSet(2), not IsGlyphFlagSet(4);
	ToggleGlyphFilter((toggleFilter1 and 1 or 0) + (toggleFilter2 and 2 or 0) + (toggleFilter4 and 4 or 0));

	local i = 1;
	while i <= GetNumGlyphs() do
		local name, _, isKnown, _, castSpell = GetGlyphInfo(i);

		if name ~= "header" and isKnown then
			if ids:len() ~= 0 then
				ids = ids..",";
			end

			ids = ids..castSpell;
		end

		i = i + 1;
	end

	ToggleGlyphFilter((toggleFilter1 and 1 or 0) + (toggleFilter2 and 2 or 0) + (toggleFilter4 and 4 or 0));

	--	That function is bugged, so I use ToggleGlyphFilter instead... +o(
	--	SetGlyphFilter(GLYPH_FILTER_KNOWN, true);
	--	SetGlyphFilter(GLYPH_FILTER_UNKNOWN, true);

	if not filterKnown then
		ToggleGlyphFilter(GLYPH_FILTER_KNOWN); -- Hide
	end

	if filterKnown then
		ToggleGlyphFilter(GLYPH_FILTER_UNKNOWN); -- Show
	end

	if filterText ~= SEARCH then
		SetGlyphNameFilter(filterText);
	end

	if ids ~= "" then
		wlScans.glyphs = ids;
		return true;
	else
		-- Tell the server we scanned the glyphs, and found none (Update this field by: Delete All, Add Nothing)
		wlScans.glyphs = "-1";
		return false;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetExportDataValue()
	local projects = "";
	if "string" == type(wlScans.archaeology) then
		projects = wlScans.archaeology; -- should be "-1", a.k.a. 'seen it, no data to report'
	elseif "table" == type(wlScans.archaeology) then
		-- [<projectSpellId>,<projectSpellId>,...:<projectCompletionCount>,<projectCompletionCount>,...]
		local archKeys, archVals, first = "", "", true;
		for k, v in pairs(wlScans.archaeology) do
			if first then
				archKeys = k;
				archVals = v;
				first = false;
			else
				archKeys = archKeys..","..k;
				archVals = archVals..","..v;
			end
		end
		projects = archKeys..":"..archVals;
		if archKeys == "" and archVals == "" then
			projects = "";
		end
	end
	local value = "&glyphs="..wlScans.glyphs.."&projects="..projects.."&timePlayedTotal="..wlScans.timePlayedTotal;
	return value;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function escapeParentheses(str)
	str = str:gsub('%(', '%%(');
	str = str:gsub('%)', '%%)');
	return str;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRefreshExportData()

	local key = "who="..wlConcatToken(",", GetCVar("realmList"), GetRealmName(), wlSelectOne(1, UnitName("player")), GetAccountExpansionLevel());
	local value = wlGetExportDataValue();

	-- Only add the data to the wlExportData if the character is level 10 or above
	-- Data is still collected, just not uploaded until level 10
	if UnitLevel("player") > 10 then
		if wlExportData:find(escapeParentheses(key)) then
			wlExportData = wlExportData:gsub(escapeParentheses(key).."[^;]*", key..value); -- replace
		else
			wlExportData = wlExportData..key..value..";";
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetLocation()
	local zone = GetRealZoneText() or "";
	local mainZone, _, _, isMicroZone, microZone = GetMapInfo();
	
	-- Save Map
	local currentDL = GetCurrentMapDungeonLevel() or 0;
	local currentId = GetCurrentMapAreaID();
	local wasMicroZone = isMicroZone;
	local oldMicroZone = microZone;
	
	-- Obtain true coords
	SetMapToCurrentZone();
	mainZone, _, _, isMicroZone, microZone = GetMapInfo();
	if((wlSelectOne(3,GetInstanceInfo()) == 0) and (microZone ~= "ShrineofSevenStars") and(microZone ~= "ShrineofTwoMoons") and (isMicroZone == true)) then
		SetMapByID(GetCurrentMapAreaID());
	end
	
	local x, y = GetPlayerMapPosition("player");
	local dl = GetCurrentMapDungeonLevel() or 0;
	
	if not x or not y then
		x, y = 0, 0;
	end

	if x == 0 and y == 0 then
		for level=1,GetNumDungeonMapLevels() do
			SetDungeonMapLevel(level);
			x, y = GetPlayerMapPosition("player");

			if x and y and (x > 0 or y > 0) then
				SetDungeonMapLevel(dl); -- Restore
				dl = level;
				break;
			end

			x, y = 0, 0;
		end
	end

	if DungeonUsesTerrainMap() then
		dl = dl - 1;
	end

	-- Restore Map
	if wasMicroZone then
		if oldMicroZone == "ShrineofSevenStars" then
			SetMapByID(905);
		elseif oldMicroZone == "ShrineofTwoMoons" then
			SetMapByID(903);
		else
			SetMapToCurrentZone();
		end
	else
		SetMapByID(currentId);
	end
	SetDungeonMapLevel(currentDL); 
	
	return zone, floor(x * 1000 + 0.5), floor(y * 1000 + 0.5), dl;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetLocationIndex(array, x, y, dl, delta)
	for i=1, array.n do
		if wlIsEqualValues(x, array[i].x, delta) and wlIsEqualValues(y, array[i].y, delta) and array[i].dl == dl then
			return i;
		end
	end

	return nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRound(n, p)
	local p = math.pow(10, p);
	return floor(n * p + 0.5) / p;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlClearTracker(...)
	for i=1, select("#", ...) do
		local n = wlSelectOne(i, ...);
		wlUpdateVariable(wlTracker, n, "time", "set", nil);

		for k, _ in pairs(wlTracker[n]) do
			wlTracker[n][k] = nil;
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--


--------------------------
--------------------------
--                      --
--   FRAME  FUNCTIONS   --
--                      --
--------------------------
--------------------------

local wlEvents = {
	-- player
	PLAYER_LOGIN = wlEvent_PLAYER_LOGIN,
	PLAYER_LOGOUT = wlEvent_PLAYER_LOGOUT,
	ADDON_LOADED = wlEvent_ADDON_LOADED,
	PLAYER_ALIVE = wlEvent_PLAYER_ALIVE,
	CHAT_MSG_SYSTEM = wlEvent_CHAT_MSG_SYSTEM,

	-- npc
	PLAYER_TARGET_CHANGED = wlEvent_PLAYER_TARGET_CHANGED,
	CHAT_MSG_MONSTER_SAY = wlEvent_CHAT_MSG_MONSTER_SAY,
	CHAT_MSG_MONSTER_WHISPER = wlEvent_CHAT_MSG_MONSTER_WHISPER,
	CHAT_MSG_MONSTER_YELL = wlEvent_CHAT_MSG_MONSTER_YELL,
	CHAT_MSG_MONSTER_EMOTE = wlEvent_CHAT_MSG_MONSTER_EMOTE,
	GOSSIP_SHOW = wlEvent_GOSSIP_SHOW,
	AUCTION_HOUSE_SHOW = wlEvent_AUCTION_HOUSE_SHOW,
	BANKFRAME_OPENED = wlEvent_BANKFRAME_OPENED,
	BATTLEFIELDS_SHOW = wlEvent_BATTLEFIELDS_SHOW,
	CONFIRM_BINDER = wlEvent_CONFIRM_BINDER,
	CONFIRM_PET_UNLEARN = wlEvent_CONFIRM_PET_UNLEARN,
	CONFIRM_TALENT_WIPE = wlEvent_CONFIRM_TALENT_WIPE,
	GOSSIP_ENTER_CODE = wlEvent_GOSSIP_ENTER_CODE,
	OPEN_TABARD_FRAME = wlEvent_OPEN_TABARD_FRAME,
	PET_STABLE_SHOW = wlEvent_PET_STABLE_SHOW,
	TAXIMAP_OPENED = wlEvent_TAXIMAP_OPENED,
	PET_BAR_UPDATE = wlEvent_PET_BAR_UPDATE,
	LOCALPLAYER_PET_RENAMED = wlEvent_LOCALPLAYER_PET_RENAMED,
	MERCHANT_SHOW = wlEvent_MERCHANT_SHOW,
	MERCHANT_UPDATE = wlEvent_MERCHANT_UPDATE,
	TRAINER_SHOW = wlEvent_TRAINER_SHOW,
	COMBAT_LOG_EVENT_UNFILTERED = wlEvent_COMBAT_LOG_EVENT_UNFILTERED,

	-- drops
	LOOT_OPENED = wlEvent_LOOT_OPENED,
	LOOT_CLOSED = wlEvent_LOOT_CLOSED,
	SHOW_LOOT_TOAST = wlEvent_SHOW_LOOT_TOAST,
	CHAT_MSG_ADDON = wlEvent_CHAT_MSG_ADDON,
	UNIT_SPELLCAST_SENT = wlEvent_UNIT_SPELLCAST_SENT,
	UNIT_SPELLCAST_SUCCEEDED = wlEvent_UNIT_SPELLCAST_SUCCEEDED,
	UNIT_SPELLCAST_FAILED = wlEvent_UNIT_SPELLCAST_FAILED,
	UNIT_SPELLCAST_INTERRUPTED = wlEvent_UNIT_SPELLCAST_FAILED,
	UNIT_SPELLCAST_FAILED_QUIET = wlEvent_UNIT_SPELLCAST_FAILED,

	-- object
	ITEM_TEXT_BEGIN = wlEvent_ITEM_TEXT_BEGIN,
	MAIL_SHOW = wlEvent_MAIL_SHOW,

	-- quest
	QUEST_DETAIL = wlEvent_QUEST_DETAIL,
	QUEST_PROGRESS = wlEvent_QUEST_PROGRESS,
	QUEST_COMPLETE = wlEvent_QUEST_COMPLETE,
	QUEST_LOG_UPDATE = wlEvent_QUEST_LOG_UPDATE,
	UNIT_QUEST_LOG_CHANGED = wlEvent_UNIT_QUEST_LOG_CHANGED,
	COMBAT_TEXT_UPDATE = wlEvent_COMBAT_TEXT_UPDATE,

	-- coords tooltip
	PLAYER_ENTERING_WORLD = wlEvent_ZONE_CHANGED,
	ZONE_CHANGED = wlEvent_ZONE_CHANGED,
	ZONE_CHANGED_NEW_AREA = wlEvent_ZONE_CHANGED,

	-- completist
	TRADE_SKILL_SHOW = wlEvent_TRADE_SKILL_SHOW,
	CURRENCY_DISPLAY_UPDATE = wlEvent_CURRENCY_DISPLAY_UPDATE,
	ARTIFACT_HISTORY_READY = wlEvent_ARTIFACT_HISTORY_READY,
	ARTIFACT_COMPLETE = wlEvent_ARTIFACT_COMPLETE,
	
	-- battlepets events disabled for now
	-- PET_JOURNAL_LIST_UPDATE = wlEvent_PET_JOURNAL_LIST_UPDATE,
	-- PET_BATTLE_LEVEL_CHANGED = wlEvent_PET_BATTLE_LEVEL_CHANGED,
	
	BLACK_MARKET_ITEM_UPDATE = wlEvent_BLACK_MARKET_ITEM_UPDATE,
};

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- Get a numeric client version number
function wlGetClientVersion()
	local version = GetBuildInfo();
	local major,minor,patch = strsplit(".", version);
	return ((10000*major) + (100*minor) + (patch));
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local wlMinimapShapes = {
	["ROUND"] = {true, true, true, true},
	["SQUARE"] = {false, false, false, false},
	["CORNER-TOPLEFT"] = {false, false, false, true},
	["CORNER-TOPRIGHT"] = {false, false, true, false},
	["CORNER-BOTTOMLEFT"] = {false, true, false, false},
	["CORNER-BOTTOMRIGHT"] = {true, false, false, false},
	["SIDE-LEFT"] = {false, true, false, true},
	["SIDE-RIGHT"] = {true, false, true, false},
	["SIDE-TOP"] = {false, false, true, true},
	["SIDE-BOTTOM"] = {true, true, false, false},
	["TRICORNER-TOPLEFT"] = {false, true, true, true},
	["TRICORNER-TOPRIGHT"] = {true, false, true, true},
	["TRICORNER-BOTTOMLEFT"] = {true, true, false, true},
	["TRICORNER-BOTTOMRIGHT"] = {true, true, true, false},
};
function wlUpdateMiniMapButtonPosition(button)
	local angle = math.rad(wlSetting and wlSetting.minimapPos or button.minimapPos or 225);
	local x, y, q = math.cos(angle), math.sin(angle), 1;
	if x < 0 then 
		q = q + 1;
	end
	if y > 0 then
		q = q + 2;
	end
	local minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND";
	local quadTable = wlMinimapShapes[minimapShape];
	if quadTable[q] then
		x, y = x*80, y*80;
	else
		local diagRadius = 103.13708498985; --math.sqrt(2*(80)^2)-10
		x = math.max(-80, math.min(x*diagRadius, 80));
		y = math.max(-80, math.min(y*diagRadius, 80));
	end
	button:SetPoint("CENTER", Minimap, "CENTER", x, y);
end

function wlMinimapButtonOnUpdate(self)
	local mx, my = Minimap:GetCenter();
	local px, py = GetCursorPosition();
	local scale = Minimap:GetEffectiveScale();
	px, py = px / scale, py / scale;
	if wlSetting then
		wlSetting.minimapPos = math.deg(math.atan2(py - my, px - mx)) % 360;
	else
		self.minimapPos = math.deg(math.atan2(py - my, px - mx)) % 360;
	end
	wlUpdateMiniMapButtonPosition(self);
end

function wlUpdateMinimapButtonCoord(self)
	local coords = {0, 1, 0, 1};
	local deltaX, deltaY = 0, 0;
	if not self:GetParent().isMouseDown then
		deltaX = (coords[2] - coords[1]) * 0.05;
		deltaY = (coords[4] - coords[3]) * 0.05;
	end
	self:SetTexCoord(coords[1] + deltaX, coords[2] - deltaX, coords[3] + deltaY, coords[4] - deltaY);
end

function wlMiniMapOnEnter(self, motion)
	if self.dragging then
		return;
	end
	GameTooltip:SetOwner(self, "ANCHOR_LEFT");
	GameTooltip:SetText(WL_NAME, 1, 1, 1);
	GameTooltip:AddLine(WL_OPTIONS_MINIMAP_CLICK, nil, nil, nil, 1);
	GameTooltip:Show();
end

function wlMiniMapOnLeave(self, motion)
	GameTooltip:Hide();
end

function wlMiniMapOnClick(self, button, down)
	if not InterfaceOptionsFrame:IsShown() then
		InterfaceOptionsFrame_OpenToCategory([[Wowhead Looter]]);
	else
		InterfaceOptionsFrame:Hide();
	end
end

function wlMiniMapOnDragStart(self, button)
	GameTooltip:Hide();
	self:LockHighlight();
	self.dragging = true;
	self.isMouseDown = true;
	self:SetScript("OnUpdate", wlMinimapButtonOnUpdate);
	self.icon:wlUpdateMinimapButtonCoord();
end

function wlMiniMapOnDragStop(self, button)
	self:SetScript("OnUpdate", nil);
	self:UnlockHighlight();
	self.dragging = false;
	self.isMouseDown = false;
	self.icon:wlUpdateMinimapButtonCoord();
end

function wlMiniMapOnMouseDown(self, button)
	self.isMouseDown = true;
	self.icon:wlUpdateMinimapButtonCoord();
end

function wlMiniMapOnMouseUp(self, button)
	self.isMouseDown = false;
	self.icon:wlUpdateMinimapButtonCoord();
end

function wlCreateFrames()
	local button = CreateFrame("Button", "wlMinimapButton", Minimap);
	button:SetFrameStrata("MEDIUM");
	button:SetWidth(31);
	button:SetHeight(31);
	button:SetFrameLevel(8);
	button:RegisterForClicks("anyUp");
	button:RegisterForDrag("LeftButton");
	button:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]]);
	local overlay = button:CreateTexture(nil, "OVERLAY");
	overlay:SetWidth(53);
	overlay:SetHeight(53);
	overlay:SetTexture([[Interface\Minimap\MiniMap-TrackingBorder]]);
	overlay:SetPoint("TOPLEFT");
	local background = button:CreateTexture(nil, "BACKGROUND");
	background:SetWidth(25); background:SetHeight(25);
	background:SetTexture([[Interface\Minimap\UI-Minimap-Background]]);
	background:SetPoint("TOPLEFT", 2, -4);
	local icon = button:CreateTexture(nil, "ARTWORK");
	icon:SetWidth(20); icon:SetHeight(20);
	icon:SetTexture([[Interface\AddOns\+Wowhead_Looter\minimap-button]]);
	icon:SetPoint("TOPLEFT", 6, -6);
	button.icon = icon;
	button.isMouseDown = false;
	
	icon.wlUpdateMinimapButtonCoord = wlUpdateMinimapButtonCoord;
	icon:wlUpdateMinimapButtonCoord();

	button:SetScript("OnEnter", wlMiniMapOnEnter);
	button:SetScript("OnLeave", wlMiniMapOnLeave);
	button:SetScript("OnClick", wlMiniMapOnClick);
	button:SetScript("OnDragStart", wlMiniMapOnDragStart);
	button:SetScript("OnDragStop", wlMiniMapOnDragStop);
	button:SetScript("OnMouseDown", wlMiniMapOnMouseDown);
	button:SetScript("OnMouseUp", wlMiniMapOnMouseUp);
	button:Hide();
	
	local panel = CreateFrame("Frame", "wlOptionsPanel", InterfaceOptionsFramePanelContainer);
	panel.name = "Wowhead Looter";
	
	local titlebar = CreateFrame("Frame", nil, panel);
	titlebar:SetPoint("TOPLEFT", panel, "TOPLEFT");
	titlebar:SetPoint("TOPRIGHT", panel, "TOPRIGHT");
	titlebar:SetHeight(70);
	titlebar.frameTitle = titlebar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge");
	titlebar.frameTitle:SetJustifyH("CENTER");
	titlebar.frameTitle:SetPoint("TOP", titlebar, "TOP", 0, -20);
	titlebar.frameTitle:SetTextColor(1, 0, 0, 1);
	titlebar.frameTitle:SetText("|TInterface\\AddOns\\+Wowhead_Looter\\wowhead-logo-64:32:32:0:-3|t"..WL_NAME);	
	titlebar.version = titlebar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall");
	titlebar.version:SetJustifyH("CENTER");
	titlebar.version:SetPoint("TOP", titlebar, "TOP", 0, -46);
	titlebar.version:SetText("v"..WL_VERSION);
	
	local header = CreateFrame("Frame", nil, titlebar);
	header:SetHeight(18);
	header:SetPoint("TOPLEFT", titlebar, "BOTTOMLEFT");
	header:SetPoint("TOPRIGHT", titlebar, "BOTTOMRIGHT");
	header.label = header:CreateFontString(nil, "BACKGROUND", "GameFontNormal");
	header.label:SetPoint("TOP");
	header.label:SetPoint("BOTTOM");
	header.label:SetJustifyH("CENTER");
	header.label:SetText(WL_OPTIONS_COMPLETION_DATA);
	header.left = header:CreateTexture(nil, "BACKGROUND");
	header.left:SetHeight(8);
	header.left:SetPoint("LEFT", 10, 0);
	header.left:SetPoint("RIGHT", header.label, "LEFT", -5, 0);
	header.left:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header.left:SetTexCoord(0.81, 0.94, 0.5, 1);
	header.right = header:CreateTexture(nil, "BACKGROUND");
	header.right:SetHeight(8);
	header.right:SetPoint("RIGHT", -10, 0);
	header.right:SetPoint("LEFT", header.label, "RIGHT", 5, 0);
	header.right:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header.right:SetTexCoord(0.81, 0.94, 0.5, 1);
	header.left:SetPoint("RIGHT", header.label, "LEFT", -5, 0);
	
	local completionButton = CreateFrame("Button", nil, header, "UIPanelButtonTemplate");
	completionButton:SetText(WL_OPTIONS_COLLECT);
	completionButton:SetWidth(140);
	completionButton:SetHeight(24);
	completionButton:SetPoint("TOP", header, "BOTTOM", 0, -10);
	completionButton:SetScript("OnClick", function(self, button, down)
		wlTimers["autoCollect"] = nil;
		wlCollect(true);
	end);

	local header2 = CreateFrame("Frame", nil, header);
	header2:SetHeight(18);
	header2:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -44);
	header2:SetPoint("TOPRIGHT", header, "BOTTOMRIGHT");
	header2.label = header2:CreateFontString(nil, "BACKGROUND", "GameFontNormal");
	header2.label:SetPoint("TOP");
	header2.label:SetPoint("BOTTOM");
	header2.label:SetJustifyH("CENTER");
	header2.label:SetText(WL_OPTIONS_LOCATION);
	header2.left = header2:CreateTexture(nil, "BACKGROUND");
	header2.left:SetHeight(8);
	header2.left:SetPoint("LEFT", 10, 0);
	header2.left:SetPoint("RIGHT", header2.label, "LEFT", -5, 0);
	header2.left:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header2.left:SetTexCoord(0.81, 0.94, 0.5, 1);
	header2.right = header2:CreateTexture(nil, "BACKGROUND");
	header2.right:SetHeight(8);
	header2.right:SetPoint("RIGHT", -10, 0);
	header2.right:SetPoint("LEFT", header2.label, "RIGHT", 5, 0);
	header2.right:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header2.right:SetTexCoord(0.81, 0.94, 0.5, 1);
	header2.left:SetPoint("RIGHT", header2.label, "LEFT", -5, 0);
	
	local locationCheckbox = CreateFrame("CheckButton", "wllocTooltipCheckbox", header2, "InterfaceOptionsCheckButtonTemplate");
	_G[locationCheckbox:GetName().."Text"]:SetText(WL_OPTIONS_TOOLTIP);
	locationCheckbox.tooltipText = WL_DESC_LOCATION;
	locationCheckbox:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 10, -10);
	locationCheckbox:SetScript("OnClick", function(self, button, down) 
		wlSetting.locTooltip = locationCheckbox:GetChecked() and true or false;
		if wlSetting.locTooltip then
			wlLocTooltipFrame:Show();
		else
			wlLocTooltipFrame:Hide();
		end
		wlMessage(("%s: %s"):format(WL_NAME, (WL_LOC_TOOLTIP):format(wlEnabledDisabled(wlSetting.locTooltip))), true);
	end);
	local locationCheckbox2 = CreateFrame("CheckButton", "wllocMapCheckbox", locationCheckbox, "InterfaceOptionsCheckButtonTemplate");
	_G[locationCheckbox2:GetName().."Text"]:SetText(WORLD_MAP);
	locationCheckbox2.tooltipText = WL_DESC_LOCATION_WORLDMAP;
	locationCheckbox2:SetPoint("LEFT", locationCheckbox:GetName().."Text", "RIGHT", 20, 0);
	locationCheckbox2:SetScript("OnClick", function(self, button, down) 
		wlSetting.locMap = locationCheckbox2:GetChecked() and true or false;
		if wlSetting.locMap then
			wlLocMapFrame:Show();
		else
			wlLocMapFrame:Hide();
		end
		wlMessage(("%s: %s"):format(WL_NAME, (WL_LOC_MAP):format(wlEnabledDisabled(wlSetting.locMap))), true);
	end);
	local locationResetButton = CreateFrame("Button", "wlLocationResetButton", locationCheckbox, "UIPanelButtonTemplate");
	locationResetButton:SetText("Reset");
	locationResetButton.tooltipText = "|cffffd100"..WL_DESC_LOCATION_RESET.."|r";
	locationResetButton:SetWidth(80);
	locationResetButton:SetHeight(22);
	locationResetButton:SetPoint("TOPLEFT", locationCheckbox, "BOTTOMLEFT");
	locationResetButton:SetScript("OnClick", function(self, button, down) 
		wlFrameReset(wlLocTooltipFrame);
	end);
	
	local header3 = CreateFrame("Frame", nil, header2);
	header3:SetHeight(18);
	header3:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -70);
	header3:SetPoint("TOPRIGHT", header2, "BOTTOMRIGHT");
	header3.label = header3:CreateFontString(nil, "BACKGROUND", "GameFontNormal");
	header3.label:SetPoint("TOP");
	header3.label:SetPoint("BOTTOM");
	header3.label:SetJustifyH("CENTER");
	header3.label:SetText("Npc ID");
	header3.left = header3:CreateTexture(nil, "BACKGROUND");
	header3.left:SetHeight(8);
	header3.left:SetPoint("LEFT", 10, 0);
	header3.left:SetPoint("RIGHT", header3.label, "LEFT", -5, 0);
	header3.left:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header3.left:SetTexCoord(0.81, 0.94, 0.5, 1);
	header3.right = header3:CreateTexture(nil, "BACKGROUND");
	header3.right:SetHeight(8);
	header3.right:SetPoint("RIGHT", -10, 0);
	header3.right:SetPoint("LEFT", header3.label, "RIGHT", 5, 0);
	header3.right:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header3.right:SetTexCoord(0.81, 0.94, 0.5, 1);
	header3.left:SetPoint("RIGHT", header3.label, "LEFT", -5, 0);
	
	local npcCheckbox = CreateFrame("CheckButton", "wlidTooltipCheckbox", header3, "InterfaceOptionsCheckButtonTemplate");
	_G[npcCheckbox:GetName().."Text"]:SetText(WL_OPTIONS_TOOLTIP);
	npcCheckbox.tooltipText = WL_DESC_NPCID;
	npcCheckbox:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 10, -10);
	npcCheckbox:SetScript("OnClick", function(self, button, down) 
		wlSetting.idTooltip = npcCheckbox:GetChecked() and true or false;
		if wlSetting.idTooltip then
			wlIdTooltipFrame:Show();
		else
			wlIdTooltipFrame:Hide();
		end
		wlMessage(("%s: %s"):format(WL_NAME, (WL_ID_TOOLTIP):format(wlEnabledDisabled(wlSetting.idTooltip))), true);
	end);
	local npcResetButton = CreateFrame("Button", "wlNpcResetButton", npcCheckbox, "UIPanelButtonTemplate");
	npcResetButton:SetText("Reset");
	npcResetButton.tooltipText = "|cffffd100"..WL_DESC_NPCID_RESET.."|r";
	npcResetButton:SetWidth(80);
	npcResetButton:SetHeight(22);
	npcResetButton:SetPoint("TOPLEFT", npcCheckbox, "BOTTOMLEFT");
	npcResetButton:SetScript("OnClick", function(self, button, down) 
		wlFrameReset(wlIdTooltipFrame);
	end);
	
	local header4 = CreateFrame("Frame", nil, header3);
	header4:SetHeight(18);
	header4:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -70);
	header4:SetPoint("TOPRIGHT", header3, "BOTTOMRIGHT");
	header4.label = header4:CreateFontString(nil, "BACKGROUND", "GameFontNormal");
	header4.label:SetPoint("TOP");
	header4.label:SetPoint("BOTTOM");
	header4.label:SetJustifyH("CENTER");
	header4.label:SetText(WL_OPTIONS_GENERAL);
	header4.left = header4:CreateTexture(nil, "BACKGROUND");
	header4.left:SetHeight(8);
	header4.left:SetPoint("LEFT", 10, 0);
	header4.left:SetPoint("RIGHT", header4.label, "LEFT", -5, 0);
	header4.left:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header4.left:SetTexCoord(0.81, 0.94, 0.5, 1);
	header4.right = header4:CreateTexture(nil, "BACKGROUND");
	header4.right:SetHeight(8);
	header4.right:SetPoint("RIGHT", -10, 0);
	header4.right:SetPoint("LEFT", header4.label, "RIGHT", 5, 0);
	header4.right:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border");
	header4.right:SetTexCoord(0.81, 0.94, 0.5, 1);
	header4.left:SetPoint("RIGHT", header4.label, "LEFT", -5, 0);
		
	local minimapCheckbox = CreateFrame("CheckButton", "wlminimapCheckbox", header4, "InterfaceOptionsCheckButtonTemplate");
	_G[minimapCheckbox:GetName().."Text"]:SetText(WL_OPTIONS_MINIMAP_SHOW);
	minimapCheckbox:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 10, -10);
	minimapCheckbox:SetScript("OnClick", function(self, button, down) 
		wlSetting.minimap = minimapCheckbox:GetChecked() and true or false;
		if wlSetting.minimap then
			wlMinimapButton:Show();
		else
			wlMinimapButton:Hide();
		end
		wlMessage(("%s: %s"):format(WL_NAME, (WL_MINIMAP):format(wlEnabledDisabled(wlSetting.minimap))), true);
	end);
	
	local resetAllButton = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate");
	resetAllButton:SetText(WL_OPTIONS_RESET_ALL);
	resetAllButton:SetWidth(140);
	resetAllButton:SetHeight(24);
	resetAllButton:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 10, 10);
	resetAllButton:SetScript("OnClick", function(self, button, down) 
		StaticPopup_Show("WL_RESET_CONFIRM");
	end);
	
	InterfaceOptions_AddCategory(panel);
end

function wl_OnLoad(self)
	CreateFrame("Frame", "wlUpdateFrame", UIParent);
	wlUpdateFrame:SetScript("OnUpdate", wl_OnUpdate);
	wlUpdateFrame:Show();
	
	wlCreateFrames();

	for event, _ in pairs(wlEvents) do
		self:RegisterEvent(event);
	end
	
	StaticPopupDialogs["WL_RESET_CONFIRM"] = {
		text = WL_RESET_CONFIRM_TEXT,
		button1 = YES,
		button2 = NO,
		OnAccept = function(self)
			wlReset();
			ReloadUI();
		end,
		timeout = 0,
		whileDead = 1,
		hideOnEscape = 1,
		showAlert = 1,
		OnShow = function(self)
			self:SetFrameStrata("FULLSCREEN_DIALOG");
			self:SetFrameLevel(99);
		end,
	};

	SlashCmdList["WOWHEAD_LOOTER"] = wlParseCommand;
	SLASH_WOWHEAD_LOOTER1 = "/wl";

	tinsert(UISpecialFrames, "wlDebugFrame");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wl_OnEvent(self, event, ...)
	if event and wlEvents[event] then
		wlEvents[event](self, ...);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local uploadReminder = false;
local wlTimeSinceLastUpdate = 0;
local WL_ONUPDATE_THROTTLE = 0.2;
function wl_OnUpdate(self, elapsed)

	wlTimeSinceLastUpdate = wlTimeSinceLastUpdate + elapsed; 	

	if wlTimeSinceLastUpdate >= WL_ONUPDATE_THROTTLE then
	
		local now = wlGetTime();

		for name, timeout in pairs(wlTimers) do
			if timeout and now - timeout >= 0 then
				wlTimers[name] = false; -- Clear timer

				if name == "autoCollect" then
					wlCollect();
					
				elseif name == "clearLootToastSource" then
					wlLootToastSourceId = nil;
					wlCurrentLootToastEventId = nil;
					
				elseif name == "battlepets" then
					scanBattlePetData();
					
				elseif name == "itemDurability" then
					wlGetItemDurability();

				elseif name == "printCollected" then
					if wlMsgCollected ~= "" then
						wlMessage(("%s: %s"):format(WL_NAME, WL_COLLECT_MSG:format(wlMsgCollected)), true);
						if not uploadReminder then
							uploadReminder = true;
							wlMessage(("%s: %s"):format(WL_NAME, WL_UPLOAD_REMINDER), true);
						end	
						wlMsgCollected = "";
					end
				end
			end
		end
		
		wlTimeSinceLastUpdate = 0;
		
		-- filter out unwanted NPC location collection
		if not UnitExists("target") or UnitPlayerControlled("target") or UnitIsTapped("target") or not wlUnitIsClose("target") or wlIsDrunk then
			return;
		end
		
		local id, kind = wlUnitGUID("target");

		if id and kind == "npc" then
			wlRegisterUnitLocation(id, UnitLevel("target"));
		end
		
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlParseCommand(cmd)
	local param1, param2, param3 = cmd:lower():match("^([%S]+)%s*([%S]*)%s*(.*)$");
	param1, param2 = param1 or "", param2 or "";

	if param1 == "debug" then
		if param2 == "show" then
			wlDebugFrame:Show();
		elseif param2 == "hide" then
			wlDebugFrame:Hide();
		elseif param2 == "clear" then
			wlDebugEdit:SetText("");
		elseif param2 == "toggle" then
			if wlDebugFrame:IsShown() then
				wlDebugFrame:Hide();
			else
				wlDebugFrame:Show();
			end
		end

	elseif param1 == "loc" then
		if param2 == "map" then
			wlFrameToggle(wlLocMapFrame, WL_LOC_MAP, "locMap");
		elseif param2 == "tooltip" then
			wlFrameToggle(wlLocTooltipFrame, WL_LOC_TOOLTIP, "locTooltip");
		elseif param2 == "reset" then
			wlFrameReset(wlLocTooltipFrame);
		else
			local _, x, y = wlGetLocation();
			wlMessage(("%s: %s"):format(WL_NAME, WL_LOC:format(x / 10, y / 10)), true);
		end

	elseif param1 == "id" then
		if param2 == "reset" then
			wlFrameReset(wlIdTooltipFrame);
		else
			wlFrameToggle(wlIdTooltipFrame, WL_ID_TOOLTIP, "idTooltip");
		end

	elseif param1:match("^collect$") then
		wlTimers["autoCollect"] = nil; -- Cancel auto-collect
		wlCollect(true);
		
	elseif param1:match("^reset$") then
		StaticPopup_Show("WL_RESET_CONFIRM");
		
	elseif param1:match("minimap") then
		wlFrameToggle(wlMinimapButton, WL_MINIMAP, "minimap");

	else -- Show help
		for _, msg in ipairs(WL_HELP) do
			wlMessage(msg:gsub("%%VERSION%%", WL_VERSION), true);
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlFrameToggle(frame, msg, savename)
	wlSetting[savename] = not wlSetting[savename];
	
	_G["wl"..savename.."Checkbox"]:SetChecked(wlSetting[savename]);

	if wlSetting[savename] then
		frame:Show();
	else
		frame:Hide();
	end

	wlMessage(("%s: %s"):format(WL_NAME, msg:format(wlEnabledDisabled(wlSetting[savename]))), true);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlFrameReset(frame)
	frame:ClearAllPoints();
	frame:SetPoint("CENTER");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlLocMapFrame_OnLoad()
	wlLocMapFrameText:SetText(UnitName("player")..": 100.0, 100.0  -  "..NOT_APPLICABLE..": 100.0, 100.0");
	wlLocMapFrame:SetWidth(wlLocMapFrameText:GetStringWidth() + 20);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlLocMapFrame_OnUpdate()
	-- Player
	local pX, pY = GetPlayerMapPosition("player");

	local playerStr = UnitName("player")..": |cffffffff";
	if pX == 0 or pY == 0 then
		playerStr = playerStr..NOT_APPLICABLE;
	else
		playerStr = ("%s%.1f, %.1f"):format(playerStr, pX * 100, pY * 100);
	end

	-- Cursor
	local width, height, scale = WorldMapDetailFrame:GetWidth(), WorldMapDetailFrame:GetHeight(), WorldMapDetailFrame:GetEffectiveScale();
	local cX, cY = WorldMapDetailFrame:GetCenter();
	local left, bottom = cX - width / 2, cY + height / 2;

	cX, cY = GetCursorPosition();
	cX, cY = (cX / scale - left) / width * 100, (bottom - cY / scale) / height * 100;

	local cursorStr = WL_LOC_CURSOR..": |cffffffff";
	if cX < 0 or cX > 100 or cY < 0 or cY > 100 then
		cursorStr = cursorStr..NOT_APPLICABLE;
	else
		cursorStr = ("%s%.1f, %.1f"):format(cursorStr, cX, cY);
	end
	
	wlLocMapFrameText:SetText(playerStr.."|r  -  "..cursorStr.."|r");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEvent_ZONE_CHANGED()
	if (not WorldMapFrame or not WorldMapFrame:IsShown()) and (not BattlefieldMinimap or not BattlefieldMinimap:IsShown()) then
		SetMapToCurrentZone();
	end

	wlLocTooltipFrame_OnUpdate();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlLocTooltipFrame_OnUpdate()
	if wlSetting.locTooltip then
		local pX, pY = GetPlayerMapPosition("player");
		if pX == 0 and pY == 0 then
			wlLocTooltipFrameText:SetText(NOT_APPLICABLE);
		else
			wlLocTooltipFrameText:SetText(("%.1f, %.1f"):format(pX * 100, pY * 100));
		end
		wlLocTooltipFrame:SetWidth(wlLocTooltipFrameText:GetStringWidth() + 14);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlIdTooltipFrame_OnUpdate()
	local name, id, kind = wlUnitName("npc"), wlUnitGUID("npc");

	if not name or not id then
		name, id, kind = wlUnitName("target"), wlUnitGUID("target");

		if not name or not id then
			name, id, kind = wlUnitName("mouseover"), wlUnitGUID("mouseover");

			if not name or not id then
				wlIdTooltipFrameText:SetText(NOT_APPLICABLE);
			end
		end
	end

	if name and id then
		wlIdTooltipFrameText:SetText(name.."|n"..("%s: %s"):format(kind, id));
	end

	wlIdTooltipFrame:SetWidth(wlIdTooltipFrameText:GetStringWidth() + 14);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlPopupBox(staticText, editText)
	wlPopupFrameCaption:SetText(staticText or "");
	wlPopupFrameEdit:SetText(editText or "");
	wlPopupFrame:Show();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlMessage(msg, userInitiated)
	if not msg then 
		return;
	end

	if userInitiated then
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlEnabledDisabled(good)
	if good then
		return WL_ENABLED;
	else
		return WL_DISABLED;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlPrint(...)
	wlDebugEdit:SetText(wlDebugEdit:GetText()..wlConcatToken(" : ", ...).."\n");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local wlGlobalEvents = {};
function wlGlobalUnregister(eventName)
	if wlGlobalEvents[eventName] then
		return;
	end

	wlGlobalEvents[eventName] = { GetFramesRegisteredForEvent(eventName) };

	for _, frame in ipairs(wlGlobalEvents[eventName]) do
		frame:UnregisterEvent(eventName);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGlobalRegister(eventName)
	if type(wlGlobalEvents[eventName]) ~= "table" then
		return;
	end

	for _, frame in ipairs(wlGlobalEvents[eventName]) do
		frame:RegisterEvent(eventName);
	end

	wlGlobalEvents[eventName] = nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



--------------------------
--------------------------
--                      --
--   PARSE  FUNCTIONS   --
--                      --
--------------------------
--------------------------

--	(color) : (id) : (enchant) : (1st socket) : (2nd socket) : (3rd socket) : (4th socket) : (subid) : (guid) : (playerLevel) : reforgeId : upgradeId : (name)
local WL_ITEMLINK = "|c(%x+)|Hitem:(%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+)|h%[(.+)%]|h|r";

function wlParseItemLink(link)
	if link then

		local found, _, color, id, enchant, socket1, socket2, socket3, socket4, subId, guid, pLevel, reforgeId, upgradeId, name = link:find(WL_ITEMLINK);

		if found then
			id, subId, guid = tonumber(id), tonumber(subId), tonumber(guid);

			if subId ~= 0 then
				wlUpdateVariable(wlItemSuffix, id, subId, "add", 1);

				if subId < 0 then
					wlUpdateVariable(wlItemSuffix, id, "sF", "set", bit_band(guid, 0xFFFF));
				end
			end

			return id, subId, tonumber(enchant), tonumber(socket1), tonumber(socket2), tonumber(socket3), tonumber(socket4), name, color, guid, tonumber(pLevel);
		end
	end

	return 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- |cffffff00|Hquest:10002:64|h[The Firewing Liaison]|h|r
-- |cffffff00|Hquest:11506:-1|h[Spirits of Auchindoun]|h|r
-- (color) : (id) : (level) : (name)
local WL_QUESTLINK = "|c(%x+)|Hquest:(%d+):(-?%d+)|h%[(.+)%]|h|r";

function wlParseQuestLink(link)
	if link then
		for color, id, level, name in link:gmatch(WL_QUESTLINK) do
			return tonumber(id), tonumber(level), name, color;
		end
	end

	return 0, 0, "", "";
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- (id) : (color) : (name)
local WL_SPELLLINK = "|Hspell:(%d+)|h|r|c(%x+)%[(.+)%]|r|h";

function wlParseSpellLink(link)
	if link then
		for id, color, name in link:gmatch(WL_SPELLLINK) do
			return tonumber(id), name, color;
		end
	end

	return 0, "", "";
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local WL_CURRENCY = {
	["1"] = COPPER_AMOUNT:gsub("%%d ", ""),
	["100"] = SILVER_AMOUNT:gsub("%%d ", ""),
	["10000"] = GOLD_AMOUNT:gsub("%%d ", ""),
};

function wlParseCoin(strCoin)
	local coin = 0;
	for k, v in pairs(WL_CURRENCY) do
		local found, _, a = strCoin:find("(%d+) "..v);
		if found then
			coin = coin + a * tonumber(k);
		end
	end

	return coin;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlParseGUID(guid)
	if not guid then
		return;
	end

	local id, kind;

	if guid:match("^0x4") then
		if guid == UnitGUID("npc") then
			id, kind = wlParseItemLink(wlSelectOne(2, GetItemInfo(UnitName("npc")))), "item";
		else
			return nil, "item";
		end

	elseif guid:match("^0xF.1") then
		id, kind = tonumber(guid:sub(6, 10), 16), "object";

	elseif guid:match("^0xF.[35]") then
		id, kind = tonumber(guid:sub(6, 10), 16), "npc";
	end

	if id == 0 then
		id = nil;
	end

	return id, kind;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlParseString(template, str)
	if not template or not str then
		return nil;
	end

	template = template:gsub("%%s", "(.+)");
	template = template:gsub("%%d", "(%%d+)");

	return wlParseFind(str:find(template));
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlParseFind(found, _, ...)
	if not found then
		return nil;
	end

	return ...;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local wlQuestKeywords = nil;
function wlGetSourceText(str, nameOnly) -- @BUG@

	if GetLocale() == "ruRU" then
		return str;
	end

	-- Init
	if not wlQuestKeywords then
		wlQuestKeywords = {};

		-- Race
		local race = UnitRace("player");
		wlQuestKeywords[race] = "R"..(wlQuestKeywords[race] or "");

		-- Class
		local class = UnitClass("player");
		wlQuestKeywords[class] = "C"..(wlQuestKeywords[class] or "");

		-- Player name
		local name = UnitName("player");
		wlQuestKeywords[name] = "N"..(wlQuestKeywords[name] or "");
	end

	if not str or str == "" then
		return "";
	end


	-- Mapping function
	local findNreplace = function(str, word, key)
		-- all string
		if str == word then
			return "$"..key;
		end

		-- start of string
		str = str:gsub("^"..word.."([^%w])", "$"..key.."%1");

		-- middle of string
		str = str:gsub("([^%w])"..word.."([^%w])", "%1$"..key.."%2");

		-- end of string
		str = str:gsub("([^%w])"..word.."$", "%1$"..key);

		return str;
	end;

	-- Scanning...
	for word, key in pairs(wlQuestKeywords) do
		if not nameOnly or key == "N" then
			str = findNreplace(str, word, key); -- Uppercase
			str = findNreplace(str, word:lower(), key:lower()); -- Lowercase
		end
	end

	return str;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



----------------------------
----------------------------
--                        --
--   COMPUTE  FUNCTIONS   --
--                        --
----------------------------
----------------------------

local WL_OPS = {
	init =function(a, b) if type(a) ~= "nil" then return a; end return b; end, -- <false> is a valid init state
	initArray =function(a, _) if type(a) ~= "nil" then return a; end return {}; end, -- <false> is a valid init state
	set =function(_, b) return b; end,
	add =function(a, b) return (tonumber(a) or 0) + b; end,
	multiply =function(a, b) return (tonumber(a) or 1) * b; end,
	concat =function(a, b) return (a or "") .. b; end,
	min =function(a, b) a, b = tonumber(a), tonumber(b); return a and b and math.min(a, b) or a or b; end,
	max =function(a, b) a, b = tonumber(a), tonumber(b); return a and b and math.max(a, b) or a or b; end,
};

function wlUpdateVariable(master, first, ...)

	local nParams = select("#", ...);

	if not master or not first or nParams <= 1 then
		return nil;

	elseif nParams == 2 then
		if not WL_OPS[wlSelectOne(1, ...)] then
			return nil;
		end

		master[first] = WL_OPS[wlSelectOne(1, ...)](master[first], wlSelectOne(2, ...));
		return master[first];

	else
		if not master[first] then
			master[first] = {};
		end

		return wlUpdateVariable(master[first], ...);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlSelectOne(i, ...)
	-- We only want the first returned value
	local v = select(i, ...);

	return v;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetFullCost(cost, standing)
	if not cost or cost == 0 then
		return 0;
	end
	
	local costMod = 1;
	if IsSpellKnown(83964) then -- bartering guild lvl 24
		costMod = costMod - 0.1;
	end
	local race = select(2, UnitRace("player"));
	if standing and race == "Goblin" then -- Goblin's Best Deals Anywhere = exalted everywhere
		costMod = costMod - WL_REP_DISCOUNT[8];
	elseif standing and WL_REP_DISCOUNT[standing] then
		costMod = costMod - WL_REP_DISCOUNT[standing];
	end
	
	return floor(cost/costMod);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableWalk(a, f)
	for k, v in pairs(a) do
		a[k] = f(k, v);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableClear(a)
	wlTableWalk(a, function() return false; end);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetDate()
	return select(2, CalendarGetDate());
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local wlTimeOffset = nil;
function wlGetTime()
	-- Init
	if not wlTimeOffset then
		local mo, d, y = wlGetDate();
		local h, mi = GetGameTime();

		wlTimeOffset = floor((time({ year = y, month = mo, day = d, hour = h, min = mi }) - GetTime()) * 1000);
	end

	return wlTimeOffset + floor(GetTime() * 1000);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlIsValidInterval(value1, value2, delta)
	return abs(value1 - value2) <= (wlSelectOne(3, GetNetStats()) + delta);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlIsEqualValues(value1, value2, delta)
	return abs(value1 - value2) <= delta;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local UNKNOWNOBJECT, UKNOWNBEING, UNKNOWN = _G.UNKNOWNOBJECT:lower(), _G.UKNOWNBEING:lower(), _G.UNKNOWN:lower();
function wlIsValidName(name)
	return name and name ~= "" and name:lower() ~= UNKNOWNOBJECT and name:lower() ~= UKNOWNBEING and name:lower() ~= UNKNOWN;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlConcat(...)
	return wlConcatToken("^", ...);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlConcatToken(token, ...)
	local str = wlToString(wlSelectOne(1, ...));

	for i=2, select("#", ...) do
		str = str..token..wlToString(wlSelectOne(i, ...));
	end

	return str;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlToString(v)
	local typeV = type(v);

	if typeV == "table" or typeV == "function" or typeV == "thread" or typeV == "userdata" then
		return "<"..typeV..">";

	elseif typeV == "boolean" then
		return v and "<true>" or "<false>";
	end

	return v or "<nil>";
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableCopy(Tr, Tx)
	for k, v in pairs(Tx) do
		Tr[k] = v;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableFind(a, f, ...)
	for k, v2 in pairs(a) do
		if type(f) == "function" then
			if f(v2, ...) then
				return k;
			end
		else
			if f == v2 then
				return k;
			end
		end
	end

	for k, v2 in ipairs(a) do
		if type(f) == "function" then
			if f(v2, ...) then
				return k;
			end
		else
			if f == v2 then
				return k;
			end
		end
	end

	return nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTablePrint(t, indent)
	indent = indent or "";

	for k, v in pairs(t) do
		local typeK, typeV = type(k), type(v);

		if typeK == "number" then
			k = indent.."["..k.."]".." = ";
		else
			k = indent.."[\""..k.."\"]".." = ";
		end

		if typeV == "table" then
			wlPrint(k.."{");
			wlTablePrint(v, indent.."    ");
			wlPrint(indent.."},");

		elseif typeV == "function" or typeV == "thread" or typeV == "userdata" then
			wlPrint(k.."<"..typeV.."> ...,");

		elseif typeV == "boolean" then
			wlPrint(k.."<boolean> "..(v and "true" or "false")..",");

		elseif typeV == "string" then
			wlPrint(k.."<string> \""..v.."\",");

		else
			wlPrint(k.."<"..typeV.."> "..(v or k)..",");
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableCountValues(t)
	if "table" ~= type(t) then return end

	local count = 0
	for key, value in pairs(t) do
		if type(value) == "table" then
			count = count + wlTableCountValues(value)
		else
			count = count + 1
		end
	end

	return count
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableConcatValues(t, token)
	if "table" ~= type(t) then return end

	local text, first, temp = "", true;

	for key, value in pairs(t) do
		if type(value) == "table" then
			temp = wlTableConcatValues(value, token);
		else
			temp = value;
		end

		if temp and temp ~= "" then
			if first then
				first = false;
				text = temp;
			else
				text = text..token..temp;
			end
		end
	end

	return text;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableConcatKeys(t, token)
	local text, first, temp = "", true;

	for key, value in pairs(t) do
		if type(value) == "table" then
			temp = wlTableConcatKeys(value, token);
		else
			temp = key;
		end

		if temp and temp ~= "" then
			if first then
				first = false;
				text = temp;
			else
				text = text..token..temp;
			end
		end
	end

	return text;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableConcatKeyValues(t, token)
	local text, first, tempKey, tempValue = "", true;

	for key, value in pairs(t) do
		if type(value) == "table" then
			tempKey = wlTableConcatKeyValues(value, token);
			tempValue = nil;
		else
			tempKey = key;
			tempValue = value;
		end

		if tempValue and tempValue ~= "" and tempKey and tempKey ~= "" then
			if first then
				first = false;
				text = tempKey..token..tempValue;
			else
				text = text..token..tempKey..token..tempValue;
			end
		elseif tempKey and tempKey ~= "" then
			if first then
				first = false;
				text = tempKey;
			else
				text = text..token..tempKey;
			end
		end
	end

	return text;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlTableIsEmpty(t)
	if type(t) == "table" then
		for _ in pairs(t) do
			return false;
		end
	end

	return true;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--



-------------------------
-------------------------
--                     --
--   HOOK  FUNCTIONS   --
--                     --
-------------------------
-------------------------

function wlReloadUI() 
	wlUIReloaded = true;
	return wlDefaultReloadUI();
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlConsoleExec(cmd) 
	if cmd:lower() == "reloadui" then
		wlUIReloaded = true;
    end
	return wlDefaultConsoleExec(cmd);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlHook()
	wlDefaultChatFrame_DisplayTimePlayed = ChatFrame_DisplayTimePlayed;
	ChatFrame_DisplayTimePlayed = wlChatFrame_DisplayTimePlayed;

	wlDefaultGetQuestReward = GetQuestReward;
	GetQuestReward = wlGetQuestReward;
	
	wlDefaultReloadUI = ReloadUI;
	ReloadUI = wlReloadUI;
	
	wlDefaultConsoleExec = ConsoleExec;
	ConsoleExec = wlConsoleExec;
	
	hooksecurefunc("UseItemByName", function(name, target)
		if not target then
			wlBagItemOnUse(wlSelectOne(2, GetItemInfo(name)));
		end
	end);
	
	hooksecurefunc("UseContainerItem", function(bag, slot, target)
		if not target then
			wlBagItemOnUse(GetContainerItemLink(bag, slot), bag, slot);
		end
	end);
	
	hooksecurefunc("PlaceAuctionBid", wlPlaceAuctionBid);
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlUnhook()
	ChatFrame_DisplayTimePlayed = wlDefaultChatFrame_DisplayTimePlayed;
	GetQuestReward = wlDefaultGetQuestReward;
	ReloadUI = wlDefaultReloadUI;
	ConsoleExec = wlDefaultConsoleExec;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--


--------------------------
--------------------------
--                      --
--   STATS  FUNCTIONS   --
--                      --
--------------------------
--------------------------

function wlReset()
	wlVersion, wlUploaded, wlStats, wlExportData, wlRealmList = WL_VERSION, 0, "", "", {};
	wlAuction, wlEvent, wlItemSuffix, wlObject, wlProfile, wlUnit, wlBaseStats, wlItemDurability, wlBattlePetStats = {}, {}, {}, {}, {}, {}, {}, {}, {};
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local WL_ARMORSPEC_CLASSES = {
	["WARRIOR"] = WL_PLATE,
	["PALADIN"] = WL_PLATE,
	["DEATHKNIGHT"] = WL_PLATE,
	["HUNTER"] = WL_MAIL,
	["SHAMAN"] = WL_MAIL,
	["ROGUE"] = WL_LEATHER,
	["DRUID"] = WL_LEATHER,
	["MAGE"] = WL_CLOTH,
	["WARLOCK"] = WL_CLOTH,
	["PRIEST"] = WL_CLOTH,
};
local wlInventoryCheck = {
	(GetInventorySlotInfo("HeadSlot")),
	(GetInventorySlotInfo("ShoulderSlot")),
	(GetInventorySlotInfo("ChestSlot")),
	(GetInventorySlotInfo("WristSlot")),
	(GetInventorySlotInfo("HandsSlot")),
	(GetInventorySlotInfo("WaistSlot")),
	(GetInventorySlotInfo("LegsSlot")),
	(GetInventorySlotInfo("FeetSlot")),
};
local WL_TOUGHNESS_IDS = {
	[53120] = 3, [53121] = 5, [53122] = 7, [53123] = 10, [53124] = 30, [53040] = 60, [74496] = 120,
};
function wlGetPlayerSpec()
	local class = select(2, UnitClass("player"));
	local playerArmorType = WL_ARMORSPEC_CLASSES[class];
	local count = 0;

	for _, slot in pairs(wlInventoryCheck) do
		local item = GetInventoryItemID("player", slot);
		if not item then
			break;
		end
		if (select(7, GetItemInfo(item))) ~= playerArmorType or GetInventoryItemDurability(slot) == 0 then
			break;
		end
		count = count + 1;
	end
	if count == #wlInventoryCheck then
		return GetSpecialization() or 0;
	end
	
	return nil;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetItemDurability()
	for i=0, NUM_BAG_SLOTS do
		for j=1, GetContainerNumSlots(i) do
			local itemID = GetContainerItemID(i, j);
			local _, maxDura = GetContainerItemDurability(i, j);
			if itemID and itemID ~= 0 then
				wlItemDurability[itemID] = maxDura or 0;
			end
		end
	end
	
	for i=0, 19 do
		local itemID = GetInventoryItemID("player", i);
		local _, maxDura = GetInventoryItemDurability(i);
		if itemID and itemID ~= 0 then
			wlItemDurability[itemID] = maxDura or 0;
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetBaseStats()
	
	local lvl, class, race = UnitLevel("player"), select(2, UnitClass("player")), select(2, UnitRace("player"));
	local playerSpec = wlGetPlayerSpec();
   
	if not wlBaseStats[wlConcat(class, race, lvl)] or (wlBaseStats[wlConcat(class, race, lvl)] and (next(wlBaseStats[wlConcat(class, race, lvl)]) == nil)) then
		wlUpdateVariable(wlBaseStats, wlConcat(class, race, lvl), "initArray", 0);
		for i=1, 5 do			
			-- local toughnessBuff = 0;
			-- if i == 3 then
				-- for id, value in pairs(WL_TOUGHNESS_IDS) do
					-- if IsSpellKnown(id) then
						-- toughnessBuff = value;
					-- end
				-- end
			-- end
			local effectiveStat, stat, posBuff, negBuff = UnitStat("player", i);
			local modifier, modByArmorSpec = wlGetStatModifier(i, class, playerSpec);
			local baseStat = ceil((stat - posBuff - negBuff) / modifier); -- - toughnessBuff
			
			-- sanity checks
			if negBuff ~= 0 or modifier > 1 and not modByArmorSpec then
				baseStat = 0;
			end		
			if i == 3 then -- mining check
				for id, _ in pairs(WL_TOUGHNESS_IDS) do
					if IsSpellKnown(id) then
						baseStat = 0;
						break;
					end
				end
			elseif i == 5 and race == "Human" then -- +3% spi on humans
				baseStat = 0;
			end
			
			wlBaseStats[wlConcat(class, race, lvl)][PAPERDOLL_STATCATEGORIES.ATTRIBUTES.stats[i]] = baseStat;
		end
		wlBaseStats[wlConcat(class, race, lvl)]["DODGEPERAGI"] = wlGetDodgePerAgi(lvl, class);
	end
	
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local WL_K = {
	["WARRIOR"]     = 0.956,
	["PALADIN"]     = 0.956,
	["HUNTER"]      = 0.988,
	["ROGUE"]       = 0.988,
	["PRIEST"]      = 0.983,
	["DEATHKNIGHT"] = 0.956,
	["SHAMAN"]      = 0.988,
	["MAGE"]        = 0.983,
	["WARLOCK"]     = 0.983,
	["DRUID"]       = 0.972,
	["MONK"]        = 0.988,
};
local WL_C_D = {
	["WARRIOR"]     = 1/0.0152366,
	["PALADIN"]     = 1/0.0152366,
	["HUNTER"]      = 1/0.006870,
	["ROGUE"]       = 1/0.006870,
	["PRIEST"]      = 1/0.006650,
	["DEATHKNIGHT"] = 1/0.0152366,
	["SHAMAN"]      = 1/0.006870,
	["MAGE"]        = 1/0.006650,
	["WARLOCK"]     = 1/0.006650,
	["DRUID"]       = 1/0.008555,
	["MONK"]		= 1/0.006870,
};
local WL_BASEDODGE = {
	["WARRIOR"] = 5,
	["PALADIN"] = 5,
	["HUNTER"] = -5.4499989748001,
	["ROGUE"] = -0.590,
	["PRIEST"] = 3.1830,
	["DEATHKNIGHT"] = 5,
	["SHAMAN"] = 1.6750,
	["MAGE"] = 3.4575,
	["WARLOCK"] = 2.0350,
	["DRUID"] = 4.9510,
	["MONK"] = 5,
};
local WL_ZERO_DODGE_PER_AGI_CLASSES = {
	["WARRIOR"] = true,
	["PALADIN"] = true,
	["DEATHKNIGHT"] = true,
};
local WL_MOD_AGI_CLASSES = {
	["DRUID"] = true,
	["HUNTER"] = true,
	["ROGUE"] = true,
	["SHAMAN"] = true,
};
--[[---------------------------------
	wlGetDodgePerAgi()
-------------------------------------
Arguments:
	None
Returns:
	; dodge percentage per agility
Notes:
	* Formula by Whitetooth (hotdogee [at] gmail [dot] com)
	* Calculates the dodge percentage per agility for your current class and level.
	* Only works for your currect class and current level, does not support class and level args.
	* Calculations got a bit more complicated with the introduction of the avoidance DR in WotLK, these are the values we know or can be calculated easily:
	** D'=Total Dodge% after DR
	** D_r=Dodge from Defense and Dodge Rating before DR
	** D_b=Dodge unaffected by DR (BaseDodge + Dodge from talent/buffs + Lower then normal defense correction)
	** A=Total Agility
	** A_b=Base Agility (This is what you have with no gear on)
	** A_g=Total Agility - Base Agility
	** Let d be the Dodge/Agi value we are going to calculate.

	#  1     1     k
	# --- = --- + ---
	#  x'    c     x

	# x'=D'-D_b-A_b*d
	# x=A_g*d+D_r

	# 1/(D'-D_b-A_b*d)=1/C_d+k/(A_g*d+D_r)=(A_g*d+D_r+C_d*k)/(C_d*A_g*d+C_d*D_r)

	# C_d*A_g*d+C_d*D_r=[(D'-D_b)-A_b*d]*[Ag*d+(D_r+C_d*k)]

	# After rearranging the terms, we get an equation of type a*d^2+b*d+c where
	# a=-A_g*A_b
	# b=A_g(D'-D_b)-A_b(D_r+C_d*k)-C_dA_g
	# c=(D'-D_b)(D_r+C_d*k)-C_d*D_r
	** Dodge/Agi=(-b-(b^2-4ac)^0.5)/(2a)
Example:
	wlGetDodgePerAgi();
-----------------------------------]]
function wlGetDodgePerAgi(lvl, class)
	
	if WL_ZERO_DODGE_PER_AGI_CLASSES[class] then
		return 0;
	end
	
	if false then -- temp fix for MoP
		if class == "DRUID" then
			local _, _, _, _, num = GetTalentInfo(2, 1); -- Feral Swiftness
			local _, _, _, _, num2 = GetTalentInfo(2, 18); -- Natural Reaction
			if num > 0 or num2 > 0 then
				return 0;
			end
		elseif class == "ROGUE" then
			local _, _, _, _, num = GetTalentInfo(2, 8); -- Lightning Reflexes
			if num > 0 then
				return 0;
			end
		end
	end
	
	-- Collect data
	local D_dr = GetDodgeChance();
	local D_r = wlGetEffectFromRating(GetCombatRating(CR_DODGE), CR_DODGE, lvl); -- dodge from dodge rating
	local D_b = WL_BASEDODGE[class]; -- + GetStatMod("ADD_DODGE")
	local stat, effectiveStat, posBuff, negBuff = UnitStat("player", 2); -- 2 = Agility
	local modAgi = 1;
	local playerSpec = wlGetPlayerSpec();
	if WL_MOD_AGI_CLASSES[class] then
		modAgi = wlGetStatModifier(2, class, playerSpec);
	end
	local A = effectiveStat;
	local A_b = ceil((stat - posBuff - negBuff) / modAgi);
	local A_g = A - A_b;
	local C = WL_C_D[class];
	local k = WL_K[class];
	-- Solve a*x^2+b*x+c
	local a = -A_g*A_b;
	local b = A_g*(D_dr-D_b)-A_b*(D_r+C*k)-C*A_g;
	local c = (D_dr-D_b)*(D_r+C*k)-C*D_r;
	local dodgePerAgi;
	if a == 0 then
		dodgePerAgi = -c / b;
	else
		dodgePerAgi = (-b-(b^2-4*a*c)^0.5)/(2*a);
	end
	
	return dodgePerAgi;
	
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

-- Level 60 rating base
local WL_RATING_BASE = {
	[CR_DODGE] = 13.8,
};
local WL_LEVEL34_RATINGS = {
	[CR_DODGE] = true,
};
-- 80-85 H data
local WL_H = {
	[80] = 3.2789989471436,
	[81] = 4.3056015014648,
	[82] = 5.6539749145508,
	[83] = 7.4275451660156,
	[84] = 9.7527236938477,
	[85] = 12.8057159423828,
};
function wlGetEffectFromRating(rating, id, level)
	if level < 34 and WL_LEVEL34_RATINGS[id] then
		level = 34;
	end
	if level >= 80 and level <= 85 then
		return rating/WL_RATING_BASE[id]/WL_H[level];
	elseif level >= 70 then
		return rating/WL_RATING_BASE[id]/((82/52)*(131/63)^((level-70)/10));
	elseif level >= 60 then
		return rating/WL_RATING_BASE[id]/(82/(262-3*level));
	elseif level >= 10 then
		return rating/WL_RATING_BASE[id]/((level-8)/52);
	else
		return rating/WL_RATING_BASE[id]/(2/52);
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

local WL_BASE_STATS_MODIFIERS = {
	["DRUID"] = {
		[2] = {
			{ -- Leather Specialization +5% agi in cat form
				["rank"] = {
				  0.05,
				},
				["spec"] = 2,
				["spell"] = 86530,
				["aura"] = 768,
			},
		},
		[3] = {
			-- { -- Heart of the Wild: +2/4/6% stamina in bear form
				-- ["tab"] = 3,
				-- ["tal"] = 4,
				-- ["rank"] = {
					-- 0.02, 0.04, 0.06,
				-- },
				-- ["aura"] = 5487,
			-- },
			{ -- Bear Form
				["rank"] = {
					0.1,
				},
				["aura"] = 5487,
			},
			{ -- Leather Specialization +5% stam in bear form
				["rank"] = {
					0.05,
				},
				["spec"] = 2,
				["spell"] = 86530,
				["aura"] = 5487,
			},
		},
		[4] = { 
			{ -- Heart of the Wild 2/4/6% intellect
				["tab"] = 3,
				["tal"] = 4,
				["rank"] = {
					0.02, 0.04, 0.06,
				},
			},
			{ -- Leather Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86530,
				["spec"] = 1,
			},
			{ -- Leather Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86530,
				["spec"] = 3,
			},
		},
	},
	["DEATHKNIGHT"] = {
		[1] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86524,
				["spec"] = 2,
			},
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86524,
				["spec"] = 3,
			},
			{ -- Unholy Might
				["rank"] = {
					0.2,
				},
				["spell"] = 91107,
			},
			-- { -- Abomination's Might
				-- ["tab"] = 1,
				-- ["tal"] = 11,
				-- ["rank"] = {
					-- 0.01, 0.02,
				-- },
			-- },
			-- { -- Pillar of Frost
				-- ["rank"] = {
					-- 0.2,
				-- },
				-- ["aura"] = 51271,
			-- },
			{ -- Brittle Bones
				["tab"] = 2,
				["tal"] = 14,
				["rank"] = {
					0.02, 0.04,
				},
			},
			-- { -- Unholy Strength
				-- ["rank"] = {
					-- 0.15,
				-- },
				-- ["aura"] = 53365,
			-- },
		},
		[3] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86524,
				["spec"] = 1,
			},
			-- { -- Blood Presence
				-- ["rank"] = {
					-- 0.08,
				-- },
				-- ["stance"] = "Interface\\Icons\\Spell_Deathknight_BloodPresence",
			-- },
			{ -- Veteran of the Third War
				["rank"] = {
					0.09,
				},
				["spell"] = 50029,
			},
			{ -- Rune of the Stoneskin Gargoyle
				["rank"] = {
					0.02,
				},
				["slot"] = 16, -- main hand slot
				["enchant"] = 3847,
			},
			{ -- Rune of the Nerubian Carapace
				["rank"] = {
					0.01,
				},
				["slot"] = 16, -- main hand slot
				["enchant"] = 3883,
			},
				{ -- Rune of the Nerubian Carapace
				["rank"] = {
					0.01,
				},
				["slot"] = 17, -- off hand slot
				["enchant"] = 3883,
			},
		},
	},
	["HUNTER"] = {
		[2] = {
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86528,
				["spec"] = 0,
			},
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86528,
				["spec"] = 1,
			},
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86528,
				["spec"] = 2,
			},
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86528,
				["spec"] = 3,
			},
			{ -- Into the Wilderness
				["rank"] = {
					0.1,
				},
				["spell"] = 84729,
			},
			-- { -- Hunting Party
				-- ["tab"] = 3,
				-- ["tal"] = 17,
				-- ["rank"] = {
					-- 0.02,
				-- },
			-- },
		},
		[3] = {
			{ -- Hunter vs. Wild
				["tab"] = 3,
				["tal"] = 1,
				["rank"] = {
					0.05, 0.1, 0.15,
				},
			},
		},
	},
	["MAGE"] = {
		[4] = {
			{ -- Wizardry
				["rank"] = {
					0.05,
				},
				["spell"] = 89744,
			},
		},
	},
	["PALADIN"] = {
		[1] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86525,
				["spec"] = 3,
			},
		},
		[3] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86525,
				["spec"] = 2,
			},
			{ -- Touched by the Light
				["rank"] = {
					0.15,
				},
				["spell"] = 53592,
			},
		},
		[4] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86525,
				["spec"] = 1,
			},
		},
	},
	["PRIEST"] = {
		[4] = {
			{ -- Enlightenment
				["rank"] = {
					0.15,
				},
				["spell"] = 84732,
			},
			{ -- Mysticism
				["rank"] = {
					0.05,
				},
				["spell"] = 89745,
			},
		},
	},
	["ROGUE"] = {
		[2] = {
			{ -- Leather Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86531,
				["spec"] = 0,
			},
			{ -- Leather Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86531,
				["spec"] = 1,
			},
			{ -- Leather Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86531,
				["spec"] = 2,
			},
			{ -- Leather Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86531,
				["spec"] = 3,
			},
			{ -- Sinister Calling
				["rank"] = {
					0.3,
				},
				["spell"] = 31220,
			},
		},
	},
	["SHAMAN"] = {
		[2] = {
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86529,
				["spec"] = 2,
			},
		},
		[3] = {
			{ -- Toughness
				["tab"] = 2,
				["tal"] = 8,
				["rank"] = {
					0.03, 0.07, 0.1,
				},
			},
		},
		[4] = {
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86529,
				["spec"] = 1,
			},
			{ -- Mail Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86529,
				["spec"] = 3,
			},
		},
	},
	["WARLOCK"] = {
		[3] = {
			{ -- Demonic Embrace
				["tab"] = 2,
				["tal"] = 1,
				["rank"] = {
					0.04, 0.07, 0.1,
				},
			},
		},
		[4] = {
			{ -- Nethermancy
				["rank"] = {
					0.05,
				},
				["spell"] = 86091,
			},
		},
	},
	["WARRIOR"] = {
		[1] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86526,
				["spec"] = 1,
			},
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86526,
				["spec"] = 2,
			},
		},
		[3] = {
			{ -- Plate Specialization
				["rank"] = {
					0.05,
				},
				["spell"] = 86526,
				["spec"] = 3,
			},
			-- { -- Sentinel
				-- ["rank"] = {
					-- 0.15,
				-- },
				-- ["spell"] = 29144,
			-- },
		},
	},
};
-- Generate buff names
for class, tables in pairs(WL_BASE_STATS_MODIFIERS) do
	for statIndex, mods in pairs(tables) do
		for _, modTbl in ipairs(mods) do
			if modTbl.aura then
				modTbl.auraName = GetSpellInfo(modTbl.aura) or "nil";
			end
		end
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlPlayerHasAura(aura)
	return UnitBuff("player", aura or "") or UnitDebuff("player", aura or "");
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlSlotHasEnchant(enchantId, slotId)
	local slotLink = GetInventoryItemLink("player", slotId);
	if not slotLink then 
		return;
	end
	if select(3, wlParseItemLink(slotLink)) == enchantId then
		return 1;
	end
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetStatModifier(statIndex, class, spec)
	
	local modifier = 1;
	local modByArmorSpec = false;
	
	if WL_BASE_STATS_MODIFIERS[class] and WL_BASE_STATS_MODIFIERS[class][statIndex] then
		for _, tbl in ipairs(WL_BASE_STATS_MODIFIERS[class][statIndex]) do
			local pass = true;
			
			if pass and tbl.auraName and not wlPlayerHasAura(tbl.auraName) then
				pass = false;
			end
			if pass and tbl.enchant and not wlSlotHasEnchant(tbl.enchant, tbl.slot) then
				pass = false;
			end
			if pass and tbl.spec and spec ~= tbl.spec then
				pass = false;
			end
			if pass and tbl.spell and not IsSpellKnown(tbl.spell) then
				pass = false;
			end
			
			if pass then
				local r, s = 1, 1;
				-- if talent field
				if tbl.tab and tbl.tal and false then -- temp fix for MoP
					_, _, _, _, r = GetTalentInfo(tbl.tab, tbl.tal);
				-- no talent but all other given conditions are statisfied
				end
				if r and tbl.rank[r] then
					modifier = modifier * (tbl.rank[r] * s + 1);
				end
			end
			
		end
	end
	
	if class ~= "HUNTER" and modifier == 1.05 then
		modByArmorSpec = true;
	elseif class == "HUNTER" and modifier == 1.05 and statIndex == 2 then
		modByArmorSpec = true;
	end
	
	return modifier, modByArmorSpec;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlRegisterStats()
	local nDrops, nQuests, nCharacters, _ = 0, 0, 0;

	for _, a in pairs(wlEvent) do
		for _, b in pairs(a) do
			for _, c in pairs(b) do
				if c.what == "loot" then
					nDrops = nDrops + 1;
				elseif c.what == "quest" then
					nQuests = nQuests + 1;
				end
			end
		end
	end

	_, nCharacters = wlExportData:gsub(";", "");

	wlStats = wlConcat(wlArrayLength(wlUnit), wlArrayLength(wlObject), nQuests, nDrops, wlArrayLength(wlAuction, 2), nCharacters, GetLocale(), wlSelectOne(2, GetBuildInfo()));
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlArrayLength(array, depth)
	if not array then
		return 0;
	end

	local count = 0;

	depth = depth or 0;
	if depth > 0 then
		for _, subA in pairs(array) do
			count = count + wlArrayLength(subA, depth - 1);
		end
	else
		for _, _ in pairs(array) do
			count = count + 1;
		end
	end

	return count;
end

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--

function wlGetCurrentMapAreaID()
	
	local dl = GetCurrentMapDungeonLevel() or 0; -- Save DL
	local currentId = GetCurrentMapAreaID(); -- Save Location
	local mapAreaID = 0;
	
	local mainZone, _, _, isMicroZone, microZone = GetMapInfo();
	local wasMicroZone = isMicroZone;
	local oldMicroZone = microZone;
	
	SetMapToCurrentZone(); -- Move Map
	mainZone, _, _, isMicroZone, microZone = GetMapInfo();
	if microZone == "ShrineofSevenStars" then
		mapAreaID = 905;
	elseif microZone == "ShrineofTwoMoons" then
		mapAreaID = 903;
	else
		mapAreaID = GetCurrentMapAreaID();
	end
	
	-- Restore Map
	if wasMicroZone then
		if oldMicroZone == "ShrineofSevenStars" then
			SetMapByID(905);
		elseif oldMicroZone == "ShrineofTwoMoons" then
			SetMapByID(903);
		else
			SetMapToCurrentZone();
		end
	else
		SetMapByID(currentId);
	end
	SetDungeonMapLevel(dl); 
	
	return mapAreaID;
end
	
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--
