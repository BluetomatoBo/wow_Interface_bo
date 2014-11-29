
local _, LunarFestival = ...
local points = LunarFestival.points
-- points[<mapfile>] = { [<coordinates>] = { <quest ID>, <achievement ID>, <achievement criteria ID> } }


----------------------
-- Eastern Kingdoms --
----------------------
points["Azeroth"] = {
	[46925833] = { 8866, 915, 2 }, -- Elder Bronzebeard in Ironforge
	[43787469] = { 8646, 915, 3 }, -- Elder Hammershout in Stormwind

	[44033515] = { 8648, 914, 3 }, -- Elder Darkcore in the Undercity

	[45846169] = { 8653, 912, 1 }, -- Elder Goldwell in Kharanos
	[52418460] = { 8647, 912, 2 }, -- Elder Bellowrage in Blasted Lands
	[44227584] = { 8649, 912, 3 }, -- Elder Stormbrow in Elwynn Forest
	[50283258] = { 8722, 912, 4 }, -- Elder Meadowrun in Western Plaguelands
	[47478520] = { 8716, 912, 5 }, -- Elder Starglade in Northern Stranglethorn
	[43309430] = { 8674, 912, 6 }, -- Elder Winterhoof in Southern Stranglethorn
	[51756085] = { 8642, 912, 7 }, -- Elder Silvervein in Loch Modan
	[42077984] = { 8675, 912, 8 }, -- Elder Skychaser in Westfall
	[51177041] = { 8636, 912, 9 }, -- Elder Rumblerock in Burning Steppes
	[49806875] = { 8683, 912, 10 }, -- Elder Dawnstrider in Burning Steppes
	[53194031] = { 8643, 912, 11 }, -- Elder Highpeak in Hinterlands
	[46566797] = { 8651, 912, 12 }, -- Elder Ironband in Searing Gorge
	[44023301] = { 8652, 912, 13 }, -- Elder Graveborn in Tirisfal Glades
	[40773927] = { 8645, 912, 14 }, -- Elder Obsidian in Silverpine Forest
	[53743433] = { 8688, 912, 15 }, -- Elder Windrun in Eastern Plaguelands
	[57713292] = { 8650, 912, 16 }, -- Elder Snowcrown in Eastern Plaguelands
	[50883652] = { 8714, 912, 17 }, -- Elder Moonstrike in Western Plaguelands

	[57175823] = { 29737, 6006, 4 }, -- Elder Firebeard in Twilight Highlands
	[57305339] = { 29736, 6006, 5 }, -- Elder Darkfeather in Twilight Highlands
	[35026894] = { 29738, 6006, 8 }, -- Elder Moonlance in Vashj'ir

	[54007958] = { 8713, 910, 2 }, -- Elder Starsong in Sunken Temple
	[47636888] = { 8644, 910, 4 }, -- Elder Stonefort in Blackrock Spire
	[46876760] = { 8619, 910, 5 }, -- Elder Morndeep in Blackrock Depths
	[52902876] = { 8727, 910, 6 }, -- Elder Farwhisper in Stratholme
}


points["BlackrockDepths"] = {
	-- dungeonLevel 1
	[50536287] = { 8619, 910, 5 }, -- Elder Morndeep
}

points["BlackrockSpire"] = {
	-- dungeonLevel 3
	[61814000] = { 8644, 910, 4 }, -- Elder Stonefort
}

points["BlastedLands"] = {
	[54284949] = { 8647, 912, 2 }, -- Elder Bellowrage
}

points["BurningSteppes"] = {
	[70114539] = { 8636, 912, 9 }, -- Elder Rumblerock
	[52382394] = { 8683, 912, 10 }, -- Elder Dawnstrider
	[24332563] = { 8644, 910, 4 }, -- Elder Stonefort in Blackrock Spire
	[14610912] = { 8619, 910, 5 }, -- Elder Morndeep in Blackrock Depths
}

points["DunMorogh"] = {
	[53914991] = { 8653, 912, 1 }, -- Elder Goldwell
}

