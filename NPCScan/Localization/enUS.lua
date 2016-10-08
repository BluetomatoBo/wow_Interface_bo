local AddOnFolderName, private = ...

local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "enUS", true, false)
if not L then return end

L["%1$s (%2$d) is already on the user-defined NPC list."] = true
L["%1$s (%2$d) is not on the user-defined NPC list."] = true
L["Added %1$s (%2$d) to the user-defined NPC list."] = true
L["Alerts"] = true
L["BOTTOM"] = "Bottom"
L["BOTTOMLEFT"] = "Bottom Left"
L["BOTTOMRIGHT"] = "Bottom Right"
L["CENTER"] = "Center"
L["Completed Achievement Criteria"] = true
L["Completed Quest Objectives"] = true
L["Detection"] = true
L["Drag to set the spawn point for targeting buttons."] = true
L["Duration"] = true
L["Hide Anchor"] = true
L["Hide During Combat"] = true
L["Horizontal offset from the anchor point."] = true
L["Ignore Mute"] = true
L["Interval"] = true
L["LEFT"] = "Left"
L["NPCs"] = true
L["Play alert sounds when sound is muted."] = true
L["Predefined NPCs cannot be added to or removed from the user-defined NPC list."] = true
L["Removed %1$s (%2$d) from the user-defined NPC list."] = true
L["Reset Position"] = true
L["RIGHT"] = "Right"
L["Screen Flash"] = true
L["Screen Location"] = true
L["Show Anchor"] = true
L["Spawn Point"] = true
L["The number of minutes a targeting button will exist before fading out."] = true
L["The number of minutes before an NPC will be detected again."] = true
L["TOP"] = "Top"
L["TOPLEFT"] = "Top Left"
L["TOPRIGHT"] = "Top Right"
L["Type the name of a Continent, Dungeon, or Zone, or the partial name of an NPC. Accepts Lua patterns."] = true
L["Valid values are a numeric NPC ID, the word \"mouseover\" while you have your mouse cursor over an NPC, or the word \"target\" while you have an NPC set as your target."] = true
L["Vertical offset from the anchor point."] = true
L["X Offset"] = true
L["Y Offset"] = true
L["Vignette/Aarkos - Looted Treasure"] = "Aarkos - Looted Treasure"
L["Vignette/Abandoned Fishing Pole"] = "Abandoned Fishing Pole"
L["Vignette/Alpha Bat"] = "Alpha Bat"
L["Vignette/Amateur Hunters"] = "Amateur Hunters"
L["Vignette/Ambassador D'vwinn"] = "Ambassador D'vwinn"
L["Vignette/Anax"] = "Anax"
L["Vignette/Anchorite's Sojourn"] = "Anchorite's Sojourn"
L["Vignette/Antydas Nightcaller's Hideaway"] = "Antydas Nightcaller's Hideaway"
L["Vignette/Apothecary Faldren"] = "Apothecary Faldren"
L["Vignette/Arcanist Lylandre"] = "Arcanist Lylandre"
L["Vignette/Arcanist Shal'iman"] = "Arcanist Shal'iman"
L["Vignette/Artificer Lothaire"] = "Artificer Lothaire"
L["Vignette/Avatar of Sothrecar"] = "Avatar of Sothrecar"
L["Vignette/Bahagar"] = "Bahagar"
L["Vignette/Ba'ruun"] = "Ba'ruun"
L["Vignette/Beacher"] = "Beacher"
L["Vignette/Beastmaster Pao'lek"] = "Beastmaster Pao'lek"
L["Vignette/BH Master Scout"] = "BH Master Scout"
L["Vignette/Bilebrain"] = "Bilebrain"
L["Vignette/Bladesquall"] = "Bladesquall"
L["Vignette/Bodash the Hoarder"] = "Bodash the Hoarder"
L["Vignette/Brawlgoth"] = "Brawlgoth"
L["Vignette/Bristlemaul"] = "Bristlemaul"
L["Vignette/Brogrul the Mighty"] = "Brogrul the Mighty"
L["Vignette/Broodmother Lizax"] = "Broodmother Lizax"
L["Vignette/Cache of Infernals"] = "Cache of Infernals"
L["Vignette/Cadraeus"] = "Cadraeus"
L["Vignette/Cailyn Paledoom"] = "Cailyn Paledoom"
L["Vignette/Captain Volo'ren"] = "Captain Volo'ren"
L["Vignette/Captured Survivor"] = "Captured Survivor"
L["Vignette/Cave Keeper"] = "Cave Keeper"
L["Vignette/Champion Chomper"] = "Champion Chomper"
L["Vignette/Charfeather"] = "Charfeather"
L["Vignette/Chief Bitterbrine"] = "Chief Bitterbrine"
L["Vignette/Cindral"] = "Cindral"
L["Vignette/Coldstomp"] = "Coldstomp"
L["Vignette/Commander Soraax"] = "Commander Soraax"
L["Vignette/Cora'kar"] = "Cora'kar"
L["Vignette/Coura, Master of Arcana"] = "Coura, Master of Arcana"
L["Vignette/Crab Rider Grmlrml"] = "Crab Rider Grmlrml"
L["Vignette/Crawshuk the Hungry"] = "Crawshuk the Hungry"
L["Vignette/Crystalbeard"] = "Crystalbeard"
L["Vignette/Daggerbeak"] = "Daggerbeak"
L["Vignette/Darkshade, Saber Matriarch"] = "Darkshade, Saber Matriarch"
L["Vignette/Dead Orc Captain"] = "Dead Orc Captain"
L["Vignette/Devouring Darkness"] = "Devouring Darkness"
L["Vignette/Dorg"] = "Dorg"
L["Vignette/Dreadbog"] = "Dreadbog"
L["Vignette/Dread-Rider Cortis"] = "Dread-Rider Cortis"
L["Vignette/Echo of Murmur"] = "Echo of Murmur"
L["Vignette/Egyl the Enduring"] = "Egyl the Enduring"
L["Vignette/Elfbane"] = "Elfbane"
L["Vignette/Elindya Featherlight"] = "Elindya Featherlight"
L["Vignette/Embaari Defense Crystal"] = "Embaari Defense Crystal"
L["Vignette/Enavra Varandi"] = "Enavra Varandi"
L["Vignette/Faebright"] = "Faebright"
L["Vignette/Fathnyr"] = "Fathnyr"
L["Vignette/Fel Saberon Shaman"] = "Fel Saberon Shaman"
L["Vignette/Fenri"] = "Fenri"
L["Vignette/Flog the Captain-Eater"] = "Flog the Captain-Eater"
L["Vignette/Flotsam"] = "Flotsam"
L["Vignette/Foreling Worship Circle"] = "Foreling Worship Circle"
L["Vignette/Forsaken Deathsquad"] = "Forsaken Deathsquad"
L["Vignette/Frenzied Animus"] = "Frenzied Animus"
L["Vignette/Frostshard"] = "Frostshard"
L["Vignette/Galzomar"] = "Galzomar"
L["Vignette/Garvrulg"] = "Garvrulg"
L["Vignette/Gennadian"] = "Gennadian"
L["Vignette/Giant Python"] = "Giant Python"
L["Vignette/Giant Raptor"] = "Giant Raptor"
L["Vignette/Giantstalker Hunting Party"] = "Giantstalker Hunting Party"
L["Vignette/Giblette the Cowardly"] = "Giblette the Cowardly"
L["Vignette/Glimar Ironfist"] = "Glimar Ironfist"
L["Vignette/Gom Crabbar"] = "Gom Crabbar"
L["Vignette/Gorebeak"] = "Gorebeak"
L["Vignette/Gorger the Hungry"] = "Gorger the Hungry"
L["Vignette/Gorgroth"] = "Gorgroth"
L["Vignette/Grelda the Hag"] = "Grelda the Hag"
L["Vignette/Grrvrgull the Conquerer"] = "Grrvrgull the Conquerer"
L["Vignette/Guardian Thor'el"] = "Guardian Thor'el"
L["Vignette/Gurbog da Basher"] = "Gurbog da Basher"
L["Vignette/Haakun, The All-Consuming"] = "Haakun, The All-Consuming"
L["Vignette/Hannval the Butcher"] = "Hannval the Butcher"
L["Vignette/Har'kess the Insatiable"] = "Har'kess the Insatiable"
L["Vignette/Hartli the Snatcher"] = "Hartli the Snatcher"
L["Vignette/Haunted Manor"] = "Haunted Manor"
L["Vignette/Helmouth Raiders"] = "Helmouth Raiders"
L["Vignette/Hertha Grimdottir"] = "Hertha Grimdottir"
L["Vignette/Hook & Sinker"] = "Hook & Sinker"
L["Vignette/Horn of the Siren"] = "Horn of the Siren"
L["Vignette/Houndmaster Ely"] = "Houndmaster Ely"
L["Vignette/Houndmaster Jax'zor"] = "Houndmaster Jax'zor"
L["Vignette/Houndmaster Stroxis"] = "Houndmaster Stroxis"
L["Vignette/Huk'roth the Houndmaster"] = "Huk'roth the Houndmaster"
L["Vignette/IH Elite Sniper"] = "IH Elite Sniper"
L["Vignette/Inquisitor Ernstenbok"] = "Inquisitor Ernstenbok"
L["Vignette/Inquisitor Tivos"] = "Inquisitor Tivos"
L["Vignette/Inquisitor Volitix"] = "Inquisitor Volitix"
L["Vignette/Invasion Point: Devastation"] = "Invasion Point: Devastation"
L["Vignette/Ironbranch"] = "Ironbranch"
L["Vignette/Iron Front Captain 1"] = "Iron Front Captain 1"
L["Vignette/Iron Front Captain 2"] = "Iron Front Captain 2"
L["Vignette/Iron Front Captain 3"] = "Iron Front Captain 3"
L["Vignette/Iron Houndmaster"] = "Iron Houndmaster"
L["Vignette/Iron Tunnel Foreman"] = "Iron Tunnel Foreman"
L["Vignette/Isel the Hammer"] = "Isel the Hammer"
L["Vignette/Ivory Sentinel"] = "Ivory Sentinel"
L["Vignette/Jade Darkhaven"] = "Jade Darkhaven"
L["Vignette/Jaluk the Pacifist"] = "Jaluk the Pacifist"
L["Vignette/Jetsam"] = "Jetsam"
L["Vignette/Kenos the Unraveller"] = "Kenos the Unraveller"
L["Vignette/Kethrazor"] = "Kethrazor"
L["Vignette/Kharazos the Triumphant"] = "Kharazos the Triumphant"
L["Vignette/Klikixx"] = "Klikixx"
L["Vignette/Kottr Vondyr"] = "Kottr Vondyr"
L["Vignette/Krahl Deathwind"] = "Krahl Deathwind"
L["Vignette/Lady Rivantas"] = "Lady Rivantas"
L["Vignette/Lava-Gorged Goren"] = "Lava-Gorged Goren"
L["Vignette/Leaf-Reader Kurri"] = "Leaf-Reader Kurri"
L["Vignette/Lieutenant Strathmar"] = "Lieutenant Strathmar"
L["Vignette/Light the Braziers"] = "Light the Braziers"
L["Vignette/Llorian"] = "Llorian"
L["Vignette/Lost Ettin"] = "Lost Ettin"
L["Vignette/Luggut the Eggeater"] = "Luggut the Eggeater"
L["Vignette/Lyrath Moonfeather"] = "Lyrath Moonfeather"
L["Vignette/Mad \"King\" Sporeon"] = "Mad \"King\" Sporeon"
L["Vignette/Magister Phaedris"] = "Magister Phaedris"
L["Vignette/Maia the White"] = "Maia the White"
L["Vignette/Majestic Elderhorn"] = "Majestic Elderhorn"
L["Vignette/Mal'Dreth the Corrupter"] = "Mal'Dreth the Corrupter"
L["Vignette/Mandrakor the Night Hunter"] = "Mandrakor the Night Hunter"
L["Vignette/Marius & Tehd"] = "Marius & Tehd"
L["Vignette/Mar'tura"] = "Mar'tura"
L["Vignette/Matron Hagatha"] = "Matron Hagatha"
L["Vignette/Mellok, Son of Torok"] = "Mellok, Son of Torok"
L["Vignette/Miasu"] = "Miasu"
L["Vignette/Mordvigbjorn"] = "Mordvigbjorn"
L["Vignette/Mother Om'ra"] = "Mother Om'ra"
L["Vignette/Mrrgrl the Tide Reaver"] = "Mrrgrl the Tide Reaver"
L["Vignette/Murktide Alpha"] = "Murktide Alpha"
L["Vignette/Myonix"] = "Myonix"
L["Vignette/Nas Dunberlin"] = "Nas Dunberlin"
L["Vignette/Night Haunter"] = "Night Haunter"
L["Vignette/Noble Blademaster"] = "Noble Blademaster"
L["Vignette/No'losh"] = "No'losh"
L["Vignette/Normantis the Deposed"] = "Normantis the Deposed"
L["Vignette/Oasis Icemother"] = "Oasis Icemother"
L["Vignette/Ogre Primalist"] = "Ogre Primalist"
L["Vignette/Old Bear Trap"] = "Old Bear Trap"
L["Vignette/Oreth the Vile"] = "Oreth the Vile"
L["Vignette/Oubdob da Smasher"] = "Oubdob da Smasher"
L["Vignette/Pale Assassin"] = "Pale Assassin"
L["Vignette/Pale Gone Fishin'"] = "Pale Gone Fishin'"
L["Vignette/Pale Spider Broodmother"] = "Pale Spider Broodmother"
L["Vignette/Panther Saberon Boss"] = "Panther Saberon Boss"
L["Vignette/Perrexx the Corruptor"] = "Perrexx the Corruptor"
L["Vignette/Pinchshank"] = "Pinchshank"
L["Vignette/Pit-Slayer"] = "Pit-Slayer"
L["Vignette/Pridelord Meowl"] = "Pridelord Meowl"
L["Vignette/Protectors of the Grove"] = "Protectors of the Grove"
L["Vignette/Purging the River"] = "Purging the River"
L["Vignette/Quin'el, Master of Chillwind"] = "Quin'el, Master of Chillwind"
L["Vignette/Ragemaw"] = "Ragemaw"
L["Vignette/Randril"] = "Randril"
L["Vignette/Rauren"] = "Rauren"
L["Vignette/Ravager Broodlord"] = "Ravager Broodlord"
L["Vignette/Ravyn-Drath"] = "Ravyn-Drath"
L["Vignette/Reef Lord Raj'his"] = "Reef Lord Raj'his"
L["Vignette/Remnant of the Blood Moon"] = "Remnant of the Blood Moon"
L["Vignette/Rogond"] = "Rogond"
L["Vignette/Rok'nash"] = "Rok'nash"
L["Vignette/Roteye"] = "Roteye"
L["Vignette/Saberon Blademaster"] = "Saberon Blademaster"
L["Vignette/Saberon Shaman"] = "Saberon Shaman"
L["Vignette/Sapper Vorick"] = "Sapper Vorick"
L["Vignette/Scout Harefoot"] = "Scout Harefoot"
L["Vignette/Sea Giant King"] = "Sea Giant King"
L["Vignette/Sea Hydra"] = "Sea Hydra"
L["Vignette/Sea King Tidross"] = "Sea King Tidross"
L["Vignette/Sea Lord Torglork"] = "Sea Lord Torglork"
L["Vignette/Seek & Destroy Squad"] = "Seek & Destroy Squad"
L["Vignette/Seersei"] = "Seersei"
L["Vignette/Sekhan"] = "Sekhan"
L["Vignette/Selia, Master of Balefire"] = "Selia, Master of Balefire"
L["Vignette/Shadowflame Terror"] = "Shadowflame Terror"
L["Vignette/Shadowmoon Cultist Ritual"] = "Shadowmoon Cultist Ritual"
L["Vignette/Shadowquill"] = "Shadowquill"
L["Vignette/Shal'an"] = "Shal'an"
L["Vignette/Shaman Fire Stone"] = "Shaman Fire Stone"
L["Vignette/Shara Felbreath"] = "Shara Felbreath"
L["Vignette/Shinri"] = "Shinri"
L["Vignette/Shivering Ashmaw Cub"] = "Shivering Ashmaw Cub"
L["Vignette/Siegemaster Aedrin"] = "Siegemaster Aedrin"
L["Vignette/Sikthiss, Maiden of Slaughter"] = "Sikthiss, Maiden of Slaughter"
L["Vignette/Skagg"] = "Skagg"
L["Vignette/Skog"] = "Skog"
L["Vignette/Skywhisker Taskmaster"] = "Skywhisker Taskmaster"
L["Vignette/Slogtusk"] = "Slogtusk"
L["Vignette/Slumbering Bear"] = "Slumbering Bear"
L["Vignette/Soulfang"] = "Soulfang"
L["Vignette/Soulthirster"] = "Soulthirster"
L["Vignette/Starbuck"] = "Starbuck"
L["Vignette/Stomper Kreego"] = "Stomper Kreego"
L["Vignette/Stoneshard Broodmother"] = "Stoneshard Broodmother"
L["Vignette/Stormwing Matriarch"] = "Stormwing Matriarch"
L["Vignette/Syphonus & Leodrath"] = "Syphonus & Leodrath"
L["Vignette/Szirek"] = "Szirek"
L["Vignette/Tarben"] = "Tarben"
L["Vignette/Thane's Mead Hall"] = "Thane's Mead Hall"
L["Vignette/The Beastly Boxer"] = "The Beastly Boxer"
L["Vignette/The Blightcaller"] = "The Blightcaller"
L["Vignette/The Brood Queen's Court: Count Nefarious"] = "The Brood Queen's Court: Count Nefarious"
L["Vignette/The Brood Queen's Court: General Volroth"] = "The Brood Queen's Court: General Volroth"
L["Vignette/The Brood Queen's Court: King Voras"] = "The Brood Queen's Court: King Voras"
L["Vignette/The Brood Queen's Court: Overseer Brutarg"] = "The Brood Queen's Court: Overseer Brutarg"
L["Vignette/The Exiled Shaman"] = "The Exiled Shaman"
L["Vignette/The Muscle"] = "The Muscle"
L["Vignette/The Nameless King"] = "The Nameless King"
L["Vignette/The Oracle"] = "The Oracle"
L["Vignette/Theryssia"] = "Theryssia"
L["Vignette/The Voidseer"] = "The Voidseer"
L["Vignette/Thondrax"] = "Thondrax"
L["Vignette/Tide Behemoth"] = "Tide Behemoth"
L["Vignette/Tideclaw"] = "Tideclaw"
L["Vignette/Torrentius"] = "Torrentius"
L["Vignette/Totally Safe Treasure Chest"] = "Totally Safe Treasure Chest"
L["Vignette/Trecherous Stallions"] = "Trecherous Stallions"
L["Vignette/Unbound Rift"] = "Unbound Rift"
L["Vignette/Undgrell Attack"] = "Undgrell Attack"
L["Vignette/Urgev the Flayer"] = "Urgev the Flayer"
L["Vignette/Valiyaka the Stormbringer"] = "Valiyaka the Stormbringer"
L["Vignette/Venomshade (Plant Hydra)"] = "Venomshade (Plant Hydra)"
L["Vignette/Vicious Whale Shark"] = "Vicious Whale Shark"
L["Vignette/Vorthax"] = "Vorthax"
L["Vignette/Wakkawam"] = "Wakkawam"
L["Vignette/Wandering Vindicator - Looted Treasure"] = "Wandering Vindicator - Looted Treasure"
L["Vignette/Whitewater Typhoon"] = "Whitewater Typhoon"
L["Vignette/Worgen Stalkers"] = "Worgen Stalkers"
L["Vignette/Worg Pack"] = "Worg Pack"
L["Vignette/Wraithtalon"] = "Wraithtalon"
L["Vignette/Wrath-Lord Lekos"] = "Wrath-Lord Lekos"
L["Vignette/Xothear, The Destroyer"] = "Xothear, The Destroyer"
L["Vignette/Yggdrel"] = "Yggdrel"
L["Vignette/Zoug"] = "Zoug"
L["Vignette/Zulk"] = "Zulk"


