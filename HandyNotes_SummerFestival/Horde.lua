
if UnitFactionGroup("player") ~= "Horde" then return end


local _, SummerFestival = ...
local points = SummerFestival.points
-- points[<mapfile>] = { [<coordinates>] = "<questID>:<type>" }


----------------------
-- Eastern Kingdoms --
----------------------

points["Arathi"] = {
	[44304603] = "11732:D",	-- Refuge Pointe
	[69084286] = "11840:H",	-- Hammerfall
}

points["Badlands"] = {
	[19005618] = "28912:D",	-- Dragon's Mouth
	[24113722] = "11842:H",	-- New Kargath
}

points["BlastedLands"] = {
	[48160728] = "Zidormi",
	[46361426] = "28930:H",	-- Dreadmaul Hold
	[55531488] = "11737:D",	-- Nethergarde Keep
}

points["BurningSteppes"] = {
	[51532918] = "11844:H",	-- Flame Crest
	[68346064] = "11739:D",	-- Morgan's Vigil
}

points["DunMorogh"] = {
	[68682318] = "9331:C",	-- Stealing Ironforge's Flame
	[53804523] = "11742:D",	-- Kharanos
}

points["Duskwood"] = {
	[73695462] = "11743:D",	-- Darkshire
}

points["Elwynn"] = {
	[19483889] = "9330:C",	-- Stealing Stormwind's Flame
	[43476263] = "11745:D",	-- Goldshire
}

points["EversongWoods"] = {
	[46355039] = "11848:H",	-- Falconwing Square
}

points["Ironforge"] = {
	[64872541] = "9331:C",	-- Stealing Ironforge's Flame
}

points["Ghostlands"] = {
	[47052593] = "11850:H",	-- Tranquillien
}

points["HillsbradFoothills"] = {
	[54504989] = "11853:H",	-- Tarren Mill
}

points["Hinterlands"] = {
	[14345007] = "11755:D",	-- Aerie Peak
	[76637455] = "11860:H",	-- Revantusk Village
}

points["LochModan"] = {
	[32554095] = "11749:D",	-- Thelsamar
}

points["Redridge"] = {
	[24905338] = "11751:D",	-- Lakeshire
}

points["Silverpine"] = {
	[49623866] = "11584:H",	-- The Sepulcher
}

points["StormwindCity"] = {
	[49717284] = "9330:C",	-- Stealing Stormwind's Flame
}

points["StranglethornJungle"] = {
	[40725184] = "28924:H",	-- Grom'gol Base Camp
	[52056356] = "28910:D",	-- Fort Livingston
}

points["StranglethornVale"] = {
	[44303363] = "28924:H",	-- Grom'gol Base Camp, Northern Stranglethorn
	[53194096] = "28910:D",	-- Fort Livingston, Northern Stranglethorn
	[44567626] = "11761:D",	-- Wild Shore (north), Southern Stranglethorn
	[43707810] = "11837:H",	-- Wild Shore (south), Southern Stranglethorn
}

points["SwampOfSorrows"] = {
	[76771417] = "11857:H",	-- Bogpaddle (west)
	[70241573] = "28916:D",	-- Bogpaddle (east)
}

points["TheCapeOfStranglethorn"] = {
	[50547069] = "11837:H",	-- Wild Shore (south)
	[51976764] = "11761:D",	-- Wild Shore (north)
}

points["Tirisfal"] = {
	[56985176] = "11862:H",	-- Brill
}

points["WesternPlaguelands"] = {
	[29085647] = "28931:H",	-- The Bulwark
	[43478233] = "11756:D",	-- Chillwind Camp
}

points["Westfall"] = {
	[44776206] = "11581:D",	-- Moonbrook
}

points["Wetlands"] = {
	[13464706] = "11757:D",	-- Menethil Harbour
}


--------------
-- Kalimdor --
--------------

points["Ashenvale"] = {
	[51606675] = "11841:H",	-- Silverwind Refuge
	[86944186] = "11734:D",	-- Forest Song
}

points["Aszhara"] = {
	[60415349] = "28923:H",	-- Bilgewater Harbour
}

points["AzuremystIsle"] = {
	[24623673] = "11933:C",	-- Stealing the Exodar's Flame
	[44485251] = "11735:D",	-- Azure Watch
}

points["Barrens"] = {
	[49835434] = "11859:H",	-- The Crossroads
}

points["BloodmystIsle"] = {
	[55826789] = "11738:D",	-- Blood Watch
}

points["Darkshore"] = {
	[48732265] = "11740:D",	-- Lor'danel
}

points["Darnassus"] = {
	[63664679] = "9332:C",	-- Stealing Darnassus' Flame
}

points["Desolace"] = {
	[26217729] = "11845:H",	-- Silverprey Village
	[66121709] = "11741:D",	-- Nijel's Point
}

points["Durotar"] = {
	[51984719] = "11846:H",	-- Razor Hill
}

points["Dustwallow"] = {
	[55804960] = "Zidormi",
	[33233077] = "11847:H",	-- Brackenwall Village
	[61824046] = "11744:D",	-- Theramore Isle
}

points["Feralas"] = {
	[46824370] = "11746:D",	-- Feathermoon Stronghold
	[72424757] = "11849:H",	-- Camp Mojache
}

points["Mulgore"] = {
	[51985943] = "11852:H",	-- Bloodhoof Village
}

points["Silithus"] = {
	[50844177] = "11836:H",	-- Cenarion Hold (south)
	[60313351] = "11760:D",	-- Cenarion Hold (east)
}

