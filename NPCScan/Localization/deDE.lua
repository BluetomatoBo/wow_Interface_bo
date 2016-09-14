local AddOnFolderName, private = ...
local L = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "deDE")
if not L then return end

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
L["Horizontal offset from the anchor point."] = "Horizontaler Versatz vom Ankerpunkt."
-- L["Ignore Mute"] = "Ignore Mute"
L["Interval"] = "Intervall"
L["LEFT"] = "Links"
L["NPCs"] = "NSCs"
-- L["Play alert sounds when sound is muted."] = "Play alert sounds when sound is muted."
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
L["Vertical offset from the anchor point."] = "Vertikaler Versatz vom Ankerpunkt."
L["X Offset"] = "X-Versatz"
L["Y Offset"] = "Y-Versatz"
-- L["Vignette/Aarkos - Looted Treasure"] = "Aarkos - Looted Treasure"
L["Vignette/Abandoned Fishing Pole"] = "Liegen gelassene Angelrute"
-- L["Vignette/Alpha Bat"] = "Alpha Bat"
L["Vignette/Amateur Hunters"] = "Freizeitjäger"
-- L["Vignette/Anchorite's Sojourn"] = "Anchorite's Sojourn"
-- L["Vignette/Avatar of Sothrecar"] = "Avatar of Sothrecar"
L["Vignette/Beastmaster Pao'lek"] = "Bestienmeister Pao'lek"
-- L["Vignette/BH Master Scout"] = "BH Master Scout"
-- L["Vignette/Blood Moon Boss"] = "Blood Moon Boss"
-- L["Vignette/Burning Front"] = "Burning Front"
L["Vignette/Cache of Infernals"] = "Höllenbestienvorrat"
-- L["Vignette/Cave Keeper"] = "Cave Keeper"
-- L["Vignette/Cindral"] = "Cindral"
-- L["Vignette/Coldstomp"] = "Coldstomp"
L["Vignette/Coura, Master of Arcana"] = "Coura, Meisterin des Arkanen"
-- L["Vignette/Dead Orc Captain"] = "Dead Orc Captain"
-- L["Vignette/Dorg"] = "Dorg"
-- L["Vignette/Embaari Defense Crystal"] = "Embaari Defense Crystal"
-- L["Vignette/Enavra Varandi"] = "Enavra Varandi"
-- L["Vignette/Fel Saberon Shaman"] = "Fel Saberon Shaman"
-- L["Vignette/Foreling Worship Circle"] = "Foreling Worship Circle"
L["Vignette/Forsaken Deathsquad"] = "Todesschwadron der Verlassenen"
L["Vignette/Frenzied Animus"] = "Rasender Animus"
-- L["Vignette/Giant Python"] = "Giant Python"
-- L["Vignette/Giant Raptor"] = "Giant Raptor"
-- L["Vignette/Giantstalker Hunting Party"] = "Giantstalker Hunting Party"
-- L["Vignette/Giblette the Cowardly"] = "Giblette the Cowardly"
-- L["Vignette/Gorger the Hungry"] = "Gorger the Hungry"
-- L["Vignette/Haakun, The All-Consuming"] = "Haakun, The All-Consuming"
L["Vignette/Helmouth Raiders"] = "Räuber des Höllenschlunds"
L["Vignette/Hook & Sinker"] = "Haken & Sinkblei" -- Needs review
L["Vignette/Horn of the Siren"] = "Horn der Sirene"
-- L["Vignette/Houndmaster Jax'zor"] = "Houndmaster Jax'zor"
-- L["Vignette/IH Elite Sniper"] = "IH Elite Sniper"
L["Vignette/Invasion Point: Devastation"] = "Invasionspunkt: Verwüstung"
-- L["Vignette/Iron Front Captain 1"] = "Iron Front Captain 1"
-- L["Vignette/Iron Front Captain 2"] = "Iron Front Captain 2"
-- L["Vignette/Iron Front Captain 3"] = "Iron Front Captain 3"
-- L["Vignette/Iron Houndmaster"] = "Iron Houndmaster"
-- L["Vignette/Iron Tunnel Foreman"] = "Iron Tunnel Foreman"
-- L["Vignette/Kenos the Unraveller"] = "Kenos the Unraveller"
L["Vignette/Krahl Deathwind"] = "Krahl Todeswind"
-- L["Vignette/Lava-Gorged Goren"] = "Lava-Gorged Goren"
L["Vignette/Light the Braziers"] = "Entzündet die Kohlenpfannen"
L["Vignette/Lost Ettin"] = "Verirrter Ettin"
-- L["Vignette/Mandrakor the Night Hunter"] = "Mandrakor the Night Hunter"
-- L["Vignette/Murktide Alpha"] = "Murktide Alpha"
-- L["Vignette/Night Haunter"] = "Night Haunter"
-- L["Vignette/Oasis Icemother"] = "Oasis Icemother"
-- L["Vignette/Ogre Primalist"] = "Ogre Primalist"
-- L["Vignette/Pale Assassin"] = "Pale Assassin"
-- L["Vignette/Pale Gone Fishin'"] = "Pale Gone Fishin'"
-- L["Vignette/Pale Spider Broodmother"] = "Pale Spider Broodmother"
-- L["Vignette/Panther Saberon Boss"] = "Panther Saberon Boss"
L["Vignette/Perrexx the Corruptor"] = "Perrexx der Verderber"
L["Vignette/Pit-Slayer"] = "Grubenschlächter"
L["Vignette/Protectors of the Grove"] = "Beschützer des Hains"
-- L["Vignette/Purging the River"] = "Purging the River"
-- L["Vignette/Ravager Broodlord"] = "Ravager Broodlord"
-- L["Vignette/Rogond"] = "Rogond"
-- L["Vignette/Saberon Blademaster"] = "Saberon Blademaster"
-- L["Vignette/Saberon Shaman"] = "Saberon Shaman"
L["Vignette/Sea Giant King"] = "König der Meeresriesen"
-- L["Vignette/Sea Hydra"] = "Sea Hydra"
-- L["Vignette/Sea Lord Torglork"] = "Sea Lord Torglork"
L["Vignette/Seek & Destroy Squad"] = "Such- & Zerstörungstrupp"
L["Vignette/Shadowflame Terror"] = "Schattenflammenschreiter"
-- L["Vignette/Shadowmoon Cultist Ritual"] = "Shadowmoon Cultist Ritual"
-- L["Vignette/Shaman Fire Stone"] = "Shaman Fire Stone"
L["Vignette/Shivering Ashmaw Cub"] = "Zitterndes Aschenmauljunges"
-- L["Vignette/Skog"] = "Skog"
-- L["Vignette/Slogtusk the Corpse Eater"] = "Slogtusk the Corpse Eater"
-- L["Vignette/Stoneshard Broodmother"] = "Stoneshard Broodmother"
L["Vignette/Stormdrake Matriarch"] = "Matriarchin der Sturmschwingen"
L["Vignette/Syphonus & Leodrath"] = "Syphonus & Leodrath"
-- L["Vignette/Szirek"] = "Szirek"
L["Vignette/Thane's Mead Hall"] = "Methalle des Thans"
L["Vignette/The Beastly Boxer"] = "Der Bestienboxer"
L["Vignette/The Voidseer"] = "Der Leerenseher"
L["Vignette/Trecherous Stallions"] = "Verräterische Hengste"
L["Vignette/Undgrell Attack"] = "Untergrellangriff"
-- L["Vignette/Venomshade (Plant Hydra)"] = "Venomshade (Plant Hydra)"
-- L["Vignette/Wakkawam"] = "Wakkawam"
-- L["Vignette/Wandering Vindicator - Looted Treasure"] = "Wandering Vindicator - Looted Treasure"
L["Vignette/Worgen Stalkers"] = "Worgenpirscher"
L["Vignette/Worg Pack"] = "Worgrudel"
-- L["Vignette/Xothear, The Destroyer"] = "Xothear, The Destroyer"
L["Vignette/Yggdrel the Corrupted"] = "Yggdrel"
-- L["Vignette/Zoug"] = "Zoug"
-- L["Vignette/Zulk"] = "Zulk"


