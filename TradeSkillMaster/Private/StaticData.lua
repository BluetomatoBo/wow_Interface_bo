-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- general static data tables

local TSM = select(2, ...)
TSM.STATIC_DATA = {}
local L = LibStub("AceLocale-3.0"):GetLocale("TradeSkillMaster")
local WEAPON = GetItemClassInfo(LE_ITEM_CLASS_WEAPON)
local ARMOR = GetItemClassInfo(LE_ITEM_CLASS_ARMOR)



-- ============================================================================
-- Vendor-Bought Items / Costs
-- ============================================================================

TSM.STATIC_DATA.preloadedVendorCosts = {
	["i:80433"] = 2000000, -- Blood Spirit
	["i:83092"] = 200000000, -- Orb of Mystery
	["i:65893"] = 30000000, -- Sands of Time
	["i:58265"] = 20000, -- Highland Pomegranate
	["i:65892"] = 50000000, -- Pyrium-Laced Crystalline Vial
	["i:67319"] = 328990, -- Preserved Ogre Eye
	["i:67335"] = 445561, -- Silver Charm Bracelet
	["i:74659"] = 30000, -- Farm Chicken
	["i:74660"] = 15000, -- Pandaren Peach
	["i:74832"] = 12000, -- Barley
	["i:74845"] = 35000, -- Ginseng
	["i:74851"] = 14000, -- Rice
	["i:74852"] = 16000, -- Yak Milk
	["i:74854"] = 7000, -- Instant Noodles
	["i:85583"] = 12000, -- Needle Mushrooms
	["i:85584"] = 17000, -- Silkworm Pupa
	["i:85585"] = 27000, -- Red Beans
	["i:102539"] = 5000, -- Fresh Strawberries
	["i:102540"] = 5000, -- Fresh Mangos
	["i:52188"] = 15000, -- Jeweler's Setting
	["i:62323"] = 60000, -- Deathwing Scale Fragment
	["i:43102"] = 750000, -- Frozen Orb
	["i:44499"] = 30000000, -- Salvaged Iron Golem Parts
	["i:44500"] = 15000000, -- Elementium-Plated Exhaust Pipe
	["i:44501"] = 10000000, -- Goblin-Machined Piston
	["i:45087"] = 1000000, -- Runed Orb
	["i:47556"] = 1250000, -- Crusader Orb
	["i:49908"] = 1500000, -- Primordial Saronite
	["i:40533"] = 50000, -- Walnut Stock
	["i:30183"] = 700000, -- Nether Vortex
	["i:35948"] = 16000, -- Savory Snowplum
	["i:58278"] = 16000, -- Tropical Sunfruit
	["i:39684"] = 9000, -- Hair Trigger
	["i:34249"] = 1000000, -- Hula Girl Doll
	["i:38426"] = 30000, -- Eternium Thread
	["i:23572"] = 500000, -- Primal Nether
	["i:27860"] = 6400, -- Purified Draenic Water
	["i:35949"] = 8500, -- Tundra Berries
	["i:18567"] = 30000, -- Elemental Flux
	["i:90146"] = 20000, -- Tinker's Kit
	["i:4342"] = 2500, -- Purple Dye
	["i:10290"] = 2500, -- Pink Dye
	["i:10647"] = 2000, -- Engineer's Ink
	["i:14341"] = 5000, -- Rune Thread
	["i:34412"] = 1000, -- Sparkling Apple Cider
	["i:2325"] = 1000, -- Black Dye
	["i:8343"] = 2000, -- Heavy Silken Thread
	["i:2595"] = 2000, -- Jug of Badlands Bourbon
	["i:6261"] = 1000, -- Orange Dye
	["i:3857"] = 500, -- Coal
	["i:4291"] = 500, -- Silken Thread
	["i:11291"] = 4500, -- Star Wood
	["i:2594"] = 1500, -- Flagon of Dwarven Mead
	["i:3466"] = 2000, -- Strong Flux
	["i:4340"] = 350, -- Gray Dye
	["i:4341"] = 500, -- Yellow Dye
	["i:4400"] = 2000, -- Heavy Stock
	["i:2321"] = 100, -- Fine Thread
	["i:6530"] = 100, -- Nightcrawlers
	["i:2593"] = 150, -- Flask of Stormwind Tawny
	["i:2596"] = 120, -- Skin of Dwarven Stout
	["i:2605"] = 100, -- Green Dye
	["i:2604"] = 50, -- Red Dye
	["i:4289"] = 50, -- Salt
	["i:4399"] = 200, -- Wooden Stock
	["i:6260"] = 50, -- Blue Dye
	["i:1179"] = 125, -- Ice Cold Milk
	["i:2320"] = 10, -- Coarse Thread
	["i:2324"] = 25, -- Bleach
	["i:2678"] = 10, -- Mild Spices
	["i:2880"] = 100, -- Weak Flux
	["i:4470"] = 38, -- Simple Wood
	["i:4537"] = 125, -- Tel'Abim Banana
	["i:6217"] = 124, -- Copper Rod
	["i:17194"] = 10, -- Holiday Spices
	["i:17202"] = 10, -- Snowball
	["i:30817"] = 25, -- Simple Flour
	["i:44835"] = 10, -- Autumnal Herbs
	["i:2901"] = 81, -- Mining Pick
	["i:7005"] = 82, -- Skinning Knife
	["i:159"] = 25, -- Refreshing Spring Water
	["i:3371"] = 100, -- Crystal Vial
	["i:5956"] = 18, -- Blacksmith Hammer
	["i:17196"] = 50, -- Holiday Spirits
	["i:39354"] = 15, -- Light Parchment
	["i:44853"] = 25, -- Honey
	["i:44854"] = 25, -- Tangy Wetland Cranberries
	["i:44855"] = 25, -- Teldrassil Sweet Potato
	["i:46784"] = 25, -- Ripe Elwynn Pumpkin
	["i:46793"] = 25, -- Tangy Southfury Cranberries
	["i:46796"] = 25, -- Ripe Tirisfal Pumpkin
	["i:46797"] = 25, -- Mulgore Sweet Potato
	["i:79740"] = 23, -- Plain Wooden Staff
}



-- ============================================================================
-- Soulbound Crafting Mats
-- ============================================================================

TSM.STATIC_DATA.soulboundMats = {
	["i:79731"] = true, -- Scroll of Wisdom
	["i:82447"] = true, -- Imperial Silk
	["i:54440"] = true, -- Dreamcloth
	["i:94111"] = true, -- Lightning Steel Ingot
	["i:94113"] = true, -- Jard's Peculiar Energy Source
	["i:98717"] = true, -- Balanced Trillium Ingot
	["i:98619"] = true, -- Celestial Cloth
	["i:98617"] = true, -- Hardened Magnificent Hide
	["i:108257"] = true, -- Truesteel Ingot
	["i:108995"] = true, -- Metamorphic Crystal
	["i:110611"] = true, -- Burnished Leather
	["i:111366"] = true, -- Gearspring Parts
	["i:111556"] = true, -- Hexweave Cloth
	["i:112377"] = true, -- War Paints
	["i:115524"] = true, -- Taladite Crystal
	["i:120945"] = true, -- Primal Spirit
	["i:124124"] = true, -- Blood of Sargeras
	["i:137595"] = true, -- Viscous Transmutagen
	["i:137596"] = true, -- Black Transmutagen
	["i:137597"] = true, -- Oily Transmutagen
}



-- ============================================================================
-- Non-Disenchantable Items
-- ============================================================================

-- URLs for non-disenchantable items:
-- 	http://www.wowhead.com/items=2?filter=qu=2%3A3%3A4%3Bcr=8%3A2%3Bcrs=2%3A2%3Bcrv=0%3A0
-- 	http://www.wowhead.com/items=4?filter=qu=2%3A3%3A4%3Bcr=8%3A2%3Bcrs=2%3A2%3Bcrv=0%3A0
TSM.STATIC_DATA.notDisenchantable = {
	["i:11290"] = true,
	["i:11289"] = true,
	["i:11288"] = true,
	["i:11287"] = true,
	["i:60223"] = true,
	["i:52252"] = true,
	["i:20406"] = true,
	["i:20407"] = true,
	["i:20408"] = true,
	["i:21766"] = true,
	["i:52485"] = true,
	["i:52486"] = true,
	["i:52487"] = true,
	["i:52488"] = true,
	["i:75274"] = true,
	["i:97826"] = true,
	["i:97827"] = true,
	["i:97828"] = true,
	["i:97829"] = true,
	["i:97830"] = true,
	["i:97831"] = true,
	["i:97832"] = true,
	["i:109262"] = true,
}



-- ============================================================================
-- Disenchanting Ratios
-- ============================================================================

