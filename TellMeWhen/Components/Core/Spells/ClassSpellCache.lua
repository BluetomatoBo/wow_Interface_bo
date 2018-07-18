-- --------------------
-- TellMeWhen
-- Originally by Nephthys of Hyjal <lieandswell@yahoo.com>

-- Other contributions by:
--		Sweetmms of Blackrock, Oozebull of Twisting Nether, Oodyboo of Mug'thol,
--		Banjankri of Blackrock, Predeter of Proudmoore, Xenyr of Aszune

-- Currently maintained by
-- Cybeloras of Aerie Peak
-- --------------------


if not TMW then return end

local TMW = TMW
local L = TMW.L
local print = TMW.print

local pairs, type, ipairs, bit, select = 
      pairs, type, ipairs, bit, select

local _, pclass = UnitClass("Player")


TMW:RegisterUpgrade(72013, {
	global = function()
		-- The class spell cache is no longer generated dynamically - too many problems with it
		-- (lacking many spells, sharing over comm is vulnerable to bad data, etc.)
		TMW.db.global.ClassSpellCache = nil
		TMW.db.global.XPac_ClassSpellCache = nil

		-- Also nil out some other unused, old SVs.
		TMW.db.global.XPac = nil
		TMW.db.global.XPac_AuraCache = nil
	end,
})

