local AddOnFolderName, private = ...
local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "zhCN")
if not L then return end

-- L["%1$s (%2$d) is already on the user-defined NPC list."] = "%1$s (%2$d) is already on the user-defined NPC list."
-- L["%1$s (%2$d) is not on the user-defined NPC list."] = "%1$s (%2$d) is not on the user-defined NPC list."
-- L["Added %1$s (%2$d) to the user-defined NPC list."] = "Added %1$s (%2$d) to the user-defined NPC list."
L["Alerts"] = "警报"
L["BOTTOM"] = "底部"
L["BOTTOMLEFT"] = "底部左侧"
L["BOTTOMRIGHT"] = "底部右侧"
L["CENTER"] = "中央"
L["Completed Achievement Criteria"] = "已完成成就分支"
L["Completed Quest Objectives"] = "已完成任务物体"
L["Detection"] = "侦测"
L["Drag to set the spawn point for targeting buttons."] = "拖拽设置目标按钮刷新点"
L["Duration"] = "持续"
L["Hide Anchor"] = "隐藏锚点"
L["Horizontal offset from the anchor point."] = "锚点水平偏移量。"
L["Ignore Mute"] = "忽略静音"
L["Interval"] = "间隔"
L["LEFT"] = "左侧"
-- L["NPCs"] = "NPCs"
L["Play alert sounds when sound is muted."] = "当音效静音时仍播放警报。"
-- L["Predefined NPCs cannot be added to or removed from the user-defined NPC list."] = "Predefined NPCs cannot be added to or removed from the user-defined NPC list."
-- L["Removed %1$s (%2$d) from the user-defined NPC list."] = "Removed %1$s (%2$d) from the user-defined NPC list."
L["Reset Position"] = "重置位置"
L["RIGHT"] = "右侧"
L["Screen Flash"] = "屏幕闪烁"
L["Screen Location"] = "屏幕位置"
L["Show Anchor"] = "显示锚点"
L["Spawn Point"] = "刷新点"
L["The number of minutes a targeting button will exist before fading out."] = "目标按钮将消失的分钟数字。"
L["The number of minutes before an NPC will be detected again."] = "NPC 再次侦测的时间数字。"
L["TOP"] = "顶部"
L["TOPLEFT"] = "顶部左侧"
L["TOPRIGHT"] = "顶部右侧"
-- L["Type the name of a Continent, Dungeon, or Zone, or the partial name of an NPC. Accepts Lua patterns."] = "Type the name of a Continent, Dungeon, or Zone, or the partial name of an NPC. Accepts Lua patterns."
-- L["Valid values are a numeric NPC ID, the word \"mouseover\" while you have your mouse cursor over an NPC, or the word \"target\" while you have an NPC set as your target."] = "Valid values are a numeric NPC ID, the word \"mouseover\" while you have your mouse cursor over an NPC, or the word \"target\" while you have an NPC set as your target."
L["Vertical offset from the anchor point."] = "锚点垂直偏移量。"
L["X Offset"] = "X 偏移量"
L["Y Offset"] = "Y 偏移量"
-- L["Vignette/Aarkos - Looted Treasure"] = "Aarkos - Looted Treasure"
-- L["Vignette/Abandoned Fishing Pole"] = "Abandoned Fishing Pole"
-- L["Vignette/Alpha Bat"] = "Alpha Bat"
-- L["Vignette/Amateur Hunters"] = "Amateur Hunters"
-- L["Vignette/Ambassador D'vwinn"] = "Ambassador D'vwinn"
-- L["Vignette/Anax"] = "Anax"
-- L["Vignette/Anchorite's Sojourn"] = "Anchorite's Sojourn"
-- L["Vignette/Antydas Nightcaller's Hideaway"] = "Antydas Nightcaller's Hideaway"
-- L["Vignette/Apothecary Faldren"] = "Apothecary Faldren"
-- L["Vignette/Arcanist Lylandre"] = "Arcanist Lylandre"
-- L["Vignette/Arcanist Shal'iman"] = "Arcanist Shal'iman"
-- L["Vignette/Artificer Lothaire"] = "Artificer Lothaire"
-- L["Vignette/Avatar of Sothrecar"] = "Avatar of Sothrecar"
-- L["Vignette/Bahagar"] = "Bahagar"
-- L["Vignette/Ba'ruun"] = "Ba'ruun"
-- L["Vignette/Beacher"] = "Beacher"
-- L["Vignette/Beastmaster Pao'lek"] = "Beastmaster Pao'lek"
-- L["Vignette/BH Master Scout"] = "BH Master Scout"
-- L["Vignette/Bilebrain"] = "Bilebrain"
-- L["Vignette/Bladesquall"] = "Bladesquall"
-- L["Vignette/Bodash the Hoarder"] = "Bodash the Hoarder"
-- L["Vignette/Brawlgoth"] = "Brawlgoth"
-- L["Vignette/Bristlemaul"] = "Bristlemaul"
-- L["Vignette/Brogrul the Mighty"] = "Brogrul the Mighty"
-- L["Vignette/Broodmother Lizax"] = "Broodmother Lizax"
-- L["Vignette/Cache of Infernals"] = "Cache of Infernals"
-- L["Vignette/Cadraeus"] = "Cadraeus"
-- L["Vignette/Cailyn Paledoom"] = "Cailyn Paledoom"
-- L["Vignette/Captain Volo'ren"] = "Captain Volo'ren"
-- L["Vignette/Captured Survivor"] = "Captured Survivor"
-- L["Vignette/Cave Keeper"] = "Cave Keeper"
-- L["Vignette/Champion Chomper"] = "Champion Chomper"
-- L["Vignette/Charfeather"] = "Charfeather"
-- L["Vignette/Chief Bitterbrine"] = "Chief Bitterbrine"
-- L["Vignette/Cindral"] = "Cindral"
-- L["Vignette/Coldstomp"] = "Coldstomp"
-- L["Vignette/Commander Soraax"] = "Commander Soraax"
-- L["Vignette/Cora'kar"] = "Cora'kar"
-- L["Vignette/Coura, Master of Arcana"] = "Coura, Master of Arcana"
-- L["Vignette/Crab Rider Grmlrml"] = "Crab Rider Grmlrml"
-- L["Vignette/Crawshuk the Hungry"] = "Crawshuk the Hungry"
-- L["Vignette/Crystalbeard"] = "Crystalbeard"
-- L["Vignette/Daggerbeak"] = "Daggerbeak"
-- L["Vignette/Darkshade, Saber Matriarch"] = "Darkshade, Saber Matriarch"
-- L["Vignette/Dead Orc Captain"] = "Dead Orc Captain"
-- L["Vignette/Devouring Darkness"] = "Devouring Darkness"
-- L["Vignette/Dorg"] = "Dorg"
-- L["Vignette/Dreadbog"] = "Dreadbog"
-- L["Vignette/Dread-Rider Cortis"] = "Dread-Rider Cortis"
-- L["Vignette/Echo of Murmur"] = "Echo of Murmur"
-- L["Vignette/Egyl the Enduring"] = "Egyl the Enduring"
-- L["Vignette/Elfbane"] = "Elfbane"
-- L["Vignette/Elindya Featherlight"] = "Elindya Featherlight"
-- L["Vignette/Embaari Defense Crystal"] = "Embaari Defense Crystal"
-- L["Vignette/Enavra Varandi"] = "Enavra Varandi"
-- L["Vignette/Faebright"] = "Faebright"
-- L["Vignette/Fathnyr"] = "Fathnyr"
-- L["Vignette/Fel Saberon Shaman"] = "Fel Saberon Shaman"
-- L["Vignette/Fenri"] = "Fenri"
-- L["Vignette/Flog the Captain-Eater"] = "Flog the Captain-Eater"
-- L["Vignette/Flotsam"] = "Flotsam"
-- L["Vignette/Foreling Worship Circle"] = "Foreling Worship Circle"
-- L["Vignette/Forsaken Deathsquad"] = "Forsaken Deathsquad"
-- L["Vignette/Frenzied Animus"] = "Frenzied Animus"
-- L["Vignette/Frostshard"] = "Frostshard"
-- L["Vignette/Galzomar"] = "Galzomar"
-- L["Vignette/Garvrulg"] = "Garvrulg"
-- L["Vignette/Gennadian"] = "Gennadian"
-- L["Vignette/Giant Python"] = "Giant Python"
-- L["Vignette/Giant Raptor"] = "Giant Raptor"
-- L["Vignette/Giantstalker Hunting Party"] = "Giantstalker Hunting Party"
-- L["Vignette/Giblette the Cowardly"] = "Giblette the Cowardly"
-- L["Vignette/Glimar Ironfist"] = "Glimar Ironfist"
-- L["Vignette/Gorebeak"] = "Gorebeak"
-- L["Vignette/Gorger the Hungry"] = "Gorger the Hungry"
-- L["Vignette/Gorgroth"] = "Gorgroth"
-- L["Vignette/Grelda the Hag"] = "Grelda the Hag"
-- L["Vignette/Grrvrgull the Conquerer"] = "Grrvrgull the Conquerer"
-- L["Vignette/Guardian Thor'el"] = "Guardian Thor'el"
-- L["Vignette/Gurbog da Basher"] = "Gurbog da Basher"
-- L["Vignette/Haakun, The All-Consuming"] = "Haakun, The All-Consuming"
-- L["Vignette/Hannval the Butcher"] = "Hannval the Butcher"
-- L["Vignette/Har'kess the Insatiable"] = "Har'kess the Insatiable"
-- L["Vignette/Hartli the Snatcher"] = "Hartli the Snatcher"
-- L["Vignette/Haunted Manor"] = "Haunted Manor"
-- L["Vignette/Helmouth Raiders"] = "Helmouth Raiders"
-- L["Vignette/Hertha Grimdottir"] = "Hertha Grimdottir"
-- L["Vignette/Hook & Sinker"] = "Hook & Sinker"
-- L["Vignette/Horn of the Siren"] = "Horn of the Siren"
-- L["Vignette/Houndmaster Ely"] = "Houndmaster Ely"
-- L["Vignette/Houndmaster Jax'zor"] = "Houndmaster Jax'zor"
-- L["Vignette/Houndmaster Stroxis"] = "Houndmaster Stroxis"
-- L["Vignette/Huk'roth the Houndmaster"] = "Huk'roth the Houndmaster"
-- L["Vignette/IH Elite Sniper"] = "IH Elite Sniper"
-- L["Vignette/Inquisitor Ernstenbok"] = "Inquisitor Ernstenbok"
-- L["Vignette/Inquisitor Tivos"] = "Inquisitor Tivos"
-- L["Vignette/Inquisitor Volitix"] = "Inquisitor Volitix"
-- L["Vignette/Invasion Point: Devastation"] = "Invasion Point: Devastation"
-- L["Vignette/Ironbranch"] = "Ironbranch"
-- L["Vignette/Iron Front Captain 1"] = "Iron Front Captain 1"
-- L["Vignette/Iron Front Captain 2"] = "Iron Front Captain 2"
-- L["Vignette/Iron Front Captain 3"] = "Iron Front Captain 3"
-- L["Vignette/Iron Houndmaster"] = "Iron Houndmaster"
-- L["Vignette/Iron Tunnel Foreman"] = "Iron Tunnel Foreman"
-- L["Vignette/Isel the Hammer"] = "Isel the Hammer"
-- L["Vignette/Ivory Sentinel"] = "Ivory Sentinel"
-- L["Vignette/Jade Darkhaven"] = "Jade Darkhaven"
-- L["Vignette/Jaluk the Pacifist"] = "Jaluk the Pacifist"
-- L["Vignette/Jetsam"] = "Jetsam"
-- L["Vignette/Kenos the Unraveller"] = "Kenos the Unraveller"
-- L["Vignette/Kethrazor"] = "Kethrazor"
-- L["Vignette/Kharazos the Triumphant"] = "Kharazos the Triumphant"
-- L["Vignette/Klikixx"] = "Klikixx"
-- L["Vignette/Kottr Vondyr"] = "Kottr Vondyr"
-- L["Vignette/Krahl Deathwind"] = "Krahl Deathwind"
-- L["Vignette/Lady Rivantas"] = "Lady Rivantas"
-- L["Vignette/Lava-Gorged Goren"] = "Lava-Gorged Goren"
-- L["Vignette/Leaf-Reader Kurri"] = "Leaf-Reader Kurri"
-- L["Vignette/Lieutenant Strathmar"] = "Lieutenant Strathmar"
-- L["Vignette/Light the Braziers"] = "Light the Braziers"
-- L["Vignette/Llorian"] = "Llorian"
-- L["Vignette/Lost Ettin"] = "Lost Ettin"
-- L["Vignette/Luggut the Eggeater"] = "Luggut the Eggeater"
-- L["Vignette/Lyrath Moonfeather"] = "Lyrath Moonfeather"
-- L["Vignette/Mad \"King\" Sporeon"] = "Mad \"King\" Sporeon"
-- L["Vignette/Magister Phaedris"] = "Magister Phaedris"
-- L["Vignette/Maia the White"] = "Maia the White"
-- L["Vignette/Majestic Elderhorn"] = "Majestic Elderhorn"
-- L["Vignette/Mal'Dreth the Corrupter"] = "Mal'Dreth the Corrupter"
-- L["Vignette/Mandrakor the Night Hunter"] = "Mandrakor the Night Hunter"
-- L["Vignette/Marius & Tehd"] = "Marius & Tehd"
-- L["Vignette/Mar'tura"] = "Mar'tura"
-- L["Vignette/Matron Hagatha"] = "Matron Hagatha"
-- L["Vignette/Mellok, Son of Torok"] = "Mellok, Son of Torok"
-- L["Vignette/Miasu"] = "Miasu"
-- L["Vignette/Mordvigbjorn"] = "Mordvigbjorn"
-- L["Vignette/Mother Om'ra"] = "Mother Om'ra"
-- L["Vignette/Mrrgrl the Tide Reaver"] = "Mrrgrl the Tide Reaver"
-- L["Vignette/Murktide Alpha"] = "Murktide Alpha"
-- L["Vignette/Myonix"] = "Myonix"
-- L["Vignette/Nas Dunberlin"] = "Nas Dunberlin"
-- L["Vignette/Night Haunter"] = "Night Haunter"
-- L["Vignette/Noble Blademaster"] = "Noble Blademaster"
-- L["Vignette/No'losh"] = "No'losh"
-- L["Vignette/Normantis the Deposed"] = "Normantis the Deposed"
-- L["Vignette/Oasis Icemother"] = "Oasis Icemother"
-- L["Vignette/Ogre Primalist"] = "Ogre Primalist"
-- L["Vignette/Old Bear Trap"] = "Old Bear Trap"
-- L["Vignette/Oreth the Vile"] = "Oreth the Vile"
-- L["Vignette/Oubdob da Smasher"] = "Oubdob da Smasher"
-- L["Vignette/Pale Assassin"] = "Pale Assassin"
-- L["Vignette/Pale Gone Fishin'"] = "Pale Gone Fishin'"
-- L["Vignette/Pale Spider Broodmother"] = "Pale Spider Broodmother"
-- L["Vignette/Panther Saberon Boss"] = "Panther Saberon Boss"
-- L["Vignette/Perrexx the Corruptor"] = "Perrexx the Corruptor"
-- L["Vignette/Pinchshank"] = "Pinchshank"
-- L["Vignette/Pit-Slayer"] = "Pit-Slayer"
-- L["Vignette/Pridelord Meowl"] = "Pridelord Meowl"
-- L["Vignette/Protectors of the Grove"] = "Protectors of the Grove"
-- L["Vignette/Purging the River"] = "Purging the River"
-- L["Vignette/Quin'el, Master of Chillwind"] = "Quin'el, Master of Chillwind"
-- L["Vignette/Ragemaw"] = "Ragemaw"
-- L["Vignette/Randril"] = "Randril"
-- L["Vignette/Rauren"] = "Rauren"
-- L["Vignette/Ravager Broodlord"] = "Ravager Broodlord"
-- L["Vignette/Ravyn-Drath"] = "Ravyn-Drath"
-- L["Vignette/Reef Lord Raj'his"] = "Reef Lord Raj'his"
-- L["Vignette/Remnant of the Blood Moon"] = "Remnant of the Blood Moon"
-- L["Vignette/Rogond"] = "Rogond"
-- L["Vignette/Rok'nash"] = "Rok'nash"
-- L["Vignette/Roteye"] = "Roteye"
-- L["Vignette/Saberon Blademaster"] = "Saberon Blademaster"
-- L["Vignette/Saberon Shaman"] = "Saberon Shaman"
-- L["Vignette/Sapper Vorick"] = "Sapper Vorick"
-- L["Vignette/Scout Harefoot"] = "Scout Harefoot"
-- L["Vignette/Sea Giant King"] = "Sea Giant King"
-- L["Vignette/Sea Hydra"] = "Sea Hydra"
-- L["Vignette/Sea King Tidross"] = "Sea King Tidross"
-- L["Vignette/Sea Lord Torglork"] = "Sea Lord Torglork"
-- L["Vignette/Seek & Destroy Squad"] = "Seek & Destroy Squad"
-- L["Vignette/Seersei"] = "Seersei"
-- L["Vignette/Sekhan"] = "Sekhan"
-- L["Vignette/Selia, Master of Balefire"] = "Selia, Master of Balefire"
-- L["Vignette/Shadowflame Terror"] = "Shadowflame Terror"
-- L["Vignette/Shadowmoon Cultist Ritual"] = "Shadowmoon Cultist Ritual"
-- L["Vignette/Shadowquill"] = "Shadowquill"
-- L["Vignette/Shal'an"] = "Shal'an"
-- L["Vignette/Shaman Fire Stone"] = "Shaman Fire Stone"
-- L["Vignette/Shara Felbreath"] = "Shara Felbreath"
-- L["Vignette/Shinri"] = "Shinri"
-- L["Vignette/Shivering Ashmaw Cub"] = "Shivering Ashmaw Cub"
-- L["Vignette/Siegemaster Aedrin"] = "Siegemaster Aedrin"
-- L["Vignette/Sikthiss, Maiden of Slaughter"] = "Sikthiss, Maiden of Slaughter"
-- L["Vignette/Skagg"] = "Skagg"
-- L["Vignette/Skog"] = "Skog"
-- L["Vignette/Skywhisker Taskmaster"] = "Skywhisker Taskmaster"
-- L["Vignette/Slogtusk"] = "Slogtusk"
-- L["Vignette/Slumbering Bear"] = "Slumbering Bear"
-- L["Vignette/Soulfang"] = "Soulfang"
-- L["Vignette/Soulthirster"] = "Soulthirster"
-- L["Vignette/Starbuck"] = "Starbuck"
-- L["Vignette/Stomper Kreego"] = "Stomper Kreego"
-- L["Vignette/Stoneshard Broodmother"] = "Stoneshard Broodmother"
-- L["Vignette/Stormwing Matriarch"] = "Stormwing Matriarch"
-- L["Vignette/Syphonus & Leodrath"] = "Syphonus & Leodrath"
-- L["Vignette/Szirek"] = "Szirek"
-- L["Vignette/Tarben"] = "Tarben"
-- L["Vignette/Thane's Mead Hall"] = "Thane's Mead Hall"
-- L["Vignette/The Beastly Boxer"] = "The Beastly Boxer"
-- L["Vignette/The Blightcaller"] = "The Blightcaller"
-- L["Vignette/The Brood Queen's Court: Count Nefarious"] = "The Brood Queen's Court: Count Nefarious"
-- L["Vignette/The Brood Queen's Court: General Volroth"] = "The Brood Queen's Court: General Volroth"
-- L["Vignette/The Brood Queen's Court: King Voras"] = "The Brood Queen's Court: King Voras"
-- L["Vignette/The Brood Queen's Court: Overseer Brutarg"] = "The Brood Queen's Court: Overseer Brutarg"
-- L["Vignette/The Exiled Shaman"] = "The Exiled Shaman"
-- L["Vignette/The Muscle"] = "The Muscle"
-- L["Vignette/The Nameless King"] = "The Nameless King"
-- L["Vignette/The Oracle"] = "The Oracle"
-- L["Vignette/Theryssia"] = "Theryssia"
-- L["Vignette/The Voidseer"] = "The Voidseer"
-- L["Vignette/Thondrax"] = "Thondrax"
-- L["Vignette/Tide Behemoth"] = "Tide Behemoth"
-- L["Vignette/Tideclaw"] = "Tideclaw"
-- L["Vignette/Torrentius"] = "Torrentius"
-- L["Vignette/Totally Safe Treasure Chest"] = "Totally Safe Treasure Chest"
-- L["Vignette/Trecherous Stallions"] = "Trecherous Stallions"
-- L["Vignette/Unbound Rift"] = "Unbound Rift"
-- L["Vignette/Undgrell Attack"] = "Undgrell Attack"
-- L["Vignette/Urgev the Flayer"] = "Urgev the Flayer"
-- L["Vignette/Valiyaka the Stormbringer"] = "Valiyaka the Stormbringer"
-- L["Vignette/Venomshade (Plant Hydra)"] = "Venomshade (Plant Hydra)"
-- L["Vignette/Vicious Whale Shark"] = "Vicious Whale Shark"
-- L["Vignette/Vorthax"] = "Vorthax"
-- L["Vignette/Wakkawam"] = "Wakkawam"
-- L["Vignette/Wandering Vindicator - Looted Treasure"] = "Wandering Vindicator - Looted Treasure"
-- L["Vignette/Whitewater Typhoon"] = "Whitewater Typhoon"
-- L["Vignette/Worgen Stalkers"] = "Worgen Stalkers"
-- L["Vignette/Worg Pack"] = "Worg Pack"
-- L["Vignette/Wraithtalon"] = "Wraithtalon"
-- L["Vignette/Wrath-Lord Lekos"] = "Wrath-Lord Lekos"
-- L["Vignette/Xothear, The Destroyer"] = "Xothear, The Destroyer"
-- L["Vignette/Yggdrel"] = "Yggdrel"
-- L["Vignette/Zoug"] = "Zoug"
-- L["Vignette/Zulk"] = "Zulk"