points["SouthernBarrens"] = {
	[48337223] = "28913:D",	-- Fort Triumph
	[40676730] = "28927:H",	-- Desolation Point
}

points["StonetalonMountains"] = {
	[49305133] = "28915:D",	-- Mirkfallon Lake
	[52976227] = "11856:H",	-- Sun Rock Retreat
}

points["Tanaris"] = {
	[49842817] = "11838:H",	-- Gadgetzan (west)
	[52643026] = "11762:D",	-- Gadgetzan (east)
}

points["Teldrassil"] = {
	[34524759] = "9332:C",	-- Stealing Darnassus' Flame
	[54885277] = "11753:D",	-- Dolanaar
}

points["TheExodar"] = {
	[41242570] = "11933:C",	-- Stealing the Exodar's Flame
}

points["UngoroCrater"] = {
	[56446581] = "28933:H",	-- Marshal's Stand (west)
	[59856324] = "28921:D",	-- Marshal's Stand (east)
}

points["Winterspring"] = {
	[58124719] = "11839:H",	-- Everlook (west)
	[61244725] = "11763:D",	-- Everlook (east)
}


-------------
-- Outland --
-------------

points["BladesEdgeMountains"] = {
	[41576590] = "11736:D",	-- Sylvanaar
	[50045902] = "11843:H",	-- Thunderlord Stronghold
}

points["Hellfire"] = {
	[57194175] = "11851:H",	-- Thrallmar
	[62175829] = "11747:D",	-- Honour Hold
}

points["Nagrand"] = {
	[49616946] = "11750:D",	-- Telaar
	[51103396] = "11854:H",	-- Garadar
}

points["Netherstorm"] = {
	[31216266] = "11759:D",	-- Area 52 (north-west)
	[32306833] = "11835:H",	-- Area 52 (south)
}

points["ShadowmoonValley"] = {
	[33533028] = "11855:H",	-- Shadowmoon Village
	[39625464] = "11752:D",	-- Wildhammer Stronghold
}

points["TerokkarForest"] = {
	[51934324] = "11858:H",	-- Stonebreaker Hold
	[54065552] = "11754:D",	-- Allerian Stronghold
}

points["Zangarmarsh"] = {
	[35585182] = "11863:H",	-- Zabra'jin
	[68795195] = "11758:D",	-- Telredor
}


---------------
-- Northrend --
---------------

points["BoreanTundra"] = {
	[51031186] = "13493:H",	-- Bor'gorok Outpost
	[55101995] = "13440:D",	-- Fizzcrank Airstrip
}

points["CrystalsongForest"] = {
	[78197495] = "13447:D",	-- Windrunner's Overlook
	[80435263] = "13499:H",	-- Sunreaver's Command
}

points["Dragonblight"] = {
	[38524824] = "13495:H",	-- Agmar's Hammer
	[75294380] = "13443:D",	-- Wintergarde Keep
}

points["GrizzlyHills"] = {
	[19086149] = "13497:H",	-- Conquest Hold
	[33906045] = "13445:D",	-- Amberpine Lodge
}

points["HowlingFjord"] = {
	[48371337] = "13496:H",	-- Camp Winterhoof
	[57811611] = "13444:D",	-- Fort Wildervar
}

points["SholazarBasin"] = {
	[47366158] = "13494:H",	-- River's Heart (north)
	[48096636] = "13442:D",	-- River's Heart (south)
}

points["TheStormPeaks"] = {
	[40338558] = "13498:H",	-- K3 (west)
	[41448669] = "13446:D",	-- K3 (east)
}

points["ZulDrak"] = {
	[43307127] = "13500:H",	-- The Argent Stand (south-east)
	[40386130] = "13449:D",	-- The Argent Stand (north)
}


---------------
-- Cataclysm --
---------------

points["Deepholm"] = {
	[49405132] = "29036:H",	-- Temple of Earth
}

points["Hyjal"] = {
	[62832271] = "29030:H",	-- Nordrassil
}

points["TwilightHighlands"] = {
	[47262896] = "28943:D",	-- Thundermar
	[53284644] = "28946:H",	-- Bloodgulch
}

points["Uldum"] = {
	[53603184] = "28947:D",	-- Ramkahen (north)
	[52953461] = "28949:H",	-- Ramkahen (south)
}

points["Vashjir"] = {
	[64315167] = "29031:H",	-- Silver Tide Hollow
}

points["VashjirRuins"] = {
	[49354199] = "29031:H",	-- Silver Tide Hollow
}


--------------
-- Pandaria --
--------------

points["DreadWastes"] = {
	[56076958] = "32497:H",	-- Soggy's Gamble
}

points["Krasarang"] = {
	[73990950] = "32499:H",	-- Zhu's Watch
}

points["KunLaiSummit"] = {
	[71159087] = "32500:H",	-- Binan Village
}

points["TheJadeForest"] = {
	[47184719] = "32498:H",	-- Dawn's Blossom
}

points["TownlongWastes"] = {
	[71525629] = "32501:H",	-- Longying Outpost
}

points["ValeofEternalBlossoms"] = {
	[77763400] = "32509:D",	-- Shrine of Two Moons
	[79683727] = "32503:H",	-- Shrine of Seven Stars
}

points["ValleyoftheFourWinds"] = {
	[51825133] = "32502:H",	-- Halfhill
}


-------------
-- Draenor --
-------------
