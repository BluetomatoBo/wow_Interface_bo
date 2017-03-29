-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
-- 
-- Gem information
------------------------------------------------------------


-- Gem table row format:
-- { ItemID, Class, "Stat1" Quantity1, "Stat2", Quantity2 }
-- 	ItemID: The item ID of this gem.
--	"Stat": The stat that this gem gives.
--	Quantity: How much of the stat that the gem gives.
--	("Stat", Quantity can be repeated again...)
--	Pawn will use the 9th slot for storing a cache of scale values.


--========================================
-- Colored level 70 uncommon-quality gems
--========================================
local PawnGemData70Uncommon =
{

{ 23094, "Intellect", 6 }, -- Brilliant Blood Garnet
{ 23095, "Strength", 6 }, -- Bold Blood Garnet
{ 28595, "Agility", 6 }, -- Delicate Blood Garnet
{ 23114, "CritRating", 12 }, -- Smooth Golden Draenite
{ 23115, "Stamina", 12 }, -- Subtle Golden Draenite
{ 23116, "CritRating", 12 }, -- Rigid Azure Moonstone
{ 23119, "Versatility", 12 }, -- Sparkling Azure Moonstone

}


--========================================
-- Colored level 70 rare-quality gems
--========================================
local PawnGemData70Rare =
{

{ 24027, "Strength", 8 }, -- Bold Living Ruby
{ 24028, "Agility", 8 }, -- Delicate Living Ruby
{ 24030, "Intellect", 8 }, -- Brilliant Living Ruby
{ 24048, "CritRating", 16 }, -- Smooth Dawnstone
{ 35315, "HasteRating", 16 }, -- Quick Dawnstone
{ 24033, "Stamina", 12 }, -- Solid Star of Elune
{ 24035, "Versatility", 16 }, -- Sparkling Star of Elune
{ 24051, "CritRating", 16 }, -- Rigid Star of Elune

}


--========================================
-- Colored level 70 epic-quality gems
--========================================
local PawnGemData70Epic =
{

{ 32193, "Strength", 10 }, -- Bold Crimson Spinel
{ 32194, "Agility", 10 }, -- Delicate Crimson Spinel
{ 32195, "Intellect", 10 }, -- Brilliant Crimson Spinel
{ 32205, "CritRating", 20 }, -- Smooth Lionseye
{ 35761, "HasteRating", 20 }, -- Quick Lionseye
{ 32200, "Stamina", 15 }, -- Solid Empyrean Sapphire
{ 32201, "Versatility", 20 }, -- Sparkling Empyrean Sapphire
{ 32210, "CritRating", 20 }, -- Rigid Empyrean Sapphire

}


--========================================
-- Colored level 80 uncommon-quality gems
--========================================
local PawnGemData80Uncommon =
{

{ 39900, "Strength", 6 }, -- Bold Bloodstone
{ 39905, "Agility", 6 }, -- Delicate Bloodstone
{ 39910, "HasteRating", 12 }, -- Precise Bloodstone
{ 39911, "Intellect", 6 }, -- Brilliant Bloodstone
{ 39909, "CritRating", 12 }, -- Smooth Sun Crystal
{ 39918, "HasteRating", 12 }, -- Quick Sun Crystal
{ 39915, "CritRating", 12 }, -- Rigid Chalcedony
{ 39919, "Stamina", 9 }, -- Solid Chalcedony
{ 39920, "Versatility", 12 }, -- Sparkling Chalcedony

}


--========================================
-- Colored level 80 rare-quality gems
--========================================
local PawnGemData80Rare =
{

{ 39996, "Strength", 8 }, -- Bold Scarlet Ruby
{ 39997, "Agility", 8 }, -- Delicate Scarlet Ruby
{ 39998, "Intellect", 8 }, -- Brilliant Scarlet Ruby
{ 40003, "HasteRating", 16 }, -- Precise Scarlet Ruby
{ 40002, "CritRating", 16 }, -- Smooth Autumn's Glow
{ 40017, "HasteRating", 16 }, -- Quick Autumn's Glow
{ 40008, "Stamina", 12 }, -- Solid Sky Sapphire
{ 40009, "Versatility", 16 }, -- Sparkling Sky Sapphire
{ 40014, "CritRating", 16 }, -- Rigid Sky Sapphire

}


