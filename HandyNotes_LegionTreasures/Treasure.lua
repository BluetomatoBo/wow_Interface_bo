local myname, ns = ...

-- note to self: I like Garr_TreasureIcon...

local ORDER = 1220 -- order resources currency
local ARGUNITE = 1508
local ARTIFACT = 'ARTIFACT'
local CHEST = 'Treasure Chest'
local CHEST_SM = 'Small Treasure Chest'
local CHEST_GLIM = 'Glimmering Treasure Chest'
local LEGION_SUPPLIES = 'Legion War Supplies'
local REQ_GRAPPLE = 'Requires: Stormforged Grapple Launcher'
local path = function(questid, label, atlas, note, scale)
    label = label or "Path to treasure"
    atlas = atlas or "map-icon-SuramarDoor.tga" -- 'PortalPurple'
    return {
        quest = questid,
        label = label,
        atlas = atlas,
        path = true,
        scale = scale,
        note = note,
    }
end
ns.path = path
local grapple = function(questid, note)
    -- 'Vehicle-SilvershardMines-Arrow'
    return path(questid, "Grapple start point", 'MiniMap-DeadArrow', note, 1.5)
end
ns.grapple = grapple

ns.map_spellids = {
    ["Azsuna"] = 182958,
    ["Highmountain"] = 188741,
    ["Stormheim"] = 182957,
    ["Suramar"] = 199416,
    ["Valsharah"] = 185719,
    ["ArgusMacAree"] = true,
    ["ArgusCore"] = true,
    ["ArgusSurface"] = true,
}

