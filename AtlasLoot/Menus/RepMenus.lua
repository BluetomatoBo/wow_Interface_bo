-- $Id: RepMenus.lua 4148 2013-03-12 20:57:08Z hegarol $
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")

	AtlasLoot_Data["REPMENU"] = {
		["Normal"] = {
			{
				{ 1, "REPMENU_RACEFACTIONS", "INV_Helmet_66", "=ds=Race Factions (temp name)", ""};
				{ 2, "REPMENU_ORIGINALWOW", "INV_Helmet_66", "=ds="..AL["Classic WoW"], ""};
				{ 3, "REPMENU_WOTLK", "achievement_reputation_kirintor", "=ds="..AL["Wrath of the Lich King"], ""};
				{ 5, "KirinTorOffensive", "achievement_reputation_kirintor_offensive", "=ds=Kirin Tor Offensive", "=q5="..AtlasLoot:GetMapNameByID(928)};
				{ 6, "OperationShieldwall", "pvpcurrency-honor-alliance", "=ds="..BabbleFaction["Operation: Shieldwall"], "=q5="..AtlasLoot:GetMapNameByID(857)};
				{ 7, "LionsLanding", "pvpcurrency-conquest-alliance", "=ds="..AL["Lion's Landing"], "=q5="..AtlasLoot:GetMapNameByID(857)};
				{ 8, "BizmosBrawlpubBrawlgarArena", "inv_misc_head_clockworkgnome_01", "=ds="..BabbleFaction["Bizmo's Brawlpub"], "=q5="..AtlasLoot:GetMapNameByID(922)};
				{ 10, "Anglers", "achievement_faction_anglers", "=ds="..BabbleFaction["The Anglers"], "=q5="..AtlasLoot:GetMapNameByID(857)};
				{ 11, "GoldenLotus", "achievement_faction_goldenlotus", "=ds="..BabbleFaction["Golden Lotus"], "=q5="..AtlasLoot:GetMapNameByID(811)};
				{ 12, "Lorewalkers", "achievement_faction_lorewalkers", "=ds="..BabbleFaction["The Lorewalkers"], "=q5="..AtlasLoot:GetMapNameByID(811)};
				{ 13, "ShadoPan", "achievement_faction_shadopan", "=ds="..BabbleFaction["Shado-Pan"], "=q5="..AtlasLoot:GetMapNameByID(810)};
				{ 15, "VPMOPMENU", "pvecurrency-valor", "=ds="..AL["Valor Points"].." "..AL["Rewards"], "=q5="..AL["Mists of Pandaria"]};
				{ 17, "REPMENU_BURNINGCRUSADE", "INV_Misc_Ribbon_01", "=ds="..AL["Burning Crusade"], ""};
				{ 18, "REPMENU_CATACLYSM", "inv_neck_hyjaldaily_04", "=ds="..AL["Cataclysm"], ""};
				{ 20, "SunreaverOnslaught", "achievement_faction_sunreaveronslaught", "=ds=Sunreaver Onslaught", "=q5="..AtlasLoot:GetMapNameByID(928)};
				{ 21, "DominanceOffensive", "pvpcurrency-honor-horde", "=ds="..BabbleFaction["Dominance Offensive"], "=q5="..AtlasLoot:GetMapNameByID(857)};
				{ 22, "DominationPoint", "pvpcurrency-conquest-horde", "=ds="..AL["Domination Point"], "=q5="..AtlasLoot:GetMapNameByID(857)};
				{ 23, "BizmosBrawlpubBrawlgarArena", "inv_misc_head_clockworkgnome_01", "=ds="..BabbleFaction["Brawl'gar Arena"], "=q5="..AtlasLoot:GetMapNameByID(925)};
				{ 25, "AugustCelestials", "achievement_faction_celestials", "=ds="..BabbleFaction["The August Celestials"], "=q5="..AtlasLoot:GetMapNameByID(811)};
				{ 26, "Klaxxi", "achievement_faction_klaxxi", "=ds="..BabbleFaction["The Klaxxi"], "=q5="..AtlasLoot:GetMapNameByID(858)};
				{ 27, "OrderCloudSerpent", "achievement_faction_serpentriders", "=ds="..BabbleFaction["Order of the Cloud Serpent"], "=q5="..AtlasLoot:GetMapNameByID(806)};
				{ 28, "ShadoPanAssault", "achievement_faction_shadopan", "=ds=Shado-Pan Assault", "=q5="..AtlasLoot:GetMapNameByID(930)};
				{ 29, "Tillers", "achievement_faction_tillers", "=ds="..BabbleFaction["The Tillers"], "=q5="..AtlasLoot:GetMapNameByID(807)};
			};
		};
		info = {
			name = AL["Factions"],
		};
	}

	AtlasLoot_Data["REPMENU_RACEFACTIONS"] = {
		["Normal"] = {
			{
				{ 2, "", "inv_misc_tournaments_symbol_human", "=q6="..BabbleFaction["Alliance"], ""};
				{ 3, "Darnassus", "inv_misc_tournaments_symbol_nightelf", "=ds="..BabbleFaction["Darnassus"], "=q5="..AL["Classic WoW"]};
				{ 4, "GnomereganRep", "inv_misc_tournaments_symbol_gnome", "=ds="..BabbleFaction["Gnomeregan"], "=q5="..AL["Classic WoW"]};
				{ 5, "Ironforge", "inv_misc_tournaments_symbol_dwarf", "=ds="..BabbleFaction["Ironforge"], "=q5="..AL["Classic WoW"]};
				{ 6, "Stormwind", "inv_misc_tournaments_symbol_human", "=ds="..BabbleFaction["Stormwind"], "=q5="..AL["Classic WoW"]};
				{ 8, "Exodar", "inv_misc_tournaments_symbol_draenei", "=ds="..BabbleFaction["Exodar"], "=q5="..AL["Burning Crusade"]};
				{ 10, "Gilneas", "achievement_win_gilneas", "=ds="..BabbleFaction["Gilneas"], "=q5="..AL["Cataclysm"]};
				{ 12, "TushuiPandaren", "inv_misc_tournaments_symbol_human", "=ds="..BabbleFaction["Tushui Pandaren"], "=q5="..AL["Mists of Pandaria"]};
				{ 17, "", "inv_misc_tournaments_symbol_orc", "=q6="..BabbleFaction["Horde"], ""};
				{ 18, "DarkspearTrolls", "inv_misc_tournaments_symbol_troll", "=ds="..BabbleFaction["Darkspear Trolls"], "=q5="..AL["Classic WoW"]};
				{ 19, "Orgrimmar", "inv_misc_tournaments_symbol_orc", "=ds="..BabbleFaction["Orgrimmar"], "=q5="..AL["Classic WoW"]};
				{ 20, "ThunderBluff", "inv_misc_tournaments_symbol_tauren", "=ds="..BabbleFaction["Thunder Bluff"], "=q5="..AL["Classic WoW"]};
				{ 21, "Undercity", "inv_misc_tournaments_symbol_scourge", "=ds="..BabbleFaction["Undercity"], "=q5="..AL["Classic WoW"]};
				{ 23, "SilvermoonCity", "inv_misc_tournaments_symbol_bloodelf", "=ds="..BabbleFaction["Silvermoon City"], "=q5="..AL["Burning Crusade"]};
				{ 25, "BilgewaterCartel", "inv_misc_tabard_kezan", "=ds="..BabbleFaction["Bilgewater Cartel"], "=q5="..AL["Cataclysm"]};
				{ 27, "HuojinPandaren", "inv_misc_tournaments_symbol_orc", "=ds="..BabbleFaction["Huojin Pandaren"], "=q5="..AL["Mists of Pandaria"]};
			};
		};
		info = {
			name = AL["Factions"],
			menu = "REPMENU",
		};
	}

	AtlasLoot_Data["REPMENU_ORIGINALWOW"] = {
		["Normal"] = {
			{
				{ 2, "MiscFactions", "ability_warrior_rallyingcry", "=ds="..BabbleFaction["The League of Arathor"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(461)};
				{ 3, "MiscFactions", "inv_jewelry_stormpiketrinket_05", "=ds="..BabbleFaction["Stormpike Guard"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(401)};
				{ 4, "MiscFactions", "Ability_Mount_PinkTiger", "=ds="..BabbleFaction["Wintersaber Trainers"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(281)};
				{ 6, "ArgentDawn", "inv_jewelry_talisman_07", "=ds="..BabbleFaction["Argent Dawn"], "=q5="..AtlasLoot:GetMapNameByID(23)};
				{ 7, "Timbermaw", "achievement_reputation_timbermaw", "=ds="..BabbleFaction["Timbermaw Hold"], "=q5="..AtlasLoot:GetMapNameByID(182).." / "..AtlasLoot:GetMapNameByID(281)};
				{ 9, "AQBroodRings", "inv_misc_head_dragon_bronze", "=ds="..BabbleFaction["Brood of Nozdormu"], "=q5="..AtlasLoot:GetMapNameByID(766).." / "..BabbleZone["Caverns of Time"]};
				{ 17, "MiscFactions", "spell_shadow_psychichorrors", "=ds="..BabbleFaction["The Defilers"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(461)}; 
				{ 18, "MiscFactions", "inv_jewelry_frostwolftrinket_05", "=ds="..BabbleFaction["Frostwolf Clan"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(401)};
				{ 21, "BloodsailBuccaneers", "INV_Helmet_66", "=ds="..BabbleFaction["Bloodsail Buccaneers"], "=q5="..AtlasLoot:GetMapNameByID(689)};
				{ 22, "CenarionCircle", "ability_racial_ultravision", "=ds="..BabbleFaction["Cenarion Circle"], "=q5="..AtlasLoot:GetMapNameByID(261)};
				{ 24, "ThoriumBrotherhood", "INV_Ingot_Mithril", "=ds="..BabbleFaction["Thorium Brotherhood"], "=q5="..AtlasLoot:GetMapNameByID(28)};
			};
		};
		info = {
			name = AL["Factions"].." - "..AL["Classic WoW"],
			menu = "REPMENU",
		};
	}

	AtlasLoot_Data["REPMENU_BURNINGCRUSADE"] = {
		["Normal"] = {
			{
				{ 2, "HonorHold", "INV_BannerPVP_02", "=ds="..BabbleFaction["Honor Hold"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(465)};
				{ 3, "Kurenai", "INV_Misc_Foot_Centaur", "=ds="..BabbleFaction["Kurenai"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(477)};
				{ 6, "CExpedition", "INV_Misc_Ammo_Arrow_02", "=ds="..BabbleFaction["Cenarion Expedition"], "=q5="..AtlasLoot:GetMapNameByID(467)};
				{ 7, "KeepersofTime", "Ability_Warrior_VictoryRush", "=ds="..BabbleFaction["Keepers of Time"], "=q5="..BabbleZone["Caverns of Time"]};
				{ 8, "Netherwing", "Ability_Mount_Netherdrakepurple", "=ds="..BabbleFaction["Netherwing"], "=q5="..AtlasLoot:GetMapNameByID(473)};
				{ 9, "Skyguard", "ability_hunter_pet_netherray", "=ds="..BabbleFaction["Sha'tari Skyguard"], "=q5="..AtlasLoot:GetMapNameByID(478).." / "..AtlasLoot:GetMapNameByID(475)};
				{ 10, "Sporeggar", "inv_mushroom_11", "=ds="..BabbleFaction["Sporeggar"], "=q5="..AtlasLoot:GetMapNameByID(467)};
				{ 12, "Aldor", "INV_Jewelry_Talisman_08", "=ds="..BabbleFaction["The Aldor"], ""};
				{ 14, "Ashtongue", "achievement_reputation_ashtonguedeathsworn", "=ds="..BabbleFaction["Ashtongue Deathsworn"], "=q5="..AtlasLoot:GetMapNameByID(473).." / "..AtlasLoot:GetMapNameByID(796)};
				{ 15, "VioletEye", "spell_holy_mindsooth", "=ds="..BabbleFaction["The Violet Eye"], "=q5="..AtlasLoot:GetMapNameByID(799)};
				{ 17, "Thrallmar", "INV_BannerPVP_01", "=ds="..BabbleFaction["Thrallmar"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(465)};
				{ 18, "Maghar", "INV_Misc_Foot_Centaur", "=ds="..BabbleFaction["The Mag'har"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(477)};
				{ 19, "Tranquillien", "INV_Misc_Bandana_03", "=ds="..BabbleFaction["Tranquillien"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(463)};
				{ 21, "Consortium", "inv_enchant_shardprismaticlarge", "=ds="..BabbleFaction["The Consortium"], "=q5="..AtlasLoot:GetMapNameByID(477).." / "..AtlasLoot:GetMapNameByID(479)};
				{ 22, "LowerCity", "Spell_Holy_ChampionsBond", "=ds="..BabbleFaction["Lower City"], ""};
				{ 23, "Ogrila", "inv_misc_apexis_crystal", "=ds="..BabbleFaction["Ogri'la"], "=q5="..AtlasLoot:GetMapNameByID(475)};
				{ 24, "Shatar", "Ability_Warrior_ShieldMastery", "=ds="..BabbleFaction["The Sha'tar"], ""};
				{ 25, "SunOffensive", "inv_shield_48", "=ds="..BabbleFaction["Shattered Sun Offensive"], "=q5="..AtlasLoot:GetMapNameByID(499)};
				{ 27, "Scryer", "INV_Misc_Foot_Centaur", "=ds="..BabbleFaction["The Scryers"], ""};
				{ 29, "ScaleSands", "inv_enchant_dustillusion", "=ds="..BabbleFaction["The Scale of the Sands"], "=q5="..AtlasLoot:GetMapNameByID(775)};
			};
		};
		info = {
			name = AL["Factions"].." - "..AL["Burning Crusade"],
			menu = "REPMENU",
		};
	}

	AtlasLoot_Data["REPMENU_WOTLK"] = {
		["Normal"] = {
			{
				{ 2, "AllianceVanguard", "spell_misc_hellifrepvphonorholdfavor", "=ds="..BabbleFaction["Alliance Vanguard"], "=q5="..BabbleFaction["Alliance"]};
				{ 3, "ExplorersLeagueWarsongOffensive", "inv_drink_01", "=ds="..BabbleFaction["Explorers' League"], "=q5="..AtlasLoot:GetMapNameByID(495)};
				{ 4, "ArgentTournamentFaction", "inv_misc_tabardpvp_01", "=ds="..BabbleFaction["The Silver Covenant"], "=q5="..AtlasLoot:GetMapNameByID(492).." / "..AtlasLoot:GetMapNameByID(504)};
				{ 6, "ArgentCrusade", "INV_Jewelry_Talisman_08", "=ds="..BabbleFaction["Argent Crusade"], "=q5="..AtlasLoot:GetMapNameByID(496).." / "..AtlasLoot:GetMapNameByID(492)};
				{ 7, "KirinTor", "achievement_reputation_kirintor", "=ds="..BabbleFaction["Kirin Tor"], "=q5="..AtlasLoot:GetMapNameByID(486).." / "..AtlasLoot:GetMapNameByID(504)};
				{ 8, "TheSonsofHodir", "Spell_Holy_DivinePurpose", "=ds="..BabbleFaction["The Sons of Hodir"], "=q5="..AtlasLoot:GetMapNameByID(495)};
				{ 9, "TheWyrmrestAccord", "achievement_reputation_wyrmresttemple", "=ds="..BabbleFaction["The Wyrmrest Accord"], "=q5="..AtlasLoot:GetMapNameByID(488)};
				{ 11, "FrenzyheartTribe", "ability_mount_whitedirewolf", "=ds="..BabbleFaction["Frenzyheart Tribe"], "=q5="..AtlasLoot:GetMapNameByID(493)};
				{ 13, "TheAshenVerdict", "INV_Jewelry_Ring_85", "=ds="..BabbleFaction["The Ashen Verdict"], "=q5="..AtlasLoot:GetMapNameByID(604)};
				{ 17, "HordeExpedition", "spell_misc_hellifrepvpthrallmarfavor", "=ds="..BabbleFaction["Horde Expedition"], "=q5="..BabbleFaction["Horde"]};
				{ 18, "ExplorersLeagueWarsongOffensive", "inv_drink_01", "=ds="..BabbleFaction["Warsong Offensive"], "=q5="..AtlasLoot:GetMapNameByID(495)};
				{ 19, "ArgentTournamentFaction", "inv_misc_tabardpvp_02", "=ds="..BabbleFaction["The Sunreavers"], "=q5="..AtlasLoot:GetMapNameByID(492).." / "..AtlasLoot:GetMapNameByID(504)};
				{ 21, "TheKaluak", "achievement_reputation_tuskarr", "=ds="..BabbleFaction["The Kalu'ak"], "=q5="..AtlasLoot:GetMapNameByID(486).." / "..AtlasLoot:GetMapNameByID(491).." / "..AtlasLoot:GetMapNameByID(488)};
				{ 22, "KnightsoftheEbonBlade", "achievement_reputation_knightsoftheebonblade", "=ds="..BabbleFaction["Knights of the Ebon Blade"], "=q5="..AtlasLoot:GetMapNameByID(496).." / "..AtlasLoot:GetMapNameByID(492)};
				{ 23, "WinterfinRetreat", "INV_Misc_Shell_04", "=ds="..BabbleFaction["Winterfin Retreat"], "=q5="..AtlasLoot:GetMapNameByID(486)};
				{ 26, "TheOracles", "inv_misc_head_murloc_01", "=ds="..BabbleFaction["The Oracles"], "=q5="..AtlasLoot:GetMapNameByID(493)};
			};
		};
		info = {
			name = AL["Factions"].." - "..AL["Wrath of the Lich King"],
			menu = "REPMENU",
		};
	}

	AtlasLoot_Data["REPMENU_CATACLYSM"] = {
		["Normal"] = {
			{
				{ 2, "WildhammerClan", "inv_misc_tabard_wildhammerclan", "=ds="..BabbleFaction["Wildhammer Clan"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(700)};
				{ 3, "BaradinsWardens", "inv_misc_tabard_baradinwardens", "=ds="..BabbleFaction["Baradin's Wardens"], "=q5="..BabbleFaction["Alliance"].." - "..AtlasLoot:GetMapNameByID(708)};
				{ 5, "EarthenRing", "inv_misc_tabard_earthenring", "=ds="..BabbleFaction["The Earthen Ring"], "=q5="..AtlasLoot:GetMapNameByID(613).." / "..AtlasLoot:GetMapNameByID(640)};
				{ 6, "Ramkahen", "inv_misc_tabard_tolvir", "=ds="..BabbleFaction["Ramkahen"], "=q5="..AtlasLoot:GetMapNameByID(720)};
				{ 8, "AvengersHyjal", "inv_neck_hyjaldaily_04", "=ds="..BabbleFaction["Avengers of Hyjal"], "=q5="..AtlasLoot:GetMapNameByID(800)};
				{ 17, "DragonmawClan", "inv_misc_tabard_dragonmawclan", "=ds="..BabbleFaction["Dragonmaw Clan"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(700)};
				{ 18, "HellscreamsReach", "inv_misc_tabard_hellscream", "=ds="..BabbleFaction["Hellscream's Reach"], "=q5="..BabbleFaction["Horde"].." - "..AtlasLoot:GetMapNameByID(708)};
				{ 20, "GuardiansHyjal", "inv_misc_tabard_guardiansofhyjal", "=ds="..BabbleFaction["Guardians of Hyjal"], "=q5="..AtlasLoot:GetMapNameByID(795).." / "..AtlasLoot:GetMapNameByID(606)};
				{ 21, "Therazane", "inv_misc_tabard_therazane", "=ds="..BabbleFaction["Therazane"], "=q5="..AtlasLoot:GetMapNameByID(640)};
			};
		};
		info = {
			name = AL["Factions"].." - "..AL["Cataclysm"],
			menu = "REPMENU",
		};
	}