TSM.STATIC_DATA.disenchantInfo = {
	{
		desc = L["Dust"],
		["i:10940"] = { -- Strange Dust
			minLevel = 0,
			maxLevel = 24,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 5, maxItemLevel = 15, amountOfMats = 1.2},
				{itemType = ARMOR, rarity = 2, minItemLevel = 16, maxItemLevel = 20, amountOfMats = 1.875},
				{itemType = ARMOR, rarity = 2, minItemLevel = 21, maxItemLevel = 25, amountOfMats = 3.75},
				{itemType = WEAPON, rarity = 2, minItemLevel = 5, maxItemLevel = 15, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 16, maxItemLevel = 20, amountOfMats = 0.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 21, maxItemLevel = 25, amountOfMats = 0.75},
			},
		},
		["i:11083"] = { -- Soul Dust
			minLevel = 20,
			maxLevel = 30,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 1.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 2.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 0.7},
			},
		},
		["i:11137"] = { -- Vision Dust
			minLevel = 30,
			maxLevel = 40,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 1.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 2.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 0.7},
			},
		},
		["i:11176"] = { -- Dream Dust
			minLevel = 41,
			maxLevel = 50,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 1.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 2.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 0.77},
			},
		},
		["i:16204"] = { -- Illusion Dust
			minLevel = 51,
			maxLevel = 60,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 56, maxItemLevel = 60, amountOfMats = 1.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 61, maxItemLevel = 65, amountOfMats = 2.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 56, maxItemLevel = 60, amountOfMats = 0.33},
				{itemType = WEAPON, rarity = 2, minItemLevel = 61, maxItemLevel = 65, amountOfMats = 0.77},
			},
		},
		["i:22445"] = { -- Arcane Dust
			minLevel = 57,
			maxLevel = 70,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 79, maxItemLevel = 79, amountOfMats = 1.5},
				{itemType = ARMOR, rarity = 2, minItemLevel = 80, maxItemLevel = 99, amountOfMats = 1.875},
				{itemType = ARMOR, rarity = 2, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 2.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 80, maxItemLevel = 99, amountOfMats = 0.55},
				{itemType = WEAPON, rarity = 2, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 0.77},
			},
		},
		["i:34054"] = { -- Infinite Dust
			minLevel = 67,
			maxLevel = 80,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 130, maxItemLevel = 151, amountOfMats = 1.5},
				{itemType = ARMOR, rarity = 2, minItemLevel = 152, maxItemLevel = 200, amountOfMats = 3.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 130, maxItemLevel = 151, amountOfMats = 0.55},
				{itemType = WEAPON, rarity = 2, minItemLevel = 152, maxItemLevel = 200, amountOfMats = 1.1},
			},
		},
		["i:52555"] = { -- Hypnotic Dust
			minLevel = 77,
			maxLevel = 85,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 272, maxItemLevel = 275, amountOfMats = 1.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 276, maxItemLevel = 290, amountOfMats = 1.5},
				{itemType = ARMOR, rarity = 2, minItemLevel = 291, maxItemLevel = 305, amountOfMats = 1.875},
				{itemType = ARMOR, rarity = 2, minItemLevel = 306, maxItemLevel = 315, amountOfMats = 2.25},
				{itemType = ARMOR, rarity = 2, minItemLevel = 316, maxItemLevel = 325, amountOfMats = 2.625},
				{itemType = ARMOR, rarity = 2, minItemLevel = 326, maxItemLevel = 350, amountOfMats = 3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 272, maxItemLevel = 275, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 276, maxItemLevel = 290, amountOfMats = 0.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 291, maxItemLevel = 305, amountOfMats = 0.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 306, maxItemLevel = 315, amountOfMats = 0.75},
				{itemType = WEAPON, rarity = 2, minItemLevel = 316, maxItemLevel = 325, amountOfMats = 0.875},
				{itemType = WEAPON, rarity = 2, minItemLevel = 326, maxItemLevel = 350, amountOfMats = 1},
			},
		},
		["i:74249"] = { -- Spirit Dust
			minLevel = 83,
			maxLevel = 88,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 364, maxItemLevel = 390, amountOfMats = 2.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 391, maxItemLevel = 410, amountOfMats = 2.55},
				{itemType = ARMOR, rarity = 2, minItemLevel = 411, maxItemLevel = 450, amountOfMats = 3.4},
				{itemType = WEAPON, rarity = 2, minItemLevel = 364, maxItemLevel = 390, amountOfMats = 2.125},
				{itemType = WEAPON, rarity = 2, minItemLevel = 391, maxItemLevel = 410, amountOfMats = 2.55},
				{itemType = WEAPON, rarity = 2, minItemLevel = 411, maxItemLevel = 450, amountOfMats = 3.4},
			},
		},
		["i:109693"] = { -- Draenic Dust
			minLevel = 90,
			maxLevel = 100,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 483, maxItemLevel = 593, amountOfMats = 2.125},
				{itemType = ARMOR, rarity = 3, minItemLevel = 505, maxItemLevel = 593, amountOfMats = 8.1},
				{itemType = ARMOR, rarity = 3, minItemLevel = 594, maxItemLevel = 680, amountOfMats = 12},
				{itemType = WEAPON, rarity = 2, minItemLevel = 483, maxItemLevel = 593, amountOfMats = 2.125},
				{itemType = WEAPON, rarity = 3, minItemLevel = 505, maxItemLevel = 593, amountOfMats = 8.1},
				{itemType = WEAPON, rarity = 3, minItemLevel = 594, maxItemLevel = 680, amountOfMats = 12},
			},
		},
		["i:124440"] = { -- Arkhana
			minLevel = 101,
			maxLevel = 110,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 680, maxItemLevel = 810, amountOfMats = 2.849},
				{itemType = ARMOR, rarity = 3, minItemLevel = 680, maxItemLevel = 840, amountOfMats = 2.02},
			},
		},
	},
	{
		desc = L["Essences"],
		["i:10939"] = { -- Greater Magic Essence
			minLevel = 1,
			maxLevel = 15,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 5, maxItemLevel = 15, amountOfMats = 0.1},
				{itemType = ARMOR, rarity = 2, minItemLevel = 16, maxItemLevel = 20, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 5, maxItemLevel = 15, amountOfMats = 0.4},
				{itemType = WEAPON, rarity = 2, minItemLevel = 16, maxItemLevel = 20, amountOfMats = 1.125},
			},
		},
		["i:11082"] = { -- Greater Astral Essence
			minLevel = 16,
			maxLevel = 25,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 21, maxItemLevel = 25, amountOfMats = .075},
				{itemType = ARMOR, rarity = 2, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 21, maxItemLevel = 25, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 1.125},
			},
		},
		["i:11135"] = { -- Greater Mystic Essence
			minLevel = 26,
			maxLevel = 35,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 0.1},
				{itemType = ARMOR, rarity = 2, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 1.125},
			},
		},
		["i:11175"] = { -- Greater Nether Essence
			minLevel = 36,
			maxLevel = 45,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 0.1},
				{itemType = ARMOR, rarity = 2, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 1.125},
			},
		},
		["i:16203"] = { -- Greater Eternal Essence
			minLevel = 46,
			maxLevel = 60,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 0.1},
				{itemType = ARMOR, rarity = 2, minItemLevel = 56, maxItemLevel = 60, amountOfMats = 0.3},
				{itemType = ARMOR, rarity = 2, minItemLevel = 61, maxItemLevel = 65, amountOfMats = 0.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 56, maxItemLevel = 60, amountOfMats = 0.125},
				{itemType = WEAPON, rarity = 2, minItemLevel = 61, maxItemLevel = 65, amountOfMats = 1.875},
			},
		},
		["i:22446"] = { -- Greater Planar Essence
			minLevel = 58,
			maxLevel = 70,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 66, maxItemLevel = 99, amountOfMats = 0.167},
				{itemType = ARMOR, rarity = 2, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 79, maxItemLevel = 79, amountOfMats = 0.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 80, maxItemLevel = 99, amountOfMats = 0.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 1.125},
			},
		},
		["i:34055"] = { -- Greater Cosmic Essence
			minLevel = 67,
			maxLevel = 80,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 130, maxItemLevel = 151, amountOfMats = 0.1},
				{itemType = ARMOR, rarity = 2, minItemLevel = 152, maxItemLevel = 200, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 130, maxItemLevel = 151, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 152, maxItemLevel = 200, amountOfMats = 1.125},
			},
		},
		["i:52719"] = { -- Greater Celestial Essence
			minLevel = 77,
			maxLevel = 85,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 201, maxItemLevel = 275, amountOfMats = 0.125},
				{itemType = ARMOR, rarity = 2, minItemLevel = 276, maxItemLevel = 290, amountOfMats = 0.167},
				{itemType = ARMOR, rarity = 2, minItemLevel = 291, maxItemLevel = 305, amountOfMats = 0.208},
				{itemType = ARMOR, rarity = 2, minItemLevel = 306, maxItemLevel = 315, amountOfMats = 0.375},
				{itemType = ARMOR, rarity = 2, minItemLevel = 316, maxItemLevel = 325, amountOfMats = 0.625},
				{itemType = ARMOR, rarity = 2, minItemLevel = 326, maxItemLevel = 350, amountOfMats = 0.75},
				{itemType = WEAPON, rarity = 2, minItemLevel = 201, maxItemLevel = 275, amountOfMats = 0.375},
				{itemType = WEAPON, rarity = 2, minItemLevel = 276, maxItemLevel = 290, amountOfMats = 0.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 291, maxItemLevel = 305, amountOfMats = 0.625},
				{itemType = WEAPON, rarity = 2, minItemLevel = 306, maxItemLevel = 315, amountOfMats = 1.125},
				{itemType = WEAPON, rarity = 2, minItemLevel = 316, maxItemLevel = 325, amountOfMats = 1.875},
				{itemType = WEAPON, rarity = 2, minItemLevel = 326, maxItemLevel = 350, amountOfMats = 2.25},
			},
		},
		["i:74250"] = { -- Mysterious Essence
			minLevel = 83,
			maxLevel = 88,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 364, maxItemLevel = 390, amountOfMats = 0.15},
				{itemType = ARMOR, rarity = 2, minItemLevel = 391, maxItemLevel = 410, amountOfMats = 0.225},
				{itemType = ARMOR, rarity = 2, minItemLevel = 411, maxItemLevel = 450, amountOfMats = 0.3},
				{itemType = WEAPON, rarity = 2, minItemLevel = 364, maxItemLevel = 390, amountOfMats = 0.15},
				{itemType = WEAPON, rarity = 2, minItemLevel = 391, maxItemLevel = 410, amountOfMats = 0.225},
				{itemType = WEAPON, rarity = 2, minItemLevel = 411, maxItemLevel = 450, amountOfMats = 0.3},
			},
		},
	},
	{
		desc = L["Shards"],
		["i:10978"] = { -- Small Glimmering Shard
			minLevel = 1,
			maxLevel = 20,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 1, maxItemLevel = 20, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 2, minItemLevel = 21, maxItemLevel = 25, amountOfMats = 0.1},
				{itemType = ARMOR, rarity = 3, minItemLevel = 1, maxItemLevel = 25, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 3, minItemLevel = 1, maxItemLevel = 25, amountOfMats = 1.000},
			},
		},
		["i:11084"] = { -- Large Glimmering Shard
			minLevel = 16,
			maxLevel = 25,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 3, minItemLevel = 26, maxItemLevel = 30, amountOfMats = 1.000},
			},
		},
		["i:11138"] = { -- Small Glowing Shard
			minLevel = 26,
			maxLevel = 30,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 2, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 31, maxItemLevel = 35, amountOfMats = 1.000},
			},
		},
		["i:11139"] = { -- Large Glowing Shard
			minLevel = 31,
			maxLevel = 35,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 2, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 1.000},
			},
		},
		["i:11177"] = { -- Small Radiant Shard
			minLevel = 36,
			maxLevel = 40,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 1.000},
				{itemType = ARMOR, rarity = 4, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 3},
				{itemType = ARMOR, rarity = 4, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 3.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 36, maxItemLevel = 40, amountOfMats = 3},
				{itemType = WEAPON, rarity = 4, minItemLevel = 41, maxItemLevel = 45, amountOfMats = 3.5},
			},
		},
		["i:11178"] = { -- Large Radiant Shard
			minLevel = 41,
			maxLevel = 45,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 1.000},
				{itemType = ARMOR, rarity = 4, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 3.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 46, maxItemLevel = 50, amountOfMats = 3.5},
			},
		},
		["i:14343"] = { -- Small Brilliant Shard
			minLevel = 46,
			maxLevel = 50,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 1.000},
				{itemType = ARMOR, rarity = 4, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 3.5},
				{itemType = WEAPON, rarity = 2, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 51, maxItemLevel = 55, amountOfMats = 3.5},
			},
		},
		["i:14344"] = { -- Large Brilliant Shard
			minLevel = 56,
			maxLevel = 75,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 56, maxItemLevel = 65, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 56, maxItemLevel = 65, amountOfMats = 0.995},
				{itemType = WEAPON, rarity = 2, minItemLevel = 56, maxItemLevel = 65, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 56, maxItemLevel = 65, amountOfMats = 0.995},
			},
		},
		["i:22449"] = { -- Large Prismatic Shard
			minLevel = 56,
			maxLevel = 70,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 66, maxItemLevel = 99, amountOfMats = 0.0167},
				{itemType = ARMOR, rarity = 2, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 66, maxItemLevel = 99, amountOfMats = 0.33},
				{itemType = ARMOR, rarity = 3, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 1},
				{itemType = WEAPON, rarity = 2, minItemLevel = 66, maxItemLevel = 99, amountOfMats = 0.0167},
				{itemType = WEAPON, rarity = 2, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 66, maxItemLevel = 99, amountOfMats = 0.33},
				{itemType = WEAPON, rarity = 3, minItemLevel = 100, maxItemLevel = 120, amountOfMats = 1},
			},
		},
		["i:34052"] = { -- Dream Shard
			minLevel = 68,
			maxLevel = 80,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 121, maxItemLevel = 151, amountOfMats = 0.0167},
				{itemType = ARMOR, rarity = 2, minItemLevel = 152, maxItemLevel = 200, amountOfMats = 0.05},
				{itemType = ARMOR, rarity = 3, minItemLevel = 121, maxItemLevel = 164, amountOfMats = 0.33},
				{itemType = ARMOR, rarity = 3, minItemLevel = 165, maxItemLevel = 200, amountOfMats = 1},
				{itemType = WEAPON, rarity = 2, minItemLevel = 121, maxItemLevel = 151, amountOfMats = 0.0167},
				{itemType = WEAPON, rarity = 2, minItemLevel = 152, maxItemLevel = 200, amountOfMats = 0.05},
				{itemType = WEAPON, rarity = 3, minItemLevel = 121, maxItemLevel = 164, amountOfMats = 0.33},
				{itemType = WEAPON, rarity = 3, minItemLevel = 165, maxItemLevel = 200, amountOfMats = 1},
			},
		},
		["i:52720"] = { -- Small Heavenly Shard
			minLevel = 78,
			maxLevel = 85,
			sourceInfo = {
				{itemType = ARMOR, rarity = 3, minItemLevel = 282, maxItemLevel = 316, amountOfMats = 1},
				{itemType = WEAPON, rarity = 3, minItemLevel = 282, maxItemLevel = 316, amountOfMats = 1},
			},
		},
		["i:52721"] = { -- Heavenly Shard
			minLevel = 78,
			maxLevel = 85,
			sourceInfo = {
				{itemType = ARMOR, rarity = 3, minItemLevel = 282, maxItemLevel = 316, amountOfMats = 0.33},
				{itemType = ARMOR, rarity = 3, minItemLevel = 317, maxItemLevel = 377, amountOfMats = 1},
				{itemType = WEAPON, rarity = 3, minItemLevel = 282, maxItemLevel = 316, amountOfMats = 0.33},
				{itemType = WEAPON, rarity = 3, minItemLevel = 317, maxItemLevel = 377, amountOfMats = 1},
			},
		},
		["i:74252"] = { --Small Ethereal Shard
			minLevel = 85,
			maxLevel = 90,
			sourceInfo = {
				{itemType = ARMOR, rarity = 3, minItemLevel = 384, maxItemLevel = 429, amountOfMats = 1},
				{itemType = WEAPON, rarity = 3, minItemLevel = 384, maxItemLevel = 429, amountOfMats = 1},
			},
		},
		["i:74247"] = { -- Ethereal Shard
			minLevel = 85,
			maxLevel = 90,
			sourceInfo = {
				{itemType = ARMOR, rarity = 3, minItemLevel = 384, maxItemLevel = 429, amountOfMats = 0.33},
				{itemType = ARMOR, rarity = 3, minItemLevel = 430, maxItemLevel = 500, amountOfMats = 1},
				{itemType = WEAPON, rarity = 3, minItemLevel = 384, maxItemLevel = 429, amountOfMats = 0.33},
				{itemType = WEAPON, rarity = 3, minItemLevel = 430, maxItemLevel = 500, amountOfMats = 1},
			},
		},
		["i:111245"] = { -- Luminous Shard
			minLevel = 90,
			maxLevel = 100,
			sourceInfo = {
				{itemType = ARMOR, rarity = 3, minItemLevel = 505, maxItemLevel = 569, amountOfMats = 0.14},
				{itemType = ARMOR, rarity = 3, minItemLevel = 570, maxItemLevel = 680, amountOfMats = 0.14},
				{itemType = WEAPON, rarity = 3, minItemLevel = 505, maxItemLevel = 569, amountOfMats = 0.14},
				{itemType = WEAPON, rarity = 3, minItemLevel = 570, maxItemLevel = 680, amountOfMats = 0.14},
			},
		},
		["i:124441"] = { -- Leylight Shard
			minLevel = 101,
			maxLevel = 110,
			sourceInfo = {
				{itemType = ARMOR, rarity = 2, minItemLevel = 680, maxItemLevel = 810, amountOfMats = 0.001},
				{itemType = ARMOR, rarity = 3, minItemLevel = 680, maxItemLevel = 840, amountOfMats = 0.3},
			},
		},
	},
	{
		desc = L["Crystals"],
		["i:20725"] = { -- Nexus Crystal
			minLevel = 56,
			maxLevel = 60,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 56, maxItemLevel = 60, amountOfMats = 1.000},
				{itemType = ARMOR, rarity = 4, minItemLevel = 61, maxItemLevel = 94, amountOfMats = 1.5},
				{itemType = WEAPON, rarity = 4, minItemLevel = 56, maxItemLevel = 60, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 61, maxItemLevel = 94, amountOfMats = 1.5},
			},
		},
		["i:22450"] = { -- Void Crystal
			minLevel = 70,
			maxLevel = 70,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 95, maxItemLevel = 99, amountOfMats = 1},
				{itemType = ARMOR, rarity = 4, minItemLevel = 100, maxItemLevel = 164, amountOfMats = 1.5},
				{itemType = WEAPON, rarity = 4, minItemLevel = 95, maxItemLevel = 99, amountOfMats = 1},
				{itemType = WEAPON, rarity = 4, minItemLevel = 100, maxItemLevel = 164, amountOfMats = 1.5},
			},
		},
		["i:34057"] = { -- Abyss Crystal
			minLevel = 80,
			maxLevel = 80,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 165, maxItemLevel = 299, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 165, maxItemLevel = 299, amountOfMats = 1.000},
			},
		},
		["i:52722"] = { -- Maelstrom Crystal
			minLevel = 85,
			maxLevel = 85,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 300, maxItemLevel = 419, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 285, maxItemLevel = 419, amountOfMats = 1.000},
			},
		},
		["i:74248"] = { -- Sha Crystal
			minLevel = 85,
			maxLevel = 90,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 420, maxItemLevel = 600, amountOfMats = 1.000},
				{itemType = WEAPON, rarity = 4, minItemLevel = 420, maxItemLevel = 600, amountOfMats = 1.000},
			},
		},
		["i:115504"] = { -- Fractured Temporal Crystal
			minLevel = 90,
			maxLevel = 100,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 630, maxItemLevel = 735, amountOfMats = 5},
				{itemType = WEAPON, rarity = 4, minItemLevel = 630, maxItemLevel = 735, amountOfMats = 5},
			},
		},
		["i:113588"] = { -- Temporal Crystal
			minLevel = 90,
			maxLevel = 100,
			sourceInfo = {
				{itemType = ARMOR, rarity = 4, minItemLevel = 630, maxItemLevel = 735, amountOfMats = 0.13},
				{itemType = WEAPON, rarity = 4, minItemLevel = 630, maxItemLevel = 735, amountOfMats = 0.13},
			},
		},
		["i:124442"] = { -- Chaos Crystal
			minLevel = 101,
			maxLevel = 110,
			sourceInfo = {
				{itemType = ARMOR, rarity = 3, minItemLevel = 680, maxItemLevel = 840, amountOfMats = 0.003},
			},
		},
	},
}



