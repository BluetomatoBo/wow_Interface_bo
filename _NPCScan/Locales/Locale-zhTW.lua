--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-zhTW.lua - Localized string constants (zh-TW).              *
  ****************************************************************************]]


if ( GetLocale() ~= "enTW" and GetLocale() ~= "zhTW" ) then
	return;
end


-- See http://wow.curseforge.com/addons/npcscan/localization/zhTW/
local private = select( 2, ... );
private.L = setmetatable( {
	NPCs = setmetatable( {
	}, { __index = private.L.NPCs; } );
}, { __index = private.L; } );

private.L.NPCs["100"] = "格拉夫·疾齒"
private.L.NPCs["10077"] = "死亡之喉"
private.L.NPCs["10078"] = "特羅斯巴克"
private.L.NPCs["10080"] = "杉達爾·沙掠者"
private.L.NPCs["10081"] = "灰塵怨靈"
private.L.NPCs["10082"] = "澤雷利斯"
private.L.NPCs["10119"] = "沃爾查"
private.L.NPCs["10196"] = "科巴塔恩將軍"
private.L.NPCs["10197"] = "『嚎叫者』米基爾"
private.L.NPCs["10198"] = "『劫奪者』卡蘇克"
private.L.NPCs["10199"] = "雪爪灰熊怪" -- Needs review
private.L.NPCs["10200"] = "拉克西里" -- Needs review
private.L.NPCs["10202"] = "埃蘇羅斯" -- Needs review
private.L.NPCs["10263"] = "燃燒惡魔守衛" -- Needs review
private.L.NPCs["10356"] = "貝恩" -- Needs review
private.L.NPCs["10357"] = "『激怒者』雷薩恩" -- Needs review
private.L.NPCs["10358"] = "菲林森特的陰影" -- Needs review
private.L.NPCs["10359"] = "瑟斯庫克" -- Needs review
private.L.NPCs["10376"] = "水晶之牙" -- Needs review
private.L.NPCs["10393"] = "斯庫爾" -- Needs review
private.L.NPCs["10509"] = "傑德" -- Needs review
private.L.NPCs["10558"] = "爐邊歌手弗瑞斯坦" -- Needs review
private.L.NPCs["10559"] = "薇絲比婭女士" -- Needs review
private.L.NPCs["1063"] = "玉龍" -- Needs review
private.L.NPCs["10639"] = "洛吉什" -- Needs review
private.L.NPCs["10640"] = "橡爪" -- Needs review
private.L.NPCs["10641"] = "鉗枝沼澤獸" -- Needs review
private.L.NPCs["10642"] = "埃卡洛姆" -- Needs review
private.L.NPCs["10644"] = "迷霧嚎叫者" -- Needs review
private.L.NPCs["10647"] = "拉茲王子" -- Needs review
private.L.NPCs["10741"] = "賽洛塔姆" -- Needs review
private.L.NPCs["10809"] = "石脊" -- Needs review
private.L.NPCs["10817"] = "杜甘·蠻錘" -- Needs review
private.L.NPCs["10818"] = "死亡騎士索比萊爾" -- Needs review
private.L.NPCs["10819"] = "布拉德貝恩男爵"
private.L.NPCs["10820"] = "瑞格雷沃公爵"
private.L.NPCs["10821"] = "『腐爛者』海德姆什"
private.L.NPCs["10823"] = "祖布林·扭枝"
private.L.NPCs["10824"] = "亡靈獵手霍克斯比爾"
private.L.NPCs["10825"] = "僵硬的吉斯"
private.L.NPCs["10826"] = "暗鐮領主"
private.L.NPCs["10827"] = "亡頌者塞倫德"
private.L.NPCs["10828"] = "琳恩妮雅·阿比迪斯"
private.L.NPCs["1106"] = "失落者廚師"
private.L.NPCs["1112"] = "吸血寡婦"
private.L.NPCs["1119"] = "錘脊者"
private.L.NPCs["1130"] = "遊蕩的冰爪熊"
private.L.NPCs["1132"] = "狂暴的冬狼"
private.L.NPCs["1137"] = "飢餓的雪怪"
private.L.NPCs["11383"] = "高階祭司海瓦納"
private.L.NPCs["1140"] = "刺喉龍族母"
private.L.NPCs["11447"] = "姆斯高格"
private.L.NPCs["11467"] = "蘇斯"
private.L.NPCs["11497"] = "拉札"
private.L.NPCs["11498"] = "傷殘的斯卡爾"
private.L.NPCs["11688"] = "被詛咒的半人馬"
private.L.NPCs["12037"] = "厄索洛克"
private.L.NPCs["12237"] = "『收割者』麥什洛克"
private.L.NPCs["12431"] = "血牙狼人"
private.L.NPCs["12433"] = "『旋影者』克雷希斯"
private.L.NPCs["1260"] = "霜鬃長老阿克提卡斯"
private.L.NPCs["12902"] = "洛古斯·傑特"
private.L.NPCs["13896"] = "鱗鬚海龜"
private.L.NPCs["1398"] = "大頭目加爾高西"
private.L.NPCs["1399"] = "瑪高什"
private.L.NPCs["14221"] = "格拉夫斯·斯里諾特"
private.L.NPCs["14222"] = "阿拉加"
private.L.NPCs["14223"] = "暴躁的本希"
private.L.NPCs["14224"] = "7:XT"
private.L.NPCs["14225"] = "凱雷恩王子"
private.L.NPCs["14226"] = "卡斯克" -- Needs review
private.L.NPCs["14227"] = "西斯普拉克" -- Needs review
private.L.NPCs["14228"] = "基格勒爾" -- Needs review
private.L.NPCs["14229"] = "可憎的滑刃納迦" -- Needs review
private.L.NPCs["14230"] = "賊眼" -- Needs review
private.L.NPCs["14231"] = "『咆哮者』杜格斯" -- Needs review
private.L.NPCs["14232"] = "達爾特" -- Needs review
private.L.NPCs["14233"] = "雷普斯凱爾" -- Needs review
private.L.NPCs["14234"] = "哈尤克" -- Needs review
private.L.NPCs["14235"] = "腐爛者" -- Needs review
private.L.NPCs["14236"] = "安戈雷爾領主" -- Needs review
private.L.NPCs["14237"] = "軟泥蟲" -- Needs review
private.L.NPCs["1424"] = "掘地工頭目" -- Needs review
private.L.NPCs["1425"] = "庫布" -- Needs review
private.L.NPCs["14266"] = "『編織者』杉達" -- Needs review
private.L.NPCs["14267"] = "『碾碎者』埃摩戈" -- Needs review
private.L.NPCs["14268"] = "康達爾" -- Needs review
private.L.NPCs["14269"] = "搜尋者埃庫隆" -- Needs review
private.L.NPCs["14270"] = "斯奎迪克" -- Needs review
private.L.NPCs["14271"] = "雷布查斯" -- Needs review
private.L.NPCs["14272"] = "斯納弗賴爾" -- Needs review
private.L.NPCs["14273"] = "波德哈特" -- Needs review
private.L.NPCs["14275"] = "塔爾瑪·雷矛" -- Needs review
private.L.NPCs["14276"] = "斯卡基爾" -- Needs review
private.L.NPCs["14277"] = "塞菲莉斯女士" -- Needs review
private.L.NPCs["14278"] = "洛巴爾克" -- Needs review
private.L.NPCs["14279"] = "克雷普塞斯" -- Needs review
private.L.NPCs["14280"] = "薩姆拉斯"
private.L.NPCs["14281"] = "『流血者』吉米"
private.L.NPCs["14339"] = "死亡之嚎"
private.L.NPCs["14340"] = "奧辛爾·靈息"
private.L.NPCs["14342"] = "怒掌"
private.L.NPCs["14343"] = "『智者』奧爾姆"
private.L.NPCs["14344"] = "莫戈雷斯"
private.L.NPCs["14345"] = "歐加爾"
private.L.NPCs["14424"] = "米爾洛"
private.L.NPCs["14425"] = "納博恩"
private.L.NPCs["14426"] = "哈爾伯·邪泉"
private.L.NPCs["14427"] = "吉比斯尼克"
private.L.NPCs["14428"] = "烏魯森"
private.L.NPCs["14429"] = "格雷莫爾"
private.L.NPCs["14430"] = "暮色巡者"
private.L.NPCs["14431"] = "憤怒的謝爾達"
private.L.NPCs["14432"] = "瑟雷基爾"
private.L.NPCs["14433"] = "斯拉丁"
private.L.NPCs["14445"] = "維爾瑪克隊長"
private.L.NPCs["14446"] = "芬加特"
private.L.NPCs["14447"] = "基摩里安"
private.L.NPCs["14448"] = "摩塔索恩"
private.L.NPCs["14471"] = "瑟提斯"
private.L.NPCs["14472"] = "格雷瑟爾"
private.L.NPCs["14473"] = "拉普雷斯"
private.L.NPCs["14474"] = "蘇爾拉"
private.L.NPCs["14475"] = "雷克斯·亞希爾"
private.L.NPCs["14476"] = "克里拉克"
private.L.NPCs["14477"] = "格魯布索爾"
private.L.NPCs["14478"] = "哈瑞坎尼安"
private.L.NPCs["14479"] = "暮光領主艾沃蘭"
private.L.NPCs["14487"] = "戈魯格爾"
private.L.NPCs["14488"] = "羅洛克"
private.L.NPCs["14490"] = "瑞帕"
private.L.NPCs["14491"] = "庫爾莫克"
private.L.NPCs["14492"] = "維里弗尼克斯"
private.L.NPCs["1531"] = "失落的靈魂"
private.L.NPCs["1533"] = "痛苦之靈"
private.L.NPCs["1552"] = "金鱗蜥蜴"
private.L.NPCs["16179"] = "潛伏者亞奇斯"
private.L.NPCs["16180"] = "滑翔者薛迪依斯"
private.L.NPCs["16181"] = "劫毀者拉卡"
private.L.NPCs["16184"] = "奈幽監督者"
private.L.NPCs["16854"] = "艾丁納克斯"
private.L.NPCs["16855"] = "崔格拉"
private.L.NPCs["17144"] = "鋒牙"
private.L.NPCs["18241"] = "硬殼"
private.L.NPCs["1837"] = "血色法官"
private.L.NPCs["1838"] = "血色審問者"
private.L.NPCs["1839"] = "血色高階牧師"
private.L.NPCs["1841"] = "血色劊子手"
private.L.NPCs["1843"] = "工頭傑瑞斯"
private.L.NPCs["1844"] = "工頭瑪希瑞德"
private.L.NPCs["1847"] = "弗曼恩"
private.L.NPCs["1848"] = "瑪達薩爾領主"
private.L.NPCs["1849"] = "恐怖耳語者"
private.L.NPCs["1850"] = "普特迪烏斯"
private.L.NPCs["1851"] = "哈斯克"
private.L.NPCs["18677"] = "狂野的米克索格"
private.L.NPCs["18678"] = "飽食者"
private.L.NPCs["18679"] = "弗拉肯·厄語者"
private.L.NPCs["18680"] = "瑪堤卡"
private.L.NPCs["18681"] = "盤牙特使"
private.L.NPCs["18682"] = "泥沼潛伏者"
private.L.NPCs["18683"] = "虛無獵人亞爾"
private.L.NPCs["18684"] = "無氏族的伯卡茲"
private.L.NPCs["18685"] = "歐克瑞克"
private.L.NPCs["18686"] = "末日預言者裘瑞姆"
private.L.NPCs["18689"] = "殘廢者"
private.L.NPCs["18690"] = "崩碎者"
private.L.NPCs["18692"] = "赫瑪西恩"
private.L.NPCs["18693"] = "首長瑪庫隆"
private.L.NPCs["18694"] = "『扭曲監視者』克里達斯"
private.L.NPCs["18695"] = "傑瑞卡大使"
private.L.NPCs["18696"] = "克拉特"
private.L.NPCs["18697"] = "首席工程師羅桑德"
private.L.NPCs["18698"] = "恆核懲戒者"
private.L.NPCs["1885"] = "血色鐵匠"
private.L.NPCs["1910"] = "穆亞德"
private.L.NPCs["1911"] = "迪布"
private.L.NPCs["1936"] = "農夫索利丹"
private.L.NPCs["2090"] = "馬魯克·龍鱗"
private.L.NPCs["20932"] = "努拉莫克"
private.L.NPCs["2108"] = "加內格·焦顱"
private.L.NPCs["2162"] = "阿高爾"
private.L.NPCs["2172"] = "雌性森林陸行鳥"
private.L.NPCs["21724"] = "鷹剋"
private.L.NPCs["2175"] = "影爪"
private.L.NPCs["2184"] = "莫嘉澤爾女士"
private.L.NPCs["2186"] = "『擊破者』卡尼沃斯"
private.L.NPCs["2191"] = "利斯林"
private.L.NPCs["2192"] = "召火者拉迪森"
private.L.NPCs["22060"] = "『刺客』凡妮莎"
private.L.NPCs["22062"] = "魏德林博士"
private.L.NPCs["2258"] = "瑪加拉克"
private.L.NPCs["2452"] = "斯格霍爾"
private.L.NPCs["2453"] = "洛格羅什"
private.L.NPCs["2476"] = "戈許哈爾迪爾"
private.L.NPCs["2541"] = "薩克拉希斯領主"
private.L.NPCs["2598"] = "達貝爾·蒙特羅斯"
private.L.NPCs["2600"] = "詠唱者"
private.L.NPCs["2601"] = "弗爾伯利"
private.L.NPCs["2602"] = "盧爾·巨石"
private.L.NPCs["2603"] = "考沃克"
private.L.NPCs["2604"] = "碎骨者穆羅克"
private.L.NPCs["2605"] = "札拉斯·枯木"
private.L.NPCs["2606"] = "『屠戮者』尼瑪爾"
private.L.NPCs["2609"] = "地卜師弗林塔格"
private.L.NPCs["2744"] = "影爐指揮官"
private.L.NPCs["2749"] = "攻城魔像"
private.L.NPCs["2751"] = "戰爭魔像"
private.L.NPCs["2752"] = "拉姆布勒"
private.L.NPCs["2753"] = "巴納布斯"
private.L.NPCs["2754"] = "安納塞姆斯"
private.L.NPCs["2779"] = "納茲加克王子"
private.L.NPCs["2850"] = "斷牙"
private.L.NPCs["2931"] = "札里科特"
private.L.NPCs["3058"] = "阿蘭其亞"
private.L.NPCs["3068"] = "馬茲拉納奇"
private.L.NPCs["32357"] = "老晶樹"
private.L.NPCs["32358"] = "方寶·機風"
private.L.NPCs["32361"] = "冰角"
private.L.NPCs["32377"] = "『嗜血者』佩洛巴斯" -- Needs review
private.L.NPCs["32386"] = "『戰爭侍女』葳格迪斯"
private.L.NPCs["32398"] = "乒乒王"
private.L.NPCs["32400"] = "土克瑪斯"
private.L.NPCs["32409"] = "瘋狂的因度雷生還者"
private.L.NPCs["32417"] = "血色大領主黛昂"
private.L.NPCs["32422"] = "葛洛克拉"
private.L.NPCs["32429"] = "沸騰憎恨"
private.L.NPCs["32435"] = "維恩"
private.L.NPCs["32438"] = "『雕骨者』塞瑞安" -- Needs review
private.L.NPCs["32447"] = "祖爾德拉克哨兵" -- Needs review
private.L.NPCs["32471"] = "格里根" -- Needs review
private.L.NPCs["32475"] = "恐懼紡織者"
private.L.NPCs["32481"] = "奧托納"
private.L.NPCs["32485"] = "克洛許王"
private.L.NPCs["32487"] = "古老的普崔達斯"
private.L.NPCs["32491"] = "時光流逝元龍"
private.L.NPCs["32495"] = "希爾達娜·亡據者"
private.L.NPCs["32500"] = "德碁"
private.L.NPCs["32501"] = "大族長裘弗斯"
private.L.NPCs["32517"] = "羅奎納哈克"
private.L.NPCs["3253"] = "異種收割者"
private.L.NPCs["32630"] = "維拉苟莎"
private.L.NPCs["3270"] = "秘術使拉佐斯諾特"
private.L.NPCs["3295"] = "淤泥異常體"
private.L.NPCs["33776"] = "剛卓亞"
private.L.NPCs["3398"] = "格沙拉罕"
private.L.NPCs["3470"] = "拉索利安"
private.L.NPCs["35189"] = "史科爾"
private.L.NPCs["3535"] = "惡臭的黑苔獸"
private.L.NPCs["3581"] = "下水道猛獸"
private.L.NPCs["3652"] = "『鞭笞者』特里高雷"
private.L.NPCs["3672"] = "博艾恩"
private.L.NPCs["3735"] = "藥劑師法爾瑟斯"
private.L.NPCs["3736"] = "黑暗殺戮者摩迪沙爾"
private.L.NPCs["3773"] = "阿克瑞魯斯"
private.L.NPCs["3792"] = "恐狼族長" -- Needs review
private.L.NPCs["38453"] = "大角"
private.L.NPCs["3872"] = "死亡誓言者隊長" -- Needs review
private.L.NPCs["39183"] = "蠍子王" -- Needs review
private.L.NPCs["39185"] = "唾顎"
private.L.NPCs["39186"] = "地獄凝視者"
private.L.NPCs["4066"] = "納爾塔薩"
private.L.NPCs["4132"] = "克爾基斯"
private.L.NPCs["4339"] = "布雷姆戈"
private.L.NPCs["43488"] = "摩爾戴撕地者"
private.L.NPCs["43613"] = "末日預言智慧行者" -- Needs review
private.L.NPCs["43720"] = "『無精打采』刺鬃"
private.L.NPCs["4380"] = "暗霧寡婦蛛"
private.L.NPCs["44224"] = "兩趾"
private.L.NPCs["44225"] = "路法斯·暗擊"
private.L.NPCs["44226"] = "薩爾圖斯"
private.L.NPCs["44227"] = "『湖灣獵人』加祖茲"
private.L.NPCs["4425"] = "盲眼獵手"
private.L.NPCs["44714"] = "騷動不安的佛隆寇"
private.L.NPCs["44722"] = "納里安的扭曲映像"
private.L.NPCs["44750"] = "卡利夫·斯科比斯汀"
private.L.NPCs["44759"] = "安德雷·火鬍"
private.L.NPCs["44761"] = "被釋放的亞奎門塔斯"
private.L.NPCs["44767"] = "墮落的奧庫魯斯"
private.L.NPCs["45257"] = "莫爾達克控夜者"
private.L.NPCs["45258"] = "『蜿滑之后』卡希雅"
private.L.NPCs["45260"] = "黑葉"
private.L.NPCs["45262"] = "『末日使者』納瑞克瑟斯"
private.L.NPCs["45369"] = "莫瑞克·暗酒"
private.L.NPCs["45380"] = "灰燼之尾"
private.L.NPCs["45384"] = "智掌"
private.L.NPCs["45398"] = "格瑞茲拉克"
private.L.NPCs["45399"] = "奧普提莫"
private.L.NPCs["45401"] = "白鰭"
private.L.NPCs["45402"] = "尼克斯"
private.L.NPCs["45404"] = "地造者瑪蓮"
private.L.NPCs["45739"] = "未知士兵"
private.L.NPCs["45740"] = "看守者伊娃"
private.L.NPCs["45771"] = "瑪魯斯"
private.L.NPCs["45785"] = "雕刻南瓜怪"
private.L.NPCs["45801"] = "伊莉莎"
private.L.NPCs["45811"] = "瑪莉娜·德西路斯"
private.L.NPCs["462"] = "烏爾圖斯"
private.L.NPCs["46981"] = "奈塔拉什"
private.L.NPCs["46992"] = "『月狂』博拉爾德"
private.L.NPCs["47003"] = "博爾加夫"
private.L.NPCs["47008"] = "芬維克·薩托斯"
private.L.NPCs["47009"] = "無縛的厄奎里爾斯"
private.L.NPCs["47010"] = "印迪苟斯"
private.L.NPCs["47012"] = "埃弗里圖斯"
private.L.NPCs["47015"] = "迷失的阿魯高之子"
private.L.NPCs["47023"] = "圖勒·鴉爪"
private.L.NPCs["471"] = "母蜘蛛"
private.L.NPCs["472"] = "費德菲尼爾"
private.L.NPCs["47386"] = "蟲后艾娜米斯"
private.L.NPCs["47387"] = "『騷擾者』哈拉吉斯"
private.L.NPCs["4842"] = "喚地者哈穆加"
private.L.NPCs["49822"] = "翡翠牙"
private.L.NPCs["49913"] = "女神菈菈"
private.L.NPCs["50005"] = "波賽達斯"
private.L.NPCs["50009"] = "莫比斯"
private.L.NPCs["50050"] = "肖克·薩菈克"
private.L.NPCs["50051"] = "鬼蟹"
private.L.NPCs["50052"] = "伯吉·黑心"
private.L.NPCs["50053"] = "『流亡者』薩爾圖克"
private.L.NPCs["50056"] = "加爾"
private.L.NPCs["50057"] = "燄翼"
private.L.NPCs["50058"] = "懼龜"
private.L.NPCs["50059"] = "戈爾加羅克"
private.L.NPCs["50060"] = "特波魯斯"
private.L.NPCs["50061"] = "克薩瑞歐納"
private.L.NPCs["50062"] = "艾歐納克斯"
private.L.NPCs["50063"] = "阿克瑪哈特"
private.L.NPCs["50064"] = "黑翼席魯斯"
private.L.NPCs["50065"] = "末日犰狳"
private.L.NPCs["50085"] = "霸主怒斬"
private.L.NPCs["50086"] = "邪惡的塔維斯"
private.L.NPCs["50089"] = "毀滅祖拉克"
private.L.NPCs["50138"] = "卡羅馬"
private.L.NPCs["50154"] = "麥碟司 (棕色)"
private.L.NPCs["50159"] = "森巴斯"
private.L.NPCs["50328"] = "范高"
private.L.NPCs["50329"] = "烙克"
private.L.NPCs["50330"] = "克雷"
private.L.NPCs["50331"] = "郭墾"
private.L.NPCs["50332"] = "闊達·托羅斯"
private.L.NPCs["50333"] = "『公牛』隆恩"
private.L.NPCs["50334"] = "『破壞者』搭克"
private.L.NPCs["50335"] = "艾力特斯"
private.L.NPCs["50336"] = "『銳眼』尤里克"
private.L.NPCs["50337"] = "嘎嘎"
private.L.NPCs["50338"] = "寇納斯·夜蠻"
private.L.NPCs["50339"] = "蘇里索爾"
private.L.NPCs["50340"] = "鴆毒』加崙"
private.L.NPCs["50341"] = "伯巾·暗拳"
private.L.NPCs["50342"] = "賀羅尼斯"
private.L.NPCs["50343"] = "奎兒"
private.L.NPCs["50344"] = "諾拉克斯"
private.L.NPCs["50345"] = "艾力特"
private.L.NPCs["50346"] = "洛納克"
private.L.NPCs["50347"] = "『晦暗者』卡爾"
private.L.NPCs["50348"] = "諾瑞西斯"
private.L.NPCs["50349"] = "『偷魂手』康"
private.L.NPCs["50350"] = "魔津·碎齒"
private.L.NPCs["50351"] = "強達兒"
private.L.NPCs["50352"] = "曲奈斯"
private.L.NPCs["50353"] = "瑪納斯"
private.L.NPCs["50354"] = "哈瓦克"
private.L.NPCs["50355"] = "喀提兒"
private.L.NPCs["50356"] = "『大刀』寇羅"
private.L.NPCs["50357"] = "日翼"
private.L.NPCs["50358"] = "艾勒斯崔亞"
private.L.NPCs["50359"] = "烏果烈"
private.L.NPCs["50361"] = "奧納特"
private.L.NPCs["50362"] = "『尖牙』黑沼"
private.L.NPCs["50363"] = "克雷西克"
private.L.NPCs["50364"] = "『撕裂者』納拉克"
private.L.NPCs["50370"] = "卡爾拉帕斯"
private.L.NPCs["50388"] = "托里克·艾希斯"
private.L.NPCs["50409"] = "神秘駱駝刻像"
private.L.NPCs["50410"] = "神秘駱駝刻像"
private.L.NPCs["506"] = "利爪隊長"
private.L.NPCs["507"] = "芬羅斯"
private.L.NPCs["50724"] = "椎行者"
private.L.NPCs["50725"] = "艾澤利斯克"
private.L.NPCs["50726"] = "卡力克斯"
private.L.NPCs["50727"] = "『鉤刺』斯里克斯"
private.L.NPCs["50728"] = "死亡之擊"
private.L.NPCs["50730"] = "毒脊"
private.L.NPCs["50731"] = "黑牙" -- Needs review
private.L.NPCs["50733"] = "思基席克"
private.L.NPCs["50734"] = "『潛獵者』利犀客"
private.L.NPCs["50735"] = "響尾蛇閃眼"
private.L.NPCs["50737"] = "阿克羅尼斯"
private.L.NPCs["50738"] = "閃鱗"
private.L.NPCs["50739"] = "賈洛克"
private.L.NPCs["50741"] = "凱克斯"
private.L.NPCs["50742"] = "屈姆"
private.L.NPCs["50743"] = "邁納斯"
private.L.NPCs["50744"] = "區里克"
private.L.NPCs["50745"] = "羅薩支"
private.L.NPCs["50746"] = "『掘洞者』波尼克斯"
private.L.NPCs["50747"] = "提克斯"
private.L.NPCs["50748"] = "尼賈"
private.L.NPCs["50749"] = "『枯索』卡提克"
private.L.NPCs["50750"] = "艾西斯"
private.L.NPCs["50752"] = "塔倫提斯"
private.L.NPCs["50759"] = "寡婦伊利斯"
private.L.NPCs["50763"] = "巡影者"
private.L.NPCs["50764"] = "帕拉麗絲"
private.L.NPCs["50765"] = "邁呀米斯"
private.L.NPCs["50766"] = "思勒那"
private.L.NPCs["50768"] = "舟倪師·水行者"
private.L.NPCs["50769"] = "『流亡者』諾拉克斯"
private.L.NPCs["50770"] = "柔納"
private.L.NPCs["50772"] = "艾須戎"
private.L.NPCs["50775"] = "『獵人』利克"
private.L.NPCs["50776"] = "納拉許·沃丹提斯"
private.L.NPCs["50777"] = "晶眼"
private.L.NPCs["50778"] = "鐵網"
private.L.NPCs["50779"] = "史孢貢恩"
private.L.NPCs["50780"] = "『獵潮者』山恩"
private.L.NPCs["50782"] = "薩爾納克"
private.L.NPCs["50783"] = "沙利斯戰爭斥候"
private.L.NPCs["50784"] = "阿尼斯"
private.L.NPCs["50785"] = "天影"
private.L.NPCs["50786"] = "炫翼"
private.L.NPCs["50787"] = "『重鱗』阿內斯"
private.L.NPCs["50788"] = "鍷澤爾"
private.L.NPCs["50789"] = "『神諭者』尼索斯"
private.L.NPCs["50790"] = "伊歐尼斯"
private.L.NPCs["50791"] = "『磨石』西翠斯"
private.L.NPCs["50792"] = "奇亞"
private.L.NPCs["50797"] = "尤基寇"
private.L.NPCs["50803"] = "噬骨者"
private.L.NPCs["50804"] = "撕翼"
private.L.NPCs["50805"] = "歐姆尼斯·格林洛克"
private.L.NPCs["50806"] = "『獨眼』魔朵"
private.L.NPCs["50807"] = "卡托爾"
private.L.NPCs["50808"] = "『行者』烏洛比"
private.L.NPCs["50809"] = "海瑞斯"
private.L.NPCs["50810"] = "伊希賽特之獸"
private.L.NPCs["50811"] = "納斯拉·汙皮"
private.L.NPCs["50812"] = "艾雷伊"
private.L.NPCs["50813"] = "芬瑪爾"
private.L.NPCs["50814"] = "食屍者"
private.L.NPCs["50815"] = "斯卡爾"
private.L.NPCs["50816"] = "魯恩·幽爪"
private.L.NPCs["50817"] = "『漫遊者』阿宏"
private.L.NPCs["50818"] = "黑暗徘徊者"
private.L.NPCs["50819"] = "冰爪"
private.L.NPCs["50820"] = "煜爾·蠻爪"
private.L.NPCs["50821"] = "艾利·天鏡"
private.L.NPCs["50822"] = "『疾雲』艾崙"
private.L.NPCs["50823"] = "恰伯伯"
private.L.NPCs["50825"] = "費拉斯"
private.L.NPCs["50828"] = "博諾伯"
private.L.NPCs["50830"] = "史並進"
private.L.NPCs["50831"] = "史闊契"
private.L.NPCs["50832"] = "猶勒"
private.L.NPCs["50833"] = "暮皮"
private.L.NPCs["50836"] = "靈巧的伊克伊克"
private.L.NPCs["50837"] = "凱許"
private.L.NPCs["50838"] = "塔布斯"
private.L.NPCs["50839"] = "克羅米尼斯"
private.L.NPCs["50840"] = "頭目南納斯"
private.L.NPCs["50842"] = "熔岩怪"
private.L.NPCs["50846"] = "史拉莫"
private.L.NPCs["50855"] = "狂犬賈克斯"
private.L.NPCs["50856"] = "史納克"
private.L.NPCs["50858"] = "塵翅"
private.L.NPCs["50864"] = "西奇特"
private.L.NPCs["50865"] = "沙烏里克斯"
private.L.NPCs["50874"] = "特諾克"
private.L.NPCs["50875"] = "奈科斯"
private.L.NPCs["50876"] = "奈科斯"
private.L.NPCs["50882"] = "丘帕卡布羅斯"
private.L.NPCs["50884"] = "膽小的塵奔"
private.L.NPCs["50886"] = "海翼"
private.L.NPCs["50891"] = "波羅斯"
private.L.NPCs["50892"] = "莘茵"
private.L.NPCs["50895"] = "沃盧克斯"
private.L.NPCs["50897"] = "沙丘巡者法斯克"
private.L.NPCs["50901"] = "特羅馬克"
private.L.NPCs["50903"] = "奧力克斯"
private.L.NPCs["50905"] = "席達"
private.L.NPCs["50906"] = "穆提拉克斯"
private.L.NPCs["50908"] = "夜嚎"
private.L.NPCs["50915"] = "斯諾特"
private.L.NPCs["50916"] = "『悲鳴者』瘸腳"
private.L.NPCs["50922"] = "瓦格"
private.L.NPCs["50925"] = "林爪"
private.L.NPCs["50926"] = "灰熊班"
private.L.NPCs["50929"] = "小畢雍"
private.L.NPCs["50930"] = "睡眠者海柏尼斯"
private.L.NPCs["50931"] = "獸癬"
private.L.NPCs["50937"] = "隱肉"
private.L.NPCs["50940"] = "史威"
private.L.NPCs["50942"] = "『掘土者』史奴特"
private.L.NPCs["50945"] = "史考夫"
private.L.NPCs["50946"] = "豬吉拉"
private.L.NPCs["50947"] = "瓦拉"
private.L.NPCs["50948"] = "晶背"
private.L.NPCs["50949"] = "費恩的先鋒"
private.L.NPCs["50952"] = "藤壺吉姆"
private.L.NPCs["50955"] = "卡西納克"
private.L.NPCs["50957"] = "巨爪"
private.L.NPCs["50959"] = "卡爾金"
private.L.NPCs["50964"] = "查普斯"
private.L.NPCs["50967"] = "『劫毀者』克羅"
private.L.NPCs["50986"] = "金背"
private.L.NPCs["50993"] = "蓋爾多拉克"
private.L.NPCs["50995"] = "擣碎"
private.L.NPCs["50997"] = "『頂角』波納克"
private.L.NPCs["51000"] = "『硬甲』黑殼" -- Needs review
private.L.NPCs["51001"] = "毒爪" -- Needs review
private.L.NPCs["51002"] = "史科波克斯" -- Needs review
private.L.NPCs["51004"] = "托克斯" -- Needs review
private.L.NPCs["51007"] = "賽爾坷特" -- Needs review
private.L.NPCs["51008"] = "尖刺恐獸" -- Needs review
private.L.NPCs["51010"] = "史尼皮司" -- Needs review
private.L.NPCs["51014"] = "泰拉皮斯" -- Needs review
private.L.NPCs["51017"] = "葛贊"
private.L.NPCs["51018"] = "佐穆斯"
private.L.NPCs["51021"] = "佛提庫斯"
private.L.NPCs["51022"] = "寇迪克斯"
private.L.NPCs["51025"] = "戴爾納"
private.L.NPCs["51026"] = "納斯"
private.L.NPCs["51027"] = "史匹洛庫拉"
private.L.NPCs["51028"] = "深掘者"
private.L.NPCs["51029"] = "帕拉賽特絲"
private.L.NPCs["51031"] = "追蹤犬"
private.L.NPCs["51037"] = "失落吉爾尼斯戰犬"
private.L.NPCs["51040"] = "司諾佛斯"
private.L.NPCs["51042"] = "冷心"
private.L.NPCs["51044"] = "瘟疫"
private.L.NPCs["51045"] = "阿坎努斯"
private.L.NPCs["51046"] = "芬多尼斯"
private.L.NPCs["51048"] = "雷克斯許司"
private.L.NPCs["51052"] = "香蕉囤積者吉伯"
private.L.NPCs["51053"] = "圭里克斯"
private.L.NPCs["51057"] = "象鼻蟲"
private.L.NPCs["51058"] = "阿菲斯"
private.L.NPCs["51059"] = "黑蹄"
private.L.NPCs["51061"] = "羅斯·薩萊姆"
private.L.NPCs["51062"] = "凱普-黎"
private.L.NPCs["51063"] = "菲拉納克斯"
private.L.NPCs["51066"] = "晶牙"
private.L.NPCs["51067"] = "閃光"
private.L.NPCs["51069"] = "辛提雷克斯"
private.L.NPCs["51071"] = "佛羅倫斯船長"
private.L.NPCs["51076"] = "婁佩絲"
private.L.NPCs["51077"] = "蓬尾"
private.L.NPCs["51078"] = "弗迪南" -- Needs review
private.L.NPCs["51079"] = "劣風船長"
private.L.NPCs["51401"] = "麥碟司 (紅色)"
private.L.NPCs["51402"] = "麥碟司 (綠色)"
private.L.NPCs["51403"] = "麥碟司 (黑色)"
private.L.NPCs["51404"] = "麥碟司 (藍色)"
private.L.NPCs["51658"] = "操亡者莫赫"
private.L.NPCs["51661"] = "蘇爾卡魯"
private.L.NPCs["51662"] = "穆哈姆巴"
private.L.NPCs["51663"] = "博格雅恩"
private.L.NPCs["519"] = "斯拉克"
private.L.NPCs["520"] = "布拉克"
private.L.NPCs["521"] = "魯伯斯"
private.L.NPCs["52146"] = "蜘蜘"
private.L.NPCs["534"] = "奈法魯"
private.L.NPCs["5343"] = "莎爾萊"
private.L.NPCs["5345"] = "鉆石頭"
private.L.NPCs["5346"] = "潛行者布拉多爾"
private.L.NPCs["5347"] = "滑翔者安蒂魯斯"
private.L.NPCs["5348"] = "睡夢守衛弗克托"
private.L.NPCs["5349"] = "阿拉瑟希斯"
private.L.NPCs["5350"] = "基洛特"
private.L.NPCs["5352"] = "灰腹老熊"
private.L.NPCs["5354"] = "納爾利夫"
private.L.NPCs["5356"] = "咆哮者"
private.L.NPCs["54318"] = "安卡"
private.L.NPCs["54319"] = "瑪格瑞亞"
private.L.NPCs["54320"] = "班薩洛斯"
private.L.NPCs["54321"] = "索利克斯"
private.L.NPCs["54322"] = "殆死堤拉克"
private.L.NPCs["54323"] = "基利克斯"
private.L.NPCs["54324"] = "掠焰"
private.L.NPCs["54338"] = "安斯銳斯"
private.L.NPCs["54533"] = "萊克瑪王子"
private.L.NPCs["56081"] = "樂觀的本希"
private.L.NPCs["572"] = "萊布裏薩斯"
private.L.NPCs["573"] = "死神4000型"
private.L.NPCs["574"] = "納拉克西斯"
private.L.NPCs["5785"] = "海特拉什"
private.L.NPCs["5786"] = "斷矛"
private.L.NPCs["5787"] = "執行者埃米爾岡德"
private.L.NPCs["5807"] = "掃蕩者"
private.L.NPCs["5809"] = "指揮官薩拉菲爾"
private.L.NPCs["5822"] = "斯考恩"
private.L.NPCs["5823"] = "死亡毒蠍"
private.L.NPCs["5824"] = "獠牙隊長"
private.L.NPCs["5826"] = "吉歐洛德·雜斑"
private.L.NPCs["5828"] = "獅王休瑪"
private.L.NPCs["5829"] = "土狼斯諾特"
private.L.NPCs["5830"] = "萊絲塔倫"
private.L.NPCs["5831"] = "迅鬃斑馬"
private.L.NPCs["5832"] = "雷蹄蜥蜴"
private.L.NPCs["58336"] = "暗月兔"
private.L.NPCs["5834"] = "天空之刃艾澤裏"
private.L.NPCs["5835"] = "工頭葛瑞爾斯 "
private.L.NPCs["5836"] = "技師維爾雷格"
private.L.NPCs["5837"] = "石臂"
private.L.NPCs["5838"] = "斷矛"
private.L.NPCs["584"] = "卡松"
private.L.NPCs["5841"] = "石槍"
private.L.NPCs["5842"] = "『跳躍者』塔克"
private.L.NPCs["5847"] = "赫金·石須"
private.L.NPCs["58474"] = "血頂"
private.L.NPCs["5848"] = "瑪爾金·麥酒"
private.L.NPCs["5849"] = "礦工弗雷姆"
private.L.NPCs["5851"] = "基洛戈·錘趾隊長"
private.L.NPCs["5859"] = "哈格"
private.L.NPCs["5863"] = "土地祭司古科羅克"
private.L.NPCs["5864"] = "斯文格加特·矛鬃"
private.L.NPCs["5865"] = "迪舒"
private.L.NPCs["58768"] = "裂牙" -- Needs review
private.L.NPCs["58769"] = "邪鱷" -- Needs review
private.L.NPCs["58771"] = "魁帝" -- Needs review
private.L.NPCs["58778"] = "艾薩" -- Needs review
private.L.NPCs["58817"] = "老菲之靈" -- Needs review
private.L.NPCs["58949"] = "『屠夫』貝金"
private.L.NPCs["5912"] = "變異精靈龍"
private.L.NPCs["5915"] = "拉文諾克修士"
private.L.NPCs["5928"] = "悲哀之翼"
private.L.NPCs["5930"] = "瑞雯"
private.L.NPCs["5932"] = "工頭維普弗恩"
private.L.NPCs["5933"] = "被流放的阿切魯斯"
private.L.NPCs["5935"] = "不可戰勝的鐵眼"
private.L.NPCs["59369"] = "瑟爾林·卡斯迪諾夫醫生" -- Needs review
private.L.NPCs["5937"] = "邪刺恐蠍"
private.L.NPCs["596"] = "被洗腦的貴族"
private.L.NPCs["599"] = "魔理莎·杜派格"
private.L.NPCs["60491"] = "憤怒之煞"
private.L.NPCs["61"] = "索羅斯·萊特芬格"
private.L.NPCs["6118"] = "瓦羅森的幽靈"
private.L.NPCs["616"] = "查特"
private.L.NPCs["62"] = "大蠟燭伽格"
private.L.NPCs["6228"] = "黑鐵大使"
private.L.NPCs["62346"] = "帆船"
private.L.NPCs["62880"] = "鐵拳茍暢"
private.L.NPCs["62881"] = "『縛靈者』高魂"
private.L.NPCs["63101"] = "天魔賈將軍"
private.L.NPCs["63240"] = "暗影大師希多"
private.L.NPCs["63509"] = "烏麟"
private.L.NPCs["63510"] = "巫龍"
private.L.NPCs["63691"] = "火霜"
private.L.NPCs["63695"] = "『獻祭者』保萊"
private.L.NPCs["63977"] = "席娃西斯"
private.L.NPCs["63978"] = "科里崇"
private.L.NPCs["64004"] = "鬼影熊貓人漁夫"
private.L.NPCs["64191"] = "鬼影熊貓人工匠"
private.L.NPCs["64403"] = "阿拉尼"
private.L.NPCs["6581"] = "暴掠龍族母"
private.L.NPCs["6582"] = "薩瓦絲女王"
private.L.NPCs["6583"] = "格魯夫"
private.L.NPCs["6584"] = "暴龍之王摩什"
private.L.NPCs["6585"] = "烏卡洛克"
private.L.NPCs["6648"] = "安提裏奧斯"
private.L.NPCs["6649"] = "瑟絲彼拉"
private.L.NPCs["6650"] = "方弗羅將軍"
private.L.NPCs["6651"] = "拉格羅爾"
private.L.NPCs["68317"] = "梅薇思·哈姆斯"
private.L.NPCs["68318"] = "達蘭·碎夜"
private.L.NPCs["68319"] = "笛沙·菲爾沃頓"
private.L.NPCs["68320"] = "鬼祟的烏班提"
private.L.NPCs["68321"] = "卡爾·好戰者"
private.L.NPCs["68322"] = "慕兒塔"
private.L.NPCs["69099"] = "『風暴龍王』納拉卡"
private.L.NPCs["69161"] = "烏達斯塔"
private.L.NPCs["69664"] = "孟塔"
private.L.NPCs["69768"] = "贊達拉戰鬥斥候"
private.L.NPCs["69769"] = "贊達拉戰爭使者(琥珀)"
private.L.NPCs["69841"] = "贊達拉戰爭使者(石板)"
private.L.NPCs["69842"] = "贊達拉戰爭使者(翠玉)"
private.L.NPCs["69843"] = "曹卓"
private.L.NPCs["69996"] = "『天爪』庫賴"
private.L.NPCs["69997"] = "普羅堅尼斯" -- Needs review
private.L.NPCs["69998"] = "戈達"
private.L.NPCs["69999"] = "殺神巨人拉穆克"
private.L.NPCs["70000"] = "『全知者』阿塔比姆"
private.L.NPCs["70001"] = "斷脊者兀魯"
private.L.NPCs["70002"] = "魯班"
private.L.NPCs["70003"] = "莫托爾"
private.L.NPCs["70096"] = "戰神多坎"
private.L.NPCs["70126"] = "威利·懷爾德"
private.L.NPCs["7015"] = "殘忍的弗拉格莫克"
private.L.NPCs["7016"] = "薇絲普拉"
private.L.NPCs["7017"] = "辛斯雷爾"
private.L.NPCs["70238"] = "堅定之眼"
private.L.NPCs["70243"] = "大祭司克拉達"
private.L.NPCs["70249"] = "聚焦之睛"
private.L.NPCs["70276"] = "風暴者魯庫"
private.L.NPCs["70323"] = "卡拉卡諾"
private.L.NPCs["70430"] = "恐怖的洛基"
private.L.NPCs["70440"] = "姆娜"
private.L.NPCs["70530"] = "夏拉"
private.L.NPCs["7104"] = "迪塞庫斯"
private.L.NPCs["7137"] = "伊姆拉圖斯"
private.L.NPCs["71864"] = "史勒剋"
private.L.NPCs["71919"] = "『餿酒』祝貢"
private.L.NPCs["71992"] = "月牙" -- Needs review
private.L.NPCs["72045"] = "查蘭"
private.L.NPCs["72048"] = "喋喋歪歪人"
private.L.NPCs["72049"] = "噬鶴者"
private.L.NPCs["72193"] = "深海之煞卡卡諾"
private.L.NPCs["72245"] = "宙斯卡"
private.L.NPCs["72769"] = "碧火之靈"
private.L.NPCs["72775"] = "布弗"
private.L.NPCs["72808"] = "薩弗卡"
private.L.NPCs["72909"] = "『蟲群使者』古奇"
private.L.NPCs["72970"] = "格坎納"
private.L.NPCs["73157"] = "石蘚行者"
private.L.NPCs["73158"] = "翡翠雄鶴"
private.L.NPCs["73160"] = "鐵鬃鋼角"
private.L.NPCs["73161"] = "巨型龜怒殼"
private.L.NPCs["73163"] = "帝王莽蛇"
private.L.NPCs["73166"] = "巨怪蟹王"
private.L.NPCs["73167"] = "霍龍"
private.L.NPCs["73169"] = "『歐朵勇士』賈庫爾"
private.L.NPCs["73170"] = "看守者歐蘇"
private.L.NPCs["73171"] = "黑焰勇士"
private.L.NPCs["73172"] = "燧石劍士蓋然"
private.L.NPCs["73173"] = "『灼烙者』烏篤爾"
private.L.NPCs["73174"] = "火焰大祭司 (召喚)"
private.L.NPCs["73175"] = "燼火之靈"
private.L.NPCs["73277"] = "癒葉妖"
private.L.NPCs["73279"] = "無盡之喉"
private.L.NPCs["73281"] = "『毀滅之艦』維蘇威號"
private.L.NPCs["73282"] = "血靈迦尼亞"
private.L.NPCs["73293"] = "維茨格"
private.L.NPCs["73666"] = "火焰大祭司 (聖堂)"
private.L.NPCs["73704"] = "臭辮子"
private.L.NPCs["73854"] = "噬鶴者" -- Needs review
private.L.NPCs["763"] = "失落者酋長"
private.L.NPCs["7846"] = "吞噬者特雷姆斯"
private.L.NPCs["79"] = "監工納爾格"
private.L.NPCs["8199"] = "克萊吉拉克"
private.L.NPCs["8200"] = "喚沙者辛薩拉"
private.L.NPCs["8201"] = "失落者奧姆高爾"
private.L.NPCs["8203"] = "克雷格·尼哈魯"
private.L.NPCs["8204"] = "吞噬者索利德"
private.L.NPCs["8205"] = "貪婪的哈爾卡"
private.L.NPCs["8207"] = "巨型火鳥"
private.L.NPCs["8208"] = "Murderous Blisterpaw"
private.L.NPCs["8210"] = "鋒爪"
private.L.NPCs["8211"] = "海崖奔跳者"
private.L.NPCs["8212"] = "雷克"
private.L.NPCs["8213"] = "鐵背龜"
private.L.NPCs["8214"] = "加林德·夏龍"
private.L.NPCs["8215"] = "格瑞姆格斯"
private.L.NPCs["8216"] = "狂暴者雷瑟羅克"
private.L.NPCs["8217"] = "附魔師米瑟雷希斯"
private.L.NPCs["8218"] = "漫步者維瑟哈特"
private.L.NPCs["8219"] = "祖拉雷克"
private.L.NPCs["8277"] = "雷克提拉克"
private.L.NPCs["8278"] = "斯莫達爾"
private.L.NPCs["8279"] = "未完善的作戰傀儡"
private.L.NPCs["8280"] = "夏雷納爾"
private.L.NPCs["8281"] = "斯卡爾德 "
private.L.NPCs["8282"] = "瑪斯托格"
private.L.NPCs["8283"] = "奴隸主托恩·黑心"
private.L.NPCs["8296"] = "扭曲者莫吉爾"
private.L.NPCs["8297"] = "頑強的瑪古諾斯"
private.L.NPCs["8298"] = "先知阿庫巴爾"
private.L.NPCs["8299"] = "斯比弗雷爾"
private.L.NPCs["8300"] = "毀滅"
private.L.NPCs["8301"] = "掠奪者科拉克"
private.L.NPCs["8302"] = "死眼"
private.L.NPCs["8303"] = "格朗特"
private.L.NPCs["8304"] = "德雷斯克恩"
private.L.NPCs["8503"] = "吉波維特"
private.L.NPCs["8660"] = "伊夫卡爾"
private.L.NPCs["8923"] = "無敵的潘佐爾"
private.L.NPCs["8924"] = "貝哈默斯"
private.L.NPCs["8976"] = "赫瑪圖斯"
private.L.NPCs["8978"] = "薩裏斯·巴加爾"
private.L.NPCs["8979"] = "格魯克拉什"
private.L.NPCs["8981"] = "失控的掠奪者"
private.L.NPCs["9217"] = "尖石首席法師"
private.L.NPCs["9218"] = "尖石統帥"
private.L.NPCs["9219"] = "尖石屠夫"
private.L.NPCs["947"] = "沈默的羅恩"
private.L.NPCs["9596"] = "班諾克·巨斧" -- Needs review
private.L.NPCs["9602"] = "哈克佐爾" -- Needs review
private.L.NPCs["9604"] = "高戈諾奇" -- Needs review
private.L.NPCs["9718"] = "霍克·巴什古德" -- Needs review
private.L.NPCs["9736"] = "軍需官茲格雷斯" -- Needs review
private.L.NPCs["99"] = "狡猾的莫加尼" -- Needs review