points["EasternPlaguelands"] = {
	[35586881] = { 8688, 912, 15 }, -- Elder Windrun
	[75735456] = { 8650, 912, 16 }, -- Elder Snowcrown
	[27091252] = { 8727, 910, 6 }, -- Elder Farwhisper in Stratholme
}

points["Elwynn"] = {
	[34565026] = { 8646, 915, 3 }, -- Elder Hammershout
	[39796367] = { 8649, 912, 3 }, -- Elder Stormbrow
}

points["Hinterlands"] = {
	[50004804] = { 8643, 912, 11 }, -- Elder Highpeak
}

points["Ironforge"] = {
	[29211706] = { 8866, 915, 2 }, -- Elder Bronzebeard
}

points["LochModan"] = {
	[33324654] = { 8642, 912, 7 }, -- Elder Silvervein
}

points["SearingGorge"] = {
	[21307911] = { 8651, 912, 12 }, -- Elder Ironband
	[40719570] = { 8644, 910, 4 }, -- Elder Stonefort in Blackrock Spire
	[26997241] = { 8619, 910, 5 }, -- Elder Morndeep in Blackrock Depths
}

points["Silverpine"] = {
	[44984114] = { 8645, 912, 14 }, -- Elder Obsidian
}

points["StranglethornJungle"] = {
	[71043430] = { 8716, 912, 5 }, -- Elder Starglade
}

points["StranglethornVale"] = {
	[63282265] = { 8716, 912, 5 }, -- Elder Starglade
	[37327920] = { 8674, 912, 6 }, -- Elder Winterhoof
}

points["Stratholme"] = {
	-- dungeonLevel 1
	[78622215] = { 8727, 910, 6 }, -- Elder Farwhisper
}

points["SwampOfSorrows"] = {
	[69665348] = { 8713, 910, 2 }, -- Elder Starsong in Sunken Temple
}

points["TheCapeOfStranglethorn"] = {
	[39957250] = { 8674, 912, 6 }, -- Elder Winterhoof
}

points["TheTempleOfAtalHakkar"] = {
	[62913448] = { 8713, 910, 2 }, -- Elder Starsong
}

points["Tirisfal"] = {
	[61957317] = { 8648, 914, 3 }, -- Elder Darkcore
	[61865391] = { 8652, 912, 13 }, -- Elder Graveborn
}

points["Undercity"] = {
	[66633821] = { 8648, 914, 3 }, -- Elder Darkcore
}

points["WesternPlaguelands"] = {
	[63513612] = { 8722, 912, 4 }, -- Elder Meadowrun
	[69187345] = { 8714, 912, 17 }, -- Elder Moonstrike
}

points["Westfall"] = {
	[56654709] = { 8675, 912, 8 }, -- Elder Skychaser
}


