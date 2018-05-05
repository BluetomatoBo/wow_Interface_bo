local AddOnFolderName, private = ...
local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "koKR")
if not L then return end

L["%1$s (%2$d) is already on the user-defined NPC list."] = "%1$s (%2$d)|1은;는; 이미 사용자 정의 NPC 목록에 있습니다."
L["%1$s (%2$d) is not on the user-defined NPC list."] = "%1$s (%2$d)|1은;는; 사용자 정의 NPC 목록에 없습니다."
L["Added %1$s (%2$d) to the user-defined NPC list."] = "%1$s (%2$d)|1을;를; 사용자 정의 NPC 목록에 추가했습니다."
L["Alerts"] = "경보"
L["BOTTOM"] = "하단"
L["BOTTOMLEFT"] = "좌측 하단"
L["BOTTOMRIGHT"] = "우측 하단"
L["CENTER"] = "중앙"
L["Completed Achievement Criteria"] = "완료된 업적 요소"
L["Completed Quest Objectives"] = "완료된 퀘스트 목표"
--[[Translation missing --]]
--[[ L["Dead NPCs"] = "Dead NPCs"--]] 
L["Detection"] = "감지"
L["Drag to set the spawn point for targeting buttons."] = "대상 지정 버튼의 생성 지점을 설정하려면 드래그하세요."
L["Duration"] = "지속 시간"
L["Hide Anchor"] = "고정 위치 숨기기"
L["Hide During Combat"] = "전투 중 숨기기"
L["Horizontal offset from the anchor point."] = "고정 위치로부터 수평 위치입니다."
L["Ignore Mute"] = "음소거 무시"
L["Interval"] = "간격"
L["LEFT"] = "좌측"
L["NPCs"] = "NPC"
L["Play alert sounds when sound is muted."] = "음소거 상태일때도 경보 소리를 재생합니다."
L["Predefined NPCs cannot be added to or removed from the user-defined NPC list."] = "사전에 정의된 NPC는 사용자 정의 NPC 목록에 추가나 삭제할 수 없습니다."
L["Removed %1$s (%2$d) from the user-defined NPC list."] = "%1$s (%2$d)|1이;가; 사용자 정의 NPC 목록에서 삭제됐습니다."
L["Reset Position"] = "위치 초기화"
L["RIGHT"] = "우측"
L["Screen Flash"] = "화면 깜빡임"
L["Screen Location"] = "화면 위치"
L["Show Anchor"] = "고정 위치 표시"
L["Spawn Point"] = "생성 지점"
L["The number of minutes a targeting button will exist before fading out."] = "대상 지정 버튼이 사라지기 전까지 유지할 분 단위 시간입니다."
L["The number of minutes before an NPC will be detected again."] = "NPC를 다시 감지할 분 단위 시간입니다."
L["TOP"] = "상단"
L["TOPLEFT"] = "좌측 상단"
L["TOPRIGHT"] = "우측 상단"
L["Type the name of a Continent, Dungeon, or Zone, or the partial name of an NPC. Accepts Lua patterns."] = "대륙, 던전, 지역명 내지는 NPC 이름 일부를 입력하세요. Lua 문법도 허용됩니다."
L["Valid values are a numeric NPC ID, the word \"mouseover\" while you have your mouse cursor over an NPC, or the word \"target\" while you have an NPC set as your target."] = "올바른 값은 숫자로 된 NPC ID로, NPC에 마우스 커서를 올릴땐 \"mouseover\" 글자가 표시되며 대상으로 NPC 세트를 보유하고 있을땐 \"target\" 글자가 표시됩니다."
L["Vertical offset from the anchor point."] = "고정 위치로부터 수직 위치입니다."
L["X Offset"] = "X 좌표"
L["Y Offset"] = "Y 좌표"


local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "koKR")
if not VL then return end

