--[[	
	GetAchievementCriteriaInfo
	BC		=	1312
	WotLK	=	2256
	Mop		=	7439
]]--
local _, tmp1, tmp2, tmp3
local months = {CalendarGetMonthNames()}

local function GetSpecNameById(id)
	_, tmp1 = GetSpecializationInfoByID(id)
	return tmp1
end

AtlasLoot_IngameLocales = {
	-- ######################################################################
	-- Rares
	-- ######################################################################
	--- Burning Crusade - Outland: Bloody Rare
	["Ambassador Jerrikar"] = GetAchievementCriteriaInfo(1312,1),
	["Bog Lurker"] = GetAchievementCriteriaInfo(1312,2),
	["Chief Engineer Lorthander"] = GetAchievementCriteriaInfo(1312,3),
	["Coilfang Emissary"] = GetAchievementCriteriaInfo(1312,4),
	["Collidus the Warp-Watcher"] = GetAchievementCriteriaInfo(1312,5),
	["Crippler"] = GetAchievementCriteriaInfo(1312,6),
	["Doomsayer Jurim"] = GetAchievementCriteriaInfo(1312,7),
	["Ever-Core the Punisher"] = GetAchievementCriteriaInfo(1312,8),
	["Fulgorge"] = GetAchievementCriteriaInfo(1312,9),
	["Goretooth"] = GetAchievementCriteriaInfo(1312,10),
	["Hemathion"] = GetAchievementCriteriaInfo(1312,11),
	["Kraator"] = GetAchievementCriteriaInfo(1312,12),
	["Marticar"] = GetAchievementCriteriaInfo(1312,13),
	["Mekthorg the Wild"] = GetAchievementCriteriaInfo(1312,14),
	["Morcrush"] = GetAchievementCriteriaInfo(1312,15),
	["Nuramoc"] = GetAchievementCriteriaInfo(1312,16),
	["Okrek"] = GetAchievementCriteriaInfo(1312,17),
	["Speaker Mar'grom"] = GetAchievementCriteriaInfo(1312,18),
	["Voidhunter Yar"] = GetAchievementCriteriaInfo(1312,19),
	["Vorakem Doomspeaker"] = GetAchievementCriteriaInfo(1312,20),

	--- Wrath of the Lich King - Northrend: Frostbitten
	["Aotona"] = GetAchievementCriteriaInfo(2256,19),
	["Crazed Indu'le Survivor"] = GetAchievementCriteriaInfo(2256,11),
	["Dirkee"] = GetAchievementCriteriaInfo(2256,22),
	["Fumblub Gearwind"] = GetAchievementCriteriaInfo(2256,5),
	["Griegen"] = GetAchievementCriteriaInfo(2256,17),
	["Grocklar"] = GetAchievementCriteriaInfo(2256,13),
	["High Thane Jorfus"] = GetAchievementCriteriaInfo(2256,2),
	["Hildana Deathstealer"] = GetAchievementCriteriaInfo(2256,3),
	["Icehorn"] = GetAchievementCriteriaInfo(2256,6),
	["King Krush"] = GetAchievementCriteriaInfo(2256,20),
	["King Ping"] = GetAchievementCriteriaInfo(2256,9),
	["Loque'nahak"] = GetAchievementCriteriaInfo(2256,1),
	["Old Crystalbark"] = GetAchievementCriteriaInfo(2256,4),
	["Perobas the Bloodthirster"] = GetAchievementCriteriaInfo(2256,7),
	["Putridus the Ancient"] = GetAchievementCriteriaInfo(2256,23),
	["Scarlet Highlord Daion"] = GetAchievementCriteriaInfo(2256,12),
	["Seething Hate"] = GetAchievementCriteriaInfo(2256,14),
	["Syreian the Bonecarver"] = GetAchievementCriteriaInfo(2256,15),
	["Terror Spinner"] = GetAchievementCriteriaInfo(2256,18),
	["Tukemuth"] = GetAchievementCriteriaInfo(2256,10),
	["Vigdis the War Maiden"] = GetAchievementCriteriaInfo(2256,8),
	["Vyragosa"] = GetAchievementCriteriaInfo(2256,21),
	["Zul'drak Sentinel"] = GetAchievementCriteriaInfo(2256,16),

	--- Mists of Pandaria - Pandaria: Glorious!
	["Aethis"] = GetAchievementCriteriaInfo(7439,8),
	["Ahone the Wanderer"] = GetAchievementCriteriaInfo(7439,39),
	["Ai-Li Skymirror"] = GetAchievementCriteriaInfo(7439,41),
	["Ai-Ran the Shifting Cloud"] = GetAchievementCriteriaInfo(7439,42),
	["Arness the Scale"] = GetAchievementCriteriaInfo(7439,45),
	["Blackhoof"] = GetAchievementCriteriaInfo(7439,51),
	["Bonobos"] = GetAchievementCriteriaInfo(7439,2),
	["Borginn Darkfist"] = GetAchievementCriteriaInfo(7439,25),
	["Cournith Waterstrider"] = GetAchievementCriteriaInfo(7439,10),
	["Dak the Breaker"] = GetAchievementCriteriaInfo(7439,55),
	["Eshelon"] = GetAchievementCriteriaInfo(7439,12),
	["Ferdinand"] = GetAchievementCriteriaInfo(7439,50),
	["Gaarn the Toxic"] = GetAchievementCriteriaInfo(7439,24),
	["Gar'lok"] = GetAchievementCriteriaInfo(7439,20),
	["Go-Kan"] = GetAchievementCriteriaInfo(7439,52),
	["Havak"] = GetAchievementCriteriaInfo(7439,32),
	["Ik-Ik the Nimble"] = GetAchievementCriteriaInfo(7439,6),
	["Jonn-Dar"] = GetAchievementCriteriaInfo(7439,30),
	["Kah'tir"] = GetAchievementCriteriaInfo(7439,33),
	["Kal'tik the Blight"] = GetAchievementCriteriaInfo(7439,21),
	["Kang the Soul Thief"] = GetAchievementCriteriaInfo(7439,28),
	["Karr the Darkener"] = GetAchievementCriteriaInfo(7439,27),
	["Kor'nas Nightsavage"] = GetAchievementCriteriaInfo(7439,22),
	["Korda Torros"] = GetAchievementCriteriaInfo(7439,53),
	["Krax'ik"] = GetAchievementCriteriaInfo(7439,15),
	["Krol the Blade"] = GetAchievementCriteriaInfo(7439,34),
	["Lith'ik the Stalker"] = GetAchievementCriteriaInfo(7439,19),
	["Lon the Bull"] = GetAchievementCriteriaInfo(7439,54),
	["Major Nanners"] = GetAchievementCriteriaInfo(7439,7),
	["Mister Ferocious"] = GetAchievementCriteriaInfo(7439,1),
	["Moldo One-Eye"] = GetAchievementCriteriaInfo(7439,49),
	["Morgrinn Crackfang"] = GetAchievementCriteriaInfo(7439,29),
	["Nal'lak the Ripper"] = GetAchievementCriteriaInfo(7439,16),
	["Nalash Verdantis"] = GetAchievementCriteriaInfo(7439,13),
	["Nasra Spothide"] = GetAchievementCriteriaInfo(7439,37),
	["Nessos the Oracle"] = GetAchievementCriteriaInfo(7439,46),
	["Norlaxx"] = GetAchievementCriteriaInfo(7439,26),
	["Omnis Grinlok"] = GetAchievementCriteriaInfo(7439,48),
	["Qu'nas"] = GetAchievementCriteriaInfo(7439,31),
	["Ruun Ghostpaw"] = GetAchievementCriteriaInfo(7439,38),
	["Sahn Tidehunter"] = GetAchievementCriteriaInfo(7439,14),
	["Salyin Warscout"] = GetAchievementCriteriaInfo(7439,44),
	["Sarnak"] = GetAchievementCriteriaInfo(7439,43),
	["Scritch"] = GetAchievementCriteriaInfo(7439,4),
	["Sele'na"] = GetAchievementCriteriaInfo(7439,9),
	["Siltriss the Sharpener"] = GetAchievementCriteriaInfo(7439,47),
	["Ski'thik"] = GetAchievementCriteriaInfo(7439,18),
	["Spriggin"] = GetAchievementCriteriaInfo(7439,3),
	["Sulik'shor"] = GetAchievementCriteriaInfo(7439,23),
	["The Yowler"] = GetAchievementCriteriaInfo(7439,5),
	["Torik-Ethis"] = GetAchievementCriteriaInfo(7439,17),
	["Urgolax"] = GetAchievementCriteriaInfo(7439,35),
	["Urobi the Walker"] = GetAchievementCriteriaInfo(7439,36),
	["Yorik Sharpeye"] = GetAchievementCriteriaInfo(7439,56),
	["Yul Wildpaw"] = GetAchievementCriteriaInfo(7439,40),
	["Zai the Outcast"] = GetAchievementCriteriaInfo(7439,11),

	--- Other Rares
	["Darkmoon Rabbit"] = GetItemInfo(80008),

	-- ######################################################################
	--- Items
	----- These need to be converted to instead of those in constant files one.
	----- If an entry isn't in use anymore, delete it.
	----- Once this has been done, delete these lines.
	-- ######################################################################
	---- Feast of Winter Veil
	["Carefully Wrapped Present"] = GetItemInfo(21191),
	["Gaily Wrapped Present"] = GetItemInfo(21310),
	["Gently Shaken Gift"] = GetItemInfo(21271),
	["Festive Gift"] = GetItemInfo(21363),
	["Smokywood Pastures Extra-Special Gift"] = GetItemInfo(21216),
	["Stolen Present"] = GetItemInfo(93626),
	["Ticking Present"] = GetItemInfo(21327),
	["Winter Veil Gift"] = GetItemInfo(70938),
	---- Hallow's End
	["Handful of Treats"] = GetItemInfo(37586),
	["Treat Bag"] = GetItemInfo(20393), --- still in game?
	---- Love is in the Air
	["Bag of Heart Candies"] = GetItemInfo(21813),
	["Box of Chocolates"] = GetItemInfo(49909),
	["Dinner Suit Box"] = GetItemInfo(50161),
	["Lovely Dress Box"] = GetItemInfo(50160),
	---- Lunar Festival
	["Lucky Red Envelope"] = GetItemInfo(21746),
	---- Noblegarden
	["Brightly Colored Egg"] = GetItemInfo(45072),
	---- Related to Mounts and Pets
	["Cracked Egg"] = GetItemInfo(39883),
	["Hidden Stash"] = GetItemInfo(61387),
	["Hyldnir Spoils"] = GetItemInfo(44751),
	["Mysterious Egg"] = GetItemInfo(39878),
	["Ominous Seed"] = GetItemInfo(85219),
	["Oozing Bag"] = GetItemInfo(20768),
	["Ripe Disgusting Jar"] = GetItemInfo(44718),
	["Sack of Pet Supplies"] = GetItemInfo(89125),
	---- Related to Professions
	["Small Spice Bag"] = GetItemInfo(44113),
	["Spirit of Harmony"] = GetItemInfo(76061),
	["Stendel's Bane"] = GetItemInfo(68795),
	["Treasures of the Vale"] = GetItemInfo(90625),
	---- Related to BoE World Epics
	["Big Bag of Arms"] = GetItemInfo(87218),
	["Big Bag of Mysteries"] = GetItemInfo(87220),
	["Flame-Scarred Junkbox"] = GetItemInfo(63349),
	["Reinforced Junkbox"] = GetItemInfo(43575),
	["Vine-Cracked Junkbox"] = GetItemInfo(88165),
	---- Other Items
	["Fathom Core"] = GetItemInfo(16762),
	["Felvine Shard"] = GetItemInfo(18501),
	["Lorgalis Manuscript"] = GetItemInfo(5359),
	["Overcharged Manacell"] = GetItemInfo(30824),
	["The Saga of Terokk"] = GetItemInfo(27634),
	
	-- ######################################################################
	-- Months
	-- ######################################################################
	["January"] = months[1],
	["February"] = months[2],
	["March"] = months[3],
	["April"] = months[4],
	["May"] = months[5],
	["June"] = months[6],
	["July"] = months[7],
	["August"] = months[8],
	["September"] = months[9],
	["October"] = months[10],
	["November"] = months[11],
	["December"] = months[12],
	
	-- ######################################################################
	-- Class Specs
	-- ######################################################################
	["Balance"] = GetSpecNameById(102),
	["Feral"] = GetSpecNameById(103),
	["Guardian"] = GetSpecNameById(104),
	["Restoration"] = GetSpecNameById(105),
	["Holy"] = GetSpecNameById(257),
	["Discipline"] = GetSpecNameById(256),
	["Protection"] = GetSpecNameById(66),
	["Retribution"] = GetSpecNameById(70),
	["Shadow"] = GetSpecNameById(258),
	["Elemental"] = GetSpecNameById(262),
	["Enhancement"] = GetSpecNameById(263),
	["Fury"] = GetSpecNameById(72),
	["Demonology"] = GetSpecNameById(266),
	["Destruction"] = GetSpecNameById(267),
	["Mistweaver"] = GetSpecNameById(270),
	["Brewmaster"] = GetSpecNameById(268),
	["Windwalker"] = GetSpecNameById(269),
	
	-- ######################################################################
	-- Professions
	-- ######################################################################
	-- Cooking
	["Way of the Brew"] = GetSpellInfo(125589),
	["Way of the Grill"] = GetSpellInfo(124694),
	["Way of the Oven"] = GetSpellInfo(125588),
	["Way of the Pot"] = GetSpellInfo(125586),
	["Way of the Steamer"] = GetSpellInfo(125587),
	["Way of the Wok"] = GetSpellInfo(125584),
	
	-- Insc
	["Book of Glyph Mastery"] = GetSpellInfo(64323),
}

do
	setmetatable(AtlasLoot_IngameLocales, { __index = function(tab, key) return rawget(tab, key) or key end } )
end