ns.points = {
    --[[ structure:
    [mapFile] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            currency=[id], -- currencyid
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
        },
    },
    --]]
    ["Azsuna"] = {
        [26254713] = {quest=44105, currency=ARTIFACT, label=CHEST_SM},
        [34583556] = {quest=44102, currency=ARTIFACT, label=CHEST_SM},
        [40575767] = {quest=38316, currency=ARTIFACT, label=CHEST},
        [41393075] = {quest=42292, currency=ARTIFACT, label=CHEST},
        [42600810] = {quest=38367, currency=ARTIFACT, label=CHEST_GLIM},
        [43402243] = {quest=42297, currency=ARTIFACT, label=CHEST_GLIM},
        [44473946] = {quest=37713, currency=ARTIFACT, label=CHEST_SM},
        [47860773] = {quest=42295, currency=ARTIFACT, label=CHEST_SM},
        [49384536] = {quest=37828, currency=ARTIFACT, item=122681, label=CHEST},
        [49415800] = {quest=38370, currency=ARTIFACT, item=141882, label=CHEST},
        [49653448] = {quest=37831, currency=ARTIFACT, label=CHEST_SM},
        [50215029] = {quest=42290, currency=ARTIFACT, label=CHEST_SM},
        [50465211] = {quest=44081, currency=ARTIFACT, item=140685, label="Treacherous Stallions", note="Ley Portal @ 60.3, 46.3; kill the stallions"},
        [60304630] = path(44081, "Ley Portal", "MagePortalAlliance"),
        [51502430] = {quest=42289, currency=ARTIFACT, label=CHEST, note="Leyhollow cave entrance @ 47.8, 23.7"},
        [47802370] = path(42289),
        [52004210] = {quest=42281, currency=ARTIFACT, label=CHEST_SM},
        [52842059] = {quest=42339, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 53.9, 22.4; don't wake up the bears"},
        [53902240] = path(42339),
        [53033726] = {quest=37596, currency=ARTIFACT, label=CHEST_SM},
        [53176444] = {quest=37829, currency=ARTIFACT, label=CHEST},
        [53504545] = {quest=42283, currency=ARTIFACT, label=CHEST_SM},
        [53611813] = {quest=44104, currency=ARTIFACT, label=CHEST_SM},
        [53684396] = {quest=42282, currency=ARTIFACT, label=CHEST_SM},
        [53834053] = {quest=42284, currency=ARTIFACT, label=CHEST_SM, note="Inside the Academy"},
        [54313633] = {quest=42287, currency=ARTIFACT, label=CHEST_SM},
        [54403490] = {quest=42285, currency=ARTIFACT, label=CHEST_SM, note="Inside the Academy"},
        [54875214] = {quest=44405, currency=ARTIFACT, label=CHEST_SM},
        [55310505] = {quest=38389, currency=ARTIFACT, label=CHEST_SM},
        [55362774] = {quest=42288, currency=ARTIFACT, label=CHEST_SM},
        [55621855] = {quest=40711, currency=ARTIFACT, label=CHEST, note="Ley Portal inside tower"},
        [55905690] = {quest=38365, currency=ARTIFACT, label="Disputed Treasure"},
        [56443481] = {quest=38251, currency=ARTIFACT, item=132950, label=CHEST},
        [56892499] = {quest=42338, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 55.7, 25.4"},
        [55702540] = path(42338),
        [57153106] = {quest=38419, currency=ARTIFACT, label=CHEST},
        [57901220] = {quest=37958, currency=ARTIFACT, label=CHEST},
        [58364378] = {quest=37830, currency=ARTIFACT, label=CHEST_GLIM},
        [58381229] = {quest=37980, currency=ARTIFACT, label=CHEST, note="Ley Portal @ 58.7, 14.1"},
        [58701410] = path(37980, "Ley Portal", "MagePortalAlliance"),
        [58645340] = {quest=40752, currency=ARTIFACT, label=CHEST_SM},
        [59876316] = {quest=42272, currency=ARTIFACT, label=CHEST_SM},
        [62405840] = {quest=42273, currency=ARTIFACT, label=CHEST_SM},
        [62814479] = {quest=42294, currency=ARTIFACT, label=CHEST_SM},
        [63005420] = {quest=42278, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 64.0, 52.9"},
        [64005290] = path(42278),
        [63231521] = {quest=37832, currency=ARTIFACT, label=CHEST},
        [63653919] = {quest=42293, currency=ARTIFACT, label=CHEST_SM},
        [65066978] = {quest=38239, item=129070, label="Seemingly Unguarded Treasure", note="Seemingly..."},
        [65462961] = {quest=42958, currency=ARTIFACT, label=CHEST_SM},
        [66064345] = {quest=40751, currency=ARTIFACT, label=CHEST_SM},
        [68872973] = {quest=44103, currency=ARTIFACT, label=CHEST_SM, note="Underwater cave, entrance is on east side of cliff"},
    },
    ["Highmountain"] = {
        [36616213] = {quest=40488, currency=ARTIFACT, label=CHEST},
        [37353381] = {quest=40477, currency=ARTIFACT, label=CHEST_SM},
        [39005450] = {quest=44731, currency=ARTIFACT, label=CHEST, note="Path up behind Nesingwary's camp"},
        [39307621] = {quest=40473, currency=ARTIFACT, label=CHEST, note="Hard to reach; try from behind the totem"},
        [39376229] = {quest=40474, currency=ARTIFACT, label=CHEST},
        [39555744] = {quest=39812, currency=ARTIFACT, label=CHEST},
        [39704830] = {quest=39494, currency=ARTIFACT, item=131763, label="Floating Treasure", note="On river surface, moves"},
        [42203482] = {quest=40480, currency=ARTIFACT, label=CHEST_SM},
        [42212730] = {quest=40479, currency=ARTIFACT, label=CHEST},
        [43582510] = {quest=40478, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 42.5, 25.4"},
        [42502540] = path(40478),
        [43757275] = {quest=40510, currency=ARTIFACT, label=CHEST_SM},
        [45192746] = {quest=44279, currency=ARTIFACT, label=CHEST_SM, note="Underwater cave"},
        [45573462] = {quest=40481, currency=ARTIFACT, label=CHEST_SM},
        [46227340] = {quest=40489, currency=ARTIFACT, label=CHEST},
        [46302760] = {quest=44280, item=131753, label=CHEST},
        [46682810] = {quest=40482, currency=ARTIFACT, label=CHEST_GLIM, note="Top of the building"},
        [46814013] = {quest=40507, currency=ARTIFACT, label=CHEST_SM, note="All the way at the top of the mountain"},
        [47644406] = {quest=39503, item=131926, label=CHEST, note="1/4 of slow fall toy", toy=true},
        [49647128] = {quest=39606, currency=ARTIFACT, label=CHEST_GLIM, note="Inside cave"},
        [49653772] = {quest=39466, item=131927, label=CHEST, note="1/4 of slow fall toy, in nest at top of mountain", toy=true},
        [50243861] = {quest=40497, currency=ARTIFACT, label=CHEST_SM, note="Cave @ 51.6, 37.4"},
        [50813504] = {quest=40506, currency=ARTIFACT, label=CHEST_SM, note="All the way at the top of the mountain"},
        [50983647] = {quest=40496, currency=ARTIFACT, label=CHEST, note="Cave @ 51.6, 37.4"},
        [50983880] = {quest=40498, currency=ARTIFACT, label=CHEST},
        [52023241] = {quest=40505, currency=ARTIFACT, label=CHEST},
        [52305141] = {quest=39766, item=131802, label="Totally Safe Treasure Chest"},
        [53035224] = {quest=40493, currency=ARTIFACT, label=CHEST_SM},
        [49905380] = path(40493, "Crystal Fissure"),
        [51175305] = {quest=39471, currency=ARTIFACT, label=CHEST_GLIM, note="Path past the Skyhorn"},
        [52566637] = {quest=42453, currency=ARTIFACT, label=CHEST, note="Only after Battle of Snowblind Mesa quests are done?"},
        [53004830] = path(39471, "Path to Reflection Peak"),
        [53063946] = {quest=40499, currency=ARTIFACT, label=CHEST_SM},
        [53414868] = {quest=40500, currency=ARTIFACT, label=CHEST_SM},
        [53454352] = {quest=40484, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 55.1, 44.3"},
        [53615103] = {quest=39824, item=131810, label=CHEST, note="1/4 of slow fall toy; on ledge, path to southeast", toy=true},
        [55405270] = path(39824, "Path to Derelict Skyhorn Kite"),
        [54174159] = {quest=40483, currency=ARTIFACT, label=CHEST_GLIM, note="Cave entrance @ 55.1, 44.3"},
        [55104430] = path({40483, 40484, 40414}, "Candle Rock"),
        [55134965] = {quest=40487, currency=ARTIFACT, label=CHEST_SM},
        [38406150] = path(40476, "Lifespring Cavern"),
        [41407250] = path(40489, "Bitestone Enclave"),
        [44707230] = path({39606, 40508, 40509, 48381}, "Neltharion's Vault"),
        [51603740] = path({40496, 40497, 40406}, "Rockcrawler Chasm"),
        [48103390] = path({40496, 40497, 40406}, "Rockcrawler Chasm"),
        [32206680] = {achievement=10774, item=139773, toy=true}, -- Emerald Winds
    },
    ["Stormheim"] = {
        [27335749] = {quest=38529, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 31.4, 57.1"},
        [31405710] = path(38529),
        [31105600] = {quest=38676, currency=ORDER, label=CHEST_SM},
        [32054719] = {quest=43196, currency=ARTIFACT, label=CHEST},
        [32742791] = {quest=38490, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 33.6, 27.3"},
        [33602730] = path(38490),
        [33143607] = {quest=38495, currency=ARTIFACT, label=CHEST},
        [35033660] = {quest=38487, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 34.8, 34.2"},
        [34803420] = path(38487),
        [35176898] = {quest=38478, currency=ARTIFACT, label=CHEST_SM},
        [35735415] = {quest=38677, currency=ARTIFACT, item=140310, label=CHEST, note="On the wrecked ship"},
        [35924792] = {quest=38680, currency=ARTIFACT, label=CHEST_SM},
        [37183865] = {quest=43208, currency=ARTIFACT, label=CHEST_SM},
        [39486518] = {quest=38486, currency=ARTIFACT, label=CHEST},
        [39571934] = {quest=38498, currency=ARTIFACT, label=CHEST_SM},
        [40656852] = {quest=38475, currency=ARTIFACT, label=CHEST_SM, note="In tower; grapple to wall, then to top of tower"},
        [41744604] = {quest=38488, currency=ARTIFACT, label=CHEST_SM},
        [42336112] = {quest=38477, currency=ARTIFACT, label=CHEST_SM},
        [42473407] = {quest=43189, currency=ARTIFACT, item=141896, label=CHEST_GLIM, note="Entrance @ 42.2, 34.9"},
        [42203490] = path(43189),
        [42616579] = {quest=38474, currency=ARTIFACT, label=CHEST},
        [43164049] = {quest=43238, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [43708009] = {quest=43239, currency=ARTIFACT, label=CHEST_SM, note="Grapple starting by Erilar at 43.8, 80.6"},
        [43708009] = grapple(43239),
        [44166997] = {quest=38489, currency=ARTIFACT, label=CHEST_SM, note="On top of the hut, grapple up"},
        [44983823] = {quest=43240, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [46606496] = {quest=38681, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 48.2, 65.2"},
        [48206520] = path(38681),
        [46768040] = {quest=38481, currency=ARTIFACT, label=CHEST, note=REQ_GRAPPLE},
        [47463412] = {quest=43255, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [47986237] = {quest=38738, currency=ARTIFACT, label=CHEST, note="Underwater, at base of waterfall"},
        [48137421] = {quest=38476, currency=ARTIFACT, label=CHEST_SM},
        [49085999] = {quest=43207, currency=ARTIFACT, label=CHEST_SM},
        [49694731] = {quest=38763, currency=ARTIFACT, item=132897, label=CHEST_GLIM, note="Guarded by Vault Keepers"},
        [49777801] = {quest=38485, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [50061816] = {quest=43195, currency=ARTIFACT, label=CHEST},
        [50314100] = {quest=38483, currency=ARTIFACT, label=CHEST_SM, note="In cave"},
        [50554125] = {quest=43246, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [52018058] = {quest=38480, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [53229314] = {quest=43190, currency=ARTIFACT, label=CHEST_SM},
        [55004716] = {quest=40095, currency=ARTIFACT, label=CHEST},
        [57946321] = {quest=40090, currency=ARTIFACT, label=CHEST_SM},
        [58044751] = {quest=40082, currency=ARTIFACT, label=CHEST_SM},
        [59305846] = {quest=40088, currency=ARTIFACT, label=CHEST},
        [60834273] = {quest=40094, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [61404440] = {quest=40093, currency=ARTIFACT, label=CHEST_SM},
        [61836289] = {quest=40089, currency=ARTIFACT, label=CHEST},
        [61836289] = {quest=40089, currency=ARTIFACT, label=CHEST},
        [61933255] = {quest=38744, currency=ARTIFACT, label=CHEST_SM},
        [62667362] = {quest=40091, currency=ARTIFACT, label=CHEST_SM},
        [64293956] = {quest=43302, currency=ARTIFACT, label=CHEST_SM},
        [64224161] = path(43302),
        [65364310] = {quest=43205, currency=ARTIFACT, label=CHEST_SM},
        [65585737] = {quest=43187, currency=ARTIFACT, label=CHEST_SM},
        [67935774] = {quest=40083, currency=ARTIFACT, label=CHEST_SM},
        [68462959] = {quest=40108, currency=ARTIFACT, label=CHEST_GLIM, note=REQ_GRAPPLE},
        [68402000] = path(40108),
        [68974183] = {quest=40086, currency=ARTIFACT, label=CHEST_SM, note="Tomb entrance @ 70.0, 42.6"},
        [69964262] = path(40086),
        [69144478] = {quest=38637, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [69986719] = {quest=43188, currency=ARTIFACT, label=CHEST_SM},
        [71924425] = {quest=43305, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [70734281] = grapple(43305),
        [72135489] = {quest=42628, currency=ARTIFACT, label=CHEST_SM},
        [73154570] = {quest=43194, currency=ARTIFACT, label=CHEST_SM},
        [73334150] = {quest=40085, currency=ARTIFACT, label=CHEST_SM},
        [73965223] = {quest=42632, currency=ARTIFACT, label=CHEST_SM},
        [73975858] = {quest=43237, currency=ARTIFACT, label=CHEST_SM},
        [74414182] = {quest=43306, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [75164949] = {quest=42629, currency=ARTIFACT, label=CHEST, note="On top of the mast"},
        [75676060] = {quest=43304, currency=ARTIFACT, label=CHEST_SM, note=REQ_GRAPPLE},
        [78427138] = {quest=43307, currency=ARTIFACT, label=CHEST, note="*Really* requires the Stormforged Grapple Launcher"},
        [75846406] = grapple(43307, "Route *requires* taking some falling damage, I think."),
        [81876750] = {quest=40099, currency=ARTIFACT, label=CHEST},
        [82405451] = {quest=43191, currency=ARTIFACT, label=CHEST_SM},
    },
    ["Suramar"] = {
        [16602974] = {quest=43846, currency=ARTIFACT, label=CHEST_SM},
        [17275462] = {quest=43844, currency=ARTIFACT, label=CHEST},
        [19791604] = {quest=43845, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 19.4, 19.4"},
        [19401940] = path(43845),
        [20605040] = path({43839, 43840, 43747}, "Falanaar Tunnels"),
        [21425446] = {quest=42842, item=136269, label="Kel'danath's Manaflask"},
        [22863574] = path({43838, 43988}, "Temple of Fal'adora"),
        [23414880] = {quest=43842, currency=ARTIFACT, label=CHEST_SM},
        [25958548] = {quest=43831, currency=ARTIFACT, label=CHEST_SM},
        [26354127] = {quest=42827, item=139890, label="Ancient Mana Chunk"},
        [26831696] = {quest=43847, currency=ARTIFACT, label=CHEST_SM},
        [26877073] = {quest=43987, item=140327, label="Kyrtos's Research Notes", note="Cave entrance @ 27.3, 72.9"},
        [27307290] = path(43987),
        [29271622] = {quest=43848, currency=ARTIFACT, label=CHEST},
        [29768817] = {quest=43748, item=141655, label="Shimmering Ancient Mana Cluster"},
        [31956249] = {quest=43831, currency=ARTIFACT, label=CHEST_SM},
        [32317708] = {quest=43834, currency=ARTIFACT, label=CHEST_SM, note="Inside the Lightbreaker, after quests; portal @ 31.0, 85.1"},
        [31008510] = path(43834),
        [35561209] = {quest=43989, item=140329, label="Arcane Power Unit"},
        [38138712] = {quest=43830, currency=ARTIFACT, label=CHEST_SM},
        [41961919] = {quest=43746, item=139786, label="Shimmering Ancient Mana Cluster"},
        [42051968] = {quest=43849, item=139786, label=CHEST_GLIM},
        [42577668] = {quest=43870, currency=ARTIFACT, label=CHEST_SM, note="Upstairs"},
        [44053194] = {quest=43856, item=139786, label=CHEST_GLIM, note="Cave entrance behind waterfall @ 42.2, 30.0"},
        [42203000] = path(43856),
        [44302289] = {quest=43850, currency=ARTIFACT, label=CHEST},
        [44387587] = {quest=43869, currency=ARTIFACT, label=CHEST_SM},
        [44803100] = {quest=43986, item=140326, label="Enchanted Burial Urn", note="Doesn't stand out much; by the bench, upper level"},
        [46552599] = {quest=43744, item=141655, label="Shimmering Ancient Mana Cluster"},
        [48117321] = {quest=43865, currency=ARTIFACT, label=CHEST_SM, note="Grapple to it"},
        [48143399] = {quest=43853, currency=ARTIFACT, label=CHEST_SM},
        [48288261] = {quest=43866, currency=ARTIFACT, label=CHEST_SM, note="Grapple from 48.4, 82.2"},
        [48408220] = grapple(43866),
        [48297121] = {quest=44324, currency=ARTIFACT, label=CHEST, note="Upstairs"},
        [48587217] = {quest=44323, currency=ARTIFACT, label=CHEST, note="Upstairs"},
        [48957379] = {quest=43867, currency=ARTIFACT, label=CHEST, note="Upstairs"},
        [49988493] = {quest=43864, currency=ARTIFACT, label=CHEST_SM, note="Grapple from 50.0, 84.5"},
        [50008450] = grapple(43864),
        [50068061] = {quest=44325, currency=ARTIFACT, label=CHEST, note="Upstairs"},
        [51503859] = {quest=43855, currency=ARTIFACT, label=CHEST_SM},
        [51908214] = {quest=43868, currency=ARTIFACT, label=CHEST},
        [52272989] = {quest=43854, currency=ARTIFACT, label=CHEST},
        [52733130] = {quest=40767, currency=ARTIFACT, label="Dusty Coffer"},
        [49503390] = path({43854,40767}),
        [54326033] = {quest=43875, currency=ARTIFACT, label=CHEST},
        [55685480] = {quest=43871, currency=ARTIFACT, label=CHEST_SM},
        [57326039] = {quest=43873, currency=ARTIFACT, label=CHEST},
        [57686197] = {quest=43874, currency=ARTIFACT, label=CHEST},
        [60356851] = {quest=43876, item=139786, label=CHEST_GLIM},
        [61365550] = {quest=43872, currency=ARTIFACT, label=CHEST},
        [63654911] = {quest=43857, currency=ARTIFACT, label=CHEST_SM},
        [65814191] = {quest=43743, item=141655, label="Shimmering Ancient Mana Cluster", note="At the back of the leyline cave"},
        [67315511] = {quest=43858, currency=ARTIFACT, label=CHEST},
        [71464975] = {quest=43859, currency=ARTIFACT, label=CHEST_SM},
        [76886150] = {quest=43860, currency=ARTIFACT, label=CHEST_SM, note="Underwater, in a sunken ship"},
        [79647289] = {quest=43741, item=141655, label="Shimmering Ancient Mana Cluster"},
        [81965745] = {quest=43861, currency=ARTIFACT, label=CHEST_SM, note="Entrance @ 79.3, 57.4"},
        [79305740] = path(43861),
        [83126933] = {quest=43863, currency=ARTIFACT, label=CHEST},
        [83975764] = {quest=43862, currency=ARTIFACT, label=CHEST},
    },
    ["Valsharah"] = {
        [33815826] = {quest=39081, currency=ARTIFACT, label=CHEST},
        -- [37005734] = {quest=39083, currency=ARTIFACT, label=CHEST_SM},
        [38456530] = {quest=39080, currency=ARTIFACT, label=CHEST_SM, note="Basement; must have completed The Farmsteads"},
        [38626718] = {quest=39079, currency=ARTIFACT, label=CHEST_SM},
        [39945460] = {quest=38369, currency=ARTIFACT, label=CHEST_SM},
        [41404560] = path({39085,39086}, "Darkpens"),
        [42665801] = {quest=39077, currency=ARTIFACT, label=CHEST_SM},
        [43068822] = {quest=44138, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 43.7, 89.9"},
        [43225488] = {quest=39084, currency=ARTIFACT, label=CHEST, note="Top of wall"},
        [43397589] = {quest=38363, currency=ARTIFACT, label=CHEST_SM},
        [44358257] = {quest=38387, currency=ARTIFACT, item=141892, label=CHEST, note="Cave under the inn; entrance behind the building"},
        [45106120] = {quest=39083, currency=ARTIFACT, label=CHEST_SM, note="Hidden in the tree"},
        [46448630] = {quest=38277, currency=ARTIFACT, label=CHEST_SM},
        [48687381] = {quest=38366, currency=ARTIFACT, label=CHEST_SM, note="Under tree roots"},
        [48998615] = {quest=38886, currency=ARTIFACT, label=CHEST_SM},
        [51247777] = {quest=38388, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 50.9, 77.0"},
        [50907700] = path(38388),
        [54003489] = {quest=38390, item=141891, currency=ARTIFACT, label=CHEST_GLIM, note="Cave entrance @ 53.2, 38.0"},
        [53203800] = path(38390),
        [54187061] = {quest=39093, currency=ARTIFACT, label=CHEST_SM, note="In cave"},
        [54417419] = {quest=38359, currency=ARTIFACT, label=CHEST_SM, note="In house behind the fence"},
        [54506048] = {quest=39097, currency=ARTIFACT, item=130152, label=CHEST, note="In cave"},
        [54908056] = {quest=38864, currency=ARTIFACT, label=CHEST_SM, note="In underwater cave"},
        -- [54958054] = {quest=38861, currency=ARTIFACT, label=CHEST_SM, note="In underwater cave"}, -- removed? swapped for 38864?
        [54108210] = path(38864, "Route to cave"),
        [55557762] = {quest=38466, item=130147, toy=true, label="Unguarded Thistlemaw Treasure", note="Unguarded..."},
        [56008376] = {quest=38861, currency=ARTIFACT, label=CHEST_SM},
        [56225730] = {quest=39072, currency=ARTIFACT, label=CHEST_SM},
        [59887228] = {quest=38943, currency=ARTIFACT, label=CHEST_SM, note="Upstairs, stairs on the right"},
        [60498216] = {quest=38893, currency=ARTIFACT, label=CHEST_SM, note="Cave entrance @ 62.1, 86.1"},
        [62108610] = path(38893),
        [61006400] = {quest=39087, currency=ARTIFACT, label=CHEST_SM},
        [61017917] = {quest=39089, currency=ARTIFACT, label=CHEST_GLIM},
        [61073421] = {quest=39088, currency=ARTIFACT, label=CHEST, note="Underwater, hidden in roots"},
        [61657372] = {quest=39087, currency=ARTIFACT, label=CHEST_SM},
        [62076737] = {quest=39071, currency=ARTIFACT, label=CHEST, note="Chest behind waterfall"},
        [62707040] = {quest=39069, currency=ARTIFACT, label=CHEST_SM, note="Second floor balcony"},
        [62708526] = {quest=44136, currency=ARTIFACT, label=CHEST_SM},
        [63007700] = {quest=39070, currency=ARTIFACT, label=CHEST_SM, note="Inside Den of Claws, entrance @ 62.2, 76.2"},
        [62207620] = path(39070, "Den of Claws entrance"),
        [63277401] = {quest=39102, currency=ARTIFACT, label=CHEST},
        [63378841] = {quest=38389, currency=ARTIFACT, label=CHEST_SM},
        [63904556] = {quest=44139, currency=ARTIFACT, label=CHEST_SM},
        [64608546] = {quest=38900, currency=ARTIFACT, label=CHEST},
        [65907920] = {quest=38391, currency=ARTIFACT, label=CHEST_SM},
        [64715126] = {quest=38355, currency=ARTIFACT, label=CHEST_SM},
        [65398629] = {quest=39074, currency=ARTIFACT, label=CHEST},
        [66604090] = {quest=39108, currency=ARTIFACT, label=CHEST},
        -- [67105770] = {quest=, item=139023, label="Elven Chest"}, -- no tracking quest triggers here...
        [67215928] = {quest=38782, currency=ARTIFACT, label=CHEST, note="Cave entrance @ 65.9, 56.3; doesn't appear until area quests are finished"},
        [65905630] = path(38782, "Darkgrove Cavern"),
        [67395342] = {quest=38386, currency=ARTIFACT, label=CHEST_SM},
        [68334060] = {quest=39073, currency=ARTIFACT, label=CHEST_SM},
        [69475999] = {quest=38781, currency=ARTIFACT, label=CHEST_SM},
        [70225704] = {quest=38783, currency=ARTIFACT, label=CHEST_SM},
    },
    ["BrokenShore"] = { -- Broken Shore
        -- TODO: are any treasures actually quest-gated?
    },
    ["ArgusSurface"] = { -- Krokuun
        [48505890] = {quest=nil, currency=ARGUNITE, achievement=12074, criteria=37594}, -- Lost Krokul Chest
        [51257624] = {quest=48884, currency=ARGUNITE, achievement=12074, criteria=37592, note="Requires Lightforge Warframe. Jump on the rubble."}, -- Krokuul Emergency Cache
        [55907420] = {quest=49156, currency=ARGUNITE, achievement=12074, criteria=37959, note="Requires Shroud of Arcane Echoes"}, -- Precious Augari Keepsakes
        [62803730] = {quest=nil, currency=ARGUNITE, item=151246, note="Climb up behind the tower", achievement=12074, criteria=37593}, -- Legion Tower Chest
        [75246960] = {quest=49154, currency=ARGUNITE, achievement=12074, criteria=37958, note="Requires Shroud of Arcane Echoes. Stealth before opening."}, -- Long-Lost Augari Treasure

        -- Junk:
        [72293223] = {quest=48339, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [52856280] = {quest=48339, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [61406640] = {quest=48339, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [43505520] = {quest=48339, currency=ARGUNITE, label="Eredar War Supplies", junk=true},

        [48603090] = {quest=47999, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [59544417] = {quest=47999, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [61573519] = {quest=47999, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [62803810] = {quest=47999, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [66802490] = {quest=47999, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [62394178] = {quest=47999, currency=ARGUNITE, label="Eredar War Supplies", junk=true},

        [67606990] = {quest=48000, currency=ARGUNITE, label="Eredar War Supplies", junk=true, note="Up on the ridge"},
        [69406280] = {quest=48000, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [75006420] = {quest=48000, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [71426162] = {quest=48000, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [46508520] = {quest=47997, currency=ARGUNITE, label="Eredar War Supplies", junk=true},
        [40617531] = {quest=47997, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [64203910] = {quest=48885, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true, note="Requires Light's Judgement. Blow the pile of ruble with the ability"},

        [47705940] = {quest=48886, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true, note="Requires Light's Judgement. Blow the pile of ruble with the ability"},

        [32047451] = {quest=48336, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [35475618] = {quest=48336, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [37007430] = {quest=48336, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [41335836] = {quest=48336, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [36396765] = {quest=48336, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [56675875] = {quest=47752, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [55605240] = {quest=47752, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [53305110] = {quest=47752, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [52025959] = {quest=47752, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [58207179] = {quest=47753, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [59377345] = {quest=47753, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [58607990] = {quest=47753, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
    },
    ["ArgusCore"] = { -- Antoran Wastes
        [49135934] = {quest=49020, currency=ARGUNITE, achievement=12074, criteria=37698, note="Behind the waterfall"}, -- Legion Treasure Hoard
        [52102720] = {quest=nil, currency=ARGUNITE, achievement=12074, criteria=37697, note="Requires Light's Judgement"}, -- Fel-Bound Chest
        [57346366] = {quest=nil, currency=ARGUNITE, achievement=12074, criteria=37960, note="Requires Shroud of Arcane Echoes"}, -- Missing Augari Chest
        [58906140] = {quest=nil, currency=ARGUNITE, achievement=12074, criteria=37695, note="Requires Lightforged Warframe"}, -- Forgotten Legion Supplies
        [65903980] = {quest=nil, currency=ARGUNITE, achievement=12074, criteria=37696, note="Requires Light's Judgement"}, -- Ancient Legion War Cache
        [75705260] = {quest=49021, currency=ARGUNITE, achievement=12074, criteria=37699}, -- Timeworn Fel Chest

        -- Junk:
        [57836485] = {quest=48382, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [60897052] = {quest=48382, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [62106933] = {quest=48382, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [64475836] = {quest=48382, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [67516988] = {quest=48382, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [69406320] = {quest=48382, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [56393555] = {quest=48383, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [51693779] = {quest=48383, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [59883581] = {quest=48383, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [58403090] = {quest=48383, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [55103930] = {quest=48383, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [59101940] = {quest=48384, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [66581711] = {quest=48384, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [64062748] = {quest=48384, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [57735890] = {quest=48385, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [55925384] = {quest=48385, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [48225455] = {quest=48385, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [72404210] = {quest=48387, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [66603641] = {quest=48387, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [68903340] = {quest=48387, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [69503966] = {quest=48387, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [55991401] = {quest=48388, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [59581389] = {quest=48388, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [55402040] = {quest=48388, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [54202800] = {quest=48388, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [65225180] = {quest=48389, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true, note="In the cave"},
        [60344695] = {quest=48389, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [64315036] = {quest=48389, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true, note="In the cave"},
        [60684104] = {quest=48389, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [65484091] = {quest=48389, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [73306850] = {quest=48390, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [76465651] = {quest=48390, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true}, -- Verify me...
        [76565823] = {quest=48390, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [78025620] = {quest=48390, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},

        [65224956] = {quest=48391, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [68005070] = {quest=48391, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [69785509] = {quest=48391, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [63075799] = {quest=48391, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true, note="In the cave"},

        [52102720] = {quest=49019, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true},
        [65204060] = {quest=49018, currency=ARGUNITE, label=LEGION_SUPPLIES, junk=true, note="Requires Light's Judgement to be equipped in the Vindicaar Matrix. Blow the pile of ruble with the ability"},
    },
    ["ArgusCitadelSpire"] = { -- Nath'raxas Spire
    },
    ["ArgusMacAree"] = { -- MacAree
        [27284015] = {quest=48750, achievement=12074, criteria=37601, currency=ARGUNITE, note="You will need a Glider, jump from 31.92, 45.19"}, -- Shattered House Chest
        [40275130] = {quest=48747, achievement=12074, criteria=37598, currency=ARGUNITE, note="Requires Lightforge Warframe. Jump on the rubble."}, -- Void-Tinged Chest
        [40896985] = {quest=49153, achievement=12074, criteria=37957, currency=ARGUNITE, note="Requires Shroud of Arcane Echoes. Stealth before opening."}, -- Augari Goods
        [42900550] = {quest=nil, achievement=12074, criteria=37595, currency=ARGUNITE, note="Requires Lightforged Warframe."}, -- Eredar Treasure Cache
        [43445440] = {quest=48751, achievement=12074, criteria=37602, currency=ARTIFACT, note="You will need a Glider"}, -- Doomseeker's Treasure
        [50693851] = {quest=48744, achievement=12074, criteria=37596, currency=ARTIFACT}, -- Chest of Ill-Gotten Gains
        [57097677] = {quest=48346, achievement=12074, criteria=37600, currency=ARTIFACT, note="Climb from 59.67, 76.40"}, -- Desperate Eredar's Cache
        [62152241] = {quest=49151, achievement=12074, criteria=37956, currency=ARGUNITE, note="Requires Shroud of Arcane Echoes. Stealth before opening."}, -- Secret Augari Chest
        [62207120] = {quest=nil, achievement=12074, criteria=37597, currency=ARGUNITE, note="Requires Light's Judgement'."}, -- Student's Surprising Surplus
        [70245976] = {quest=48748, achievement=12074, criteria=37599, currency=ARGUNITE}, -- Augari Secret Stash
        [70602730] = {quest=nil, achievement=12074, criteria=37955, currency=ARGUNITE, note="Requires Shroud of Arcane Echoes. Stealth before opening."}, -- Augari-Runed Chest

        -- Junk:
        [53228020] = {quest=48346, label=LEGION_SUPPLIES, junk=true, currency=ARTIFACT},
        [54825759] = {quest=48346, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [54806700] = {quest=48346, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [59476292] = {quest=48346, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [59906980] = {quest=48346, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},

        [53902320] = {quest=48350, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [53603410] = {quest=48350, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [58704082] = {quest=48350, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [59602090] = {quest=48350, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [63311994] = {quest=48350, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},

        [37205550] = {quest=48351, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [42305750] = {quest=48351, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [43776836] = {quest=48351, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [43617138] = {quest=48351, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},

        [44601860] = {quest=48357, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [57821057] = {quest=48357, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},

        [28904422] = {quest=48361, label="Void-Seeped Cache", junk=true, currency=ARGUNITE},
        [25834447] = {quest=48361, label="Void-Seeped Cache", junk=true, currency=ARGUNITE},

        [62013276] = {quest=48362, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},

        [43776836] = {quest=48371, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [48704980] = {quest=48371, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [25263016] = {quest=48371, label="Ancient Eredar Cache", junk=true, currency=ARGUNITE},
        [50605600] = {quest=48371, label="Ancient Eredar Cache", junk=true, item=153334, currency=ARGUNITE},

        [33752371] = {quest=48371, label="Void-Seeped Cache", junk=true, currency=ARGUNITE},

        [31552541] = {quest=49264, label="Void-Seeped Cache", junk=true, currency=ARGUNITE},
        [37583619] = {quest=49264, label="Void-Seeped Cache", junk=true, currency=ARGUNITE},
        [37102010] = {quest=49264, label="Void-Seeped Cache", junk=true, currency=ARGUNITE},
    },
    -- Small zones
    ["Dalaran70"] = {
        [47404120] = {quest=45365, item=143534, toy=true, note="On the table on the second floor of the Legerdemain Lounge", level=10},
        -- Dog pebble, questid is for showing Dog the pebble, not looting it
        [38102920] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [42104440] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [41005320] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [46205390] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [49406940] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [51706220] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [54505320] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [54304080] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [47702920] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
        [44601820] = {quest=46952, item=147420, note="Show to Dog in your Draenor garrison", level=10, hide_before=30526},
    },
    ["Darkpens"] = { -- Val'sharah
        [42018849] = {quest=39085, currency=ARTIFACT, label=CHEST_SM, note="In water at bottom of stairs"},
        [50905168] = {quest=39086, currency=ARTIFACT, label=CHEST_GLIM},
    },
    ["Helheim"] = { -- Stormheim
        [79842471] = {quest=38510, currency=ARTIFACT, label=CHEST_SM},
        [83322456] = {quest=38503, currency=ARTIFACT, label=CHEST, note="Underwater in a ship"},
        [19634698] = {quest=38516, currency=ARTIFACT, label=CHEST},
        [60845332] = {quest=38383, currency=ARTIFACT, label=CHEST_SM},
    },
    ["StormDrakeDen"] = { -- Stormheim
        [20134125] = {quest=38529, currency=ARTIFACT, label=CHEST},
    },
    ["NarthalasAcademy"] = { -- Azsuna
        [53633986] = {quest=42284, currency=ARTIFACT, label=CHEST_SM},
        [71212211] = {quest=42285, currency=ARTIFACT, label=CHEST_SM, note="Door opens after you finish nearby quests"},
    },
    ["TempleofaThousandLights"] = { -- Azsuna
    },
    ["OceanusCove"] = { -- Azsuna
        [69294839] = {quest=37649, currency=ARTIFACT, label=CHEST_GLIM},
        [45346686] = {quest=42291, currency=ARTIFACT, label=CHEST_SM},
    },
    ["BitestoneEnclave"] = { -- Highmountain
        [85213787] = {quest=40489, currency=ARTIFACT, label=CHEST},
    },
    ["LifespringCavern"] = { -- Highmountain
        [39505740] = {quest=40476, currency=ARTIFACT, label=CHEST_GLIM, level=20},
        [61703450] = {quest=40476, currency=ARTIFACT, label=CHEST_GLIM, level=21},
    },
    ["StonedarkGrotto"] = { -- Highmountain
        [35987235] = {quest=40478, currency=ARTIFACT, label=CHEST},
    },
    ["MucksnoutDen"] = { -- Highmountain
        [60592533] = {quest=40494, currency=ARTIFACT, label=CHEST},
    },
    ["ThunderTotem"] = { -- Highmountain
        [13715555] = {quest=40491, currency=ARTIFACT, label=CHEST_SM},
        [63435929] = {quest=39531, item=141322, label="A Steamy Jewelry Box"},
        [50667537] = {quest=40472, currency=ARTIFACT, label=CHEST_SM},
        [32354174] = {quest=40475, currency=ARTIFACT, label=CHEST_SM, note="On a boat"},
        [31843842] = {quest=44352, currency=ARTIFACT, label=CHEST, note="Underwater cave, below the boat"},
    },
    ["ThunderTotemInterior"] = { -- Highmountain
        [62946793] = {quest=40471, currency=ARTIFACT, label=CHEST},
    },
    ["NeltharionsVault"] = { -- Highmountain
        [52002890] = path(39606, "Titan Waygate"),
        [59304130] = {quest=39606, currency=ARTIFACT, label="Treasures of Deathwing", note="Take the Waygate to get up, and use the brazier", level=29},
        [40215031] = {quest=40509, currency=ARTIFACT, label=CHEST, level=29},
        [60425458] = {quest=40508, currency=ARTIFACT, label=CHEST_SM, level=29},
    },
    ["SuramarLegionScar"] = { -- ...Suramar
        [40502903] = {quest=40902, currency=ARTIFACT, label=CHEST_SM},
        [54573780] = {quest=43835, currency=ARTIFACT, label=CHEST_SM},
    },
    ["FalanaarTunnels"] = { -- Suramar
        -- Tunnels
        [58307020] = {quest=43840, currency=ARTIFACT, label=CHEST, level=33}, -- also triggered 43839
        [35513253] = {quest=43747, item=141655, label="Shimmering Ancient Mana Cluster", level=33},
        [48644258] = {quest=43839, currency=ARTIFACT, label=CHEST_SM, note="Climb spiderweb", level=33}, -- TODO: verify location
        -- Temple of Fal'adora:
        [35525280] = {quest=43988, item=140328, label="Volatile Leyline Crystal", note="Downstairs", level=32},
        [38605414] = {quest=43838, currency=ARTIFACT, label=CHEST_SM, note="Downstairs", level=32},
    },
    ["LeylineMicro01"] = { -- Elor'shan
        [49301730] = {quest=43743, item=141655, label="Shimmering Ancient Mana Cluster"},
    },

    -- DH starter
    ["MardumtheShatteredAbyss"] = {
        [23065389] = {quest=40797, item=129210, label=CHEST_SM, note="Cave entrance @ 23.6, 54.2"},
        [23605420] = path(40797),
        [34857020] = {quest=39970, item=129210, label=CHEST_SM},
        [41763761] = {quest=40759, item=129196, label=CHEST_SM},
        [42194916] = {quest=40223, item=129210, label=CHEST_SM},
        [45017785] = {quest=39971, item=129192, label=CHEST_SM},
        [51135079] = {quest=40743, item=129210, label=CHEST_SM},
        [66922767] = {quest=39974, item=129210, label=CHEST_SM},
        [69704240] = {quest=39976, item=129210, label=CHEST_SM},
        [73494892] = {quest=39975, item=129195, label=CHEST_SM},
        [74285453] = {quest=39977, item=129210, label=CHEST_SM, note="Cave entrance @ 70.7, 54.0"},
        [70705400] = path(39977),
        [76243899] = {quest=40338, item=129210, label=CHEST_SM},
        [78755047] = {quest=40274, item=129210, label=CHEST_SM},
        [82075043] = {quest=40820, item=129196, label=CHEST_SM},
    },
    ["CrypticHollow"] = {
        [48761530] = {quest=39972, item=129196, label=CHEST_SM},
        [54855845] = {quest=39973, item=128946, label=CHEST_SM},
    },
    ["SoulEngine"] = {
        [50304964] = {quest=40772, item=129210, label=CHEST_SM},
    },
    ["VaultOfTheWardensDH"] = {
        [58693475] = {quest=40909, item=129210, label=CHEST_SM, level=1},
        [47325464] = {quest=38690, item=129210, label=CHEST_SM, level=1},
        [32104817] = {quest=40911, item=129196, label=CHEST_SM, level=2},
        [41506361] = {quest=40914, item=129196, label=CHEST_SM, level=2},
        [56994013] = {quest=40913, item=129210, label=CHEST_SM, level=2},
        [41413287] = {quest=40912, item=129210, label=CHEST_SM, level=2},
        [24421005] = {quest=40915, item=129210, label=CHEST_SM, level=3},
        [23268157] = {quest=40916, item=129210, label=CHEST_SM, level=3},
    },
}
