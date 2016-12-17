local AddOnFolderName, private = ...
local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "deDE")
if not L then return end

L["%1$s (%2$d) is already on the user-defined NPC list."] = "%1$s (%2$d) ist bereits auf der benutzerdefinierten NSC-Liste."
L["%1$s (%2$d) is not on the user-defined NPC list."] = "%1$s (%2$d) ist nicht auf der benutzerdefinierten NSC-Liste."
L["Added %1$s (%2$d) to the user-defined NPC list."] = "(%2$d) wurde zur benutzerdefinierten NSC-Liste hinzugefügt."
L["Alerts"] = "Alarme"
L["BOTTOM"] = "Unten"
L["BOTTOMLEFT"] = "Unten links"
L["BOTTOMRIGHT"] = "Unten rechts"
L["CENTER"] = "Mittig"
L["Completed Achievement Criteria"] = "Abgeschlossene Erfolgskriterien"
L["Completed Quest Objectives"] = "Abgeschlossene Questziele"
L["Detection"] = "Erkennung"
L["Drag to set the spawn point for targeting buttons."] = "Hier erscheinen die Anvisierungsschaltflächen (verschiebbar)."
L["Duration"] = "Dauer"
L["Hide Anchor"] = "Anker ausblenden"
L["Hide During Combat"] = "Ausblenden während des Kampfes"
L["Horizontal offset from the anchor point."] = "Horizontaler Versatz vom Ankerpunkt."
L["Ignore Mute"] = "Ignoriere Stummschaltung"
L["Interval"] = "Intervall"
L["LEFT"] = "Links"
L["NPCs"] = "NSCs"
L["Play alert sounds when sound is muted."] = "Abspiel-Alarm ertönt, wenn der Ton stummgeschaltet ist."
L["Predefined NPCs cannot be added to or removed from the user-defined NPC list."] = "Vorgegebene NSCs können nicht der benutzerdefinierten NSC-Liste hinzugefügt oder von ihr entfernt werden."
L["Removed %1$s (%2$d) from the user-defined NPC list."] = "(%2$d) wurde von der benutzerdefinierten NSC-Liste entfernt."
L["Reset Position"] = "Position zurücksetzen"
L["RIGHT"] = "Rechts"
L["Screen Flash"] = "Bildschirmaufleuchten"
L["Screen Location"] = "Bildschirmposition"
L["Show Anchor"] = "Anker zeigen"
L["Spawn Point"] = "Erscheinungspunkt"
L["The number of minutes a targeting button will exist before fading out."] = "Die Anzahl der Minuten, sie geben an, wie lange eine Anvisierungsschaltfläche existiert, bevor sie ausgeblendet wird."
L["The number of minutes before an NPC will be detected again."] = "Die Anzahl der Minuten, sie geben an, ab wann ein NSC erneut erkannt wird."
L["TOP"] = "Oben"
L["TOPLEFT"] = "Oben links"
L["TOPRIGHT"] = "Oben rechts"
L["Type the name of a Continent, Dungeon, or Zone, or the partial name of an NPC. Accepts Lua patterns."] = "Gib den Namen eines Kontinents, Dungeons, Zone, oder einen Teil eines NSC-Namens ein. Akzeptiert auch Lua-Muster."
L["Valid values are a numeric NPC ID, the word \"mouseover\" while you have your mouse cursor over an NPC, or the word \"target\" while you have an NPC set as your target."] = "Gültige Werte sind eine NSC-ID, das Wort \"mouseover\", während dein Mauszeiger sich über einem NSC befindet, oder das Wort \"target\", während du einen NSC im Ziel hast."
L["Vertical offset from the anchor point."] = "Vertikaler Versatz vom Ankerpunkt."
L["X Offset"] = "X-Versatz"
L["Y Offset"] = "Y-Versatz"

local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "deDE")
if not VL then return end