-- Vignette
VL["Aarkos - Looted Treasure"] = "아라코스 - 보물 획득"
VL["Abandoned Fishing Pole"] = "버려진 낚싯대"
--[[Translation missing --]]
--[[ VL["Alpha Bat"] = "Alpha Bat"--]] 
VL["Amateur Hunters"] = "초보 사냥꾼"
VL["Ambassador D'vwinn"] = "대사 디브윈"
VL["Anax"] = "아낙스"
VL["Anchorite's Sojourn"] = "수도자의 체류지"
VL["Antydas Nightcaller's Hideaway"] = "안티다스 나이트콜러의 은신처"
VL["Apothecary Faldren"] = "연금술사 폴드런"
VL["Arcanist Lylandre"] = "비전술사 리란드레"
VL["Arcanist Shal'iman"] = "비전술사 샬이만"
VL["Artificer Lothaire"] = "기술병 로테어"
VL["Avatar of Sothrecar"] = "소크레타르의 화신"
VL["Bahagar"] = "바하가르"
VL["Ba'ruun"] = "바룬"
--[[Translation missing --]]
--[[ VL["Battle of the Barnacle"] = "Battle of the Barnacle"--]] 
VL["Beacher"] = "파도 거수"
VL["Beastmaster Pao'lek"] = "야수조련사 파오레크"
--[[Translation missing --]]
--[[ VL["BH Master Scout"] = "BH Master Scout"--]] 
VL["Bilebrain"] = "흉악뿔"
VL["Bladesquall"] = "칼날돌풍"
VL["Bodash the Hoarder"] = "탐욕스러운 보다쉬"
VL["Brawlgoth"] = "브롤고스"
VL["Bristlemaul"] = "뾰족털 망치발"
VL["Brogrul the Mighty"] = "힘세고 강한 브로그룰"
VL["Broodmother Lizax"] = "무리어미 리작스"
VL["Cache of Infernals"] = "지옥불정령의 보관 장소"
VL["Cadraeus"] = "카드레우스"
VL["Cailyn Paledoom"] = "케일린 페일둠"
VL["Captain Volo'ren"] = "대장 볼로렌"
VL["Captured Survivor"] = "사로잡힌 생존자"
--[[Translation missing --]]
--[[ VL["Cave Keeper"] = "Cave Keeper"--]] 
VL["Champion Chomper"] = "용사 포식자"
--[[Translation missing --]]
--[[ VL["Charfeather"] = "Charfeather"--]] 
VL["Chief Bitterbrine"] = "쓴소금물 족장"
VL["Cindral"] = "신드랄"
VL["Coldstomp"] = "한기발굽"
--[[Translation missing --]]
--[[ VL["Commander Soraax"] = "Commander Soraax"--]] 
VL["Cora'kar"] = "코라카르"
VL["Coura, Master of Arcana"] = "비전술의 여제 쿠라"
VL["Crab Rider Grmlrml"] = "게 기수 우옳옳"
VL["Crawshuk the Hungry"] = "굶주린 크로슈크"
--[[Translation missing --]]
--[[ VL["Crystalbeard"] = "Crystalbeard"--]] 
VL["Daggerbeak"] = "칼부리"
VL["Darkshade, Saber Matriarch"] = "우두머리 살쾡이 어둠그늘"
--[[Translation missing --]]
--[[ VL["Dead Orc Captain"] = "Dead Orc Captain"--]] 
VL["Devouring Darkness"] = "엄습하는 어둠"
VL["Dorg"] = "돌그"
VL["Dreadbog"] = "공포수렁"
VL["Dread-Rider Cortis"] = "공포기수 코르티스"
VL["Echo of Murmur"] = "울림의 메아리"
VL["Egyl the Enduring"] = "인내하는 자 에길"
VL["Elfbane"] = "엘프 학살자"
VL["Elindya Featherlight"] = "엘린디아 페더라이트"
VL["Embaari Defense Crystal"] = "엠바리 방어 수정"
VL["Enavra Varandi"] = "에나브라 바란디"
VL["Faebright"] = "오색날개"
VL["Fathnyr"] = "파스니르"
VL["Fel Saberon Shaman"] = "지옥 서슬니 주술사"
VL["Fenri"] = "펜리"
VL["Flog the Captain-Eater"] = "선장잡이 플로그"
VL["Flotsam"] = "바다떠돌이"
VL["Foreling Worship Circle"] = "포어링 숭배의 원"
VL["Forsaken Deathsquad"] = "포세이큰 죽음 분대"
VL["Frenzied Animus"] = "광포한 원령"
VL["Frostshard"] = "서리조각"
VL["Galzomar"] = "갈조마르"
VL["Garvrulg"] = "가르브룰그"
VL["Gennadian"] = "제나디안"
VL["Giant Python"] = "거대 비단뱀"
VL["Giant Raptor"] = "거대 랩터"
VL["Giantstalker Hunting Party"] = "거인추적자 사냥대"
VL["Giblette the Cowardly"] = "겁쟁이 지블렛"
VL["Glimar Ironfist"] = "길마르 아이언피스트"
VL["Gom Crabbar"] = "대게 고움"
VL["Gorebeak"] = "피부리"
VL["Gorger the Hungry"] = "굶주린 먹보"
VL["Gorgroth"] = "고르그로스"
VL["Grelda the Hag"] = "노파 그렐다"
VL["Grrvrgull the Conquerer"] = "정복자 그릃븛굴"
VL["Guardian Thor'el"] = "수호자 토르엘"
VL["Gurbog da Basher"] = "망치주먹 구르보그"
VL["Haakun, The All-Consuming"] = "걸신들린 하쿤"
VL["Hannval the Butcher"] = "도살자 한느발"
VL["Har'kess the Insatiable"] = "만족할 줄 모르는 하르케스"
VL["Hartli the Snatcher"] = "날치기 하틀리"
VL["Haunted Manor"] = "귀신 들린 장원"
VL["Helmouth Raiders"] = "지옥어귀 약탈자"
VL["Hertha Grimdottir"] = "헤르타 그림도티르"
VL["Hook & Sinker"] = "후크와 싱커"
VL["Horn of the Siren"] = "세이렌의 뿔피리"
VL["Houndmaster Ely"] = "사냥개조련사 엘리"
VL["Houndmaster Jax'zor"] = "사냥개조련사 작스조르"
VL["Houndmaster Stroxis"] = "사냥개조련사 스트록시스"
VL["Huk'roth the Houndmaster"] = "전문사냥꾼 헉로스"
--[[Translation missing --]]
--[[ VL["IH Elite Sniper"] = "IH Elite Sniper"--]] 
VL["Inquisitor Ernstenbok"] = "심문관 에른스텐보크"
VL["Inquisitor Tivos"] = "심문관 티보스"
VL["Inquisitor Volitix"] = "심문관 볼리틱스"
--[[Translation missing --]]
--[[ VL["Invasion Point: Devastation"] = "Invasion Point: Devastation"--]] 
--[[Translation missing --]]
--[[ VL["Iron Front Captain 1"] = "Iron Front Captain 1"--]] 
--[[Translation missing --]]
--[[ VL["Iron Front Captain 2"] = "Iron Front Captain 2"--]] 
--[[Translation missing --]]
--[[ VL["Iron Front Captain 3"] = "Iron Front Captain 3"--]] 
VL["Iron Houndmaster"] = "강철 사냥개조련사"
--[[Translation missing --]]
--[[ VL["Iron Tunnel Foreman"] = "Iron Tunnel Foreman"--]] 
VL["Ironbranch"] = "무쇠가지"
VL["Isel the Hammer"] = "망치 이셀"
VL["Ivory Sentinel"] = "상아 파수꾼"
VL["Jade Darkhaven"] = "제이드 다크헤이븐"
VL["Jaluk the Pacifist"] = "평화주의자 잘루크"
VL["Jetsam"] = "바다 부랑자"
VL["Kenos the Unraveller"] = "해결자 케노스"
VL["Kethrazor"] = "케스라조르"
VL["Kharazos the Triumphant"] = "승리의 카라조스"
VL["Klikixx"] = "클리킥스"
VL["Kottr Vondyr"] = "코트르 본디르"
VL["Krahl Deathwind"] = "크랄 데스윈드"
VL["Lady Rivantas"] = "여군주 리반타스"
VL["Lava-Gorged Goren"] = "용암충만 고렌"
VL["Leaf-Reader Kurri"] = "나뭇잎예언자 쿠리"
VL["Lieutenant Strathmar"] = "사령관 스트라스마르"
VL["Light the Braziers"] = "화로에 불 붙이기"
VL["Llorian"] = "로리안"
VL["Lost Ettin"] = "길 잃은 거인"
VL["Luggut the Eggeater"] = "알먹보 루굿"
VL["Lyrath Moonfeather"] = "리라스 문페더"
VL["Mad \"King\" Sporeon"] = "미친 \"왕\" 스포리온"
VL["Magister Phaedris"] = "마법학자 패드리스"
VL["Maia the White"] = "순백의 마이아"
VL["Majestic Elderhorn"] = "위풍당당한 늙은뿔 순록"
VL["Mal'Dreth the Corrupter"] = "타락자 말드레스"
--[[Translation missing --]]
--[[ VL["Mandrakor the Night Hunter"] = "Mandrakor the Night Hunter"--]] 
VL["Marius & Tehd"] = "마리우스와 테드"
VL["Mar'tura"] = "마르투라"
VL["Matron Hagatha"] = "대모 하가사"
VL["Mellok, Son of Torok"] = "토로크의 아들 멜로크"
VL["Miasu"] = "미아수"
VL["Mordvigbjorn"] = "모르드빅비오른"
VL["Mother Om'ra"] = "대모 옴라"
VL["Mrrgrl the Tide Reaver"] = "파도를 가르는 자 아옳옳옳"
--[[Translation missing --]]
--[[ VL["Murktide Alpha"] = "Murktide Alpha"--]] 
VL["Myonix"] = "묘닉스"
VL["Nas Dunberlin"] = "나스 던블린"
VL["Night Haunter"] = "밤의 유령"
VL["Noble Blademaster"] = "고귀한 검귀"
VL["No'losh"] = "노로쉬"
VL["Normantis the Deposed"] = "퇴위된 노르만티스"
VL["Oasis Icemother"] = "오아시스 얼음어미"
VL["Ogre Primalist"] = "오우거 원시술사"
VL["Old Bear Trap"] = "오래된 곰 덫"
VL["Oreth the Vile"] = "흉측한 오레스"
VL["Oubdob da Smasher"] = "곤봉꾼 아웁돕"
--[[Translation missing --]]
--[[ VL["Pale Assassin"] = "Pale Assassin"--]] 
VL["Pale Gone Fishin'"] = "낚시를 떠난 창백한 오크"
VL["Pale Spider Broodmother"] = "창백한 거미 무리어미"
--[[Translation missing --]]
--[[ VL["Panther Saberon Boss"] = "Panther Saberon Boss"--]] 
VL["Perrexx the Corruptor"] = "타락자 페렉스"
VL["Pinchshank"] = "검을들고덤비게"
VL["Pit-Slayer"] = "구덩이 학살자"
VL["Pridelord Meowl"] = "무리군주 야옹부엉"
VL["Protectors of the Grove"] = "숲의 수호병"
VL["Purging the River"] = "강 정화하기"
--[[Translation missing --]]
--[[ VL["Quin'el, Master of Chillwind"] = "Quin'el, Master of Chillwind"--]] 
VL["Ragemaw"] = "분노아귀"
VL["Randril"] = "란드릴"
VL["Rauren"] = "로우렌"
--[[Translation missing --]]
--[[ VL["Ravager Broodlord"] = "Ravager Broodlord"--]] 
VL["Ravyn-Drath"] = "라빈드라스"
VL["Reef Lord Raj'his"] = "산호초 군주 라즈히스"
VL["Remnant of the Blood Moon"] = "핏빛 달의 잔재"
VL["Rogond"] = "로곤드"
VL["Rok'nash"] = "로크나쉬"
VL["Roteye"] = "썩은눈"
--[[Translation missing --]]
--[[ VL["Saberon Blademaster"] = "Saberon Blademaster"--]] 
--[[Translation missing --]]
--[[ VL["Saberon Shaman"] = "Saberon Shaman"--]] 
--[[Translation missing --]]
--[[ VL["Sapper Vorick"] = "Sapper Vorick"--]] 
VL["Scout Harefoot"] = "정찰병 헤어풋"
VL["Sea Giant King"] = "바다 거인 왕"
--[[Translation missing --]]
--[[ VL["Sea Hydra"] = "Sea Hydra"--]] 
VL["Sea King Tidross"] = "바다왕 티드로스"
VL["Sea Lord Torglork"] = "바다 군주 토르글록"
VL["Seek & Destroy Squad"] = "탐지 및 폭파 분대"
--[[Translation missing --]]
--[[ VL["Seemingly Unguarded Treasure"] = "Seemingly Unguarded Treasure"--]] 
VL["Seersei"] = "시어세이"
VL["Sekhan"] = "세칸"
--[[Translation missing --]]
--[[ VL["Selia, Master of Balefire"] = "Selia, Master of Balefire"--]] 
--[[Translation missing --]]
--[[ VL["Shadowflame Terror"] = "Shadowflame Terror"--]] 
VL["Shadowmoon Cultist Ritual"] = "어둠달 이교도 의식"
VL["Shadowquill"] = "그림자깃"
VL["Shal'an"] = "샬안"
VL["Shaman Fire Stone"] = "주술사 화염석"
VL["Shara Felbreath"] = "샤라 펠브레스"
VL["Shinri"] = "신리"
VL["Shivering Ashmaw Cub"] = "벌벌 떠는 잿빛아귀 새끼"
VL["Siegemaster Aedrin"] = "공성전문가 에이드린"
VL["Sikthiss, Maiden of Slaughter"] = "학살의 여제 시크티스"
VL["Skagg"] = "스카그"
VL["Skog"] = "스코그"
VL["Skywhisker Taskmaster"] = "하늘수염 작업반장"
VL["Slogtusk"] = "회색엄니"
--[[Translation missing --]]
--[[ VL["Slumbering Bear"] = "Slumbering Bear"--]] 
VL["Soulfang"] = "영혼송곳니"
--[[Translation missing --]]
--[[ VL["Soulgrinder Portal"] = "Soulgrinder Portal"--]] 
VL["Soulthirster"] = "영혼곯이"
VL["Starbuck"] = "별사슴"
--[[Translation missing --]]
--[[ VL["Stingtail Nest"] = "Stingtail Nest"--]] 
VL["Stomper Kreego"] = "천둥발 크리고"
VL["Stoneshard Broodmother"] = "바위파편 무리어미"
VL["Stormwing Matriarch"] = "폭풍날개 어미"
VL["Syphonus & Leodrath"] = "시포누스와 레오드라스"
VL["Szirek"] = "스지레크"
VL["Tarben"] = "타르벤"
VL["Thane's Mead Hall"] = "영주의 봉밀주 전당"
VL["The Beastly Boxer"] = "잔인한 권투가"
--[[Translation missing --]]
--[[ VL["The Blightcaller"] = "The Blightcaller"--]] 
--[[Translation missing --]]
--[[ VL["The Brood Queen's Court: Count Nefarious"] = "The Brood Queen's Court: Count Nefarious"--]] 
--[[Translation missing --]]
--[[ VL["The Brood Queen's Court: General Volroth"] = "The Brood Queen's Court: General Volroth"--]] 
--[[Translation missing --]]
--[[ VL["The Brood Queen's Court: King Voras"] = "The Brood Queen's Court: King Voras"--]] 
--[[Translation missing --]]
--[[ VL["The Brood Queen's Court: Overseer Brutarg"] = "The Brood Queen's Court: Overseer Brutarg"--]] 
VL["The Exiled Shaman"] = "추방당한 주술사"
VL["The Muscle"] = "근육덩어리"
VL["The Nameless King"] = "이름 없는 왕"
VL["The Oracle"] = "예언자"
VL["The Voidseer"] = "공허현자"
VL["Theryssia"] = "테리시아"
VL["Thondrax"] = "쏜드락스"
VL["Tide Behemoth"] = "모래젓개"
VL["Tideclaw"] = "파도집게"
VL["Torrentius"] = "토렌티우스"
VL["Totally Safe Treasure Chest"] = "전적으로 안전한 보물 상자"
VL["Trecherous Stallions"] = "배은망덕한 백마"
VL["Unbound Rift"] = "해방된 균열"
VL["Undgrell Attack"] = "운드그렐 공격"
--[[Translation missing --]]
--[[ VL["Unguarded Thistleleaf Treasure"] = "Unguarded Thistleleaf Treasure"--]] 
VL["Urgev the Flayer"] = "약탈자 우르게브"
VL["Valiyaka the Stormbringer"] = "폭풍인도자 발리야카"
VL["Venomshade (Plant Hydra)"] = "맹독그늘 (식물 히드라)"
VL["Vicious Whale Shark"] = "흉포한 고래상어"
VL["Vorthax"] = "보르탁스"
VL["Wakkawam"] = "와카왐"
VL["Wandering Vindicator - Looted Treasure"] = "떠도는 구원자 - 보물 획득"
VL["Whitewater Typhoon"] = "하얀물 태풍"
VL["Worg Pack"] = "늑대 무리"
VL["Worgen Stalkers"] = "늑대인간 추적자"
VL["Wraithtalon"] = "망령발톱"
VL["Wrath-Lord Lekos"] = "격노군주 레코스"
VL["Xothear, The Destroyer"] = "파괴자 조티어"
VL["Yggdrel"] = "이그드렐"
VL["Zoug"] = "조우그"
VL["Zulk"] = "줄크"

