local L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_SpecialNPCsEtc", "enUS", true)
if not L then return end

-- Options dialog
L["Icon Scale"] = true
L["The scale of the icons"] = true
L["Icon Alpha"] = true
L["The alpha transparency of the icons"] = true
L["These settings control the look and feel of the SpecialNPCsEtc icons."] = true

-- Right click menu on note on WorldMap
L["HandyNotes - SpecialNPCsEtc"] = true    -- title for the right-click menu
L["Delete SpecialNPCsEtc"] = true
L["Create waypoint"] = true        -- only available with TomTom or Cartoghrapher_Waypoints installed
L["Close"] = true

-------- NPC "guilds" ----------
-- Trainers
L["Demon Trainer"] = true
L["Weapon Master"] = true
L["Portal Trainer"] = true
L["Pet Trainer"] = true
L["Riding Trainer"] = true
L["Mechanostrider Pilot"] = true    -- Binjy Featherwhistle - Riding Trainer in Dun Morogh
L["Cold Weather Flying Trainer"] = true   -- WoTLK

-- These are for when you come across a trainer when you are not that class
L["Paladin Trainer"] = true
L["Mage Trainer"] = true
L["Druid Trainer"] = true
L["Hunter Trainer"] = true
L["Priest Trainer"] = true
L["Rogue Trainer"] = true
L["Sharman Trainer"] = true
L["Warlock Trainer"] = true
L["Warrior Trainer"] = true
L["Deathknight Trainer"] = true
L["Fishing Trainer"] = true
L["Mining Trainer"] = true
L["Cooking Trainer"] = true
L["First Aid Trainer"] = true
L["Armorsmith"] = true
L["Blacksmithing Trainer"] = true
L["Weaponsmith Trainer"] = true
L["Axesmithing"] = true
L["Hammersmithing"] = true
L["Swordsmithing"] = true

-- Other special NPCs
L["Innkeeper"] = true
L["Auctioneer"] = true
L["Banker"] = true
L["Stable Master"] = true
L["SpiritHealer"] = true
L["Battlemaster"] = true