--------------
-- Kalimdor --
--------------
points["Kalimdor"] = {
	[39361085] = { 8718, 915, 1 }, -- Elder Bladeswift in Darnassus

	[58374487] = { 8677, 914, 1 }, -- Elder Darkhorn in Orgrimmar
	[47045630] = { 8678, 914, 2 }, -- Elder Wheathoof in Thunder Bluff

	[59365107] = { 8670, 911, 1 }, -- Elder Runetotem in Durotar
	[65244213] = { 8720, 911, 2 }, -- Elder Skygleam in Azshara
	[53405405] = { 8717, 911, 3 }, -- Elder Moonwarden in Northern Barrens
	[51076090] = { 8686, 911, 4 }, -- Elder Highmountain in Southern Barrens
	[56505572] = { 8680, 911, 5 }, -- Elder Windtotem in Northern Barrens
	[43941236] = { 8715, 911, 6 }, -- Elder Bladeleaf in Teldrassil
	[46882198] = { 8721, 911, 7 }, -- Elder Starweave in Darkshore
	[47576075] = { 8673, 911, 8 }, -- Elder Bloodhoof in Mulgore
	[47334079] = { 8725, 911, 9 }, -- Elder Riversong in Ashenvale
	[46086898] = { 8679, 911, 10 }, -- Elder Grimtotem in Feralas
	[43406769] = { 8685, 911, 11 }, -- Elder Mistwalker in Feralas
	[47813138] = { 8723, 911, 12 }, -- Elder Nightwind in Felwood
	[53107444] = { 8682, 911, 13 }, -- Elder Skyseer in Thousand Needles
	[56777738] = { 8724, 911, 14 }, -- Elder Morningdew in Thousand Needles
	[53859119] = { 8671, 911, 15 }, -- Elder Ragetotem in Tanaris
	[56628134] = { 8684, 911, 16 }, -- Elder Dreamseer in Tanaris
	[49998415] = { 8681, 911, 17 }, -- Elder Thunderhorn in Un'Goro Crater
	[57972581] = { 8726, 911, 18 }, -- Elder Brightspear in Winterspring
	[59092468] = { 8672, 911, 19 }, -- Elder Stonespire in Winterspring
	[41677758] = { 8654, 911, 20 }, -- Elder Primestone in Silithus
	[44128003] = { 8719, 911, 21 }, -- Elder Bladesing in Silithus

	[50778804] = { 29742, 6006, 2 }, -- Elder Menkhaf in Uldum
	[45069550] = { 29741, 6006, 3 }, -- Elder Sekhemi in Uldum
	[51983408] = { 29739, 6006, 6 }, -- Elder Windsong in Hyjal
	[56122955] = { 29740, 6006, 7 }, -- Elder Evershade in Hyjal

	[54237986] = { 8676, 910, 1 }, -- Elder Wildmane in Zul'Farrak
	[38435797] = { 8635, 910, 3 }, -- Elder Splitrock in Maraudon
}


points["Ashenvale"] = {
	[35544891] = { 8725, 911, 9 }, -- Elder Riversong
}

points["Aszhara"] = {
	[64737934] = { 8720, 911, 2 }, -- Elder Skygleam
}

points["Barrens"] = {
	[48525927] = { 8717, 911, 3 }, -- Elder Moonwarden
	[68366996] = { 8680, 911, 5 }, -- Elder Windtotem
}

points["Darkshore"] = {
	[49541894] = { 8721, 911, 7 }, -- Elder Starweave
}

points["Darnassus"] = {
	[39213185] = { 8718, 915, 1 }, -- Elder Bladeswift
}

points["Desolace"] = {
	[29106255] = { 8635, 910, 3 }, -- Elder Splitrock in Maraudon
}

points["Durotar"] = {
	[46390050] = { 8677, 914, 1 }, -- Elder Darkhorn
	[53224361] = { 8670, 911, 1 }, -- Elder Runetotem
}

points["Feralas"] = {
	[76713789] = { 8679, 911, 10 }, -- Elder Grimtotem
	[62563107] = { 8685, 911, 11 }, -- Elder Mistwalker
}

points["Felwood"] = {
	[38355285] = { 8723, 911, 12 }, -- Elder Nightwind
}

points["Maraudon"] = {
	[51479373] = { 8635, 910, 3 }, -- Elder Splitrock
}

points["Mulgore"] = {
	[44942323] = { 8678, 914, 2 }, -- Elder Wheathoof
	[48505324] = { 8673, 911, 8 }, -- Elder Bloodhoof
}

points["Orgrimmar"] = {
	[52256001] = { 8677, 914, 1 }, -- Elder Darkhorn
}

points["Silithus"] = {
	[30811332] = { 8654, 911, 20 }, -- Elder Primestone
	[53023548] = { 8719, 911, 21 }, -- Elder Bladesing
}

points["SouthernBarrens"] = {
	[41594745] = { 8686, 911, 4 }, -- Elder Highmountain
}

points["Tanaris"] = {
	[37247906] = { 8671, 911, 15 }, -- Elder Ragetotem
	[51402881] = { 8684, 911, 16 }, -- Elder Dreamseer
	[39212126] = { 8676, 910, 1 }, -- Elder Wildmane in Zul'Farrak
}