VL["Aarkos - Looted Treasure"] = "Aarkos Familienschatz"
VL["Abandoned Fishing Pole"] = "Liegen gelassene Angelrute"
VL["Alpha Bat"] = "Alpha Fledermaus"
VL["Amateur Hunters"] = "Freizeitjäger"
VL["Ambassador D'vwinn"] = "Botschafter D'vwinn"
VL["Anax"] = "Anax"
VL["Anchorite's Sojourn"] = "Aufenthalt des Einsiedlers"
VL["Antydas Nightcaller's Hideaway"] = "Antydas Nachtrufers Versteck"
VL["Apothecary Faldren"] = "Apotheker Faldren"
VL["Arcanist Lylandre"] = "Arkanistin Lylandre"
VL["Arcanist Shal'iman"] = "Arkanist Shal'iman"
VL["Artificer Lothaire"] = "Konstrukteur Lothaire"
VL["Avatar of Sothrecar"] = "Avatar von Socrethar"
VL["Bahagar"] = "Bahagar"
VL["Ba'ruun"] = "Ba'ruun"
VL["Beacher"] = "Sandros"
VL["Beastmaster Pao'lek"] = "Bestienmeister Pao'lek"
VL["BH Master Scout"] = "BH Meisterspäher"
VL["Bilebrain"] = "Gallhirn"
VL["Bladesquall"] = "Klingenbö"
VL["Bodash the Hoarder"] = "Bodash der Hamsterer"
VL["Brawlgoth"] = "Raufgoth"
VL["Bristlemaul"] = "Borstenschlund"
VL["Brogrul the Mighty"] = "Brogrul der Mächtige"
VL["Broodmother Lizax"] = "Brutmutter Lizax"
VL["Cache of Infernals"] = "Höllenbestienvorrat"
VL["Cadraeus"] = "Cadraeus"
VL["Cailyn Paledoom"] = "Cailyn Bleichbann"
VL["Captain Volo'ren"] = "Hauptmann Volo'ren"
VL["Captured Survivor"] = "Gefangener Überlebender"
VL["Cave Keeper"] = "Höhlenhüter"
VL["Champion Chomper"] = "Meistermümmler"
VL["Charfeather"] = "Kohlfeder"
VL["Chief Bitterbrine"] = "Häuptling Bittergischt"
VL["Cindral"] = "Cindral"
VL["Coldstomp"] = "Froststampf der Trauernde"
VL["Commander Soraax"] = "Kommandant Soraax"
VL["Cora'kar"] = "Cora'kar"
VL["Coura, Master of Arcana"] = "Coura, Meisterin des Arkanen"
VL["Crab Rider Grmlrml"] = "Grmlrml der Krabbenreiter"
VL["Crawshuk the Hungry"] = "Krähenschropf der Hungrige"
VL["Crystalbeard"] = "Kristallbart"
VL["Daggerbeak"] = "Dolchschnabel"
VL["Darkshade, Saber Matriarch"] = "Grauschatten, Säblermatriarchin"
VL["Dead Orc Captain"] = "Kapitän Eisenbart (Die wahre Geißel der Eisernen See)"
VL["Devouring Darkness"] = "Verschlingende Finsternis"
VL["Dorg"] = "Dorg (Gastwirt)"
VL["Dreadbog"] = "Terrormoor"
VL["Dread-Rider Cortis"] = "Schreckensreiter Cortis"
VL["Echo of Murmur"] = "Echo von Murmur"
VL["Egyl the Enduring"] = "Egyl der Ausdauernde"
VL["Elfbane"] = "Elfenbann"
VL["Elindya Featherlight"] = "Elindya Fiederlicht"
VL["Embaari Defense Crystal"] = "Verteidigungskristall von Embaari"
VL["Enavra Varandi"] = "Enavra Varandi"
VL["Faebright"] = "Feenglanz"
VL["Fathnyr"] = "Fathnyr"
VL["Fel Saberon Shaman"] = "Teufels Saberon Schamane"
VL["Fenri"] = "Fenri"
VL["Flog the Captain-Eater"] = "Flog der Kapitänenfresser"
VL["Flotsam"] = "Treibgut"
VL["Foreling Worship Circle"] = "Blattleser Kurri"
VL["Forsaken Deathsquad"] = "Todesschwadron der Verlassenen"
VL["Frenzied Animus"] = "Rasender Animus"
VL["Frostshard"] = "Frostsplitter"
VL["Galzomar"] = "Galzomar"
VL["Garvrulg"] = "Garvrulg"
VL["Gennadian"] = "Gennadian"
VL["Giant Python"] = "Riesen-Python"
VL["Giant Raptor"] = "Riesen-Raptor"
VL["Giantstalker Hunting Party"] = "Riesenpirscher Jagdgesellschaft"
VL["Giblette the Cowardly"] = "Gibblett der Feigling"
VL["Glimar Ironfist"] = "Glimar Eisenfaust"
VL["Gom Crabbar"] = "Gom Krabbar"
VL["Gorebeak"] = "Blutschnabel"
VL["Gorger the Hungry"] = "Schlinger der Hungrige"
VL["Gorgroth"] = "Gorgroth"
VL["Grelda the Hag"] = "Grelda die Hexe"
VL["Grrvrgull the Conquerer"] = "Grrvrgull der Eroberer"
VL["Guardian Thor'el"] = "Wächter Thor'el"
VL["Gurbog da Basher"] = "Gurbog der Klopper"
VL["Haakun, The All-Consuming"] = "Haakun der Allesverschlingende"
VL["Hannval the Butcher"] = "Hannval der Schlächter"
VL["Har'kess the Insatiable"] = "Har'kess der Unersättliche"
VL["Hartli the Snatcher"] = "Hartli die Wegfängerin"
VL["Haunted Manor"] = "Spukhaus"
VL["Helmouth Raiders"] = "Räuber des Höllenschlunds"
VL["Hertha Grimdottir"] = "Hertha Grimmdottir"
VL["Hook & Sinker"] = "Haken & Versenker"
VL["Horn of the Siren"] = "Horn der Sirene"
VL["Houndmaster Ely"] = "Hundemeister Ely"
VL["Houndmaster Jax'zor"] = "Hundemeister Jax'zor"
VL["Houndmaster Stroxis"] = "Hundemeister Stroxis"
VL["Huk'roth the Houndmaster"] = "Huk'roth der Hundemeister"
VL["IH Elite Sniper"] = "Eliteheckenschütze der IH"
VL["Inquisitor Ernstenbok"] = "Inquisitor Ernstenbok"
VL["Inquisitor Tivos"] = "Inquisitor Tivos"
VL["Inquisitor Volitix"] = "Inquisitor Volitix"
VL["Invasion Point: Devastation"] = "Invasionspunkt: Verwüstung"
VL["Iron Front Captain 1"] = "Eiserne Front Kommantant 1"
VL["Iron Front Captain 2"] = [=[Eiserne Front Kommantant 2
]=]
VL["Iron Front Captain 3"] = "Eiserne Front Kommantant 3"
VL["Iron Houndmaster"] = "Eiserner Hundemeisters"
VL["Iron Tunnel Foreman"] = "Eisen Tunnel Vorarbeiter"
VL["Ironbranch"] = "Eisenast"
VL["Isel the Hammer"] = "Isel der Hammer"
VL["Ivory Sentinel"] = "Elfenbeinbehüterin"
VL["Jade Darkhaven"] = "Jade Dunkelhafen"
VL["Jaluk the Pacifist"] = "Jaluk der Pazifist"
VL["Jetsam"] = "Strandgut"
VL["Kenos the Unraveller"] = "Kenos der Zerreißer"
VL["Kethrazor"] = "Kethrazor"
VL["Kharazos the Triumphant"] = "Kharazos der Siegestrunkene"
VL["Klikixx"] = "Klikixx"
VL["Kottr Vondyr"] = "Kottr Vondyr"
VL["Krahl Deathwind"] = "Krahl Todeswind"
VL["Lady Rivantas"] = "Lady Rivantas"
VL["Lava-Gorged Goren"] = "Mit Lava sattgefressener Goren"
VL["Leaf-Reader Kurri"] = "Blattleser Kurri"
VL["Lieutenant Strathmar"] = "Leutnant Strathmar"
VL["Light the Braziers"] = "Entzündet die Kohlenpfannen"
VL["Llorian"] = "Llorian"
VL["Lost Ettin"] = "Verirrter Ettin"
VL["Luggut the Eggeater"] = "Luggut der Eierfresser"
VL["Lyrath Moonfeather"] = "Lyrath Mondfeder"
VL["Mad \"King\" Sporeon"] = "Wahnsinniger \"König\" Sporeon"
VL["Magister Phaedris"] = "Magister Phaedris"
VL["Maia the White"] = "Maia der Weiße"
VL["Majestic Elderhorn"] = "Majestätisches Urhorn"
VL["Mal'Dreth the Corrupter"] = "Mal'Dreth der Verderber"
VL["Mandrakor the Night Hunter"] = "Mandrakor der Nachtjäger"
VL["Marius & Tehd"] = "Marius & Tehd"
VL["Mar'tura"] = "Mar'tura"
VL["Matron Hagatha"] = "Matrone Hagatha"
VL["Mellok, Son of Torok"] = "Mellok, Sohn des Torok"
VL["Miasu"] = "Miasu"
VL["Mordvigbjorn"] = "Mordvigbjorn"
VL["Mother Om'ra"] = "Mutter Om'ra"
VL["Mrrgrl the Tide Reaver"] = "Mrrgrl der Gezeitenhäscher"
VL["Murktide Alpha"] = "Glub'glok"
VL["Myonix"] = "Myonix"
VL["Nas Dunberlin"] = "Nas Dunberlinn"
VL["Night Haunter"] = "Der Nachtschatten"
VL["Noble Blademaster"] = "Adliger Klingenmeister"
VL["No'losh"] = "No'losh"
VL["Normantis the Deposed"] = "Normantis der Entthronte"
VL["Oasis Icemother"] = "Oaseneismutter"
VL["Ogre Primalist"] = "Oger-Primalist"
VL["Old Bear Trap"] = "Alte Bärenfalle"
VL["Oreth the Vile"] = "Oreth der Grässliche"
VL["Oubdob da Smasher"] = "Oubdob der Knaller"
VL["Pale Assassin"] = "Pale Attentäter"
VL["Pale Gone Fishin'"] = "Blasser gegangener Fisch"
VL["Pale Spider Broodmother"] = "Fahlspinnenbrutmutter"
VL["Panther Saberon Boss"] = "Panther Saberon Boss"
VL["Perrexx the Corruptor"] = "Perrexx der Verderber"
VL["Pinchshank"] = "Zwickzange"
VL["Pit-Slayer"] = "Grubenschlächter"
VL["Pridelord Meowl"] = "Rudelführer Miaul"
VL["Protectors of the Grove"] = "Beschützer des Hains"
VL["Purging the River"] = "Den Fluss läutern"
VL["Quin'el, Master of Chillwind"] = "Quin'el, Meisterin des Frostwinds"
VL["Ragemaw"] = "Zornschlund"
VL["Randril"] = "Randril"
VL["Rauren"] = "Rauren"
VL["Ravager Broodlord"] = "Verwüstende Zuchtbrüder"
VL["Ravyn-Drath"] = "Ravyn-Drath"
VL["Reef Lord Raj'his"] = "Rifflord Raj'his"
VL["Remnant of the Blood Moon"] = "Überrest des Blutmonds"
VL["Rogond"] = "Rogond"
VL["Rok'nash"] = "Rok'nash"
VL["Roteye"] = "Faulauge"
VL["Saberon Blademaster"] = "Saberon Klingenmeister"
VL["Saberon Shaman"] = "Saberon Schamane"
VL["Sapper Vorick"] = "Pionier Vorick"
VL["Scout Harefoot"] = "Pfadfinder Hastfuß"
VL["Sea Giant King"] = "König der Meeresriesen"
VL["Sea Hydra"] = "Meereshydra"
VL["Sea King Tidross"] = "Meereskönig Tidross"
VL["Sea Lord Torglork"] = "Meeresfürst Torglork"
VL["Seek & Destroy Squad"] = "Such- & Zerstörungstrupp"
VL["Seersei"] = "Sehsei"
VL["Sekhan"] = "Sekhan"
VL["Selia, Master of Balefire"] = "Selia, Meisterin des Haderfeuers"
VL["Shadowflame Terror"] = "Schattenflammenschreiter"
VL["Shadowmoon Cultist Ritual"] = "Schattenmondkultistenritual"
VL["Shadowquill"] = "Schattenfeder"
VL["Shal'an"] = "Shal'an"
VL["Shaman Fire Stone"] = "Schamanenfeuerstein"
VL["Shara Felbreath"] = "Shara Teufelshauch"
VL["Shinri"] = "Shinri"
VL["Shivering Ashmaw Cub"] = "Zitterndes Aschenmauljunges"
VL["Siegemaster Aedrin"] = "Belagerungsmeister Aedrin"
VL["Sikthiss, Maiden of Slaughter"] = "Sikthiss die Kriegsfurie"
VL["Skagg"] = "Skagg"
VL["Skog"] = "Skog"
VL["Skywhisker Taskmaster"] = "Zuchtmeister der Himmelsschnauzer"
VL["Slogtusk"] = "Wuchthauer"
VL["Slumbering Bear"] = "Schlummernder Bär"
VL["Soulfang"] = "Seelenfang"
VL["Soulthirster"] = "Seelenlechzer"
VL["Starbuck"] = "Sternbock"
VL["Stomper Kreego"] = "Stampfer Kreego"
VL["Stoneshard Broodmother"] = "Steinsplitter Brutmutter"
VL["Stormwing Matriarch"] = "Matriarchin der Sturmschwingen"
VL["Syphonus & Leodrath"] = "Syphonus & Leodrath"
VL["Szirek"] = "Szirek der Entstellte"
VL["Tarben"] = "Tarben"
VL["Thane's Mead Hall"] = "Methalle des Thans"
VL["The Beastly Boxer"] = "Der Bestienboxer"
VL["The Blightcaller"] = "Die Pestrufer"
VL["The Brood Queen's Court: Count Nefarious"] = "Der Hof der Brutkönigin: Graf Nefarious"
VL["The Brood Queen's Court: General Volroth"] = "Der Hof der Brutkönigin: General Volroth"
VL["The Brood Queen's Court: King Voras"] = "Der Hof der Brutkönigin: König Voras"
VL["The Brood Queen's Court: Overseer Brutarg"] = "Der Hof der Brutkönigin: Aufseher Brutarg"
VL["The Exiled Shaman"] = "Der verbannte Schamane"
VL["The Muscle"] = "Der Muskel"
VL["The Nameless King"] = "Der Namenlose König"
VL["The Oracle"] = "Das Orakel"
VL["The Voidseer"] = "Der Leerenseher"
VL["Theryssia"] = "Theryssia"
VL["Thondrax"] = "Thondrax"
VL["Tide Behemoth"] = "Gezeitenungetüm"
VL["Tideclaw"] = "Gezeitenklaue"
VL["Torrentius"] = "Torrentius"
VL["Totally Safe Treasure Chest"] = "Vollkommen sichere Schatztruhe"
VL["Trecherous Stallions"] = "Verräterische Hengste"
VL["Unbound Rift"] = "Entfesselter Riss"
VL["Undgrell Attack"] = "Untergrellangriff"
VL["Urgev the Flayer"] = "Urgev der Schinder"
VL["Valiyaka the Stormbringer"] = "Valiyaka die Sturmbringerin"
VL["Venomshade (Plant Hydra)"] = "Giftschatten"
VL["Vicious Whale Shark"] = "Boshafter Walhai"
VL["Vorthax"] = "Vorthax"
VL["Wakkawam"] = "Schotenfürst Wakkawumm"
VL["Wandering Vindicator - Looted Treasure"] = "Wandernder Verteidiger - Erbeutet Schatz"
VL["Whitewater Typhoon"] = "Weißwassertaifun"
VL["Worg Pack"] = "Worgrudel"
VL["Worgen Stalkers"] = "Worgenpirscher"
VL["Wraithtalon"] = "Phantomkralle"
VL["Wrath-Lord Lekos"] = "Zornfürst Lekos"
VL["Xothear, The Destroyer"] = "Xothear der Zerstörer"
VL["Yggdrel"] = "Yggdrel"
VL["Zoug"] = "Zoug der Klotz"
VL["Zulk"] = "Blutjäger Zulk"