--========================================
-- Colored level 80 epic-quality gems
--========================================
local PawnGemData80Epic =
{

{ 40111, "Strength", 10 }, -- Bold Cardinal Ruby
{ 40112, "Agility", 10 }, -- Delicate Cardinal Ruby
{ 40113, "Intellect", 10 }, -- Brilliant Cardinal Ruby
{ 40118, "HasteRating", 20 }, -- Precise Cardinal Ruby
{ 40117, "CritRating", 20 }, -- Smooth King's Amber
{ 40128, "HasteRating", 20 }, -- Quick King's Amber
{ 40119, "Stamina", 12 }, -- Solid Majestic Zircon
{ 40120, "Versatility", 20 }, -- Sparkling Majestic Zircon
{ 40125, "CritRating", 20 }, -- Rigid Majestic Zircon

}


--========================================
-- Colored level 85 uncommon-quality gems
--========================================
local PawnGemData85Uncommon =
{

{ 52081, "Strength", 6 }, -- Bold Carnelian
{ 52082, "Agility", 6 }, -- Delicate Carnelian
{ 52084, "Intellect", 6 }, -- Brilliant Carnelian
{ 52085, "HasteRating", 12 }, -- Precise Carnelian
{ 52091, "CritRating", 12 }, -- Smooth Alicite
{ 52093, "HasteRating", 12 }, -- Quick Alicite
{ 52094, "MasteryRating", 12 }, -- Fractured Alicite
{ 52086, "Stamina", 9 }, -- Solid Zephyrite
{ 52087, "Versatility", 12 }, -- Sparkling Zephyrite
{ 52089, "CritRating", 12 }, -- Rigid Zephyrite

}


--========================================
-- Colored level 85 rare-quality gems
--========================================
local PawnGemData85Rare =
{

{ 52206, "Strength", 8 }, -- Bold Inferno Ruby
{ 52207, "Intellect", 8 }, -- Brilliant Inferno Ruby
{ 52212, "Agility", 8 }, -- Delicate Inferno Ruby
{ 52230, "HasteRating", 16 }, -- Precise Inferno Ruby
{ 52219, "MasteryRating", 16 }, -- Fractured Amberjewel
{ 52232, "HasteRating", 16 }, -- Quick Amberjewel
{ 52241, "CritRating", 16 }, -- Smooth Amberjewel
{ 52235, "CritRating", 16 }, -- Rigid Ocean Sapphire
{ 52242, "Stamina", 12 }, -- Solid Ocean Sapphire
{ 52244, "Versatility", 16 }, -- Sparkling Ocean Sapphire

}


--========================================
-- Colored level 85 epic-quality gems
--========================================
local PawnGemData85Epic =
{

{ 71879, "Agility", 10 }, -- Delicate Queen's Garnet
{ 71880, "HasteRating", 20 }, -- Precise Queen's Garnet
{ 71881, "Intellect", 10 }, -- Brilliant Queen's Garnet
{ 71883, "Strength", 10 }, -- Bold Queen's Garnet
{ 71874, "CritRating", 20 }, -- Smooth Lightstone
{ 71876, "HasteRating", 20 }, -- Quick Lightstone
{ 71877, "MasteryRating", 20 }, -- Fractured Lightstone
{ 71817, "CritRating", 20 }, -- Rigid Deepholm Iolite
{ 71819, "Versatility", 20 }, -- Sparkling Deepholm Iolite
{ 71820, "Stamina", 15 }, -- Solid Deepholm Iolite

}


--========================================
-- Colored level 90 uncommon-quality gems
--========================================
local PawnGemData90Uncommon =
{

{ 76560, "Agility", 8 }, -- Delicate Pandarian Garnet
{ 76561, "HasteRating", 16 }, -- Precise Pandarian Garnet
{ 76562, "Intellect", 8 }, -- Brilliant Pandarian Garnet
{ 76564, "Strength", 8 }, -- Bold Pandarian Garnet
{ 76565, "CritRating", 16 }, -- Smooth Sunstone
{ 76567, "HasteRating", 16 }, -- Quick Sunstone
{ 76568, "MasteryRating", 16 }, -- Fractured Sunstone
{ 76502, "CritRating", 16 }, -- Rigid Lapis Lazuli
{ 76505, "Versatility", 16 }, -- Sparkling Lapis Lazuli
{ 76506, "Stamina", 12 }, -- Solid Lapis Lazuli

}


--========================================
-- Colored level 90 rare-quality gems
--========================================
local PawnGemData90Rare =
{

{ 76692, "Agility", 10 }, -- Delicate Primordial Ruby
{ 76693, "HasteRating", 20 }, -- Precise Primordial Ruby
{ 76694, "Intellect", 10 }, -- Brilliant Primordial Ruby
{ 76696, "Strength", 10 }, -- Bold Primordial Ruby
{ 76697, "CritRating", 20 }, -- Smooth Sun's Radiance
{ 76699, "HasteRating", 20 }, -- Quick Sun's Radiance
{ 76700, "MasteryRating", 20 }, -- Fractured Sun's Radiance
{ 76636, "CritRating", 20 }, -- Rigid River's Heart
{ 76638, "Versatility", 20 }, -- Sparkling River's Heart
{ 76639, "Stamina", 15 }, -- Solid River's Heart

}