local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "enUS", true, false)
if not VL then return end

VL["Aarkos - Looted Treasure"] = true
VL["Abandoned Fishing Pole"] = true
VL["Alpha Bat"] = true
VL["Amateur Hunters"] = true
VL["Ambassador D'vwinn"] = true
VL["Anax"] = true
VL["Anchorite's Sojourn"] = true
VL["Antydas Nightcaller's Hideaway"] = true
VL["Apothecary Faldren"] = true
VL["Arcanist Lylandre"] = true
VL["Arcanist Shal'iman"] = true
VL["Artificer Lothaire"] = true
VL["Avatar of Sothrecar"] = true
VL["Bahagar"] = true
VL["Ba'ruun"] = true
VL["Beacher"] = true
VL["Beastmaster Pao'lek"] = true
VL["BH Master Scout"] = true
VL["Bilebrain"] = true
VL["Bladesquall"] = true
VL["Bodash the Hoarder"] = true
VL["Brawlgoth"] = true
VL["Bristlemaul"] = true
VL["Brogrul the Mighty"] = true
VL["Broodmother Lizax"] = true
VL["Cache of Infernals"] = true
VL["Cadraeus"] = true
VL["Cailyn Paledoom"] = true
VL["Captain Volo'ren"] = true
VL["Captured Survivor"] = true
VL["Cave Keeper"] = true
VL["Champion Chomper"] = true
VL["Charfeather"] = true
VL["Chief Bitterbrine"] = true
VL["Cindral"] = true
VL["Coldstomp"] = true
VL["Commander Soraax"] = true
VL["Cora'kar"] = true
VL["Coura, Master of Arcana"] = true
VL["Crab Rider Grmlrml"] = true
VL["Crawshuk the Hungry"] = true
VL["Crystalbeard"] = true
VL["Daggerbeak"] = true
VL["Darkshade, Saber Matriarch"] = true
VL["Dead Orc Captain"] = true
VL["Devouring Darkness"] = true
VL["Dorg"] = true
VL["Dreadbog"] = true
VL["Dread-Rider Cortis"] = true
VL["Echo of Murmur"] = true
VL["Egyl the Enduring"] = true
VL["Elfbane"] = true
VL["Elindya Featherlight"] = true
VL["Embaari Defense Crystal"] = true
VL["Enavra Varandi"] = true
VL["Faebright"] = true
VL["Fathnyr"] = true
VL["Fel Saberon Shaman"] = true
VL["Fenri"] = true
VL["Flog the Captain-Eater"] = true
VL["Flotsam"] = true
VL["Foreling Worship Circle"] = true
VL["Forsaken Deathsquad"] = true
VL["Frenzied Animus"] = true
VL["Frostshard"] = true
VL["Galzomar"] = true
VL["Garvrulg"] = true
VL["Gennadian"] = true
VL["Giant Python"] = true
VL["Giant Raptor"] = true
VL["Giantstalker Hunting Party"] = true
VL["Giblette the Cowardly"] = true
VL["Glimar Ironfist"] = true
VL["Gom Crabbar"] = true
VL["Gorebeak"] = true
VL["Gorger the Hungry"] = true
VL["Gorgroth"] = true
VL["Grelda the Hag"] = true
VL["Grrvrgull the Conquerer"] = true
VL["Guardian Thor'el"] = true
VL["Gurbog da Basher"] = true
VL["Haakun, The All-Consuming"] = true
VL["Hannval the Butcher"] = true
VL["Har'kess the Insatiable"] = true
VL["Hartli the Snatcher"] = true
VL["Haunted Manor"] = true
VL["Helmouth Raiders"] = true
VL["Hertha Grimdottir"] = true
VL["Hook & Sinker"] = true
VL["Horn of the Siren"] = true
VL["Houndmaster Ely"] = true
VL["Houndmaster Jax'zor"] = true
VL["Houndmaster Stroxis"] = true
VL["Huk'roth the Houndmaster"] = true
VL["IH Elite Sniper"] = true
VL["Inquisitor Ernstenbok"] = true
VL["Inquisitor Tivos"] = true
VL["Inquisitor Volitix"] = true
VL["Invasion Point: Devastation"] = true
VL["Ironbranch"] = true
VL["Iron Front Captain 1"] = true
VL["Iron Front Captain 2"] = true
VL["Iron Front Captain 3"] = true
VL["Iron Houndmaster"] = true
VL["Iron Tunnel Foreman"] = true
VL["Isel the Hammer"] = true
VL["Ivory Sentinel"] = true
VL["Jade Darkhaven"] = true
VL["Jaluk the Pacifist"] = true
VL["Jetsam"] = true
VL["Kenos the Unraveller"] = true
VL["Kethrazor"] = true
VL["Kharazos the Triumphant"] = true
VL["Klikixx"] = true
VL["Kottr Vondyr"] = true
VL["Krahl Deathwind"] = true
VL["Lady Rivantas"] = true
VL["Lava-Gorged Goren"] = true
VL["Leaf-Reader Kurri"] = true
VL["Lieutenant Strathmar"] = true
VL["Light the Braziers"] = true
VL["Llorian"] = true
VL["Lost Ettin"] = true
VL["Luggut the Eggeater"] = true
VL["Lyrath Moonfeather"] = true
VL["Mad \"King\" Sporeon"] = true
VL["Magister Phaedris"] = true
VL["Maia the White"] = true
VL["Majestic Elderhorn"] = true
VL["Mal'Dreth the Corrupter"] = true
VL["Mandrakor the Night Hunter"] = true
VL["Marius & Tehd"] = true
VL["Mar'tura"] = true
VL["Matron Hagatha"] = true
VL["Mellok, Son of Torok"] = true
VL["Miasu"] = true
VL["Mordvigbjorn"] = true
VL["Mother Om'ra"] = true
VL["Mrrgrl the Tide Reaver"] = true
VL["Murktide Alpha"] = true
VL["Myonix"] = true
VL["Nas Dunberlin"] = true
VL["Night Haunter"] = true
VL["Noble Blademaster"] = true
VL["No'losh"] = true
VL["Normantis the Deposed"] = true
VL["Oasis Icemother"] = true
VL["Ogre Primalist"] = true
VL["Old Bear Trap"] = true
VL["Oreth the Vile"] = true
VL["Oubdob da Smasher"] = true
VL["Pale Assassin"] = true
VL["Pale Gone Fishin'"] = true
VL["Pale Spider Broodmother"] = true
VL["Panther Saberon Boss"] = true
VL["Perrexx the Corruptor"] = true
VL["Pinchshank"] = true
VL["Pit-Slayer"] = true
VL["Pridelord Meowl"] = true
VL["Protectors of the Grove"] = true
VL["Purging the River"] = true
VL["Quin'el, Master of Chillwind"] = true
VL["Ragemaw"] = true
VL["Randril"] = true
VL["Rauren"] = true
VL["Ravager Broodlord"] = true
VL["Ravyn-Drath"] = true
VL["Reef Lord Raj'his"] = true
VL["Remnant of the Blood Moon"] = true
VL["Rogond"] = true
VL["Rok'nash"] = true
VL["Roteye"] = true
VL["Saberon Blademaster"] = true
VL["Saberon Shaman"] = true
VL["Sapper Vorick"] = true
VL["Scout Harefoot"] = true
VL["Sea Giant King"] = true
VL["Sea Hydra"] = true
VL["Sea King Tidross"] = true
VL["Sea Lord Torglork"] = true
VL["Seek & Destroy Squad"] = true
VL["Seersei"] = true
VL["Sekhan"] = true
VL["Selia, Master of Balefire"] = true
VL["Shadowflame Terror"] = true
VL["Shadowmoon Cultist Ritual"] = true
VL["Shadowquill"] = true
VL["Shal'an"] = true
VL["Shaman Fire Stone"] = true
VL["Shara Felbreath"] = true
VL["Shinri"] = true
VL["Shivering Ashmaw Cub"] = true
VL["Siegemaster Aedrin"] = true
VL["Sikthiss, Maiden of Slaughter"] = true
VL["Skagg"] = true
VL["Skog"] = true
VL["Skywhisker Taskmaster"] = true
VL["Slogtusk"] = true
VL["Slumbering Bear"] = true
VL["Soulfang"] = true
VL["Soulthirster"] = true
VL["Starbuck"] = true
VL["Stomper Kreego"] = true
VL["Stoneshard Broodmother"] = true
VL["Stormwing Matriarch"] = true
VL["Syphonus & Leodrath"] = true
VL["Szirek"] = true
VL["Tarben"] = true
VL["Thane's Mead Hall"] = true
VL["The Beastly Boxer"] = true
VL["The Blightcaller"] = true
VL["The Brood Queen's Court: Count Nefarious"] = true
VL["The Brood Queen's Court: General Volroth"] = true
VL["The Brood Queen's Court: King Voras"] = true
VL["The Brood Queen's Court: Overseer Brutarg"] = true
VL["The Exiled Shaman"] = true
VL["The Muscle"] = true
VL["The Nameless King"] = true
VL["The Oracle"] = true
VL["Theryssia"] = true
VL["The Voidseer"] = true
VL["Thondrax"] = true
VL["Tide Behemoth"] = true
VL["Tideclaw"] = true
VL["Torrentius"] = true
VL["Totally Safe Treasure Chest"] = true
VL["Trecherous Stallions"] = true
VL["Unbound Rift"] = true
VL["Undgrell Attack"] = true
VL["Urgev the Flayer"] = true
VL["Valiyaka the Stormbringer"] = true
VL["Venomshade (Plant Hydra)"] = true
VL["Vicious Whale Shark"] = true
VL["Vorthax"] = true
VL["Wakkawam"] = true
VL["Wandering Vindicator - Looted Treasure"] = true
VL["Whitewater Typhoon"] = true
VL["Worgen Stalkers"] = true
VL["Worg Pack"] = true
VL["Wraithtalon"] = true
VL["Wrath-Lord Lekos"] = true
VL["Xothear, The Destroyer"] = true
VL["Yggdrel"] = true
VL["Zoug"] = true
VL["Zulk"] = true