private.L["BLOCKFLIGHTSCAN"] = "當在飛行路線上時禁止警報"
private.L["BLOCKFLIGHTSCAN_DESC"] = "當在飛行路線上時禁止警報。注意：怪物仍將被快取並且在快取清空前不會得到警報。"
private.L["BUTTON_FOUND"] = "NPC 發現!"
private.L["CACHED_FORMAT"] = "下列單位已在cache中: %s。"
private.L["CACHED_LONG_FORMAT"] = "下列單位已在cache中。可由 |cff808080“/npcscan”|r 的選單移除牠們，或是清除你的cache來重啟搜尋: %s。"
private.L["CACHED_PET_RESTING_FORMAT"] = "以下可訓服寵物在休息時已被快取: %s"
private.L["CACHED_STABLED_FORMAT"] = "以下目標因為已經被訓服所以無法搜尋: %s"
private.L["CACHED_WORLD_FORMAT"] = "下列%2$s單位已在cache中: %1$s。"
private.L["CACHELIST_ENTRY_FORMAT"] = "|cff808080“%s”|r"
private.L["CACHELIST_SEPARATOR"] = ", "
private.L["CMD_ADD"] = "ADD"
private.L["CMD_CACHE"] = "CACHE"
private.L["CMD_CACHE_EMPTY"] = "沒有任何尋找中的怪物存在cache中。"
private.L["CMD_HELP"] = "指令為|cff808080“/npcscan add <NpcID> <Name>”|r, |cff808080“/npcscan remove <Name>”|r, |cff808080“/npcscan cache”|r 列出已在cache中的怪物，可直接由|cff808080“/npcscan”|r 開啟選單。"
private.L["CMD_REMOVE"] = "REMOVE"
private.L["CMD_REMOVENOTFOUND_FORMAT"] = "找不到 |cff808080“%s”|r NPC。"
private.L["CONFIG_ALERT"] = "警報選項"
private.L["CONFIG_ALERT_SOUND"] = "警報音效檔"
private.L["CONFIG_ALERT_SOUND_DEFAULT"] = "|cffffd200預設|r"
private.L["CONFIG_ALERT_SOUND_DESC"] = "選擇發現NPC時的警報聲。其他音效可由加入|cff808080“SharedMedia”|r插件來新增。"
private.L["CONFIG_ALERT_UNMUTE"] = "使警報聲作響"
private.L["CONFIG_ALERT_UNMUTE_DESC"] = "如果您將遊戲靜音了，這將在發現NPC時暫時取消靜音以發出警報聲。"
private.L["CONFIG_CACHEWARNINGS"] = "登入或區域改變時提示已在cache中的怪物。"
private.L["CONFIG_CACHEWARNINGS_DESC"] = "勾選這個選項後，當你登入或是區域改變時，如果NPC已在cache中，會列出那些因為已經在cache中而無法再搜尋的怪物。"
private.L["CONFIG_DESC"] = "這些選項讓你設定當_NPCScan發現稀有NPC時提醒您的方式。"
private.L["CONFIG_PRINTTIME"] = "在聊天視窗顯示時間標記"
private.L["CONFIG_PRINTTIME_DESC"] = "增加目前時間到所有顯示訊息.這對記錄何時發現NPC很有用"
private.L["CONFIG_TEST"] = "測試發現警報"
private.L["CONFIG_TEST_DESC"] = "模擬了 |cff808080“NPC 發現”|r 警報，讓你知道該怎麼看出來的。"
private.L["CONFIG_TEST_HELP_FORMAT"] = "點擊怪物目標按鈕或使用設定的鍵盤，將剛發現的怪物設為目標。按住|cffffffff<%s>|r鍵拖曳滑鼠可移動目標按鈕。注意假如發現NPC你剛好在戰鬥中，該按鍵會在你脫離戰鬥後才出現。"
private.L["CONFIG_TEST_NAME"] = "你! (測試)"
private.L["CONFIG_TITLE"] = "_|cffCCCC88NPCScan|r"
private.L["FOUND_FORMAT"] = "發現 |cff808080“%s”|r!"
private.L["FOUND_TAMABLE_FORMAT"] = "發現 |cff808080“%s”|r!  |cffff2020(提示: 可馴服的怪物，可能只是獵人寵物。)|r"
private.L["FOUND_TAMABLE_WRONGZONE_FORMAT"] = "|cffff2020假警鈴:|r 發現可馴服的怪物|cff808080“%s”|r出現在%s而不是在%s (編號%d)，顯然是獵人的寵物。"
private.L["FOUND_UNIT_DEAD"] = "%s 找到但已死。"
private.L["FOUND_UNIT_TAXI"] = "%s 在飛行路線途中找到接近%d, %d 在 %s"
private.L["PRINT_FORMAT"] = "%s_|cffCCCC88NPCScan|r: %s"
private.L["RAREMOBS"] = "稀有怪物"
private.L["SEARCH_ACHIEVEMENTADDFOUND"] = "繼續搜尋成就裡已經完成的NPC。"
private.L["SEARCH_ACHIEVEMENTADDFOUND_DESC"] = "繼續尋找所有與成就相關的NPC，即使你不需要再擊殺牠們。"
private.L["SEARCH_ACHIEVEMENT_DISABLED"] = "關閉"
private.L["SEARCH_ADD"] = "+"
private.L["SEARCH_ADD_DESC"] = "新增NPC或在此儲存變更。"
private.L["SEARCH_ADD_TAMABLE_FORMAT"] = "注意：|cff808080“%s”|r可被馴服，如果發現牠被馴服為獵人的寵物時將出現假警報。"
private.L["SEARCH_CACHED"] = "已cache"
private.L["SEARCH_COMPLETED"] = "完成"
private.L["SEARCH_DESC"] = "你可以在下表中新增或移除NPC，或是選擇需要搜尋NPC的相關成就。"
private.L["SEARCH_ID"] = "NPC ID"
private.L["SEARCH_ID_DESC"] = "想尋找的NPC的ID。這個編號可以在類似Wowhead.com的資料庫網站上找到。"
private.L["SEARCH_IGNORE"] = "移除"
private.L["SEARCH_IGNORE_DESC"] = "從清單移除選擇的怪物"
private.L["SEARCH_IGNORE_LIST"] = "忽略清單"
private.L["SEARCH_IGNORE_LIST_DESC"] = "列在此清單的怪物NPCScan將不會追蹤"
private.L["SEARCH_MAP"] = "地區:"
private.L["SEARCH_NAME"] = "名稱:"
private.L["SEARCH_NAME_DESC"] = "NPC的稱呼。這個稱呼不需要和NPC原來的名字完全相同。"
private.L["SEARCH_NPCS"] = "自訂NPC"
private.L["SEARCH_NPCS_DESC"] = "新增任何你想尋找的NPC，即使不在成就的項目中。"
private.L["SEARCH_RAREMOBS_DESC"] = "稀有怪物的詳細清單"
private.L["SEARCH_REMOVE"] = "-"
private.L["SEARCH_TAMEBEAST_DECS"] = "可馴服的稀有野獸"
private.L["SEARCH_TITLE"] = "搜尋"
private.L["SEARCH_WORLD"] = "世界:"
private.L["SEARCH_WORLD_DESC"] = "一個非必要的區域名稱，用來限制搜尋區域。可以是世界地圖名稱或是|cffff7f3f副本名稱|r (較敏感)。"
private.L["SEARCH_WORLD_FORMAT"] = "(%s)"
private.L["TAMEDBEASTS"] = "可馴服的野獸"
private.L["TIME_FORMAT"] = "|cff808080[%H:%M:%S]|r "
private.L["TOOLS_TITLE"] = "|cff808080工具|r"
-- private.L["VIGNETTE_SCAN"] = "Show alerts for Vignette Mobs"
-- private.L["VIGNETTE_SCAN_DESC"] = "Show alerts for Vignette Mobs.  This is a Beta Feature:  There is currently no way to filter mobs, so it will always trigger even if mob not tracked or ignored."


_G["BINDING_NAME_CLICK _NPCScanButton:LeftButton"] = [=[最後找到的目標怪物
|cff808080(當_NPCScan通知你時使用)|r]=]; -- Needs review