-- $Id: mistsofpandaria.lua 4172 2013-03-31 22:53:10Z dynaletik $
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local ALIL = AtlasLoot_IngameLocales;
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleRare = AtlasLoot_GetLocaleLibBabble("LibBabble-Rare-3.0")
local moduleName = "AtlasLootMoP"

-- Index
--- Dungeons & Raids
---- Temple of the Jade Serpent
---- Stormstout Brewery
---- Mogu'Shan Palace
---- Shado-pan Monastery
---- Gate of the Setting Sun
---- Siege of Niuzao Temple
---- Scholomance
---- Scarlet Halls
---- Scarlet Monastery
---- Heart of Fear
---- Mogu'Shan Vaults
---- Pandaria World Bosses
---- Terrace of Endless Spring
---- Throne of Thunder
--- Rare Mobs
---- The Jade Forest
---- Valley of the Four Winds
---- Krasarang Wilds
---- Kun-Lai Summit
---- Townlong Steppes
---- Dread Wastes
---- Vale of Eternal Blossoms
---- Misc
---- Clawlord Kril'mandar
--- Rare Items
---- The Jade Forest
---- Valley of the Four Winds
---- Krasarang Wilds
---- Kun-Lai Summit
---- Townlong Steppes
---- Dread Wastes
--- Factions
---- The Anglers
---- The August Celestials
---- Bizmo's Brawlpub / Brawl'gar Arena
---- Dominance Offensive
---- Golden Lotus
---- Kirin Tor Offensive
---- The Klaxxi
---- The Lorewalkers
---- Operation: Shieldwall
---- Order of the Cloud Serpent
---- Shado-Pan
---- Shado-Pan Assault
---- Sunreaver Onslaught
---- The Tillers
---- Domination Point
---- Lion's Landing
--- PvP
---- PvP Armor Sets
---- Level 90 - Accessories
---- Level 90 - Non Set Epics
---- Level 90 - Weapons
--- Sets & Collections
---- Challenge Mode Armor Sets
---- Tier 14 Sets (T14)
---- Tier 15 Sets (T15)
---- Trading Card Game Items
---- Companions
---- Mounts
---- Tabards
---- Transformation Items
---- Legendaries
---- Heirloom Items
---- BoE World Epics
---- Justice Points Items
---- Valor Points Items

	------------------------
	--- Dungeons & Raids ---
	------------------------

		------------------------------
		--- Temple of Jade Serpent ---
		------------------------------

	AtlasLoot_Data["TJSMari"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80862, "", "=q3=Treads of Corrupted Water", "=ds=#s12#, #a2#", "", "33%"},
				{ 3, 80860, "", "=q3=Waterburst Helm", "=ds=#s1#, #a3#", "", "33%" },
				{ 4, 80861, "", "=q3=Riverbed Chestguard", "=ds=#s5#, #a4#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6460#"};
				{ 17, 81123, "", "=q3=Wind-Soaked Drape", "=ds=#s4#", "", "20%" },
				{ 18, 81072, "", "=q3=Treads of Corrupted Water", "=ds=#s12#, #a2#", "", "20%" },
				{ 19, 81075, "", "=q3=Waterburst Helm", "=ds=#s1#, #a3#", "", "20%" },
				{ 20, 81083, "", "=q3=Riverbed Chestguard", "=ds=#s5#, #a4#", "", "20%" },
				{ 21, 81124, "", "=q3=Crystallized Droplet", "=ds=#s13#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Wise Mari", 672),
			module = moduleName, instance = "TempleOfTheJadeSerpent",
		};
	};

	AtlasLoot_Data["TJSStonestep"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80864, "", "=q3=Girdle of Endemic Anger", "=ds=#s10#, #a1#", "", "33%" },
				{ 3, 80865, "", "=q3=Sunheart Waistband", "=ds=#s10#, #a3#", "", "33%" },
				{ 4, 80863, "", "=q3=Stonestep Boots", "=ds=#s12#, #a4#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 81058, "", "=q3=Girdle of Endemic Anger", "=ds=#s10#, #a1#", "", "20%" },
				{ 18, 81126, "", "=q3=Leggings of Whispered Dreams", "=ds=#s11#, #a2#", "", "20%" },
				{ 19, 81060, "", "=q3=Sunheart Waistband", "=ds=#s10#, #a3#", "", "20%" },
				{ 20, 81073, "", "=q3=Stonestep Boots", "=ds=#s12#, #a4#", "", "20%" },
				{ 21, 81125, "", "=q3=Windswept Pages", "=ds=#s14#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Lorewalker Stonestep", 664),
			module = moduleName, instance = "TempleOfTheJadeSerpent",
		};
	};

	AtlasLoot_Data["TJSFlameheart"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80866, "", "=q3=Cape of Entanglement", "=ds=#s4#", "", "33%" },
				{ 3, 80867, "", "=q3=Serpentstrike Shoulderpads", "=ds=#s3#, #a4#", "", "33%" },
				{ 4, 80872, "", "=q3=Firebelcher Hand Cannon", "=ds=#w5#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 81084, "", "=q3=Cape of Entanglement", "=ds=#s4#", "", "20%" },
				{ 18, 81127, "", "=q3=Flameheart Sandals", "=ds=#s12#, #a1#", "", "20%" },
				{ 19, 81070, "", "=q3=Serpentstrike Shoulderpads", "=ds=#s3#, #a4#", "", "20%" },
				{ 20, 81128, "", "=q3=Signet of Dancing Jade", "=ds=#s13#", "", "20%" },
				{ 21, 81067, "", "=q3=Firebelcher Hand Cannon", "=ds=#w5#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Liu Flameheart", 658),
			module = moduleName, instance = "TempleOfTheJadeSerpent",
		};
	};

	AtlasLoot_Data["TJSShaDoubt"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80868, "", "=q3=Doubtridden Shoulderguards", "=ds=#s3#, #a2#", "", "33%" },
				{ 3, 80870, "", "=q3=Chestguard of Despair", "=ds=#s5#, #a2#", "", "33%" },
				{ 4, 80871, "", "=q3=Neverdare Shoulders", "=ds=#s3#, #a3#", "", "33%" },
				{ 5, 80869, "", "=q3=Hopecrusher Gauntlets", "=ds=#s9#, #a3#", "", "33%" },
				{ 6, 80873, "", "=q3=Dubious Handaxe", "=ds=#h1#, #w1#", "", "33%" },
				{ 7, 80874, "", "=q3=Staff of Trembling Will", "=ds=#w9#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6475# / #ACHIEVEMENTID:6671#"}; --- 2nd achievemnt isn't showing up..
				{ 17, 87544, "", "=q4=Je'lyu, Spirit of the Serpent", "=ds=#h1#, #w6#", "", "1%" },
				{ 18, 81129, "", "=q3=Cloak of Failing Will", "=ds=#s4#", "", "20%" },
				{ 19, 81132, "", "=q3=Paralyzing Gloves", "=ds=#s9#, #a1#", "", "20%" },
				{ 20, 81071, "", "=q3=Doubtridden Shoulderguards", "=ds=#s3#, #a2#", "", "20%" },
				{ 21, 81082, "", "=q3=Chestguard of Despair", "=ds=#s5#, #a2#", "", "20%" },
				{ 22, 81069, "", "=q3=Neverdare Shoulders", "=ds=#s3#, #a3#", "", "20%" },
				{ 23, 81074, "", "=q3=Hopecrusher Gauntlets", "=ds=#s9#, #a3#", "", "20%" },
				{ 24, 81130, "", "=q3=Binding of Broken Dreams", "=ds=#s10#, #a4#", "", "20%" },
				{ 25, 81131, "", "=q3=Mindbreaker Pendant", "=ds=#s2#", "", "20%" },
				{ 26, 81063, "", "=q3=Dubious Handaxe", "=ds=#h1#, #w1#", "", "20%" },
				{ 27, 81079, "", "=q3=Staff of Trembling Will", "=ds=#w9#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Sha of Doubt", 335),
			module = moduleName, instance = "TempleOfTheJadeSerpent",
		};
	};

		--------------------------
		--- Stormstout Brewery ---
		--------------------------

	AtlasLoot_Data["BreweryOokOok"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80897, "", "=q3=Bracers of Displaced Air", "=ds=#s8#, #a1#", "", "33%"};
				{ 3, 80896, "", "=q3=Nimbletoe Chestguard", "=ds=#s5#, #a2#", "", "33%"};
				{ 4, 80892, "", "=q3=Ook's Hozen Slicer", "=ds=#h1#, #w10#", "", "33%"};
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6089#"};
				{ 17, 81064, "", "=q3=Bracers of Displaced Air", "=ds=#s8#, #a1#", "", "20%"};
				{ 18, 81080, "", "=q3=Nimbletoe Chestguard", "=ds=#s5#, #a2#", "", "20%"};
				{ 19, 81134, "", "=q3=Barreldodger Boots", "=ds=#s12#, #a4#", "", "20%"};
				{ 20, 81133, "", "=q3=Empty Fruit Barrel", "=ds=#s14#", "", "20%"};
				{ 21, 81061, "", "=q3=Ook's Hozen Slicer", "=ds=#h1#, #w10#", "", "20%"};
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Ook-Ook", 668),
			module = moduleName, instance = "StormstoutBrewery",
		};
	};

	AtlasLoot_Data["BreweryHoptallus"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80898, "", "=q3=Hopping Mad Leggings", "=ds=#s11#, #a3#", "", "33%"};
				{ 3, 80899, "", "=q3=Bubble-Breaker Bracers", "=ds=#s8#, #a4#", "", "33%"};
				{ 4, 80893, "", "=q3=Bottle of Potent Potables", "=ds=#s15#", "", "33%"};
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 81136, "", "=q3=Cloak of Hidden Flasks", "=ds=#s4#", "", "20%"};
				{ 18, 81135, "", "=q3=Belt of Brazen Inebriation", "=ds=#s10#, #a2#", "", "20%"};
				{ 19, 81077, "", "=q3=Hopping Mad Leggings", "=ds=#s11#, #a3#", "", "20%"};
				{ 20, 81065, "", "=q3=Bubble-Breaker Bracers", "=ds=#s8#, #a4#", "", "20%"};
				{ 21, 81076, "", "=q3=Bottle of Potent Potables", "=ds=#s15#", "", "20%"};
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Hoptallus", 669),
			module = moduleName, instance = "StormstoutBrewery",
		};
	};

	AtlasLoot_Data["BreweryYanZhu"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80903, "", "=q3=Fermenting Belt", "=ds=#s10#, #a1#", "", "33%"};
				{ 3, 80900, "", "=q3=Fizzy Spaulders", "=ds=#s3#, #a2#", "", "33%"};
				{ 4, 80902, "", "=q3=Uncasked Chestguard", "=ds=#s5#, #a3#", "", "33%"};
				{ 5, 80901, "", "=q3=Sudsy Legplates", "=ds=#s11#, #a4#", "", "33%"};
				{ 6, 80894, "", "=q3=Gao's Keg Tapper", "=ds=#h1#, #w6#", "", "33%"};
				{ 7, 80895, "", "=q3=Yan-Zhu's Pressure Valve", "=ds=#w5#", "", "33%"};
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 87545, "", "=q4=Inelava, Spirit of Inebriation", "=ds=#h1#, #w1#", "", "1%"};
				{ 18, 81059, "", "=q3=Fermenting Belt", "=ds=#s10#, #a1#", "", "20%"};
				{ 19, 81068, "", "=q3=Fizzy Spaulders", "=ds=#s3#, #a2#", "", "20%"};
				{ 20, 81081, "", "=q3=Uncasked Chestguard", "=ds=#s5#, #a3#", "", "20%"};
				{ 21, 81078, "", "=q3=Sudsy Legplates", "=ds=#s11#, #a4#", "", "20%"};
				{ 22, 81141, "", "=q3=Alemental Seal", "=ds=#s13#", "", "20%"};
				{ 23, 81139, "", "=q3=Lime-Rimmed Signet", "=ds=#s13#", "", "20%"};
				{ 24, 81138, "", "=q3=Carbonic Carbuncle", "=ds=#s14#", "", "20%"};
				{ 25, 81062, "", "=q3=Gao's Keg Tapper", "=ds=#h1#, #w6#", "", "20%"};
				{ 26, 81140, "", "=q3=Wort Sitrring Rod", "=ds=#w9#", "", "20%"};
				{ 27, 81066, "", "=q3=Yan-Zhu's Pressure Valve", "=ds=#w5#", "", "20%"};
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Yan-Zhu the Uncasked", 670),
			module = moduleName, instance = "StormstoutBrewery",
		};
	};

		------------------------
		--- Mogu'Shan Palace ---
		------------------------

	AtlasLoot_Data["MoguShanTrialKing"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 85178, "", "=q3=Conflagrating Gloves", "=ds=#s9#, #a1#", "", "20%" },
				{ 3, 85176, "", "=q3=Hurricane Belt", "=ds=#s10#, #a2#", "", "20%" },
				{ 4, 85175, "", "=q3=Crest of the Clan Lords", "=ds=#s1#, #a3#", "", "20%" },
				{ 5, 85179, "", "=q3=Meteoric Greathelm", "=ds=#s1#, #a4#", "", "20%" },
				{ 6, 85177, "", "=q3=Whirling Dervish Choker", "=ds=#s2#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 81240, "", "=q3=Conflagrating Gloves", "=ds=#s9#, #a1#", "", "20%" },
				{ 18, 81238, "", "=q3=Hurricane Belt", "=ds=#s10#, #a2#", "", "20%" },
				{ 19, 81237, "", "=q3=Crest of the Clan Lords", "=ds=#s1#, #a3#", "", "20%" },
				{ 20, 81241, "", "=q3=Meteoric Greathelm", "=ds=#s1#, #a4#", "", "20%" },
				{ 21, 81239, "", "=q3=Whirling Dervish Choker", "=ds=#s2#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Trial of the King", 708),
			module = moduleName, instance = "MoguShanPalace",
		};
	};

	AtlasLoot_Data["MoguShanGekkan"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 85182, "", "=q3=Cloak of Cleansing Flame", "=ds=#s4#", "", "20%" },
				{ 3, 85184, "", "=q3=Hexxer's Lethargic Gloves", "=ds=#s9#, #a3#", "", "20%" },
				{ 4, 85180, "", "=q3=Glintrok Sollerets", "=ds=#s12#, #a4#", "", "20%" },
				{ 5, 85181, "", "=q3=Iron Protector Talisman", "=ds=#s14#", "", "20%" },
				{ 6, 85183, "", "=q3=Claws of Gekkan", "=ds=#h1#, #w13#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6478#"};
				{ 17, 81244, "", "=q3=Cloak of Cleansing Flame", "=ds=#s4#", "", "20%" },
				{ 18, 81246, "", "=q3=Hexxer's Lethargic Gloves", "=ds=#s9#, #a3#", "", "20%" },
				{ 19, 81242, "", "=q3=Glintrok Sollerets", "=ds=#s12#, #a4#", "", "20%" },
				{ 20, 81243, "", "=q3=Iron Protector Talisman", "=ds=#s14#", "", "20%" },
				{ 21, 81245, "", "=q3=Claws of Gekkan", "=ds=#h1#, #w13#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Gekkan", 690),
			module = moduleName, instance = "MoguShanPalace",
		};
	};

	AtlasLoot_Data["MoguShanXin"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 85194, "", "=q3=Regal Silk Shoulderpads", "=ds=#s3#, #a1#", "", "20%" },
				{ 3, 85192, "", "=q3=Soulbinder Treads", "=ds=#s12#, #a1#", "", "20%" },
				{ 4, 85187, "", "=q3=Boots of Plummeting Death", "=ds=#s12#, #a2#", "", "20%" },
				{ 5, 85189, "", "=q3=Groundshaker Bracers", "=ds=#s8#, #a3#", "", "20%" },
				{ 6, 85193, "", "=q3=Mind's Eye Breastplate", "=ds=#s5#, #a4#", "", "20%" },
				{ 7, 85186, "", "=q3=Axebreaker Gauntlets", "=ds=#s9#, #a4#", "", "20%" },
				{ 8, 85191, "", "=q3=Mindcapture Pendant", "=ds=#s2#", "", "20%" },
				{ 9, 85188, "", "=q3=Blade Trap Signet", "=ds=#s13#", "", "20%" },
				{ 10, 85190, "", "=q3=Firescribe Dagger", "=ds=#h1#, #w4#", "", "20%" },
				{ 11, 85185, "", "=q3=Ghostheart", "=ds=#w7#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6736#"};
				{ 17, 87542, "", "=q4=Mogu'Dar, Blade of the Thousand Slaves", "=ds=#h2#, #w10#", "", "1%" },
				{ 18, 81257, "", "=q3=Regal Silk Shoulderpads", "=ds=#s3#, #a1#", "", "20%" },
				{ 19, 81255, "", "=q3=Soulbinder Treads", "=ds=#s12#, #a1#", "", "20%" },
				{ 20, 81249, "", "=q3=Boots of Plummeting Death", "=ds=#s12#, #a2#", "", "20%" },
				{ 21, 81252, "", "=q3=Groundshaker Bracers", "=ds=#s8#, #a3#", "", "20%" },
				{ 22, 81256, "", "=q3=Mind's Eye Breastplate", "=ds=#s5#, #a4#", "", "20%" },
				{ 23, 81248, "", "=q3=Axebreaker Gauntlets", "=ds=#s9#, #a4#", "", "20%" },
				{ 24, 81254, "", "=q3=Mindcapture Pendant", "=ds=#s2#", "", "20%" },
				{ 25, 81251, "", "=q3=Blade Trap Signet", "=ds=#s13#", "", "20%" },
				{ 26, 81253, "", "=q3=Firescribe Dagger", "=ds=#h1#, #w4#", "", "20%" },
				{ 27, 81247, "", "=q3=Ghostheart", "=ds=#w7#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Xin the Weaponmaster", 698),
			module = moduleName, instance = "MoguShanPalace",
		};
	};

		---------------------------
		--- Shado-pan Monastery ---
		---------------------------

	AtlasLoot_Data["ShadoPanCloudstrike"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80909, "", "=q3=Azure Serpent Chestguard", "=ds=#s5#, #a3#", "", "33%" },
				{ 3, 80910, "", "=q3=Leggings of the Charging Soul", "=ds=#s11#, #a3#", "", "33%" },
				{ 4, 80908, "", "=q3=Sparkbreath Girdle", "=ds=#s10#, #a4#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 81179, "", "=q3=Star Summoner Bracers", "=ds=#s8#, #a2#", "", "20%" },
				{ 18, 81110, "", "=q3=Azure Serpent Chestguard", "=ds=#s5#, #a3#", "", "20%" },
				{ 19, 81092, "", "=q3=Leggings of the Charging Soul", "=ds=#s11#, #a3#", "", "20%" },
				{ 20, 81086, "", "=q3=Sparkbreath Girdle", "=ds=#s10#, #a4#", "", "20%" },
				{ 21, 81180, "", "=q3=Cloudstrike Pendant", "=ds=#s2#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Gu Cloudstrike", 673),
			module = moduleName, instance = "ShadoPanMonastery",
		};
	};

	AtlasLoot_Data["ShadoPanSnowdrift"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80912, "", "=q3=Gauntlets of Resolute Fury", "=ds=#s9#, #a4#", "", "33%" },
				{ 3, 80911, "", "=q3=Quivering Heart Girdle", "=ds=#s10#, #a4#", "", "33%" },
				{ 4, 80937, "", "=q3=Snowdrift's Bladed Staff", "=ds=#w9#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6477#"};
				{ 17, 81101, "", "=q3=Gauntlets of Resolute Fury", "=ds=#s9#, #a4#", "", "20%" },
				{ 18, 81087, "", "=q3=Quivering Heart Girdle", "=ds=#s10#, #a4#", "", "20%" },
				{ 19, 81182, "", "=q3=Eye of the Tornado", "=ds=#s13#", "", "20%" },
				{ 20, 81181, "", "=q3=Heart of Fire", "=ds=#s14#", "", "20%" },
				{ 21, 81108, "", "=q3=Snowdrift's Bladed Staff", "=ds=#w9#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Master Snowdrift", 657),
			module = moduleName, instance = "ShadoPanMonastery",
		};
	};

	AtlasLoot_Data["ShadoPanShaViolence"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80913, "", "=q3=Gloves of Enraged Slaughter", "=ds=#s9#, #a1#", "", "33%" },
				{ 3, 80915, "", "=q3=Spike-Soled Stompers", "=ds=#s12#, #a4#", "", "33%" },
				{ 4, 80883, "", "=q3=Crescent of Ichor", "=ds=#h1#, #w1#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6472#"};
				{ 17, 81102, "", "=q3=Gloves of Enraged Slaughter", "=ds=#s9#, #a1#", "", "20%" },
				{ 18, 81185, "", "=q3=Bladed Smoke Bracers", "=ds=#s8#, #a3#", "", "20%" },
				{ 19, 81113, "", "=q3=Spike-Soled Stompers", "=ds=#s12#, #a4#", "", "20%" },
				{ 20, 81184, "", "=q3=Necklace of Disorientation", "=ds=#s2#", "", "20%" },
				{ 21, 81089, "", "=q3=Crescent of Ichor", "=ds=#h1#, #w1#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Sha of Violence", 685),
			module = moduleName, instance = "ShadoPanMonastery",
		};
	};

	AtlasLoot_Data["ShadoPanTaranZhu"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 80919, "", "=q3=Darkbinder Leggings", "=ds=#s11#, #a2#", "", "33%" },
				{ 3, 80916, "", "=q3=Shadowspine Shoulderguards", "=ds=#s3#, #a3#", "", "33%" },
				{ 4, 80917, "", "=q3=Blastwalker Footguards", "=ds=#s12#, #a3#", "", "33%" },
				{ 5, 80918, "", "=q3=Mindbinder Plate Gloves", "=ds=#s9#, #a4#", "", "33%" },
				{ 6, 80936, "", "=q3=Warmace of Taran Zhu", "=ds=#h2#, #w6#", "", "33%" },
				{ 7, 80935, "", "=q3=Shield of Blind Hate", "=ds=#w8#", "", "33%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6471#"};
				{ 17, 87543, "", "=q4=Ka'eng, Breath of the Shadow", "=ds=#h1#, #w13#", "", "1%" },
				{ 18, 81188, "", "=q3=Robes of Fevered Dreams", "=ds=#s5#, #a1#", "", "20%" },
				{ 19, 81093, "", "=q3=Darkbinder Leggings", "=ds=#s11#, #a2#", "", "20%" },
				{ 20, 81099, "", "=q3=Shadowspine Shoulderguards", "=ds=#s3#, #a3#", "", "20%" },
				{ 21, 81114, "", "=q3=Blastwalker Footguards", "=ds=#s12#, #a3#", "", "20%" },
				{ 22, 81187, "", "=q3=Hateshatter Chestplate", "=ds=#s5#, #a4#", "", "20%" },
				{ 23, 81103, "", "=q3=Mindbinder Plate Gloves", "=ds=#s9#, #a4#", "", "20%" },
				{ 24, 81189, "", "=q3=Ring of Malice", "=ds=#s13#", "", "20%" },
				{ 25, 81186, "", "=q3=Seal of Hateful Meditation", "=ds=#s13#", "", "20%" },
				{ 26, 81107, "", "=q3=Warmace of Taran Zhu", "=ds=#h2#, #w6#", "", "20%" },
				{ 27, 81096, "", "=q3=Shield of Blind Hate", "=ds=#w8#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Taran Zhu", 686),
			module = moduleName, instance = "ShadoPanMonastery",
		};
	};

		-------------------------------
		--- Gate of the Setting Sun ---
		-------------------------------

	AtlasLoot_Data["GotSSKiptilak"] = {
		["Normal"] = {
			{
				{ 1, 81104, "", "=q3=Fallout-Filtering Hood", "=ds=#s1#, #a1#", "", "20%"},
				{ 2, 81090, "", "=q3=Saboteur's Stabilizing Bracers", "=ds=#s8#, #a2#", "", "20%" },
				{ 3, 81190, "", "=q3=Grenadier's Belt", "=ds=#s10#, #a4#", "", "20%" },
				{ 4, 81095, "", "=q3=Pendant of Precise Timing", "=ds=#s2#", "", "20%" },
				{ 5, 81191, "", "=q3=Pulled Grenade Pin", "=ds=#s13#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Saboteur Kip'tilak", 655),
			module = moduleName, instance = "GateoftheSettingSun",
		};
	};

	AtlasLoot_Data["GotSSGadok"] = {
		["Normal"] = {
			{
				{ 1, 81229, "", "=q3=Bomber's Precision Gloves", "=ds=#s9#, #a1#", "", "20%" },
				{ 2, 81111, "", "=q3=Airstream Treads", "=ds=#s12#, #a2#", "", "20%" },
				{ 3, 81085, "", "=q3=Impaler's Girdle", "=ds=#s10#, #a3#", "", "20%" },
				{ 4, 81098, "", "=q3=Acid-Scarred Spaulders", "=ds=#s3#, #a4#", "", "20%" },
				{ 5, 81192, "", "=q3=Vision of the Predator", "=ds=#s14#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Striker Ga'dok", 675),
			module = moduleName, instance = "GateoftheSettingSun",
		};
	};

	AtlasLoot_Data["GotSSRimok"] = {
		["Normal"] = {
			{
				{ 1, 81106, "", "=q3=Leggings of the Frenzy", "=ds=#s11#, #a1#", "", "20%" },
				{ 2, 81105, "", "=q3=Swarmcall Helm", "=ds=#s1#, #a3#", "", "20%" },
				{ 3, 81230, "", "=q3=Ri'mok's Shattered Scale", "=ds=#s8#, #a4#", "", "20%" },
				{ 4, 81232, "", "=q3=Viscous Ring", "=ds=#s13#", "", "20%" },
				{ 5, 81088, "", "=q3=Mantid Trochanter", "=ds=#h1#, #w4#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Commander Ri'mok", 676),
			module = moduleName, instance = "GateoftheSettingSun",
		};
	};

	AtlasLoot_Data["GotSSRaigonn"] = {
		["Normal"] = {
			{
				{ 1, 87546, "", "=q4=Klatith, Fangs of the Swarm", "=ds=#w2#", "", "1%" },
				{ 3, 81234, "", "=q3=Drape of the Screeching Swarm", "=ds=#s4#", "", "20%" },
				{ 4, 81235, "", "=q3=Shoulders of Engulfing Winds", "=ds=#s3#, #a1#", "", "20%" },
				{ 5, 81236, "", "=q3=Frenzyswarm Bracers", "=ds=#s8#, #a1#", "", "20%" },
				{ 6, 81091, "", "=q3=Wall-Breaker Legguards", "=ds=#s11#, #a2#", "", "20%" },
				{ 7, 81112, "", "=q3=Treads of Fixation", "=ds=#s12#, #a3#", "", "20%" },
				{ 8, 81109, "", "=q3=Swarmbringer Chestguard", "=ds=#s5#, #a4#", "", "20%" },
				{ 9, 81100, "", "=q3=Hive Protector's Gauntlets", "=ds=#s9#, #a4#", "", "20%" },
				{ 18, 81094, "", "=q3=Carapace Breaker", "=ds=#h1#, #w6#", "", "20%" },
				{ 19, 81233, "", "=q3=Impervious Carapace", "=ds=#w8#", "", "20%" },
				{ 20, 81097, "", "=q3=Shield of the Protectorate", "=ds=#w8#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Raigonn", 649),
			module = moduleName, instance = "GateoftheSettingSun",
		};
	};

		------------------------------
		--- Siege of Niuzao Temple ---
		------------------------------

	AtlasLoot_Data["NTJinbak"] = {
		["Normal"] = {
			{
				{ 1, 81262, "", "=q3=Hood of Viridian Residue", "=ds=#s1#, #a2#", "", "20%"},
				{ 2, 81272, "", "=q3=Girdle of Soothing Detonation", "=ds=#s10#, #a4#", "", "20%" },
				{ 3, 81270, "", "=q3=Sap-Encrusted Legplates", "=ds=#s11#, #a4#", "", "20%" },
				{ 4, 81271, "", "=q3=Engraved Amber Pendant", "=ds=#s2#", "", "20%" },
				{ 5, 81263, "", "=q3=Flashfrozen Resin Globule", "=ds=#s14#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Vizier Jin'bak", 693),
			module = moduleName, instance = "SiegeofNiuzaoTemple",
		};
	};

	AtlasLoot_Data["NTVojak"] = {
		["Normal"] = {
			{
				{ 1, 81276, "", "=q3=Bombardment Bracers", "=ds=#s8#, #a1#", "", "20%" },
				{ 2, 81275, "", "=q3=Chestwrap of Arcing Flame", "=ds=#s5#, #a2#", "", "20%" },
				{ 3, 81277, "", "=q3=Archer's Precision Grips", "=ds=#s9#, #a3#", "", "20%" },
				{ 4, 81274, "", "=q3=Sightfinder Helm", "=ds=#s1#, #a4#", "", "20%" },
				{ 5, 81273, "", "=q3=Siege-Captain's Scimitar", "=ds=#h1#, #w10#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Commander Vo'jak", 738),
			module = moduleName, instance = "SiegeofNiuzaoTemple",
		};
	};

	AtlasLoot_Data["NTPavalak"] = {
		["Normal"] = {
			{
				{ 1, 81282, "", "=q3=Aerial Bombardment Cloak", "=ds=#s4#", "", "20%" },
				{ 2, 81281, "", "=q3=Breezebinder Handwraps", "=ds=#s9#, #a1#", "", "20%" },
				{ 3, 81280, "", "=q3=Siegeworn Bracers", "=ds=#s8#, #a4#", "", "20%" },
				{ 4, 81264, "", "=q3=Vial of Ichorous Blood", "=ds=#s14#", "", "20%" },
				{ 5, 81279, "", "=q3=Tempestuous Longbow", "=ds=#w2#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("General Pa'valak", 692),
			module = moduleName, instance = "SiegeofNiuzaoTemple",
		};
	};

	AtlasLoot_Data["NTNeronok"] = {
		["Normal"] = {
			{
				{ 1, 87547, "", "=q4=Tolakesh, Horn of the Black Ox", "=ds=#h1#, #w4#", "", "1%" },
				{ 3, 81289, "", "=q3=Breezeswept Hood", "=ds=#s1#, #a1#", "", "20%" },
				{ 4, 81291, "", "=q3=Whisperwind Spaulders", "=ds=#s3#, #a1#", "", "20%" },
				{ 5, 81283, "", "=q3=Windblast Helm", "=ds=#s1#, #a2#", "", "20%" },
				{ 6, 81285, "", "=q3=Galedodger Chestguard", "=ds=#s5#, #a3#", "", "20%" },
				{ 7, 81290, "", "=q3=Belt of Totemic Binding", "=ds=#s10#, #a3#", "", "20%" },
				{ 8, 81292, "", "=q3=Airbender Sandals", "=ds=#s12#, #a3#", "", "20%" },
				{ 9, 81287, "", "=q3=Spaulders of Immovable Stone", "=ds=#s3#, #a4#", "", "20%" },
				{ 10, 81284, "", "=q3=Anchoring Sabatons", "=ds=#s12#, #a4#", "", "20%" },
				{ 18, 81286, "", "=q3=Ner'onok's Razor Katar", "=ds=#h1#, #w13#", "", "20%" },
				{ 19, 81288, "", "=q3=Gustwalker Staff", "=ds=#w9#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Wing Leader Ner'onok", 727),
			module = moduleName, instance = "SiegeofNiuzaoTemple",
		};
	};

		-------------------
		--- Scholomance ---
		-------------------

	AtlasLoot_Data["ScholoChillheart"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88336, "", "=q3=Icewrath Belt", "=ds=#s10#, #a2#", "", "20%" },
				{ 3, 88337, "", "=q3=Shadow Puppet Bracers", "=ds=#s8#, #a3#", "", "20%" },
				{ 4, 88338, "", "=q3=Breastplate of Wracking Souls", "=ds=#s5#, #a4#", "", "20%" },
				{ 5, 88335, "", "=q3=Anarchist's Pendant", "=ds=#s2#", "", "20%" },
				{ 6, 88339, "", "=q3=Gravetouch Greatsword", "=ds=#h2#, #w10#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 82823, "", "=q3=Icewrath Belt", "=ds=#s10#, #a2#", "", "20%" },
				{ 18, 82820, "", "=q3=Shadow Puppet Bracers", "=ds=#s8#, #a3#", "", "20%" },
				{ 19, 82821, "", "=q3=Breastplate of Wracking Souls", "=ds=#s5#, #a4#", "", "20%" },
				{ 20, 81566, "", "=q3=Anarchist's Pendant", "=ds=#s2#", "", "20%" },
				{ 21, 82822, "", "=q3=Gravetouch Greatsword", "=ds=#h2#, #w10#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Instructor Chillheart", 659),
			module = moduleName, instance = "Scholomance",
		};
	};

	AtlasLoot_Data["ScholoJandice"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88349, "", "=q3=Phantasmal Drape", "=ds=#s4#", "", "20%" },
				{ 3, 88345, "", "=q3=Barovian Ritual Hood", "=ds=#s1#, #a1#", "", "20%" },
				{ 4, 88347, "", "=q3=Ghostwoven Legguards", "=ds=#s11#, #a2#", "", "20%" },
				{ 5, 88348, "", "=q3=Wraithplate Treads", "=ds=#s12#, #a4#", "", "20%" },
				{ 6, 88346, "", "=q3=Metanoia Shield", "=ds=#w8#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6531#"};
				{ 17, 82850, "", "=q3=Phantasmal Drape", "=ds=#s4#", "", "20%" },
				{ 18, 82848, "", "=q3=Barovian Ritual Hood", "=ds=#s1#, #a1#", "", "20%" },
				{ 19, 82851, "", "=q3=Ghostwoven Legguards", "=ds=#s11#, #a2#", "", "20%" },
				{ 20, 82852, "", "=q3=Wraithplate Treads", "=ds=#s12#, #a4#", "", "20%" },
				{ 21, 82847, "", "=q3=Metanoia Shield", "=ds=#w8#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Jandice Barov", 663),
			module = moduleName, instance = "Scholomance",
		};
	};

	AtlasLoot_Data["ScholoRattlegore"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88340, "", "=q3=Deadwalker Bracers", "=ds=#s8#, #a1#", "", "20%" },
				{ 3, 88342, "", "=q3=Rattling Gloves", "=ds=#s9#, #a2#", "", "20%" },
				{ 4, 88343, "", "=q3=Bone Golem Boots", "=ds=#s12#, #a3#", "", "20%" },
				{ 5, 88344, "", "=q3=Goresoaked Headreaper", "=ds=#h2#, #w1#", "", "20%" },
				{ 6, 88341, "", "=q3=Necromantic Wand", "=ds=#w12#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6394#"};
				{ 17, 82825, "", "=q3=Deadwalker Bracers", "=ds=#s8#, #a1#", "", "20%" },
				{ 18, 82827, "", "=q3=Rattling Gloves", "=ds=#s9#, #a2#", "", "20%" },
				{ 19, 82828, "", "=q3=Bone Golem Boots", "=ds=#s12#, #a3#", "", "20%" },
				{ 20, 82824, "", "=q3=Goresoaked Headreaper", "=ds=#h2#, #w1#", "", "20%" },
				{ 21, 82826, "", "=q3=Necromantic Wand", "=ds=#w12#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Rattlegore", 665),
			module = moduleName, instance = "Scholomance",
		};
	};

	AtlasLoot_Data["ScholoVoss"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88350, "", "=q3=Leggings of Unleashed Anguish", "=ds=#s11#, #a1#", "", "20%" },
				{ 3, 88351, "", "=q3=Soulburner Crown", "=ds=#s1#, #a2#", "", "20%" },
				{ 4, 88352, "", "=q3=Shivbreaker Vest", "=ds=#s5#, #a3#", "", "20%" },
				{ 5, 88353, "", "=q3=Dark Blaze Gauntlets", "=ds=#s9#, #a4#", "", "20%" },
				{ 6, 88354, "", "=q3=Necklace of the Dark Blaze", "=ds=#s2#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 82854, "", "=q3=Leggings of Unleashed Anguish", "=ds=#s11#, #a1#", "", "20%" },
				{ 18, 82853, "", "=q3=Soulburner Crown", "=ds=#s1#, #a2#", "", "20%" },
				{ 19, 82855, "", "=q3=Shivbreaker Vest", "=ds=#s5#, #a3#", "", "20%" },
				{ 20, 82856, "", "=q3=Dark Blaze Gauntlets", "=ds=#s9#, #a4#", "", "20%" },
				{ 21, 81567, "", "=q3=Necklace of the Dark Blaze", "=ds=#s2#", "", "20%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Lilian Voss", 666),
			module = moduleName, instance = "Scholomance",
		};
	};

	AtlasLoot_Data["ScholoGandling"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88359, "", "=q3=Incineration Belt", "=ds=#s10#, #a1#", "", "25%" },
				{ 3, 88356, "", "=q3=Tombstone Gauntlets", "=ds=#s9#, #a2#", "", "25%" },
				{ 4, 88361, "", "=q3=Gloves of Explosive Pain", "=ds=#s9#, #a3#", "", "25%" },
				{ 5, 88362, "", "=q3=Shoulderguards of Painful Lessons", "=ds=#s3#, #a4#", "", "25%" },
				{ 6, 88357, "", "=q3=Vigorsteel Spaulders", "=ds=#s3#, #a4#", "", "25%" },
				{ 7, 88358, "", "=q3=Lessons of the Darkmaster", "=ds=#s14#", "", "25%" },
				{ 8, 88360, "", "=q3=Price of Progress", "=ds=#s14#", "", "25%" },
				{ 9, 88355, "", "=q3=Searing Words", "=ds=#s14#", "", "25%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6821#"};
				{ 17, 82859, "", "=q4=Headmaster's Will", "=ds=#w9#", "", "1%" },
				{ 18, 82861, "", "=q3=Incineration Belt", "=ds=#s10#, #a1#", "", "25%" },
				{ 19, 82858, "", "=q3=Tombstone Gauntlets", "=ds=#s9#, #a2#", "", "25%" },
				{ 20, 82860, "", "=q3=Gloves of Explosive Pain", "=ds=#s9#, #a3#", "", "25%" },
				{ 21, 82862, "", "=q3=Shoulderguards of Painful Lessons", "=ds=#s3#, #a4#", "", "25%" },
				{ 22, 82857, "", "=q3=Vigorsteel Spaulders", "=ds=#s3#, #a4#", "", "25%" },
				{ 23, 81268, "", "=q3=Lessons of the Darkmaster", "=ds=#s14#", "", "25%" },
				{ 24, 81266, "", "=q3=Price of Progress", "=ds=#s14#", "", "25%" },
				{ 25, 81267, "", "=q3=Searing Words", "=ds=#s14#", "", "25%" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Darkmaster Gandling", 684),
			module = moduleName, instance = "Scholomance",
		};
	};

		---------------------
		--- Scarlet Halls ---
		---------------------

	AtlasLoot_Data["SHBraun"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88266, "", "=q3=Hound Trainer's Gloves", "=ds=#s9#, #a2#", "", "20%" },
				{ 3, 88268, "", "=q3=Canine Commander's Breastplate", "=ds=#s5#, #a4#", "", "20%" },
				{ 4, 88267, "", "=q3=Commanding Bracers", "=ds=#s8#, #a4#", "", "20%" },
				{ 5, 88265, "", "=q3=Beastbinder Ring", "=ds=#s13#", "", "20%" },
				{ 6, 88264, "", "=q3=Houndmaster's Compound Crossbow", "=ds=#w3#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6684#"};
				{ 17, 81695, "", "=q3=Hound Trainer's Gloves", "=ds=#s9#, #a2#", "", "20%" },
				{ 18, 81696, "", "=q3=Canine Commander's Breastplate", "=ds=#s5#, #a4#", "", "20%" },
				{ 19, 81694, "", "=q3=Commanding Bracers", "=ds=#s8#, #a4#", "", "20%" },
				{ 20, 81563, "", "=q3=Beastbinder Ring", "=ds=#s13#", "", "20%" },
				{ 21, 81693, "", "=q3=Houndmaster's Compound Crossbow", "=ds=#w3#", "", "20%" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Houndmaster Braun", 660),
			module = moduleName, instance = "ScarletHalls",
		};
	};

	AtlasLoot_Data["SHHarlan"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88269, "", "=q3=Scarlet Sandals", "=ds=#s12#, #a1#", "", "20%" },
				{ 3, 88270, "", "=q3=Lightblade Bracer", "=ds=#s8#, #a2#", "", "20%" },
				{ 4, 88271, "", "=q3=Harlan's Shoulders", "=ds=#s3#, #a3#", "", "20%" },
				{ 5, 88273, "", "=q3=Armsmaster's Sealed Locket", "=ds=#s2#", "", "20%" },
				{ 6, 88272, "", "=q3=The Gleaming Ravager", "=ds=#h2#, #w1#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6427#"};
				{ 17, 81699, "", "=q3=Scarlet Sandals", "=ds=#s12#, #a1#", "", "20%" },
				{ 18, 81700, "", "=q3=Lightblade Bracer", "=ds=#s8#, #a2#", "", "20%" },
				{ 19, 81698, "", "=q3=Harlan's Shoulders", "=ds=#s3#, #a3#", "", "20%" },
				{ 20, 81568, "", "=q3=Armsmaster's Sealed Locket", "=ds=#s2#", "", "20%" },
				{ 21, 81697, "", "=q3=The Gleaming Ravager", "=ds=#h2#, #w1#", "", "20%" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Armsmaster Harlan", 654),
			module = moduleName, instance = "ScarletHalls",
		};
	};

	AtlasLoot_Data["SHKoegler"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88279, "", "=q3=Robes of Koegler", "=ds=#s5#, #a1#", "", "20%" },
				{ 3, 88282, "", "=q3=Vellum-Ripper Gloves", "=ds=#s9#, #a2#", "", "20%" },
				{ 4, 88276, "", "=q3=Bindburner Belt", "=ds=#s10#, #a3#", "", "20%" },
				{ 5, 88283, "", "=q3=Bradbury's Entropic Legguards", "=ds=#s11#, #a3#", "", "20%" },
				{ 6, 88277, "", "=q3=Pyretic Legguards", "=ds=#s11#, #a4#", "", "20%" },
				{ 7, 88275, "", "=q3=Scorched Scarlet Key", "=ds=#s2#", "", "20%" },
				{ 8, 88281, "", "=q3=Temperature-Sensing Necklace", "=ds=#s2#", "", "20%" },
				{ 9, 88280, "", "=q3=Melted Hypnotic Blade", "=ds=#h1#, #w4#", "", "20%" },
				{ 10, 88274, "", "=q3=Koegler's Ritual Knife", "=ds=#h1#, #w4#", "", "20%" },
				{ 11, 88278, "", "=q3=Mograine's Immaculate Might", "=ds=#h2#, #w6#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", ""};
				{ 17, 87550, "", "=q4=Vithrak, Gaze of the Deadman", "=ds=#s13#", "", "1%" },
				{ 18, 82817, "", "=q3=Robes of Koegler", "=ds=#s5#, #a1#", "", "20%" },
				{ 19, 82818, "", "=q3=Vellum-Ripper Gloves", "=ds=#s9#, #a2#", "", "20%" },
				{ 20, 82815, "", "=q3=Bindburner Belt", "=ds=#s10#, #a3#", "", "20%" },
				{ 21, 82819, "", "=q3=Bradbury's Entropic Legguards", "=ds=#s11#, #a3#", "", "20%" },
				{ 22, 82812, "", "=q3=Pyretic Legguards", "=ds=#s11#, #a4#", "", "20%" },
				{ 23, 81564, "", "=q3=Scorched Scarlet Key", "=ds=#s2#", "", "20%" },
				{ 24, 81565, "", "=q3=Temperature-Sensing Necklace", "=ds=#s2#", "", "20%" },
				{ 25, 82816, "", "=q3=Melted Hypnotic Blade", "=ds=#h1#, #w4#", "", "20%" },
				{ 26, 82813, "", "=q3=Koegler's Ritual Knife", "=ds=#h1#, #w4#", "", "20%" },
				{ 27, 82814, "", "=q3=Mograine's Immaculate Might", "=ds=#h2#, #w6#", "", "20%" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Flameweaver Kogler", 656),
			module = moduleName, instance = "ScarletHalls",
		};
	};

		-------------------------
		--- Scarlet Monastery ---
		-------------------------

	AtlasLoot_Data["SMThalnos"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88288, "", "=q3=Soulrender Greatcloak", "=ds=#s4#", "", "20%" },
				{ 3, 88284, "", "=q3=Forgotten Bloodmage Mantle", "=ds=#s3#, #a1#", "", "20%" },
				{ 4, 88286, "", "=q3=Legguards of the Crimson Magus", "=ds=#s11#, #a3#", "", "20%" },
				{ 5, 88287, "", "=q3=Bracers of the Fallen Crusader", "=ds=#s8#, #a4#", "", "20%" },
				{ 6, 88285, "", "=q3=Signet of the Hidden Door", "=ds=#s13#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6946#"};
				{ 17, 81571, "", "=q3=Soulrender Greatcloak", "=ds=#s4#", "", "20%" },
				{ 18, 81569, "", "=q3=Forgotten Bloodmage Mantle", "=ds=#s3#, #a1#", "", "20%" },
				{ 19, 81570, "", "=q3=Legguards of the Crimson Magus", "=ds=#s11#, #a3#", "", "20%" },
				{ 20, 81572, "", "=q3=Bracers of the Fallen Crusader", "=ds=#s8#, #a4#", "", "20%" },
				{ 21, 81560, "", "=q3=Signet of the Hidden Door", "=ds=#s13#", "", "20%" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Thalnos the Soulrender", 688),
			module = moduleName, instance = "ScarletMonastery",
		};
	};

	AtlasLoot_Data["SMKorloff"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88290, "", "=q3=Scorched Earth Cloak", "=ds=#s4#", "", "20%" },
				{ 3, 88291, "", "=q3=Korloff's Raiment", "=ds=#s5#, #a2#", "", "20%" },
				{ 4, 88292, "", "=q3=Helm of Rising Flame", "=ds=#s1#, #a4#", "", "20%" },
				{ 5, 88293, "", "=q3=Firefinger Ring", "=ds=#s13#", "", "20%" },
				{ 6, 88289, "", "=q3=Firestorm Greatstaff", "=ds=#w9#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6928#"};
				{ 17, 81575, "", "=q3=Scorched Earth Cloak", "=ds=#s4#", "", "20%" },
				{ 18, 81573, "", "=q3=Korloff's Raiment", "=ds=#s5#, #a2#", "", "20%" },
				{ 19, 81574, "", "=q3=Helm of Rising Flame", "=ds=#s1#, #a4#", "", "20%" },
				{ 20, 81561, "", "=q3=Firefinger Ring", "=ds=#s13#", "", "20%" },
				{ 21, 81576, "", "=q3=Firestorm Greatstaff", "=ds=#w9#", "", "20%" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Brother Korloff", 671),
			module = moduleName, instance = "ScarletMonastery",
		};
	};

	AtlasLoot_Data["SMWhitemane"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
				{ 2, 88299, "", "=q3=Whitemane's Embroidered Chapeau", "=ds=#s1#, #a1#", "", "20%" },
				{ 3, 88298, "", "=q3=Leggings of Hallowed Fire", "=ds=#s11#, #a1#", "", "20%" },
				{ 4, 88302, "", "=q3=Incarnadine Scarlet Spaulders", "=ds=#s3#, #a2#", "", "20%" },
				{ 5, 88295, "", "=q3=Dashing Strike Treads", "=ds=#s12#, #a2#", "", "20%" },
				{ 6, 88303, "", "=q3=Crown of Holy Flame", "=ds=#s1#, #a4#", "", "20%" },
				{ 7, 88296, "", "=q3=Waistplate of Imminent Resurrection", "=ds=#s10#, #a4#", "", "20%" },
				{ 8, 88300, "", "=q3=Triune Signet", "=ds=#s13#", "", "20%" },
				{ 9, 88294, "", "=q3=Flashing Steel Talisman", "=ds=#s14#", "", "20%" },
				{ 10, 88297, "", "=q3=Lightbreaker Greatsword", "=ds=#h2#, #w10#", "", "20%" },
				{ 11, 88301, "", "=q3=Greatstaff of Righteousness", "=ds=#w9#", "", "20%" },
				{ 16, 0, "inv_box_04", "=q6=#j3#", "#ACHIEVEMENTID:6929#"};
				{ 17, 87551, "", "=q4=Helios, Durand's Soul of Purity", "=ds=#s2#", "", "1%" },
				{ 18, 81692, "", "=q3=Whitemane's Embroidered Chapeau", "=ds=#s1#, #a1#", "", "20%" },
				{ 19, 81689, "", "=q3=Leggings of Hallowed Fire", "=ds=#s11#, #a1#", "", "20%" },
				{ 20, 81690, "", "=q3=Incarnadine Scarlet Spaulders", "=ds=#s3#, #a2#", "", "20%" },
				{ 21, 81688, "", "=q3=Dashing Strike Treads", "=ds=#s12#, #a2#", "", "20%" },
				{ 22, 81578, "", "=q3=Crown of Holy Flame", "=ds=#s1#, #a4#", "", "20%" },
				{ 23, 81687, "", "=q3=Waistplate of Imminent Resurrection", "=ds=#s10#, #a4#", "", "20%" },
				{ 24, 81562, "", "=q3=Triune Signet", "=ds=#s13#", "", "20%" },
				{ 25, 81265, "", "=q3=Flashing Steel Talisman", "=ds=#s14#", "", "20%" },
				{ 26, 81577, "", "=q3=Lightbreaker Greatsword", "=ds=#h2#, #w10#", "", "20%" },
				{ 27, 81691, "", "=q3=Greatstaff of Righteousness", "=ds=#w9#", "", "20%" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("High Inquisitor Whitemane", 674),
			module = moduleName, instance = "ScarletMonastery",
		};
	};

		---------------------
		--- Heart of Fear ---
		---------------------

	AtlasLoot_Data["HoFZorlok"] = {
		["RaidFinder"] = {
			{
				{ 1, 86812, "", "=q4=Hisek's Chrysanthemum Cape", "=ds=#s4#" },
				{ 2, 86815, "", "=q4=Attenuating Bracers", "=ds=#s8#, #a1#" },
				{ 3, 86819, "", "=q4=Gloves of Grasping Claws", "=ds=#s9#, #a1#" },
				{ 4, 89953, "", "=q4=Scent-Soaked Sandals", "=ds=#s12#, #a1#" },
				{ 5, 86817, "", "=q4=Gauntlets of Undesired Gifts", "=ds=#s9#, #a2#" },
				{ 6, 86811, "", "=q4=Boots of the Still Breath", "=ds=#s12#, #a2#" },
				{ 7, 86818, "", "=q4=Mail of Screaming Secrets", "=ds=#s5#, #a3#" },
				{ 8, 87823, "", "=q4=Zor'lok's Fizzing Chestguard", "=ds=#s5#, #a3#" },
				{ 9, 86816, "", "=q4=Chestplate of the Forbidden Tower", "=ds=#s5#, #a4#" },
				{ 10, 89954, "", "=q4=Warbelt of Sealed Pods", "=ds=#s10#, #a4#" },
				{ 11, 86854, "", "=q4=Articulated Legplates", "=ds=#s11#, #a4#" },
				{ 16, 89952, "", "=q4=Pheromone-Coated Choker", "=ds=#s2#" },
				{ 17, 86814, "", "=q4=Fragment of Fear Made Flesh", "=ds=#s13#" },
				{ 18, 86813, "", "=q4=Vizier's Ruby Signet", "=ds=#s13#" },
				{ 20, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86154, "", "=q4=Hisek's Chrysanthemum Cape", "=ds=#s4#" },
				{ 2, 86157, "", "=q4=Attenuating Bracers", "=ds=#s8#, #a1#" },
				{ 3, 86161, "", "=q4=Gloves of Grasping Claws", "=ds=#s9#, #a1#" },
				{ 4, 89829, "", "=q4=Scent-Soaked Sandals", "=ds=#s12#, #a1#" },
				{ 5, 86159, "", "=q4=Gauntlets of Undesired Gifts", "=ds=#s9#, #a2#" },
				{ 6, 86153, "", "=q4=Boots of the Still Breath", "=ds=#s12#, #a2#" },
				{ 7, 86160, "", "=q4=Mail of Screaming Secrets", "=ds=#s5#, #a3#" },
				{ 8, 87824, "", "=q4=Zor'lok's Fizzing Chestguard", "=ds=#s5#, #a3#" },
				{ 9, 86158, "", "=q4=Chestplate of the Forbidden Tower", "=ds=#s5#, #a4#" },
				{ 10, 89826, "", "=q4=Warbelt of Sealed Pods", "=ds=#s10#, #a4#" },
				{ 11, 86203, "", "=q4=Articulated Legplates", "=ds=#s11#, #a4#" },
				{ 16, 89827, "", "=q4=Pheromone-Coated Choker", "=ds=#s2#" },
				{ 17, 86156, "", "=q4=Fragment of Fear Made Flesh", "=ds=#s13#" },
				{ 18, 86155, "", "=q4=Vizier's Ruby Signet", "=ds=#s13#" },
				{ 20, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 86945, "", "=q4=Hisek's Chrysanthemum Cape", "=ds=#s4#" },
				{ 2, 86948, "", "=q4=Attenuating Bracers", "=ds=#s8#, #a1#" },
				{ 3, 86947, "", "=q4=Gloves of Grasping Claws", "=ds=#s9#, #a1#" },
				{ 4, 89918, "", "=q4=Scent-Soaked Sandals", "=ds=#s12#, #a1#" },
				{ 5, 86950, "", "=q4=Gauntlets of Undesired Gifts", "=ds=#s9#, #a2#" },
				{ 6, 86943, "", "=q4=Boots of the Still Breath", "=ds=#s12#, #a2#" },
				{ 7, 86951, "", "=q4=Mail of Screaming Secrets", "=ds=#s5#, #a3#" },
				{ 8, 87822, "", "=q4=Zor'lok's Fizzing Chestguard", "=ds=#s5#, #a3#" },
				{ 9, 86952, "", "=q4=Chestplate of the Forbidden Tower", "=ds=#s5#, #a4#" },
				{ 10, 89919, "", "=q4=Warbelt of Sealed Pods", "=ds=#s10#, #a4#" },
				{ 11, 86944, "", "=q4=Articulated Legplates", "=ds=#s11#, #a4#" },
				{ 16, 89917, "", "=q4=Pheromone-Coated Choker", "=ds=#s2#" },
				{ 17, 86949, "", "=q4=Fragment of Fear Made Flesh", "=ds=#s13#" },
				{ 18, 86946, "", "=q4=Vizier's Ruby Signet", "=ds=#s13#" },
				{ 20, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Imperial Vizier Zor'lok", 745),
			module = moduleName, instance = "HeartofFear",
		};
	};

	AtlasLoot_Data["HoFTayak"] = {
		["RaidFinder"] = {
			{
				{ 1, 86827, "", "=q4=Drape of Gathering Clouds", "=ds=#s4#" },
				{ 2, 86828, "", "=q4=Twisting Wind Bracers", "=ds=#s8#, #a1#" },
				{ 3, 86825, "", "=q4=Boots of the Blowing Wind", "=ds=#s12#, #a1#" },
				{ 4, 89957, "", "=q4=Hood of Stilled Winds", "=ds=#s1#, #a2#" },
				{ 5, 86821, "", "=q4=Bracers of Unseen Strikes", "=ds=#s8#, #a2#" },
				{ 6, 86826, "", "=q4=Bracers of Tempestuous Fury", "=ds=#s8#, #a3#" },
				{ 7, 90739, "", "=q4=Kaz'tik's Stormseizer Gauntlets", "=ds=#s9#, #a3#" },
				{ 8, 89955, "", "=q4=Sword Dancer's Leggings", "=ds=#s11#, #a3#" },
				{ 9, 89956, "", "=q4=Pauldrons of the Broken Blade", "=ds=#s3#, #a4#" },
				{ 10, 86823, "", "=q4=Windblade Talons", "=ds=#s9#, #a4#" },
				{ 11, 86822, "", "=q4=Waistplate of Overwhelming Assault", "=ds=#s10#, #a4#" },
				{ 16, 86824, "", "=q4=Choker of the Unleashed Storm", "=ds=#s2#" },
				{ 17, 86820, "", "=q4=Ring of the Bladed Tempest", "=ds=#s13#" },
				{ 19, 86829, "", "=q4=Tornado-Summoning Censer", "=ds=#s15#" },
				{ 21, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86169, "", "=q4=Drape of Gathering Clouds", "=ds=#s4#" },
				{ 2, 86170, "", "=q4=Twisting Wind Bracers", "=ds=#s8#, #a1#" },
				{ 3, 86167, "", "=q4=Boots of the Blowing Wind", "=ds=#s12#, #a1#" },
				{ 4, 89831, "", "=q4=Hood of Stilled Winds", "=ds=#s1#, #a2#" },
				{ 5, 86163, "", "=q4=Bracers of Unseen Strikes", "=ds=#s8#, #a2#" },
				{ 6, 86168, "", "=q4=Bracers of Tempestuous Fury", "=ds=#s8#, #a3#" },
				{ 7, 90738, "", "=q4=Kaz'tik's Stormseizer Gauntlets", "=ds=#s9#, #a3#" },
				{ 8, 89830, "", "=q4=Sword Dancer's Leggings", "=ds=#s11#, #a3#" },
				{ 9, 89828, "", "=q4=Pauldrons of the Broken Blade", "=ds=#s3#, #a4#" },
				{ 10, 86165, "", "=q4=Windblade Talons", "=ds=#s9#, #a4#" },
				{ 11, 86164, "", "=q4=Waistplate of Overwhelming Assault", "=ds=#s10#, #a4#" },
				{ 16, 86166, "", "=q4=Choker of the Unleashed Storm", "=ds=#s2#" },
				{ 17, 86162, "", "=q4=Ring of the Bladed Tempest", "=ds=#s13#" },
				{ 19, 86171, "", "=q4=Tornado-Summoning Censer", "=ds=#s15#" },
				{ 21, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 86961, "", "=q4=Drape of Gathering Clouds", "=ds=#s4#" },
				{ 2, 86958, "", "=q4=Twisting Wind Bracers", "=ds=#s8#, #a1#" },
				{ 3, 86959, "", "=q4=Boots of the Blowing Wind", "=ds=#s12#, #a1#" },
				{ 4, 89922, "", "=q4=Hood of Stilled Winds", "=ds=#s1#, #a2#" },
				{ 5, 86954, "", "=q4=Bracers of Unseen Strikes", "=ds=#s8#, #a2#" },
				{ 6, 86962, "", "=q4=Bracers of Tempestuous Fury", "=ds=#s8#, #a3#" },
				{ 7, 90740, "", "=q4=Kaz'tik's Stormseizer Gauntlets", "=ds=#s9#, #a3#" },
				{ 8, 89920, "", "=q4=Sword Dancer's Leggings", "=ds=#s11#, #a3#" },
				{ 9, 89921, "", "=q4=Pauldrons of the Broken Blade", "=ds=#s3#, #a4#" },
				{ 10, 86956, "", "=q4=Windblade Talons", "=ds=#s9#, #a4#" },
				{ 11, 86955, "", "=q4=Waistplate of Overwhelming Assault", "=ds=#s10#, #a4#" },
				{ 16, 86953, "", "=q4=Choker of the Unleashed Storm", "=ds=#s2#" },
				{ 17, 86957, "", "=q4=Ring of the Bladed Tempest", "=ds=#s13#" },
				{ 19, 86960, "", "=q4=Tornado-Summoning Censer", "=ds=#s15#" },
				{ 21, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Blade Lord Ta'yak", 744),
			module = moduleName, instance = "HeartofFear",
		};
	};

	AtlasLoot_Data["HoFGaralon"] = {
		["RaidFinder"] = {
			{
				{ 1, 86831, "", "=q4=Legbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 86840, "", "=q4=Stormwake Mistcloak", "=ds=#s4#" },
				{ 3, 86839, "", "=q4=Xaril's Hood of Intoxicating Vapors", "=ds=#s1#, #a1#" },
				{ 4, 89959, "", "=q4=Shoulders of Foaming Fluids", "=ds=#s3#, #a1#" },
				{ 5, 86836, "", "=q4=Sandals of the Unbidden", "=ds=#s12#, #a1#" },
				{ 6, 86838, "", "=q4=Robes of Eighty Lights", "=ds=#s5#, #a2#" },
				{ 7, 86834, "", "=q4=Bonebreaker Gauntlets", "=ds=#s9#, #a2#" },
				{ 8, 89960, "", "=q4=Vestments of Steaming Ichor", "=ds=#s5#, #a3#" },
				{ 9, 86833, "", "=q4=Grips of the Leviathan", "=ds=#s9#, #a3#" },
				{ 10, 86832, "", "=q4=Garalon's Hollow Skull", "=ds=#s1#, #a4#" },
				{ 11, 89958, "", "=q4=Garalon's Graven Carapace", "=ds=#s5#, #a4#" },
				{ 12, 86837, "", "=q4=Grasps of Panic", "=ds=#s9#, #a4#" },
				{ 16, 86835, "", "=q4=Necklace of Congealed Weaknesses", "=ds=#s2#" },
				{ 17, 86830, "", "=q4=Ring of the Shattered Shell", "=ds=#s13#" },
				{ 19, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86173, "", "=q4=Legbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 86182, "", "=q4=Stormwake Mistcloak", "=ds=#s4#" },
				{ 3, 86181, "", "=q4=Xaril's Hood of Intoxicating Vapors", "=ds=#s1#, #a1#" },
				{ 4, 89833, "", "=q4=Shoulders of Foaming Fluids", "=ds=#s3#, #a1#" },
				{ 5, 86178, "", "=q4=Sandals of the Unbidden", "=ds=#s12#, #a1#" },
				{ 6, 86180, "", "=q4=Robes of Eighty Lights", "=ds=#s5#, #a2#" },
				{ 7, 86176, "", "=q4=Bonebreaker Gauntlets", "=ds=#s9#, #a2#" },
				{ 8, 89834, "", "=q4=Vestments of Steaming Ichor", "=ds=#s5#, #a3#" },
				{ 9, 86175, "", "=q4=Grips of the Leviathan", "=ds=#s9#, #a3#" },
				{ 10, 86174, "", "=q4=Garalon's Hollow Skull", "=ds=#s1#, #a4#" },
				{ 11, 89832, "", "=q4=Garalon's Graven Carapace", "=ds=#s5#, #a4#" },
				{ 12, 86179, "", "=q4=Grasps of Panic", "=ds=#s9#, #a4#" },
				{ 16, 86177, "", "=q4=Necklace of Congealed Weaknesses", "=ds=#s2#" },
				{ 17, 86172, "", "=q4=Ring of the Shattered Shell", "=ds=#s13#" },
				{ 19, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 86963, "", "=q4=Legbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 86971, "", "=q4=Stormwake Mistcloak", "=ds=#s4#" },
				{ 3, 86970, "", "=q4=Xaril's Hood of Intoxicating Vapors", "=ds=#s1#, #a1#" },
				{ 4, 89924, "", "=q4=Shoulders of Foaming Fluids", "=ds=#s3#, #a1#" },
				{ 5, 86969, "", "=q4=Sandals of the Unbidden", "=ds=#s12#, #a1#" },
				{ 6, 86972, "", "=q4=Robes of Eighty Lights", "=ds=#s5#, #a2#" },
				{ 7, 86964, "", "=q4=Bonebreaker Gauntlets", "=ds=#s9#, #a2#" },
				{ 8, 89925, "", "=q4=Vestments of Steaming Ichor", "=ds=#s5#, #a3#" },
				{ 9, 86965, "", "=q4=Grips of the Leviathan", "=ds=#s9#, #a3#" },
				{ 10, 86966, "", "=q4=Garalon's Hollow Skull", "=ds=#s1#, #a4#" },
				{ 11, 89923, "", "=q4=Garalon's Graven Carapace", "=ds=#s5#, #a4#" },
				{ 12, 86973, "", "=q4=Grasps of Panic", "=ds=#s9#, #a4#" },
				{ 16, 86967, "", "=q4=Necklace of Congealed Weaknesses", "=ds=#s2#" },
				{ 17, 86968, "", "=q4=Ring of the Shattered Shell", "=ds=#s13#" },
				{ 19, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Garalon", 713),
			module = moduleName, instance = "HeartofFear",
		};
	};

	AtlasLoot_Data["HoFMeljarak"] = {
		["RaidFinder"] = {
			{
				{ 1, 86853, "", "=q4=Cloak of Raining Blades", "=ds=#s4#" },
				{ 2, 86911, "", "=q4=Robes of Torn Nightmares", "=ds=#s5#, #a1#" },
				{ 3, 86912, "", "=q4=Clutches of Dying Hope", "=ds=#s9#, #a2#" },
				{ 4, 86855, "", "=q4=Wingslasher Pauldrons", "=ds=#s3#, #a3#" },
				{ 5, 86852, "", "=q4=Impaling Treads", "=ds=#s12#, #a4#" },
				{ 16, 89271, "", "=q4=Gauntlets of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89272, "", "=q4=Gauntlets of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89270, "", "=q4=Gauntlets of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86856, "", "=q4=Korven's Amber-Sealed Beetle", "=ds=#s2#" },
				{ 21, 86851, "", "=q4=Painful Thorned Ring", "=ds=#s13#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86202, "", "=q4=Cloak of Raining Blades", "=ds=#s4#" },
				{ 2, 86513, "", "=q4=Robes of Torn Nightmares", "=ds=#s5#, #a1#" },
				{ 3, 86514, "", "=q4=Clutches of Dying Hope", "=ds=#s9#, #a2#" },
				{ 4, 86204, "", "=q4=Wingslasher Pauldrons", "=ds=#s3#, #a3#" },
				{ 5, 86201, "", "=q4=Impaling Treads", "=ds=#s12#, #a4#" },
				{ 16, 89240, "", "=q4=Gauntlets of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89241, "", "=q4=Gauntlets of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89242, "", "=q4=Gauntlets of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86205, "", "=q4=Korven's Amber-Sealed Beetle", "=ds=#s2#" },
				{ 21, 86200, "", "=q4=Painful Thorned Ring", "=ds=#s13#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 86980, "", "=q4=Cloak of Raining Blades", "=ds=#s4#" },
				{ 2, 86975, "", "=q4=Robes of Torn Nightmares", "=ds=#s5#, #a1#" },
				{ 3, 86977, "", "=q4=Clutches of Dying Hope", "=ds=#s9#, #a2#" },
				{ 4, 86978, "", "=q4=Wingslasher Pauldrons", "=ds=#s3#, #a3#" },
				{ 5, 86979, "", "=q4=Impaling Treads", "=ds=#s12#, #a4#" },
				{ 16, 89256, "", "=q4=Gauntlets of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89257, "", "=q4=Gauntlets of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89255, "", "=q4=Gauntlets of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86976, "", "=q4=Korven's Amber-Sealed Beetle", "=ds=#s2#" },
				{ 21, 86974, "", "=q4=Painful Thorned Ring", "=ds=#s13#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741),
			module = moduleName, instance = "HeartofFear",
		};
	};

	AtlasLoot_Data["HoFUnsok"] = {
		["RaidFinder"] = {
			{
				{ 1, 86857, "", "=q4=Belt of Malleable Amber", "=ds=#s10#, #a1#" },
				{ 2, 86859, "", "=q4=Treads of Deadly Secretions", "=ds=#s12#, #a2#" },
				{ 3, 86861, "", "=q4=Monstrous Stompers", "=ds=#s12#, #a3#" },
				{ 4, 86860, "", "=q4=Shoulderpads of Misshapen Life", "=ds=#s3#, #a4#" },
				{ 6, 86858, "", "=q4=Seal of the Profane", "=ds=#s13#" },
				{ 16, 89268, "", "=q4=Leggings of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89269, "", "=q4=Leggings of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89267, "", "=q4=Leggings of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86862, "", "=q4=Un'sok's Amber Scalpel", "=ds=#h1#, #w4#" },
				{ 21, 86863, "", "=q4=Scimitar of Seven Stars", "=ds=#h1#, #w10#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86210, "", "=q4=Belt of Malleable Amber", "=ds=#s10#, #a1#" },
				{ 2, 86212, "", "=q4=Treads of Deadly Secretions", "=ds=#s12#, #a2#" },
				{ 3, 86214, "", "=q4=Monstrous Stompers", "=ds=#s12#, #a3#" },
				{ 4, 86213, "", "=q4=Shoulderpads of Misshapen Life", "=ds=#s3#, #a4#" },
				{ 6, 86211, "", "=q4=Seal of the Profane", "=ds=#s13#" },
				{ 16, 89243, "", "=q4=Leggings of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89244, "", "=q4=Leggings of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89245, "", "=q4=Leggings of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86217, "", "=q4=Un'sok's Amber Scalpel", "=ds=#h1#, #w4#" },
				{ 21, 86219, "", "=q4=Scimitar of Seven Stars", "=ds=#h1#, #w10#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 86981, "", "=q4=Belt of Malleable Amber", "=ds=#s10#, #a1#" },
				{ 2, 86984, "", "=q4=Treads of Deadly Secretions", "=ds=#s12#, #a2#" },
				{ 3, 86985, "", "=q4=Monstrous Stompers", "=ds=#s12#, #a3#" },
				{ 4, 86986, "", "=q4=Shoulderpads of Misshapen Life", "=ds=#s3#, #a4#" },
				{ 6, 86982, "", "=q4=Seal of the Profane", "=ds=#s13#" },
				{ 16, 89253, "", "=q4=Leggings of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89254, "", "=q4=Leggings of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89252, "", "=q4=Leggings of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86983, "", "=q4=Un'sok's Amber Scalpel", "=ds=#h1#, #w4#" },
				{ 21, 86987, "", "=q4=Scimitar of Seven Stars", "=ds=#h1#, #w10#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737),
			module = moduleName, instance = "HeartofFear",
		};
	};

	AtlasLoot_Data["HoFShekzeer"] = {
		["RaidFinder"] = {
			{
				{ 1, 86867, "", "=q4=Leggings of Shadow Infestation", "=ds=#s11#, #a1#" },
				{ 2, 89961, "", "=q4=Shadow Heart Spaulders", "=ds=#s3#, #a2#" },
				{ 3, 86866, "", "=q4=Crown of the Doomed Empress", "=ds=#s1#, #a3#" },
				{ 4, 89962, "", "=q4=Hood of Dark Dreams", "=ds=#s1#, #a3#" },
				{ 5, 89963, "", "=q4=Legplates of Regal Reinforcement", "=ds=#s11#, #a4#" },
				{ 7, 86864, "", "=q4=Claws of Shek'zeer", "=ds=#h1#, #w13#" },
				{ 8, 86865, "", "=q4=Kri'tak, Imperial Scepter of the Swarm", "=ds=#h1#, #w6#" },
				{ 16, 89265, "", "=q4=Chest of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89266, "", "=q4=Chest of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89264, "", "=q4=Chest of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86229, "", "=q4=Leggings of Shadow Infestation", "=ds=#s11#, #a1#" },
				{ 2, 89836, "", "=q4=Shadow Heart Spaulders", "=ds=#s3#, #a2#" },
				{ 3, 86228, "", "=q4=Crown of the Doomed Empress", "=ds=#s1#, #a3#" },
				{ 4, 89835, "", "=q4=Hood of Dark Dreams", "=ds=#s1#, #a3#" },
				{ 5, 89837, "", "=q4=Legplates of Regal Reinforcement", "=ds=#s11#, #a4#" },
				{ 7, 86226, "", "=q4=Claws of Shek'zeer", "=ds=#h1#, #w13#" },
				{ 8, 86227, "", "=q4=Kri'tak, Imperial Scepter of the Swarm", "=ds=#h1#, #w6#" },
				{ 16, 89237, "", "=q4=Chest of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89238, "", "=q4=Chest of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89239, "", "=q4=Chest of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 86989, "", "=q4=Leggings of Shadow Infestation", "=ds=#s11#, #a1#" },
				{ 2, 89926, "", "=q4=Shadow Heart Spaulders", "=ds=#s3#, #a2#" },
				{ 3, 86991, "", "=q4=Crown of the Doomed Empress", "=ds=#s1#, #a3#" },
				{ 4, 89927, "", "=q4=Hood of Dark Dreams", "=ds=#s1#, #a3#" },
				{ 5, 89928, "", "=q4=Legplates of Regal Reinforcement", "=ds=#s11#, #a4#" },
				{ 7, 86988, "", "=q4=Claws of Shek'zeer", "=ds=#h1#, #w13#" },
				{ 8, 86990, "", "=q4=Kri'tak, Imperial Scepter of the Swarm", "=ds=#h1#, #w6#" },
				{ 16, 89250, "", "=q4=Chest of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89251, "", "=q4=Chest of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89249, "", "=q4=Chest of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743),
			module = moduleName, instance = "HeartofFear",
		};
	};

	AtlasLoot_Data["HoFTrash"] = {
		["RaidFinder"] = {
			{
				{ 1, 95619, "", "=q3=Amber Encased Treasure Pouch", "=ds=#m20#" },
				{ 2, 86850, "", "=q4=Darting Damselfly Cuffs", "=ds=#s8#, #a1#" },
				{ 3, 86844, "", "=q4=Gleaming Moth Cuffs", "=ds=#s8#, #a1#" },
				{ 4, 86841, "", "=q4=Shining Cicada Bracers", "=ds=#s8#, #a1#" },
				{ 5, 86845, "", "=q4=Pearlescent Butterfly Wristbands", "=ds=#s8#, #a2#" },
				{ 6, 86843, "", "=q4=Smooth Beetle Wristbands", "=ds=#s8#, #a2#" },
				{ 7, 86847, "", "=q4=Jagged Hornet Bracers", "=ds=#s8#, #a3#" },
				{ 8, 86842, "", "=q4=Luminescent Firefly Wristguards", "=ds=#s8#, #a3#" },
				{ 9, 86846, "", "=q4=Inlaid Cricket Bracers", "=ds=#s8#, #a4#" },
				{ 10, 86849, "", "=q4=Plated Locust Bracers", "=ds=#s8#, #a4#" },
				{ 11, 86848, "", "=q4=Serrated Wasp Bracers", "=ds=#s8#, #a4#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86192, "", "=q4=Darting Damselfly Cuffs", "=ds=#s8#, #a1#" },
				{ 2, 86186, "", "=q4=Gleaming Moth Cuffs", "=ds=#s8#, #a1#" },
				{ 3, 86183, "", "=q4=Shining Cicada Bracers", "=ds=#s8#, #a1#" },
				{ 4, 86187, "", "=q4=Pearlescent Butterfly Wristbands", "=ds=#s8#, #a2#" },
				{ 5, 86185, "", "=q4=Smooth Beetle Wristbands", "=ds=#s8#, #a2#" },
				{ 6, 86189, "", "=q4=Jagged Hornet Bracers", "=ds=#s8#, #a3#" },
				{ 7, 86184, "", "=q4=Luminescent Firefly Wristguards", "=ds=#s8#, #a3#" },
				{ 8, 86188, "", "=q4=Inlaid Cricket Bracers", "=ds=#s8#, #a4#" },
				{ 9, 86191, "", "=q4=Plated Locust Bracers", "=ds=#s8#, #a4#" },
				{ 10, 86190, "", "=q4=Serrated Wasp Bracers", "=ds=#s8#, #a4#" },
			};
		};
		info = {
			name = "trash",
			module = moduleName, instance = "HeartofFear",
		};
	};

		------------------------
		--- Mogu'Shan Vaults ---
		------------------------

	AtlasLoot_Data["MSVTheStoneGuard"] = {
		["RaidFinder"] = {
			{
				{ 1, 86748, "", "=q4=Cape of Three Lanterns", "=ds=#s4#" },
				{ 2, 89966, "", "=q4=Claws of Amethyst", "=ds=#s9#, #a1#" },
				{ 3, 89965, "", "=q4=Ruby-Linked Girdle", "=ds=#s10#, #a1#" },
				{ 4, 86747, "", "=q4=Jade Dust Leggings", "=ds=#s11#, #a1#" },
				{ 5, 86746, "", "=q4=Stonebound Cinch", "=ds=#s10#, #a2#" },
				{ 6, 86743, "", "=q4=Stoneflesh Leggings", "=ds=#s11#, #a2#" },
				{ 7, 86745, "", "=q4=Sixteen-Fanged Crown", "=ds=#s1#, #a3#" },
				{ 8, 89964, "", "=q4=Stonefang Chestguard", "=ds=#s5#, #a3#" },
				{ 9, 86740, "", "=q4=Stonemaw Armguards", "=ds=#s8#, #a3#" },
				{ 10, 86793, "", "=q4=Star-Stealer Waistguard", "=ds=#s10#, #a4#" },
				{ 11, 86744, "", "=q4=Heavenly Jade Greatboots", "=ds=#s12#, #a4#" },
				{ 12, 86742, "", "=q4=Jasper Clawfeet", "=ds=#s12#, #a4#" },
				{ 16, 86739, "", "=q4=Beads of the Mogu'shi", "=ds=#s2#" },
				{ 18, 86741, "", "=q4=Dagger of the Seven Stars", "=ds=#h1#, #w4#" },
				{ 20, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 21, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 85979, "", "=q4=Cape of Three Lanterns", "=ds=#s4#" },
				{ 2, 89768, "", "=q4=Claws of Amethyst", "=ds=#s9#, #a1#" },
				{ 3, 89767, "", "=q4=Ruby-Linked Girdle", "=ds=#s10#, #a1#" },
				{ 4, 85978, "", "=q4=Jade Dust Leggings", "=ds=#s11#, #a1#" },
				{ 5, 85977, "", "=q4=Stonebound Cinch", "=ds=#s10#, #a2#" },
				{ 6, 85926, "", "=q4=Stoneflesh Leggings", "=ds=#s11#, #a2#" },
				{ 7, 85976, "", "=q4=Sixteen-Fanged Crown", "=ds=#s1#, #a3#" },
				{ 8, 89766, "", "=q4=Stonefang Chestguard", "=ds=#s5#, #a3#" },
				{ 9, 85923, "", "=q4=Stonemaw Armguards", "=ds=#s8#, #a3#" },
				{ 10, 86134, "", "=q4=Star-Stealer Waistguard", "=ds=#s10#, #a4#" },
				{ 11, 85975, "", "=q4=Heavenly Jade Greatboots", "=ds=#s12#, #a4#" },
				{ 12, 85925, "", "=q4=Jasper Clawfeet", "=ds=#s12#, #a4#" },
				{ 16, 85922, "", "=q4=Beads of the Mogu'shi", "=ds=#s2#" },
				{ 18, 85924, "", "=q4=Dagger of the Seven Stars", "=ds=#h1#, #w4#" },
				{ 20, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 21, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87018, "", "=q4=Cape of Three Lanterns", "=ds=#s4#" },
				{ 2, 89931, "", "=q4=Claws of Amethyst", "=ds=#s9#, #a1#" },
				{ 3, 89930, "", "=q4=Ruby-Linked Girdle", "=ds=#s10#, #a1#" },
				{ 4, 87017, "", "=q4=Jade Dust Leggings", "=ds=#s11#, #a1#" },
				{ 5, 87019, "", "=q4=Stonebound Cinch", "=ds=#s10#, #a2#" },
				{ 6, 87013, "", "=q4=Stoneflesh Leggings", "=ds=#s11#, #a2#" },
				{ 7, 87020, "", "=q4=Sixteen-Fanged Crown", "=ds=#s1#, #a3#" },
				{ 8, 89926, "", "=q4=Stonefang Chestguard", "=ds=#s5#, #a3#" },
				{ 9, 87014, "", "=q4=Stonemaw Armguards", "=ds=#s8#, #a3#" },
				{ 10, 87060, "", "=q4=Star-Stealer Waistguard", "=ds=#s10#, #a4#" },
				{ 11, 87021, "", "=q4=Heavenly Jade Greatboots", "=ds=#s12#, #a4#" },
				{ 12, 87015, "", "=q4=Jasper Clawfeet", "=ds=#s12#, #a4#" },
				{ 16, 87016, "", "=q4=Beads of the Mogu'shi", "=ds=#s2#" },
				{ 18, 87012, "", "=q4=Dagger of the Seven Stars", "=ds=#h1#, #w4#" },
				{ 20, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 21, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("The Stone Guard", 679),
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["MSVFeng"] = {
		["RaidFinder"] = {
			{
				{ 1, 86782, "", "=q4=Arrow Breaking Windcloak", "=ds=#s4#" },
				{ 2, 86753, "", "=q4=Cloak of Peacock Feathers", "=ds=#s4#" },
				{ 3, 86758, "", "=q4=Imperial Ghostbinder's Robes", "=ds=#s5#, #a1#" },
				{ 4, 86757, "", "=q4=Hood of Cursed Dreams", "=ds=#s1#, #a2#" },
				{ 5, 86750, "", "=q4=Tomb Raider's Girdle", "=ds=#s10#, #a2#" },
				{ 6, 86755, "", "=q4=Chain of Shadow", "=ds=#s10#, #a3#" },
				{ 7, 86749, "", "=q4=Wildfire Worldwalkers", "=ds=#s12#, #a3#" },
				{ 8, 86752, "", "=q4=Nullification Greathelm", "=ds=#s1#, #a4#" },
				{ 9, 86751, "", "=q4=Bracers of Six Oxen", "=ds=#s8#, #a4#" },
				{ 10, 86756, "", "=q4=Legplates of Sagacious Shadows", "=ds=#s11#, #a4#" },
				{ 16, 86754, "", "=q4=Amulet of Seven Curses", "=ds=#s2#" },
				{ 17, 89968, "", "=q4=Feng's Ring of Dreams", "=ds=#s13#" },
				{ 18, 89967, "", "=q4=Feng's Seal of Binding", "=ds=#s13#" },
				{ 20, 89426, "", "=q4=Fan of Fiery Winds", "=ds=#s15#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86082, "", "=q4=Arrow Breaking Windcloak", "=ds=#s4#" },
				{ 2, 85985, "", "=q4=Cloak of Peacock Feathers", "=ds=#s4#" },
				{ 3, 85990, "", "=q4=Imperial Ghostbinder's Robes", "=ds=#s5#, #a1#" },
				{ 4, 85989, "", "=q4=Hood of Cursed Dreams", "=ds=#s1#, #a2#" },
				{ 5, 85982, "", "=q4=Tomb Raider's Girdle", "=ds=#s10#, #a2#" },
				{ 6, 85987, "", "=q4=Chain of Shadow", "=ds=#s10#, #a3#" },
				{ 7, 85980, "", "=q4=Wildfire Worldwalkers", "=ds=#s12#, #a3#" },
				{ 8, 85984, "", "=q4=Nullification Greathelm", "=ds=#s1#, #a4#" },
				{ 9, 85983, "", "=q4=Bracers of Six Oxen", "=ds=#s8#, #a4#" },
				{ 10, 85988, "", "=q4=Legplates of Sagacious Shadows", "=ds=#s11#, #a4#" },
				{ 16, 85986, "", "=q4=Amulet of Seven Curses", "=ds=#s2#" },
				{ 17, 89803, "", "=q4=Feng's Ring of Dreams", "=ds=#s13#" },
				{ 18, 89802, "", "=q4=Feng's Seal of Binding", "=ds=#s13#" },
				{ 20, 89424, "", "=q4=Fan of Fiery Winds", "=ds=#s15#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87044, "", "=q4=Arrow Breaking Windcloak", "=ds=#s4#" },
				{ 2, 87026, "", "=q4=Cloak of Peacock Feathers", "=ds=#s4#" },
				{ 3, 87027, "", "=q4=Imperial Ghostbinder's Robes", "=ds=#s5#, #a1#" },
				{ 4, 87029, "", "=q4=Hood of Cursed Dreams", "=ds=#s1#, #a2#" },
				{ 5, 87022, "", "=q4=Tomb Raider's Girdle", "=ds=#s10#, #a2#" },
				{ 6, 87030, "", "=q4=Chain of Shadow", "=ds=#s10#, #a3#" },
				{ 7, 87023, "", "=q4=Wildfire Worldwalkers", "=ds=#s12#, #a3#" },
				{ 8, 87024, "", "=q4=Nullification Greathelm", "=ds=#s1#, #a4#" },
				{ 9, 87025, "", "=q4=Bracers of Six Oxen", "=ds=#s8#, #a4#" },
				{ 10, 87031, "", "=q4=Legplates of Sagacious Shadows", "=ds=#s11#, #a4#" },
				{ 16, 87028, "", "=q4=Amulet of Seven Curses", "=ds=#s2#" },
				{ 17, 89933, "", "=q4=Feng's Ring of Dreams", "=ds=#s13#" },
				{ 18, 89932, "", "=q4=Feng's Seal of Binding", "=ds=#s13#" },
				{ 20, 89425, "", "=q4=Fan of Fiery Winds", "=ds=#s15#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Feng the Accursed", 689),
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["MSVGarajal"] = {
		["RaidFinder"] = {
			{
				{ 1, 86770, "", "=q4=Shadowsummoner Spaulders", "=ds=#s3#, #a1#" },
				{ 2, 86765, "", "=q4=Sandals of the Severed Soul", "=ds=#s12#, #a1#" },
				{ 3, 86763, "", "=q4=Netherrealm Shoulderpads", "=ds=#s3#, #a2#" },
				{ 4, 86768, "", "=q4=Spaulders of the Divided Mind", "=ds=#s3#, #a2#" },
				{ 5, 86761, "", "=q4=Fetters of Death", "=ds=#s10#, #a3#" },
				{ 6, 86769, "", "=q4=Leggings of Imprisoned Will", "=ds=#s11#, #a3#" },
				{ 7, 86766, "", "=q4=Bindings of Ancient Spirits", "=ds=#s8#, #a4#" },
				{ 8, 89969, "", "=q4=Bonded Soul Bracers", "=ds=#s8#, #a4#" },
				{ 9, 86760, "", "=q4=Sollerets of Spirit Splitting", "=ds=#s12#, #a4#" },
				{ 16, 86759, "", "=q4=Soulgrasp Choker", "=ds=#s2#" },
				{ 17, 86767, "", "=q4=Circuit of the Frail Soul", "=ds=#s13#" },
				{ 19, 86762, "", "=q4=Gara'kal, Fist of the Spiritbinder", "=ds=#h1#, #w13#" },
				{ 20, 86764, "", "=q4=Eye of the Ancient Spirit", "=ds=#w8#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86041, "", "=q4=Shadowsummoner Spaulders", "=ds=#s3#, #a1#" },
				{ 2, 85997, "", "=q4=Sandals of the Severed Soul", "=ds=#s12#, #a1#" },
				{ 3, 85995, "", "=q4=Netherrealm Shoulderpads", "=ds=#s3#, #a2#" },
				{ 4, 86039, "", "=q4=Spaulders of the Divided Mind", "=ds=#s3#, #a2#" },
				{ 5, 85993, "", "=q4=Fetters of Death", "=ds=#s10#, #a3#" },
				{ 6, 86040, "", "=q4=Leggings of Imprisoned Will", "=ds=#s11#, #a3#" },
				{ 7, 86027, "", "=q4=Bindings of Ancient Spirits", "=ds=#s8#, #a4#" },
				{ 8, 89817, "", "=q4=Bonded Soul Bracers", "=ds=#s8#, #a4#" },
				{ 9, 85992, "", "=q4=Sollerets of Spirit Splitting", "=ds=#s12#, #a4#" },
				{ 16, 85991, "", "=q4=Soulgrasp Choker", "=ds=#s2#" },
				{ 17, 86038, "", "=q4=Circuit of the Frail Soul", "=ds=#s13#" },
				{ 19, 85994, "", "=q4=Gara'kal, Fist of the Spiritbinder", "=ds=#h1#, #w13#" },
				{ 20, 85996, "", "=q4=Eye of the Ancient Spirit", "=ds=#w8#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87038, "", "=q4=Shadowsummoner Spaulders", "=ds=#s3#, #a1#" },
				{ 2, 87037, "", "=q4=Sandals of the Severed Soul", "=ds=#s12#, #a1#" },
				{ 3, 87033, "", "=q4=Netherrealm Shoulderpads", "=ds=#s3#, #a2#" },
				{ 4, 87041, "", "=q4=Spaulders of the Divided Mind", "=ds=#s3#, #a2#" },
				{ 5, 87034, "", "=q4=Fetters of Death", "=ds=#s10#, #a3#" },
				{ 6, 87042, "", "=q4=Leggings of Imprisoned Will", "=ds=#s11#, #a3#" },
				{ 7, 87043, "", "=q4=Bindings of Ancient Spirits", "=ds=#s8#, #a4#" },
				{ 8, 89934, "", "=q4=Bonded Soul Bracers", "=ds=#s8#, #a4#" },
				{ 9, 87035, "", "=q4=Sollerets of Spirit Splitting", "=ds=#s12#, #a4#" },
				{ 16, 87036, "", "=q4=Soulgrasp Choker", "=ds=#s2#" },
				{ 17, 87040, "", "=q4=Circuit of the Frail Soul", "=ds=#s13#" },
				{ 19, 87032, "", "=q4=Gara'kal, Fist of the Spiritbinder", "=ds=#h1#, #w13#" },
				{ 20, 87039, "", "=q4=Eye of the Ancient Spirit", "=ds=#w8#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Gara'jal the Spiritbinder", 682),
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["MSVSpiritKings"] = {
		["RaidFinder"] = {
			{
				{ 1, 86782, "", "=q4=Arrow Breaking Windcloak", "=ds=#s4#" },
				{ 2, 89971, "", "=q4=Mindshard Drape", "=ds=#s4#" },
				{ 3, 86788, "", "=q4=Hood of Blind Eyes", "=ds=#s1#, #a1#" },
				{ 4, 86787, "", "=q4=Undying Shadow Grips", "=ds=#s9#, #a1#" },
				{ 5, 86786, "", "=q4=Bracers of Dark Thoughts", "=ds=#s8#, #a2#" },
				{ 6, 89970, "", "=q4=Bracers of Violent Meditation", "=ds=#s8#, #a2#" },
				{ 7, 86781, "", "=q4=Subetai's Pillaging Leggings", "=ds=#s11#, #a3#" },
				{ 8, 86784, "", "=q4=Meng's Treads of Insanity", "=ds=#s12#, #a3#" },
				{ 9, 86780, "", "=q4=Shoulderguards of the Unflanked", "=ds=#s3#, #a4#" },
				{ 10, 86779, "", "=q4=Breastplate of the Kings' Guard", "=ds=#s5#, #a4#" },
				{ 11, 86785, "", "=q4=Girdle of Delirious Visions", "=ds=#s10#, #a4#" },
				{ 16, 86776, "", "=q4=Amulet of the Hidden Kings", "=ds=#s2#" },
				{ 17, 86783, "", "=q4=Zian's Choker of Coalesced Shadow", "=ds=#s2#" },
				{ 19, 86777, "", "=q4=Screaming Tiger, Qiang's Unbreakable Polearm", "=ds=#w7#" },
				{ 20, 86778, "", "=q4=Steelskin, Qiang's Impervious Shield", "=ds=#w8#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86082, "", "=q4=Arrow Breaking Windcloak", "=ds=#s4#" },
				{ 2, 89819, "", "=q4=Mindshard Drape", "=ds=#s4#" },
				{ 3, 86129, "", "=q4=Hood of Blind Eyes", "=ds=#s1#, #a1#" },
				{ 4, 86128, "", "=q4=Undying Shadow Grips", "=ds=#s9#, #a1#" },
				{ 5, 86127, "", "=q4=Bracers of Dark Thoughts", "=ds=#s8#, #a2#" },
				{ 6, 89818, "", "=q4=Bracers of Violent Meditation", "=ds=#s8#, #a2#" },
				{ 7, 86081, "", "=q4=Subetai's Pillaging Leggings", "=ds=#s11#, #a3#" },
				{ 8, 86084, "", "=q4=Meng's Treads of Insanity", "=ds=#s12#, #a3#" },
				{ 9, 86080, "", "=q4=Shoulderguards of the Unflanked", "=ds=#s3#, #a4#" },
				{ 10, 86076, "", "=q4=Breastplate of the Kings' Guard", "=ds=#s5#, #a4#" },
				{ 11, 86086, "", "=q4=Girdle of Delirious Visions", "=ds=#s10#, #a4#" },
				{ 16, 86047, "", "=q4=Amulet of the Hidden Kings", "=ds=#s2#" },
				{ 17, 86083, "", "=q4=Zian's Choker of Coalesced Shadow", "=ds=#s2#" },
				{ 19, 86071, "", "=q4=Screaming Tiger, Qiang's Unbreakable Polearm", "=ds=#w7#" },
				{ 20, 86075, "", "=q4=Steelskin, Qiang's Impervious Shield", "=ds=#w8#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87044, "", "=q4=Arrow Breaking Windcloak", "=ds=#s4#" },
				{ 2, 89936, "", "=q4=Mindshard Drape", "=ds=#s4#" },
				{ 3, 87051, "", "=q4=Hood of Blind Eyes", "=ds=#s1#, #a1#" },
				{ 4, 87052, "", "=q4=Undying Shadow Grips", "=ds=#s9#, #a1#" },
				{ 5, 87054, "", "=q4=Bracers of Dark Thoughts", "=ds=#s8#, #a2#" },
				{ 6, 89935, "", "=q4=Bracers of Violent Meditation", "=ds=#s8#, #a2#" },
				{ 7, 87047, "", "=q4=Subetai's Pillaging Leggings", "=ds=#s11#, #a3#" },
				{ 8, 87055, "", "=q4=Meng's Treads of Insanity", "=ds=#s12#, #a3#" },
				{ 9, 87049, "", "=q4=Shoulderguards of the Unflanked", "=ds=#s3#, #a4#" },
				{ 10, 87048, "", "=q4=Breastplate of the Kings' Guard", "=ds=#s5#, #a4#" },
				{ 11, 87056, "", "=q4=Girdle of Delirious Visions", "=ds=#s10#, #a4#" },
				{ 16, 87045, "", "=q4=Amulet of the Hidden Kings", "=ds=#s2#" },
				{ 17, 87053, "", "=q4=Zian's Choker of Coalesced Shadow", "=ds=#s2#" },
				{ 19, 87046, "", "=q4=Screaming Tiger, Qiang's Unbreakable Polearm", "=ds=#w7#" },
				{ 20, 87050, "", "=q4=Steelskin, Qiang's Impervious Shield", "=ds=#w8#" },
				{ 22, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 23, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("The Spirit Kings", 687),
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["MSVElegon"] = {
		["RaidFinder"] = {
			{
				{ 1, 89973, "", "=q4=Galaxyfire Girdle", "=ds=#s10#, #a1#" },
				{ 2, 86798, "", "=q4=Orbital Belt", "=ds=#s10#, #a1#" },
				{ 3, 86795, "", "=q4=Chestguard of Total Annihilation", "=ds=#s5#, #a2#" },
				{ 4, 86797, "", "=q4=Phasewalker Striders", "=ds=#s12#, #a2#" },
				{ 5, 86800, "", "=q4=Shoulders of Empyreal Focus", "=ds=#s3#, #a3#" },
				{ 6, 89974, "", "=q4=Crown of Keening Stars", "=ds=#s1#, #a4#" },
				{ 7, 86794, "", "=q4=Starcrusher Gauntlets", "=ds=#s9#, #a4#" },
				{ 9, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 10, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89972, "", "=q4=Band of Bursting Novas", "=ds=#s13#" },
				{ 17, 86791, "", "=q4=Bottle of Infinite Stars", "=ds=#s14#" },
				{ 18, 86792, "", "=q4=Light of the Cosmos", "=ds=#s14#" },
				{ 19, 86790, "", "=q4=Vial of Dragon's Blood", "=ds=#s14#" },
				{ 21, 86789, "", "=q4=Elegion, the Fanged Crescent", "=ds=#h1#, #w1#" },
				{ 22, 86799, "", "=q4=Starshatter", "=ds=#h2#, #w10#" },
				{ 23, 86796, "", "=q4=Torch of the Celestial Spark", "=ds=#w12#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 89822, "", "=q4=Galaxyfire Girdle", "=ds=#s10#, #a1#" },
				{ 2, 86139, "", "=q4=Orbital Belt", "=ds=#s10#, #a1#" },
				{ 3, 86136, "", "=q4=Chestguard of Total Annihilation", "=ds=#s5#, #a2#" },
				{ 4, 86138, "", "=q4=Phasewalker Striders", "=ds=#s12#, #a2#" },
				{ 5, 86141, "", "=q4=Shoulders of Empyreal Focus", "=ds=#s3#, #a3#" },
				{ 6, 89821, "", "=q4=Crown of Keening Stars", "=ds=#s1#, #a4#" },
				{ 7, 86135, "", "=q4=Starcrusher Gauntlets", "=ds=#s9#, #a4#" },
				{ 9, 87777, "", "=q4=Reins of the Astral Cloud Serpent", "=ds=#e27#", ""};
				{ 11, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 12, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89824, "", "=q4=Band of Bursting Novas", "=ds=#s13#" },
				{ 17, 86132, "", "=q4=Bottle of Infinite Stars", "=ds=#s14#" },
				{ 18, 86133, "", "=q4=Light of the Cosmos", "=ds=#s14#" },
				{ 19, 86131, "", "=q4=Vial of Dragon's Blood", "=ds=#s14#" },
				{ 21, 86130, "", "=q4=Elegion, the Fanged Crescent", "=ds=#h1#, #w1#" },
				{ 22, 86140, "", "=q4=Starshatter", "=ds=#h2#, #w10#" },
				{ 23, 86137, "", "=q4=Torch of the Celestial Spark", "=ds=#w12#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 89938, "", "=q4=Galaxyfire Girdle", "=ds=#s10#, #a1#" },
				{ 2, 87064, "", "=q4=Orbital Belt", "=ds=#s10#, #a1#" },
				{ 3, 87058, "", "=q4=Chestguard of Total Annihilation", "=ds=#s5#, #a2#" },
				{ 4, 87067, "", "=q4=Phasewalker Striders", "=ds=#s12#, #a2#" },
				{ 5, 87068, "", "=q4=Shoulders of Empyreal Focus", "=ds=#s3#, #a3#" },
				{ 6, 89939, "", "=q4=Crown of Keening Stars", "=ds=#s1#, #a4#" },
				{ 7, 87059, "", "=q4=Starcrusher Gauntlets", "=ds=#s9#, #a4#" },
				{ 9, 87777, "", "=q4=Reins of the Astral Cloud Serpent", "=ds=#e27#", ""};
				{ 11, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 12, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89937, "", "=q4=Band of Bursting Novas", "=ds=#s13#" },
				{ 17, 87057, "", "=q4=Bottle of Infinite Stars", "=ds=#s14#" },
				{ 18, 87065, "", "=q4=Light of the Cosmos", "=ds=#s14#" },
				{ 19, 87063, "", "=q4=Vial of Dragon's Blood", "=ds=#s14#" },
				{ 21, 87062, "", "=q4=Elegion, the Fanged Crescent", "=ds=#h1#, #w1#" },
				{ 22, 87061, "", "=q4=Starshatter", "=ds=#h2#, #w10#" },
				{ 23, 87066, "", "=q4=Torch of the Celestial Spark", "=ds=#w12#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Elegon", 726),
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["MSVWilloftheEmperor"] = {
		["RaidFinder"] = {
			{
				{ 1, 86809, "", "=q4=Hood of Focused Energy", "=ds=#s1#, #a1#" },
				{ 2, 86804, "", "=q4=Crown of Opportunistic Strikes", "=ds=#s1#, #a2#" },
				{ 3, 86808, "", "=q4=Magnetized Leggings", "=ds=#s11#, #a2#" },
				{ 4, 89975, "", "=q4=Dreadeye Gaze", "=ds=#s1#, #a3#" },
				{ 5, 89977, "", "=q4=Enameled Grips of Solemnity", "=ds=#s9#, #a3#" },
				{ 6, 87826, "", "=q4=Grips of Terra Cotta", "=ds=#s9#, #a3#" },
				{ 7, 86807, "", "=q4=Spaulders of the Emperor's Rage", "=ds=#s3#, #a4#" },
				{ 8, 89976, "", "=q4=Chestguard of Eternal Vigilance", "=ds=#s5#, #a4#" },
				{ 9, 86803, "", "=q4=Jang-xi's Devastating Legplates", "=ds=#s11#, #a4#" },
				{ 16, 86810, "", "=q4=Worldwaker Cachabon", "=ds=#s2#" },
				{ 17, 86802, "", "=q4=Lei Shin's Final Orders", "=ds=#s14#" },
				{ 18, 86805, "", "=q4=Qin-xi's Polarizing Seal", "=ds=#s14#" },
				{ 20, 86806, "", "=q4=Tihan, Scepter of the Sleeping Emperor", "=ds=#h1#, #w6#" },
				{ 21, 86801, "", "=q4=Fang Kung, Spark of Titans", "=ds=#w2#" },
				{ 23, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 24, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86151, "", "=q4=Hood of Focused Energy", "=ds=#s1#, #a1#" },
				{ 2, 86146, "", "=q4=Crown of Opportunistic Strikes", "=ds=#s1#, #a2#" },
				{ 3, 86150, "", "=q4=Magnetized Leggings", "=ds=#s11#, #a2#" },
				{ 4, 89820, "", "=q4=Dreadeye Gaze", "=ds=#s1#, #a3#" },
				{ 5, 89825, "", "=q4=Enameled Grips of Solemnity", "=ds=#s9#, #a3#" },
				{ 6, 87827, "", "=q4=Grips of Terra Cotta", "=ds=#s9#, #a3#" },
				{ 7, 86149, "", "=q4=Spaulders of the Emperor's Rage", "=ds=#s3#, #a4#" },
				{ 8, 89823, "", "=q4=Chestguard of Eternal Vigilance", "=ds=#s5#, #a4#" },
				{ 9, 86145, "", "=q4=Jang-xi's Devastating Legplates", "=ds=#s11#, #a4#" },
				{ 16, 86152, "", "=q4=Worldwaker Cachabon", "=ds=#s2#" },
				{ 17, 86144, "", "=q4=Lei Shin's Final Orders", "=ds=#s14#" },
				{ 18, 86147, "", "=q4=Qin-xi's Polarizing Seal", "=ds=#s14#" },
				{ 20, 86148, "", "=q4=Tihan, Scepter of the Sleeping Emperor", "=ds=#h1#, #w6#" },
				{ 21, 86142, "", "=q4=Fang Kung, Spark of Titans", "=ds=#w2#" },
				{ 23, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 24, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87073, "", "=q4=Hood of Focused Energy", "=ds=#s1#, #a1#" },
				{ 2, 87070, "", "=q4=Crown of Opportunistic Strikes", "=ds=#s1#, #a2#" },
				{ 3, 87077, "", "=q4=Magnetized Leggings", "=ds=#s11#, #a2#" },
				{ 4, 89940, "", "=q4=Dreadeye Gaze", "=ds=#s1#, #a3#" },
				{ 5, 89942, "", "=q4=Enameled Grips of Solemnity", "=ds=#s9#, #a3#" },
				{ 6, 87825, "", "=q4=Grips of Terra Cotta", "=ds=#s9#, #a3#" },
				{ 7, 87078, "", "=q4=Spaulders of the Emperor's Rage", "=ds=#s3#, #a4#" },
				{ 8, 89941, "", "=q4=Chestguard of Eternal Vigilance", "=ds=#s5#, #a4#" },
				{ 9, 87071, "", "=q4=Jang-xi's Devastating Legplates", "=ds=#s11#, #a4#" },
				{ 16, 87076, "", "=q4=Worldwaker Cachabon", "=ds=#s2#" },
				{ 17, 87072, "", "=q4=Lei Shin's Final Orders", "=ds=#s14#" },
				{ 18, 87075, "", "=q4=Qin-xi's Polarizing Seal", "=ds=#s14#" },
				{ 20, 87074, "", "=q4=Tihan, Scepter of the Sleeping Emperor", "=ds=#h1#, #w6#" },
				{ 21, 87069, "", "=q4=Fang Kung, Spark of Titans", "=ds=#w2#" },
				{ 23, 87208, "", "=q5=Sigil of Power", "=ds=#m3#" },
				{ 24, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Will of the Emperor", 677),
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["MoguShanVaultsTrash"] = {
		["RaidFinder"] = {
			{
				{ 1, 95618, "", "=q3=Cache of Mogu Riches", "=ds=#m20#" },
				{ 2, 86772, "", "=q4=Jade Bandit Figurine", "=ds=#s14#" },
				{ 3, 86771, "", "=q4=Jade Charioteer Figurine", "=ds=#s14#" },
				{ 4, 86774, "", "=q4=Jade Courtesan Figurine", "=ds=#s14#" },
				{ 5, 86773, "", "=q4=Jade Magistrate Figurine", "=ds=#s14#" },
				{ 6, 86775, "", "=q4=Jade Warlord Figurine", "=ds=#s14#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86043, "", "=q4=Jade Bandit Figurine", "=ds=#s14#" },
				{ 2, 86042, "", "=q4=Jade Charioteer Figurine", "=ds=#s14#" },
				{ 3, 86045, "", "=q4=Jade Courtesan Figurine", "=ds=#s14#" },
				{ 4, 86044, "", "=q4=Jade Magistrate Figurine", "=ds=#s14#" },
				{ 5, 86046, "", "=q4=Jade Warlord Figurine", "=ds=#s14#" },
			};
		};
		info = {
			name = "trash",
			module = moduleName, instance = "MoguShanVaults",
		};
	};

	AtlasLoot_Data["Patternsilvl496"] = {
		["Normal"] = {
			{
				{ 1, 86381, "", "=q4=Pattern: Legacy of the Emperor", "=ds=#p8# (600)"};
				{ 2, 86379, "", "=q4=Pattern: Robe of Eternal Rule", "=ds=#p8# (600)"};
				{ 3, 86380, "", "=q4=Pattern: Imperial Silk Gloves", "=ds=#p8# (600)"};
				{ 4, 86382, "", "=q4=Pattern: Touch of the Light", "=ds=#p8# (600)"};
				{ 6, 86238, "", "=q4=Pattern: Chestguard of Nemeses", "=ds=#p7# (600)"};
				{ 7, 86281, "", "=q4=Pattern: Nightfire Robe", "=ds=#p7# (600)"};
				{ 8, 86279, "", "=q4=Pattern: Liferuned Leather Gloves", "=ds=#p7# (600)"};
				{ 9, 86280, "", "=q4=Pattern: Murderer's Gloves", "=ds=#p7# (600)"};
				{ 10, 86283, "", "=q4=Pattern: Raiment of Blood and Bone", "=ds=#p7# (600)"};
				{ 11, 86297, "", "=q4=Pattern: Stormbreaker Chestguard", "=ds=#p7# (600)"};
				{ 12, 86272, "", "=q4=Pattern: Fists of Lightning", "=ds=#p7# (600)"};
				{ 13, 86284, "", "=q4=Pattern: Raven Lord's Gloves", "=ds=#p7# (600)"};
				{ 16, 87412, "", "=q4=Plans: Chestplate of Limitless Faith", "=ds=#p2# (600)"};
				{ 17, 87410, "", "=q4=Plans: Ornate Battleplate of the Master", "=ds=#p2# (600)"};
				{ 18, 87408, "", "=q4=Plans: Unyielding Bloodplate", "=ds=#p2# (600)"};
				{ 19, 87411, "", "=q4=Plans: Bloodforged Warfists", "=ds=#p2# (600)"};
				{ 20, 87409, "", "=q4=Plans: Gauntlets of Battle Command", "=ds=#p2# (600)"};
				{ 21, 87413, "", "=q4=Plans: Gauntlets of Unbound Devotion", "=ds=#p2# (600)"};
			};
		};
		info = {
			name = AL["Patterns/Plans"].." ("..AL["ilvl 496"]..")",
			module = moduleName,
		};
	};

		-----------------------------
		--- Pandaria World Bosses ---
		-----------------------------

	AtlasLoot_Data["Nalak"] = {
		["Normal_A"] = {
			{
				{ 16, 0, "spell_nature_starfall", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Balance"]};
				{ 17, 91189, "", "=q4=Tyrannical Gladiator's Wyrmhide Gloves", "=ds=#s9#, #a2#"};
				{ 18, 91193, "", "=q4=Tyrannical Gladiator's Wyrmhide Legguards", "=ds=#s11#, #a2#"};
				{ 20, 0, "ability_druid_catform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Feral"]};
				{ 21, 91157, "", "=q4=Tyrannical Gladiator's Dragonhide Gloves", "=ds=#s9#, #a2#"};
				{ 22, 91161, "", "=q4=Tyrannical Gladiator's Dragonhide Legguards", "=ds=#s11#, #a2#"};
				{ 24, 0, "spell_nature_healingtouch", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Restoration"]};
				{ 25, 91172, "", "=q4=Tyrannical Gladiator's Kodohide Gloves", "=ds=#s9#, #a2#"};
				{ 26, 91176, "", "=q4=Tyrannical Gladiator's Kodohide Legguards", "=ds=#s11#, #a2#"};
				merge = true;
			};
			{
				{ 16, 0, "inv_weapon_bow_07", "=q6="..LOCALIZED_CLASS_NAMES_MALE["HUNTER"], ""};
				{ 17, 91224, "", "=q4=Tyrannical Gladiator's Chain Gauntlets", "=ds=#s9#, #a3#"};
				{ 18, 91228, "", "=q4=Tyrannical Gladiator's Chain Leggings", "=ds=#s11#, #a3#"};
				{ 20, 0, "inv_staff_13", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MAGE"], ""};
				{ 21, 91232, "", "=q4=Tyrannical Gladiator's Silk Handguards", "=ds=#s9#, #a1#"};
				{ 22, 91236, "", "=q4=Tyrannical Gladiator's Silk Trousers", "=ds=#s11#, #a1#"};
				{ 24, 0, "inv_throwingknife_04", "=q6="..LOCALIZED_CLASS_NAMES_MALE["ROGUE"], ""};
				{ 25, 91342, "", "=q4=Tyrannical Gladiator's Leather Gloves", "=ds=#s9#, #a2#"};
				{ 26, 91346, "", "=q4=Tyrannical Gladiator's Leather Legguards", "=ds=#s11#, #a2#"};
				{ 28, 0, "spell_nature_drowsy", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"], ""};
				{ 29, 91420, "", "=q4=Tyrannical Gladiator's Felweave Handguards", "=ds=#s9#, #a1#"};
				{ 30, 91424, "", "=q4=Tyrannical Gladiator's Felweave Trousers", "=ds=#s11#, #a1#"};
				merge = true;
			};
			{
				{ 20, 0, "spell_monk_mistweaver_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Mistweaver"]};
				{ 21, 91257, "", "=q4=Tyrannical Gladiator's Copperskin Gloves", "=ds=#s9#, #a2#"};
				{ 22, 91261, "", "=q4=Tyrannical Gladiator's Copperskin Legguards", "=ds=#s11#, #a2#"};
				{ 24, 0, "spell_monk_windwalker_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Windwalker"]};
				{ 25, 91247, "", "=q4=Tyrannical Gladiator's Ironskin Gloves", "=ds=#s9#, #a2#"};
				{ 26, 91251, "", "=q4=Tyrannical Gladiator's Ironskin Legguards", "=ds=#s11#, #a2#"};
				merge = true;
			};
			{
				{ 16, 0, "Spell_Holy_HolyBolt", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Holy"]};
				{ 17, 91289, "", "=q4=Tyrannical Gladiator's Ornamented Gloves", "=ds=#s9#, #a4#"};
				{ 18, 91293, "", "=q4=Tyrannical Gladiator's Ornamented Legplates", "=ds=#s11#, #a4#"};
				{ 20, 0, "Spell_Holy_AuraOfLight", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Retribution"]};
				{ 21, 91269, "", "=q4=Tyrannical Gladiator's Scaled Gauntlets", "=ds=#s9#, #a4#"};
				{ 22, 91273, "", "=q4=Tyrannical Gladiator's Scaled Legguards", "=ds=#s11#, #a4#"};
				merge = true;
			};
			{
				{ 16, 0, "spell_holy_guardianspirit", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Holy"]};
				{ 17, 91309, "", "=q4=Tyrannical Gladiator's Mooncloth Gloves", "=ds=#s9#, #a1#"};
				{ 18, 91313, "", "=q4=Tyrannical Gladiator's Mooncloth Leggings", "=ds=#s11#, #a1#"};
				{ 20, 0, "spell_shadow_shadowwordpain", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Shadow"]};
				{ 21, 91319, "", "=q4=Tyrannical Gladiator's Satin Gloves", "=ds=#s9#, #a1#"};
				{ 22, 91323, "", "=q4=Tyrannical Gladiator's Satin Leggings", "=ds=#s11#, #a1#"};
				merge = true;
			};
			{
				{ 16, 0, "Spell_Nature_Lightning", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Elemental"]};
				{ 17, 91382, "", "=q4=Tyrannical Gladiator's Mail Gauntlets", "=ds=#s9#, #a3#"};
				{ 18, 91386, "", "=q4=Tyrannical Gladiator's Mail Leggings", "=ds=#s11#, #a3#"};
				{ 20, 0, "spell_nature_lightningshield", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Enhancement"]};
				{ 21, 91370, "", "=q4=Tyrannical Gladiator's Linked Gauntlets", "=ds=#s9#, #a3#"};
				{ 22, 91374, "", "=q4=Tyrannical Gladiator's Linked Leggings", "=ds=#s11#, #a3#"};
				{ 24, 0, "spell_nature_magicimmunity", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Restoration"]};
				{ 25, 91360, "", "=q4=Tyrannical Gladiator's Ringmail Gauntlets", "=ds=#s9#, #a3#"};
				{ 26, 91364, "", "=q4=Tyrannical Gladiator's Ringmail Leggings", "=ds=#s11#, #a3#"};
				merge = true;
			};
			{
				{ 16, 0, "spell_deathknight_classicon", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"]};
				{ 17, 91149, "", "=q4=Tyrannical Gladiator's Dreadplate Gauntlets", "=ds=#s9#, #a4#"};
				{ 18, 91153, "", "=q4=Tyrannical Gladiator's Dreadplate Legguards", "=ds=#s11#, #a4#"};
				{ 24, 0, "inv_sword_27", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"]};
				{ 25, 91432, "", "=q4=Tyrannical Gladiator's Plate Gauntlets", "=ds=#s9#, #a4#"};
				{ 26, 91436, "", "=q4=Tyrannical Gladiator's Plate Legguards", "=ds=#s11#, #a4#"};
				merge = true;
			};
			{
				{ 1, 91121, "", "=q4=Tyrannical Gladiator's Cuffs of Accuracy", "=ds="};
				{ 2, 91111, "", "=q4=Tyrannical Gladiator's Cord of Accuracy", "=ds="};
				{ 3, 91117, "", "=q4=Tyrannical Gladiator's Treads of Alacrity", "=ds="};
				{ 5, 91123, "", "=q4=Tyrannical Gladiator's Cuffs of Meditation", "=ds="};
				{ 6, 91113, "", "=q4=Tyrannical Gladiator's Cord of Meditation", "=ds="};
				{ 7, 91119, "", "=q4=Tyrannical Gladiator's Treads of Meditation", "=ds="};
				{ 9, 91122, "", "=q4=Tyrannical Gladiator's Cuffs of Prowess", "=ds="};
				{ 10, 91109, "", "=q4=Tyrannical Gladiator's Cord of Cruelty", "=ds="};
				{ 11, 91115, "", "=q4=Tyrannical Gladiator's Treads of Cruelty", "=ds="};
				{ 16, 91246, "", "=q4=Tyrannical Gladiator's Armwraps of Accuracy", "=ds="};
				{ 17, 91335, "", "=q4=Tyrannical Gladiator's Waistband of Accuracy", "=ds="};
				{ 18, 91337, "", "=q4=Tyrannical Gladiator's Boots of Cruelty", "=ds="};
				{ 20, 91339, "", "=q4=Tyrannical Gladiator's Armwraps of Alacrity", "=ds="};
				{ 21, 91242, "", "=q4=Tyrannical Gladiator's Waistband of Cruelty", "=ds="};
				{ 22, 91244, "", "=q4=Tyrannical Gladiator's Boots of Alacrity", "=ds="};
				{ 24, 91188, "", "=q4=Tyrannical Gladiator's Bindings of Prowess", "=ds="};
				{ 25, 91184, "", "=q4=Tyrannical Gladiator's Belt of Cruelty", "=ds="};
				{ 26, 91186, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds="};
				{ 28, 91171, "", "=q4=Tyrannical Gladiator's Bindings of Meditation", "=ds="};
				{ 29, 91167, "", "=q4=Tyrannical Gladiator's Belt of Meditation", "=ds="};
				{ 30, 91169, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds="};
				merge = true;
			};
			{
				{ 1, 91357, "", "=q4=Tyrannical Gladiator's Armbands of Meditation", "=ds="};
				{ 2, 91350, "", "=q4=Tyrannical Gladiator's Waistguard of Meditation", "=ds="};
				{ 3, 91354, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds="};
				{ 5, 91356, "", "=q4=Tyrannical Gladiator's Armbands of Prowess", "=ds="};
				{ 6, 91378, "", "=q4=Tyrannical Gladiator's Waistguard of Cruelty", "=ds="};
				{ 7, 91352, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds="};
				{ 9, 91220, "", "=q4=Tyrannical Gladiator's Wristguards of Alacrity", "=ds="};
				{ 10, 91212, "", "=q4=Tyrannical Gladiator's Links of Cruelty", "=ds="};
				{ 11, 91218, "", "=q4=Tyrannical Gladiator's Sabatons of Alacrity", "=ds="};
				{ 13, 91221, "", "=q4=Tyrannical Gladiator's Wristguards of Accuracy", "=ds="};
				{ 14, 91214, "", "=q4=Tyrannical Gladiator's Links of Accuracy", "=ds="};
				{ 15, 91216, "", "=q4=Tyrannical Gladiator's Sabatons of Cruelty", "=ds="};
				{ 16, 91286, "", "=q4=Tyrannical Gladiator's Bracers of Meditation", "=ds="};
				{ 17, 91279, "", "=q4=Tyrannical Gladiator's Clasp of Meditation", "=ds="};
				{ 18, 91283, "", "=q4=Tyrannical Gladiator's Greaves of Meditation", "=ds="};
				{ 20, 91305, "", "=q4=Tyrannical Gladiator's Armplates of Proficiency", "=ds="};
				{ 21, 91297, "", "=q4=Tyrannical Gladiator's Girdle of Accuracy", "=ds="};
				{ 22, 91301, "", "=q4=Tyrannical Gladiator's Warboots of Cruelty", "=ds="};
				{ 24, 91285, "", "=q4=Tyrannical Gladiator's Bracers of Prowess", "=ds="};
				{ 25, 91277, "", "=q4=Tyrannical Gladiator's Clasp of Cruelty", "=ds="};
				{ 26, 91281, "", "=q4=Tyrannical Gladiator's Greaves of Alacrity", "=ds="};
				{ 28, 91306, "", "=q4=Tyrannical Gladiator's Armplates of Alacrity", "=ds="};
				{ 29, 91299, "", "=q4=Tyrannical Gladiator's Girdle of Prowess", "=ds="};
				{ 30, 91303, "", "=q4=Tyrannical Gladiator's Warboots of Alacrity", "=ds="};
				merge = true;
			};
			{
				{ 1, 91100, "", "=q4=Tyrannical Gladiator's Cape of Cruelty", "=ds=#s4#" },
				{ 2, 91101, "", "=q4=Tyrannical Gladiator's Cape of Prowess", "=ds=#s4#" },
				{ 3, 91411, "", "=q4=Tyrannical Gladiator's Cloak of Alacrity", "=ds=#s4#" },
				{ 4, 91412, "", "=q4=Tyrannical Gladiator's Cloak of Prowess", "=ds=#s4#" },
				{ 5, 91124, "", "=q4=Tyrannical Gladiator's Drape of Cruelty", "=ds=#s4#"},
				{ 6, 91126, "", "=q4=Tyrannical Gladiator's Drape of Meditation", "=ds=#s4#" },
				{ 7, 91125, "", "=q4=Tyrannical Gladiator's Drape of Prowess", "=ds=#s4#" },
				{ 9, 91139, "", "=q4=Tyrannical Gladiator's Band of Accuracy", "=ds=#s13#" };
				{ 10, 91138, "", "=q4=Tyrannical Gladiator's Band of Cruelty", "=ds=#s13#" };
				{ 11, 91140, "", "=q4=Tyrannical Gladiator's Band of Meditation", "=ds=#s13#" };
				{ 12, 91417, "", "=q4=Tyrannical Gladiator's Signet of Accuracy", "=ds=#s13#" };
				{ 13, 91416, "", "=q4=Tyrannical Gladiator's Signet of Cruelty", "=ds=#s13#" };
				{ 14, 91106, "", "=q4=Tyrannical Gladiator's Ring of Accuracy", "=ds=#s13#" };
				{ 15, 91105, "", "=q4=Tyrannical Gladiator's Ring of Cruelty", "=ds=#s13#" };
				{ 16, 91414, "", "=q4=Tyrannical Gladiator's Choker of Accuracy", "=ds=#s2#" },
				{ 17, 91413, "", "=q4=Tyrannical Gladiator's Choker of Proficiency", "=ds=#s2#" },
				{ 18, 91102, "", "=q4=Tyrannical Gladiator's Necklace of Proficiency", "=ds=#s2#" },
				{ 19, 91103, "", "=q4=Tyrannical Gladiator's Necklace of Prowess", "=ds=#s2#" },
				{ 20, 91136, "", "=q4=Tyrannical Gladiator's Pendant of Alacrity", "=ds=#s2#" },
				{ 21, 91135, "", "=q4=Tyrannical Gladiator's Pendant of Cruelty", "=ds=#s2#" },
				{ 22, 91137, "", "=q4=Tyrannical Gladiator's Pendant of Meditation", "=ds=#s2#" },
				merge = true;
			};
		};
		["Normal_H"] = {
			{
				{ 16, 0, "spell_nature_starfall", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Balance"]};
				{ 17, 94412, "", "=q4=Tyrannical Gladiator's Wyrmhide Gloves", "=ds=#s9#, #a2#"};
				{ 18, 94483, "", "=q4=Tyrannical Gladiator's Wyrmhide Legguards", "=ds=#s11#, #a2#"};
				{ 20, 0, "ability_druid_catform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Feral"]};
				{ 21, 94455, "", "=q4=Tyrannical Gladiator's Dragonhide Gloves", "=ds=#s9#, #a2#"};
				{ 22, 94368, "", "=q4=Tyrannical Gladiator's Dragonhide Legguards", "=ds=#s11#, #a2#"};
				{ 24, 0, "spell_nature_healingtouch", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Restoration"]};
				{ 25, 94371, "", "=q4=Tyrannical Gladiator's Kodohide Gloves", "=ds=#s9#, #a2#"};
				{ 26, 94477, "", "=q4=Tyrannical Gladiator's Kodohide Legguards", "=ds=#s11#, #a2#"};
				merge = true;
			};
			{
				{ 16, 0, "inv_weapon_bow_07", "=q6="..LOCALIZED_CLASS_NAMES_MALE["HUNTER"], ""};
				{ 17, 94453, "", "=q4=Tyrannical Gladiator's Chain Gauntlets", "=ds=#s9#, #a3#"};
				{ 18, 94384, "", "=q4=Tyrannical Gladiator's Chain Leggings", "=ds=#s11#, #a3#"};
				{ 20, 0, "inv_staff_13", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MAGE"], ""};
				{ 21, 94451, "", "=q4=Tyrannical Gladiator's Silk Handguards", "=ds=#s9#, #a1#"};
				{ 22, 94362, "", "=q4=Tyrannical Gladiator's Silk Trousers", "=ds=#s11#, #a1#"};
				{ 24, 0, "inv_throwingknife_04", "=q6="..LOCALIZED_CLASS_NAMES_MALE["ROGUE"], ""};
				{ 25, 94377, "", "=q4=Tyrannical Gladiator's Leather Gloves", "=ds=#s9#, #a2#"};
				{ 26, 94446, "", "=q4=Tyrannical Gladiator's Leather Legguards", "=ds=#s11#, #a2#"};
				{ 28, 0, "spell_nature_drowsy", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"], ""};
				{ 29, 94441, "", "=q4=Tyrannical Gladiator's Felweave Handguards", "=ds=#s9#, #a1#"};
				{ 30, 94471, "", "=q4=Tyrannical Gladiator's Felweave Trousers", "=ds=#s11#, #a1#"};
				merge = true;
			};
			{
				{ 20, 0, "spell_monk_mistweaver_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Mistweaver"]};
				{ 21, 94340, "", "=q4=Tyrannical Gladiator's Copperskin Gloves", "=ds=#s9#, #a2#"};
				{ 22, 94478, "", "=q4=Tyrannical Gladiator's Copperskin Legguards", "=ds=#s11#, #a2#"};
				{ 24, 0, "spell_monk_windwalker_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Windwalker"]};
				{ 25, 94391, "", "=q4=Tyrannical Gladiator's Ironskin Gloves", "=ds=#s9#, #a2#"};
				{ 26, 94370, "", "=q4=Tyrannical Gladiator's Ironskin Legguards", "=ds=#s11#, #a2#"};
				merge = true;
			};
			{
				{ 16, 0, "Spell_Holy_HolyBolt", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Holy"]};
				{ 17, 94438, "", "=q4=Tyrannical Gladiator's Ornamented Gloves", "=ds=#s9#, #a4#"};
				{ 18, 94484, "", "=q4=Tyrannical Gladiator's Ornamented Legplates", "=ds=#s11#, #a4#"};
				{ 20, 0, "Spell_Holy_AuraOfLight", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Retribution"]};
				{ 21, 94343, "", "=q4=Tyrannical Gladiator's Scaled Gauntlets", "=ds=#s9#, #a4#"};
				{ 22, 94496, "", "=q4=Tyrannical Gladiator's Scaled Legguards", "=ds=#s11#, #a4#"};
				merge = true;
			};
			{
				{ 16, 0, "spell_holy_guardianspirit", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Holy"]};
				{ 17, 94328, "", "=q4=Tyrannical Gladiator's Mooncloth Gloves", "=ds=#s9#, #a1#"};
				{ 18, 94420, "", "=q4=Tyrannical Gladiator's Mooncloth Leggings", "=ds=#s11#, #a1#"};
				{ 20, 0, "spell_shadow_shadowwordpain", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Shadow"]};
				{ 21, 94423, "", "=q4=Tyrannical Gladiator's Satin Gloves", "=ds=#s9#, #a1#"};
				{ 22, 94334, "", "=q4=Tyrannical Gladiator's Satin Leggings", "=ds=#s11#, #a1#"};
				merge = true;
			};
			{
				{ 16, 0, "Spell_Nature_Lightning", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Elemental"]};
				{ 17, 94408, "", "=q4=Tyrannical Gladiator's Mail Gauntlets", "=ds=#s9#, #a3#"};
				{ 18, 94497, "", "=q4=Tyrannical Gladiator's Mail Leggings", "=ds=#s11#, #a3#"};
				{ 20, 0, "spell_nature_lightningshield", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Enhancement"]};
				{ 21, 94458, "", "=q4=Tyrannical Gladiator's Linked Gauntlets", "=ds=#s9#, #a3#"};
				{ 22, 94494, "", "=q4=Tyrannical Gladiator's Linked Leggings", "=ds=#s11#, #a3#"};
				{ 24, 0, "spell_nature_magicimmunity", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Restoration"]};
				{ 25, 94490, "", "=q4=Tyrannical Gladiator's Ringmail Gauntlets", "=ds=#s9#, #a3#"};
				{ 26, 94435, "", "=q4=Tyrannical Gladiator's Ringmail Leggings", "=ds=#s11#, #a3#"};
				merge = true;
			};
			{
				{ 16, 0, "spell_deathknight_classicon", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"]};
				{ 17, 94364, "", "=q4=Tyrannical Gladiator's Dreadplate Gauntlets", "=ds=#s9#, #a4#"};
				{ 18, 94365, "", "=q4=Tyrannical Gladiator's Dreadplate Legguards", "=ds=#s11#, #a4#"};
				{ 24, 0, "inv_sword_27", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"]};
				{ 25, 94331, "", "=q4=Tyrannical Gladiator's Plate Gauntlets", "=ds=#s9#, #a4#"};
				{ 26, 94448, "", "=q4=Tyrannical Gladiator's Plate Legguards", "=ds=#s11#, #a4#"};
				merge = true;
			};
			{
				{ 1, 94403, "", "=q4=Tyrannical Gladiator's Cuffs of Accuracy", "=ds="};
				{ 2, 94376, "", "=q4=Tyrannical Gladiator's Cord of Accuracy", "=ds="};
				{ 3, 94333, "", "=q4=Tyrannical Gladiator's Treads of Alacrity", "=ds="};
				{ 5, 94380, "", "=q4=Tyrannical Gladiator's Cuffs of Meditation", "=ds="};
				{ 6, 94425, "", "=q4=Tyrannical Gladiator's Cord of Meditation", "=ds="};
				{ 7, 94468, "", "=q4=Tyrannical Gladiator's Treads of Meditation", "=ds="};
				{ 9, 94449, "", "=q4=Tyrannical Gladiator's Cuffs of Prowess", "=ds="};
				{ 10, 94400, "", "=q4=Tyrannical Gladiator's Cord of Cruelty", "=ds="};
				{ 11, 94402, "", "=q4=Tyrannical Gladiator's Treads of Cruelty", "=ds="};
				{ 16, 94427, "", "=q4=Tyrannical Gladiator's Armwraps of Accuracy", "=ds="};
				{ 17, 94424, "", "=q4=Tyrannical Gladiator's Waistband of Accuracy", "=ds="};
				{ 18, 94374, "", "=q4=Tyrannical Gladiator's Boots of Cruelty", "=ds="};
				{ 20, 94470, "", "=q4=Tyrannical Gladiator's Armwraps of Alacrity", "=ds="};
				{ 21, 94360, "", "=q4=Tyrannical Gladiator's Waistband of Cruelty", "=ds="};
				{ 22, 94432, "", "=q4=Tyrannical Gladiator's Boots of Alacrity", "=ds="};
				{ 24, 94439, "", "=q4=Tyrannical Gladiator's Bindings of Prowess", "=ds="};
				{ 25, 94410, "", "=q4=Tyrannical Gladiator's Belt of Cruelty", "=ds="};
				{ 26, 94344, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds="};
				{ 28, 94407, "", "=q4=Tyrannical Gladiator's Bindings of Meditation", "=ds="};
				{ 29, 94491, "", "=q4=Tyrannical Gladiator's Belt of Meditation", "=ds="};
				{ 30, 94476, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds="};
				merge = true;
			};
			{
				{ 1, 94337, "", "=q4=Tyrannical Gladiator's Armbands of Meditation", "=ds="};
				{ 2, 94382, "", "=q4=Tyrannical Gladiator's Waistguard of Meditation", "=ds="};
				{ 3, 94336, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds="};
				{ 5, 94379, "", "=q4=Tyrannical Gladiator's Armbands of Prowess", "=ds="};
				{ 6, 94393, "", "=q4=Tyrannical Gladiator's Waistguard of Cruelty", "=ds="};
				{ 7, 94378, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds="};
				{ 9, 94404, "", "=q4=Tyrannical Gladiator's Wristguards of Alacrity", "=ds="};
				{ 10, 94330, "", "=q4=Tyrannical Gladiator's Links of Cruelty", "=ds="};
				{ 11, 94359, "", "=q4=Tyrannical Gladiator's Sabatons of Alacrity", "=ds="};
				{ 13, 94469, "", "=q4=Tyrannical Gladiator's Wristguards of Accuracy", "=ds="};
				{ 14, 94358, "", "=q4=Tyrannical Gladiator's Links of Accuracy", "=ds="};
				{ 15, 94445, "", "=q4=Tyrannical Gladiator's Sabatons of Cruelty", "=ds="};
				{ 16, 94481, "", "=q4=Tyrannical Gladiator's Bracers of Meditation", "=ds="};
				{ 17, 94464, "", "=q4=Tyrannical Gladiator's Clasp of Meditation", "=ds="};
				{ 18, 94352, "", "=q4=Tyrannical Gladiator's Greaves of Meditation", "=ds="};
				{ 20, 94418, "", "=q4=Tyrannical Gladiator's Armplates of Proficiency", "=ds="};
				{ 21, 94353, "", "=q4=Tyrannical Gladiator's Girdle of Accuracy", "=ds="};
				{ 22, 94414, "", "=q4=Tyrannical Gladiator's Warboots of Cruelty", "=ds="};
				{ 24, 94411, "", "=q4=Tyrannical Gladiator's Bracers of Prowess", "=ds="};
				{ 25, 94480, "", "=q4=Tyrannical Gladiator's Clasp of Cruelty", "=ds="};
				{ 26, 94351, "", "=q4=Tyrannical Gladiator's Greaves of Alacrity", "=ds="};
				{ 28, 94487, "", "=q4=Tyrannical Gladiator's Armplates of Alacrity", "=ds="};
				{ 29, 94440, "", "=q4=Tyrannical Gladiator's Girdle of Prowess", "=ds="};
				{ 30, 94461, "", "=q4=Tyrannical Gladiator's Warboots of Alacrity", "=ds="};
				merge = true;
			};
			{
				{ 1, 94421, "", "=q4=Tyrannical Gladiator's Cape of Cruelty", "=ds=#s4#" },
				{ 2, 94355, "", "=q4=Tyrannical Gladiator's Cape of Prowess", "=ds=#s4#" },
				{ 3, 94485, "", "=q4=Tyrannical Gladiator's Cloak of Alacrity", "=ds=#s4#" },
				{ 4, 94486, "", "=q4=Tyrannical Gladiator's Cloak of Prowess", "=ds=#s4#" },
				{ 5, 94383, "", "=q4=Tyrannical Gladiator's Drape of Cruelty", "=ds=#s4#"},
				{ 6, 94472, "", "=q4=Tyrannical Gladiator's Drape of Meditation", "=ds=#s4#" },
				{ 7, 94488, "", "=q4=Tyrannical Gladiator's Drape of Prowess", "=ds=#s4#" },
				{ 9, 94363, "", "=q4=Tyrannical Gladiator's Band of Accuracy", "=ds=#s13#" };
				{ 10, 94390, "", "=q4=Tyrannical Gladiator's Band of Cruelty", "=ds=#s13#" };
				{ 11, 94474, "", "=q4=Tyrannical Gladiator's Band of Meditation", "=ds=#s13#" };
				{ 12, 94462, "", "=q4=Tyrannical Gladiator's Signet of Accuracy", "=ds=#s13#" };
				{ 13, 94417, "", "=q4=Tyrannical Gladiator's Signet of Cruelty", "=ds=#s13#" };
				{ 14, 94399, "", "=q4=Tyrannical Gladiator's Ring of Accuracy", "=ds=#s13#" };
				{ 15, 94357, "", "=q4=Tyrannical Gladiator's Ring of Cruelty", "=ds=#s13#" };
				{ 16, 94354, "", "=q4=Tyrannical Gladiator's Choker of Accuracy", "=ds=#s2#" },
				{ 17, 94465, "", "=q4=Tyrannical Gladiator's Choker of Proficiency", "=ds=#s2#" },
				{ 18, 94394, "", "=q4=Tyrannical Gladiator's Necklace of Proficiency", "=ds=#s2#" },
				{ 19, 94395, "", "=q4=Tyrannical Gladiator's Necklace of Prowess", "=ds=#s2#" },
				{ 20, 94473, "", "=q4=Tyrannical Gladiator's Pendant of Alacrity", "=ds=#s2#" },
				{ 21, 94489, "", "=q4=Tyrannical Gladiator's Pendant of Cruelty", "=ds=#s2#" },
				{ 22, 94452, "", "=q4=Tyrannical Gladiator's Pendant of Meditation", "=ds=#s2#" },
				merge = true;
			};
		};
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_starfall", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Balance"]};
				{ 2, 95245, "", "=q4=Gloves of the Haunted Forest", "=ds=#s9#, #a2#"};
				{ 3, 95247, "", "=q4=Leggings of the Haunted Forest", "=ds=#s11#, #a2#"};
				{ 5, 0, "ability_druid_catform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..AL["DPS"]};
				{ 6, 95236, "", "=q4=Grips of the Haunted Forest", "=ds=#s9#, #a2#"};
				{ 7, 95238, "", "=q4=Legguards of the Haunted Forest", "=ds=#s11#, #a2#"};
				{ 9, 0, "spell_nature_healingtouch", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Restoration"]};
				{ 10, 95240, "", "=q4=Handwraps of the Haunted Forest", "=ds=#s9#, #a2#"};
				{ 11, 95242, "", "=q4=Legwraps of the Haunted Forest", "=ds=#s11#, #a2#"};
				{ 13, 0, "ability_racial_bearform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Guardian"]};
				{ 14, 95251, "", "=q4=Handguards of the Haunted Forest", "=ds=#s9#, #a2#"};
				{ 15, 95253, "", "=q4=Breeches of the Haunted Forest", "=ds=#s11#, #a2#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["DRUID"];
			};
			{
				{ 1, 0, "inv_weapon_bow_07", "=q6="..LOCALIZED_CLASS_NAMES_MALE["HUNTER"], ""};
				{ 2, 95256, "", "=q4=Saurok Stalker's Gloves", "=ds=#s9#, #a3#"};
				{ 3, 95258, "", "=q4=Saurok Stalker's Legguards", "=ds=#s11#, #a3#"};
				{ 5, 0, "inv_staff_13", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MAGE"], ""};
				{ 6, 95260, "", "=q4=Gloves of the Chromatic Hydra", "=ds=#s9#, #a1#"};
				{ 7, 95262, "", "=q4=Leggings of the Chromatic Hydra", "=ds=#s11#, #a1#"};
				{ 9, 0, "inv_throwingknife_04", "=q6="..LOCALIZED_CLASS_NAMES_MALE["ROGUE"], ""};
				{ 10, 95306, "", "=q4=Nine-Tailed Gloves", "=ds=#s9#, #a2#"};
				{ 11, 95308, "", "=q4=Nine-Tailed Legguards", "=ds=#s11#, #a2#"};
				{ 13, 0, "spell_nature_drowsy", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"], ""};
				{ 14, 95325, "", "=q4=Gloves of the Thousandfold Hells", "=ds=#s9#, #a1#"};
				{ 15, 95327, "", "=q4=Leggings of the Thousandfold Hells", "=ds=#s11#, #a1#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["HUNTER"].." / "..LOCALIZED_CLASS_NAMES_MALE["MAGE"].." / "..LOCALIZED_CLASS_NAMES_MALE["ROGUE"].." / "..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"];
			};
			{
				{ 1, 0, "spell_monk_brewmaster_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Brewmaster"]};
				{ 2, 95276, "", "=q4=Fire-Charm Gauntlets", "=ds=#s9#, #a2#"};
				{ 3, 95278, "", "=q4=Fire-Charm Legguards", "=ds=#s11#, #a2#"};
				{ 5, 0, "spell_monk_mistweaver_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Mistweaver"]};
				{ 6, 95270, "", "=q4=Fire-Charm Handwraps", "=ds=#s9#, #a2#"};
				{ 7, 95272, "", "=q4=Fire-Charm Legwraps", "=ds=#s11#, #a2#"};
				{ 9, 0, "spell_monk_windwalker_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Windwalker"]};
				{ 10, 95266, "", "=q4=Fire-Charm Grips", "=ds=#s9#, #a2#"};
				{ 11, 95268, "", "=q4=Fire-Charm Leggings", "=ds=#s11#, #a2#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["MONK"];
			};
			{
				{ 1, 0, "Spell_Holy_HolyBolt", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Holy"]};
				{ 2, 95286, "", "=q4=Lightning Emperor's Gloves", "=ds=#s9#, #a4#"};
				{ 3, 95288, "", "=q4=Lightning Emperor's Greaves", "=ds=#s11#, #a4#"};
				{ 5, 0, "Spell_Holy_AuraOfLight", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Retribution"]};
				{ 6, 95281, "", "=q4=Lightning Emperor's Gauntlets", "=ds=#s9#, #a4#"};
				{ 7, 95283, "", "=q4=Lightning Emperor's Legplates", "=ds=#s11#, #a4#"};
				{ 9, 0, "spell_holy_devotionaura", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Protection"]};
				{ 10, 95291, "", "=q4=Lightning Emperor's Handguards", "=ds=#s9#, #a4#"};
				{ 11, 95293, "", "=q4=Lightning Emperor's Legguards", "=ds=#s11#, #a4#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["PALADIN"];
			};
			{
				{ 1, 0, "spell_holy_guardianspirit", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Holy"]};
				{ 2, 95295, "", "=q4=Handwraps of the Exorcist", "=ds=#s9#, #a1#"};
				{ 3, 95297, "", "=q4=Legwraps of the Exorcist", "=ds=#s11#, #a1#"};
				{ 5, 0, "spell_shadow_shadowwordpain", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Shadow"]};
				{ 6, 95300, "", "=q4=Gloves of the Exorcist", "=ds=#s9#, #a1#"};
				{ 7, 95302, "", "=q4=Leggings of the Exorcist", "=ds=#s11#, #a1#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["PRIEST"];
			};
			{
				{ 1, 0, "Spell_Nature_Lightning", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Elemental"]};
				{ 2, 95321, "", "=q4=Gloves of the Witch Doctor", "=ds=#s9#, #a3#"};
				{ 3, 95323, "", "=q4=Kilt of the Witch Doctor", "=ds=#s11#, #a3#"};
				{ 5, 0, "spell_nature_lightningshield", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Enhancement"]};
				{ 6, 95316, "", "=q4=Grips of the Witch Doctor", "=ds=#s9#, #a3#"};
				{ 7, 95318, "", "=q4=Legguards of the Witch Doctor", "=ds=#s11#, #a3#"};
				{ 9, 0, "spell_nature_magicimmunity", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Restoration"]};
				{ 10, 95311, "", "=q4=Handwraps of the Witch Doctor", "=ds=#s9#, #a3#"};
				{ 11, 95313, "", "=q4=Legwraps of the Witch Doctor", "=ds=#s11#, #a3#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"];
			};
			{
				{ 1, 0, "spell_deathknight_frostpresence", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"], "=q5="..AL["DPS"]};
				{ 2, 95226, "", "=q4=Gauntlets of the All-Consuming Maw", "=ds=#s9#, #a4#"};
				{ 3, 95228, "", "=q4=Greaves of the All-Consuming Maw", "=ds=#s11#, #a4#"};
				{ 5, 0, "spell_deathknight_bloodpresence", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"], "=q5="..AL["Tanking"]};
				{ 6, 95231, "", "=q4=Handguards of the All-Consuming Maw", "=ds=#s9#, #a4#"};
				{ 7, 95233, "", "=q4=Legguards of the All-Consuming Maw", "=ds=#s11#, #a4#"};
				{ 9, 0, "ability_warrior_innerrage", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"], "=q5="..AL["DPS"]};
				{ 10, 95332, "", "=q4=Gauntlets of the Last Mogu", "=ds=#s9#, #a4#"};
				{ 11, 95333, "", "=q4=Legplates of the Last Mogu", "=ds=#s11#, #a4#"};
				{ 13, 0, "ability_warrior_defensivestance", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"], "=q5="..ALIL["Protection"]};
				{ 14, 95336, "", "=q4=Handguards of the Last Mogu", "=ds=#s9#, #a4#"};
				{ 15, 95338, "", "=q4=Legguards of the Last Mogu", "=ds=#s11#, #a4#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"].." / "..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"];
			};
			{
				extraText = ": "..AL["PvP Non-Set Epics"].." - "..BabbleInventory["Cloth"].." / "..BabbleInventory["Leather"];
			};
			{
				extraText = ": "..AL["PvP Non-Set Epics"].." - "..BabbleInventory["Mail"].." / "..BabbleInventory["Plate"];
			};
			{
				extraText = ": "..AL["PvP Accessories"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Nalak, The Storm Lord", 814),
			module = moduleName, menu = "NALAK", instance = "Pandaria",
		};
	};

	AtlasLoot_Data["Oondasta"] = {
		["Normal"] = {
			{
				{ 1, 95182, "", "=q4=Robes of Zalmoxes", "=ds=#s5#, #a1#" },
				{ 2, 95183, "", "=q4=Waistband of Elder Falcarius", "=ds=#s5#, #a1#" },
				{ 3, 95194, "", "=q4=Gloves of Tyranomancy", "=ds=#s9#, #a1#" },
				{ 4, 95193, "", "=q4=Gloves of Varsoon the Greater", "=ds=#s9#, #a1#" },
				{ 5, 95184, "", "=q4=Girdle of Dimorphodontics", "=ds=#s10#, #a1#" },
				{ 6, 95185, "", "=q4=Terrorful Weave", "=ds=#s10#, #a1#" },
				{ 8, 95147, "", "=q4=Fancifully Frilled Tunic", "=ds=#s5#, #a2#" },
				{ 9, 95148, "", "=q4=Vest of the Bordomorono", "=ds=#s5#, #a2#" },
				{ 10, 95196, "", "=q4=Gloves of Gastric Rumbling", "=ds=#s9#, #a2#" },
				{ 11, 95195, "", "=q4=Gloves of Unliving Fossil", "=ds=#s9#, #a2#" },
				{ 12, 95186, "", "=q4=Belt of Crushed Dreams", "=ds=#s10#, #a2#" },
				{ 13, 95187, "", "=q4=Girdle of the Derrodoccus", "=ds=#s10#, #a2#" },
				{ 16, 95149, "", "=q4=Gorgoraptor Scale Chest", "=ds=#s5#, #a3#" },
				{ 17, 95150, "", "=q4=Mail of the Mosschopper", "=ds=#s5#, #a3#" },
				{ 18, 95200, "", "=q4=Orndo Mando's Gloves", "=ds=#s9#, #a3#" },
				{ 19, 95197, "", "=q4=Therapsid Scale Gloves", "=ds=#s9#, #a3#" },
				{ 20, 95188, "", "=q4=Belt of the Arch Avimimus", "=ds=#s10#, #a3#" },
				{ 21, 95189, "", "=q4=Belt of the Dying Diemetradon", "=ds=#s10#, #a3#" },
			};
			{
				{ 1, 95152, "", "=q4=Breastplate of the Iguanocolossus", "=ds=#s5#, #a4#" },
				{ 2, 95151, "", "=q4=Scorched Spiritfire Drape", "=ds=#s5#, #a4#" },
				{ 3, 95153, "", "=q4=Tyrant King Battleplate", "=ds=#s5#, #a4#" },
				{ 4, 95199, "", "=q4=Carnotaur Battlegloves", "=ds=#s9#, #a4#" },
				{ 5, 95201, "", "=q4=Skullsmashing Gauntlets", "=ds=#s9#, #a4#" },
				{ 6, 95198, "", "=q4=Vulcanodon Gauntlets", "=ds=#s9#, #a4#" },
				{ 7, 95192, "", "=q4=Belt of the Tyrannotitan", "=ds=#s10#, #a4#" },
				{ 8, 95191, "", "=q4=Voolar's Bloodied Belt", "=ds=#s10#, #a4#" },
				{ 9, 95190, "", "=q4=Waistband of Furious Stomping", "=ds=#s10#, #a4#" },
				{ 11, 94228, "", "=q4=Reins of the Cobalt Primordial Direhorn", "=ds=#e26#" },
				{ 12, 95601, "", "=q4=Shiny Pile of Refuse", "=ds=#m20#" },
				{ 16, 95181, "", "=q4=Amulet of the Titanorex", "=ds=#s2#" },
				{ 17, 95177, "", "=q4=Choker of Stygimolochy", "=ds=#s2#" },
				{ 18, 95178, "", "=q4=Lootraptor's Amulet", "=ds=#s2#" },
				{ 19, 95179, "", "=q4=Necklace of the Hazillosaurus", "=ds=#s2#" },
				{ 20, 95180, "", "=q4=Overcompensating Chain of the Alpha Male", "=ds=#s2#" },
				{ 22, 95165, "", "=q4=Achillobator Ring", "=ds=#s13#" },
				{ 23, 95164, "", "=q4=Eye of Oondasta", "=ds=#s13#" },
				{ 24, 95166, "", "=q4=Forzarra's Last Meal", "=ds=#s13#" },
				{ 25, 95167, "", "=q4=Ring of King Kangrom", "=ds=#s13#" },
				{ 26, 95163, "", "=q4=Ring of Shamuru", "=ds=#s13#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Oondasta", 826),
			module = moduleName, instance = "Pandaria",
		};
	};

	AtlasLoot_Data["ShaofAnger"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_starfall", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Balance"]};
				{ 2, 85308, "", "=q4=Eternal Blossom Gloves", "=ds=#s9#, #a2#"};
				{ 3, 85306, "", "=q4=Eternal Blossom Leggings", "=ds=#s11#, #a2#"};
				{ 5, 0, "ability_druid_catform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..AL["DPS"]};
				{ 6, 85312, "", "=q4=Eternal Blossom Grips", "=ds=#s9#, #a2#"};
				{ 7, 85310, "", "=q4=Eternal Blossom Legguards", "=ds=#s11#, #a2#"};
				{ 9, 0, "spell_nature_healingtouch", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Restoration"]};
				{ 10, 85358, "", "=q4=Eternal Blossom Handwraps", "=ds=#s9#, #a2#"};
				{ 11, 85356, "", "=q4=Eternal Blossom Legwraps", "=ds=#s11#, #a2#"};
				{ 13, 0, "ability_racial_bearform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Guardian"]};
				{ 14, 85380, "", "=q4=Eternal Blossom Handguards", "=ds=#s9#, #a2#"};
				{ 15, 85382, "", "=q4=Eternal Blossom Breeches", "=ds=#s11#, #a2#"};
				{ 16, 0, "spell_nature_starfall", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Balance"]};
				{ 17, 84843, "", "=q4=Malevolent Gladiator's Wyrmhide Gloves", "=ds=#s9#, #a2#"};
				{ 20, 0, "ability_druid_catform", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Feral"]};
				{ 21, 84832, "", "=q4=Malevolent Gladiator's Dragonhide Gloves", "=ds=#s9#, #a2#"};
				{ 24, 0, "spell_nature_healingtouch", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DRUID"], "=q5="..ALIL["Restoration"]};
				{ 25, 84833, "", "=q4=Malevolent Gladiator's Kodohide Gloves", "=ds=#s9#, #a2#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["DRUID"];
			};
			{
				{ 1, 0, "inv_weapon_bow_07", "=q6="..LOCALIZED_CLASS_NAMES_MALE["HUNTER"], ""};
				{ 2, 85297, "", "=q4=Yaungol Slayer's Gloves", "=ds=#s9#, #a3#"};
				{ 3, 85295, "", "=q4=Yaungol Slayer's Legguards", "=ds=#s11#, #a3#"};
				{ 5, 0, "inv_staff_13", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MAGE"], ""};
				{ 6, 85378, "", "=q4=Gloves of the Burning Scroll", "=ds=#s9#, #a1#"};
				{ 7, 85376, "", "=q4=Leggings of the Burning Scroll", "=ds=#s11#, #a1#"};
				{ 9, 0, "inv_throwingknife_04", "=q6="..LOCALIZED_CLASS_NAMES_MALE["ROGUE"], ""};
				{ 10, 85302, "", "=q4=Gloves of the Thousandfold Blades", "=ds=#s9#, #a2#"};
				{ 11, 85300, "", "=q4=Legguards of the Thousandfold Blades", "=ds=#s11#, #a2#"};
				{ 13, 0, "spell_nature_drowsy", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"], ""};
				{ 14, 85369, "", "=q4=Sha-Skin Gloves", "=ds=#s9#, #a1#"};
				{ 15, 85371, "", "=q4=Sha-Skin Leggings", "=ds=#s11#, #a1#"};
				{ 16, 0, "inv_weapon_bow_07", "=q6="..LOCALIZED_CLASS_NAMES_MALE["HUNTER"], ""};
				{ 17, 84841, "", "=q4=Malevolent Gladiator's Chain Gauntlets", "=ds=#s9#, #a3#"};
				{ 20, 0, "inv_staff_13", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MAGE"], ""};
				{ 21, 84837, "", "=q4=Malevolent Gladiator's Silk Handguards", "=ds=#s9#, #a1#"};
				{ 24, 0, "inv_throwingknife_04", "=q6="..LOCALIZED_CLASS_NAMES_MALE["ROGUE"], ""};
				{ 25, 84830, "", "=q4=Malevolent Gladiator's Leather Gloves", "=ds=#s9#, #a2#"};
				{ 28, 0, "spell_nature_drowsy", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"], ""};
				{ 29, 84842, "", "=q4=Malevolent Gladiator's Felweave Handguards", "=ds=#s9#, #a1#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["HUNTER"].." / "..LOCALIZED_CLASS_NAMES_MALE["MAGE"].." / "..LOCALIZED_CLASS_NAMES_MALE["ROGUE"].." / "..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"];
			};
			{
				{ 1, 0, "spell_monk_brewmaster_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Brewmaster"]};
				{ 2, 85387, "", "=q4=Red Crane Gauntlets", "=ds=#s9#, #a2#"};
				{ 3, 85385, "", "=q4=Red Crane Legguards", "=ds=#s11#, #a2#"};
				{ 5, 0, "spell_monk_mistweaver_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Mistweaver"]};
				{ 6, 85389, "", "=q4=Red Crane Handwraps", "=ds=#s9#, #a2#"};
				{ 7, 85391, "", "=q4=Red Crane Legwraps", "=ds=#s11#, #a2#"};
				{ 9, 0, "spell_monk_windwalker_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Windwalker"]};
				{ 10, 85395, "", "=q4=Red Crane Grips", "=ds=#s9#, #a2#"};
				{ 11, 85397, "", "=q4=Red Crane Leggings", "=ds=#s11#, #a2#"};
				{ 20, 0, "spell_monk_mistweaver_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Mistweaver"]};
				{ 21, 84836, "", "=q4=Malevolent Gladiator's Copperskin Gloves", "=ds=#s9#, #a2#"};
				{ 24, 0, "spell_monk_windwalker_spec", "=q6="..LOCALIZED_CLASS_NAMES_MALE["MONK"], "=q5="..ALIL["Windwalker"]};
				{ 25, 84839, "", "=q4=Malevolent Gladiator's Ironskin Gloves", "=ds=#s9#, #a2#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["MONK"];
			};
			{
				{ 1, 0, "Spell_Holy_HolyBolt", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Holy"]};
				{ 2, 85347, "", "=q4=White Tiger Gloves", "=ds=#s9#, #a4#"};
				{ 3, 85345, "", "=q4=White Tiger Greaves", "=ds=#s11#, #a4#"};
				{ 5, 0, "Spell_Holy_AuraOfLight", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Retribution"]};
				{ 6, 85342, "", "=q4=White Tiger Gauntlets", "=ds=#s9#, #a4#"};
				{ 7, 85340, "", "=q4=White Tiger Legplates", "=ds=#s11#, #a4#"};
				{ 9, 0, "spell_holy_devotionaura", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Protection"]};
				{ 10, 85322, "", "=q4=White Tiger Handguards", "=ds=#s9#, #a4#"};
				{ 11, 85320, "", "=q4=White Tiger Legguards", "=ds=#s11#, #a4#"};
				{ 16, 0, "Spell_Holy_HolyBolt", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Holy"]};
				{ 17, 84831, "", "=q4=Malevolent Gladiator's Ornamented Gloves", "=ds=#s9#, #a4#"};
				{ 20, 0, "Spell_Holy_AuraOfLight", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PALADIN"], "=q5="..ALIL["Retribution"]};
				{ 21, 84834, "", "=q4=Malevolent Gladiator's Scaled Gauntlets", "=ds=#s9#, #a4#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["PALADIN"];
			};
			{
				{ 1, 0, "spell_holy_guardianspirit", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Holy"]};
				{ 2, 85363, "", "=q4=Guardian Serpent Handwraps", "=ds=#s9#, #a1#"};
				{ 3, 85361, "", "=q4=Guardian Serpent Legwraps", "=ds=#s11#, #a1#"};
				{ 5, 0, "spell_shadow_shadowwordpain", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Shadow"]};
				{ 6, 85364, "", "=q4=Guardian Serpent Gloves", "=ds=#s9#, #a1#"};
				{ 7, 85366, "", "=q4=Guardian Serpent Leggings", "=ds=#s11#, #a1#"};
				{ 16, 0, "spell_holy_guardianspirit", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Holy"]};
				{ 17, 84846, "", "=q4=Malevolent Gladiator's Mooncloth Gloves", "=ds=#s9#, #a1#"};
				{ 20, 0, "spell_shadow_shadowwordpain", "=q6="..LOCALIZED_CLASS_NAMES_MALE["PRIEST"], "=q5="..ALIL["Shadow"]};
				{ 21, 84838, "", "=q4=Malevolent Gladiator's Satin Gloves", "=ds=#s9#, #a1#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["PRIEST"];
			};
			{
				{ 1, 0, "Spell_Nature_Lightning", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Elemental"]};
				{ 2, 85290, "", "=q4=Firebird's Gloves", "=ds=#s9#, #a3#"};
				{ 3, 85292, "", "=q4=Firebird's Kilt", "=ds=#s11#, #a3#"};
				{ 5, 0, "spell_nature_lightningshield", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Enhancement"]};
				{ 6, 85287, "", "=q4=Firebird's Grips", "=ds=#s9#, #a3#"};
				{ 7, 85285, "", "=q4=Firebird's Legguards", "=ds=#s11#, #a3#"};
				{ 9, 0, "spell_nature_magicimmunity", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Restoration"]};
				{ 10, 85352, "", "=q4=Firebird's Handwraps", "=ds=#s9#, #a3#"};
				{ 11, 85350, "", "=q4=Firebird's Legwraps", "=ds=#s11#, #a3#"};
				{ 16, 0, "Spell_Nature_Lightning", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Elemental"]};
				{ 17, 84845, "", "=q4=Malevolent Gladiator's Mail Gauntlets", "=ds=#s9#, #a3#"};
				{ 20, 0, "spell_nature_lightningshield", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Enhancement"]};
				{ 21, 84844, "", "=q4=Malevolent Gladiator's Linked Gauntlets", "=ds=#s9#, #a3#"};
				{ 24, 0, "spell_nature_magicimmunity", "=q6="..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"], "=q5="..ALIL["Restoration"]};
				{ 25, 84847, "", "=q4=Malevolent Gladiator's Ringmail Gauntlets", "=ds=#s9#, #a3#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"];
			};
			{
				{ 1, 0, "spell_deathknight_frostpresence", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"], "=q5="..AL["DPS"]};
				{ 2, 85337, "", "=q4=Gauntlets of the Lost Catacomb", "=ds=#s9#, #a4#"};
				{ 3, 85335, "", "=q4=Greaves of the Lost Catacomb", "=ds=#s11#, #a4#"};
				{ 5, 0, "spell_deathknight_bloodpresence", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"], "=q5="..AL["Tanking"]};
				{ 6, 85317, "", "=q4=Handguards of the Lost Catacomb", "=ds=#s9#, #a4#"};
				{ 7, 85315, "", "=q4=Legguards of the Lost Catacomb", "=ds=#s11#, #a4#"};
				{ 9, 0, "ability_warrior_innerrage", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"], "=q5="..AL["DPS"]};
				{ 10, 85331, "", "=q4=Gauntlets of Resounding Rings", "=ds=#s9#, #a4#"};
				{ 11, 85330, "", "=q4=Legplates of Resounding Rings", "=ds=#s11#, #a4#"};
				{ 13, 0, "ability_warrior_defensivestance", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"], "=q5="..ALIL["Protection"]};
				{ 14, 85327, "", "=q4=Handguards of Resounding Rings", "=ds=#s9#, #a4#"};
				{ 15, 85325, "", "=q4=Legguards of Resounding Rings", "=ds=#s11#, #a4#"};
				{ 16, 0, "spell_deathknight_classicon", "=q6="..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"]};
				{ 17, 84835, "", "=q4=Malevolent Gladiator's Dreadplate Gauntlets", "=ds=#s9#, #a4#"};
				{ 24, 0, "inv_sword_27", "=q6="..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"]};
				{ 25, 84840, "", "=q4=Malevolent Gladiator's Plate Gauntlets", "=ds=#s9#, #a4#"};
				extraText = ": "..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"].." / "..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"];
			};
			{
				{ 1, 84977, "", "=q4=Malevolent Gladiator's Cuffs of Accuracy", "=ds="};
				{ 2, 84955, "", "=q4=Malevolent Gladiator's Cord of Accuracy", "=ds="};
				{ 3, 84815, "", "=q4=Malevolent Gladiator's Treads of Alacrity", "=ds="};
				{ 5, 84979, "", "=q4=Malevolent Gladiator's Cuffs of Meditation", "=ds="};
				{ 6, 84956, "", "=q4=Malevolent Gladiator's Cord of Meditation", "=ds="};
				{ 7, 84816, "", "=q4=Malevolent Gladiator's Treads of Meditation", "=ds="};
				{ 9, 84978, "", "=q4=Malevolent Gladiator's Cuffs of Prowess", "=ds="};
				{ 10, 84954, "", "=q4=Malevolent Gladiator's Cord of Cruelty", "=ds="};
				{ 11, 84814, "", "=q4=Malevolent Gladiator's Treads of Cruelty", "=ds="};
				{ 16, 84973, "", "=q4=Malevolent Gladiator's Armwraps of Accuracy", "=ds="};
				{ 17, 84948, "", "=q4=Malevolent Gladiator's Waistband of Accuracy", "=ds="};
				{ 18, 84808, "", "=q4=Malevolent Gladiator's Boots of Cruelty", "=ds="};
				{ 20, 84972, "", "=q4=Malevolent Gladiator's Armwraps of Alacrity", "=ds="};
				{ 21, 84947, "", "=q4=Malevolent Gladiator's Waistband of Cruelty", "=ds="};
				{ 22, 84809, "", "=q4=Malevolent Gladiator's Boots of Alacrity", "=ds="};
				{ 24, 84982, "", "=q4=Malevolent Gladiator's Bindings of Prowess", "=ds="};
				{ 25, 84960, "", "=q4=Malevolent Gladiator's Belt of Cruelty", "=ds="};
				{ 26, 84819, "", "=q4=Malevolent Gladiator's Footguards of Alacrity", "=ds="};
				{ 28, 84976, "", "=q4=Malevolent Gladiator's Bindings of Meditation", "=ds="};
				{ 29, 84953, "", "=q4=Malevolent Gladiator's Belt of Meditation", "=ds="};
				{ 30, 84813, "", "=q4=Malevolent Gladiator's Footguards of Meditation", "=ds="};
				extraText = ": "..AL["PvP Non-Set Epics"].." - "..BabbleInventory["Cloth"].." / "..BabbleInventory["Leather"];
			};
			{
				{ 1, 84984, "", "=q4=Malevolent Gladiator's Armbands of Meditation", "=ds="};
				{ 2, 84946, "", "=q4=Malevolent Gladiator's Waistguard of Meditation", "=ds="};
				{ 3, 84821, "", "=q4=Malevolent Gladiator's Footguards of Meditation", "=ds="};
				{ 5, 84983, "", "=q4=Malevolent Gladiator's Armbands of Prowess", "=ds="};
				{ 6, 84959, "", "=q4=Malevolent Gladiator's Waistguard of Cruelty", "=ds="};
				{ 7, 84820, "", "=q4=Malevolent Gladiator's Footguards of Alacrity", "=ds="};
				{ 9, 84980, "", "=q4=Malevolent Gladiator's Wristguards of Alacrity", "=ds="};
				{ 10, 84958, "", "=q4=Malevolent Gladiator's Links of Cruelty", "=ds="};
				{ 11, 84818, "", "=q4=Malevolent Gladiator's Sabatons of Alacrity", "=ds="};
				{ 13, 84981, "", "=q4=Malevolent Gladiator's Wristguards of Accuracy", "=ds="};
				{ 14, 84957, "", "=q4=Malevolent Gladiator's Links of Accuracy", "=ds="};
				{ 15, 84817, "", "=q4=Malevolent Gladiator's Sabatons of Cruelty", "=ds="};
				{ 16, 84975, "", "=q4=Malevolent Gladiator's Bracers of Meditation", "=ds="};
				{ 17, 84952, "", "=q4=Malevolent Gladiator's Clasp of Meditation", "=ds="};
				{ 18, 84812, "", "=q4=Malevolent Gladiator's Greaves of Meditation", "=ds="};
				{ 20, 84985, "", "=q4=Malevolent Gladiator's Armplates of Proficiency", "=ds="};
				{ 21, 84949, "", "=q4=Malevolent Gladiator's Girdle of Accuracy", "=ds="};
				{ 22, 84810, "", "=q4=Malevolent Gladiator's Warboots of Cruelty", "=ds="};
				{ 24, 84974, "", "=q4=Malevolent Gladiator's Bracers of Prowess", "=ds="};
				{ 25, 84951, "", "=q4=Malevolent Gladiator's Clasp of Cruelty", "=ds="};
				{ 26, 84811, "", "=q4=Malevolent Gladiator's Greaves of Alacrity", "=ds="};
				{ 28, 84986, "", "=q4=Malevolent Gladiator's Armplates of Alacrity", "=ds="};
				{ 29, 84950, "", "=q4=Malevolent Gladiator's Girdle of Prowess", "=ds="};
				{ 30, 84822, "", "=q4=Malevolent Gladiator's Warboots of Alacrity", "=ds="};
				extraText = ": "..AL["PvP Non-Set Epics"].." - "..BabbleInventory["Mail"].." / "..BabbleInventory["Plate"];
			};
			{
				{ 1, 84804, "", "=q4=Malevolent Gladiator's Cape of Cruelty", "=ds=#s4#" },
				{ 2, 84805, "", "=q4=Malevolent Gladiator's Cape of Prowess", "=ds=#s4#" },
				{ 3, 84807, "", "=q4=Malevolent Gladiator's Cloak of Alacrity", "=ds=#s4#" },
				{ 4, 84806, "", "=q4=Malevolent Gladiator's Cloak of Prowess", "=ds=#s4#" },
				{ 5, 84801, "", "=q4=Malevolent Gladiator's Drape of Cruelty", "=ds=#s4#"},
				{ 6, 84802, "", "=q4=Malevolent Gladiator's Drape of Meditation", "=ds=#s4#" },
				{ 7, 84803, "", "=q4=Malevolent Gladiator's Drape of Prowess", "=ds=#s4#" },
				{ 9, 84824, "", "=q4=Malevolent Gladiator's Band of Accuracy", "=ds=#s13#" };
				{ 10, 84823, "", "=q4=Malevolent Gladiator's Band of Cruelty", "=ds=#s13#" };
				{ 11, 84825, "", "=q4=Malevolent Gladiator's Band of Meditation", "=ds=#s13#" };
				{ 12, 84829, "", "=q4=Malevolent Gladiator's Signet of Accuracy", "=ds=#s13#" };
				{ 13, 84828, "", "=q4=Malevolent Gladiator's Signet of Cruelty", "=ds=#s13#" };
				{ 14, 84827, "", "=q4=Malevolent Gladiator's Ring of Accuracy", "=ds=#s13#" };
				{ 15, 84826, "", "=q4=Malevolent Gladiator's Ring of Cruelty", "=ds=#s13#" };
				{ 16, 84892, "", "=q4=Malevolent Gladiator's Choker of Accuracy", "=ds=#s2#" },
				{ 17, 84891, "", "=q4=Malevolent Gladiator's Choker of Proficiency", "=ds=#s2#" },
				{ 18, 84889, "", "=q4=Malevolent Gladiator's Necklace of Proficiency", "=ds=#s2#" },
				{ 19, 84890, "", "=q4=Malevolent Gladiator's Necklace of Prowess", "=ds=#s2#" },
				{ 20, 84886, "", "=q4=Malevolent Gladiator's Pendant of Alacrity", "=ds=#s2#" },
				{ 21, 84887, "", "=q4=Malevolent Gladiator's Pendant of Cruelty", "=ds=#s2#" },
				{ 22, 84888, "", "=q4=Malevolent Gladiator's Pendant of Meditation", "=ds=#s2#" },
				extraText = ": "..AL["PvP Accessories"];
			};
			{
				{ 1, 89317, "", "=q4=Claw of Anger", "=ds=#m2#: #QUESTID:31809#", "", "100%" },
				{ 3, 90911, "", "=q4=Furyheart Treads", "=ds=#s12#, #a1#" },
				{ 4, 90914, "", "=q4=Boots of Raging Haze", "=ds=#s12#, #a2#" },
				{ 5, 90907, "", "=q4=Boots of Unbreakable Umbrage", "=ds=#s12#, #a3#" },
				{ 6, 90912, "", "=q4=Angerforged Stompers", "=ds=#s12#, #a4#"},
				{ 7, 90910, "", "=q4=Mindfire Sollerets", "=ds=#s12#, #a4#"},
				{ 18, 90913, "", "=q4=Sandals of the Shadow", "=ds=#s12#, #a1#" },
				{ 19, 90908, "", "=q4=Crushing Treads of Anger", "=ds=#s12#, #a2#" },
				{ 20, 90906, "", "=q4=Treads of Ardent Antagonism", "=ds=#s12#, #a3#" };
				{ 21, 90909, "", "=q4=Intemperate Greatboots", "=ds=#s12#, #a4#" };
				extraText = ": "..AL["Quest Reward"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Sha of Anger", 691),
			module = moduleName, menu = "SHAOFANGER", instance = "Pandaria",
		};
	};

	AtlasLoot_Data["SalyisWarband"] = {
		["Normal"] = {
			{
				{ 1, 90408, "", "=q4=Free Spirit Hood", "=ds=#s1#, #a1#" },
				{ 2, 90409, "", "=q4=Sky-Sear Cowl", "=ds=#s1#, #a1#" },
				{ 3, 90417, "", "=q4=Robes of Blue Skies", "=ds=#s5#, #a1#" },
				{ 4, 90418, "", "=q4=Robes of the Lightning Rider", "=ds=#s5#, #a1#" },
				{ 5, 90449, "", "=q4=Belt of Detonation", "=ds=#s10#, #a1#" },
				{ 6, 90448, "", "=q4=Cannonfire Cord", "=ds=#s10#, #a1#" },
				{ 7, 90439, "", "=q4=Open Steppe Sandals", "=ds=#s12#, #a1#" },
				{ 8, 90440, "", "=q4=Slippers of Fiery Retribution", "=ds=#s12#, #a1#" },
				{ 10, 90413, "", "=q4=Crest of the Grand Warband", "=ds=#s1#, #a3#" },
				{ 11, 90412, "", "=q4=Helm of Restoring Wind", "=ds=#s1#, #a3#" },
				{ 12, 90422, "", "=q4=Armor of the Single Cloud", "=ds=#s5#, #a3#" },
				{ 13, 90421, "", "=q4=Chain of Unsiezed Skies", "=ds=#s5#, #a3#" },
				{ 16, 90410, "", "=q4=Cap of Wandering Pride", "=ds=#s1#, #a2#" },
				{ 17, 90411, "", "=q4=Facemask of Unrepentant Banditry", "=ds=#s1#, #a2#" },
				{ 18, 90419, "", "=q4=Fireproofed Chestguard", "=ds=#s5#, #a2#" },
				{ 19, 90420, "", "=q4=Flameshot Wrap", "=ds=#s5#, #a2#" },
				{ 20, 90451, "", "=q4=Cannoneer's Gunpowder Carrier", "=ds=#s10#, #a2#" },
				{ 21, 90450, "", "=q4=Carrot-Holder Belt", "=ds=#s10#, #a2#" },
				{ 22, 90442, "", "=q4=Flamefoot Tabi", "=ds=#s12#, #a2#" },
				{ 23, 90441, "", "=q4=Stompdodger Boots", "=ds=#s12#, #a2#" },
				{ 25, 90453, "", "=q4=Girdle of the Raging Rider", "=ds=#s10#, #a3#" },
				{ 26, 90452, "", "=q4=Sparkmaker Girdle", "=ds=#s10#, #a3#" },
				{ 27, 90443, "", "=q4=Burnmender Boots", "=ds=#s12#, #a3#" },
				{ 28, 90444, "", "=q4=Treads of Gentle Nudges", "=ds=#s12#, #a3#" },
			};
			{
				{ 1, 90416, "", "=q4=Crown of Ranging Invasion", "=ds=#s1#, #a4#" },
				{ 2, 90415, "", "=q4=Giantfoot Headguard", "=ds=#s1#, #a4#" },
				{ 3, 90414, "", "=q4=Greathelm of the Monstrous Mushan", "=ds=#s1#, #a4#" },
				{ 4, 90425, "", "=q4=Carapace of Crushed Conviction", "=ds=#s5#, #a4#" },
				{ 5, 90423, "", "=q4=Chestguard of the Unbowed Back", "=ds=#s5#, #a4#" },
				{ 6, 90424, "", "=q4=Ravaging Warrior's Chestplate", "=ds=#s5#, #a4#" },
				{ 7, 90456, "", "=q4=Cord of Crazed Strength", "=ds=#s10#, #a4#" },
				{ 8, 90454, "", "=q4=Girdle of the Galloping Giant", "=ds=#s10#, #a4#" },
				{ 9, 90455, "", "=q4=Greatbelt of Livid Fury", "=ds=#s10#, #a4#" },
				{ 10, 90445, "", "=q4=Firerider Treads", "=ds=#s12#, #a4#" },
				{ 11, 90446, "", "=q4=Silverspur Warboots", "=ds=#s12#, #a4#" },
				{ 12, 90447, "", "=q4=Stompers of Vigorous Stomping", "=ds=#s12#, #a4#" },
				{ 16, 90432, "", "=q4=Hellrider's Choker", "=ds=#s2#" },
				{ 17, 90433, "", "=q4=Mushan Rider's Collar", "=ds=#s2#" },
				{ 18, 90429, "", "=q4=Necklace of Imbued Fury", "=ds=#s2#" },
				{ 19, 90431, "", "=q4=Saddlebinder Links", "=ds=#s2#" },
				{ 20, 90430, "", "=q4=Stomphowl Pendant", "=ds=#s2#" },
				{ 22, 90436, "", "=q4=Circle of Scaled Fury", "=ds=#s13#" },
				{ 23, 90437, "", "=q4=Hereditary Saurok Loop", "=ds=#s13#" },
				{ 24, 90435, "", "=q4=Ring of Wretched Flames", "=ds=#s13#" },
				{ 25, 90438, "", "=q4=Signet of the Bandit Lord", "=ds=#s13#" },
				{ 26, 90434, "", "=q4=Steaming Seal of Flame", "=ds=#s13#" },
				{ 28, 89783, "", "=q4=Son of Galleon's Saddle", "=ds=#e26#" },
				{ 29, 90840, "", "=q3=Marauder's Gleaming Sack of Gold", "=ds=#m20#" },
			}
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Salyis's Warband", 725),
			module = moduleName, instance = "Pandaria",
		};
	};

		---------------------------------
		--- Terrace of Endless Spring ---
		---------------------------------

	AtlasLoot_Data["ToESProtectors"] = {
		["RaidFinder"] = {
			{
				{ 1, 86874, "", "=q4=Cloak of Overwhelming Corruption", "=ds=#s4#" },
				{ 2, 86875, "", "=q4=Cuffs of the Corrupted Waters", "=ds=#s8#, #a1#" },
				{ 3, 86878, "", "=q4=Asani's Uncleansed Sandals", "=ds=#s12#, #a2#" },
				{ 4, 86877, "", "=q4=Lightning Prisoner's Boots", "=ds=#s12#, #a3#" },
				{ 5, 86876, "", "=q4=Casque of Expelled Corruption", "=ds=#s1#, #a4#" },
				{ 6, 86868, "", "=q4=Bracers of Defiled Earth", "=ds=#s8#, #a4#" },
				{ 7, 86870, "", "=q4=Deepwater Greatboots", "=ds=#s12#, #a4#" },
				{ 9, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 86872, "", "=q4=Kaolan's Withering Necklace", "=ds=#s2#" },
				{ 17, 86871, "", "=q4=Shackle of Eversparks", "=ds=#s2#" },
				{ 18, 86869, "", "=q4=Regail's Band of the Endless", "=ds=#s13#" },
				{ 19, 86873, "", "=q4=Watersoul Signet", "=ds=#s13#" },
				{ 21, 86909, "", "=q4=Regail's Crackling Dagger", "=ds=#h1#, #w4#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86316, "", "=q4=Cloak of Overwhelming Corruption", "=ds=#s4#" },
				{ 2, 86317, "", "=q4=Cuffs of the Corrupted Waters", "=ds=#s8#, #a1#" },
				{ 3, 86320, "", "=q4=Asani's Uncleansed Sandals", "=ds=#s12#, #a2#" },
				{ 4, 86319, "", "=q4=Lightning Prisoner's Boots", "=ds=#s12#, #a3#" },
				{ 5, 86318, "", "=q4=Casque of Expelled Corruption", "=ds=#s1#, #a4#" },
				{ 6, 86230, "", "=q4=Bracers of Defiled Earth", "=ds=#s8#, #a4#" },
				{ 7, 86232, "", "=q4=Deepwater Greatboots", "=ds=#s12#, #a4#" },
				{ 8, 86234, "", "=q4=Kaolan's Withering Necklace", "=ds=#s2#" },
				{ 9, 86233, "", "=q4=Shackle of Eversparks", "=ds=#s2#" },
				{ 10, 86231, "", "=q4=Regail's Band of the Endless", "=ds=#s13#" },
				{ 11, 86315, "", "=q4=Watersoul Signet", "=ds=#s13#" },
				{ 12, 86390, "", "=q4=Regail's Crackling Dagger", "=ds=#h1#, #w4#" },
				{ 14, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 0, "inv_box_04", "=q6="..AL["Elite"], ""};
				{ 17, 90526, "", "=q4=Cloak of Overwhelming Corruption", "=ds=#s4#" },
				{ 18, 90524, "", "=q4=Cuffs of the Corrupted Waters", "=ds=#s8#, #a1#" },
				{ 19, 90528, "", "=q4=Asani's Uncleansed Sandals", "=ds=#s12#, #a2#" },
				{ 20, 90518, "", "=q4=Legguards of Failing Purification", "=ds=#s11#, #a2#" },
				{ 21, 90519, "", "=q4=Waterborne Shoulderguards", "=ds=#s3#, #a3#" },
				{ 22, 90529, "", "=q4=Lightning Prisoner's Boots", "=ds=#s12#, #a3#" },
				{ 23, 90530, "", "=q4=Casque of Expelled Corruption", "=ds=#s1#, #a4#" },
				{ 24, 90520, "", "=q4=Bracers of Defiled Earth", "=ds=#s8#, #a4#" },
				{ 25, 90521, "", "=q4=Deepwater Greatboots", "=ds=#s12#, #a4#" },
				{ 26, 90523, "", "=q4=Kaolan's Withering Necklace", "=ds=#s2#" },
				{ 27, 90522, "", "=q4=Shackle of Eversparks", "=ds=#s2#" },
				{ 28, 90517, "", "=q4=Regail's Band of the Endless", "=ds=#s13#" },
				{ 29, 90525, "", "=q4=Watersoul Signet", "=ds=#s13#" },
				{ 30, 90527, "", "=q4=Regail's Crackling Dagger", "=ds=#h1#, #w4#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87150, "", "=q4=Cloak of Overwhelming Corruption", "=ds=#s4#" },
				{ 2, 87149, "", "=q4=Cuffs of the Corrupted Waters", "=ds=#s8#, #a1#" },
				{ 3, 87153, "", "=q4=Asani's Uncleansed Sandals", "=ds=#s12#, #a2#" },
				{ 4, 87154, "", "=q4=Lightning Prisoner's Boots", "=ds=#s12#, #a3#" },
				{ 5, 87155, "", "=q4=Casque of Expelled Corruption", "=ds=#s1#, #a4#" },
				{ 6, 87145, "", "=q4=Bracers of Defiled Earth", "=ds=#s8#, #a4#" },
				{ 7, 87146, "", "=q4=Deepwater Greatboots", "=ds=#s12#, #a4#" },
				{ 8, 87148, "", "=q4=Kaolan's Withering Necklace", "=ds=#s2#" },
				{ 9, 87147, "", "=q4=Shackle of Eversparks", "=ds=#s2#" },
				{ 10, 87144, "", "=q4=Regail's Band of the Endless", "=ds=#s13#" },
				{ 11, 87151, "", "=q4=Watersoul Signet", "=ds=#s13#" },
				{ 12, 87152, "", "=q4=Regail's Crackling Dagger", "=ds=#h1#, #w4#" },
				{ 14, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 0, "inv_box_04", "=q6="..AL["Elite"], ""};
				{ 17, 90512, "", "=q4=Cloak of Overwhelming Corruption", "=ds=#s4#" },
				{ 18, 90510, "", "=q4=Cuffs of the Corrupted Waters", "=ds=#s8#, #a1#" },
				{ 19, 90514, "", "=q4=Asani's Uncleansed Sandals", "=ds=#s12#, #a2#" },
				{ 20, 90504, "", "=q4=Legguards of Failing Purification", "=ds=#s11#, #a2#" },
				{ 21, 90505, "", "=q4=Waterborne Shoulderguards", "=ds=#s3#, #a3#" },
				{ 22, 90515, "", "=q4=Lightning Prisoner's Boots", "=ds=#s12#, #a3#" },
				{ 23, 90516, "", "=q4=Casque of Expelled Corruption", "=ds=#s1#, #a4#" },
				{ 24, 90506, "", "=q4=Bracers of Defiled Earth", "=ds=#s8#, #a4#" },
				{ 25, 90507, "", "=q4=Deepwater Greatboots", "=ds=#s12#, #a4#" },
				{ 26, 90509, "", "=q4=Kaolan's Withering Necklace", "=ds=#s2#" },
				{ 27, 90508, "", "=q4=Shackle of Eversparks", "=ds=#s2#" },
				{ 28, 90503, "", "=q4=Regail's Band of the Endless", "=ds=#s13#" },
				{ 29, 90511, "", "=q4=Watersoul Signet", "=ds=#s13#" },
				{ 30, 90513, "", "=q4=Regail's Crackling Dagger", "=ds=#h1#, #w4#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Protectors of the Endless", 683),
			module = moduleName, instance = "TerraceofEndlessSpring",
		};
	};

	AtlasLoot_Data["ToESTsulong"] = {
		["RaidFinder"] = {
			{
				{ 1, 86883, "", "=q4=Daybreak Drape", "=ds=#s4#" },
				{ 2, 89982, "", "=q4=Shoulderpads of Twisted Fate", "=ds=#s3#, #a1#" },
				{ 3, 86884, "", "=q4=Belt of Embodied Terror", "=ds=#s10#, #a1#" },
				{ 4, 86895, "", "=q4=Healer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 5, 86896, "", "=q4=Invoker's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 6, 86897, "", "=q4=Sorcerer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 7, 86888, "", "=q4=Sandals of the Blackest Night", "=ds=#s12#, #a1#" },
				{ 8, 89980, "", "=q4=Gauntlets of the Shadow's Caress", "=ds=#s9#, #a2#" },
				{ 9, 86899, "", "=q4=Stalker's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 10, 86898, "", "=q4=Weaver's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 11, 89983, "", "=q4=Fear-Blackened Leggings", "=ds=#s11#, #a2#" },
				{ 12, 86882, "", "=q4=Sunwrought Mail Hauberk", "=ds=#s5#, #a3#" },
				{ 13, 86900, "", "=q4=Binder's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 14, 86901, "", "=q4=Ranger's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 15, 89981, "", "=q4=Grasps of Serpentine Might", "=ds=#s9#, #a4#" },
				{ 16, 86902, "", "=q4=Mender's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 17, 86904, "", "=q4=Patroller's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 18, 86903, "", "=q4=Protector's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 19, 86887, "", "=q4=Sollerets of Instability", "=ds=#s12#, #a4#" },
				{ 21, 86880, "", "=q4=Dread Shadow Ring", "=ds=#s13#" },
				{ 22, 86885, "", "=q4=Spirits of the Sun", "=ds=#s14#" },
				{ 23, 86881, "", "=q4=Stuff of Nightmares", "=ds=#s14#" },
				{ 25, 86886, "", "=q4=Loshan, Terror Incarnate", "=ds=#h1#, #w10#" },
				{ 26, 86879, "", "=q4=Gao-Rei, Staff of the Legendary Protector", "=ds=#w9#" },
				{ 28, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86325, "", "=q4=Daybreak Drape", "=ds=#s4#" },
				{ 2, 89883, "", "=q4=Shoulderpads of Twisted Fate", "=ds=#s3#, #a1#" },
				{ 3, 86326, "", "=q4=Belt of Embodied Terror", "=ds=#s10#, #a1#" },
				{ 4, 86337, "", "=q4=Healer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 5, 86338, "", "=q4=Invoker's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 6, 86339, "", "=q4=Sorcerer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 7, 86330, "", "=q4=Sandals of the Blackest Night", "=ds=#s12#, #a1#" },
				{ 8, 89842, "", "=q4=Gauntlets of the Shadow's Caress", "=ds=#s9#, #a2#" },
				{ 9, 86341, "", "=q4=Stalker's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 10, 86340, "", "=q4=Weaver's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 11, 89884, "", "=q4=Fear-Blackened Leggings", "=ds=#s11#, #a2#" },
				{ 12, 86324, "", "=q4=Sunwrought Mail Hauberk", "=ds=#s5#, #a3#" },
				{ 13, 86342, "", "=q4=Binder's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 14, 86343, "", "=q4=Ranger's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 15, 89843, "", "=q4=Grasps of Serpentine Might", "=ds=#s9#, #a4#" },
				{ 16, 86383, "", "=q4=Mender's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 17, 86385, "", "=q4=Patroller's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 18, 86384, "", "=q4=Protector's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 19, 86329, "", "=q4=Sollerets of Instability", "=ds=#s12#, #a4#" },
				{ 21, 86322, "", "=q4=Dread Shadow Ring", "=ds=#s13#" },
				{ 22, 86327, "", "=q4=Spirits of the Sun", "=ds=#s14#" },
				{ 23, 86323, "", "=q4=Stuff of Nightmares", "=ds=#s14#" },
				{ 25, 86328, "", "=q4=Loshan, Terror Incarnate", "=ds=#h1#, #w10#" },
				{ 26, 86321, "", "=q4=Gao-Rei, Staff of the Legendary Protector", "=ds=#w9#" },
				{ 28, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87159, "", "=q4=Daybreak Drape", "=ds=#s4#" },
				{ 2, 89947, "", "=q4=Shoulderpads of Twisted Fate", "=ds=#s3#, #a1#" },
				{ 3, 87161, "", "=q4=Belt of Embodied Terror", "=ds=#s10#, #a1#" },
				{ 4, 87178, "", "=q4=Healer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 5, 87177, "", "=q4=Invoker's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 6, 87179, "", "=q4=Sorcerer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 7, 87162, "", "=q4=Sandals of the Blackest Night", "=ds=#s12#, #a1#" },
				{ 8, 89945, "", "=q4=Gauntlets of the Shadow's Caress", "=ds=#s9#, #a2#" },
				{ 9, 87180, "", "=q4=Stalker's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 10, 87181, "", "=q4=Weaver's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 11, 89948, "", "=q4=Fear-Blackened Leggings", "=ds=#s11#, #a2#" },
				{ 12, 87157, "", "=q4=Sunwrought Mail Hauberk", "=ds=#s5#, #a3#" },
				{ 13, 87183, "", "=q4=Binder's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 14, 87182, "", "=q4=Ranger's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 15, 89946, "", "=q4=Grasps of Serpentine Might", "=ds=#s9#, #a4#" },
				{ 16, 87184, "", "=q4=Mender's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 17, 87186, "", "=q4=Patroller's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 18, 87185, "", "=q4=Protector's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 19, 87165, "", "=q4=Sollerets of Instability", "=ds=#s12#, #a4#" },
				{ 21, 87158, "", "=q4=Dread Shadow Ring", "=ds=#s13#" },
				{ 22, 87163, "", "=q4=Spirits of the Sun", "=ds=#s14#" },
				{ 23, 87160, "", "=q4=Stuff of Nightmares", "=ds=#s14#" },
				{ 25, 87164, "", "=q4=Loshan, Terror Incarnate", "=ds=#h1#, #w10#" },
				{ 26, 87156, "", "=q4=Gao-Rei, Staff of the Legendary Protector", "=ds=#w9#" },
				{ 28, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Tsulong", 742),
			module = moduleName, instance = "TerraceofEndlessSpring",
		};
	};

	AtlasLoot_Data["ToESLeiShi"] = {
		["RaidFinder"] = {
			{
				{ 1, 86892, "", "=q4=Robes of the Unknown Fear", "=ds=#s5#, #a1#" },
				{ 2, 86895, "", "=q4=Healer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 3, 86896, "", "=q4=Invoker's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 4, 86897, "", "=q4=Sorcerer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 5, 86899, "", "=q4=Stalker's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 6, 86898, "", "=q4=Weaver's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 7, 86900, "", "=q4=Binder's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 8, 86901, "", "=q4=Ranger's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 9, 86891, "", "=q4=Cuirass of the Animated Protector", "=ds=#s5#, #a4#" },
				{ 10, 86902, "", "=q4=Mender's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 11, 86904, "", "=q4=Patroller's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 12, 86903, "", "=q4=Protector's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 14, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89277, "", "=q4=Shoulders of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89278, "", "=q4=Shoulders of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89276, "", "=q4=Shoulders of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86894, "", "=q4=Darkmist Vortex", "=ds=#s14#" },
				{ 21, 86890, "", "=q4=Terror in the Mists", "=ds=#s14#" },
				{ 23, 86910, "", "=q4=Spiritsever", "=ds=#h1#, #w4#" },
				{ 24, 86893, "", "=q4=Jin'ya, Orb of the Waterspeaker", "=ds=#w9#" },
				{ 25, 86889, "", "=q4=Taoren, the Soul Burner", "=ds=#w5#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 86334, "", "=q4=Robes of the Unknown Fear", "=ds=#s5#, #a1#" },
				{ 2, 86337, "", "=q4=Healer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 3, 86338, "", "=q4=Invoker's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 4, 86339, "", "=q4=Sorcerer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 5, 86341, "", "=q4=Stalker's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 6, 86340, "", "=q4=Weaver's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 7, 86342, "", "=q4=Binder's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 8, 86343, "", "=q4=Ranger's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 9, 86333, "", "=q4=Cuirass of the Animated Protector", "=ds=#s5#, #a4#" },
				{ 10, 86383, "", "=q4=Mender's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 11, 86385, "", "=q4=Patroller's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 12, 86384, "", "=q4=Protector's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 14, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89246, "", "=q4=Shoulders of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89247, "", "=q4=Shoulders of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89248, "", "=q4=Shoulders of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 86336, "", "=q4=Darkmist Vortex", "=ds=#s14#" },
				{ 21, 86332, "", "=q4=Terror in the Mists", "=ds=#s14#" },
				{ 23, 86391, "", "=q4=Spiritsever", "=ds=#h1#, #w4#" },
				{ 24, 86335, "", "=q4=Jin'ya, Orb of the Waterspeaker", "=ds=#w9#" },
				{ 25, 86331, "", "=q4=Taoren, the Soul Burner", "=ds=#w5#" },
			};
		};
		["Heroic"] = {
			{
				{ 1, 87169, "", "=q4=Robes of the Unknown Fear", "=ds=#s5#, #a1#" },
				{ 2, 87178, "", "=q4=Healer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 3, 87177, "", "=q4=Invoker's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 4, 87179, "", "=q4=Sorcerer's Belt of Final Winter", "=ds=#s10#, #a1#" },
				{ 5, 87180, "", "=q4=Stalker's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 6, 87181, "", "=q4=Weaver's Cord of Eternal Autumn", "=ds=#s10#, #a2#" },
				{ 7, 87183, "", "=q4=Binder's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 8, 87182, "", "=q4=Ranger's Chain of Unending Summer", "=ds=#s10#, #a3#" },
				{ 9, 87171, "", "=q4=Cuirass of the Animated Protector", "=ds=#s5#, #a4#" },
				{ 10, 87184, "", "=q4=Mender's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 11, 87186, "", "=q4=Patroller's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 12, 87185, "", "=q4=Protector's Girdle of Endless Spring", "=ds=#s10#, #a4#" },
				{ 14, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89262, "", "=q4=Shoulders of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89263, "", "=q4=Shoulders of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89261, "", "=q4=Shoulders of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
				{ 20, 87172, "", "=q4=Darkmist Vortex", "=ds=#s14#" },
				{ 21, 87167, "", "=q4=Terror in the Mists", "=ds=#s14#" },
				{ 23, 87166, "", "=q4=Spiritsever", "=ds=#h1#, #w4#" },
				{ 24, 87170, "", "=q4=Jin'ya, Orb of the Waterspeaker", "=ds=#w9#" },
				{ 25, 87168, "", "=q4=Taoren, the Soul Burner", "=ds=#w5#" },
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Lei Shi", 729),
			module = moduleName, instance = "TerraceofEndlessSpring",
		};
	};

	AtlasLoot_Data["ToESShaofFear"] = {
		["RaidFinder"] = {
			{
				{ 1, 89984, "", "=q4=Robes of Pinioned Eyes", "=ds=#s5#, #a1#" },
				{ 2, 86908, "", "=q4=Dreadwoven Leggings of Failure", "=ds=#s11#, #a1#" },
				{ 3, 89985, "", "=q4=Wrap of Instant Petrification", "=ds=#s5#, #a2#" },
				{ 4, 89986, "", "=q4=Shadowgrip Girdle", "=ds=#s10#, #a3#" },
				{ 6, 86907, "", "=q4=Essence of Terror", "=ds=#s14#" },
				{ 8, 86906, "", "=q4=Kilrak, Jaws of Terror", "=ds=#h1#, #w10#" },
				{ 9, 86905, "", "=q4=Shin'ka, Execution of Dominion", "=ds=#h2#, #w1#" },
				{ 11, 87210, "", "=q5=Chimera of Fear", "=ds=#m3#" },
				{ 12, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89274, "", "=q4=Helm of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89275, "", "=q4=Helm of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89273, "", "=q4=Helm of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
			};
		};
		["Normal"] = {
			{
				{ 1, 89887, "", "=q4=Robes of Pinioned Eyes", "=ds=#s5#, #a1#" },
				{ 2, 86389, "", "=q4=Dreadwoven Leggings of Failure", "=ds=#s11#, #a1#" },
				{ 3, 89886, "", "=q4=Wrap of Instant Petrification", "=ds=#s5#, #a2#" },
				{ 4, 89839, "", "=q4=Shadowgrip Girdle", "=ds=#s10#, #a3#" },
				{ 6, 86388, "", "=q4=Essence of Terror", "=ds=#s14#" },
				{ 8, 86387, "", "=q4=Kilrak, Jaws of Terror", "=ds=#h1#, #w10#" },
				{ 9, 86386, "", "=q4=Shin'ka, Execution of Dominion", "=ds=#h2#, #w1#" },
				{ 11, 87210, "", "=q5=Chimera of Fear", "=ds=#m3#" },
				{ 12, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89235, "", "=q4=Helm of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89236, "", "=q4=Helm of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89234, "", "=q4=Helm of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
			};
		};
		["Heroic"] = {
			{
				{ 1, 89949, "", "=q4=Robes of Pinioned Eyes", "=ds=#s5#, #a1#" },
				{ 2, 87174, "", "=q4=Dreadwoven Leggings of Failure", "=ds=#s11#, #a1#" },
				{ 3, 89950, "", "=q4=Wrap of Instant Petrification", "=ds=#s5#, #a2#" },
				{ 4, 89951, "", "=q4=Shadowgrip Girdle", "=ds=#s10#, #a3#" },
				{ 6, 87175, "", "=q4=Essence of Terror", "=ds=#s14#" },
				{ 8, 87173, "", "=q4=Kilrak, Jaws of Terror", "=ds=#h1#, #w10#" },
				{ 9, 87176, "", "=q4=Shin'ka, Execution of Dominion", "=ds=#h2#, #w1#" },
				{ 11, 87210, "", "=q5=Chimera of Fear", "=ds=#m3#" },
				{ 12, 87209, "", "=q5=Sigil of Wisdom", "=ds=#m3#" },
				{ 16, 89259, "", "=q4=Helm of the Shadowy Conqueror", "=ds=#e15#, #m40#"};
				{ 17, 89260, "", "=q4=Helm of the Shadowy Protector", "=ds=#e15#, #m40#"};
				{ 18, 89258, "", "=q4=Helm of the Shadowy Vanquisher", "=ds=#e15#, #m40#"};
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Sha of Fear", 709),
			module = moduleName, instance = "TerraceofEndlessSpring",
		};
	};

		-------------------------
		--- Throne of Thunder ---
		-------------------------

	AtlasLoot_Data["ToTJinrokh"] = {
		["RaidFinder"] = {
			{
				{ 1, 95639, "", "=q4=Drape of Booming Nights", "=ds=#s4#" },
				{ 2, 95636, "", "=q4=Fissure-Split Shoulderwraps", "=ds=#s3#, #a1#" },
				{ 3, 95637, "", "=q4=Robes of Static Bursts", "=ds=#s5#, #a1#" },
				{ 4, 95634, "", "=q4=Lightningweaver Gauntlets", "=ds=#s9#, #a1#" },
				{ 5, 95635, "", "=q4=Al'set's Tormented Leggings", "=ds=#s11#, #a1#" },
				{ 6, 95626, "", "=q4=Lightning-Eye Hood", "=ds=#s1#, #a2#" },
				{ 7, 95642, "", "=q4=Infinitely Conducting Bracers", "=ds=#s8#, #a2#" },
				{ 8, 95628, "", "=q4=Static-Shot Shoulderguards", "=ds=#s3#, #a3#" },
				{ 9, 95627, "", "=q4=Spearman's Jingling Leggings", "=ds=#s11#, #a3#" },
				{ 10, 95643, "", "=q4=Ghostbinder Greatboots", "=ds=#s12#, #a3#" },
				{ 11, 95630, "", "=q4=Chestplate of Violent Detonation", "=ds=#s5#, #a4#" },
				{ 12, 95644, "", "=q4=Ionized Yojamban Carapace", "=ds=#s5#, #a4#" },
				{ 13, 95631, "", "=q4=Bracers of Constant Implosion", "=ds=#s8#, #a4#" },
				{ 14, 95629, "", "=q4=Cloudbreaker Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 95638, "", "=q4=Jin'rokh's Dreamshard", "=ds=#s13#" },
				{ 17, 95633, "", "=q4=Jin'rokh's Soulcrystal", "=ds=#s13#" },
				{ 18, 95624, "", "=q4=Sign of the Bloodied God", "=ds=#s13#" },
				{ 19, 95625, "", "=q4=Renataki's Soul Charm", "=ds=#s14#" },
				{ 21, 95640, "", "=q4=Soulblade of the Breaking Storm", "=ds=#h1#, #w10#" },
				{ 22, 95632, "", "=q4=Worldbreaker's Stormscythe", "=ds=#h1#, #w1#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94735, "", "=q4=Drape of Booming Nights", "=ds=#s4#" },
				{ 2, 94733, "", "=q4=Fissure-Split Shoulderwraps", "=ds=#s3#, #a1#" },
				{ 3, 94731, "", "=q4=Robes of Static Bursts", "=ds=#s5#, #a1#" },
				{ 4, 94737, "", "=q4=Lightningweaver Gauntlets", "=ds=#s9#, #a1#" },
				{ 5, 94739, "", "=q4=Al'set's Tormented Leggings", "=ds=#s11#, #a1#" },
				{ 6, 94724, "", "=q4=Lightning-Eye Hood", "=ds=#s1#, #a2#" },
				{ 7, 94732, "", "=q4=Infinitely Conducting Bracers", "=ds=#s8#, #a2#" },
				{ 8, 94725, "", "=q4=Static-Shot Shoulderguards", "=ds=#s3#, #a3#" },
				{ 9, 94728, "", "=q4=Spearman's Jingling Leggings", "=ds=#s11#, #a3#" },
				{ 10, 94736, "", "=q4=Ghostbinder Greatboots", "=ds=#s12#, #a3#" },
				{ 11, 94723, "", "=q4=Chestplate of Violent Detonation", "=ds=#s5#, #a4#" },
				{ 12, 94734, "", "=q4=Ionized Yojamban Carapace", "=ds=#s5#, #a4#" },
				{ 13, 94727, "", "=q4=Bracers of Constant Implosion", "=ds=#s8#, #a4#" },
				{ 14, 94726, "", "=q4=Cloudbreaker Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 94738, "", "=q4=Jin'rokh's Dreamshard", "=ds=#s13#" },
				{ 17, 94729, "", "=q4=Jin'rokh's Soulcrystal", "=ds=#s13#" },
				{ 18, 95510, "", "=q4=Sign of the Bloodied God", "=ds=#s13#" },
				{ 19, 94512, "", "=q4=Renataki's Soul Charm", "=ds=#s14#" },
				{ 21, 94730, "", "=q4=Soulblade of the Breaking Storm", "=ds=#h1#, #w10#" },
				{ 22, 94722, "", "=q4=Worldbreaker's Stormscythe", "=ds=#h1#, #w1#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96011, "", "=q4=Drape of Booming Nights", "=ds=#s4#" },
				{ 2, 96008, "", "=q4=Fissure-Split Shoulderwraps", "=ds=#s3#, #a1#" },
				{ 3, 96009, "", "=q4=Robes of Static Bursts", "=ds=#s5#, #a1#" },
				{ 4, 96006, "", "=q4=Lightningweaver Gauntlets", "=ds=#s9#, #a1#" },
				{ 5, 96007, "", "=q4=Al'set's Tormented Leggings", "=ds=#s11#, #a1#" },
				{ 6, 95998, "", "=q4=Lightning-Eye Hood", "=ds=#s1#, #a2#" },
				{ 7, 96014, "", "=q4=Infinitely Conducting Bracers", "=ds=#s8#, #a2#" },
				{ 8, 96000, "", "=q4=Static-Shot Shoulderguards", "=ds=#s3#, #a3#" },
				{ 9, 95999, "", "=q4=Spearman's Jingling Leggings", "=ds=#s11#, #a3#" },
				{ 10, 96015, "", "=q4=Ghostbinder Greatboots", "=ds=#s12#, #a3#" },
				{ 11, 96002, "", "=q4=Chestplate of Violent Detonation", "=ds=#s5#, #a4#" },
				{ 12, 96016, "", "=q4=Ionized Yojamban Carapace", "=ds=#s5#, #a4#" },
				{ 13, 96003, "", "=q4=Bracers of Constant Implosion", "=ds=#s8#, #a4#" },
				{ 14, 96001, "", "=q4=Cloudbreaker Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 96010, "", "=q4=Jin'rokh's Dreamshard", "=ds=#s13#" },
				{ 17, 96005, "", "=q4=Jin'rokh's Soulcrystal", "=ds=#s13#" },
				{ 18, 95996, "", "=q4=Sign of the Bloodied God", "=ds=#s13#" },
				{ 19, 95997, "", "=q4=Renataki's Soul Charm", "=ds=#s14#" },
				{ 21, 96012, "", "=q4=Soulblade of the Breaking Storm", "=ds=#h1#, #w10#" },
				{ 22, 96004, "", "=q4=Worldbreaker's Stormscythe", "=ds=#h1#, #w1#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96383, "", "=q4=Drape of Booming Nights", "=ds=#s4#" },
				{ 2, 96380, "", "=q4=Fissure-Split Shoulderwraps", "=ds=#s3#, #a1#" },
				{ 3, 96381, "", "=q4=Robes of Static Bursts", "=ds=#s5#, #a1#" },
				{ 4, 96378, "", "=q4=Lightningweaver Gauntlets", "=ds=#s9#, #a1#" },
				{ 5, 96379, "", "=q4=Al'set's Tormented Leggings", "=ds=#s11#, #a1#" },
				{ 6, 96370, "", "=q4=Lightning-Eye Hood", "=ds=#s1#, #a2#" },
				{ 7, 96386, "", "=q4=Infinitely Conducting Bracers", "=ds=#s8#, #a2#" },
				{ 8, 96372, "", "=q4=Static-Shot Shoulderguards", "=ds=#s3#, #a3#" },
				{ 9, 96371, "", "=q4=Spearman's Jingling Leggings", "=ds=#s11#, #a3#" },
				{ 10, 96387, "", "=q4=Ghostbinder Greatboots", "=ds=#s12#, #a3#" },
				{ 11, 96374, "", "=q4=Chestplate of Violent Detonation", "=ds=#s5#, #a4#" },
				{ 12, 96388, "", "=q4=Ionized Yojamban Carapace", "=ds=#s5#, #a4#" },
				{ 13, 96375, "", "=q4=Bracers of Constant Implosion", "=ds=#s8#, #a4#" },
				{ 14, 96373, "", "=q4=Cloudbreaker Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 96382, "", "=q4=Jin'rokh's Dreamshard", "=ds=#s13#" },
				{ 17, 96377, "", "=q4=Jin'rokh's Soulcrystal", "=ds=#s13#" },
				{ 18, 96368, "", "=q4=Sign of the Bloodied God", "=ds=#s13#" },
				{ 19, 96369, "", "=q4=Renataki's Soul Charm", "=ds=#s14#" },
				{ 21, 96384, "", "=q4=Soulblade of the Breaking Storm", "=ds=#h1#, #w10#" },
				{ 22, 96376, "", "=q4=Worldbreaker's Stormscythe", "=ds=#h1#, #w1#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96755, "", "=q4=Drape of Booming Nights", "=ds=#s4#" },
				{ 2, 96752, "", "=q4=Fissure-Split Shoulderwraps", "=ds=#s3#, #a1#" },
				{ 3, 96753, "", "=q4=Robes of Static Bursts", "=ds=#s5#, #a1#" },
				{ 4, 96750, "", "=q4=Lightningweaver Gauntlets", "=ds=#s9#, #a1#" },
				{ 5, 96751, "", "=q4=Al'set's Tormented Leggings", "=ds=#s11#, #a1#" },
				{ 6, 96742, "", "=q4=Lightning-Eye Hood", "=ds=#s1#, #a2#" },
				{ 7, 96758, "", "=q4=Infinitely Conducting Bracers", "=ds=#s8#, #a2#" },
				{ 8, 96744, "", "=q4=Static-Shot Shoulderguards", "=ds=#s3#, #a3#" },
				{ 9, 96743, "", "=q4=Spearman's Jingling Leggings", "=ds=#s11#, #a3#" },
				{ 10, 96759, "", "=q4=Ghostbinder Greatboots", "=ds=#s12#, #a3#" },
				{ 11, 96746, "", "=q4=Chestplate of Violent Detonation", "=ds=#s5#, #a4#" },
				{ 12, 96760, "", "=q4=Ionized Yojamban Carapace", "=ds=#s5#, #a4#" },
				{ 13, 96747, "", "=q4=Bracers of Constant Implosion", "=ds=#s8#, #a4#" },
				{ 14, 96745, "", "=q4=Cloudbreaker Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 96754, "", "=q4=Jin'rokh's Dreamshard", "=ds=#s13#" },
				{ 17, 96749, "", "=q4=Jin'rokh's Soulcrystal", "=ds=#s13#" },
				{ 18, 96740, "", "=q4=Sign of the Bloodied God", "=ds=#s13#" },
				{ 19, 96741, "", "=q4=Renataki's Soul Charm", "=ds=#s14#" },
				{ 21, 96756, "", "=q4=Soulblade of the Breaking Storm", "=ds=#h1#, #w10#" },
				{ 22, 96748, "", "=q4=Worldbreaker's Stormscythe", "=ds=#h1#, #w1#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Jin'rokh the Breaker", 827),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTHorridon"] = {
		["RaidFinder"] = {
			{
				{ 1, 95653, "", "=q4=Horn-Rimmed Doomcloak", "=ds=#s4#" },
				{ 2, 95645, "", "=q4=Wastewalker's Sandblasted Drape", "=ds=#s4#" },
				{ 3, 95655, "", "=q4=Flamecaster's Burning Crown", "=ds=#s1#, #a1#" },
				{ 4, 95656, "", "=q4=Vaccinator's Armwraps", "=ds=#s8#, #a1#" },
				{ 5, 95662, "", "=q4=Spaulders of Dinomancy", "=ds=#s3#, #a2#" },
				{ 6, 95648, "", "=q4=Bindings of Multiplicative Strikes", "=ds=#s8#, #a2#" },
				{ 7, 95661, "", "=q4=Roots of Rampaging Earth", "=ds=#s11#, #a2#" },
				{ 8, 95649, "", "=q4=Sul'lithuz Sandmail", "=ds=#s5#, #a3#" },
				{ 9, 95663, "", "=q4=Legguards of Scintillating Scales", "=ds=#s11#, #a3#" },
				{ 10, 95652, "", "=q4=Puncture-Proof Greathelm", "=ds=#s1#, #a4#" },
				{ 11, 95664, "", "=q4=Armplates of the Vanquished Abomination", "=ds=#s8#, #a4#" },
				{ 12, 95650, "", "=q4=Frozen Warlord's Bracers", "=ds=#s8#, #a4#" },
				{ 13, 95651, "", "=q4=Bloodlord's Bloodsoaked Legplates", "=ds=#s11#, #a4#" },
				{ 16, 95658, "", "=q4=Horridon's Tusk Fragment", "=ds=#s2#" },
				{ 17, 95646, "", "=q4=Talisman of Living Poison", "=ds=#s2#" },
				{ 18, 95659, "", "=q4=Petrified Eye of the Basilisk", "=ds=#s13#" },
				{ 19, 95641, "", "=q4=Horridon's Last Gasp", "=ds=#s14#" },
				{ 20, 95654, "", "=q4=Spark of Zandalar", "=ds=#s14#" },
				{ 22, 95657, "", "=q4=Dinomancer's Spiritbinding Spire", "=ds=#w9#" },
				{ 23, 95647, "", "=q4=Jalak's Maelstrom Staff", "=ds=#w9#" },
				{ 24, 95660, "", "=q4=Venomlord's Totemic Wand", "=ds=#w12#" },
				{ 26, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94745, "", "=q4=Horn-Rimmed Doomcloak", "=ds=#s4#" },
				{ 2, 94748, "", "=q4=Wastewalker's Sandblasted Drape", "=ds=#s4#" },
				{ 3, 94752, "", "=q4=Flamecaster's Burning Crown", "=ds=#s1#, #a1#" },
				{ 4, 94750, "", "=q4=Vaccinator's Armwraps", "=ds=#s8#, #a1#" },
				{ 5, 94753, "", "=q4=Spaulders of Dinomancy", "=ds=#s3#, #a2#" },
				{ 6, 94743, "", "=q4=Bindings of Multiplicative Strikes", "=ds=#s8#, #a2#" },
				{ 7, 94756, "", "=q4=Roots of Rampaging Earth", "=ds=#s11#, #a2#" },
				{ 8, 94741, "", "=q4=Sul'lithuz Sandmail", "=ds=#s5#, #a3#" },
				{ 9, 94975, "", "=q4=Legguards of Scintillating Scales", "=ds=#s11#, #a3#" },
				{ 10, 94744, "", "=q4=Puncture-Proof Greathelm", "=ds=#s1#, #a4#" },
				{ 11, 94751, "", "=q4=Armplates of the Vanquished Abomination", "=ds=#s8#, #a4#" },
				{ 12, 94742, "", "=q4=Frozen Warlord's Bracers", "=ds=#s8#, #a4#" },
				{ 13, 94747, "", "=q4=Bloodlord's Bloodsoaked Legplates", "=ds=#s11#, #a4#" },
				{ 16, 94754, "", "=q4=Horridon's Tusk Fragment", "=ds=#s2#" },
				{ 17, 94746, "", "=q4=Talisman of Living Poison", "=ds=#s2#" },
				{ 18, 95514, "", "=q4=Petrified Eye of the Basilisk", "=ds=#s13#" },
				{ 19, 94514, "", "=q4=Horridon's Last Gasp", "=ds=#s14#" },
				{ 20, 94526, "", "=q4=Spark of Zandalar", "=ds=#s14#" },
				{ 22, 94749, "", "=q4=Dinomancer's Spiritbinding Spire", "=ds=#w9#" },
				{ 23, 94740, "", "=q4=Jalak's Maelstrom Staff", "=ds=#w9#" },
				{ 24, 94755, "", "=q4=Venomlord's Totemic Wand", "=ds=#w12#" },
				{ 26, 93666, "", "=q4=Spawn of Horridon", "=ds=#e26#", ""};
				{ 28, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96025, "", "=q4=Horn-Rimmed Doomcloak", "=ds=#s4#" },
				{ 2, 96017, "", "=q4=Wastewalker's Sandblasted Drape", "=ds=#s4#" },
				{ 3, 96027, "", "=q4=Flamecaster's Burning Crown", "=ds=#s1#, #a1#" },
				{ 4, 96028, "", "=q4=Vaccinator's Armwraps", "=ds=#s8#, #a1#" },
				{ 5, 96034, "", "=q4=Spaulders of Dinomancy", "=ds=#s3#, #a2#" },
				{ 6, 96020, "", "=q4=Bindings of Multiplicative Strikes", "=ds=#s8#, #a2#" },
				{ 7, 96033, "", "=q4=Roots of Rampaging Earth", "=ds=#s11#, #a2#" },
				{ 8, 96021, "", "=q4=Sul'lithuz Sandmail", "=ds=#s5#, #a3#" },
				{ 9, 96035, "", "=q4=Legguards of Scintillating Scales", "=ds=#s11#, #a3#" },
				{ 10, 96024, "", "=q4=Puncture-Proof Greathelm", "=ds=#s1#, #a4#" },
				{ 11, 96036, "", "=q4=Armplates of the Vanquished Abomination", "=ds=#s8#, #a4#" },
				{ 12, 96022, "", "=q4=Frozen Warlord's Bracers", "=ds=#s8#, #a4#" },
				{ 13, 96023, "", "=q4=Bloodlord's Bloodsoaked Legplates", "=ds=#s11#, #a4#" },
				{ 16, 96030, "", "=q4=Horridon's Tusk Fragment", "=ds=#s2#" },
				{ 17, 96018, "", "=q4=Talisman of Living Poison", "=ds=#s2#" },
				{ 18, 96031, "", "=q4=Petrified Eye of the Basilisk", "=ds=#s13#" },
				{ 19, 96013, "", "=q4=Horridon's Last Gasp", "=ds=#s14#" },
				{ 20, 96026, "", "=q4=Spark of Zandalar", "=ds=#s14#" },
				{ 22, 96029, "", "=q4=Dinomancer's Spiritbinding Spire", "=ds=#w9#" },
				{ 23, 96019, "", "=q4=Jalak's Maelstrom Staff", "=ds=#w9#" },
				{ 24, 96032, "", "=q4=Venomlord's Totemic Wand", "=ds=#w12#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96397, "", "=q4=Horn-Rimmed Doomcloak", "=ds=#s4#" },
				{ 2, 96389, "", "=q4=Wastewalker's Sandblasted Drape", "=ds=#s4#" },
				{ 3, 96399, "", "=q4=Flamecaster's Burning Crown", "=ds=#s1#, #a1#" },
				{ 4, 96400, "", "=q4=Vaccinator's Armwraps", "=ds=#s8#, #a1#" },
				{ 5, 96406, "", "=q4=Spaulders of Dinomancy", "=ds=#s3#, #a2#" },
				{ 6, 96392, "", "=q4=Bindings of Multiplicative Strikes", "=ds=#s8#, #a2#" },
				{ 7, 96405, "", "=q4=Roots of Rampaging Earth", "=ds=#s11#, #a2#" },
				{ 8, 96393, "", "=q4=Sul'lithuz Sandmail", "=ds=#s5#, #a3#" },
				{ 9, 96407, "", "=q4=Legguards of Scintillating Scales", "=ds=#s11#, #a3#" },
				{ 10, 96396, "", "=q4=Puncture-Proof Greathelm", "=ds=#s1#, #a4#" },
				{ 11, 96408, "", "=q4=Armplates of the Vanquished Abomination", "=ds=#s8#, #a4#" },
				{ 12, 96394, "", "=q4=Frozen Warlord's Bracers", "=ds=#s8#, #a4#" },
				{ 13, 96395, "", "=q4=Bloodlord's Bloodsoaked Legplates", "=ds=#s11#, #a4#" },
				{ 16, 96402, "", "=q4=Horridon's Tusk Fragment", "=ds=#s2#" },
				{ 17, 96390, "", "=q4=Talisman of Living Poison", "=ds=#s2#" },
				{ 18, 96403, "", "=q4=Petrified Eye of the Basilisk", "=ds=#s13#" },
				{ 19, 96385, "", "=q4=Horridon's Last Gasp", "=ds=#s14#" },
				{ 20, 96398, "", "=q4=Spark of Zandalar", "=ds=#s14#" },
				{ 22, 96401, "", "=q4=Dinomancer's Spiritbinding Spire", "=ds=#w9#" },
				{ 23, 96391, "", "=q4=Jalak's Maelstrom Staff", "=ds=#w9#" },
				{ 24, 96404, "", "=q4=Venomlord's Totemic Wand", "=ds=#w12#" },
				{ 26, 93666, "", "=q4=Spawn of Horridon", "=ds=#e26#", ""};
				{ 28, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96769, "", "=q4=Horn-Rimmed Doomcloak", "=ds=#s4#" },
				{ 2, 96761, "", "=q4=Wastewalker's Sandblasted Drape", "=ds=#s4#" },
				{ 3, 96771, "", "=q4=Flamecaster's Burning Crown", "=ds=#s1#, #a1#" },
				{ 4, 96772, "", "=q4=Vaccinator's Armwraps", "=ds=#s8#, #a1#" },
				{ 5, 96778, "", "=q4=Spaulders of Dinomancy", "=ds=#s3#, #a2#" },
				{ 6, 96764, "", "=q4=Bindings of Multiplicative Strikes", "=ds=#s8#, #a2#" },
				{ 7, 96777, "", "=q4=Roots of Rampaging Earth", "=ds=#s11#, #a2#" },
				{ 8, 96765, "", "=q4=Sul'lithuz Sandmail", "=ds=#s5#, #a3#" },
				{ 9, 96779, "", "=q4=Legguards of Scintillating Scales", "=ds=#s11#, #a3#" },
				{ 10, 96768, "", "=q4=Puncture-Proof Greathelm", "=ds=#s1#, #a4#" },
				{ 11, 96780, "", "=q4=Armplates of the Vanquished Abomination", "=ds=#s8#, #a4#" },
				{ 12, 96766, "", "=q4=Frozen Warlord's Bracers", "=ds=#s8#, #a4#" },
				{ 13, 96767, "", "=q4=Bloodlord's Bloodsoaked Legplates", "=ds=#s11#, #a4#" },
				{ 16, 96774, "", "=q4=Horridon's Tusk Fragment", "=ds=#s2#" },
				{ 17, 96762, "", "=q4=Talisman of Living Poison", "=ds=#s2#" },
				{ 18, 96775, "", "=q4=Petrified Eye of the Basilisk", "=ds=#s13#" },
				{ 19, 96757, "", "=q4=Horridon's Last Gasp", "=ds=#s14#" },
				{ 20, 96770, "", "=q4=Spark of Zandalar", "=ds=#s14#" },
				{ 22, 96773, "", "=q4=Dinomancer's Spiritbinding Spire", "=ds=#w9#" },
				{ 23, 96763, "", "=q4=Jalak's Maelstrom Staff", "=ds=#w9#" },
				{ 24, 96776, "", "=q4=Venomlord's Totemic Wand", "=ds=#w12#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Horridon", 819),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTCouncil"] = {
		["RaidFinder"] = {
			{
				{ 1, 95668, "", "=q4=Zandalari Robes of the Final Rite", "=ds=#s5#, #a1#" },
				{ 2, 95667, "", "=q4=Mar'li's Bloodstained Sandals", "=ds=#s12#, #a1#" },
				{ 3, 95671, "", "=q4=Robes of Treacherous Ground", "=ds=#s5#, #a2#" },
				{ 4, 95672, "", "=q4=Gaze of Gara'jal", "=ds=#s1#, #a3#" },
				{ 5, 95673, "", "=q4=Loa-Ridden Bracers", "=ds=#s8#, #a3#" },
				{ 6, 95674, "", "=q4=Overloaded Bladebreaker Cuirass", "=ds=#s5#, #a4#" },
				{ 8, 95676, "", "=q4=Talisman of Angry Spirits", "=ds=#s2#" },
				{ 9, 95665, "", "=q4=Bad Juju", "=ds=#s14#" },
				{ 10, 95677, "", "=q4=Fortitude of the Zandalari", "=ds=#s14#" },
				{ 11, 95669, "", "=q4=Wushoolay's Final Choice", "=ds=#s14#" },
				{ 16, 95856, "", "=q4=Gauntlets of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95857, "", "=q4=Gauntlets of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95855, "", "=q4=Gauntlets of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 95670, "", "=q4=Amun-Thoth, Sul's Spiritrending Talons", "=ds=#h1#, #w13#" },
				{ 21, 95666, "", "=q4=Kura-Kura, Kazra'jin's Skullcleaver", "=ds=#h1#, #w1#" },
				{ 22, 95675, "", "=q4=Zerat, Malakk's Soulburning Greatsword", "=ds=#h2#, #w10#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94761, "", "=q4=Zandalari Robes of the Final Rite", "=ds=#s5#, #a1#" },
				{ 2, 94762, "", "=q4=Mar'li's Bloodstained Sandals", "=ds=#s12#, #a1#" },
				{ 3, 94765, "", "=q4=Robes of Treacherous Ground", "=ds=#s5#, #a2#" },
				{ 4, 94763, "", "=q4=Gaze of Gara'jal", "=ds=#s1#, #a3#" },
				{ 5, 94767, "", "=q4=Loa-Ridden Bracers", "=ds=#s8#, #a3#" },
				{ 6, 94764, "", "=q4=Overloaded Bladebreaker Cuirass", "=ds=#s5#, #a4#" },
				{ 8, 94766, "", "=q4=Talisman of Angry Spirits", "=ds=#s2#" },
				{ 9, 94523, "", "=q4=Bad Juju", "=ds=#s14#" },
				{ 10, 94516, "", "=q4=Fortitude of the Zandalari", "=ds=#s14#" },
				{ 11, 94513, "", "=q4=Wushoolay's Final Choice", "=ds=#s14#" },
				{ 16, 95575, "", "=q4=Gauntlets of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95580, "", "=q4=Gauntlets of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95570, "", "=q4=Gauntlets of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 94760, "", "=q4=Amun-Thoth, Sul's Spiritrending Talons", "=ds=#h1#, #w13#" },
				{ 21, 94759, "", "=q4=Kura-Kura, Kazra'jin's Skullcleaver", "=ds=#h1#, #w1#" },
				{ 22, 94758, "", "=q4=Zerat, Malakk's Soulburning Greatsword", "=ds=#h2#, #w10#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96040, "", "=q4=Zandalari Robes of the Final Rite", "=ds=#s5#, #a1#" },
				{ 2, 96039, "", "=q4=Mar'li's Bloodstained Sandals", "=ds=#s12#, #a1#" },
				{ 3, 96043, "", "=q4=Robes of Treacherous Ground", "=ds=#s5#, #a2#" },
				{ 4, 96044, "", "=q4=Gaze of Gara'jal", "=ds=#s1#, #a3#" },
				{ 5, 96045, "", "=q4=Loa-Ridden Bracers", "=ds=#s8#, #a3#" },
				{ 6, 96046, "", "=q4=Overloaded Bladebreaker Cuirass", "=ds=#s5#, #a4#" },
				{ 8, 96048, "", "=q4=Talisman of Angry Spirits", "=ds=#s2#" },
				{ 9, 96037, "", "=q4=Bad Juju", "=ds=#s14#" },
				{ 10, 96049, "", "=q4=Fortitude of the Zandalari", "=ds=#s14#" },
				{ 11, 96041, "", "=q4=Wushoolay's Final Choice", "=ds=#s14#" },
				{ 20, 96042, "", "=q4=Amun-Thoth, Sul's Spiritrending Talons", "=ds=#h1#, #w13#" },
				{ 21, 96038, "", "=q4=Kura-Kura, Kazra'jin's Skullcleaver", "=ds=#h1#, #w1#" },
				{ 22, 96047, "", "=q4=Zerat, Malakk's Soulburning Greatsword", "=ds=#h2#, #w10#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96412, "", "=q4=Zandalari Robes of the Final Rite", "=ds=#s5#, #a1#" },
				{ 2, 96411, "", "=q4=Mar'li's Bloodstained Sandals", "=ds=#s12#, #a1#" },
				{ 3, 96415, "", "=q4=Robes of Treacherous Ground", "=ds=#s5#, #a2#" },
				{ 4, 96416, "", "=q4=Gaze of Gara'jal", "=ds=#s1#, #a3#" },
				{ 5, 96417, "", "=q4=Loa-Ridden Bracers", "=ds=#s8#, #a3#" },
				{ 6, 96418, "", "=q4=Overloaded Bladebreaker Cuirass", "=ds=#s5#, #a4#" },
				{ 8, 96420, "", "=q4=Talisman of Angry Spirits", "=ds=#s2#" },
				{ 9, 96409, "", "=q4=Bad Juju", "=ds=#s14#" },
				{ 10, 96421, "", "=q4=Fortitude of the Zandalari", "=ds=#s14#" },
				{ 11, 96413, "", "=q4=Wushoolay's Final Choice", "=ds=#s14#" },
				{ 16, 96600, "", "=q4=Gauntlets of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 96601, "", "=q4=Gauntlets of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 96599, "", "=q4=Gauntlets of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 96414, "", "=q4=Amun-Thoth, Sul's Spiritrending Talons", "=ds=#h1#, #w13#" },
				{ 21, 96410, "", "=q4=Kura-Kura, Kazra'jin's Skullcleaver", "=ds=#h1#, #w1#" },
				{ 22, 96419, "", "=q4=Zerat, Malakk's Soulburning Greatsword", "=ds=#h2#, #w10#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96784, "", "=q4=Zandalari Robes of the Final Rite", "=ds=#s5#, #a1#" },
				{ 2, 96783, "", "=q4=Mar'li's Bloodstained Sandals", "=ds=#s12#, #a1#" },
				{ 3, 96787, "", "=q4=Robes of Treacherous Ground", "=ds=#s5#, #a2#" },
				{ 4, 96788, "", "=q4=Gaze of Gara'jal", "=ds=#s1#, #a3#" },
				{ 5, 96789, "", "=q4=Loa-Ridden Bracers", "=ds=#s8#, #a3#" },
				{ 6, 96790, "", "=q4=Overloaded Bladebreaker Cuirass", "=ds=#s5#, #a4#" },
				{ 8, 96792, "", "=q4=Talisman of Angry Spirits", "=ds=#s2#" },
				{ 9, 96781, "", "=q4=Bad Juju", "=ds=#s14#" },
				{ 10, 96793, "", "=q4=Fortitude of the Zandalari", "=ds=#s14#" },
				{ 11, 96785, "", "=q4=Wushoolay's Final Choice", "=ds=#s14#" },
				{ 20, 96786, "", "=q4=Amun-Thoth, Sul's Spiritrending Talons", "=ds=#h1#, #w13#" },
				{ 21, 96782, "", "=q4=Kura-Kura, Kazra'jin's Skullcleaver", "=ds=#h1#, #w1#" },
				{ 22, 96791, "", "=q4=Zerat, Malakk's Soulburning Greatsword", "=ds=#h2#, #w10#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Council of Elders", 816),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTTortos"] = {
		["RaidFinder"] = {
			{
				{ 1, 95687, "", "=q4=Beakbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 95691, "", "=q4=Shimmershell Cape", "=ds=#s4#" },
				{ 3, 95689, "", "=q4=Stonegaze Hood", "=ds=#s1#, #a1#" },
				{ 4, 95688, "", "=q4=Azure Shell Bracers", "=ds=#s8#, #a1#" },
				{ 5, 95690, "", "=q4=Crystal-Claw Gloves", "=ds=#s9#, #a1#" },
				{ 6, 95694, "", "=q4=Robes of Concussive Shocks", "=ds=#s5#, #a2#" },
				{ 7, 95679, "", "=q4=Rockfall Ribwraps", "=ds=#s5#, #a2#" },
				{ 8, 95693, "", "=q4=Vampire Bat-Hide Bracers", "=ds=#s8#, #a2#" },
				{ 9, 95680, "", "=q4=Grips of Vampiric Cruelty", "=ds=#s9#, #a2#" },
				{ 10, 95695, "", "=q4=Spaulders of Quaking Fear", "=ds=#s3#, #a3#" },
				{ 11, 95681, "", "=q4=Beady-Eye Bracers", "=ds=#s8#, #a3#" },
				{ 12, 95682, "", "=q4=Quakestompers", "=ds=#s12#, #a3#" },
				{ 13, 95683, "", "=q4=Shoulderguards of Centripetal Destruction", "=ds=#s3#, #a4#" },
				{ 14, 95684, "", "=q4=Shell-Coated Wristplates", "=ds=#s8#, #a4#" },
				{ 15, 95697, "", "=q4=Tortos' Shellseizers", "=ds=#s9#, #a4#" },
				{ 16, 95696, "", "=q4=Refreshing Abalone Girdle", "=ds=#s10#, #a4#" },
				{ 18, 95685, "", "=q4=Amulet of the Primal Turtle", "=ds=#s2#" },
				{ 20, 95686, "", "=q4=Shellsplitter Greataxe", "=ds=#h1#, #w1#" },
				{ 21, 95678, "", "=q4=Shattered Tortoiseshell Longbow", "=ds=#w2#" },
				{ 22, 95692, "", "=q4=Tortos' Discarded Shell", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94774, "", "=q4=Beakbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 94785, "", "=q4=Shimmershell Cape", "=ds=#s4#" },
				{ 3, 94782, "", "=q4=Stonegaze Hood", "=ds=#s1#, #a1#" },
				{ 4, 94781, "", "=q4=Azure Shell Bracers", "=ds=#s8#, #a1#" },
				{ 5, 94780, "", "=q4=Crystal-Claw Gloves", "=ds=#s9#, #a1#" },
				{ 6, 94779, "", "=q4=Robes of Concussive Shocks", "=ds=#s5#, #a2#" },
				{ 7, 94770, "", "=q4=Rockfall Ribwraps", "=ds=#s5#, #a2#" },
				{ 8, 94786, "", "=q4=Vampire Bat-Hide Bracers", "=ds=#s8#, #a2#" },
				{ 9, 94777, "", "=q4=Grips of Vampiric Cruelty", "=ds=#s9#, #a2#" },
				{ 10, 94783, "", "=q4=Spaulders of Quaking Fear", "=ds=#s3#, #a3#" },
				{ 11, 94775, "", "=q4=Beady-Eye Bracers", "=ds=#s8#, #a3#" },
				{ 12, 94772, "", "=q4=Quakestompers", "=ds=#s12#, #a3#" },
				{ 13, 94773, "", "=q4=Shoulderguards of Centripetal Destruction", "=ds=#s3#, #a4#" },
				{ 14, 94771, "", "=q4=Shell-Coated Wristplates", "=ds=#s8#, #a4#" },
				{ 15, 94787, "", "=q4=Tortos' Shellseizers", "=ds=#s9#, #a4#" },
				{ 16, 94784, "", "=q4=Refreshing Abalone Girdle", "=ds=#s10#, #a4#" },
				{ 18, 94776, "", "=q4=Amulet of the Primal Turtle", "=ds=#s2#" },
				{ 20, 94768, "", "=q4=Shellsplitter Greataxe", "=ds=#h1#, #w1#" },
				{ 21, 94769, "", "=q4=Shattered Tortoiseshell Longbow", "=ds=#w2#" },
				{ 22, 94778, "", "=q4=Tortos' Discarded Shell", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96059, "", "=q4=Beakbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 96063, "", "=q4=Shimmershell Cape", "=ds=#s4#" },
				{ 3, 96061, "", "=q4=Stonegaze Hood", "=ds=#s1#, #a1#" },
				{ 4, 96060, "", "=q4=Azure Shell Bracers", "=ds=#s8#, #a1#" },
				{ 5, 96062, "", "=q4=Crystal-Claw Gloves", "=ds=#s9#, #a1#" },
				{ 6, 96066, "", "=q4=Robes of Concussive Shocks", "=ds=#s5#, #a2#" },
				{ 7, 96051, "", "=q4=Rockfall Ribwraps", "=ds=#s5#, #a2#" },
				{ 8, 96065, "", "=q4=Vampire Bat-Hide Bracers", "=ds=#s8#, #a2#" },
				{ 9, 96052, "", "=q4=Grips of Vampiric Cruelty", "=ds=#s9#, #a2#" },
				{ 10, 96067, "", "=q4=Spaulders of Quaking Fear", "=ds=#s3#, #a3#" },
				{ 11, 96053, "", "=q4=Beady-Eye Bracers", "=ds=#s8#, #a3#" },
				{ 12, 96054, "", "=q4=Quakestompers", "=ds=#s12#, #a3#" },
				{ 13, 96055, "", "=q4=Shoulderguards of Centripetal Destruction", "=ds=#s3#, #a4#" },
				{ 14, 96056, "", "=q4=Shell-Coated Wristplates", "=ds=#s8#, #a4#" },
				{ 15, 96069, "", "=q4=Tortos' Shellseizers", "=ds=#s9#, #a4#" },
				{ 16, 96068, "", "=q4=Refreshing Abalone Girdle", "=ds=#s10#, #a4#" },
				{ 18, 96057, "", "=q4=Amulet of the Primal Turtle", "=ds=#s2#" },
				{ 20, 96058, "", "=q4=Shellsplitter Greataxe", "=ds=#h1#, #w1#" },
				{ 21, 96050, "", "=q4=Shattered Tortoiseshell Longbow", "=ds=#w2#" },
				{ 22, 96064, "", "=q4=Tortos' Discarded Shell", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96431, "", "=q4=Beakbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 96435, "", "=q4=Shimmershell Cape", "=ds=#s4#" },
				{ 3, 96433, "", "=q4=Stonegaze Hood", "=ds=#s1#, #a1#" },
				{ 4, 96432, "", "=q4=Azure Shell Bracers", "=ds=#s8#, #a1#" },
				{ 5, 96434, "", "=q4=Crystal-Claw Gloves", "=ds=#s9#, #a1#" },
				{ 6, 96438, "", "=q4=Robes of Concussive Shocks", "=ds=#s5#, #a2#" },
				{ 7, 96423, "", "=q4=Rockfall Ribwraps", "=ds=#s5#, #a2#" },
				{ 8, 96437, "", "=q4=Vampire Bat-Hide Bracers", "=ds=#s8#, #a2#" },
				{ 9, 96424, "", "=q4=Grips of Vampiric Cruelty", "=ds=#s9#, #a2#" },
				{ 10, 96439, "", "=q4=Spaulders of Quaking Fear", "=ds=#s3#, #a3#" },
				{ 11, 96425, "", "=q4=Beady-Eye Bracers", "=ds=#s8#, #a3#" },
				{ 12, 96426, "", "=q4=Quakestompers", "=ds=#s12#, #a3#" },
				{ 13, 96427, "", "=q4=Shoulderguards of Centripetal Destruction", "=ds=#s3#, #a4#" },
				{ 14, 96428, "", "=q4=Shell-Coated Wristplates", "=ds=#s8#, #a4#" },
				{ 15, 96441, "", "=q4=Tortos' Shellseizers", "=ds=#s9#, #a4#" },
				{ 16, 96440, "", "=q4=Refreshing Abalone Girdle", "=ds=#s10#, #a4#" },
				{ 18, 96429, "", "=q4=Amulet of the Primal Turtle", "=ds=#s2#" },
				{ 20, 96430, "", "=q4=Shellsplitter Greataxe", "=ds=#h1#, #w1#" },
				{ 21, 96422, "", "=q4=Shattered Tortoiseshell Longbow", "=ds=#w2#" },
				{ 22, 96436, "", "=q4=Tortos' Discarded Shell", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96803, "", "=q4=Beakbreaker Greatcloak", "=ds=#s4#" },
				{ 2, 96807, "", "=q4=Shimmershell Cape", "=ds=#s4#" },
				{ 3, 96805, "", "=q4=Stonegaze Hood", "=ds=#s1#, #a1#" },
				{ 4, 96804, "", "=q4=Azure Shell Bracers", "=ds=#s8#, #a1#" },
				{ 5, 96806, "", "=q4=Crystal-Claw Gloves", "=ds=#s9#, #a1#" },
				{ 6, 96810, "", "=q4=Robes of Concussive Shocks", "=ds=#s5#, #a2#" },
				{ 7, 96795, "", "=q4=Rockfall Ribwraps", "=ds=#s5#, #a2#" },
				{ 8, 96809, "", "=q4=Vampire Bat-Hide Bracers", "=ds=#s8#, #a2#" },
				{ 9, 96796, "", "=q4=Grips of Vampiric Cruelty", "=ds=#s9#, #a2#" },
				{ 10, 96811, "", "=q4=Spaulders of Quaking Fear", "=ds=#s3#, #a3#" },
				{ 11, 96797, "", "=q4=Beady-Eye Bracers", "=ds=#s8#, #a3#" },
				{ 12, 96798, "", "=q4=Quakestompers", "=ds=#s12#, #a3#" },
				{ 13, 96799, "", "=q4=Shoulderguards of Centripetal Destruction", "=ds=#s3#, #a4#" },
				{ 14, 96800, "", "=q4=Shell-Coated Wristplates", "=ds=#s8#, #a4#" },
				{ 15, 96813, "", "=q4=Tortos' Shellseizers", "=ds=#s9#, #a4#" },
				{ 16, 96812, "", "=q4=Refreshing Abalone Girdle", "=ds=#s10#, #a4#" },
				{ 18, 96801, "", "=q4=Amulet of the Primal Turtle", "=ds=#s2#" },
				{ 20, 96802, "", "=q4=Shellsplitter Greataxe", "=ds=#h1#, #w1#" },
				{ 21, 96794, "", "=q4=Shattered Tortoiseshell Longbow", "=ds=#w2#" },
				{ 22, 96808, "", "=q4=Tortos' Discarded Shell", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Tortos", 825),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTMegaera"] = {
		["RaidFinder"] = {
			{
				{ 1, 95707, "", "=q4=Gleaming-Eye Shoulderpads", "=ds=#s3#, #a1#" },
				{ 2, 95708, "", "=q4=Frostborn Wristwraps", "=ds=#s8#, #a1#" },
				{ 3, 95706, "", "=q4=Sandals of Arcane Fury", "=ds=#s12#, #a1#" },
				{ 4, 95713, "", "=q4=Hood of Smoldering Flesh", "=ds=#s1#, #a2#" },
				{ 5, 95700, "", "=q4=Poisonblood Bladeshoulders", "=ds=#s3#, #a2#" },
				{ 6, 95715, "", "=q4=Chain of Consuming Magic", "=ds=#s5#, #a3#" },
				{ 7, 95701, "", "=q4=Grips of Cinderflesh", "=ds=#s9#, #a3#" },
				{ 8, 95714, "", "=q4=Links of the Bifurcated Tongue", "=ds=#s10#, #a3#" },
				{ 9, 95703, "", "=q4=Rot-Proof Greatplate", "=ds=#s5#, #a4#" },
				{ 10, 95702, "", "=q4=Plated Toothbreaker Girdle", "=ds=#s10#, #a4#" },
				{ 11, 95716, "", "=q4=Ice-Scored Treads", "=ds=#s12#, #a4#" },
				{ 16, 95705, "", "=q4=Hydraskull Choker", "=ds=#s2#" },
				{ 17, 95709, "", "=q4=Megaera's Shining Eye", "=ds=#s2#" },
				{ 18, 95699, "", "=q4=Quadra-Head Brooch", "=ds=#s2#" },
				{ 19, 95704, "", "=q4=Spinescale Seal", "=ds=#s13#" },
				{ 20, 95711, "", "=q4=Breath of the Hydra", "=ds=#s14#" },
				{ 21, 95712, "", "=q4=Inscribed Bag of Hydra-Spawn", "=ds=#s14#" },
				{ 23, 95698, "", "=q4=Megaera's Poisoned Fang", "=ds=#h1#, #w4#" },
				{ 24, 95710, "", "=q4=Fetish of the Hydra", "=ds=#s15#" },
				{ 26, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94801, "", "=q4=Gleaming-Eye Shoulderpads", "=ds=#s3#, #a1#" },
				{ 2, 94804, "", "=q4=Frostborn Wristwraps", "=ds=#s8#, #a1#" },
				{ 3, 94799, "", "=q4=Sandals of Arcane Fury", "=ds=#s12#, #a1#" },
				{ 4, 94800, "", "=q4=Hood of Smoldering Flesh", "=ds=#s1#, #a2#" },
				{ 5, 94791, "", "=q4=Poisonblood Bladeshoulders", "=ds=#s3#, #a2#" },
				{ 6, 94797, "", "=q4=Chain of Consuming Magic", "=ds=#s5#, #a3#" },
				{ 7, 94790, "", "=q4=Grips of Cinderflesh", "=ds=#s9#, #a3#" },
				{ 8, 94802, "", "=q4=Links of the Bifurcated Tongue", "=ds=#s10#, #a3#" },
				{ 9, 94789, "", "=q4=Rot-Proof Greatplate", "=ds=#s5#, #a4#" },
				{ 10, 94792, "", "=q4=Plated Toothbreaker Girdle", "=ds=#s10#, #a4#" },
				{ 11, 94798, "", "=q4=Ice-Scored Treads", "=ds=#s12#, #a4#" },
				{ 16, 94793, "", "=q4=Hydraskull Choker", "=ds=#s2#" },
				{ 17, 94803, "", "=q4=Megaera's Shining Eye", "=ds=#s2#" },
				{ 18, 94794, "", "=q4=Quadra-Head Brooch", "=ds=#s2#" },
				{ 19, 94795, "", "=q4=Spinescale Seal", "=ds=#s13#" },
				{ 20, 94521, "", "=q4=Breath of the Hydra", "=ds=#s14#" },
				{ 21, 94520, "", "=q4=Inscribed Bag of Hydra-Spawn", "=ds=#s14#" },
				{ 23, 94788, "", "=q4=Megaera's Poisoned Fang", "=ds=#h1#, #w4#" },
				{ 24, 94796, "", "=q4=Fetish of the Hydra", "=ds=#s15#" },
				{ 26, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96079, "", "=q4=Gleaming-Eye Shoulderpads", "=ds=#s3#, #a1#" },
				{ 2, 96080, "", "=q4=Frostborn Wristwraps", "=ds=#s8#, #a1#" },
				{ 3, 96078, "", "=q4=Sandals of Arcane Fury", "=ds=#s12#, #a1#" },
				{ 4, 96085, "", "=q4=Hood of Smoldering Flesh", "=ds=#s1#, #a2#" },
				{ 5, 96072, "", "=q4=Poisonblood Bladeshoulders", "=ds=#s3#, #a2#" },
				{ 6, 96087, "", "=q4=Chain of Consuming Magic", "=ds=#s5#, #a3#" },
				{ 7, 96073, "", "=q4=Grips of Cinderflesh", "=ds=#s9#, #a3#" },
				{ 8, 96086, "", "=q4=Links of the Bifurcated Tongue", "=ds=#s10#, #a3#" },
				{ 9, 96075, "", "=q4=Rot-Proof Greatplate", "=ds=#s5#, #a4#" },
				{ 10, 96074, "", "=q4=Plated Toothbreaker Girdle", "=ds=#s10#, #a4#" },
				{ 11, 96088, "", "=q4=Ice-Scored Treads", "=ds=#s12#, #a4#" },
				{ 16, 96077, "", "=q4=Hydraskull Choker", "=ds=#s2#" },
				{ 17, 96081, "", "=q4=Megaera's Shining Eye", "=ds=#s2#" },
				{ 18, 96071, "", "=q4=Quadra-Head Brooch", "=ds=#s2#" },
				{ 19, 96076, "", "=q4=Spinescale Seal", "=ds=#s13#" },
				{ 20, 96083, "", "=q4=Breath of the Hydra", "=ds=#s14#" },
				{ 21, 96084, "", "=q4=Inscribed Bag of Hydra-Spawn", "=ds=#s14#" },
				{ 23, 96070, "", "=q4=Megaera's Poisoned Fang", "=ds=#h1#, #w4#" },
				{ 24, 96082, "", "=q4=Fetish of the Hydra", "=ds=#s15#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96451, "", "=q4=Gleaming-Eye Shoulderpads", "=ds=#s3#, #a1#" },
				{ 2, 96452, "", "=q4=Frostborn Wristwraps", "=ds=#s8#, #a1#" },
				{ 3, 96450, "", "=q4=Sandals of Arcane Fury", "=ds=#s12#, #a1#" },
				{ 4, 96457, "", "=q4=Hood of Smoldering Flesh", "=ds=#s1#, #a2#" },
				{ 5, 96444, "", "=q4=Poisonblood Bladeshoulders", "=ds=#s3#, #a2#" },
				{ 6, 96459, "", "=q4=Chain of Consuming Magic", "=ds=#s5#, #a3#" },
				{ 7, 96445, "", "=q4=Grips of Cinderflesh", "=ds=#s9#, #a3#" },
				{ 8, 96458, "", "=q4=Links of the Bifurcated Tongue", "=ds=#s10#, #a3#" },
				{ 9, 96447, "", "=q4=Rot-Proof Greatplate", "=ds=#s5#, #a4#" },
				{ 10, 96446, "", "=q4=Plated Toothbreaker Girdle", "=ds=#s10#, #a4#" },
				{ 11, 96460, "", "=q4=Ice-Scored Treads", "=ds=#s12#, #a4#" },
				{ 16, 96449, "", "=q4=Hydraskull Choker", "=ds=#s2#" },
				{ 17, 96453, "", "=q4=Megaera's Shining Eye", "=ds=#s2#" },
				{ 18, 96443, "", "=q4=Quadra-Head Brooch", "=ds=#s2#" },
				{ 19, 96448, "", "=q4=Spinescale Seal", "=ds=#s13#" },
				{ 20, 96455, "", "=q4=Breath of the Hydra", "=ds=#s14#" },
				{ 21, 96456, "", "=q4=Inscribed Bag of Hydra-Spawn", "=ds=#s14#" },
				{ 23, 96442, "", "=q4=Megaera's Poisoned Fang", "=ds=#h1#, #w4#" },
				{ 24, 96454, "", "=q4=Fetish of the Hydra", "=ds=#s15#" },
				{ 26, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
			};
			{
				{ 1, 96823, "", "=q4=Gleaming-Eye Shoulderpads", "=ds=#s3#, #a1#" },
				{ 2, 96824, "", "=q4=Frostborn Wristwraps", "=ds=#s8#, #a1#" },
				{ 3, 96822, "", "=q4=Sandals of Arcane Fury", "=ds=#s12#, #a1#" },
				{ 4, 96829, "", "=q4=Hood of Smoldering Flesh", "=ds=#s1#, #a2#" },
				{ 5, 96816, "", "=q4=Poisonblood Bladeshoulders", "=ds=#s3#, #a2#" },
				{ 6, 96831, "", "=q4=Chain of Consuming Magic", "=ds=#s5#, #a3#" },
				{ 7, 96817, "", "=q4=Grips of Cinderflesh", "=ds=#s9#, #a3#" },
				{ 8, 96830, "", "=q4=Links of the Bifurcated Tongue", "=ds=#s10#, #a3#" },
				{ 9, 96819, "", "=q4=Rot-Proof Greatplate", "=ds=#s5#, #a4#" },
				{ 10, 96818, "", "=q4=Plated Toothbreaker Girdle", "=ds=#s10#, #a4#" },
				{ 11, 96832, "", "=q4=Ice-Scored Treads", "=ds=#s12#, #a4#" },
				{ 16, 96821, "", "=q4=Hydraskull Choker", "=ds=#s2#" },
				{ 17, 96825, "", "=q4=Megaera's Shining Eye", "=ds=#s2#" },
				{ 18, 96815, "", "=q4=Quadra-Head Brooch", "=ds=#s2#" },
				{ 19, 96820, "", "=q4=Spinescale Seal", "=ds=#s13#" },
				{ 20, 96827, "", "=q4=Breath of the Hydra", "=ds=#s14#" },
				{ 21, 96828, "", "=q4=Inscribed Bag of Hydra-Spawn", "=ds=#s14#" },
				{ 23, 96814, "", "=q4=Megaera's Poisoned Fang", "=ds=#h1#, #w4#" },
				{ 24, 96826, "", "=q4=Fetish of the Hydra", "=ds=#s15#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Megaera", 821),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTJiKun"] = {
		["RaidFinder"] = {
			{
				{ 1, 95717, "", "=q4=Pinionfeather Greatcloak", "=ds=#s4#" },
				{ 2, 95719, "", "=q4=Robe of Midnight Down", "=ds=#s5#, #a1#" },
				{ 3, 95718, "", "=q4=Cord of Cacophonous Cawing", "=ds=#s10#, #a1#" },
				{ 4, 95721, "", "=q4=Featherflight Belt", "=ds=#s10#, #a2#" },
				{ 5, 95722, "", "=q4=Grasp of the Ruthless Mother", "=ds=#s9#, #a3#" },
				{ 6, 95723, "", "=q4=Crown of Potentiated Birth", "=ds=#s1#, #a4#" },
				{ 7, 95724, "", "=q4=Talonrender Chestplate", "=ds=#s5#, #a4#" },
				{ 8, 95725, "", "=q4=Egg-Shard Grips", "=ds=#s9#, #a4#" },
				{ 10, 94835, "", "=q3=Ji-Kun Hatchling", "=ds=#e13#", ""};
				{ 12, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 16, 95888, "", "=q4=Leggings of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95889, "", "=q4=Leggings of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95887, "", "=q4=Leggings of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 95726, "", "=q4=Fabled Feather of Ji-Kun", "=ds=#s14#" },
				{ 21, 95727, "", "=q4=Ji-Kun's Rising Winds", "=ds=#s14#" },
				{ 23, 95720, "", "=q4=Giorgio's Caduceus of Pure Moods", "=ds=#w9#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94812, "", "=q4=Pinionfeather Greatcloak", "=ds=#s4#" },
				{ 2, 94806, "", "=q4=Robe of Midnight Down", "=ds=#s5#, #a1#" },
				{ 3, 94813, "", "=q4=Cord of Cacophonous Cawing", "=ds=#s10#, #a1#" },
				{ 4, 94811, "", "=q4=Featherflight Belt", "=ds=#s10#, #a2#" },
				{ 5, 94808, "", "=q4=Grasp of the Ruthless Mother", "=ds=#s9#, #a3#" },
				{ 6, 94809, "", "=q4=Crown of Potentiated Birth", "=ds=#s1#, #a4#" },
				{ 7, 94810, "", "=q4=Talonrender Chestplate", "=ds=#s5#, #a4#" },
				{ 8, 94807, "", "=q4=Egg-Shard Grips", "=ds=#s9#, #a4#" },
				{ 10, 95059, "", "=q4=Clutch of Ji-Kun", "=ds=#e27#", ""};
				{ 11, 94835, "", "=q3=Ji-Kun Hatchling", "=ds=#e13#", ""};
				{ 13, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 16, 95576, "", "=q4=Leggings of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95581, "", "=q4=Leggings of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95572, "", "=q4=Leggings of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 94515, "", "=q4=Fabled Feather of Ji-Kun", "=ds=#s14#" },
				{ 21, 94527, "", "=q4=Ji-Kun's Rising Winds", "=ds=#s14#" },
				{ 23, 94805, "", "=q4=Giorgio's Caduceus of Pure Moods", "=ds=#w9#" },
			};
			{
				{ 1, 96089, "", "=q4=Pinionfeather Greatcloak", "=ds=#s4#" },
				{ 2, 96091, "", "=q4=Robe of Midnight Down", "=ds=#s5#, #a1#" },
				{ 3, 96090, "", "=q4=Cord of Cacophonous Cawing", "=ds=#s10#, #a1#" },
				{ 4, 96093, "", "=q4=Featherflight Belt", "=ds=#s10#, #a2#" },
				{ 5, 96094, "", "=q4=Grasp of the Ruthless Mother", "=ds=#s9#, #a3#" },
				{ 6, 96095, "", "=q4=Crown of Potentiated Birth", "=ds=#s1#, #a4#" },
				{ 7, 96096, "", "=q4=Talonrender Chestplate", "=ds=#s5#, #a4#" },
				{ 8, 96097, "", "=q4=Egg-Shard Grips", "=ds=#s9#, #a4#" },
				{ 20, 96098, "", "=q4=Fabled Feather of Ji-Kun", "=ds=#s14#" },
				{ 21, 96099, "", "=q4=Ji-Kun's Rising Winds", "=ds=#s14#" },
				{ 23, 96092, "", "=q4=Giorgio's Caduceus of Pure Moods", "=ds=#w9#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96461, "", "=q4=Pinionfeather Greatcloak", "=ds=#s4#" },
				{ 2, 96463, "", "=q4=Robe of Midnight Down", "=ds=#s5#, #a1#" },
				{ 3, 96462, "", "=q4=Cord of Cacophonous Cawing", "=ds=#s10#, #a1#" },
				{ 4, 96465, "", "=q4=Featherflight Belt", "=ds=#s10#, #a2#" },
				{ 5, 96466, "", "=q4=Grasp of the Ruthless Mother", "=ds=#s9#, #a3#" },
				{ 6, 96467, "", "=q4=Crown of Potentiated Birth", "=ds=#s1#, #a4#" },
				{ 7, 96468, "", "=q4=Talonrender Chestplate", "=ds=#s5#, #a4#" },
				{ 8, 96469, "", "=q4=Egg-Shard Grips", "=ds=#s9#, #a4#" },
				{ 10, 95059, "", "=q4=Clutch of Ji-Kun", "=ds=#e27#", ""};
				{ 11, 94835, "", "=q3=Ji-Kun Hatchling", "=ds=#e13#", ""};
				{ 13, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 16, 96632, "", "=q4=Leggings of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 96633, "", "=q4=Leggings of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 96631, "", "=q4=Leggings of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 96470, "", "=q4=Fabled Feather of Ji-Kun", "=ds=#s14#" },
				{ 21, 96471, "", "=q4=Ji-Kun's Rising Winds", "=ds=#s14#" },
				{ 23, 96464, "", "=q4=Giorgio's Caduceus of Pure Moods", "=ds=#w9#" },
			};
			{
				{ 1, 96833, "", "=q4=Pinionfeather Greatcloak", "=ds=#s4#" },
				{ 2, 96835, "", "=q4=Robe of Midnight Down", "=ds=#s5#, #a1#" },
				{ 3, 96834, "", "=q4=Cord of Cacophonous Cawing", "=ds=#s10#, #a1#" },
				{ 4, 96837, "", "=q4=Featherflight Belt", "=ds=#s10#, #a2#" },
				{ 5, 96838, "", "=q4=Grasp of the Ruthless Mother", "=ds=#s9#, #a3#" },
				{ 6, 96839, "", "=q4=Crown of Potentiated Birth", "=ds=#s1#, #a4#" },
				{ 7, 96840, "", "=q4=Talonrender Chestplate", "=ds=#s5#, #a4#" },
				{ 8, 96841, "", "=q4=Egg-Shard Grips", "=ds=#s9#, #a4#" },
				{ 20, 96842, "", "=q4=Fabled Feather of Ji-Kun", "=ds=#s14#" },
				{ 21, 96843, "", "=q4=Ji-Kun's Rising Winds", "=ds=#s14#" },
				{ 23, 96836, "", "=q4=Giorgio's Caduceus of Pure Moods", "=ds=#w9#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Ji-Kun", 828),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTDurumu"] = {
		["RaidFinder"] = {
			{
				{ 1, 95741, "", "=q4=Deadly Glare Cape", "=ds=#s4#" },
				{ 2, 95736, "", "=q4=Reinforced Mirror-Sheen Cloak", "=ds=#s4#" },
				{ 3, 95740, "", "=q4=Chilblain Spaulders", "=ds=#s3#, #a1#" },
				{ 4, 95738, "", "=q4=Lifedrainer's Sordid Grip", "=ds=#s9#, #a1#" },
				{ 5, 95739, "", "=q4=Leggings of Pulsing Blood", "=ds=#s11#, #a1#" },
				{ 6, 95729, "", "=q4=Crimson Bloom Legguards", "=ds=#s11#, #a2#" },
				{ 7, 95744, "", "=q4=Sandals of the Starving Eye", "=ds=#s12#, #a2#" },
				{ 8, 95731, "", "=q4=Aberrant Chestguard of Torment", "=ds=#s5#, #a3#" },
				{ 9, 95745, "", "=q4=Vein-Cover Bracers", "=ds=#s8#, #a3#" },
				{ 10, 95730, "", "=q4=Links of the Disintegrator", "=ds=#s10#, #a3#" },
				{ 11, 95732, "", "=q4=Caustic Spike Bracers", "=ds=#s8#, #a4#" },
				{ 12, 95735, "", "=q4=Artery Rippers", "=ds=#s9#, #a4#" },
				{ 13, 95746, "", "=q4=Iceshatter Gauntlets", "=ds=#s9#, #a4#" },
				{ 14, 95747, "", "=q4=Legplates of Re-Emergence", "=ds=#s11#, #a4#" },
				{ 15, 95733, "", "=q4=Legplates of the Dark Parasite", "=ds=#s11#, #a4#" },
				{ 16, 95734, "", "=q4=Treads of the Blind Eye", "=ds=#s12#, #a4#" },
				{ 18, 95742, "", "=q4=Durumu's Captive Eyeball", "=ds=#s13#" },
				{ 19, 95737, "", "=q4=Durumu's Severed Tentacle", "=ds=#s13#" },
				{ 21, 95743, "", "=q4=Ritual Dagger of the Mind's Eye", "=ds=#h1#, #w4#" },
				{ 22, 95728, "", "=q4=Durumu's Baleful Gaze", "=ds=#w3#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94929, "", "=q4=Deadly Glare Cape", "=ds=#s4#" },
				{ 2, 94822, "", "=q4=Reinforced Mirror-Sheen Cloak", "=ds=#s4#" },
				{ 3, 94928, "", "=q4=Chilblain Spaulders", "=ds=#s3#, #a1#" },
				{ 4, 94925, "", "=q4=Lifedrainer's Sordid Grip", "=ds=#s9#, #a1#" },
				{ 5, 94923, "", "=q4=Leggings of Pulsing Blood", "=ds=#s11#, #a1#" },
				{ 6, 94816, "", "=q4=Crimson Bloom Legguards", "=ds=#s11#, #a2#" },
				{ 7, 94927, "", "=q4=Sandals of the Starving Eye", "=ds=#s12#, #a2#" },
				{ 8, 94818, "", "=q4=Aberrant Chestguard of Torment", "=ds=#s5#, #a3#" },
				{ 9, 94926, "", "=q4=Vein-Cover Bracers", "=ds=#s8#, #a3#" },
				{ 10, 94819, "", "=q4=Links of the Disintegrator", "=ds=#s10#, #a3#" },
				{ 11, 94820, "", "=q4=Caustic Spike Bracers", "=ds=#s8#, #a4#" },
				{ 12, 94821, "", "=q4=Artery Rippers", "=ds=#s9#, #a4#" },
				{ 13, 94924, "", "=q4=Iceshatter Gauntlets", "=ds=#s9#, #a4#" },
				{ 14, 94930, "", "=q4=Legplates of Re-Emergence", "=ds=#s11#, #a4#" },
				{ 15, 94815, "", "=q4=Legplates of the Dark Parasite", "=ds=#s11#, #a4#" },
				{ 16, 94817, "", "=q4=Treads of the Blind Eye", "=ds=#s12#, #a4#" },
				{ 18, 94931, "", "=q4=Durumu's Captive Eyeball", "=ds=#s13#" },
				{ 19, 95511, "", "=q4=Durumu's Severed Tentacle", "=ds=#s13#" },
				{ 21, 94922, "", "=q4=Ritual Dagger of the Mind's Eye", "=ds=#h1#, #w4#" },
				{ 22, 94814, "", "=q4=Durumu's Baleful Gaze", "=ds=#w3#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96113, "", "=q4=Deadly Glare Cape", "=ds=#s4#" },
				{ 2, 96108, "", "=q4=Reinforced Mirror-Sheen Cloak", "=ds=#s4#" },
				{ 3, 96112, "", "=q4=Chilblain Spaulders", "=ds=#s3#, #a1#" },
				{ 4, 96110, "", "=q4=Lifedrainer's Sordid Grip", "=ds=#s9#, #a1#" },
				{ 5, 96111, "", "=q4=Leggings of Pulsing Blood", "=ds=#s11#, #a1#" },
				{ 6, 96101, "", "=q4=Crimson Bloom Legguards", "=ds=#s11#, #a2#" },
				{ 7, 96116, "", "=q4=Sandals of the Starving Eye", "=ds=#s12#, #a2#" },
				{ 8, 96103, "", "=q4=Aberrant Chestguard of Torment", "=ds=#s5#, #a3#" },
				{ 9, 96117, "", "=q4=Vein-Cover Bracers", "=ds=#s8#, #a3#" },
				{ 10, 96102, "", "=q4=Links of the Disintegrator", "=ds=#s10#, #a3#" },
				{ 11, 96104, "", "=q4=Caustic Spike Bracers", "=ds=#s8#, #a4#" },
				{ 12, 96107, "", "=q4=Artery Rippers", "=ds=#s9#, #a4#" },
				{ 13, 96118, "", "=q4=Iceshatter Gauntlets", "=ds=#s9#, #a4#" },
				{ 14, 96119, "", "=q4=Legplates of Re-Emergence", "=ds=#s11#, #a4#" },
				{ 15, 96105, "", "=q4=Legplates of the Dark Parasite", "=ds=#s11#, #a4#" },
				{ 16, 96106, "", "=q4=Treads of the Blind Eye", "=ds=#s12#, #a4#" },
				{ 18, 96114, "", "=q4=Durumu's Captive Eyeball", "=ds=#s13#" },
				{ 19, 96109, "", "=q4=Durumu's Severed Tentacle", "=ds=#s13#" },
				{ 21, 96115, "", "=q4=Ritual Dagger of the Mind's Eye", "=ds=#h1#, #w4#" },
				{ 22, 96100, "", "=q4=Durumu's Baleful Gaze", "=ds=#w3#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96485, "", "=q4=Deadly Glare Cape", "=ds=#s4#" },
				{ 2, 96480, "", "=q4=Reinforced Mirror-Sheen Cloak", "=ds=#s4#" },
				{ 3, 96484, "", "=q4=Chilblain Spaulders", "=ds=#s3#, #a1#" },
				{ 4, 96482, "", "=q4=Lifedrainer's Sordid Grip", "=ds=#s9#, #a1#" },
				{ 5, 96483, "", "=q4=Leggings of Pulsing Blood", "=ds=#s11#, #a1#" },
				{ 6, 96473, "", "=q4=Crimson Bloom Legguards", "=ds=#s11#, #a2#" },
				{ 7, 96488, "", "=q4=Sandals of the Starving Eye", "=ds=#s12#, #a2#" },
				{ 8, 96475, "", "=q4=Aberrant Chestguard of Torment", "=ds=#s5#, #a3#" },
				{ 9, 96489, "", "=q4=Vein-Cover Bracers", "=ds=#s8#, #a3#" },
				{ 10, 96474, "", "=q4=Links of the Disintegrator", "=ds=#s10#, #a3#" },
				{ 11, 96476, "", "=q4=Caustic Spike Bracers", "=ds=#s8#, #a4#" },
				{ 12, 96479, "", "=q4=Artery Rippers", "=ds=#s9#, #a4#" },
				{ 13, 96490, "", "=q4=Iceshatter Gauntlets", "=ds=#s9#, #a4#" },
				{ 14, 96491, "", "=q4=Legplates of Re-Emergence", "=ds=#s11#, #a4#" },
				{ 15, 96477, "", "=q4=Legplates of the Dark Parasite", "=ds=#s11#, #a4#" },
				{ 16, 96478, "", "=q4=Treads of the Blind Eye", "=ds=#s12#, #a4#" },
				{ 18, 96486, "", "=q4=Durumu's Captive Eyeball", "=ds=#s13#" },
				{ 19, 96481, "", "=q4=Durumu's Severed Tentacle", "=ds=#s13#" },
				{ 21, 96487, "", "=q4=Ritual Dagger of the Mind's Eye", "=ds=#h1#, #w4#" },
				{ 22, 96472, "", "=q4=Durumu's Baleful Gaze", "=ds=#w3#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96857, "", "=q4=Deadly Glare Cape", "=ds=#s4#" },
				{ 2, 96852, "", "=q4=Reinforced Mirror-Sheen Cloak", "=ds=#s4#" },
				{ 3, 96856, "", "=q4=Chilblain Spaulders", "=ds=#s3#, #a1#" },
				{ 4, 96854, "", "=q4=Lifedrainer's Sordid Grip", "=ds=#s9#, #a1#" },
				{ 5, 96855, "", "=q4=Leggings of Pulsing Blood", "=ds=#s11#, #a1#" },
				{ 6, 96845, "", "=q4=Crimson Bloom Legguards", "=ds=#s11#, #a2#" },
				{ 7, 96860, "", "=q4=Sandals of the Starving Eye", "=ds=#s12#, #a2#" },
				{ 8, 96847, "", "=q4=Aberrant Chestguard of Torment", "=ds=#s5#, #a3#" },
				{ 9, 96861, "", "=q4=Vein-Cover Bracers", "=ds=#s8#, #a3#" },
				{ 10, 96846, "", "=q4=Links of the Disintegrator", "=ds=#s10#, #a3#" },
				{ 11, 96848, "", "=q4=Caustic Spike Bracers", "=ds=#s8#, #a4#" },
				{ 12, 96851, "", "=q4=Artery Rippers", "=ds=#s9#, #a4#" },
				{ 13, 96862, "", "=q4=Iceshatter Gauntlets", "=ds=#s9#, #a4#" },
				{ 14, 96863, "", "=q4=Legplates of Re-Emergence", "=ds=#s11#, #a4#" },
				{ 15, 96849, "", "=q4=Legplates of the Dark Parasite", "=ds=#s11#, #a4#" },
				{ 16, 96850, "", "=q4=Treads of the Blind Eye", "=ds=#s12#, #a4#" },
				{ 18, 96858, "", "=q4=Durumu's Captive Eyeball", "=ds=#s13#" },
				{ 19, 96853, "", "=q4=Durumu's Severed Tentacle", "=ds=#s13#" },
				{ 21, 96859, "", "=q4=Ritual Dagger of the Mind's Eye", "=ds=#h1#, #w4#" },
				{ 22, 96844, "", "=q4=Durumu's Baleful Gaze", "=ds=#w3#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Durumu the Forgotten", 818),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTPrimordius"] = {
		["RaidFinder"] = {
			{
				{ 1, 95755, "", "=q4=Hydra-Scale Bloodcloak", "=ds=#s4#" },
				{ 2, 95759, "", "=q4=Robes of Mutagenic Blood", "=ds=#s5#, #a1#" },
				{ 3, 95762, "", "=q4=Bracers of Fragile Bone", "=ds=#s8#, #a1#" },
				{ 4, 95760, "", "=q4=Helix-Breaker Gloves", "=ds=#s9#, #a1#" },
				{ 5, 95761, "", "=q4=Leggings of Ebon Veins", "=ds=#s11#, #a1#" },
				{ 6, 95749, "", "=q4=Gloves of Cushioned Air", "=ds=#s9#, #a2#" },
				{ 7, 95764, "", "=q4=Leggings of the Malformed Sapling", "=ds=#s11#, #a2#" },
				{ 8, 95765, "", "=q4=Clear-Mind Helm", "=ds=#s1#, #a3#" },
				{ 9, 95750, "", "=q4=Bracers of Mutagenic Fervor", "=ds=#s8#, #a3#" },
				{ 10, 95751, "", "=q4=Synapse-String Handguards", "=ds=#s9#, #a3#" },
				{ 11, 95754, "", "=q4=Metabolically Boosted Shoulderplates", "=ds=#s3#, #a4#" },
				{ 12, 95767, "", "=q4=Spaulders of Primordial Growth", "=ds=#s3#, #a4#" },
				{ 13, 95766, "", "=q4=Bonemender Bracers", "=ds=#s8#, #a4#" },
				{ 14, 95752, "", "=q4=Pathogenic Gauntlets", "=ds=#s9#, #a4#" },
				{ 15, 95753, "", "=q4=Black Blood Legplates", "=ds=#s11#, #a4#" },
				{ 16, 95756, "", "=q4=Band of the Scaled Tyrant", "=ds=#s13#" },
				{ 17, 95757, "", "=q4=Primordius' Talisman of Rage", "=ds=#s14#" },
				{ 18, 95763, "", "=q4=Stolen Relic of Zuldazar", "=ds=#s14#" },
				{ 19, 95748, "", "=q4=Talisman of Bloodlust", "=ds=#s14#" },
				{ 21, 95758, "", "=q4=Acid-Spine Bonemace", "=ds=#h1#, #w6#" },
				{ 22, 95768, "", "=q4=Greatshield of the Gloaming", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94942, "", "=q4=Hydra-Scale Bloodcloak", "=ds=#s4#" },
				{ 2, 94951, "", "=q4=Robes of Mutagenic Blood", "=ds=#s5#, #a1#" },
				{ 3, 94948, "", "=q4=Bracers of Fragile Bone", "=ds=#s8#, #a1#" },
				{ 4, 94947, "", "=q4=Helix-Breaker Gloves", "=ds=#s9#, #a1#" },
				{ 5, 94953, "", "=q4=Leggings of Ebon Veins", "=ds=#s11#, #a1#" },
				{ 6, 94939, "", "=q4=Gloves of Cushioned Air", "=ds=#s9#, #a2#" },
				{ 7, 94946, "", "=q4=Leggings of the Malformed Sapling", "=ds=#s11#, #a2#" },
				{ 8, 94949, "", "=q4=Clear-Mind Helm", "=ds=#s1#, #a3#" },
				{ 9, 94940, "", "=q4=Bracers of Mutagenic Fervor", "=ds=#s8#, #a3#" },
				{ 10, 94943, "", "=q4=Synapse-String Handguards", "=ds=#s9#, #a3#" },
				{ 11, 94941, "", "=q4=Metabolically Boosted Shoulderplates", "=ds=#s3#, #a4#" },
				{ 12, 94950, "", "=q4=Spaulders of Primordial Growth", "=ds=#s3#, #a4#" },
				{ 13, 94952, "", "=q4=Bonemender Bracers", "=ds=#s8#, #a4#" },
				{ 14, 94938, "", "=q4=Pathogenic Gauntlets", "=ds=#s9#, #a4#" },
				{ 15, 94944, "", "=q4=Black Blood Legplates", "=ds=#s11#, #a4#" },
				{ 16, 95513, "", "=q4=Band of the Scaled Tyrant", "=ds=#s13#" },
				{ 17, 94519, "", "=q4=Primordius' Talisman of Rage", "=ds=#s14#" },
				{ 18, 94525, "", "=q4=Stolen Relic of Zuldazar", "=ds=#s14#" },
				{ 19, 94522, "", "=q4=Talisman of Bloodlust", "=ds=#s14#" },
				{ 21, 94937, "", "=q4=Acid-Spine Bonemace", "=ds=#h1#, #w6#" },
				{ 22, 94945, "", "=q4=Greatshield of the Gloaming", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96127, "", "=q4=Hydra-Scale Bloodcloak", "=ds=#s4#" },
				{ 2, 96131, "", "=q4=Robes of Mutagenic Blood", "=ds=#s5#, #a1#" },
				{ 3, 96134, "", "=q4=Bracers of Fragile Bone", "=ds=#s8#, #a1#" },
				{ 4, 96132, "", "=q4=Helix-Breaker Gloves", "=ds=#s9#, #a1#" },
				{ 5, 96133, "", "=q4=Leggings of Ebon Veins", "=ds=#s11#, #a1#" },
				{ 6, 96121, "", "=q4=Gloves of Cushioned Air", "=ds=#s9#, #a2#" },
				{ 7, 96136, "", "=q4=Leggings of the Malformed Sapling", "=ds=#s11#, #a2#" },
				{ 8, 96137, "", "=q4=Clear-Mind Helm", "=ds=#s1#, #a3#" },
				{ 9, 96122, "", "=q4=Bracers of Mutagenic Fervor", "=ds=#s8#, #a3#" },
				{ 10, 96123, "", "=q4=Synapse-String Handguards", "=ds=#s9#, #a3#" },
				{ 11, 96126, "", "=q4=Metabolically Boosted Shoulderplates", "=ds=#s3#, #a4#" },
				{ 12, 96139, "", "=q4=Spaulders of Primordial Growth", "=ds=#s3#, #a4#" },
				{ 13, 96138, "", "=q4=Bonemender Bracers", "=ds=#s8#, #a4#" },
				{ 14, 96124, "", "=q4=Pathogenic Gauntlets", "=ds=#s9#, #a4#" },
				{ 15, 96125, "", "=q4=Black Blood Legplates", "=ds=#s11#, #a4#" },
				{ 16, 96128, "", "=q4=Band of the Scaled Tyrant", "=ds=#s13#" },
				{ 17, 96129, "", "=q4=Primordius' Talisman of Rage", "=ds=#s14#" },
				{ 18, 96135, "", "=q4=Stolen Relic of Zuldazar", "=ds=#s14#" },
				{ 19, 96120, "", "=q4=Talisman of Bloodlust", "=ds=#s14#" },
				{ 21, 96130, "", "=q4=Acid-Spine Bonemace", "=ds=#h1#, #w6#" },
				{ 22, 96140, "", "=q4=Greatshield of the Gloaming", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96499, "", "=q4=Hydra-Scale Bloodcloak", "=ds=#s4#" },
				{ 2, 96503, "", "=q4=Robes of Mutagenic Blood", "=ds=#s5#, #a1#" },
				{ 3, 96506, "", "=q4=Bracers of Fragile Bone", "=ds=#s8#, #a1#" },
				{ 4, 96504, "", "=q4=Helix-Breaker Gloves", "=ds=#s9#, #a1#" },
				{ 5, 96505, "", "=q4=Leggings of Ebon Veins", "=ds=#s11#, #a1#" },
				{ 6, 96493, "", "=q4=Gloves of Cushioned Air", "=ds=#s9#, #a2#" },
				{ 7, 96508, "", "=q4=Leggings of the Malformed Sapling", "=ds=#s11#, #a2#" },
				{ 8, 96509, "", "=q4=Clear-Mind Helm", "=ds=#s1#, #a3#" },
				{ 9, 96494, "", "=q4=Bracers of Mutagenic Fervor", "=ds=#s8#, #a3#" },
				{ 10, 96495, "", "=q4=Synapse-String Handguards", "=ds=#s9#, #a3#" },
				{ 11, 96498, "", "=q4=Metabolically Boosted Shoulderplates", "=ds=#s3#, #a4#" },
				{ 12, 96511, "", "=q4=Spaulders of Primordial Growth", "=ds=#s3#, #a4#" },
				{ 13, 96510, "", "=q4=Bonemender Bracers", "=ds=#s8#, #a4#" },
				{ 14, 96496, "", "=q4=Pathogenic Gauntlets", "=ds=#s9#, #a4#" },
				{ 15, 96497, "", "=q4=Black Blood Legplates", "=ds=#s11#, #a4#" },
				{ 16, 96500, "", "=q4=Band of the Scaled Tyrant", "=ds=#s13#" },
				{ 17, 96501, "", "=q4=Primordius' Talisman of Rage", "=ds=#s14#" },
				{ 18, 96507, "", "=q4=Stolen Relic of Zuldazar", "=ds=#s14#" },
				{ 19, 96492, "", "=q4=Talisman of Bloodlust", "=ds=#s14#" },
				{ 21, 96502, "", "=q4=Acid-Spine Bonemace", "=ds=#h1#, #w6#" },
				{ 22, 96512, "", "=q4=Greatshield of the Gloaming", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96871, "", "=q4=Hydra-Scale Bloodcloak", "=ds=#s4#" },
				{ 2, 96875, "", "=q4=Robes of Mutagenic Blood", "=ds=#s5#, #a1#" },
				{ 3, 96878, "", "=q4=Bracers of Fragile Bone", "=ds=#s8#, #a1#" },
				{ 4, 96876, "", "=q4=Helix-Breaker Gloves", "=ds=#s9#, #a1#" },
				{ 5, 96877, "", "=q4=Leggings of Ebon Veins", "=ds=#s11#, #a1#" },
				{ 6, 96865, "", "=q4=Gloves of Cushioned Air", "=ds=#s9#, #a2#" },
				{ 7, 96880, "", "=q4=Leggings of the Malformed Sapling", "=ds=#s11#, #a2#" },
				{ 8, 96881, "", "=q4=Clear-Mind Helm", "=ds=#s1#, #a3#" },
				{ 9, 96866, "", "=q4=Bracers of Mutagenic Fervor", "=ds=#s8#, #a3#" },
				{ 10, 96867, "", "=q4=Synapse-String Handguards", "=ds=#s9#, #a3#" },
				{ 11, 96870, "", "=q4=Metabolically Boosted Shoulderplates", "=ds=#s3#, #a4#" },
				{ 12, 96883, "", "=q4=Spaulders of Primordial Growth", "=ds=#s3#, #a4#" },
				{ 13, 96882, "", "=q4=Bonemender Bracers", "=ds=#s8#, #a4#" },
				{ 14, 96868, "", "=q4=Pathogenic Gauntlets", "=ds=#s9#, #a4#" },
				{ 15, 96869, "", "=q4=Black Blood Legplates", "=ds=#s11#, #a4#" },
				{ 16, 96872, "", "=q4=Band of the Scaled Tyrant", "=ds=#s13#" },
				{ 17, 96873, "", "=q4=Primordius' Talisman of Rage", "=ds=#s14#" },
				{ 18, 96879, "", "=q4=Stolen Relic of Zuldazar", "=ds=#s14#" },
				{ 19, 96864, "", "=q4=Talisman of Bloodlust", "=ds=#s14#" },
				{ 21, 96874, "", "=q4=Acid-Spine Bonemace", "=ds=#h1#, #w6#" },
				{ 22, 96884, "", "=q4=Greatshield of the Gloaming", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Primordius", 820),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTDarkAnimus"] = {
		["RaidFinder"] = {
			{
				{ 1, 95773, "", "=q4=Constantly Accelerating Cloak", "=ds=#s4#" },
				{ 2, 95771, "", "=q4=Hood of the Crimson Wake", "=ds=#s1#, #a1#" },
				{ 3, 95776, "", "=q4=Anima-Ringed Fingers", "=ds=#s9#, #a2#" },
				{ 4, 95775, "", "=q4=Worldbinder Leggings", "=ds=#s11#, #a2#" },
				{ 5, 95778, "", "=q4=Crown of the Golden Golem", "=ds=#s1#, #a4#" },
				{ 6, 95777, "", "=q4=Matter-Swapped Legplates", "=ds=#s11#, #a4#" },
				{ 8, 95769, "", "=q4=Gore-Soaked Gear", "=ds=#s13#" },
				{ 9, 95772, "", "=q4=Cha-Ye's Essence of Brilliance", "=ds=#s14#" },
				{ 10, 95779, "", "=q4=Delicate Vial of the Sanguinaire", "=ds=#s14#" },
				{ 16, 95823, "", "=q4=Chest of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95824, "", "=q4=Chest of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95822, "", "=q4=Chest of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 95774, "", "=q4=Athame of the Sanguine Ritual", "=ds=#h1#, #w4#" },
				{ 21, 95770, "", "=q4=Hand of the Dark Animus", "=ds=#h1#, #w6#" },
				{ 23, 94152, "", "=q3=Son of Animus", "=ds=#e13#", ""};
				{ 25, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 26, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94960, "", "=q4=Constantly Accelerating Cloak", "=ds=#s4#" },
				{ 2, 94959, "", "=q4=Hood of the Crimson Wake", "=ds=#s1#, #a1#" },
				{ 3, 94957, "", "=q4=Anima-Ringed Fingers", "=ds=#s9#, #a2#" },
				{ 4, 94962, "", "=q4=Worldbinder Leggings", "=ds=#s11#, #a2#" },
				{ 5, 94958, "", "=q4=Crown of the Golden Golem", "=ds=#s1#, #a4#" },
				{ 6, 94956, "", "=q4=Matter-Swapped Legplates", "=ds=#s11#, #a4#" },
				{ 8, 94961, "", "=q4=Gore-Soaked Gear", "=ds=#s13#" },
				{ 9, 94531, "", "=q4=Cha-Ye's Essence of Brilliance", "=ds=#s14#" },
				{ 10, 94518, "", "=q4=Delicate Vial of the Sanguinaire", "=ds=#s14#" },
				{ 16, 95574, "", "=q4=Chest of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95579, "", "=q4=Chest of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95569, "", "=q4=Chest of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 94955, "", "=q4=Athame of the Sanguine Ritual", "=ds=#h1#, #w4#" },
				{ 21, 94954, "", "=q4=Hand of the Dark Animus", "=ds=#h1#, #w6#" },
				{ 23, 94152, "", "=q3=Son of Animus", "=ds=#e13#", ""};
				{ 25, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 26, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96145, "", "=q4=Constantly Accelerating Cloak", "=ds=#s4#" },
				{ 2, 96143, "", "=q4=Hood of the Crimson Wake", "=ds=#s1#, #a1#" },
				{ 3, 96148, "", "=q4=Anima-Ringed Fingers", "=ds=#s9#, #a2#" },
				{ 4, 96147, "", "=q4=Worldbinder Leggings", "=ds=#s11#, #a2#" },
				{ 5, 96150, "", "=q4=Crown of the Golden Golem", "=ds=#s1#, #a4#" },
				{ 6, 96149, "", "=q4=Matter-Swapped Legplates", "=ds=#s11#, #a4#" },
				{ 8, 96141, "", "=q4=Gore-Soaked Gear", "=ds=#s13#" },
				{ 9, 96144, "", "=q4=Cha-Ye's Essence of Brilliance", "=ds=#s14#" },
				{ 10, 96151, "", "=q4=Delicate Vial of the Sanguinaire", "=ds=#s14#" },
				{ 20, 96146, "", "=q4=Athame of the Sanguine Ritual", "=ds=#h1#, #w4#" },
				{ 21, 96142, "", "=q4=Hand of the Dark Animus", "=ds=#h1#, #w6#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96517, "", "=q4=Constantly Accelerating Cloak", "=ds=#s4#" },
				{ 2, 96515, "", "=q4=Hood of the Crimson Wake", "=ds=#s1#, #a1#" },
				{ 3, 96520, "", "=q4=Anima-Ringed Fingers", "=ds=#s9#, #a2#" },
				{ 4, 96519, "", "=q4=Worldbinder Leggings", "=ds=#s11#, #a2#" },
				{ 5, 96522, "", "=q4=Crown of the Golden Golem", "=ds=#s1#, #a4#" },
				{ 6, 96521, "", "=q4=Matter-Swapped Legplates", "=ds=#s11#, #a4#" },
				{ 8, 96513, "", "=q4=Gore-Soaked Gear", "=ds=#s13#" },
				{ 9, 96516, "", "=q4=Cha-Ye's Essence of Brilliance", "=ds=#s14#" },
				{ 10, 96523, "", "=q4=Delicate Vial of the Sanguinaire", "=ds=#s14#" },
				{ 16, 96567, "", "=q4=Chest of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 96568, "", "=q4=Chest of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 96566, "", "=q4=Chest of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 96518, "", "=q4=Athame of the Sanguine Ritual", "=ds=#h1#, #w4#" },
				{ 21, 96514, "", "=q4=Hand of the Dark Animus", "=ds=#h1#, #w6#" },
				{ 23, 94152, "", "=q3=Son of Animus", "=ds=#e13#", ""};
				{ 25, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 26, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96889, "", "=q4=Constantly Accelerating Cloak", "=ds=#s4#" },
				{ 2, 96887, "", "=q4=Hood of the Crimson Wake", "=ds=#s1#, #a1#" },
				{ 3, 96892, "", "=q4=Anima-Ringed Fingers", "=ds=#s9#, #a2#" },
				{ 4, 96891, "", "=q4=Worldbinder Leggings", "=ds=#s11#, #a2#" },
				{ 5, 96894, "", "=q4=Crown of the Golden Golem", "=ds=#s1#, #a4#" },
				{ 6, 96893, "", "=q4=Matter-Swapped Legplates", "=ds=#s11#, #a4#" },
				{ 8, 96885, "", "=q4=Gore-Soaked Gear", "=ds=#s13#" },
				{ 9, 96888, "", "=q4=Cha-Ye's Essence of Brilliance", "=ds=#s14#" },
				{ 10, 96895, "", "=q4=Delicate Vial of the Sanguinaire", "=ds=#s14#" },
				{ 20, 96890, "", "=q4=Athame of the Sanguine Ritual", "=ds=#h1#, #w4#" },
				{ 21, 96886, "", "=q4=Hand of the Dark Animus", "=ds=#h1#, #w6#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Dark Animus", 824),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTIronQon"] = {
		["RaidFinder"] = {
			{
				{ 1, 95782, "", "=q4=Quet'zal's Crackling Cord", "=ds=#s10#, #a1#" },
				{ 2, 95783, "", "=q4=Saddle-Scarred Leggings", "=ds=#s11#, #a1#" },
				{ 3, 95784, "", "=q4=Dam'ren's Frozen Footguards", "=ds=#s12#, #a1#" },
				{ 4, 95787, "", "=q4=Spurs of the Storm Cavalry", "=ds=#s12#, #a2#" },
				{ 5, 95788, "", "=q4=Ro'shak's Molten Chain", "=ds=#s5#, #a3#" },
				{ 6, 95789, "", "=q4=Rein-Binder's Fists", "=ds=#s9#, #a4#" },
				{ 8, 95785, "", "=q4=Ro'shak's Remembrance", "=ds=#s13#" },
				{ 10, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 11, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
				{ 16, 95956, "", "=q4=Shoulders of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95957, "", "=q4=Shoulders of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95955, "", "=q4=Shoulders of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 95780, "", "=q4=Iron Qon's Boot Knife", "=ds=#h1#, #w4#" },
				{ 21, 95790, "", "=q4=Qon's Flaming Scimitar", "=ds=#h1#, #w10#" },
				{ 22, 95781, "", "=q4=Voice of the Quilen", "=ds=#w5#" },
				{ 23, 95786, "", "=q4=Orb of Arcing Lightning", "=ds=#s15#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94970, "", "=q4=Quet'zal's Crackling Cord", "=ds=#s10#, #a1#" },
				{ 2, 94966, "", "=q4=Saddle-Scarred Leggings", "=ds=#s11#, #a1#" },
				{ 3, 94968, "", "=q4=Dam'ren's Frozen Footguards", "=ds=#s12#, #a1#" },
				{ 4, 94967, "", "=q4=Spurs of the Storm Cavalry", "=ds=#s12#, #a2#" },
				{ 5, 94969, "", "=q4=Ro'shak's Molten Chain", "=ds=#s5#, #a3#" },
				{ 6, 94972, "", "=q4=Rein-Binder's Fists", "=ds=#s9#, #a4#" },
				{ 8, 95512, "", "=q4=Ro'shak's Remembrance", "=ds=#s13#" },
				{ 10, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 11, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
				{ 16, 95578, "", "=q4=Shoulders of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95583, "", "=q4=Shoulders of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95573, "", "=q4=Shoulders of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 94971, "", "=q4=Iron Qon's Boot Knife", "=ds=#h1#, #w4#" },
				{ 21, 94964, "", "=q4=Qon's Flaming Scimitar", "=ds=#h1#, #w10#" },
				{ 22, 94963, "", "=q4=Voice of the Quilen", "=ds=#w5#" },
				{ 23, 94965, "", "=q4=Orb of Arcing Lightning", "=ds=#s15#" },
			};
			{
				{ 1, 96154, "", "=q4=Quet'zal's Crackling Cord", "=ds=#s10#, #a1#" },
				{ 2, 96155, "", "=q4=Saddle-Scarred Leggings", "=ds=#s11#, #a1#" },
				{ 3, 96156, "", "=q4=Dam'ren's Frozen Footguards", "=ds=#s12#, #a1#" },
				{ 4, 96159, "", "=q4=Spurs of the Storm Cavalry", "=ds=#s12#, #a2#" },
				{ 5, 96160, "", "=q4=Ro'shak's Molten Chain", "=ds=#s5#, #a3#" },
				{ 6, 96161, "", "=q4=Rein-Binder's Fists", "=ds=#s9#, #a4#" },
				{ 8, 96157, "", "=q4=Ro'shak's Remembrance", "=ds=#s13#" },
				{ 20, 96152, "", "=q4=Iron Qon's Boot Knife", "=ds=#h1#, #w4#" },
				{ 21, 96162, "", "=q4=Qon's Flaming Scimitar", "=ds=#h1#, #w10#" },
				{ 22, 96153, "", "=q4=Voice of the Quilen", "=ds=#w5#" },
				{ 23, 96158, "", "=q4=Orb of Arcing Lightning", "=ds=#s15#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96526, "", "=q4=Quet'zal's Crackling Cord", "=ds=#s10#, #a1#" },
				{ 2, 96527, "", "=q4=Saddle-Scarred Leggings", "=ds=#s11#, #a1#" },
				{ 3, 96528, "", "=q4=Dam'ren's Frozen Footguards", "=ds=#s12#, #a1#" },
				{ 4, 96531, "", "=q4=Spurs of the Storm Cavalry", "=ds=#s12#, #a2#" },
				{ 5, 96532, "", "=q4=Ro'shak's Molten Chain", "=ds=#s5#, #a3#" },
				{ 6, 96533, "", "=q4=Rein-Binder's Fists", "=ds=#s9#, #a4#" },
				{ 8, 96529, "", "=q4=Ro'shak's Remembrance", "=ds=#s13#" },
				{ 10, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 11, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
				{ 16, 96700, "", "=q4=Shoulders of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 96701, "", "=q4=Shoulders of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 96699, "", "=q4=Shoulders of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 96524, "", "=q4=Iron Qon's Boot Knife", "=ds=#h1#, #w4#" },
				{ 21, 96534, "", "=q4=Qon's Flaming Scimitar", "=ds=#h1#, #w10#" },
				{ 22, 96525, "", "=q4=Voice of the Quilen", "=ds=#w5#" },
				{ 23, 96530, "", "=q4=Orb of Arcing Lightning", "=ds=#s15#" },
			};
			{
				{ 1, 96898, "", "=q4=Quet'zal's Crackling Cord", "=ds=#s10#, #a1#" },
				{ 2, 96899, "", "=q4=Saddle-Scarred Leggings", "=ds=#s11#, #a1#" },
				{ 3, 96900, "", "=q4=Dam'ren's Frozen Footguards", "=ds=#s12#, #a1#" },
				{ 4, 96903, "", "=q4=Spurs of the Storm Cavalry", "=ds=#s12#, #a2#" },
				{ 5, 96904, "", "=q4=Ro'shak's Molten Chain", "=ds=#s5#, #a3#" },
				{ 8, 96901, "", "=q4=Ro'shak's Remembrance", "=ds=#s13#" },
				{ 20, 96896, "", "=q4=Iron Qon's Boot Knife", "=ds=#h1#, #w4#" },
				{ 21, 96906, "", "=q4=Qon's Flaming Scimitar", "=ds=#h1#, #w10#" },
				{ 22, 96897, "", "=q4=Voice of the Quilen", "=ds=#w5#" },
				{ 23, 96902, "", "=q4=Orb of Arcing Lightning", "=ds=#s15#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Iron Qon", 817),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTTwinConsorts"] = {
		["RaidFinder"] = {
			{
				{ 1, 95792, "", "=q4=Robes of the Moon Lotus", "=ds=#s5#, #a1#" },
				{ 2, 95796, "", "=q4=Bracers of the Midnight Comet", "=ds=#s8#, #a2#" },
				{ 3, 95797, "", "=q4=Girdle of Night and Day", "=ds=#s10#, #a2#" },
				{ 4, 95801, "", "=q4=Fingers of the Night", "=ds=#s9#, #a3#" },
				{ 5, 95798, "", "=q4=Tidal Force Treads", "=ds=#s12#, #a4#" },
				{ 6, 96905, "", "=q4=Rein-Binder's Fists", "=ds=#s9#, #a4#" },
				{ 7, 95800, "", "=q4=Moonjade Necklace", "=ds=#s2#" },
				{ 8, 95793, "", "=q4=Passionfire Choker", "=ds=#s2#" },
				{ 9, 95799, "", "=q4=Gaze of the Twins", "=ds=#s14#" },
				{ 16, 95880, "", "=q4=Helm of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95881, "", "=q4=Helm of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95879, "", "=q4=Helm of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 95795, "", "=q4=Suen-Wo, Spire of the Falling Sun", "=ds=#w9#" },
				{ 21, 95791, "", "=q4=Wu-Lai, Bladed Fan of the Consorts", "=ds=#h1#, #w13#" },
				{ 22, 95794, "", "=q4=Shield of Twinned Despair", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 94977, "", "=q4=Robes of the Moon Lotus", "=ds=#s5#, #a1#" },
				{ 2, 94979, "", "=q4=Bracers of the Midnight Comet", "=ds=#s8#, #a2#" },
				{ 3, 94978, "", "=q4=Girdle of Night and Day", "=ds=#s10#, #a2#" },
				{ 4, 94757, "", "=q4=Fingers of the Night", "=ds=#s9#, #a3#" },
				{ 5, 94976, "", "=q4=Tidal Force Treads", "=ds=#s12#, #a4#" },
				{ 7, 94981, "", "=q4=Moonjade Necklace", "=ds=#s2#" },
				{ 8, 94980, "", "=q4=Passionfire Choker", "=ds=#s2#" },
				{ 9, 94529, "", "=q4=Gaze of the Twins", "=ds=#s14#" },
				{ 16, 95577, "", "=q4=Helm of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 95582, "", "=q4=Helm of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 95571, "", "=q4=Helm of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 94974, "", "=q4=Suen-Wo, Spire of the Falling Sun", "=ds=#w9#" },
				{ 21, 94973, "", "=q4=Wu-Lai, Bladed Fan of the Consorts", "=ds=#h1#, #w13#" },
				{ 22, 95515, "", "=q4=Shield of Twinned Despair", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96164, "", "=q4=Robes of the Moon Lotus", "=ds=#s5#, #a1#" },
				{ 2, 96168, "", "=q4=Bracers of the Midnight Comet", "=ds=#s8#, #a2#" },
				{ 3, 96169, "", "=q4=Girdle of Night and Day", "=ds=#s10#, #a2#" },
				{ 4, 96173, "", "=q4=Fingers of the Night", "=ds=#s9#, #a3#" },
				{ 5, 96170, "", "=q4=Tidal Force Treads", "=ds=#s12#, #a4#" },
				{ 7, 96172, "", "=q4=Moonjade Necklace", "=ds=#s2#" },
				{ 8, 96165, "", "=q4=Passionfire Choker", "=ds=#s2#" },
				{ 9, 96171, "", "=q4=Gaze of the Twins", "=ds=#s14#" },
				{ 20, 96167, "", "=q4=Suen-Wo, Spire of the Falling Sun", "=ds=#w9#" },
				{ 21, 96163, "", "=q4=Wu-Lai, Bladed Fan of the Consorts", "=ds=#h1#, #w13#" },
				{ 22, 96166, "", "=q4=Shield of Twinned Despair", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96536, "", "=q4=Robes of the Moon Lotus", "=ds=#s5#, #a1#" },
				{ 2, 96540, "", "=q4=Bracers of the Midnight Comet", "=ds=#s8#, #a2#" },
				{ 3, 96541, "", "=q4=Girdle of Night and Day", "=ds=#s10#, #a2#" },
				{ 4, 96545, "", "=q4=Fingers of the Night", "=ds=#s9#, #a3#" },
				{ 5, 96542, "", "=q4=Tidal Force Treads", "=ds=#s12#, #a4#" },
				{ 7, 96544, "", "=q4=Moonjade Necklace", "=ds=#s2#" },
				{ 8, 96537, "", "=q4=Passionfire Choker", "=ds=#s2#" },
				{ 9, 96543, "", "=q4=Gaze of the Twins", "=ds=#s14#" },
				{ 16, 96624, "", "=q4=Helm of the Crackling Conqueror", "=ds=#e15#, #m41#" },
				{ 17, 96625, "", "=q4=Helm of the Crackling Protector", "=ds=#e15#, #m41#" },
				{ 18, 96623, "", "=q4=Helm of the Crackling Vanquisher", "=ds=#e15#, #m41#" },
				{ 20, 96539, "", "=q4=Suen-Wo, Spire of the Falling Sun", "=ds=#w9#" },
				{ 21, 96535, "", "=q4=Wu-Lai, Bladed Fan of the Consorts", "=ds=#h1#, #w13#" },
				{ 22, 96538, "", "=q4=Shield of Twinned Despair", "=ds=#w8#" },
				{ 24, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 25, 94594, "", "=q5=Titan Runestone", "=ds=#m3#" },
			};
			{
				{ 1, 96908, "", "=q4=Robes of the Moon Lotus", "=ds=#s5#, #a1#" },
				{ 2, 96912, "", "=q4=Bracers of the Midnight Comet", "=ds=#s8#, #a2#" },
				{ 3, 96913, "", "=q4=Girdle of Night and Day", "=ds=#s10#, #a2#" },
				{ 4, 96917, "", "=q4=Fingers of the Night", "=ds=#s9#, #a3#" },
				{ 5, 96914, "", "=q4=Tidal Force Treads", "=ds=#s12#, #a4#" },
				{ 7, 96916, "", "=q4=Moonjade Necklace", "=ds=#s2#" },
				{ 8, 96909, "", "=q4=Passionfire Choker", "=ds=#s2#" },
				{ 9, 96915, "", "=q4=Gaze of the Twins", "=ds=#s14#" },
				{ 20, 96911, "", "=q4=Suen-Wo, Spire of the Falling Sun", "=ds=#w9#" },
				{ 21, 96907, "", "=q4=Wu-Lai, Bladed Fan of the Consorts", "=ds=#h1#, #w13#" },
				{ 22, 96910, "", "=q4=Shield of Twinned Despair", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Twin Consorts", 829),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTLeiShen"] = {
		["RaidFinder"] = {
			{
				{ 1, 95813, "", "=q4=Gloves of the Maimed Vizier", "=ds=#s9#, #a1#" },
				{ 2, 95812, "", "=q4=Legwraps of Cardinality", "=ds=#s11#, #a1#" },
				{ 3, 95804, "", "=q4=Fusion Slasher Chestguard", "=ds=#s5#, #a2#" },
				{ 4, 95819, "", "=q4=Grips of Slicing Electricity", "=ds=#s9#, #a2#" },
				{ 5, 95805, "", "=q4=Conduit-Breaker Chain Leggings", "=ds=#s11#, #a3#" },
				{ 6, 95820, "", "=q4=Leggings of the Violent Gale", "=ds=#s11#, #a3#" },
				{ 7, 95806, "", "=q4=Doomed Crown of Lei Shen", "=ds=#s1#, #a4#" },
				{ 8, 95821, "", "=q4=Lei Shen's Grounded Carapace", "=ds=#s5#, #a4#" },
				{ 9, 95807, "", "=q4=Legplates of the Lightning Throne", "=ds=#s11#, #a4#" },
				{ 10, 95808, "", "=q4=Legplates of Whipping Ionization", "=ds=#s11#, #a4#" },
				{ 12, 94867, "", "=q5=Heart of the Thunder King", "=ds=#m3#" },
				{ 13, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 16, 95816, "", "=q4=Soul Prism of Lei Shen", "=ds=#s2#" },
				{ 17, 95817, "", "=q4=Lightning-Imbued Chalice", "=ds=#s14#" },
				{ 18, 95802, "", "=q4=Rune of Re-Origination", "=ds=#s14#" },
				{ 19, 95811, "", "=q4=Soul Barrier", "=ds=#s14#" },
				{ 20, 95814, "", "=q4=Unerring Vision of Lei Shen", "=ds=#s14#" },
				{ 22, 95803, "", "=q4=Shan-Dun, Breaker of Hope", "=ds=#w7#" },
				{ 23, 95815, "", "=q4=Torall, Rod of the Shattered Throne", "=ds=#h1#, #w6#" },
				{ 24, 95809, "", "=q4=Uroe, Harbinger of Terror", "=ds=#h2#, #w1#" },
				{ 25, 95810, "", "=q4=Ultimate Protection of the Emperor", "=ds=#w8#" },
				{ 26, 95818, "", "=q4=Lei Shen's Orb of Command", "=ds=#s15#" },

			};
		};
		["Normal"] = {
			{
				{ 1, 94993, "", "=q4=Gloves of the Maimed Vizier", "=ds=#s9#, #a1#" },
				{ 2, 94990, "", "=q4=Legwraps of Cardinality", "=ds=#s11#, #a1#" },
				{ 3, 94987, "", "=q4=Fusion Slasher Chestguard", "=ds=#s5#, #a2#" },
				{ 4, 94991, "", "=q4=Grips of Slicing Electricity", "=ds=#s9#, #a2#" },
				{ 5, 94986, "", "=q4=Conduit-Breaker Chain Leggings", "=ds=#s11#, #a3#" },
				{ 6, 94992, "", "=q4=Leggings of the Violent Gale", "=ds=#s11#, #a3#" },
				{ 7, 94984, "", "=q4=Doomed Crown of Lei Shen", "=ds=#s1#, #a4#" },
				{ 8, 94989, "", "=q4=Lei Shen's Grounded Carapace", "=ds=#s5#, #a4#" },
				{ 9, 95535, "", "=q4=Legplates of the Lightning Throne", "=ds=#s11#, #a4#" },
				{ 10, 94985, "", "=q4=Legplates of Whipping Ionization", "=ds=#s11#, #a4#" },
				{ 12, 94867, "", "=q5=Heart of the Thunder King", "=ds=#m3#" },
				{ 13, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 16, 94994, "", "=q4=Soul Prism of Lei Shen", "=ds=#s2#" },
				{ 17, 94530, "", "=q4=Lightning-Imbued Chalice", "=ds=#s14#" },
				{ 18, 94532, "", "=q4=Rune of Re-Origination", "=ds=#s14#" },
				{ 19, 94528, "", "=q4=Soul Barrier", "=ds=#s14#" },
				{ 20, 94524, "", "=q4=Unerring Vision of Lei Shen", "=ds=#s14#" },
				{ 22, 94983, "", "=q4=Shan-Dun, Breaker of Hope", "=ds=#w7#" },
				{ 23, 94988, "", "=q4=Torall, Rod of the Shattered Throne", "=ds=#h1#, #w6#" },
				{ 24, 94982, "", "=q4=Uroe, Harbinger of Terror", "=ds=#h2#, #w1#" },
				{ 25, 95472, "", "=q4=Ultimate Protection of the Emperor", "=ds=#w8#" },
				{ 26, 95473, "", "=q4=Lei Shen's Orb of Command", "=ds=#s15#" },
			};
			{
				{ 1, 96185, "", "=q4=Gloves of the Maimed Vizier", "=ds=#s9#, #a1#" },
				{ 2, 96184, "", "=q4=Legwraps of Cardinality", "=ds=#s11#, #a1#" },
				{ 3, 96176, "", "=q4=Fusion Slasher Chestguard", "=ds=#s5#, #a2#" },
				{ 4, 96191, "", "=q4=Grips of Slicing Electricity", "=ds=#s9#, #a2#" },
				{ 5, 96177, "", "=q4=Conduit-Breaker Chain Leggings", "=ds=#s11#, #a3#" },
				{ 6, 96192, "", "=q4=Leggings of the Violent Gale", "=ds=#s11#, #a3#" },
				{ 7, 96178, "", "=q4=Doomed Crown of Lei Shen", "=ds=#s1#, #a4#" },
				{ 8, 96193, "", "=q4=Lei Shen's Grounded Carapace", "=ds=#s5#, #a4#" },
				{ 9, 96179, "", "=q4=Legplates of the Lightning Throne", "=ds=#s11#, #a4#" },
				{ 10, 96180, "", "=q4=Legplates of Whipping Ionization", "=ds=#s11#, #a4#" },
				{ 16, 96188, "", "=q4=Soul Prism of Lei Shen", "=ds=#s2#" },
				{ 17, 96189, "", "=q4=Lightning-Imbued Chalice", "=ds=#s14#" },
				{ 18, 96174, "", "=q4=Rune of Re-Origination", "=ds=#s14#" },
				{ 19, 96183, "", "=q4=Soul Barrier", "=ds=#s14#" },
				{ 20, 96186, "", "=q4=Unerring Vision of Lei Shen", "=ds=#s14#" },
				{ 22, 96175, "", "=q4=Shan-Dun, Breaker of Hope", "=ds=#w7#" },
				{ 23, 96187, "", "=q4=Torall, Rod of the Shattered Throne", "=ds=#h1#, #w6#" },
				{ 24, 96181, "", "=q4=Uroe, Harbinger of Terror", "=ds=#h2#, #w1#" },
				{ 25, 96182, "", "=q4=Ultimate Protection of the Emperor", "=ds=#w8#" },
				{ 26, 96190, "", "=q4=Lei Shen's Orb of Command", "=ds=#s15#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96557, "", "=q4=Gloves of the Maimed Vizier", "=ds=#s9#, #a1#" },
				{ 2, 96556, "", "=q4=Legwraps of Cardinality", "=ds=#s11#, #a1#" },
				{ 3, 96548, "", "=q4=Fusion Slasher Chestguard", "=ds=#s5#, #a2#" },
				{ 4, 96563, "", "=q4=Grips of Slicing Electricity", "=ds=#s9#, #a2#" },
				{ 5, 96549, "", "=q4=Conduit-Breaker Chain Leggings", "=ds=#s11#, #a3#" },
				{ 6, 96564, "", "=q4=Leggings of the Violent Gale", "=ds=#s11#, #a3#" },
				{ 7, 96550, "", "=q4=Doomed Crown of Lei Shen", "=ds=#s1#, #a4#" },
				{ 8, 96565, "", "=q4=Lei Shen's Grounded Carapace", "=ds=#s5#, #a4#" },
				{ 9, 96551, "", "=q4=Legplates of the Lightning Throne", "=ds=#s11#, #a4#" },
				{ 10, 96552, "", "=q4=Legplates of Whipping Ionization", "=ds=#s11#, #a4#" },
				{ 12, 94867, "", "=q5=Heart of the Thunder King", "=ds=#m3#" },
				{ 13, 94593, "", "=q5=Secrets of the Empire", "=ds=#m3#" },
				{ 16, 96560, "", "=q4=Soul Prism of Lei Shen", "=ds=#s2#" },
				{ 17, 96561, "", "=q4=Lightning-Imbued Chalice", "=ds=#s14#" },
				{ 18, 96546, "", "=q4=Rune of Re-Origination", "=ds=#s14#" },
				{ 19, 96555, "", "=q4=Soul Barrier", "=ds=#s14#" },
				{ 20, 96558, "", "=q4=Unerring Vision of Lei Shen", "=ds=#s14#" },
				{ 22, 96547, "", "=q4=Shan-Dun, Breaker of Hope", "=ds=#w7#" },
				{ 23, 96559, "", "=q4=Torall, Rod of the Shattered Throne", "=ds=#h1#, #w6#" },
				{ 24, 96553, "", "=q4=Uroe, Harbinger of Terror", "=ds=#h2#, #w1#" },
				{ 25, 96554, "", "=q4=Ultimate Protection of the Emperor", "=ds=#w8#" },
				{ 26, 96562, "", "=q4=Lei Shen's Orb of Command", "=ds=#s15#" },
			};
			{
				{ 1, 96929, "", "=q4=Gloves of the Maimed Vizier", "=ds=#s9#, #a1#" },
				{ 2, 96928, "", "=q4=Legwraps of Cardinality", "=ds=#s11#, #a1#" },
				{ 3, 96920, "", "=q4=Fusion Slasher Chestguard", "=ds=#s5#, #a2#" },
				{ 4, 96935, "", "=q4=Grips of Slicing Electricity", "=ds=#s9#, #a2#" },
				{ 5, 96921, "", "=q4=Conduit-Breaker Chain Leggings", "=ds=#s11#, #a3#" },
				{ 6, 96936, "", "=q4=Leggings of the Violent Gale", "=ds=#s11#, #a3#" },
				{ 7, 96922, "", "=q4=Doomed Crown of Lei Shen", "=ds=#s1#, #a4#" },
				{ 8, 96937, "", "=q4=Lei Shen's Grounded Carapace", "=ds=#s5#, #a4#" },
				{ 9, 96923, "", "=q4=Legplates of the Lightning Throne", "=ds=#s11#, #a4#" },
				{ 10, 96924, "", "=q4=Legplates of Whipping Ionization", "=ds=#s11#, #a4#" },
				{ 16, 96932, "", "=q4=Soul Prism of Lei Shen", "=ds=#s2#" },
				{ 17, 96933, "", "=q4=Lightning-Imbued Chalice", "=ds=#s14#" },
				{ 18, 96918, "", "=q4=Rune of Re-Origination", "=ds=#s14#" },
				{ 19, 96927, "", "=q4=Soul Barrier", "=ds=#s14#" },
				{ 20, 96930, "", "=q4=Unerring Vision of Lei Shen", "=ds=#s14#" },
				{ 22, 96919, "", "=q4=Shan-Dun, Breaker of Hope", "=ds=#w7#" },
				{ 23, 96931, "", "=q4=Torall, Rod of the Shattered Throne", "=ds=#h1#, #w6#" },
				{ 24, 96925, "", "=q4=Uroe, Harbinger of Terror", "=ds=#h2#, #w1#" },
				{ 25, 96926, "", "=q4=Ultimate Protection of the Emperor", "=ds=#w8#" },
				{ 26, 96934, "", "=q4=Lei Shen's Orb of Command", "=ds=#s15#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Lei Shen", 832),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTRaden"] = {
		["Heroic"] = {
			{
				{ 1, 95013, "", "=q4=Black Night Thundercloak", "=ds=#s4#" },
				{ 2, 95015, "", "=q4=Grey Wind Mistcloak", "=ds=#s4#" },
				{ 3, 95014, "", "=q4=Red Sky Cloudcloak", "=ds=#s4#" },
				{ 4, 95016, "", "=q4=White Snow Skycloak", "=ds=#s4#" },
				{ 5, 95017, "", "=q4=Yellow Dawn Lightningcloak", "=ds=#s4#" },
				{ 6, 95040, "", "=q4=Robes of Nova", "=ds=#s5#, #a1#" },
				{ 7, 95039, "", "=q4=Starburner Robes", "=ds=#s5#, #a1#" },
				{ 8, 94995, "", "=q4=Detonation Cord", "=ds=#s10#, #a1#" },
				{ 9, 94996, "", "=q4=Vita-Binder Wrap", "=ds=#s10#, #a1#" },
				{ 10, 95030, "", "=q4=Leggings of the Discarded Warning", "=ds=#s11#, #a1#" },
				{ 11, 95031, "", "=q4=Legguards of Surreal Visions", "=ds=#s11#, #a1#" },
				{ 12, 95004, "", "=q4=Starwalker Sandals", "=ds=#s12#, #a1#" },
				{ 13, 95005, "", "=q4=Treads of Delicate Fascia", "=ds=#s12#, #a1#" },
				{ 14, 95033, "", "=q4=Chestguard of Coruscating Blades", "=ds=#s5#, #a2#" },
				{ 15, 95032, "", "=q4=Robes of Contagious Time", "=ds=#s5#, #a2#" },
				{ 16, 94998, "", "=q4=Strap of Murderous Strikes", "=ds=#s10#, #a2#" },
				{ 17, 94997, "", "=q4=Worldbender Waistband", "=ds=#s10#, #a2#" },
				{ 18, 95028, "", "=q4=Cosmicfire Legwraps", "=ds=#s11#, #a2#" },
				{ 19, 95029, "", "=q4=Kilt of Perpetual Genuflection", "=ds=#s11#, #a2#" },
				{ 20, 95006, "", "=q4=Roots of Pain", "=ds=#s12#, #a2#" },
				{ 21, 95007, "", "=q4=Twist-Toe Tabi", "=ds=#s12#, #a2#" },
				{ 22, 95035, "", "=q4=Chains of Counted Souls", "=ds=#s5#, #a3#" },
				{ 23, 95034, "", "=q4=Scales of Shaped Flesh", "=ds=#s5#, #a3#" },
				{ 24, 95000, "", "=q4=Jingling Fetishgirdle", "=ds=#s10#, #a3#" },
				{ 25, 94999, "", "=q4=Longdraw Chain Belt", "=ds=#s10#, #a3#" },
				{ 26, 95027, "", "=q4=Legguards of Awaked Repair", "=ds=#s11#, #a3#" },
				{ 27, 95026, "", "=q4=Sparkstring Chain Leggings", "=ds=#s11#, #a3#" },
				{ 28, 95009, "", "=q4=Treads of the Sanguine Volley", "=ds=#s12#, #a3#" },
				{ 29, 95008, "", "=q4=World-Mote Sabatons", "=ds=#s12#, #a3#" },
				extraText = ": "..AL["Thunderforged"];
			};
			{
				{ 1, 95038, "", "=q4=Carapace of the Core", "=ds=#s5#, #a4#" },
				{ 2, 95036, "", "=q4=Nova-Binder Breastplate", "=ds=#s5#, #a4#" },
				{ 3, 95037, "", "=q4=Planet-Birthed Cuirass", "=ds=#s5#, #a4#" },
				{ 4, 95001, "", "=q4=Bubbling Anima Belt", "=ds=#s10#, #a4#" },
				{ 5, 95002, "", "=q4=Cracklesnap Clasp", "=ds=#s10#, #a4#" },
				{ 6, 95003, "", "=q4=Flare-Forged Greatbelt", "=ds=#s10#, #a4#" },
				{ 7, 95025, "", "=q4=Archaic Protector's Legguards", "=ds=#s11#, #a4#" },
				{ 8, 95023, "", "=q4=Legplates of Lightning Blood", "=ds=#s11#, #a4#" },
				{ 9, 95024, "", "=q4=Time-Lost Greaves", "=ds=#s11#, #a4#" },
				{ 10, 95010, "", "=q4=Hypersensitive Sollerets", "=ds=#s12#, #a4#" },
				{ 11, 95011, "", "=q4=Lightning-Walker Clawfeet", "=ds=#s12#, #a4#" },
				{ 12, 95012, "", "=q4=Sabatons of the Superior Being", "=ds=#s12#, #a4#" },
				{ 16, 95020, "", "=q4=Ra-den's Contemplative Loop", "=ds=#s13#" },
				{ 17, 95018, "", "=q4=Ra-den's Evolving Signet", "=ds=#s13#" },
				{ 18, 95022, "", "=q4=Ra-den's Ruinous Ring", "=ds=#s13#" },
				{ 19, 95019, "", "=q4=Ra-den's Summoning Band", "=ds=#s13#" },
				{ 20, 95021, "", "=q4=Ra-den's Swift Seal", "=ds=#s13#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AtlasLoot:EJ_GetBossName("Ra-den", 831),
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTShared"] = {
		["RaidFinder"] = {
			{
				{ 1, 95863, "", "=q4=Lost Shoulders of Fire", "=ds=#s3#, #a1#" },
				{ 2, 95865, "", "=q4=Lost Shoulders of Fluidity", "=ds=#s3#, #a1#" },
				{ 3, 95864, "", "=q4=Lost Shoulders of Healing", "=ds=#s3#, #a1#" },
				{ 4, 95868, "", "=q4=Forgotten Mantle of the Moon", "=ds=#s3#, #a2#" },
				{ 5, 95869, "", "=q4=Forgotten Mantle of the Sun", "=ds=#s3#, #a2#" },
				{ 6, 95870, "", "=q4=Abandoned Spaulders of Arrowflight", "=ds=#s3#, #a3#" },
				{ 7, 95871, "", "=q4=Abandoned Spaulders of Renewal", "=ds=#s3#, #a3#" },
				{ 8, 95874, "", "=q4=Reconstructed Bloody Shoulderplates", "=ds=#s3#, #a4#" },
				{ 9, 95873, "", "=q4=Reconstructed Furious Shoulderplates", "=ds=#s3#, #a4#" },
				{ 10, 95872, "", "=q4=Reconstructed Holy Shoulderplates", "=ds=#s3#, #a4#" },
				{ 16, 95877, "", "=q4=Bo-Ris, Horror in the Night", "=ds=#w7#" },
				{ 17, 95862, "", "=q4=Darkwood Spiritstaff", "=ds=#w9#" },
				{ 18, 95876, "", "=q4=Do-tharak, the Swordbreaker", "=ds=#h1#, #w10#" },
				{ 19, 95860, "", "=q4=Fyn's Flickering Dagger", "=ds=#h1#, #w4#" },
				{ 20, 95875, "", "=q4=Greatsword of Frozen Hells", "=ds=#h2#, #w10#" },
				{ 21, 95858, "", "=q4=Invocation of the Dawn", "=ds=#h2#, #w6#" },
				{ 22, 95867, "", "=q4=Jerthud, Graceful Hand of the Savior", "=ds=#h1#, #w6#" },
				{ 23, 95859, "", "=q4=Miracoran, the Vehement Chord", "=ds=#w2#" },
				{ 24, 95866, "", "=q4=Nadagast's Exsanguinator", "=ds=#h1#, #w4#" },
				{ 25, 97129, "", "=q4=Tia-Tia, the Scything Star", "=ds=#h1#, #w13#" },
				{ 26, 95861, "", "=q4=Zeeg's Ancient Kegsmasher", "=ds=#h1#, #w6#" },
				{ 27, 95878, "", "=q4=Visage of the Doomed", "=ds=#w8#" },
			};
			{
				{ 1, 95343, "", "=q3=Treasures of the Thunder King", "=ds=#m20#" },
				{ 2, 95961, "", "=q4=Abandoned Zandalari Firecord", "=ds=#s10#, #a1#" },
				{ 3, 95962, "", "=q4=Abandoned Zandalari Shadowgirdle", "=ds=#s10#, #a1#" },
				{ 4, 95965, "", "=q4=Home-Warding Slippers", "=ds=#s12#, #a1#" },
				{ 5, 95963, "", "=q4=Silentflame Sandals", "=ds=#s12#, #a1#" },
				{ 6, 95971, "", "=q4=Abandoned Zandalari Moonstrap", "=ds=#s10#, #a2#" },
				{ 7, 95970, "", "=q4=Abandoned Zandalari Silentbelt", "=ds=#s10#, #a2#" },
				{ 8, 95966, "", "=q4=Deeproot Treads", "=ds=#s12#, #a2#" },
				{ 9, 95959, "", "=q4=Spiderweb Tabi", "=ds=#s12#, #a2#" },
				{ 10, 95972, "", "=q4=Abandoned Zandalari Arrowlinks", "=ds=#s10#, #a3#" },
				{ 11, 95973, "", "=q4=Abandoned Zandalari Waterchain", "=ds=#s10#, #a3#" },
				{ 12, 95960, "", "=q4=Scalehide Spurs", "=ds=#s12#, #a3#" },
				{ 13, 95967, "", "=q4=Spiritbound Boots", "=ds=#s12#, #a3#" },
				{ 14, 95976, "", "=q4=Abandoned Zandalari Bucklebreaker", "=ds=#s10#, #a4#" },
				{ 15, 95975, "", "=q4=Abandoned Zandalari Goreplate", "=ds=#s10#, #a4#" },
				{ 16, 95974, "", "=q4=Abandoned Zandalari Greatbelt", "=ds=#s10#, #a4#" },
				{ 17, 95979, "", "=q4=Columnbreaker Stompers", "=ds=#s12#, #a4#" },
				{ 18, 95978, "", "=q4=Locksmasher Greaves", "=ds=#s12#, #a4#" },
				{ 19, 95968, "", "=q4=Vaultwalker Sabatons", "=ds=#s12#, #a4#" },
				{ 21, 95958, "", "=q4=Necklace of the Terra-Cotta Archer", "=ds=#s2#" },
				{ 22, 95964, "", "=q4=Necklace of the Terra-Cotta Invoker", "=ds=#s2#" },
				{ 23, 95969, "", "=q4=Necklace of the Terra-Cotta Mender", "=ds=#s2#" },
				{ 24, 95980, "", "=q4=Necklace of the Terra-Cotta Protector", "=ds=#s2#" },
				{ 25, 95977, "", "=q4=Necklace of the Terra-Cotta Vanquisher", "=ds=#s2#" },
				{ 27, 94295, "", "=q1=Primal Egg", "=ds=#m20#" },
				{ 28, 94292, "", "=q4=Reins of the Black Primal Raptor", "=ds=#e26#" },
				{ 29, 94293, "", "=q4=Reins of the Green Primal Raptor", "=ds=#e26#" },
				{ 30, 94291, "", "=q4=Reins of the Red Primal Raptor", "=ds=#e26#" },
			};
		};
		["Normal"] = {
			{
				{ 1, 95061, "", "=q4=Lost Shoulders of Fire", "=ds=#s3#, #a1#" },
				{ 2, 95067, "", "=q4=Lost Shoulders of Fluidity", "=ds=#s3#, #a1#" },
				{ 3, 95066, "", "=q4=Lost Shoulders of Healing", "=ds=#s3#, #a1#" },
				{ 4, 95065, "", "=q4=Forgotten Mantle of the Moon", "=ds=#s3#, #a2#" },
				{ 5, 95062, "", "=q4=Forgotten Mantle of the Sun", "=ds=#s3#, #a2#" },
				{ 6, 95060, "", "=q4=Abandoned Spaulders of Arrowflight", "=ds=#s3#, #a3#" },
				{ 7, 95064, "", "=q4=Abandoned Spaulders of Renewal", "=ds=#s3#, #a3#" },
				{ 8, 95068, "", "=q4=Reconstructed Bloody Shoulderplates", "=ds=#s3#, #a4#" },
				{ 9, 95063, "", "=q4=Reconstructed Furious Shoulderplates", "=ds=#s3#, #a4#" },
				{ 10, 95069, "", "=q4=Reconstructed Holy Shoulderplates", "=ds=#s3#, #a4#" },
				{ 16, 95498, "", "=q4=Bo-Ris, Horror in the Night", "=ds=#w7#" },
				{ 17, 95507, "", "=q4=Darkwood Spiritstaff", "=ds=#w9#" },
				{ 18, 95502, "", "=q4=Do-tharak, the Swordbreaker", "=ds=#h1#, #w10#" },
				{ 19, 95501, "", "=q4=Fyn's Flickering Dagger", "=ds=#h1#, #w4#" },
				{ 20, 95505, "", "=q4=Greatsword of Frozen Hells", "=ds=#h2#, #w10#" },
				{ 21, 95499, "", "=q4=Invocation of the Dawn", "=ds=#h2#, #w6#" },
				{ 22, 95500, "", "=q4=Jerthud, Graceful Hand of the Savior", "=ds=#h1#, #w6#" },
				{ 23, 95503, "", "=q4=Miracoran, the Vehement Chord", "=ds=#w2#" },
				{ 24, 95506, "", "=q4=Nadagast's Exsanguinator", "=ds=#h1#, #w4#" },
				{ 25, 97126, "", "=q4=Tia-Tia, the Scything Star", "=ds=#h1#, #w13#" },
				{ 26, 95504, "", "=q4=Zeeg's Ancient Kegsmasher", "=ds=#h1#, #w6#" },
				{ 27, 95516, "", "=q4=Visage of the Doomed", "=ds=#w8#" },
			};
			{
				{ 1, 96235, "", "=q4=Lost Shoulders of Fire", "=ds=#s3#, #a1#" },
				{ 2, 96237, "", "=q4=Lost Shoulders of Fluidity", "=ds=#s3#, #a1#" },
				{ 3, 96236, "", "=q4=Lost Shoulders of Healing", "=ds=#s3#, #a1#" },
				{ 4, 96240, "", "=q4=Forgotten Mantle of the Moon", "=ds=#s3#, #a2#" },
				{ 5, 96241, "", "=q4=Forgotten Mantle of the Sun", "=ds=#s3#, #a2#" },
				{ 6, 96242, "", "=q4=Abandoned Spaulders of Arrowflight", "=ds=#s3#, #a3#" },
				{ 7, 96243, "", "=q4=Abandoned Spaulders of Renewal", "=ds=#s3#, #a3#" },
				{ 8, 96246, "", "=q4=Reconstructed Bloody Shoulderplates", "=ds=#s3#, #a4#" },
				{ 9, 96245, "", "=q4=Reconstructed Furious Shoulderplates", "=ds=#s3#, #a4#" },
				{ 10, 96244, "", "=q4=Reconstructed Holy Shoulderplates", "=ds=#s3#, #a4#" },
				{ 16, 96249, "", "=q4=Bo-Ris, Horror in the Night", "=ds=#w7#" },
				{ 17, 96234, "", "=q4=Darkwood Spiritstaff", "=ds=#w9#" },
				{ 18, 96248, "", "=q4=Do-tharak, the Swordbreaker", "=ds=#h1#, #w10#" },
				{ 19, 96232, "", "=q4=Fyn's Flickering Dagger", "=ds=#h1#, #w4#" },
				{ 20, 96247, "", "=q4=Greatsword of Frozen Hells", "=ds=#h2#, #w10#" },
				{ 21, 96230, "", "=q4=Invocation of the Dawn", "=ds=#h2#, #w6#" },
				{ 22, 96239, "", "=q4=Jerthud, Graceful Hand of the Savior", "=ds=#h1#, #w6#" },
				{ 23, 96231, "", "=q4=Miracoran, the Vehement Chord", "=ds=#w2#" },
				{ 24, 96238, "", "=q4=Nadagast's Exsanguinator", "=ds=#h1#, #w4#" },
				{ 25, 97128, "", "=q4=Tia-Tia, the Scything Star", "=ds=#h1#, #w13#" },
				{ 26, 96233, "", "=q4=Zeeg's Ancient Kegsmasher", "=ds=#h1#, #w6#" },
				{ 27, 96250, "", "=q4=Visage of the Doomed", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		["Heroic"] = {
			{
				{ 1, 96607, "", "=q4=Lost Shoulders of Fire", "=ds=#s3#, #a1#" },
				{ 2, 96609, "", "=q4=Lost Shoulders of Fluidity", "=ds=#s3#, #a1#" },
				{ 3, 96608, "", "=q4=Lost Shoulders of Healing", "=ds=#s3#, #a1#" },
				{ 4, 96612, "", "=q4=Forgotten Mantle of the Moon", "=ds=#s3#, #a2#" },
				{ 5, 96613, "", "=q4=Forgotten Mantle of the Sun", "=ds=#s3#, #a2#" },
				{ 6, 96614, "", "=q4=Abandoned Spaulders of Arrowflight", "=ds=#s3#, #a3#" },
				{ 7, 96615, "", "=q4=Abandoned Spaulders of Renewal", "=ds=#s3#, #a3#" },
				{ 8, 96618, "", "=q4=Reconstructed Bloody Shoulderplates", "=ds=#s3#, #a4#" },
				{ 9, 96617, "", "=q4=Reconstructed Furious Shoulderplates", "=ds=#s3#, #a4#" },
				{ 10, 96616, "", "=q4=Reconstructed Holy Shoulderplates", "=ds=#s3#, #a4#" },
				{ 16, 96621, "", "=q4=Bo-Ris, Horror in the Night", "=ds=#w7#" },
				{ 17, 96606, "", "=q4=Darkwood Spiritstaff", "=ds=#w9#" },
				{ 18, 96620, "", "=q4=Do-tharak, the Swordbreaker", "=ds=#h1#, #w10#" },
				{ 19, 96604, "", "=q4=Fyn's Flickering Dagger", "=ds=#h1#, #w4#" },
				{ 20, 96619, "", "=q4=Greatsword of Frozen Hells", "=ds=#h2#, #w10#" },
				{ 21, 96602, "", "=q4=Invocation of the Dawn", "=ds=#h2#, #w6#" },
				{ 22, 96611, "", "=q4=Jerthud, Graceful Hand of the Savior", "=ds=#h1#, #w6#" },
				{ 23, 96603, "", "=q4=Miracoran, the Vehement Chord", "=ds=#w2#" },
				{ 24, 96610, "", "=q4=Nadagast's Exsanguinator", "=ds=#h1#, #w4#" },
				{ 25, 97127, "", "=q4=Tia-Tia, the Scything Star", "=ds=#h1#, #w13#" },
				{ 26, 96605, "", "=q4=Zeeg's Ancient Kegsmasher", "=ds=#h1#, #w6#" },
				{ 27, 96622, "", "=q4=Visage of the Doomed", "=ds=#w8#" },
			};
			{
				{ 1, 96979, "", "=q4=Lost Shoulders of Fire", "=ds=#s3#, #a1#" },
				{ 2, 96981, "", "=q4=Lost Shoulders of Fluidity", "=ds=#s3#, #a1#" },
				{ 3, 96980, "", "=q4=Lost Shoulders of Healing", "=ds=#s3#, #a1#" },
				{ 4, 96984, "", "=q4=Forgotten Mantle of the Moon", "=ds=#s3#, #a2#" },
				{ 5, 96985, "", "=q4=Forgotten Mantle of the Sun", "=ds=#s3#, #a2#" },
				{ 6, 96986, "", "=q4=Abandoned Spaulders of Arrowflight", "=ds=#s3#, #a3#" },
				{ 7, 96987, "", "=q4=Abandoned Spaulders of Renewal", "=ds=#s3#, #a3#" },
				{ 8, 96990, "", "=q4=Reconstructed Bloody Shoulderplates", "=ds=#s3#, #a4#" },
				{ 9, 96989, "", "=q4=Reconstructed Furious Shoulderplates", "=ds=#s3#, #a4#" },
				{ 10, 96988, "", "=q4=Reconstructed Holy Shoulderplates", "=ds=#s3#, #a4#" },
				{ 16, 96993, "", "=q4=Bo-Ris, Horror in the Night", "=ds=#w7#" },
				{ 17, 96978, "", "=q4=Darkwood Spiritstaff", "=ds=#w9#" },
				{ 18, 96992, "", "=q4=Do-tharak, the Swordbreaker", "=ds=#h1#, #w10#" },
				{ 19, 96976, "", "=q4=Fyn's Flickering Dagger", "=ds=#h1#, #w4#" },
				{ 20, 96991, "", "=q4=Greatsword of Frozen Hells", "=ds=#h2#, #w10#" },
				{ 21, 96974, "", "=q4=Invocation of the Dawn", "=ds=#h2#, #w6#" },
				{ 22, 96983, "", "=q4=Jerthud, Graceful Hand of the Savior", "=ds=#h1#, #w6#" },
				{ 23, 96975, "", "=q4=Miracoran, the Vehement Chord", "=ds=#w2#" },
				{ 24, 96982, "", "=q4=Nadagast's Exsanguinator", "=ds=#h1#, #w4#" },
				{ 25, 97130, "", "=q4=Tia-Tia, the Scything Star", "=ds=#h1#, #w13#" },
				{ 26, 96977, "", "=q4=Zeeg's Ancient Kegsmasher", "=ds=#h1#, #w6#" },
				{ 27, 96994, "", "=q4=Visage of the Doomed", "=ds=#w8#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = AL["Shared Boss Loot"],
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	AtlasLoot_Data["ToTTrash"] = {
		["Normal"] = {
			{
				{ 1, 95207, "", "=q4=Abandoned Zandalari Firecord", "=ds=#s10#, #a1#" },
				{ 2, 95208, "", "=q4=Abandoned Zandalari Shadowgirdle", "=ds=#s10#, #a1#" },
				{ 3, 95224, "", "=q4=Home-Warding Slippers", "=ds=#s12#, #a1#" },
				{ 4, 95223, "", "=q4=Silentflame Sandals", "=ds=#s12#, #a1#" },
				{ 5, 95210, "", "=q4=Abandoned Zandalari Moonstrap", "=ds=#s10#, #a2#" },
				{ 6, 95209, "", "=q4=Abandoned Zandalari Silentbelt", "=ds=#s10#, #a2#" },
				{ 7, 95221, "", "=q4=Deeproot Treads", "=ds=#s12#, #a2#" },
				{ 8, 95219, "", "=q4=Spiderweb Tabi", "=ds=#s12#, #a2#" },
				{ 9, 95211, "", "=q4=Abandoned Zandalari Arrowlinks", "=ds=#s10#, #a3#" },
				{ 10, 95212, "", "=q4=Abandoned Zandalari Waterchain", "=ds=#s10#, #a3#" },
				{ 11, 95220, "", "=q4=Scalehide Spurs", "=ds=#s12#, #a3#" },
				{ 12, 95222, "", "=q4=Spiritbound Boots", "=ds=#s12#, #a3#" },
				{ 13, 95215, "", "=q4=Abandoned Zandalari Bucklebreaker", "=ds=#s10#, #a4#" },
				{ 14, 95214, "", "=q4=Abandoned Zandalari Goreplate", "=ds=#s10#, #a4#" },
				{ 15, 95213, "", "=q4=Abandoned Zandalari Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 95218, "", "=q4=Columnbreaker Stompers", "=ds=#s12#, #a4#" },
				{ 17, 95217, "", "=q4=Locksmasher Greaves", "=ds=#s12#, #a4#" },
				{ 18, 95216, "", "=q4=Vaultwalker Sabatons", "=ds=#s12#, #a4#" },
				{ 20, 95202, "", "=q4=Necklace of the Terra-Cotta Archer", "=ds=#s2#" },
				{ 21, 95203, "", "=q4=Necklace of the Terra-Cotta Invoker", "=ds=#s2#" },
				{ 22, 95204, "", "=q4=Necklace of the Terra-Cotta Mender", "=ds=#s2#" },
				{ 23, 95206, "", "=q4=Necklace of the Terra-Cotta Protector", "=ds=#s2#" },
				{ 24, 95205, "", "=q4=Necklace of the Terra-Cotta Vanquisher", "=ds=#s2#" },
				{ 26, 94125, "", "=q3=Living Sandling", "=ds=#e13#" },
			};
			{
				{ 1, 96333, "", "=q4=Abandoned Zandalari Firecord", "=ds=#s10#, #a1#" },
				{ 2, 96334, "", "=q4=Abandoned Zandalari Shadowgirdle", "=ds=#s10#, #a1#" },
				{ 3, 96337, "", "=q4=Home-Warding Slippers", "=ds=#s12#, #a1#" },
				{ 4, 96335, "", "=q4=Silentflame Sandals", "=ds=#s12#, #a1#" },
				{ 5, 96343, "", "=q4=Abandoned Zandalari Moonstrap", "=ds=#s10#, #a2#" },
				{ 6, 96342, "", "=q4=Abandoned Zandalari Silentbelt", "=ds=#s10#, #a2#" },
				{ 7, 96338, "", "=q4=Deeproot Treads", "=ds=#s12#, #a2#" },
				{ 8, 96331, "", "=q4=Spiderweb Tabi", "=ds=#s12#, #a2#" },
				{ 9, 96344, "", "=q4=Abandoned Zandalari Arrowlinks", "=ds=#s10#, #a3#" },
				{ 10, 96345, "", "=q4=Abandoned Zandalari Waterchain", "=ds=#s10#, #a3#" },
				{ 11, 96332, "", "=q4=Scalehide Spurs", "=ds=#s12#, #a3#" },
				{ 12, 96339, "", "=q4=Spiritbound Boots", "=ds=#s12#, #a3#" },
				{ 13, 96348, "", "=q4=Abandoned Zandalari Bucklebreaker", "=ds=#s10#, #a4#" },
				{ 14, 96347, "", "=q4=Abandoned Zandalari Goreplate", "=ds=#s10#, #a4#" },
				{ 15, 96346, "", "=q4=Abandoned Zandalari Greatbelt", "=ds=#s10#, #a4#" },
				{ 16, 96351, "", "=q4=Columnbreaker Stompers", "=ds=#s12#, #a4#" },
				{ 17, 96350, "", "=q4=Locksmasher Greaves", "=ds=#s12#, #a4#" },
				{ 18, 96340, "", "=q4=Vaultwalker Sabatons", "=ds=#s12#, #a4#" },
				{ 20, 96330, "", "=q4=Necklace of the Terra-Cotta Archer", "=ds=#s2#" },
				{ 21, 96336, "", "=q4=Necklace of the Terra-Cotta Invoker", "=ds=#s2#" },
				{ 22, 96341, "", "=q4=Necklace of the Terra-Cotta Mender", "=ds=#s2#" },
				{ 23, 96352, "", "=q4=Necklace of the Terra-Cotta Protector", "=ds=#s2#" },
				{ 24, 96349, "", "=q4=Necklace of the Terra-Cotta Vanquisher", "=ds=#s2#" },
				extraText = ": "..AL["Thunderforged"];
			};
		};
		info = {
			name = "trash",
			module = moduleName, instance = "ThroneofThunder",
		};
	};

	-----------------
	--- Rare Mobs ---
	-----------------

		-----------------------
		--- The Jade Forest ---
		-----------------------

	AtlasLoot_Data["RaresMOPMobsJadeForest"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Aethis"], ""};
				{ 3, 87649, "", "=q4=Pool-Stirrer", "=ds=#h1#, #w6#"};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Ferdinand"], ""};
				{ 6, 87652, "", "=q4=Ook-Breaker Mace", "=ds=#h1#, #w6#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Kor'nas Nightsavage"], ""};
				{ 9, 87642, "", "=q4=Darkstaff of Annihilation", "=ds=#w9#"};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Krax'ik"], ""};
				{ 12, 87646, "", "=q4=Needlefang Throatripper", "=ds=#h1#, #w1#"};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Mister Ferocious"], ""};
				{ 18, 87652, "", "=q4=Ook-Breaker Mace", "=ds=#h1#, #w6#"};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Morgrinn Crackfang"], ""};
				{ 21, 87643, "", "=q4=Fangcracker Battlemace", "=ds=#h2#, #w6#"};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Sarnak"], ""};
				{ 24, 87650, "", "=q4=Fishsticker Crossbow", "=ds=#w3#"};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Urobi the Walker"], ""};
				{ 27, 87651, "", "=q4=Pathwalker Greatstaff", "=ds=#w9#"};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87586, "", "=q3=Forest Trickster's Leggings", "=ds=#s11#, #a1#"};
				{ 4, 87590, "", "=q3=Jade Heart Leggings", "=ds=#s11#, #a1#"};
				{ 5, 87587, "", "=q3=Orchard Tender's Leggings", "=ds=#s11#, #a2#"};
				{ 6, 87591, "", "=q3=Tian Trainee Leggings", "=ds=#s11#, #a2#"};
				{ 7, 87592, "", "=q3=Grookin' Grookin' Trousers", "=ds=#s11#, #a3#"};
				{ 8, 87588, "", "=q3=Leggings of Spiritsong Melody", "=ds=#s11#, #a3#"};
				{ 9, 87593, "", "=q3=Gan Shi Warlord Legguards", "=ds=#s11#, #a4#"};
				{ 10, 87594, "", "=q3=Leggings of Forgotten War", "=ds=#s11#, #a4#"};
				{ 11, 87589, "", "=q3=Leggings of Fractured Reflection", "=ds=#s11#, #a4#"};
				{ 12, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["The Jade Forest"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		--------------------------------
		--- Valley of the Four Winds ---
		--------------------------------

	AtlasLoot_Data["RaresMOPMobsValleyFourWinds"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Blackhoof"], ""};
				{ 3, 86565, "", "=q3=Battle Horn", "=ds="};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Bonobos"], ""};
				{ 6, 86591, "", "=q3=Magic Banana", "=ds="};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Jonn-Dar"], ""};
				{ 9, 86572, "", "=q3=Terracotta Fragment", "=ds=#s14#"};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Nal'lak the Ripper"], ""};
				{ 12, 86576, "", "=q3=Dynasty of Steel", "=ds=#s14#"};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Nasra Spothide"], ""};
				{ 18, 86587, "", "=q3=Seed of Tranquil Growth", "=ds=#s14#"};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Salyin Warscout"], ""};
				{ 21, 86583, "", "=q3=Salyin Battle Banner", "=ds="};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Sele'na"], ""};
				{ 24, 86580, "", "=q3=Overgrown Lilypad", "=ds="};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Sulik'shor"], ""};
				{ 27, 86569, "", "=q3=Crystal of Insanity", "=ds="};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87597, "", "=q3=Gloves of Congealed Mist", "=ds=#s9#, #a1#"};
				{ 4, 87598, "", "=q3=Monstrous Silk Gloves", "=ds=#s9#, #a1#"};
				{ 5, 87595, "", "=q3=Gloves of Burrow Spelunking", "=ds=#s9#, #a2#"};
				{ 6, 87599, "", "=q3=Grower's Gloves", "=ds=#s9#, #a2#"};
				{ 7, 87600, "", "=q3=Marshsong Gloves", "=ds=#s9#, #a3#"};
				{ 8, 87596, "", "=q3=Mudmug's Mitts", "=ds=#s9#, #a3#"};
				{ 9, 87602, "", "=q3=Grain Warden's Gauntlets", "=ds=#s9#, #a4#"};
				{ 10, 87603, "", "=q3=Thunderfall Gauntlets", "=ds=#s9#, #a4#"};
				{ 11, 87601, "", "=q3=Plough Driving Grips", "=ds=#s9#, #a4#"};
				{ 12, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["Valley of the Four Winds"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		-----------------------
		--- Krasarang Wilds ---
		-----------------------

	AtlasLoot_Data["RaresMOPMobsKrasarangWilds"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Arness the Scale"], ""};
				{ 3, 90723, "", "=q4=Arness's Scaled Leggings", "=ds=#s11#, #a3#"};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Cournith Waterstrider"], ""};
				{ 6, 90721, "", "=q4=Courinth Waterstrider's Silken Finery", "=ds=#s11#, #a1#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Gaarn the Toxic"], ""};
				{ 9, 90725, "", "=q4=Gaarn's Leggings of Infestation", "=ds=#s11#, #a1#"};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Go-Kan"], ""};
				{ 12, 90719, "", "=q4=Go-Kan's Golden Trousers", "=ds=#s11#, #a3#"};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Qu'nas"], ""};
				{ 18, 90717, "", "=q4=Qu'nas' Apocryphal Legplates", "=ds=#s11#, #a4#"};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Ruun Ghostpaw"], ""};
				{ 21, 90720, "", "=q4=Silent Leggings of the Ghostpaw", "=ds=#s11#, #a2#"};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Spriggin"], ""};
				{ 24, 90724, "", "=q4=Spriggin's Sproggin' Leggin'", "=ds=#s11#, #a2#"};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Torik-Ethis"], ""};
				{ 27, 90718, "", "=q4=Torik-Ethis' Bloodied Legguards", "=ds=#s11#, #a4#"};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87604, "", "=q3=Beachcomber's Hat", "=ds=#s1#, #a1#"};
				{ 4, 87608, "", "=q3=Korjan Mystic's Hood", "=ds=#s1#, #a1#"};
				{ 5, 87609, "", "=q3=Brushstalker Helm", "=ds=#s1#, #a2#"};
				{ 6, 87605, "", "=q3=Crest of the Red Crane", "=ds=#s1#, #a2#"};
				{ 7, 87610, "", "=q3=Deepwild Hunting Helm", "=ds=#s1#, #a3#"};
				{ 8, 87606, "", "=q3=Tidehunter Helm", "=ds=#s1#, #a3#"};
				{ 9, 87612, "", "=q3=Ancient Krasari Helm", "=ds=#s1#, #a4#"};
				{ 10, 87611, "", "=q3=Shen-zin Shell Headguard", "=ds=#s1#, #a4#"};
				{ 11, 87607, "", "=q3=Unearthed Dojani Headcover", "=ds=#s1#, #a4#"};
				{ 12, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["Krasarang Wilds"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		----------------------
		--- Kun-Lai Summit ---
		----------------------

	AtlasLoot_Data["RaresMOPMobsKunLaiSummit"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Ahone the Wanderer"], ""};
				{ 3, 86588, "", "=q3=Pandaren Firework Launcher", "=ds="};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Borginn Darkfist"], ""};
				{ 6, 86570, "", "=q3=Crate of Kidnapped Puppies", "=ds=#s14#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Havak"], ""};
				{ 9, 86573, "", "=q3=Shard of Archstone", "=ds=#e25#"};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Korda Torros"], ""};
				{ 12, 86566, "", "=q3=Forager's Gloves", "=ds=#s9#, #a1#"};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Nessos the Oracle"], ""};
				{ 18, 86584, "", "=q3=Hardened Shell", "=ds="};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Scritch"], ""};
				{ 21, 86592, "", "=q3=Hozen Peace Pipe", "=ds="};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Ski'thik"], ""};
				{ 24, 86577, "", "=q3=Rod of Ambershaping", "=ds="};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Zai the Outcast"], ""};
				{ 27, 86581, "", "=q3=Farwater Conch", "=ds="};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87616, "", "=q3=Mountain Trailblazer's Cuffs", "=ds=#s8#, #a1#"};
				{ 4, 87615, "", "=q3=Yakwasher's Bracers", "=ds=#s8#, #a1#"};
				{ 5, 87617, "", "=q3=Bracers of the Serene Mountaintop", "=ds=#s8#, #a2#"};
				{ 6, 87613, "", "=q3=Frozen Zandalari Bracer", "=ds=#s8#, #a2#"};
				{ 7, 87618, "", "=q3=Ice Encrusted Bracer", "=ds=#s8#, #a3#"};
				{ 8, 87614, "", "=q3=Kafa Picker's Bracers", "=ds=#s8#, #a3#"};
				{ 9, 87620, "", "=q3=Bracers of the Frozen Summit", "=ds=#s8#, #a4#"};
				{ 10, 87619, "", "=q3=Terracotta Guardian's Bracer", "=ds=#s8#, #a4#"};
				{ 11, 87621, "", "=q3=Wristguards of Great Fortune", "=ds=#s8#, #a4#"};
				{ 12, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["Kun-Lai Summit"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		------------------------
		--- Townlong Steppes ---
		------------------------

	AtlasLoot_Data["RaresMOPMobsTownlongSteppes"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Eshelon"], ""};
				{ 3, 87222, "", "=q3=Big Bag of Linens", "=ds="};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Kah'tir"], ""};
				{ 6, 87218, "", "=q4=Big Bag of Arms", "=ds="};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Lith'ik the Stalker"], ""};
				{ 9, 87221, "", "=q3=Big Bag of Jewels", "=ds="};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Lon the Bull"], ""};
				{ 12, 87219, "", "=q3=Big Bag of Herbs", "=ds="};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Norlaxx"], ""};
				{ 18, 87220, "", "=q3=Big Bag of Mysteries", "=ds="};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Siltriss the Sharpener"], ""};
				{ 21, 87223, "", "=q3=Big Bag of Skins", "=ds="};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["The Yowler"], ""};
				{ 24, 87225, "", "=q3=Big Bag of Food", "=ds="};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Yul Wildpaw"], ""};
				{ 27, 87224, "", "=q3=Big Bag of Wonders", "=ds="};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87625, "", "=q3=Congealed Mist Amulet", "=ds=#s2#"};
				{ 4, 87623, "", "=q3=Razor-Sharp Chitin Choker", "=ds=#s2#"};
				{ 5, 87626, "", "=q3=Suna's Shattered Locket", "=ds=#s2#"};
				{ 6, 87624, "", "=q3=Yaungol Mist-Shaman's Amulet", "=ds=#s2#"};
				{ 7, 87622, "", "=q3=Yoke of Niuzao", "=ds=#s2#"};
				{ 8, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["Townlong Steppes"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		--------------------
		--- Dread Wastes ---
		--------------------

	AtlasLoot_Data["RaresMOPMobsDreadWastes"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Ai-Li Skymirror"], ""};
				{ 3, 86589, "", "=q3=Ai-Li's Skymirror", "=ds=#e25#"};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Dak the Breaker"], ""};
				{ 6, 86567, "", "=q3=Yaungol Wind Chime", "=ds=#s14#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Gar'lok"], ""};
				{ 9, 86578, "", "=q3=Eternal Warrior's Sigil", "=ds="};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Ik-Ik the Nimble"], ""};
				{ 12, 86593, "", "=q3=Hozen Beach Ball", "=ds=#e25#"};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Karr the Darkener"], ""};
				{ 18, 86564, "", "=q3=Imbued Jade Fragment", "=ds=#e13#"};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Krol the Blade"], ""};
				{ 21, 86574, "", "=q3=Elixir of Ancient Knowledge", "=ds="};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Nalash Verdantis"], ""};
				{ 24, 86563, "", "=q3=Hollow Reed", "=ds=#e13#"};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Omnis Grinlok"], ""};
				{ 27, 86585, "", "=q3=Golden Fleece", "=ds=#s14#"};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87635, "", "=q3=Amber-Starched Robes", "=ds=#s5#, #a1#"};
				{ 4, 87634, "", "=q3=Mazu's Robe", "=ds=#s5#, #a1#"};
				{ 5, 87631, "", "=q3=Jiao-Skin Tunic", "=ds=#s5#, #a2#"};
				{ 6, 87630, "", "=q3=Chestpiece of Twinkling Stars", "=ds=#s5#, #a3#"};
				{ 7, 87632, "", "=q3=Fearsworn Chestpiece", "=ds=#s5#, #a3#"};
				{ 8, 87629, "", "=q3=Chestplate of Manifest Dread", "=ds=#s5#, #a4#"};
				{ 9, 87627, "", "=q3=Kunchong Carapace Chestguard", "=ds=#s5#, #a4#"};
				{ 10, 87628, "", "=q3=Spinebreaker Chestpiece", "=ds=#s5#, #a4#"};
				{ 11, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["Dread Wastes"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		--------------------------------
		--- Vale of Eternal Blossoms ---
		--------------------------------

	AtlasLoot_Data["RaresMOPMobsValeOfEternalBlossoms"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Ai-Ran the Shifting Cloud"], ""};
				{ 3, 86590, "", "=q3=Essence of the Breeze", "=ds="};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Kal'tik the Blight"], ""};
				{ 6, 86579, "", "=q3=Bottled Tornado", "=ds=#s14#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Kang the Soul Thief"], ""};
				{ 9, 86571, "", "=q3=Kang's Bindstone", "=ds="};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Major Nanners"], ""};
				{ 12, 86594, "", "=q3=Helpful Wikky's Whistle", "=ds="};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Moldo One-Eye"], ""};
				{ 18, 86586, "", "=q3=Panflute of Pandaria", "=ds="};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Sahn Tidehunter"], ""};
				{ 21, 86582, "", "=q3=Aqua Jewel", "=ds="};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Urgolax"], ""};
				{ 24, 86575, "", "=q3=Chalice of Secrets", "=ds="};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Yorik Sharpeye"], ""};
				{ 27, 86568, "", "=q3=Mr. Smite's Brass Compass", "=ds=#e25#"};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 3, 87638, "", "=q3=Cloak of Tranquil Clouds", "=ds=#s4#"};
				{ 4, 87636, "", "=q3=Cloak of the Forgotten Emperor", "=ds=#s4#"};
				{ 5, 87637, "", "=q3=Jade Harbinger's Cloak", "=ds=#s4#"};
				{ 6, 87640, "", "=q3=Softfoot's Drape", "=ds=#s4#"};
				{ 7, 87639, "", "=q3=Tattered Guo-Lai Dynasty Cloak", "=ds=#s4#"};
				{ 8, 87217, "", "=q2=Small Bag of Goods", "=ds="};
			};
		};
		info = {
			name = ALIL["Vale of Eternal Blossoms"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		-----------------------
		--- Isle of Thunder ---
		-----------------------

	AtlasLoot_Data["RaresMOPMobsIsleofThunder"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..ALIL["Ancient Mogu Guardian"], "=q1="..AL["Summon"]};
				{ 3, 94826, "", "=q4=Mogu Sportsman's Bow", "=ds=#w2#"};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Cera"], "=q1="..AL["Summon"]};
				{ 6, 94706, "", "=q4=Cera's Impalers", "=ds=#h1#, #w4#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Echo of Kros"], "=q1="..AL["Summon"]};
				{ 9, 94708, "", "=q4=Saurok Ritualist's Sacrificial Dagger", "=ds=#h1#, #w4#"};
				{ 11, 0, "inv_box_04", "=q6="..ALIL["Electromancer Ju'le"], "=q1="..AL["Summon"]};
				{ 12, 94825, "", "=q4=Lightning Snare", "=ds=#h1#, #w6#"};
				{ 17, 0, "inv_box_04", "=q6="..ALIL["Haywire Sunreaver Construct"], ""};
				{ 18, 94124, "", "=q3=Sunreaver Micro-Sentry", "=ds=#e13#"};
				{ 20, 0, "inv_box_04", "=q6="..ALIL["Incomplete Drakkari Colossus"], "=q1="..AL["Summon"]};
				{ 21, 94823, "", "=q4=Drakkari Decapitator", "=ds=#h2#, #w1#"};
				{ 23, 0, "inv_box_04", "=q6="..ALIL["Kor'dok and Tinzo the Emberkeeper"], "=q1="..AL["Summon"]};
				{ 24, 94720, "", "=q4=Vengeance of Kor'dok", "=ds=#h1#, #w10#"};
				{ 26, 0, "inv_box_04", "=q6="..ALIL["Qi'nor"], "=q1="..AL["Summon"]};
				{ 27, 94824, "", "=q4=Gaze of Qi'nor", "=ds=#w9#"};
			};
			{
				{ 2, 0, "inv_box_04", "=q6="..BabbleRare["Ra'sha"], ""};
				{ 3, 95566, "", "=q3=Ra'sha's Sacrificial Dagger", "=ds="};
				{ 5, 0, "inv_box_04", "=q6="..ALIL["Spirit of Warlord Teng"], "=q1="..AL["Summon"]};
				{ 6, 94707, "", "=q4=Teng's Reach", "=ds=#w7#"};
				{ 8, 0, "inv_box_04", "=q6="..ALIL["Windweaver Akil'amon"], "=q1="..AL["Summon"]};
				{ 9, 94709, "", "=q4=Talonblade of Akil'amon", "=ds=#h1#, #w10#"};
				{ 17, 0, "inv_box_04", "=q6="..AL["Shared Zone Loot"], ""};
				{ 18, 94222, "", "=q4=Key to the Palace of Lei Shen", "=ds=#e9#"};
				{ 19, 92426, "", "=q4=Sealed Tome of the Lost Legion", "=ds=#m2#"};
				{ 20, 94221, "", "=q3=Shan'ze Ritual Stone", "=ds="};
				{ 21, 97268, "", "=q3=Tome of Valor", "=ds="};
			};
		};
		info = {
			name = ALIL["Isle of Thunder"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		---------------------
		--- Miscellaneous ---
		---------------------

	AtlasLoot_Data["RaresMOPMobsMisc"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..BabbleRare["Fixxul Lonelyheart"], "=q2="..ALIL["The Jade Forest"]};
				{ 3, 90078, "", "=q2=Cracked Talisman", "=ds="};
				{ 5, 0, "inv_box_04", "=q6="..BabbleRare["Lorbu Sadsummon"], "=q2="..ALIL["The Jade Forest"]};
				{ 6, 90078, "", "=q2=Cracked Talisman", "=ds="};
				{ 8, 0, "inv_box_04", "=q6="..BabbleRare["Martar the Not-So-Smart"], "=q2="..ALIL["The Jade Forest"]};
				{ 9, 87780, "", "=q3=Martar's Magnifying Glass", "=ds=#s14#"};
				{ 11, 0, "inv_box_04", "=q6="..BabbleRare["Huggalon the Heart Watcher"], "=q2="..ALIL["Townlong Steppes"]};
				{ 12, 90067, "", "=q3=B. F. F. Necklace", "=ds="};
				{ 14, 0, "inv_box_04", "=q6="..BabbleRare["Scotty"], "=q2="..ALIL["Townlong Steppes"]};
				{ 15, 89373, "", "=q2=Scotty's Lucky Coin", "=ds=#e25#"};
				{ 17, 0, "inv_box_04", "=q6="..BabbleRare["Alani"], "=q2="..ALIL["Vale of Eternal Blossoms"]};
				{ 18, 90655, "", "=q4=Reins of the Thundering Ruby Cloud Serpent", "=ds=#e12#"};
				{ 20, 0, "inv_box_04", "=q6="..BabbleRare["Sungraze Behemoth"], "=q2="..ALIL["Valley of the Four Winds"]};
				{ 21, 89682, "", "=q2=Oddly-Shaped Horn", "=ds=#e12#"};
				{ 23, 0, "inv_box_04", "=q6="..BabbleRare["Zhing"], "=q2="..ALIL["Kun-Lai Summit"]};
				{ 24, 89697, "", "=q2=Bag of Kafa Beans", "=ds=#e12#"};
				{ 26, 0, "inv_box_04", "=q6="..BabbleRare["Pengsong"], "=q2="..ALIL["Dread Wastes"]};
				{ 27, 89770, "", "=q2=Tuft of Yak Fur", "=ds=#e12#"};
				{ 29, 0, "inv_box_04", "=q6="..BabbleRare["Wild Onyx Serpent"], "=q2="..ALIL["Kun-Lai Summit"]};
				{ 30, 93360, "", "=q2=Serpent's Cache", "=ds="};
			};
		};
		info = {
			name = AL["Misc"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		----------------------------
		--- Zandalari Warbringer ---
		----------------------------

	AtlasLoot_Data["RaresMOPMobsWarbringer"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..BabbleRare["Zandalari Warbringer"], ""};
				{ 3, 94230, "", "=q4=Reins of the Amber Primordial Direhorn", "=ds=#e26#"};
				{ 4, 94231, "", "=q4=Reins of the Jade Primordial Direhorn", "=ds=#e26#"};
				{ 5, 94229, "", "=q4=Reins of the Slate Primordial Direhorn", "=ds=#e26#"};
				{ 6, 94225, "", "=q3=Stolen Celestial Insignia", "=ds="};
				{ 7, 94227, "", "=q3=Stolen Golden Lotus Insignia", "=ds="};
				{ 8, 94226, "", "=q3=Stolen Klaxxi Insignia", "=ds="};
				{ 9, 94223, "", "=q3=Stolen Shado-Pan Insignia", "=ds="};
				{ 10, 94158, "", "=q3=Big Bag of Zandalari Supplies", "=ds="};
				{ 11, 94159, "", "=q2=Small Bag of Zandalari Supplies", "=ds="};
			};
		};
		info = {
			name = BabbleRare["Zandalari Warbringer"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		----------------------------
		--- Clawlord Kril'mandar ---
		----------------------------

	AtlasLoot_Data["RaresMOPMobsClawlord"] = {
		["Normal"] = {
			{
				{ 2, 0, "inv_box_04", "=q6="..BabbleRare["Clawlord Kril'mandar"], "=q2="..ALIL["Krasarang Wilds"]};
				{ 3, 90087, "", "=q3=Lobstmourne", "=ds=#h1#, #w13#"};
				{ 5, 0, "inv_box_04", "=q6="..BabbleRare["Akkalou"], "=q2="..ALIL["The Jade Forest"]};
				{ 6, 90166, "", "=q2=Akkalou's Clamshell", "=ds="};
				{ 8, 0, "inv_box_04", "=q6="..BabbleRare["Akkalar"], "=q2="..ALIL["The Jade Forest"]};
				{ 9, 90167, "", "=q2=Akkalar's Clamshell", "=ds="};
				{ 11, 0, "inv_box_04", "=q6="..BabbleRare["Damlak"], "=q2="..ALIL["Krasarang Wilds"]};
				{ 12, 90169, "", "=q2=Damlak's Clamshell", "=ds="};
				{ 18, 90172, "", "=q2=Clamshell Band", "=ds=#m27#"};
				{ 20, 0, "inv_box_04", "=q6="..BabbleRare["Clamstok"], "=q2="..ALIL["Dread Wastes"]};
				{ 21, 90170, "", "=q2=Clamstok's Clamshell", "=ds="};
				{ 23, 0, "inv_box_04", "=q6="..BabbleRare["Kishak"], "=q2="..ALIL["Kun-Lai Summit"]};
				{ 24, 90168, "", "=q2=Kishak's Clamshell", "=ds="};
				{ 26, 0, "inv_box_04", "=q6="..BabbleRare["Odd'nirok"], "=q2="..ALIL["Townlong Steppes"]};
				{ 27, 90171, "", "=q2=Odd'nirok's Clamshell", "=ds="};
			};
		};
		info = {
			name = BabbleRare["Clawlord Kril'mandar"],
			module = moduleName, menu = "RAREMENU",
		};
	}

	------------------
	--- Rare Items ---
	------------------

		--------------------------------------------------
		--- The Jade Forest / Valley of the Four Winds ---
		--------------------------------------------------

	AtlasLoot_Data["RaresMOPItemsJadeForestValleyoftheFourWinds"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_box_04", "=q6="..ALIL["The Jade Forest"], "=ds="};
				{ 2, 86196, "", "=q3=Ancient Jinyu Staff", "=ds=#w9#"};
				{ 3, 85777, "", "=q3=Ancient Pandaren Mining Pick", "=ds=#h1#, #w1#"};
				{ 4, 86198, "", "=q3=Hammer of Ten Thunders", "=ds=#h2#, #w6#"};
				{ 5, 85776, "", "=q3=Wodin's Mantid Shanker", "=ds=#h1#, #w4#"};
				{ 7, 0, "inv_box_04", "=q6="..BabbleRare["Jade Warrior Statue"], "=ds="};
				{ 8, 86199, "", "=q3=Jade Infused Blade", "=ds=#h1#, #w10#"};
				{ 16, 0, "inv_box_04", "=q6="..ALIL["Valley of the Four Winds"], "=ds="};
				{ 17, 86218, "", "=q3=Staff of the Hidden Master", "=ds=#w9#"};
				{ 19, 0, "inv_box_04", "=q6="..BabbleRare["Ghostly Pandaren Craftsman"], "=ds="};
				{ 20, 85973, "", "=q3=Ancient Pandaren Fishing Charm", "=ds="};
				{ 22, 0, "inv_box_04", "=q6="..BabbleRare["Ghostly Pandaren Fisherman"], "=ds="};
				{ 23, 86079, "", "=q0=Ancient Pandaren Woodcutter", "=ds=#h3#, #w1#"};
				{ 25, 0, "inv_box_04", "=q6="..BabbleRare["Cache of Pilfered Goods"], "=ds="};
				{ 26, 86113, "", "=q3=Stolen Amulet of Might", "=ds=#s2#"};
				{ 27, 86112, "", "=q3=Stolen Amulet of Wisdom", "=ds=#s2#"};
				{ 28, 86111, "", "=q3=Stolen Necklace of Accuracy", "=ds=#s2#"};
				{ 29, 86114, "", "=q3=Stolen Necklace of Fortitude", "=ds=#s2#"};
				{ 30, 86110, "", "=q3=Stolen Necklace of Precision", "=ds=#s2#"};
			};
		};
		info = {
			name = ALIL["The Jade Forest"].." / "..ALIL["Valley of the Four Winds"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		----------------------------------------
		--- Krasarang Wilds / Kun-Lai Summit ---
		----------------------------------------

	AtlasLoot_Data["RaresMOPItemsKrasarangWildsKunLaiSummit"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_box_04", "=q6="..ALIL["Krasarang Wilds"], "=ds="};
				{ 2, 86124, "", "=q3=Pandaren Fishing Spear", "=ds=#w7#"};
				{ 4, 0, "inv_box_04", "=q6="..BabbleRare["Barrel of Banana Infused Rum"], "=ds="};
				{ 5, 87266, "", "=q1=Recipe: Banana Infused Rum", "=ds=#p3#"};
				{ 7, 0, "inv_box_04", "=q6="..BabbleRare["Equipment Locker"], "=ds="};
				{ 8, 86117, "", "=q3=Seafarer's Treads of Precision", "=ds=#s12#, #a1#"};
				{ 9, 86118, "", "=q3=Seafaring Advisor's Slippers", "=ds=#s12#, #a1#"};
				{ 10, 86119, "", "=q3=Seafarer's Boots of Meditation", "=ds=#s12#, #a2#"};
				{ 11, 86115, "", "=q3=Swashbuckling Boots", "=ds=#s12#, #a2#"};
				{ 12, 86116, "", "=q3=Agile Seafarer's Jackboots", "=ds=#s12#, #a3#"};
				{ 13, 86120, "", "=q3=Seafaring Sabatons of Meditation", "=ds=#s12#, #a3#"};
				{ 14, 86122, "", "=q3=Plankwalking Greaves", "=ds=#s12#, #a4#"};
				{ 15, 86123, "", "=q3=Seafarer's Sturdy Boots", "=ds=#s12#, #a4#"};
				{ 16, 0, "inv_box_04", "=q6="..ALIL["Kun-Lai Summit"], "=ds="};
				{ 17, 86394, "", "=q3=Hozen Warrior Spear", "=ds=#w7#"};
				{ 18, 88723, "", "=q3=Sturdy Yaungol Spear", "=ds=#w7#"};
				{ 19, 86393, "", "=q1=Tablet of Ren Yun", "=ds=#p3#"};
				{ 21, 0, "inv_box_04", "=q6="..BabbleRare["Frozen Trail Packer"], "=ds="};
				{ 22, 86125, "", "=q3=Kafa Press", "=ds="};
				{ 24, 0, "inv_box_04", "=q6="..BabbleRare["Sprite's Cloth Chest"], "=ds="};
				{ 25, 86223, "", "=q3=Agile Sprite Cloak", "=ds=#s4#"};
				{ 26, 86222, "", "=q3=Precise Sprite Cloak", "=ds=#s4#"};
				{ 27, 86224, "", "=q3=Steadfast Sprite Cape", "=ds=#s4#"};
				{ 28, 86225, "", "=q3=Strong Sprite Cloak", "=ds=#s4#"};
				{ 29, 86221, "", "=q3=Wise Sprite Cloak", "=ds=#s4#"};
			};
		};
		info = {
			name = ALIL["Krasarang Wilds"].." / "..ALIL["Kun-Lai Summit"],
			module = moduleName, menu = "RAREMENU",
		};
	}

		---------------------------------------
		--- Townlong Steppes / Dread Wastes ---
		---------------------------------------

	AtlasLoot_Data["RaresMOPItemsTownlongSteppesDreadWastes"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_box_04", "=q6="..ALIL["Townlong Steppes"], "=ds="};
				{ 2, 86518, "", "=q3=Yaungol Fire Carrier", "=ds=#h1#, #w6#"};
				{ 16, 0, "inv_box_04", "=q6="..ALIL["Dread Wastes"], "=ds="};
				{ 17, 86527, "", "=q3=Blade of the Poisoned Mind", "=ds=#h1#, #w10#"};
				{ 18, 86522, "", "=q3=Blade of the Prime", "=ds=#h1#, #w10#"};
				{ 19, 86525, "", "=q3=Bloodsoaked Chitin Fragment", "=ds=#s14#"};
				{ 20, 86524, "", "=q3=Dissector's Staff of Mutation", "=ds=#w9#"};
				{ 21, 86521, "", "=q3=Lucid Amulet of the Agile Mind", "=ds=#s2#"};
				{ 22, 86520, "", "=q3=Malik's Stalwart Spear", "=ds=#w7#"};
				{ 23, 86523, "", "=q3=Swarming Cleaver of Ka'roz", "=ds=#h2#, #w10#"};
				{ 24, 86526, "", "=q3=Swarmkeeper's Medallion", "=ds=#s2#"};
				{ 25, 86519, "", "=q3=Wind-Reaver's Dagger of Quick Strikes", "=ds=#h1#, #w4#"};
				{ 27, 0, "inv_box_04", "=q6="..BabbleRare["Glinting Rapana Whelk"], "=ds="};
				{ 28, 86529, "", "=q3=Manipulator's Talisman", "=ds=#s14#"};
			};
		};
		info = {
			name = ALIL["Townlong Steppes"].." / "..ALIL["Dread Wastes"],
			module = moduleName, menu = "RAREMENU",
		};
	}

	----------------
	--- Factions ---
	----------------

		-------------------
		--- The Anglers ---
		-------------------

	AtlasLoot_Data["Anglers"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_anglers", "=q6=#r2#", ""};
				{ 2, 85505, "", "=q2=Recipe: Krasarang Fritters", "=ds=#p3# (525)", "=ds=5 #gold#"};
				{ 3, 85502, "", "=q2=Recipe: Viseclaw Soup", "=ds=#p3# (525)", "=ds=5 #gold#"};
				{ 5, 0, "achievement_faction_anglers", "=q6=#r3#", ""};
				{ 6, 85447, "", "=q3=Tiny Goldfish", "=ds=#e13#", "=ds=250 #gold#"};
				{ 7, 84660, "", "=q2=Pandaren Fishing Pole", "=ds=#e20#", "=ds=25 #gold#"};
				{ 9, 0, "achievement_faction_anglers", "=q6=#r4#", ""};
				{ 10, 85500, "", "=q3=Anglers Fishing Raft", "=ds=#p24# (525)", "=ds=1,000 #gold#"};
				{ 11, 84661, "", "=q3=Dragon Fishing Pole", "=ds=#e20#", "=ds=500 #gold#"};
				{ 12, 88535, "", "=q3=Sharpened Tuskarr Spear", "=ds=#h3#", "=ds=1,500 #gold#"};
				{ 13, 93225, "", "=q7=Grand Commendation of the Anglers", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "achievement_faction_anglers", "=q6=#r5#", ""};
				{ 17, 81354, "", "=q4=Reins of the Azure Water Strider", "=ds=#e12#", "=ds=5,000 #gold#"};
				{ 18, 89401, "", "=q3=Anglers Tabard", "=ds=#s7#", "=ds=10 #gold#"};
				{ 20, 0, "inv_fishingpole_01", "=q6="..ALIL["Nat Pagle"], "=q5=#r4#"};
				{ 21, 88563, "", "=q7=Nat's Fishing Journal", "=ds=#m2#", "=ds=1,000 #gold#"};
				{ 23, 0, "inv_fishingpole_01", "=q6="..ALIL["Nat Pagle"], "=q5=#r5#"};
				{ 24, 88710, "", "=q4=Nat's Hat", "=ds=#s1#", "=ds=250 #gold#"};
				{ 26, 0, "inv_fishingpole_01", "=q6="..ALIL["Nat Pagle"], "=q5="..AL["Best Friend"]};
				{ 27, 86596, "", "=q3=Nat's Fishing Chair", "=ds="};
			};
		};
		info = {
			name = ALIL["The Anglers"],
			module = moduleName, menu = "REPMENU",
		};
	}

		-----------------------------
		--- The August Celestials ---
		-----------------------------

	AtlasLoot_Data["AugustCelestials"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_celestials", "=q6=#r3#", ""};
				{ 2, 89124, "", "=q2=Celestial Offering", "=ds=#m20#", "=ds=100 #gold#"};
				{ 4, 0, "achievement_faction_celestials", "=q6=#r4#", ""};
				{ 5, 84561, "", "=q3=Formula: Enchant Bracer - Exceptional Strength", "=ds=#p4# (600)", "=ds=40 #gold#"};
				{ 6, 84557, "", "=q3=Formula: Enchant Bracer - Greater Agility", "=ds=#p4# (600)", "=ds=40 #gold#"};
				{ 7, 84559, "", "=q3=Formula: Enchant Bracer - Super Intellect", "=ds=#p4# (600)", "=ds=40 #gold#"};
				{ 8, 93224, "", "=q7=Grand Commendation of the August Celestials", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "achievement_faction_celestials", "=q6=#r5#", ""};
				{ 17, 89304, "", "=q4=Reins of the Thundering August Cloud Serpent", "=ds=#e27#", "=ds=10,000 #gold#"};
				{ 18, 89799, "", "=q3=August Celestials Tabard", "=ds=#s7#", "=ds=10 #gold#"};
				{ 19, 86377, "", "=q1=Pattern: Royal Satchel", "=ds=#p8# (600)", "=ds=50 #gold#"};
			};
		};
		info = {
			name = ALIL["The August Celestials"],
			module = moduleName, menu = "REPMENU",
		};
	}

		------------------------------------------
		--- Bizmo's Brawlpub / Brawl'gar Arena ---
		------------------------------------------

	AtlasLoot_Data["BizmosBrawlpubBrawlgarArena"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_celestials", "=q6=#r1#", ""};
				{ 2, 92954, "", "=q1=Brawler's Healing Potion", "=ds=#e2#", "1 #gold# 68 #silver#" },
				{ 3, 92941, "", "=q1=Potion of Brawler's Might", "=ds=#e2#", "70 #silver#" },
				{ 4, 92942, "", "=q1=Potion of Brawler's Cunning", "=ds=#e2#", "70 #silver#" },
				{ 5, 92943, "", "=q1=Potion of Brawler's Deftness", "=ds=#e2#", "70 #silver#" },
				{ 6, 93043, "", "=q1=Rotten Apple", "=ds=", "70 #silver#", amount = 5  },
				{ 7, 93044, "", "=q1=Rotten Banana", "=ds=", "70 #silver#", amount = 5  },
				{ 8, 93045, "", "=q1=Rotten Watermelon", "=ds=", "70 #silver#", amount = 5 },
				{ 9, 93158, "", "=q1=Expired Blackout Brew", "=ds=", "70 #silver#", amount = 5  },
				{ 16, 0, "achievement_faction_celestials", "=q6="..AL["Rank 4"], ""};
				{ 17, 93025, "", "=q1=Clock'em", "=ds=#e13#", "21 #silver#" },
				{ 19, 0, "achievement_faction_celestials", "=q6="..AL["Rank 8"], ""};
				{ 20, 92948, "", "=q7=Brawler's Razor Claws", "=ds=#h1#, #w13#", "#JUSTICE:2175#" },
			};
		};
		info = {
			name = ALIL["Bizmo's Brawlpub"].." / "..ALIL["Brawl'gar Arena"],
			module = moduleName, menu = "REPMENU",
		};
	}

		---------------------------
		--- Dominance Offensive ---
		---------------------------

	AtlasLoot_Data["DominanceOffensive"] = {
		["Normal"] = {
			{
				{ 1, 0, "pvpcurrency-honor-horde", "=q6=#r4#", ""};
				{ 2, 93232, "", "=q7=Grand Commendation of the Dominance Offensive", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "pvpcurrency-honor-horde", "=q6=#r5#", ""};
				{ 17, 93169, "", "=q4=Grand Armored Wyvern", "=ds=#e27#", "=ds=2,000 #gold#"};
			};
		};
		info = {
			name = ALIL["Dominance Offensive"],
			module = moduleName, menu = "REPMENU",
		};
	}

		--------------------
		--- Golden Lotus ---
		--------------------

	AtlasLoot_Data["GoldenLotus"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_goldenlotus", "=q6=#r3#", ""};
				{ 2, 90615, "", "=q3=Burning Mark of the Golden Lotus", "=ds=#s13#", "=q1=#m4#: #QUESTID:30639#"};
				{ 3, 90614, "", "=q3=Delicate Mark of the Golden Lotus", "=ds=#s13#", "=q1=#m4#: #QUESTID:30639#"};
				{ 4, 90618, "", "=q3=Durable Mark of the Golden Lotus", "=ds=#s13#", "=q1=#m4#: #QUESTID:30639#"};
				{ 5, 90617, "", "=q3=Ferocious Mark of the Golden Lotus", "=ds=#s13#", "=q1=#m4#: #QUESTID:30639#"};
				{ 6, 90616, "", "=q3=Mending Mark of the Golden Lotus", "=ds=#s13#", "=q1=#m4#: #QUESTID:30639#"};
				{ 7, 86235, "", "=q1=Pattern: Angerhide Leg Armor", "=ds=#p7# (575)", "=ds=25 #gold#"};
				{ 8, 86276, "", "=q1=Pattern: Ironscale Leg Armor", "=ds=#p7# (575)", "=ds=25 #gold#"};
				{ 9, 86295, "", "=q1=Pattern: Shadowleather Leg Armor", "=ds=#p7# (575)", "=ds=25 #gold#"};
				{ 10, 86237, "", "=q1=Pattern: Chestguard of Earthen Harmony", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 11, 86273, "", "=q1=Pattern: Gloves of Earthen Harmony", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 12, 86274, "", "=q1=Pattern: Greyshadow Chestguard", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 13, 86275, "", "=q1=Pattern: Greyshadow Gloves", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 14, 86278, "", "=q1=Pattern: Lifekeeper's Robe", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 15, 86277, "", "=q1=Pattern: Lifekeeper's Gloves", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 16, 86309, "", "=q1=Pattern: Wildblood Vest", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 17, 86308, "", "=q1=Pattern: Wildblood Gloves", "=ds=#p7# (600)", "=ds=50 #gold#"};
				{ 18, 86376, "", "=q1=Pattern: Greater Cerulean Spellthread", "=ds=#p8# (575)", "=ds=25 #gold#"};
				{ 19, 86375, "", "=q1=Pattern: Greater Pearlescent Spellthread", "=ds=#p8# (575)", "=ds=25 #gold#"};
				{ 20, 86370, "", "=q1=Pattern: Robes of Creation", "=ds=#p8# (600)", "=ds=50 #gold#"};
				{ 21, 86371, "", "=q1=Pattern: Gloves of Creation", "=ds=#p8# (600)", "=ds=50 #gold#"};
				{ 22, 86368, "", "=q1=Pattern: Spelltwister's Grand Robe", "=ds=#p8# (600)", "=ds=50 #gold#"};
				{ 23, 86369, "", "=q1=Pattern: Spelltwister's Gloves", "=ds=#p8# (600)", "=ds=50 #gold#"};
			};
			{
				{ 1, 0, "achievement_faction_goldenlotus", "=q6=#r4#", ""};
				{ 2, 90607, "", "=q3=Burning Robes of the Golden Lotus", "=ds=#s5#, #a1#", "=q1=#m4#: #QUESTID:30642#"};
				{ 3, 90609, "", "=q3=Mending Robes of the Golden Lotus", "=ds=#s5#, #a1#", "=q1=#m4#: #QUESTID:30642#"};
				{ 4, 90597, "", "=q3=Delicate Chestguard of the Golden Lotus", "=ds=#s5#, #a2#", "=q1=#m4#: #QUESTID:30642#"};
				{ 5, 90599, "", "=q3=Warming Chestguard of the Golden Lotus", "=ds=#s5#, #a2#", "=q1=#m4#: #QUESTID:30642#"};
				{ 6, 90598, "", "=q3=Crackling Chain of the Golden Lotus", "=ds=#s5#, #a3#", "=q1=#m4#: #QUESTID:30642#"};
				{ 7, 90602, "", "=q3=Deadeye Chain of the Golden Lotus", "=ds=#s5#, #a3#", "=q1=#m4#: #QUESTID:30642#"};
				{ 8, 90601, "", "=q3=Bonded Plate of the Golden Lotus", "=ds=#s5#, #a4#", "=q1=#m4#: #QUESTID:30642#"};
				{ 9, 90603, "", "=q3=Durable Plate of the Golden Lotus", "=ds=#s5#, #a4#", "=q1=#m4#: #QUESTID:30642#"};
				{ 10, 90600, "", "=q3=Ferocious Plate of the Golden Lotus", "=ds=#s5#, #a4#", "=q1=#m4#: #QUESTID:30642#"};
				{ 11, 93215, "", "=q7=Grand Commendation of the Golden Lotus", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "achievement_faction_goldenlotus", "=q6=#r5#", ""};
				{ 17, 90596, "", "=q4=Burning Necklace of the Golden Lotus", "=ds=#s2#", "=q1=#m4#: #QUESTID:30646#"};
				{ 18, 90593, "", "=q4=Delicate Necklace of the Golden Lotus", "=ds=#s2#", "=q1=#m4#: #QUESTID:30646#"};
				{ 19, 90594, "", "=q4=Durable Necklace of the Golden Lotus", "=ds=#s2#", "=q1=#m4#: #QUESTID:30646#"};
				{ 20, 90592, "", "=q4=Ferocious Necklace of the Golden Lotus", "=ds=#s2#", "=q1=#m4#: #QUESTID:30646#"};
				{ 21, 90595, "", "=q4=Mending Necklace of the Golden Lotus", "=ds=#s2#", "=q1=#m4#: #QUESTID:30646#"};
				{ 22, 87781, "", "=q4=Reins of the Azure Riding Crane", "=ds=#e26#", "=ds=500 #gold#"};
				{ 23, 87782, "", "=q4=Reins of the Golden Riding Crane", "=ds=#e26#", "=ds=2,500 #gold#"};
				{ 24, 87783, "", "=q4=Reins of the Regal Riding Crane", "=ds=#e26#", "=ds=1,500 #gold#"};
				{ 25, 89797, "", "=q3=Golden Lotus Tabard", "=ds=#s7#", "=ds=10 #gold#"};
			};
		};
		info = {
			name = ALIL["Golden Lotus"],
			module = moduleName, menu = "REPMENU",
		};
	}

		---------------------------
		--- Kirin Tor Offensive ---
		---------------------------

	AtlasLoot_Data["KirinTorOffensive"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_reputation_kirintor_offensive", "=q6=#r2#", ""};
				{ 2, 80433, "", "=q3=Blood Spirit", "=ds=#e8#", "#VALOR:400#"};
				{ 3, 95489, "", "=q3=Kirin Tor Offensive Insignia", "=ds=", "#HISTORICALPARCHMENTS:1#"};
				{ 4, 95490, "", "=q3=Greater Kirin Tor Offensive Insignia", "=ds=", "#HISTORICALPARCHMENTS:10#"};
				{ 5, 95567, "", "=q1=Kirin Tor Beacon", "=ds=", "=ds=25 #gold#"};
				{ 6, 95054, "", "=q1=Potion of Light Steps", "=ds=", "#ELDERCHARM:1#"};
				{ 8, 0, "achievement_reputation_kirintor_offensive", "=q6=#r3#", ""};
				{ 9, 95532, "", "=q4=Belt of Loa Charms", "=ds=#s10#, #a1#", "=ds=300 #gold#"};
				{ 10, 95527, "", "=q4=Pain-Binder Girdle", "=ds=#s10#, #a1#", "=ds=300 #gold#"};
				{ 11, 95526, "", "=q4=Shan'ze Scholar's Girdle", "=ds=#s10#, #a1#", "=ds=300 #gold#"};
				{ 12, 95530, "", "=q4=Cinch of the Dead Forest's Vigil", "=ds=#s10#, #a2#", "=ds=300 #gold#"};
				{ 13, 95528, "", "=q4=Skumblade-Tooth Girdle", "=ds=#s10#, #a2#", "=ds=300 #gold#"};
				{ 14, 95531, "", "=q4=Rotting Bog Cinch", "=ds=#s10#, #a3#", "=ds=300 #gold#"};
				{ 15, 95534, "", "=q4=Skumblade Ritualist Links", "=ds=#s10#, #a3#", "=ds=300 #gold#"};
				{ 16, 95529, "", "=q4=Girdle of Shan'ze Glory", "=ds=#s10#, #a4#", "=ds=300 #gold#"};
				{ 17, 95533, "", "=q4=Thunder Caressed Waistguard", "=ds=#s10#, #a4#", "=ds=300 #gold#"};
				{ 18, 95053, "", "=q1=A Common Rock", "=ds=", "#ELDERCHARM:1#"};
				{ 19, 95093, "", "=q1=Sleep Dust", "=ds=", "#ELDERCHARM:1#"};
				{ 21, 0, "achievement_reputation_kirintor_offensive", "=q6=#r4#", ""};
				{ 22, 95545, "", "=q7=Grand Commendation of the Kirin Tor Offensive", "=ds=", "=ds=45 #gold#"};
				{ 23, 97207, "", "=q4=Cloak of the Immortal Guardian", "=ds=#s4#", "#VALOR:937#" },
				{ 24, 97205, "", "=q4=Shan'ze Gravetender Cloak", "=ds=#s4#", "#VALOR:937#" },
				{ 25, 97206, "", "=q4=Shan'ze Partisan's Greatcloak", "=ds=#s4#", "#VALOR:937#" },
				{ 26, 97204, "", "=q4=Static-Collecting Cloak", "=ds=#s4#", "#VALOR:937#" },
				{ 27, 97203, "", "=q4=Thunder-Chaser Cloak", "=ds=#s4#", "#VALOR:937#" },
				{ 28, 95052, "", "=q1=Arcane Propellant", "=ds=", "#ELDERCHARM:1#"};
				{ 29, 95055, "", "=q1=Frost Rune Trap", "=ds=", "#ELDERCHARM:1#"};
			};
			{
				{ 1, 0, "achievement_reputation_kirintor_offensive", "=q6=#r5#", ""};
				{ 2, 95564, "", "=q4=Reins of the Golden Primal Direhorn", "=ds=#e26#", "=ds=3000 #gold#"};
				{ 3, 97191, "", "=q4=Ancient Overlord's Onyx Band", "=ds=#s13#", "#VALOR:937#"};
				{ 4, 97189, "", "=q4=Ancient Primalist's Seal", "=ds=#s13#", "#VALOR:937#"};
				{ 5, 97187, "", "=q4=Refurbished Band of Jin", "=ds=#s13#", "#VALOR:937#"};
				{ 6, 97190, "", "=q4=Refurbished Seal of Jin", "=ds=#s13#", "#VALOR:937#"};
				{ 7, 97188, "", "=q4=Restored Hexxer's Signet", "=ds=#s13#", "#VALOR:937#"};
				{ 8, 95589, "", "=q3=Glorious Standard of the Kirin Tor Offensive", "=ds=", "=q1=#m4#: #QUESTID:32599#"};
				{ 9, 95591, "", "=q3=Kirin Tor Offensive Tabard", "=ds=#s7#", "=ds=10 #gold#"};
				{ 10, 97155, "", "=q1=Polymorphic Key", "=ds=", "#ELDERCHARM:3#"};
			};
		};
		info = {
			name = ALIL["Kirin Tor Offensive"],
			module = moduleName, menu = "REPMENU",
		};
	}

		------------------
		--- The Klaxxi ---
		------------------

	AtlasLoot_Data["Klaxxi"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_klaxxi", "=q6=#r3#", ""};
				{ 2, 89230, "", "=q1=Restorative Amber", "=ds=#e18#", "=ds=10 #gold#"};
				{ 3, 90531, "", "=q1=Plans: Ghost Iron Shield Spike", "=ds=#p2# (540)", "=ds=20 #kyparite#"};
				{ 4, 90532, "", "=q1=Plans: Living Steel Weapon Chain", "=ds=#p2# (540)", "=ds=20 #kyparite#"};
				{ 5, 84197, "", "=q1=Plans: Masterwork Forgewire Axe", "=ds=#p2# (575)", "=ds=20 #kyparite#"};
				{ 6, 84198, "", "=q1=Plans: Masterwork Ghost Shard", "=ds=#p2# (575)", "=ds=20 #kyparite#"};
				{ 7, 84200, "", "=q1=Plans: Masterwork Ghost-Forged Blade", "=ds=#p2# (575)", "=ds=20 #kyparite#"};
				{ 8, 84217, "", "=q1=Plans: Masterwork Phantasmal Hammer", "=ds=#p2# (575)", "=ds=20 #kyparite#"};
				{ 9, 84218, "", "=q1=Plans: Masterwork Spiritblade Decimator", "=ds=#p2# (575)", "=ds=20 #kyparite#"};
				{ 10, 83791, "", "=q1=Plans: Breastplate of Ancient Steel", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 11, 83792, "", "=q1=Plans: Gauntlets of Ancient Steel", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 12, 83787, "", "=q1=Plans: Ghost Reaver's Breastplate", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 13, 83788, "", "=q1=Plans: Ghost Reaver's Gauntlets", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 14, 84196, "", "=q1=Plans: Living Steel Belt Buckle", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 15, 83789, "", "=q1=Plans: Living Steel Breastplate", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 16, 83790, "", "=q1=Plans: Living Steel Gauntlets", "=ds=#p2# (600)", "=ds=20 #kyparite#"};
				{ 18, 0, "achievement_faction_klaxxi", "=q6=#r4#", ""};
				{ 19, 92522, "", "=q7=Grand Commendation of the Klaxxi", "=ds=", "=ds=45 #gold#"};
			};
			{
				{ 1, 0, "achievement_faction_klaxxi", "=q6=#r5#", ""};
				{ 2, 90862, "", "=q4=Seal of the Bloodseeker", "=ds=#s13#", "=q1=#m4#: #QUESTID:31612#"};
				{ 3, 90859, "", "=q4=Seal of the Lucid", "=ds=#s13#", "=q1=#m4#: #QUESTID:31612#"};
				{ 4, 90858, "", "=q4=Seal of the Prime", "=ds=#s13#", "=q1=#m4#: #QUESTID:31612#"};
				{ 5, 90860, "", "=q4=Seal of the Unscathed", "=ds=#s13#", "=q1=#m4#: #QUESTID:31612#"};
				{ 6, 90861, "", "=q4=Seal of the Windreaver", "=ds=#s13#", "=q1=#m4#: #QUESTID:31612#"};
				{ 7, 85262, "", "=q4=Reins of the Amber Scorpion", "=ds=#e26#", "=ds=10,000 #gold#"};
				{ 8, 89393, "", "=q3=Amber Slicer of Klaxxi-vess", "=ds=#h1#, #w4#", "=ds=169 #gold# 8 #silver# 72 #copper#"};
				{ 9, 89392, "", "=q3=Amber Spine of Klaxxi-vess", "=ds=#h1#, #w4#", "=ds=168 #gold# 47 #silver# 70 #copper#"};
				{ 10, 89396, "", "=q3=Amber Espada of Klaxxi-vess", "=ds=#h1#, #w10#", "=ds=170 #gold# 90 #silver# 16 #copper#"};
				{ 11, 89397, "", "=q3=Amber Saber of Klaxxi-vess", "=ds=#h1#, #w10#", "=ds=159 #gold# 37 #silver# 18 #copper#"};
				{ 12, 89398, "", "=q3=Amber Flammard of Klaxxi-vess", "=ds=#h2#, #w10#", "=ds=199 #gold# 97 #silver# 76 #copper#"};
				{ 13, 89400, "", "=q3=Amber Sledge of Klaxxi-vess", "=ds=#h1#, #w6#", "=ds=161 #gold# 18 #silver# 62 #copper#"};
				{ 14, 89394, "", "=q3=Amber Spear of Klaxxi-vess", "=ds=#w7#", "=ds=212 #gold# 12 #silver# 20 #copper#"};
				{ 15, 89395, "", "=q3=Amber Scythe of Klaxxi-vess", "=ds=#w9#", "=ds=212 #gold# 88 #silver# 48 #copper#"};
				{ 16, 89399, "", "=q3=Amber Sprayer of Klaxxi-vess", "=ds=#w5#", "=ds=120 #gold# 44 #silver# 43 #copper#"};
				{ 17, 89798, "", "=q3=Klaxxi Tabard", "=ds=#s7#", "=ds=10 #gold#"};
			};
		};
		info = {
			name = ALIL["The Klaxxi"],
			module = moduleName, menu = "REPMENU",
		};
	}

		-----------------------
		--- The Lorewalkers ---
		-----------------------

	AtlasLoot_Data["Lorewalkers"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_lorewalkers", "=q6=#r4#", ""};
				{ 2, 93230, "", "=q7=Grand Commendation of the Lorewalkers", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "achievement_faction_lorewalkers", "=q6=#r5#", ""};
				{ 17, 89363, "", "=q3=Disc of the Red Flying Cloud", "=ds=#e27#", "=ds=600 #gold#"};
				{ 18, 89795, "", "=q3=Lorewalkers Tabard", "=ds=#s7#", "=ds=10 #gold#"};
				{ 19, 87548, "", "=q2=Lorewalker's Lodestone", "=ds=#m20#"};
				{ 20, 87549, "", "=q2=Lorewalker's Map", "=ds=#m20#"};
			};
		};
		info = {
			name = ALIL["The Lorewalkers"],
			module = moduleName, menu = "REPMENU",
		};
	}

		-----------------------------
		--- Operation: Shieldwall ---
		-----------------------------

	AtlasLoot_Data["OperationShieldwall"] = {
		["Normal"] = {
			{
				{ 1, 0, "pvpcurrency-honor-alliance", "=q6=#r4#", ""};
				{ 2, 93231, "", "=q7=Grand Commendation of Operation: Shieldwall", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "pvpcurrency-honor-alliance", "=q6=#r5#", ""};
				{ 17, 93168, "", "=q4=Grand Armored Gryphon", "=ds=#e27#", "=ds=2,000 #gold#"};
			};
		};
		info = {
			name = ALIL["Operation: Shieldwall"],
			module = moduleName, menu = "REPMENU",
		};
	}
		----------------------------------
		--- Order of the Cloud Serpent ---
		----------------------------------

	AtlasLoot_Data["OrderCloudSerpent"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_serpentriders", "=q6=#r3#", ""};
				{ 2, 83845, "", "=q1=Design: Jade Panther", "=ds=#p12# (600)", "=ds=200 #gold#"};
				{ 3, 83830, "", "=q1=Design: Sunstone Panther", "=ds=#p12# (600)", "=ds=200 #gold#"};
				{ 5, 0, "achievement_faction_serpentriders", "=q6=#r4#", ""};
				{ 6, 83931, "", "=q1=Design: Ruby Panther", "=ds=#p12# (600)", "=ds=200 #gold#"};
				{ 7, 83932, "", "=q1=Design: Sapphire Panther", "=ds=#p12# (600)", "=ds=200 #gold#"};
				{ 8, 89222, "", "=q1=Cloud Ring", "=ds=#m20#", "=ds=1,000 #gold#"};
				{ 9, 89225, "", "=q1=Finish Line", "=ds=#m20#", "=ds=100 #gold#"};
				{ 10, 89227, "", "=q1=Floating Finish Line", "=ds=#m20#", "=ds=100 #gold#"};
				{ 11, 89224, "", "=q1=Floating Racing Flag", "=ds=#m20#", "=ds=25 #gold#"};
				{ 12, 89223, "", "=q1=Racing Flag", "=ds=#m20#", "=ds=25 #gold#"};
				{ 13, 93229, "", "=q7=Grand Commendation of the Order of the Cloud Serpent", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "achievement_faction_serpentriders", "=q6=#r5#", ""};
				{ 17, 85430, "", "=q4=Reins of the Azure Cloud Serpent", "=ds=#e27#", "=ds=3,000 #gold#"};
				{ 18, 85429, "", "=q4=Reins of the Golden Cloud Serpent", "=ds=#e27#", "=ds=3,000 #gold#"};
				{ 19, 79802, "", "=q4=Reins of the Jade Cloud Serpent", "=ds=#e27#", "=ds=3,000 #gold#"};
				{ 20, 89796, "", "=q3=Order of the Cloud Serpent Tabard", "=ds=#s7#", "=ds=10 #gold#"};
				{ 21, 83877, "", "=q1=Design: Jeweled Onyx Panther", "=ds=#p12# (600)", "=ds=200 #gold#"};
			};
		};
		info = {
			name = ALIL["Order of the Cloud Serpent"],
			module = moduleName, menu = "REPMENU",
		};
	}

		-----------------
		--- Shado-Pan ---
		-----------------

	AtlasLoot_Data["ShadoPan"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_shadopan", "=q6=#r3#", ""};
				{ 2, 89302, "", "=q1=Stack of Bamboo", "=ds=#e18#", "=ds=25 #gold#"};
				{ 3, 89303, "", "=q1=Stack of Stone Blocks", "=ds=#e18#", "=ds=40 #gold#"};
				{ 4, 89301, "", "=q1=Stack of Wooden Boards", "=ds=#e18#", "=ds=10 #gold#"};
				{ 6, 0, "achievement_faction_shadopan", "=q6=#r4#", ""};
				{ 7, 84584, "", "=q3=Formula: Enchant Weapon - Dancing Steel", "=ds=#p4# (600)", "=ds=40 #gold#"};
				{ 8, 84583, "", "=q3=Formula: Enchant Weapon - Jade Spirit", "=ds=#p4# (600)", "=ds=40 #gold#"};
				{ 9, 84580, "", "=q3=Formula: Enchant Weapon - River's Song", "=ds=#p4# (600)", "=ds=40 #gold#"};
				{ 10, 93220, "", "=q7=Grand Commendation of the Shado-Pan", "=ds=", "=ds=45 #gold#"};
				{ 16, 0, "achievement_faction_shadopan", "=q6=#r5#", ""};
				{ 17, 89307, "", "=q4=Reins of the Blue Shado-Pan Riding Tiger", "=ds=#e26#", "=ds=500 #gold#"};
				{ 18, 89305, "", "=q4=Reins of the Green Shado-Pan Riding Tiger", "=ds=#e26#", "=ds=1,500 #gold#"};
				{ 19, 89306, "", "=q4=Reins of the Red Shado-Pan Riding Tiger", "=ds=#e26#", "=ds=2,500 #gold#"};
				{ 20, 87768, "", "=q4=Reins of the Onyx Cloud Serpent", "=ds=#e27#", "=q1=#m4#: #QUESTID:31277#"};
				{ 21, 89801, "", "=q3=Replica Shado-Pan Helmet", "=ds=#s1#, #a1#", "=ds=18 #gold# 69 #silver# 42 #copper#"};
				{ 22, 90844, "", "=q3=Replica Shado-Pan Helmet", "=ds=#s1#, #a2#", "=ds=17 #gold# 73 #silver# 80 #copper#"};
				{ 23, 90845, "", "=q3=Replica Shado-Pan Helmet", "=ds=#s1#, #a3#", "=ds=17 #gold# 80 #silver# 64 #copper#"};
				{ 24, 90846, "", "=q3=Replica Shado-Pan Helmet", "=ds=#s1#, #a4#", "=ds=17 #gold# 87 #silver# 30 #copper#"};
				{ 25, 89800, "", "=q3=Shado-Pan Tabard", "=ds=#s7#", "=ds=10 #gold#"};
			};
		};
		info = {
			name = ALIL["Shado-Pan"],
			module = moduleName, menu = "REPMENU",
		};
	}

		---------------------------
		--- Shado-Pan Assault ---
		---------------------------

	AtlasLoot_Data["ShadoPanAssault"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_shadopan", "=q6=#r1#", ""};
				{ 2, 95146, "", "=q4=Destroyer's Battletags", "=ds=#s2#", "#VALOR:1250#" },
				{ 3, 95143, "", "=q4=Flanker's Battletags", "=ds=#s2#", "#VALOR:1250#" },
				{ 4, 95145, "", "=q4=Mender's Battletags", "=ds=#s2#", "#VALOR:1250#" },
				{ 5, 95142, "", "=q4=Striker's Battletags", "=ds=#s2#", "#VALOR:1250#" },
				{ 6, 95144, "", "=q4=Vanguard's Battletags", "=ds=#s2#", "#VALOR:1250#" },
				{ 8, 0, "achievement_faction_shadopan", "=q6=#r2#", ""};
				{ 9, 95140, "", "=q4=Band of the Shado-Pan Assault", "=ds=#s13#", "#VALOR:1250#" },
				{ 10, 95141, "", "=q4=Loop of the Shado-Pan Assault", "=ds=#s13#", "#VALOR:1250#" },
				{ 11, 95139, "", "=q4=Ring of the Shado-Pan Assault", "=ds=#s13#", "#VALOR:1250#" },
				{ 12, 95137, "", "=q4=Seal of the Shado-Pan Assault", "=ds=#s13#", "#VALOR:1250#" },
				{ 13, 95138, "", "=q4=Signet of the Shado-Pan Assault", "=ds=#s13#", "#VALOR:1250#" },
				{ 16, 94508, "", "=q4=Brutal Talisman of the Shado-Pan Assault", "=ds=#s14#", "#VALOR:1750#" },
				{ 17, 94509, "", "=q4=Soothing Talisman of the Shado-Pan Assault", "=ds=#s14#", "#VALOR:1750#" },
				{ 18, 94507, "", "=q4=Steadfast Talisman of the Shado-Pan Assault", "=ds=#s14#", "#VALOR:1750#" },
				{ 19, 94511, "", "=q4=Vicious Talisman of the Shado-Pan Assault", "=ds=#s14#", "#VALOR:1750#" },
				{ 20, 94510, "", "=q4=Volatile Talisman of the Shado-Pan Assault", "=ds=#s14#", "#VALOR:1750#" },
				{ 22, 95135, "", "=q4=Bracers of Shielding Thought", "=ds=#s8#, #a1#", "#VALOR:1250#" },
				{ 23, 95136, "", "=q4=Troll-Burner Bracers", "=ds=#s8#, #a1#", "#VALOR:1250#" },
				{ 24, 95134, "", "=q4=Hearthfire Armwraps", "=ds=#s8#, #a2#", "#VALOR:1250#" },
				{ 25, 95133, "", "=q4=Willow-Weave Armbands", "=ds=#s8#, #a2#", "#VALOR:1250#" },
				{ 26, 95131, "", "=q4=Powderburn Bracers", "=ds=#s8#, #a3#", "#VALOR:1250#" },
				{ 27, 95132, "", "=q4=Spiritcaller Cuffs", "=ds=#s8#, #a3#", "#VALOR:1250#" },
				{ 28, 95129, "", "=q4=Axebinder Wristguards", "=ds=#s8#, #a4#", "#VALOR:1250#" },
				{ 29, 95128, "", "=q4=Bonecrusher Bracers", "=ds=#s8#, #a4#", "#VALOR:1250#" },
				{ 30, 95130, "", "=q4=Softscar Armplates", "=ds=#s8#, #a4#", "#VALOR:1250#" },
			};
			{
				{ 1, 0, "achievement_faction_shadopan", "=q6=#r3#", ""};
				{ 2, 95118, "", "=q4=Dreamweaver Drape", "=ds=#s4#", "#VALOR:1250#" },
				{ 3, 95116, "", "=q4=Longshot Forestcloak", "=ds=#s4#", "#VALOR:1250#" },
				{ 4, 95115, "", "=q4=Many-Layered Scalecloak", "=ds=#s4#", "#VALOR:1250#" },
				{ 5, 95117, "", "=q4=Shadowspike Cloak", "=ds=#s4#", "#VALOR:1250#" },
				{ 6, 95114, "", "=q4=Spikeshard Greatcloak", "=ds=#s4#", "#VALOR:1250#" },
				{ 7, 95106, "", "=q4=Flameweaver Handwraps", "=ds=#s9#, #a1#", "#VALOR:1750#" },
				{ 8, 95105, "", "=q4=Ghostbinder Grips", "=ds=#s9#, #a1#", "#VALOR:1750#" },
				{ 9, 95108, "", "=q4=Daggerfinger Clutches", "=ds=#s9#, #a2#", "#VALOR:1750#" },
				{ 10, 95107, "", "=q4=Gloves of Enduring Renewal", "=ds=#s9#, #a2#", "#VALOR:1750#" },
				{ 11, 95109, "", "=q4=Gauntlets of the Longbow", "=ds=#s9#, #a3#", "#VALOR:1750#" },
				{ 12, 95112, "", "=q4=Totemshaper Gloves", "=ds=#s9#, #a3#", "#VALOR:1750#" },
				{ 13, 95111, "", "=q4=Bloodstained Skullsqueezers", "=ds=#s9#, #a4#", "#VALOR:1750#" },
				{ 14, 95110, "", "=q4=Stoneward Handguards", "=ds=#s9#, #a4#", "#VALOR:1750#" },
				{ 15, 95113, "", "=q4=Touch of Soothing Mists", "=ds=#s9#, #a4#", "#VALOR:1750#" },
				{ 17, 95123, "", "=q4=Charfire Leggings", "=ds=#s11#, #a1#", "#VALOR:2250#" },
				{ 18, 95122, "", "=q4=Wisp-Weave Pantaloons", "=ds=#s11#, #a1#", "#VALOR:2250#" },
				{ 19, 95125, "", "=q4=Legguards of Hidden Knives", "=ds=#s11#, #a2#", "#VALOR:2250#" },
				{ 20, 95124, "", "=q4=Trousers of Waning Shadow", "=ds=#s11#, #a2#", "#VALOR:2250#" },
				{ 21, 95127, "", "=q4=Homeguard Leggings", "=ds=#s11#, #a3#", "#VALOR:2250#" },
				{ 22, 95126, "", "=q4=Kilt of Rising Thunder", "=ds=#s11#, #a3#", "#VALOR:2250#" },
				{ 23, 95120, "", "=q4=Legguards of Renewal", "=ds=#s11#, #a4#", "#VALOR:2250#" },
				{ 24, 95119, "", "=q4=Thunderbreaker Legplates", "=ds=#s11#, #a4#", "#VALOR:2250#" },
				{ 25, 95121, "", "=q4=Vaultbreaker Greaves", "=ds=#s11#, #a4#", "#VALOR:2250#" },
			};
			{
				{ 1, 0, "achievement_faction_shadopan", "=q6=#r4#", ""};
				{ 2, 95081, "", "=q4=Fire Support Robes", "=ds=#s5#, #a1#", "#VALOR:2250#" },
				{ 3, 95082, "", "=q4=Robes of Misty Bindings", "=ds=#s5#, #a1#", "#VALOR:2250#" },
				{ 4, 95078, "", "=q4=Raiment of Silent Stars", "=ds=#s5#, #a2#", "#VALOR:2250#" },
				{ 5, 95077, "", "=q4=Roofstalker Shadowwrap", "=ds=#s5#, #a2#", "#VALOR:2250#" },
				{ 6, 95079, "", "=q4=Carapace of Segmented Scale", "=ds=#s5#, #a3#", "#VALOR:2250#" },
				{ 7, 95080, "", "=q4=Skinsealer Tunic", "=ds=#s5#, #a3#", "#VALOR:2250#" },
				{ 8, 95076, "", "=q4=Breastplate of Brutal Strikes", "=ds=#s5#, #a4#", "#VALOR:2250#" },
				{ 9, 95075, "", "=q4=Gianttooth Chestplate", "=ds=#s5#, #a4#", "#VALOR:2250#" },
				{ 10, 95074, "", "=q4=Hauberk of Gleaming Fire", "=ds=#s5#, #a4#", "#VALOR:2250#" },
				{ 17, 95090, "", "=q4=Firestrike Cord", "=ds=#s10#, #a1#", "#VALOR:1750#" },
				{ 18, 95091, "", "=q4=Girdle of Glowing Light", "=ds=#s10#, #a1#", "#VALOR:1750#" },
				{ 19, 95088, "", "=q4=Darkfang Belt", "=ds=#s10#, #a2#", "#VALOR:1750#" },
				{ 20, 95089, "", "=q4=Martiean's Splitleaf Girdle", "=ds=#s10#, #a2#", "#VALOR:1750#" },
				{ 21, 95087, "", "=q4=Cracklebite Links", "=ds=#s10#, #a3#", "#VALOR:1750#" },
				{ 22, 95086, "", "=q4=Nightflight Chain", "=ds=#s10#, #a3#", "#VALOR:1750#" },
				{ 23, 95084, "", "=q4=Reinforced Spiritplate Girdle", "=ds=#s10#, #a4#", "#VALOR:1750#" },
				{ 24, 95083, "", "=q4=Swordhook Slingbelt", "=ds=#s10#, #a4#", "#VALOR:1750#" },
				{ 25, 95085, "", "=q4=Waistplate of Channeled Mending", "=ds=#s10#, #a4#", "#VALOR:1750#" },
			};
			{
				{ 1, 0, "achievement_faction_shadopan", "=q6=#r5#", ""};
				{ 2, 95102, "", "=q4=Frost-Kissed Shoulderwraps", "=ds=#s3#, #a1#", "=ds=1000 #gold#" },
				{ 3, 95101, "", "=q4=Halo-Graced Mantle", "=ds=#s3#, #a1#", "=ds=1000 #gold#" },
				{ 4, 95096, "", "=q4=Shoulders of Demonic Dreams", "=ds=#s3#, #a1#", "=ds=1000 #gold#" },
				{ 5, 95097, "", "=q4=Heartroot Shoulderguards", "=ds=#s3#, #a2#", "=ds=1000 #gold#" },
				{ 6, 95100, "", "=q4=Wallwalker Spaulders", "=ds=#s3#, #a2#", "=ds=1000 #gold#" },
				{ 7, 95099, "", "=q4=Lightning Strike Mantle", "=ds=#s3#, #a3#", "=ds=1000 #gold#" },
				{ 8, 95095, "", "=q4=Targetblinder Spaulders", "=ds=#s3#, #a3#", "=ds=1000 #gold#" },
				{ 9, 95104, "", "=q4=Shoulderguards of Potentiation", "=ds=#s3#, #a4#", "=ds=1000 #gold#" },
				{ 10, 95098, "", "=q4=Sightblinder Shoulderguards", "=ds=#s3#, #a4#", "=ds=1000 #gold#" },
				{ 11, 95103, "", "=q4=Sparksmasher Pauldrons", "=ds=#s3#, #a4#", "=ds=1000 #gold#" },
				{ 12, 97131, "", "=q3=Shado-Pan Assault Tabard", "=ds=#s7#", "=ds=10 #gold#" };
			};
		};
		info = {
			name = ALIL["Shado-Pan Assault"],
			module = moduleName, menu = "REPMENU",
		};
	}

		---------------------------
		--- Sunreaver Onslaught ---
		---------------------------

	AtlasLoot_Data["SunreaverOnslaught"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_reputation_kirintor_offensive", "=q6=#r2#", ""};
				{ 2, 80433, "", "=q3=Blood Spirit", "=ds=#e8#", "#VALOR:400#"};
				{ 3, 95487, "", "=q3=Sunreaver Onslaught Insignia", "=ds=", "#HISTORICALPARCHMENTS:1#"};
				{ 4, 95488, "", "=q3=Greater Sunreaver Onslaught Insignia", "=ds=", "#HISTORICALPARCHMENTS:10#"};
				{ 5, 97157, "", "=q1=Potion of Light Steps", "=ds=", "#ELDERCHARM:1#"};
				{ 6, 95568, "", "=q1=Sunreaver Beacon", "=ds=", "=ds=25 #gold#"};
				{ 8, 0, "achievement_faction_sunreaveronslaught", "=q6=#r3#", ""};
				{ 9, 95523, "", "=q4=Belt of Loa Charms", "=ds=#s10#, #a1#", "=ds=300 #gold#"};
				{ 10, 95518, "", "=q4=Pain-Binder Girdle", "=ds=#s10#, #a1#", "=ds=300 #gold#"};
				{ 11, 95517, "", "=q4=Shan'ze Scholar's Girdle", "=ds=#s10#, #a1#", "=ds=300 #gold#"};
				{ 12, 95521, "", "=q4=Cinch of the Dead Forest's Vigil", "=ds=#s10#, #a2#", "=ds=300 #gold#"};
				{ 13, 95519, "", "=q4=Skumblade-Tooth Girdle", "=ds=#s10#, #a2#", "=ds=300 #gold#"};
				{ 14, 95522, "", "=q4=Rotting Bog Cinch", "=ds=#s10#, #a3#", "=ds=300 #gold#"};
				{ 15, 95525, "", "=q4=Skumblade Ritualist Links", "=ds=#s10#, #a3#", "=ds=300 #gold#"};
				{ 16, 95520, "", "=q4=Girdle of Shan'ze Glory", "=ds=#s10#, #a4#", "=ds=300 #gold#"};
				{ 17, 95524, "", "=q4=Thunder Caressed Waistguard", "=ds=#s10#, #a4#", "=ds=300 #gold#"};
				{ 18, 97158, "", "=q1=A Common Rock", "=ds=", "#ELDERCHARM:1#"};
				{ 19, 97154, "", "=q1=Sleep Dust", "=ds=", "#ELDERCHARM:1#"};
				{ 21, 0, "achievement_faction_sunreaveronslaught", "=q6=#r4#", ""};
				{ 22, 95548, "", "=q7=Grand Commendation of the Sunreaver Onslaught", "=ds=", "=ds=45 #gold#"};
				{ 23, 97212, "", "=q4=Cloak of the Immortal Guardian", "=ds=#s4#", "#VALOR:937#" },
				{ 24, 97210, "", "=q4=Shan'ze Gravetender Cloak", "=ds=#s4#", "#VALOR:937#" },
				{ 25, 97211, "", "=q4=Shan'ze Partisan's Greatcloak", "=ds=#s4#", "#VALOR:937#" },
				{ 26, 97209, "", "=q4=Static-Collecting Cloak", "=ds=#s4#", "#VALOR:937#" },
				{ 27, 97208, "", "=q4=Thunder-Chaser Cloak", "=ds=#s4#", "#VALOR:937#" },
				{ 28, 97159, "", "=q1=Arcane Propellant", "=ds=", "#ELDERCHARM:1#"};
				{ 29, 97156, "", "=q1=Frost Rune Trap", "=ds=", "#ELDERCHARM:1#"};
			};
			{
				{ 1, 0, "achievement_faction_sunreaveronslaught", "=q6=#r5#", ""};
				{ 2, 95565, "", "=q4=Reins of the Crimson Primal Direhorn", "=ds=#e26#", "=ds=3000 #gold#"};
				{ 3, 97196, "", "=q4=Ancient Overlord's Onyx Band", "=ds=#s13#", "#VALOR:937#"};
				{ 4, 97194, "", "=q4=Ancient Primalist's Seal", "=ds=#s13#", "#VALOR:937#"};
				{ 5, 97192, "", "=q4=Refurbished Band of Jin", "=ds=#s13#", "#VALOR:937#"};
				{ 6, 97195, "", "=q4=Refurbished Seal of Jin", "=ds=#s13#", "#VALOR:937#"};
				{ 7, 97193, "", "=q4=Restored Hexxer's Signet", "=ds=#s13#", "#VALOR:937#"};
				{ 8, 95590, "", "=q3=Glorious Standard of the Sunreaver Onslaught", "=ds=", "=q1=#m4#: #QUESTID:32589#"};
				{ 9, 95592, "", "=q3=Sunreaver Onslaught Tabard", "=ds=#s7#", "=ds=10 #gold#"};
				{ 10, 97155, "", "=q1=Polymorphic Key", "=ds=", "#ELDERCHARM:3#"};
			};
		};
		info = {
			name = ALIL["Sunreaver Onslaught"],
			module = moduleName, menu = "REPMENU",
		};
	}

		-------------------
		--- The Tillers ---
		-------------------

	AtlasLoot_Data["Tillers"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_faction_tillers", "=q6=#r2#", ""};
				{ 2, 79102, "", "=q1=Green Cabbage Seeds", "=ds=", "=ds=15 #silver#"};
				{ 3, 89328, "", "=q1=Jade Squash Seeds", "=ds=", "=ds=15 #silver#"};
				{ 4, 80590, "", "=q1=Juicycrunch Carrot Seeds", "=ds=", "=ds=15 #silver#"};
				{ 5, 80592, "", "=q1=Mogu Pumpkin Seeds", "=ds=", "=ds=15 #silver#"};
				{ 6, 80594, "", "=q1=Pink Turnip Seeds", "=ds=", "=ds=15 #silver#"};
				{ 7, 80593, "", "=q1=Red Blossom Leek Seeds", "=ds=", "=ds=15 #silver#"};
				{ 8, 80591, "", "=q1=Scallion Seeds", "=ds=", "=ds=15 #silver#"};
				{ 9, 89329, "", "=q1=Striped Melon Seeds", "=ds=", "=ds=15 #silver#"};
				{ 10, 80595, "", "=q1=White Turnip Seeds", "=ds=", "=ds=15 #silver#"};
				{ 11, 89326, "", "=q1=Witchberry Seeds", "=ds=", "=ds=15 #silver#"};
				{ 13, 0, "achievement_faction_tillers", "=q6=#r3#", ""};
				{ 14, 85267, "", "=q2=Autumn Blossom Sapling", "=ds=", "=ds=10 #silver#"};
				{ 15, 89812, "", "=q1=\"Jinyu Princess\" Irrigation System", "=ds=#m2#", "=ds=94 #gold# 44 #silver# 44 #copper#"};
				{ 16, 0, "achievement_faction_tillers", "=q6=#r4#", ""};
				{ 17, 89869, "", "=q3=Pandaren Scarecrow", "=ds=", "=ds=236 #gold# 11 #silver# 11 #copper#"};
				{ 18, 85268, "", "=q2=Spring Blossom Sapling", "=ds=", "=ds=10 #silver#"};
				{ 19, 85216, "", "=q1=Enigma Seed", "=ds=", "=ds=1 #gold#"};
				{ 20, 85217, "", "=q1=Magebulb Seed", "=ds=", "=ds=1 #gold#"};
				{ 21, 89202, "", "=q1=Raptorleaf Seed", "=ds=", "=ds=1 #gold#"};
				{ 22, 85215, "", "=q1=Snakeroot Seed", "=ds=", "=ds=1 #gold#"};
				{ 23, 89233, "", "=q1=Songbell Seed", "=ds=", "=ds=1 #gold#"};
				{ 24, 89197, "", "=q1=Windshear Cactus Seed", "=ds=", "=ds=1 #gold#"};
				{ 25, 89813, "", "=q1=\"Thunder King\" Pest Repellers", "=ds=#m2#", "=ds=94 #gold# 44 #silver# 44 #copper#"};
				{ 26, 93226, "", "=q7=Grand Commendation of the Tillers", "=ds=", "=ds=45 #gold#"};
			};
			{
				{ 1, 0, "achievement_faction_tillers", "=q6=#r5#", ""};
				{ 2, 89391, "", "=q4=Reins of the Black Riding Goat", "=ds=#e26#", "=ds=1416 #gold# 66 #silver# 66 #copper#"};
				{ 3, 89362, "", "=q4=Reins of the Brown Riding Goat", "=ds=#e26#", "=ds=472 #gold# 22 #silver# 22 #copper#"};
				{ 4, 89390, "", "=q4=Reins of the White Riding Goat", "=ds=#e26#", "=ds=3069 #gold# 44 #silver# 44 #copper#"};
				{ 5, 90175, "", "=q3=Gin-Ji Knife Set", "=ds=#m20#", "=ds=236 #gold# 11 #silver# 11 #copper#"};
				{ 6, 80914, "", "=q3=Mourning Glory", "=ds=#m20#", "=ds=118 #gold# 5 #silver# 55 #copper#"};
				{ 7, 89784, "", "=q3=Tillers Tabard", "=ds=#s7#", "=ds=9 #gold# 44 #silver# 44 #copper#"};
				{ 8, 74657, "", "=q2=Recipe: Spicy Salmon", "=ds=#p3# (500)", "=ds=94 #silver# 44 #copper#"};
				{ 9, 74658, "", "=q2=Recipe: Spicy Vegetable Chips", "=ds=#p3# (500)", "=ds=94 #silver# 44 #copper#"};
				{ 10, 85269, "", "=q2=Winter Blossom Sapling", "=ds=", "=ds=10 #silver#"};
				{ 11, 89814, "", "=q1=\"Earth-Slasher\" Master Plow", "=ds=#m2#", "=ds=94 #gold# 44 #silver# 44 #copper#"};
				{ 16, 0, "achievement_faction_tillers", "=q6="..ALIL["Old Hillpaw"], "=q5="..AL["Best Friend"]};
				{ 17, 90893, "", "=q1=Straw Hat", "=ds=#s1#, #a1#", ""};
				{ 18, 90894, "", "=q1=Straw Hat", "=ds=#s1#, #a2#", ""};
				{ 19, 90895, "", "=q1=Straw Hat", "=ds=#s1#, #a3#", ""};
				{ 20, 90896, "", "=q1=Straw Hat", "=ds=#s1#, #a4#", ""};
				{ 22, 0, "achievement_faction_tillers", "=q6="..ALIL["Sho"], "=q5="..AL["Best Friend"]};
				{ 23, 85222, "", "=q3=Red Cricket", "=ds=#e13#", ""};
			};
		};
		info = {
			name = ALIL["The Tillers"],
			module = moduleName, menu = "REPMENU",
		};
	}

		------------------------
		--- Domination Point ---
		------------------------

	AtlasLoot_Data["DominationPoint"] = {
		["Normal"] = {
			{
				{ 1, 91819, "", "=q1=Sturdy Crane Snare", "=ds=", "#LIONSLANDINGCOMMISSION:30#"},
				{ 2, 91821, "", "=q1=Sturdy Tiger Trap", "=ds=", "#LIONSLANDINGCOMMISSION:30#"},
				{ 3, 91822, "", "=q1=Sturdy Crab Crate", "=ds=", "#LIONSLANDINGCOMMISSION:30#"},
				{ 4, 92058, "", "=q1=Portal Fuel: Shrine of Two Moons", "=ds=", "#LIONSLANDINGCOMMISSION:5#"},
				{ 5, 92057, "", "=q1=Portal Fuel: Orgrimmar", "=ds=", "#LIONSLANDINGCOMMISSION:5#"},
				{ 6, 92056, "", "=q1=Portal Fuel: Sparkrocket Outpost", "=ds=", "#LIONSLANDINGCOMMISSION:5#"},
				{ 7, 92049, "", "=q1=Mercenary Contract: Mage", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 8, 92053, "", "=q1=Mercenary Contract: Warrior", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 9, 92052, "", "=q1=Mercenary Contract: Druid", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 10, 92051, "", "=q1=Mercenary Contract: Priest", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 11, 92050, "", "=q1=Mercenary Contract: Paladin", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 12, 92055, "", "=q1=Mercenary Contract: Shaman", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 13, 92054, "", "=q1=Mercenary Contract: Rogue", "=ds=", "#LIONSLANDINGCOMMISSION:10#"},
				{ 14, 92059, "", "=q1=Domination Point Banquet", "=ds=", "#LIONSLANDINGCOMMISSION:30#"},
				{ 15, 92663, "", "=q1=Guard Contract: Outpost", "=ds=", "#LIONSLANDINGCOMMISSION:40#"},
				{ 16, 92421, "", "=q1=Guard Contract: Graveyard", "=ds=", "#LIONSLANDINGCOMMISSION:60#"},
				{ 17, 92422, "", "=q1=Guard Contract: Tower", "=ds=", "#LIONSLANDINGCOMMISSION:80#"},
				{ 18, 92526, "", "=q1=Crate of Horde Banners", "=ds=", "#LIONSLANDINGCOMMISSION:25#"},
				{ 19, 92530, "", "=q1=Box of Overridden Excavationbots", "=ds=", "#LIONSLANDINGCOMMISSION:125#"},
				{ 20, 92528, "", "=q1=Obelisk of Deception", "=ds=", "#LIONSLANDINGCOMMISSION:500#"},
				{ 21, 92527, "", "=q1=Rodent Crate", "=ds=", "#LIONSLANDINGCOMMISSION:2000#"},
			};
		};
		info = {
			name = ALIL["Domination Point"],
			module = moduleName, menu = "REPMENU",
		};
	}

		----------------------
		--- Lion's Landing ---
		----------------------

	AtlasLoot_Data["LionsLanding"] = {
		["Normal"] = {
			{
				{ 1, 91854, "", "=q1=Sturdy Crane Snare", "=ds=", "#DOMINATIONCOMMISSION:30#"},
				{ 2, 91855, "", "=q1=Sturdy Tiger Trap", "=ds=", "#DOMINATIONCOMMISSION:30#"},
				{ 3, 91856, "", "=q1=Sturdy Crab Crate", "=ds=", "#DOMINATIONCOMMISSION:30#"},
				{ 4, 92432, "", "=q1=Portal Reagents: Skyfire", "=ds=", "#DOMINATIONCOMMISSION:5#"},
				{ 5, 92430, "", "=q1=Portal Reagents: Shrine of Seven Stars", "=ds=", "#DOMINATIONCOMMISSION:5#"},
				{ 6, 92431, "", "=q1=Portal Reagents: Stormwind", "=ds=", "#DOMINATIONCOMMISSION:5#"},
				{ 7, 92439, "", "=q1=Mercenary Contract: Mage", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 8, 92435, "", "=q1=Mercenary Contract: Warrior", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 9, 92436, "", "=q1=Mercenary Contract: Druid", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 10, 92437, "", "=q1=Mercenary Contract: Priest", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 11, 92438, "", "=q1=Mercenary Contract: Paladin", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 12, 92433, "", "=q1=Mercenary Contract: Shaman", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 13, 92434, "", "=q1=Mercenary Contract: Rogue", "=ds=", "#DOMINATIONCOMMISSION:10#"},
				{ 14, 92429, "", "=q1=Lion's Landing Banquet", "=ds=", "#DOMINATIONCOMMISSION:30#"},
				{ 15, 92664, "", "=q1=Guard Contract: Outpost", "=ds=", "#DOMINATIONCOMMISSION:40#"},
				{ 16, 92428, "", "=q1=Guard Contract: Graveyard", "=ds=", "#DOMINATIONCOMMISSION:60#"},
				{ 17, 92427, "", "=q1=Guard Contract: Tower", "=ds=", "#DOMINATIONCOMMISSION:80#"},
				{ 18, 92531, "", "=q1=Crate of Alliance Banners", "=ds=", "#DOMINATIONCOMMISSION:25#"},
				{ 19, 92535, "", "=q1=Box of Overridden Excavationbots", "=ds=", "#DOMINATIONCOMMISSION:125#"},
				{ 20, 92533, "", "=q1=Obelisk of Deception", "=ds=", "#DOMINATIONCOMMISSION:500#" },
				{ 21, 92532, "", "=q1=Rodent Crate", "=ds=", "#DOMINATIONCOMMISSION:2000#"},
			};
		};
		info = {
			name = ALIL["Lion's Landing"],
			module = moduleName, menu = "REPMENU",
		};
	}

	-----------
	--- PvP ---
	-----------

		----------------------
		--- PvP Armor Sets ---
		----------------------

	AtlasLoot_Data["PVP90DeathKnight"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_deathknight_classicon", "=q6=#arenas10#", "=q5="};
				{ 9, 91151, "", "=q4=Tyrannical Gladiator's Dreadplate Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91155, "", "=q4=Tyrannical Gladiator's Dreadplate Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91147, "", "=q4=Tyrannical Gladiator's Dreadplate Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91149, "", "=q4=Tyrannical Gladiator's Dreadplate Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91153, "", "=q4=Tyrannical Gladiator's Dreadplate Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_deathknight_classicon", "=q6=#arenas10#", "=q5="};
				{ 9, 94429, "", "=q4=Tyrannical Gladiator's Dreadplate Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94366, "", "=q4=Tyrannical Gladiator's Dreadplate Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94392, "", "=q4=Tyrannical Gladiator's Dreadplate Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94364, "", "=q4=Tyrannical Gladiator's Dreadplate Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94365, "", "=q4=Tyrannical Gladiator's Dreadplate Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_deathknight_classicon", "=q6=#arenas10#", "=q5="};
				{ 2, 91152, "", "=q4=Tyrannical Gladiator's Dreadplate Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91156, "", "=q4=Tyrannical Gladiator's Dreadplate Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91148, "", "=q4=Tyrannical Gladiator's Dreadplate Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91150, "", "=q4=Tyrannical Gladiator's Dreadplate Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91154, "", "=q4=Tyrannical Gladiator's Dreadplate Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_deathknight_classicon", "=q6=#arenas10#", "=q5="};
				{ 17, 91504, "", "=q4=Malevolent Gladiator's Dreadplate Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91508, "", "=q4=Malevolent Gladiator's Dreadplate Shoulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91500, "", "=q4=Malevolent Gladiator's Dreadplate Chestpiece", "=ds=", "#HONOR:2250#"};
				{ 20, 91502, "", "=q4=Malevolent Gladiator's Dreadplate Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91506, "", "=q4=Malevolent Gladiator's Dreadplate Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_deathknight_classicon", "=q6=#arenas10#", "=q5="};
				{ 24, 93455, "", "=q3=Crafted Dreadful Gladiator's Dreadplate Helm", "=ds="};
				{ 25, 93457, "", "=q3=Crafted Dreadful Gladiator's Dreadplate Shoulders", "=ds="};
				{ 26, 93453, "", "=q3=Crafted Dreadful Gladiator's Dreadplate Chestpiece", "=ds="};
				{ 27, 93454, "", "=q3=Crafted Dreadful Gladiator's Dreadplate Gauntlets", "=ds="};
				{ 28, 93456, "", "=q3=Crafted Dreadful Gladiator's Dreadplate Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90DruidBalance"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_nature_starfall", "=q6=#arenas1_2#", "=q5="};
				{ 9, 91191, "", "=q4=Tyrannical Gladiator's Wyrmhide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91197, "", "=q4=Tyrannical Gladiator's Wyrmhide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91195, "", "=q4=Tyrannical Gladiator's Wyrmhide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91189, "", "=q4=Tyrannical Gladiator's Wyrmhide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91193, "", "=q4=Tyrannical Gladiator's Wyrmhide Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_nature_starfall", "=q6=#arenas1_2#", "=q5="};
				{ 9, 94347, "", "=q4=Tyrannical Gladiator's Wyrmhide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94416, "", "=q4=Tyrannical Gladiator's Wyrmhide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94327, "", "=q4=Tyrannical Gladiator's Wyrmhide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94412, "", "=q4=Tyrannical Gladiator's Wyrmhide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94483, "", "=q4=Tyrannical Gladiator's Wyrmhide Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_starfall", "=q6=#arenas1_2#", "=q5="};
				{ 2, 91192, "", "=q4=Tyrannical Gladiator's Wyrmhide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91198, "", "=q4=Tyrannical Gladiator's Wyrmhide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91196, "", "=q4=Tyrannical Gladiator's Wyrmhide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91190, "", "=q4=Tyrannical Gladiator's Wyrmhide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91194, "", "=q4=Tyrannical Gladiator's Wyrmhide Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_nature_starfall", "=q6=#arenas1_2#", "=q5="};
				{ 17, 91544, "", "=q4=Malevolent Gladiator's Wyrmhide Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91550, "", "=q4=Malevolent Gladiator's Wyrmhide Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91548, "", "=q4=Malevolent Gladiator's Wyrmhide Robes", "=ds=", "#HONOR:2250#"};
				{ 20, 91542, "", "=q4=Malevolent Gladiator's Wyrmhide Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91546, "", "=q4=Malevolent Gladiator's Wyrmhide Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_nature_starfall", "=q6=#arenas1_2#", "=q5="};
				{ 24, 93476, "", "=q3=Crafted Dreadful Gladiator's Wyrmhide Helm", "=ds="};
				{ 25, 93479, "", "=q3=Crafted Dreadful Gladiator's Wyrmhide Spaulders", "=ds="};
				{ 26, 93478, "", "=q3=Crafted Dreadful Gladiator's Wyrmhide Robes", "=ds="};
				{ 27, 93475, "", "=q3=Crafted Dreadful Gladiator's Wyrmhide Gloves", "=ds="};
				{ 28, 93477, "", "=q3=Crafted Dreadful Gladiator's Wyrmhide Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Balance"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90DruidFeral"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "ability_druid_catform", "=q6=#arenas1_1#", "=q5="};
				{ 9, 91159, "", "=q4=Tyrannical Gladiator's Dragonhide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91165, "", "=q4=Tyrannical Gladiator's Dragonhide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91163, "", "=q4=Tyrannical Gladiator's Dragonhide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91157, "", "=q4=Tyrannical Gladiator's Dragonhide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91161, "", "=q4=Tyrannical Gladiator's Dragonhide Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "ability_druid_catform", "=q6=#arenas1_1#", "=q5="};
				{ 9, 94367, "", "=q4=Tyrannical Gladiator's Dragonhide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94457, "", "=q4=Tyrannical Gladiator's Dragonhide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94456, "", "=q4=Tyrannical Gladiator's Dragonhide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94455, "", "=q4=Tyrannical Gladiator's Dragonhide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94368, "", "=q4=Tyrannical Gladiator's Dragonhide Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "ability_druid_catform", "=q6=#arenas1_1#", "=q5="};
				{ 2, 91160, "", "=q4=Tyrannical Gladiator's Dragonhide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91166, "", "=q4=Tyrannical Gladiator's Dragonhide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91164, "", "=q4=Tyrannical Gladiator's Dragonhide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91158, "", "=q4=Tyrannical Gladiator's Dragonhide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91162, "", "=q4=Tyrannical Gladiator's Dragonhide Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "ability_druid_catform", "=q6=#arenas1_1#", "=q5="};
				{ 17, 91512, "", "=q4=Malevolent Gladiator's Dragonhide Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91518, "", "=q4=Malevolent Gladiator's Dragonhide Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91516, "", "=q4=Malevolent Gladiator's Dragonhide Robes", "=ds=", "#HONOR:2250#"};
				{ 20, 91510, "", "=q4=Malevolent Gladiator's Dragonhide Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91514, "", "=q4=Malevolent Gladiator's Dragonhide Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "ability_druid_catform", "=q6=#arenas1_1#", "=q5="};
				{ 24, 93459, "", "=q3=Crafted Dreadful Gladiator's Dragonhide Helm", "=ds="};
				{ 25, 93462, "", "=q3=Crafted Dreadful Gladiator's Dragonhide Spaulders", "=ds="};
				{ 26, 93461, "", "=q3=Crafted Dreadful Gladiator's Dragonhide Robes", "=ds="};
				{ 27, 93458, "", "=q3=Crafted Dreadful Gladiator's Dragonhide Gloves", "=ds="};
				{ 28, 93460, "", "=q3=Crafted Dreadful Gladiator's Dragonhide Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Feral"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90DruidRestoration"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_nature_healingtouch", "=q6=#arenas1_3#", "=q5="};
				{ 9, 91174, "", "=q4=Tyrannical Gladiator's Kodohide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91180, "", "=q4=Tyrannical Gladiator's Kodohide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91178, "", "=q4=Tyrannical Gladiator's Kodohide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91172, "", "=q4=Tyrannical Gladiator's Kodohide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91176, "", "=q4=Tyrannical Gladiator's Kodohide Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_nature_healingtouch", "=q6=#arenas1_3#", "=q5="};
				{ 9, 94492, "", "=q4=Tyrannical Gladiator's Kodohide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94372, "", "=q4=Tyrannical Gladiator's Kodohide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94437, "", "=q4=Tyrannical Gladiator's Kodohide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94371, "", "=q4=Tyrannical Gladiator's Kodohide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94477, "", "=q4=Tyrannical Gladiator's Kodohide Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_healingtouch", "=q6=#arenas1_3#", "=q5="};
				{ 2, 91175, "", "=q4=Tyrannical Gladiator's Kodohide Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91181, "", "=q4=Tyrannical Gladiator's Kodohide Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91179, "", "=q4=Tyrannical Gladiator's Kodohide Robes", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91173, "", "=q4=Tyrannical Gladiator's Kodohide Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91177, "", "=q4=Tyrannical Gladiator's Kodohide Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_nature_healingtouch", "=q6=#arenas1_3#", "=q5="};
				{ 17, 91527, "", "=q4=Malevolent Gladiator's Kodohide Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91533, "", "=q4=Malevolent Gladiator's Kodohide Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91531, "", "=q4=Malevolent Gladiator's Kodohide Robes", "=ds=", "#HONOR:2250#"};
				{ 20, 91525, "", "=q4=Malevolent Gladiator's Kodohide Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91529, "", "=q4=Malevolent Gladiator's Kodohide Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_nature_healingtouch", "=q6=#arenas1_3#", "=q5="};
				{ 24, 93467, "", "=q3=Crafted Dreadful Gladiator's Kodohide Helm", "=ds="};
				{ 25, 93469, "", "=q3=Crafted Dreadful Gladiator's Kodohide Spaulders", "=ds="};
				{ 26, 93470, "", "=q3=Crafted Dreadful Gladiator's Kodohide Robes", "=ds="};
				{ 27, 93466, "", "=q3=Crafted Dreadful Gladiator's Kodohide Gloves", "=ds="};
				{ 28, 93468, "", "=q3=Crafted Dreadful Gladiator's Kodohide Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Restoration"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90Hunter"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "inv_weapon_bow_07", "=q6=#arenas2#", "=q5="};
				{ 9, 91226, "", "=q4=Tyrannical Gladiator's Chain Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91230, "", "=q4=Tyrannical Gladiator's Chain Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91222, "", "=q4=Tyrannical Gladiator's Chain Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91224, "", "=q4=Tyrannical Gladiator's Chain Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91228, "", "=q4=Tyrannical Gladiator's Chain Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "inv_weapon_bow_07", "=q6=#arenas2#", "=q5="};
				{ 9, 94406, "", "=q4=Tyrannical Gladiator's Chain Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94450, "", "=q4=Tyrannical Gladiator's Chain Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94405, "", "=q4=Tyrannical Gladiator's Chain Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94453, "", "=q4=Tyrannical Gladiator's Chain Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94384, "", "=q4=Tyrannical Gladiator's Chain Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "inv_weapon_bow_07", "=q6=#arenas2#", "=q5="};
				{ 2, 91227, "", "=q4=Tyrannical Gladiator's Chain Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91231, "", "=q4=Tyrannical Gladiator's Chain Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91223, "", "=q4=Tyrannical Gladiator's Chain Armor", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91225, "", "=q4=Tyrannical Gladiator's Chain Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91229, "", "=q4=Tyrannical Gladiator's Chain Leggings", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "inv_weapon_bow_07", "=q6=#arenas2#", "=q5="};
				{ 17, 91579, "", "=q4=Malevolent Gladiator's Chain Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91583, "", "=q4=Malevolent Gladiator's Chain Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91575, "", "=q4=Malevolent Gladiator's Chain Armor", "=ds=", "#HONOR:2250#"};
				{ 20, 91577, "", "=q4=Malevolent Gladiator's Chain Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91581, "", "=q4=Malevolent Gladiator's Chain Leggings", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "inv_weapon_bow_07", "=q6=#arenas2#", "=q5="};
				{ 24, 93496, "", "=q3=Crafted Dreadful Gladiator's Chain Helm", "=ds="};
				{ 25, 93498, "", "=q3=Crafted Dreadful Gladiator's Chain Spaulders", "=ds="};
				{ 26, 93494, "", "=q3=Crafted Dreadful Gladiator's Chain Armor", "=ds="};
				{ 27, 93495, "", "=q3=Crafted Dreadful Gladiator's Chain Gauntlets", "=ds="};
				{ 28, 93497, "", "=q3=Crafted Dreadful Gladiator's Chain Leggings", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90Mage"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "inv_staff_13", "=q6=#arenas3#", "=q5="};
				{ 9, 91234, "", "=q4=Tyrannical Gladiator's Silk Cowl", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91240, "", "=q4=Tyrannical Gladiator's Silk Amice", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91238, "", "=q4=Tyrannical Gladiator's Silk Robe", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91232, "", "=q4=Tyrannical Gladiator's Silk Handguards", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91236, "", "=q4=Tyrannical Gladiator's Silk Trousers", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "inv_staff_13", "=q6=#arenas3#", "=q5="};
				{ 9, 94381, "", "=q4=Tyrannical Gladiator's Silk Cowl", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94389, "", "=q4=Tyrannical Gladiator's Silk Amice", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94431, "", "=q4=Tyrannical Gladiator's Silk Robe", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94451, "", "=q4=Tyrannical Gladiator's Silk Handguards", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94362, "", "=q4=Tyrannical Gladiator's Silk Trousers", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "inv_staff_13", "=q6=#arenas3#", "=q5="};
				{ 2, 91235, "", "=q4=Tyrannical Gladiator's Silk Cowl", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91241, "", "=q4=Tyrannical Gladiator's Silk Amice", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91239, "", "=q4=Tyrannical Gladiator's Silk Robe", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91233, "", "=q4=Tyrannical Gladiator's Silk Handguards", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91237, "", "=q4=Tyrannical Gladiator's Silk Trousers", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "inv_staff_13", "=q6=#arenas3#", "=q5="};
				{ 17, 91587, "", "=q4=Malevolent Gladiator's Silk Cowl", "=ds=", "#HONOR:2250#"};
				{ 18, 91593, "", "=q4=Malevolent Gladiator's Silk Amice", "=ds=", "#HONOR:1750#"};
				{ 19, 91591, "", "=q4=Malevolent Gladiator's Silk Robe", "=ds=", "#HONOR:2250#"};
				{ 20, 91585, "", "=q4=Malevolent Gladiator's Silk Handguards", "=ds=", "#HONOR:1750#"};
				{ 21, 91589, "", "=q4=Malevolent Gladiator's Silk Trousers", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "inv_staff_13", "=q6=#arenas3#", "=q5="};
				{ 24, 93500, "", "=q3=Crafted Dreadful Gladiator's Silk Cowl", "=ds="};
				{ 25, 93503, "", "=q3=Crafted Dreadful Gladiator's Silk Amice", "=ds="};
				{ 26, 93502, "", "=q3=Crafted Dreadful Gladiator's Silk Robe", "=ds="};
				{ 27, 93499, "", "=q3=Crafted Dreadful Gladiator's Silk Handguards", "=ds="};
				{ 28, 93501, "", "=q3=Crafted Dreadful Gladiator's Silk Trousers", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90MonkHealer"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_monk_mistweaver_spec", "=q6=#arenas11_2#", "=q5="};
				{ 9, 91259, "", "=q4=Tyrannical Gladiator's Copperskin Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91263, "", "=q4=Tyrannical Gladiator's Copperskin Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91265, "", "=q4=Tyrannical Gladiator's Copperskin Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91257, "", "=q4=Tyrannical Gladiator's Copperskin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91261, "", "=q4=Tyrannical Gladiator's Copperskin Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_monk_mistweaver_spec", "=q6=#arenas11_2#", "=q5="};
				{ 9, 94341, "", "=q4=Tyrannical Gladiator's Copperskin Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94493, "", "=q4=Tyrannical Gladiator's Copperskin Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94479, "", "=q4=Tyrannical Gladiator's Copperskin Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94340, "", "=q4=Tyrannical Gladiator's Copperskin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94478, "", "=q4=Tyrannical Gladiator's Copperskin Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_mistweaver_spec", "=q6=#arenas11_2#", "=q5="};
				{ 2, 91260, "", "=q4=Tyrannical Gladiator's Copperskin Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91264, "", "=q4=Tyrannical Gladiator's Copperskin Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91266, "", "=q4=Tyrannical Gladiator's Copperskin Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91258, "", "=q4=Tyrannical Gladiator's Copperskin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91262, "", "=q4=Tyrannical Gladiator's Copperskin Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_monk_mistweaver_spec", "=q6=#arenas11_2#", "=q5="};
				{ 17, 91612, "", "=q4=Malevolent Gladiator's Copperskin Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91616, "", "=q4=Malevolent Gladiator's Copperskin Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91618, "", "=q4=Malevolent Gladiator's Copperskin Tunic", "=ds=", "#HONOR:2250#"};
				{ 20, 91610, "", "=q4=Malevolent Gladiator's Copperskin Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91614, "", "=q4=Malevolent Gladiator's Copperskin Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_monk_mistweaver_spec", "=q6=#arenas11_2#", "=q5="};
				{ 24, 93519, "", "=q3=Crafted Dreadful Gladiator's Copperskin Helm", "=ds="};
				{ 25, 93523, "", "=q3=Crafted Dreadful Gladiator's Copperskin Spaulders", "=ds="};
				{ 26, 93525, "", "=q3=Crafted Dreadful Gladiator's Copperskin Tunic", "=ds="};
				{ 27, 93517, "", "=q3=Crafted Dreadful Gladiator's Copperskin Gloves", "=ds="};
				{ 28, 93521, "", "=q3=Crafted Dreadful Gladiator's Copperskin Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90MonkDPS"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_monk_windwalker_spec", "=q6=#arenas11_1#", "=q5="};
				{ 9, 91249, "", "=q4=Tyrannical Gladiator's Ironskin Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91253, "", "=q4=Tyrannical Gladiator's Ironskin Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91255, "", "=q4=Tyrannical Gladiator's Ironskin Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91247, "", "=q4=Tyrannical Gladiator's Ironskin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91251, "", "=q4=Tyrannical Gladiator's Ironskin Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_monk_windwalker_spec", "=q6=#arenas11_1#", "=q5="};
				{ 9, 94428, "", "=q4=Tyrannical Gladiator's Ironskin Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94339, "", "=q4=Tyrannical Gladiator's Ironskin Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94436, "", "=q4=Tyrannical Gladiator's Ironskin Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94391, "", "=q4=Tyrannical Gladiator's Ironskin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94370, "", "=q4=Tyrannical Gladiator's Ironskin Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_windwalker_spec", "=q6=#arenas11_1#", "=q5="};
				{ 2, 91250, "", "=q4=Tyrannical Gladiator's Ironskin Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91254, "", "=q4=Tyrannical Gladiator's Ironskin Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91256, "", "=q4=Tyrannical Gladiator's Ironskin Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91248, "", "=q4=Tyrannical Gladiator's Ironskin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91252, "", "=q4=Tyrannical Gladiator's Ironskin Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_monk_windwalker_spec", "=q6=#arenas11_1#", "=q5="};
				{ 17, 91602, "", "=q4=Malevolent Gladiator's Ironskin Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91606, "", "=q4=Malevolent Gladiator's Ironskin Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91608, "", "=q4=Malevolent Gladiator's Ironskin Tunic", "=ds=", "#HONOR:2250#"};
				{ 20, 91600, "", "=q4=Malevolent Gladiator's Ironskin Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91604, "", "=q4=Malevolent Gladiator's Ironskin Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_monk_windwalker_spec", "=q6=#arenas11_1#", "=q5="};
				{ 24, 93509, "", "=q3=Crafted Dreadful Gladiator's Ironskin Helm", "=ds="};
				{ 25, 93513, "", "=q3=Crafted Dreadful Gladiator's Ironskin Spaulders", "=ds="};
				{ 26, 93515, "", "=q3=Crafted Dreadful Gladiator's Ironskin Tunic", "=ds="};
				{ 27, 93507, "", "=q3=Crafted Dreadful Gladiator's Ironskin Gloves", "=ds="};
				{ 28, 93511, "", "=q3=Crafted Dreadful Gladiator's Ironskin Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90PaladinRetribution"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q5="};
				{ 9, 91271, "", "=q4=Tyrannical Gladiator's Scaled Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91275, "", "=q4=Tyrannical Gladiator's Scaled Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91267, "", "=q4=Tyrannical Gladiator's Scaled Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91269, "", "=q4=Tyrannical Gladiator's Scaled Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91273, "", "=q4=Tyrannical Gladiator's Scaled Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q5="};
				{ 9, 94495, "", "=q4=Tyrannical Gladiator's Scaled Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94460, "", "=q4=Tyrannical Gladiator's Scaled Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94463, "", "=q4=Tyrannical Gladiator's Scaled Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94343, "", "=q4=Tyrannical Gladiator's Scaled Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94496, "", "=q4=Tyrannical Gladiator's Scaled Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q5="};
				{ 2, 91272, "", "=q4=Tyrannical Gladiator's Scaled Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91276, "", "=q4=Tyrannical Gladiator's Scaled Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91268, "", "=q4=Tyrannical Gladiator's Scaled Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91270, "", "=q4=Tyrannical Gladiator's Scaled Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91274, "", "=q4=Tyrannical Gladiator's Scaled Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q5="};
				{ 17, 91624, "", "=q4=Malevolent Gladiator's Scaled Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91628, "", "=q4=Malevolent Gladiator's Scaled Shoulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91620, "", "=q4=Malevolent Gladiator's Scaled Chestpiece", "=ds=", "#HONOR:2250#"};
				{ 20, 91622, "", "=q4=Malevolent Gladiator's Scaled Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91626, "", "=q4=Malevolent Gladiator's Scaled Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q5="};
				{ 24, 93529, "", "=q3=Crafted Dreadful Gladiator's Scaled Helm", "=ds="};
				{ 25, 93531, "", "=q3=Crafted Dreadful Gladiator's Scaled Shoulders", "=ds="};
				{ 26, 93527, "", "=q3=Crafted Dreadful Gladiator's Scaled Chestpiece", "=ds="};
				{ 27, 93528, "", "=q3=Crafted Dreadful Gladiator's Scaled Gauntlets", "=ds="};
				{ 28, 93530, "", "=q3=Crafted Dreadful Gladiator's Scaled Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Retribution"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90PaladinHoly"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q5="};
				{ 9, 91291, "", "=q4=Tyrannical Gladiator's Ornamented Headcover", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91295, "", "=q4=Tyrannical Gladiator's Ornamented Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91287, "", "=q4=Tyrannical Gladiator's Ornamented Chestguard", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91289, "", "=q4=Tyrannical Gladiator's Ornamented Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91293, "", "=q4=Tyrannical Gladiator's Ornamented Legplates", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q5="};
				{ 9, 94348, "", "=q4=Tyrannical Gladiator's Ornamented Headcover", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94413, "", "=q4=Tyrannical Gladiator's Ornamented Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94345, "", "=q4=Tyrannical Gladiator's Ornamented Chestguard", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94438, "", "=q4=Tyrannical Gladiator's Ornamented Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94484, "", "=q4=Tyrannical Gladiator's Ornamented Legplates", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q5="};
				{ 2, 91292, "", "=q4=Tyrannical Gladiator's Ornamented Headcover", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91296, "", "=q4=Tyrannical Gladiator's Ornamented Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91288, "", "=q4=Tyrannical Gladiator's Ornamented Chestguard", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91290, "", "=q4=Tyrannical Gladiator's Ornamented Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91294, "", "=q4=Tyrannical Gladiator's Ornamented Legplates", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q5="};
				{ 17, 91644, "", "=q4=Malevolent Gladiator's Ornamented Headcover", "=ds=", "#HONOR:2250#"};
				{ 18, 91648, "", "=q4=Malevolent Gladiator's Ornamented Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91640, "", "=q4=Malevolent Gladiator's Ornamented Chestguard", "=ds=", "#HONOR:2250#"};
				{ 20, 91642, "", "=q4=Malevolent Gladiator's Ornamented Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91646, "", "=q4=Malevolent Gladiator's Ornamented Legplates", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q5="};
				{ 24, 93540, "", "=q3=Crafted Dreadful Gladiator's Ornamented Headcover", "=ds="};
				{ 25, 93542, "", "=q3=Crafted Dreadful Gladiator's Ornamented Spaulders", "=ds="};
				{ 26, 93538, "", "=q3=Crafted Dreadful Gladiator's Ornamented Chestguard", "=ds="};
				{ 27, 93539, "", "=q3=Crafted Dreadful Gladiator's Ornamented Gloves", "=ds="};
				{ 28, 93541, "", "=q3=Crafted Dreadful Gladiator's Ornamented Legplates", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Holy"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90PriestShadow"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_shadow_shadowwordpain", "=q6=#arenas5_1#", "=q5="};
				{ 9, 91321, "", "=q4=Tyrannical Gladiator's Satin Hood", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91327, "", "=q4=Tyrannical Gladiator's Satin Mantle", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91325, "", "=q4=Tyrannical Gladiator's Satin Robe", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91319, "", "=q4=Tyrannical Gladiator's Satin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91323, "", "=q4=Tyrannical Gladiator's Satin Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_shadow_shadowwordpain", "=q6=#arenas5_1#", "=q5="};
				{ 9, 94467, "", "=q4=Tyrannical Gladiator's Satin Hood", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94385, "", "=q4=Tyrannical Gladiator's Satin Mantle", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94335, "", "=q4=Tyrannical Gladiator's Satin Robe", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94423, "", "=q4=Tyrannical Gladiator's Satin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94334, "", "=q4=Tyrannical Gladiator's Satin Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_shadow_shadowwordpain", "=q6=#arenas5_1#", "=q5="};
				{ 2, 91322, "", "=q4=Tyrannical Gladiator's Satin Hood", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91328, "", "=q4=Tyrannical Gladiator's Satin Mantle", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91326, "", "=q4=Tyrannical Gladiator's Satin Robe", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91320, "", "=q4=Tyrannical Gladiator's Satin Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91324, "", "=q4=Tyrannical Gladiator's Satin Leggings", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_shadow_shadowwordpain", "=q6=#arenas5_1#", "=q5="};
				{ 17, 91674, "", "=q4=Malevolent Gladiator's Satin Hood", "=ds=", "#HONOR:2250#"};
				{ 18, 91680, "", "=q4=Malevolent Gladiator's Satin Mantle", "=ds=", "#HONOR:1750#"};
				{ 19, 91678, "", "=q4=Malevolent Gladiator's Satin Robe", "=ds=", "#HONOR:2250#"};
				{ 20, 91672, "", "=q4=Malevolent Gladiator's Satin Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91676, "", "=q4=Malevolent Gladiator's Satin Leggings", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_shadow_shadowwordpain", "=q6=#arenas5_1#", "=q5="};
				{ 24, 93556, "", "=q3=Crafted Dreadful Gladiator's Satin Hood", "=ds="};
				{ 25, 93558, "", "=q3=Crafted Dreadful Gladiator's Satin Mantle", "=ds="};
				{ 26, 93559, "", "=q3=Crafted Dreadful Gladiator's Satin Robe", "=ds="};
				{ 27, 93555, "", "=q3=Crafted Dreadful Gladiator's Satin Gloves", "=ds="};
				{ 28, 93557, "", "=q3=Crafted Dreadful Gladiator's Satin Leggings", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90PriestHoly"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_holy_powerwordshield", "=q6=#arenas5_2#", "=q5="};
				{ 9, 91311, "", "=q4=Tyrannical Gladiator's Mooncloth Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91310, "", "=q4=Tyrannical Gladiator's Mooncloth Mantle", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91315, "", "=q4=Tyrannical Gladiator's Mooncloth Robe", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91317, "", "=q4=Tyrannical Gladiator's Mooncloth Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91313, "", "=q4=Tyrannical Gladiator's Mooncloth Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_holy_powerwordshield", "=q6=#arenas5_2#", "=q5="};
				{ 9, 94419, "", "=q4=Tyrannical Gladiator's Mooncloth Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94466, "", "=q4=Tyrannical Gladiator's Mooncloth Mantle", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94397, "", "=q4=Tyrannical Gladiator's Mooncloth Robe", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94328, "", "=q4=Tyrannical Gladiator's Mooncloth Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94420, "", "=q4=Tyrannical Gladiator's Mooncloth Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_holy_powerwordshield", "=q6=#arenas5_2#", "=q5="};
				{ 2, 91312, "", "=q4=Tyrannical Gladiator's Mooncloth Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91318, "", "=q4=Tyrannical Gladiator's Mooncloth Mantle", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91316, "", "=q4=Tyrannical Gladiator's Mooncloth Robe", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91310, "", "=q4=Tyrannical Gladiator's Mooncloth Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91314, "", "=q4=Tyrannical Gladiator's Mooncloth Leggings", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_holy_powerwordshield", "=q6=#arenas5_2#", "=q5="};
				{ 17, 91664, "", "=q4=Malevolent Gladiator's Mooncloth Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91670, "", "=q4=Malevolent Gladiator's Mooncloth Mantle", "=ds=", "#HONOR:1750#"};
				{ 19, 91668, "", "=q4=Malevolent Gladiator's Mooncloth Robe", "=ds=", "#HONOR:2250#"};
				{ 20, 91662, "", "=q4=Malevolent Gladiator's Mooncloth Gloves", "=ds=", "#HONOR:1750#"};
				{ 21, 91666, "", "=q4=Malevolent Gladiator's Mooncloth Leggings", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_holy_powerwordshield", "=q6=#arenas5_2#", "=q5="};
				{ 24, 93551, "", "=q3=Crafted Dreadful Gladiator's Mooncloth Helm", "=ds="};
				{ 25, 93554, "", "=q3=Crafted Dreadful Gladiator's Mooncloth Mantle", "=ds="};
				{ 26, 93553, "", "=q3=Crafted Dreadful Gladiator's Mooncloth Robe", "=ds="};
				{ 27, 93550, "", "=q3=Crafted Dreadful Gladiator's Mooncloth Gloves", "=ds="};
				{ 28, 93552, "", "=q3=Crafted Dreadful Gladiator's Mooncloth Leggings", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90Rogue"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "inv_throwingknife_04", "=q6=#arenas6#", "=q5="};
				{ 9, 91344, "", "=q4=Tyrannical Gladiator's Leather Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91348, "", "=q4=Tyrannical Gladiator's Leather Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91340, "", "=q4=Tyrannical Gladiator's Leather Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91342, "", "=q4=Tyrannical Gladiator's Leather Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91346, "", "=q4=Tyrannical Gladiator's Leather Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "inv_throwingknife_04", "=q6=#arenas6#", "=q5="};
				{ 9, 94426, "", "=q4=Tyrannical Gladiator's Leather Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94447, "", "=q4=Tyrannical Gladiator's Leather Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94443, "", "=q4=Tyrannical Gladiator's Leather Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94377, "", "=q4=Tyrannical Gladiator's Leather Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94446, "", "=q4=Tyrannical Gladiator's Leather Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "inv_throwingknife_04", "=q6=#arenas6#", "=q5="};
				{ 2, 91345, "", "=q4=Tyrannical Gladiator's Leather Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91349, "", "=q4=Tyrannical Gladiator's Leather Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91341, "", "=q4=Tyrannical Gladiator's Leather Tunic", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91343, "", "=q4=Tyrannical Gladiator's Leather Gloves", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91347, "", "=q4=Tyrannical Gladiator's Leather Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 8, 0, "inv_throwingknife_04", "=q6=#arenas6#", "=q5="};
				{ 9, 91697, "", "=q4=Malevolent Gladiator's Leather Helm", "=ds=", "#HONOR:2250#"};
				{ 10, 91701, "", "=q4=Malevolent Gladiator's Leather Spaulders", "=ds=", "#HONOR:1750#"};
				{ 11, 91693, "", "=q4=Malevolent Gladiator's Leather Tunic", "=ds=", "#HONOR:2250#"};
				{ 12, 91695, "", "=q4=Malevolent Gladiator's Leather Gloves", "=ds=", "#HONOR:1750#"};
				{ 13, 91699, "", "=q4=Malevolent Gladiator's Leather Legguards", "=ds=", "#HONOR:2250#"};
				{ 16, 0, "inv_throwingknife_04", "=q6=#arenas6#", "=q5="};
				{ 17, 93571, "", "=q3=Crafted Dreadful Gladiator's Leather Helm", "=ds="};
				{ 18, 93573, "", "=q3=Crafted Dreadful Gladiator's Leather Spaulders", "=ds="};
				{ 19, 93569, "", "=q3=Crafted Dreadful Gladiator's Leather Tunic", "=ds="};
				{ 20, 93570, "", "=q3=Crafted Dreadful Gladiator's Leather Gloves", "=ds="};
				{ 21, 93572, "", "=q3=Crafted Dreadful Gladiator's Leather Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90ShamanElemental"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 9, 91384, "", "=q4=Tyrannical Gladiator's Mail Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91388, "", "=q4=Tyrannical Gladiator's Mail Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91380, "", "=q4=Tyrannical Gladiator's Mail Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91382, "", "=q4=Tyrannical Gladiator's Mail Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91386, "", "=q4=Tyrannical Gladiator's Mail Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 9, 94409, "", "=q4=Tyrannical Gladiator's Mail Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94350, "", "=q4=Tyrannical Gladiator's Mail Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94459, "", "=q4=Tyrannical Gladiator's Mail Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94408, "", "=q4=Tyrannical Gladiator's Mail Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94497, "", "=q4=Tyrannical Gladiator's Mail Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 2, 91385, "", "=q4=Tyrannical Gladiator's Mail Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91389, "", "=q4=Tyrannical Gladiator's Mail Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91381, "", "=q4=Tyrannical Gladiator's Mail Armor", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91383, "", "=q4=Tyrannical Gladiator's Mail Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91387, "", "=q4=Tyrannical Gladiator's Mail Leggings", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 17, 91737, "", "=q4=Malevolent Gladiator's Mail Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91741, "", "=q4=Malevolent Gladiator's Mail Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91733, "", "=q4=Malevolent Gladiator's Mail Armor", "=ds=", "#HONOR:2250#"};
				{ 20, 91735, "", "=q4=Malevolent Gladiator's Mail Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91739, "", "=q4=Malevolent Gladiator's Mail Leggings", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 24, 93592, "", "=q3=Crafted Dreadful Gladiator's Mail Helm", "=ds="};
				{ 25, 93594, "", "=q3=Crafted Dreadful Gladiator's Mail Spaulders", "=ds="};
				{ 26, 93590, "", "=q3=Crafted Dreadful Gladiator's Mail Armor", "=ds="};
				{ 27, 93591, "", "=q3=Crafted Dreadful Gladiator's Mail Gauntlets", "=ds="};
				{ 28, 93593, "", "=q3=Crafted Dreadful Gladiator's Mail Leggings", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Elemental"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90ShamanEnhancement"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 9, 91372, "", "=q4=Tyrannical Gladiator's Linked Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91376, "", "=q4=Tyrannical Gladiator's Linked Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91368, "", "=q4=Tyrannical Gladiator's Linked Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91370, "", "=q4=Tyrannical Gladiator's Linked Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91374, "", "=q4=Tyrannical Gladiator's Linked Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 9, 94439, "", "=q4=Tyrannical Gladiator's Linked Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94342, "", "=q4=Tyrannical Gladiator's Linked Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94475, "", "=q4=Tyrannical Gladiator's Linked Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94458, "", "=q4=Tyrannical Gladiator's Linked Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94494, "", "=q4=Tyrannical Gladiator's Linked Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_lightningshield", "=q6=#arenas7_1#", "=q5="};
				{ 2, 91373, "", "=q4=Malevolent Gladiator's Linked Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91377, "", "=q4=Malevolent Gladiator's Linked Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91369, "", "=q4=Malevolent Gladiator's Linked Armor", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91371, "", "=q4=Malevolent Gladiator's Linked Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91375, "", "=q4=Malevolent Gladiator's Linked Leggings", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_nature_lightningshield", "=q6=#arenas7_1#", "=q5="};
				{ 17, 91725, "", "=q4=Malevolent Gladiator's Linked Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91729, "", "=q4=Malevolent Gladiator's Linked Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91721, "", "=q4=Malevolent Gladiator's Linked Armor", "=ds=", "#HONOR:2250#"};
				{ 20, 91723, "", "=q4=Malevolent Gladiator's Linked Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91727, "", "=q4=Malevolent Gladiator's Linked Leggings", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_nature_lightningshield", "=q6=#arenas7_1#", "=q5="};
				{ 24, 93586, "", "=q3=Crafted Dreadful Gladiator's Linked Helm", "=ds="};
				{ 25, 93588, "", "=q3=Crafted Dreadful Gladiator's Linked Spaulders", "=ds="};
				{ 26, 93584, "", "=q3=Crafted Dreadful Gladiator's Linked Armor", "=ds="};
				{ 27, 93585, "", "=q3=Crafted Dreadful Gladiator's Linked Gauntlets", "=ds="};
				{ 28, 93587, "", "=q3=Crafted Dreadful Gladiator's Linked Leggings", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Enhancement"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90ShamanRestoration"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 9, 91362, "", "=q4=Tyrannical Gladiator's Ringmail Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91366, "", "=q4=Tyrannical Gladiator's Ringmail Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91358, "", "=q4=Tyrannical Gladiator's Ringmail Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91360, "", "=q4=Tyrannical Gladiator's Ringmail Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91364, "", "=q4=Tyrannical Gladiator's Ringmail Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q5="};
				{ 9, 94434, "", "=q4=Tyrannical Gladiator's Ringmail Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94369, "", "=q4=Tyrannical Gladiator's Ringmail Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94433, "", "=q4=Tyrannical Gladiator's Ringmail Armor", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94490, "", "=q4=Tyrannical Gladiator's Ringmail Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94435, "", "=q4=Tyrannical Gladiator's Ringmail Leggings", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_magicimmunity", "=q6=#arenas7_3#", "=q5="};
				{ 2, 91363, "", "=q4=Malevolent Gladiator's Ringmail Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91367, "", "=q4=Malevolent Gladiator's Ringmail Spaulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91359, "", "=q4=Malevolent Gladiator's Ringmail Armor", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91361, "", "=q4=Malevolent Gladiator's Ringmail Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91365, "", "=q4=Malevolent Gladiator's Ringmail Leggings", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_nature_magicimmunity", "=q6=#arenas7_3#", "=q5="};
				{ 17, 91715, "", "=q4=Malevolent Gladiator's Ringmail Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91719, "", "=q4=Malevolent Gladiator's Ringmail Spaulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91711, "", "=q4=Malevolent Gladiator's Ringmail Armor", "=ds=", "#HONOR:2250#"};
				{ 20, 91713, "", "=q4=Malevolent Gladiator's Ringmail Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91717, "", "=q4=Malevolent Gladiator's Ringmail Leggings", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_nature_magicimmunity", "=q6=#arenas7_3#", "=q5="};
				{ 24, 93581, "", "=q3=Crafted Dreadful Gladiator's Ringmail Helm", "=ds="};
				{ 25, 93583, "", "=q3=Crafted Dreadful Gladiator's Ringmail Spaulders", "=ds="};
				{ 26, 93579, "", "=q3=Crafted Dreadful Gladiator's Ringmail Armor", "=ds="};
				{ 27, 93580, "", "=q3=Crafted Dreadful Gladiator's Ringmail Gauntlets", "=ds="};
				{ 28, 93582, "", "=q3=Crafted Dreadful Gladiator's Ringmail Leggings", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Restoration"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90Warlock"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "spell_nature_drowsy", "=q6=#arenas8_2#", "=q5="};
				{ 9, 91422, "", "=q4=Tyrannical Gladiator's Felweave Cowl", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91428, "", "=q4=Tyrannical Gladiator's Felweave Amice", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91426, "", "=q4=Tyrannical Gladiator's Felweave Raiment", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91420, "", "=q4=Tyrannical Gladiator's Felweave Handguards", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91424, "", "=q4=Tyrannical Gladiator's Felweave Trousers", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "spell_nature_drowsy", "=q6=#arenas8_2#", "=q5="};
				{ 9, 94442, "", "=q4=Tyrannical Gladiator's Felweave Cowl", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94398, "", "=q4=Tyrannical Gladiator's Felweave Amice", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94375, "", "=q4=Tyrannical Gladiator's Felweave Raiment", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94441, "", "=q4=Tyrannical Gladiator's Felweave Handguards", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94471, "", "=q4=Tyrannical Gladiator's Felweave Trousers", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_drowsy", "=q6=#arenas8_2#", "=q5="};
				{ 2, 91423, "", "=q4=Tyrannical Gladiator's Felweave Cowl", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91429, "", "=q4=Tyrannical Gladiator's Felweave Amice", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91427, "", "=q4=Tyrannical Gladiator's Felweave Raiment", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91421, "", "=q4=Tyrannical Gladiator's Felweave Handguards", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91425, "", "=q4=Tyrannical Gladiator's Felweave Trousers", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "spell_nature_drowsy", "=q6=#arenas8_2#", "=q5="};
				{ 17, 91775, "", "=q4=Malevolent Gladiator's Felweave Cowl", "=ds=", "#HONOR:2250#"};
				{ 18, 91781, "", "=q4=Malevolent Gladiator's Felweave Amice", "=ds=", "#HONOR:1750#"};
				{ 19, 91779, "", "=q4=Malevolent Gladiator's Felweave Raiment", "=ds=", "#HONOR:2250#"};
				{ 20, 91773, "", "=q4=Malevolent Gladiator's Felweave Handguards", "=ds=", "#HONOR:1750#"};
				{ 21, 91777, "", "=q4=Malevolent Gladiator's Felweave Trousers", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "spell_nature_drowsy", "=q6=#arenas8_2#", "=q5="};
				{ 24, 93616, "", "=q3=Crafted Dreadful Gladiator's Felweave Cowl", "=ds="};
				{ 25, 93619, "", "=q3=Crafted Dreadful Gladiator's Felweave Amice", "=ds="};
				{ 26, 93618, "", "=q3=Crafted Dreadful Gladiator's Felweave Raiment", "=ds="};
				{ 27, 93615, "", "=q3=Crafted Dreadful Gladiator's Felweave Handguards", "=ds="};
				{ 28, 93617, "", "=q3=Crafted Dreadful Gladiator's Felweave Trousers", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			module = moduleName, menu = "PVP90SET",
		};
	}

	AtlasLoot_Data["PVP90Warrior"] = {
			["Normal_A"] = {
				{
				{ 8, 0, "ability_warrior_savageblow", "=q6=#arenas9#", "=q5="};
				{ 9, 91434, "", "=q4=Tyrannical Gladiator's Plate Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 91438, "", "=q4=Tyrannical Gladiator's Plate Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91430, "", "=q4=Tyrannical Gladiator's Plate Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 12, 91432, "", "=q4=Tyrannical Gladiator's Plate Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 91436, "", "=q4=Tyrannical Gladiator's Plate Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 8, 0, "ability_warrior_savageblow", "=q6=#arenas9#", "=q5="};
				{ 9, 94332, "", "=q4=Tyrannical Gladiator's Plate Helm", "=ds=", "#CONQUEST:2250#"};
				{ 10, 94401, "", "=q4=Tyrannical Gladiator's Plate Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 11, 94444, "", "=q4=Tyrannical Gladiator's Plate Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 12, 94331, "", "=q4=Tyrannical Gladiator's Plate Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 13, 94448, "", "=q4=Tyrannical Gladiator's Plate Legguards", "=ds=", "#CONQUEST:2250#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 1, 0, "ability_warrior_savageblow", "=q6=#arenas9#", "=q5="};
				{ 2, 91435, "", "=q4=Tyrannical Gladiator's Plate Helm", "=ds=", "#CONQUEST:2250#"};
				{ 3, 91439, "", "=q4=Tyrannical Gladiator's Plate Shoulders", "=ds=", "#CONQUEST:1750#"};
				{ 4, 91431, "", "=q4=Tyrannical Gladiator's Plate Chestpiece", "=ds=", "#CONQUEST:2250#"};
				{ 5, 91433, "", "=q4=Tyrannical Gladiator's Plate Gauntlets", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91437, "", "=q4=Tyrannical Gladiator's Plate Legguards", "=ds=", "#CONQUEST:2250#"};
				{ 16, 0, "ability_warrior_savageblow", "=q6=#arenas9#", "=q5="};
				{ 17, 91787, "", "=q4=Malevolent Gladiator's Plate Helm", "=ds=", "#HONOR:2250#"};
				{ 18, 91791, "", "=q4=Malevolent Gladiator's Plate Shoulders", "=ds=", "#HONOR:1750#"};
				{ 19, 91783, "", "=q4=Malevolent Gladiator's Plate Chestpiece", "=ds=", "#HONOR:2250#"};
				{ 20, 91785, "", "=q4=Malevolent Gladiator's Plate Gauntlets", "=ds=", "#HONOR:1750#"};
				{ 21, 91789, "", "=q4=Malevolent Gladiator's Plate Legguards", "=ds=", "#HONOR:2250#"};
				{ 23, 0, "ability_warrior_savageblow", "=q6=#arenas9#", "=q5="};
				{ 24, 93622, "", "=q3=Crafted Dreadful Gladiator's Plate Helm", "=ds="};
				{ 25, 93624, "", "=q3=Crafted Dreadful Gladiator's Plate Shoulders", "=ds="};
				{ 26, 93620, "", "=q3=Crafted Dreadful Gladiator's Plate Chestpiece", "=ds="};
				{ 27, 93621, "", "=q3=Crafted Dreadful Gladiator's Plate Gauntlets", "=ds="};
				{ 28, 93623, "", "=q3=Crafted Dreadful Gladiator's Plate Legguards", "=ds="};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			module = moduleName, menu = "PVP90SET",
		};
	}

		------------------------------
		--- Level 90 - Accessories ---
		------------------------------

	AtlasLoot_Data["PVP90Accessories"] = {
		["Normal_A"] = {
			{
				{ 1, 91100, "", "=q4=Tyrannical Gladiator's Cape of Cruelty", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 2, 91101, "", "=q4=Tyrannical Gladiator's Cape of Prowess", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 3, 91411, "", "=q4=Tyrannical Gladiator's Cloak of Alacrity", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 4, 91412, "", "=q4=Tyrannical Gladiator's Cloak of Prowess", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 5, 91124, "", "=q4=Tyrannical Gladiator's Drape of Cruelty", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 6, 91126, "", "=q4=Tyrannical Gladiator's Drape of Meditation", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 7, 91125, "", "=q4=Tyrannical Gladiator's Drape of Prowess", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 9, 91139, "", "=q4=Tyrannical Gladiator's Band of Accuracy", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 10, 91138, "", "=q4=Tyrannical Gladiator's Band of Cruelty", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 11, 91140, "", "=q4=Tyrannical Gladiator's Band of Meditation", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 12, 91417, "", "=q4=Tyrannical Gladiator's Signet of Accuracy", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 13, 91416, "", "=q4=Tyrannical Gladiator's Signet of Cruelty", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 14, 91106, "", "=q4=Tyrannical Gladiator's Ring of Accuracy", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 15, 91105, "", "=q4=Tyrannical Gladiator's Ring of Cruelty", "=ds=#s13#", "#CONQUEST:1250#"},
				{ 16, 91414, "", "=q4=Tyrannical Gladiator's Choker of Accuracy", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 17, 91413, "", "=q4=Tyrannical Gladiator's Choker of Proficiency", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 18, 91102, "", "=q4=Tyrannical Gladiator's Necklace of Proficiency", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 19, 91103, "", "=q4=Tyrannical Gladiator's Necklace of Prowess", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 20, 91136, "", "=q4=Tyrannical Gladiator's Pendant of Alacrity", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 21, 91135, "", "=q4=Tyrannical Gladiator's Pendant of Cruelty", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 22, 91137, "", "=q4=Tyrannical Gladiator's Pendant of Meditation", "=ds=#s2#", "#CONQUEST:1250#"},
				merge = true;
			};
			{
				{ 2, 91099, "", "=q4=Tyrannical Gladiator's Badge of Conquest", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 3, 91400, "", "=q4=Tyrannical Gladiator's Badge of Dominance", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 4, 91410, "", "=q4=Tyrannical Gladiator's Badge of Victory", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 6, 91209, "", "=q4=Tyrannical Gladiator's Emblem of Cruelty", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 7, 91211, "", "=q4=Tyrannical Gladiator's Emblem of Meditation", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 8, 91210, "", "=q4=Tyrannical Gladiator's Emblem of Tenacity", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 17, 94386, "", "=q4=Tyrannical Gladiator's Medallion of Cruelty", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 18, 94388, "", "=q4=Tyrannical Gladiator's Medallion of Meditation", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 19, 94361, "", "=q4=Tyrannical Gladiator's Medallion of Tenacity", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 21, 91104, "", "=q4=Tyrannical Gladiator's Insignia of Conquest", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 22, 91401, "", "=q4=Tyrannical Gladiator's Insignia of Dominance", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 23, 91415, "", "=q4=Tyrannical Gladiator's Insignia of Victory", "=ds=#s14#", "#CONQUEST:1750#" },
			};
		};
		["Normal_H"] = {
			{
				{ 1, 94421, "", "=q4=Tyrannical Gladiator's Cape of Cruelty", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 2, 94355, "", "=q4=Tyrannical Gladiator's Cape of Prowess", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 3, 94485, "", "=q4=Tyrannical Gladiator's Cloak of Alacrity", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 4, 94486, "", "=q4=Tyrannical Gladiator's Cloak of Prowess", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 5, 94383, "", "=q4=Tyrannical Gladiator's Drape of Cruelty", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 6, 94472, "", "=q4=Tyrannical Gladiator's Drape of Meditation", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 7, 94488, "", "=q4=Tyrannical Gladiator's Drape of Prowess", "=ds=#s4#", "#CONQUEST:1250#"},
				{ 9, 94363, "", "=q4=Tyrannical Gladiator's Band of Accuracy", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 10, 94390, "", "=q4=Tyrannical Gladiator's Band of Cruelty", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 11, 94474, "", "=q4=Tyrannical Gladiator's Band of Meditation", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 12, 94462, "", "=q4=Tyrannical Gladiator's Signet of Accuracy", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 13, 94417, "", "=q4=Tyrannical Gladiator's Signet of Cruelty", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 14, 94399, "", "=q4=Tyrannical Gladiator's Ring of Accuracy", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 15, 94357, "", "=q4=Tyrannical Gladiator's Ring of Cruelty", "=ds=#s13#", "#CONQUEST:1250#"};
				{ 16, 94354, "", "=q4=Tyrannical Gladiator's Choker of Accuracy", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 17, 94465, "", "=q4=Tyrannical Gladiator's Choker of Proficiency", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 18, 93494, "", "=q4=Tyrannical Gladiator's Necklace of Proficiency", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 19, 93495, "", "=q4=Tyrannical Gladiator's Necklace of Prowess", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 20, 94473, "", "=q4=Tyrannical Gladiator's Pendant of Alacrity", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 21, 94489, "", "=q4=Tyrannical Gladiator's Pendant of Cruelty", "=ds=#s2#", "#CONQUEST:1250#"},
				{ 22, 94452, "", "=q4=Tyrannical Gladiator's Pendant of Meditation", "=ds=#s2#", "#CONQUEST:1250#"},
				merge = true;
			};
			{
				{ 2, 94373, "", "=q4=Tyrannical Gladiator's Badge of Conquest", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 3, 94346, "", "=q4=Tyrannical Gladiator's Badge of Dominance", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 4, 94349, "", "=q4=Tyrannical Gladiator's Badge of Victory", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 6, 94396, "", "=q4=Tyrannical Gladiator's Emblem of Cruelty", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 7, 94329, "", "=q4=Tyrannical Gladiator's Emblem of Meditation", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 8, 94422, "", "=q4=Tyrannical Gladiator's Emblem of Tenacity", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 17, 94454, "", "=q4=Tyrannical Gladiator's Medallion of Cruelty", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 18, 94337, "", "=q4=Tyrannical Gladiator's Medallion of Meditation", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 19, 94387, "", "=q4=Tyrannical Gladiator's Medallion of Tenacity", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 21, 94356, "", "=q4=Tyrannical Gladiator's Insignia of Conquest", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 22, 94482, "", "=q4=Tyrannical Gladiator's Insignia of Dominance", "=ds=#s14#", "#CONQUEST:1750#" },
				{ 23, 94415, "", "=q4=Tyrannical Gladiator's Insignia of Victory", "=ds=#s14#", "#CONQUEST:1750#" },
			};
		};
		["Normal"] = {
			{
				{ 24, 95348, "", "=q4=Tyrannical Primal Diamond", "=ds=#e32# #e7#", "#CONQUEST:1000#"},
				{ 25, 95349, "", "=q3=Enchant Weapon - Glorious Tyranny", "=ds=#e17#", "#CONQUEST:1000#"},
			};
			{};
			{
				{ 1, 91453, "", "=q4=Malevolent Gladiator's Cape of Cruelty", "=ds=#s4#", "#HONOR:1250#"},
				{ 2, 91454, "", "=q4=Malevolent Gladiator's Cape of Prowess", "=ds=#s4#", "#HONOR:1250#"},
				{ 3, 91764, "", "=q4=Malevolent Gladiator's Cloak of Alacrity", "=ds=#s4#", "#HONOR:1250#"},
				{ 4, 91765, "", "=q4=Malevolent Gladiator's Cloak of Prowess", "=ds=#s4#", "#HONOR:1250#"},
				{ 5, 91477, "", "=q4=Malevolent Gladiator's Drape of Cruelty", "=ds=#s4#", "#HONOR:1250#"},
				{ 6, 91479, "", "=q4=Malevolent Gladiator's Drape of Meditation", "=ds=#s4#", "#HONOR:1250#"},
				{ 7, 91478, "", "=q4=Malevolent Gladiator's Drape of Prowess", "=ds=#s4#", "#HONOR:1250#"},
				{ 9, 91492, "", "=q4=Malevolent Gladiator's Band of Accuracy", "=ds=#s13#", "#HONOR:1250#"};
				{ 10, 91491, "", "=q4=Malevolent Gladiator's Band of Cruelty", "=ds=#s13#", "#HONOR:1250#"};
				{ 11, 91493, "", "=q4=Malevolent Gladiator's Band of Meditation", "=ds=#s13#", "#HONOR:1250#"};
				{ 12, 91770, "", "=q4=Malevolent Gladiator's Signet of Accuracy", "=ds=#s13#", "#HONOR:1250#"};
				{ 13, 91769, "", "=q4=Malevolent Gladiator's Signet of Cruelty", "=ds=#s13#", "#HONOR:1250#"};
				{ 14, 91459, "", "=q4=Malevolent Gladiator's Ring of Accuracy", "=ds=#s13#", "#HONOR:1250#"};
				{ 15, 91458, "", "=q4=Malevolent Gladiator's Ring of Cruelty", "=ds=#s13#", "#HONOR:1250#"};
				{ 16, 91767, "", "=q4=Malevolent Gladiator's Choker of Accuracy", "=ds=#s2#", "#HONOR:1250#"},
				{ 17, 91766, "", "=q4=Malevolent Gladiator's Choker of Proficiency", "=ds=#s2#", "#HONOR:1250#"},
				{ 18, 91455, "", "=q4=Malevolent Gladiator's Necklace of Proficiency", "=ds=#s2#", "#HONOR:1250#"},
				{ 19, 91456, "", "=q4=Malevolent Gladiator's Necklace of Prowess", "=ds=#s2#", "#HONOR:1250#"},
				{ 20, 91489, "", "=q4=Malevolent Gladiator's Pendant of Alacrity", "=ds=#s2#", "#HONOR:1250#"},
				{ 21, 91488, "", "=q4=Malevolent Gladiator's Pendant of Cruelty", "=ds=#s2#", "#HONOR:1250#"},
				{ 22, 91490, "", "=q4=Malevolent Gladiator's Pendant of Meditation", "=ds=#s2#", "#HONOR:1250#"},
			};
			{
				{ 1, 91452, "", "=q4=Malevolent Gladiator's Badge of Conquest", "=ds=#s14#", "#HONOR:1750#" },
				{ 2, 91753, "", "=q4=Malevolent Gladiator's Badge of Dominance", "=ds=#s14#", "#HONOR:1750#" },
				{ 3, 91763, "", "=q4=Malevolent Gladiator's Badge of Victory", "=ds=#s14#", "#HONOR:1750#" },
				{ 5, 91562, "", "=q4=Malevolent Gladiator's Emblem of Cruelty", "=ds=#s14#", "#HONOR:1750#" },
				{ 6, 91564, "", "=q4=Malevolent Gladiator's Emblem of Meditation", "=ds=#s14#", "#HONOR:1750#" },
				{ 7, 91563, "", "=q4=Malevolent Gladiator's Emblem of Tenacity", "=ds=#s14#", "#HONOR:1750#" },
				{
					{ 9, 91683, "", "=q4=Malevolent Gladiator's Medallion of Cruelty", "=ds=#s14#", "#HONOR:1750#" },
					{ 9, 91682, "", "=q4=Malevolent Gladiator's Medallion of Cruelty", "=ds=#s14#", "#HONOR:1750#" },
				};
				{
					{ 10, 91687, "", "=q4=Malevolent Gladiator's Medallion of Meditation", "=ds=#s14#", "#HONOR:1750#" },
					{ 10, 91686, "", "=q4=Malevolent Gladiator's Medallion of Meditation", "=ds=#s14#", "#HONOR:1750#" },
				};
				{
					{ 11, 91685, "", "=q4=Malevolent Gladiator's Medallion of Tenacity", "=ds=#s14#", "#HONOR:1750#" },
					{ 11, 91684, "", "=q4=Malevolent Gladiator's Medallion of Tenacity", "=ds=#s14#", "#HONOR:1750#" },
				};
				{ 13, 91457, "", "=q4=Malevolent Gladiator's Insignia of Conquest", "=ds=#s14#", "#HONOR:1750#" },
				{ 14, 91754, "", "=q4=Malevolent Gladiator's Insignia of Dominance", "=ds=#s14#", "#HONOR:1750#" },
				{ 15, 91768, "", "=q4=Malevolent Gladiator's Insignia of Victory", "=ds=#s14#", "#HONOR:1750#" },
				{ 16, 93420, "", "=q3=Crafted Dreadful Gladiator's Cape of Cruelty", "=ds=#s4#"},
				{ 17, 93421, "", "=q3=Crafted Dreadful Gladiator's Cape of Prowess", "=ds=#s4#"},
				{ 18, 93607, "", "=q3=Crafted Dreadful Gladiator's Cloak of Alacrity", "=ds=#s4#"},
				{ 19, 93608, "", "=q3=Crafted Dreadful Gladiator's Cloak of Prowess", "=ds=#s4#"},
				{ 20, 93437, "", "=q3=Crafted Dreadful Gladiator's Drape of Cruelty", "=ds=#s4#"},
				{ 21, 93439, "", "=q3=Crafted Dreadful Gladiator's Drape of Meditation", "=ds=#s4#"},
				{ 22, 93438, "", "=q3=Crafted Dreadful Gladiator's Drape of Prowess", "=ds=#s4#"},
			};
		};
		info = {
			name = AL["PvP Accessories"],
			module = moduleName, menu = "PVPMENU",
		};
	}

		--------------------------------
		--- Level 90 - Non Set Epics ---
		--------------------------------

	AtlasLoot_Data["PVP90NonSetCloth"] = {
			["Normal_A"] = {
				{
				{ 16, 91121, "", "=q4=Tyrannical Gladiator's Cuffs of Accuracy", "=ds=", "#CONQUEST:1250#"};
				{ 17, 91111, "", "=q4=Tyrannical Gladiator's Cord of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 18, 91117, "", "=q4=Tyrannical Gladiator's Treads of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 20, 91123, "", "=q4=Tyrannical Gladiator's Cuffs of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 21, 91113, "", "=q4=Tyrannical Gladiator's Cord of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 22, 91119, "", "=q4=Tyrannical Gladiator's Treads of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 24, 91122, "", "=q4=Tyrannical Gladiator's Cuffs of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 25, 91109, "", "=q4=Tyrannical Gladiator's Cord of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 91115, "", "=q4=Tyrannical Gladiator's Treads of Cruelty", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 16, 94403, "", "=q4=Tyrannical Gladiator's Cuffs of Accuracy", "=ds=", "#CONQUEST:1250#"};
				{ 17, 94376, "", "=q4=Tyrannical Gladiator's Cord of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 18, 94333, "", "=q4=Tyrannical Gladiator's Treads of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 20, 94380, "", "=q4=Tyrannical Gladiator's Cuffs of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 21, 94425, "", "=q4=Tyrannical Gladiator's Cord of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 22, 94468, "", "=q4=Tyrannical Gladiator's Treads of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 24, 94449, "", "=q4=Tyrannical Gladiator's Cuffs of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 25, 94400, "", "=q4=Tyrannical Gladiator's Cord of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 94402, "", "=q4=Tyrannical Gladiator's Treads of Cruelty", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 2, 91112, "", "=q4=Tyrannical Gladiator's Cord of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 3, 91118, "", "=q4=Tyrannical Gladiator's Treads of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91114, "", "=q4=Tyrannical Gladiator's Cord of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 7, 91120, "", "=q4=Tyrannical Gladiator's Treads of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 10, 91110, "", "=q4=Tyrannical Gladiator's Cord of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91116, "", "=q4=Tyrannical Gladiator's Treads of Cruelty", "=ds=", "#CONQUEST:1750#"};
			};
			{
				{ 1, 91474, "", "=q4=Malevolent Gladiator's Cuffs of Accuracy", "=ds=", "#HONOR:1250#"};
				{ 2, 91464, "", "=q4=Malevolent Gladiator's Cord of Accuracy", "=ds=", "#HONOR:1750#"};
				{ 3, 91470, "", "=q4=Malevolent Gladiator's Treads of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 5, 91476, "", "=q4=Malevolent Gladiator's Cuffs of Meditation", "=ds=", "#HONOR:1250#"};
				{ 6, 91466, "", "=q4=Malevolent Gladiator's Cord of Meditation", "=ds=", "#HONOR:1750#"};
				{ 7, 91472, "", "=q4=Malevolent Gladiator's Treads of Meditation", "=ds=", "#HONOR:1750#"};
				{ 9, 91475, "", "=q4=Malevolent Gladiator's Cuffs of Prowess", "=ds=", "#HONOR:1250#"};
				{ 10, 91462, "", "=q4=Malevolent Gladiator's Cord of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 11, 91468, "", "=q4=Malevolent Gladiator's Treads of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 16, 93434, "", "=q3=Crafted Dreadful Gladiator's Cuffs of Accuracy", "=ds="};
				{ 17, 93429, "", "=q3=Crafted Dreadful Gladiator's Cord of Accuracy", "=ds="};
				{ 18, 93432, "", "=q3=Crafted Dreadful Gladiator's Treads of Alacrity", "=ds="};
				{ 20, 93436, "", "=q3=Crafted Dreadful Gladiator's Cuffs of Meditation", "=ds="};
				{ 21, 93430, "", "=q3=Crafted Dreadful Gladiator's Cord of Meditation", "=ds="};
				{ 22, 93433, "", "=q3=Crafted Dreadful Gladiator's Treads of Meditation", "=ds="};
				{ 24, 93435, "", "=q3=Crafted Dreadful Gladiator's Cuffs of Prowess", "=ds="};
				{ 25, 93428, "", "=q3=Crafted Dreadful Gladiator's Cord of Cruelty", "=ds="};
				{ 26, 93431, "", "=q3=Crafted Dreadful Gladiator's Treads of Cruelty", "=ds="};
			};
		};
		info = {
			name = AL["PvP Non-Set Epics"]..": "..BabbleInventory["Cloth"],
			module = moduleName, menu = "PVPMENU",
		};
	}

	AtlasLoot_Data["PVP90NonSetLeather"] = {
			["Normal_A"] = {
				{
				{ 16, 91246, "", "=q4=Tyrannical Gladiator's Armwraps of Accuracy", "=ds=", "#CONQUEST:1250#"};
				{ 17, 91335, "", "=q4=Tyrannical Gladiator's Waistband of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 18, 91337, "", "=q4=Tyrannical Gladiator's Boots of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 20, 91339, "", "=q4=Tyrannical Gladiator's Armwraps of Alacrity", "=ds=", "#CONQUEST:1250#"};
				{ 21, 91242, "", "=q4=Tyrannical Gladiator's Waistband of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 22, 91244, "", "=q4=Tyrannical Gladiator's Boots of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 24, 91188, "", "=q4=Tyrannical Gladiator's Bindings of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 25, 91184, "", "=q4=Tyrannical Gladiator's Belt of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 91186, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 28, 91171, "", "=q4=Tyrannical Gladiator's Bindings of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 29, 91167, "", "=q4=Tyrannical Gladiator's Belt of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 30, 91169, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 16, 94427, "", "=q4=Tyrannical Gladiator's Armwraps of Accuracy", "=ds=", "#CONQUEST:1250#"};
				{ 17, 94424, "", "=q4=Tyrannical Gladiator's Waistband of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 18, 94374, "", "=q4=Tyrannical Gladiator's Boots of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 20, 94470, "", "=q4=Tyrannical Gladiator's Armwraps of Alacrity", "=ds=", "#CONQUEST:1250#"};
				{ 21, 94360, "", "=q4=Tyrannical Gladiator's Waistband of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 22, 94432, "", "=q4=Tyrannical Gladiator's Boots of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 24, 94439, "", "=q4=Tyrannical Gladiator's Bindings of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 25, 94410, "", "=q4=Tyrannical Gladiator's Belt of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 94476, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 28, 94407, "", "=q4=Tyrannical Gladiator's Bindings of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 29, 94491, "", "=q4=Tyrannical Gladiator's Belt of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 30, 94344, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 2, 91336, "", "=q4=Tyrannical Gladiator's Waistband of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 3, 91338, "", "=q4=Tyrannical Gladiator's Boots of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91243, "", "=q4=Tyrannical Gladiator's Waistband of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 7, 91245, "", "=q4=Tyrannical Gladiator's Boots of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 10, 91185, "", "=q4=Tyrannical Gladiator's Belt of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91187, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 14, 91168, "", "=q4=Tyrannical Gladiator's Belt of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 15, 91170, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds=", "#CONQUEST:1750#"};
			};
			{
				{ 1, 91599, "", "=q4=Malevolent Gladiator's Armwraps of Accuracy", "=ds=", "#HONOR:1250#"};
				{ 2, 91688, "", "=q4=Malevolent Gladiator's Waistband of Accuracy", "=ds=", "#HONOR:1750#"};
				{ 3, 91690, "", "=q4=Malevolent Gladiator's Boots of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 5, 91692, "", "=q4=Malevolent Gladiator's Armwraps of Alacrity", "=ds=", "#HONOR:1250#"};
				{ 6, 91595, "", "=q4=Malevolent Gladiator's Waistband of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 7, 91597, "", "=q4=Malevolent Gladiator's Boots of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 9, 91541, "", "=q4=Malevolent Gladiator's Bindings of Prowess", "=ds=", "#HONOR:1250#"};
				{ 10, 91537, "", "=q4=Malevolent Gladiator's Belt of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 11, 91539, "", "=q4=Malevolent Gladiator's Footguards of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 13, 91524, "", "=q4=Malevolent Gladiator's Bindings of Meditation", "=ds=", "#HONOR:1250#"};
				{ 14, 91520, "", "=q4=Malevolent Gladiator's Belt of Meditation", "=ds=", "#HONOR:1750#"};
				{ 15, 91522, "", "=q4=Malevolent Gladiator's Footguards of Meditation", "=ds=", "#HONOR:1750#"};
				{ 16, 93506, "", "=q3=Crafted Dreadful Gladiator's Armwraps of Accuracy", "=ds="};
				{ 17, 93566, "", "=q3=Crafted Dreadful Gladiator's Waistband of Accuracy", "=ds="};
				{ 18, 93567, "", "=q3=Crafted Dreadful Gladiator's Boots of Cruelty", "=ds="};
				{ 20, 93568, "", "=q3=Crafted Dreadful Gladiator's Armwraps of Alacrity", "=ds="};
				{ 21, 93504, "", "=q3=Crafted Dreadful Gladiator's Waistband of Cruelty", "=ds="};
				{ 22, 93505, "", "=q3=Crafted Dreadful Gladiator's Boots of Alacrity", "=ds="};
				{ 24, 93474, "", "=q3=Crafted Dreadful Gladiator's Bindings of Prowess", "=ds="};
				{ 25, 93472, "", "=q3=Crafted Dreadful Gladiator's Belt of Cruelty", "=ds="};
				{ 26, 93473, "", "=q3=Crafted Dreadful Gladiator's Footguards of Alacrity", "=ds="};
				{ 28, 93465, "", "=q3=Crafted Dreadful Gladiator's Bindings of Meditation", "=ds="};
				{ 29, 93463, "", "=q3=Crafted Dreadful Gladiator's Belt of Meditation", "=ds="};
				{ 30, 93464, "", "=q3=Crafted Dreadful Gladiator's Footguards of Meditation", "=ds="};
			};
		};
		info = {
			name = AL["PvP Non-Set Epics"]..": "..BabbleInventory["Leather"],
			module = moduleName, menu = "PVPMENU",
		};
	}

	AtlasLoot_Data["PVP90NonSetMail"] = {
			["Normal_A"] = {
				{
				{ 16, 91357, "", "=q4=Tyrannical Gladiator's Armbands of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 17, 91350, "", "=q4=Tyrannical Gladiator's Waistguard of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 18, 91354, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 20, 91356, "", "=q4=Tyrannical Gladiator's Armbands of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 21, 91378, "", "=q4=Tyrannical Gladiator's Waistguard of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 22, 91352, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 24, 91220, "", "=q4=Tyrannical Gladiator's Wristguards of Alacrity", "=ds=", "#CONQUEST:1250#"};
				{ 25, 91212, "", "=q4=Tyrannical Gladiator's Links of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 91218, "", "=q4=Tyrannical Gladiator's Sabatons of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 28, 91221, "", "=q4=Tyrannical Gladiator's Wristguards of Accuracy", "=ds=", "#CONQUEST:1250#"};
				{ 29, 91214, "", "=q4=Tyrannical Gladiator's Links of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 30, 91216, "", "=q4=Tyrannical Gladiator's Sabatons of Cruelty", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 16, 94337, "", "=q4=Tyrannical Gladiator's Armbands of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 17, 94382, "", "=q4=Tyrannical Gladiator's Waistguard of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 18, 94336, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 20, 94379, "", "=q4=Tyrannical Gladiator's Armbands of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 21, 94393, "", "=q4=Tyrannical Gladiator's Waistguard of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 22, 94378, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 24, 94404, "", "=q4=Tyrannical Gladiator's Wristguards of Alacrity", "=ds=", "#CONQUEST:1250#"};
				{ 25, 94330, "", "=q4=Tyrannical Gladiator's Links of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 94359, "", "=q4=Tyrannical Gladiator's Sabatons of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 28, 94469, "", "=q4=Tyrannical Gladiator's Wristguards of Accuracy", "=ds=", "#CONQUEST:1250#"};
				{ 29, 94358, "", "=q4=Tyrannical Gladiator's Links of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 30, 94445, "", "=q4=Tyrannical Gladiator's Sabatons of Cruelty", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 2, 91351, "", "=q4=Tyrannical Gladiator's Waistguard of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 3, 91355, "", "=q4=Tyrannical Gladiator's Footguards of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91379, "", "=q4=Tyrannical Gladiator's Waistguard of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 7, 91353, "", "=q4=Tyrannical Gladiator's Footguards of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 10, 91213, "", "=q4=Tyrannical Gladiator's Links of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91219, "", "=q4=Tyrannical Gladiator's Sabatons of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 14, 91215, "", "=q4=Tyrannical Gladiator's Links of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 15, 91217, "", "=q4=Tyrannical Gladiator's Sabatons of Cruelty", "=ds=", "#CONQUEST:1750#"};
			};
			{
				{ 1, 91710, "", "=q4=Malevolent Gladiator's Armbands of Meditation", "=ds=", "#HONOR:1250#"};
				{ 2, 91703, "", "=q4=Malevolent Gladiator's Waistguard of Meditation", "=ds=", "#HONOR:1750#"};
				{ 3, 91707, "", "=q4=Malevolent Gladiator's Footguards of Meditation", "=ds=", "#HONOR:1750#"};
				{ 5, 91709, "", "=q4=Malevolent Gladiator's Armbands of Prowess", "=ds=", "#HONOR:1250#"};
				{ 6, 91731, "", "=q4=Malevolent Gladiator's Waistguard of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 7, 91705, "", "=q4=Malevolent Gladiator's Footguards of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 9, 91573, "", "=q4=Malevolent Gladiator's Wristguards of Alacrity", "=ds=", "#HONOR:1250#"};
				{ 10, 91565, "", "=q4=Malevolent Gladiator's Links of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 11, 91571, "", "=q4=Malevolent Gladiator's Sabatons of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 13, 91574, "", "=q4=Malevolent Gladiator's Wristguards of Accuracy", "=ds=", "#HONOR:1250#"};
				{ 14, 91567, "", "=q4=Malevolent Gladiator's Links of Accuracy", "=ds=", "#HONOR:1750#"};
				{ 15, 91569, "", "=q4=Malevolent Gladiator's Sabatons of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 16, 93578, "", "=q3=Crafted Dreadful Gladiator's Armbands of Meditation", "=ds="};
				{ 17, 93574, "", "=q3=Crafted Dreadful Gladiator's Waistguard of Meditation", "=ds="};
				{ 18, 93576, "", "=q3=Crafted Dreadful Gladiator's Footguards of Meditation", "=ds="};
				{ 20, 93577, "", "=q3=Crafted Dreadful Gladiator's Armbands of Prowess", "=ds="};
				{ 21, 93589, "", "=q3=Crafted Dreadful Gladiator's Waistguard of Cruelty", "=ds="};
				{ 22, 93575, "", "=q3=Crafted Dreadful Gladiator's Footguards of Alacrity", "=ds="};
				{ 24, 93492, "", "=q3=Crafted Dreadful Gladiator's Wristguards of Alacrity", "=ds="};
				{ 25, 93488, "", "=q3=Crafted Dreadful Gladiator's Links of Cruelty", "=ds="};
				{ 26, 93491, "", "=q3=Crafted Dreadful Gladiator's Sabatons of Alacrity", "=ds="};
				{ 28, 93493, "", "=q3=Crafted Dreadful Gladiator's Wristguards of Accuracy", "=ds="};
				{ 29, 93489, "", "=q3=Crafted Dreadful Gladiator's Links of Accuracy", "=ds="};
				{ 30, 93490, "", "=q3=Crafted Dreadful Gladiator's Sabatons of Cruelty", "=ds="};
			};
		};
		info = {
			name = AL["PvP Non-Set Epics"]..": "..BabbleInventory["Mail"],
			module = moduleName, menu = "PVPMENU",
		};
	}

	AtlasLoot_Data["PVP90NonSetPlate"] = {
			["Normal_A"] = {
				{
				{ 16, 91286, "", "=q4=Tyrannical Gladiator's Bracers of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 17, 91279, "", "=q4=Tyrannical Gladiator's Clasp of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 18, 91283, "", "=q4=Tyrannical Gladiator's Greaves of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 20, 91305, "", "=q4=Tyrannical Gladiator's Armplates of Proficiency", "=ds=", "#CONQUEST:1250#"};
				{ 21, 91297, "", "=q4=Tyrannical Gladiator's Girdle of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 22, 91301, "", "=q4=Tyrannical Gladiator's Warboots of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 24, 91285, "", "=q4=Tyrannical Gladiator's Bracers of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 25, 91277, "", "=q4=Tyrannical Gladiator's Clasp of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 91281, "", "=q4=Tyrannical Gladiator's Greaves of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 28, 91306, "", "=q4=Tyrannical Gladiator's Armplates of Alacrity", "=ds=", "#CONQUEST:1250#"};
				{ 29, 91299, "", "=q4=Tyrannical Gladiator's Girdle of Prowess", "=ds=", "#CONQUEST:1750#"};
				{ 30, 91303, "", "=q4=Tyrannical Gladiator's Warboots of Alacrity", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
			["Normal_H"] = {
				{
				{ 16, 94481, "", "=q4=Tyrannical Gladiator's Bracers of Meditation", "=ds=", "#CONQUEST:1250#"};
				{ 17, 94464, "", "=q4=Tyrannical Gladiator's Clasp of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 18, 94352, "", "=q4=Tyrannical Gladiator's Greaves of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 20, 94418, "", "=q4=Tyrannical Gladiator's Armplates of Proficiency", "=ds=", "#CONQUEST:1250#"};
				{ 21, 94353, "", "=q4=Tyrannical Gladiator's Girdle of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 22, 94414, "", "=q4=Tyrannical Gladiator's Warboots of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 24, 94411, "", "=q4=Tyrannical Gladiator's Bracers of Prowess", "=ds=", "#CONQUEST:1250#"};
				{ 25, 94480, "", "=q4=Tyrannical Gladiator's Clasp of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 26, 94351, "", "=q4=Tyrannical Gladiator's Greaves of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 28, 94487, "", "=q4=Tyrannical Gladiator's Armplates of Alacrity", "=ds=", "#CONQUEST:1250#"};
				{ 29, 94440, "", "=q4=Tyrannical Gladiator's Girdle of Prowess", "=ds=", "#CONQUEST:1750#"};
				{ 30, 94461, "", "=q4=Tyrannical Gladiator's Warboots of Alacrity", "=ds=", "#CONQUEST:1750#"};
					merge = true;
				};
			};
		["Normal"] = {
			{
				{ 2, 91280, "", "=q4=Tyrannical Gladiator's Clasp of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 3, 91284, "", "=q4=Tyrannical Gladiator's Greaves of Meditation", "=ds=", "#CONQUEST:1750#"};
				{ 6, 91298, "", "=q4=Tyrannical Gladiator's Girdle of Accuracy", "=ds=", "#CONQUEST:1750#"};
				{ 7, 91302, "", "=q4=Tyrannical Gladiator's Warboots of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 10, 91278, "", "=q4=Tyrannical Gladiator's Clasp of Cruelty", "=ds=", "#CONQUEST:1750#"};
				{ 11, 91282, "", "=q4=Tyrannical Gladiator's Greaves of Alacrity", "=ds=", "#CONQUEST:1750#"};
				{ 14, 91300, "", "=q4=Tyrannical Gladiator's Girdle of Prowess", "=ds=", "#CONQUEST:1750#"};
				{ 15, 91304, "", "=q4=Tyrannical Gladiator's Warboots of Alacrity", "=ds=", "#CONQUEST:1750#"};
			};
			{
				{ 1, 91639, "", "=q4=Malevolent Gladiator's Bracers of Meditation", "=ds=", "#HONOR:1250#"};
				{ 2, 91632, "", "=q4=Malevolent Gladiator's Clasp of Meditation", "=ds=", "#HONOR:1750#"};
				{ 3, 91634, "", "=q4=Malevolent Gladiator's Greaves of Meditation", "=ds=", "#HONOR:1750#"};
				{ 5, 91658, "", "=q4=Malevolent Gladiator's Armplates of Proficiency", "=ds=", "#HONOR:1250#"};
				{ 6, 91650, "", "=q4=Malevolent Gladiator's Girdle of Accuracy", "=ds=", "#HONOR:1750#"};
				{ 7, 91654, "", "=q4=Malevolent Gladiator's Warboots of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 9, 91638, "", "=q4=Malevolent Gladiator's Bracers of Prowess", "=ds=", "#HONOR:1250#"};
				{ 10, 91630, "", "=q4=Malevolent Gladiator's Clasp of Cruelty", "=ds=", "#HONOR:1750#"};
				{ 11, 91634, "", "=q4=Malevolent Gladiator's Greaves of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 13, 91659, "", "=q4=Malevolent Gladiator's Armplates of Alacrity", "=ds=", "#HONOR:1250#"};
				{ 14, 91652, "", "=q4=Malevolent Gladiator's Girdle of Prowess", "=ds=", "#HONOR:1750#"};
				{ 15, 91656, "", "=q4=Malevolent Gladiator's Warboots of Alacrity", "=ds=", "#HONOR:1750#"};
				{ 16, 93537, "", "=q3=Crafted Dreadful Gladiator's Bracers of Meditation", "=ds="};
				{ 17, 93533, "", "=q3=Crafted Dreadful Gladiator's Clasp of Meditation", "=ds="};
				{ 18, 93535, "", "=q3=Crafted Dreadful Gladiator's Greaves of Meditation", "=ds="};
				{ 20, 93457, "", "=q3=Crafted Dreadful Gladiator's Armplates of Proficiency", "=ds="};
				{ 21, 93543, "", "=q3=Crafted Dreadful Gladiator's Girdle of Accuracy", "=ds="};
				{ 22, 93545, "", "=q3=Crafted Dreadful Gladiator's Warboots of Cruelty", "=ds="};
				{ 24, 93536, "", "=q3=Crafted Dreadful Gladiator's Bracers of Prowess", "=ds="};
				{ 25, 93532, "", "=q3=Crafted Dreadful Gladiator's Clasp of Cruelty", "=ds="};
				{ 26, 93534, "", "=q3=Crafted Dreadful Gladiator's Greaves of Alacrity", "=ds="};
				{ 28, 93458, "", "=q3=Crafted Dreadful Gladiator's Armplates of Alacrity", "=ds="};
				{ 29, 93544, "", "=q3=Crafted Dreadful Gladiator's Girdle of Prowess", "=ds="};
				{ 30, 93546, "", "=q3=Crafted Dreadful Gladiator's Warboots of Alacrity", "=ds="};
			};
		};
		info = {
			name = AL["PvP Non-Set Epics"]..": "..BabbleInventory["Plate"],
			module = moduleName, menu = "PVPMENU",
		};
	}

		--------------------------
		--- Level 90 - Weapons ---
		--------------------------

	AtlasLoot_Data["PVP90Weapons"] = {
		["Normal"] = {
			{
				{ 1, 91749, "", "=q4=Malevolent Gladiator's Render", "=ds=#h1#, #w13#", "#HONOR:1750#" },
				{ 2, 91745, "", "=q4=Malevolent Gladiator's Ripper", "=ds=#h1#, #w13#", "#HONOR:1750#" },
				{ 4, 91484, "", "=q4=Malevolent Gladiator's Spellblade", "=ds=#h1#, #w4#", "#HONOR:2250#" },
				{ 5, 91743, "", "=q4=Malevolent Gladiator's Shanker", "=ds=#h1#, #w4#", "#HONOR:1750#" },
				{ 7, 91450, "", "=q4=Malevolent Gladiator's Quickblade", "=ds=#h1#, #w10#", "#HONOR:1750#" },
				{ 8, 91761, "", "=q4=Malevolent Gladiator's Slicer", "=ds=#h1#, #w10#", "#HONOR:1750#" },
				{ 9, 91446, "", "=q4=Malevolent Gladiator's Cleaver", "=ds=#h1#, #w1#", "#HONOR:1750#" },
				{ 10, 91757, "", "=q4=Malevolent Gladiator's Hacker", "=ds=#h1#, #w1#", "#HONOR:1750#" },
				{ 16, 91759, "", "=q4=Malevolent Gladiator's Bonecracker", "=ds=#h1#, #w6#", "#HONOR:1750#" },
				{ 17, 91556, "", "=q4=Malevolent Gladiator's Gavel", "=ds=#h1#, #w6#", "#HONOR:2250#" },
				{ 18, 91448, "", "=q4=Malevolent Gladiator's Pummeler", "=ds=#h1#, #w6#", "#HONOR:1750#" },
				{ 20, 91444, "", "=q4=Malevolent Gladiator's Greatsword", "=ds=#h2#, #w10#", "#HONOR:3500#" },
				{ 21, 91440, "", "=q4=Malevolent Gladiator's Decapitator", "=ds=#h2#, #w1#", "#HONOR:3500#" },
				{ 22, 91442, "", "=q4=Malevolent Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "#HONOR:3500#" },
				{ 24, 91660, "", "=q4=Malevolent Gladiator's Pike", "=ds=#w7#", "#HONOR:3500#" },
				{ 26, 91486, "", "=q4=Malevolent Gladiator's Battle Staff", "=ds=#w9#", "#HONOR:3500#" },
				{ 27, 91560, "", "=q4=Malevolent Gladiator's Energy Staff", "=ds=#w9#", "#HONOR:3500#" },
				{ 28, 91535, "", "=q4=Malevolent Gladiator's Staff", "=ds=#w9#", "#HONOR:3500#" },
			};
			{
				{ 1, 91482, "", "=q4=Malevolent Gladiator's Barrier", "=ds=#w8#", "#HONOR:1250#" },
				{ 2, 91558, "", "=q4=Malevolent Gladiator's Redoubt", "=ds=#w8#", "#HONOR:1250#" },
				{ 3, 91771, "", "=q4=Malevolent Gladiator's Shield Wall", "=ds=#w8#", "#HONOR:1250#" },
				{ 5, 91460, "", "=q4=Malevolent Gladiator's Longbow", "=ds=#w2#", "#HONOR:3500#" },
				{ 6, 91554, "", "=q4=Malevolent Gladiator's Rifle", "=ds=#w5#", "#HONOR:3500#" },
				{ 16, 91494, "", "=q4=Malevolent Gladiator's Reprieve", "=ds=#s15#", "#HONOR:1250#" },
				{ 17, 91480, "", "=q4=Malevolent Gladiator's Endgame", "=ds=#s15#", "#HONOR:1250#" }
			};
		};
		info = {
			name = AL["PvP Weapons"].." - "..AL["ilvl 470"], "=q5="..AL["Level 90"],
			module = moduleName, menu = "PVPMENU",
		};
	}

--[[	AtlasLoot_Data["PVP90Weapons2"] = {
		["Normal"] = {
			{
				{ 1, 85129, "", "=q4=Malevolent Gladiator's Render", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 2, 85128, "", "=q4=Malevolent Gladiator's Ripper", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 4, 85127, "", "=q4=Malevolent Gladiator's Spellblade", "=ds=#h1#, #w4#", "#CONQUEST:2500#" },
				{ 5, 85133, "", "=q4=Malevolent Gladiator's Shanker", "=ds=#h1#, #w4#", "#CONQUEST:1750#" },
				{ 7, 85135, "", "=q4=Malevolent Gladiator's Quickblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 8, 85134, "", "=q4=Malevolent Gladiator's Slicer", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 9, 85131, "", "=q4=Malevolent Gladiator's Cleaver", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 10, 85132, "", "=q4=Malevolent Gladiator's Hacker", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 16, 85136, "", "=q4=Malevolent Gladiator's Bonecracker", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 17, 85137, "", "=q4=Malevolent Gladiator's Gavel", "=ds=#h1#, #w6#", "#CONQUEST:2500#" },
				{ 18, 85130, "", "=q4=Malevolent Gladiator's Pummeler", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 20, 85112, "", "=q4=Malevolent Gladiator's Greatsword", "=ds=#h2#, #w10#", "#CONQUEST:3500#" },
				{ 21, 85113, "", "=q4=Malevolent Gladiator's Decapitator", "=ds=#h2#, #w1#", "#CONQUEST:3500#" },
				{ 22, 85107, "", "=q4=Malevolent Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "#CONQUEST:3500#" },
				{ 24, 85108, "", "=q4=Malevolent Gladiator's Pike", "=ds=#w7#", "#CONQUEST:3500#" },
				{ 26, 85109, "", "=q4=Malevolent Gladiator's Battle Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 27, 85110, "", "=q4=Malevolent Gladiator's Energy Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 28, 85111, "", "=q4=Malevolent Gladiator's Staff", "=ds=#w9#", "#CONQUEST:3500#" },
			};
			{
				{ 1, 85125, "", "=q4=Malevolent Gladiator's Barrier", "=ds=#w8#", "#CONQUEST:1000#" },
				{ 2, 85126, "", "=q4=Malevolent Gladiator's Redoubt", "=ds=#w8#", "#CONQUEST:1000#" },
				{ 3, 85124, "", "=q4=Malevolent Gladiator's Shield Wall", "=ds=#w8#", "#CONQUEST:1000#" },
				{ 5, 85119, "", "=q4=Malevolent Gladiator's Longbow", "=ds=#w2#", "#CONQUEST:3500#" },
				{ 6, 85123, "", "=q4=Malevolent Gladiator's Rifle", "=ds=#w5#", "#CONQUEST:3500#" },
				{ 16, 85115, "", "=q4=Malevolent Gladiator's Reprieve", "=ds=#s15#", "#CONQUEST:1000#" },
				{ 17, 85114, "", "=q4=Malevolent Gladiator's Endgame", "=ds=#s15#", "#CONQUEST:1000#" }
			};
		};
		info = {
			name = AL["PvP Weapons"].." - "..AL["ilvl 490"], "=q5="..AL["Level 90"],
			module = moduleName, menu = "PVPMENU",
		};
	}--]]

	AtlasLoot_Data["PVP90WeaponsTyrannicalElite"] = {
		["Normal"] = {
			{
				{ 1, 91395, "", "=q4=Tyrannical Gladiator's Fleshslicer", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 2, 91397, "", "=q4=Tyrannical Gladiator's Render", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 3, 91393, "", "=q4=Tyrannical Gladiator's Ripper", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 5, 91132, "", "=q4=Tyrannical Gladiator's Spellblade", "=ds=#h1#, #w4#", "#CONQUEST:2250#" },
				{ 6, 91391, "", "=q4=Tyrannical Gladiator's Shanker", "=ds=#h1#, #w4#", "#CONQUEST:1750#" },
				{ 7, 91200, "", "=q4=Tyrannical Gladiator's Shiv", "=ds=#h4#, #w4#", "#CONQUEST:1750#" },
				{ 9, 91399, "", "=q4=Tyrannical Gladiator's Mageblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 10, 91098, "", "=q4=Tyrannical Gladiator's Quickblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 11, 91409, "", "=q4=Tyrannical Gladiator's Slicer", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 13, 91094, "", "=q4=Tyrannical Gladiator's Cleaver", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 14, 91405, "", "=q4=Tyrannical Gladiator's Hacker", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 16, 91407, "", "=q4=Tyrannical Gladiator's Bonecracker", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 17, 91204, "", "=q4=Tyrannical Gladiator's Gavel", "=ds=#h1#, #w6#", "#CONQUEST:2250#" },
				{ 18, 91096, "", "=q4=Tyrannical Gladiator's Pummeler", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 20, 91092, "", "=q4=Tyrannical Gladiator's Greatsword", "=ds=#h2#, #w10#", "#CONQUEST:3500#" },
				{ 21, 91088, "", "=q4=Tyrannical Gladiator's Decapitator", "=ds=#h2#, #w1#", "#CONQUEST:3500#" },
				{ 22, 91090, "", "=q4=Tyrannical Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "#CONQUEST:3500#" },
				{ 24, 91308, "", "=q4=Tyrannical Gladiator's Pike", "=ds=#w7#", "#CONQUEST:3500#" },
				{ 26, 91134, "", "=q4=Tyrannical Gladiator's Battle Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 27, 91208, "", "=q4=Tyrannical Gladiator's Energy Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 28, 91183, "", "=q4=Tyrannical Gladiator's Staff", "=ds=#w9#", "#CONQUEST:3500#" },
			};
			{
				{ 1, 91130, "", "=q4=Tyrannical Gladiator's Barrier", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 2, 91206, "", "=q4=Tyrannical Gladiator's Redoubt", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 3, 91419, "", "=q4=Tyrannical Gladiator's Shield Wall", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 5, 91146, "", "=q4=Tyrannical Gladiator's Heavy Crossbow", "=ds=#w3#", "#CONQUEST:3500#" },
				{ 6, 91108, "", "=q4=Tyrannical Gladiator's Longbow", "=ds=#w2#", "#CONQUEST:3500#" },
				{ 7, 91202, "", "=q4=Tyrannical Gladiator's Rifle", "=ds=#w5#", "#CONQUEST:3500#" },
				{ 16, 91403, "", "=q4=Tyrannical Gladiator's Baton of Light", "=ds=#w12#", "#CONQUEST:3500#" },
				{ 16, 91144, "", "=q4=Tyrannical Gladiator's Touch of Defeat", "=ds=#w12#", "#CONQUEST:3500#" },
				{ 18, 91142, "", "=q4=Tyrannical Gladiator's Reprieve", "=ds=#s15#", "#CONQUEST:1250#" },
				{ 19, 91128, "", "=q4=Tyrannical Gladiator's Endgame", "=ds=#s15#", "#CONQUEST:1250#" },
			};
		};
		info = {
			name = AL["PvP Weapons"].." - "..AL["ilvl 512"], "=q5="..AL["Level 90"],
			module = moduleName, menu = "PVPMENU",
		};
	}

	AtlasLoot_Data["PVP90WeaponsTyrannical"] = {
		["Normal_A"] = {
			{
				{ 1, 91394, "", "=q4=Tyrannical Gladiator's Fleshslicer", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 2, 91396, "", "=q4=Tyrannical Gladiator's Render", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 3, 91392, "", "=q4=Tyrannical Gladiator's Ripper", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 5, 91131, "", "=q4=Tyrannical Gladiator's Spellblade", "=ds=#h1#, #w4#", "#CONQUEST:2250#" },
				{ 6, 91390, "", "=q4=Tyrannical Gladiator's Shanker", "=ds=#h1#, #w4#", "#CONQUEST:1750#" },
				{ 7, 91199, "", "=q4=Tyrannical Gladiator's Shiv", "=ds=#h4#, #w4#", "#CONQUEST:1750#" },
				{ 9, 91398, "", "=q4=Tyrannical Gladiator's Mageblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 10, 91097, "", "=q4=Tyrannical Gladiator's Quickblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 11, 91408, "", "=q4=Tyrannical Gladiator's Slicer", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 13, 91093, "", "=q4=Tyrannical Gladiator's Cleaver", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 14, 91404, "", "=q4=Tyrannical Gladiator's Hacker", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 16, 91406, "", "=q4=Tyrannical Gladiator's Bonecracker", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 17, 91203, "", "=q4=Tyrannical Gladiator's Gavel", "=ds=#h1#, #w6#", "#CONQUEST:2250#" },
				{ 18, 91095, "", "=q4=Tyrannical Gladiator's Pummeler", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 20, 91091, "", "=q4=Tyrannical Gladiator's Greatsword", "=ds=#h2#, #w10#", "#CONQUEST:3500#" },
				{ 21, 91087, "", "=q4=Tyrannical Gladiator's Decapitator", "=ds=#h2#, #w1#", "#CONQUEST:3500#" },
				{ 22, 91089, "", "=q4=Tyrannical Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "#CONQUEST:3500#" },
				{ 24, 91307, "", "=q4=Tyrannical Gladiator's Pike", "=ds=#w7#", "#CONQUEST:3500#" },
				{ 26, 91133, "", "=q4=Tyrannical Gladiator's Battle Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 27, 91207, "", "=q4=Tyrannical Gladiator's Energy Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 28, 91182, "", "=q4=Tyrannical Gladiator's Staff", "=ds=#w9#", "#CONQUEST:3500#" },
			};
			{
				{ 1, 91129, "", "=q4=Tyrannical Gladiator's Barrier", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 2, 91205, "", "=q4=Tyrannical Gladiator's Redoubt", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 3, 91418, "", "=q4=Tyrannical Gladiator's Shield Wall", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 5, 91145, "", "=q4=Tyrannical Gladiator's Heavy Crossbow", "=ds=#w3#", "#CONQUEST:3500#" },
				{ 6, 91107, "", "=q4=Tyrannical Gladiator's Longbow", "=ds=#w2#", "#CONQUEST:3500#" },
				{ 7, 91201, "", "=q4=Tyrannical Gladiator's Rifle", "=ds=#w5#", "#CONQUEST:3500#" },
				{ 16, 91402, "", "=q4=Tyrannical Gladiator's Baton of Light", "=ds=#w12#", "#CONQUEST:3500#" },
				{ 17, 91143, "", "=q4=Tyrannical Gladiator's Touch of Defeat", "=ds=#w12#", "#CONQUEST:3500#" },
				{ 19, 91141, "", "=q4=Tyrannical Gladiator's Reprieve", "=ds=#s15#", "#CONQUEST:1250#" },
				{ 20, 91127, "", "=q4=Tyrannical Gladiator's Endgame", "=ds=#s15#", "#CONQUEST:1250#" },
			};
		};
		["Normal_H"] = {
			{
				{ 1, 94314, "", "=q4=Tyrannical Gladiator's Fleshslicer", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 2, 94321, "", "=q4=Tyrannical Gladiator's Render", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 3, 94316, "", "=q4=Tyrannical Gladiator's Ripper", "=ds=#h1#, #w13#", "#CONQUEST:1750#" },
				{ 5, 94306, "", "=q4=Tyrannical Gladiator's Spellblade", "=ds=#h1#, #w4#", "#CONQUEST:2250#" },
				{ 6, 94315, "", "=q4=Tyrannical Gladiator's Shanker", "=ds=#h1#, #w4#", "#CONQUEST:1750#" },
				{ 7, 94301, "", "=q4=Tyrannical Gladiator's Shiv", "=ds=#h4#, #w4#", "#CONQUEST:1750#" },
				{ 9, 94310, "", "=q4=Tyrannical Gladiator's Mageblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 10, 94325, "", "=q4=Tyrannical Gladiator's Quickblade", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 11, 94318, "", "=q4=Tyrannical Gladiator's Slicer", "=ds=#h1#, #w10#", "#CONQUEST:1750#" },
				{ 13, 94312, "", "=q4=Tyrannical Gladiator's Cleaver", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 14, 94317, "", "=q4=Tyrannical Gladiator's Hacker", "=ds=#h1#, #w1#", "#CONQUEST:1750#" },
				{ 16, 94322, "", "=q4=Tyrannical Gladiator's Bonecracker", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 17, 94302, "", "=q4=Tyrannical Gladiator's Gavel", "=ds=#h1#, #w6#", "#CONQUEST:2250#" },
				{ 18, 94304, "", "=q4=Tyrannical Gladiator's Pummeler", "=ds=#h1#, #w6#", "#CONQUEST:1750#" },
				{ 20, 94311, "", "=q4=Tyrannical Gladiator's Greatsword", "=ds=#h2#, #w10#", "#CONQUEST:3500#" },
				{ 21, 94323, "", "=q4=Tyrannical Gladiator's Decapitator", "=ds=#h2#, #w1#", "#CONQUEST:3500#" },
				{ 22, 94324, "", "=q4=Tyrannical Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "#CONQUEST:3500#" },
				{ 24, 94319, "", "=q4=Tyrannical Gladiator's Pike", "=ds=#w7#", "#CONQUEST:3500#" },
				{ 26, 94313, "", "=q4=Tyrannical Gladiator's Battle Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 27, 94320, "", "=q4=Tyrannical Gladiator's Energy Staff", "=ds=#w9#", "#CONQUEST:3500#" },
				{ 28, 94307, "", "=q4=Tyrannical Gladiator's Staff", "=ds=#w9#", "#CONQUEST:3500#" },
			};
			{
				{ 1, 94501, "", "=q4=Tyrannical Gladiator's Barrier", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 2, 94498, "", "=q4=Tyrannical Gladiator's Redoubt", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 3, 94500, "", "=q4=Tyrannical Gladiator's Shield Wall", "=ds=#w8#", "#CONQUEST:1250#" },
				{ 5, 94326, "", "=q4=Tyrannical Gladiator's Heavy Crossbow", "=ds=#w3#", "#CONQUEST:3500#" },
				{ 6, 94303, "", "=q4=Tyrannical Gladiator's Longbow", "=ds=#w2#", "#CONQUEST:3500#" },
				{ 7, 94309, "", "=q4=Tyrannical Gladiator's Rifle", "=ds=#w5#", "#CONQUEST:3500#" },
				{ 16, 94308, "", "=q4=Tyrannical Gladiator's Baton of Light", "=ds=#w12#", "#CONQUEST:3500#" },
				{ 17, 94305, "", "=q4=Tyrannical Gladiator's Touch of Defeat", "=ds=#w12#", "#CONQUEST:3500#" },
				{ 19, 94499, "", "=q4=Tyrannical Gladiator's Reprieve", "=ds=#s15#", "#CONQUEST:1250#" },
				{ 20, 94502, "", "=q4=Tyrannical Gladiator's Endgame", "=ds=#s15#", "#CONQUEST:1250#" },
			};
		};
		info = {
			name = AL["PvP Weapons"].." - "..AL["ilvl 498"], "=q5="..AL["Level 90"],
			module = moduleName, menu = "PVPMENU",
		};
	}

	--------------------------
	--- Sets & Collections ---
	--------------------------

		---------------------------------
		--- Challenge Mode Armor Sets ---
		---------------------------------

	AtlasLoot_Data["ChallengeModeDeathKnight"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_deathknight_frostpresence", "=q6=Lich Lord Plate", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90053, "", "=q4=Crown of the Lich Lord", "=ds=#s1#, #a4#", ""};
				{ 3, 90055, "", "=q4=Shoulderguards of the Lich Lord", "=ds=#s3#, #a4#", ""};
				{ 4, 90051, "", "=q4=Chestguard of the Lich Lord", "=ds=#s5#, #a4#", ""};
				{ 5, 90056, "", "=q4=Bracers of the Lich Lord", "=ds=#s8#, #a4#", ""};
				{ 6, 90052, "", "=q4=Grasps of the Lich Lord", "=ds=#s9#, #a4#", ""};
				{ 7, 90049, "", "=q4=Girdle of the Lich Lord", "=ds=#s10#, #a4#", ""};
				{ 8, 90054, "", "=q4=Legplates of the Lich Lord", "=ds=#s11#, #a4#", ""};
				{ 9, 90050, "", "=q4=Treads of the Lich Lord", "=ds=#s12#, #a4#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeDruid"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_druid_catform", "=q6=Cycle Armor", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90062, "", "=q4=Hood of the Cycle", "=ds=#s1#, #a2#", ""};
				{ 3, 90065, "", "=q4=Branches of the Cycle", "=ds=#s3#, #a2#", ""};
				{ 4, 90064, "", "=q4=Robes of the Cycle", "=ds=#s5#, #a2#", ""};
				{ 5, 90066, "", "=q4=Bracers of the Cycle", "=ds=#s8#, #a2#", ""};
				{ 6, 90061, "", "=q4=Gloves of the Cycle", "=ds=#s9#, #a2#", ""};
				{ 7, 90059, "", "=q4=Waistguard of the Cycle", "=ds=#s10#, #a2#", ""};
				{ 8, 90063, "", "=q4=Leggings of the Cycle", "=ds=#s11#, #a2#", ""};
				{ 9, 90060, "", "=q4=Sandals of the Cycle", "=ds=#s12#, #a2#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeHunter"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_weapon_bow_07", "=q6=Howling Beast Set", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90072, "", "=q4=Helm of the Howling Beast", "=ds=#s1#, #a3#", ""};
				{ 3, 90074, "", "=q4=Shoulderguards of the Howling Beast", "=ds=#s3#, #a3#", ""};
				{ 4, 90070, "", "=q4=Chestguard of the Howling Beast", "=ds=#s5#, #a3#", ""};
				{ 5, 90075, "", "=q4=Wristwraps of the Howling Beast", "=ds=#s8#, #a3#", ""};
				{ 6, 90071, "", "=q4=Grips of the Howling Beast", "=ds=#s9#, #a3#", ""};
				{ 7, 90068, "", "=q4=Cinch of the Howling Beast", "=ds=#s10#, #a3#", ""};
				{ 8, 90073, "", "=q4=Legguards of the Howling Beast", "=ds=#s11#, #a3#", ""};
				{ 9, 90069, "", "=q4=Boots of the Howling Beast", "=ds=#s12#, #a3#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeMage"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_staff_13", "=q6=Elemental Triad Regalia", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90082, "", "=q4=Hood of the Elemental Triad", "=ds=#s1#, #a1#", ""};
				{ 3, 90085, "", "=q4=Spaulders of the Elemental Triad", "=ds=#s3#, #a1#", ""};
				{ 4, 90084, "", "=q4=Robes of the Elemental Triad", "=ds=#s5#, #a1#", ""};
				{ 5, 90086, "", "=q4=Bracers of the Elemental Triad", "=ds=#s8#, #a1#", ""};
				{ 6, 90081, "", "=q4=Gloves of the Elemental Triad", "=ds=#s9#, #a1#", ""};
				{ 7, 90079, "", "=q4=Girdle of the Elemental Triad", "=ds=#s10#, #a1#", ""};
				{ 8, 90083, "", "=q4=Leggings of the Elemental Triad", "=ds=#s11#, #a1#", ""};
				{ 9, 90080, "", "=q4=Boots of the Elemental Triad", "=ds=#s12#, #a1#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeMonk"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_windwalker_spec", "=q6=Regal Lord Armor", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90092, "", "=q4=Crown of the Regal Lord", "=ds=#s1#, #a2#", ""};
				{ 3, 90094, "", "=q4=Shoulderguards of the Regal Lord", "=ds=#s3#, #a2#", ""};
				{ 4, 90090, "", "=q4=Chestwrap of the Regal Lord", "=ds=#s5#, #a2#", ""};
				{ 5, 90095, "", "=q4=Bracers of the Regal Lord", "=ds=#s8#, #a2#", ""};
				{ 6, 90091, "", "=q4=Handwraps of the Regal Lord", "=ds=#s9#, #a2#", ""};
				{ 7, 90088, "", "=q4=Greatbelt of the Regal Lord", "=ds=#s10#, #a2#", ""};
				{ 8, 90093, "", "=q4=Legwraps of the Regal Lord", "=ds=#s11#, #a2#", ""};
				{ 9, 90089, "", "=q4=Treads of the Regal Lord", "=ds=#s12#, #a2#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModePaladin"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_HolyBolt", "=q6=Holy Warrior Plate", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90100, "", "=q4=Greathelm of the Holy Warrior", "=ds=#s1#, #a4#", ""};
				{ 3, 90102, "", "=q4=Shoulderplate of the Holy Warrior", "=ds=#s3#, #a4#", ""};
				{ 4, 90098, "", "=q4=Chestplate of the Holy Warrior", "=ds=#s5#, #a4#", ""};
				{ 5, 90103, "", "=q4=Wristguards of the Holy Warrior", "=ds=#s8#, #a4#", ""};
				{ 6, 90099, "", "=q4=Gauntlets of the Holy Warrior", "=ds=#s9#, #a4#", ""};
				{ 7, 90096, "", "=q4=Girdle of the Holy Warrior", "=ds=#s10#, #a4#", ""};
				{ 8, 90101, "", "=q4=Legplates of the Holy Warrior", "=ds=#s11#, #a4#", ""};
				{ 9, 90097, "", "=q4=Greatboots of the Holy Warrior", "=ds=#s12#, #a4#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModePriest"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_holy_guardianspirit", "=q6=Light Regalia", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90116, "", "=q4=Cowl of the Light", "=ds=#s1#, #a1#", ""};
				{ 3, 90113, "", "=q4=Pauldrons of the Light", "=ds=#s3#, #a1#", ""};
				{ 4, 90114, "", "=q4=Robes of the Light", "=ds=#s5#, #a1#", ""};
				{ 5, 90112, "", "=q4=Bracers of the Light", "=ds=#s8#, #a1#", ""};
				{ 6, 90115, "", "=q4=Hands of the Light", "=ds=#s9#, #a1#", ""};
				{ 7, 90110, "", "=q4=Cord of the Light", "=ds=#s10#, #a1#", ""};
				{ 8, 90117, "", "=q4=Leggings of the Light", "=ds=#s11#, #a1#", ""};
				{ 9, 90111, "", "=q4=Steps of the Light", "=ds=#s12#, #a1#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeRogue"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_throwingknife_04", "=q6=Silent Assassin Armor", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90120, "", "=q4=Hood of the Silent Assassin", "=ds=#s1#, #a2#", ""};
				{ 3, 90125, "", "=q4=Spaulders of the Silent Assassin", "=ds=#s3#, #a2#", ""};
				{ 4, 90122, "", "=q4=Shadowwrap of the Silent Assassin", "=ds=#s5#, #a2#", ""};
				{ 5, 90126, "", "=q4=Bracers of the Silent Assassin", "=ds=#s8#, #a2#", ""};
				{ 6, 90123, "", "=q4=Gloves of the Silent Assassin", "=ds=#s9#, #a2#", ""};
				{ 7, 90119, "", "=q4=Girdle of the Silent Assassin", "=ds=#s10#, #a2#", ""};
				{ 8, 90124, "", "=q4=Leggings of the Silent Assassin", "=ds=#s11#, #a2#", ""};
				{ 9, 90121, "", "=q4=Tabi of the Silent Assassin", "=ds=#s12#, #a2#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeShaman"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Nature_Lightning", "=q6=Windfury Set", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90132, "", "=q4=Windfury Mask", "=ds=#s1#, #a3#", ""};
				{ 3, 90134, "", "=q4=Windfury Spirit Guides", "=ds=#s3#, #a3#", ""};
				{ 4, 90130, "", "=q4=Windfury Harness", "=ds=#s5#, #a3#", ""};
				{ 5, 90127, "", "=q4=Windfury Bracers", "=ds=#s8#, #a3#", ""};
				{ 6, 90131, "", "=q4=Windfury Crushers", "=ds=#s9#, #a3#", ""};
				{ 7, 90128, "", "=q4=Windfury Belt", "=ds=#s10#, #a3#", ""};
				{ 8, 90133, "", "=q4=Windfury Legguards", "=ds=#s11#, #a3#", ""};
				{ 9, 90129, "", "=q4=Windfury Sandals", "=ds=#s12#, #a3#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeWarlock"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_drowsy", "=q6=Betrayer Regalia", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90142, "", "=q4=Horns of the Betrayer", "=ds=#s1#, #a1#", ""};
				{ 3, 90138, "", "=q4=Amice of the Betrayer", "=ds=#s3#, #a1#", ""};
				{ 4, 90140, "", "=q4=Robes of the Betrayer", "=ds=#s5#, #a1#", ""};
				{ 5, 90139, "", "=q4=Bracers of the Betrayer", "=ds=#s8#, #a1#", ""};
				{ 6, 90141, "", "=q4=Handguards of the Betrayer", "=ds=#s9#, #a1#", ""};
				{ 7, 90136, "", "=q4=Belt of the Betrayer", "=ds=#s10#, #a1#", ""};
				{ 8, 90143, "", "=q4=Leggings of the Betrayer", "=ds=#s11#, #a1#", ""};
				{ 9, 90137, "", "=q4=Boots of the Betrayer", "=ds=#s12#, #a1#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

	AtlasLoot_Data["ChallengeModeWarrior"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_warrior_innerrage", "=q6=Golden King Plate", "=q5=#ACHIEVEMENTID:6378#"};
				{ 2, 90151, "", "=q4=Crown of the Golden King", "=ds=#s1#, #a4#", ""};
				{ 3, 90153, "", "=q4=Mantle of the Golden King", "=ds=#s3#, #a4#", ""};
				{ 4, 90149, "", "=q4=Chestplate of the Golden King", "=ds=#s5#, #a4#", ""};
				{ 5, 90154, "", "=q4=Bracers of the Golden King", "=ds=#s8#, #a4#", ""};
				{ 6, 90150, "", "=q4=Reach of the Golden King", "=ds=#s9#, #a4#", ""};
				{ 7, 90147, "", "=q4=Girdle of the Golden King", "=ds=#s10#, #a4#", ""};
				{ 8, 90152, "", "=q4=Greaves of the Golden King", "=ds=#s11#, #a4#", ""};
				{ 9, 90148, "", "=q4=Greatboots of the Golden King", "=ds=#s12#, #a4#", ""};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			module = moduleName, menu = "CHALLENGEMODESET",
		};
	}

		--------------------------
		--- Tier 14 Sets (T14) ---
		--------------------------

	AtlasLoot_Data["T14DeathKnightDPS"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_deathknight_frostpresence", "=q6=#t14s10_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86676, "", "=q4=Helmet of the Lost Catacomb", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86674, "", "=q4=Pauldrons of the Lost Catacomb", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86678, "", "=q4=Breastplate of the Lost Catacomb", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86677, "", "=q4=Gauntlets of the Lost Catacomb", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86675, "", "=q4=Greaves of the Lost Catacomb", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_deathknight_frostpresence", "=q6=#t14s10_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85336, "", "=q4=Helmet of the Lost Catacomb", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85334, "", "=q4=Pauldrons of the Lost Catacomb", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85338, "", "=q4=Breastplate of the Lost Catacomb", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85337, "", "=q4=Gauntlets of the Lost Catacomb", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85335, "", "=q4=Greaves of the Lost Catacomb", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_deathknight_frostpresence", "=q6=#t14s10_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 86915, "", "=q4=Helmet of the Lost Catacomb", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 86917, "", "=q4=Pauldrons of the Lost Catacomb", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 86913, "", "=q4=Breastplate of the Lost Catacomb", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 86914, "", "=q4=Gauntlets of the Lost Catacomb", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 86916, "", "=q4=Greaves of the Lost Catacomb", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"].." - "..AL["DPS"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14DeathKnightTank"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_deathknight_bloodpresence", "=q6=#t14s10_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86656, "", "=q4=Faceguard of the Lost Catacomb", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86654, "", "=q4=Shoulderguards of the Lost Catacomb", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86658, "", "=q4=Chestguard of the Lost Catacomb", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86657, "", "=q4=Handguards of the Lost Catacomb", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86655, "", "=q4=Legguards of the Lost Catacomb", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_deathknight_bloodpresence", "=q6=#t14s10_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85316, "", "=q4=Faceguard of the Lost Catacomb", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85314, "", "=q4=Shoulderguards of the Lost Catacomb", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85318, "", "=q4=Chestguard of the Lost Catacomb", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85317, "", "=q4=Handguards of the Lost Catacomb", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85315, "", "=q4=Legguards of the Lost Catacomb", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_deathknight_bloodpresence", "=q6=#t14s10_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 86920, "", "=q4=Faceguard of the Lost Catacomb", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 86922, "", "=q4=Shoulderguards of the Lost Catacomb", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 86918, "", "=q4=Chestguard of the Lost Catacomb", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 86919, "", "=q4=Handguards of the Lost Catacomb", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 86921, "", "=q4=Legguards of the Lost Catacomb", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"].." - "..AL["Tanking"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14DruidRestoration"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_healingtouch", "=q6=#t14s1_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86697, "", "=q4=Eternal Blossom Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86694, "", "=q4=Eternal Blossom Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86695, "", "=q4=Eternal Blossom Robes", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86698, "", "=q4=Eternal Blossom Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86696, "", "=q4=Eternal Blossom Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_nature_healingtouch", "=q6=#t14s1_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85357, "", "=q4=Eternal Blossom Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85354, "", "=q4=Eternal Blossom Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85355, "", "=q4=Eternal Blossom Robes", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85358, "", "=q4=Eternal Blossom Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85356, "", "=q4=Eternal Blossom Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_nature_healingtouch", "=q6=#t14s1_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 86929, "", "=q4=Eternal Blossom Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 86932, "", "=q4=Eternal Blossom Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 86931, "", "=q4=Eternal Blossom Robes", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 86928, "", "=q4=Eternal Blossom Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 86930, "", "=q4=Eternal Blossom Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Restoration"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14DruidDPS"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_druid_catform", "=q6=#t14s1_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86651, "", "=q4=Eternal Blossom Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86649, "", "=q4=Eternal Blossom Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86653, "", "=q4=Eternal Blossom Raiment", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86652, "", "=q4=Eternal Blossom Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86650, "", "=q4=Eternal Blossom Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "ability_druid_catform", "=q6=#t14s1_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85311, "", "=q4=Eternal Blossom Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85309, "", "=q4=Eternal Blossom Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85313, "", "=q4=Eternal Blossom Raiment", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85312, "", "=q4=Eternal Blossom Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85310, "", "=q4=Eternal Blossom Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "ability_druid_catform", "=q6=#t14s1_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 86925, "", "=q4=Eternal Blossom Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 86927, "", "=q4=Eternal Blossom Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 86923, "", "=q4=Eternal Blossom Raiment", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 86924, "", "=q4=Eternal Blossom Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 86926, "", "=q4=Eternal Blossom Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Feral"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14DruidBalance"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_starfall", "=q6=#t14s1_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86647, "", "=q4=Eternal Blossom Cover", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86644, "", "=q4=Eternal Blossom Shoulderwraps", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86645, "", "=q4=Eternal Blossom Vestment", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86648, "", "=q4=Eternal Blossom Gloves", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86646, "", "=q4=Eternal Blossom Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_nature_starfall", "=q6=#t14s1_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85307, "", "=q4=Eternal Blossom Cover", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85304, "", "=q4=Eternal Blossom Shoulderwraps", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85305, "", "=q4=Eternal Blossom Vestment", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85308, "", "=q4=Eternal Blossom Gloves", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85306, "", "=q4=Eternal Blossom Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_nature_starfall", "=q6=#t14s1_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 86934, "", "=q4=Eternal Blossom Cover", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 86937, "", "=q4=Eternal Blossom Shoulderwraps", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 86936, "", "=q4=Eternal Blossom Vestment", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 86933, "", "=q4=Eternal Blossom Gloves", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 86935, "", "=q4=Eternal Blossom Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Balance"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14DruidTank"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_racial_bearform", "=q6=#t14s1_4#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86721, "", "=q4=Eternal Blossom Headguard", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86723, "", "=q4=Eternal Blossom Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86719, "", "=q4=Eternal Blossom Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86720, "", "=q4=Eternal Blossom Handguards", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86722, "", "=q4=Eternal Blossom Breeches", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "ability_racial_bearform", "=q6=#t14s1_4#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85381, "", "=q4=Eternal Blossom Headguard", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85383, "", "=q4=Eternal Blossom Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85379, "", "=q4=Eternal Blossom Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85380, "", "=q4=Eternal Blossom Handguards", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85382, "", "=q4=Eternal Blossom Breeches", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "ability_racial_bearform", "=q6=#t14s1_4#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 86940, "", "=q4=Eternal Blossom Headguard", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 86942, "", "=q4=Eternal Blossom Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 86938, "", "=q4=Eternal Blossom Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 86939, "", "=q4=Eternal Blossom Handguards", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 86941, "", "=q4=Eternal Blossom Breeches", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Guardian"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14Hunter"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_weapon_bow_07", "=q6=#t14s2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86636, "", "=q4=Yaungol Slayer's Headguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86634, "", "=q4=Yaungol Slayer's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86638, "", "=q4=Yaungol Slayer's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86637, "", "=q4=Yaungol Slayer's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86635, "", "=q4=Yaungol Slayer's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "inv_weapon_bow_07", "=q6=#t14s2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85296, "", "=q4=Yaungol Slayer's Headguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85294, "", "=q4=Yaungol Slayer's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85298, "", "=q4=Yaungol Slayer's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85297, "", "=q4=Yaungol Slayer's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85295, "", "=q4=Yaungol Slayer's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "inv_weapon_bow_07", "=q6=#t14s2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87004, "", "=q4=Yaungol Slayer's Headguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87006, "", "=q4=Yaungol Slayer's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87002, "", "=q4=Yaungol Slayer's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87003, "", "=q4=Yaungol Slayer's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87005, "", "=q4=Yaungol Slayer's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14Mage"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_staff_13", "=q6=#t14s3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86717, "", "=q4=Hood of the Burning Scroll", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86714, "", "=q4=Mantle of the Burning Scroll", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86715, "", "=q4=Robes of the Burning Scroll", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86718, "", "=q4=Gloves of the Burning Scroll", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86716, "", "=q4=Leggings of the Burning Scroll", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "inv_staff_13", "=q6=#t14s3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85377, "", "=q4=Hood of the Burning Scroll", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85374, "", "=q4=Mantle of the Burning Scroll", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85375, "", "=q4=Robes of the Burning Scroll", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85378, "", "=q4=Gloves of the Burning Scroll", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85376, "", "=q4=Leggings of the Burning Scroll", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "inv_staff_13", "=q6=#t14s3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87008, "", "=q4=Hood of the Burning Scroll", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87011, "", "=q4=Mantle of the Burning Scroll", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87010, "", "=q4=Robes of the Burning Scroll", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87007, "", "=q4=Gloves of the Burning Scroll", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87009, "", "=q4=Leggings of the Burning Scroll", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14MonkTank"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_brewmaster_spec", "=q6=#t14s11_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86726, "", "=q4=Red Crane Crown", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86724, "", "=q4=Red Crane Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86728, "", "=q4=Red Crane Chestguard", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86727, "", "=q4=Red Crane Gauntlets", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86725, "", "=q4=Red Crane Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_monk_brewmaster_spec", "=q6=#t14s11_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85386, "", "=q4=Red Crane Crown", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85384, "", "=q4=Red Crane Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85388, "", "=q4=Red Crane Chestguard", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85387, "", "=q4=Red Crane Gauntlets", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85385, "", "=q4=Red Crane Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_monk_brewmaster_spec", "=q6=#t14s11_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87096, "", "=q4=Red Crane Crown", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87098, "", "=q4=Red Crane Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87094, "", "=q4=Red Crane Chestguard", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87095, "", "=q4=Red Crane Gauntlets", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87097, "", "=q4=Red Crane Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"].." - "..ALIL["Brewmaster"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14MonkDPS"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_windwalker_spec", "=q6=#t14s11_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86736, "", "=q4=Red Crane Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86738, "", "=q4=Red Crane Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86734, "", "=q4=Red Crane Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86735, "", "=q4=Red Crane Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86737, "", "=q4=Red Crane Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_monk_windwalker_spec", "=q6=#t14s11_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85396, "", "=q4=Red Crane Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85398, "", "=q4=Red Crane Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85394, "", "=q4=Red Crane Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85395, "", "=q4=Red Crane Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85397, "", "=q4=Red Crane Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_monk_windwalker_spec", "=q6=#t14s11_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87086, "", "=q4=Red Crane Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87088, "", "=q4=Red Crane Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87084, "", "=q4=Red Crane Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87085, "", "=q4=Red Crane Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87087, "", "=q4=Red Crane Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"].." - "..ALIL["Windwalker"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14MonkHealer"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_mistweaver_spec", "=q6=#t14s11_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86730, "", "=q4=Red Crane Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86733, "", "=q4=Red Crane Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86732, "", "=q4=Red Crane Vest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86729, "", "=q4=Red Crane Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86731, "", "=q4=Red Crane Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_monk_mistweaver_spec", "=q6=#t14s11_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85390, "", "=q4=Red Crane Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85393, "", "=q4=Red Crane Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85392, "", "=q4=Red Crane Vest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85389, "", "=q4=Red Crane Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85391, "", "=q4=Red Crane Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_monk_mistweaver_spec", "=q6=#t14s11_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87090, "", "=q4=Red Crane Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87093, "", "=q4=Red Crane Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87092, "", "=q4=Red Crane Vest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87089, "", "=q4=Red Crane Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87091, "", "=q4=Red Crane Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"].." - "..ALIL["Mistweaver"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14PaladinHoly"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#t14s4_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86686, "", "=q4=White Tiger Headguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86684, "", "=q4=White Tiger Mantle", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86688, "", "=q4=White Tiger Breastplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86687, "", "=q4=White Tiger Gloves", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86685, "", "=q4=White Tiger Greaves", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#t14s4_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85346, "", "=q4=White Tiger Headguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85344, "", "=q4=White Tiger Mantle", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85348, "", "=q4=White Tiger Breastplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85347, "", "=q4=White Tiger Gloves", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85345, "", "=q4=White Tiger Greaves", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#t14s4_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87106, "", "=q4=White Tiger Headguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87108, "", "=q4=White Tiger Mantle", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87104, "", "=q4=White Tiger Breastplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87105, "", "=q4=White Tiger Gloves", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87107, "", "=q4=White Tiger Greaves", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Holy"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14PaladinProtection"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_holy_devotionaura", "=q6=#t14s4_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86661, "", "=q4=White Tiger Faceguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86659, "", "=q4=White Tiger Shoulderguards", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86663, "", "=q4=White Tiger Chestguard", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86662, "", "=q4=White Tiger Handguards", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86660, "", "=q4=White Tiger Legguards", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_holy_devotionaura", "=q6=#t14s4_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85321, "", "=q4=White Tiger Faceguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85319, "", "=q4=White Tiger Shoulderguards", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85323, "", "=q4=White Tiger Chestguard", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85322, "", "=q4=White Tiger Handguards", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85320, "", "=q4=White Tiger Legguards", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_holy_devotionaura", "=q6=#t14s4_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87111, "", "=q4=White Tiger Faceguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87113, "", "=q4=White Tiger Shoulderguards", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87109, "", "=q4=White Tiger Chestguard", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87110, "", "=q4=White Tiger Handguards", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87112, "", "=q4=White Tiger Legguards", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Protection"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14PaladinRetribution"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#t14s4_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86681, "", "=q4=White Tiger Helmet", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86679, "", "=q4=White Tiger Pauldrons", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86683, "", "=q4=White Tiger Battleplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86682, "", "=q4=White Tiger Gauntlets", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86680, "", "=q4=White Tiger Legplates", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#t14s4_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85341, "", "=q4=White Tiger Helmet", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85339, "", "=q4=White Tiger Pauldrons", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85343, "", "=q4=White Tiger Battleplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85342, "", "=q4=White Tiger Gauntlets", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85340, "", "=q4=White Tiger Legplates", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#t14s4_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87101, "", "=q4=White Tiger Helmet", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87103, "", "=q4=White Tiger Pauldrons", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87099, "", "=q4=White Tiger Battleplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87100, "", "=q4=White Tiger Gauntlets", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87102, "", "=q4=White Tiger Legplates", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Retribution"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14PriestShadow"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_shadow_shadowwordpain", "=q6=#t14s5_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86705, "", "=q4=Guardian Serpent Hood", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86708, "", "=q4=Guardian Serpent Shoulderguards", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86707, "", "=q4=Guardian Serpent Raiment", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86704, "", "=q4=Guardian Serpent Gloves", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86706, "", "=q4=Guardian Serpent Leggings", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_shadow_shadowwordpain", "=q6=#t14s5_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85365, "", "=q4=Guardian Serpent Hood", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85368, "", "=q4=Guardian Serpent Shoulderguards", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85367, "", "=q4=Guardian Serpent Raiment", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85364, "", "=q4=Guardian Serpent Gloves", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85366, "", "=q4=Guardian Serpent Leggings", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_shadow_shadowwordpain", "=q6=#t14s5_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87120, "", "=q4=Guardian Serpent Hood", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87123, "", "=q4=Guardian Serpent Shoulderguards", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87122, "", "=q4=Guardian Serpent Raiment", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87119, "", "=q4=Guardian Serpent Gloves", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87121, "", "=q4=Guardian Serpent Leggings", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"].." - "..ALIL["Shadow"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14PriestHoly"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_holy_guardianspirit", "=q6=#t14s5_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86702, "", "=q4=Guardian Serpent Cowl", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86699, "", "=q4=Guardian Serpent Mantle", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86700, "", "=q4=Guardian Serpent Robes", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86703, "", "=q4=Guardian Serpent Handwraps", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86701, "", "=q4=Guardian Serpent Legwraps", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_holy_guardianspirit", "=q6=#t14s5_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85362, "", "=q4=Guardian Serpent Cowl", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85359, "", "=q4=Guardian Serpent Mantle", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85360, "", "=q4=Guardian Serpent Robes", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85363, "", "=q4=Guardian Serpent Handwraps", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85361, "", "=q4=Guardian Serpent Legwraps", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_holy_guardianspirit", "=q6=#t14s5_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87115, "", "=q4=Guardian Serpent Cowl", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87118, "", "=q4=Guardian Serpent Mantle", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87117, "", "=q4=Guardian Serpent Robes", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87114, "", "=q4=Guardian Serpent Handwraps", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87116, "", "=q4=Guardian Serpent Legwraps", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"].." - "..ALIL["Holy"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14Rogue"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_throwingknife_04", "=q6=#t14s6#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86641, "", "=q4=Helmet of the Thousandfold Blades", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86639, "", "=q4=Spaulders of the Thousandfold Blades", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86643, "", "=q4=Tunic of the Thousandfold Blades", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86642, "", "=q4=Gloves of the Thousandfold Blades", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86640, "", "=q4=Legguards of the Thousandfold Blades", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "inv_throwingknife_04", "=q6=#t14s6#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85301, "", "=q4=Helmet of the Thousandfold Blades", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85299, "", "=q4=Spaulders of the Thousandfold Blades", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85303, "", "=q4=Tunic of the Thousandfold Blades", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85302, "", "=q4=Gloves of the Thousandfold Blades", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85300, "", "=q4=Legguards of the Thousandfold Blades", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "inv_throwingknife_04", "=q6=#t14s6#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87126, "", "=q4=Helmet of the Thousandfold Blades", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87128, "", "=q4=Spaulders of the Thousandfold Blades", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87124, "", "=q4=Tunic of the Thousandfold Blades", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87125, "", "=q4=Gloves of the Thousandfold Blades", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87127, "", "=q4=Legguards of the Thousandfold Blades", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14ShamanElemental"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Nature_Lightning", "=q6=#t14s7_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86631, "", "=q4=Firebird's Headpiece", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86633, "", "=q4=Firebird's Shoulderwraps", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86629, "", "=q4=Firebird's Hauberk", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86630, "", "=q4=Firebird's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86632, "", "=q4=Firebird's Kilt", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#t14s7_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85291, "", "=q4=Firebird's Headpiece", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85293, "", "=q4=Firebird's Shoulderwraps", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85289, "", "=q4=Firebird's Hauberk", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85290, "", "=q4=Firebird's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85292, "", "=q4=Firebird's Kilt", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "Spell_Nature_Lightning", "=q6=#t14s7_3#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87141, "", "=q4=Firebird's Headpiece", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87143, "", "=q4=Firebird's Shoulderwraps", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87139, "", "=q4=Firebird's Hauberk", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87140, "", "=q4=Firebird's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87142, "", "=q4=Firebird's Kilt", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Elemental"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14ShamanEnhancement"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_lightningshield", "=q6=#t14s7_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86626, "", "=q4=Firebird's Helmet", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86624, "", "=q4=Firebird's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86628, "", "=q4=Firebird's Cuirass", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86627, "", "=q4=Firebird's Grips", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86625, "", "=q4=Firebird's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_nature_lightningshield", "=q6=#t14s7_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85286, "", "=q4=Firebird's Helmet", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85284, "", "=q4=Firebird's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85288, "", "=q4=Firebird's Cuirass", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85287, "", "=q4=Firebird's Grips", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85285, "", "=q4=Firebird's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_nature_lightningshield", "=q6=#t14s7_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87136, "", "=q4=Firebird's Helmet", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87138, "", "=q4=Firebird's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87134, "", "=q4=Firebird's Cuirass", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87135, "", "=q4=Firebird's Grips", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87137, "", "=q4=Firebird's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Enhancement"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14ShamanRestoration"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_magicimmunity", "=q6=#t14s7_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86691, "", "=q4=Firebird's Faceguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86689, "", "=q4=Firebird's Mantle", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86693, "", "=q4=Firebird's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86692, "", "=q4=Firebird's Handwraps", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86690, "", "=q4=Firebird's Legwraps", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_nature_magicimmunity", "=q6=#t14s7_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85351, "", "=q4=Firebird's Faceguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85349, "", "=q4=Firebird's Mantle", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85353, "", "=q4=Firebird's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85352, "", "=q4=Firebird's Handwraps", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85350, "", "=q4=Firebird's Legwraps", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_nature_magicimmunity", "=q6=#t14s7_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87131, "", "=q4=Firebird's Faceguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87133, "", "=q4=Firebird's Mantle", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87129, "", "=q4=Firebird's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87130, "", "=q4=Firebird's Handwraps", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87132, "", "=q4=Firebird's Legwraps", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Restoration"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14Warlock"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_drowsy", "=q6=#t14s8#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86710, "", "=q4=Sha-Skin Hood", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86713, "", "=q4=Sha-Skin Mantle", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86712, "", "=q4=Sha-Skin Robes", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86709, "", "=q4=Sha-Skin Gloves", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86711, "", "=q4=Sha-Skin Leggings", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "spell_nature_drowsy", "=q6=#t14s8#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85370, "", "=q4=Sha-Skin Hood", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85373, "", "=q4=Sha-Skin Mantle", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85372, "", "=q4=Sha-Skin Robes", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85369, "", "=q4=Sha-Skin Gloves", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85371, "", "=q4=Sha-Skin Leggings", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "spell_nature_drowsy", "=q6=#t14s8#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87188, "", "=q4=Sha-Skin Hood", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87191, "", "=q4=Sha-Skin Mantle", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87190, "", "=q4=Sha-Skin Robes", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87187, "", "=q4=Sha-Skin Gloves", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87189, "", "=q4=Sha-Skin Leggings", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14WarriorFury"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_warrior_innerrage", "=q6=#t14s9_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86673, "", "=q4=Helmet of Resounding Rings", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86669, "", "=q4=Pauldrons of Resounding Rings", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86672, "", "=q4=Battleplate of Resounding Rings", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86671, "", "=q4=Gauntlets of Resounding Rings", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86670, "", "=q4=Legplates of Resounding Rings", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "ability_warrior_innerrage", "=q6=#t14s9_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85333, "", "=q4=Helmet of Resounding Rings", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85329, "", "=q4=Pauldrons of Resounding Rings", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85332, "", "=q4=Battleplate of Resounding Rings", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85331, "", "=q4=Gauntlets of Resounding Rings", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85330, "", "=q4=Legplates of Resounding Rings", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "ability_warrior_innerrage", "=q6=#t14s9_1#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87192, "", "=q4=Helmet of Resounding Rings", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87196, "", "=q4=Pauldrons of Resounding Rings", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87193, "", "=q4=Battleplate of Resounding Rings", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87194, "", "=q4=Gauntlets of Resounding Rings", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87195, "", "=q4=Legplates of Resounding Rings", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"].." - "..AL["DPS"],
			module = moduleName, menu = "T14SET",
		};
	}

	AtlasLoot_Data["T14WarriorProtection"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_warrior_innerrage", "=q6=#t14s9_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Raid Finder"]};
				{ 2, 86666, "", "=q4=Faceguard of Resounding Rings", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 3, 86664, "", "=q4=Shoulderguards of Resounding Rings", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 4, 86668, "", "=q4=Chestguard of Resounding Rings", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 5, 86667, "", "=q4=Handguards of Resounding Rings", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 6, 86665, "", "=q4=Legguards of Resounding Rings", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 8, 0, "ability_warrior_innerrage", "=q6=#t14s9_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Normal"]};
				{ 9, 85326, "", "=q4=Faceguard of Resounding Rings", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 10, 85324, "", "=q4=Shoulderguards of Resounding Rings", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 11, 85328, "", "=q4=Chestguard of Resounding Rings", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 12, 85327, "", "=q4=Handguards of Resounding Rings", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 13, 85325, "", "=q4=Legguards of Resounding Rings", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
				{ 16, 0, "ability_warrior_innerrage", "=q6=#t14s9_2#", "=q5="..string.format(AL["Tier %d"], 14).." - "..AL["Heroic"]};
				{ 17, 87199, "", "=q4=Faceguard of Resounding Rings", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Sha of Fear", 709)};
				{ 18, 87201, "", "=q4=Shoulderguards of Resounding Rings", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Lei Shi", 729)};
				{ 19, 87197, "", "=q4=Chestguard of Resounding Rings", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Grand Empress Shek'zeer", 743)};
				{ 20, 87198, "", "=q4=Handguards of Resounding Rings", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Wind Lord Mel'jarak", 741)};
				{ 21, 87200, "", "=q4=Legguards of Resounding Rings", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Amber-Shaper Un'sok", 737)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"].." - "..ALIL["Protection"],
			module = moduleName, menu = "T14SET",
		};
	}

		--------------------------
		--- Tier 15 Sets (T15) ---
		--------------------------

	AtlasLoot_Data["T15DeathKnightDPS"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_deathknight_frostpresence", "=q6=#t15s10_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95827, "", "=q4=Helmet of the All-Consuming Maw", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95829, "", "=q4=Pauldrons of the All-Consuming Maw", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95825, "", "=q4=Breastplate of the All-Consuming Maw", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95826, "", "=q4=Gauntlets of the All-Consuming Maw", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95828, "", "=q4=Greaves of the All-Consuming Maw", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_deathknight_frostpresence", "=q6=#t15s10_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95227, "", "=q4=Helmet of the All-Consuming Maw", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95229, "", "=q4=Pauldrons of the All-Consuming Maw", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95225, "", "=q4=Breastplate of the All-Consuming Maw", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95226, "", "=q4=Gauntlets of the All-Consuming Maw", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95228, "", "=q4=Greaves of the All-Consuming Maw", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_deathknight_frostpresence", "=q6=#t15s10_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96571, "", "=q4=Helmet of the All-Consuming Maw", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96573, "", "=q4=Pauldrons of the All-Consuming Maw", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96569, "", "=q4=Breastplate of the All-Consuming Maw", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96570, "", "=q4=Gauntlets of the All-Consuming Maw", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96572, "", "=q4=Greaves of the All-Consuming Maw", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"].." - "..AL["DPS"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15DeathKnightTank"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_deathknight_bloodpresence", "=q6=#t15s10_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95832, "", "=q4=Faceguard of the All-Consuming Maw", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95834, "", "=q4=Shoulderguards of the All-Consuming Maw", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95830, "", "=q4=Chestguard of the All-Consuming Maw", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95831, "", "=q4=Handguards of the All-Consuming Maw", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95833, "", "=q4=Legguards of the All-Consuming Maw", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_deathknight_bloodpresence", "=q6=#t15s10_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95232, "", "=q4=Faceguard of the All-Consuming Maw", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95234, "", "=q4=Shoulderguards of the All-Consuming Maw", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95230, "", "=q4=Chestguard of the All-Consuming Maw", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95231, "", "=q4=Handguards of the All-Consuming Maw", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95233, "", "=q4=Legguards of the All-Consuming Maw", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_deathknight_bloodpresence", "=q6=#t15s10_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96576, "", "=q4=Faceguard of the All-Consuming Maw", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96578, "", "=q4=Shoulderguards of the All-Consuming Maw", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96574, "", "=q4=Chestguard of the All-Consuming Maw", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96575, "", "=q4=Handguards of the All-Consuming Maw", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96577, "", "=q4=Legguards of the All-Consuming Maw", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"].." - "..AL["Tanking"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15DruidRestoration"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_healingtouch", "=q6=#t15s1_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95841, "", "=q4=Helm of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95844, "", "=q4=Mantle of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95843, "", "=q4=Robes of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95840, "", "=q4=Handwraps of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95842, "", "=q4=Legwraps of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_nature_healingtouch", "=q6=#t15s1_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95241, "", "=q4=Helm of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95244, "", "=q4=Mantle of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95243, "", "=q4=Robes of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95240, "", "=q4=Handwraps of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95242, "", "=q4=Legwraps of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_nature_healingtouch", "=q6=#t15s1_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96585, "", "=q4=Helm of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96588, "", "=q4=Mantle of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96587, "", "=q4=Robes of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96584, "", "=q4=Handwraps of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96586, "", "=q4=Legwraps of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Restoration"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15DruidDPS"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_druid_catform", "=q6=#t15s1_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95837, "", "=q4=Headpiece of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95839, "", "=q4=Spaulders of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95835, "", "=q4=Raiment of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95836, "", "=q4=Grips of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95838, "", "=q4=Legguards of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "ability_druid_catform", "=q6=#t15s1_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95237, "", "=q4=Headpiece of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95239, "", "=q4=Spaulders of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95235, "", "=q4=Raiment of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95236, "", "=q4=Grips of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95238, "", "=q4=Legguards of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "ability_druid_catform", "=q6=#t15s1_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96581, "", "=q4=Headpiece of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96583, "", "=q4=Spaulders of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96579, "", "=q4=Raiment of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96580, "", "=q4=Grips of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96582, "", "=q4=Legguards of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Feral"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15DruidBalance"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_starfall", "=q6=#t15s1_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95846, "", "=q4=Cover of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95849, "", "=q4=Shoulderwraps of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95848, "", "=q4=Vestment of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95845, "", "=q4=Gloves of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95847, "", "=q4=Leggings of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_nature_starfall", "=q6=#t15s1_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95246, "", "=q4=Cover of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95249, "", "=q4=Shoulderwraps of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95248, "", "=q4=Vestment of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95245, "", "=q4=Gloves of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95247, "", "=q4=Leggings of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_nature_starfall", "=q6=#t15s1_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96590, "", "=q4=Cover of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96593, "", "=q4=Shoulderwraps of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96592, "", "=q4=Vestment of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96589, "", "=q4=Gloves of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96591, "", "=q4=Leggings of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Balance"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15DruidTank"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_racial_bearform", "=q6=#t15s1_4#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95852, "", "=q4=Headguard of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95854, "", "=q4=Shoulderguards of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95850, "", "=q4=Tunic of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95851, "", "=q4=Handguards of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95853, "", "=q4=Breeches of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "ability_racial_bearform", "=q6=#t15s1_4#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95252, "", "=q4=Headguard of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95254, "", "=q4=Shoulderguards of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95250, "", "=q4=Tunic of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95251, "", "=q4=Handguards of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95253, "", "=q4=Breeches of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "ability_racial_bearform", "=q6=#t15s1_4#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96596, "", "=q4=Headguard of the Haunted Forest", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96598, "", "=q4=Shoulderguards of the Haunted Forest", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96594, "", "=q4=Tunic of the Haunted Forest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96595, "", "=q4=Handguards of the Haunted Forest", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96597, "", "=q4=Breeches of the Haunted Forest", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"].." - "..ALIL["Guardian"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15Hunter"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_weapon_bow_07", "=q6=#t15s2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95884, "", "=q4=Saurok Stalker's Headguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95886, "", "=q4=Saurok Stalker's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95882, "", "=q4=Saurok Stalker's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95883, "", "=q4=Saurok Stalker's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95885, "", "=q4=Saurok Stalker's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "inv_weapon_bow_07", "=q6=#t15s2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95257, "", "=q4=Saurok Stalker's Headguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95259, "", "=q4=Saurok Stalker's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95255, "", "=q4=Saurok Stalker's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95256, "", "=q4=Saurok Stalker's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95258, "", "=q4=Saurok Stalker's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "inv_weapon_bow_07", "=q6=#t15s2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96628, "", "=q4=Saurok Stalker's Headguard", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96630, "", "=q4=Saurok Stalker's Spaulders", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96626, "", "=q4=Saurok Stalker's Tunic", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96627, "", "=q4=Saurok Stalker's Gloves", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96629, "", "=q4=Saurok Stalker's Legguards", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15Mage"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_staff_13", "=q6=#t15s3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95891, "", "=q4=Hood of the Chromatic Hydra", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95894, "", "=q4=Mantle of the Chromatic Hydra", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95893, "", "=q4=Robes of the Chromatic Hydra", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95890, "", "=q4=Gloves of the Chromatic Hydra", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95892, "", "=q4=Leggings of the Chromatic Hydra", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "inv_staff_13", "=q6=#t15s3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95261, "", "=q4=Hood of the Chromatic Hydra", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95264, "", "=q4=Mantle of the Chromatic Hydra", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95263, "", "=q4=Robes of the Chromatic Hydra", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95260, "", "=q4=Gloves of the Chromatic Hydra", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95262, "", "=q4=Leggings of the Chromatic Hydra", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "inv_staff_13", "=q6=#t15s3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96635, "", "=q4=Hood of the Chromatic Hydra", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96638, "", "=q4=Mantle of the Chromatic Hydra", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96637, "", "=q4=Robes of the Chromatic Hydra", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96634, "", "=q4=Gloves of the Chromatic Hydra", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96636, "", "=q4=Leggings of the Chromatic Hydra", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15MonkTank"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_brewmaster_spec", "=q6=#t15s11_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95907, "", "=q4=Fire-Charm Crown", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95909, "", "=q4=Fire-Charm Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95905, "", "=q4=Fire-Charm Chestguard", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95906, "", "=q4=Fire-Charm Gauntlets", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95908, "", "=q4=Fire-Charm Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_monk_brewmaster_spec", "=q6=#t15s11_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95277, "", "=q4=Fire-Charm Crown", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95279, "", "=q4=Fire-Charm Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95275, "", "=q4=Fire-Charm Chestguard", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95276, "", "=q4=Fire-Charm Gauntlets", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95278, "", "=q4=Fire-Charm Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_monk_brewmaster_spec", "=q6=#t15s11_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96651, "", "=q4=Fire-Charm Crown", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96653, "", "=q4=Fire-Charm Shoulderguards", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96649, "", "=q4=Fire-Charm Chestguard", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96650, "", "=q4=Fire-Charm Gauntlets", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96652, "", "=q4=Fire-Charm Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"].." - "..ALIL["Brewmaster"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15MonkDPS"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_windwalker_spec", "=q6=#t15s11_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95897, "", "=q4=Fire-Charm Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95899, "", "=q4=Fire-Charm Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95895, "", "=q4=Fire-Charm Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95896, "", "=q4=Fire-Charm Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95898, "", "=q4=Fire-Charm Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_monk_windwalker_spec", "=q6=#t15s11_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95267, "", "=q4=Fire-Charm Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95269, "", "=q4=Fire-Charm Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95265, "", "=q4=Fire-Charm Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95266, "", "=q4=Fire-Charm Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95268, "", "=q4=Fire-Charm Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_monk_windwalker_spec", "=q6=#t15s11_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96641, "", "=q4=Fire-Charm Headpiece", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96643, "", "=q4=Fire-Charm Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96639, "", "=q4=Fire-Charm Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96640, "", "=q4=Fire-Charm Grips", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96642, "", "=q4=Fire-Charm Leggings", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"].." - "..ALIL["Windwalker"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15MonkHealer"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_monk_mistweaver_spec", "=q6=#t15s11_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95901, "", "=q4=Fire-Charm Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95904, "", "=q4=Fire-Charm Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95903, "", "=q4=Fire-Charm Vest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95900, "", "=q4=Fire-Charm Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95902, "", "=q4=Fire-Charm Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_monk_mistweaver_spec", "=q6=#t15s11_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95271, "", "=q4=Fire-Charm Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95274, "", "=q4=Fire-Charm Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95273, "", "=q4=Fire-Charm Vest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95270, "", "=q4=Fire-Charm Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95272, "", "=q4=Fire-Charm Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_monk_mistweaver_spec", "=q6=#t15s11_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96645, "", "=q4=Fire-Charm Helm", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96648, "", "=q4=Fire-Charm Mantle", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96647, "", "=q4=Fire-Charm Vest", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96644, "", "=q4=Fire-Charm Handwraps", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96646, "", "=q4=Fire-Charm Legwraps", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"].." - "..ALIL["Mistweaver"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15PaladinHoly"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#t15s4_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95917, "", "=q4=Lightning Emperor's Headguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95919, "", "=q4=Lightning Emperor's Mantle", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95915, "", "=q4=Lightning Emperor's Breastplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95916, "", "=q4=Lightning Emperor's Gloves", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95918, "", "=q4=Lightning Emperor's Greaves", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#t15s4_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95287, "", "=q4=Lightning Emperor's Headguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95289, "", "=q4=Lightning Emperor's Mantle", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95285, "", "=q4=Lightning Emperor's Breastplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95286, "", "=q4=Lightning Emperor's Gloves", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95288, "", "=q4=Lightning Emperor's Greaves", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#t15s4_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96661, "", "=q4=Lightning Emperor's Headguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96663, "", "=q4=Lightning Emperor's Mantle", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96659, "", "=q4=Lightning Emperor's Breastplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96660, "", "=q4=Lightning Emperor's Gloves", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96662, "", "=q4=Lightning Emperor's Greaves", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Holy"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15PaladinProtection"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_holy_devotionaura", "=q6=#t15s4_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95922, "", "=q4=Lightning Emperor's Faceguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95924, "", "=q4=Lightning Emperor's Shoulderguards", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95920, "", "=q4=Lightning Emperor's Chestguard", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95921, "", "=q4=Lightning Emperor's Handguards", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95923, "", "=q4=Lightning Emperor's Legguards", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_holy_devotionaura", "=q6=#t15s4_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95292, "", "=q4=Lightning Emperor's Faceguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95294, "", "=q4=Lightning Emperor's Shoulderguards", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95290, "", "=q4=Lightning Emperor's Chestguard", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95291, "", "=q4=Lightning Emperor's Handguards", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95293, "", "=q4=Lightning Emperor's Legguards", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_holy_devotionaura", "=q6=#t15s4_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96666, "", "=q4=Lightning Emperor's Faceguard", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96668, "", "=q4=Lightning Emperor's Shoulderguards", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96664, "", "=q4=Lightning Emperor's Chestguard", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96665, "", "=q4=Lightning Emperor's Handguards", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96667, "", "=q4=Lightning Emperor's Legguards", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Protection"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15PaladinRetribution"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#t15s4_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95912, "", "=q4=Lightning Emperor's Helmet", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95914, "", "=q4=Lightning Emperor's Pauldrons", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95910, "", "=q4=Lightning Emperor's Battleplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95911, "", "=q4=Lightning Emperor's Gauntlets", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95913, "", "=q4=Lightning Emperor's Legplates", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#t15s4_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95282, "", "=q4=Lightning Emperor's Helmet", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95284, "", "=q4=Lightning Emperor's Pauldrons", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95280, "", "=q4=Lightning Emperor's Battleplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95281, "", "=q4=Lightning Emperor's Gauntlets", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95283, "", "=q4=Lightning Emperor's Legplates", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#t15s4_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96656, "", "=q4=Lightning Emperor's Helmet", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96658, "", "=q4=Lightning Emperor's Pauldrons", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96654, "", "=q4=Lightning Emperor's Battleplate", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96655, "", "=q4=Lightning Emperor's Gauntlets", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96657, "", "=q4=Lightning Emperor's Legplates", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"].." - "..ALIL["Retribution"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15PriestShadow"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_shadow_shadowwordpain", "=q6=#t15s5_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95931, "", "=q4=Hood of the Exorcist", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95934, "", "=q4=Shoulderguards of the Exorcist", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95933, "", "=q4=Raiment of the Exorcist", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95930, "", "=q4=Gloves of the Exorcist", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95932, "", "=q4=Leggings of the Exorcist", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_shadow_shadowwordpain", "=q6=#t15s5_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95301, "", "=q4=Hood of the Exorcist", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95304, "", "=q4=Shoulderguards of the Exorcist", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95303, "", "=q4=Raiment of the Exorcist", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95300, "", "=q4=Gloves of the Exorcist", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95302, "", "=q4=Leggings of the Exorcist", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_shadow_shadowwordpain", "=q6=#t15s5_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96675, "", "=q4=Hood of the Exorcist", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96678, "", "=q4=Shoulderguards of the Exorcist", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96677, "", "=q4=Raiment of the Exorcist", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96674, "", "=q4=Gloves of the Exorcist", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96676, "", "=q4=Leggings of the Exorcist", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"].." - "..ALIL["Shadow"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15PriestHoly"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_holy_guardianspirit", "=q6=#t15s5_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95926, "", "=q4=Cowl of the Exorcist", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95929, "", "=q4=Mantle of the Exorcist", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95928, "", "=q4=Robes of the Exorcist", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95925, "", "=q4=Handwraps of the Exorcist", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95927, "", "=q4=Legwraps of the Exorcist", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_holy_guardianspirit", "=q6=#t15s5_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95296, "", "=q4=Cowl of the Exorcist", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95299, "", "=q4=Mantle of the Exorcist", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95298, "", "=q4=Robes of the Exorcist", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95295, "", "=q4=Handwraps of the Exorcist", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95297, "", "=q4=Legwraps of the Exorcist", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_holy_guardianspirit", "=q6=#t15s5_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96670, "", "=q4=Cowl of the Exorcist", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96673, "", "=q4=Mantle of the Exorcist", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96672, "", "=q4=Robes of the Exorcist", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96669, "", "=q4=Handwraps of the Exorcist", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96671, "", "=q4=Legwraps of the Exorcist", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"].." - "..ALIL["Holy"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15Rogue"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_throwingknife_04", "=q6=#t15s6#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95937, "", "=q4=Nine-Tailed Helmet", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95939, "", "=q4=Nine-Tailed Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95935, "", "=q4=Nine-Tailed Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95936, "", "=q4=Nine-Tailed Gloves", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95938, "", "=q4=Nine-Tailed Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "inv_throwingknife_04", "=q6=#t15s6#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95307, "", "=q4=Nine-Tailed Helmet", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95309, "", "=q4=Nine-Tailed Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95305, "", "=q4=Nine-Tailed Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95306, "", "=q4=Nine-Tailed Gloves", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95308, "", "=q4=Nine-Tailed Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "inv_throwingknife_04", "=q6=#t15s6#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96681, "", "=q4=Nine-Tailed Helmet", "=ds=#s1#, #a2#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96683, "", "=q4=Nine-Tailed Spaulders", "=ds=#s3#, #a2#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96679, "", "=q4=Nine-Tailed Tunic", "=ds=#s5#, #a2#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96680, "", "=q4=Nine-Tailed Gloves", "=ds=#s9#, #a2#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96682, "", "=q4=Nine-Tailed Legguards", "=ds=#s11#, #a2#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15ShamanElemental"] = {
		["Normal"] = {
			{
				{ 1, 0, "Spell_Nature_Lightning", "=q6=#t15s7_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95952, "", "=q4=Headpiece of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95954, "", "=q4=Shoulderwraps of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95950, "", "=q4=Hauberk of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95951, "", "=q4=Gloves of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95953, "", "=q4=Kilt of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "Spell_Nature_Lightning", "=q6=#t15s7_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95322, "", "=q4=Headpiece of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95324, "", "=q4=Shoulderwraps of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95320, "", "=q4=Hauberk of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95321, "", "=q4=Gloves of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95323, "", "=q4=Kilt of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "Spell_Nature_Lightning", "=q6=#t15s7_3#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96696, "", "=q4=Headpiece of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96698, "", "=q4=Shoulderwraps of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96694, "", "=q4=Hauberk of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96695, "", "=q4=Gloves of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96697, "", "=q4=Kilt of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Elemental"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15ShamanEnhancement"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_lightningshield", "=q6=#t15s7_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95947, "", "=q4=Helmet of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95949, "", "=q4=Spaulders of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95945, "", "=q4=Cuirass of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95946, "", "=q4=Grips of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95948, "", "=q4=Legguards of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_nature_lightningshield", "=q6=#t15s7_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95317, "", "=q4=Helmet of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95319, "", "=q4=Spaulders of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95315, "", "=q4=Cuirass of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95316, "", "=q4=Grips of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95318, "", "=q4=Legguards of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_nature_lightningshield", "=q6=#t15s7_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96691, "", "=q4=Helmet of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96693, "", "=q4=Spaulders of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96689, "", "=q4=Cuirass of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96690, "", "=q4=Grips of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96692, "", "=q4=Legguards of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Enhancement"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15ShamanRestoration"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_magicimmunity", "=q6=#t15s7_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95942, "", "=q4=Faceguard of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95944, "", "=q4=Mantle of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95940, "", "=q4=Tunic of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95941, "", "=q4=Handwraps of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95943, "", "=q4=Legwraps of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_nature_magicimmunity", "=q6=#t15s7_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95312, "", "=q4=Faceguard of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95314, "", "=q4=Mantle of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95310, "", "=q4=Tunic of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95311, "", "=q4=Handwraps of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95313, "", "=q4=Legwraps of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_nature_magicimmunity", "=q6=#t15s7_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96686, "", "=q4=Faceguard of the Witch Doctor", "=ds=#s1#, #a3#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96688, "", "=q4=Mantle of the Witch Doctor", "=ds=#s3#, #a3#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96684, "", "=q4=Tunic of the Witch Doctor", "=ds=#s5#, #a3#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96685, "", "=q4=Handwraps of the Witch Doctor", "=ds=#s9#, #a3#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96687, "", "=q4=Legwraps of the Witch Doctor", "=ds=#s11#, #a3#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." - "..ALIL["Restoration"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15Warlock"] = {
		["Normal"] = {
			{
				{ 1, 0, "spell_nature_drowsy", "=q6=#t15s8#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95982, "", "=q4=Hood of the Thousandfold Hells", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95985, "", "=q4=Mantle of the Thousandfold Hells", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95984, "", "=q4=Robes of the Thousandfold Hells", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95981, "", "=q4=Gloves of the Thousandfold Hells", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95983, "", "=q4=Leggings of the Thousandfold Hells", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "spell_nature_drowsy", "=q6=#t15s8#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95326, "", "=q4=Hood of the Thousandfold Hells", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95329, "", "=q4=Mantle of the Thousandfold Hells", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95328, "", "=q4=Robes of the Thousandfold Hells", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95325, "", "=q4=Gloves of the Thousandfold Hells", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95327, "", "=q4=Leggings of the Thousandfold Hells", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "spell_nature_drowsy", "=q6=#t15s8#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96726, "", "=q4=Hood of the Thousandfold Hells", "=ds=#s1#, #a1#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96729, "", "=q4=Mantle of the Thousandfold Hells", "=ds=#s3#, #a1#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96728, "", "=q4=Robes of the Thousandfold Hells", "=ds=#s5#, #a1#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96725, "", "=q4=Gloves of the Thousandfold Hells", "=ds=#s9#, #a1#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96727, "", "=q4=Leggings of the Thousandfold Hells", "=ds=#s11#, #a1#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15WarriorFury"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_warrior_innerrage", "=q6=#t15s9_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95986, "", "=q4=Helmet of the Last Mogu", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95990, "", "=q4=Pauldrons of the Last Mogu", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95987, "", "=q4=Battleplate of the Last Mogu", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95988, "", "=q4=Gauntlets of the Last Mogu", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95989, "", "=q4=Legplates of the Last Mogu", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "ability_warrior_innerrage", "=q6=#t15s9_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95330, "", "=q4=Helmet of the Last Mogu", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95334, "", "=q4=Pauldrons of the Last Mogu", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95331, "", "=q4=Battleplate of the Last Mogu", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95332, "", "=q4=Gauntlets of the Last Mogu", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95333, "", "=q4=Legplates of the Last Mogu", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "ability_warrior_innerrage", "=q6=#t15s9_1#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96730, "", "=q4=Helmet of the Last Mogu", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96734, "", "=q4=Pauldrons of the Last Mogu", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96731, "", "=q4=Battleplate of the Last Mogu", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96732, "", "=q4=Gauntlets of the Last Mogu", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96733, "", "=q4=Legplates of the Last Mogu", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"].." - "..AL["DPS"],
			module = moduleName, menu = "T15SET",
		};
	}

	AtlasLoot_Data["T15WarriorProtection"] = {
		["Normal"] = {
			{
				{ 1, 0, "ability_warrior_innerrage", "=q6=#t15s9_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Raid Finder"]};
				{ 2, 95993, "", "=q4=Faceguard of the Last Mogu", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 3, 95995, "", "=q4=Shoulderguards of the Last Mogu", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 4, 95991, "", "=q4=Chestguard of the Last Mogu", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 5, 95992, "", "=q4=Handguards of the Last Mogu", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 6, 95994, "", "=q4=Legguards of the Last Mogu", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 8, 0, "ability_warrior_innerrage", "=q6=#t15s9_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Normal"]};
				{ 9, 95337, "", "=q4=Faceguard of the Last Mogu", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 10, 95339, "", "=q4=Shoulderguards of the Last Mogu", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 11, 95335, "", "=q4=Chestguard of the Last Mogu", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 12, 95336, "", "=q4=Handguards of the Last Mogu", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 13, 95338, "", "=q4=Legguards of the Last Mogu", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
				{ 16, 0, "ability_warrior_innerrage", "=q6=#t15s9_2#", "=q5="..string.format(AL["Tier %d"], 15).." - "..AL["Heroic"]};
				{ 17, 96737, "", "=q4=Faceguard of the Last Mogu", "=ds=#s1#, #a4#", AtlasLoot:EJ_GetBossName("Twin Consorts", 829)};
				{ 18, 96739, "", "=q4=Shoulderguards of the Last Mogu", "=ds=#s3#, #a4#", AtlasLoot:EJ_GetBossName("Iron Qon", 817)};
				{ 19, 96735, "", "=q4=Chestguard of the Last Mogu", "=ds=#s5#, #a4#", AtlasLoot:EJ_GetBossName("Dark Animus", 824)};
				{ 20, 96736, "", "=q4=Handguards of the Last Mogu", "=ds=#s9#, #a4#", AtlasLoot:EJ_GetBossName("Council of Elders", 816)};
				{ 21, 96738, "", "=q4=Legguards of the Last Mogu", "=ds=#s11#, #a4#", AtlasLoot:EJ_GetBossName("Ji-Kun", 828)};
			};
		};
		info = {
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"].." - "..ALIL["Protection"],
			module = moduleName, menu = "T15SET",
		};
	}

		-------------------------------
		--- Trading Card Game Items ---
		-------------------------------

	AtlasLoot_Data["CardGame"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Betrayal of the Guardian"]};
				{ 2, 93671, "", "=q4=Ghastly Charger's Skull", "=ds=#e12#" },
				{ 3, 93672, "", "=q3=Dark Portal", "=ds=" },
				{ 4, 93669, "", "=q3=Gusting Grimoire", "=ds=#e13#"};
				{ 6, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["War of the Ancients"]};
				{ 7, 79771, "", "=q4=Feldrake", "=ds=#e27#" },
				{ 8, 79769, "", "=q3=Demon Hunter's Aspect", "=ds=" },
				{ 9, 79744, "", "=q3=Eye of the Legion", "=ds=#e13#"};
				{ 11, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Tomb of the Forgotten"]};
				{ 12, 72575, "", "=q4=White Riding Camel", "=ds=#e26#" },
				{ 13, 72161, "", "=q3=Spurious Sarcophagus", "=ds=" },
				{ 14, 72153, "", "=q3=Sand Scarab", "=ds=#e13#"};
				{ 16, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Crown of Heaven"]};
				{ 17, 72582, "", "=q4=Corrupted Hippogryph", "=ds=#e12#" },
				{ 18, 72159, "", "=q3=Magical Ogre Idol", "=ds=" },
				{ 19, 72134, "", "=q3=Grell Moss", "=ds=#e13#"};
				{ 21, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..ALIL["Throne of the Tides"]};
				{ 22, 71718, "", "=q4=Swift Shorestrider", "=ds=#e26#" },
				{ 23, 71624, "", "=q3=Purple Puffer", "=ds=#e13#"},
				{ 24, 71628, "", "=q3=Sack of Starfish", "=ds=" },
				{ 26, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Twilight of the Dragons"]};
				{ 27, 68825, "", "=q4=Amani Dragonhawk", "=ds=#e27#" },
				{ 28, 69227, "", "=q3=Fool's Gold", "=ds=" },
				{ 29, 68841, "", "=q3=Nightsaber Cub", "=ds=#e13#" },
			};
			{
				{ 1, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["War of the Elements"]};
				{ 2, 69228, "", "=q4=Savage Raptor", "=ds=#e26#" },
				{ 3, 68840, "", "=q3=Landro's Lichling", "=ds=#e13#" },
				{ 4, 69215, "", "=q3=War Party Hitching Post", "=ds=" },
				{ 6, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Worldbreaker"]};
				{ 7, 68008, "", "=q4=Mottled Drake", "=ds="..AL["Mottled Drake"] };
				{ 8, 67097, "", "=q3=Grim Campfire", "=ds="..AL["Grim Campfire"] };
				{ 9, 67128, "", "=q3=Landro's Lil' XT", "=ds="..AL["Landro's Lil' XT"] };
				{ 11, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Icecrown"]};
				{ 12, 54068, "", "=q4=Wooly White Rhino", "=ds="..AL["Wooly White Rhino"]};
				{ 13, 54452, "", "=q3=Ethereal Portal", "=ds="..AL["Ethereal Portal"]};
				{ 14, 54455, "", "=q1=Paint Bomb", "=ds="..AL["Paint Bomb"]};
				{ 16, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Wrathgate"]};
				{ 17, 54069, "", "=q4=Blazing Hippogryph", "=ds="..AL["Blazing Hippogryph"]};
				{ 18, 54212, "", "=q3=Instant Statue Pedestal", "=ds="..AL["Statue Generator"]};
				{ 19, 54218, "", "=q1=Landro's Gift Box", "=ds="..AL["Landro's Gift"]};
				{ 21, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Scourgewar"]};
				{ 22, 49287, "", "=q4=Tuskarr Kite", "=ds="..AL["Tuskarr Kite"]};
				{ 23, 49343, "", "=q3=Spectral Tiger Cub", "=ds="..AL["Spectral Kitten"]};
				{ 24, 49289, "", "=q2=Little White Stallion Bridle", "=ds="..AL["Tiny"]};
				{ 25, 49288, "", "=q2=Little Ivory Raptor Whistle", "=ds="..AL["Tiny"]};
				{ 27, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Fields of Honor"]};
				{ 28, 49290, "", "=q4=Magic Rooster Egg", "=ds="..AL["El Pollo Grande"]};
				{ 29, 46780, "", "=q3=Ogre Pinata", "=ds="..AL["Pinata"]};
				{ 30, 46779, "", "=q1=Path of Cenarius", "=ds="..AL["Path of Cenarius"]};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Blood of Gladiators"]};
				{ 2, 45037, "", "=q4=Epic Purple Shirt", "=ds="..AL["Center of Attention"]};
				{ 3, 45063, "", "=q3=Foam Sword Rack", "=ds="..AL["Foam Sword Rack"]};
				{ 4, 45047, "", "=q3=Sandbox Tiger", "=ds="..AL["Sandbox Tiger"]};
				{ 6, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Drums of War"]};
				{ 7, 49282, "", "=q4=Big Battle Bear", "=ds="..AL["The Red Bearon"]};
				{ 8, 38578, "", "=q3=The Flag of Ownership", "=ds="..AL["Owned!"]};
				{ 9, 38577, "", "=q1=Party G.R.E.N.A.D.E.", "=ds="..AL["Slashdance"]};
				{ 11, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Hunt for Illidan"]};
				{ 12, 38050, "", "=q3=Soul-Trader Beacon", "=ds="..AL["Ethereal Plunderer"]};
				{ 13, 38301, "", "=q3=D.I.S.C.O", "=ds="..AL["Disco Inferno!"]};
				{ 14, 38233, "", "=q1=Path of Illidan", "=ds="..AL["The Footsteps of Illidan"]};
				{ 16, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Servants of the Betrayer"]};
				{ 17, 35227, "", "=q4=Goblin Weather Machine - Prototype 01-B", "=ds="..AL["Personal Weather Machine"]};
				{ 18, 49286, "", "=q4=X-51 Nether-Rocket X-TREME", "=ds="..AL["X-51 Nether-Rocket"]};
				{ 19, 49285, "", "=q3=X-51 Nether-Rocket", "=ds="..AL["X-51 Nether-Rocket"]};
				{ 20, 35223, "", "=q3=Papa Hummel's Old-Fashioned Pet Biscuit", "=ds="..AL["Papa Hummel's Old-fashioned Pet Biscuit"]};
				{ 22, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["March of the Legion"]};
				{ 23, 34493, "", "=q4=Dragon Kite", "=ds="..AL["Kiting"]};
				{ 24, 34492, "", "=q3=Rocket Chicken", "=ds="..AL["Robotic Homing Chicken"]};
				{ 25, 34499, "", "=q3=Paper Flying Machine Kit", "=ds="..AL["Paper Airplane"]};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Fires of Outland"]};
				{ 2, 49284, "", "=q4=Reins of the Swift Spectral Tiger", "=ds="..AL["Spectral Tiger"]};
				{ 3, 49283, "", "=q3=Reins of the Spectral Tiger", "=ds="..AL["Spectral Tiger"]};
				{ 4, 33223, "", "=q3=Fishing Chair", "=ds="..AL["Gone Fishin'"]};
				{ 5, 33219, "", "=q3=Goblin Gumbo Kettle", "=ds="..AL["Goblin Gumbo"]};
				{ 6, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Through The Dark Portal"]};
				{ 7, 32588, "", "=q3=Banana Charm", "=ds="..AL["King Mukla"]};
				{ 8, 32566, "", "=q3=Picnic Basket", "=ds="..AL["Rest and Relaxation"]};
				{ 9, 32542, "", "=q3=Imp in a Ball", "=ds="..AL["Fortune Telling"]};
				{ 11, 0, "INV_Box_01", "=q6=#ud1#", "=q1="..AL["Heroes of Azeroth"]};
				{ 12, 23705, "", "=q4=Tabard of Flame", "=ds="..AL["Landro Longshot"]};
				{ 13, 23713, "", "=q4=Hippogryph Hatchling", "=ds="..AL["Thunderhead Hippogryph"]};
				{ 14, 23720, "", "=q4=Riding Turtle", "=ds="..AL["Saltwater Snapjaw"]};
				{ 16, 0, "INV_Box_01", "=q6="..AL["UDE Items"], "=ds="..AL["No Longer Available"]};
				{ 17, 38312, "", "=q4=Tabard of Brilliance", "=ds=#s7#"};
				{ 18, 23709, "", "=q4=Tabard of Frost", "=ds=#s7#"};
				{ 19, 38313, "", "=q4=Tabard of Fury", "=ds=#s7#"};
				{ 20, 38309, "", "=q4=Tabard of Nature", "=ds=#s7#"};
				{ 21, 38310, "", "=q4=Tabard of the Arcane", "=ds=#s7#"};
				{ 22, 38314, "", "=q4=Tabard of the Defender", "=ds=#s7#"};
				{ 23, 38314, "", "=q4=Tabard of the Defender", "=ds=#s7#"};
				{ 24, 38311, "", "=q4=Tabard of the Void", "=ds=#s7#"};
				{ 25, 49704, "", "=q4=Carved Ogre Idol", "=ds="};
				{ 26, 49703, "", "=q4=Perpetual Purple Firework", "=ds="};
			};
		};
		info = {
			name = AL["TCG Items"],
			module = moduleName, menu = "SETMENU",
		};
	}

		------------------
		--- Companions ---
		------------------

	AtlasLoot_Data["PetsMerchant"] = {
		["Normal"] = {
			{
				{
					{ 2, 54436, "", "=q3=Blue Clockwork Rocket Bot", "=ds=#e13#", "=ds="..ALIL["Dalaran"].." / "..ALIL["Orgrimmar"]};
					{ 2, 54436, "", "=q3=Blue Clockwork Rocket Bot", "=ds=#e13#", "=ds="..ALIL["Dalaran"].." / "..ALIL["Stormwind City"]};
				};
				{ 3, 70160, "", "=q3=Crimson Lasher", "=ds=#e13#", "=ds="..ALIL["Molten Front"]},
				{ 4, 39973, "", "=q3=Ghostly Skull", "=ds=#e13#", "=ds="..ALIL["Dalaran"]};
				{ 5, 70140, "", "=q3=Hyjal Bear Cub", "=ds=#e13#", "=ds="..ALIL["Molten Front"]},
				{ 6, 34955, "", "=q3=Scorched Stone", "=ds=#e13#", "=ds="..ALIL["Molten Front"]};
				{ 7, 44822, "", "=q1=Albino Snake", "=ds=#e13#", "=ds="..ALIL["Dalaran"]};
				{ 8, 11023, "", "=q1=Ancona Chicken", "=ds=#e13#", "=ds="..ALIL["Thousand Needles"]};
				{ 9, 10360, "", "=q1=Black Kingsnake", "=ds=#e13#", "=ds="..ALIL["Orgrimmar"]};
				{ 10, 29958, "", "=q1=Blue Dragonhawk Hatchling", "=ds=#e13#", "=ds="..ALIL["Netherstorm"]};
				{ 11, 29901, "", "=q1=Blue Moth Egg", "=ds=#e13#", "=ds="..ALIL["The Exodar"]};
				{ 12, 29364, "", "=q1=Brown Rabbit Crate", "=ds=#e13#", "=ds="..ALIL["Netherstorm"]};
				{ 13, 10361, "", "=q1=Brown Snake", "=ds=#e13#", "=ds="..ALIL["Orgrimmar"]};
				{ 14, 8485, "", "=q1=Cat Carrier (Bombay)", "=ds=#e13#", "=ds="..ALIL["Elwynn Forest"]};
				{ 17, 46398, "", "=q1=Cat Carrier (Calico Cat)", "=ds=#e13#", "=ds="..ALIL["Dalaran"]};
				{ 18, 8486, "", "=q1=Cat Carrier (Cornish Rex)", "=ds=#e13#", "=ds="..ALIL["Elwynn Forest"]};
				{ 19, 8487, "", "=q1=Cat Carrier (Orange Tabby)", "=ds=#e13#", "=ds="..ALIL["Elwynn Forest"]};
				{ 20, 8490, "", "=q1=Cat Carrier (Siamese)", "=ds=#e13#", "=ds="..ALIL["Netherstorm"]};
				{ 21, 8488, "", "=q1=Cat Carrier (Silver Tabby)", "=ds=#e13#", "=ds="..ALIL["Elwynn Forest"]};
				{ 22, 8489, "", "=q1=Cat Carrier (White Kitten)", "=ds=#e13#", "=ds="..ALIL["Stormwind City"]};
				{ 23, 10392, "", "=q1=Crimson Snake", "=ds=#e13#", "=ds="..ALIL["Netherstorm"].." / "..ALIL["Orgrimmar"]};
				{ 24, "s123214", "", "=q1=Gilnean Raven", "=ds=#e13#", "=ds="..AL["Battle Pet Trainer"].." =ec1=#m7#"};
				{ 25, 29953, "", "=q1=Golden Dragonhawk Hatchling", "=ds=#e13#", "=ds="..ALIL["Eversong Woods"]};
				{ 26, 8500, "", "=q1=Great Horned Owl", "=ds=#e13#", "=ds="..ALIL["Darnassus"]};
				{ 27, 8501, "", "=q1=Hawk Owl", "=ds=#e13#", "=ds="..ALIL["Darnassus"]};
				{ 28, 88148, "", "=q1=Jade Crane Chick", "=ds=#e13#", "=ds="..AL["Battle Pet Trainer"]};
				{ 29, 29363, "", "=q1=Mana Wyrmling", "=ds=#e13#", "=ds="..ALIL["Netherstorm"]};
			};
			{
				{ 2, 48120, "", "=q1=Obsidian Hatchling", "=ds=#e13#", "=ds="..ALIL["Dalaran"]};
				{ 3, 8496, "", "=q1=Parrot Cage (Cockatiel)", "=ds=#e13#", "=ds="..ALIL["Booty Bay"]};
				{ 4, 8492, "", "=q1=Parrot Cage (Green Wing Macaw)", "=ds=#e13#", "=ds="..ALIL["The Deadmines"]};
				{ 5, 8495, "", "=q1=Parrot Cage (Senegal)", "=ds=#e13#", "=ds="..ALIL["Netherstorm"].." / "..ALIL["Booty Bay"]};
				{ 6, 10394, "", "=q1=Prairie Dog Whistle", "=ds=#e13#", "=ds="..ALIL["Thunder Bluff"]};
				{ 7, 8497, "", "=q1=Rabbit Crate (Snowshoe)", "=ds=#e13#", "=ds="..ALIL["Dun Morogh"]};
				{ 8, 29956, "", "=q1=Red Dragonhawk Hatchling", "=ds=#e13#", "=ds="..ALIL["Silvermoon City"]};
				{ 9, 29902, "", "=q1=Red Moth Egg", "=ds=#e13#", "=ds="..ALIL["Netherstorm"]};
				{ 10, "s123212", "", "=q1=Shore Crawler", "=ds=#e13#", "=ds="..AL["Battle Pet Trainer"].." =ec1=#m6#"};
				{ 11, 29957, "", "=q1=Silver Dragonhawk Hatchling", "=ds=#e13#", "=ds="..ALIL["Silvermoon City"]};
				{ 12, 10393, "", "=q1=Undercity Cockroach", "=ds=#e13#", "=ds="..ALIL["Netherstorm"].." / "..ALIL["Undercity"]};
				{
					{ 13, 46767, "", "=q1=Warbot Ignition Key", "=ds=#e13#", "=ds="..ALIL["Dalaran"].." / "..ALIL["Orgrimmar"]};
					{ 13, 46767, "", "=q1=Warbot Ignition Key", "=ds=#e13#", "=ds="..ALIL["Dalaran"].." / "..ALIL["Stormwind City"]};
				};
				{ 14, 29904, "", "=q1=White Moth Egg", "=ds=#e13#", "=ds="..ALIL["The Exodar"]};
				{ 17, 69239, "", "=q1=Winterspring Cub", "=ds=#e13#", "=ds="..ALIL["Winterspring"]};
				{ 18, 29903, "", "=q1=Yellow Moth Egg", "=ds=#e13#", "=ds="..ALIL["The Exodar"]};
			};
		};
		info = {
			name = AL["Merchant Sold Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsQuest"] = {
		["Normal"] = {
			{
				{ 1, 35350, "", "=q3=Chuck's Bucket", "=ds=#e13#", "=q1="..AL["Fishing Daily Reward"]..": "..ALIL["Terokkar Forest"]};
				{ 2, 91040, "", "=q3=Darkmoon Eye", "=ds=#e13#", "=q1=#m4#: #QUESTID:32175#"};
				{ 3, 94210, "", "=q3=Mountain Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32604# / "..ALIL["Fabled Pandaren Pet Supplies"]};
				{ 4, 33818, "", "=q3=Muckbreath's Bucket", "=ds=#e13#", "=q1="..AL["Fishing Daily Reward"]..": "..ALIL["Terokkar Forest"]};
				{ 5, 92799, "", "=q3=Pandaren Air Spirit", "=ds=#e13#", "=q1=#m4#: #QUESTID:32428# / "..ALIL["Sack of Pet Supplies"]};
				{ 6, 92800, "", "=q3=Pandaren Earth Spirit", "=ds=#e13#", "=q1=#m4#: #QUESTID:32428# / "..ALIL["Sack of Pet Supplies"]};
				{ 7, 92798, "", "=q3=Pandaren Fire Spirit", "=ds=#e13#", "=q1=#m4#: #QUESTID:32428# / "..ALIL["Sack of Pet Supplies"]};
				{ 8, 90173, "", "=q3=Pandaren Water Spirit", "=ds=#e13#", "=q1=#m4#: #QUESTID:32428# / "..ALIL["Sack of Pet Supplies"]};
				{ 9, 89587, "", "=q3=Porcupette", "=ds=#e13#", "=ds="..ALIL["Sack of Pet Supplies"]};
				{ 10, 94025, "", "=q3=Red Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32603#"};
				{ 11, 35349, "", "=q3=Snarly's Bucket", "=ds=#e13#", "=q1="..AL["Fishing Daily Reward"]..": "..ALIL["Terokkar Forest"]};
				{ 12, 94209, "", "=q3=Snowy Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32604# / "..ALIL["Fabled Pandaren Pet Supplies"]};
				{ 13, 94190, "", "=q3=Spectral Porcupette", "=ds=#e13#", "=q1=#m4#: #QUESTID:32616#"};
				{ 14, 44983, "", "=q3=Strand Crawler", "=ds=#e13#", "=q1="..AL["Fishing Daily Reward"]..": "..ALIL["Dalaran"]};
				{ 15, 94208, "", "=q3=Sunfur Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32604# / "..ALIL["Fabled Pandaren Pet Supplies"]};
				{ 16, 33816, "", "=q3=Toothy's Bucket", "=ds=#e13#", "=q1="..AL["Fishing Daily Reward"]..": "..ALIL["Terokkar Forest"]};
				{ 17, 72042, "", "=q1=Alliance Balloon", "=ds=#e13#", "=q1=#m4#: #QUESTID:29412# =ec1=#m7#"};
				{ 18, 65661, "", "=q1=Blue Mini Jouster", "=ds=#e13#", "=q1=#m4#: #QUESTID:25560#"};
				{ 19, 66067, "", "=q1=Brazie's Sunflower Seeds", "=ds=#e13#", "=q1=#m4#: #QUESTID:28748#"};
				{ 20, 11110, "", "=q1=Chicken Egg", "=ds=#e13#", "=q1=#m4#: #QUESTID:3861#"};
				{
					{ 21, 84105, "", "=q1=Fishy", "=ds=#e13#", "=q1=#m4#: #QUESTID:31239#"};
					{ 21, 84105, "", "=q1=Fishy", "=ds=#e13#", "=q1=#m4#: #QUESTID:29905#"};
				};
				{ 22, 65662, "", "=q1=Gold Mini Jouster", "=ds=#e13#", "=q1=#m4#: #QUESTID:25560#"};
				{ 23, 72045, "", "=q1=Horde Balloon", "=ds=#e13#", "=q1=#m4#: #QUESTID:29401# =ec1=#m6#"};
				{ 24, 69251, "", "=q1=Lashtail Hatchling", "=ds=#e13#", "=q1=#m4#: #QUESTID:29208#"};
				{ 25, 10398, "", "=q1=Mechanical Chicken", "=ds=#e13#", "=q1=#m4#: #QUESTID:3721#"};
				{ 26, 31760, "", "=q1=Miniwing", "=ds=#e13#", "=q1=#m4#: #QUESTID:10898#"};
				{ 27, 68833, "", "=q1=Panther Cub", "=ds=#e13#", "=q1=#m4#: #QUESTID:29267#"};
				{ 28, 66080, "", "=q1=Tiny Flamefly", "=ds=#e13#", "=q1=#m4#: #QUESTID:28415#"};
				{ 29, 46325, "", "=q1=Withers", "=ds=#e13#", "=q1=#m4#: #QUESTID:13570#"};
			};
		};
		info = {
			name = AL["Quest Reward Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsCrafted"] = {
		["Normal"] = {
			{
				{ 2, 0, "INV_Box_01", "=q6=#p25#", ""};
				{ 3, 60847, "", "=q4=Crawling Claw", "=ds=#e13#"};
				{ 4, 64372, "", "=q3=Clockwork Gnome", "=ds=#e13#"};
				{ 5, 60955, "", "=q3=Fossilized Hatchling", "=ds=#e13#"};
				{ 6, 69821, "", "=q3=Pterrordax Hatchling", "=ds=#e13#"};
				{ 7, 69824, "", "=q3=Voodoo Figurine", "=ds=#e13#"};
				{ 9, 0, "INV_Box_01", "=q6=#p23#", ""};
				{ 10, 67282, "", "=q3=Elementium Geode", "=ds=#e13#"};
				{ 12, 0, "INV_Box_01", "=q6=#p4#", ""};
				{ 13, 67274, "", "=q3=Enchanted Lantern", "=ds=#e13#"};
				{ 14, 67275, "", "=q3=Magic Lamp", "=ds=#e13#"};
				{ 17, 0, "INV_Box_01", "=q6=#p5#", ""};
				{ 18, 60216, "", "=q3=De-Weaponized Mechanical Companion", "=ds=#e13#"};
				{ 19, 87526, "", "=q3=Mechanical Pandaren Dragonling", "=ds=#e13#"};
				{ 20, 59597, "", "=q3=Personal World Destroyer", "=ds=#e13#"};
				{ 21, 15996, "", "=q1=Lifelike Mechanical Toad", "=ds=#e13#"};
				{ 22, 11826, "", "=q1=Lil' Smoky", "=ds=#e13#"};
				{ 23, 4401, "", "=q1=Mechanical Squirrel Box", "=ds=#e13#"};
				{ 24, 11825, "", "=q1=Pet Bombling", "=ds=#e13#"};
				{ 25, 21277, "", "=q1=Tranquil Mechanical Yeti", "=ds=#e13#"};
			};
			{
				{ 2, 0, "INV_Box_01", "=q6=#p24#", ""};
				{ 3, 43698, "", "=q3=Giant Sewer Rat", "=ds=#e13#", "#ACHIEVEMENTID:1958#, =q1="..ALIL["Dalaran"]};
				{ 4, 73953, "", "=q3=Sea Pony", "=ds=#e13#", "=q1="..AL["Darkmoon Island"]};
				{ 5, 27445, "", "=q1=Magical Crawdad Box", "=ds=#e13#", "=q1="..ALIL["Terokkar Forest"]};
				{ 6, 94933, "", "=q1=Tiny Blue Carp", "=ds=#e13#", "=q1="..ALIL["Vale of Eternal Blossoms"]};
				{ 7, 94934, "", "=q1=Tiny Green Carp", "=ds=#e13#", "=q1="..ALIL["The Jade Forest"].." / "..ALIL["Krasarang Wilds"].." / "..ALIL["Valley of the Four Winds"]};
				{ 8, 94932, "", "=q1=Tiny Red Carp", "=ds=#e13#", "=q1="..ALIL["Townlong Steppes"].." / "..ALIL["Dread Wastes"]};
				{ 9, 94935, "", "=q1=Tiny White Carp", "=ds=#e13#", "=q1="..ALIL["Kun-Lai Summit"].." / "..ALIL["Pandaria"]};
				{ 11, 0, "INV_Box_01", "=q6=#p26#", ""};
				{ 12, 89368, "", "=q1=Chi-ji Kite", "=ds=#e13#"};
				{ 13, 89367, "", "=q1=Yu'lon Kite", "=ds=#e13#"};
				{ 17, 0, "INV_Box_01", "=q6=#p12#", ""};
				{ 18, 82774, "", "=q3=Jade Owl", "=ds=#e13#"};
				{ 19, 82775, "", "=q3=Sapphire Cub", "=ds=#e13#"};
				{ 21, 0, "INV_Box_01", "=q6=#p8#", ""};

				{ 22, 90900, "", "=q3=Imperial Moth", "=ds=#e13#"};
				{ 23, 90902, "", "=q2=Imperial Silkworm", "=ds=#e13#"};
			};
		};
		info = {
			name = AL["Crafted Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsAchievement"] = {
		["Normal"] = {
			{
				{ 2, 63398, "", "=q3=Armadillo Pup", "=ds=#e13#", "#ACHIEVEMENTID:5144#"};
				{ 3, 71387, "", "=q3=Brilliant Kaliri", "=ds=#e13#", "#ACHIEVEMENTID:5877#" },
				{ 4, 54810, "", "=q3=Celestial Dragon", "=ds=#e13#", "#ACHIEVEMENTID:5875#" },
				{
					{ 5, 63138, "", "=q3=Dark Phoenix Hatchling", "=ds=#e13#", "#ACHIEVEMENTID:5892#, =ec1=#m6#"};
					{ 5, 63138, "", "=q3=Dark Phoenix Hatchling", "=ds=#e13#", "#ACHIEVEMENTID:5812#, =ec1=#m7#"};
				};
				{
					{ 6, 65364, "", "=q3=Guild Herald", "=ds=#e13#", "#ACHIEVEMENTID:5201#, =ec1=#m6#"};
					{ 6, 65363, "", "=q3=Guild Herald", "=ds=#e13#", "#ACHIEVEMENTID:5201#, =ec1=#m7#"};
				};
				{
					{ 7, 65362, "", "=q3=Guild Page", "=ds=#e13#", "#ACHIEVEMENTID:5179#, =ec1=#m6#"};
					{ 7, 65361, "", "=q3=Guild Page", "=ds=#e13#", "#ACHIEVEMENTID:5031#, =ec1=#m7#"};
				};
				{ 8, 85578, "", "=q3=Feral Vermling", "=ds=#e13#", "#ACHIEVEMENTID:7500#"};
				{ 9, 86562, "", "=q3=Hopling", "=ds=#e13#", "#ACHIEVEMENTID:6402#"};
				{ 10, 89686, "", "=q3=Jade Tentacle", "=ds=#e13#", "#ACHIEVEMENTID:7521#"};
				{ 11, 44738, "", "=q3=Kirin Tor Familiar", "=ds=#e13#", "#ACHIEVEMENTID:1956#"};
				{ 12, 44841, "", "=q3=Little Fawn's Salt Lick", "=ds=#e13#", "#ACHIEVEMENTID:2516#"};
				{ 13, 93031, "", "=q3=Mr. Bigglesworth's Frigid Collar", "=ds=#e13#", "#ACHIEVEMENTID:7934#"};
				{ 14, 71140, "", "=q3=Nuts' Acorn", "=ds=#e13#", "#ACHIEVEMENTID:5876#" },
				{ 17, 49912, "", "=q3=Perky Pug", "=ds=#e13#", "#ACHIEVEMENTID:4478#"};
				{ 18, 88147, "", "=q3=Singing Cricket Cage", "=ds=#e13#", "#ACHIEVEMENTID:6582#"};
				{ 19, 40653, "", "=q3=Reeking Pet Carrier", "=ds=#e13#", "#ACHIEVEMENTID:1250#"};
				{ 20, 85513, "", "=q3=Thundering Serpent Hatchling", "=ds=#e13#", "#ACHIEVEMENTID:6634#"};
				{
					{ 21, 44810, "", "=q3=Turkey Cage", "=ds=#e13#", "#ACHIEVEMENTID:3656#, =ec1=#m6#"};
					{ 21, 44810, "", "=q3=Turkey Cage", "=ds=#e13#", "#ACHIEVEMENTID:3478#, =ec1=#m7#"};
				};
				{ 22, 89736, "", "=q3=Venus", "=ds=#e13#", "#ACHIEVEMENTID:7501#"};
				{ 23, 71033, "", "=q1=Lil' Tarecgosa", "=ds=#e13#", "#ACHIEVEMENTID:5840#" },
				{ 24, 60869, "", "=q1=Pebble", "=ds=#e13#", "#ACHIEVEMENTID:5449#"};
			};
		};
		info = {
			name = AL["Achievement Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsFaction"] = {
		["Normal"] = {
			{
				{ 2, 38628, "", "=q3=Nether Ray Fry", "=ds=#e13#", "=ds="..ALIL["Sha'tari Skyguard"]};
				{ 3, 44723, "", "=q3=Nurtured Penguin Egg", "=ds=#e13#", "=ds="..ALIL["The Kalu'ak"]};
				{ 4, 85222, "", "=q3=Red Cricket", "=ds=#e13#", "=ds="..ALIL["Sho"].." - "..AL["Best Friend"]};
				{ 5, 85447, "", "=q3=Tiny Goldfish", "=ds=#e13#", "=ds="..ALIL["The Anglers"]};
				{ 6, 34478, "", "=q3=Tiny Sporebat", "=ds=#e13#", "=ds="..ALIL["Sporeggar"]};
				{ 7, 39898, "", "=q1=Cobra Hatchling", "=ds=#e13#", "=ds="..ALIL["The Oracles"].." - =q2="..ALIL["Mysterious Egg"]};
				{ 8, 44721, "", "=q1=Proto-Drake Whelp", "=ds=#e13#", "=ds="..ALIL["The Oracles"].." - =q2="..ALIL["Mysterious Egg"]};
				{ 9, 39896, "", "=q1=Tickbird Hatchling", "=ds=#e13#", "=ds="..ALIL["The Oracles"].." - =q2="..ALIL["Mysterious Egg"]};
				{ 10, 39899, "", "=q1=White Tickbird Hatchling", "=ds=#e13#", "=ds="..ALIL["The Oracles"].." - =q2="..ALIL["Mysterious Egg"]};
				{
					{ 17, "", "inv_misc_tournaments_symbol_orc", "=q6="..AL["Horde"], ""};
					{ 17, "", "inv_misc_tournaments_symbol_human", "=q6="..AL["Alliance"], ""};
				};
				{
					{ 18, 90898, "", "=q3=Fox Kit", "=ds=#e13#", "=ds="..ALIL["Hellscream's Reach"]};
					{ 18, 90897, "", "=q3=Fox Kit", "=ds=#e13#", "=ds="..ALIL["Baradin's Wardens"]};
				};
				{
					{ 19, 64996, "", "=q3=Rustberg Gull", "=ds=#e13#", "=ds="..ALIL["Hellscream's Reach"]};
					{ 19, 63355, "", "=q3=Rustberg Gull", "=ds=#e13#", "=ds="..ALIL["Baradin's Wardens"]};
				};
				{
					{ 20, 46821, "", "=q3=Shimmering Wyrmling", "=ds=#e13#", "=ds="..ALIL["The Sunreavers"]};
					{ 20, 46820, "", "=q3=Shimmering Wyrmling", "=ds=#e13#", "=ds="..ALIL["The Silver Covenant"]};
				};
				{
					{ 21, 93025, "", "=q1=Clock'em", "=ds=#e13#", "=ds="..ALIL["Brawl'gar Arena"].." - "..AL["Rank 4"]};
					{ 21, 93025, "", "=q1=Clock'em", "=ds=#e13#", "=ds="..ALIL["Bizmo's Brawlpub"].." - "..AL["Rank 4"]};
				};
			};
		};
		info = {
			name = AL["Faction Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsRare"] = {
		["Normal"] = {
			{
				{ 2, 80008, "", "=q4=Darkmoon Rabbit", "=ds=#e13#", "#ACHIEVEMENTID:6332#"};
				{ 3, 8494, "", "=q4=Parrot Cage (Hyacinth Macaw)", "=ds=#e13#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Stranglethorn Vale"]};

				{ 4, 64403, "", "=q3=Fox Kit", "=ds=#e13#", "=q2="..AL["Baradin Fox"]..", =q1="..ALIL["Tol Barad Peninsula"]};
				{ 5, 43698, "", "=q3=Giant Sewer Rat", "=ds=#e13#", "#ACHIEVEMENTID:1958#, =q1="..ALIL["Dalaran"]};
				{ 6, 86564, "", "=q3=Imbued Jade Fragment", "=ds=#e13#", "=q2="..ALIL["Karr the Darkener"]..", =q1="..ALIL["Dread Wastes"]};
				{ 7, 86563, "", "=q3=Hollow Reed", "=ds=#e13#", "=q2="..ALIL["Nalash Verdantis"]..", =q1="..ALIL["Dread Wastes"]};
				{ 8, 73953, "", "=q3=Sea Pony", "=ds=#e13#", "=q2=#p24#, =q1="..AL["Darkmoon Island"]};
				{ 9, 94595, "", "=q3=Spawn of G'nathus", "=ds=#e13#", "=q2="..BabbleRare["G'nathus"]..", =q1="..ALIL["Townlong Steppes"]};
				{ 10, 94124, "", "=q3=Sunreaver Micro-Sentry", "=ds=#e13#", "=q2="..ALIL["Haywire Sunreaver Construct"]..", =q1="..ALIL["Isle of Thunder"]};
				{ 11, 85220, "", "=q3=Terrible Turnip", "=ds=#e13#", "=q2="..ALIL["Ominous Seed"]..", =q1="..AL["Halfhill Farm"]};
				{ 12, 95422, "", "=q3=Zandalari Anklerender", "=ds=#e13#", "=q1="..ALIL["Isle of Giants"]};

				{ 13, 95423, "", "=q3=Zandalari Footslasher", "=ds=#e13#", "=q1="..ALIL["Isle of Giants"]};

				{ 14, 94126, "", "=q3=Zandalari Kneebiter", "=ds=#e13#", "=q1="..ALIL["Isle of Giants"]};

				{ 15, 95424, "", "=q3=Zandalari Toenibbler", "=ds=#e13#", "=q1="..ALIL["Isle of Giants"]};

				{ 17, 34535, "", "=q1=Azure Whelpling", "=ds=#e13#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Winterspring"]};
				{ 18, 29960, "", "=q1=Captured Firefly", "=ds=#e13#", "=q2="..AL["Bogflare Needler"]..", =q1="..ALIL["Zangarmarsh"]};
				{ 19, 8491, "", "=q1=Cat Carrier (Black Tabby)", "=ds=#e13#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Hillsbrad Foothills"]};
				{ 20, 10822, "", "=q1=Dark Whelpling", "=ds=#e13#", "=q2="..ALIL["Wetlands"].." / "..ALIL["Badlands"].." / "..ALIL["Burning Steppes"]};
				{ 21, 48112, "", "=q1=Darting Hatchling", "=ds=#e13#", "=q2="..BabbleRare["Dart's Nest"]..", =q1="..ALIL["Dustwallow Marsh"]};
				{ 22, 20769, "", "=q1=Disgusting Oozeling", "=ds=#e13#", "=q2="..ALIL["Oozing Bag"]..", =q1="..AL["Various Locations"]};
				{ 23, 48116, "", "=q1=Gundrak Hatchling", "=ds=#e13#", "=q2="..AL["Gundrak Raptor"]..", =q1="..ALIL["Zul'Drak"]};
				{ 24, 48118, "", "=q1=Leaping Hatchling", "=ds=#e13#", "=q2="..BabbleRare["Takk's Nest"]..", =q1="..ALIL["Northern Barrens"]};
				{ 25, 27445, "", "=q1=Magical Crawdad Box", "=ds=#e13#", "=ds="..ALIL["Terokkar Forest"]};
				{ 26, 66076, "", "=q1=Mr. Grubbs", "=ds=#e13#", "=q2="..ALIL["Hidden Stash"]..", =q1="..ALIL["Eastern Plaguelands"]};
				{ 27, 48122, "", "=q1=Ravasaur Hatchling", "=ds=#e13#", "=q2="..BabbleRare["Ravasaur Matriarch's Nest"]..", =q1="..ALIL["Un'Goro Crater"]};
				{ 28, 48124, "", "=q1=Razormaw Hatchling", "=ds=#e13#", "=q2="..BabbleRare["Razormaw Matriarch's Nest"]..", =q1="..ALIL["Wetlands"]};
				{ 29, 48126, "", "=q1=Razzashi Hatchling", "=ds=#e13#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Stranglethorn Vale"]};
				{ 30, 11474, "", "=q1=Sprite Darter Egg", "=ds=#e13#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Feralas"]};
				extraText = ": "..AL["World Drop"]
			};
			{
				{ 2, 8499, "", "=q1=Tiny Crimson Whelpling", "=ds=#e13#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Wetlands"]};
				{ 3, 8498, "", "=q1=Tiny Emerald Whelpling", "=ds=#e13#", "=q2="..AL["Noxious Whelp"]..", =q1="..ALIL["Feralas"]};
				{ 4, 64494, "", "=q1=Tiny Shale Spider", "=ds=#e13#", "=q2="..BabbleRare["Jadefang"]..", =q1="..ALIL["Deepholm"]};
				extraText = ": "..AL["World Drop"]
			};
			{
				{ 2, 93040, "", "=q3=Anubisath Idol", "=ds=#e13#", "=q2="..BabbleBoss["Emperor Vek'lor"]..", =q1="..ALIL["Temple of Ahn'Qiraj"]};
				{ 3, 93037, "", "=q3=Blackwing Banner", "=ds=#e13#", "=q2="..BabbleBoss["Broodlord Lashlayer"]..", =q1="..ALIL["Blackwing Lair"]};
				{ 4, 93034, "", "=q3=Blazing Rune", "=ds=#e13#", "=q2="..BabbleBoss["Magmadar"]..", =q1="..ALIL["Molten Core"]};
				{ 5, 93032, "", "=q3=Blighted Spore", "=ds=#e13#", "=q2="..BabbleBoss["Loatheb"]..", =q1="..ALIL["Naxxramas"]};
				{ 6, 93035, "", "=q3=Core of Hardened Ash", "=ds=#e13#", "=q2="..BabbleBoss["Golemagg the Incinerator"]..", =q1="..ALIL["Molten Core"]};
				{ 7, 93030, "", "=q3=Dusty Clutch of Eggs", "=ds=#e13#", "=q2="..BabbleBoss["Maexxna"]..", =q1="..ALIL["Naxxramas"]};
				{ 8, 93029, "", "=q3=Gluth's Bone", "=ds=#e13#", "=q2="..BabbleBoss["Gluth"]..", =q1="..ALIL["Naxxramas"]};
				{ 9, 93041, "", "=q3=Jewel of Maddening Whispers", "=ds=#e13#", "=q2="..BabbleBoss["The Prophet Skeram"]..", =q1="..ALIL["Temple of Ahn'Qiraj"]};
				{ 10, 94835, "", "=q3=Ji-Kun Hatchling", "=ds=#e13#", "=q2="..AtlasLoot:EJ_GetBossName("Ji-Kun", 828)..", =q1="..ALIL["Throne of Thunder"]};
				{ 11, 94125, "", "=q3=Living Sandling", "=ds=#e13#", "=q2="..AL["Trash Mobs"]..", =q1="..ALIL["Throne of Thunder"]};
				{ 12, 93033, "", "=q3=Mark of Flame", "=ds=#e13#", "=q2="..BabbleBoss["Sulfuron Harbinger"]..", =q1="..ALIL["Molten Core"]};
				{ 13, 33993, "", "=q3=Mojo", "=ds=#e13#", "=q1="..ALIL["Zul'Aman"]};
				{ 14, 35504, "", "=q3=Phoenix Hatchling", "=ds=#e13#", "=q2="..AtlasLoot:EJ_GetBossName("Kael'thas Sunstrider", 533)..", =q1="..ALIL["Magisters' Terrace"]};
				{ 15, 68673, "", "=q3=Smolderweb Egg", "=ds=#e13#", "=q2="..AtlasLoot:EJ_GetBossName("Mother Smolderweb", 391)..", =q1="..ALIL["Lower Blackrock Spire"]};
				{ 17, 94152, "", "=q3=Son of Animus", "=ds=#e13#", "=q2="..AtlasLoot:EJ_GetBossName("Dark Animus", 824)..", =q1="..ALIL["Throne of Thunder"]};
				{ 18, 93036, "", "=q3=Unscathed Egg", "=ds=#e13#", "=q2="..BabbleBoss["Razorgore the Untamed"]..", =q1="..ALIL["Blackwing Lair"]};
				{ 19, 93039, "", "=q3=Viscidus Globule", "=ds=#e13#", "=q2="..BabbleBoss["Viscidus"]..", =q1="..ALIL["Temple of Ahn'Qiraj"]};
				{ 20, 93038, "", "=q3=Whistle of Chromatic Bone", "=ds=#e13#", "=q2="..BabbleBoss["Chromaggus"]..", =q1="..ALIL["Blackwing Lair"]};
				{ 21, 12264, "", "=q3=Worg Carrier", "=ds=#e13#", "=q2="..AtlasLoot:EJ_GetBossName("Quartermaster Zigris", 393)..", =q1="..ALIL["Lower Blackrock Spire"]};
				{ 22, 48114, "", "=q1=Deviate Hatchling", "=ds=#e13#", "=q2="..AL["Deviate Ravager/Deviate Guardian"]..", =q1="..ALIL["Wailing Caverns"]};
				extraText = ": "..AL["Dungeon/Raid"]
			};
		};
		info = {
			name = AL["Rare Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsEvent"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Argent Tournament"], ""};
				{ 2, 45022, "", "=q3=Argent Gruntling", "=ds=#e13#", "=ds=#m4#, =ec1=#m6#"};
				{ 3, 44998, "", "=q3=Argent Squire", "=ds=#e13#", "=ds=#m4#, =ec1=#m7#"};
				{ 4, 44984, "", "=q3=Ammen Vale Lashling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 5, 44970, "", "=q3=Dun Morogh Cub", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 6, 44973, "", "=q3=Durotar Scorpion", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 7, 44974, "", "=q3=Elwynn Lamb", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 8, 44982, "", "=q3=Enchanted Broom", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 9, 45002, "", "=q3=Mechanopeep", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 10, 44980, "", "=q3=Mulgore Hatchling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 11, 45606, "", "=q3=Sen'jin Fetish", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 12, 44965, "", "=q3=Teldrassil Sproutling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 13, 44971, "", "=q3=Tirisfal Batling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Brewfest"], ""};
				{ 17, 46707, "", "=q3=Pint-Sized Pink Pachyderm", "=ds=#e13#", "#BREWFEST:100#"};
				{ 18, 32233, "", "=q3=Wolpertinger's Tankard", "=ds=#e13#", "40 #silver#"};
				{ 20, 0, "INV_Box_01", "=q6="..AL["Children's Week"], ""};
				{ 21, 46545, "", "=q3=Curious Oracle Hatchling", "=ds=#e13#", "=q1=#m4#: #QUESTID:13959#"};
				{ 22, 46544, "", "=q3=Curious Wolvar Pup", "=ds=#e13#", "=q1=#m4#: #QUESTID:13960#"};
				{
					{ 23, 32616, "", "=q3=Egbert's Egg", "=ds=#e13#", "=q1=#m4#: #QUESTID:10967#"};
					{ 23, 32616, "", "=q3=Egbert's Egg", "=ds=#e13#", "=q1=#m4#: #QUESTID:10966#"};
				};
				{
					{ 24, 32622, "", "=q3=Elekk Training Collar", "=ds=#e13#", "=q1=#m4#: #QUESTID:10967#"};
					{ 24, 32622, "", "=q3=Elekk Training Collar", "=ds=#e13#", "=q1=#m4#: #QUESTID:10966#"};
				};
				{
					{ 25, 69648, "", "=q3=Legs", "=ds=#e13#", "=q1=#m4#: #QUESTID:10967#"};
					{ 25, 69648, "", "=q3=Legs", "=ds=#e13#", "=q1=#m4#: #QUESTID:10966#"};
				};
				{
					{ 26, 32617, "", "=q3=Sleepy Willy", "=ds=#e13#", "=q1=#m4#: #QUESTID:10967#"};
					{ 26, 32617, "", "=q3=Sleepy Willy", "=ds=#e13#", "=q1=#m4#: #QUESTID:10966#"};
				};
				{
					{ 27, 23007, "", "=q1=Piglet's Collar", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
					{ 27, 23007, "", "=q1=Piglet's Collar", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
				};
				{
					{ 28, 23015, "", "=q1=Rat Cage", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
					{ 28, 23015, "", "=q1=Rat Cage", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
				};
				{
					{ 29, 66073, "", "=q1=Snail Shell", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
					{ 29, 66073, "", "=q1=Snail Shell", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
				};
				{
					{ 30, 23002, "", "=q1=Turtle Box", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
					{ 30, 23002, "", "=q1=Turtle Box", "=ds=#e13#", "=q1=#m4#: #QUESTID:171#"};
				};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..ALIL["Darkmoon Faire"], ""};
				{ 2, 80008, "", "=q4=Darkmoon Rabbit", "=ds=#e13#", "#ACHIEVEMENTID:6332#"};
				{ 3, 73762, "", "=q3=Darkmoon Balloon", "=ds=#e13#", "#DARKMOON:90#"};
				{ 4, 91040, "", "=q3=Darkmoon Eye", "=ds=#e13#", "=q1=#m4#: #QUESTID:32175#"};
				{ 5, 74981, "", "=q3=Darkmoon Cub", "=ds=#e13#", "#DARKMOON:90#"};
				{ 6, 91003, "", "=q3=Darkmoon Hatchling", "=ds=#e13#", "#DARKMOON:90#"};
				{ 7, 73764, "", "=q3=Darkmoon Monkey", "=ds=#e13#", "#DARKMOON:90#"};
				{ 8, 73903, "", "=q3=Darkmoon Tonk", "=ds=#e13#", "#DARKMOON:90#"};
				{ 9, 73765, "", "=q3=Darkmoon Turtle", "=ds=#e13#", "#DARKMOON:90#"};
				{ 10, 73905, "", "=q3=Darkmoon Zeppelin", "=ds=#e13#", "#DARKMOON:90#"};
				{ 11, 73953, "", "=q3=Sea Pony", "=ds=#e13#", "=q2=#p24#, =q1="..AL["Darkmoon Island"]};
				{ 12, 19450, "", "=q1=A Jubling's Tiny Home", "=ds=#e13#", "=q1=#m4#: #QUESTID:7946#"};
				{ 13, 11026, "", "=q1=Tree Frog Box", "=ds=#e13#", "1 #gold#"};
				{ 14, 11027, "", "=q1=Wood Frog Box", "=ds=#e13#", "1 #gold#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Feast of Winter Veil"], ""};
				{ 17, 73797, "", "=q3=Lump of Coal", "=ds=#e13#", "=ds=#e13#"};
				{ 18, 21301, "", "=q1=Green Helper Box", "=ds=#e13#", "=ds=#e13#"};
				{ 19, 21308, "", "=q1=Jingling Bell", "=ds=#e13#", "=ds=#e13#"};
				{ 20, 21305, "", "=q1=Red Helper Box", "=ds=#e13#", "=ds=#e13#"};
				{ 21, 21309, "", "=q1=Snowman Kit", "=ds=#e13#", "=ds=#e13#"};
				{ 23, 0, "INV_Box_01", "=q6="..AL["Hallow's End"], ""};
				{ 24, 33154, "", "=q3=Sinister Squashling", "=ds=#e13#", "#HALLOWSEND:150# =ds="..AL["Daily Reward"]};
				{
					{ 25, 71076, "", "=q1=Creepy Crate", "=ds=#e13#", "=q1=#m4#: #QUESTID:29429#"};
					{ 25, 71076, "", "=q1=Creepy Crate", "=ds=#e13#", "=q1=#m4#: #QUESTID:29413#"};
				};
				{ 26, 70908, "", "=q1=Feline Familiar", "=ds=#e13#", "#HALLOWSEND:150#"};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Love is in the Air"], ""};
				{ 2, 50446, "", "=q3=Toxic Wasteling", "=ds=#e13#", "=ds="..AL["Daily Reward"]};
				{ 3, 22235, "", "=q1=Truesilver Shafted Arrow", "=ds=#e13#", "#VALENTINEDAY:40#"};
				{ 5, 0, "INV_Box_01", "=q6="..AL["Lunar Festival"], ""};
				{ 6, 74611, "", "=q3=Festival Lantern", "=ds=#e13#", "#LUNARFESTIVAL:50#"};
				{ 7, 74610, "", "=q3=Lunar Lantern", "=ds=#e13#", "#LUNARFESTIVAL:50#"};
				{ 9, 0, "INV_Box_01", "=q6="..AL["Midsummer Fire Festival"], ""};
				{ 10, 23083, "", "=q3=Captured Flame", "=ds=#e13#", "#MIDSUMMER:350#"};
				{ 11, 53641, "", "=q3=Ice Chip", "=ds=#e13#", "=ds="..AL["Daily Reward"]};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Noblegarden"], ""};
				{ 17, 44794, "", "=q3=Spring Rabbit's Foot", "=ds=#e13#", "#NOBLEGARDEN:100#"};
				{ 19, 0, "INV_Box_01", "=q6="..AL["Pilgrim's Bounty"], ""};
				{
					{ 20, 44810, "", "=q3=Turkey Cage", "=ds=#e13#", "#ACHIEVEMENTID:3656#, =ec1=#m6#"};
					{ 20, 44810, "", "=q3=Turkey Cage", "=ds=#e13#", "#ACHIEVEMENTID:3478#, =ec1=#m7#"};
				};
			};
		};
		info = {
			name = BabbleInventory["Companions"].." - "..AL["World Events"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsPromotional"] = {
		["Normal"] = {
			{
				{ 2, 90177, "", "=q3=Baneling", "=ds=#e13#", "#ACHIEVEMENTID:7842#"};
				{ 3, 20371, "", "=q3=Blue Murloc Egg", "=ds=#e13#", "#ACHIEVEMENTID:411#"};
				{ 4, 49646, "", "=q3=Core Hound Pup", "=ds=#e13#", "=ds=#e13#"};
				{ 5, 13584, "", "=q3=Diablo Stone", "=ds=#e13#", "#ACHIEVEMENTID:662#"};
				{ 6, 76062, "", "=q3=Fetish Shaman's Spear", "=ds=#e13#", "#ACHIEVEMENTID:7412#"};
				{ 7, 39286, "", "=q3=Frosty's Collar", "=ds=#e13#", "#ACHIEVEMENTID:683#"};
				{ 8, 46802, "", "=q3=Heavy Murloc Egg", "=ds=#e13#", "#ACHIEVEMENTID:3536#"};
				{ 9, 62540, "", "=q3=Lil' Deathwing", "=ds=#e13#", "#ACHIEVEMENTID:5377#"};
				{ 10, 85871, "", "=q3=Lucky Quilen Cub", "=ds=#e13#", "#ACHIEVEMENTID:6848#"};
				{ 11, 30360, "", "=q3=Lurky's Egg", "=ds=#e13#", "=q2="..AL["Burning Crusade"].." "..AL["Collector's Edition"]};
				{ 17, 56806, "", "=q3=Mini Thor", "=ds=#e13#", "#ACHIEVEMENTID:4824#"};
				{ 18, 45180, "", "=q3=Murkimus' Little Spear", "=ds=#e13#", "#ACHIEVEMENTID:3618#"};
				{ 19, 71726, "", "=q3=Murky's Little Soulstone", "=ds=#e13#", "#ACHIEVEMENTID:6185#"};
				{ 20, 25535, "", "=q3=Netherwhelp's Collar", "=ds=#e13#", "#ACHIEVEMENTID:665#"};
				{ 21, 13583, "", "=q3=Panda Collar", "=ds=#e13#", "#ACHIEVEMENTID:663#"};
				{ 22, 22114, "", "=q3=Pink Murloc Egg", "=ds=#e13#", "=ds=#e13#"};
				{ 23, 67418, "", "=q3=Smoldering Murloc Egg", "=ds=#e13#", "#ACHIEVEMENTID:5378#"};
				{ 24, 39656, "", "=q3=Tyrael's Hilt", "=ds=#e13#", "#ACHIEVEMENTID:414#"};
				{ 25, 13582, "", "=q3=Zergling Leash", "=ds=#e13#", "#ACHIEVEMENTID:664#"};
			};
		};
		info = {
			name = AL["Promotional Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsCardGame"] = {
		["Normal"] = {
			{
				{ 2, 34493, "", "=q4=Dragon Kite", "=ds=#e13#", "=q1="..AL["March of the Legion"]};
				{ 3, 23713, "", "=q4=Hippogryph Hatchling", "=ds=#e13#", "=q1="..AL["Heroes of Azeroth"]};
				{ 4, 49287, "", "=q4=Tuskarr Kite", "=ds=#e13#", "=q1="..AL["Scourgewar"]};
				{ 5, 32588, "", "=q3=Banana Charm", "=ds=#e13#", "=q1="..AL["Through The Dark Portal"]};
				{ 6, 79744, "", "=q3=Eye of the Legion", "=ds=#e13#", "=q1="..AL["War of the Ancients"]};
				{ 7, 72134, "", "=q3=Grell Moss", "=ds=#e13#", "=q1="..AL["Crown of Heaven"]};
				{ 8, 93669, "", "=q3=Gusting Grimoire", "=q1="..AL["Betrayal of the Guardian"]};
				{ 9, 68840, "", "=q3=Landro's Lichling", "=ds=#e13#", "=q1="..AL["War of the Elements"]};
				{ 17, 67128, "", "=q3=Landro's Lil' XT", "=ds=#e13#", "=q1="..AL["Worldbreaker"]};
				{ 18, 71624, "", "=q3=Purple Puffer", "=ds=#e13#", "=q1="..ALIL["Throne of the Tides"]};
				{ 19, 34492, "", "=q3=Rocket Chicken", "=ds=#e13#", "=q1="..AL["March of the Legion"]};
				{ 20, 72153, "", "=q3=Sand Scarab", "=ds=#e13#", "=q1="..AL["Tomb of the Forgotten"]};
				{ 21, 38050, "", "=q3=Soul-Trader Beacon", "=ds=#e13#", "=q1="..AL["Hunt for Illidan"]};
				{ 22, 49343, "", "=q3=Spectral Tiger Cub", "=ds=#e13#", "=q1="..AL["Scourgewar"]};
				{ 23, 68841, "", "=q3=Nightsaber Cub", "=ds=#e13#", "=q1="..AL["Twilight of the Dragons"]};
			};
		};
		info = {
			name = AL["Card Game Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsRemoved"] = {
		["Normal"] = {
			{
				{ 2, 37297, "", "=q3=Gold Medallion", "=ds=#e13#"};
				{ 3, 41133, "", "=q3=Unhatched Mr. Chilly", "=ds=#e13#"};
				{ 4, 38658, "", "=q3=Vampiric Batling", "=ds=#e13#", "#ACHIEVEMENTID:2456#, =q1="..ALIL["Karazhan"]};
				{ 17, 44819, "", "=q1=Baby Blizzard Bear", "=ds=#e13#", "#ACHIEVEMENTID:2398#"};
				{ 18, 49362, "", "=q1=Onyxian Whelpling", "=ds=#e13#", "#ACHIEVEMENTID:4400#"};
			};
		};
		info = {
			name = AL["Unobtainable Companions"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsPetStore"] = {
		["Normal"] = {
			{
				{ 2, 70099, "", "=q4=Cenarion Hatchling", "=ds=#e13#"};
				{ 3, 92707, "", "=q4=Cinder Kitten", "=ds=#e13#"};
				{ 4, 49662, "", "=q3=Gryphon Hatchling", "=ds=#e13#"};
				{ 5, 72068, "", "=q3=Guardian Cub", "=ds=#e13#"};
				{ 6, 49693, "", "=q3=Lil' Phylactery", "=ds=#e13#"};
				{ 7, 68385, "", "=q3=Lil' Ragnaros", "=ds=#e13#"};
				{ 17, 54847, "", "=q3=Lil' XT", "=ds=#e13#"};
				{
					{ 18, 68619, "", "=q3=Moonkin Hatchling", "=ds=#e13#"};
					{ 18, 68618, "", "=q3=Moonkin Hatchling", "=ds=#e13#"};
				};
				{ 19, 49665, "", "=q3=Pandaren Monk", "=ds=#e13#"};
				{ 20, 78916, "", "=q3=Soul of the Aspects", "=ds=#e13#"};
				{ 21, 49663, "", "=q3=Wind Rider Cub", "=ds=#e13#"};
			};
		};
		info = {
			name = AL["Blizzard Store"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsAccessories"] = {
		["Normal"] = {
			{
				{ 2, 92738, "", "=q3=Safari Hat", "=ds=#s1#", "#ACHIEVEMENTID:7499#"};
				{ 4, 47541, "", "=q3=Argent Pony Bridle", "=ds="};
				{ 5, 38291, "", "=q3=Ethereal Mutagen", "=ds="};
				{ 6, 35223, "", "=q3=Papa Hummel's Old-Fashioned Pet Biscuit", "=ds="};
				{ 7, 37431, "", "=q2=Fetch Ball", "=ds="};
				{ 8, 43626, "", "=q2=Happy Pet Snack", "=ds="};
				{ 9, 89906, "", "=q2=Magical Mini-Treat", "=ds="};
				{ 19, 71153, "", "=q2=Magical Pet Biscuit", "=ds="};
				{ 20, 43352, "", "=q2=Pet Grooming Kit", "=ds="};
				{ 21, 89139, "", "=q1=Chain Pet Leash", "=ds="};
				{ 22, 89222, "", "=q1=Cloud Ring", "=ds="};
				{ 23, 90048, "", "=q1=Exquisite Murloc Leash", "=ds="};
				{ 24, 44820, "", "=q1=Red Ribbon Pet Leash", "=ds="};
				{ 25, 37460, "", "=q1=Rope Pet Leash", "=ds="};
			};
			{
				{ 1, 92742, "", "=q2=Polished Battle-Stone", "=ds=#e18#"};
				{ 2, 92689, "", "=q2=Polished Aquatic Battle-Stone", "=ds=#e18#"};
				{ 3, 92685, "", "=q2=Polished Beast Battle-Stone", "=ds=#e18#"};
				{ 4, 92686, "", "=q2=Polished Critter Battle-Stone", "=ds=#e18#"};
				{ 5, 92693, "", "=q2=Polished Dragonkin Battle-Stone", "=ds=#e18#"};
				{ 6, 92684, "", "=q2=Polished Elemental Battle-Stone", "=ds=#e18#"};
				{ 7, 92687, "", "=q2=Polished Flying Battle-Stone", "=ds=#e18#"};
				{ 8, 92692, "", "=q2=Polished Humanoid Battle-Stone", "=ds=#e18#"};
				{ 9, 92688, "", "=q2=Polished Magic Battle-Stone", "=ds=#e18#"};
				{ 10, 92690, "", "=q2=Polished Mechanical Battle-Stone", "=ds=#e18#"};
				{ 11, 92691, "", "=q2=Polished Undead Battle-Stone", "=ds=#e18#"};
				{ 16, 92741, "", "=q3=Flawless Battle-Stone", "=ds=#e18#"};
				{ 17, 92679, "", "=q3=Flawless Aquatic Battle-Stone", "=ds=#e18#"};
				{ 18, 92675, "", "=q3=Flawless Beast Battle-Stone", "=ds=#e18#"};
				{ 19, 92676, "", "=q3=Flawless Critter Battle-Stone", "=ds=#e18#"};
				{ 20, 92683, "", "=q3=Flawless Dragonkin Battle-Stone", "=ds=#e18#"};
				{ 21, 92665, "", "=q3=Flawless Elemental Battle-Stone", "=ds=#e18#"};
				{ 22, 92677, "", "=q3=Flawless Flying Battle-Stone", "=ds=#e18#"};
				{ 23, 92682, "", "=q3=Flawless Humanoid Battle-Stone", "=ds=#e18#"};
				{ 24, 92678, "", "=q3=Flawless Magic Battle-Stone", "=ds=#e18#"};
				{ 25, 92680, "", "=q3=Flawless Mechanical Battle-Stone", "=ds=#e18#"};
				{ 26, 92681, "", "=q3=Flawless Undead Battle-Stone", "=ds=#e18#"};
			};
		};
		info = {
			name = AL["Companion Accessories"],
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

	AtlasLoot_Data["PetsNEW"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Rare Companions"], ""};
				{ 2, 94835, "", "=q3=Ji-Kun Hatchling", "=ds=#e13#"};
				{ 3, 94125, "", "=q3=Living Sandling", "=ds=#e13#"};
				{ 4, 94152, "", "=q3=Son of Animus", "=ds=#e13#"};
				{ 5, 94595, "", "=q3=Spawn of G'nathus", "=ds=#e13#"};
				{ 6, 94124, "", "=q3=Sunreaver Micro-Sentry", "=ds=#e13#"};
				{ 7, 95422, "", "=q3=Zandalari Anklerender", "=ds=#e13#"};
				{ 8, 95423, "", "=q3=Zandalari Footslasher", "=ds=#e13#"};
				{ 9, 94126, "", "=q3=Zandalari Kneebiter", "=ds=#e13#"};
				{ 10, 95424, "", "=q3=Zandalari Toenibbler", "=ds=#e13#"};
				{ 12, 0, "INV_Box_01", "=q6="..AL["Card Game Companions"], ""};
				{ 13, 93669, "", "=q3=Gusting Grimoire", "=ds=#e13#", "=q1="..AL["Betrayal of the Guardian"]};
				{ 16, 0, "INV_Box_01", "=q6=#p24#", ""};
				{ 17, 94933, "", "=q3=Tiny Blue Carp", "=ds=#e13#"};
				{ 18, 94934, "", "=q3=Tiny Green Carp", "=ds=#e13#"};
				{ 19, 94932, "", "=q3=Tiny Red Carp", "=ds=#e13#"};
				{ 20, 94935, "", "=q3=Tiny White Carp", "=ds=#e13#"};
				{ 22, 0, "INV_Box_01", "=q6="..AL["Quest Reward Companions"], ""};
				{ 23, 94210, "", "=q3=Mountain Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32603#"};
				{ 24, 94025, "", "=q3=Red Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32604#"};
				{ 25, 94209, "", "=q3=Snowy Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32604#"};
				{ 26, 94208, "", "=q3=Sunfur Panda", "=ds=#e13#", "=q1=#m4#: #QUESTID:32604#"};
				{ 27, 94190, "", "=q3=Spectral Porcupette", "=ds=#e13#", "=q1=#m4#: #QUESTID:32616#"};
			};
		};
		info = {
			name = AL["New Companions"].." - Patch 5.2",
			module = moduleName, menu = "PETMENU", instance = "Pets",
		};
	}

		--------------
		--- Mounts ---
		--------------

	AtlasLoot_Data["MountsAlliance"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_misc_tournaments_symbol_nightelf", "=q6="..ALIL["Darnassus"].." #j30#", "=ec1=#m7#"};
				{ 2, 18766, "", "=q4=Reins of the Swift Frostsaber", "=ds=#e26#"};
				{ 3, 18767, "", "=q4=Reins of the Swift Mistsaber", "=ds=#e26#"};
				{ 4, 18902, "", "=q4=Reins of the Swift Stormsaber", "=ds=#e26#"};
				{ 5, 8632, "", "=q3=Reins of the Spotted Frostsaber", "=ds=#e26#"};
				{ 6, 47100, "", "=q3=Reins of the Striped Dawnsaber", "=ds=#e26#"};
				{ 7, 8631, "", "=q3=Reins of the Striped Frostsaber", "=ds=#e26#"};
				{ 8, 8629, "", "=q3=Reins of the Striped Nightsaber", "=ds=#e26#"};
				{ 16, 0, "inv_misc_tournaments_symbol_gnome", "=q6="..ALIL["Gnomeregan"].." #j30#", "=ec1=#m7#"};
				{ 17, 18772, "", "=q4=Swift Green Mechanostrider", "=ds=#e26#"};
				{ 18, 18773, "", "=q4=Swift White Mechanostrider", "=ds=#e26#"};
				{ 19, 18774, "", "=q4=Swift Yellow Mechanostrider", "=ds=#e26#"};
				{ 20, 8595, "", "=q3=Blue Mechanostrider", "=ds=#e26#"};
				{ 21, 13321, "", "=q3=Green Mechanostrider", "=ds=#e26#"};
				{ 22, 8563, "", "=q3=Red Mechanostrider", "=ds=#e26#"};
				{ 23, 13322, "", "=q3=Unpainted Mechanostrider", "=ds=#e26#"};
			};
			{
				{ 1, 0, "inv_misc_tournaments_symbol_dwarf", "=q6="..ALIL["Ironforge"].." #j30#", "=ec1=#m7#"};
				{ 2, 18786, "", "=q4=Swift Brown Ram", "=ds=#e26#"};
				{ 3, 18787, "", "=q4=Swift Gray Ram", "=ds=#e26#"};
				{ 4, 18785, "", "=q4=Swift White Ram", "=ds=#e26#"};
				{ 5, 5872, "", "=q3=Brown Ram", "=ds=#e26#"};
				{ 6, 5864, "", "=q3=Gray Ram", "=ds=#e26#"};
				{ 7, 5873, "", "=q3=White Ram", "=ds=#e26#"};
				{ 9, 0, "inv_misc_tournaments_symbol_draenei", "=q6="..ALIL["Exodar"].." #j30#", "=ec1=#m7#"};
				{ 10, 29745, "", "=q4=Great Blue Elekk", "=ds=#e26#"};
				{ 11, 29746, "", "=q4=Great Green Elekk", "=ds=#e26#"};
				{ 12, 29747, "", "=q4=Great Purple Elekk", "=ds=#e26#"};
				{ 13, 28481, "", "=q3=Brown Elekk", "=ds=#e26#"};
				{ 14, 29744, "", "=q3=Gray Elekk", "=ds=#e26#"};
				{ 15, 29743, "", "=q3=Purple Elekk", "=ds=#e26#"};
				{ 16, 0, "inv_misc_tournaments_symbol_human", "=q6="..ALIL["Stormwind"].." #j30#", "=ec1=#m7#"};
				{ 17, 18777, "", "=q4=Swift Brown Steed", "=ds=#e26#"};
				{ 18, 18776, "", "=q4=Swift Palomino", "=ds=#e26#"};
				{ 19, 18778, "", "=q4=Swift White Steed", "=ds=#e26#"};
				{ 20, 2411, "", "=q3=Black Stallion Bridle", "=ds=#e26#"};
				{ 21, 5656, "", "=q3=Brown Horse Bridle", "=ds=#e26#"};
				{ 22, 5655, "", "=q3=Chestnut Mare Bridle", "=ds=#e26#"};
				{ 23, 2414, "", "=q3=Pinto Bridle", "=ds=#e26#"};
			};
			{
				{ 1, 0, "inv_misc_tournaments_tabard_human", "=q6="..ALIL["Tushui Pandaren"].." #j30#"};
				{ 2, 87802, "", "=q4=Reins of the Great Black Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 3, 87803, "", "=q4=Reins of the Great Blue Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 4, 87804, "", "=q4=Reins of the Great Brown Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 5, 87801, "", "=q4=Reins of the Great Green Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 6, 87805, "", "=q4=Reins of the Great Purple Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 7, 82811, "", "=q4=Reins of the Great Red Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 8, 87795, "", "=q3=Reins of the Black Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 9, 87796, "", "=q3=Reins of the Blue Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 10, 87797, "", "=q3=Reins of the Brown Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 11, 82765, "", "=q3=Reins of the Green Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 12, 87799, "", "=q3=Reins of the Purple Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 13, 87800, "", "=q3=Reins of the Red Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 16, 0, "inv_misc_tabard_gilneas", "=q6="..ALIL["Gilneas"].." #j30#", "=ec1=#m7#"};
				{ 17, 73839, "", "=q4=Swift Mountain Horse", "=ds=#e26#"};
				{ 18, 73838, "", "=q3=Mountain Horse", "=ds=#e26#"};
			};
			{
				{ 1, 0, "INV_BannerPVP_02", "=q6="..AL["Flying Mounts"], "=ec1=#m7#"};
				{ 2, 25473, "", "=q4=Swift Blue Gryphon", "=ds=#e27#"};
				{ 3, 25528, "", "=q4=Swift Green Gryphon", "=ds=#e27#"};
				{ 4, 25529, "", "=q4=Swift Purple Gryphon", "=ds=#e27#"};
				{ 5, 25527, "", "=q4=Swift Red Gryphon", "=ds=#e27#"};
				{ 6, 25471, "", "=q3=Ebon Gryphon", "=ds=#e27#"};
				{ 7, 25470, "", "=q3=Golden Gryphon", "=ds=#e27#"};
				{ 8, 25472, "", "=q3=Snowy Gryphon", "=ds=#e27#"};
				{ 16, 0, "INV_BannerPVP_02", "=q6="..ALIL["Kurenai"].." #j30#", "=ec1=#m7#"};
				{ 17, 29227, "", "=q4=Reins of the Cobalt War Talbuk", "=ds=#e26#"};
				{ 18, 29229, "", "=q4=Reins of the Silver War Talbuk", "=ds=#e26#"};
				{ 19, 29230, "", "=q4=Reins of the Tan War Talbuk", "=ds=#e26#"};
				{ 20, 29231, "", "=q4=Reins of the White War Talbuk", "=ds=#e26#"};
				{ 21, 31830, "", "=q4=Reins of the Cobalt Riding Talbuk", "=ds=#e26#"};
				{ 22, 31832, "", "=q4=Reins of the Silver Riding Talbuk", "=ds=#e26#"};
				{ 23, 31834, "", "=q4=Reins of the Tan Riding Talbuk", "=ds=#e26#"};
				{ 24, 31836, "", "=q4=Reins of the White Riding Talbuk", "=ds=#e26#"};
			};
			{
				{ 1, 0, "INV_BannerPVP_02", "=q6="..ALIL["Baradin's Wardens"], "=ec1=#m7#"};
				{ 2, 64998, "", "=q4=Reins of the Spectral Steed", "=ds=#e12#"};
				{ 3, 63039, "", "=q4=Reins of the Drake of the West Wind", "=ds=#e27#"};
				{ 5, 0, "INV_BannerPVP_02", "=q6="..ALIL["Dalaran"], "=ec1=#m7#"};
				{ 6, 44225, "", "=q4=Reins of the Armored Brown Bear", "=ds=#e26#"};
				{ 7, 44230, "", "=q4=Reins of the Wooly Mammoth", "=ds=#e26#"};
				{ 8, 44235, "", "=q4=Reins of the Traveler's Tundra Mammoth", "=ds=#e26#"};
				{ 9, 44689, "", "=q4=Armored Snowy Gryphon", "=ds=#e27#"};
				{ 16, 0, "INV_BannerPVP_02", "=q6="..ALIL["Operation: Shieldwall"], "=ec1=#m7#"};
				{ 17, 93168, "", "=q4=Grand Armored Gryphon", "=ds=#e27#", "=ds=2,000 #gold#"};
				{ 19, 0, "INV_BannerPVP_02", "=q6="..ALIL["The Silver Covenant"].." #j30#", "=ec1=#m7#"};
				{ 20, 46815, "", "=q4=Quel'dorei Steed", "=ds=#e26#"};
				{ 21, 46813, "", "=q4=Silver Covenant Hippogryph", "=ds=#e27#"};
				{ 23, 0, "INV_BannerPVP_02", "=q6="..ALIL["Wintersaber Trainers"].." #j30#", "=ec1=#m7#"};
				{ 24, 13086, "", "=q4=Reins of the Winterspring Frostsaber", "=ds=#e26#"};
				{ 26, 0, "INV_BannerPVP_01", "=q6="..AL["Quest Reward"].." #j30#", "=ec1=#m7#"};
				{ 27, 93385, "", "=q4=Grand Gryphon", "=ds=#e27#, =ec1=#m7#", "=q1=#m4#: #QUESTID:32455#"};
			};
		};
		info = {
			name = AL["Alliance Mounts"],
			module = moduleName, menu = "MOUNTMENU",
		};
	}

	AtlasLoot_Data["MountsHorde"] = {
		["Normal"] = {
			{
				{ 1, 0, "inv_misc_tournaments_symbol_orc", "=q6="..ALIL["Orgrimmar"].." #j30#", "=ec1=#m6#"};
				{ 2, 18796, "", "=q4=Horn of the Swift Brown Wolf", "=ds=#e26#"};
				{ 3, 18798, "", "=q4=Horn of the Swift Gray Wolf", "=ds=#e26#"};
				{ 4, 18797, "", "=q4=Horn of the Swift Timber Wolf", "=ds=#e26#"};
				{ 5, 46099, "", "=q3=Horn of the Black Wolf", "=ds=#e26#"};
				{ 6, 5668, "", "=q3=Horn of the Brown Wolf", "=ds=#e26#"};
				{ 7, 5665, "", "=q3=Horn of the Dire Wolf", "=ds=#e26#"};
				{ 8, 1132, "", "=q3=Horn of the Timber Wolf", "=ds=#e26#"};
				{ 16, 0, "inv_misc_tournaments_symbol_bloodelf", "=q6="..ALIL["Silvermoon City"].." #j30#", "=ec1=#m6#"};
				{ 17, 29223, "", "=q4=Swift Green Hawkstrider", "=ds=#e26#"};
				{ 18, 28936, "", "=q4=Swift Pink Hawkstrider", "=ds=#e26#"};
				{ 19, 29224, "", "=q4=Swift Purple Hawkstrider", "=ds=#e26#"};
				{ 20, 29221, "", "=q3=Black Hawkstrider", "=ds=#e26#"};
				{ 21, 29220, "", "=q3=Blue Hawkstrider", "=ds=#e26#"};
				{ 22, 29222, "", "=q3=Purple Hawkstrider", "=ds=#e26#"};
				{ 23, 28927, "", "=q3=Red Hawkstrider", "=ds=#e26#"};
			};
			{
				{ 1, 0, "inv_misc_tournaments_symbol_troll", "=q6="..ALIL["Darkspear Trolls"].." #j30#", "=ec1=#m6#"};
				{ 2, 18788, "", "=q4=Swift Blue Raptor", "=ds=#e26#"};
				{ 3, 18789, "", "=q4=Swift Olive Raptor", "=ds=#e26#"};
				{ 4, 18790, "", "=q4=Swift Orange Raptor", "=ds=#e26#"};
				{ 5, 8588, "", "=q3=Whistle of the Emerald Raptor", "=ds=#e26#"};
				{ 6, 8591, "", "=q3=Whistle of the Turquoise Raptor", "=ds=#e26#"};
				{ 7, 8592, "", "=q3=Whistle of the Violet Raptor", "=ds=#e26#"};
				{ 9, 0, "inv_misc_tournaments_symbol_tauren", "=q6="..ALIL["Thunder Bluff"].." #j30#", "=ec1=#m6#"};
				{ 10, 18794, "", "=q4=Great Brown Kodo", "=ds=#e26#"};
				{ 11, 18795, "", "=q4=Great Gray Kodo", "=ds=#e26#"};
				{ 12, 18793, "", "=q4=Great White Kodo", "=ds=#e26#"};
				{ 13, 15290, "", "=q3=Brown Kodo", "=ds=#e26#"};
				{ 14, 15277, "", "=q3=Gray Kodo", "=ds=#e26#"};
				{ 15, 46100, "", "=q3=White Kodo", "=ds=#e26#"};
				{ 16, 0, "inv_misc_tournaments_symbol_scourge", "=q6="..ALIL["Undercity"].." #j30#", "=ec1=#m6#"};
				{ 17, 13334, "", "=q4=Green Skeletal Warhorse", "=ds=#e26#"};
				{ 18, 47101, "", "=q4=Ochre Skeletal Warhorse", "=ds=#e26#"};
				{ 19, 18791, "", "=q4=Purple Skeletal Warhorse", "=ds=#e26#"};
				{ 20, 46308, "", "=q3=Black Skeletal Horse", "=ds=#e26#"};
				{ 21, 13332, "", "=q3=Blue Skeletal Horse", "=ds=#e26#"};
				{ 22, 13333, "", "=q3=Brown Skeletal Horse", "=ds=#e26#"};
				{ 23, 13331, "", "=q3=Red Skeletal Horse", "=ds=#e26#"};
			};
			{
				{ 1, 0, "inv_misc_tournaments_tabard_orc", "=q6="..ALIL["Huojin Pandaren"].." #j30#"};
				{ 2, 87802, "", "=q4=Reins of the Great Black Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 3, 87803, "", "=q4=Reins of the Great Blue Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 4, 87804, "", "=q4=Reins of the Great Brown Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 5, 87801, "", "=q4=Reins of the Great Green Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 6, 87805, "", "=q4=Reins of the Great Purple Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 7, 82811, "", "=q4=Reins of the Great Red Dragon Turtle", "=ds=#e26#", "=ds=10 #gold#"};
				{ 8, 87795, "", "=q3=Reins of the Black Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 9, 87796, "", "=q3=Reins of the Blue Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 10, 87797, "", "=q3=Reins of the Brown Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 11, 82765, "", "=q3=Reins of the Green Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 12, 87799, "", "=q3=Reins of the Purple Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 13, 87800, "", "=q3=Reins of the Red Dragon Turtle", "=ds=#e26#", "=ds=1 #gold#"};
				{ 16, 0, "inv_misc_tournaments_symbol_orc", "=q6="..ALIL["Bilgewater Cartel"].." #j30#", "=ec1=#m6#"};
				{ 17, 62462, "", "=q4=Goblin Turbo-Trike Key", "=ds=#e26#"};
				{ 18, 62461, "", "=q3=Goblin Trike Key", "=ds=#e26#"};
			};
			{
				{ 1, 0, "INV_BannerPVP_01", "=q6="..AL["Flying Mounts"], "=ec1=#m6#"};
				{ 2, 25531, "", "=q4=Swift Green Wind Rider", "=ds=#e27#"};
				{ 3, 25533, "", "=q4=Swift Purple Wind Rider", "=ds=#e27#"};
				{ 4, 25477, "", "=q4=Swift Red Wind Rider", "=ds=#e27#"};
				{ 5, 25532, "", "=q4=Swift Yellow Wind Rider", "=ds=#e27#"};
				{ 6, 25475, "", "=q3=Blue Wind Rider", "=ds=#e27#"};
				{ 7, 25476, "", "=q3=Green Wind Rider", "=ds=#e27#"};
				{ 8, 25474, "", "=q3=Tawny Wind Rider", "=ds=#e27#"};
				{ 16, 0, "INV_BannerPVP_01", "=q6="..ALIL["The Mag'har"].." #j30#", "=ec1=#m6#"};
				{ 17, 29102, "", "=q4=Reins of the Cobalt War Talbuk", "=ds=#e26#"};
				{ 18, 29104, "", "=q4=Reins of the Silver War Talbuk", "=ds=#e26#"};
				{ 19, 29105, "", "=q4=Reins of the Tan War Talbuk", "=ds=#e26#"};
				{ 20, 29103, "", "=q4=Reins of the White War Talbuk", "=ds=#e26#"};
				{ 21, 31829, "", "=q4=Reins of the Cobalt Riding Talbuk", "=ds=#e26#"};
				{ 22, 31831, "", "=q4=Reins of the Silver Riding Talbuk", "=ds=#e26#"};
				{ 23, 31833, "", "=q4=Reins of the Tan Riding Talbuk", "=ds=#e26#"};
				{ 24, 31835, "", "=q4=Reins of the White Riding Talbuk", "=ds=#e26#"};
			};
			{
				{ 1, 0, "INV_BannerPVP_01", "=q6="..ALIL["Hellscream's Reach"], "=ec1=#m6#"};
				{ 2, 64999, "", "=q4=Reins of the Spectral Wolf", "=ds=#e12#"};
				{ 3, 65356, "", "=q4=Reins of the Drake of the West Wind", "=ds=#e27#"};
				{ 5, 0, "INV_BannerPVP_01", "=q6="..ALIL["Dalaran"], "=ec1=#m6#"};
				{ 6, 44226, "", "=q4=Reins of the Armored Brown Bear", "=ds=#e26#"};
				{ 7, 44231, "", "=q4=Reins of the Wooly Mammoth", "=ds=#e26#"};
				{ 8, 44234, "", "=q4=Reins of the Traveler's Tundra Mammoth", "=ds=#e26#"};
				{ 9, 44690, "", "=q4=Armored Blue Wind Rider", "=ds=#e27#"};
				{ 16, 0, "INV_BannerPVP_02", "=q6="..ALIL["Dominance Offensive"], "=ec1=#m7#"};
				{ 17, 93169, "", "=q4=Grand Armored Wyvern", "=ds=#e27#", "=ds=2,000 #gold#"};
				{ 19, 0, "INV_BannerPVP_01", "=q6="..ALIL["The Sunreavers"].." #j30#", "=ec1=#m6#"};
				{ 20, 46816, "", "=q4=Sunreaver Hawkstrider", "=ds=#e26#"};
				{ 21, 46814, "", "=q4=Sunreaver Dragonhawk", "=ds=#e27#"};
				{ 23, 0, "INV_BannerPVP_01", "=q6="..AL["Quest Reward"].." #j30#", "=ec1=#m6#"};
				{ 24, 93386, "", "=q4=Grand Wyvern", "=ds=#e27#", "=q1=#m4#: #QUESTID:32399#"};
				{ 25, 46102, "", "=q4=Whistle of the Venomhide Ravasaur", "=ds=#e26#"};
			};
		};
		info = {
			name = AL["Horde Mounts"],
			module = moduleName, menu = "MOUNTMENU",
		};
	}

	AtlasLoot_Data["MountsFaction"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..ALIL["Order of the Cloud Serpent"].." #j30#"};
				{ 2, 85430, "", "=q4=Reins of the Azure Cloud Serpent", "=ds=#e27#", "=ds=3,000 #gold#"};
				{ 3, 85429, "", "=q4=Reins of the Golden Cloud Serpent", "=ds=#e27#", "=ds=3,000 #gold#"};
				{ 4, 79802, "", "=q4=Reins of the Jade Cloud Serpent", "=ds=#e27#", "=ds=3,000 #gold#"};
				{ 6, 0, "INV_Box_01", "=q6="..ALIL["The August Celestials"].." #j30#"};
				{ 7, 89304, "", "=q4=Reins of the Thundering August Cloud Serpent", "=ds=#e27#", "=ds=10,000 #gold#"};
				{ 9, 0, "INV_Box_01", "=q6="..ALIL["The Lorewalkers"].." #j30#"};
				{ 10, 89363, "", "=q3=Disc of the Red Flying Cloud", "=ds=#e27#", "=ds=600 #gold#"};
				{ 12, 0, "INV_Box_01", "=q6="..ALIL["Golden Lotus"].." #j30#"};
				{ 13, 87781, "", "=q4=Reins of the Azure Riding Crane", "=ds=#e26#", "=ds=500 #gold#"};
				{ 14, 87782, "", "=q4=Reins of the Golden Riding Crane", "=ds=#e26#", "=ds=2,500 #gold#"};
				{ 15, 87783, "", "=q4=Reins of the Regal Riding Crane", "=ds=#e26#", "=ds=1,500 #gold#"};
				{ 16, 0, "INV_Box_01", "=q6="..ALIL["The Klaxxi"].." #j30#"};
				{ 17, 85262, "", "=q4=Reins of the Amber Scorpion", "=ds=#e26#", "=ds=10,000 #gold#"};
				{ 19, 0, "INV_Box_01", "=q6="..ALIL["The Anglers"].." #j30#"};
				{ 20, 81354, "", "=q4=Reins of the Azure Water Strider", "=ds=#e26#", "=ds=5,000 #gold#"};
				{ 22, 0, "INV_Box_01", "=q6="..ALIL["Shado-Pan"].." #j30#"};
				{ 23, 89307, "", "=q4=Reins of the Blue Shado-Pan Riding Tiger", "=ds=#e26#", "=ds=500 #gold#"};
				{ 24, 89305, "", "=q4=Reins of the Green Shado-Pan Riding Tiger", "=ds=#e26#", "=ds=1,500 #gold#"};
				{ 25, 89306, "", "=q4=Reins of the Red Shado-Pan Riding Tiger", "=ds=#e26#", "=ds=2,500 #gold#"};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..ALIL["The Tillers"].." #j30#"};
				{ 2, 89391, "", "=q4=Reins of the Black Riding Goat", "=ds=#e26#", "=ds=1,416 #gold# 66 #silver# 66 #copper#"};
				{ 3, 89362, "", "=q4=Reins of the Brown Riding Goat", "=ds=#e26#", "=ds=472 #gold# 22 #silver# 22 #copper#"};
				{ 4, 89390, "", "=q4=Reins of the White Riding Goat", "=ds=#e26#", "=ds=3069 #gold# 44 #silver# 44 #copper#"};
				{ 6, 0, "INV_Box_01", "=q6="..AL["Vendor"]};
				{ 7, 84101, "", "=q4=Reins of the Grand Expedition Yak", "=q2="..AL["Uncle Bigpocket"]..", =q1="..ALIL["Kun-Lai Summit"], "=ds=120,000 #gold#"};
				{ 8, 87789, "", "=q4=Reins of the Blonde Riding Yak", "=q2="..AL["Uncle Bigpocket"]..", =q1="..ALIL["Kun-Lai Summit"], "=ds=3,000 #gold#"};
				{ 9, 87788, "", "=q4=Reins of the Grey Riding Yak", "=q2="..AL["Uncle Bigpocket"]..", =q1="..ALIL["Kun-Lai Summit"], "=ds=3,000 #gold#"};
				{ 11, 0, "INV_Box_01", "=q6="..ALIL["Ramkahen"].." #j30#", "=q1="..ALIL["Uldum"]};
				{ 12, 63044, "", "=q4=Reins of the Brown Riding Camel", "=ds=#e26#", "=ds=100 #gold#"};
				{ 13, 63045, "", "=q4=Reins of the Tan Riding Camel", "=ds=#e26#", "=ds=100 #gold#"};
				{ 16, 0, "INV_Box_01", "=q6="..ALIL["The Sons of Hodir"].." #j30#", "=q1="..ALIL["The Storm Peaks"]};
				{
					{ 17, 44080, "", "=q4=Reins of the Ice Mammoth", "=ds=#e26#", "=ds=1,000 #gold#"};
					{ 17, 43958, "", "=q4=Reins of the Ice Mammoth", "=ds=#e26#", "=ds=1,000 #gold#"};
				};
				{
					{ 18, 44086, "", "=q4=Reins of the Grand Ice Mammoth", "=ds=#e26#", "=ds=10,00 #gold#"};
					{ 18, 43961, "", "=q4=Reins of the Grand Ice Mammoth", "=ds=#e26#", "=ds=10,00 #gold#"};
				};
				{ 20, 0, "INV_Box_01", "=q6="..ALIL["The Wyrmrest Accord"].." #j30#", "=q1="..ALIL["Dragonblight"]};
				{ 21, 43955, "", "=q4=Reins of the Red Drake", "=ds=#e27#", "=ds=2,000 #gold#"};
				{ 23, 0, "INV_Box_01", "=q6="..ALIL["The Oracles"].." #j30#", "=q1="..ALIL["Sholazar Basin"]};
				{ 24, 44707, "", "=q4=Reins of the Green Proto-Drake", "=ds=#e27#", "=q2="..ALIL["Mysterious Egg"], ""};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..ALIL["Netherwing"].." #j30#", "=q1="..ALIL["Shadowmoon Valley"]};
				{ 2, 32858, "", "=q4=Reins of the Azure Netherwing Drake", "=ds=#e27#", "=ds=200 #gold#"};
				{ 3, 32859, "", "=q4=Reins of the Cobalt Netherwing Drake", "=ds=#e27#", "=ds=200 #gold#"};
				{ 4, 32857, "", "=q4=Reins of the Onyx Netherwing Drake", "=ds=#e27#", "=ds=200 #gold#"};
				{ 5, 32860, "", "=q4=Reins of the Purple Netherwing Drake", "=ds=#e27#", "=ds=200 #gold#"};
				{ 6, 32861, "", "=q4=Reins of the Veridian Netherwing Drake", "=ds=#e27#", "=ds=200 #gold#"};
				{ 7, 32862, "", "=q4=Reins of the Violet Netherwing Drake", "=ds=#e27#", "=ds=200 #gold#"};
				{ 9, 0, "INV_Box_01", "=q6="..ALIL["Cenarion Expedition"].." #j30#", "=q1="..ALIL["Zangarmarsh"]};
				{ 10, 33999, "", "=q4=Cenarion War Hippogryph", "=ds=#e27#", "=ds=2,000 #gold#"};
				{ 16, 0, "INV_Box_01", "=q6="..ALIL["Sha'tari Skyguard"].." #j30#", "=q1="..ALIL["Terokkar Forest"]};
				{ 17, 32319, "", "=q4=Blue Riding Nether Ray", "=ds=#e27#", "=ds=200 #gold#"};
				{ 18, 32314, "", "=q4=Green Riding Nether Ray", "=ds=#e27#", "=ds=200 #gold#"};
				{ 19, 32317, "", "=q4=Red Riding Nether Ray", "=ds=#e27#", "=ds=200 #gold#"};
				{ 20, 32316, "", "=q4=Purple Riding Nether Ray", "=ds=#e27#", "=ds=200 #gold#"};
				{ 21, 32318, "", "=q4=Silver Riding Nether Ray", "=ds=#e27#", "=ds=200 #gold#"};
			};
		};
		info = {
			name = AL["Neutral Faction Mounts"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsPvP"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Alliance PvP Mounts"], ""};
				{ 2, 29465, "", "=q4=Black Battlestrider", "=ds=#e26# =ec1=#m7#"};
				{ 3, 29467, "", "=q4=Black War Ram", "=ds=#e26# =ec1=#m7#"};
				{ 4, 29468, "", "=q4=Black War Steed Bridle", "=ds=#e26# =ec1=#m7#"};
				{ 5, 35906, "", "=q4=Reins of the Black War Elekk", "=ds=#e26# =ec1=#m7#"};
				{ 6, 29471, "", "=q4=Reins of the Black War Tiger", "=ds=#e26# =ec1=#m7#"};
				{ 7, 19030, "", "=q4=Stormpike Battle Charger", "=ds=#e26# =ec1=#m7#"};
				{ 8, 43956, "", "=q4=Reins of the Black War Mammoth", "=ds=#e26# =ec1=#m7#"};
				{ 12, 0, "INV_Box_01", "=q6="..AL["Halaa PvP Mounts"], "=q1="..ALIL["Nagrand"]};
				{ 13, 28915, "", "=q4=Reins of the Dark Riding Talbuk", "=ds=#e26#"};
				{ 14, 29228, "", "=q4=Reins of the Dark War Talbuk", "=ds=#e26#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Horde PvP Mounts"], ""};
				{ 17, 29466, "", "=q4=Black War Kodo", "=ds=#e26# =ec1=#m6#"};
				{ 18, 29469, "", "=q4=Horn of the Black War Wolf", "=ds=#e26# =ec1=#m6#"};
				{ 19, 29470, "", "=q4=Red Skeletal Warhorse", "=ds=#e26# =ec1=#m6#"};
				{ 20, 34129, "", "=q4=Swift Warstrider", "=ds=#e26# =ec1=#m6#"};
				{ 21, 29472, "", "=q4=Whistle of the Black War Raptor", "=ds=#e26# =ec1=#m6#"};
				{ 22, 19029, "", "=q4=Horn of the Frostwolf Howler", "=ds=#e26# =ec1=#m6#"};
				{ 23, 44077, "", "=q4=Reins of the Black War Mammoth", "=ds=#e26# =ec1=#m6#"};
			};
		};
		info = {
			name = AL["PvP Mounts"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsRareDungeon"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Dungeon"], ""};
				{ 2, 69747, "", "=q4=Amani Battle Bear", "=q2="..AL["Timed Reward Chest"]..", =q1="..ALIL["Zul'Aman"]};
				{ 3, 68823, "", "=q4=Armored Razzashi Raptor", "=q2="..AtlasLoot:EJ_GetBossName("Bloodlord Mandokir", 176)..", =q1="..ALIL["Zul'Gurub"]};
				{ 4, 13335, "", "=q4=Deathcharger's Reins", "#ACHIEVEMENTID:729#", "", "0.10%"};
				{ 5, 44151, "", "=q4=Reins of the Blue Proto-Drake", "=q2="..AtlasLoot:EJ_GetBossName("Skadi the Ruthless", 643)..", =q1="..AL["Heroic"].." "..ALIL["Utgarde Pinnacle"], ""};
				{ 6, 43951, "", "=q4=Reins of the Bronze Drake", "#ACHIEVEMENTID:1817#"};
				{ 7, 63040, "", "=q4=Reins of the Drake of the North Wind", "=q2="..AtlasLoot:EJ_GetBossName("Altairus", 115)..", =q1="..ALIL["The Vortex Pinnacle"]};
				{ 8, 32768, "", "=q4=Reins of the Raven Lord", "#ACHIEVEMENTID:883#"};
				{ 9, 63043, "", "=q4=Reins of the Vitreous Stone Drake", "=q2="..AtlasLoot:EJ_GetBossName("Slabhide", 111)..", =q1="..ALIL["The Stonecore"]};
				{ 10, 35513, "", "=q4=Swift White Hawkstrider", "#ACHIEVEMENTID:884#"};
				{ 11, 68824, "", "=q4=Swift Zulian Panther", "=q2="..AtlasLoot:EJ_GetBossName("High Priestess Kilnara", 181)..", =q1="..ALIL["Zul'Gurub"]};
				{ 13, 0, "INV_Box_01", "=q6="..AL["Outdoor"], ""};
				{ 14, 67151, "", "=q4=Reins of Poseidus", "=q2="..BabbleRare["Poseidus"]..", =q1="..ALIL["Vashj'ir"]};
				{ 15, 94230, "", "=q4=Reins of the Amber Primordial Direhorn", "=q2="..BabbleRare["Zandalari Warbringer"]..", =q1="..ALIL["Pandaria"]};
				{ 16, 94292, "", "=q4=Reins of the Black Primal Raptor", "=q1="..ALIL["Isle of Giants"]};
				{ 17, 94228, "", "=q4=Reins of the Cobalt Primordial Direhorn", "=q2="..AtlasLoot:EJ_GetBossName("Oondasta", 826)..", =q1="..ALIL["Isle of Giants"], ""},
				{ 18, 94293, "", "=q4=Reins of the Green Primal Raptor", "=q1="..ALIL["Isle of Giants"]};
				{ 19, 63046, "", "=q4=Reins of the Grey Riding Camel", "#ACHIEVEMENTID:5767#", ""};
				{ 20, 87771, "", "=q4=Reins of the Heavenly Onyx Cloud Serpent", "=q2="..AtlasLoot:EJ_GetBossName("Sha of Anger", 691)..", =q1="..ALIL["Kun-Lai Summit"], ""};
				{ 21, 94231, "", "=q4=Reins of the Jade Primordial Direhorn", "=q2="..BabbleRare["Zandalari Warbringer"]..", =q1="..ALIL["Pandaria"]};
				{ 22, 63042, "", "=q4=Reins of the Phosphorescent Stone Drake", "=q2="..BabbleRare["Aeonaxx"]..", =q1="..ALIL["Deepholm"]};
				{ 23, 94291, "", "=q4=Reins of the Red Primal Raptor", "=q1="..ALIL["Isle of Giants"]};
				{ 24, 94229, "", "=q4=Reins of the Slate Primordial Direhorn", "=q2="..BabbleRare["Zandalari Warbringer"]..", =q1="..ALIL["Pandaria"]};
				{ 25, 95057, "", "=q4=Reins of the Thundering Cobalt Cloud Serpent", "=q2="..AtlasLoot:EJ_GetBossName("Nalak, The Storm Lord", 814)..", =q1="..ALIL["Isle of Thunder"], ""},
				{ 26, 90655, "", "=q4=Reins of the Thundering Ruby Cloud Serpent", "=ds=#e27#", "=q2="..BabbleRare["Alani"]..", =q1="..ALIL["Vale of Eternal Blossoms"]};
				{ 27, 44168, "", "=q4=Reins of the Time-Lost Proto-Drake", "=q2="..BabbleRare["Time-Lost Proto Drake"]..", =q1="..ALIL["The Storm Peaks"]};
				{ 28, 89783, "", "=q4=Son of Galleon's Saddle", "=q2="..AtlasLoot:EJ_GetBossName("Salyis's Warband", 725)..", =q1="..ALIL["Valley of the Four Winds"], ""};
				{ 29, 46109, "", "=q3=Sea Turtle", "#ACHIEVEMENTID:3218#", ""};
			};
		};
		info = {
			name = AL["Rare Mounts"]..": "..AL["Dungeon"].." / "..AL["Outdoor"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsRareRaid"] = {
		["Normal"] = {
			{
				{ 1, 32458, "", "=q4=Ashes of Al'ar", "#ACHIEVEMENTID:885#"};
				{ 2, 95059, "", "=q4=Clutch of Ji-Kun", "=q2="..AtlasLoot:EJ_GetBossName("Ji-Kun", 828)..", =q1="..ALIL["Throne of Thunder"]};
				{ 3, 78919, "", "=q4=Experiment 12-B", "=q2="..AtlasLoot:EJ_GetBossName("Ultraxion", 331)..", =q1="..ALIL["Dragon Soul"]},
				{ 4, 30480, "", "=q4=Fiery Warhorse's Reins", "#ACHIEVEMENTID:882#", "", "0.25%"};
				{ 5, 71665, "", "=q4=Flametalon of Alysrazor", "=q2="..AtlasLoot:EJ_GetBossName("Alysrazor", 194)..", =q1="..ALIL["Firelands"]},
				{ 6, 50818, "", "=q4=Invincible's Reins", "#ACHIEVEMENTID:4584#"};
				{ 7, 77069, "", "=q4=Life-Binder's Handmaiden", "=q2="..AtlasLoot:EJ_GetBossName("Madness of Deathwing", 333)..", =q1="..ALIL["Dragon Soul"]},
				{ 8, 45693, "", "=q4=Mimiron's Head", "#ACHIEVEMENTID:4626#, =q1="..ALIL["Ulduar"], "", ""};
				{ 9, 87777, "", "=q4=Reins of the Astral Cloud Serpent", "=ds=#e27#", "=q2="..AtlasLoot:EJ_GetBossName("Elegon", 726)..", =q1="..ALIL["Mogu'shan Vaults"], ""};
				{ 10, 43986, "", "=q4=Reins of the Black Drake", "#ACHIEVEMENTID:2051#, =q1="..ALIL["The Obsidian Sanctum"], "100%"};
				{ 11, 77067, "", "=q4=Reins of the Blazing Drake", "=q2="..AtlasLoot:EJ_GetBossName("Madness of Deathwing", 333)..", =q1="..ALIL["Dragon Soul"]},
				{ 12, 43954, "", "=q4=Reins of the Twilight Drake", "#ACHIEVEMENTID:2054#, =q1="..ALIL["The Obsidian Sanctum"], "100%"};
				{ 13, 43953, "", "=q4=Reins of the Blue Drake", "=q2="..BabbleBoss["Malygos"]..", =q1="..ALIL["The Eye of Eternity"], ""};
				{ 14, 43952, "", "=q4=Reins of the Azure Drake", "=q2="..BabbleBoss["Malygos"]..", =q1="..ALIL["The Eye of Eternity"], ""};
				{ 15, 63041, "", "=q4=Reins of the Drake of the South Wind", "=q2="..AtlasLoot:EJ_GetBossName("Al'Akir", 155)..", =q1="..ALIL["Throne of the Four Winds"]};
				{
					{ 16, 44083, "", "=q4=Reins of the Grand Black War Mammoth", "=q1="..ALIL["Vault of Archavon"]..", =ec1=#m6#", "", ""};
					{ 16, 43959, "", "=q4=Reins of the Grand Black War Mammoth", "=q1="..ALIL["Vault of Archavon"]..", =ec1=#m7#", "", ""};
				};
				{ 17, 49636, "", "=q4=Reins of the Onyxian Drake", "=q2="..BabbleBoss["Onyxia"]..", =q1="..ALIL["Onyxia's Lair"], ""};
				{ 18, 69224, "", "=q4=Smoldering Egg of Millagazor", "=q2="..BabbleBoss["Ragnaros"]..", =q1="..ALIL["Firelands"]},
				{ 19, 93666, "", "=q4=Spawn of Horridon", "=q2="..AtlasLoot:EJ_GetBossName("Horridon", 819)..", =q1="..ALIL["Throne of Thunder"]};
				{ 21, 21218, "", "=q3=Blue Qiraji Resonating Crystal", "=q2="..AL["Trash Mobs"]..", =q1="..ALIL["Temple of Ahn'Qiraj"], "", "10.91%"};
				{ 22, 21323, "", "=q3=Green Qiraji Resonating Crystal", "=q2="..AL["Trash Mobs"]..", =q1="..ALIL["Temple of Ahn'Qiraj"], "", "11.77%"};
				{ 23, 21321, "", "=q3=Red Qiraji Resonating Crystal", "=q2="..AL["Trash Mobs"]..", =q1="..ALIL["Temple of Ahn'Qiraj"], "", "1.32%"};
				{ 24, 21324, "", "=q3=Yellow Qiraji Resonating Crystal", "=q2="..AL["Trash Mobs"]..", =q1="..ALIL["Temple of Ahn'Qiraj"], "", "12.64%"};
			};
		};
		info = {
			name = AL["Rare Mounts"]..": "..AL["Raid"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsAchievement"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Dungeon"], ""};
				{ 2, 90710, "", "=q4=Reins of the Ashen Pandaren Phoenix", "#ACHIEVEMENTID:6375#"};
				{ 3, 87769, "", "=q4=Reins of the Crimson Cloud Serpent", "#ACHIEVEMENTID:6927#"};
				{ 4, 89154, "", "=q4=Reins of the Crimson Pandaren Phoenix", "#ACHIEVEMENTID:6375#"};
				{ 5, 90711, "", "=q4=Reins of the Emerald Pandaren Phoenix", "#ACHIEVEMENTID:6375#"};
				{ 6, 44160, "", "=q4=Reins of the Red Proto-Drake", "#ACHIEVEMENTID:2136#"};
				{ 7, 90712, "", "=q4=Reins of the Violet Pandaren Phoenix", "#ACHIEVEMENTID:6375#"};
				{ 8, 62900, "", "=q4=Reins of the Volcanic Stone Drake", "#ACHIEVEMENTID:4845#"};
				{ 10, 0, "INV_Box_01", "=q6="..AL["PvP"], ""};
				{ 11, 44223, "", "=q4=Reins of the Black War Bear", "#ACHIEVEMENTID:614#, =ec1=#m7#"};
				{ 12, 44224, "", "=q4=Reins of the Black War Bear", "#ACHIEVEMENTID:619#, =ec1=#m6#"};
				{ 13, 70909, "", "=q4=Dreadful War Steed", "#ACHIEVEMENTID:5823#, =ec1=#m7#"};
				{ 14, 70910, "", "=q4=Dreadful War Wolf", "#ACHIEVEMENTID:5824#, =ec1=#m6#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Raid"], ""};
				{ 17, 69230, "", "=q4=Corrupted Egg of Millagazor", "#ACHIEVEMENTID:5828#" };
				{ 18, 93662, "", "=q4=Reins of the Armored Skyscreamer", "#ACHIEVEMENTID:8124#"};
				{ 19, 51954, "", "=q4=Reins of the Bloodbathed Frostbrood Vanquisher", "#ACHIEVEMENTID:4602#"};
				{ 20, 63125, "", "=q4=Reins of the Dark Phoenix", "#ACHIEVEMENTID:4988#"};
				{ 21, 62901, "", "=q4=Reins of the Drake of the East Wind", "#ACHIEVEMENTID:4853#"};
				{ 22, 87773, "", "=q4=Reins of the Heavenly Crimson Cloud Serpent", "#ACHIEVEMENTID:6932#"};
				{ 23, 51955, "", "=q4=Reins of the Icebound Frostbrood Vanquisher", "#ACHIEVEMENTID:4603#"};
				{ 24, 45801, "", "=q4=Reins of the Ironbound Proto-Drake", "#ACHIEVEMENTID:2958#"};
				{ 25, 45802, "", "=q4=Reins of the Rusted Proto-Drake", "#ACHIEVEMENTID:2957#"};
				{ 26, 85666, "", "=q4=Reins of the Thundering Jade Cloud Serpent", "#ACHIEVEMENTID:6682#"};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Mount Collecting"], ""};
				{ 2, 44178, "", "=q4=Reins of the Albino Drake", "#ACHIEVEMENTID:2143#"};
				{ 3, 44843, "", "=q4=Blue Dragonhawk", "#ACHIEVEMENTID:2536#, =ec1=#m7#"};
				{ 4, 44842, "", "=q4=Red Dragonhawk", "#ACHIEVEMENTID:2537#, =ec1=#m6#"};
				{
					{ 5, 91802, "", "=q4=Jade Pandaren Kite String", "#ACHIEVEMENTID:7862#, =ec1=#m6#"};
					{ 5, 91802, "", "=q4=Jade Pandaren Kite String", "#ACHIEVEMENTID:7860#, =ec1=#m7#"};
				};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Misc"], ""};
				{ 17, 69213, "", "=q4=Flameward Hippogryph", "#ACHIEVEMENTID:5866#"};
				{ 18, 89785, "", "=q4=Pandaren Kite String", "#ACHIEVEMENTID:6828#"};
				{ 19, 62298, "", "=q4=Reins of the Golden King", "#ACHIEVEMENTID:4912#, =ec1=#m7#"};
				{ 20, 67107, "", "=q4=Reins of the Kor'kron Annihilator", "#ACHIEVEMENTID:5492#, =ec1=#m6#"};
				{ 21, 44177, "", "=q4=Reins of the Violet Proto-Drake", "#ACHIEVEMENTID:2144#"};
			};
		};
		info = {
			name = AL["Achievement Reward"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsCraftQuest"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Crafted Mounts"], ""};
				{ 2, 60954, "", "=q4=Fossilized Raptor", "=ds=#e26# =q2=#p25#"};
				{ 3, 82453, "", "=q4=Jeweled Onyx Panther", "=ds=#e27# =q2=#p12#"};
				{ 4, 44413, "", "=q4=Mekgineer's Chopper", "=ds=#e26# =q2=#p5# =ec1=#m7#"};
				{ 5, 41508, "", "=q4=Mechano-Hog", "=ds=#e26# =q2=#p5# =ec1=#m6#"};
				{ 6, 64883, "", "=q4=Scepter of Azj'Aqir", "=ds=#e26# =q2=#p25#"};
				{ 7, 54797, "", "=q4=Frosty Flying Carpet", "=ds=#e27# =q2=#p8#"};
				{ 8, 44558, "", "=q4=Magnificent Flying Carpet", "=ds=#e27# =q2=#p8#"};
				{ 9, 34061, "", "=q4=Turbo-Charged Flying Machine", "=ds=#e27# =q2=#p5#"};
				{ 10, 65891, "", "=q4=Vial of the Sands", "=ds=#e27# =q2=#p1#"};
				{ 11, 83088, "", "=q3=Jade Panther", "=ds=#e27# =q2=#p12#"};
				{ 12, 83087, "", "=q3=Ruby Panther", "=ds=#e27# =q2=#p12#"};
				{ 13, 83090, "", "=q3=Sapphire Panther", "=ds=#e27# =q2=#p12#"};
				{ 14, 83089, "", "=q3=Sunstone Panther", "=ds=#e27# =q2=#p12#"};
				{ 17, 87250, "", "=q3=Depleted-Kyparium Rocket", "=ds=#e27# =q2=#p5#"};
				{ 18, 87251, "", "=q3=Geosynchronous World Spinner", "=ds=#e27# =q2=#p5#"};
				{ 19, 44554, "", "=q3=Flying Carpet", "=ds=#e27# =q2=#p8#"};
				{ 20, 34060, "", "=q3=Flying Machine", "=ds=#e27# =q2=#p5#"};
				{ 22, 0, "INV_Box_01", "=q6="..AL["Quest Reward"], ""};
				{ 23, 93385, "", "=q4=Grand Gryphon", "=ds=#e27#, =ec1=#m7#", "=q1=#m4#: #QUESTID:32455#"};
				{ 24, 93386, "", "=q4=Grand Wyvern", "=ds=#e27#, =ec1=#m6#", "=q1=#m4#: #QUESTID:32399#"};
				{ 25, 94290, "", "=q4=Reins of the Bone-White Primal Raptor", "=q1=#m4#: #QUESTID:32617#"};
				{ 26, 52200, "", "=q4=Reins of the Crimson Deathcharger", "=q1=#m4#: #QUESTID:24915#"};
				{ 27, 87768, "", "=q4=Reins of the Onyx Cloud Serpent", "=q1=#m4#: #QUESTID:31277#"};
				{ 28, 43962, "", "=q4=Reins of the White Polar Bear", "=q1=#m4#: "..ALIL["Hyldnir Spoils"], ""};
				{ 29, 54465, "", "=q3=Subdued Abyssal Seahorse", "=q1=#m4#: #QUESTID:25371#"};
			};
		};
		info = {
			name = AL["Quest Reward"].." / "..AL["Crafted Mounts"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsCardGame"] = {
		["Normal"] = {
			{
				{ 1, 68825, "", "=q4=Amani Dragonhawk", "=ds=#e27#", "=q1="..AL["Twilight of the Dragons"]},
				{ 2, 49282, "", "=q4=Big Battle Bear", "=ds=#e26#", "=q1="..AL["Drums of War"]};
				{ 3, 54069, "", "=q4=Blazing Hippogryph", "=ds=#e27#", "=q1="..AL["Wrathgate"]};
				{ 4, 72582, "", "=q4=Corrupted Hippogryph", "=ds=#e12#", "=q1="..AL["Crown of Heaven"]},
				{ 5, 79771, "", "=q4=Feldrake", "=ds=#e26#", "=q1="..AL["War of the Ancients"]},
				{ 6, 93671, "", "=q4=Ghastly Charger's Skull", "=ds=#12#", "=q1="..AL["Betrayal of the Guardian"]},
				{ 7, 49290, "", "=q4=Magic Rooster Egg", "=ds=#e26#", "=q1="..AL["Fields of Honor"]};
				{ 8, 68008, "", "=q4=Mottled Drake", "=ds=#e27#", "=q1="..AL["Worldbreaker"]};
				{ 9, 49284, "", "=q4=Reins of the Swift Spectral Tiger", "=ds=#e26#", "=q1="..AL["Fires of Outland"]};
				{ 16, 23720, "", "=q4=Riding Turtle", "=ds=#e26#", "=q1="..AL["Heroes of Azeroth"]};
				{ 17, 69228, "", "=q4=Savage Raptor", "=ds=#e26#", "=q1="..AL["War of the Elements"]},
				{ 18, 71718, "", "=q4=Swift Shorestrider", "=ds=#e26#", "=q1="..ALIL["Throne of the Tides"]},
				{ 19, 72575, "", "=q4=White Riding Camel", "=ds=#e26#", "=q1="..AL["Tomb of the Forgotten"]},
				{ 20, 54068, "", "=q4=Wooly White Rhino ", "=ds=#e26#", "=q1="..AL["Icecrown"]};
				{ 21, 49286, "", "=q4=X-51 Nether-Rocket X-TREME", "=ds=#e12#", "=q1="..AL["Servants of the Betrayer"]};
				{ 23, 49283, "", "=q3=Reins of the Spectral Tiger", "=ds=#e26#", "=q1="..AL["Fires of Outland"]};
				{ 24, 49285, "", "=q3=X-51 Nether-Rocket", "=ds=#e12#", "=q1="..AL["Servants of the Betrayer"]};
			};
		};
		info = {
			name = AL["Card Game Mounts"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsPromotional"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Promotional Mounts"], ""};
				{ 2, 85870, "", "=q4=Imperial Quilen", "#ACHIEVEMENTID:6849#"};
				{ 3, 76889, "", "=q4=Spectral Gryphon", "=q2="..AL["Scroll of Resurrection"].."  =ec1=#m7#"};
				{ 4, 76902, "", "=q4=Spectral Wind Rider", "=q2="..AL["Scroll of Resurrection"].."  =ec1=#m6#"};
				{ 5, 76755, "", "=q4=Tyrael's Charger", "=q2="..AL["Annual Pass"]};
				{ 6, 83086, "", "=q4=Heart of the Nightwing", "#ACHIEVEMENTID:8213#"};
				{ 8, 43599, "", "=q3=Big Blizzard Bear", "#ACHIEVEMENTID:415#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Blizzard Store"], ""};
				{ 17, 54811, "", "=q4=Celestial Steed", "=ds=#e12#"};
				{ 18, 78924, "", "=q4=Heart of the Aspects", "=ds=#e12#"};
				{ 19, 92724, "", "=q4=Swift Windsteed", "=ds=#e27#"};
				{ 20, 69846, "", "=q4=Winged Guardian", "=ds=#e12#"};
			};
		};
		info = {
			name = AL["Promotional Mounts"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsEvent"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_BannerPVP_02", "=q6=#m7#", ""};
				{ 2, 45591, "", "=q4=Darnassian Nightsaber", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 3, 45590, "", "=q4=Exodar Elekk", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 4, 45589, "", "=q4=Gnomeregan Mechanostrider", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 5, 45586, "", "=q4=Ironforge Ram", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 6, 45125, "", "=q4=Stormwind Steed", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 8, 46745, "", "=q4=Great Red Elekk", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 9, 46752, "", "=q4=Swift Gray Steed", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 10, 46744, "", "=q4=Swift Moonsaber", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 11, 46748, "", "=q4=Swift Violet Ram", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 12, 46747, "", "=q4=Turbostrider", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 14, 47179, "", "=q4=Argent Charger", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 15, 47180, "", "=q4=Argent Warhorse", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 16, 0, "INV_BannerPVP_01", "=q6=#m6#", ""};
				{ 17, 45593, "", "=q4=Darkspear Raptor", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 18, 45597, "", "=q4=Forsaken Warhorse", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 19, 45595, "", "=q4=Orgrimmar Wolf", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 20, 45596, "", "=q4=Silvermoon Hawkstrider", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 21, 45592, "", "=q4=Thunder Bluff Kodo", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 23, 46750, "", "=q4=Great Golden Kodo", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 24, 46749, "", "=q4=Swift Burgundy Wolf", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 25, 46743, "", "=q4=Swift Purple Raptor", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 26, 46751, "", "=q4=Swift Red Hawkstrider", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 27, 46746, "", "=q4=White Skeletal Warhorse", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 29, 45725, "", "=q4=Argent Hippogryph", "=ds=#e27#", "#CHAMPSEAL:150#"};
				extraText = " - "..AL["Argent Tournament"]
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Brewfest"], ""};
				{ 2, 37828, "", "=q4=Great Brewfest Kodo", "=q2="..BabbleBoss["Coren Direbrew"]};
				{ 3, 33977, "", "=q4=Swift Brewfest Ram", "=q2="..BabbleBoss["Coren Direbrew"]};
				{ 5, 0, "INV_Box_01", "=q6="..AL["Hallow's End"], ""};
				{ 6, 37012, "", "=q4=The Horseman's Reins", "#ACHIEVEMENTID:980#"};
				{ 8, 0, "INV_Box_01", "=q6="..ALIL["Darkmoon Faire"], ""};
				{ 9, 73766, "", "=q4=Darkmoon Dancing Bear", "=ds=#e26#", "#DARKMOON:180#"},
				{ 10, 72140, "", "=q4=Swift Forest Strider", "=ds=#e26#", "#DARKMOON:180#"},
				{ 16, 0, "INV_Box_01", "=q6="..AL["Love is in the Air"], ""};
				{ 17, 50250, "", "=q4=Big Love Rocket", "#ACHIEVEMENTID:4627#"};
				{ 18, 72146, "", "=q4=Swift Lovebird", "=ds=#e26#", "#VALENTINEDAY:270#" },
				{ 20, 0, "INV_Box_01", "=q6="..AL["Noblegarden"], ""};
				{ 21, 72145, "", "=q4=Swift Springstrider", "=ds=#e26#", "#NOBLEGARDEN:500#"},
			};
		};
		info = {
			name = AL["World Events"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

	AtlasLoot_Data["MountsRemoved"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Dungeon"], ""};
				{ 2, 33809, "", "=q4=Amani War Bear", "=q1="..ALIL["Zul'Aman"], ""};
				{ 3, 19872, "", "=q4=Swift Razzashi Raptor", "#ACHIEVEMENTID:881#"};
				{ 4, 19902, "", "=q4=Swift Zulian Tiger", "#ACHIEVEMENTID:880#"};
				{ 6, 0, "INV_Box_01", "=q6="..AL["Raid"], ""};
				{ 7, 49098, "", "=q4=Crusader's Black Warhorse", "#ACHIEVEMENTID:4079#, =ec1=#m6#"};
				{ 8, 49096, "", "=q4=Crusader's White Warhorse", "#ACHIEVEMENTID:4156#, =ec1=#m7#"};
				{ 9, 49044, "", "=q4=Swift Alliance Steed", "#ACHIEVEMENTID:3810#, =ec1=#m7#"};
				{ 10, 49046, "", "=q4=Swift Horde Wolf", "#ACHIEVEMENTID:3810#, =ec1=#m6#"};
				{ 11, 44164, "", "=q4=Reins of the Black Proto-Drake", "#ACHIEVEMENTID:2138#"};
				{ 12, 44175, "", "=q4=Reins of the Plagued Proto-Drake", "#ACHIEVEMENTID:2137#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Arena Reward"], ""};
				{ 17, 30609, "", "=q4=Swift Nether Drake", "#ACHIEVEMENTID:886#"};
				{ 18, 34092, "", "=q4=Merciless Nether Drake", "#ACHIEVEMENTID:887#"};
				{ 19, 37676, "", "=q4=Vengeful Nether Drake", "#ACHIEVEMENTID:888#"};
				{ 20, 43516, "", "=q4=Brutal Nether Drake", "#ACHIEVEMENTID:2316#"};
				{ 21, 46708, "", "=q4=Deadly Gladiator's Frost Wyrm", "#ACHIEVEMENTID:3096#"};
				{ 22, 46171, "", "=q4=Furious Gladiator's Frost Wyrm", "#ACHIEVEMENTID:3756#"};
				{ 23, 47840, "", "=q4=Relentless Gladiator's Frost Wyrm", "#ACHIEVEMENTID:3757#"};
				{ 24, 50435, "", "=q4=Wrathful Gladiator's Frost Wyrm", "#ACHIEVEMENTID:4600#"};
				{ 25, 71339, "", "=q4=Vicious Gladiator's Twilight Drake", "#ACHIEVEMENTID:6003#"};
				{ 26, 71954, "", "=q4=Ruthless Gladiator's Twilight Drake", "#ACHIEVEMENTID:6322#"};
				{ 27, 85785, "", "=q4=Cataclysmic Gladiator's Twilight Drake", "#ACHIEVEMENTID:6741#"};
				{ 28, 95041, "", "=q4=Malevolent Gladiator's Cloud Serpent", "#ACHIEVEMENTID:8216#"};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["World Events"], ""};
				{ 2, 21176, "", "=q5=Black Qiraji Resonating Crystal", "=q1=#m4#: #QUESTID:8743#"};
				{ 3, 33976, "", "=q3=Brewfest Ram", "=ds=#e26#"};
				{ 5, 0, "INV_Box_01", "=q6="..AL["Alliance"], "#ACHIEVEMENTID:879#"};
				{ 6, 13328, "", "=q4=Black Ram", "#e26#"};
				{ 7, 13329, "", "=q4=Frost Ram", "#e26#"};
				{ 8, 13327, "", "=q4=Icy Blue Mechanostrider Mod A", "#e26#"};
				{ 9, 13326, "", "=q4=White Mechanostrider Mod B", "#e26#"};
				{ 10, 12354, "", "=q4=Palomino Bridle", "#e26#"};
				{ 11, 12353, "", "=q4=White Stallion Bridle", "#e26#"};
				{ 12, 12302, "", "=q4=Reins of the Ancient Frostsaber", "#e26#"};
				{ 13, 12303, "", "=q4=Reins of the Nightsaber", "#e26#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Promotional Mounts"], ""};
				{ 17, 37719, "", "=q4=Swift Zhevra", "#ACHIEVEMENTID:1436#"};
				{ 18, 54860, "", "=q4=X-53 Touring Rocket", "#ACHIEVEMENTID:4832#"};
				{ 20, 0, "INV_Box_01", "=q6="..AL["Horde"], "#ACHIEVEMENTID:879#"};
				{ 21, 12351, "", "=q4=Horn of the Arctic Wolf", "#e26#"};
				{ 22, 12330, "", "=q4=Horn of the Red Wolf", "#e26#"};
				{ 23, 15292, "", "=q4=Green Kodo", "#e26#"};
				{ 24, 15293, "", "=q4=Teal Kodo", "#e26#"};
				{ 25, 13317, "", "=q4=Whistle of the Ivory Raptor", "#e26#"};
				{ 26, 8586, "", "=q4=Whistle of the Mottled Red Raptor", "#e26#"};
			};
		};
		info = {
			name = AL["Unobtainable Mounts"],
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}

--[[	AtlasLoot_Data["MountsNEW"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_BannerPVP_02", "=q6="..ALIL["Operation: Shieldwall"], "=ec1=#m7#"};
				{ 2, 93168, "", "=q4=Grand Armored Gryphon", "=ds=#e27#", "=ds=2,000 #gold#"};
				{ 4, 0, "INV_BannerPVP_02", "=q6="..ALIL["Dominance Offensive"], "=ec1=#m7#"};
				{ 5, 93169, "", "=q4=Grand Armored Wyvern", "=ds=#e27#", "=ds=2,000 #gold#"};
				{ 7, 0, "INV_Box_01", "=q6="..AL["Quest Reward"], ""};
				{ 8, 93385, "", "=q4=Grand Gryphon", "=ds=#e27#, =ec1=#m7#", "=q1=#m4#: #QUESTID:32455#"};
				{ 9, 93386, "", "=q4=Grand Wyvern", "=ds=#e27#, =ec1=#m6#", "=q1=#m4#: #QUESTID:32399#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Achievement Reward"]};
				{
					{ 17, 91802, "", "=q4=Jade Pandaren Kite String", "#ACHIEVEMENTID:7862#, =ec1=#m6#"};
					{ 17, 91802, "", "=q4=Jade Pandaren Kite String", "#ACHIEVEMENTID:7860#, =ec1=#m7#"};
				};
				{ 19, 0, "INV_Box_01", "=q6="..AL["Blizzard Store"], ""};
				{ 20, 92724, "", "=q4=Swift Windsteed", "=ds=#e27#"};
				--{ 16, 0, "INV_Box_01", "=q6="..AL["Unknown"], ""};
				--{ 17, 87776, "", "=q4=Reins of the Heavenly Azure Cloud Serpent", "=ds=#e27#", ""};
				--{ 18, 87774, "", "=q4=Reins of the Heavenly Golden Cloud Serpent", "=ds=#e27#", ""};
				--{ 19, 87775, "", "=q4=Reins of the Heavenly Jade Cloud Serpent", "=ds=#e27#", ""};
				--{ 20, 87784, "", "=q4=Jungle Riding Crane", "=ds=#e26#", ""};
				--{ 21, 87785, "", "=q4=Reins of the Albino Riding Crane", "=ds=#e26#", ""};
				--{ 22, 84728, "", "=q4=Reins of the Crimson Riding Crane", "=ds=#e26#", ""};
				--{ 23, 87786, "", "=q4=Reins of the Black Riding Yak", "=ds=#e26#", ""};
				--{ 24, 87787, "", "=q4=Reins of the Brown Riding Yak", "=ds=#e26#", ""};
				--{ 25, 84753, "", "=q4=Reins of the White Riding Yak", "=ds=#e26#", ""};
			};
		};
		info = {
			name = AL["New Mounts"].." - Patch 5.2",
			module = moduleName, menu = "MOUNTMENU", instance = "Mounts",
		};
	}--]]

		---------------
		--- Tabards ---
		---------------

	AtlasLoot_Data["TabardsAlliance"] = {
		["Normal"] = {
			{
				{ 1, 63379, "", "=q3=Baradin's Wardens Tabard", "=ds=#s7#"};
				{ 2, 45579, "", "=q1=Darnassus Tabard", "=ds=#s7#"};
				{ 3, 45580, "", "=q1=Exodar Tabard", "=ds=#s7#"};
				{ 4, 64882, "", "=q1=Gilneas Tabard", "=ds=#s7#"};
				{ 5, 45578, "", "=q1=Gnomeregan Tabard", "=ds=#s7#"};
				{ 6, 23999, "", "=q1=Honor Hold Tabard", "=ds=#s7#"};
				{ 7, 45577, "", "=q1=Ironforge Tabard", "=ds=#s7#"};
				{ 8, 31774, "", "=q1=Kurenai Tabard", "=ds=#s7#"};
				{ 9, 46817, "", "=q1=Silver Covenant Tabard", "=ds=#s7#"};
				{ 10, 45574, "", "=q1=Stormwind Tabard", "=ds=#s7#"};
				{ 11, 83079, "", "=q1=Tushui Tabard", "=ds=#s7#"};
				{ 16, 0, "INV_BannerPVP_02", "=q6="..AL["PvP Tabards"], ""};
				{ 17, 15196, "", "=q1=Private's Tabard", "=ds=#s7#"};
				{ 18, 15198, "", "=q1=Knight's Colors", "=ds=#s7#"};
				{ 19, 20132, "", "=q1=Arathor Battle Tabard", "=ds=#s7#, =q1=#m4#"};
				{ 20, 19506, "", "=q1=Silverwing Battle Tabard", "=ds=#s7#"};
				{ 21, 19032, "", "=q1=Stormpike Battle Tabard", "=ds=#s7#"};
			};
		};
		info = {
			name = AL["Alliance Tabards"],
			module = moduleName, menu = "TABARDMENU",
		};
	}

	AtlasLoot_Data["TabardsHorde"] = {
		["Normal"] = {
			{
				{ 1, 63378, "", "=q3=Hellscream's Reach Tabard", "=ds=#s7#"};
				{ 2, 64884, "", "=q1=Bilgewater Cartel Tabard", "=ds=#s7#"};
				{ 3, 45582, "", "=q1=Darkspear Tabard", "=ds=#s7#"};
				{ 4, 83080, "", "=q1=Huojin Tabard", "=ds=#s7#"};
				{ 5, 31773, "", "=q1=Mag'har Tabard", "=ds=#s7#"};
				{ 6, 45581, "", "=q1=Orgrimmar Tabard", "=ds=#s7#"};
				{ 7, 45585, "", "=q1=Silvermoon City Tabard", "=ds=#s7#"};
				{ 8, 46818, "", "=q1=Sunreaver Tabard", "=ds=#s7#"};
				{ 9, 24004, "", "=q1=Thrallmar Tabard", "=ds=#s7#"};
				{ 10, 45584, "", "=q1=Thunder Bluff Tabard", "=ds=#s7#"};
				{ 11, 45583, "", "=q1=Undercity Tabard", "=ds=#s7#"};
				{ 16, 0, "INV_BannerPVP_01", "=q6="..AL["PvP Tabards"], ""};
				{ 17, 15197, "", "=q1=Scout's Tabard", "=ds=#s7#"};
				{ 18, 15199, "", "=q1=Stone Guard's Herald", "=ds=#s7#"};
				{ 19, 20131, "", "=q1=Battle Tabard of the Defilers", "=ds=#s7#, =q1=#m4#"};
				{ 20, 19031, "", "=q1=Frostwolf Battle Tabard", "=ds=#s7#"};
				{ 21, 19505, "", "=q1=Warsong Battle Tabard", "=ds=#s7#"};
			};
		};
		info = {
			name = AL["Horde Tabards"],
			module = moduleName, menu = "TABARDMENU",
		};
	}

	AtlasLoot_Data["TabardsNeutralFaction"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Cataclysm"], ""};
				{ 2, 65904, "", "=q1=Tabard of Ramkahen", "=ds=#s7#"};
				{ 3, 65909, "", "=q1=Tabard of the Dragonmaw Clan", "=ds=#s7#"};
				{ 4, 65905, "", "=q1=Tabard of the Earthen Ring", "=ds=#s7#"};
				{ 5, 65906, "", "=q1=Tabard of the Guardians of Hyjal", "=ds=#s7#"};
				{ 6, 65907, "", "=q1=Tabard of Therazane", "=ds=#s7#"};
				{ 7, 65908, "", "=q1=Tabard of the Wildhammer Clan", "=ds=#s7#"};
				{ 9, 0, "INV_Box_01", "=q6="..AL["Wrath of the Lich King"], ""};
				{ 10, 46874, "", "=q3=Argent Crusader's Tabard", "=ds=#s7#"};
				{ 11, 43154, "", "=q1=Tabard of the Argent Crusade", "=ds=#s7#"};
				{ 12, 43155, "", "=q1=Tabard of the Ebon Blade", "=ds=#s7#"};
				{ 13, 43157, "", "=q1=Tabard of the Kirin Tor", "=ds=#s7#"};
				{ 14, 43156, "", "=q1=Tabard of the Wyrmrest Accord", "=ds=#s7#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Burning Crusade"], ""};
				{ 17, 31779, "", "=q1=Aldor Tabard", "=ds=#s7#"};
				{ 18, 31804, "", "=q1=Cenarion Expedition Tabard", "=ds=#s7#"};
				{ 19, 31776, "", "=q1=Consortium Tabard", "=ds=#s7#"};
				{ 20, 31777, "", "=q1=Keepers of Time Tabard", "=ds=#s7#"};
				{ 21, 31778, "", "=q1=Lower City Tabard", "=ds=#s7#"};
				{ 22, 32828, "", "=q1=Ogri'la Tabard", "=ds=#s7#"};
				{ 23, 31781, "", "=q1=Sha'tar Tabard", "=ds=#s7#"};
				{ 24, 31775, "", "=q1=Sporeggar Tabard", "=ds=#s7#"};
				{ 25, 31780, "", "=q1=Scryers Tabard", "=ds=#s7#"};
				{ 26, 32445, "", "=q1=Skyguard Tabard", "=ds=#s7#"};
				{ 27, 35221, "", "=q1=Tabard of the Shattered Sun", "=ds=#s7#"};
			};
		};
		info = {
			name = AL["Neutral Faction Tabards"],
			module = moduleName, menu = "TABARDMENU",
		};
	}

	AtlasLoot_Data["TabardsAchievementQuestRare"] = {
		["Normal"] = {
			{
				{ 1, 0, "achievement_guildperk_honorablemention_rank2", "=q6="..AL["Achievement Reward"], ""};
				{ 2, 43349, "", "=q4=Tabard of Brute Force", "#ACHIEVEMENTID:876#"};
				{ 3, 40643, "", "=q4=Tabard of the Achiever", "#ACHIEVEMENTID:1021#"};
				{ 4, 43348, "", "=q4=Tabard of the Explorer", "#ACHIEVEMENTID:45#"};
				{
					{ 5, 43300, "", "=q4=Loremaster's Colors", "#ACHIEVEMENTID:1682#, =ec1=#m6#"};
					{ 5, 43300, "", "=q4=Loremaster's Colors", "#ACHIEVEMENTID:1681#, =ec1=#m7#"};
				};
				{ 6, 49052, "", "=q3=Tabard of Conquest", "#ACHIEVEMENTID:3857#, =ec1=#m7#"};
				{ 7, 49054, "", "=q3=Tabard of Conquest", "#ACHIEVEMENTID:3957#, =ec1=#m6#"};
				{ 16, 0, "achievement_guildperk_honorablemention", "=q6="..AL["Quest Reward"], ""};
				{ 17, 52252, "", "=q4=Tabard of the Lightbringer", "=q1=#m4#: #QUESTID:24919#"};
				{ 18, 35280, "", "=q3=Tabard of Summer Flames", "=q1=#m4#: #QUESTID:11972#"};
				{ 19, 35279, "", "=q3=Tabard of Summer Skies", "=q1=#m4#: #QUESTID:11972#"};
				{ 20, 31404, "", "=q2=Green Trophy Tabard of the Illidari", "=q1=#m4#: #QUESTID:10781#"};
				{ 21, 31405, "", "=q2=Purple Trophy Tabard of the Illidari", "=q1=#m4#: #QUESTID:10781#"};
				{ 22, 25549, "", "=q1=Blood Knight Tabard", "=q1=#m4#: #QUESTID:9737#, =ec1=#m6#"};
				{ 23, 24344, "", "=q1=Tabard of the Hand", "=q1=#m4#: #QUESTID:9762#, =ec1=#m7#"};
			};
		};
		info = {
			name = AL["Achievement & Quest Reward Tabards"],
			module = moduleName, menu = "TABARDMENU",
		};
	}

	AtlasLoot_Data["TabardsRemoved"] = {
		["Normal"] = {
			{
				{ 1, 36941, "", "=q3=Competitor's Tabard", "#ACHIEVEMENTID:1636#"};
				{ 2, 89196, "", "=q3=Theramore Tabard", "#ACHIEVEMENTID:7467#"};
				{ 3, 23192, "", "=q2=Tabard of the Scarlet Crusade", "=ds=#s7#"};
				{ 4, 22999, "", "=q1=Tabard of the Argent Dawn", "#ACHIEVEMENTID:2116#"};
				{ 5, 28788, "", "=q1=Tabard of the Protector", "#ACHIEVEMENTID:2079#"};
				{ 6, 19160, "", "=q1=Contest Winner's Tabard", "=ds=#s7#"};
				{ 8, 0, "achievement_featsofstrength_gladiator_10", "=q6="..AL["Arena Reward"], ""};
				{ 9, 45983, "", "=q4=Furious Gladiator's Tabard", "=q5="..string.format(AL["Season %d"], 6)};
				{ 10, 49086, "", "=q4=Relentless Gladiator's Tabard", "=q5="..string.format(AL["Season %d"], 7)};
				{ 11, 51534, "", "=q4=Wrathful Gladiator's Tabard", "=q5="..string.format(AL["Season %d"], 8)};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Card Game Tabards"], ""};
				{ 17, 38312, "", "=q4=Tabard of Brilliance", "=ds=#s7#, =q1=#m24#"};
				{ 18, 23705, "", "=q4=Tabard of Flame", "=ds=#s7#, =q1=#m24#"};
				{ 19, 23709, "", "=q4=Tabard of Frost", "=ds=#s7#, =q1=#m24#"};
				{ 20, 38313, "", "=q4=Tabard of Fury", "=ds=#s7#, =q1=#m24#"};
				{ 21, 38309, "", "=q4=Tabard of Nature", "=ds=#s7#, =q1=#m24#"};
				{ 22, 38310, "", "=q4=Tabard of the Arcane", "=ds=#s7#, =q1=#m24#"};
				{ 23, 38314, "", "=q4=Tabard of the Defender", "=ds=#s7#, =q1=#m24#"};
				{ 24, 38311, "", "=q4=Tabard of the Void", "=ds=#s7#, =q1=#m24#"};
			};
		};
		info = {
			name = AL["Unobtainable Tabards"],
			module = moduleName, menu = "TABARDMENU",
		};
	}

		----------------------------
		--- Transformation Items ---
		----------------------------

	AtlasLoot_Data["TransformationNonconsumedItems"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Vendor"]};
				{ 2, 44719, "", "=q3=Frenzyheart Brew", "=q2="..ALIL["Frenzyheart Tribe"].." - "..AL["Revered"], "=ds=3 #gold#"};
				{ 3, 68806, "", "=q3=Kalytha's Haunted Locket", "=q2="..AL["Tex Vortacoil"]..", =q1="..ALIL["Azshara"], "=ds=5,000 #gold#"};
				{
					{ 4, 43499, "", "=q1=Iron Boot Flask", "=q2="..AL["Olut Alegut"]..", =q1="..ALIL["The Storm Peaks"], "#RELICULDUAR:10#"};
					{ 4, 43499, "", "=q1=Iron Boot Flask", "=q2="..AL["Rork Sharpchin"]..", =q1="..ALIL["The Storm Peaks"], "#RELICULDUAR:10#"};
				};
				{ 5, 66888, "", "=q1=Stave of Fur and Claw", "=q2="..ALIL["Timbermaw Hold"].." - "..AL["Exalted"], "=ds=5,000 #gold#"};
				{ 7, 0, "INV_Box_01", "=q6="..AL["Quest Reward"]};
				{ 8, 52201, "", "=q4=Muradin's Favor", "=ds=#m4#: #QUESTID:24917#"};
				{ 9, 54653, "", "=q3=Darkspear Pride", "=ds=#m4#: #QUESTID:25480# #m6#"};
				{ 10, 54651, "", "=q3=Gnomeregan Pride", "=ds=#m4#: #QUESTID:25286# #m7#"};
				{ 11, 19979, "", "=q3=Hook of the Master Angler", "=ds=#m4#: #QUESTID:8193#"};
				{ 12, 5462, "", "=q1=Dartol's Rod of Transformation", "=ds=#m34#: #QUESTID:1028# #m7#"};
				{ 13, 53057, "", "=q1=Faded Wizard Hat", "=ds=#m4#: #QUESTID:14392# #m6#"};
				{ 14, 88417, "", "=q1=Gokk'lok's Shell", "=ds=#m4#: #QUESTID:31083# #m6#"};
				{ 15, 71259, "", "=q1=Leyara's Locket", "=ds=#m4#: #QUESTID:29311#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Rare"]};
				{ 17, 37254, "", "=q4=Super Simian Sphere", "=ds="..AL["World Drop"]};
				{ 18, 86589, "", "=q3=Ai-Li's Skymirror", "=q2="..ALIL["Ai-Li Skymirror"]..", =q1="..ALIL["Dread Wastes"]};
				{ 19, 86582, "", "=q3=Aqua Jewel", "=q2="..ALIL["Sahn Tidehunter"]..", =q1="..ALIL["Vale of Eternal Blossoms"]};
				{ 20, 65665, "", "=q3=Burgy Blackheart's Handsome Hat", "=q2="..BabbleRare["Burgy Blackheart"]..", =q1="..ALIL["Shimmering Expanse"]};
				{ 21, 86593, "", "=q3=Hozen Beach Ball", "=q2="..ALIL["Ik-Ik the Nimble"]..", =q1="..ALIL["Dread Wastes"]};
				{ 22, 88566, "", "=q3=Krastinov's Bag of Horrors", "=q2="..BabbleBoss["Doctor Theolen Krastinov"]..", =q1="..ALIL["Scholomance"]};
				{ 23, 86568, "", "=q3=Mr. Smite's Brass Compass", "=q2="..ALIL["Yorik Sharpeye"]..", =q1="..ALIL["Vale of Eternal Blossoms"]};
				{ 24, 1973, "", "=q3=Orb of Deception", "=q2="..AL["World Drop"]};
				{ 25, 35275, "", "=q3=Orb of the Sin'dorei", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Magisters' Terrace"]};
				{ 26, 86573, "", "=q3=Shard of Archstone", "=q2="..ALIL["Havak"]..", =q1="..ALIL["Kun-Lai Summit"]};
				{ 27, 32782, "", "=q3=Time-Lost Figurine", "=q2="..BabbleRare["Terokk"]..", =q1="..ALIL["Terokkar Forest"]};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Crafted"]};
				{ 2, 64481, "", "=q4=Blessing of the Old God", "=ds=#p25#"};
				{ 3, 64646, "", "=q4=Bones of Transformation", "=ds=#p25#"};
				{ 4, 64651, "", "=q4=Wisp Amulet", "=ds=#p25#"};
				{ 5, 45850, "", "=q3=Rituals of the New Moon", "=ds=#p26#"};
				{ 6, 45851, "", "=q3=Rituals of the New Moon", "=ds=#p26#"};
				{ 7, 45852, "", "=q3=Rituals of the New Moon", "=ds=#p26#"};
				{ 8, 45853, "", "=q3=Rituals of the New Moon", "=ds=#p26#"};
				{ 9, 69775, "", "=q3=Vrykul Drinking Horn", "=ds=#p25#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Card Game Item"]};
				{ 17, 49704, "", "=q4=Carved Ogre Idol", "=ds="..AL["UDE Items"]..", =ds="..AL["No Longer Available"]};
				{ 19, 0, "INV_Box_01", "=q6="..AL["Promotional"]};
				{ 20, 33079, "", "=q3=Murloc Costume", "#ACHIEVEMENTID:412#"};
				{ 22, 0, "INV_Box_01", "=q6="..AL["World Events"]};
				{ 23, 17712, "", "=q1=Winter Veil Disguise Kit", "=ds="..AL["Feast of Winter Veil"]};
			};
		};
		info = {
			name = AL["Non-consumed Transformation Items"],
			module = moduleName, menu = "TRANSFORMATIONMENU",
		};
	}

	AtlasLoot_Data["TransformationConsumableItems"] = {
		["Normal"] = {
			{
				{ 2, 0, "INV_Box_01", "=q6="..AL["Crafted"]};
				{ 3, 4388, "", "=q1=Discombobulator Ray", "=ds=#p5#"};
				{ 4, 63122, "", "=q1=Lifegiving Seed", "=ds=#p27#"};
				{ 5, 43572, "", "=q1=Magic Eater", "=ds=#p24#: =q1="..ALIL["Dalaran"]};
				{ 6, 58489, "", "=q1=Potion of Illusion", "=ds=#p1#"};
				{ 7, 40195, "", "=q1=Pygmy Oil", "=ds=#p1#"};
				{ 8, 6657, "", "=q1=Savory Deviate Delight", "=ds=#p3#"};
				{ 10, 0, "INV_Box_01", "=q6="..AL["Drop"]};
				{ 11, 38320, "", "=q1=Dire Brew", "=q1="..ALIL["Blackrock Depths"]};
				{ 12, 23864, "", "=q1=Torment of the Worgen", "=q1="..ALIL["Karazhan"]};
				{ 13, 44012, "", "=q1=Underbelly Elixir", "=q1="..ALIL["Dalaran"]};
				{ 17, 0, "INV_Box_01", "=q6="..AL["Rare"]};
				{ 18, 89373, "", "=q2=Scotty's Lucky Coin", "=q2="..ALIL["Scotty"]..", =q1="..ALIL["Townlong Steppes"]};
			};
			{
				{ 2, 0, "INV_Box_01", "=q6="..AL["Vendor"]};
				{
					{ 3, 93314, "", "=q1=Magic Bamboo Shoot", "=q2="..AL["Luo Luo"]..", =q1="..ALIL["Orgrimmar"]};
					{ 3, 93314, "", "=q1=Magic Bamboo Shoot", "=q2="..AL["Meng Meng"]..", =q1="..ALIL["Stormwind City"]};
				};
				{ 4, 8529, "", "=q1=Noggenfogger Elixir", "=q2="..AL["Sprinkle Noggenfogger"]..", =q1="..ALIL["Tanaris"], "35 #silver#"};
				{
					{ 5, 92528, "", "=q1=Obelisk of Deception", "=q2="..AL["Ongrom Black Tooth"]..", =q1="..ALIL["Krasarang Wilds"], "=ds=", "#DOMINATIONCOMMISSION:500#" },
					{ 5, 92533, "", "=q1=Obelisk of Deception", "=q2="..AL["Proveditor Grantley"]..", =q1="..ALIL["Krasarang Wilds"], "=ds=", "#LIONSLANDINGCOMMISSION:500#" },
				};
				{ 6, 31337, "", "=q1=Orb of the Blackwhelp", "=q2="..AL["Wyrmcult Provisioner"]..", =q1="..ALIL["Blade's Edge Mountains"], "2 #gold# 50 #silver#"};
				{ 7, 88492, "", "=q1=Wicked Wikket", "=q2="..AL["Auntie Stormstout"]..", =q1="..ALIL["Stormstout Brewery"], "15 #gold#"};
				{ 17, 0, "INV_Box_01", "=q6="..AL["World Events"]};
				{ 18, 44792, "", "=q1=Blossoming Branch", "=ds="..AL["Noblegarden"], "#NOBLEGARDEN:10#"};
				{ 19, 20410, "", "=q1=Hallowed Wand - Bat", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 20, 20409, "", "=q1=Hallowed Wand - Ghost", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 21, 20399, "", "=q1=Hallowed Wand - Leper Gnome", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 22, 20398, "", "=q1=Hallowed Wand - Ninja", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 23, 20397, "", "=q1=Hallowed Wand - Pirate", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 24, 20413, "", "=q1=Hallowed Wand - Random", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 25, 20411, "", "=q1=Hallowed Wand - Skeleton", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
				{ 26, 20414, "", "=q1=Hallowed Wand - Wisp", "=ds="..AL["Hallow's End"], "#HALLOWSEND:2#"};
			};
		};
		info = {
			name = AL["Consumable Transformation Items"],
			module = moduleName, menu = "TRANSFORMATIONMENU",
		};
	}

	AtlasLoot_Data["TransformationAdditionalEffects"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Weapons"]};
				{ 2, 71086, "", "=q5=Dragonwrath, Tarecgosa's Rest", "=ds=#w9#", "=q1="..ALIL["Firelands"]};
				{ 3, 69897, "", "=q4=Fandral's Flamescythe", "=ds=#w9#", "=q2="..BabbleBoss["Majordomo Staghelm"]..", =q1="..ALIL["Firelands"]};
				{ 4, 71466, "", "=q4=Fandral's Flamescythe", "=ds=#w9#", "=q2="..BabbleBoss["Majordomo Staghelm"]..", =q1="..ALIL["Firelands"]};
				{ 5, 39769, "", "=q4=Arcanite Ripper", "=ds=#h2#, #w1#", "=q2="..AL["No Longer Available"]};
				{ 6, 19910, "", "=q4=Arlokk's Grasp", "=ds=#h1#, #w13#", "=q2="..AL["No Longer Available"]};
				{ 7, 19896, "", "=q4=Thekal's Grasp", "=ds=#h1#, #w13#", "=q2="..AL["No Longer Available"]};
				{ 9, 0, "INV_Box_01", "=q6="..BabbleInventory["Mounts"]};
				{ 10, 65891, "", "=q4=Vial of the Sands", "=ds=#e12#", "=ds=#p1#"};
				{ 11, 83086, "", "=q4=Heart of the Nightwing", "=ds=#e12#", "=q2="..AL["Recruit-A-Friend"]};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Trinkets"]};
				{ 17, 50362, "", "=q4=Deathbringer's Will", "=ds=#s14#", "=q2="..BabbleBoss["Deathbringer Saurfang"]..", =q1="..ALIL["Icecrown Citadel"]};
				{ 18, 50363, "", "=q4=Deathbringer's Will", "=ds=#s14#", "=q2="..BabbleBoss["Deathbringer Saurfang"]..", =q1="..ALIL["Icecrown Citadel"]};
				{ 19, 59461, "", "=q4=Fury of Angerforge", "=ds=#s14#", "=q2="..AL["Various Locations"]..", =q1="..ALIL["Blackwing Lair"]};
				{ 20, 23835, "", "=q3=Gnomish Poultryizer", "=ds=#s14#", "=ds=#p5#"};
				{ 21, 18984, "", "=q2=Dimensional Ripper - Everlook", "=ds=#s14#", "=ds=#p5#"};
				{ 22, 18986, "", "=q2=Ultrasafe Transporter: Gadgetzan", "=ds=#s14#", "=ds=#p5#"};
			};
		};
		info = {
			name = AL["Additional Effects Transformation Items"],
			module = moduleName, menu = "TRANSFORMATIONMENU",
		};
	}

		-------------------
		--- Legendaries ---
		-------------------

	AtlasLoot_Data["Legendaries"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Mists of Pandaria"]};
				{ 2, 95346, "", "=q5=Capacitive Primal Diamond", "=ds=#e32# #e7#"};
				{ 3, 95345, "", "=q5=Courageous Primal Diamond", "=ds=#e32# #e7#"};
				{ 4, 95344, "", "=q5=Indomitable Primal Diamond", "=ds=#e32# #e7#"};
				{ 5, 95347, "", "=q5=Sinister Primal Diamond", "=ds=#e32# #e7#"};
				{ 7, 93403, "", "=q5=Eye of the Black Prince", "=ds=#m4#"};
				{ 9, 89873, "", "=q5=Crystallized Dread", "=ds=#e7#"};
				{ 10, 89882, "", "=q5=Crystallized Horror", "=ds=#e7#"};
				{ 11, 89881, "", "=q5=Crystallized Terror", "=ds=#e7#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Cataclysm"]};
				{ 17, 77949, "", "=q5=Golad, Twilight of Aspects", "=ds=#h3#, #w4#", "" };
				{ 18, 77950, "", "=q5=Tiriosh, Nightmare of Ages", "=ds=#h4#, #w4#", "" };
				{ 19, 77947, "", "=q4=The Sleeper", "=ds=#h3#, #w4#", "" };
				{ 20, 77948, "", "=q4=The Dreamer", "=ds=#h4#, #w4#", "" };
				{ 21, 77945, "", "=q4=Fear", "=ds=#h3#, #w4#", "" };
				{ 22, 77946, "", "=q4=Vengeance", "=ds=#h4#, #w4#", "" };
				{ 24, 71086, "", "=q5=Dragonwrath, Tarecgosa's Rest", "=ds=#w9#", "" };
				{ 25, 71085, "", "=q4=Runestaff of Nordrassil", "=ds=#w9#", "" };
				{ 26, 71084, "", "=q4=Branch of Nordrassil", "=ds=#w9#", "" };
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Wrath of the Lich King"]};
				{ 2, 49623, "", "=q5=Shadowmourne", "=ds=#h2#, #w1#", "" };
				{ 3, 49888, "", "=q4=Shadow's Edge", "=ds=#h2#, #w1#", "" };
				{ 5, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=ds=#h1#, #w6#", "" };
				{ 16, 0, "INV_Box_01", "=q6="..AL["Burning Crusade"]};
				{ 17, 34334, "", "=q5=Thori'dal, the Stars' Fury", "=ds=#w2#"};
				{ 19, 32837, "", "=q5=Warglaive of Azzinoth", "=ds=#h3#, #w10#, =q1=#m1# =ds=#c9#, #c6#"};
				{ 20, 32838, "", "=q5=Warglaive of Azzinoth", "=ds=#h4#, #w10#, =q1=#m1# =ds=#c9#, #c6#"};
				{ 22, 30312, "", "=q5=Infinity Blade", "=ds=#h1#, #w4#"};
				{ 23, 30311, "", "=q5=Warp Slicer", "=ds=#h1#, #w10#"};
				{ 24, 30316, "", "=q5=Devastation", "=ds=#h2#, #w1#"};
				{ 25, 30317, "", "=q5=Cosmic Infuse", "=ds=#h1#, #w6#"};
				{ 26, 30313, "", "=q5=Staff of Disintegration", "=ds=#w9#"};
				{ 27, 30318, "", "=q5=Netherstrand Longbow", "=ds=#w2#"};
				{ 28, 30314, "", "=q5=Phaseshift Bulwark", "=ds=#w8#"};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Classic WoW"]};
				{ 2, 22632, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c1#"};
				{ 3, 22589, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c3#"};
				{ 4, 22631, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c5#"};
				{ 5, 22630, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c8#"};
				{ 7, 21176, "", "=q5=Black Qiraji Resonating Crystal", "=ds=#e26#"};
				{ 9, 19019, "", "=q5=Thunderfury, Blessed Blade of the Windseeker", "=ds=#h1#, #w10#"};
				{ 11, 17182, "", "=q5=Sulfuras, Hand of Ragnaros", "=ds=#h2#, #w6#"};
				{ 12, 17193, "", "=q4=Sulfuron Hammer", "=ds=#h2#, #w6#"};
			};
		};
		info = {
			name = AL["Legendary Items"],
			module = moduleName, menu = "SETMENU",
		};
	}

		----------------------
		--- Heirloom Items ---
		----------------------

	AtlasLoot_Data["Heirloom"] = {
		["Normal"] = {
			{
				{ 1, 62040, "", "=q7=Ancient Bloodmoon Cloak", "=ds=#s4#", "1,200 #gold#"};
				{ 2, 62039, "", "=q7=Inherited Cape of the Black Baron", "=ds=#s4#", "1,200 #gold#"};
				{ 3, 69892, "", "=q7=Ripped Sandstorm Cloak", "=ds=#s4#", "1,200 #gold#"};
				{ 4, 62038, "", "=q7=Worn Stoneskin Gargoyle Cape", "=ds=#s4#", "1,200 #gold#"};
				{ 6, 61958, "", "=q7=Tattered Dreadmist Mask", "=ds=#s1#, #a1#", "1,500 #gold#"};
				{ 7, 42985, "", "=q7=Tattered Dreadmist Mantle", "=ds=#s3#, #a1#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 8, 48691, "", "=q7=Tattered Dreadmist Robe", "=ds=#s5#, #a1#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 9, 62029, "", "=q7=Tattered Dreadmist Leggings", "=ds=#s11#, #a1#", "1,750 #gold#"};
				{ 16, 61942, "", "=q7=Preened Tribal War Feathers", "=ds=#s1#, #a2#", "1,500 #gold#"};
				{ 17, 42984, "", "=q7=Preened Ironfeather Shoulders", "=ds=#s3#, #a2#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 18, 48687, "", "=q7=Preened Ironfeather Breastplate", "=ds=#s5#, #a2#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 19, 62027, "", "=q7=Preened Wildfeather Leggings", "=ds=#s11#, #a2#", "1,750 #gold#"};
				{ 21, 61937, "", "=q7=Stained Shadowcraft Cap", "=ds=#s1#, #a2#", "1,500 #gold#"};
				{ 22, 42952, "", "=q7=Stained Shadowcraft Spaulders", "=ds=#s3#, #a2#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 23, 48689, "", "=q7=Stained Shadowcraft Tunic", "=ds=#s5#, #a2#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 24, 62026, "", "=q7=Stained Shadowcraft Pants", "=ds=#s11#, #a2#", "1,750 #gold#"};
				extraText = ": "..BabbleInventory["Back"].." / "..BabbleInventory["Cloth"].." / "..BabbleInventory["Leather"];
			};
			{
				{ 1, 61935, "", "=q7=Tarnished Raging Berserker's Helm", "=ds=#s1#, #a3#", "1,500 #gold#"};
				{ 2, 42950, "", "=q7=Champion Herod's Shoulder", "=ds=#s3#, #a3#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 3, 48677, "", "=q7=Champion's Deathdealer Breastplate", "=ds=#s5#, #a3#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 4, 62024, "", "=q7=Tarnished Leggings of Destruction", "=ds=#s11#, #a3#", "1,750 #gold#"};
				{ 6, 61936, "", "=q7=Mystical Coif of Elements", "=ds=#s1#, #a3#", "1,500 #gold#"};
				{ 7, 42951, "", "=q7=Mystical Pauldrons of Elements", "=ds=#s3#, #a3#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 8, 48683, "", "=q7=Mystical Vest of Elements", "=ds=#s5#, #a3#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 9, 62025, "", "=q7=Mystical Kilt of Elements", "=ds=#s11#, #a3#", "1,750 #gold#"};
				{ 16, 69887, "", "=q7=Burnished Helm of Might", "=ds=#s1#, #a4#", "1,500 #gold#"};
				{ 17, 69890, "", "=q7=Burnished Pauldrons of Might", "=ds=#s3#, #a4#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 18, 69889, "", "=q7=Burnished Breastplate of Might", "=ds=#s5#, #a4#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 19, 69888, "", "=q7=Burnished Legplates of Might", "=ds=#s11#, #a4#", "1,750 #gold#"};
				{ 21, 61931, "", "=q7=Polished Helm of Valor", "=ds=#s1#, #a4#", "1,500 #gold#"};
				{ 22, 42949, "", "=q7=Polished Spaulders of Valor", "=ds=#s3#, #a4#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 23, 48685, "", "=q7=Polished Breastplate of Valor", "=ds=#s5#, #a4#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 24, 62023, "", "=q7=Polished Legplates of Valor", "=ds=#s11#, #a4#", "1,750 #gold#"};
				extraText = ": "..BabbleInventory["Mail"].." / "..BabbleInventory["Plate"];
			};
			{
				{ 1, 50255, "", "=q7=Dread Pirate Ring", "=ds=#s13#", "=ds="..AL["Kalu'ak Fishing Derby"]};
				{ 3, 42992, "", "=q7=Discerning Eye of the Beast", "=ds=#s14#", "#JUSTICE:2725# #CHAMPSEAL:75# #DARKMOON:130#"};
				{ 4, 42991, "", "=q7=Swift Hand of Justice", "=ds=#s14#", "#JUSTICE:2725# #CHAMPSEAL:75# #DARKMOON:130#"};
				{ 16, 42944, "", "=q7=Balanced Heartseeker", "=ds=#h1#, #w4#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 18, 69893, "", "=q7=Bloodsoaked Skullforge Reaver", "=ds=#h1#, #w10#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 19, 42945, "", "=q7=Venerable Dal'Rend's Sacred Charge", "=ds=#h1#, #w10#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 21, 42943, "", "=q7=Bloodied Arcanite Reaper", "=ds=#h2#, #w1#", "#JUSTICE:3500# #CHAMPSEAL:95# #DARKMOON:160#"};
				{ 23, 42948, "", "=q7=Devout Aurastone Hammer", "=ds=#h1#, #w6#", "#JUSTICE:2725# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 24, 48716, "", "=q7=Venerable Mass of McGowan", "=ds=#h1#, #w6#", "#JUSTICE:2175# #CHAMPSEAL:60# #DARKMOON:110#"};
				{ 25, 48718, "", "=q7=Repurposed Lava Dredger", "=ds=#h2#, #w6#", "#JUSTICE:3500# #CHAMPSEAL:95# #DARKMOON:160#"};
				{ 27, 79131, "", "=q7=Burnished Warden Staff", "=ds=#w9#", "#JUSTICE:3500# #CHAMPSEAL:95# #DARKMOON:160#"};
				{ 28, 42947, "", "=q7=Dignified Headmaster's Charge", "=ds=#w9#", "#JUSTICE:3500# #CHAMPSEAL:95# #DARKMOON:160#"};
				{ 30, 42946, "", "=q7=Charmed Ancient Bone Bow", "=ds=#w2#", "#JUSTICE:3500# #CHAMPSEAL:95# #DARKMOON:160#"};
				extraText = ": "..AL["Accessories"].." / "..AL["Weapons"];
			};
			{
				{ 1, 44107, "", "=q7=Exquisite Sunderseer Mantle", "=ds=#s3#, #a1#", "#HONOR:2175#"};
				{ 2, 44103, "", "=q7=Exceptional Stormshroud Shoulders", "=ds=#s3#, #a2#", "#HONOR:2175#"};
				{ 3, 44105, "", "=q7=Lasting Feralheart Spaulders", "=ds=#s3#, #a2#", "#HONOR:2175#"};
				{ 4, 44102, "", "=q7=Aged Pauldrons of The Five Thunders", "=ds=#s3#, #a3#", "#HONOR:2175#"};
				{ 5, 44101, "", "=q7=Prized Beastmaster's Mantle", "=ds=#s3#, #a3#", "#HONOR:2175#"};
				{ 6, 44100, "", "=q7=Pristine Lightforge Spaulders", "=ds=#s3#, #a4#", "#HONOR:2175#"};
				{ 7, 44099, "", "=q7=Strengthened Stockade Pauldrons", "=ds=#s3#, #a4#", "#HONOR:2175#"};
				{ 9, 44098, "", "=q7=Inherited Insignia of the Alliance", "=ds=#s14#", "#HONOR:2725#"};
				{ 10, 44097, "", "=q7=Inherited Insignia of the Horde", "=ds=#s14#", "#HONOR:2725#"};
				{ 16, 44091, "", "=q7=Sharpened Scarlet Kris", "=ds=#h1#, #w4#", "#HONOR:2175#"};
				{ 17, 44096, "", "=q7=Battleworn Thrash Blade", "=ds=#h1#, #w10#", "#HONOR:2175#"};
				{ 18, 44092, "", "=q7=Reforged Truesilver Champion", "=ds=#h2#, #w10#", "#HONOR:3500#"};
				{ 19, 44094, "", "=q7=The Blessed Hammer of Grace", "=ds=#h1#, #w6#", "#HONOR:2725#"};
				{ 20, 44095, "", "=q7=Grand Staff of Jordan", "=ds=#w9#", "#HONOR:3500#"};
				{ 21, 44093, "", "=q7=Upgraded Dwarven Hand Cannon", "=ds=#w5#", "#HONOR:3500#"};
				extraText = ": "..AL["PvP Heirlooms"];
			};
		};
		info = {
			name = AL["Heirloom"],
			module = moduleName, menu = "HEIRLOOMMENU",
		};
	}

	AtlasLoot_Data["HeirloomBoAArmor"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..string.format(AL["Level %s"], "85-89"), "=q1="..AL["Mists of Pandaria"]};
				{ 2, 86521, "", "=q3=Lucid Amulet of the Agile Mind", "=ds=#s2#"};
				{ 3, 86525, "", "=q3=Bloodsoaked Chitin Fragment", "=ds=#s14#"};
				{ 4, 89611, "", "=q3=Quilen Statuette", "=ds=#s14#"};
				{ 6, 0, "INV_Box_01", "=q6="..AL["Level 85"], "=q1="..AL["Cataclysm"]};
				{ 7, 64904, "", "=q4=Ring of the Boy Emperor", "=ds=#s13#"};
				{ 8, 64645, "", "=q4=Tyrande's Favorite Doll", "=ds=#s14#"};
				{ 16, 0, "INV_Box_01", "=q6="..string.format(AL["Level %s"], "60-69"), ""};
				{ 17, 64644, "", "=q4=Headdress of the First Shaman", "=ds=#s1#, #a3#"};
				{ 19, 0, "INV_Box_01", "=q6="..string.format(AL["Level %s"], "50-60"), ""};
				{ 20, 64643, "", "=q4=Queen Azshara's Dressing Gown", "=ds=#s5#, #a1#"};
			};
		};
		info = {
			name = AL["Bind on Account Armor"],
			module = moduleName, menu = "HEIRLOOMMENU",
		};
	}

	AtlasLoot_Data["HeirloomBoAWeapons"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Level 90"], "=q1="..AL["Mists of Pandaria"]};
				{ 2, 79340, "", "=q4=Inscribed Crane Staff", "=ds=#w9#"};
				{ 3, 79341, "", "=q4=Inscribed Serpent Staff", "=ds=#w9#"};
				{ 4, 79343, "", "=q4=Inscribed Tiger Staff", "=ds=#w9#"};
				{ 6, 0, "INV_Box_01", "=q6="..string.format(AL["Level %s"], "85-89"), "=q1="..AL["Mists of Pandaria"]};
				{ 7, 85776, "", "=q3=Wodin's Mantid Shanker", "=ds=#h1#, #w4#"};
				{ 8, 86519, "", "=q3=Wind-Reaver's Dagger of Quick Strikes", "=ds=#h1#, #w4#"};
				{ 9, 86527, "", "=q3=Blade of the Poisoned Mind", "=ds=#h1#, #w10#"};
				{ 10, 86199, "", "=q3=Jade Infused Blade", "=ds=#h1#, #w10#"};
				{ 11, 86522, "", "=q3=Blade of the Prime", "=ds=#h1#, #w10#"};
				{ 12, 86523, "", "=q3=Swarming Cleaver of Ka'roz", "=ds=#h2#, #w10#"};
				{ 13, 85777, "", "=q3=Ancient Pandaren Mining Pick", "=ds=#h1#, #w1#"};
				{ 14, 86518, "", "=q3=Yaungol Fire Carrier", "=ds=#h1#, #w6#"};
				{ 15, 86198, "", "=q3=Hammer of Ten Thunders", "=ds=#h2#, #w6#"};
				{ 16, 86124, "", "=q3=Pandaren Fishing Spear", "=ds=#w7#"};
				{ 17, 86394, "", "=q3=Hozen Warrior Spear", "=ds=#w7#"};
				{ 18, 89685, "", "=q3=Spear of Xuen", "=ds=#w7#"};
				{ 19, 88723, "", "=q3=Sturdy Yaungol Spear", "=ds=#w7#"};
				{ 20, 86520, "", "=q3=Malik's Stalwart Spear", "=ds=#w7#"};
				{ 21, 86196, "", "=q3=Ancient Jinyu Staff", "=ds=#w9#"};
				{ 22, 86218, "", "=q3=Staff of the Hidden Master", "=ds=#w9#"};
				{ 23, 86524, "", "=q3=Dissector's Staff of Mutation", "=ds=#w9#"};
				{ 24, 89684, "", "=q3=Umbrella of Chi-Ji", "=ds=#s15#"};
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Level 85"], "=q1="..AL["Cataclysm"]};
				{ 2, 64885, "", "=q4=Scimitar of the Sirocco", "=ds=#h1#, #w10#"};
				{ 3, 64377, "", "=q4=Zin'rokh, Destroyer of Worlds", "=ds=#h2#, #w10#"};
				{ 4, 64880, "", "=q4=Staff of Ammunae", "=ds=#w9#"};
				{ 5, 64489, "", "=q4=Staff of Sorcerer-Thane Thaurissan", "=ds=#w9#"};
				{ 6, 69764, "", "=q4=Extinct Turtle Shell", "=ds=#w8#"};
				{ 16, 0, "INV_Box_01", "=q6="..string.format(AL["Level %s"], "70-79"), ""};
				{ 17, 64460, "", "=q4=Nifflevar Bearded Axe", "=ds=#h1#, #w1#"};
			};
		};
		info = {
			name = AL["Bind on Account Weapons"],
			module = moduleName, menu = "HEIRLOOMMENU",
		};
	}

	AtlasLoot_Data["HeirloomBoAMisc"] = {
		["Normal"] = {
			{
				{ 1, 64881, "", "=q4=Pendant of the Scarab Storm", "=ds="};
				{ 2, 33079, "", "=q3=Murloc Costume", "#ACHIEVEMENTID:412#"};
				{ 4, 92738, "", "=q3=Safari Hat", "=ds=#s1#", "#ACHIEVEMENTID:7499#"};
				{ 6, 86574, "", "=q3=Elixir of Ancient Knowledge", "=ds="};
				{ 16, 69210, "", "=q4=Renowned Guild Tabard", "=ds=#s7#"};
				{ 17, 69209, "", "=q3=Illustrious Guild Tabard", "=ds=#s7#"};
				{ 19, 63517, "", "=q2=Baradin's Wardens Commendation", "=ds=", "#TOLBARAD:10#"};
				{ 20, 63518, "", "=q2=Hellscream's Reach Commendation", "=ds=", "#TOLBARAD:10#"};
			};
		};
		info = {
			name = AL["Bind on Account"], --- Name not final
			module = moduleName, menu = "HEIRLOOMMENU",
		};
	}

		-----------------------
		--- BoE World Epics ---
		-----------------------

	AtlasLoot_Data["WorldEpics90"] = {
		["Normal"] = {
			{
				{ 1, 90580, "", "=q4=Cristof's Crushing Cloak", "=ds=#s4#"};
				{ 2, 90589, "", "=q4=Dirl's Drafty Drape", "=ds=#s4#"};
				{ 3, 90586, "", "=q4=Dory's Pageantry", "=ds=#s4#"};
				{ 4, 90578, "", "=q4=Zom's Rain-Stained Cloak", "=ds=#s4#"};
				{ 5, 90573, "", "=q4=Wang's Unshakable Smile", "=ds=#s1#, #a1#"};
				{ 6, 90587, "", "=q4=Natli's Fireheart Robe", "=ds=#s5#, #a1#"};
				{ 7, 90574, "", "=q4=Etoshia's Elegant Gloves", "=ds=#s9#, #a1#"};
				{ 8, 90588, "", "=q4=Rittsyn's Ruinblasters", "=ds=#s9#, #a1#"};
				{ 9, 90585, "", "=q4=Vulajin's Vicious Breastplate", "=ds=#s5#, #a2#"};
				{ 10, 90572, "", "=q4=Kilt of Pandaren Promises", "=ds=#s11#, #a3#"};
				{ 11, 90570, "", "=q4=Legguards of Sleeting Arrows", "=ds=#s11#, #a3#"};
				{ 12, 87695, "", "=q4=Treads of Edward the Odd", "=ds=#s12#, #a3#"};
				{ 13, 90576, "", "=q4=Spaulders of the Scorned", "=ds=#s3#, #a4#"};
				{ 14, 90577, "", "=q4=Boblet's Bouncing Hauberk", "=ds=#s5#, #a4#"};
				{ 15, 90579, "", "=q4=Legplates of Durable Dreams", "=ds=#s11#, #a4#"};
				{ 16, 90582, "", "=q4=Buc-Zakai Memento", "=ds=#s2#"};
				{ 17, 90583, "", "=q4=Don Guerrero's Glorious Choker", "=ds=#s2#"};
				{ 18, 90590, "", "=q4=Dorian's Necklace of Burgeoning Dreams", "=ds=#s2#"};
				{ 20, 90581, "", "=q4=Jan-Ho's Unwavering Seal", "=ds=#s13#"};
				{ 21, 90584, "", "=q4=Perculia's Peculiar Signet", "=ds=#s13#"};
				{ 22, 90591, "", "=q4=Ring of the Shipwrecked Prince", "=ds=#s13#"};
				{ 24, 90571, "", "=q4=Scroll of Whispered Secrets", "=ds=#s15#"};
				{ 25, 90575, "", "=q4=Sutiru's Brazen Bulwark", "=ds=#w8#"};
			};
			{
				{ 1, 0, "inv_misc_bag_12", "=q6="..ALIL["Big Bag of Arms"].." / "..ALIL["Big Bag of Mysteries"], "=q2="..ALIL["Kah'tir"].." / "..ALIL["Norlaxx"]..", =q1="..ALIL["Dread Wastes"]};
				{ 2, 90721, "", "=q4=Courinth Waterstrider's Silken Finery", "=ds=#s11#, #a1#", "=q2="..ALIL["Cournith Waterstrider"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 3, 90725, "", "=q4=Gaarn's Leggings of Infestation", "=ds=#s11#, #a1#", "=q2="..ALIL["Gaarn the Toxic"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 4, 90720, "", "=q4=Silent Leggings of the Ghostpaw", "=ds=#s11#, #a2#", "=q2="..ALIL["Ruun Ghostpaw"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 5, 90724, "", "=q4=Spriggin's Sproggin' Leggin'", "=ds=#s11#, #a2#", "=q2="..ALIL["Spriggin"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 6, 90723, "", "=q4=Arness's Scaled Leggings", "=ds=#s11#, #a3#", "=q2="..ALIL["Arness the Scale"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 7, 90719, "", "=q4=Go-Kan's Golden Trousers", "=ds=#s11#, #a3#", "=q2="..ALIL["Go-Kan"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 8, 90722, "", "=q4=Torik-Ethis' Gilded Legplates", "=ds=#s11#, #a3#"};
				{ 9, 90717, "", "=q4=Qu'nas' Apocryphal Legplates", "=ds=#s11#, #a4#", "=q2="..ALIL["Qu'nas"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 10, 90718, "", "=q4=Torik-Ethis' Bloodied Legguards", "=ds=#s11#, #a4#", "=q2="..ALIL["Torik-Ethis"]..", =q1="..ALIL["Krasarang Wilds"]};
				{ 11, 87650, "", "=q4=Fishsticker Crossbow", "=ds=#w3#", "=q2="..ALIL["Sarnak"]..", =q1="..ALIL["The Jade Forest"]};
				{ 12, 87641, "", "=q4=Yaungol Battle Barrier", "=ds=#w8#"};
				{ 16, 0, "inv_box_03", "=q6="..ALIL["Vine-Cracked Junkbox"], "=q1=#p28#"};
				{ 17, 88149, "", "=q4=The Gloaming Blade", "=ds=#h1#, #w4#"};
				{ 18, 88150, "", "=q4=Krol Scimitar", "=ds=#h1#, #w10#"};
			};
		};
		info = {
			name = AL["BoE World Epics"].." "..AL["Level 90"],
			module = moduleName, menu = "WORLDEPICS", instance = "WorldEpics",
		};
	}

		----------------------------
		--- Justice Points Items ---
		----------------------------

	AtlasLoot_Data["JusticePointsMoP"] = {
		["Normal"] = {
			{
				{ 2, 89673, "", "=q3=Robe of Eternal Dynasty", "=ds=#s5#, #a1#", "#JUSTICE:2250#"};
				{ 3, 89672, "", "=q3=Robe of Quiet Meditation", "=ds=#s5#, #a1#", "#JUSTICE:2250#"};
				{ 4, 89642, "", "=q3=Bracers of Eternal Resolve", "=ds=#s8#, #a1#", "#JUSTICE:1250#"};
				{ 5, 89643, "", "=q3=Tranquility Bindings", "=ds=#s8#, #a1#", "#JUSTICE:1250#"};
				{ 6, 89650, "", "=q3=Emperor's Riding Gloves", "=ds=#s9#, #a1#", "#JUSTICE:1750#"};
				{ 7, 89651, "", "=q3=Krompf's Fine-Tuning Gloves", "=ds=#s9#, #a1#", "#JUSTICE:1750#"};
				{ 8, 89659, "", "=q3=Leggings of Unfinished Conquest", "=ds=#s11#, #a1#", "#JUSTICE:2250#"};
				{ 9, 89658, "", "=q3=Subversive Leggings", "=ds=#s11#, #a1#", "#JUSTICE:2250#"};
				{ 17, 89667, "", "=q3=Refurbished Zandalari Vestment", "=ds=#s5#, #a2#", "#JUSTICE:2250#"};
				{ 18, 89666, "", "=q3=Vestment of the Ascendant Tribe", "=ds=#s5#, #a2#", "#JUSTICE:2250#"};
				{ 19, 89645, "", "=q3=Cruel Mercy Bracers", "=ds=#s8#, #a2#", "#JUSTICE:1250#"};
				{ 20, 89644, "", "=q3=Sudden Insight Bracers", "=ds=#s8#, #a2#", "#JUSTICE:1250#"};
				{ 21, 89653, "", "=q3=Surehand Grips", "=ds=#s9#, #a2#", "#JUSTICE:1750#"};
				{ 22, 89652, "", "=q3=Wandering Friar's Gloves", "=ds=#s9#, #a2#", "#JUSTICE:1750#"};
				{ 23, 89660, "", "=q3=Brambleguard Leggings", "=ds=#s11#, #a2#", "#JUSTICE:2250#"};
				{ 24, 89661, "", "=q3=Tough Mushanhide Leggings", "=ds=#s11#, #a2#", "#JUSTICE:2250#"};
				extraText = ": "..BabbleInventory["Cloth"].." / "..BabbleInventory["Leather"];
			};
			{
				{ 2, 89668, "", "=q3=Mountain Stream Ringmail", "=ds=#s5#, #a3#", "#JUSTICE:2250#"};
				{ 3, 89669, "", "=q3=Undergrowth Stalker Chestpiece", "=ds=#s5#, #a3#", "#JUSTICE:2250#"};
				{ 4, 89647, "", "=q3=Entombed Traitor's Wristguards", "=ds=#s8#, #a3#", "#JUSTICE:1250#"};
				{ 5, 89646, "", "=q3=Runoff Wristguards", "=ds=#s8#, #a3#", "#JUSTICE:1250#"};
				{ 6, 89655, "", "=q3=Brushcutter's Gloves", "=ds=#s9#, #a3#", "#JUSTICE:1750#"};
				{ 7, 89654, "", "=q3=Gloves of Forgotten Wisdom", "=ds=#s9#, #a3#", "#JUSTICE:1750#"};
				{ 8, 89663, "", "=q3=Leggings of Twisted Vines", "=ds=#s11#, #a3#", "#JUSTICE:2250#"};
				{ 9, 89662, "", "=q3=Snowpack Waders", "=ds=#s11#, #a3#", "#JUSTICE:2250#"};
				{ 17, 89671, "", "=q3=Chestplate of the Stone Lion", "=ds=#s5#, #a4#", "#JUSTICE:2250#"};
				{ 18, 89670, "", "=q3=Inner Serenity Chestplate", "=ds=#s5#, #a4#", "#JUSTICE:2250#"};
				{ 19, 89648, "", "=q3=Bracers of Inner Light", "=ds=#s8#, #a4#", "#JUSTICE:1250#"};
				{ 20, 89649, "", "=q3=Serrated Forearm Guards", "=ds=#s8#, #a4#", "#JUSTICE:1250#"};
				{ 21, 89656, "", "=q3=Gauntlets of Restraint", "=ds=#s9#, #a4#", "#JUSTICE:1750#"};
				{ 22, 89657, "", "=q3=Wall Breaker Gauntlets", "=ds=#s9#, #a4#", "#JUSTICE:1750#"};
				{ 23, 89665, "", "=q3=Leggings of Ponderous Advance", "=ds=#s11#, #a4#", "#JUSTICE:2250#"};
				{ 24, 89664, "", "=q3=Valiant's Shinguards", "=ds=#s11#, #a4#", "#JUSTICE:2250#"};
				extraText = ": "..BabbleInventory["Mail"].." / "..BabbleInventory["Plate"];
			};
			{
				{ 2, 89532, "", "=q3=Bladesong Cloak", "=ds=#s4#", "#JUSTICE:1250#"};
				{ 3, 89533, "", "=q3=Cloak of Ancient Curses", "=ds=#s4#", "#JUSTICE:1250#"};
				{ 4, 89537, "", "=q3=Cloak of the Silent Mountain", "=ds=#s4#", "#JUSTICE:1250#"};
				{ 5, 89534, "", "=q3=Pressed Flower Cloak", "=ds=#s4#", "#JUSTICE:1250#"};
				{ 6, 89535, "", "=q3=Ribracker's Cloak", "=ds=#s4#", "#JUSTICE:1250#"};
				{ 8, 89527, "", "=q3=Amulet of Swirling Mists", "=ds=#s2#", "#JUSTICE:1250#"};
				{ 9, 89531, "", "=q3=Gorget of Usurped Kings", "=ds=#s2#", "#JUSTICE:1250#"};
				{ 10, 89528, "", "=q3=Necklace of Jade Pearls", "=ds=#s2#", "#JUSTICE:1250#"};
				{ 11, 89529, "", "=q3=Pendant of Endless Inquisition", "=ds=#s2#", "#JUSTICE:1250#"};
				{ 12, 89530, "", "=q3=Triumphant Conqueror's Chain", "=ds=#s2#", "#JUSTICE:1250#"};
				{ 17, 89523, "", "=q3=Etched Golden Loop", "=ds=#s13#", "#JUSTICE:1250#"};
				{ 18, 89522, "", "=q3=Mark of the Dancing Crane", "=ds=#s13#", "#JUSTICE:1250#"};
				{ 19, 89526, "", "=q3=Signet of the Slumbering Emperor", "=ds=#s13#", "#JUSTICE:1250#"};
				{ 20, 89524, "", "=q3=Sorcerer-King's Seal", "=ds=#s13#", "#JUSTICE:1250#"};
				{ 21, 89525, "", "=q3=Thunderstone Ring", "=ds=#s13#", "#JUSTICE:1250#"};
				{
					{ 23, 93342, "", "=q3=Dominator's Arcane Badge", "=ds=#s14#", "#JUSTICE:1750#" };
					{ 23, 93347, "", "=q3=Arcane Badge of the Shieldwall", "=ds=#s14#", "#JUSTICE:1750#" };
				};
				{
					{ 24, 93341, "", "=q3=Dominator's Deadeye Badge", "=ds=#s14#", "#JUSTICE:1750#" };
					{ 24, 93346, "", "=q3=Deadeye Badge of the Shieldwall", "=ds=#s14#", "#JUSTICE:1750#" };
				};
				{
					{ 25, 93345, "", "=q3=Dominator's Durable Badge", "=ds=#s14#", "#JUSTICE:1750#" };
					{ 25, 93350, "", "=q3=Durable Badge of the Shieldwall", "=ds=#s14#", "#JUSTICE:1750#" };
				};
				{
					{ 26, 93344, "", "=q3=Dominator's Knightly Badge", "=ds=#s14#", "#JUSTICE:1750#" };
					{ 26, 93349, "", "=q3=Knightly Badge of the Shieldwall", "=ds=#s14#", "#JUSTICE:1750#" };
				};
				{
					{ 27, 93343, "", "=q3=Dominator's Mending Badge", "=ds=#s14#", "#JUSTICE:1750#" };
					{ 27, 93348, "", "=q3=Mending Badge of the Shieldwall", "=ds=#s14#", "#JUSTICE:1750#" };
				};
				{ 28, 89232, "", "=q3=Mogu Rune of Paralysis", "=ds=#s14#", "#JUSTICE:1750#"};
				{ 29, 88995, "", "=q3=Shado-Pan Dragon Gun", "=ds=#s14#", "#JUSTICE:1750#"};
				extraText = ": "..AL["Accessories"];
			};
		};
		info = {
			name = AL["Justice Points"],
			module = moduleName, menu = "JUSTICEPOINTSMENU",
		};
	}

		--------------------------
		--- Valor Points Items ---
		--------------------------

	AtlasLoot_Data["ValorPointsMoP"] = {
		["Normal"] = {
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};

				{
					{ 2, 93330, "", "=q4=Chang's Changing Cord", "=ds=#s10#, #a1#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 2, 93339, "", "=q4=Bon-iy's Unbreakable Cord", "=ds=#s10#, #a1#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 3, 93271, "", "=q4=Beach-Born Sandals", "=ds=#s12#, #a1#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 3, 93280, "", "=q4=Sandals of Oiled Silk", "=ds=#s12#, #a1#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 5, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 6, 89337, "", "=q4=Firecracker Corona", "=ds=#s1#, #a1#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 7, 89340, "", "=q4=Mantle of the Golden Sun", "=ds=#s3#, #a1#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 8, 89433, "", "=q4=Vestments of Thundering Skies", "=ds=#s5#, #a1#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 9, 88893, "", "=q4=Minh's Beaten Bracers", "=ds=#s8#, #a1#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 10, 88742, "", "=q4=Sunspeaker's Flared Gloves", "=ds=#s9#, #a1#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 11, 89062, "", "=q4=Klaxxi Lash of the Orator", "=ds=#s10#, #a1#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 12, 89088, "", "=q4=Leggings of the Poisoned Soul", "=ds=#s11#, #a1#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 13, 88878, "", "=q4=Void Flame Slippers", "=ds=#s12#, #a1#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 16, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 17, 93331, "", "=q4=Sash of Surehandedness", "=ds=#s10#, #a1#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 17, 93340, "", "=q4=Sash of Bouncing Power", "=ds=#s10#, #a1#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 18, 93270, "", "=q4=Slippers of Soothing Balm", "=ds=#s12#, #a1#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 18, 93279, "", "=q4=Shieldwarden Slippers", "=ds=#s12#, #a1#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 20, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 21, 89338, "", "=q4=Yalia's Cowl", "=ds=#s1#, #a1#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 22, 89339, "", "=q4=Tenderheart Shoulders", "=ds=#s3#, #a1#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 23, 89434, "", "=q4=Robe of the Five Sisters", "=ds=#s5#, #a1#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 24, 88892, "", "=q4=Bracers of Inlaid Jade", "=ds=#s8#, #a1#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 25, 88741, "", "=q4=Gloves of Red Feathers", "=ds=#s9#, #a1#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 26, 89063, "", "=q4=Klaxxi Lash of the Seeker", "=ds=#s10#, #a1#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 27, 89087, "", "=q4=Poisoncrafter's Kilt", "=ds=#s11#, #a1#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 28, 88877, "", "=q4=Storm-Sing Sandals", "=ds=#s12#, #a1#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				extraText = ": "..BabbleInventory["Cloth"];
			};
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 2, 93328, "", "=q4=Prevenge's Dagger-Carrier", "=ds=#s10#, #a2#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 2, 93337, "", "=q4=Prevenge's Swashbuckling Cinch", "=ds=#s10#, #a2#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 3, 93269, "", "=q4=Troll-Toe Tabi", "=ds=#s12#, #a2#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 3, 93278, "", "=q4=Crab-Leather Tabi", "=ds=#s12#, #a2#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 5, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 6, 89300, "", "=q4=Red Smoke Bandana", "=ds=#s1#, #a2#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 7, 89341, "", "=q4=Imperion Spaulders", "=ds=#s3#, #a2#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 8, 89431, "", "=q4=Softfoot Silentwrap", "=ds=#s5#, #a2#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 9, 88884, "", "=q4=Quillpaw Family Bracers", "=ds=#s8#, #a2#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 10, 88744, "", "=q4=Fingers of the Loneliest Monk", "=ds=#s9#, #a2#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 11, 89060, "", "=q4=Klaxxi Lash of the Borrower", "=ds=#s10#, #a2#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 12, 89090, "", "=q4=Dreadsworn Slayer Legs", "=ds=#s11#, #a2#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 13, 88868, "", "=q4=Tukka-Tuk's Hairy Boots", "=ds=#s12#, #a2#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 16, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 17, 93329, "", "=q4=Bambrick's Striking Strap", "=ds=#s10#, #a2#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 17, 93338, "", "=q4=Soothing Straps", "=ds=#s10#, #a2#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 18, 93268, "", "=q4=Treads of Rejuvenating Mists", "=ds=#s12#, #a2#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 18, 93277, "", "=q4=Statue Summoner's Treads", "=ds=#s12#, #a2#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 20, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 21, 89308, "", "=q4=Snowdrift Helm", "=ds=#s1#, #a2#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 22, 89342, "", "=q4=Whitepetal Shouldergarb", "=ds=#s3#, #a2#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 23, 89432, "", "=q4=Mistfall Robes", "=ds=#s5#, #a2#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 24, 88885, "", "=q4=Clever Ashyo's Armbands", "=ds=#s8#, #a2#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 25, 88743, "", "=q4=Ogo's Elder Gloves", "=ds=#s9#, #a2#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 26, 89061, "", "=q4=Klaxxi Lash of the Harbinger", "=ds=#s10#, #a2#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 27, 89089, "", "=q4=Wind-Reaver Greaves", "=ds=#s11#, #a2#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 28, 88876, "", "=q4=Boots of the High Adept", "=ds=#s12#, #a2#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				extraText = ": "..BabbleInventory["Leather"];
			};
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 2, 93326, "", "=q4=Shigi's Chain of Cheerful Summons", "=ds=#s10#, #a3#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 2, 93335, "", "=q4=Chain of Flaming Arrows", "=ds=#s10#, #a3#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 3, 93267, "", "=q4=Greaves of Manifest Destiny", "=ds=#s12#, #a3#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 3, 93276, "", "=q4=Odlaw's Everwalkers", "=ds=#s12#, #a3#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 5, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 6, 89291, "", "=q4=Hawkmaster's Headguard", "=ds=#s1#, #a3#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 7, 89344, "", "=q4=Windwalker Spaulders", "=ds=#s3#, #a3#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 8, 89430, "", "=q4=Breastplate of the Golden Pagoda", "=ds=#s5#, #a3#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 9, 88882, "", "=q4=Tiger-Striped Wristguards", "=ds=#s8#, #a3#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 10, 88745, "", "=q4=Sentinel Commander's Gauntlets", "=ds=#s9#, #a3#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 11, 89058, "", "=q4=Klaxxi Lash of the Winnower", "=ds=#s10#, #a3#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 12, 89092, "", "=q4=Locust Swarm Legguards", "=ds=#s11#, #a3#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 13, 88866, "", "=q4=Steps of the War Serpent", "=ds=#s12#, #a3#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 16, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 17, 93327, "", "=q4=Bloodbinder Links", "=ds=#s10#, #a3#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 17, 93336, "", "=q4=Links of Bonded Blood", "=ds=#s10#, #a3#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 18, 93266, "", "=q4=Boots of the Healing Stream", "=ds=#s12#, #a3#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 18, 93275, "", "=q4=Totem-Binder Boots", "=ds=#s12#, #a3#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 20, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 21, 89296, "", "=q4=Nightwatcher's Helm", "=ds=#s1#, #a3#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 22, 89343, "", "=q4=Mindbender Shoulders", "=ds=#s3#, #a3#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 23, 89429, "", "=q4=Robes of the Setting Sun", "=ds=#s5#, #a3#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 24, 88883, "", "=q4=Brewmaster Chani's Bracers", "=ds=#s8#, #a3#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 25, 88748, "", "=q4=Ravenmane's Gloves", "=ds=#s9#, #a3#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 26, 89059, "", "=q4=Klaxxi Lash of the Precursor", "=ds=#s10#, #a3#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 27, 89091, "", "=q4=Swarmkeeper's Leggings", "=ds=#s11#, #a3#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 28, 88867, "", "=q4=Sandals of the Elder Sage", "=ds=#s12#, #a3#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				extraText = ": "..BabbleInventory["Mail"];
			};
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 2, 93323, "", "=q4=Kwon's Crushing Girdle", "=ds=#s10#, #a4#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 2, 93332, "", "=q4=Girdle of Crushing Strength", "=ds=#s10#, #a4#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 3, 93264, "", "=q4=Cragchewer Sollerets", "=ds=#s12#, #a4#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 3, 93273, "", "=q4=Sea-Soaked Sollerets", "=ds=#s12#, #a4#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 5, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 6, 89280, "", "=q4=Voice Amplyifying Greathelm", "=ds=#s1#, #a4#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 7, 89345, "", "=q4=Stonetoe Spaulders", "=ds=#s3#, #a4#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 8, 89420, "", "=q4=Dawnblade's Chestguard", "=ds=#s5#, #a4#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 9, 88879, "", "=q4=Braided Black and White Bracer", "=ds=#s8#, #a4#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 10, 88747, "", "=q4=Streetfighter's Iron Knuckles", "=ds=#s9#, #a4#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 11, 89055, "", "=q4=Klaxxi Lash of the Rescinder", "=ds=#s10#, #a4#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 12, 89095, "", "=q4=Legguards of the Unscathed", "=ds=#s11#, #a4#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 13, 88862, "", "=q4=Tankiss Warstompers", "=ds=#s12#, #a4#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 16, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 17, 93324, "", "=q4=Immovable Waistplate", "=ds=#s10#, #a4#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 17, 93333, "", "=q4=Waistplate of Immobility", "=ds=#s10#, #a4#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 18, 93263, "", "=q4=Groundbreaker Sabatons", "=ds=#s12#, #a4#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 18, 93272, "", "=q4=Sabatons of the Sullied Shore", "=ds=#s12#, #a4#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 20, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 21, 89216, "", "=q4=Yi's Least Favorite Helmet", "=ds=#s1#, #a4#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 22, 89346, "", "=q4=Shoulders of Autumnlight", "=ds=#s3#, #a4#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 23, 89421, "", "=q4=Cuirass of the Twin Monoliths", "=ds=#s5#, #a4#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 24, 88880, "", "=q4=Battle Shadow Bracers", "=ds=#s8#, #a4#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 25, 88746, "", "=q4=Gloves of the Overwhelming Swarm", "=ds=#s9#, #a4#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 26, 89056, "", "=q4=Klaxxi Lash of the Consumer", "=ds=#s10#, #a4#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 27, 89093, "", "=q4=Kovok's Riven Legguards", "=ds=#s11#, #a4#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 28, 88864, "", "=q4=Yu'lon Guardian Boots", "=ds=#s12#, #a4#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				extraText = ": "..BabbleInventory["Plate"];
			};
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 2, 93325, "", "=q4=Divide's Greatheart Clasp", "=ds=#s10#, #a4#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 2, 93334, "", "=q4=Divide's Loyal Clasp", "=ds=#s10#, #a4#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 3, 93265, "", "=q4=Scar Swallower Greatboots", "=ds=#s12#, #a4#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 3, 93274, "", "=q4=Greatboots of Flashing Light", "=ds=#s12#, #a4#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 5, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 6, 89096, "", "=q4=Six Pool's Open Helm", "=ds=#s1#, #a4#", "#VALOR:1125#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 7, 89347, "", "=q4=Paleblade Shoulderguards", "=ds=#s3#, #a4#", "#VALOR:875#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 8, 89423, "", "=q4=Battleguard of Guo-Lai", "=ds=#s5#, #a4#", "#VALOR:1125#"..ALIL["Golden Lotus"].." - "..AL["Revered"] },
				{ 9, 88881, "", "=q4=Fallen Sentinel Bracers", "=ds=#s8#, #a4#", "#VALOR:625#"..ALIL["The August Celestials"].." - "..AL["Honored"] },
				{ 10, 88749, "", "=q4=Gauntlets of Jade Sutras", "=ds=#s9#, #a4#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				{ 11, 89057, "", "=q4=Klaxxi Lash of the Doubter", "=ds=#s10#, #a4#", "#VALOR:875#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 12, 89094, "", "=q4=Ambersmith Legplates", "=ds=#s11#, #a4#", "#VALOR:1125#"..ALIL["The Klaxxi"].." - "..AL["Revered"] },
				{ 13, 88865, "", "=q4=Bramblestaff Boots", "=ds=#s12#, #a4#", "#VALOR:875#"..ALIL["The August Celestials"].." - "..AL["Revered"] },
				extraText = ": "..BabbleInventory["Plate"];
			};
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 2, 89076, "", "=q4=Blackguard Cape", "=ds=#s4#", "#VALOR:625#"..ALIL["Shado-Pan"].." - "..AL["Honored"] },
				{ 3, 89077, "", "=q4=Cloak of Snow Blossoms", "=ds=#s4#", "#VALOR:625#"..ALIL["Shado-Pan"].." - "..AL["Honored"] },
				{ 4, 89074, "", "=q4=Cloak of the Dark Disciple", "=ds=#s4#", "#VALOR:625#"..ALIL["Shado-Pan"].." - "..AL["Honored"] },
				{ 5, 89078, "", "=q4=Sagewhisper's Wrap", "=ds=#s4#", "#VALOR:625#"..ALIL["Shado-Pan"].." - "..AL["Honored"] },
				{ 6, 89075, "", "=q4=Yi's Cloak of Courage", "=ds=#s4#", "#VALOR:625#"..ALIL["Shado-Pan"].." - "..AL["Honored"] },
				{ 16, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 17, 89065, "", "=q4=Choker of the Klaxxi'va", "=ds=#s2#", "#VALOR:625#"..ALIL["The Klaxxi"].." - "..AL["Honored"] },
				{ 18, 89064, "", "=q4=Bloodseeker's Solitaire", "=ds=#s2#", "#VALOR:625#"..ALIL["The Klaxxi"].." - "..AL["Honored"] },
				{ 19, 89067, "", "=q4=Links of the Lucid", "=ds=#s2#", "#VALOR:625#"..ALIL["The Klaxxi"].." - "..AL["Honored"] },
				{ 20, 89066, "", "=q4=Paragon's Pale Pendant", "=ds=#s2#", "#VALOR:625#"..ALIL["The Klaxxi"].." - "..AL["Honored"] },
				{ 21, 89068, "", "=q4=Wire of the Wakener", "=ds=#s2#", "#VALOR:625#"..ALIL["The Klaxxi"].." - "..AL["Honored"] },
				extraText = ": "..AL["Accessories"]..": "..BabbleInventory["Back"].." / "..BabbleInventory["Neck"];
			};
			{
				{ 1, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 2, 93249, "", "=q4=Dominator's Band", "=ds=#s13#", "#VALOR:937#"..ALIL["Dominance Offensive"].." - "..AL["Honored"] };
					{ 2, 93244, "", "=q4=Band of the Shieldwall", "=ds=#s13#", "#VALOR:937#"..ALIL["Operation: Shieldwall"].." - "..AL["Honored"] };
				};
				{
					{ 3, 93251, "", "=q4=Dominator's Circle", "=ds=#s13#", "#VALOR:937#"..ALIL["Dominance Offensive"].." - "..AL["Honored"] };
					{ 3, 93246, "", "=q4=Circle of the Shieldwall", "=ds=#s13#", "#VALOR:937#"..ALIL["Operation: Shieldwall"].." - "..AL["Honored"] };
				};
				{
					{ 4, 93250, "", "=q4=Dominator's Loop", "=ds=#s13#", "#VALOR:937#"..ALIL["Dominance Offensive"].." - "..AL["Honored"] };
					{ 4, 93245, "", "=q4=Loop of the Shieldwall", "=ds=#s13#", "#VALOR:937#"..ALIL["Operation: Shieldwall"].." - "..AL["Honored"] };
				};
				{
					{ 5, 93252, "", "=q4=Dominator's Seal", "=ds=#s13#", "#VALOR:937#"..ALIL["Dominance Offensive"].." - "..AL["Honored"] };
					{ 5, 93247, "", "=q4=Seal of the Shieldwall", "=ds=#s13#", "#VALOR:937#"..ALIL["Operation: Shieldwall"].." - "..AL["Honored"] };
				};
				{
					{ 6, 93248, "", "=q4=Dominator's Signet", "=ds=#s13#", "#VALOR:937#"..ALIL["Dominance Offensive"].." - "..AL["Honored"] };
					{ 6, 93243, "", "=q4=Signet of the Shieldwall", "=ds=#s13#", "#VALOR:937#"..ALIL["Operation: Shieldwall"].." - "..AL["Honored"] };
				};
				{ 8, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 9, 89070, "", "=q4=Anji's Keepsake", "=ds=#s13#", "#VALOR:625#"..ALIL["Golden Lotus"].." - "..AL["Honored"] },
				{ 10, 89071, "", "=q4=Alani's Inflexible Ring", "=ds=#s13#", "#VALOR:625#"..ALIL["Golden Lotus"].." - "..AL["Honored"] },
				{ 11, 89073, "", "=q4=Leven's Circle of Hope", "=ds=#s13#", "#VALOR:625#"..ALIL["Golden Lotus"].." - "..AL["Honored"] },
				{ 12, 89069, "", "=q4=Ring of the Golden Stair", "=ds=#s13#", "#VALOR:625#"..ALIL["Golden Lotus"].." - "..AL["Honored"] },
				{ 13, 89072, "", "=q4=Simple Harmonius Ring", "=ds=#s13#", "#VALOR:625#"..ALIL["Golden Lotus"].." - "..AL["Honored"] },
				{ 16, 0, "pvecurrency-valor", "=ds="..AL["ilvl 496"], ""};
				{
					{ 17, 93255, "", "=q4=Cutstitcher Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 17, 93258, "", "=q4=Arrowflight Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 18, 93257, "", "=q4=Medallion of Mystifying Vapors", "=ds=#s14#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 18, 93260, "", "=q4=Heartwarmer Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 19, 93256, "", "=q4=Skullrender Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 19, 93261, "", "=q4=Helmbreaker Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 20, 93254, "", "=q4=Static-Caster's Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 20, 93259, "", "=q4=Shock-Charger Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{
					{ 21, 93253, "", "=q4=Woundripper Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Dominance Offensive"].." - "..AL["Revered"] };
					{ 21, 93262, "", "=q4=Vaporshield Medallion", "=ds=#s14#", "#VALOR:1312#"..ALIL["Operation: Shieldwall"].." - "..AL["Revered"] };
				};
				{ 23, 0, "pvecurrency-valor", "=ds="..AL["ilvl 489"], ""};
				{ 24, 89081, "", "=q4=Blossom of Pure Snow", "=ds=#s14#", "#VALOR:875#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 25, 89082, "", "=q4=Hawkmaster's Talon", "=ds=#s14#", "#VALOR:875#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 26, 89083, "", "=q4=Iron Belly Wok", "=ds=#s14#", "#VALOR:875#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 27, 89079, "", "=q4=Lao-Chin's Liquid Courage", "=ds=#s14#", "#VALOR:875#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				{ 28, 89080, "", "=q4=Scroll of Revered Ancestors", "=ds=#s14#", "#VALOR:875#"..ALIL["Shado-Pan"].." - "..AL["Revered"] },
				extraText = ": "..AL["Accessories"]..": "..BabbleInventory["Ring"].." / "..BabbleInventory["Trinket"];
			};
		};
		info = {
			name = AL["Valor Points"],
			module = moduleName, menu = "VPMOPMENU",
		};
	}