local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "zhCN")
if not VL then return end

-- VL["Aarkos - Looted Treasure"] = "Aarkos - Looted Treasure"
-- VL["Abandoned Fishing Pole"] = "Abandoned Fishing Pole"
-- VL["Alpha Bat"] = "Alpha Bat"
-- VL["Amateur Hunters"] = "Amateur Hunters"
-- VL["Ambassador D'vwinn"] = "Ambassador D'vwinn"
-- VL["Anax"] = "Anax"
-- VL["Anchorite's Sojourn"] = "Anchorite's Sojourn"
-- VL["Antydas Nightcaller's Hideaway"] = "Antydas Nightcaller's Hideaway"
-- VL["Apothecary Faldren"] = "Apothecary Faldren"
-- VL["Arcanist Lylandre"] = "Arcanist Lylandre"
-- VL["Arcanist Shal'iman"] = "Arcanist Shal'iman"
-- VL["Artificer Lothaire"] = "Artificer Lothaire"
-- VL["Avatar of Sothrecar"] = "Avatar of Sothrecar"
-- VL["Bahagar"] = "Bahagar"
-- VL["Ba'ruun"] = "Ba'ruun"
-- VL["Beacher"] = "Beacher"
-- VL["Beastmaster Pao'lek"] = "Beastmaster Pao'lek"
-- VL["BH Master Scout"] = "BH Master Scout"
-- VL["Bilebrain"] = "Bilebrain"
-- VL["Bladesquall"] = "Bladesquall"
-- VL["Bodash the Hoarder"] = "Bodash the Hoarder"
-- VL["Brawlgoth"] = "Brawlgoth"
-- VL["Bristlemaul"] = "Bristlemaul"
-- VL["Brogrul the Mighty"] = "Brogrul the Mighty"
-- VL["Broodmother Lizax"] = "Broodmother Lizax"
-- VL["Cache of Infernals"] = "Cache of Infernals"
-- VL["Cadraeus"] = "Cadraeus"
-- VL["Cailyn Paledoom"] = "Cailyn Paledoom"
-- VL["Captain Volo'ren"] = "Captain Volo'ren"
-- VL["Captured Survivor"] = "Captured Survivor"
-- VL["Cave Keeper"] = "Cave Keeper"
-- VL["Champion Chomper"] = "Champion Chomper"
-- VL["Charfeather"] = "Charfeather"
-- VL["Chief Bitterbrine"] = "Chief Bitterbrine"
-- VL["Cindral"] = "Cindral"
-- VL["Coldstomp"] = "Coldstomp"
-- VL["Commander Soraax"] = "Commander Soraax"
-- VL["Cora'kar"] = "Cora'kar"
-- VL["Coura, Master of Arcana"] = "Coura, Master of Arcana"
-- VL["Crab Rider Grmlrml"] = "Crab Rider Grmlrml"
-- VL["Crawshuk the Hungry"] = "Crawshuk the Hungry"
-- VL["Crystalbeard"] = "Crystalbeard"
-- VL["Daggerbeak"] = "Daggerbeak"
-- VL["Darkshade, Saber Matriarch"] = "Darkshade, Saber Matriarch"
-- VL["Dead Orc Captain"] = "Dead Orc Captain"
-- VL["Devouring Darkness"] = "Devouring Darkness"
-- VL["Dorg"] = "Dorg"
-- VL["Dreadbog"] = "Dreadbog"
-- VL["Dread-Rider Cortis"] = "Dread-Rider Cortis"
-- VL["Echo of Murmur"] = "Echo of Murmur"
-- VL["Egyl the Enduring"] = "Egyl the Enduring"
-- VL["Elfbane"] = "Elfbane"
-- VL["Elindya Featherlight"] = "Elindya Featherlight"
-- VL["Embaari Defense Crystal"] = "Embaari Defense Crystal"
-- VL["Enavra Varandi"] = "Enavra Varandi"
-- VL["Faebright"] = "Faebright"
-- VL["Fathnyr"] = "Fathnyr"
-- VL["Fel Saberon Shaman"] = "Fel Saberon Shaman"
-- VL["Fenri"] = "Fenri"
-- VL["Flog the Captain-Eater"] = "Flog the Captain-Eater"
-- VL["Flotsam"] = "Flotsam"
-- VL["Foreling Worship Circle"] = "Foreling Worship Circle"
-- VL["Forsaken Deathsquad"] = "Forsaken Deathsquad"
-- VL["Frenzied Animus"] = "Frenzied Animus"
-- VL["Frostshard"] = "Frostshard"
-- VL["Galzomar"] = "Galzomar"
-- VL["Garvrulg"] = "Garvrulg"
-- VL["Gennadian"] = "Gennadian"
-- VL["Giant Python"] = "Giant Python"
-- VL["Giant Raptor"] = "Giant Raptor"
-- VL["Giantstalker Hunting Party"] = "Giantstalker Hunting Party"
-- VL["Giblette the Cowardly"] = "Giblette the Cowardly"
-- VL["Glimar Ironfist"] = "Glimar Ironfist"
-- VL["Gorebeak"] = "Gorebeak"
-- VL["Gorger the Hungry"] = "Gorger the Hungry"
-- VL["Gorgroth"] = "Gorgroth"
-- VL["Grelda the Hag"] = "Grelda the Hag"
-- VL["Grrvrgull the Conquerer"] = "Grrvrgull the Conquerer"
-- VL["Guardian Thor'el"] = "Guardian Thor'el"
-- VL["Gurbog da Basher"] = "Gurbog da Basher"
-- VL["Haakun, The All-Consuming"] = "Haakun, The All-Consuming"
-- VL["Hannval the Butcher"] = "Hannval the Butcher"
-- VL["Har'kess the Insatiable"] = "Har'kess the Insatiable"
-- VL["Hartli the Snatcher"] = "Hartli the Snatcher"
-- VL["Haunted Manor"] = "Haunted Manor"
-- VL["Helmouth Raiders"] = "Helmouth Raiders"
-- VL["Hertha Grimdottir"] = "Hertha Grimdottir"
-- VL["Hook & Sinker"] = "Hook & Sinker"
-- VL["Horn of the Siren"] = "Horn of the Siren"
-- VL["Houndmaster Ely"] = "Houndmaster Ely"
-- VL["Houndmaster Jax'zor"] = "Houndmaster Jax'zor"
-- VL["Houndmaster Stroxis"] = "Houndmaster Stroxis"
-- VL["Huk'roth the Houndmaster"] = "Huk'roth the Houndmaster"
-- VL["IH Elite Sniper"] = "IH Elite Sniper"
-- VL["Inquisitor Ernstenbok"] = "Inquisitor Ernstenbok"
-- VL["Inquisitor Tivos"] = "Inquisitor Tivos"
-- VL["Inquisitor Volitix"] = "Inquisitor Volitix"
-- VL["Invasion Point: Devastation"] = "Invasion Point: Devastation"
-- VL["Ironbranch"] = "Ironbranch"
-- VL["Iron Front Captain 1"] = "Iron Front Captain 1"
-- VL["Iron Front Captain 2"] = "Iron Front Captain 2"
-- VL["Iron Front Captain 3"] = "Iron Front Captain 3"
-- VL["Iron Houndmaster"] = "Iron Houndmaster"
-- VL["Iron Tunnel Foreman"] = "Iron Tunnel Foreman"
-- VL["Isel the Hammer"] = "Isel the Hammer"
-- VL["Ivory Sentinel"] = "Ivory Sentinel"
-- VL["Jade Darkhaven"] = "Jade Darkhaven"
-- VL["Jaluk the Pacifist"] = "Jaluk the Pacifist"
-- VL["Jetsam"] = "Jetsam"
-- VL["Kenos the Unraveller"] = "Kenos the Unraveller"
-- VL["Kethrazor"] = "Kethrazor"
-- VL["Kharazos the Triumphant"] = "Kharazos the Triumphant"
-- VL["Klikixx"] = "Klikixx"
-- VL["Kottr Vondyr"] = "Kottr Vondyr"
-- VL["Krahl Deathwind"] = "Krahl Deathwind"
-- VL["Lady Rivantas"] = "Lady Rivantas"
-- VL["Lava-Gorged Goren"] = "Lava-Gorged Goren"
-- VL["Leaf-Reader Kurri"] = "Leaf-Reader Kurri"
-- VL["Lieutenant Strathmar"] = "Lieutenant Strathmar"
-- VL["Light the Braziers"] = "Light the Braziers"
-- VL["Llorian"] = "Llorian"
-- VL["Lost Ettin"] = "Lost Ettin"
-- VL["Luggut the Eggeater"] = "Luggut the Eggeater"
-- VL["Lyrath Moonfeather"] = "Lyrath Moonfeather"
-- VL["Mad \"King\" Sporeon"] = "Mad \"King\" Sporeon"
-- VL["Magister Phaedris"] = "Magister Phaedris"
-- VL["Maia the White"] = "Maia the White"
-- VL["Majestic Elderhorn"] = "Majestic Elderhorn"
-- VL["Mal'Dreth the Corrupter"] = "Mal'Dreth the Corrupter"
-- VL["Mandrakor the Night Hunter"] = "Mandrakor the Night Hunter"
-- VL["Marius & Tehd"] = "Marius & Tehd"
-- VL["Mar'tura"] = "Mar'tura"
-- VL["Matron Hagatha"] = "Matron Hagatha"
-- VL["Mellok, Son of Torok"] = "Mellok, Son of Torok"
-- VL["Miasu"] = "Miasu"
-- VL["Mordvigbjorn"] = "Mordvigbjorn"
-- VL["Mother Om'ra"] = "Mother Om'ra"
-- VL["Mrrgrl the Tide Reaver"] = "Mrrgrl the Tide Reaver"
-- VL["Murktide Alpha"] = "Murktide Alpha"
-- VL["Myonix"] = "Myonix"
-- VL["Nas Dunberlin"] = "Nas Dunberlin"
-- VL["Night Haunter"] = "Night Haunter"
-- VL["Noble Blademaster"] = "Noble Blademaster"
-- VL["No'losh"] = "No'losh"
-- VL["Normantis the Deposed"] = "Normantis the Deposed"
-- VL["Oasis Icemother"] = "Oasis Icemother"
-- VL["Ogre Primalist"] = "Ogre Primalist"
-- VL["Old Bear Trap"] = "Old Bear Trap"
-- VL["Oreth the Vile"] = "Oreth the Vile"
-- VL["Oubdob da Smasher"] = "Oubdob da Smasher"
-- VL["Pale Assassin"] = "Pale Assassin"
-- VL["Pale Gone Fishin'"] = "Pale Gone Fishin'"
-- VL["Pale Spider Broodmother"] = "Pale Spider Broodmother"
-- VL["Panther Saberon Boss"] = "Panther Saberon Boss"
-- VL["Perrexx the Corruptor"] = "Perrexx the Corruptor"
-- VL["Pinchshank"] = "Pinchshank"
-- VL["Pit-Slayer"] = "Pit-Slayer"
-- VL["Pridelord Meowl"] = "Pridelord Meowl"
-- VL["Protectors of the Grove"] = "Protectors of the Grove"
-- VL["Purging the River"] = "Purging the River"
-- VL["Quin'el, Master of Chillwind"] = "Quin'el, Master of Chillwind"
-- VL["Ragemaw"] = "Ragemaw"
-- VL["Randril"] = "Randril"
-- VL["Rauren"] = "Rauren"
-- VL["Ravager Broodlord"] = "Ravager Broodlord"
-- VL["Ravyn-Drath"] = "Ravyn-Drath"
-- VL["Reef Lord Raj'his"] = "Reef Lord Raj'his"
-- VL["Remnant of the Blood Moon"] = "Remnant of the Blood Moon"
-- VL["Rogond"] = "Rogond"
-- VL["Rok'nash"] = "Rok'nash"
-- VL["Roteye"] = "Roteye"
-- VL["Saberon Blademaster"] = "Saberon Blademaster"
-- VL["Saberon Shaman"] = "Saberon Shaman"
-- VL["Sapper Vorick"] = "Sapper Vorick"
-- VL["Scout Harefoot"] = "Scout Harefoot"
-- VL["Sea Giant King"] = "Sea Giant King"
-- VL["Sea Hydra"] = "Sea Hydra"
-- VL["Sea King Tidross"] = "Sea King Tidross"
-- VL["Sea Lord Torglork"] = "Sea Lord Torglork"
-- VL["Seek & Destroy Squad"] = "Seek & Destroy Squad"
-- VL["Seersei"] = "Seersei"
-- VL["Sekhan"] = "Sekhan"
-- VL["Selia, Master of Balefire"] = "Selia, Master of Balefire"
-- VL["Shadowflame Terror"] = "Shadowflame Terror"
-- VL["Shadowmoon Cultist Ritual"] = "Shadowmoon Cultist Ritual"
-- VL["Shadowquill"] = "Shadowquill"
-- VL["Shal'an"] = "Shal'an"
-- VL["Shaman Fire Stone"] = "Shaman Fire Stone"
-- VL["Shara Felbreath"] = "Shara Felbreath"
-- VL["Shinri"] = "Shinri"
-- VL["Shivering Ashmaw Cub"] = "Shivering Ashmaw Cub"
-- VL["Siegemaster Aedrin"] = "Siegemaster Aedrin"
-- VL["Sikthiss, Maiden of Slaughter"] = "Sikthiss, Maiden of Slaughter"
-- VL["Skagg"] = "Skagg"
-- VL["Skog"] = "Skog"
-- VL["Skywhisker Taskmaster"] = "Skywhisker Taskmaster"
-- VL["Slogtusk"] = "Slogtusk"
-- VL["Slumbering Bear"] = "Slumbering Bear"
-- VL["Soulfang"] = "Soulfang"
-- VL["Soulthirster"] = "Soulthirster"
-- VL["Starbuck"] = "Starbuck"
-- VL["Stomper Kreego"] = "Stomper Kreego"
-- VL["Stoneshard Broodmother"] = "Stoneshard Broodmother"
-- VL["Stormwing Matriarch"] = "Stormwing Matriarch"
-- VL["Syphonus & Leodrath"] = "Syphonus & Leodrath"
-- VL["Szirek"] = "Szirek"
-- VL["Tarben"] = "Tarben"
-- VL["Thane's Mead Hall"] = "Thane's Mead Hall"
-- VL["The Beastly Boxer"] = "The Beastly Boxer"
-- VL["The Blightcaller"] = "The Blightcaller"
-- VL["The Brood Queen's Court: Count Nefarious"] = "The Brood Queen's Court: Count Nefarious"
-- VL["The Brood Queen's Court: General Volroth"] = "The Brood Queen's Court: General Volroth"
-- VL["The Brood Queen's Court: King Voras"] = "The Brood Queen's Court: King Voras"
-- VL["The Brood Queen's Court: Overseer Brutarg"] = "The Brood Queen's Court: Overseer Brutarg"
-- VL["The Exiled Shaman"] = "The Exiled Shaman"
-- VL["The Muscle"] = "The Muscle"
-- VL["The Nameless King"] = "The Nameless King"
-- VL["The Oracle"] = "The Oracle"
-- VL["Theryssia"] = "Theryssia"
-- VL["The Voidseer"] = "The Voidseer"
-- VL["Thondrax"] = "Thondrax"
-- VL["Tide Behemoth"] = "Tide Behemoth"
-- VL["Tideclaw"] = "Tideclaw"
-- VL["Torrentius"] = "Torrentius"
-- VL["Totally Safe Treasure Chest"] = "Totally Safe Treasure Chest"
-- VL["Trecherous Stallions"] = "Trecherous Stallions"
-- VL["Unbound Rift"] = "Unbound Rift"
-- VL["Undgrell Attack"] = "Undgrell Attack"
-- VL["Urgev the Flayer"] = "Urgev the Flayer"
-- VL["Valiyaka the Stormbringer"] = "Valiyaka the Stormbringer"
-- VL["Venomshade (Plant Hydra)"] = "Venomshade (Plant Hydra)"
-- VL["Vicious Whale Shark"] = "Vicious Whale Shark"
-- VL["Vorthax"] = "Vorthax"
-- VL["Wakkawam"] = "Wakkawam"
-- VL["Wandering Vindicator - Looted Treasure"] = "Wandering Vindicator - Looted Treasure"
-- VL["Whitewater Typhoon"] = "Whitewater Typhoon"
-- VL["Worgen Stalkers"] = "Worgen Stalkers"
-- VL["Worg Pack"] = "Worg Pack"
-- VL["Wraithtalon"] = "Wraithtalon"
-- VL["Wrath-Lord Lekos"] = "Wrath-Lord Lekos"
-- VL["Xothear, The Destroyer"] = "Xothear, The Destroyer"
-- VL["Yggdrel"] = "Yggdrel"
-- VL["Zoug"] = "Zoug"
-- VL["Zulk"] = "Zulk"