points["Teldrassil"] = {
	[28114367] = { 8718, 915, 1 }, -- Elder Bladeswift
	[56855311] = { 8715, 911, 6 }, -- Elder Bladeleaf
}

points["ThousandNeedles"] = {
	[46345101] = { 8682, 911, 13 }, -- Elder Skyseer
	[77097561] = { 8724, 911, 14 }, -- Elder Morningdew
}

points["ThunderBluff"] = {
	[72982338] = { 8678, 914, 2 }, -- Elder Wheathoof
}

points["UngoroCrater"] = {
	[50377616] = { 8681, 911, 17 }, -- Elder Thunderhorn
}

points["Winterspring"] = {
	[53235675] = { 8726, 911, 18 }, -- Elder Brightspear
	[59964994] = { 8672, 911, 19 }, -- Elder Stonespire
}

points["ZulFarrak"] = {
	[34503934] = { 8676, 910, 1 }, -- Elder Wildmane
}


-------------
-- Outland --
-------------


---------------
-- Northrend --
---------------
points["Northrend"] = {
	[22836944] = { 13012, 1396, 1 }, -- Elder Sardis in Borean Tundra
	[76095108] = { 13013, 1396, 2 }, -- Elder Beldak in Grizzly Hills
	[40896007] = { 13014, 1396, 3 }, -- Elder Morthie in Dragonblight
	[53123288] = { 13015, 1396, 4 }, -- Elder Fargal in The Storm Peaks
	[22286233] = { 13033, 1396, 5 }, -- Elder Arp in Borean Tundra
	[14625929] = { 13016, 1396, 6 }, -- Elder Northal in Borean Tundra
	[25114355] = { 13018, 1396, 7 }, -- Elder Sandrene in Sholazar Basin
	[28553997] = { 13024, 1396, 8 }, -- Elder Wanikaya in Sholazar Basin
	[81995387] = { 13025, 1396, 9 }, -- Elder Lunaro in Grizzly Hills
	[35754354] = { 13026, 1396, 10 }, -- Elder Bluewolf in Lake Wintergrasp
	[71884046] = { 13027, 1396, 11 }, -- Elder Tauros in Zul'Drak
	[46906711] = { 13019, 1396, 12 }, -- Elder Thoim in Dragonblight
	[58043729] = { 13028, 1396, 13 }, -- Elder Graymane in The Storm Peaks
	[54081841] = { 13020, 1396, 14 }, -- Elder Stonebeard in The Storm Peaks
	[17586423] = { 13029, 1396, 15 }, -- Elder Pamuya in Borean Tundra
	[77165679] = { 13030, 1396, 16 }, -- Elder Whurain in Grizzly Hills
	[42585768] = { 13031, 1396, 17 }, -- Elder Skywarden in Dragonblight
	[67432391] = { 13032, 1396, 18 }, -- Elder Muraco in The Storm Peaks

	[79558020] = { 13017, 910, 7 }, -- Elder Jarten in Utgarde Keep
	[12575657] = { 13021, 910, 8 }, -- Elder Igasho in The Nexus
	[39695849] = { 13022, 910, 9 }, -- Elder Nurgen in Azjol-Nerub
	[63334917] = { 13023, 910, 10 }, -- Elder Kilias in Drak'Tharon Keep
	[76733063] = { 13065, 910, 11 }, -- Elder Ohanzee in Gundrak
	[57411412] = { 13066, 910, 12 }, -- Elder Yurauk in Halls of Stone
	[79307908] = { 13067, 910, 13 }, -- Elder Chogan'gada in Utgarde Pinnacle
}


points["AzjolNerub"] = {
	[21774356] = { 13022, 910, 9 }, -- Elder Nurgen
}

points["BoreanTundra"] = {
	[27502598] = { 13021, 910, 8 }, -- Elder Igasho in The Nexus
	[59096563] = { 13012, 1396, 1 }, -- Elder Sardis
	[57394373] = { 13033, 1396, 5 }, -- Elder Arp
	[33803436] = { 13016, 1396, 6 }, -- Elder Northal
	[42934958] = { 13029, 1396, 15 }, -- Elder Pamuya
}

