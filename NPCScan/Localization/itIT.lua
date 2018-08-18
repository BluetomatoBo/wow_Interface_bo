local AddOnFolderName, private = ...
local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "itIT")
if not L then return end

L["%1$s (%2$d) is already on the user-defined NPC list."] = "%1$s (%2$d) è già nella lista dei PNG personalizzati."
L["%1$s (%2$d) is not on the user-defined NPC list."] = "%1$s (%2$d) non è nella lista dei PNG personalizzati."
L["Added %1$s (%2$d) to the user-defined NPC list."] = "%1$s (%2$d) è stato aggiunto alla lista dei PNG personalizzati."
L["Alerts"] = "Avvisi"
L["BOTTOM"] = "Basso"
L["BOTTOMLEFT"] = "Basso a Sinistra"
L["BOTTOMRIGHT"] = "Basso a Destra"
L["CENTER"] = "Centro"
L["Completed Achievement Criteria"] = "Criterio Imprese Completate"
L["Completed Quest Objectives"] = "Obiettivi Missioni Completate"
L["Dead NPCs"] = "PNG morti"
L["Detection"] = "Rilevamento"
L["Drag to set the spawn point for targeting buttons."] = "Trascina per impostare la posizione dei pulsanti per la selezione."
L["Duration"] = "Durata"
L["Hide Anchor"] = "Nascondi Ancoraggio"
L["Hide During Combat"] = "Nascondi in Combattimento"
L["Horizontal offset from the anchor point."] = "Offset orizzontale dal punto di ancoraggio."
L["Ignore Mute"] = "Ignora Muto"
L["Interval"] = "Intervallo"
L["LEFT"] = "Sinistra"
L["NPCs"] = "PNG"
L["Play alert sounds when sound is muted."] = "Riproduci il suoni di avviso quando i suoni sono mutati."
L["Predefined NPCs cannot be added to or removed from the user-defined NPC list."] = "I PNG predefiniti non possono essere aggiunti o rimossi dalla lista dei PNG personalizzati."
L["Removed %1$s (%2$d) from the user-defined NPC list."] = "Rimosso %1$s (%2$d) dalla lista dei PNG personalizzati."
L["Reset Position"] = "Reimposta Posizione"
L["RIGHT"] = "Destra"
L["Screen Flash"] = "Illumina Schermo"
L["Screen Location"] = "Posizione su Schermo"
L["Show Anchor"] = "Mostra Ancoraggio"
L["Spawn Point"] = "Posizione"
L["The number of minutes a targeting button will exist before fading out."] = "Il numero di minuti per cui persisterà il pulsante di selezione prima di sparire."
L["The number of minutes before an NPC will be detected again."] = "Il numero di minuti necessari prima di un nuovo rilevamento del PNG."
L["TOP"] = "Alto"
L["TOPLEFT"] = "Alto a Sinistra"
L["TOPRIGHT"] = "Alto a Destra"
L["Type the name of a Continent, Dungeon, or Zone, or the partial name of an NPC. Accepts Lua patterns."] = "Scrivi il nome di un Continente, Istanza, Zona o nome parziale di un PNG. Funzionano i pattern LUA."
L["Valid values are a numeric NPC ID, the word \"mouseover\" while you have your mouse cursor over an NPC, or the word \"target\" while you have an NPC set as your target."] = "E' possibile utilizzare il valore numerico \"NPC ID\", la parola \"mouseover\" quando il cursore del mouse si trova sopra un PNG o la parola \"target\" quando hai selezionato un PNG come bersaglio."
L["Vertical offset from the anchor point."] = "Offset verticale dal punto di ancoraggio."
L["X Offset"] = "Offset X"
L["Y Offset"] = "Offset Y"


local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "itIT")
if not VL then return end

