--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * Locales/Locale-enUS.lua - Localized string constants (en-US).              *
  ****************************************************************************]]


-- See http://wow.curseforge.com/addons/npcscan-overlay/localization/enUS/
select( 2, ... ).L = setmetatable( {
	NPCs = { -- Note: Don't use a metatable default; Missing keys must return nil
	["100"] = "Gruff Swiftbite",
	["10077"] = "Deathmaw",
	["10078"] = "Terrorspark",
	["10080"] = "Sandarr Dunereaver",
	["10081"] = "Dustwraith",
	["10082"] = "Zerillis",
	["10119"] = "Volchan",
	["10196"] = "General Colbatann",
	["10197"] = "Mezzir the Howler",
	["10198"] = "Kashoch the Reaver",
	["10199"] = "Grizzle Snowpaw",
	["10200"] = "Rak'shiri",
	["10202"] = "Azurous",
	["10263"] = "Burning Felguard",
	["10356"] = "Bayne",
	["10357"] = "Ressan the Needler",
	["10358"] = "Fellicent's Shade",
	["10359"] = "Sri'skulk",
	["10376"] = "Crystal Fang",
	["10393"] = "Skul",
	["10509"] = "Jed Runewatcher",
	["10558"] = "Hearthsinger Forresten",
	["10559"] = "Lady Vespia",
	["1063"] = "Jade",
	["10639"] = "Rorgish Jowl",
	["10640"] = "Oakpaw",
	["10641"] = "Branch Snapper",
	["10642"] = "Eck'alom",
	["10644"] = "Mist Howler",
	["10647"] = "Prince Raze",
	["10741"] = "Sian-Rotam",
	["10809"] = "Stonespine",
	["10817"] = "Duggan Wildhammer",
	["10818"] = "Death Knight Soulbearer",
	["10819"] = "Baron Bloodbane",
	["10820"] = "Duke Ragereaver",
	["10821"] = "Hed'mush the Rotting",
	["10823"] = "Zul'Brin Warpbranch",
	["10824"] = "Death-Hunter Hawkspear",
	["10825"] = "Gish the Unmoving",
	["10826"] = "Lord Darkscythe",
	["10827"] = "Deathspeaker Selendre",
	["10828"] = "Lynnia Abbendis",
	["1106"] = "Lost One Cook",
	["1112"] = "Leech Widow",
	["1119"] = "Hammerspine",
	["1130"] = "Bjarn",
	["1132"] = "Timber",
	["1137"] = "Edan the Howler",
	["11383"] = "High Priestess Hai'watna",
	["1140"] = "Razormaw Matriarch",
	["11447"] = "Mushgog",
	["11467"] = "Tsu'zee",
	["11497"] = "The Razza",
	["11498"] = "Skarr the Broken",
	["11688"] = "Cursed Centaur",
	["12037"] = "Ursol'lok",
	["12237"] = "Meshlok the Harvester",
	["12431"] = "Gorefang",
	["12433"] = "Krethis the Shadowspinner",
	["1260"] = "Great Father Arctikus",
	["12902"] = "Lorgus Jett",
	["13896"] = "Scalebeard",
	["1398"] = "Boss Galgosh",
	["1399"] = "Magosh",
	["14221"] = "Gravis Slipknot",
	["14222"] = "Araga",
	["14223"] = "Cranky Benj",
	["14224"] = "7:XT",
	["14225"] = "Prince Kellen",
	["14226"] = "Kaskk",
	["14227"] = "Hissperak",
	["14228"] = "Giggler",
	["14229"] = "Accursed Slitherblade",
	["14230"] = "Burgle Eye",
	["14231"] = "Drogoth the Roamer",
	["14232"] = "Dart",
	["14233"] = "Ripscale",
	["14234"] = "Hayoc",
	["14235"] = "The Rot",
	["14236"] = "Lord Angler",
	["14237"] = "Oozeworm",
	["1424"] = "Master Digger",
	["1425"] = "Kubb",
	["14266"] = "Shanda the Spinner",
	["14267"] = "Emogg the Crusher",
	["14268"] = "Lord Condar",
	["14269"] = "Seeker Aqualon",
	["14270"] = "Squiddic",
	["14271"] = "Ribchaser",
	["14272"] = "Snarlflare",
	["14273"] = "Boulderheart",
	["14275"] = "Tamra Stormpike",
	["14276"] = "Scargil",
	["14277"] = "Lady Zephris",
	["14278"] = "Ro'Bark",
	["14279"] = "Creepthess",
	["14280"] = "Big Samras",
	["14281"] = "Jimmy the Bleeder",
	["14339"] = "Death Howl",
	["14340"] = "Alshirr Banebreath",
	["14342"] = "Ragepaw",
	["14343"] = "Olm the Wise",
	["14344"] = "Mongress",
	["14345"] = "The Ongar",
	["14424"] = "Mirelow",
	["14425"] = "Gnawbone",
	["14426"] = "Harb Foulmountain",
	["14427"] = "Gibblesnik",
	["14428"] = "Uruson",
	["14429"] = "Grimmaw",
	["14430"] = "Duskstalker",
	["14431"] = "Fury Shelda",
	["14432"] = "Threggil",
	["14433"] = "Sludginn",
	["14445"] = "Captain Wyrmak",
	["14446"] = "Fingat",
	["14447"] = "Gilmorian",
	["14448"] = "Molt Thorn",
	["14471"] = "Setis",
	["14472"] = "Gretheer",
	["14473"] = "Lapress",
	["14474"] = "Zora",
	["14475"] = "Rex Ashil",
	["14476"] = "Krellack",
	["14477"] = "Grubthor",
	["14478"] = "Huricanian",
	["14479"] = "Twilight Lord Everun",
	["14487"] = "Gluggl",
	["14488"] = "Roloch",
	["14490"] = "Rippa",
	["14491"] = "Kurmokk",
	["14492"] = "Verifonix",
	["1531"] = "Lost Soul",
	["1533"] = "Tormented Spirit",
	["1552"] = "Scale Belly",
	["16179"] = "Hyakiss the Lurker",
	["16180"] = "Shadikith the Glider",
	["16181"] = "Rokad the Ravager",
	["16184"] = "Nerubian Overseer",
	["16854"] = "Eldinarcus",
	["16855"] = "Tregla",
	["17144"] = "Goretooth",
	["18241"] = "Crusty",
	["1837"] = "Scarlet Judge",
	["1838"] = "Scarlet Interrogator",
	["1839"] = "Scarlet High Clerist",
	["1841"] = "Scarlet Executioner",
	["1843"] = "Foreman Jerris",
	["1844"] = "Foreman Marcrid",
	["1847"] = "Foulmane",
	["1848"] = "Lord Maldazzar",
	["1849"] = "Dreadwhisper",
	["1850"] = "Putridius",
	["1851"] = "The Husk",
	["18677"] = "Mekthorg the Wild",
	["18678"] = "Fulgorge",
	["18679"] = "Vorakem Doomspeaker",
	["18680"] = "Marticar",
	["18681"] = "Coilfang Emissary",
	["18682"] = "Bog Lurker",
	["18683"] = "Voidhunter Yar",
	["18684"] = "Bro'Gaz the Clanless",
	["18685"] = "Okrek",
	["18686"] = "Doomsayer Jurim",
	["18689"] = "Crippler",
	["18690"] = "Morcrush",
	["18692"] = "Hemathion",
	["18693"] = "Speaker Mar'grom",
	["18694"] = "Collidus the Warp-Watcher",
	["18695"] = "Ambassador Jerrikar",
	["18696"] = "Kraator",
	["18697"] = "Chief Engineer Lorthander",
	["18698"] = "Ever-Core the Punisher",
	["1885"] = "Scarlet Smith",
	["1910"] = "Muad",
	["1911"] = "Deeb",
	["1936"] = "Farmer Solliden",
	["2090"] = "Ma'ruk Wyrmscale",
	["20932"] = "Nuramoc",
	["2108"] = "Garneg Charskull",
	["2162"] = "Agal",
	["2172"] = "Strider Clutchmother",
	["21724"] = "Hawkbane",
	["2175"] = "Shadowclaw",
	["2184"] = "Lady Moongazer",
	["2186"] = "Carnivous the Breaker",
	["2191"] = "Licillin",
	["2192"] = "Firecaller Radison",
	["22060"] = "Fenissa the Assassin",
	["22062"] = "Dr. Whitherlimb",
	["2258"] = "Maggarrak",
	["2452"] = "Skhowl",
	["2453"] = "Lo'Grosh",
	["2476"] = "Gosh-Haldir",
	["2541"] = "Lord Sakrasis",
	["2598"] = "Darbel Montrose",
	["2600"] = "Singer",
	["2601"] = "Foulbelly",
	["2602"] = "Ruul Onestone",
	["2603"] = "Kovork",
	["2604"] = "Molok the Crusher",
	["2605"] = "Zalas Witherbark",
	["2606"] = "Nimar the Slayer",
	["2609"] = "Geomancer Flintdagger",
	["2744"] = "Shadowforge Commander",
	["2749"] = "Barricade",
	["2751"] = "War Golem",
	["2752"] = "Rumbler",
	["2753"] = "Barnabus",
	["2754"] = "Anathemus",
	["2779"] = "Prince Nazjak",
	["2850"] = "Broken Tooth",
	["2931"] = "Zaricotl",
	["3058"] = "Arra'chea",
	["3068"] = "Mazzranache",
	["32357"] = "Old Crystalbark",
	["32358"] = "Fumblub Gearwind",
	["32361"] = "Icehorn",
	["32377"] = "Perobas the Bloodthirster",
	["32386"] = "Vigdis the War Maiden",
	["32398"] = "King Ping",
	["32400"] = "Tukemuth",
	["32409"] = "Crazed Indu'le Survivor",
	["32417"] = "Scarlet Highlord Daion",
	["32422"] = "Grocklar",
	["32429"] = "Seething Hate",
	["32435"] = "Vern",
	["32438"] = "Syreian the Bonecarver",
	["32447"] = "Zul'drak Sentinel",
	["32471"] = "Griegen",
	["32475"] = "Terror Spinner",
	["32481"] = "Aotona",
	["32485"] = "King Krush",
	["32487"] = "Putridus the Ancient",
	["32491"] = "Time-Lost Proto-Drake",
	["32495"] = "Hildana Deathstealer",
	["32500"] = "Dirkee",
	["32501"] = "High Thane Jorfus",
	["32517"] = "Loque'nahak",
	["3253"] = "Silithid Harvester",
	["32630"] = "Vyragosa",
	["3270"] = "Elder Mystic Razorsnout",
	["3295"] = "Sludge Anomaly",
	["33776"] = "Gondria",
	["3398"] = "Gesharahan",
	["3470"] = "Rathorian",
	["35189"] = "Skoll",
	["3535"] = "Blackmoss the Fetid",
	["3581"] = "Sewer Beast",
	["3652"] = "Trigore the Lasher",
	["3672"] = "Boahn",
	["3735"] = "Apothecary Falthis",
	["3736"] = "Darkslayer Mordenthal",
	["3773"] = "Akkrilus",
	["3792"] = "Terrowulf Packlord",
	["38453"] = "Arcturis",
	["3872"] = "Deathsworn Captain",
	["39183"] = "Scorpitar",
	["39185"] = "Slaverjaw",
	["39186"] = "Hellgazer",
	["4066"] = "Nal'taszar",
	["4132"] = "Krkk'kx",
	["4339"] = "Brimgore",
	["43488"] = "Mordei the Earthrender",
	["43613"] = "Doomsayer Wiserunner",
	["43720"] = "\"Pokey\" Thornmantle",
	["4380"] = "Darkmist Widow",
	["44224"] = "Two-Toes",
	["44225"] = "Rufus Darkshot",
	["44226"] = "Sarltooth",
	["44227"] = "Gazz the Loch-Hunter",
	["4425"] = "Blind Hunter",
	["44714"] = "Fronkle the Disturbed",
	["44722"] = "Twisted Reflection of Narain",
	["44750"] = "Caliph Scorpidsting",
	["44759"] = "Andre Firebeard",
	["44761"] = "Aquementas the Unchained",
	["44767"] = "Occulus the Corrupted",
	["45257"] = "Mordak Nightbender",
	["45258"] = "Cassia the Slitherqueen",
	["45260"] = "Blackleaf",
	["45262"] = "Narixxus the Doombringer",
	["45369"] = "Morick Darkbrew",
	["45380"] = "Ashtail",
	["45384"] = "Sagepaw",
	["45398"] = "Grizlak",
	["45399"] = "Optimo",
	["45401"] = "Whitefin",
	["45402"] = "Nix",
	["45404"] = "Geoshaper Maren",
	["45739"] = "The Unknown Soldier",
	["45740"] = "Watcher Eva",
	["45771"] = "Marus",
	["45785"] = "Carved One",
	["45801"] = "Eliza",
	["45811"] = "Marina DeSirrus",
	["462"] = "Vultros",
	["46981"] = "Nightlash",
	["46992"] = "Berard the Moon-Crazed",
	["47003"] = "Bolgaff",
	["47008"] = "Fenwick Thatros",
	["47009"] = "Aquarius the Unbound",
	["47010"] = "Indigos",
	["47012"] = "Effritus",
	["47015"] = "Lost Son of Arugal",
	["47023"] = "Thule Ravenclaw",
	["471"] = "Mother Fang",
	["472"] = "Fedfennel",
	["47386"] = "Ainamiss the Hive Queen",
	["47387"] = "Harakiss the Infestor",
	["4842"] = "Earthcaller Halmgar",
	["49822"] = "Jadefang",
	["49913"] = "Lady La-La",
	["50005"] = "Poseidus",
	["50009"] = "Mobus",
	["50050"] = "Shok'sharak",
	["50051"] = "Ghostcrawler",
	["50052"] = "Burgy Blackheart",
	["50053"] = "Thartuk the Exile",
	["50056"] = "Garr",
	["50057"] = "Blazewing",
	["50058"] = "Terrorpene",
	["50059"] = "Golgarok",
	["50060"] = "Terborus",
	["50061"] = "Xariona",
	["50062"] = "Aeonaxx",
	["50063"] = "Akma'hat",
	["50064"] = "Cyrus the Black",
	["50065"] = "Armagedillo",
	["50085"] = "Overlord Sunderfury",
	["50086"] = "Tarvus the Vile",
	["50089"] = "Julak-Doom",
	["50138"] = "Karoma",
	["50154"] = "Madexx",
	["50159"] = "Sambas",
	["50328"] = "Fangor",
	["50329"] = "Rrakk",
	["50330"] = "Kree",
	["50331"] = "Go-Kan",
	["50332"] = "Korda Torros",
	["50333"] = "Lon the Bull",
	["50334"] = "Dak the Breaker",
	["50335"] = "Alitus",
	["50336"] = "Yorik Sharpeye",
	["50337"] = "Cackle",
	["50338"] = "Kor'nas Nightsavage",
	["50339"] = "Sulik'shor",
	["50340"] = "Gaarn the Toxic",
	["50341"] = "Borginn Darkfist",
	["50342"] = "Heronis",
	["50343"] = "Quall",
	["50344"] = "Norlaxx",
	["50345"] = "Alit",
	["50346"] = "Ronak",
	["50347"] = "Karr the Darkener",
	["50348"] = "Norissis",
	["50349"] = "Kang the Soul Thief",
	["50350"] = "Morgrinn Crackfang",
	["50351"] = "Jonn-Dar",
	["50352"] = "Qu'nas",
	["50353"] = "Manas",
	["50354"] = "Havak",
	["50355"] = "Kah'tir",
	["50356"] = "Krol the Blade",
	["50357"] = "Sunwing",
	["50358"] = "Haywire Sunreaver Construct",
	["50359"] = "Urgolax",
	["50361"] = "Ornat",
	["50362"] = "Blackbog the Fang",
	["50363"] = "Krax'ik",
	["50364"] = "Nal'lak the Ripper",
	["50370"] = "Karapax",
	["50388"] = "Torik-Ethis",
	["506"] = "Sergeant Brashclaw",
	["507"] = "Fenros",
	["50724"] = "Spinecrawl",
	["50725"] = "Azelisk",
	["50726"] = "Kalixx",
	["50727"] = "Strix the Barbed",
	["50728"] = "Deathstrike",
	["50730"] = "Venomspine",
	["50731"] = "Needlefang",
	["50733"] = "Ski'thik",
	["50734"] = "Lith'ik the Stalker",
	["50735"] = "Blinkeye the Rattler",
	["50737"] = "Acroniss",
	["50738"] = "Shimmerscale",
	["50739"] = "Gar'lok",
	["50741"] = "Kaxx",
	["50742"] = "Qem",
	["50743"] = "Manax",
	["50744"] = "Qu'rik",
	["50745"] = "Losaj",
	["50746"] = "Bornix the Burrower",
	["50747"] = "Tix",
	["50748"] = "Nyaj",
	["50749"] = "Kal'tik the Blight",
	["50750"] = "Aethis",
	["50752"] = "Tarantis",
	["50759"] = "Iriss the Widow",
	["50763"] = "Shadowstalker",
	["50764"] = "Paraliss",
	["50765"] = "Miasmiss",
	["50766"] = "Sele'na",
	["50768"] = "Cournith Waterstrider",
	["50769"] = "Zai the Outcast",
	["50770"] = "Zorn",
	["50772"] = "Eshelon",
	["50775"] = "Likk the Hunter",
	["50776"] = "Nalash Verdantis",
	["50777"] = "Needle",
	["50778"] = "Ironweb",
	["50779"] = "Sporeggon",
	["50780"] = "Sahn Tidehunter",
	["50782"] = "Sarnak",
	["50783"] = "Salyin Warscout",
	["50784"] = "Anith",
	["50785"] = "Skyshadow",
	["50786"] = "Sparkwing",
	["50787"] = "Arness the Scale",
	["50788"] = "Quetzl",
	["50789"] = "Nessos the Oracle",
	["50790"] = "Ionis",
	["50791"] = "Siltriss the Sharpener",
	["50792"] = "Chiaa",
	["50797"] = "Yukiko",
	["50803"] = "Bonechewer",
	["50804"] = "Ripwing",
	["50805"] = "Omnis Grinlok",
	["50806"] = "Moldo One-Eye",
	["50807"] = "Catal",
	["50808"] = "Urobi the Walker",
	["50809"] = "Heress",
	["50810"] = "Favored of Isiset",
	["50811"] = "Nasra Spothide",
	["50812"] = "Arae",
	["50813"] = "Fene-mal",
	["50814"] = "Corpsefeeder",
	["50815"] = "Skarr",
	["50816"] = "Ruun Ghostpaw",
	["50817"] = "Ahone the Wanderer",
	["50818"] = "The Dark Prowler",
	["50819"] = "Iceclaw",
	["50820"] = "Yul Wildpaw",
	["50821"] = "Ai-Li Skymirror",
	["50822"] = "Ai-Ran the Shifting Cloud",
	["50823"] = "Mister Ferocious",
	["50825"] = "Feras",
	["50828"] = "Bonobos",
	["50830"] = "Spriggin",
	["50831"] = "Scritch",
	["50832"] = "The Yowler",
	["50833"] = "Duskcoat",
	["50836"] = "Ik-Ik the Nimble",
	["50837"] = "Kash",
	["50838"] = "Tabbs",
	["50839"] = "Chromehound",
	["50840"] = "Major Nanners",
	["50842"] = "Magmagan",
	["50846"] = "Slavermaw",
	["50855"] = "Jaxx the Rabid",
	["50856"] = "Snark",
	["50858"] = "Dustwing",
	["50864"] = "Thicket",
	["50865"] = "Saurix",
	["50874"] = "Tenok",
	["50875"] = "Nychus",
	["50876"] = "Avis",
	["50882"] = "Chupacabros",
	["50884"] = "Dustflight the Cowardly",
	["50886"] = "Seawing",
	["50891"] = "Boros",
	["50892"] = "Cyn",
	["50895"] = "Volux",
	["50897"] = "Ffexk the Dunestalker",
	["50901"] = "Teromak",
	["50903"] = "Orlix the Swamplord",
	["50905"] = "Cida",
	["50906"] = "Mutilax",
	["50908"] = "Nighthowl",
	["50915"] = "Snort",
	["50916"] = "Lamepaw the Whimperer",
	["50922"] = "Warg",
	["50925"] = "Grovepaw",
	["50926"] = "Grizzled Ben",
	["50929"] = "Little Bjorn",
	["50930"] = "Hibernus the Sleeper",
	["50931"] = "Mange",
	["50937"] = "Hamhide",
	["50940"] = "Swee",
	["50942"] = "Snoot the Rooter",
	["50945"] = "Scruff",
	["50946"] = "Hogzilla",
	["50947"] = "Varah",
	["50948"] = "Crystalback",
	["50949"] = "Finn's Gambit",
	["50952"] = "Barnacle Jim",
	["50955"] = "Carcinak",
	["50957"] = "Hugeclaw",
	["50959"] = "Karkin",
	["50964"] = "Chops",
	["50967"] = "Craw the Ravager",
	["50986"] = "Goldenback",
	["50993"] = "Gal'dorak",
	["50995"] = "Bruiser",
	["50997"] = "Bornak the Gorer",
	["51000"] = "Blackshell the Impenetrable",
	["51001"] = "Venomclaw",
	["51002"] = "Scorpoxx",
	["51004"] = "Toxx",
	["51007"] = "Serkett",
	["51008"] = "The Barbed Horror",
	["51010"] = "Snips",
	["51014"] = "Terrapis",
	["51017"] = "Gezan",
	["51018"] = "Zormus",
	["51021"] = "Vorticus",
	["51022"] = "Chordix",
	["51025"] = "Dilennaa",
	["51026"] = "Gnath",
	["51027"] = "Spirocula",
	["51028"] = "The Deep Tunneler",
	["51029"] = "Parasitus",
	["51031"] = "Tracker",
	["51037"] = "Lost Gilnean Wardog",
	["51040"] = "Snuffles",
	["51042"] = "Bleakheart",
	["51044"] = "Plague",
	["51045"] = "Arcanus",
	["51046"] = "Fidonis",
	["51048"] = "Rexxus",
	["51052"] = "Gib the Banana-Hoarder",
	["51053"] = "Quirix",
	["51057"] = "Weevil",
	["51058"] = "Aphis",
	["51059"] = "Blackhoof",
	["51061"] = "Roth-Salam",
	["51062"] = "Khep-Re",
	["51063"] = "Phalanax",
	["51066"] = "Crystalfang",
	["51067"] = "Glint",
	["51069"] = "Scintillex",
	["51071"] = "Captain Florence",
	["51076"] = "Lopex",
	["51077"] = "Bushtail",
	["51078"] = "Ferdinand",
	["51079"] = "Captain Foulwind",
	["51401"] = "Madexx",
	["51402"] = "Madexx",
	["51403"] = "Madexx",
	["51404"] = "Madexx",
	["51658"] = "Mogh the Dead",
	["51661"] = "Tsul'Kalu",
	["51662"] = "Mahamba",
	["51663"] = "Pogeyan",
	["519"] = "Slark",
	["520"] = "Brack",
	["521"] = "Lupos",
	["52146"] = "Chitter",
	["534"] = "Nefaru",
	["5343"] = "Lady Szallah",
	["5345"] = "Diamond Head",
	["5346"] = "Bloodroar the Stalker",
	["5347"] = "Antilus the Soarer",
	["5348"] = "Dreamwatcher Forktongue",
	["5349"] = "Arash-ethis",
	["5350"] = "Qirot",
	["5352"] = "Old Grizzlegut",
	["5354"] = "Gnarl Leafbrother",
	["5356"] = "Snarler",
	["54318"] = "Ankha",
	["54319"] = "Magria",
	["54320"] = "Ban'thalos",
	["54321"] = "Solix",
	["54322"] = "Deth'tilac",
	["54323"] = "Kirix",
	["54324"] = "Skitterflame",
	["54338"] = "Anthriss",
	["54533"] = "Prince Lakma",
	["56081"] = "Optimistic Benj",
	["572"] = "Leprithus",
	["573"] = "Foe Reaper 4000",
	["574"] = "Naraxis",
	["5785"] = "Sister Hatelash",
	["5786"] = "Snagglespear",
	["5787"] = "Enforcer Emilgund",
	["5807"] = "The Rake",
	["5809"] = "Sergeant Curtis",
	["5822"] = "Felweaver Scornn",
	["5823"] = "Death Flayer",
	["5824"] = "Captain Flat Tusk",
	["5826"] = "Geolord Mottle",
	["5828"] = "Humar the Pridelord",
	["5829"] = "Snort the Heckler",
	["5830"] = "Sister Rathtalon",
	["5831"] = "Swiftmane",
	["5832"] = "Thunderstomp",
	["58336"] = "Darkmoon Rabbit",
	["5834"] = "Azzere the Skyblade",
	["5835"] = "Foreman Grills",
	["5836"] = "Engineer Whirleygig",
	["5837"] = "Stonearm",
	["5838"] = "Brokespear",
	["584"] = "Kazon",
	["5841"] = "Rocklance",
	["5842"] = "Takk the Leaper",
	["5847"] = "Heggin Stonewhisker",
	["58474"] = "Bloodtip",
	["5848"] = "Malgin Barleybrew",
	["5849"] = "Digger Flameforge",
	["5851"] = "Captain Gerogg Hammertoe",
	["5859"] = "Hagg Taurenbane",
	["5863"] = "Geopriest Gukk'rok",
	["5864"] = "Swinegart Spearhide",
	["5865"] = "Dishu",
	["58768"] = "Cracklefang",
	["58769"] = "Vicejaw",
	["58771"] = "Quid",
	["58778"] = "Aetha",
	["58817"] = "Spirit of Lao-Fe",
	["58949"] = "Bai-Jin the Butcher",
	["5912"] = "Deviate Faerie Dragon",
	["5915"] = "Brother Ravenoak",
	["5928"] = "Sorrow Wing",
	["5930"] = "Sister Riven",
	["5932"] = "Taskmaster Whipfang",
	["5933"] = "Achellios the Banished",
	["5935"] = "Ironeye the Invincible",
	["59369"] = "Doctor Theolen Krastinov",
	["5937"] = "Vile Sting",
	["596"] = "Brainwashed Noble",
	["599"] = "Marisa du'Paige",
	["60491"] = "Sha of Anger",
	["61"] = "Thuros Lightfingers",
	["6118"] = "Varo'then's Ghost",
	["616"] = "Chatter",
	["62"] = "Gug Fatcandle",
	["6228"] = "Dark Iron Ambassador",
	["62346"] = "Galleon",
	["62880"] = "Gochao the Ironfist",
	["62881"] = "Gaohun the Soul-Severer",
	["63101"] = "General Temuja",
	["63240"] = "Shadowmaster Sydow",
	["63510"] = "Wulon",
	["63691"] = "Huo-Shuang",
	["63695"] = "Baolai the Immolator",
	["63977"] = "Vyraxxis",
	["63978"] = "Kri'chon",
	["64403"] = "Alani",
	["6581"] = "Ravasaur Matriarch",
	["6582"] = "Clutchmother Zavas",
	["6583"] = "Gruff",
	["6584"] = "King Mosh",
	["6585"] = "Uhk'loc",
	["6648"] = "Antilos",
	["6649"] = "Lady Sesspira",
	["6650"] = "General Fangferror",
	["6651"] = "Gatekeeper Rageroar",
	["68317"] = "Mavis Harms",
	["68318"] = "Dalan Nightbreaker",
	["68319"] = "Disha Fearwarden",
	["68320"] = "Ubunti the Shade",
	["68321"] = "Kar Warmaker",
	["68322"] = "Muerta",
	["69099"] = "Nalak",
	["69664"] = "Mumta",
	["69768"] = "Zandalari Warscout",
	["69769"] = "Zandalari Warbringer",
	["69841"] = "Zandalari Warbringer",
	["69842"] = "Zandalari Warbringer",
	["69843"] = "Zao'cho",
	["69996"] = "Ku'lai the Skyclaw",
	["69997"] = "Progenitus",
	["69998"] = "Goda",
	["69999"] = "God-Hulk Ramuk",
	["70000"] = "Al'tabim the All-Seeing",
	["70001"] = "Backbreaker Uru",
	["70002"] = "Lu-Ban",
	["70003"] = "Molthor",
	["70096"] = "War-God Dokah",
	["70126"] = "Willy Wilder",
	["7015"] = "Flagglemurk the Cruel",
	["7016"] = "Lady Vespira",
	["7017"] = "Lord Sinslayer",
	["70238"] = "Unblinking Eye",
	["70243"] = "Archritualist Kelada",
	["70249"] = "Focused Eye",
	["70276"] = "No'ku Stormsayer",
	["70323"] = "Krakkanon",
	["70430"] = "Rocky Horror",
	["70440"] = "Monara",
	["70530"] = "Ra'sha",
	["7104"] = "Dessecus",
	["7137"] = "Immolatus",
	["71864"] = "Spelurk",
	["71919"] = "Zhu-Gon the Sour",
	["71992"] = "Moonfang",
	["72045"] = "Chelon",
	["72048"] = "Rattleskew",
	["72049"] = "Cranegnasher",
	["72193"] = "Karkanos",
	["72245"] = "Zesqua",
	["72769"] = "Spirit of Jadefire",
	["72775"] = "Bufo",
	["72808"] = "Tsavo'ka",
	["72909"] = "Gu'chi the Swarmbringer",
	["72970"] = "Golganarr",
	["73157"] = "Rock Moss",
	["73158"] = "Emerald Gander",
	["73160"] = "Ironfur Steelhorn",
	["73161"] = "Great Turtle Furyshell",
	["73163"] = "Imperial Python",
	["73166"] = "Monstrous Spineclaw",
	["73167"] = "Huolon",
	["73169"] = "Jakur of Ordon",
	["73170"] = "Watcher Osu",
	["73171"] = "Champion of the Black Flame",
	["73172"] = "Flintlord Gairan",
	["73173"] = "Urdur the Cauterizer",
	["73174"] = "Archiereus of Flame",
	["73175"] = "Cinderfall",
	["73277"] = "Leafmender",
	["73279"] = "Evermaw",
	["73281"] = "Dread Ship Vazuvius",
	["73282"] = "Garnia",
	["73293"] = "Whizzig",
	["73666"] = "Archiereus of Flame",
	["73704"] = "Stinkbraid",
	["763"] = "Lost One Chieftain",
	["7846"] = "Teremus the Devourer",
	["79"] = "Narg the Taskmaster",
	["8199"] = "Warleader Krazzilak",
	["8200"] = "Jin'Zallah the Sandbringer",
	["8201"] = "Omgorn the Lost",
	["8203"] = "Kregg Keelhaul",
	["8204"] = "Soriid the Devourer",
	["8205"] = "Haarka the Ravenous",
	["8207"] = "Emberwing",
	["8210"] = "Razortalon",
	["8211"] = "Old Cliff Jumper",
	["8212"] = "The Reak",
	["8213"] = "Ironback",
	["8214"] = "Jalinde Summerdrake",
	["8215"] = "Grimungous",
	["8216"] = "Retherokk the Berserker",
	["8217"] = "Mith'rethis the Enchanter",
	["8218"] = "Witherheart the Stalker",
	["8219"] = "Zul'arek Hatefowler",
	["8277"] = "Rekk'tilac",
	["8278"] = "Smoldar",
	["8279"] = "Faulty War Golem",
	["8280"] = "Shleipnarr",
	["8281"] = "Scald",
	["8282"] = "Highlord Mastrogonde",
	["8283"] = "Slave Master Blackheart",
	["8296"] = "Mojo the Twisted",
	["8297"] = "Magronos the Unyielding",
	["8298"] = "Akubar the Seer",
	["8299"] = "Spiteflayer",
	["8300"] = "Ravage",
	["8301"] = "Clack the Reaver",
	["8302"] = "Deatheye",
	["8303"] = "Grunter",
	["8304"] = "Dreadscorn",
	["8503"] = "Gibblewilt",
	["8660"] = "The Evalcharr",
	["8923"] = "Panzor the Invincible",
	["8924"] = "The Behemoth",
	["8976"] = "Hematos",
	["8978"] = "Thauris Balgarr",
	["8979"] = "Gruklash",
	["8981"] = "Malfunctioning Reaver",
	["9217"] = "Spirestone Lord Magus",
	["9218"] = "Spirestone Battle Lord",
	["9219"] = "Spirestone Butcher",
	["947"] = "Rohh the Silent",
	["9596"] = "Bannok Grimaxe",
	["9602"] = "Hahk'Zor",
	["9604"] = "Gorgon'och",
	["9718"] = "Ghok Bashguud",
	["9736"] = "Quartermaster Zigris",
	["99"] = "Morgaine the Sly",

	};

	CONFIG_ALPHA = "Alpha",
	CONFIG_DESC = "Control which maps will show mob path overlays.  Most map-modifying addons are controlled with the World Map option.",
	CONFIG_SHOWALL = "Always show all paths",
	CONFIG_SHOWALL_DESC = "Normally when a mob isn't being searched for, its path gets taken off the map.  Enable this setting to always show every known patrol instead.",
	CONFIG_TITLE = "Overlay",
	CONFIG_TITLE_STANDALONE = "_|cffCCCC88NPCScan|r.Overlay",
	MODULE_OMEGAMAP = "OmegaMap AddOn",
	MODULE_BATTLEFIELDMINIMAP = "Battlefield-Minimap Popout",
	MODULE_MINIMAP = "Minimap",
	MODULE_RANGERING_DESC = "Note: The range ring only appears in zones with tracked rares.",
	MODULE_RANGERING_FORMAT = "Show %dyd ring for approximate detection range",
	MODULE_WORLDMAP = "Main World Map",
	MODULE_WORLDMAP_KEY_FORMAT = "• %s",
	MODULE_WORLDMAP_TOGGLE = "Toggle Tracked Mob Paths",
	MODULE_WORLDMAP_TOGGLE_DESC = "Toggle _|cffCCCC88NPCScan|r.Overlay's paths for tracked NPCs.",
	MODULE_WORLDMAP_KEYTOGGLE = "Toggle Mob Path Key",
	MODULE_WORLDMAP_KEYTOGGLE_DESC = "Toggle Path Key.",
	BUTTON_TOOLTIP_LINE1 = "|cffffee00 _NPCScan.Overlay|r",
	BUTTON_TOOLTIP_LINE2 = "|cffd6ff00 Click: |r Toggles World Map paths",
	BUTTON_TOOLTIP_LINE3 = "|cffd6ff00 Shift Click: |r Toggles World Map key",
	BUTTON_TOOLTIP_LINE4 = "|cffd6ff00 Right-Click: |r Toggles Mini Map paths",
	BUTTON_TOOLTIP_LINE5 = "|cffaaf200 Middle-Click: |r Toggle display of Both Mini & World Map paths",
	BUTTON_TOOLTIP_LINE6 = "|cff6cff00 Shift Middle-Click: |r Open Options Menu",

	-- Phrases localized by default UI
	CONFIG_ENABLE = ENABLE;
}, {
	__index = function ( self, Key )
		if ( Key ~= nil ) then
			rawset( self, Key, Key );
			return Key;
		end
	end;
} );


SLASH__NPCSCAN_OVERLAY1 = "/npcscanoverlay";
SLASH__NPCSCAN_OVERLAY2 = "/npcoverlay";
SLASH__NPCSCAN_OVERLAY3 = "/overlay";

BINDING_HEADER__NPCSCAN_OVERLAY = "_|cffCCCC88NPCScan.Overlay|r";
_G[ "BINDING_NAME_KEY _NPCScan.Overlay.Button:LeftButton" ] = [=[Toggle Mob Key]=];
_G[ "BINDING_NAME_PATH _NPCScan.Overlay.Button:LeftButton" ] = [=[Toggle Mob Paths]=];