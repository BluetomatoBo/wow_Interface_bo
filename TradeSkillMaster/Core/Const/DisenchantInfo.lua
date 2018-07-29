-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local L = TSM.L
local WEAPON = GetItemClassInfo(LE_ITEM_CLASS_WEAPON)
local ARMOR = GetItemClassInfo(LE_ITEM_CLASS_ARMOR)

TSM.CONST.DISENCHANT_INFO = {
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