--========================================
-- Level 100 crafted uncommon prismatic gems
--========================================
local PawnGemData100Uncommon =
{

{ 115803, "CritRating", 35 }, -- Critical Strike Taladite
{ 115804, "HasteRating", 35 }, -- Haste Taladite
{ 115805, "MasteryRating", 35 }, -- Mastery Taladite
{ 115807, "Versatility", 35 }, -- Versatility Taladite
{ 115808, "Stamina", 35 }, -- Stamina Taladite

}


--========================================
-- Level 100 crafted rare prismatic gems
--========================================
local PawnGemData100Rare =
{

{ 115809, "CritRating", 50 }, -- Greater Critical Strike Taladite
{ 115811, "HasteRating", 50 }, -- Greater Haste Taladite
{ 115812, "MasteryRating", 50 }, -- Greater Mastery Taladite
{ 115814, "Versatility", 50 }, -- Greater Versatility Taladite
{ 115815, "Stamina", 50 }, -- Greater Stamina Taladite

}


--========================================
-- Level 100 crafted epic prismatic gems
--========================================
local PawnGemData100Epic =
{

{ 127760, "CritRating", 75 }, -- Immaculate Critical Strike Taladite
{ 127761, "HasteRating", 75 }, -- Immaculate Haste Taladite
{ 127762, "MasteryRating", 75 }, -- Immaculate Mastery Taladite
{ 127764, "Versatility", 75 }, -- Immaculate Versatility Taladite
{ 127765, "Stamina", 75 }, -- Immaculate Stamina Taladite

}


--========================================
-- Level 110 crafted uncommon prismatic gems
--========================================
local PawnGemData110Uncommon =
{

{ 130215, "CritRating", 100 }, -- Deadly Deep Amber
{ 130216, "HasteRating", 100 }, -- Quick Azsunite
{ 130217, "Versatility", 100 }, -- Versatile Skystone
{ 130218, "MasteryRating", 100 }, -- Masterful Queen's Opal

}


--========================================
-- Level 110 crafted rare prismatic gems
--========================================
local PawnGemData110Rare =
{

{ 130219, "CritRating", 150 }, -- Deadly Eye of Prophecy
{ 130220, "HasteRating", 150 }, -- Quick Dawnlight
{ 130221, "Versatility", 150 }, -- Versatile Maelstrom Sapphire
{ 130222, "MasteryRating", 150 }, -- Masterful Shadowruby

}


--========================================

-- The master list of all tables of Pawn gem data

-- Gem data metatable row format:
-- { MinItemLevel, GemData }
-- 	MinItemLevel: Minimum item level required to use that gem quality level (inclusive)
-- 	GemData: The table of gem data (as specified above)

-- The rows must be specified in descending MinItemLevel order, with the last row
-- in each table having MinItemLevel 0.

PawnGemQualityLevels =
{
	{ 865, PawnGemData110Rare }, -- Higher than Legion world bosses
	{ 755, PawnGemData110Uncommon }, -- Higher than Mythic Hellfire Citadel gear
	{ 695, PawnGemData100Epic }, -- Warlords of Draenor Mythic Blackrock Foundry / Heroic Hellfire Citadel
	{ 680, PawnGemData100Rare }, -- Warlords of Draenor Mythic Highmaul / Heroic Blackrock Foundry / Raid Finder Hellfire Citadel end bosses
	{ 600, PawnGemData100Uncommon }, -- Actual gem requirement
	{ 463, PawnGemData90Rare }, -- Mists of Pandaria heroics
	{ 417, PawnGemData90Uncommon }, -- Actual gem requirement
	{ 397, PawnGemData85Epic }, -- Dragon Soul normal mode
	{ 346, PawnGemData85Rare }, -- Wrath heroics
	{ 308, PawnGemData85Uncommon }, -- Wrath of the Lich King dungeons
	{ 232, PawnGemData80Epic }, -- Tier 9 epics
	{ 200, PawnGemData80Rare }, -- Wrath of the Lich King heroics
	{ 145, PawnGemData80Uncommon }, -- Sea King's Crown, worst Wrath socketed green
	{ 141, PawnGemData70Epic }, -- Tier 5 epics
	{ 112, PawnGemData70Rare }, -- Burning Crusade level 70 non-heroics
	{ 0, PawnGemData70Uncommon },
}