-- ============================================================================
-- Static Pre-Defined Conversions
-- ============================================================================

TSM.STATIC_DATA.predefinedConversions = {
	-- ======================================= Common Pigments =======================================
	["i:39151"] = { -- Alabaster Pigment (Ivory / Moonglow Ink)
		{"i:765", 0.5, "mill"},
		{"i:2447", 0.5, "mill"},
		{"i:2449", 0.6, "mill"},
	},
	["i:39343"] = { -- Azure Pigment (Ink of the Sea)
		{"i:39969", 0.5, "mill"},
		{"i:36904", 0.5, "mill"},
		{"i:36907", 0.5, "mill"},
		{"i:36901", 0.5, "mill"},
		{"i:39970", 0.5, "mill"},
		{"i:37921", 0.5, "mill"},
		{"i:36905", 0.6, "mill"},
		{"i:36906", 0.6, "mill"},
		{"i:36903", 0.6, "mill"},
	},
	["i:61979"] = { -- Ashen Pigment (Blackfallow Ink)
		{"i:52983", 0.5, "mill"},
		{"i:52984", 0.5, "mill"},
		{"i:52985", 0.5, "mill"},
		{"i:52986", 0.5, "mill"},
		{"i:52987", 0.6, "mill"},
		{"i:52988", 0.6, "mill"},
	},
	["i:39334"] = { -- Dusky Pigment (Midnight Ink)
		{"i:785", 0.5, "mill"},
		{"i:2450", 0.5, "mill"},
		{"i:2452", 0.5, "mill"},
		{"i:2453", 0.6, "mill"},
		{"i:3820", 0.6, "mill"},
	},
	["i:39339"] = { -- Emerald Pigment (Jadefire Ink)
		{"i:3818", 0.5, "mill"},
		{"i:3821", 0.5, "mill"},
		{"i:3358", 0.6, "mill"},
		{"i:3819", 0.6, "mill"},
	},
	["i:39338"] = { -- Golden Pigment (Lion's Ink)
		{"i:3355", 0.5, "mill"},
		{"i:3369", 0.5, "mill"},
		{"i:3356", 0.6, "mill"},
		{"i:3357", 0.6, "mill"},
	},
	["i:39342"] = { -- Nether Pigment (Ethereal Ink)
		{"i:22785", 0.5, "mill"},
		{"i:22786", 0.5, "mill"},
		{"i:22787", 0.5, "mill"},
		{"i:22789", 0.5, "mill"},
		{"i:22790", 0.6, "mill"},
		{"i:22791", 0.6, "mill"},
		{"i:22792", 0.6, "mill"},
		{"i:22793", 0.6, "mill"},
	},
	["i:79251"] = { -- Shadow Pigment (Ink of Dreams)
		{"i:72237", 0.5, "mill"},
		{"i:72234", 0.5, "mill"},
		{"i:79010", 0.5, "mill"},
		{"i:72235", 0.5, "mill"},
		{"i:89639", 0.5, "mill"},
		{"i:79011", 0.6, "mill"},
	},
	["i:39341"] = { -- Silvery Pigment (Shimmering Ink)
		{"i:13463", 0.5, "mill"},
		{"i:13464", 0.5, "mill"},
		{"i:13465", 0.6, "mill"},
		{"i:13466", 0.6, "mill"},
		{"i:13467", 0.6, "mill"},
	},
	["i:39340"] = { -- Violet Pigment (Celestial Ink)
		{"i:4625", 0.5, "mill"},
		{"i:8831", 0.5, "mill"},
		{"i:8838", 0.5, "mill"},
		{"i:8839", 0.6, "mill"},
		{"i:8845", 0.6, "mill"},
		{"i:8846", 0.6, "mill"},
	},
	["i:114931"] = { -- Cerulean Pigment (Warbinder's Ink)
		{"i:109124", 0.42, "mill"},
		{"i:109125", 0.42, "mill"},
		{"i:109126", 0.42, "mill"},
		{"i:109127", 0.42, "mill"},
		{"i:109128", 0.42, "mill"},
		{"i:109129", 0.42, "mill"},
	},
	["i:129032"] = { -- Roseate Pigment (no legion ink)
		{"i:124101", 0.43, "mill"},
		{"i:124102", 0.59, "mill"},
		{"i:124103", 0.45, "mill"},
		{"i:124104", 0.45, "mill"},
		{"i:124105", 1.17, "mill"},
		{"i:124106", 0.43, "mill"},
		{"i:128304", 0.2, "mill"},
	},
	-- ======================================= Rare Pigments =======================================
	["i:43109"] = { -- Icy Pigment (Snowfall Ink)
		{"i:39969", 0.05, "mill"},
		{"i:36904", 0.05, "mill"},
		{"i:36907", 0.05, "mill"},
		{"i:36901", 0.05, "mill"},
		{"i:39970", 0.05, "mill"},
		{"i:37921", 0.05, "mill"},
		{"i:36905", 0.1, "mill"},
		{"i:36906", 0.1, "mill"},
		{"i:36903", 0.1, "mill"},
	},
	["i:61980"] = { -- Burning Embers (Inferno Ink)
		{"i:52983", 0.05, "mill"},
		{"i:52984", 0.05, "mill"},
		{"i:52985", 0.05, "mill"},
		{"i:52986", 0.05, "mill"},
		{"i:52987", 0.1, "mill"},
		{"i:52988", 0.1, "mill"},
	},
	["i:43104"] = { -- Burnt Pigment (Dawnstar Ink)
		{"i:3356", 0.1, "mill"},
		{"i:3357", 0.1, "mill"},
		{"i:3369", 0.05, "mill"},
		{"i:3355", 0.05, "mill"},
	},
	["i:43108"] = { -- Ebon Pigment (Darkflame Ink)
		{"i:22792", 0.1, "mill"},
		{"i:22790", 0.1, "mill"},
		{"i:22791", 0.1, "mill"},
		{"i:22793", 0.1, "mill"},
		{"i:22786", 0.05, "mill"},
		{"i:22785", 0.05, "mill"},
		{"i:22787", 0.05, "mill"},
		{"i:22789", 0.05, "mill"},
	},
	["i:43105"] = { -- Indigo Pigment (Royal Ink)
		{"i:3358", 0.1, "mill"},
		{"i:3819", 0.1, "mill"},
		{"i:3821", 0.05, "mill"},
		{"i:3818", 0.05, "mill"},
	},
	["i:79253"] = { -- Misty Pigment (Starlight Ink)
		{"i:72237", 0.05, "mill"},
		{"i:72234", 0.05, "mill"},
		{"i:79010", 0.05, "mill"},
		{"i:72235", 0.05, "mill"},
		{"i:79011", 0.1, "mill"},
		{"i:89639", 0.05, "mill"},
	},
	["i:43106"] = { -- Ruby Pigment (Fiery Ink)
		{"i:4625", 0.05, "mill"},
		{"i:8838", 0.05, "mill"},
		{"i:8831", 0.05, "mill"},
		{"i:8845", 0.1, "mill"},
		{"i:8846", 0.1, "mill"},
		{"i:8839", 0.1, "mill"},
	},
	["i:43107"] = { -- Sapphire Pigment (Ink of the Sky)
		{"i:13463", 0.05, "mill"},
		{"i:13464", 0.05, "mill"},
		{"i:13465", 0.1, "mill"},
		{"i:13466", 0.1, "mill"},
		{"i:13467", 0.1, "mill"},
	},
	["i:43103"] = { -- Sapphire Pigment (Ink of the Sky)
		{"i:2453", 0.1, "mill"},
		{"i:3820", 0.1, "mill"},
		{"i:2450", 0.05, "mill"},
		{"i:785", 0.05, "mill"},
		{"i:2452", 0.05, "mill"},
	},
	["i:129034"] = { -- Sallow Pigment (no legion ink)
		{"i:124101", 0.041, "mill"},
		{"i:124102", 0.058, "mill"},
		{"i:124103", 0.053, "mill"},
		{"i:124104", 0.041, "mill"},
		{"i:124105", 0.038, "mill"},
		{"i:124106", 2.225, "mill"},
		{"i:128304", 0.001, "mill"},
	},
	-- ======================================== Vanilla Gems =======================================
	["i:774"] = { -- Malachite
		{"i:2770", 0.1, "prospect"},
	},
	["i:818"] = { -- Tigerseye
		{"i:2770", 0.1, "prospect"},
	},
	["i:1210"] = {  -- Shadowgem
		{"i:2771", 0.08, "prospect"},
		{"i:2770", 0.02, "prospect"},
	},
	["i:1206"] = { -- Moss Agate
		{"i:2771", 0.06, "prospect"},
	},
	["i:1705"] = { -- Lesser Moonstone
		{"i:2771", 0.08, "prospect"},
		{"i:2772", 0.06, "prospect"},
	},
	["i:1529"] = { -- Jade
		{"i:2772", 0.08, "prospect"},
		{"i:2771", 0.006, "prospect"},
	},
	["i:3864"] = { -- Citrine
		{"i:2772", 0.08, "prospect"},
		{"i:3858", 0.06, "prospect"},
		{"i:2771", 0.006, "prospect"},
	},
	["i:7909"] = { -- Aquamarine
		{"i:3858", 0.06, "prospect"},
		{"i:2772", 0.01, "prospect"},
		{"i:2771", 0.006, "prospect"},
	},
	["i:7910"] = { -- Star Ruby
		{"i:3858", 0.08, "prospect"},
		{"i:10620", 0.02, "prospect"},
		{"i:2772", 0.01, "prospect"},
	},
	["i:12361"] = { -- Blue Sapphire
		{"i:10620", 0.06, "prospect"},
		{"i:3858", 0.006, "prospect"},
	},
	["i:12799"] = { -- Large Opal
		{"i:10620", 0.06, "prospect"},
		{"i:3858", 0.006, "prospect"},
	},
	["i:12800"] = { -- Azerothian Diamond
		{"i:10620", 0.06, "prospect"},
		{"i:3858", 0.004, "prospect"},
	},
	["i:12364"] = { -- Huge Emerald
		{"i:10620", 0.06, "prospect"},
		{"i:3858", 0.004, "prospect"},
	},
	-- ======================================== Uncommon Gems ======================================
	["i:23117"] = { -- Azure Moonstone
		{"i:23424", 0.04, "prospect"},
		{"i:23425", 0.04, "prospect"},
	},
	["i:23077"] = { -- Blood Garnet
		{"i:23424", 0.04, "prospect"},
		{"i:23425", 0.04, "prospect"},
	},
	["i:23079"] = { -- Deep Peridot
		{"i:23424", 0.04, "prospect"},
		{"i:23425", 0.04, "prospect"},
	},
	["i:21929"] = { -- Flame Spessarite
		{"i:23424", 0.04, "prospect"},
		{"i:23425", 0.04, "prospect"},
	},
	["i:23112"] = { -- Golden Draenite
		{"i:23424", 0.04, "prospect"},
		{"i:23425", 0.04, "prospect"},
	},
	["i:23107"] = { -- Shadow Draenite
		{"i:23424", 0.04, "prospect"},
		{"i:23425", 0.04, "prospect"},
	},
	["i:36917"] = { -- Bloodstone
		{"i:36909", 0.05, "prospect"},
		{"i:36912", 0.04, "prospect"},
		{"i:36910", 0.05, "prospect"},
	},
	["i:36923"] = { -- Chalcedony
		{"i:36909", 0.05, "prospect"},
		{"i:36912", 0.04, "prospect"},
		{"i:36910", 0.05, "prospect"},
	},
	["i:36932"] = { -- Dark Jade
		{"i:36909", 0.05, "prospect"},
		{"i:36912", 0.04, "prospect"},
		{"i:36910", 0.05, "prospect"},
	},
	["i:36929"] = { -- Huge Citrine
		{"i:36909", 0.05, "prospect"},
		{"i:36912", 0.04, "prospect"},
		{"i:36910", 0.05, "prospect"},
	},
	["i:36926"] = { -- Shadow Crystal
		{"i:36909", 0.05, "prospect"},
		{"i:36912", 0.04, "prospect"},
		{"i:36910", 0.05, "prospect"},
	},
	["i:36920"] = { -- Sun Crystal
		{"i:36909", 0.05, "prospect"},
		{"i:36912", 0.04, "prospect"},
		{"i:36910", 0.04, "prospect"},
	},
	["i:52182"] = { -- Jasper
		{"i:53038", 0.05, "prospect"},
		{"i:52185", 0.04, "prospect"},
		{"i:52183", 0.04, "prospect"},
	},
	["i:52180"] = { -- Nightstone
		{"i:53038", 0.05, "prospect"},
		{"i:52185", 0.04, "prospect"},
		{"i:52183", 0.04, "prospect"},
	},
	["i:52178"] = { -- Zephyrite
		{"i:53038", 0.05, "prospect"},
		{"i:52185", 0.04, "prospect"},
		{"i:52183", 0.04, "prospect"},
	},
	["i:52179"] = { -- Alicite
		{"i:53038", 0.05, "prospect"},
		{"i:52185", 0.04, "prospect"},
		{"i:52183", 0.04, "prospect"},
	},
	["i:52177"] = { -- Carnelian
		{"i:53038", 0.05, "prospect"},
		{"i:52185", 0.04, "prospect"},
		{"i:52183", 0.04, "prospect"},
	},
	["i:52181"] = { -- Hessonite
		{"i:53038", 0.05, "prospect"},
		{"i:52185", 0.04, "prospect"},
		{"i:52183", 0.04, "prospect"},
	},
	["i:76130"] = { -- Tiger Opal
		{"i:72092", 0.05, "prospect"},
		{"i:72093", 0.05, "prospect"},
		{"i:72103", 0.04, "prospect"},
		{"i:72094", 0.04, "prospect"},
	},
	["i:76133"] = { -- Lapis Lazuli
		{"i:72092", 0.05, "prospect"},
		{"i:72093", 0.05, "prospect"},
		{"i:72103", 0.04, "prospect"},
		{"i:72094", 0.04, "prospect"},
	},
	["i:76134"] = { -- Sunstone
		{"i:72092", 0.05, "prospect"},
		{"i:72093", 0.05, "prospect"},
		{"i:72103", 0.04, "prospect"},
		{"i:72094", 0.04, "prospect"},
	},
	["i:76135"] = { -- Roguestone
		{"i:72092", 0.05, "prospect"},
		{"i:72093", 0.05, "prospect"},
		{"i:72103", 0.04, "prospect"},
		{"i:72094", 0.04, "prospect"},
	},
	["i:76136"] = { -- Pandarian Garnet
		{"i:72092", 0.05, "prospect"},
		{"i:72093", 0.05, "prospect"},
		{"i:72103", 0.04, "prospect"},
		{"i:72094", 0.04, "prospect"},
	},
	["i:76137"] = { -- Alexandrite
		{"i:72092", 0.05, "prospect"},
		{"i:72093", 0.05, "prospect"},
		{"i:72103", 0.04, "prospect"},
		{"i:72094", 0.04, "prospect"},
	},
	["i:130172"] = { -- Sangrite
		{"i:123918", 0.008, "prospect"},
		{"i:123919", 0.008, "prospect"},
	},
	["i:130173"] = { -- Deep Amber
		{"i:123918", 0.01, "prospect"},
		{"i:123919", 0.01, "prospect"},
	},
	["i:130174"] = { -- Azsunite
		{"i:123918", 0.016, "prospect"},
		{"i:123919", 0.016, "prospect"},
	},
	["i:130175"] = { -- Chaotic Spinel
		{"i:123918", 0.006, "prospect"},
		{"i:123919", 0.006, "prospect"},
	},
	["i:130176"] = { -- Skystone
		{"i:123918", 0.012, "prospect"},
		{"i:123919", 0.012, "prospect"},
	},
	["i:130177"] = { -- Queen's Opal
		{"i:123918", 0.016, "prospect"},
		{"i:123919", 0.016, "prospect"},
	},
	["i:129100"] = { -- Gem Chip - mostly trash but limited use in some professions
		{"i:123918", 0.2, "prospect"},
		{"i:123919", 0.2, "prospect"},
	},
	-- ========================================== Rare Gems ========================================
	["i:23440"] = { -- Dawnstone
		{"i:23424", 0.002, "prospect"},
		{"i:23425", 0.008, "prospect"},
	},
	["i:23436"] = { -- Living Ruby
		{"i:23424", 0.002, "prospect"},
		{"i:23425", 0.008, "prospect"},
	},
	["i:23441"] = { -- Nightseye
		{"i:23424", 0.002, "prospect"},
		{"i:23425", 0.008, "prospect"},
	},
	["i:23439"] = { -- Noble Topaz
		{"i:23424", 0.002, "prospect"},
		{"i:23425", 0.008, "prospect"},
	},
	["i:23438"] = { -- Star of Elune
		{"i:23424", 0.002, "prospect"},
		{"i:23425", 0.008, "prospect"},
	},
	["i:23437"] = { -- Talasite
		{"i:23424", 0.002, "prospect"},
		{"i:23425", 0.008, "prospect"},
	},
	["i:36921"] = { -- Autumn's Glow
		{"i:36909", 0.002, "prospect"},
		{"i:36912", 0.008, "prospect"},
		{"i:36910", 0.008, "prospect"},
	},
	["i:36933"] = { -- Forest Emerald
		{"i:36909", 0.002, "prospect"},
		{"i:36912", 0.008, "prospect"},
		{"i:36910", 0.008, "prospect"},
	},
	["i:36930"] = { -- Monarch Topaz
		{"i:36909", 0.002, "prospect"},
		{"i:36912", 0.008, "prospect"},
		{"i:36910", 0.008, "prospect"},
	},
	["i:36918"] = { -- Scarlet Ruby
		{"i:36909", 0.002, "prospect"},
		{"i:36912", 0.008, "prospect"},
		{"i:36910", 0.008, "prospect"},
	},
	["i:36924"] = { -- Sky Sapphire
		{"i:36909", 0.002, "prospect"},
		{"i:36912", 0.008, "prospect"},
		{"i:36910", 0.008, "prospect"},
	},
	["i:36927"] = { -- Twilight Opal
		{"i:36909", 0.002, "prospect"},
		{"i:36912", 0.008, "prospect"},
		{"i:36910", 0.008, "prospect"},
	},
	["i:52192"] = { -- Dream Emerald
		{"i:53038", 0.016, "prospect"},
		{"i:52185", 0.01, "prospect"},
		{"i:52183", 0.008, "prospect"},
	},
	["i:52193"] = { -- Ember Topaz
		{"i:53038", 0.016, "prospect"},
		{"i:52185", 0.01, "prospect"},
		{"i:52183", 0.008, "prospect"},
	},
	["i:52190"] = { -- Inferno Ruby
		{"i:53038", 0.016, "prospect"},
		{"i:52185", 0.01, "prospect"},
		{"i:52183", 0.008, "prospect"},
	},
	["i:52195"] = { -- Amberjewel
		{"i:53038", 0.016, "prospect"},
		{"i:52185", 0.01, "prospect"},
		{"i:52183", 0.008, "prospect"},
	},
	["i:52194"] = { -- Demonseye
		{"i:53038", 0.016, "prospect"},
		{"i:52185", 0.01, "prospect"},
		{"i:52183", 0.008, "prospect"},
	},
	["i:52191"] = { -- Ocean Sapphire
		{"i:53038", 0.016, "prospect"},
		{"i:52185", 0.01, "prospect"},
		{"i:52183", 0.008, "prospect"},
	},
	["i:76131"] = { -- Primordial Ruby
		{"i:72092", 0.008, "prospect"},
		{"i:72093", 0.008, "prospect"},
		{"i:72103", 0.03, "prospect"},
		{"i:72094", 0.03, "prospect"},
	},
	["i:76138"] = { -- River's Heart
		{"i:72092", 0.008, "prospect"},
		{"i:72093", 0.008, "prospect"},
		{"i:72103", 0.03, "prospect"},
		{"i:72094", 0.03, "prospect"},
	},
	["i:76139"] = { -- Wild Jade
		{"i:72092", 0.008, "prospect"},
		{"i:72093", 0.008, "prospect"},
		{"i:72103", 0.03, "prospect"},
		{"i:72094", 0.03, "prospect"},
	},
	["i:76140"] = { -- Vermillion Onyx
		{"i:72092", 0.008, "prospect"},
		{"i:72093", 0.008, "prospect"},
		{"i:72103", 0.03, "prospect"},
		{"i:72094", 0.03, "prospect"},
	},
	["i:76141"] = { -- Imperial Amethyst
		{"i:72092", 0.008, "prospect"},
		{"i:72093", 0.008, "prospect"},
		{"i:72103", 0.03, "prospect"},
		{"i:72094", 0.03, "prospect"},
	},
	["i:76142"] = { -- Sun's Radiance
		{"i:72092", 0.008, "prospect"},
		{"i:72093", 0.008, "prospect"},
		{"i:72103", 0.03, "prospect"},
		{"i:72094", 0.03, "prospect"},
	},
	["i:130178"] = { -- FuryStone
		{"i:123918", 0.002, "prospect"},
		{"i:123919", 0.002, "prospect"},
	},
	["i:130179"] = { -- Eye of Prophecy
		{"i:123918", 0.002, "prospect"},
		{"i:123919", 0.002, "prospect"},
	},
	["i:130180"] = { -- Dawnlight
		{"i:123918", 0.002, "prospect"},
		{"i:123919", 0.002, "prospect"},
	},
	["i:130181"] = { -- Pandemonite
		{"i:123918", 0.002, "prospect"},
		{"i:123919", 0.002, "prospect"},
	},
	["i:130182"] = { -- Maelstrom Sapphire
		{"i:123918", 0.002, "prospect"},
		{"i:123919", 0.002, "prospect"},
	},
	["i:130183"] = { -- Shadowruby
		{"i:123918", 0.002, "prospect"},
		{"i:123919", 0.002, "prospect"},
	},
	-- =========================================== Essences ========================================
	["i:52719"] = {{"i:52718", 1/3, "transform"}}, -- Celestial Essence
	["i:52718"] = {{"i:52719", 3, "transform"}}, -- Celestial Essence
	["i:34055"] = {{"i:34056", 1/3, "transform"}}, -- Cosmic Essence
	["i:34056"] = {{"i:34055", 3, "transform"}}, -- Cosmic Essence
	["i:22446"] = {{"i:22447", 1/3, "transform"}}, -- Planar Essence
	["i:22447"] = {{"i:22446", 3, "transform"}}, -- Planar Essence
	["i:16203"] = {{"i:16202", 1/3, "transform"}}, -- Eternal Essence
	["i:16202"] = {{"i:16203", 3, "transform"}}, -- Eternal Essence
	["i:11175"] = {{"i:11174", 1/3, "transform"}}, -- Nether Essence
	["i:11174"] = {{"i:11175", 3, "transform"}}, -- Nether Essence
	["i:11135"] = {{"i:11134", 1/3, "transform"}}, -- Mystic Essence
	["i:11134"] = {{"i:11135", 3, "transform"}}, -- Mystic Essence
	["i:11082"] = {{"i:10998", 1/3, "transform"}}, -- Astral Essence
	["i:10998"] = {{"i:11082", 3, "transform"}}, -- Astral Essence
	["i:10939"] = {{"i:10938", 1/3, "transform"}}, -- Magic Essence
	["i:10938"] = {{"i:10939", 3, "transform"}}, -- Magic Essence
	-- ============================================ Shards =========================================
	["i:52721"] = {{"i:52720", 1/3, "transform"}}, -- Heavenly Shard
	["i:34052"] = {{"i:34053", 1/3, "transform"}}, -- Dream Shard
	["i:74247"] = {{"i:74252", 1/3, "transform"}}, -- Ethereal Shard
	["i:111245"] = {{"i:115502", 0.1, "transform"}}, -- Luminous Shard
	-- =========================================== Crystals ========================================
	["i:113588"] = {{"i:115504", 0.1, "transform"}}, -- Temporal Crystal
	-- ======================================== Primals / Motes ====================================
	["i:21885"] = {{"i:22578", 0.1, "transform"}}, -- Water
	["i:22456"] = {{"i:22577", 0.1, "transform"}}, -- Shadow
	["i:22457"] = {{"i:22576", 0.1, "transform"}}, -- Mana
	["i:21886"] = {{"i:22575", 0.1, "transform"}}, -- Life
	["i:21884"] = {{"i:22574", 0.1, "transform"}}, -- Fire
	["i:22452"] = {{"i:22573", 0.1, "transform"}}, -- Earth
	["i:22451"] = {{"i:22572", 0.1, "transform"}}, -- Air
	-- ===================================== Crystalized / Eternal =================================
	["i:37700"] = {{"i:35623", 10, "transform"}}, -- Air
	["i:35623"] = {{"i:37700", 0.1, "transform"}}, -- Air
	["i:37701"] = {{"i:35624", 10, "transform"}}, -- Earth
	["i:35624"] = {{"i:37701", 0.1, "transform"}}, -- Earth
	["i:37702"] = {{"i:36860", 10, "transform"}}, -- Fire
	["i:36860"] = {{"i:37702", 0.1, "transform"}}, -- Fire
	["i:37703"] = {{"i:35627", 10, "transform"}}, -- Shadow
	["i:35627"] = {{"i:37703", 0.1, "transform"}}, -- Shadow
	["i:37704"] = {{"i:35625", 10, "transform"}}, -- Life
	["i:35625"] = {{"i:37704", 0.1, "transform"}}, -- Life
	["i:37705"] = {{"i:35622", 10, "transform"}}, -- Water
	["i:35622"] = {{"i:37705", 0.1, "transform"}}, -- Water
	-- ========================================= Wod Fish ==========================================
	["i:109137"] = {
		{"i:111601", 4, "transform"}, -- Enormous Crescent Saberfish
		{"i:111595", 2, "transform"}, -- Crescent Saberfish
		{"i:111589", 1, "transform"}, -- Small Crescent Saberfish
	},
	["i:109138"] = {
		{"i:111676", 4, "transform"}, -- Enormous Jawless Skulker
		{"i:111669", 2, "transform"}, -- Jawless Skulker
		{"i:111650", 1, "transform"}, -- Small Jawless Skulker
	},
	["i:109139"] = {
		{"i:111675", 4, "transform"}, -- Enormous Fat Sleeper
		{"i:111668", 2, "transform"}, -- Fat Sleeper
		{"i:111651", 1, "transform"}, -- Small Fat Sleeper
	},
	["i:109140"] = {
		{"i:111674", 4, "transform"}, -- Enormous Blind Lake Sturgeon
		{"i:111667", 2, "transform"}, -- Blind Lake Sturgeon
		{"i:111652", 1, "transform"}, -- Small Blind Lake Sturgeon
	},
	["i:109141"] = {
		{"i:111673", 4, "transform"}, -- Enormous Fire Ammonite
		{"i:111666", 2, "transform"}, -- Fire Ammonite
		{"i:111656", 1, "transform"}, -- Small Fire Ammonite
	},
	["i:109142"] = {
		{"i:111672", 4, "transform"}, -- Enormous Sea Scorpion
		{"i:111665", 2, "transform"}, -- Sea Scorpion
		{"i:111658", 1, "transform"}, -- Small Sea Scorpion
	},
	["i:109143"] = {
		{"i:111671", 4, "transform"}, -- Enormous Abyssal Gulper Eel
		{"i:111664", 2, "transform"}, -- Abyssal Gulper Eel
		{"i:111659", 1, "transform"}, -- Small Abyssal Gulper Eel
	},
	["i:109144"] = {
		{"i:111670", 4, "transform"}, -- Enormous Blackwater Whiptail
		{"i:111663", 2, "transform"}, -- Blackwater Whiptail
		{"i:111662", 1, "transform"}, -- Small Blackwater Whiptail
	},
	-- ========================================== Ore Nuggets =======================================
	["i:2771"] = {{"i:108295", 0.1, "transform"}},   -- Tin Ore
	["i:2772"] = {{"i:108297", 0.1, "transform"}},   -- Iron Ore
	["i:2775"] = {{"i:108294", 0.1, "transform"}},   -- Silver Ore
	["i:2776"] = {{"i:108296", 0.1, "transform"}},   -- Gold Ore
	["i:3858"] = {{"i:108300", 0.1, "transform"}},   -- Mithril Ore
	["i:7911"] = {{"i:108299", 0.1, "transform"}},   -- Truesilver Ore
	["i:10620"] = {{"i:108298", 0.1, "transform"}},  -- Thorium Ore
	["i:23424"] = {{"i:108301", 0.1, "transform"}},  -- Fel Iron Ore
	["i:23425"] = {{"i:108302", 0.1, "transform"}},  -- Adamantite Ore
	["i:23426"] = {{"i:108304", 0.1, "transform"}},  -- Khorium Ore
	["i:23427"] = {{"i:108303", 0.1, "transform"}},  -- Eternium Ore
	["i:36909"] = {{"i:108305", 0.1, "transform"}},  -- Cobalt Ore
	["i:36910"] = {{"i:108391", 0.1, "transform"}},  -- Titanium Ore
	["i:36912"] = {{"i:108306", 0.1, "transform"}},  -- Saronite Ore
	["i:52183"] = {{"i:108309", 0.1, "transform"}},  -- Pyrite Ore
	["i:52185"] = {{"i:108308", 0.1, "transform"}},  -- Elementium Ore
	["i:53038"] = {{"i:108307", 0.1, "transform"}},  -- Obsidium Ore
	["i:72092"] = {{"i:97512", 0.1, "transform"}},   -- Ghost Iron Ore
	["i:109119"] = {{"i:109991", 0.1, "transform"}}, -- True Iron Ore
	-- =========================================== Herb Parts ======================================
	["i:2449"] = {{"i:108319", 0.1, "transform"}}, -- Earthroot
	-- ========================================= Vendor Trades =====================================
	["i:37101"] = {{"i:129032", 1, "vendortrade"}},   -- Ivory Ink
	["i:39469"] = {{"i:129032", 1, "vendortrade"}},   -- Moonglow Ink
	["i:39774"] = {{"i:129032", 1, "vendortrade"}},   -- Midnight Ink
	["i:43116"] = {{"i:129032", 1, "vendortrade"}},   -- Lion's Ink
	["i:43118"] = {{"i:129032", 1, "vendortrade"}},   -- Jadefire Ink
	["i:43120"] = {{"i:129032", 1, "vendortrade"}},   -- Celestial Ink
	["i:43122"] = {{"i:129032", 1, "vendortrade"}},   -- Shimmering Ink
	["i:43124"] = {{"i:129032", 1, "vendortrade"}},   -- Ethereal Ink
	["i:43126"] = {{"i:129032", 1, "vendortrade"}},   -- Ink of the Sea
	["i:43127"] = {{"i:129032", 0.1, "vendortrade"}}, -- Snowfall Ink
	["i:61978"] = {{"i:129032", 1, "vendortrade"}},   -- Blackfallow Ink
	["i:61981"] = {{"i:129032", 0.1, "vendortrade"}}, -- Inferno Ink
	["i:79254"] = {{"i:129032", 1, "vendortrade"}},   -- Ink of Dreams
	["i:79255"] = {{"i:129032", 0.1, "vendortrade"}}, -- Starlight Ink
	["i:113111"] = {{"i:129032", 1, "vendortrade"}},  -- Warbinder's Ink
}



-- ============================================================================
-- Static Pre-Defined Conversions
-- ============================================================================

TSM.STATIC_DATA.importantBonusIdMap = {
	[1] = 1,
	[2] = 2,
	[15] = 15,
	[44] = 44,
	[171] = 171,
	[448] = 448,
	[449] = 449,
	[450] = 450,
	[451] = 451,
	[497] = 497,
	[498] = 498,
	[499] = 499,
	[518] = 518,
	[519] = 519,
	[520] = 520,
	[521] = 521,
	[522] = 522,
	[524] = 524,
	[525] = 525,
	[526] = 526,
	[527] = 527,
	[545] = 545,
	[546] = 546,
	[547] = 547,
	[552] = 552,
	[553] = 553,
	[554] = 554,
	[555] = 555,
	[556] = 556,
	[557] = 557,
	[558] = 558,
	[559] = 559,
	[560] = 560,
	[561] = 561,
	[562] = 562,
	[566] = 566,
	[567] = 567,
	[569] = 569,
	[570] = 570,
	[571] = 571,
	[573] = 573,
	[575] = 575,
	[576] = 576,
	[577] = 577,
	[579] = 579,
	[584] = 584,
	[585] = 585,
	[586] = 586,
	[587] = 587,
	[588] = 588,
	[589] = 589,
	[590] = 590,
	[591] = 591,
	[592] = 592,
	[593] = 593,
	[594] = 594,
	[595] = 595,
	[596] = 596,
	[597] = 597,
	[598] = 598,
	[599] = 599,
	[602] = 602,
	[609] = 609,
	[615] = 615,
	[617] = 617,
	[618] = 618,
	[619] = 619,
	[620] = 620,
	[622] = 622,
	[623] = 623,
	[624] = 624,
	[625] = 625,
	[626] = 626,
	[627] = 627,
	[628] = 628,
	[629] = 629,
	[630] = 630,
	[631] = 631,
	[632] = 632,
	[633] = 633,
	[634] = 634,
	[635] = 635,
	[636] = 636,
	[637] = 637,
	[638] = 638,
	[639] = 639,
	[640] = 640,
	[641] = 641,
	[642] = 642,
	[644] = 644,
	[645] = 645,
	[646] = 646,
	[648] = 648,
	[651] = 651,
	[652] = 652,
	[653] = 653,
	[656] = 656,
	[657] = 657,
	[664] = 664,
	[665] = 665,
	[666] = 666,
	[667] = 667,
	[668] = 668,
	[669] = 669,
	[670] = 670,
	[671] = 671,
	[672] = 672,
	[673] = 673,
	[674] = 674,
	[675] = 675,
	[676] = 676,
	[677] = 677,
	[678] = 678,
	[679] = 679,
	[680] = 680,
	[681] = 681,
	[682] = 682,
	[692] = 692,
	[694] = 694,
	[695] = 695,
	[696] = 696,
	[697] = 697,
	[698] = 698,
	[699] = 699,
	[700] = 700,
	[701] = 701,
	[702] = 702,
	[703] = 703,
	[704] = 704,
	[706] = 706,
	[707] = 707,
	[708] = 708,
	[709] = 709,
	[710] = 710,
	[720] = 720,
	[754] = 754,
	[755] = 755,
	[756] = 756,
	[757] = 757,
	[758] = 758,
	[759] = 759,
	[760] = 760,
	[761] = 761,
	[762] = 762,
	[763] = 763,
	[764] = 764,
	[765] = 765,
	[766] = 766,
	[767] = 767,
	[768] = 768,
	[769] = 769,
	[1372] = 1372,
	[1373] = 1373,
	[1374] = 1374,
	[1375] = 1375,
	[1376] = 1376,
	[1377] = 1377,
	[1378] = 1378,
	[1379] = 1379,
	[1380] = 1380,
	[1381] = 1381,
	[1382] = 1382,
	[1383] = 1383,
	[1384] = 1384,
	[1385] = 1385,
	[1386] = 1386,
	[1387] = 1387,
	[1388] = 1388,
	[1389] = 1389,
	[1390] = 1390,
	[1391] = 1391,
	[1392] = 1392,
	[1393] = 1393,
	[1394] = 1394,
	[1395] = 1395,
	[1396] = 1396,
	[1397] = 1397,
	[1398] = 1398,
	[1399] = 1399,
	[1400] = 1400,
	[1401] = 1401,
	[1402] = 1402,
	[1403] = 1403,
	[1404] = 1404,
	[1405] = 1405,
	[1406] = 1406,
	[1407] = 1407,
	[1408] = 1408,
	[1409] = 1409,
	[1410] = 1410,
	[1411] = 1411,
	[1412] = 1412,
	[1413] = 1413,
	[1414] = 1414,
	[1415] = 1415,
	[1416] = 1416,
	[1417] = 1417,
	[1418] = 1418,
	[1419] = 1419,
	[1420] = 1420,
	[1421] = 1421,
	[1422] = 1422,
	[1423] = 1423,
	[1424] = 1424,
	[1425] = 1425,
	[1426] = 1426,
	[1427] = 1427,
	[1428] = 1428,
	[1429] = 1429,
	[1430] = 1430,
	[1431] = 1431,
	[1432] = 1432,
	[1433] = 1433,
	[1434] = 1434,
	[1435] = 1435,
	[1436] = 1436,
	[1437] = 1437,
	[1438] = 1438,
	[1439] = 1439,
	[1440] = 1440,
	[1441] = 1441,
	[1442] = 1442,
	[1443] = 1443,
	[1444] = 1444,
	[1445] = 1445,
	[1446] = 1446,
	[1447] = 1447,
	[1448] = 1448,
	[1449] = 1449,
	[1450] = 1450,
	[1451] = 1451,
	[1452] = 1452,
	[1453] = 1453,
	[1454] = 1454,
	[1455] = 1455,
	[1456] = 1456,
	[1457] = 1457,
	[1458] = 1458,
	[1459] = 1459,
	[1460] = 1460,
	[1461] = 1461,
	[1462] = 1462,
	[1463] = 1463,
	[1464] = 1464,
	[1465] = 1465,
	[1466] = 1466,
	[1467] = 1467,
	[1468] = 1468,
	[1469] = 1469,
	[1470] = 1470,
	[1471] = 1471,
	[1472] = 1472,
	[1473] = 1473,
	[1474] = 1474,
	[1475] = 1475,
	[1476] = 1476,
	[1477] = 1477,
	[1478] = 1478,
	[1479] = 1479,
	[1480] = 1480,
	[1481] = 1481,
	[1482] = 1482,
	[1483] = 1483,
	[1484] = 1484,
	[1485] = 1485,
	[1486] = 1486,
	[1487] = 1487,
	[1488] = 1488,
	[1489] = 1489,
	[1490] = 1490,
	[1491] = 1491,
	[1492] = 1492,
	[1493] = 1493,
	[1494] = 1494,
	[1495] = 1495,
	[1496] = 1496,
	[1497] = 1497,
	[1498] = 1498,
	[1499] = 1499,
	[1500] = 1500,
	[1501] = 1501,
	[1502] = 1502,
	[1503] = 1503,
	[1504] = 1504,
	[1505] = 1505,
	[1506] = 1506,
	[1507] = 1507,
	[1508] = 1508,
	[1509] = 1509,
	[1510] = 1510,
	[1511] = 1511,
	[1512] = 1512,
	[1513] = 1513,
	[1514] = 1514,
	[1515] = 1515,
	[1516] = 1516,
	[1517] = 1517,
	[1518] = 1518,
	[1519] = 1519,
	[1520] = 1520,
	[1521] = 1521,
	[1522] = 1522,
	[1523] = 1523,
	[1524] = 1524,
	[1525] = 1525,
	[1526] = 1526,
	[1527] = 1527,
	[1528] = 1528,
	[1529] = 1529,
	[1530] = 1530,
	[1531] = 1531,
	[1532] = 1532,
	[1533] = 1533,
	[1534] = 1534,
	[1535] = 1535,
	[1536] = 1536,
	[1537] = 1537,
	[1538] = 1538,
	[1539] = 1539,
	[1540] = 1540,
	[1541] = 1541,
	[1542] = 1542,
	[1543] = 1543,
	[1544] = 1544,
	[1545] = 1545,
	[1546] = 1546,
	[1547] = 1547,
	[1548] = 1548,
	[1549] = 1549,
	[1550] = 1550,
	[1551] = 1551,
	[1552] = 1552,
	[1553] = 1553,
	[1554] = 1554,
	[1555] = 1555,
	[1556] = 1556,
	[1557] = 1557,
	[1558] = 1558,
	[1559] = 1559,
	[1560] = 1560,
	[1561] = 1561,
	[1562] = 1562,
	[1563] = 1563,
	[1564] = 1564,
	[1565] = 1565,
	[1566] = 1566,
	[1567] = 1567,
	[1568] = 1568,
	[1569] = 1569,
	[1570] = 1570,
	[1571] = 1571,
	[1572] = 1572,
	[1573] = 1573,
	[1574] = 1574,
	[1575] = 1575,
	[1576] = 1576,
	[1577] = 1577,
	[1578] = 1578,
	[1579] = 1579,
	[1580] = 1580,
	[1581] = 1581,
	[1582] = 1582,
	[1583] = 1583,
	[1584] = 1584,
	[1585] = 1585,
	[1586] = 1586,
	[1587] = 1587,
	[1588] = 1588,
	[1589] = 1589,
	[1590] = 1590,
	[1591] = 1591,
	[1592] = 1592,
	[1593] = 1593,
	[1594] = 1594,
	[1595] = 1595,
	[1596] = 1596,
	[1597] = 1597,
	[1598] = 1598,
	[1599] = 1599,
	[1600] = 1600,
	[1601] = 1601,
	[1602] = 1602,
	[1603] = 1603,
	[1604] = 1604,
	[1605] = 1605,
	[1606] = 1606,
	[1607] = 1607,
	[1608] = 1608,
	[1609] = 1609,
	[1610] = 1610,
	[1611] = 1611,
	[1612] = 1612,
	[1613] = 1613,
	[1614] = 1614,
	[1615] = 1615,
	[1616] = 1616,
	[1617] = 1617,
	[1618] = 1618,
	[1619] = 1619,
	[1620] = 1620,
	[1621] = 1621,
	[1622] = 1622,
	[1623] = 1623,
	[1624] = 1624,
	[1625] = 1625,
	[1626] = 1626,
	[1627] = 1627,
	[1628] = 1628,
	[1629] = 1629,
	[1630] = 1630,
	[1631] = 1631,
	[1632] = 1632,
	[1633] = 1633,
	[1634] = 1634,
	[1635] = 1635,
	[1636] = 1636,
	[1637] = 1637,
	[1638] = 1638,
	[1639] = 1639,
	[1640] = 1640,
	[1641] = 1641,
	[1642] = 1642,
	[1643] = 1643,
	[1644] = 1644,
	[1645] = 1645,
	[1646] = 1646,
	[1647] = 1647,
	[1648] = 1648,
	[1649] = 1649,
	[1650] = 1650,
	[1651] = 1651,
	[1652] = 1652,
	[1653] = 1653,
	[1654] = 1654,
	[1655] = 1655,
	[1656] = 1656,
	[1657] = 1657,
	[1658] = 1658,
	[1659] = 1659,
	[1660] = 1660,
	[1661] = 1661,
	[1662] = 1662,
	[1663] = 1663,
	[1664] = 1664,
	[1665] = 1665,
	[1666] = 1666,
	[1667] = 1667,
	[1668] = 1668,
	[1669] = 1669,
	[1670] = 1670,
	[1671] = 1671,
	[1672] = 1672,
	[1673] = 1673,
	[1674] = 1674,
	[1675] = 1675,
	[1723] = 1723,
	[1724] = 1724,
	[1725] = 1725,
	[1726] = 1726,
	[1727] = 1727,
	[1729] = 1729,
	[1730] = 1730,
	[1731] = 1731,
	[1732] = 1732,
	[1733] = 1733,
	[1734] = 1734,
	[1735] = 1735,
	[1736] = 1736,
	[1737] = 1737,
	[1738] = 1738,
	[1739] = 1739,
	[1740] = 1740,
	[1741] = 1741,
	[1788] = 1788,
	[1789] = 1789,
	[1790] = 1790,
	[1791] = 1791,
	[1792] = 1792,
	[1793] = 1793,
	[1794] = 1794,
	[1795] = 1795,
	[1796] = 1796,
	[1798] = 1798,
	[1799] = 1799,
	[1800] = 1800,
	[1801] = 1801,
	[1805] = 1805,
	[1806] = 1806,
	[1807] = 1807,
	[1810] = 1810,
	[1812] = 1812,
	[1813] = 1813,
	[1816] = 1816,
	[1817] = 1817,
	[1818] = 1818,
	[1819] = 1819,
	[1820] = 1820,
	[1822] = 1822,
	[1823] = 1823,
	[1824] = 1824,
	[1825] = 1825,
	[1826] = 1826,
	[2829] = 2829,
	[2830] = 2830,
	[2831] = 2831,
	[2832] = 2832,
	[2833] = 2833,
	[2834] = 2834,
	[2835] = 2835,
	[2836] = 2836,
	[2837] = 2837,
	[2838] = 2838,
	[2839] = 2839,
	[2840] = 2840,
	[2841] = 2841,
	[2842] = 2842,
	[2843] = 2843,
	[2844] = 2844,
	[2845] = 2845,
	[2846] = 2846,
	[2847] = 2847,
	[2848] = 2848,
	[2849] = 2849,
	[2850] = 2850,
	[2851] = 2851,
	[2852] = 2852,
	[2853] = 2853,
	[2854] = 2854,
	[2855] = 2855,
	[2856] = 2856,
	[2857] = 2857,
	[2858] = 2858,
	[2859] = 2859,
	[2860] = 2860,
	[2861] = 2861,
	[2862] = 2862,
	[2863] = 2863,
	[2864] = 2864,
	[2865] = 2865,
	[2866] = 2866,
	[2867] = 2867,
	[2868] = 2868,
	[2869] = 2869,
	[2870] = 2870,
	[2871] = 2871,
	[2872] = 2872,
	[2873] = 2873,
	[2874] = 2874,
	[2875] = 2875,
	[2876] = 2876,
	[2877] = 2877,
	[2878] = 2878,
	[2879] = 2879,
	[2880] = 2880,
	[2881] = 2881,
	[2882] = 2882,
	[2883] = 2883,
	[2884] = 2884,
	[2885] = 2885,
	[2886] = 2886,
	[2887] = 2887,
	[2888] = 2888,
	[2889] = 2889,
	[2890] = 2890,
	[2891] = 2891,
	[2892] = 2892,
	[2893] = 2893,
	[2894] = 2894,
	[2895] = 2895,
	[2896] = 2896,
	[2897] = 2897,
	[2898] = 2898,
	[2899] = 2899,
	[2900] = 2900,
	[2901] = 2901,
	[2902] = 2902,
	[2903] = 2903,
	[2904] = 2904,
	[2905] = 2905,
	[2906] = 2906,
	[2907] = 2907,
	[2908] = 2908,
	[2909] = 2909,
	[2910] = 2910,
	[2911] = 2911,
	[2912] = 2912,
	[2913] = 2913,
	[2914] = 2914,
	[2915] = 2915,
	[2916] = 2916,
	[2917] = 2917,
	[2918] = 2918,
	[2919] = 2919,
	[2920] = 2920,
	[2921] = 2921,
	[2922] = 2922,
	[2923] = 2923,
	[2924] = 2924,
	[2925] = 2925,
	[2926] = 2926,
	[2927] = 2927,
	[2928] = 2928,
	[2929] = 2929,
	[2930] = 2930,
	[2931] = 2931,
	[2932] = 2932,
	[2933] = 2933,
	[2934] = 2934,
	[2935] = 2935,
	[2936] = 2936,
	[2937] = 2937,
	[2938] = 2938,
	[2939] = 2939,
	[2940] = 2940,
	[2941] = 2941,
	[2942] = 2942,
	[2943] = 2943,
	[2944] = 2944,
	[2945] = 2945,
	[2946] = 2946,
	[2947] = 2947,
	[2948] = 2948,
	[2949] = 2949,
	[2950] = 2950,
	[2951] = 2951,
	[2952] = 2952,
	[2953] = 2953,
	[2954] = 2954,
	[2955] = 2955,
	[2956] = 2956,
	[2957] = 2957,
	[2958] = 2958,
	[2959] = 2959,
	[2960] = 2960,
	[2961] = 2961,
	[2962] = 2962,
	[2963] = 2963,
	[2964] = 2964,
	[2965] = 2965,
	[2966] = 2966,
	[2967] = 2967,
	[2968] = 2968,
	[2969] = 2969,
	[2970] = 2970,
	[2971] = 2971,
	[2972] = 2972,
	[2973] = 2973,
	[2974] = 2974,
	[2975] = 2975,
	[2976] = 2976,
	[2977] = 2977,
	[2978] = 2978,
	[2979] = 2979,
	[2980] = 2980,
	[2981] = 2981,
	[2982] = 2982,
	[2983] = 2983,
	[2984] = 2984,
	[2985] = 2985,
	[2986] = 2986,
	[2987] = 2987,
	[2988] = 2988,
	[2989] = 2989,
	[2990] = 2990,
	[2991] = 2991,
	[2992] = 2992,
	[2993] = 2993,
	[2994] = 2994,
	[2995] = 2995,
	[2996] = 2996,
	[2997] = 2997,
	[2998] = 2998,
	[2999] = 2999,
	[3000] = 3000,
	[3001] = 3001,
	[3002] = 3002,
	[3003] = 3003,
	[3004] = 3004,
	[3005] = 3005,
	[3006] = 3006,
	[3007] = 3007,
	[3008] = 3008,
	[3009] = 3009,
	[3010] = 3010,
	[3011] = 3011,
	[3012] = 3012,
	[3013] = 3013,
	[3014] = 3014,
	[3015] = 3015,
	[3016] = 3016,
	[3017] = 3017,
	[3018] = 3018,
	[3019] = 3019,
	[3020] = 3020,
	[3021] = 3021,
	[3022] = 3022,
	[3023] = 3023,
	[3024] = 3024,
	[3025] = 3025,
	[3026] = 3026,
	[3027] = 3027,
	[3028] = 3028,
	[3029] = 3029,
	[3030] = 3030,
	[3031] = 3031,
	[3032] = 3032,
	[3033] = 3033,
	[3034] = 3034,
	[3035] = 3035,
	[3036] = 3036,
	[3037] = 3037,
	[3038] = 3038,
	[3039] = 3039,
	[3040] = 3040,
	[3041] = 3041,
	[3042] = 3042,
	[3043] = 3043,
	[3044] = 3044,
	[3045] = 3045,
	[3046] = 3046,
	[3047] = 3047,
	[3048] = 3048,
	[3049] = 3049,
	[3050] = 3050,
	[3051] = 3051,
	[3052] = 3052,
	[3053] = 3053,
	[3054] = 3054,
	[3055] = 3055,
	[3056] = 3056,
	[3057] = 3057,
	[3058] = 3058,
	[3059] = 3059,
	[3060] = 3060,
	[3061] = 3061,
	[3062] = 3062,
	[3063] = 3063,
	[3064] = 3064,
	[3065] = 3065,
	[3066] = 3066,
	[3067] = 3067,
	[3068] = 3068,
	[3069] = 3069,
	[3070] = 3070,
	[3071] = 3071,
	[3072] = 3072,
	[3073] = 3073,
	[3074] = 3074,
	[3075] = 3075,
	[3076] = 3076,
	[3077] = 3077,
	[3078] = 3078,
	[3079] = 3079,
	[3080] = 3080,
	[3081] = 3081,
	[3082] = 3082,
	[3083] = 3083,
	[3084] = 3084,
	[3085] = 3085,
	[3086] = 3086,
	[3087] = 3087,
	[3088] = 3088,
	[3089] = 3089,
	[3090] = 3090,
	[3091] = 3091,
	[3092] = 3092,
	[3093] = 3093,
	[3094] = 3094,
	[3095] = 3095,
	[3096] = 3096,
	[3097] = 3097,
	[3098] = 3098,
	[3099] = 3099,
	[3100] = 3100,
	[3101] = 3101,
	[3102] = 3102,
	[3103] = 3103,
	[3104] = 3104,
	[3105] = 3105,
	[3106] = 3106,
	[3107] = 3107,
	[3108] = 3108,
	[3109] = 3109,
	[3110] = 3110,
	[3111] = 3111,
	[3112] = 3112,
	[3113] = 3113,
	[3114] = 3114,
	[3115] = 3115,
	[3116] = 3116,
	[3117] = 3117,
	[3118] = 3118,
	[3119] = 3119,
	[3120] = 3120,
	[3121] = 3121,
	[3122] = 3122,
	[3123] = 3123,
	[3124] = 3124,
	[3125] = 3125,
	[3126] = 3126,
	[3127] = 3127,
	[3128] = 3128,
	[3130] = 3130,
	[3131] = 3131,
	[3132] = 3132,
	[3133] = 3133,
	[3134] = 3134,
	[3135] = 3135,
	[3136] = 3136,
	[3137] = 3137,
	[3138] = 3138,
	[3139] = 3139,
	[3140] = 3140,
	[3141] = 3141,
	[3142] = 3142,
	[3143] = 3143,
	[3144] = 3144,
	[3145] = 3145,
	[3146] = 3146,
	[3147] = 3147,
	[3148] = 3148,
	[3149] = 3149,
	[3150] = 3150,
	[3151] = 3151,
	[3152] = 3152,
	[3153] = 3153,
	[3154] = 3154,
	[3155] = 3155,
	[3156] = 3156,
	[3157] = 3157,
	[3158] = 3158,
	[3159] = 3159,
	[3160] = 3160,
	[3161] = 3161,
	[3162] = 3162,
	[3163] = 3163,
	[3164] = 3164,
	[3165] = 3165,
	[3166] = 3166,
	[3167] = 3167,
	[3168] = 3168,
	[3169] = 3169,
	[3170] = 3170,
	[3171] = 3171,
	[3172] = 3172,
	[3173] = 3173,
	[3174] = 3174,
	[3175] = 3175,
	[3176] = 3176,
	[3177] = 3177,
	[3178] = 3178,
	[3179] = 3179,
	[3180] = 3180,
	[3181] = 3181,
	[3182] = 3182,
	[3183] = 3183,
	[3184] = 3184,
	[3185] = 3185,
	[3186] = 3186,
	[3187] = 3187,
	[3188] = 3188,
	[3189] = 3189,
	[3190] = 3190,
	[3191] = 3191,
	[3192] = 3192,
	[3193] = 3193,
	[3194] = 3194,
	[3195] = 3195,
	[3196] = 3196,
	[3197] = 3197,
	[3198] = 3198,
	[3199] = 3199,
	[3200] = 3200,
	[3201] = 3201,
	[3202] = 3202,
	[3203] = 3203,
	[3204] = 3204,
	[3205] = 3205,
	[3206] = 3206,
	[3207] = 3207,
	[3208] = 3208,
	[3209] = 3209,
	[3210] = 3210,
	[3211] = 3211,
	[3212] = 3212,
	[3213] = 3213,
	[3214] = 3214,
	[3215] = 3215,
	[3216] = 3216,
	[3217] = 3217,
	[3218] = 3218,
	[3219] = 3219,
	[3220] = 3220,
	[3221] = 3221,
	[3222] = 3222,
	[3223] = 3223,
	[3224] = 3224,
	[3225] = 3225,
	[3226] = 3226,
	[3227] = 3227,
	[3228] = 3228,
	[3229] = 3229,
	[3230] = 3230,
	[3231] = 3231,
	[3232] = 3232,
	[3233] = 3233,
	[3234] = 3234,
	[3235] = 3235,
	[3236] = 3236,
	[3237] = 3237,
	[3238] = 3238,
	[3239] = 3239,
	[3240] = 3240,
	[3241] = 3241,
	[3242] = 3242,
	[3243] = 3243,
	[3244] = 3244,
	[3245] = 3245,
	[3246] = 3246,
	[3247] = 3247,
	[3248] = 3248,
	[3249] = 3249,
	[3250] = 3250,
	[3251] = 3251,
	[3252] = 3252,
	[3253] = 3253,
	[3254] = 3254,
	[3255] = 3255,
	[3256] = 3256,
	[3257] = 3257,
	[3258] = 3258,
	[3259] = 3259,
	[3260] = 3260,
	[3261] = 3261,
	[3262] = 3262,
	[3263] = 3263,
	[3264] = 3264,
	[3265] = 3265,
	[3266] = 3266,
	[3267] = 3267,
	[3268] = 3268,
	[3269] = 3269,
	[3270] = 3270,
	[3271] = 3271,
	[3272] = 3272,
	[3273] = 3273,
	[3274] = 3274,
	[3275] = 3275,
	[3276] = 3276,
	[3277] = 3277,
	[3278] = 3278,
	[3279] = 3279,
	[3280] = 3280,
	[3281] = 3281,
	[3282] = 3282,
	[3283] = 3283,
	[3284] = 3284,
	[3285] = 3285,
	[3286] = 3286,
	[3287] = 3287,
	[3288] = 3288,
	[3289] = 3289,
	[3290] = 3290,
	[3291] = 3291,
	[3292] = 3292,
	[3293] = 3293,
	[3294] = 3294,
	[3295] = 3295,
	[3296] = 3296,
	[3297] = 3297,
	[3298] = 3298,
	[3299] = 3299,
	[3300] = 3300,
	[3301] = 3301,
	[3302] = 3302,
	[3303] = 3303,
	[3304] = 3304,
	[3305] = 3305,
	[3306] = 3306,
	[3307] = 3307,
	[3308] = 3308,
	[3309] = 3309,
	[3310] = 3310,
	[3311] = 3311,
	[3312] = 3312,
	[3313] = 3313,
	[3314] = 3314,
	[3315] = 3315,
	[3316] = 3316,
	[3317] = 3317,
	[3318] = 3318,
	[3319] = 3319,
	[3320] = 3320,
	[3321] = 3321,
	[3322] = 3322,
	[3323] = 3323,
	[3324] = 3324,
	[3325] = 3325,
	[3326] = 3326,
	[3327] = 3327,
	[3328] = 3328,
	[3329] = 3329,
	[3330] = 3330,
	[3331] = 3331,
	[3332] = 3332,
	[3333] = 3333,
	[3334] = 3334,
	[3336] = 3336,
	[3337] = 3337,
	[3338] = 3338,
	[3339] = 3339,
	[3340] = 3340,
	[3341] = 3341,
	[3342] = 3342,
	[3379] = 3379,
	[3380] = 3380,
	[3381] = 3381,
	[3382] = 3382,
	[3383] = 3383,
	[3384] = 3384,
	[3387] = 3387,
	[3388] = 3388,
	[3389] = 3389,
	[3390] = 3390,
	[3391] = 3391,
	[3393] = 3393,
	[3394] = 3394,
	[3395] = 3395,
	[3396] = 3396,
	[3397] = 3397,
	[3398] = 3398,
	[3399] = 3399,
	[3410] = 3410,
	[3411] = 3411,
	[3412] = 3412,
	[3413] = 3413,
	[3414] = 3414,
	[3415] = 3415,
	[3416] = 3416,
	[3417] = 3417,
	[3418] = 3418,
	[3427] = 3427,
	[3428] = 3428,
	[3432] = 3432,
}