-- Vignette
VL["Aarkos - Looted Treasure"] = "Aarkos - Tesoro depredato"
--[[Translation missing --]]
--[[ VL["Abandoned Fishing Pole"] = "Abandoned Fishing Pole"--]] 
--[[Translation missing --]]
--[[ VL["Alpha Bat"] = "Alpha Bat"--]] 
VL["Amateur Hunters"] = "Cacciatori Amatoriali"
VL["Ambassador D'vwinn"] = "Ambasciatore D'vwinn"
VL["Anax"] = "Anax"
--[[Translation missing --]]
--[[ VL["Anchorite's Sojourn"] = "Anchorite's Sojourn"--]] 
VL["Antydas Nightcaller's Hideaway"] = "Nascondiglio di Antydas Invocanotte"
VL["Apothecary Faldren"] = "Speziale Faldren"
VL["Arcanist Lylandre"] = "Arcanista Lylandre"
VL["Arcanist Shal'iman"] = "Arcanista Shal'iman"
VL["Artificer Lothaire"] = "Artigiano Lothaire"
VL["Avatar of Sothrecar"] = "Avatar di Socrethar"
VL["Bahagar"] = "Bahagar"
VL["Ba'ruun"] = "Ba'ruun"
--[[Translation missing --]]
--[[ VL["Battle of the Barnacle"] = "Battle of the Barnacle"--]] 
VL["Beacher"] = "Sabbiafina"
VL["Beastmaster Pao'lek"] = "Maestro delle Bestie Pao'lek"
--[[Translation missing --]]
--[[ VL["BH Master Scout"] = "BH Master Scout"--]] 
VL["Bilebrain"] = "Bavaviscida"
VL["Bladesquall"] = "Ciclonicus"
VL["Bodash the Hoarder"] = "Bodash l'Incettatore"
VL["Brawlgoth"] = "Rissgoth"
VL["Bristlemaul"] = "Mazzirsuta"
VL["Brogrul the Mighty"] = "Brogrul il Possente"
VL["Broodmother Lizax"] = "Madre della Stirpe Lizax"
VL["Cache of Infernals"] = "Cassa degli Infernali"
VL["Cadraeus"] = "Cadraeus"
VL["Cailyn Paledoom"] = "Cailyn Fatocupo"
VL["Captain Volo'ren"] = "Capitano Volo'ren"
--[[Translation missing --]]
--[[ VL["Captured Survivor"] = "Captured Survivor"--]] 
--[[Translation missing --]]
--[[ VL["Cave Keeper"] = "Cave Keeper"--]] 
VL["Champion Chomper"] = "Campione Masticatore"
--[[Translation missing --]]
--[[ VL["Charfeather"] = "Charfeather"--]] 
VL["Chief Bitterbrine"] = "Capo Brinamara"
VL["Cindral"] = "Cindral il Fuocobrado"
VL["Coldstomp"] = "Passofreddo"
VL["Commander Soraax"] = "Comandante Soraax"
VL["Cora'kar"] = "Cora'kar"
VL["Coura, Master of Arcana"] = "Coura, Maestra dell'Arcano"
VL["Crab Rider Grmlrml"] = "Cavalcagranchi Grmlrml"
VL["Crawshuk the Hungry"] = "Crawshuk l'Affamato"
--[[Translation missing --]]
--[[ VL["Crystalbeard"] = "Crystalbeard"--]] 
VL["Daggerbeak"] = "Pungibecco"
VL["Darkshade, Saber Matriarch"] = "Ombranera, Matriarca delle Fiere"
VL["Dead Orc Captain"] = "Capitano Barbaferro"
VL["Devouring Darkness"] = "Oscurità Divorante"
VL["Dorg"] = "Dorg il Sanguinario"
VL["Dreadbog"] = "Malbrago"
--[[Translation missing --]]
--[[ VL["Dread-Rider Cortis"] = "Dread-Rider Cortis"--]] 
VL["Echo of Murmur"] = "Eco di Murmur"
VL["Egyl the Enduring"] = "Egyl il Coriaceo"
VL["Elfbane"] = "Squartaelfi"
VL["Elindya Featherlight"] = "Elindya Pesopiuma"
VL["Embaari Defense Crystal"] = "Cristallo di Difesa di Embaari"
VL["Enavra Varandi"] = "Enavra Varandi"
VL["Faebright"] = "Alafatata"
VL["Fathnyr"] = "Fathnyr"
--[[Translation missing --]]
--[[ VL["Fel Saberon Shaman"] = "Fel Saberon Shaman"--]] 
VL["Fenri"] = "Fenri"
VL["Flog the Captain-Eater"] = "Flog il Mangiacapitani"
--[[Translation missing --]]
--[[ VL["Flotsam"] = "Flotsam"--]] 
--[[Translation missing --]]
--[[ VL["Foreling Worship Circle"] = "Foreling Worship Circle"--]] 
VL["Forsaken Deathsquad"] = "Squadra della Morte di Reietti"
--[[Translation missing --]]
--[[ VL["Frenzied Animus"] = "Frenzied Animus"--]] 
--[[Translation missing --]]
--[[ VL["Frostshard"] = "Frostshard"--]] 
VL["Galzomar"] = "Galzomar"
VL["Garvrulg"] = "Garvrulg"
VL["Gennadian"] = "Gennadian"
--[[Translation missing --]]
--[[ VL["Giant Python"] = "Giant Python"--]] 
--[[Translation missing --]]
--[[ VL["Giant Raptor"] = "Giant Raptor"--]] 
VL["Giantstalker Hunting Party"] = "Gruppo di Caccia Ammazzagiganti"
--[[Translation missing --]]
--[[ VL["Giblette the Cowardly"] = "Giblette the Cowardly"--]] 
VL["Glimar Ironfist"] = "Glimar Pugnoferreo"
--[[Translation missing --]]
--[[ VL["Gom Crabbar"] = "Gom Crabbar"--]] 
--[[Translation missing --]]
--[[ VL["Gorebeak"] = "Gorebeak"--]] 
VL["Gorger the Hungry"] = "Divoratore l'Affamato"
VL["Gorgroth"] = "Gorgroth"
VL["Grelda the Hag"] = "Grelda la Strega"
VL["Grrvrgull the Conquerer"] = "Grrvrgull il Conquistatore"
VL["Guardian Thor'el"] = "Guardiano Thor'el"
VL["Gurbog da Basher"] = "Gurbog il Picchiatore"
VL["Haakun, The All-Consuming"] = "Haakun il Divoramondi"
VL["Hannval the Butcher"] = "Hannval il Macellaio"
VL["Har'kess the Insatiable"] = "Har'kess l'Insaziabile"
VL["Hartli the Snatcher"] = "Hartli la Ladruncola"
VL["Haunted Manor"] = "Maniero Infestato"
--[[Translation missing --]]
--[[ VL["Helmouth Raiders"] = "Helmouth Raiders"--]] 
VL["Hertha Grimdottir"] = "Hertha Grimdottir"
VL["Hook & Sinker"] = "Gancio & Budella"
VL["Horn of the Siren"] = "Corno della Sirena"
VL["Houndmaster Ely"] = "Maestro dei Segugi Ely"
VL["Houndmaster Jax'zor"] = "Maestro dei Segugi Jax'zor"
VL["Houndmaster Stroxis"] = "Maestro dei Segugi Stroxis"
VL["Huk'roth the Houndmaster"] = "Huk'roth il Maestro della Caccia"
--[[Translation missing --]]
--[[ VL["IH Elite Sniper"] = "IH Elite Sniper"--]] 
VL["Inquisitor Ernstenbok"] = "Inquisitore Ernstenbok"
VL["Inquisitor Tivos"] = "Inquisitore Tivos"
VL["Inquisitor Volitix"] = "Inquisitore Volitix"
--[[Translation missing --]]
--[[ VL["Invasion Point: Devastation"] = "Invasion Point: Devastation"--]] 
--[[Translation missing --]]
--[[ VL["Iron Front Captain 1"] = "Iron Front Captain 1"--]] 
--[[Translation missing --]]
--[[ VL["Iron Front Captain 2"] = "Iron Front Captain 2"--]] 
--[[Translation missing --]]
--[[ VL["Iron Front Captain 3"] = "Iron Front Captain 3"--]] 
VL["Iron Houndmaster"] = "Maestro dei Segugi"
--[[Translation missing --]]
--[[ VL["Iron Tunnel Foreman"] = "Iron Tunnel Foreman"--]] 
--[[Translation missing --]]
--[[ VL["Ironbranch"] = "Ironbranch"--]] 
VL["Isel the Hammer"] = "Isel il Martello"
VL["Ivory Sentinel"] = "Sentinella d'Avorio"
VL["Jade Darkhaven"] = "Jade Lidoscuro"
VL["Jaluk the Pacifist"] = "Jaluk il Pacifista"
VL["Jetsam"] = "Rodichiglie"
VL["Kenos the Unraveller"] = "Kenos il Dipanatore"
VL["Kethrazor"] = "Kethrazor"
VL["Kharazos the Triumphant"] = "Kharazos il Trionfante"
VL["Klikixx"] = "Klikixx"
VL["Kottr Vondyr"] = "Kottr Vondyr"
VL["Krahl Deathwind"] = "Krahl Occhiotetro"
VL["Lady Rivantas"] = "Dama Rivantas"
VL["Lava-Gorged Goren"] = "Goren Magmatico"
--[[Translation missing --]]
--[[ VL["Leaf-Reader Kurri"] = "Leaf-Reader Kurri"--]] 
VL["Lieutenant Strathmar"] = "Tenente Strathmar"
--[[Translation missing --]]
--[[ VL["Light the Braziers"] = "Light the Braziers"--]] 
--[[Translation missing --]]
--[[ VL["Llorian"] = "Llorian"--]] 
VL["Lost Ettin"] = "Ettin Perduto"
VL["Luggut the Eggeater"] = "Luggut il Mangiauova"
VL["Lyrath Moonfeather"] = "Lyrath Lunapiuma"
VL["Mad \"King\" Sporeon"] = "Sporeon il \"Re\" Folle"
VL["Magister Phaedris"] = "Magistro Phaedris"
VL["Maia the White"] = "Maia la Bianca"
--[[Translation missing --]]
--[[ VL["Majestic Elderhorn"] = "Majestic Elderhorn"--]] 
VL["Mal'Dreth the Corrupter"] = "Mal'dreth il Corruttore"
VL["Mandrakor the Night Hunter"] = "Mandrakor il Cacciatore della Notte"
VL["Marius & Tehd"] = "Marius e Tehd"
VL["Mar'tura"] = "Mar'tura"
VL["Matron Hagatha"] = "Matrona Hagatha"
VL["Mellok, Son of Torok"] = "Mellok, Figlio di Torok"
VL["Miasu"] = "Miasu"
VL["Mordvigbjorn"] = "Mordvigbjorn"
VL["Mother Om'ra"] = "Madre Om'ra"
VL["Mrrgrl the Tide Reaver"] = "Mrrgrl il Razziatore delle Maree"
--[[Translation missing --]]
--[[ VL["Murktide Alpha"] = "Murktide Alpha"--]] 
VL["Myonix"] = "Myonix"
VL["Naroua, King of the Forest"] = "Naroua, Re della Foresta"
VL["Nas Dunberlin"] = "Nas Dunberlin"
VL["Night Haunter"] = "Infestatore della Notte"
--[[Translation missing --]]
--[[ VL["Noble Blademaster"] = "Noble Blademaster"--]] 
VL["No'losh"] = "No'losh"
VL["Normantis the Deposed"] = "Normantis il Deposto"
VL["Oasis Icemother"] = "Madre del Gelo dell'Oasi"
VL["Ogre Primalist"] = "Primalista Ogre"
VL["Old Bear Trap"] = "Vecchia Trappola per Orsi"
VL["Oreth the Vile"] = "Oreth il Vile"
--[[Translation missing --]]
--[[ VL["Oubdob da Smasher"] = "Oubdob da Smasher"--]] 
--[[Translation missing --]]
--[[ VL["Pale Assassin"] = "Pale Assassin"--]] 
VL["Pale Gone Fishin'"] = "Pescatore Pallido"
--[[Translation missing --]]
--[[ VL["Pale Spider Broodmother"] = "Pale Spider Broodmother"--]] 
--[[Translation missing --]]
--[[ VL["Panther Saberon Boss"] = "Panther Saberon Boss"--]] 
VL["Perrexx the Corruptor"] = "Perrexx il Corruttore"
VL["Pinchshank"] = "Serrapinze"
--[[Translation missing --]]
--[[ VL["Pit-Slayer"] = "Pit-Slayer"--]] 
VL["Pridelord Meowl"] = "Signore del Branco Meowl"
--[[Translation missing --]]
--[[ VL["Protectors of the Grove"] = "Protectors of the Grove"--]] 
VL["Purging the River"] = "Purificare il Fiume"
VL["Quin'el, Master of Chillwind"] = "Quin'el, Maestra dei Ghiacci"
VL["Ragemaw"] = "Faucirabbiose"
VL["Randril"] = "Randril"
VL["Rauren"] = "Rauren"
--[[Translation missing --]]
--[[ VL["Ravager Broodlord"] = "Ravager Broodlord"--]] 
VL["Ravyn-Drath"] = "Ravyn-Drath"
--[[Translation missing --]]
--[[ VL["Really Skunky Beer"] = "Really Skunky Beer"--]] 
VL["Reef Lord Raj'his"] = "Signore dei Coralli Raj'his"
VL["Remnant of the Blood Moon"] = "Resti della Luna di Sangue"
VL["Rogond"] = "Rogond il Braccatore"
VL["Rok'nash"] = "Rok'nash"
VL["Roteye"] = "Occhiomarcio"
--[[Translation missing --]]
--[[ VL["Saberon Blademaster"] = "Saberon Blademaster"--]] 
--[[Translation missing --]]
--[[ VL["Saberon Shaman"] = "Saberon Shaman"--]] 
--[[Translation missing --]]
--[[ VL["Sapper Vorick"] = "Sapper Vorick"--]] 
VL["Scout Harefoot"] = "Esploratore Piede Lesto"
--[[Translation missing --]]
--[[ VL["Sea Giant King"] = "Sea Giant King"--]] 
--[[Translation missing --]]
--[[ VL["Sea Hydra"] = "Sea Hydra"--]] 
VL["Sea King Tidross"] = "Re del Mare Tidross"
VL["Sea Lord Torglork"] = "Signore dei Mari Torglork"
VL["Seek & Destroy Squad"] = "Squadra Trova e Distruggi"
--[[Translation missing --]]
--[[ VL["Seemingly Unguarded Treasure"] = "Seemingly Unguarded Treasure"--]] 
VL["Seersei"] = "Seersei"
VL["Sekhan"] = "Sekhan"
VL["Selia, Master of Balefire"] = "Selia, Maestra della Pira"
--[[Translation missing --]]
--[[ VL["Shadowflame Terror"] = "Shadowflame Terror"--]] 
--[[Translation missing --]]
--[[ VL["Shadowmoon Cultist Ritual"] = "Shadowmoon Cultist Ritual"--]] 
VL["Shadowquill"] = "Piumanotte"
VL["Shal'an"] = "Shal'an"
--[[Translation missing --]]
--[[ VL["Shaman Fire Stone"] = "Shaman Fire Stone"--]] 
VL["Shara Felbreath"] = "Shara Fiato Vile"
VL["Shinri"] = "Shinri"
--[[Translation missing --]]
--[[ VL["Shivering Ashmaw Cub"] = "Shivering Ashmaw Cub"--]] 
VL["Siegemaster Aedrin"] = "Maestro d'Assedio Aedrin"
VL["Sikthiss, Maiden of Slaughter"] = "Sikthiss la Dama del Massacro"
--[[Translation missing --]]
--[[ VL["Skagg"] = "Skagg"--]] 
--[[Translation missing --]]
--[[ VL["Skog"] = "Skog"--]] 
VL["Skywhisker Taskmaster"] = "Coordinatore dei Baffoceleste"
--[[Translation missing --]]
--[[ VL["Slogtusk"] = "Slogtusk"--]] 
--[[Translation missing --]]
--[[ VL["Slumbering Bear"] = "Slumbering Bear"--]] 
--[[Translation missing --]]
--[[ VL["Soulfang"] = "Soulfang"--]] 
--[[Translation missing --]]
--[[ VL["Soulgrinder Portal"] = "Soulgrinder Portal"--]] 
VL["Soulthirster"] = "Logoranime"
--[[Translation missing --]]
--[[ VL["Starbuck"] = "Starbuck"--]] 
--[[Translation missing --]]
--[[ VL["Stingtail Nest"] = "Stingtail Nest"--]] 
--[[Translation missing --]]
--[[ VL["Stomper Kreego"] = "Stomper Kreego"--]] 
--[[Translation missing --]]
--[[ VL["Stoneshard Broodmother"] = "Stoneshard Broodmother"--]] 
VL["Stormwing Matriarch"] = "Matriarca Alatempestosa"
--[[Translation missing --]]
--[[ VL["Syphonus & Leodrath"] = "Syphonus & Leodrath"--]] 
VL["Szirek"] = "Szirek il Contorto"
VL["Tarben"] = "Tarben"
VL["Thane's Mead Hall"] = "Sala dell'Idromele di Thane"
VL["The Beastly Boxer"] = "Pugile Bestiale"
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
VL["The Exiled Shaman"] = "Sciamano Esiliato"
--[[Translation missing --]]
--[[ VL["The Muscle"] = "The Muscle"--]] 
VL["The Nameless King"] = "Il Re Innominato"
VL["The Oracle"] = "Oracolo"
--[[Translation missing --]]
--[[ VL["The Voidseer"] = "The Voidseer"--]] 
VL["Theryssia"] = "Theryssia"
VL["Thondrax"] = "Thondrax"
VL["Tide Behemoth"] = "Behemoth delle Maree"
VL["Tideclaw"] = "Sfregiamaree"
VL["Torrentius"] = "Torrentius"
VL["Totally Safe Treasure Chest"] = "Cassa del Tesoro Totalmente Sicura"
VL["Trecherous Stallions"] = "Stalloni Pericolosi"
VL["Unbound Rift"] = "Faglia Svincolata"
--[[Translation missing --]]
--[[ VL["Undgrell Attack"] = "Undgrell Attack"--]] 
--[[Translation missing --]]
--[[ VL["Unguarded Thistleleaf Treasure"] = "Unguarded Thistleleaf Treasure"--]] 
VL["Urgev the Flayer"] = "Urgev lo Scuoiatore"
VL["Valiyaka the Stormbringer"] = "Valiyaka l'Araldo della Tempesta"
--[[Translation missing --]]
--[[ VL["Venomshade (Plant Hydra)"] = "Venomshade (Plant Hydra)"--]] 
--[[Translation missing --]]
--[[ VL["Vicious Whale Shark"] = "Vicious Whale Shark"--]] 
VL["Vorthax"] = "Vorthax"
VL["Wakkawam"] = "Signore delle Spore Wakkawam"
--[[Translation missing --]]
--[[ VL["Wandering Vindicator - Looted Treasure"] = "Wandering Vindicator - Looted Treasure"--]] 
VL["Whitewater Typhoon"] = "Tifone Acquebianche"
VL["Worg Pack"] = "Branco di Worg"
VL["Worgen Stalkers"] = "Inseguitori Worgen"
VL["Wraithtalon"] = "Spettrartiglio"
VL["Wrath-Lord Lekos"] = "Signore dell'Ira Lekos"
VL["Xothear, The Destroyer"] = "Xothear il Distruttore"
VL["Yggdrel"] = "Yggdrel"
VL["Zoug"] = "Zoug il Pesante"
VL["Zulk"] = "Cacciatore del Sangue Zulk"