local ClassSpellCache = TMW:NewModule("ClassSpellCache", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0", "AceTimer-3.0")


local RaceMap = {
	[1] = "Human",
	[2] = "Orc",
	[3] = "Dwarf",
	[4] = "NightElf",
	[5] = "Scourge",
	[6] = "Tauren",
	[7] = "Gnome",
	[8] = "Troll",
	[9] = "Goblin",
	[10] = "BloodElf",
	[11] = "Draenei",
	[22] = "Worgen",
	[25] = "Pandaren",
	[26] = "Pandaren",
	[24] = "Pandaren",
	[29] = "VoidElf",
	[30] = "LightforgedDraenei",
	[27] = "Nightborne",
	[28] = "HighmountainTauren",
}
local Cache = {
	[1] = {100,355,3127,6544,6552,57755,88163,115767,123829,188632,188635,188639,188644,188647,188651,188672,188683,188778,189059,200845,200846,200847,200849,200853,200856,200857,200859,200860,200861,200863,200870,200871,200872,200875,203225,203227,203230,203261,203524,203576,205545,209459,209462,209472,209480,209481,209483,209494,209541,209548,209554,209559,209566,209573,209577,211309,214937,214938,214939,216272,216273,216274,226829,238075,238076,238077,238111,238112,238113,238147,238148,238149,239042,241264,241269,241270,248579,248580,198490,198500,198614,198765,198807,198817,198877,198912,199023,199037,199045,199086,199127,199148,199202,199204,199261,205800,206572,213857,213871,213915,216890,217959,235941,236077,236236,236273,236308,236320,253900,71,845,871,1160,1464,1680,1715,1719,2565,5246,5308,6343,6572,12294,12323,12950,12975,18499,20243,23881,23920,23922,29144,34428,46917,76838,76856,76857,84608,85288,86101,86110,86535,97462,100130,118038,161798,163201,167105,184361,184364,184367,184783,190411,190456,198304,209694,227847,231824,231827,231830,231833,231834,231842,231847,261900,261901,772,7384,12292,29838,46924,46968,103827,103828,107570,107574,118000,152277,152278,197690,202095,202161,202163,202168,202224,202288,202296,202297,202316,202560,202561,202572,202593,202603,202612,202743,202751,202922,203177,203179,203201,205484,206313,206315,206320,207982,208154,215538,215556,215568,215569,215571,215573,223657,223662,227266,228920,236279,248621},
	[2] = {633,642,1044,7328,13819,20271,23214,32223,34767,34769,35395,62124,69820,69826,73629,73630,82242,115675,121183,123830,190784,200654,179546,182234,184759,184778,184843,185086,185368,186773,186788,186927,186934,186941,186944,186945,193058,193108,200294,200296,200298,200302,200311,200315,200316,200326,200327,200373,200407,200421,200430,200474,200482,200652,205273,207604,209202,209216,209217,209218,209220,209223,209224,209225,209226,209229,209285,209341,209376,209389,209474,209539,211309,211912,211913,211914,211915,211916,213428,213570,213571,213572,213573,213574,214081,214923,214924,221841,222648,226829,238060,238061,238062,238096,238097,238098,238132,238133,238134,239042,239293,239294,239295,239296,241145,241146,241147,199324,199325,199330,199422,199424,199428,199441,199452,199454,199456,199542,204914,204927,204934,204979,207028,210256,210294,210323,210341,210378,215652,216327,216331,216853,216855,216860,216868,228049,236186,246806,247675,498,853,1022,4987,6940,19750,20473,25780,26573,31821,31842,31850,31884,31935,53385,53563,53576,53592,53595,53600,76671,76672,82326,85043,85222,85256,86102,86103,86539,86659,96231,105424,105805,161800,183218,183435,183997,183998,184092,184575,184662,203538,203539,212056,213644,227068,229976,231642,231644,231657,231661,231663,231665,231667,20066,53376,105809,114154,114158,114165,115750,152261,152262,156910,183415,183416,183425,183778,196923,196926,197446,197646,198034,198038,198054,200025,202271,203316,203776,203785,203791,203797,204018,204019,204023,204035,204054,204074,204077,204139,204150,205191,205228,210191,210220,213313,213652,213757,214202,215661,217020,218178,223306,223817,230332,231832,231895,234299},
	[3] = {136,883,982,1462,1494,1515,1543,2641,5384,6197,6991,19878,19879,19880,19882,19883,19884,19885,61648,83242,83243,83244,83245,93321,93322,125050,127933,138430,157443,186257,186265,203413,205154,209997,210000,212621,229533,242155,190449,190457,190462,190467,190503,190514,190520,190529,190567,190852,191048,191328,191339,197038,197047,197080,197138,197139,197140,197160,197162,197178,197199,197248,197343,197344,197354,203415,203563,203566,203577,203578,203638,203669,203670,203673,203749,203752,203754,203755,203757,204089,204147,204219,206910,207068,211309,214826,214914,214915,214916,215779,221773,224764,225092,238051,238052,238053,238087,238088,238089,238123,238124,238125,239042,241110,241114,241115,53271,202589,202624,202746,202797,202900,202914,203129,203155,203235,203264,203340,204190,205691,208652,209793,212638,212640,212668,213538,213539,213543,213691,232045,232046,232047,236776,236788,248443,248490,248518,2643,5116,19434,19574,34026,34477,35110,53270,56315,76657,109304,115939,120679,147362,164856,185358,185789,185855,185901,185987,186270,186289,186387,187650,187698,187707,187708,190925,190928,191334,191433,193265,193455,193468,193526,193530,195645,202800,212658,231546,231548,231549,231550,231554,231555,234955,237327,262837,262838,262839,781,19386,19577,53209,53238,87935,109215,109248,120360,130392,131894,155228,162488,191241,191384,193532,193533,194277,194306,194386,194397,194407,194595,194599,194855,198670,199483,199522,199523,199527,199528,199530,199532,199543,199921,200108,200163,201075,201078,201082,201430,204308,204315,206505,206817,212431,212436,214579,217200,234588,236698},
	[4] = {1766,1804,1860,1966,2836,2983,31209,31224,56814,57934,82245,114018,157442,185311,210108,192310,192315,192318,192323,192326,192329,192345,192349,192376,192384,192422,192424,192428,192657,192759,192923,197231,197233,197234,197235,197239,197241,197244,197256,197369,197386,197406,197604,197610,202463,202507,202514,202521,202522,202524,202530,202533,202628,202665,202753,202755,202769,202820,202897,202907,209781,209782,209835,210144,210145,210146,210147,210148,211309,214368,214928,214929,214930,216230,221856,238066,238067,238068,238102,238103,238138,238139,238140,239042,239290,239291,241152,241153,241154,242707,197000,197007,197044,197050,197899,198020,198032,198092,198128,198145,198265,198529,198675,198952,206317,206328,207736,207777,209752,212035,212081,212182,212210,212217,213981,216883,221622,248744,248762,53,408,703,921,1329,1725,1752,1776,1784,1833,1856,1943,2094,2098,2823,3408,5277,6770,8676,8679,13750,13877,14117,14161,14190,32645,35551,36554,51667,51723,58423,61329,76803,76806,76808,79096,79134,79140,79152,84601,114014,121471,185313,185314,185438,185565,185763,193315,193316,195452,196819,196912,197835,199736,199740,199754,199804,212283,231691,231716,231718,231719,235484,245639,245751,5171,14062,14983,16511,31223,31230,51690,79008,108208,108209,108211,108216,114015,131511,137619,152150,152152,154904,185767,193531,193537,193539,193546,193640,195457,196861,196864,196922,196924,196937,196938,196951,196976,199743,200733,200758,200759,200778,200806,238104,245388,245687},
	[5] = {528,585,586,605,2006,9484,32375,81782,193371,193642,193643,193644,193645,193647,194002,194007,194016,194018,194024,194026,194093,194179,194378,196355,196358,196416,196418,196419,196422,196429,196430,196434,196437,196489,196492,196578,196684,196779,197708,197711,197713,197715,197716,197727,197729,197762,197766,197779,197781,197815,198068,198074,205065,207946,208065,211309,213428,214925,214926,214927,215322,216122,216212,219655,222646,238063,238064,238065,238099,238100,238101,238135,238136,238137,239042,241148,241149,241150,108968,195282,196162,196439,196559,196602,196611,196762,197268,197535,197590,197862,197871,199131,199144,199259,199388,199408,199445,199484,199572,209780,211522,211681,213539,213541,213547,213548,213549,213550,213602,213610,213654,214205,215768,215776,215960,215982,221661,228630,235587,236499,17,139,527,589,596,1706,2050,2060,2061,2096,8092,8122,14914,15286,15407,15487,19236,20711,32379,33076,33206,34433,34861,34914,45243,47536,47540,47585,47788,62618,63733,64843,73325,77484,77485,77486,78203,81749,88625,132157,185916,186263,190719,194509,200347,200829,212036,213634,228260,228264,228266,231682,231687,231688,231689,232698,234702,262861,10060,32546,64129,64901,109142,109186,110744,120517,121536,123040,129250,152118,155271,162452,193063,193134,193155,193157,193173,193195,193223,193225,196704,196707,196985,197031,197034,197045,199849,199853,199855,200128,200153,200174,200183,200199,200209,200309,204065,204197,204263,204883,205351,205367,205369,205371,205385,214121,214621,235189,238558,246287,246393},
	[6] = {3714,47528,48707,49576,49998,50977,51986,53343,53344,53428,55078,55095,56222,61999,62158,82246,111673,127344,190780,205224,189080,189086,189092,189097,189144,189147,189154,189164,189179,189180,189184,189185,189186,190778,191419,191442,191485,191488,191494,191565,191584,191592,191593,191594,191637,191721,191731,191741,191747,191760,192447,192450,192453,192457,192460,192464,192514,192538,192542,192543,192544,192548,192557,192558,192567,192570,193213,204875,205209,205223,208598,208793,208794,208795,211309,214903,214904,214906,218280,218931,220143,221775,224466,224467,224468,226829,238042,238043,238044,238078,238079,238080,238114,238115,238116,238686,238687,239042,239106,239107,241018,241047,241050,47476,51052,77606,199642,199719,199720,199722,199724,199725,201934,201995,202727,202731,203173,204080,204132,204135,204160,207018,210128,223829,233394,233396,233411,233412,674,42650,43265,45524,46584,47541,47568,48263,48792,49020,49028,49143,49184,49206,49530,50842,51128,51271,51462,55090,55233,59057,63560,77513,77514,77515,77575,81136,81229,85948,86113,86536,86537,108199,161797,178819,195182,195292,195621,196770,197147,206930,212552,221562,57330,108194,114556,130736,152279,152280,194662,194679,194844,194878,194909,194912,194913,194916,194917,194918,195679,198943,205723,205727,206931,206940,206960,206967,206970,206974,206977,207057,207060,207061,207104,207126,207127,207142,207161,207167,207170,207188,207200,207230,207256,207264,207269,207272,207289,207305,207311,207313,207316,207317,207319,207321,207346,207349,211078,212763,219779,219786,219809,221536,221699,246426,253593},
	[7] = {370,546,556,2008,2484,2645,2825,6196,20608,32182,51514,108271,210873,211004,211010,211015,191493,191499,191504,191512,191569,191572,191577,191582,191598,191602,191647,191717,191740,191861,192630,198228,198236,198238,198247,198248,198292,198296,198299,198349,198361,198367,198434,198505,198736,199107,204945,205495,207088,207092,207118,207206,207255,207285,207348,207351,207354,207355,207356,207357,207358,207360,207362,207778,210029,210030,210031,210032,210033,211309,213428,214931,214932,214933,215381,215414,224841,238069,238070,238071,238105,238106,238141,238142,238143,239042,241202,241203,241205,242652,193876,204247,204261,204264,204268,204269,204288,204293,204330,204331,204332,204336,204349,204357,204365,204366,204385,204393,204398,204403,204437,206642,210918,211062,213554,213555,213556,221678,236501,247526,403,421,1064,5394,8004,8042,16164,16196,17364,33757,51490,51505,51533,51564,51886,57994,58875,60103,60188,61295,61882,73920,77130,77223,77226,77472,77756,79206,86099,86100,86108,86629,98008,108280,157444,168534,187828,187837,187874,187880,188070,188196,188389,188443,188838,190488,190493,193786,193796,195255,196834,196840,198067,198103,201845,212048,231721,231722,231723,231725,231780,231785,232643,16166,51485,108281,108283,114050,114051,114052,117013,117014,157153,157154,170374,188089,192058,192063,192077,192087,192088,192106,192222,192234,192235,192246,192249,196884,196932,197211,197214,197464,197467,197992,197995,198838,200071,200072,200076,201898,201900,201909,207399,207401,210643,210689,210707,210714,210727,210731,210853,215864,246035},
	[8] = {118,122,130,1953,2139,3561,3562,3563,3565,3566,3567,10059,11416,11417,11418,11419,11420,28271,28272,30449,31707,32266,32267,32271,32272,33395,33690,33691,35715,35717,45438,49358,49359,49360,49361,53140,53142,61305,61721,61780,80353,88342,88344,88345,88346,120145,120146,126819,131784,132620,132621,132626,132627,161353,161354,161355,161372,176242,176244,176246,176248,190336,193759,210086,224869,224871,187258,187264,187276,187287,187301,187304,187310,187313,187318,187321,187680,188006,194224,194234,194239,194312,194313,194314,194315,194318,194331,194431,194466,194487,195315,195317,195322,195323,195345,195351,195352,195354,195419,195448,195615,210182,210716,210725,210730,211309,214626,214629,214634,214664,214776,214917,214918,214919,215463,215773,215796,220817,221844,224968,227481,238054,238055,238056,238090,238091,238092,238126,238127,238128,239042,241121,241124,241125,198062,198063,198064,198100,198111,198120,198123,198126,198144,198148,198151,198155,198158,198614,203275,203280,203282,203283,203284,203286,206431,210476,210805,213220,213540,213541,213542,236788,66,116,120,133,1449,2120,2948,5143,11366,11426,12042,12051,12472,12846,12982,30451,30455,31589,31661,31687,44425,44614,76613,84714,86949,108853,110959,112965,117216,157642,190319,190356,190447,190740,195283,195676,205025,212801,231564,231565,231567,231568,231582,231584,231596,231598,231630,235219,235313,235450,236662,1463,44457,55342,108839,112948,113724,114923,116011,153561,153595,153626,155147,155148,155149,157976,157980,157981,157997,198929,199786,205020,205021,205022,205023,205024,205026,205027,205028,205029,205030,205032,205033,205035,205036,205037,205038,205039,212653,234302,235224,235297,235365,235463,235711,235870,236058,236457,236628},
	[9] = {126,688,691,697,698,710,712,755,1098,1122,5697,5782,5784,6201,18540,20707,23161,29893,93375,104773,108370,111771,117198,119898,246985,196211,196217,196222,196227,196236,196258,196301,196305,196432,196586,196675,199111,199112,199120,199152,199153,199158,199163,199212,199214,199220,199257,199282,199471,199472,201424,211099,211105,211106,211108,211119,211123,211126,211131,211144,211158,211219,211309,211530,211714,211720,214934,214935,214936,215183,215223,215273,216698,218567,218572,219195,219415,221862,221882,224103,238072,238073,238074,238108,238109,238110,238144,238145,238146,239042,241252,241253,241257,199890,199892,199954,200546,200586,201996,212282,212284,212295,212356,212371,212459,212618,212619,212623,212628,213400,213545,213546,213547,221703,221711,233577,233581,234877,248813,248855,172,348,603,686,980,1454,5740,17962,27243,29722,30108,30146,77215,77219,77220,80240,104316,105174,108415,116858,193396,193440,198590,231791,231792,231793,231794,231795,231799,231811,232670,234153,5484,6789,17877,30283,48018,48181,108416,108501,108503,111400,152107,152108,157695,171975,196098,196102,196103,196105,196226,196269,196270,196272,196277,196283,196406,196408,196410,196412,196447,196605,205145,205148,205179,205180,205181,205184,215941,219272,234876,235155,235157},
	[10] = {100780,100784,101643,109132,115078,115178,115546,116812,117952,119996,125883,126892,126895,196061,209525,195243,195244,195263,195265,195266,195267,195269,195291,195295,195298,195300,195380,195399,195650,196082,199364,199365,199366,199367,199372,199377,199380,199384,199401,199485,199563,199573,199640,199665,199887,205320,205406,211309,213047,213049,213050,213051,213055,213062,213116,213133,213136,213161,213180,213183,213340,213428,214326,214372,214428,214516,214920,214921,214922,216424,218607,226829,227683,227684,227685,227686,227687,227688,227689,227690,227691,227692,238057,238058,238059,238093,238094,238095,238129,238130,238131,239042,239304,239305,239306,239307,241131,241134,241136,159534,201201,201318,201325,201372,201769,202107,202126,202162,202200,202272,202335,202370,202424,202428,202523,202577,205003,205147,205234,206743,207025,209520,209584,213658,216074,216113,216255,216913,232876,232879,233759,233765,247483,101545,101546,103985,107428,113656,115069,115072,115080,115151,115176,115181,115203,115308,115310,115450,115636,116092,116095,116645,116670,116680,116694,116705,116849,117906,117907,119582,120224,120225,120227,121253,122470,124146,124502,124682,128595,137025,137384,137639,157411,157445,191837,193884,205523,212051,216519,218164,220357,231602,231605,231606,231627,231633,231876,243435,245013,261916,261917,262840,115008,115098,115173,115288,115313,115315,115396,115399,116841,116844,116847,119381,121817,122278,122783,123904,123986,124081,132578,152173,152175,196607,196719,196721,196725,196730,196736,196737,196738,196740,196743,197895,197900,197908,197915,198664,198898,210802,210804,237076},
	[11] = {339,768,783,1850,5225,5487,6795,8921,8936,16870,18960,20484,50769,77758,106830,125972,127757,164815,164862,165962,193753,210053,210065,219432,231437,236716,186320,186372,186393,186396,189744,189749,189754,189757,189760,189768,189772,189787,189849,189857,189870,200395,200399,200400,200402,200409,200414,200415,200440,200515,200850,200851,200854,200855,202302,202384,202386,202426,202433,202445,202464,202466,202767,202890,202918,202940,202996,203018,208253,208762,210557,210570,210571,210575,210579,210590,210593,210631,210637,210638,210650,210663,210666,210676,210702,210722,211309,213428,213682,214508,214514,214736,214910,214911,214912,214913,214996,215061,215799,222644,226829,238047,238048,238049,238050,238083,238084,238085,238086,238119,238120,238121,238122,239042,241099,241100,241101,241102,33786,200549,200567,200726,200931,201259,201664,202043,202110,202226,202246,203052,203224,203242,203374,203399,203553,203624,203651,203727,205673,206852,207017,209690,209730,209740,209749,209753,213200,213551,213552,213553,213951,228431,232546,233673,233750,233752,233754,233755,236012,236019,236020,236023,236026,236144,236147,236148,236153,236180,236696,247543,99,740,774,1079,1822,2782,5176,5185,5215,5217,5221,6807,16864,16931,16974,18562,22568,22570,22812,22842,24858,29166,33763,33873,33917,48438,48484,48500,61336,77492,77493,77495,78674,78675,86093,86096,86097,86104,88423,93402,102342,102793,106832,106839,106898,106951,108299,113043,131768,137010,137011,137012,137013,145108,145205,155783,157447,190984,191034,192081,194153,194223,197524,197911,210706,212040,213764,228545,231021,231032,231040,231042,231049,231050,231052,231055,231056,231057,231063,231064,231065,231070,231283,5211,33891,52610,80313,102280,102351,102359,102401,102543,102558,102560,108238,114107,132469,155577,155578,155580,155672,155675,155835,158476,158477,158478,197061,197073,197488,197490,197491,197492,197632,197721,200383,200390,202021,202022,202028,202031,202032,202060,202155,202157,202342,202345,202347,202354,202359,202360,202425,202430,202770,203953,203962,203964,203965,203974,204012,204053,204066,205636,207383,207385,217615,236068,236748},
	[12] = {131347,162794,179057,183752,185123,188499,188501,191427,195072,196055,198013,198589,198793,203724,214743,217832,221351,201454,201455,201456,201457,201458,201459,201460,201463,201464,201467,201468,201469,201470,201471,201472,201473,207343,207347,207352,207375,207387,207407,211309,212816,212817,212819,212821,212827,212829,212894,213010,213017,214744,214795,214907,214909,218910,226829,238045,238046,238082,238117,238118,239042,241090,241091,243188,203468,203704,205596,205598,205603,205604,205625,205626,205627,205628,205629,205630,206649,206803,207029,211489,211509,213480,227635,235893,235903,162243,178740,178940,178976,185164,185244,185245,187827,189110,196718,202137,203513,203720,203747,203782,203783,204021,204157,204254,204596,207197,207684,212613,218256,226359,228477,192939,193897,196555,202138,203550,203551,203555,203556,204909,205411,206416,206473,206475,206476,206477,206478,206491,207548,207550,207666,207697,207739,209258,209281,209400,209795,211053,211881,212084,213410,217996,218612,227174,227225,227322,232893,236189,247254,247454,247938},
	["RACIAL"] = {[121093]={11,512},[92680]=7,[155145]={10,2},[92682]=3,[260364]=27,[87840]=22,[262438]=27,[69041]=9,[822]=10,[255650]=30,[255668]=29,[28730]={10,384},[69179]={10,1},[129597]={10,512},[50613]={10,32},[7744]=5,[107073]=24,[107074]=24,[107076]=24,[20549]=6,[20550]=6,[20551]=6,[20552]=6,[20555]=8,[20557]=8,[80483]={10,4},[59221]=11,[262486]=29,[26297]=8,[59224]=3,[259930]=30,[20572]={2,45},[20573]=2,[20577]=5,[20579]=5,[58984]=4,[20582]=4,[20583]=4,[59752]=1,[20585]=4,[107079]={24,8},[5227]=5,[20589]=7,[68975]=22,[20592]=7,[20593]=7,[20594]=3,[20596]=3,[131701]=24,[154742]=10,[154743]=6,[154744]={7,520},[154746]={7,1},[58943]=8,[154748]=4,[68992]=22,[107072]=24,[68996]=22,[20591]={7,978},[68976]=22,[59542]={11,2},[59543]={11,4},[59544]={11,16},[59545]={11,32},[59547]={11,64},[59548]={11,128},[255647]=30,[33697]={2,576},[6562]=11,[255651]=30,[255652]=30,[255653]=30,[33702]={2,384},[255655]=28,[255656]=28,[69045]=9,[255658]=28,[255659]=28,[255661]=27,[255663]=27,[255664]=27,[255665]=27,[69042]=9,[255667]=29,[256948]=29,[255669]=29,[255670]=29,[232633]={10,16},[28875]=11,[20598]=1,[69046]={9,2047},[20599]=1,[68978]=22,[69070]=9,[28877]=10,[28880]={11,1},[25046]={10,8},[202719]={10,2048},[154747]={7,32},[255654]=28,[227057]={7,4},[69044]=9,[94293]=22
	},
	["PET"] = {[50433]=3,[30213]=9,[160007]=3,[159788]=3,[160011]=3,[24450]=3,[6360]=9,[35346]=3,[118297]=7,[57984]=7,[115232]=9,[54049]=9,[115746]=9,[115748]=9,[3110]=9,[19505]=9,[160044]=3,[49966]=3,[160049]=3,[126259]=3,[160057]=3,[115770]=9,[160060]=3,[160063]=3,[118337]=7,[115778]=9,[94019]=3,[115268]=9,[115781]=9,[94022]=3,[17735]=9,[118345]=7,[115276]=9,[134477]=9,[7870]=9,[117588]=7,[2649]=3,[119899]=9,[17767]=9,[16827]=3,[17253]=3,[126311]=3,[88680]=3,[24423]=3,[47468]=6,[160018]=3,[32233]=9,[191336]=3,[157331]=7,[54644]=3,[36213]=7,[115831]=9,[47481]=6,[47482]=6,[19647]=9,[47484]=6,[91776]=6,[91778]=6,[3716]=9,[7814]=9,[160065]=3,[91800]=6,[160067]=3,[91797]=6,[89751]=9,[54680]=3,[160452]=3,[91802]=6,[126364]=3,[91809]=6,[157348]=7,[137798]=3,[89766]=9,[115625]=9,[112042]=9,[114355]=9,[159926]=3,[126393]=3,[159931]=3,[91837]=6,[91838]=6,[157375]=7,[89792]=9,[65220]=7,[157382]=7,[30151]=9,[30153]=9,[26064]=3,[159953]=3,[159956]=3,[6358]=9,[93433]=3,[90328]=3,[115236]=9,[92380]=3,[115408]=9,[89808]=9,[90339]=3,[117225]=9,[90347]=3,[90355]=3,[159733]=3,[90361]=3
	}
}


-- Adjustments to the imported cache data:
tinsert(Cache[3], 1, 75) -- Add "Auto Shot" to hunter.



local CacheIsReady = false

local PlayerSpells = {}
local ClassSpellLookup = {}
local NameCache


-- PUBLIC:

-- Contains a dictionary of spellIDs that are player spells.
function ClassSpellCache:GetSpellLookup()	
	if not CacheIsReady then
		error("The class spell cache hasn't been prepared yet.")
	end

	return ClassSpellLookup
end

-- Returns a dictionary of spellIDs that (should) belong to the current player.
function ClassSpellCache:GetPlayerSpells()
	if not next(PlayerSpells) then
		for k, v in pairs(Cache[pclass]) do
			PlayerSpells[k] = 1
		end
		for k, v in pairs(Cache.PET) do
			if v == pclass then
				PlayerSpells[k] = 1
			end
		end

		local _, race = UnitRace("player")


		for spellID, data in pairs(Cache.RACIAL) do
			if type(data) == "table" then
				-- There are class restrictions on the spell.
				local raceName = data[1]
				local classReq = data[2]
				if raceName == race then
					-- Verify that it is valid for this class.
					for classID = 1, MAX_CLASSES do
						local name, token = GetClassInfo(classID)
						if token == pclass and bit.band(bit.lshift(1, classID-1), classReq) > 0 then
							PlayerSpells[spellID] = 1
							break
						end
					end
				end

			elseif data == race then
				-- data is a race name
				-- There are no class restrictions on this spell.
				PlayerSpells[spellID] = 1
			end
		end
	end
	
	return PlayerSpells
end

--[[ Returns the main cache table. Structure:
Cache = {
	[classToken] = {
		[spellID] = 1,
	},
	PET = {
		[spellID] = classToken,
	},
	RACIAL = {
		[spellID] = raceName,
		[spellID2] = {raceName, classReq},
		-- classReq is a bitfield, with enabled bits representing classIDs that the racial is good for.
	},
}
]]
function ClassSpellCache:GetCache()
	if not CacheIsReady then
		error("The class spell cache hasn't been prepared yet.")
	end

	return Cache
end

--[[ Returns a mapping of spell names to spellIDs. Structure:
NameCache = {
	[classToken] = {
		[spellName] = true,
	},
}
]]
function ClassSpellCache:GetNameCache()
	if not CacheIsReady then
		error("The class spell cache hasn't been prepared yet.")
	end
	
	if not NameCache then
		NameCache = {}
		for class, spells in pairs(Cache) do
			if class ~= "RACIAL" and class ~= "PET" then
				local c = {}
				NameCache[class] = c
				for spellID, value in pairs(spells) do
					local name = GetSpellInfo(spellID)
					if name then
						c[name:lower()] = true
					end
				end
			end
		end
	end

	return NameCache
end

local function getClassIconString(classToken)
	return "|TInterface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES:0:0:0:0:256:256:" ..
	(CLASS_ICON_TCOORDS[classToken][1]+.02)*256 .. ":" .. 
	(CLASS_ICON_TCOORDS[classToken][2]-.02)*256 .. ":" .. 
	(CLASS_ICON_TCOORDS[classToken][3]+.02)*256 .. ":" .. 
	(CLASS_ICON_TCOORDS[classToken][4]-.02)*256 .. "|t"
end

function GameTooltip:TMW_SetSpellByIDWithClassIcon(spellID)
	local ret = GameTooltip:SetSpellByID(spellID)

	local classToken = ClassSpellLookup[spellID]
	if classToken then
		local secondIcon = ""
		if classToken == "PET" then
			classToken = Cache.PET[spellID]
			local icon
			if classToken == "WARLOCK" then
				icon = "spell_shadow_metamorphosis"
			elseif classToken == "DEATHKNIGHT" then
				icon = "spell_deathknight_gnaw_ghoul"
			elseif classToken == "SHAMAN" then
				icon = "spell_fire_elemental_totem"
			else
				icon = "ability_hunter_mendpet"
			end
			secondIcon = " |TInterface\\Icons\\" .. icon .. ":0:0:0:0:32:32:2.24:29.76:2.24:29.76|t"
		elseif classToken == "RACIAL" then
			classToken = nil


			local data = Cache.RACIAL[spellID]
			if type(data) == "table" then
				-- There are class restrictions on the spell.
				local raceName = data[1]
				local classReq = data[2]

				secondIcon = TMW:FormatAtlasString(TMW:GetRaceIconInfo(raceName), 0.07)

				-- Find the classes that it is valid for.
				for classID = 1, MAX_CLASSES do
					local name, token = GetClassInfo(classID)
					if bit.band(bit.lshift(1, classID-1), classReq) > 0 then
						secondIcon = secondIcon .. " " .. getClassIconString(token)
					end
				end

			else
				-- There are no class restriction on the spell.
				-- data is a race name
				secondIcon = TMW:FormatAtlasString(TMW:GetRaceIconInfo(data), 0.07)
			end
		end

		local classIcon = classToken and getClassIconString(classToken) or ""

		GameTooltipTextLeft1:SetText( 
		classIcon ..
		secondIcon .. " " ..
		GameTooltipTextLeft1:GetText())
	end

	return ret
end

-- END PUBLIC





-- PRIVATE:

function ClassSpellCache:TMW_DB_INITIALIZED()
	
	for classID, spellList in ipairs(Cache) do
		local name, token, classID = GetClassInfo(classID)

		local spellDict = {}
		for k, v in pairs(spellList) do
			spellDict[v] = true
		end

		Cache[token] = spellDict
		Cache[classID] = nil
	end

	for spellID, classID in pairs(Cache.PET) do
		Cache.PET[spellID] = select(2, GetClassInfo(classID))
	end

	for spellID, data in pairs(Cache.RACIAL) do
		if type(data) == "table" then
			local raceID = data[1]
			local classReq = data[2]
			data[1] = RaceMap[raceID]
		else
			-- data is a raceID.
			Cache.RACIAL[spellID] = RaceMap[data]
		end
	end
	
	-- Adds a spell's texture to the texture cache by name
	-- so that we can get textures by spell name much more frequently,
	-- reducing the usage of question mark and pocketwatch icons.
	local function AddID(id)
		if id > 0x7FFFFFFF then
			return
		end
		local name, _, tex = GetSpellInfo(id)
		name = TMW.strlowerCache[name]
		if name and not TMW.SpellTexturesMetaIndex[name] then
			TMW.SpellTexturesMetaIndex[name] = tex
		end
	end
	
	-- Spells of the user's class should be prioritized.
	for id in pairs(Cache[pclass]) do
		AddID(id)
	end
	
	-- Next comes spells of all other classes.
	for class, tbl in pairs(Cache) do
		if class ~= pclass and class ~= "PET" then
			for id in pairs(tbl) do
				AddID(id)
			end
		end
	end

	-- Pets are last because there are some overlapping names with class spells
	-- and we don't want to overwrite the textures for class spells with ones for pet spells.
	for id in pairs(Cache.PET) do
		AddID(id)
	end
	
	for class, tbl in pairs(Cache) do
		for id in pairs(tbl) do
			ClassSpellLookup[id] = class
		end
	end

	CacheIsReady = true
	
	return true -- Signal callback destruction
end
TMW:RegisterSelfDestructingCallback("TMW_DB_INITIALIZED", ClassSpellCache)


-- END PRIVATE
