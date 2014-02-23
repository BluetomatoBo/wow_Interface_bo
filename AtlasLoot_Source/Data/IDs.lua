local L = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot_Source"); 
--local BabbleItemSet = AtlasLoot_Source_GetLocaleLibBabble("LibBabble-ItemSet-3.0")
local BabbleBoss = AtlasLoot_Source_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleFaction = AtlasLoot_Source_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_Source_GetLocaleLibBabble("LibBabble-Zone-3.0")

AtlasLoot_Source_ID = {
	[0] = "?",
	[9] = "",
	[260] = BabbleZone["Icecrown Citadel"],
	[256] = BabbleBoss["Zevrim Thornhoof"],
	[374] = BabbleBoss["Loatheb"],
	[342] = AtlasLoot_Source:EJ_GetBossName("Jin'do the Godbreaker", 185),
	[616] = AtlasLoot_Source:EJ_GetBossName("Setesh", 129),
	[387] = BabbleBoss["Mimiron"],
	[567] = BabbleBoss["Guard Slip'kik"],
	[459] = BabbleBoss["The Eredar Twins"],
	[767] = BabbleBoss["Void Reaver"],
	[542] = L["Azure Templar"],
	[206] = BabbleBoss["Pusillin"],
	[156] = BabbleZone["Stratholme"].." - "..L["The Gauntlet"],
	[122] = BabbleZone["Throne of the Tides"],
	[65] = L["Love is in the Air"],
	[158] = BabbleZone["Scarlet Monastery"]..": "..BabbleZone["Armory"],
	[13] = BabbleFaction["Wintersaber Trainers"],
	[176] = BabbleZone["Vault of Archavon"],
	[264] = AtlasLoot_Source:EJ_GetBossName("Altairus", 115),
	[461] = BabbleBoss["Pathaleon the Calculator"],
	[520] = BabbleBoss["Falric"],
	[218] = BabbleBoss["Death Speaker Jargba"],
	[350] = AtlasLoot_Source:EJ_GetBossName("Lord Walden", 99),
	[178] = BabbleZone["Firelands"],
	[246] = BabbleZone["Blackrock Caverns"],
	[622] = AtlasLoot_Source:EJ_GetBossName("Slabhide", 111),
	[147] = BabbleBoss["Kael'thas Sunstrider"],
	[425] = BabbleBoss["Terestian Illhoof"],
	[80] = BabbleZone["Alterac Valley"],
	[625] = "Black Guard Swordsmith#B# (Summon#L#)",
	[680] = BabbleBoss["Al'ar"],
	[137] = L["Summoner's Tomb"],
	[628] = AtlasLoot_Source:EJ_GetBossName("Baleroc, the Gatekeeper", 196),
	[487] = BabbleBoss["Yor"],
	[486] = BabbleBoss["Krick and Ick"],
	[598] = BabbleBoss["High Warlord Naj'entus"],
	[403] = "Crystal Fang#B# (Rare#L#)",
	[244] = BabbleBoss["Mekgineer Thermaplugg"],
	[610] = AtlasLoot_Source:EJ_GetBossName("Yor'sahj the Unsleeping", 325),
	[128] = L["Ring of Law"],
	[368] = BabbleBoss["Willey Hopebreaker"],
	[69] = L["Loot Card Item (TCG)"],
	[692] = BabbleBoss["General Angerforge"],
	[652] = BabbleBoss["Reliquary of Souls"],
	[326] = BabbleZone["The Oculus"],
	[337] = BabbleBoss["The Black Stalker"],
	[397] = BabbleBoss["Shirrak the Dead Watcher"],
	[313] = AtlasLoot_Source:EJ_GetBossName("Beauty", 108),
	[417] = AtlasLoot_Source:EJ_GetBossName("Arcurion", 322),
	[261] = BabbleBoss["Festergut"],
	[687] = AtlasLoot_Source:EJ_GetBossName("Zanzil", 184),
	[594] = BabbleBoss["Volkhan"],
	[419] = BabbleBoss["Lorekeeper Polkelt"],
	[320] = BabbleBoss["Grandmaster Vorpil"],
	[405] = BabbleBoss["The Twin Emperors"],
	[223] = BabbleBoss["Charlga Razorflank"],
	[549] = L["Lunar Festival Fireworks Pack"],
	[447] = AtlasLoot_Source:EJ_GetBossName("Spine of Deathwing", 318),
	[627] = BabbleBoss["Skul"],
	[726] = BabbleBoss["Buru the Gorger"],
	[443] = BabbleBoss["Hydrospawn"],
	[433] = BabbleBoss["Nerub'enkan"],
	[51] = BabbleBoss["Dustwraith"].." ("..L["Rare"]..")",
	[82] = BabbleFaction["Sporeggar"],
	[535] = AtlasLoot_Source:EJ_GetBossName("Beth'tilac", 192),
	[600] = BabbleBoss["Baron Geddon"],
	[382] = BabbleBoss["Magtheridon"],
	[424] = BabbleBoss["General Bjarngrim"],
	[512] = L["First Prize"],
	[457] = BabbleBoss["Sjonnir The Ironshaper"],
	[769] = BabbleBoss["Baroness Anastari"],
	[518] = BabbleBoss["Ouro"],
	[184] = AtlasLoot_Source:EJ_GetBossName("High Prophet Barim", 119),
	[519] = AtlasLoot_Source:EJ_GetBossName("Commander Springvale", 98),
	[420] = BabbleZone["The Stockade"],
	[283] = "Commander Kolurg#B# / Commander Stoutbeard#B#",
	[355] = AtlasLoot_Source:EJ_GetBossName("High Priestess Azil", 113),
	[153] = BabbleBoss["Taragaman the Hungerer"],
	[107] = BabbleZone["Ulduar"],
	[183] = BabbleZone["Lost City of the Tol'vir"],
	[250] = L["Phase 1"],
	[768] = AtlasLoot_Source:EJ_GetBossName("Queen Azshara", 291),
	[239] = BabbleBoss["Grubbis"],
	[164] = BabbleZone["Grim Batol"],
	[489] = L["Avatar of the Martyred"],
	[268] = BabbleBoss["Krystallus"],
	[109] = BabbleZone["Dire Maul (West)"],
	[309] = BabbleBoss["Mutanus the Devourer"],
	[213] = BabbleBoss["Ironspine"],
	[74] = BabbleFaction["The Violet Eye"],
	[155] = BabbleBoss["Bazzalan"],
	[469] = BabbleBoss["Gyth"],
	[709] = AtlasLoot_Source:EJ_GetBossName("Earthrager Ptah", 125),
	[409] = BabbleBoss["Leotheras the Blind"],
	[70] = L["Day of the Dead"],
	[413] = BabbleBoss["General Vezax"],
	[378] = "Bannok Grimaxe#B# (Rare#L#)",
	[312] = AtlasLoot_Source:EJ_GetBossName("Halazzi", 189),
	[388] = BabbleZone["Scarlet Monastery"]..": "..BabbleZone["Cathedral"],
	[192] = "Rare Mounts#L#: Dungeon#L# / Outdoor#L#",
	[39] = L["Level 85"],
	[385] = BabbleBoss["Gortok Palehoof"],
	[53] = BabbleFaction["Timbermaw Hold"],
	[331] = BabbleBoss["Auriaya"],
	[59] = L["Harvest Festival"],
	[505] = BabbleBoss["High Botanist Freywinn"],
	[45] = L["Skettis"],
	[665] = BabbleBoss["Avatar of Hakkar"],
	[513] = L["Rare Fish"],
	[237] = BabbleBoss["Broggok"],
	[66] = BabbleZone["Hellfire Peninsula"],
	[357] = BabbleBoss["Shade of Aran"],
	[343] = BabbleBoss["The Ravenian"],
	[72] = BabbleFaction["Argent Dawn"],
	[167] = BabbleZone["Molten Core"],
	[476] = L["The Cache of Madness"],
	[14] = BabbleZone["Sethekk Halls"],
	[285] = BabbleBoss["The Lurker Below"],
	[740] = BabbleBoss["Aku'mai"],
	[434] = BabbleBoss["Yogg-Saron"],
	[311] = BabbleBoss["Deviate Faerie Dragon"],
	[273] = BabbleZone["End Time"],
	[57] = "Hazzik's Package",
	[124] = BabbleZone["The Eye"],
	[406] = BabbleZone["Hellfire Ramparts"],
	[612] = BabbleBoss["Lord Aurius Rivendare"],
	[496] = AtlasLoot_Source:EJ_GetBossName("Lord Godfrey", 100),
	[452] = BabbleBoss["Archavon the Stone Watcher"],
	[10] = BabbleZone["Auchenai Crypts"],
	[703] = AtlasLoot_Source:EJ_GetBossName("Ozruk", 112),
	[314] = BabbleZone["Blackrock Mountain"],
	[744] = BabbleBoss["Fras Siabi"],
	[298] = BabbleBoss["Hungarfen"],
	[308] = BabbleBoss["Verdan the Everliving"],
	[695] = BabbleBoss["The Twin Val'kyr"],
	[282] = BabbleBoss["Mennu the Betrayer"],
	[302] = BabbleBoss["Boahn"],
	[287] = BabbleBoss["Halion"],
	[448] = BabbleZone["The Steamvault"],
	[95] = "Warsong Gulch#B# Rewards#L#",
	[11] = L["Feast of Winter Veil"],
	[32] = "2011",
	[225] = BabbleBoss["Lady Vashj"],
	[436] = BabbleBoss["Pandemonius"],
	[199] = BabbleZone["Halls of Lightning"],
	[125] = BabbleBoss["High Astromancer Solarian"],
	[548] = BabbleBoss["Ahune"],
	[48] = BabbleFaction["Thorium Brotherhood"],
	[209] = BabbleBoss["Guard Fengus"],
	[108] = BabbleBoss["Kologarn"],
	[570] = AtlasLoot_Source:EJ_GetBossName("Lockmaw", 118),
	[371] = BabbleZone["Utgarde Pinnacle"],
	[711] = BabbleZone["Maraudon"],
	[717] = BabbleBoss["Celebras the Cursed"],
	[365] = BabbleBoss["Lord Roccor"],
	[494] = BabbleBoss["Ragnaros"],
	[335] = BabbleBoss["Sartharion"],
	[329] = BabbleBoss["Cyanigosa"],
	[375] = BabbleBoss["Ignis the Furnace Master"],
	[94] = BabbleBoss["Moragg"],
	[752] = BabbleBoss["Selin Fireheart"],
	[427] = BabbleBoss["Grand Magus Telestra"],
	[725] = BabbleBoss["Omor the Unscarred"],
	[396] = BabbleBoss["Prince Malchezaar"],
	[18] = BabbleZone["Mana-Tombs"],
	[104] = L["Trash Mobs"],
	[201] = BabbleZone["Old Hillsbrad Foothills"],
	[28] = L["Master Elemental Shaper Krixix"],
	[288] = L["Bash'ir Landing Stasis Chambers"],
	[90] = BabbleBoss["Trollgore"],
	[58] = L["Vakkiz the Windrager"],
	[501] = AtlasLoot_Source:EJ_GetBossName("Foe Reaper 5000", 91),
	[159] = BabbleBoss["Herod"],
	[607] = BabbleBoss["Herald Volazj"],
	[77] = BabbleFaction["The Scale of the Sands"],
	[181] = BabbleBoss["Gluth"],
	[478] = BabbleBoss["Timmy the Cruel"],
	[333] = BabbleBoss["Rattlegore"],
	[62] = L["Level 50-60"],
	[33] = L["Winter Veil Gift"].." (2010)",
	[271] = AtlasLoot_Source:EJ_GetBossName("High Priestess Kilnara", 181),
	[193] = "Zul'Aman#B# ",
	[604] = BabbleBoss["Valithria Dreamwalker"],
	[621] = BabbleBoss["The Prophet Tharon'ja"],
	[690] = BabbleBoss["Temporus"],
	[129] = BabbleZone["Karazhan"],
	[266] = BabbleBoss["Hydromancer Velratha"],
	[544] = L["Earthen Templar"],
	[470] = BabbleBoss["Maiden of Virtue"],
	[269] = BabbleBoss["War Master Voone"],
	[650] = BabbleBoss["Aeonus"],
	[16] = BabbleZone["Temple of Ahn'Qiraj"],
	[670] = BabbleBoss["Tuten'kash"],
	[207] = BabbleZone["Dire Maul (North)"],
	[685] = BabbleBoss["Opera Event"],
	[131] = BabbleBoss["Fankriss the Unyielding"],
	[679] = BabbleBoss["Ionar"],
	[386] = AtlasLoot_Source:EJ_GetBossName("Jan'alai", 188),
	[61] = L["Gezzarak the Huntress"],
	[590] = BabbleBoss["Obsidian Sentinel"],
	[19] = BabbleFaction["The Defilers"],
	[73] = BabbleFaction["Bloodsail Buccaneers"],
	[639] = BabbleBoss["Bael'Gar"],
	[624] = BabbleBoss["Ramstein the Gorger"],
	[212] = BabbleBoss["Bloodmage Thalnos"],
	[318] = "Spirestone Lord Magus#B# (Rare#L#)",
	[632] = BabbleBoss["Dalliah the Doomsayer"],
	[205] = BabbleZone["Dire Maul (East)"],
	[731] = BabbleBoss["Magmus"],
	[305] = BabbleBoss["Lord Cobrahn"],
	[148] = BabbleZone["The Slave Pens"],
	[145] = L["Carefully Wrapped Present"],
	[189] = AtlasLoot_Source:EJ_GetBossName("Admiral Ripsnarl", 92),
	[86] = BabbleBoss["Warchief Kargath Bladefist"],
	[50] = BabbleZone["Zul'Farrak"],
	[479] = BabbleZone["Throne of the Four Winds"],
	[112] = BabbleBoss["Thaddius"],
	[453] = BabbleBoss["Mekgineer Steamrigger"],
	[582] = AtlasLoot_Source:EJ_GetBossName("Baron Ashbury", 96),
	[27] = BabbleZone["Blackwing Lair"],
	[664] = BabbleBoss["Halycon"],
	[593] = BabbleBoss["Sapphiron"],
	[41] = BabbleZone["Scarlet Monastery"],
	[165] = "Drahga Shadowburner#EJ# & Valiona#B#",
	[190] = BabbleBoss["Illidan Stormrage"],
	[651] = BabbleBoss["Instructor Razuvious"],
	[208] = BabbleBoss["Guard Mol'dar"],
	[36] = L["Fishing Contests"],
	[294] = AtlasLoot_Source:EJ_GetBossName("Erudax", 134),
	[110] = BabbleBoss["Magister Kalendris"],
	[430] = BabbleBoss["Marwyn"],
	[472] = BabbleBoss["Meathook"],
	[482] = BabbleBoss["Eck the Ferocious"],
	[673] = BabbleBoss["Glutton"],
	[303] = BabbleBoss["Lady Anacondra"],
	[497] = BabbleBoss["Warbringer O'mrogg"],
	[21] = L["Brewfest"],
	[31] = BabbleFaction["Friendly"],
	[118] = BabbleBoss["Kalecgos"],
	[565] = L["Shared Boss Loot"],
	[224] = BabbleBoss["Earthcaller Halmgar"],
	[460] = "Spirestone Butcher#B# (Rare#L#)",
	[144] = L["Gently Shaken Gift"],
	[286] = BabbleZone["The Ruby Sanctum"],
	[715] = BabbleBoss["Meshlok the Harvester"],
	[168] = BabbleBoss["Magmadar"],
	[292] = L["Matron Li-sahar"],
	[463] = L["BT Patterns/Plans"],
	[555] = BabbleBoss["Netherspite"],
	[324] = "Jed Runewatcher#B# (Rare#L#)",
	[411] = BabbleBoss["Warp Splinter"],
	[556] = BabbleBoss["Emperor Dagran Thaurissan"],
	[163] = BabbleBoss["Moam"],
	[394] = BabbleZone["Pit of Saron"],
	[56] = L["Argent Tournament"],
	[418] = BabbleBoss["The Tribunal of Ages"],
	[319] = BabbleBoss["Sulfuron Harbinger"],
	[579] = BabbleBoss["Magistrate Barthilas"],
	[300] = BabbleZone["Wailing Caverns"],
	[526] = BabbleBoss["Ambassador Flamelash"],
	[20] = BabbleFaction["The League of Arathor"],
	[766] = BabbleBoss["Keristrasza"],
	[351] = BabbleBoss["Flamegor"],
	[360] = BabbleBoss["Balnazzar"],
	[491] = BabbleBoss["Rotface"],
	[182] = AtlasLoot_Source:EJ_GetBossName("Rajh", 130),
	[258] = BabbleBoss["Maiden of Grief"],
	[383] = BabbleZone["Well of Eternity"],
	[765] = AtlasLoot_Source:EJ_GetBossName("Ammunae", 128),
	[445] = AtlasLoot_Source:EJ_GetBossName("General Umbriss", 131),
	[240] = BabbleBoss["Viscous Fallout"],
	[381] = BabbleZone["Magtheridon's Lair"],
	[321] = BabbleBoss["Ironaya"],
	[614] = BabbleBoss["Malygos"],
	[569] = BabbleBoss["Laj"],
	[762] = BabbleBoss["Kil'jaeden"],
	[46] = L["Karrog"],
	[450] = "Tsu'zee#B# (Rare#L#)",
	[760] = BabbleBoss["High Interrogator Gerstahn"],
	[339] = BabbleBoss["Salramm the Fleshcrafter"],
	[759] = BabbleBoss["Moroes"],
	[508] = BabbleBoss["Prince Keleseth"],
	[44] = L["Level 30-39"],
	[722] = AtlasLoot_Source:EJ_GetBossName("Archbishop Benedictus", 341),
	[734] = BabbleBoss["Ghamoo-ra"],
	[757] = BabbleBoss["Koralon the Flame Watcher"],
	[756] = BabbleBoss["Flame Leviathan"],
	[737] = BabbleBoss["Baron Aquanis"],
	[732] = BabbleBoss["Vazruden"],
	[623] = BabbleBoss["Blood Steward of Kirtonos"],
	[446] = BabbleBoss["Lord Jaraxxus"],
	[754] = BabbleBoss["Argent Confessor Paletress"],
	[753] = AtlasLoot_Source:EJ_GetBossName("Warlord Zon'ozz", 324),
	[407] = BabbleBoss["Watchkeeper Gargolmar"],
	[750] = BabbleBoss["Firemaw"],
	[749] = BabbleBoss["Tendris Warpwood"],
	[390] = BabbleBoss["Scarlet Commander Mograine"],
	[591] = BabbleBoss["Pyroguard Emberseer"],
	[289] = L["Trelopades"],
	[747] = BabbleBoss["Olaf"],
	[188] = BabbleZone["The Deadmines"],
	[746] = BabbleBoss["Eric \"The Swift\""],
	[608] = BabbleBoss["Battleguard Sartura"],
	[743] = AtlasLoot_Source:EJ_GetBossName("Murozond", 289),
	[160] = L["Scarlet Trainee"],
	[63] = "Talonpriest Ishaal",
	[171] = BabbleZone["Upper Blackrock Spire"],
	[702] = BabbleBoss["General Drakkisath"],
	[438] = BabbleBoss["Hodir"],
	[741] = L["Quest Item"],
	[739] = BabbleBoss["Old Serra'kis"],
	[605] = BabbleBoss["Attumen the Huntsman"],
	[173] = BabbleZone["Onyxia's Lair"],
	[654] = AtlasLoot_Source:EJ_GetBossName("Anraphet", 126),
	[578] = BabbleBoss["Mal'Ganis"],
	[146] = L["Smokywood Pastures Extra-Special Gift"],
	[327] = BabbleBoss["Drakos the Interrogator"],
	[408] = AtlasLoot_Source:EJ_GetBossName("Maloriak", 173),
	[736] = BabbleBoss["Gelihast"],
	[152] = BabbleBoss["Oggleflint"],
	[735] = BabbleBoss["Lady Sarevess"],
	[274] = BabbleBoss["C'Thun"],
	[585] = BabbleBoss["Princess Moira Bronzebeard"],
	[136] = BabbleBoss["Gurtogg Bloodboil"],
	[597] = BabbleBoss["Razorgore the Untamed"],
	[653] = AtlasLoot_Source:EJ_GetBossName("Conclave of Wind", 154),
	[755] = BabbleBoss["XT-002 Deconstructor"],
	[688] = "Dreamscythe#B#, Weaver#B#, Hazzas#B# & Morphaz#B#",
	[295] = BabbleZone["Baradin Hold"],
	[730] = BabbleBoss["Xevozz"],
	[659] = BabbleBoss["Thorim"],
	[293] = L["Solus the Eternal"],
	[87] = BabbleZone["Blackwing Descent"],
	[89] = BabbleZone["Drak'Tharon Keep"],
	[481] = AtlasLoot_Source:EJ_GetBossName("Karsh Steelbender", 107),
	[191] = "Mounts",
	[35] = L["Bash'ir Landing Skyguard Raid"],
	[398] = BabbleZone["The Mechanar"],
	[467] = L["Bag of Heart Candies"],
	[361] = AtlasLoot_Source:EJ_GetBossName("Daakara", 191),
	[426] = BabbleBoss["Lieutenant Drake"],
	[277] = "ilvl 245#L# - Rewards#L#",
	[682] = AtlasLoot_Source:EJ_GetBossName("Warmaster Blackhorn", 332),
	[724] = BabbleBoss["Galgann Firehammer"],
	[103] = BabbleZone["Halls of Origination"],
	[210] = BabbleZone["Scarlet Monastery"]..": "..BabbleZone["Graveyard"],
	[559] = BabbleBoss["Instructor Malicia"],
	[349] = BabbleBoss["Blood-Queen Lana'thel"],
	[723] = AtlasLoot_Source:EJ_GetBossName("Asira Dawnslayer", 342),
	[140] = L["Winter Veil Gift"],
	[758] = BabbleBoss["Ley-Guardian Eregos"],
	[141] = L["Gaily Wrapped Present"],
	[23] = L["Winter Veil Gift"].." (2007)",
	[200] = BabbleBoss["Loken"],
	[245] = BabbleBoss["Kirtonos the Herald"],
	[226] = AtlasLoot_Source:EJ_GetBossName("Temple Guardian Anhuur", 124),
	[721] = BabbleBoss["Mechano-Lord Capacitus"],
	[720] = BabbleBoss["Princess Theradras"],
	[719] = BabbleBoss["Rotgrip"],
	[718] = BabbleBoss["Landslide"],
	[716] = BabbleBoss["Tinkerer Gizlock"],
	[714] = BabbleBoss["Lord Vyletongue"],
	[203] = BabbleZone["Gruul's Lair"],
	[211] = BabbleBoss["Interrogator Vishas"],
	[763] = BabbleBoss["Archaedas"],
	[301] = BabbleBoss["Trigore the Lasher"],
	[26] = BabbleBoss["Doom Lord Kazzak"],
	[712] = BabbleBoss["Noxxion"],
	[536] = BabbleBoss["Chess Event"],
	[101] = BabbleZone["Scholomance"],
	[646] = BabbleBoss["Felmyst"],
	[707] = "Rare Mounts#L#: Raid#L#",
	[701] = BabbleBoss["Darkmaster Gandling"],
	[98] = "Lower Blackrock Spire#B# - Quest Item#L#",
	[275] = BabbleZone["Sunken Temple"],
	[563] = AtlasLoot_Source:EJ_GetBossName("Lord Rhyolith", 193),
	[281] = BabbleBoss["Blackheart the Inciter"],
	[325] = BabbleBoss["Warder Stilgiss"],
	[341] = BabbleBoss["The Beasts of Northrend"],
	[704] = BabbleBoss["Broodlord Lashlayer"],
	[700] = AtlasLoot_Source:EJ_GetBossName("Ozumat", 104),
	[637] = AtlasLoot_Source:EJ_GetBossName("Madness of Deathwing", 333),
	[78] = L["PvP"],
	[139] = L["Stolen Present"],
	[629] = BabbleBoss["Varos Cloudstrider"],
	[83] = BabbleZone["Arathi Basin"],
	[697] = L["Ulduar Formula/Patterns/Plans"],
	[696] = AtlasLoot_Source:EJ_GetBossName("Magmaw", 170),
	[546] = BabbleBoss["Slad'ran"],
	[693] = "Lethtendris#B# & Pimgib#B#",
	[215] = BabbleBoss["Fallen Champion"],
	[691] = BabbleBoss["Murmur"],
	[689] = AtlasLoot_Source:EJ_GetBossName("Alysrazor", 194),
	[686] = AtlasLoot_Source:EJ_GetBossName("Halfus Wyrmbreaker", 156),
	[67] = L["Hallow's End"],
	[684] = BabbleBoss["Maexxna"],
	[179] = AtlasLoot_Source:EJ_GetBossName("Ragnaros", 198),
	[6] = BabbleZone["Shadow Labyrinth"],
	[683] = "Skarvald the Constructor#B# / Dalronn the Controller#B#",
	[645] = L["The Duke of Shards"],
	[49] = L["Pilgrim's Bounty"],
	[611] = L["Servant's Quarter Animal Bosses"],
	[530] = BabbleBoss["Lord Skwol"],
	[60] = L["Terokk"],
	[681] = BabbleBoss["Zereketh the Unbound"],
	[678] = BabbleBoss["Princess Huhuran"],
	[677] = AtlasLoot_Source:EJ_GetBossName("Vanessa VanCleef", 95),
	[126] = BabbleBoss["Anub'Rekhan"],
	[675] = BabbleBoss["Amnennar the Coldbringer"],
	[332] = BabbleZone["Old Stratholme"],
	[674] = BabbleBoss["Ragglesnout"],
	[42] = BabbleBoss["Risen Hammersmith"],
	[672] = BabbleBoss["Mordresh Fire Eye"],
	[97] = BabbleZone["Lower Blackrock Spire"],
	[410] = BabbleZone["The Botanica"],
	[671] = BabbleBoss["Henry Stern"],
	[669] = BabbleZone["Razorfen Downs"],
	[85] = BabbleZone["The Shattered Halls"],
	[174] = BabbleBoss["Onyxia"],
	[370] = BabbleZone["Utgarde Keep"],
	[668] = BabbleBoss["Kurinnaxx"],
	[586] = BabbleBoss["Zuramat the Obliterator"],
	[667] = BabbleBoss["Vaelastrasz the Corrupt"],
	[666] = BabbleBoss["Quagmirran"],
	[635] = BabbleBoss["The Beast"],
	[477] = BabbleBoss["Forgemaster Garfrost"],
	[663] = BabbleBoss["Prince Tortheldrin"],
	[662] = BabbleBoss["Commander Sarannis"],
	[642] = L["The Duke of Cynders"],
	[531] = BabbleBoss["High Marshal Whirlaxis"],
	[638] = BabbleBoss["Thorngrin the Tender"],
	[310] = BabbleBoss["Kresh"],
	[345] = BabbleBoss["Chromaggus"],
	[660] = BabbleBoss["Krik'thir the Gatewatcher"],
	[729] = BabbleBoss["Blood Guard Porung"],
	[64] = L["Darkscreecher Akkarai"],
	[658] = BabbleBoss["Eadric the Pure"],
	[657] = BabbleBoss["Cho'Rush the Observer"],
	[38] = L["BoE World Epics"],
	[359] = BabbleBoss["Nefarian"],
	[439] = BabbleBoss["Ambassador Hellmaw"],
	[369] = BabbleBoss["Drakkari Colossus"],
	[138] = L["Smokywood Pastures Vendor"],
	[655] = BabbleBoss["Moorabi"],
	[733] = BabbleZone["Blackfathom Deeps"],
	[649] = BabbleZone["The Black Morass"],
	[231] = BabbleZone["Uldaman"],
	[415] = BabbleBoss["Mage-Lord Urom"],
	[647] = "Blackrock Depths#B# - Quest Item#L#",
	[102] = BabbleBoss["Death Knight Darkreaver"],
	[429] = BabbleZone["Halls of Reflection"],
	[708] = "Panzor the Invincible#B# (Rare#L#)",
	[455] = BabbleBoss["Captain Skarloc"],
	[492] = AtlasLoot_Source:EJ_GetBossName("Hagara the Stormbinder", 317),
	[661] = L["Trial of the Crusader Patterns/Plans"],
	[641] = L["Abyssal Council"].." - "..L["Dukes"],
	[373] = BabbleBoss["King Gordok"],
	[640] = AtlasLoot_Source:EJ_GetBossName("Peroth'arn", 290),
	[603] = BabbleBoss["Majordomo Executus"],
	[699] = AtlasLoot_Source:EJ_GetBossName("Bloodlord Mandokir", 176),
	[636] = AtlasLoot_Source:EJ_GetBossName("Baron Silverlaine", 97),
	[634] = AtlasLoot_Source:EJ_GetBossName("Lady Naz'jar", 101),
	[354] = BabbleBoss["The Unforgiven"],
	[633] = BabbleBoss["Hydromancer Thespia"],
	[631] = AtlasLoot_Source:EJ_GetBossName("Valiona and Theralion", 157),
	[498] = BabbleZone["Scarlet Monastery"]..": "..BabbleZone["Library"],
	[698] = AtlasLoot_Source:EJ_GetBossName("Corla, Herald of Twilight", 106),
	[247] = AtlasLoot_Source:EJ_GetBossName("Ascendant Lord Obsidius", 109),
	[527] = BabbleBoss["Amanitar"],
	[197] = BabbleBoss["Antu'sul"],
	[620] = BabbleBoss["Svala Sorrowgrave"],
	[626] = BabbleBoss["Garr"],
	[748] = AtlasLoot_Source:EJ_GetBossName("Morchok", 311),
	[618] = L["Timed Reward Chest"],
	[363] = AtlasLoot_Source:EJ_GetBossName("Rom'ogg Bonecrusher", 105),
	[617] = BabbleBoss["Golem Lord Argelmach"],
	[347] = BabbleBoss["Emalon the Storm Watcher"],
	[392] = "Lord Hel'nurath#B# (Summon#L#)",
	[468] = BabbleBoss["Nexus-Prince Shaffar"],
	[615] = AtlasLoot_Source:EJ_GetBossName("Ultraxion", 331),
	[613] = BabbleZone["The Eye of Eternity"],
	[242] = BabbleBoss["Crowd Pummeler 9-60"],
	[609] = BabbleBoss["Chrono-Lord Epoch"],
	[606] = L["Shen'dralar Provisioner"],
	[330] = BabbleBoss["Lady Illucia Barov"],
	[601] = BabbleBoss["Lavanthor"],
	[134] = BabbleBoss["Patchwerk"],
	[599] = BabbleBoss["Elder Nadox"],
	[596] = BabbleBoss["Ghaz'an"],
	[595] = BabbleBoss["Blood Prince Council"],
	[592] = BabbleBoss["General Rajaxx"],
	[619] = BabbleBoss["Algalon the Observer"],
	[589] = BabbleBoss["Novos the Summoner"],
	[177] = BabbleBoss["Toravon the Ice Watcher"],
	[553] = L["Cluster Rocket Recipes"],
	[587] = BabbleBoss["Ayamiss the Hunter"],
	[584] = BabbleBoss["Nethermancer Sepethrea"],
	[367] = BabbleBoss["Shadow Hunter Vosh'gajin"],
	[255] = BabbleZone["Shadowfang Keep"],
	[583] = BabbleBoss["Ingvar the Plunderer"],
	[142] = L["Ticking Present"],
	[581] = "Echoes",
	[121] = AtlasLoot_Source:EJ_GetBossName("Ascendant Council", 158),
	[580] = BabbleBoss["Solakar Flamewreath"],
	[198] = BabbleBoss["Jandice Barov"],
	[552] = L["Large Rocket Recipes"],
	[384] = AtlasLoot_Source:EJ_GetBossName("Mannoroth and Varo'then", 292),
	[574] = BabbleBoss["Sindragosa"],
	[236] = BabbleBoss["Digmaster Shovelphlange"],
	[352] = BabbleBoss["Talon King Ikiss"],
	[576] = BabbleBoss["Lord Marrowgar"],
	[431] = BabbleBoss["Gothik the Harvester"],
	[575] = BabbleBoss["Viscidus"],
	[52] = L["Noblegarden"],
	[573] = BabbleBoss["Erekem"],
	[272] = BabbleBoss["Doctor Theolen Krastinov"],
	[572] = BabbleBoss["Illyanna Ravenoak"],
	[566] = BabbleBoss["Houndmaster Grebmar"],
	[571] = BabbleBoss["Darkweaver Syth"],
	[713] = BabbleBoss["Razorlash"],
	[568] = BabbleBoss["The Prophet Skeram"],
	[564] = BabbleBoss["Quartermaster Zigris"],
	[389] = BabbleBoss["High Inquisitor Fairbanks"],
	[562] = "Ghok Bashguud#B# (Rare#L#)",
	[561] = BabbleBoss["Revelosh"],
	[560] = BabbleBoss["The Curator"],
	[558] = BabbleBoss["Ormorok the Tree-Shaper"],
	[557] = AtlasLoot_Source:EJ_GetBossName("Corborus", 110),
	[554] = L["Large Cluster Rocket Recipes"],
	[353] = BabbleZone["Stratholme"].." - "..L["Crusader's Square"],
	[338] = AtlasLoot_Source:EJ_GetBossName("Akil'zon", 186),
	[495] = BabbleBoss["Ancient Stone Keeper"],
	[588] = BabbleBoss["Vexallus"],
	[551] = L["Small Rocket Recipes"],
	[550] = L["Lucky Red Envelope"],
	[91] = BabbleZone["The Blood Furnace"],
	[151] = BabbleZone["Ragefire Chasm"],
	[195] = AtlasLoot_Source:EJ_GetBossName("Atramedes", 171),
	[694] = BabbleBoss["Supremus"],
	[545] = BabbleBoss["Shazzrah"],
	[284] = "Spirestone Battle Lord#B# (Rare#L#)",
	[449] = BabbleBoss["Warlord Kalithresh"],
	[334] = BabbleZone["The Obsidian Sanctum"],
	[435] = BabbleBoss["Mother Shahraz"],
	[510] = AtlasLoot_Source:EJ_GetBossName("Hex Lord Malacrass", 190),
	[55] = L["Level 70"],
	[602] = BabbleBoss["Gahz'rilla"],
	[362] = BabbleBoss["Instructor Galford"],
	[538] = BabbleBoss["Deathbringer Saurfang"],
	[423] = BabbleBoss["Priestess Delrissa"],
	[133] = BabbleBoss["The Iron Council"],
	[4] = BabbleFaction["Exalted"],
	[234] = AtlasLoot_Source:EJ_GetBossName("Cho'gall", 167),
	[71] = BabbleFaction["Cenarion Circle"],
	[440] = BabbleBoss["Anub'arak"],
	[232] = BabbleBoss["Grimlok"],
	[296] = AtlasLoot_Source:EJ_GetBossName("Alizabal, Mistress of Hate", 339),
	[484] = BabbleBoss["Grand Widow Faerlina"],
	[442] = BabbleBoss["Chief Ukorz Sandscalp"],
	[532] = BabbleBoss["Baron Kazum"],
	[235] = BabbleBoss["Teron Gorefiend"],
	[253] = BabbleZone["Azjol-Nerub"],
	[529] = BabbleBoss["Prince Skaldrenox"],
	[17] = L["Quest Reward"],
	[528] = L["Abyssal Council"],
	[706] = L["Father Flame"],
	[524] = AtlasLoot_Source:EJ_GetBossName("Nefarian", 174),
	[120] = BabbleZone["The Bastion of Twilight"],
	[523] = BabbleBoss["Ossirian the Unscarred"],
	[522] = BabbleBoss["The Black Knight"],
	[521] = BabbleZone["Trial of the Champion"],
	[517] = BabbleBoss["Icecrown Gunship Battle"],
	[516] = BabbleBoss["Freya"],
	[299] = BabbleBoss["Heigan the Unclean"],
	[515] = BabbleBoss["Noth the Plaguebringer"],
	[514] = L["Rare Fish Rewards"],
	[24] = "2009, 2010",
	[34] = L["Midsummer Fire Festival"],
	[511] = BabbleBoss["Fathom-Lord Karathress"],
	[243] = BabbleBoss["Dark Iron Ambassador"],
	[541] = L["Crimson Templar"],
	[509] = BabbleBoss["Hearthsinger Forresten"],
	[507] = BabbleBoss["Grobbulus"],
	[506] = BabbleBoss["Morogrim Tidewalker"],
	[29] = BabbleFaction["Hydraxian Waterlords"],
	[111] = BabbleZone["Naxxramas"],
	[328] = BabbleBoss["The Bug Family"],
	[504] = L["BRD Blacksmithing Plans"],
	[116] = BabbleZone["Northrend"],
	[340] = BabbleZone["Trial of the Crusader"],
	[252] = L["Phase 3"],
	[217] = BabbleBoss["Aggem Thorncurse"],
	[5] = BabbleFaction["Stormpike Guard"],
	[336] = BabbleBoss["Captain Kromcrush"],
	[149] = BabbleBoss["Rokmar the Crackler"],
	[233] = BabbleBoss["Brutallus"],
	[502] = L["Knot Thimblejack"],
	[265] = BabbleBoss["Mother Smolderweb"],
	[630] = BabbleBoss["Witch Doctor Zum'rah"],
	[175] = AtlasLoot_Source:EJ_GetBossName("Asaad", 116),
	[543] = L["Hoary Templar"],
	[421] = L["SP Patterns/Plans"],
	[306] = BabbleBoss["Skum"],
	[493] = BabbleBoss["The Lich King"],
	[643] = L["The Duke of Fathoms"],
	[132] = BabbleZone["Gundrak"],
	[166] = "Burning Felguard#B# (Rare#L#, Random#L#)",
	[490] = BabbleBoss["Professor Putricide"],
	[656] = BabbleBoss["Chrono Lord Deja"],
	[43] = BabbleZone["Stratholme"],
	[458] = BabbleBoss["Grand Warlock Nethekurse"],
	[534] = AtlasLoot_Source:EJ_GetBossName("Helix Gearbreaker", 90),
	[483] = AtlasLoot_Source:EJ_GetBossName("Omnotron Defense System", 169),
	[262] = L["Firelands Patterns/Plans"],
	[480] = AtlasLoot_Source:EJ_GetBossName("Al'Akir", 155),
	[251] = L["Phase 2"],
	[227] = BabbleBoss["Warchief Rend Blackhand"],
	[727] = AtlasLoot_Source:EJ_GetBossName("Forgemaster Throngus", 132),
	[278] = BabbleBoss["Immol'thar"],
	[465] = L["Dinner Suit Box"],
	[1] = BabbleFaction["Frostwolf Clan"],
	[257] = BabbleZone["Halls of Stone"],
	[194] = AtlasLoot_Source:EJ_GetBossName("Nalorakk", 187),
	[143] = L["Festive Gift"],
	[537] = BabbleBoss["The Illidari Council"],
	[88] = AtlasLoot_Source:EJ_GetBossName("Chimaeron", 172),
	[377] = BabbleBoss["Lucifron"],
	[399] = BabbleBoss["Cache of the Legion"],
	[475] = BabbleBoss["Ebonroc"],
	[3] = BabbleFaction["Revered"],
	[100] = BabbleBoss["Prince Taldaram"],
	[366] = BabbleBoss["Harbinger Skyriss"],
	[473] = BabbleBoss["Kel'Thuzad"],
	[248] = "Alterac Valley#B# Rewards#L#",
	[54] = L["Level 40-49"],
	[186] = BabbleBoss["Golemagg the Incinerator"],
	[471] = BabbleBoss["Alzzin the Wildshaper"],
	[525] = AtlasLoot_Source:EJ_GetBossName("Siamat, Lord of South Wind", 122),
	[263] = BabbleBoss["Bronjahm"],
	[99] = BabbleZone["Ahn'kahet: The Old Kingdom"],
	[185] = BabbleZone["The Stonecore"],
	[127] = BabbleZone["Blackrock Depths"],
	[466] = L["Box of Chocolates"],
	[93] = BabbleZone["The Violet Hold"],
	[180] = AtlasLoot_Source:EJ_GetBossName("Shannox", 195),
	[464] = L["Lovely Dress Box"],
	[106] = BabbleBoss["Devourer of Souls"],
	[462] = BabbleBoss["King Ymiron"],
	[291] = L["Gorgolon the All-seeing"],
	[412] = BabbleBoss["Shade of Eranikus"],
	[81] = BabbleZone["Warsong Gulch"],
	[499] = BabbleBoss["Houndmaster Loksey"],
	[485] = BabbleBoss["Anzu"],
	[751] = L["The Grim Guzzler"],
	[117] = BabbleZone["Sunwell Plateau"],
	[454] = L["The Vault"],
	[456] = BabbleBoss["Faction Champions"],
	[37] = L["Gurubashi Arena Booty Run"],
	[644] = L["The Duke of Zephyrs"],
	[280] = AtlasLoot_Source:EJ_GetBossName("Isiset", 127),
	[441] = "Urok Doomhowl#B# (Summon#L#)",
	[307] = BabbleBoss["Lord Serpentis"],
	[2] = BabbleFaction["Honored"],
	[76] = BabbleZone["Ruins of Ahn'Qiraj"],
	[259] = BabbleBoss["Ichoron"],
	[451] = BabbleBoss["Fineous Darkvire"],
	[444] = AtlasLoot_Source:EJ_GetBossName("Argaloth", 139),
	[533] = AtlasLoot_Source:EJ_GetBossName("\"Captain\" Cookie", 93),
	[742] = BabbleBoss["Ras Frostwhisper"],
	[437] = BabbleZone["Dragon Soul"],
	[130] = BabbleBoss["Nightbane"],
	[710] = "Marduk Blackpool#B# & Vectus#B#",
	[238] = BabbleZone["Gnomeregan"],
	[474] = AtlasLoot_Source:EJ_GetBossName("Occu'thar", 140),
	[169] = BabbleZone["Serpentshrine Cavern"],
	[254] = BabbleBoss["Hadronox"],
	[15] = L["Winter Veil Gift"].." (2009)",
	[432] = BabbleBoss["Lord Alexei Barov"],
	[157] = BabbleBoss["Maleki the Pallid"],
	[267] = BabbleBoss["The Four Horsemen"],
	[540] = L["Abyssal Council"].." - "..L["Templars"],
	[323] = BabbleBoss["Pyromancer Loregrain"],
	[428] = BabbleBoss["Shadowpriest Sezz'ziz"],
	[187] = BabbleBoss["Gehennas"],
	[30] = "2008",
	[422] = BabbleZone["Magisters' Terrace"],
	[297] = BabbleZone["The Underbog"],
	[705] = BabbleBoss["Lady Deathwhisper"],
	[230] = BabbleBoss["Anomalus"],
	[150] = BabbleBoss["Razorscale"],
	[161] = BabbleZone["The Vortex Pinnacle"],
	[315] = BabbleBoss["Tavarok"],
	[7] = L["Trash Mobs"],
	[416] = BabbleZone["Hour of Twilight"],
	[92] = BabbleBoss["The Maker"],
	[764] = BabbleBoss["Stonespine"],
	[648] = BabbleBoss["Highlord Omokk"],
	[228] = BabbleBoss["Jedoga Shadowseeker"],
	[204] = BabbleBoss["High King Maulgar"],
	[202] = BabbleBoss["Epoch Hunter"],
	[40] = L["Level 80"],
	[276] = "Jammal'an the Prophet#B# & Ogom the Wretched#B#",
	[84] = BabbleZone["Molten Front"],
	[105] = BabbleZone["The Forge of Souls"],
	[8] = BabbleBoss["Doomwalker"],
	[402] = AtlasLoot_Source:EJ_GetBossName("High Priest Venoxis", 175),
	[346] = BabbleBoss["Lord Incendius"],
	[229] = BabbleZone["The Nexus"],
	[196] = BabbleBoss["Overlord Wyrmthalak"],
	[503] = BabbleBoss["King Dred"],
	[401] = AtlasLoot_Source:EJ_GetBossName("Majordomo Staghelm", 197),
	[221] = BabbleBoss["Agathelos the Raging"],
	[304] = BabbleBoss["Lord Pythas"],
	[356] = BabbleBoss["Verek"],
	[400] = BabbleBoss["M'uru"],
	[119] = BabbleBoss["Keli'dan the Breaker"],
	[344] = BabbleBoss["Gal'darah"],
	[123] = "Erunak Stonespeaker#B# & Mindbender Ghur'sha#EJ#",
	[322] = BabbleBoss["Shade of Akama"],
	[47] = L["Lunar Festival"],
	[12] = L["Winter Veil Gift"].." (2008)",
	[380] = BabbleBoss["Gruul the Dragonkiller"],
	[219] = L["Razorfen Spearhide"],
	[113] = L["Children's Week"],
	[393] = AtlasLoot_Source:EJ_GetBossName("Commander Ulthok", 102),
	[391] = BabbleBoss["High Inquisitor Whitemane"],
	[577] = AtlasLoot_Source:EJ_GetBossName("Glubtok", 89),
	[379] = BabbleBoss["Stomper Kreeg"],
	[241] = BabbleBoss["Electrocutioner 6000"],
	[376] = L["Firestone Vendor"],
	[22] = "2007",
	[290] = L["King Dorfbruiser"],
	[135] = BabbleZone["Black Temple"],
	[372] = BabbleBoss["Skadi the Ruthless"],
	[358] = BabbleBoss["Exarch Maladaar"],
	[364] = "Charred Bone Fragment",
	[500] = BabbleBoss["Arcanist Doan"],
	[539] = AtlasLoot_Source:EJ_GetBossName("General Husam", 117),
	[348] = L["DM North Tribute Chest"],
	[172] = BabbleBoss["Goraluk Anvilcrack"],
	[728] = BabbleBoss["Swamplord Musel'ek"],
	[547] = AtlasLoot_Source:EJ_GetBossName("Sinestra", 168),
	[115] = BabbleZone["Outland"],
	[216] = BabbleZone["Razorfen Kraul"],
	[79] = L["Vendor"],
	[316] = BabbleZone["The Arcatraz"],
	[25] = BabbleFaction["Neutral"],
	[154] = BabbleBoss["Jergosh the Invoker"],
	[395] = BabbleBoss["Scourgelord Tyrannus"],
	[114] = BabbleZone["Azeroth"],
	[414] = BabbleBoss["Gizrul the Slavener"],
	[317] = BabbleBoss["Wrath-Scryer Soccothrates"],
	[222] = BabbleBoss["Blind Hunter"],
	[220] = BabbleBoss["Overlord Ramtusk"],
	[676] = BabbleBoss["Plaguemaw the Rotting"],
	[270] = BabbleZone["Zul'Gurub"],
	[738] = BabbleBoss["Twilight Lord Kelris"],
	[162] = AtlasLoot_Source:EJ_GetBossName("Grand Vizier Ertan", 114),
	[170] = BabbleBoss["Hydross the Unstable"],
	[214] = BabbleBoss["Azshir the Sleepless"],
	[68] = BabbleBoss["Zerillis"].." ("..L["Rare"]..")",
}