points["Dragonblight"] = {
	[25945089] = { 13022, 910, 9 }, -- Elder Nurgen in Azjol-Nerub
	[29755590] = { 13014, 1396, 3 }, -- Elder Morthie
	[48767818] = { 13019, 1396, 12 }, -- Elder Thoim
	[35104835] = { 13031, 1396, 17 }, -- Elder Skywarden
}

points["DrakTharonKeep"] = {
	[68887912] = { 13023, 910, 10 }, -- Elder Kilias
}

points["GrizzlyHills"] = {
	[17792703] = { 13023, 910, 10 }, -- Elder Kilias in Drak'Tharon Keep
	[60572768] = { 13013, 1396, 2 }, -- Elder Beldak
	[80523712] = { 13025, 1396, 9 }, -- Elder Lunaro
	[64164700] = { 13030, 1396, 16 }, -- Elder Whurain
}

points["Gundrak"] = {
	[45676153] = { 13065, 910, 11 }, -- Elder Ohanzee
}

points["HowlingFjord"] = {
	[57994998] = { 13017, 910, 7 }, -- Elder Jarten in Utgarde Keep
	[57264668] = { 13067, 910, 13 }, -- Elder Chogan'gada in Utgarde Pinnacle
}

points["LakeWintergrasp"] = {
	[49021393] = { 13026, 1396, 10 }, -- Elder Bluewolf
}

points["SholazarBasin"] = {
	[49786362] = { 13018, 1396, 7 }, -- Elder Sandrene
	[63804902] = { 13024, 1396, 8 }, -- Elder Wanikaya
}

points["TheNexus"] = {
	[55206471] = { 13021, 910, 8 }, -- Elder Igasho
}

points["TheStormPeaks"] = {
	[39582691] = { 13066, 910, 12 }, -- Elder Yurauk in Halls of Stone
	[28897371] = { 13015, 1396, 4 }, -- Elder Fargal
	[41168473] = { 13028, 1396, 13 }, -- Elder Graymane
	[31273762] = { 13020, 1396, 14 }, -- Elder Stonebeard
	[64595134] = { 13032, 1396, 18 }, -- Elder Muraco
}

points["Ulduar77"] = { -- Halls of Stone
	[29376205] = { 13066, 910, 12 }, -- Elder Yurauk
}

points["UtgardeKeep"] = {
	[47426963] = { 13017, 910, 7 }, -- Elder Jarten
}

points["UtgardePinnacle"] = {
	[48772298] = { 13067, 910, 13 }, -- Elder Chogan'gada
}

points["ZulDrak"] = {
	[28528694] = { 13023, 910, 10 }, -- Elder Kilias in Drak'Tharon Keep
	[76162102] = { 13065, 910, 11 }, -- Elder Ohanzee in Gundrak
	[58915597] = { 13027, 1396, 11 }, -- Elder Tauros
}


---------------
-- Cataclysm --
---------------
points["Deepholm"] = {
	[49705488] = { 29735, 6006, 1 }, -- Elder Stonebrand
	[27706918] = { 29734, 6006, 9 }, -- Elder Deepforge
}

points["Hyjal"] = {
	[26696205] = { 29739, 6006, 6 }, -- Elder Windsong
	[62542282] = { 29740, 6006, 7 }, -- Elder Evershade
}

points["TwilightHighlands"] = {
	[50917045] = { 29737, 6006, 4 }, -- Elder Firebeard
	[51883306] = { 29736, 6006, 5 }, -- Elder Darkfeather
}

points["Uldum"] = {
	[65521867] = { 29742, 6006, 2 }, -- Elder Menkhaf
	[31596298] = { 29741, 6006, 3 }, -- Elder Sekhemi
}

points["Vashjir"] = {
	[69828251] = { 29738, 6006, 8 }, -- Elder Moonlance
}

points["VashjirRuins"] = {
	[57268615] = { 29738, 6006, 8 }, -- Elder Moonlance
}


--------------
-- Pandaria --
--------------