local VL = _G.LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName .. "Vignette", "deDE")
if not VL then return end

-- VL["Aarkos - Looted Treasure"] = "Aarkos - Looted Treasure"
VL["Abandoned Fishing Pole"] = "Liegen gelassene Angelrute"
-- VL["Alpha Bat"] = "Alpha Bat"
VL["Amateur Hunters"] = "Freizeitjäger"
-- VL["Anchorite's Sojourn"] = "Anchorite's Sojourn"
-- VL["Avatar of Sothrecar"] = "Avatar of Sothrecar"
VL["Beastmaster Pao'lek"] = "Bestienmeister Pao'lek"
-- VL["BH Master Scout"] = "BH Master Scout"
-- VL["Blood Moon Boss"] = "Blood Moon Boss"
-- VL["Burning Front"] = "Burning Front"
VL["Cache of Infernals"] = "Höllenbestienvorrat"
-- VL["Cave Keeper"] = "Cave Keeper"
-- VL["Cindral"] = "Cindral"
-- VL["Coldstomp"] = "Coldstomp"
VL["Coura, Master of Arcana"] = "Coura, Meisterin des Arkanen"
-- VL["Dead Orc Captain"] = "Dead Orc Captain"
-- VL["Dorg"] = "Dorg"
-- VL["Embaari Defense Crystal"] = "Embaari Defense Crystal"
-- VL["Enavra Varandi"] = "Enavra Varandi"
-- VL["Fel Saberon Shaman"] = "Fel Saberon Shaman"
-- VL["Foreling Worship Circle"] = "Foreling Worship Circle"
VL["Forsaken Deathsquad"] = "Todesschwadron der Verlassenen"
VL["Frenzied Animus"] = "Rasender Animus"
-- VL["Giant Python"] = "Giant Python"
-- VL["Giant Raptor"] = "Giant Raptor"
-- VL["Giantstalker Hunting Party"] = "Giantstalker Hunting Party"
-- VL["Giblette the Cowardly"] = "Giblette the Cowardly"
-- VL["Gorger the Hungry"] = "Gorger the Hungry"
-- VL["Haakun, The All-Consuming"] = "Haakun, The All-Consuming"
VL["Helmouth Raiders"] = "Räuber des Höllenschlunds"
VL["Hook & Sinker"] = "Haken & Sinkblei" -- Needs review
VL["Horn of the Siren"] = "Horn der Sirene"
-- VL["Houndmaster Jax'zor"] = "Houndmaster Jax'zor"
-- VL["IH Elite Sniper"] = "IH Elite Sniper"
VL["Invasion Point: Devastation"] = "Invasionspunkt: Verwüstung"
-- VL["Iron Front Captain 1"] = "Iron Front Captain 1"
-- VL["Iron Front Captain 2"] = "Iron Front Captain 2"
-- VL["Iron Front Captain 3"] = "Iron Front Captain 3"
-- VL["Iron Houndmaster"] = "Iron Houndmaster"
-- VL["Iron Tunnel Foreman"] = "Iron Tunnel Foreman"
-- VL["Kenos the Unraveller"] = "Kenos the Unraveller"
VL["Krahl Deathwind"] = "Krahl Todeswind"
-- VL["Lava-Gorged Goren"] = "Lava-Gorged Goren"
VL["Light the Braziers"] = "Entzündet die Kohlenpfannen"
VL["Lost Ettin"] = "Verirrter Ettin"
-- VL["Mandrakor the Night Hunter"] = "Mandrakor the Night Hunter"
-- VL["Murktide Alpha"] = "Murktide Alpha"
-- VL["Night Haunter"] = "Night Haunter"
-- VL["Oasis Icemother"] = "Oasis Icemother"
-- VL["Ogre Primalist"] = "Ogre Primalist"
-- VL["Pale Assassin"] = "Pale Assassin"
-- VL["Pale Gone Fishin'"] = "Pale Gone Fishin'"
-- VL["Pale Spider Broodmother"] = "Pale Spider Broodmother"
-- VL["Panther Saberon Boss"] = "Panther Saberon Boss"
VL["Perrexx the Corruptor"] = "Perrexx der Verderber"
VL["Pit-Slayer"] = "Grubenschlächter"
VL["Protectors of the Grove"] = "Beschützer des Hains"
-- VL["Purging the River"] = "Purging the River"
-- VL["Ravager Broodlord"] = "Ravager Broodlord"
-- VL["Rogond"] = "Rogond"
-- VL["Saberon Blademaster"] = "Saberon Blademaster"
-- VL["Saberon Shaman"] = "Saberon Shaman"
VL["Sea Giant King"] = "König der Meeresriesen"
-- VL["Sea Hydra"] = "Sea Hydra"
-- VL["Sea Lord Torglork"] = "Sea Lord Torglork"
VL["Seek & Destroy Squad"] = "Such- & Zerstörungstrupp"
VL["Shadowflame Terror"] = "Schattenflammenschreiter"
-- VL["Shadowmoon Cultist Ritual"] = "Shadowmoon Cultist Ritual"
-- VL["Shaman Fire Stone"] = "Shaman Fire Stone"
VL["Shivering Ashmaw Cub"] = "Zitterndes Aschenmauljunges"
-- VL["Skog"] = "Skog"
-- VL["Slogtusk the Corpse Eater"] = "Slogtusk the Corpse Eater"
-- VL["Stoneshard Broodmother"] = "Stoneshard Broodmother"
VL["Stormdrake Matriarch"] = "Matriarchin der Sturmschwingen"
VL["Syphonus & Leodrath"] = "Syphonus & Leodrath"
-- VL["Szirek"] = "Szirek"
VL["Thane's Mead Hall"] = "Methalle des Thans"
VL["The Beastly Boxer"] = "Der Bestienboxer"
VL["The Voidseer"] = "Der Leerenseher"
VL["Trecherous Stallions"] = "Verräterische Hengste"
VL["Undgrell Attack"] = "Untergrellangriff"
-- VL["Venomshade (Plant Hydra)"] = "Venomshade (Plant Hydra)"
-- VL["Wakkawam"] = "Wakkawam"
-- VL["Wandering Vindicator - Looted Treasure"] = "Wandering Vindicator - Looted Treasure"
VL["Worgen Stalkers"] = "Worgenpirscher"
VL["Worg Pack"] = "Worgrudel"
-- VL["Xothear, The Destroyer"] = "Xothear, The Destroyer"
VL["Yggdrel the Corrupted"] = "Yggdrel"
-- VL["Zoug"] = "Zoug"
-- VL["Zulk"] = "Zulk"

