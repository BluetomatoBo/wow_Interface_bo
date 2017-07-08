local addonname = ...
local AtlasLoot = _G.AtlasLoot
local data = AtlasLoot.ItemDB:Add(addonname)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

-- change sortorder for factions
local ALLIANCE_DIFF, HORDE_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
end

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")

local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")

local PVP_CONTENT = data:AddContentType(AL["PvP"], ATLASLOOT_PVP_COLOR)

data["LEGION4SET"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 4).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 145622 }, -- Ferocious Gladiator's Dreadcloak
				{ 2, 145646 }, -- Ferocious Gladiator's Dreadplate Chestpiece
				{ 3, 145648 }, -- Ferocious Gladiator's Dreadplate Sabatons
				{ 4, 145650 }, -- Ferocious Gladiator's Dreadplate Gauntlets
				{ 5, 145652 }, -- Ferocious Gladiator's Dreadplate Helm
				{ 6, 145654 }, -- Ferocious Gladiator's Dreadplate Legguards
				{ 7, 145656 }, -- Ferocious Gladiator's Dreadplate Shoulders
				{ 8, 145658 }, -- Ferocious Gladiator's Dreadplate Girdle
				{ 9, 145660 }, -- Ferocious Gladiator's Dreadplate Wristplates
				{ 16, 145376 }, -- Ferocious Gladiator's Dreadcloak
				{ 17, 145400 }, -- Ferocious Gladiator's Dreadplate Chestpiece
				{ 18, 145402 }, -- Ferocious Gladiator's Dreadplate Sabatons
				{ 19, 145404 }, -- Ferocious Gladiator's Dreadplate Gauntlets
				{ 20, 145406 }, -- Ferocious Gladiator's Dreadplate Helm
				{ 21, 145408 }, -- Ferocious Gladiator's Dreadplate Legguards
				{ 22, 145410 }, -- Ferocious Gladiator's Dreadplate Shoulders
				{ 23, 145412 }, -- Ferocious Gladiator's Dreadplate Girdle
				{ 24, 145414 }, -- Ferocious Gladiator's Dreadplate Wristplates
				{ 101, 145868 }, -- Ferocious Combatant's Dreadcloak
				{ 102, 145893 }, -- Ferocious Combatant's Dreadplate Chestpiece
				{ 103, 145895 }, -- Ferocious Combatant's Dreadplate Sabatons
				{ 104, 145897 }, -- Ferocious Combatant's Dreadplate Gauntlets
				{ 105, 145899 }, -- Ferocious Combatant's Dreadplate Helm
				{ 106, 145901 }, -- Ferocious Combatant's Dreadplate Legguards
				{ 107, 145903 }, -- Ferocious Combatant's Dreadplate Shoulders
				{ 108, 145905 }, -- Ferocious Combatant's Dreadplate Girdle
				{ 109, 145907 }, -- Ferocious Combatant's Dreadplate Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145623 }, -- Ferocious Gladiator's Dreadcloak
				{ 2, 145647 }, -- Ferocious Gladiator's Dreadplate Chestpiece
				{ 3, 145649 }, -- Ferocious Gladiator's Dreadplate Sabatons
				{ 4, 145651 }, -- Ferocious Gladiator's Dreadplate Gauntlets
				{ 5, 145653 }, -- Ferocious Gladiator's Dreadplate Helm
				{ 6, 145655 }, -- Ferocious Gladiator's Dreadplate Legguards
				{ 7, 145657 }, -- Ferocious Gladiator's Dreadplate Shoulders
				{ 8, 145659 }, -- Ferocious Gladiator's Dreadplate Girdle
				{ 9, 145661 }, -- Ferocious Gladiator's Dreadplate Wristplates
				{ 16, 145377 }, -- Ferocious Gladiator's Dreadcloak
				{ 17, 145401 }, -- Ferocious Gladiator's Dreadplate Chestpiece
				{ 18, 145403 }, -- Ferocious Gladiator's Dreadplate Sabatons
				{ 19, 145405 }, -- Ferocious Gladiator's Dreadplate Gauntlets
				{ 20, 145407 }, -- Ferocious Gladiator's Dreadplate Helm
				{ 21, 145409 }, -- Ferocious Gladiator's Dreadplate Legguards
				{ 22, 145411 }, -- Ferocious Gladiator's Dreadplate Shoulders
				{ 23, 145413 }, -- Ferocious Gladiator's Dreadplate Girdle
				{ 24, 145415 }, -- Ferocious Gladiator's Dreadplate Wristplates
				{ 101, 145869 }, -- Ferocious Combatant's Dreadcloak
				{ 102, 145892 }, -- Ferocious Combatant's Dreadplate Chestpiece
				{ 103, 145894 }, -- Ferocious Combatant's Dreadplate Sabatons
				{ 104, 145896 }, -- Ferocious Combatant's Dreadplate Gauntlets
				{ 105, 145898 }, -- Ferocious Combatant's Dreadplate Helm
				{ 106, 145900 }, -- Ferocious Combatant's Dreadplate Legguards
				{ 107, 145902 }, -- Ferocious Combatant's Dreadplate Shoulders
				{ 108, 145904 }, -- Ferocious Combatant's Dreadplate Girdle
				{ 109, 145906 }, -- Ferocious Combatant's Dreadplate Wristplates
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 145624 }, -- Ferocious Gladiator's Demonthread Cloak
				{ 2, 145662 }, -- Ferocious Gladiator's Felskin Tunic
				{ 3, 145664 }, -- Ferocious Gladiator's Felskin Boots
				{ 4, 145666 }, -- Ferocious Gladiator's Felskin Gloves
				{ 5, 145668 }, -- Ferocious Gladiator's Felskin Helm
				{ 6, 145670 }, -- Ferocious Gladiator's Felskin Legguards
				{ 7, 145672 }, -- Ferocious Gladiator's Felskin Spaulders
				{ 8, 145674 }, -- Ferocious Gladiator's Felskin Belt
				{ 9, 145676 }, -- Ferocious Gladiator's Felskin Wristguards
				{ 16, 145378 }, -- Ferocious Gladiator's Demonthread Cloak
				{ 17, 145416 }, -- Ferocious Gladiator's Felskin Tunic
				{ 18, 145418 }, -- Ferocious Gladiator's Felskin Boots
				{ 19, 145420 }, -- Ferocious Gladiator's Felskin Gloves
				{ 20, 145422 }, -- Ferocious Gladiator's Felskin Helm
				{ 21, 145424 }, -- Ferocious Gladiator's Felskin Legguards
				{ 22, 145426 }, -- Ferocious Gladiator's Felskin Spaulders
				{ 23, 145428 }, -- Ferocious Gladiator's Felskin Belt
				{ 24, 145430 }, -- Ferocious Gladiator's Felskin Wristguards
				{ 101, 145868 }, -- Ferocious Combatant's Dreadcloak
				{ 102, 145892 }, -- Ferocious Combatant's Dreadplate Chestpiece
				{ 103, 145894 }, -- Ferocious Combatant's Dreadplate Sabatons
				{ 104, 145896 }, -- Ferocious Combatant's Dreadplate Gauntlets
				{ 105, 145898 }, -- Ferocious Combatant's Dreadplate Helm
				{ 106, 145900 }, -- Ferocious Combatant's Dreadplate Legguards
				{ 107, 145902 }, -- Ferocious Combatant's Dreadplate Shoulders
				{ 108, 145904 }, -- Ferocious Combatant's Dreadplate Girdle
				{ 109, 145906 }, -- Ferocious Combatant's Dreadplate Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145625 }, -- Ferocious Gladiator's Demonthread Cloak
				{ 2, 145663 }, -- Ferocious Gladiator's Felskin Tunic
				{ 3, 145665 }, -- Ferocious Gladiator's Felskin Boots
				{ 4, 145667 }, -- Ferocious Gladiator's Felskin Gloves
				{ 5, 145669 }, -- Ferocious Gladiator's Felskin Helm
				{ 6, 145671 }, -- Ferocious Gladiator's Felskin Legguards
				{ 7, 145673 }, -- Ferocious Gladiator's Felskin Spaulders
				{ 8, 145675 }, -- Ferocious Gladiator's Felskin Belt
				{ 9, 145677 }, -- Ferocious Gladiator's Felskin Wristguards
				{ 16, 145379 }, -- Ferocious Gladiator's Demonthread Cloak
				{ 17, 145417 }, -- Ferocious Gladiator's Felskin Tunic
				{ 18, 145419 }, -- Ferocious Gladiator's Felskin Boots
				{ 19, 145421 }, -- Ferocious Gladiator's Felskin Gloves
				{ 20, 145423 }, -- Ferocious Gladiator's Felskin Helm
				{ 21, 145425 }, -- Ferocious Gladiator's Felskin Legguards
				{ 22, 145427 }, -- Ferocious Gladiator's Felskin Spaulders
				{ 23, 145429 }, -- Ferocious Gladiator's Felskin Belt
				{ 24, 145431 }, -- Ferocious Gladiator's Felskin Wristguards
				{ 101, 145869 }, -- Ferocious Combatant's Dreadcloak
				{ 102, 145893 }, -- Ferocious Combatant's Dreadplate Chestpiece
				{ 103, 145895 }, -- Ferocious Combatant's Dreadplate Sabatons
				{ 104, 145897 }, -- Ferocious Combatant's Dreadplate Gauntlets
				{ 105, 145899 }, -- Ferocious Combatant's Dreadplate Helm
				{ 106, 145901 }, -- Ferocious Combatant's Dreadplate Legguards
				{ 107, 145903 }, -- Ferocious Combatant's Dreadplate Shoulders
				{ 108, 145905 }, -- Ferocious Combatant's Dreadplate Girdle
				{ 109, 145907 }, -- Ferocious Combatant's Dreadplate Wristplates
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 145626 }, -- Ferocious Gladiator's Dragonhide Cloak
				{ 2, 145678 }, -- Ferocious Gladiator's Dragonhide Robe
				{ 3, 145680 }, -- Ferocious Gladiator's Dragonhide Moccasins
				{ 4, 145682 }, -- Ferocious Gladiator's Dragonhide Gloves
				{ 5, 145684 }, -- Ferocious Gladiator's Dragonhide Helm
				{ 6, 145686 }, -- Ferocious Gladiator's Dragonhide Legguards
				{ 7, 145688 }, -- Ferocious Gladiator's Dragonhide Spaulders
				{ 8, 145690 }, -- Ferocious Gladiator's Dragonhide Belt
				{ 9, 145692 }, -- Ferocious Gladiator's Dragonhide Wristguards
				{ 16, 145380 }, -- Ferocious Gladiator's Dragonhide Cloak
				{ 17, 145432 }, -- Ferocious Gladiator's Dragonhide Robe
				{ 18, 145434 }, -- Ferocious Gladiator's Dragonhide Moccasins
				{ 19, 145436 }, -- Ferocious Gladiator's Dragonhide Gloves
				{ 20, 145438 }, -- Ferocious Gladiator's Dragonhide Helm
				{ 21, 145440 }, -- Ferocious Gladiator's Dragonhide Legguards
				{ 22, 145442 }, -- Ferocious Gladiator's Dragonhide Spaulders
				{ 23, 145444 }, -- Ferocious Gladiator's Dragonhide Belt
				{ 24, 145446 }, -- Ferocious Gladiator's Dragonhide Wristguards
				{ 101, 145872 }, -- Ferocious Combatant's Dragonhide Cloak
				{ 102, 145924 }, -- Ferocious Combatant's Dragonhide Tunic
				{ 103, 145926 }, -- Ferocious Combatant's Dragonhide Moccasins
				{ 104, 145928 }, -- Ferocious Combatant's Dragonhide Gloves
				{ 105, 145930 }, -- Ferocious Combatant's Dragonhide Helm
				{ 106, 145932 }, -- Ferocious Combatant's Dragonhide Legguards
				{ 107, 145934 }, -- Ferocious Combatant's Dragonhide Spaulders
				{ 108, 145936 }, -- Ferocious Combatant's Dragonhide Belt
				{ 109, 145938 }, -- Ferocious Combatant's Dragonhide Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145627 }, -- Ferocious Gladiator's Dragonhide Cloak
				{ 2, 145679 }, -- Ferocious Gladiator's Dragonhide Robe
				{ 3, 145681 }, -- Ferocious Gladiator's Dragonhide Moccasins
				{ 4, 145683 }, -- Ferocious Gladiator's Dragonhide Gloves
				{ 5, 145685 }, -- Ferocious Gladiator's Dragonhide Helm
				{ 6, 145687 }, -- Ferocious Gladiator's Dragonhide Legguards
				{ 7, 145689 }, -- Ferocious Gladiator's Dragonhide Spaulders
				{ 8, 145691 }, -- Ferocious Gladiator's Dragonhide Belt
				{ 9, 145693 }, -- Ferocious Gladiator's Dragonhide Wristguards
				{ 16, 145381 }, -- Ferocious Gladiator's Dragonhide Cloak
				{ 17, 145433 }, -- Ferocious Gladiator's Dragonhide Robe
				{ 18, 145435 }, -- Ferocious Gladiator's Dragonhide Moccasins
				{ 19, 145437 }, -- Ferocious Gladiator's Dragonhide Gloves
				{ 20, 145439 }, -- Ferocious Gladiator's Dragonhide Helm
				{ 21, 145441 }, -- Ferocious Gladiator's Dragonhide Legguards
				{ 22, 145443 }, -- Ferocious Gladiator's Dragonhide Spaulders
				{ 23, 145445 }, -- Ferocious Gladiator's Dragonhide Belt
				{ 24, 145447 }, -- Ferocious Gladiator's Dragonhide Wristguards
				{ 101, 145873 }, -- Ferocious Combatant's Dragonhide Cloak
				{ 102, 145925 }, -- Ferocious Combatant's Dragonhide Tunic
				{ 103, 145927 }, -- Ferocious Combatant's Dragonhide Moccasins
				{ 104, 145929 }, -- Ferocious Combatant's Dragonhide Gloves
				{ 105, 145931 }, -- Ferocious Combatant's Dragonhide Helm
				{ 106, 145933 }, -- Ferocious Combatant's Dragonhide Legguards
				{ 107, 145935 }, -- Ferocious Combatant's Dragonhide Spaulders
				{ 108, 145937 }, -- Ferocious Combatant's Dragonhide Belt
				{ 109, 145939 }, -- Ferocious Combatant's Dragonhide Wristguards
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 145628 }, -- Ferocious Gladiator's Drape of the Tracker
				{ 2, 145694 }, -- Ferocious Gladiator's Chain Armor
				{ 3, 145696 }, -- Ferocious Gladiator's Chain Treads
				{ 4, 145698 }, -- Ferocious Gladiator's Chain Gauntlets
				{ 5, 145700 }, -- Ferocious Gladiator's Chain Helm
				{ 6, 145702 }, -- Ferocious Gladiator's Chain Leggings
				{ 7, 145704 }, -- Ferocious Gladiator's Chain Spaulders
				{ 8, 145706 }, -- Ferocious Gladiator's Chain Clasp
				{ 9, 145708 }, -- Ferocious Gladiator's Chain Armband
				{ 16, 145382 }, -- Ferocious Gladiator's Drape of the Tracker
				{ 17, 145448 }, -- Ferocious Gladiator's Chain Armor
				{ 18, 145450 }, -- Ferocious Gladiator's Chain Treads
				{ 19, 145452 }, -- Ferocious Gladiator's Chain Gauntlets
				{ 20, 145454 }, -- Ferocious Gladiator's Chain Helm
				{ 21, 145456 }, -- Ferocious Gladiator's Chain Leggings
				{ 22, 145458 }, -- Ferocious Gladiator's Chain Spaulders
				{ 23, 145460 }, -- Ferocious Gladiator's Chain Clasp
				{ 24, 145462 }, -- Ferocious Gladiator's Chain Armband
				{ 101, 145874 }, -- Ferocious Combatant's Drape of the Tracker
				{ 102, 145940 }, -- Ferocious Combatant's Chain Armor
				{ 103, 145942 }, -- Ferocious Combatant's Chain Treads
				{ 104, 145944 }, -- Ferocious Combatant's Chain Gauntlets
				{ 105, 145946 }, -- Ferocious Combatant's Chain Helm
				{ 106, 145948 }, -- Ferocious Combatant's Chain Leggings
				{ 107, 145950 }, -- Ferocious Combatant's Chain Spaulders
				{ 108, 145952 }, -- Ferocious Combatant's Chain Clasp
				{ 109, 145954 }, -- Ferocious Combatant's Chain Armband
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145629 }, -- Ferocious Gladiator's Drape of the Tracker
				{ 2, 145695 }, -- Ferocious Gladiator's Chain Armor
				{ 3, 145697 }, -- Ferocious Gladiator's Chain Treads
				{ 4, 145699 }, -- Ferocious Gladiator's Chain Gauntlets
				{ 5, 145701 }, -- Ferocious Gladiator's Chain Helm
				{ 6, 145703 }, -- Ferocious Gladiator's Chain Leggings
				{ 7, 145705 }, -- Ferocious Gladiator's Chain Spaulders
				{ 8, 145707 }, -- Ferocious Gladiator's Chain Clasp
				{ 9, 145709 }, -- Ferocious Gladiator's Chain Armband
				{ 16, 145383 }, -- Ferocious Gladiator's Drape of the Tracker
				{ 17, 145449 }, -- Ferocious Gladiator's Chain Armor
				{ 18, 145451 }, -- Ferocious Gladiator's Chain Treads
				{ 19, 145453 }, -- Ferocious Gladiator's Chain Gauntlets
				{ 20, 145455 }, -- Ferocious Gladiator's Chain Helm
				{ 21, 145457 }, -- Ferocious Gladiator's Chain Leggings
				{ 22, 145459 }, -- Ferocious Gladiator's Chain Spaulders
				{ 23, 145461 }, -- Ferocious Gladiator's Chain Clasp
				{ 24, 145463 }, -- Ferocious Gladiator's Chain Armband
				{ 101, 145875 }, -- Ferocious Combatant's Drape of the Tracker
				{ 102, 145941 }, -- Ferocious Combatant's Chain Armor
				{ 103, 145943 }, -- Ferocious Combatant's Chain Treads
				{ 104, 145945 }, -- Ferocious Combatant's Chain Gauntlets
				{ 105, 145947 }, -- Ferocious Combatant's Chain Helm
				{ 106, 145949 }, -- Ferocious Combatant's Chain Leggings
				{ 107, 145951 }, -- Ferocious Combatant's Chain Spaulders
				{ 108, 145953 }, -- Ferocious Combatant's Chain Clasp
				{ 109, 145955 }, -- Ferocious Combatant's Chain Armband
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 145630 }, -- Ferocious Gladiator's Silken Shawl
				{ 2, 145710 }, -- Ferocious Gladiator's Silk Treads
				{ 3, 145712 }, -- Ferocious Gladiator's Silk Handguards
				{ 4, 145714 }, -- Ferocious Gladiator's Silk Cowl
				{ 5, 145716 }, -- Ferocious Gladiator's Silk Trousers
				{ 6, 145718 }, -- Ferocious Gladiator's Silk Robe
				{ 7, 145720 }, -- Ferocious Gladiator's Silk Amice
				{ 8, 145722 }, -- Ferocious Gladiator's Silk Cord
				{ 9, 145724 }, -- Ferocious Gladiator's Silk Bracers
				{ 16, 145384 }, -- Ferocious Gladiator's Silken Shawl
				{ 17, 145464 }, -- Ferocious Gladiator's Silk Treads
				{ 18, 145466 }, -- Ferocious Gladiator's Silk Handguards
				{ 19, 145468 }, -- Ferocious Gladiator's Silk Cowl
				{ 20, 145470 }, -- Ferocious Gladiator's Silk Trousers
				{ 21, 145472 }, -- Ferocious Gladiator's Silk Robe
				{ 22, 145474 }, -- Ferocious Gladiator's Silk Amice
				{ 23, 145476 }, -- Ferocious Gladiator's Silk Cord
				{ 24, 145478 }, -- Ferocious Gladiator's Silk Bracers
				{ 101, 145876 }, -- Ferocious Combatant's Silken Shawl
				{ 102, 145956 }, -- Ferocious Combatant's Silk Treads
				{ 103, 145958 }, -- Ferocious Combatant's Silk Handguards
				{ 104, 145960 }, -- Ferocious Combatant's Silk Cowl
				{ 105, 145962 }, -- Ferocious Combatant's Silk Trousers
				{ 106, 145964 }, -- Ferocious Combatant's Silk Robe
				{ 107, 145966 }, -- Ferocious Combatant's Silk Amice
				{ 108, 145968 }, -- Ferocious Combatant's Silk Cord
				{ 109, 145970 }, -- Ferocious Combatant's Silk Bracers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145631 }, -- Ferocious Gladiator's Silken Shawl
				{ 2, 145711 }, -- Ferocious Gladiator's Silk Treads
				{ 3, 145713 }, -- Ferocious Gladiator's Silk Handguards
				{ 4, 145715 }, -- Ferocious Gladiator's Silk Cowl
				{ 5, 145717 }, -- Ferocious Gladiator's Silk Trousers
				{ 6, 145719 }, -- Ferocious Gladiator's Silk Robe
				{ 7, 145721 }, -- Ferocious Gladiator's Silk Amice
				{ 8, 145723 }, -- Ferocious Gladiator's Silk Cord
				{ 9, 145725 }, -- Ferocious Gladiator's Silk Bracers
				{ 16, 145385 }, -- Ferocious Gladiator's Silken Shawl
				{ 17, 145465 }, -- Ferocious Gladiator's Silk Treads
				{ 18, 145467 }, -- Ferocious Gladiator's Silk Handguards
				{ 19, 145469 }, -- Ferocious Gladiator's Silk Cowl
				{ 20, 145471 }, -- Ferocious Gladiator's Silk Trousers
				{ 21, 145473 }, -- Ferocious Gladiator's Silk Robe
				{ 22, 145475 }, -- Ferocious Gladiator's Silk Amice
				{ 23, 145477 }, -- Ferocious Gladiator's Silk Cord
				{ 24, 145479 }, -- Ferocious Gladiator's Silk Bracers
				{ 101, 145877 }, -- Ferocious Combatant's Silken Shawl
				{ 102, 145957 }, -- Ferocious Combatant's Silk Treads
				{ 103, 145959 }, -- Ferocious Combatant's Silk Handguards
				{ 104, 145961 }, -- Ferocious Combatant's Silk Cowl
				{ 105, 145963 }, -- Ferocious Combatant's Silk Trousers
				{ 106, 145965 }, -- Ferocious Combatant's Silk Robe
				{ 107, 145967 }, -- Ferocious Combatant's Silk Amice
				{ 108, 145969 }, -- Ferocious Combatant's Silk Cord
				{ 109, 145971 }, -- Ferocious Combatant's Silk Bracers
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 145632 }, -- Ferocious Gladiator's Ironskin Cloak
				{ 2, 145726 }, -- Ferocious Gladiator's Ironskin Slippers
				{ 3, 145728 }, -- Ferocious Gladiator's Ironskin Gloves
				{ 4, 145730 }, -- Ferocious Gladiator's Ironskin Helm
				{ 5, 145732 }, -- Ferocious Gladiator's Ironskin Legguards
				{ 6, 145734 }, -- Ferocious Gladiator's Ironskin Spaulders
				{ 7, 145736 }, -- Ferocious Gladiator's Ironskin Tunic
				{ 8, 145738 }, -- Ferocious Gladiator's Ironskin Belt
				{ 9, 145740 }, -- Ferocious Gladiator's Ironskin Wristguards
				{ 16, 145386 }, -- Ferocious Gladiator's Ironskin Cloak
				{ 17, 145480 }, -- Ferocious Gladiator's Ironskin Slippers
				{ 18, 145482 }, -- Ferocious Gladiator's Ironskin Gloves
				{ 19, 145484 }, -- Ferocious Gladiator's Ironskin Helm
				{ 20, 145486 }, -- Ferocious Gladiator's Ironskin Legguards
				{ 21, 145488 }, -- Ferocious Gladiator's Ironskin Spaulders
				{ 22, 145490 }, -- Ferocious Gladiator's Ironskin Tunic
				{ 23, 145492 }, -- Ferocious Gladiator's Ironskin Belt
				{ 24, 145494 }, -- Ferocious Gladiator's Ironskin Wristguards
				{ 101, 145878 }, -- Ferocious Combatant's Ironskin Cloak
				{ 102, 145972 }, -- Ferocious Combatant's Ironskin Slippers
				{ 103, 145974 }, -- Ferocious Combatant's Ironskin Gloves
				{ 104, 145976 }, -- Ferocious Combatant's Ironskin Helm
				{ 105, 145978 }, -- Ferocious Combatant's Ironskin Legguards
				{ 106, 145980 }, -- Ferocious Combatant's Ironskin Spaulders
				{ 107, 145982 }, -- Ferocious Combatant's Ironskin Tunic
				{ 108, 145984 }, -- Ferocious Combatant's Ironskin Belt
				{ 109, 145986 }, -- Ferocious Combatant's Ironskin Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145633 }, -- Ferocious Gladiator's Ironskin Cloak
				{ 2, 145727 }, -- Ferocious Gladiator's Ironskin Slippers
				{ 3, 145729 }, -- Ferocious Gladiator's Ironskin Gloves
				{ 4, 145731 }, -- Ferocious Gladiator's Ironskin Helm
				{ 5, 145733 }, -- Ferocious Gladiator's Ironskin Legguards
				{ 6, 145735 }, -- Ferocious Gladiator's Ironskin Spaulders
				{ 7, 145737 }, -- Ferocious Gladiator's Ironskin Tunic
				{ 8, 145739 }, -- Ferocious Gladiator's Ironskin Belt
				{ 9, 145741 }, -- Ferocious Gladiator's Ironskin Wristguards
				{ 16, 145387 }, -- Ferocious Gladiator's Ironskin Cloak
				{ 17, 145481 }, -- Ferocious Gladiator's Ironskin Slippers
				{ 18, 145483 }, -- Ferocious Gladiator's Ironskin Gloves
				{ 19, 145485 }, -- Ferocious Gladiator's Ironskin Helm
				{ 20, 145487 }, -- Ferocious Gladiator's Ironskin Legguards
				{ 21, 145489 }, -- Ferocious Gladiator's Ironskin Spaulders
				{ 22, 145491 }, -- Ferocious Gladiator's Ironskin Tunic
				{ 23, 145493 }, -- Ferocious Gladiator's Ironskin Belt
				{ 24, 145495 }, -- Ferocious Gladiator's Ironskin Wristguards
				{ 101, 145879 }, -- Ferocious Combatant's Ironskin Cloak
				{ 102, 145973 }, -- Ferocious Combatant's Ironskin Slippers
				{ 103, 145975 }, -- Ferocious Combatant's Ironskin Gloves
				{ 104, 145977 }, -- Ferocious Combatant's Ironskin Helm
				{ 105, 145979 }, -- Ferocious Combatant's Ironskin Legguards
				{ 106, 145981 }, -- Ferocious Combatant's Ironskin Spaulders
				{ 107, 145983 }, -- Ferocious Combatant's Ironskin Tunic
				{ 108, 145985 }, -- Ferocious Combatant's Ironskin Belt
				{ 109, 145987 }, -- Ferocious Combatant's Ironskin Wristguards
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 145634 }, -- Ferocious Gladiator's Greatcloak of Faith
				{ 2, 145748 }, -- Ferocious Gladiator's Scaled Breastplate
				{ 3, 145750 }, -- Ferocious Gladiator's Scaled Sabatons
				{ 4, 145752 }, -- Ferocious Gladiator's Scaled Gauntlets
				{ 5, 145754 }, -- Ferocious Gladiator's Scaled Helm
				{ 6, 145756 }, -- Ferocious Gladiator's Scaled Legguards
				{ 7, 145758 }, -- Ferocious Gladiator's Scaled Shoulders
				{ 8, 145760 }, -- Ferocious Gladiator's Scaled Girdle
				{ 9, 145762 }, -- Ferocious Gladiator's Scaled Wristplates
				{ 16, 145388 }, -- Ferocious Gladiator's Greatcloak of Faith
				{ 17, 145503 }, -- Ferocious Gladiator's Scaled Sabatons
				{ 18, 145505 }, -- Ferocious Gladiator's Scaled Gauntlets
				{ 19, 145507 }, -- Ferocious Gladiator's Scaled Helm
				{ 20, 145509 }, -- Ferocious Gladiator's Scaled Legguards
				{ 21, 145511 }, -- Ferocious Gladiator's Scaled Breastplate
				{ 22, 145512 }, -- Ferocious Gladiator's Scaled Shoulders
				{ 23, 145514 }, -- Ferocious Gladiator's Scaled Girdle
				{ 24, 145516 }, -- Ferocious Gladiator's Scaled Wristplates
				{ 101, 145880 }, -- Ferocious Combatant's Greatcloak of Faith
				{ 102, 145994 }, -- Ferocious Combatant's Scaled Chestpiece
				{ 103, 145996 }, -- Ferocious Combatant's Scaled Sabatons
				{ 104, 145998 }, -- Ferocious Combatant's Scaled Gauntlets
				{ 105, 146000 }, -- Ferocious Combatant's Scaled Helm
				{ 106, 146002 }, -- Ferocious Combatant's Scaled Legguards
				{ 107, 146004 }, -- Ferocious Combatant's Scaled Shoulders
				{ 108, 146006 }, -- Ferocious Combatant's Scaled Girdle
				{ 109, 146008 }, -- Ferocious Combatant's Scaled Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145635 }, -- Ferocious Gladiator's Greatcloak of Faith
				{ 2, 145749 }, -- Ferocious Gladiator's Scaled Breastplate
				{ 3, 145751 }, -- Ferocious Gladiator's Scaled Sabatons
				{ 4, 145753 }, -- Ferocious Gladiator's Scaled Gauntlets
				{ 5, 145755 }, -- Ferocious Gladiator's Scaled Helm
				{ 6, 145757 }, -- Ferocious Gladiator's Scaled Legguards
				{ 7, 145759 }, -- Ferocious Gladiator's Scaled Shoulders
				{ 8, 145761 }, -- Ferocious Gladiator's Scaled Girdle
				{ 9, 145763 }, -- Ferocious Gladiator's Scaled Wristplates
				{ 16, 145389 }, -- Ferocious Gladiator's Greatcloak of Faith
				{ 17, 145502 }, -- Ferocious Gladiator's Scaled Breastplate
				{ 18, 145504 }, -- Ferocious Gladiator's Scaled Sabatons
				{ 19, 145506 }, -- Ferocious Gladiator's Scaled Gauntlets
				{ 20, 145508 }, -- Ferocious Gladiator's Scaled Helm
				{ 21, 145510 }, -- Ferocious Gladiator's Scaled Legguards
				{ 22, 145513 }, -- Ferocious Gladiator's Scaled Shoulders
				{ 23, 145515 }, -- Ferocious Gladiator's Scaled Girdle
				{ 24, 145517 }, -- Ferocious Gladiator's Scaled Wristplates
				{ 101, 145881 }, -- Ferocious Combatant's Greatcloak of Faith
				{ 102, 145995 }, -- Ferocious Combatant's Scaled Chestpiece
				{ 103, 145997 }, -- Ferocious Combatant's Scaled Sabatons
				{ 104, 145999 }, -- Ferocious Combatant's Scaled Gauntlets
				{ 105, 146001 }, -- Ferocious Combatant's Scaled Helm
				{ 106, 146003 }, -- Ferocious Combatant's Scaled Legguards
				{ 107, 146005 }, -- Ferocious Combatant's Scaled Shoulders
				{ 108, 146007 }, -- Ferocious Combatant's Scaled Girdle
				{ 109, 146009 }, -- Ferocious Combatant's Scaled Wristplates
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 145636 }, -- Ferocious Gladiator's Drape of Piety
				{ 2, 145764 }, -- Ferocious Gladiator's Satin Treads
				{ 3, 145766 }, -- Ferocious Gladiator's Satin Gloves
				{ 4, 145768 }, -- Ferocious Gladiator's Satin Hood
				{ 5, 145770 }, -- Ferocious Gladiator's Satin Leggings
				{ 6, 145772 }, -- Ferocious Gladiator's Satin Robe
				{ 7, 145774 }, -- Ferocious Gladiator's Satin Mantle
				{ 8, 145776 }, -- Ferocious Gladiator's Satin Cord
				{ 9, 145778 }, -- Ferocious Gladiator's Satin Bracers
				{ 16, 145390 }, -- Ferocious Gladiator's Drape of Piety
				{ 17, 145518 }, -- Ferocious Gladiator's Satin Treads
				{ 18, 145520 }, -- Ferocious Gladiator's Satin Gloves
				{ 19, 145522 }, -- Ferocious Gladiator's Satin Hood
				{ 20, 145524 }, -- Ferocious Gladiator's Satin Leggings
				{ 21, 145526 }, -- Ferocious Gladiator's Satin Robe
				{ 22, 145528 }, -- Ferocious Gladiator's Satin Mantle
				{ 23, 145530 }, -- Ferocious Gladiator's Satin Cord
				{ 24, 145532 }, -- Ferocious Gladiator's Satin Bracers
				{ 101, 145882 }, -- Ferocious Combatant's Drape of Piety
				{ 102, 146010 }, -- Ferocious Combatant's Satin Treads
				{ 103, 146012 }, -- Ferocious Combatant's Satin Gloves
				{ 104, 146014 }, -- Ferocious Combatant's Satin Hood
				{ 105, 146016 }, -- Ferocious Combatant's Satin Leggings
				{ 106, 146018 }, -- Ferocious Combatant's Satin Robe
				{ 107, 146020 }, -- Ferocious Combatant's Satin Mantle
				{ 108, 146022 }, -- Ferocious Combatant's Satin Cord
				{ 109, 146024 }, -- Ferocious Combatant's Satin Bracers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145637 }, -- Ferocious Gladiator's Drape of Piety
				{ 2, 145765 }, -- Ferocious Gladiator's Satin Treads
				{ 3, 145767 }, -- Ferocious Gladiator's Satin Gloves
				{ 4, 145769 }, -- Ferocious Gladiator's Satin Hood
				{ 5, 145771 }, -- Ferocious Gladiator's Satin Leggings
				{ 6, 145773 }, -- Ferocious Gladiator's Satin Robe
				{ 7, 145775 }, -- Ferocious Gladiator's Satin Mantle
				{ 8, 145777 }, -- Ferocious Gladiator's Satin Cord
				{ 9, 145779 }, -- Ferocious Gladiator's Satin Bracers
				{ 16, 145391 }, -- Ferocious Gladiator's Drape of Piety
				{ 17, 145519 }, -- Ferocious Gladiator's Satin Treads
				{ 18, 145521 }, -- Ferocious Gladiator's Satin Gloves
				{ 19, 145523 }, -- Ferocious Gladiator's Satin Hood
				{ 20, 145525 }, -- Ferocious Gladiator's Satin Leggings
				{ 21, 145527 }, -- Ferocious Gladiator's Satin Robe
				{ 22, 145529 }, -- Ferocious Gladiator's Satin Mantle
				{ 23, 145531 }, -- Ferocious Gladiator's Satin Cord
				{ 24, 145533 }, -- Ferocious Gladiator's Satin Bracers
				{ 101, 145883 }, -- Ferocious Combatant's Drape of Piety
				{ 102, 146011 }, -- Ferocious Combatant's Satin Treads
				{ 103, 146013 }, -- Ferocious Combatant's Satin Gloves
				{ 104, 146015 }, -- Ferocious Combatant's Satin Hood
				{ 105, 146017 }, -- Ferocious Combatant's Satin Leggings
				{ 106, 146019 }, -- Ferocious Combatant's Satin Robe
				{ 107, 146021 }, -- Ferocious Combatant's Satin Mantle
				{ 108, 146023 }, -- Ferocious Combatant's Satin Cord
				{ 109, 146025 }, -- Ferocious Combatant's Satin Bracers
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 145638 }, -- Ferocious Gladiator's Shadowcape
				{ 2, 145786 }, -- Ferocious Gladiator's Leather Tunic
				{ 3, 145788 }, -- Ferocious Gladiator's Leather Slippers
				{ 4, 145790 }, -- Ferocious Gladiator's Leather Gloves
				{ 5, 145792 }, -- Ferocious Gladiator's Leather Helm
				{ 6, 145794 }, -- Ferocious Gladiator's Leather Legguards
				{ 7, 145796 }, -- Ferocious Gladiator's Leather Spaulders
				{ 8, 145798 }, -- Ferocious Gladiator's Leather Belt
				{ 9, 145800 }, -- Ferocious Gladiator's Leather Wristguards
				{ 16, 145392 }, -- Ferocious Gladiator's Shadowcape
				{ 17, 145540 }, -- Ferocious Gladiator's Leather Tunic
				{ 18, 145542 }, -- Ferocious Gladiator's Leather Slippers
				{ 19, 145544 }, -- Ferocious Gladiator's Leather Gloves
				{ 20, 145546 }, -- Ferocious Gladiator's Leather Helm
				{ 21, 145548 }, -- Ferocious Gladiator's Leather Legguards
				{ 22, 145550 }, -- Ferocious Gladiator's Leather Spaulders
				{ 23, 145552 }, -- Ferocious Gladiator's Leather Belt
				{ 24, 145554 }, -- Ferocious Gladiator's Leather Wristguards
				{ 101, 145884 }, -- Ferocious Combatant's Shadowcape
				{ 102, 146032 }, -- Ferocious Combatant's Leather Tunic
				{ 103, 146034 }, -- Ferocious Combatant's Leather Slippers
				{ 104, 146036 }, -- Ferocious Combatant's Leather Gloves
				{ 105, 146038 }, -- Ferocious Combatant's Leather Helm
				{ 106, 146040 }, -- Ferocious Combatant's Leather Legguards
				{ 107, 146042 }, -- Ferocious Combatant's Leather Spaulders
				{ 108, 146044 }, -- Ferocious Combatant's Leather Belt
				{ 109, 146046 }, -- Ferocious Combatant's Leather Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145639 }, -- Ferocious Gladiator's Shadowcape
				{ 2, 145787 }, -- Ferocious Gladiator's Leather Tunic
				{ 3, 145789 }, -- Ferocious Gladiator's Leather Slippers
				{ 4, 145791 }, -- Ferocious Gladiator's Leather Gloves
				{ 5, 145793 }, -- Ferocious Gladiator's Leather Helm
				{ 6, 145795 }, -- Ferocious Gladiator's Leather Legguards
				{ 7, 145797 }, -- Ferocious Gladiator's Leather Spaulders
				{ 8, 145799 }, -- Ferocious Gladiator's Leather Belt
				{ 9, 145801 }, -- Ferocious Gladiator's Leather Wristguards
				{ 16, 145393 }, -- Ferocious Gladiator's Shadowcape
				{ 17, 145541 }, -- Ferocious Gladiator's Leather Tunic
				{ 18, 145543 }, -- Ferocious Gladiator's Leather Slippers
				{ 19, 145545 }, -- Ferocious Gladiator's Leather Gloves
				{ 20, 145547 }, -- Ferocious Gladiator's Leather Helm
				{ 21, 145549 }, -- Ferocious Gladiator's Leather Legguards
				{ 22, 145551 }, -- Ferocious Gladiator's Leather Spaulders
				{ 23, 145553 }, -- Ferocious Gladiator's Leather Belt
				{ 24, 145555 }, -- Ferocious Gladiator's Leather Wristguards
				{ 101, 145885 }, -- Ferocious Combatant's Shadowcape
				{ 102, 146033 }, -- Ferocious Combatant's Leather Tunic
				{ 103, 146035 }, -- Ferocious Combatant's Leather Slippers
				{ 104, 146037 }, -- Ferocious Combatant's Leather Gloves
				{ 105, 146039 }, -- Ferocious Combatant's Leather Helm
				{ 106, 146041 }, -- Ferocious Combatant's Leather Legguards
				{ 107, 146043 }, -- Ferocious Combatant's Leather Spaulders
				{ 108, 146045 }, -- Ferocious Combatant's Leather Belt
				{ 109, 146047 }, -- Ferocious Combatant's Leather Wristguards
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 145640 }, -- Ferocious Gladiator's Totemic Cloak
				{ 2, 145802 }, -- Ferocious Gladiator's Ringmail Armor
				{ 3, 145804 }, -- Ferocious Gladiator's Ringmail Boots
				{ 4, 145806 }, -- Ferocious Gladiator's Ringmail Gauntlets
				{ 5, 145808 }, -- Ferocious Gladiator's Ringmail Helm
				{ 6, 145810 }, -- Ferocious Gladiator's Ringmail Kilt
				{ 7, 145812 }, -- Ferocious Gladiator's Ringmail Spaulders
				{ 8, 145814 }, -- Ferocious Gladiator's Ringmail Clasp
				{ 9, 145816 }, -- Ferocious Gladiator's Ringmail Armband
				{ 16, 145394 }, -- Ferocious Gladiator's Totemic Cloak
				{ 17, 145556 }, -- Ferocious Gladiator's Ringmail Armor
				{ 18, 145558 }, -- Ferocious Gladiator's Ringmail Boots
				{ 19, 145560 }, -- Ferocious Gladiator's Ringmail Gauntlets
				{ 20, 145562 }, -- Ferocious Gladiator's Ringmail Helm
				{ 21, 145564 }, -- Ferocious Gladiator's Ringmail Kilt
				{ 22, 145566 }, -- Ferocious Gladiator's Ringmail Spaulders
				{ 23, 145568 }, -- Ferocious Gladiator's Ringmail Clasp
				{ 24, 145570 }, -- Ferocious Gladiator's Ringmail Armband
				{ 101, 145886 }, -- Ferocious Combatant's Totemic Cloak
				{ 102, 146048 }, -- Ferocious Combatant's Ringmail Armor
				{ 103, 146050 }, -- Ferocious Combatant's Ringmail Boots
				{ 104, 146052 }, -- Ferocious Combatant's Ringmail Gauntlets
				{ 105, 146054 }, -- Ferocious Combatant's Ringmail Helm
				{ 106, 146056 }, -- Ferocious Combatant's Ringmail Kilt
				{ 107, 146058 }, -- Ferocious Combatant's Ringmail Spaulders
				{ 108, 146060 }, -- Ferocious Combatant's Ringmail Clasp
				{ 109, 146062 }, -- Ferocious Combatant's Ringmail Armband
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145641 }, -- Ferocious Gladiator's Totemic Cloak
				{ 2, 145803 }, -- Ferocious Gladiator's Ringmail Armor
				{ 3, 145805 }, -- Ferocious Gladiator's Ringmail Boots
				{ 4, 145807 }, -- Ferocious Gladiator's Ringmail Gauntlets
				{ 5, 145809 }, -- Ferocious Gladiator's Ringmail Helm
				{ 6, 145811 }, -- Ferocious Gladiator's Ringmail Kilt
				{ 7, 145813 }, -- Ferocious Gladiator's Ringmail Spaulders
				{ 8, 145815 }, -- Ferocious Gladiator's Ringmail Clasp
				{ 9, 145817 }, -- Ferocious Gladiator's Ringmail Armband
				{ 16, 145395 }, -- Ferocious Gladiator's Totemic Cloak
				{ 17, 145557 }, -- Ferocious Gladiator's Ringmail Armor
				{ 18, 145559 }, -- Ferocious Gladiator's Ringmail Boots
				{ 19, 145561 }, -- Ferocious Gladiator's Ringmail Gauntlets
				{ 20, 145563 }, -- Ferocious Gladiator's Ringmail Helm
				{ 21, 145565 }, -- Ferocious Gladiator's Ringmail Kilt
				{ 22, 145567 }, -- Ferocious Gladiator's Ringmail Spaulders
				{ 23, 145569 }, -- Ferocious Gladiator's Ringmail Clasp
				{ 24, 145571 }, -- Ferocious Gladiator's Ringmail Armband
				{ 101, 145887 }, -- Ferocious Combatant's Totemic Cloak
				{ 102, 146049 }, -- Ferocious Combatant's Ringmail Armor
				{ 103, 146051 }, -- Ferocious Combatant's Ringmail Boots
				{ 104, 146053 }, -- Ferocious Combatant's Ringmail Gauntlets
				{ 105, 146055 }, -- Ferocious Combatant's Ringmail Helm
				{ 106, 146057 }, -- Ferocious Combatant's Ringmail Leggings
				{ 107, 146059 }, -- Ferocious Combatant's Ringmail Spaulders
				{ 108, 146061 }, -- Ferocious Combatant's Ringmail Clasp
				{ 109, 146063 }, -- Ferocious Combatant's Ringmail Armband
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 145642 }, -- Ferocious Gladiator's Felweave Cloak
				{ 2, 145836 }, -- Ferocious Gladiator's Felweave Treads
				{ 3, 145838 }, -- Ferocious Gladiator's Felweave Handguards
				{ 4, 145840 }, -- Ferocious Gladiator's Felweave Cowl
				{ 5, 145842 }, -- Ferocious Gladiator's Felweave Trousers
				{ 6, 145844 }, -- Ferocious Gladiator's Felweave Raiment
				{ 7, 145846 }, -- Ferocious Gladiator's Felweave Amice
				{ 8, 145848 }, -- Ferocious Gladiator's Felweave Cord
				{ 9, 145850 }, -- Ferocious Gladiator's Felweave Bracers
				{ 16, 145396 }, -- Ferocious Gladiator's Felweave Cloak
				{ 17, 145590 }, -- Ferocious Gladiator's Felweave Treads
				{ 18, 145592 }, -- Ferocious Gladiator's Felweave Handguards
				{ 19, 145594 }, -- Ferocious Gladiator's Felweave Cowl
				{ 20, 145596 }, -- Ferocious Gladiator's Felweave Trousers
				{ 21, 145598 }, -- Ferocious Gladiator's Felweave Raiment
				{ 22, 145600 }, -- Ferocious Gladiator's Felweave Amice
				{ 23, 145602 }, -- Ferocious Gladiator's Felweave Cord
				{ 24, 145604 }, -- Ferocious Gladiator's Felweave Bracers
				{ 101, 145888 }, -- Ferocious Combatant's Felweave Cloak
				{ 102, 146082 }, -- Ferocious Combatant's Felweave Treads
				{ 103, 146084 }, -- Ferocious Combatant's Felweave Handguards
				{ 104, 146086 }, -- Ferocious Combatant's Felweave Cowl
				{ 105, 146088 }, -- Ferocious Combatant's Felweave Trousers
				{ 106, 146090 }, -- Ferocious Combatant's Felweave Raiment
				{ 107, 146092 }, -- Ferocious Combatant's Felweave Amice
				{ 108, 146094 }, -- Ferocious Combatant's Felweave Cord
				{ 109, 146096 }, -- Ferocious Combatant's Felweave Bracers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145643 }, -- Ferocious Gladiator's Felweave Cloak
				{ 2, 145837 }, -- Ferocious Gladiator's Felweave Treads
				{ 3, 145839 }, -- Ferocious Gladiator's Felweave Handguards
				{ 4, 145841 }, -- Ferocious Gladiator's Felweave Cowl
				{ 5, 145843 }, -- Ferocious Gladiator's Felweave Trousers
				{ 6, 145845 }, -- Ferocious Gladiator's Felweave Raiment
				{ 7, 145847 }, -- Ferocious Gladiator's Felweave Amice
				{ 8, 145849 }, -- Ferocious Gladiator's Felweave Cord
				{ 9, 145851 }, -- Ferocious Gladiator's Felweave Bracers
				{ 16, 145397 }, -- Ferocious Gladiator's Felweave Cloak
				{ 17, 145591 }, -- Ferocious Gladiator's Felweave Treads
				{ 18, 145593 }, -- Ferocious Gladiator's Felweave Handguards
				{ 19, 145595 }, -- Ferocious Gladiator's Felweave Cowl
				{ 20, 145597 }, -- Ferocious Gladiator's Felweave Trousers
				{ 21, 145599 }, -- Ferocious Gladiator's Felweave Raiment
				{ 22, 145601 }, -- Ferocious Gladiator's Felweave Amice
				{ 23, 145603 }, -- Ferocious Gladiator's Felweave Cord
				{ 24, 145605 }, -- Ferocious Gladiator's Felweave Bracers
				{ 101, 145889 }, -- Ferocious Combatant's Felweave Cloak
				{ 102, 146083 }, -- Ferocious Combatant's Felweave Treads
				{ 103, 146085 }, -- Ferocious Combatant's Felweave Handguards
				{ 104, 146087 }, -- Ferocious Combatant's Felweave Cowl
				{ 105, 146089 }, -- Ferocious Combatant's Felweave Trousers
				{ 106, 146091 }, -- Ferocious Combatant's Felweave Raiment
				{ 107, 146093 }, -- Ferocious Combatant's Felweave Amice
				{ 108, 146095 }, -- Ferocious Combatant's Felweave Cord
				{ 109, 146097 }, -- Ferocious Combatant's Felweave Bracers
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 145644 }, -- Ferocious Gladiator's Cloak of Battle
				{ 2, 145852 }, -- Ferocious Gladiator's Plate Chestpiece
				{ 3, 145854 }, -- Ferocious Gladiator's Plate Warboots
				{ 4, 145856 }, -- Ferocious Gladiator's Plate Gauntlets
				{ 5, 145858 }, -- Ferocious Gladiator's Plate Helm
				{ 6, 145860 }, -- Ferocious Gladiator's Plate Legguards
				{ 7, 145862 }, -- Ferocious Gladiator's Plate Shoulders
				{ 8, 145864 }, -- Ferocious Gladiator's Plate Girdle
				{ 9, 145866 }, -- Ferocious Gladiator's Plate Wristplates
				{ 16, 145398 }, -- Ferocious Gladiator's Cloak of Battle
				{ 17, 145606 }, -- Ferocious Gladiator's Plate Chestpiece
				{ 18, 145608 }, -- Ferocious Gladiator's Plate Warboots
				{ 19, 145610 }, -- Ferocious Gladiator's Plate Gauntlets
				{ 20, 145612 }, -- Ferocious Gladiator's Plate Helm
				{ 21, 145614 }, -- Ferocious Gladiator's Plate Legguards
				{ 22, 145616 }, -- Ferocious Gladiator's Plate Shoulders
				{ 23, 145618 }, -- Ferocious Gladiator's Plate Girdle
				{ 24, 145620 }, -- Ferocious Gladiator's Plate Wristplates
				{ 101, 145890 }, -- Ferocious Combatant's Cloak of Battle
				{ 102, 146098 }, -- Ferocious Combatant's Plate Chestpiece
				{ 103, 146100 }, -- Ferocious Combatant's Plate Warboots
				{ 104, 146102 }, -- Ferocious Combatant's Plate Gauntlets
				{ 105, 146104 }, -- Ferocious Combatant's Plate Helm
				{ 106, 146106 }, -- Ferocious Combatant's Plate Legguards
				{ 107, 146108 }, -- Ferocious Combatant's Plate Shoulders
				{ 108, 146110 }, -- Ferocious Combatant's Plate Girdle
				{ 109, 146112 }, -- Ferocious Combatant's Plate Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 145645 }, -- Ferocious Gladiator's Cloak of Battle
				{ 2, 145853 }, -- Ferocious Gladiator's Plate Chestpiece
				{ 3, 145855 }, -- Ferocious Gladiator's Plate Warboots
				{ 4, 145857 }, -- Ferocious Gladiator's Plate Gauntlets
				{ 5, 145859 }, -- Ferocious Gladiator's Plate Helm
				{ 6, 145861 }, -- Ferocious Gladiator's Plate Legguards
				{ 7, 145863 }, -- Ferocious Gladiator's Plate Shoulders
				{ 8, 145865 }, -- Ferocious Gladiator's Plate Girdle
				{ 9, 145867 }, -- Ferocious Gladiator's Plate Wristplates
				{ 16, 145399 }, -- Ferocious Gladiator's Cloak of Battle
				{ 17, 145607 }, -- Ferocious Gladiator's Plate Chestpiece
				{ 18, 145609 }, -- Ferocious Gladiator's Plate Warboots
				{ 19, 145611 }, -- Ferocious Gladiator's Plate Gauntlets
				{ 20, 145613 }, -- Ferocious Gladiator's Plate Helm
				{ 21, 145615 }, -- Ferocious Gladiator's Plate Legguards
				{ 22, 145617 }, -- Ferocious Gladiator's Plate Shoulders
				{ 23, 145619 }, -- Ferocious Gladiator's Plate Girdle
				{ 24, 145621 }, -- Ferocious Gladiator's Plate Wristplates
				{ 101, 145891 }, -- Ferocious Combatant's Cloak of Battle
				{ 102, 146099 }, -- Ferocious Combatant's Plate Chestpiece
				{ 103, 146101 }, -- Ferocious Combatant's Plate Warboots
				{ 104, 146103 }, -- Ferocious Combatant's Plate Gauntlets
				{ 105, 146105 }, -- Ferocious Combatant's Plate Helm
				{ 106, 146107 }, -- Ferocious Combatant's Plate Legguards
				{ 107, 146109 }, -- Ferocious Combatant's Plate Shoulders
				{ 108, 146111 }, -- Ferocious Combatant's Plate Girdle
				{ 109, 146113 }, -- Ferocious Combatant's Plate Wristplates
			},
		},
	},
}

data["LEGION4GEAR"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 4).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Legion Season %d Elite"], 4),
			[ALLIANCE_DIFF] = {
				{ 1, 146835, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Helm of the Ferocious Gladiator
				{ 2, 146836, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Chest of the Ferocious Gladiator
				{ 3, 146837, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Leggings of the Ferocious Gladiator
				{ 4, 146838, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Pauldrons of the Ferocious Gladiator
				{ 5, 146839, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Gloves of the Ferocious Gladiator
				{ 6, 146840, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Cinch of the Ferocious Gladiator
				{ 7, 146841, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Treads of the Ferocious Gladiator
				{ 8, 146842, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Bracers of the Ferocious Gladiator
				{ 9, 146843, [PRICE_EXTRA_ITTYPE] = "echoofdomination:100" }, -- Cloak of the Ferocious Gladiator
				-- Amulet
				{ 11, 145742 }, -- Ferocious Gladiator's Necklace
				{ 12, 145744 }, -- Ferocious Gladiator's Pendant
				{ 13, 145746 }, -- Ferocious Gladiator's Choker
				-- Ring
				{ 16, 145780 }, -- Ferocious Gladiator's Ring
				{ 17, 145782 }, -- Ferocious Gladiator's Band
				{ 18, 145784 }, -- Ferocious Gladiator's Signet
				-- Trinket
				{ 20, 145818 }, -- Ferocious Gladiator's Badge of Conquest
				{ 21, 145820 }, -- Ferocious Gladiator's Accolade of Conquest
				{ 22, 145822 }, -- Ferocious Gladiator's Insignia of Conquest
				{ 23, 145824 }, -- Ferocious Gladiator's Badge of Dominance
				{ 24, 145826 }, -- Ferocious Gladiator's Accolade of Dominance
				{ 25, 145828 }, -- Ferocious Gladiator's Insignia of Dominance
				{ 26, 145830 }, -- Ferocious Gladiator's Badge of Victory
				{ 27, 145832 }, -- Ferocious Gladiator's Accolade of Victory
				{ 28, 145834 }, -- Ferocious Gladiator's Insignia of Victory
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 11, 145743 }, -- Ferocious Gladiator's Necklace
				{ 12, 145745 }, -- Ferocious Gladiator's Pendant
				{ 13, 145747 }, -- Ferocious Gladiator's Choker
				-- Ring
				{ 16, 145781 }, -- Ferocious Gladiator's Ring
				{ 17, 145783 }, -- Ferocious Gladiator's Band
				{ 18, 145785 }, -- Ferocious Gladiator's Signet
				-- Trinket
				{ 20, 145819 }, -- Ferocious Gladiator's Badge of Conquest
				{ 21, 145821 }, -- Ferocious Gladiator's Accolade of Conquest
				{ 22, 145823 }, -- Ferocious Gladiator's Insignia of Conquest
				{ 23, 145825 }, -- Ferocious Gladiator's Badge of Dominance
				{ 24, 145827 }, -- Ferocious Gladiator's Accolade of Dominance
				{ 25, 145829 }, -- Ferocious Gladiator's Insignia of Dominance
				{ 26, 145831 }, -- Ferocious Gladiator's Badge of Victory
				{ 27, 145833 }, -- Ferocious Gladiator's Accolade of Victory
				{ 28, 145835 }, -- Ferocious Gladiator's Insignia of Victory
			},
		},
		{
			name = string.format(AL["Legion Season %d"], 4),
			[ALLIANCE_DIFF] = {
				{ 1, 146826, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Helm of the Ferocious Gladiator
				{ 2, 146827, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Chest of the Ferocious Gladiator
				{ 3, 146828, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Leggings of the Ferocious Gladiator
				{ 4, 146829, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Pauldrons of the Ferocious Gladiator
				{ 5, 146830, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Gloves of the Ferocious Gladiator
				{ 6, 146831, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Cinch of the Ferocious Gladiator
				{ 7, 146832, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Treads of the Ferocious Gladiator
				{ 8, 146833, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Bracers of the Ferocious Gladiator
				{ 9, 146834, [PRICE_EXTRA_ITTYPE] = "echoofbattle:100" }, -- Cloak of the Ferocious Gladiator
				-- Amulet
				{ 11, 145496 }, -- Ferocious Gladiator's Necklace
				{ 12, 145498 }, -- Ferocious Gladiator's Pendant
				{ 13, 145500 }, -- Ferocious Gladiator's Choker
				-- Tabard
				{ 15, 147339, [PRICE_EXTRA_ITTYPE] = "markofhonor:50" }, -- Ferocious Gladiator's Tabard
				-- Ring
				{ 16, 145534 }, -- Ferocious Gladiator's Ring
				{ 17, 145536 }, -- Ferocious Gladiator's Band
				{ 18, 145538 }, -- Ferocious Gladiator's Signet
				-- Trinket
				{ 20, 145572 }, -- Ferocious Gladiator's Badge of Conquest
				{ 21, 145574 }, -- Ferocious Gladiator's Accolade of Conquest
				{ 22, 145576 }, -- Ferocious Gladiator's Insignia of Conquest
				{ 23, 145578 }, -- Ferocious Gladiator's Badge of Dominance
				{ 24, 145580 }, -- Ferocious Gladiator's Accolade of Dominance
				{ 25, 145582 }, -- Ferocious Gladiator's Insignia of Dominance
				{ 26, 145584 }, -- Ferocious Gladiator's Badge of Victory
				{ 27, 145586 }, -- Ferocious Gladiator's Accolade of Victory
				{ 28, 145588 }, -- Ferocious Gladiator's Insignia of Victory
				-- Cloak
				{ 30, 147364 }, -- Ferocious Gladiator's Cloak
				-- Amulet
				{ 111, 145988 }, -- Ferocious Combatant's Necklace
				{ 112, 145990 }, -- Ferocious Combatant's Pendant
				{ 113, 145992 }, -- Ferocious Combatant's Choker
				-- Others
				{ 115, 147778, [PRICE_EXTRA_ITTYPE] = "markofhonor:15" }, -- Enchanter's Illusion - Demonic Tyranny
				-- Ring
				{ 116, 146026 }, -- Ferocious Combatant's Ring
				{ 117, 146028 }, -- Ferocious Combatant's Band
				{ 118, 146030 }, -- Ferocious Combatant's Signet
				-- Trinket
				{ 120, 146064 }, -- Ferocious Combatant's Badge of Conquest
				{ 121, 146066 }, -- Ferocious Combatant's Accolade of Conquest
				{ 122, 146068 }, -- Ferocious Combatant's Insignia of Conquest
				{ 123, 146070 }, -- Ferocious Combatant's Badge of Dominance
				{ 124, 146071 }, -- Ferocious Combatant's Badge of Dominance
				{ 125, 146072 }, -- Ferocious Combatant's Accolade of Dominance
				{ 126, 146073 }, -- Ferocious Combatant's Accolade of Dominance
				{ 127, 146074 }, -- Ferocious Combatant's Insignia of Dominance
				{ 128, 146075 }, -- Ferocious Combatant's Insignia of Dominance
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 11, 145497 }, -- Ferocious Gladiator's Necklace
				{ 12, 145499 }, -- Ferocious Gladiator's Pendant
				{ 13, 145501 }, -- Ferocious Gladiator's Choker
				-- Tabard
				{ 15, 147338, [PRICE_EXTRA_ITTYPE] = "markofhonor:50" }, -- Ferocious Gladiator's Tabard
				-- Ring
				{ 16, 145535 }, -- Ferocious Gladiator's Ring
				{ 17, 145537 }, -- Ferocious Gladiator's Band
				{ 18, 145539 }, -- Ferocious Gladiator's Signet
				-- Trinket
				{ 20, 145573 }, -- Ferocious Gladiator's Badge of Conquest
				{ 21, 145575 }, -- Ferocious Gladiator's Accolade of Conquest
				{ 22, 145577 }, -- Ferocious Gladiator's Insignia of Conquest
				{ 23, 145579 }, -- Ferocious Gladiator's Badge of Dominance
				{ 24, 145581 }, -- Ferocious Gladiator's Accolade of Dominance
				{ 25, 145583 }, -- Ferocious Gladiator's Insignia of Dominance
				{ 26, 145585 }, -- Ferocious Gladiator's Badge of Victory
				{ 27, 145587 }, -- Ferocious Gladiator's Accolade of Victory
				{ 28, 145589 }, -- Ferocious Gladiator's Insignia of Victory
				-- Cloak
				{ 30, 147363 }, -- Ferocious Gladiator's Cloak
				-- Amulet
				{ 111, 145989 }, -- Ferocious Combatant's Necklace
				{ 112, 145991 }, -- Ferocious Combatant's Pendant
				{ 113, 145993 }, -- Ferocious Combatant's Choker
				-- Ring
				{ 116, 146027 }, -- Ferocious Combatant's Ring
				{ 117, 146029 }, -- Ferocious Combatant's Band
				{ 118, 146031 }, -- Ferocious Combatant's Signet
				-- Trinket
				{ 120, 146065 }, -- Ferocious Combatant's Badge of Conquest
				{ 121, 146067 }, -- Ferocious Combatant's Accolade of Conquest
				{ 122, 146069 }, -- Ferocious Combatant's Insignia of Conquest
				{ 123, 146076 }, -- Ferocious Combatant's Badge of Victory
				{ 124, 146077 }, -- Ferocious Combatant's Badge of Victory
				{ 125, 146078 }, -- Ferocious Combatant's Accolade of Victory
				{ 126, 146079 }, -- Ferocious Combatant's Accolade of Victory
				{ 127, 146080 }, -- Ferocious Combatant's Insignia of Victory
				{ 128, 146081 }, -- Ferocious Combatant's Insignia of Victory
			},
		},
	},
}

data["LEGION3SET"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 3).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 147625 }, -- Ensemble: Elite Cruel Gladiator's Dreadplate Armor
				{ 3, 144780 }, -- Cruel Gladiator's Dreadcloak
				{ 4, 144804 }, -- Cruel Gladiator's Dreadplate Chestpiece
				{ 5, 144806 }, -- Cruel Gladiator's Dreadplate Sabatons
				{ 6, 144808 }, -- Cruel Gladiator's Dreadplate Gauntlets
				{ 7, 144810 }, -- Cruel Gladiator's Dreadplate Helm
				{ 8, 144812 }, -- Cruel Gladiator's Dreadplate Legguards
				{ 9, 144814 }, -- Cruel Gladiator's Dreadplate Shoulders
				{ 10, 144816 }, -- Cruel Gladiator's Dreadplate Girdle
				{ 11, 144818 }, -- Cruel Gladiator's Dreadplate Wristplates
				{ 16, 147650 }, -- Ensemble: Cruel Gladiator's Dreadplate Armor
				{ 18, 144534 }, -- Cruel Gladiator's Dreadcloak
				{ 19, 144558 }, -- Cruel Gladiator's Dreadplate Chestpiece
				{ 20, 144560 }, -- Cruel Gladiator's Dreadplate Sabatons
				{ 21, 144562 }, -- Cruel Gladiator's Dreadplate Gauntlets
				{ 22, 144564 }, -- Cruel Gladiator's Dreadplate Helm
				{ 23, 144566 }, -- Cruel Gladiator's Dreadplate Legguards
				{ 24, 144568 }, -- Cruel Gladiator's Dreadplate Shoulders
				{ 25, 144570 }, -- Cruel Gladiator's Dreadplate Girdle
				{ 26, 144572 }, -- Cruel Gladiator's Dreadplate Wristplates
				{ 101, 147677 }, -- Ensemble: Cruel Combatant's Dreadplate Armor
				{ 103, 145026 }, -- Cruel Combatant's Dreadcloak
				{ 104, 145050 }, -- Cruel Combatant's Dreadplate Chestpiece
				{ 105, 145052 }, -- Cruel Combatant's Dreadplate Sabatons
				{ 106, 145054 }, -- Cruel Combatant's Dreadplate Gauntlets
				{ 107, 145056 }, -- Cruel Combatant's Dreadplate Helm
				{ 108, 145058 }, -- Cruel Combatant's Dreadplate Legguards
				{ 109, 145060 }, -- Cruel Combatant's Dreadplate Shoulders
				{ 110, 145062 }, -- Cruel Combatant's Dreadplate Girdle
				{ 111, 145064 }, -- Cruel Combatant's Dreadplate Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147626 }, -- Ensemble: Elite Cruel Gladiator's Dreadplate Armor
				{ 3, 144781 }, -- Cruel Gladiator's Dreadcloak
				{ 4, 144805 }, -- Cruel Gladiator's Dreadplate Chestpiece
				{ 5, 144807 }, -- Cruel Gladiator's Dreadplate Sabatons
				{ 6, 144809 }, -- Cruel Gladiator's Dreadplate Gauntlets
				{ 7, 144811 }, -- Cruel Gladiator's Dreadplate Helm
				{ 8, 144813 }, -- Cruel Gladiator's Dreadplate Legguards
				{ 9, 144815 }, -- Cruel Gladiator's Dreadplate Shoulders
				{ 10, 144817 }, -- Cruel Gladiator's Dreadplate Girdle
				{ 11, 144819 }, -- Cruel Gladiator's Dreadplate Wristplates
				{ 16, 147649 }, -- Ensemble: Cruel Gladiator's Dreadplate Armor
				{ 18, 144535 }, -- Cruel Gladiator's Dreadcloak
				{ 19, 144559 }, -- Cruel Gladiator's Dreadplate Chestpiece
				{ 20, 144561 }, -- Cruel Gladiator's Dreadplate Sabatons
				{ 21, 144563 }, -- Cruel Gladiator's Dreadplate Gauntlets
				{ 22, 144565 }, -- Cruel Gladiator's Dreadplate Helm
				{ 23, 144567 }, -- Cruel Gladiator's Dreadplate Legguards
				{ 24, 144569 }, -- Cruel Gladiator's Dreadplate Shoulders
				{ 25, 144571 }, -- Cruel Gladiator's Dreadplate Girdle
				{ 26, 144573 }, -- Cruel Gladiator's Dreadplate Wristplates
				{ 101, 147678 }, -- Ensemble: Cruel Combatant's Dreadplate Armor
				{ 103, 145027 }, -- Cruel Combatant's Dreadcloak
				{ 104, 145051 }, -- Cruel Combatant's Dreadplate Chestpiece
				{ 105, 145053 }, -- Cruel Combatant's Dreadplate Sabatons
				{ 106, 145055 }, -- Cruel Combatant's Dreadplate Gauntlets
				{ 107, 145057 }, -- Cruel Combatant's Dreadplate Helm
				{ 108, 145059 }, -- Cruel Combatant's Dreadplate Legguards
				{ 109, 145061 }, -- Cruel Combatant's Dreadplate Shoulders
				{ 110, 145063 }, -- Cruel Combatant's Dreadplate Girdle
				{ 111, 145065 }, -- Cruel Combatant's Dreadplate Wristplates
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 147627 }, -- Ensemble: Elite Cruel Gladiator's Felskin Armor
				{ 3, 144782 }, -- Cruel Gladiator's Demonthread Cloak
				{ 4, 144820 }, -- Cruel Gladiator's Felskin Tunic
				{ 5, 144822 }, -- Cruel Gladiator's Felskin Boots
				{ 6, 144824 }, -- Cruel Gladiator's Felskin Gloves
				{ 7, 144826 }, -- Cruel Gladiator's Felskin Helm
				{ 8, 144828 }, -- Cruel Gladiator's Felskin Legguards
				{ 9, 144830 }, -- Cruel Gladiator's Felskin Spaulders
				{ 10, 144832 }, -- Cruel Gladiator's Felskin Belt
				{ 11, 144834 }, -- Cruel Gladiator's Felskin Wristguards
				{ 16, 147651 }, -- Ensemble: Cruel Gladiator's Felskin Armor
				{ 18, 144536 }, -- Cruel Gladiator's Demonthread Cloak
				{ 19, 144574 }, -- Cruel Gladiator's Felskin Tunic
				{ 20, 144576 }, -- Cruel Gladiator's Felskin Boots
				{ 21, 144578 }, -- Cruel Gladiator's Felskin Gloves
				{ 22, 144580 }, -- Cruel Gladiator's Felskin Helm
				{ 23, 144582 }, -- Cruel Gladiator's Felskin Legguards
				{ 24, 144584 }, -- Cruel Gladiator's Felskin Spaulders
				{ 25, 144586 }, -- Cruel Gladiator's Felskin Belt
				{ 26, 144588 }, -- Cruel Gladiator's Felskin Wristguards
				{ 101, 147680 }, -- Ensemble: Cruel Combatant's Felskin Armor
				{ 103, 145028 }, -- Cruel Combatant's Demonthread Cloak
				{ 104, 145066 }, -- Cruel Combatant's Felskin Tunic
				{ 105, 145068 }, -- Cruel Combatant's Felskin Boots
				{ 106, 145070 }, -- Cruel Combatant's Felskin Gloves
				{ 107, 145072 }, -- Cruel Combatant's Felskin Helm
				{ 108, 145074 }, -- Cruel Combatant's Felskin Legguards
				{ 109, 145076 }, -- Cruel Combatant's Felskin Spaulders
				{ 110, 145078 }, -- Cruel Combatant's Felskin Belt
				{ 111, 145080 }, -- Cruel Combatant's Felskin Wristguards

			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147628 }, -- Ensemble: Elite Cruel Gladiator's Felskin Armor
				{ 3, 144783 }, -- Cruel Gladiator's Demonthread Cloak
				{ 4, 144821 }, -- Cruel Gladiator's Felskin Tunic
				{ 5, 144823 }, -- Cruel Gladiator's Felskin Boots
				{ 6, 144825 }, -- Cruel Gladiator's Felskin Gloves
				{ 7, 144827 }, -- Cruel Gladiator's Felskin Helm
				{ 8, 144829 }, -- Cruel Gladiator's Felskin Legguards
				{ 9, 144831 }, -- Cruel Gladiator's Felskin Spaulders
				{ 10, 144833 }, -- Cruel Gladiator's Felskin Belt
				{ 11, 144835 }, -- Cruel Gladiator's Felskin Wristguards
				{ 16, 147652 }, -- Ensemble: Cruel Gladiator's Felskin Armor
				{ 18, 144537 }, -- Cruel Gladiator's Demonthread Cloak
				{ 19, 144575 }, -- Cruel Gladiator's Felskin Tunic
				{ 20, 144577 }, -- Cruel Gladiator's Felskin Boots
				{ 21, 144579 }, -- Cruel Gladiator's Felskin Gloves
				{ 22, 144581 }, -- Cruel Gladiator's Felskin Helm
				{ 23, 144583 }, -- Cruel Gladiator's Felskin Legguards
				{ 24, 144585 }, -- Cruel Gladiator's Felskin Spaulders
				{ 25, 144587 }, -- Cruel Gladiator's Felskin Belt
				{ 26, 144589 }, -- Cruel Gladiator's Felskin Wristguards
				{ 101, 147679 }, -- Ensemble: Cruel Combatant's Felskin Armor
				{ 103, 145029 }, -- Cruel Combatant's Demonthread Cloak
				{ 104, 145067 }, -- Cruel Combatant's Felskin Tunic
				{ 105, 145069 }, -- Cruel Combatant's Felskin Boots
				{ 106, 145071 }, -- Cruel Combatant's Felskin Gloves
				{ 107, 145073 }, -- Cruel Combatant's Felskin Helm
				{ 108, 145075 }, -- Cruel Combatant's Felskin Legguards
				{ 109, 145077 }, -- Cruel Combatant's Felskin Spaulders
				{ 110, 145079 }, -- Cruel Combatant's Felskin Belt
				{ 111, 145081 }, -- Cruel Combatant's Felskin Wristguards
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 147623 }, -- Ensemble: Elite Cruel Gladiator's Dragonhide Armor
				{ 3, 144784 }, -- Cruel Gladiator's Dragonhide Cloak
				{ 4, 144836 }, -- Cruel Gladiator's Dragonhide Robe
				{ 5, 144838 }, -- Cruel Gladiator's Dragonhide Moccasins
				{ 6, 144840 }, -- Cruel Gladiator's Dragonhide Gloves
				{ 7, 144842 }, -- Cruel Gladiator's Dragonhide Helm
				{ 8, 144844 }, -- Cruel Gladiator's Dragonhide Legguards
				{ 9, 144846 }, -- Cruel Gladiator's Dragonhide Spaulders
				{ 10, 144848 }, -- Cruel Gladiator's Dragonhide Belt
				{ 11, 144850 }, -- Cruel Gladiator's Dragonhide Wristguards
				{ 16, 147647 }, -- Ensemble: Cruel Gladiator's Dragonhide Armor
				{ 18, 144538 }, -- Cruel Gladiator's Dragonhide Cloak
				{ 19, 144590 }, -- Cruel Gladiator's Dragonhide Robe
				{ 20, 144592 }, -- Cruel Gladiator's Dragonhide Moccasins
				{ 21, 144594 }, -- Cruel Gladiator's Dragonhide Gloves
				{ 22, 144596 }, -- Cruel Gladiator's Dragonhide Helm
				{ 23, 144598 }, -- Cruel Gladiator's Dragonhide Legguards
				{ 24, 144600 }, -- Cruel Gladiator's Dragonhide Spaulders
				{ 25, 144602 }, -- Cruel Gladiator's Dragonhide Belt
				{ 26, 144604 }, -- Cruel Gladiator's Dragonhide Wristguards
				{ 101, 147675 }, -- Ensemble: Cruel Combatant's Dragonhide Armor
				{ 103, 145030 }, -- Cruel Combatant's Dragonhide Cloak
				{ 104, 145082 }, -- Cruel Combatant's Dragonhide Tunic
				{ 105, 145084 }, -- Cruel Combatant's Dragonhide Moccasins
				{ 106, 145086 }, -- Cruel Combatant's Dragonhide Gloves
				{ 107, 145088 }, -- Cruel Combatant's Dragonhide Helm
				{ 108, 145090 }, -- Cruel Combatant's Dragonhide Legguards
				{ 109, 145092 }, -- Cruel Combatant's Dragonhide Spaulders
				{ 110, 145094 }, -- Cruel Combatant's Dragonhide Belt
				{ 111, 145096 }, -- Cruel Combatant's Dragonhide Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147624 }, -- Ensemble: Elite Cruel Gladiator's Dragonhide Armor
				{ 3, 144785 }, -- Cruel Gladiator's Dragonhide Cloak
				{ 4, 144837 }, -- Cruel Gladiator's Dragonhide Robe
				{ 5, 144839 }, -- Cruel Gladiator's Dragonhide Moccasins
				{ 6, 144841 }, -- Cruel Gladiator's Dragonhide Gloves
				{ 7, 144843 }, -- Cruel Gladiator's Dragonhide Helm
				{ 8, 144845 }, -- Cruel Gladiator's Dragonhide Legguards
				{ 9, 144847 }, -- Cruel Gladiator's Dragonhide Spaulders
				{ 10, 144849 }, -- Cruel Gladiator's Dragonhide Belt
				{ 11, 144851 }, -- Cruel Gladiator's Dragonhide Wristguards
				{ 16, 147648 }, -- Ensemble: Cruel Gladiator's Dragonhide Armor
				{ 18, 144539 }, -- Cruel Gladiator's Dragonhide Cloak
				{ 19, 144591 }, -- Cruel Gladiator's Dragonhide Robe
				{ 20, 144593 }, -- Cruel Gladiator's Dragonhide Moccasins
				{ 21, 144595 }, -- Cruel Gladiator's Dragonhide Gloves
				{ 22, 144597 }, -- Cruel Gladiator's Dragonhide Helm
				{ 23, 144599 }, -- Cruel Gladiator's Dragonhide Legguards
				{ 24, 144601 }, -- Cruel Gladiator's Dragonhide Spaulders
				{ 25, 144603 }, -- Cruel Gladiator's Dragonhide Belt
				{ 26, 144605 }, -- Cruel Gladiator's Dragonhide Wristguards
				{ 101, 147676 }, -- Ensemble: Cruel Combatant's Dragonhide Armor
				{ 103, 145031 }, -- Cruel Combatant's Dragonhide Cloak
				{ 104, 145083 }, -- Cruel Combatant's Dragonhide Tunic
				{ 105, 145085 }, -- Cruel Combatant's Dragonhide Moccasins
				{ 106, 145087 }, -- Cruel Combatant's Dragonhide Gloves
				{ 107, 145089 }, -- Cruel Combatant's Dragonhide Helm
				{ 108, 145091 }, -- Cruel Combatant's Dragonhide Legguards
				{ 109, 145093 }, -- Cruel Combatant's Dragonhide Spaulders
				{ 110, 145095 }, -- Cruel Combatant's Dragonhide Belt
				{ 111, 145097 }, -- Cruel Combatant's Dragonhide Wristguards
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 147621 }, -- Ensemble: Elite Cruel Gladiator's Chain Armor
				{ 3, 144786 }, -- Cruel Gladiator's Drape of the Tracker
				{ 4, 144852 }, -- Cruel Gladiator's Chain Armor
				{ 5, 144854 }, -- Cruel Gladiator's Chain Treads
				{ 6, 144856 }, -- Cruel Gladiator's Chain Gauntlets
				{ 7, 144858 }, -- Cruel Gladiator's Chain Helm
				{ 8, 144860 }, -- Cruel Gladiator's Chain Leggings
				{ 9, 144862 }, -- Cruel Gladiator's Chain Spaulders
				{ 10, 144864 }, -- Cruel Gladiator's Chain Clasp
				{ 11, 144866 }, -- Cruel Gladiator's Chain Armband
				{ 16, 147646 }, -- Ensemble: Cruel Gladiator's Chain Armor
				{ 18, 144540 }, -- Cruel Gladiator's Drape of the Tracker
				{ 19, 144606 }, -- Cruel Gladiator's Chain Armor
				{ 20, 144608 }, -- Cruel Gladiator's Chain Treads
				{ 21, 144610 }, -- Cruel Gladiator's Chain Gauntlets
				{ 22, 144612 }, -- Cruel Gladiator's Chain Helm
				{ 23, 144614 }, -- Cruel Gladiator's Chain Leggings
				{ 24, 144616 }, -- Cruel Gladiator's Chain Spaulders
				{ 25, 144618 }, -- Cruel Gladiator's Chain Clasp
				{ 26, 144620 }, -- Cruel Gladiator's Chain Armband
				{ 101, 147689 }, -- Ensemble: Cruel Combatant's Chain Armor
				{ 103, 145032 }, -- Cruel Combatant's Drape of the Tracker
				{ 104, 145098 }, -- Cruel Combatant's Chain Armor
				{ 105, 145100 }, -- Cruel Combatant's Chain Treads
				{ 106, 145102 }, -- Cruel Combatant's Chain Gauntlets
				{ 107, 145104 }, -- Cruel Combatant's Chain Helm
				{ 108, 145106 }, -- Cruel Combatant's Chain Leggings
				{ 109, 145108 }, -- Cruel Combatant's Chain Spaulders
				{ 110, 145110 }, -- Cruel Combatant's Chain Clasp
				{ 111, 145112 }, -- Cruel Combatant's Chain Armband
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147622 }, -- Ensemble: Elite Cruel Gladiator's Chain Armor
				{ 3 , 144787 }, -- Cruel Gladiator's Drape of the Tracker
				{ 4 , 144853 }, -- Cruel Gladiator's Chain Armor
				{ 5 , 144855 }, -- Cruel Gladiator's Chain Treads
				{ 6 , 144857 }, -- Cruel Gladiator's Chain Gauntlets
				{ 7 , 144859 }, -- Cruel Gladiator's Chain Helm
				{ 8 , 144861 }, -- Cruel Gladiator's Chain Leggings
				{ 9 , 144863 }, -- Cruel Gladiator's Chain Spaulders
				{ 10, 144865 }, -- Cruel Gladiator's Chain Clasp
				{ 11, 144867 }, -- Cruel Gladiator's Chain Armband
				{ 16, 147645 }, -- Ensemble: Cruel Gladiator's Chain Armor
				{ 18, 144541 }, -- Cruel Gladiator's Drape of the Tracker
				{ 19, 144607 }, -- Cruel Gladiator's Chain Armor
				{ 20, 144609 }, -- Cruel Gladiator's Chain Treads
				{ 21, 144611 }, -- Cruel Gladiator's Chain Gauntlets
				{ 22, 144613 }, -- Cruel Gladiator's Chain Helm
				{ 23, 144615 }, -- Cruel Gladiator's Chain Leggings
				{ 24, 144617 }, -- Cruel Gladiator's Chain Spaulders
				{ 25, 144619 }, -- Cruel Gladiator's Chain Clasp
				{ 26, 144621 }, -- Cruel Gladiator's Chain Armband
				{ 101, 147690 }, -- Ensemble: Cruel Combatant's Chain Armor
				{ 103, 145033 }, -- Cruel Combatant's Drape of the Tracker
				{ 104, 145099 }, -- Cruel Combatant's Chain Armor
				{ 105, 145101 }, -- Cruel Combatant's Chain Treads
				{ 106, 145103 }, -- Cruel Combatant's Chain Gauntlets
				{ 107, 145105 }, -- Cruel Combatant's Chain Helm
				{ 108, 145107 }, -- Cruel Combatant's Chain Leggings
				{ 109, 145109 }, -- Cruel Combatant's Chain Spaulders
				{ 110, 145111 }, -- Cruel Combatant's Chain Clasp
				{ 111, 145113 }, -- Cruel Combatant's Chain Armband
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 147644 }, -- Ensemble: Elite Cruel Gladiator's Silk Armor
				{ 3 , 144788 }, -- Cruel Gladiator's Silken Shawl
				{ 4 , 144868 }, -- Cruel Gladiator's Silk Treads
				{ 5 , 144870 }, -- Cruel Gladiator's Silk Handguards
				{ 6 , 144872 }, -- Cruel Gladiator's Silk Cowl
				{ 7 , 144874 }, -- Cruel Gladiator's Silk Trousers
				{ 8 , 144876 }, -- Cruel Gladiator's Silk Robe
				{ 9 , 144878 }, -- Cruel Gladiator's Silk Amice
				{ 10, 144880 }, -- Cruel Gladiator's Silk Cord
				{ 11, 144882 }, -- Cruel Gladiator's Silk Bracers
				{ 16, 147668 }, -- Ensemble: Cruel Gladiator's Silk Armor
				{ 18, 144542 }, -- Cruel Gladiator's Silken Shawl
				{ 19, 144622 }, -- Cruel Gladiator's Silk Treads
				{ 20, 144624 }, -- Cruel Gladiator's Silk Handguards
				{ 21, 144626 }, -- Cruel Gladiator's Silk Cowl
				{ 22, 144628 }, -- Cruel Gladiator's Silk Trousers
				{ 23, 144630 }, -- Cruel Gladiator's Silk Robe
				{ 24, 144632 }, -- Cruel Gladiator's Silk Amice
				{ 25, 144634 }, -- Cruel Gladiator's Silk Cord
				{ 26, 144636 }, -- Cruel Gladiator's Silk Bracers
				{ 101, 147695 }, -- Ensemble: Cruel Combatant's Silk Armor
				{ 103, 145034 }, -- Cruel Combatant's Silken Shawl
				{ 104, 145114 }, -- Cruel Combatant's Silk Treads
				{ 105, 145116 }, -- Cruel Combatant's Silk Handguards
				{ 106, 145118 }, -- Cruel Combatant's Silk Cowl
				{ 107, 145120 }, -- Cruel Combatant's Silk Trousers
				{ 108, 145122 }, -- Cruel Combatant's Silk Robe
				{ 109, 145124 }, -- Cruel Combatant's Silk Amice
				{ 110, 145126 }, -- Cruel Combatant's Silk Cord
				{ 111, 145128 }, -- Cruel Combatant's Silk Bracers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147643 }, -- Ensemble: Elite Cruel Gladiator's Silk Armor
				{ 3 , 144789 }, -- Cruel Gladiator's Silken Shawl
				{ 4 , 144869 }, -- Cruel Gladiator's Silk Treads
				{ 5 , 144871 }, -- Cruel Gladiator's Silk Handguards
				{ 6 , 144873 }, -- Cruel Gladiator's Silk Cowl
				{ 7 , 144875 }, -- Cruel Gladiator's Silk Trousers
				{ 8 , 144877 }, -- Cruel Gladiator's Silk Robe
				{ 9 , 144879 }, -- Cruel Gladiator's Silk Amice
				{ 10, 144881 }, -- Cruel Gladiator's Silk Cord
				{ 11, 144883 }, -- Cruel Gladiator's Silk Bracers
				{ 16, 147667 }, -- Ensemble: Cruel Gladiator's Silk Armor
				{ 18, 144543 }, -- Cruel Gladiator's Silken Shawl
				{ 19, 144623 }, -- Cruel Gladiator's Silk Treads
				{ 20, 144625 }, -- Cruel Gladiator's Silk Handguards
				{ 21, 144627 }, -- Cruel Gladiator's Silk Cowl
				{ 22, 144629 }, -- Cruel Gladiator's Silk Trousers
				{ 23, 144631 }, -- Cruel Gladiator's Silk Robe
				{ 24, 144633 }, -- Cruel Gladiator's Silk Amice
				{ 25, 144635 }, -- Cruel Gladiator's Silk Cord
				{ 26, 144637 }, -- Cruel Gladiator's Silk Bracers
				{ 101, 147696 }, -- Ensemble: Cruel Combatant's Silk Armor
				{ 103, 145035 }, -- Cruel Combatant's Silken Shawl
				{ 104, 145115 }, -- Cruel Combatant's Silk Treads
				{ 105, 145117 }, -- Cruel Combatant's Silk Handguards
				{ 106, 145119 }, -- Cruel Combatant's Silk Cowl
				{ 107, 145121 }, -- Cruel Combatant's Silk Trousers
				{ 108, 145123 }, -- Cruel Combatant's Silk Robe
				{ 109, 145125 }, -- Cruel Combatant's Silk Amice
				{ 110, 145127 }, -- Cruel Combatant's Silk Cord
				{ 111, 145129 }, -- Cruel Combatant's Silk Bracers
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 147632 }, -- Ensemble: Elite Cruel Gladiator's Ironskin Armor
				{ 3 , 144790 }, -- Cruel Gladiator's Ironskin Cloak
				{ 4 , 144884 }, -- Cruel Gladiator's Ironskin Slippers
				{ 5 , 144886 }, -- Cruel Gladiator's Ironskin Gloves
				{ 6 , 144888 }, -- Cruel Gladiator's Ironskin Helm
				{ 7 , 144890 }, -- Cruel Gladiator's Ironskin Legguards
				{ 8 , 144892 }, -- Cruel Gladiator's Ironskin Spaulders
				{ 9 , 144894 }, -- Cruel Gladiator's Ironskin Tunic
				{ 10, 144896 }, -- Cruel Gladiator's Ironskin Belt
				{ 11, 144898 }, -- Cruel Gladiator's Ironskin Wristguards
				{ 16, 147656 }, -- Ensemble: Cruel Gladiator's Ironskin Armor
				{ 18, 144544 }, -- Cruel Gladiator's Ironskin Cloak
				{ 19, 144638 }, -- Cruel Gladiator's Ironskin Slippers
				{ 20, 144640 }, -- Cruel Gladiator's Ironskin Gloves
				{ 21, 144642 }, -- Cruel Gladiator's Ironskin Helm
				{ 22, 144644 }, -- Cruel Gladiator's Ironskin Legguards
				{ 23, 144646 }, -- Cruel Gladiator's Ironskin Spaulders
				{ 24, 144648 }, -- Cruel Gladiator's Ironskin Tunic
				{ 25, 144650 }, -- Cruel Gladiator's Ironskin Belt
				{ 26, 144652 }, -- Cruel Gladiator's Ironskin Wristguards
				{ 101, 147683 }, -- Ensemble: Cruel Combatant's Ironskin Armor
				{ 103, 145036 }, -- Cruel Combatant's Ironskin Cloak
				{ 104, 145130 }, -- Cruel Combatant's Ironskin Slippers
				{ 105, 145132 }, -- Cruel Combatant's Ironskin Gloves
				{ 106, 145134 }, -- Cruel Combatant's Ironskin Helm
				{ 107, 145136 }, -- Cruel Combatant's Ironskin Legguards
				{ 108, 145138 }, -- Cruel Combatant's Ironskin Spaulders
				{ 109, 145140 }, -- Cruel Combatant's Ironskin Tunic
				{ 110, 145142 }, -- Cruel Combatant's Ironskin Belt
				{ 111, 145144 }, -- Cruel Combatant's Ironskin Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147631 }, -- Ensemble: Elite Cruel Gladiator's Ironskin Armor
				{ 3 , 144791 }, -- Cruel Gladiator's Ironskin Cloak
				{ 4 , 144885 }, -- Cruel Gladiator's Ironskin Slippers
				{ 5 , 144887 }, -- Cruel Gladiator's Ironskin Gloves
				{ 6 , 144889 }, -- Cruel Gladiator's Ironskin Helm
				{ 7 , 144891 }, -- Cruel Gladiator's Ironskin Legguards
				{ 8 , 144893 }, -- Cruel Gladiator's Ironskin Spaulders
				{ 9 , 144895 }, -- Cruel Gladiator's Ironskin Tunic
				{ 10, 144897 }, -- Cruel Gladiator's Ironskin Belt
				{ 11, 144899 }, -- Cruel Gladiator's Ironskin Wristguards
				{ 16, 147655 }, -- Ensemble: Cruel Gladiator's Ironskin Armor
				{ 18, 144545 }, -- Cruel Gladiator's Ironskin Cloak
				{ 19, 144639 }, -- Cruel Gladiator's Ironskin Slippers
				{ 20, 144641 }, -- Cruel Gladiator's Ironskin Gloves
				{ 21, 144643 }, -- Cruel Gladiator's Ironskin Helm
				{ 22, 144645 }, -- Cruel Gladiator's Ironskin Legguards
				{ 23, 144647 }, -- Cruel Gladiator's Ironskin Spaulders
				{ 24, 144649 }, -- Cruel Gladiator's Ironskin Tunic
				{ 25, 144651 }, -- Cruel Gladiator's Ironskin Belt
				{ 26, 144653 }, -- Cruel Gladiator's Ironskin Wristguards
				{ 101, 147684 }, -- Ensemble: Cruel Combatant's Ironskin Armor
				{ 103, 145037 }, -- Cruel Combatant's Ironskin Cloak
				{ 104, 145131 }, -- Cruel Combatant's Ironskin Slippers
				{ 105, 145133 }, -- Cruel Combatant's Ironskin Gloves
				{ 106, 145135 }, -- Cruel Combatant's Ironskin Helm
				{ 107, 145137 }, -- Cruel Combatant's Ironskin Legguards
				{ 108, 145139 }, -- Cruel Combatant's Ironskin Spaulders
				{ 109, 145141 }, -- Cruel Combatant's Ironskin Tunic
				{ 110, 145143 }, -- Cruel Combatant's Ironskin Belt
				{ 111, 145145 }, -- Cruel Combatant's Ironskin Wristguards
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 147642 }, -- Ensemble: Elite Cruel Gladiator's Scaled Armor
				{ 3 , 144792 }, -- Cruel Gladiator's Greatcloak of Faith
				{ 4 , 144906 }, -- Cruel Gladiator's Scaled Breastplate
				{ 5 , 144908 }, -- Cruel Gladiator's Scaled Sabatons
				{ 6 , 144910 }, -- Cruel Gladiator's Scaled Gauntlets
				{ 7 , 144912 }, -- Cruel Gladiator's Scaled Helm
				{ 8 , 144914 }, -- Cruel Gladiator's Scaled Legguards
				{ 9 , 144916 }, -- Cruel Gladiator's Scaled Shoulders
				{ 10, 144918 }, -- Cruel Gladiator's Scaled Girdle
				{ 11, 144920 }, -- Cruel Gladiator's Scaled Wristplates
				{ 16, 147665 }, -- Ensemble: Cruel Gladiator's Scaled Armor
				{ 18, 144546 }, -- Cruel Gladiator's Greatcloak of Faith
				{ 19, 144661 }, -- Cruel Gladiator's Scaled Sabatons
				{ 20, 144663 }, -- Cruel Gladiator's Scaled Gauntlets
				{ 21, 144665 }, -- Cruel Gladiator's Scaled Helm
				{ 22, 144667 }, -- Cruel Gladiator's Scaled Legguards
				{ 23, 144669 }, -- Cruel Gladiator's Scaled Breastplate
				{ 24, 144670 }, -- Cruel Gladiator's Scaled Shoulders
				{ 25, 144672 }, -- Cruel Gladiator's Scaled Girdle
				{ 26, 144674 }, -- Cruel Gladiator's Scaled Wristplates
				{ 101, 147693 }, -- Ensemble: Cruel Combatant's Scaled Armor
				{ 103, 145038 }, -- Cruel Combatant's Greatcloak of Faith
				{ 104, 145152 }, -- Cruel Combatant's Scaled Chestpiece
				{ 105, 145154 }, -- Cruel Combatant's Scaled Sabatons
				{ 106, 145156 }, -- Cruel Combatant's Scaled Gauntlets
				{ 107, 145158 }, -- Cruel Combatant's Scaled Helm
				{ 108, 145160 }, -- Cruel Combatant's Scaled Legguards
				{ 109, 145162 }, -- Cruel Combatant's Scaled Shoulders
				{ 110, 145164 }, -- Cruel Combatant's Scaled Girdle
				{ 111, 145166 }, -- Cruel Combatant's Scaled Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147641 }, -- Ensemble: Elite Cruel Gladiator's Scaled Armor
				{ 3 , 144793 }, -- Cruel Gladiator's Greatcloak of Faith
				{ 4 , 144907 }, -- Cruel Gladiator's Scaled Breastplate
				{ 5 , 144909 }, -- Cruel Gladiator's Scaled Sabatons
				{ 6 , 144911 }, -- Cruel Gladiator's Scaled Gauntlets
				{ 7 , 144913 }, -- Cruel Gladiator's Scaled Helm
				{ 8 , 144915 }, -- Cruel Gladiator's Scaled Legguards
				{ 9 , 144917 }, -- Cruel Gladiator's Scaled Shoulders
				{ 10, 144919 }, -- Cruel Gladiator's Scaled Girdle
				{ 11, 144921 }, -- Cruel Gladiator's Scaled Wristplates
				{ 16, 147666 }, -- Ensemble: Cruel Gladiator's Scaled Armor
				{ 18, 144547 }, -- Cruel Gladiator's Greatcloak of Faith
				{ 19, 144660 }, -- Cruel Gladiator's Scaled Breastplate
				{ 20, 144662 }, -- Cruel Gladiator's Scaled Sabatons
				{ 21, 144664 }, -- Cruel Gladiator's Scaled Gauntlets
				{ 22, 144666 }, -- Cruel Gladiator's Scaled Helm
				{ 23, 144668 }, -- Cruel Gladiator's Scaled Legguards
				{ 24, 144671 }, -- Cruel Gladiator's Scaled Shoulders
				{ 25, 144673 }, -- Cruel Gladiator's Scaled Girdle
				{ 26, 144675 }, -- Cruel Gladiator's Scaled Wristplates
				{ 101, 147694 }, -- Ensemble: Cruel Combatant's Scaled Armor
				{ 103, 145039 }, -- Cruel Combatant's Greatcloak of Faith
				{ 104, 145153 }, -- Cruel Combatant's Scaled Chestpiece
				{ 105, 145155 }, -- Cruel Combatant's Scaled Sabatons
				{ 106, 145157 }, -- Cruel Combatant's Scaled Gauntlets
				{ 107, 145159 }, -- Cruel Combatant's Scaled Helm
				{ 108, 145161 }, -- Cruel Combatant's Scaled Legguards
				{ 109, 145163 }, -- Cruel Combatant's Scaled Shoulders
				{ 110, 145165 }, -- Cruel Combatant's Scaled Girdle
				{ 111, 145167 }, -- Cruel Combatant's Scaled Wristplates
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 147640 }, -- Ensemble: Elite Cruel Gladiator's Satin Armor
				{ 3 , 144794 }, -- Cruel Gladiator's Drape of Piety
				{ 4 , 144922 }, -- Cruel Gladiator's Satin Treads
				{ 5 , 144924 }, -- Cruel Gladiator's Satin Gloves
				{ 6 , 144926 }, -- Cruel Gladiator's Satin Hood
				{ 7 , 144928 }, -- Cruel Gladiator's Satin Leggings
				{ 8 , 144930 }, -- Cruel Gladiator's Satin Robe
				{ 9 , 144932 }, -- Cruel Gladiator's Satin Mantle
				{ 10, 144934 }, -- Cruel Gladiator's Satin Cord
				{ 11, 144936 }, -- Cruel Gladiator's Satin Bracers
				{ 16, 147663 }, -- Ensemble: Cruel Gladiator's Satin Armor
				{ 18, 144548 }, -- Cruel Gladiator's Drape of Piety
				{ 19, 144676 }, -- Cruel Gladiator's Satin Treads
				{ 20, 144678 }, -- Cruel Gladiator's Satin Gloves
				{ 21, 144680 }, -- Cruel Gladiator's Satin Hood
				{ 22, 144682 }, -- Cruel Gladiator's Satin Leggings
				{ 23, 144684 }, -- Cruel Gladiator's Satin Robe
				{ 24, 144686 }, -- Cruel Gladiator's Satin Mantle
				{ 25, 144688 }, -- Cruel Gladiator's Satin Cord
				{ 26, 144690 }, -- Cruel Gladiator's Satin Bracers
				{ 101, 147687 }, -- Ensemble: Cruel Combatant's Satin Armor
				{ 103, 145040 }, -- Cruel Combatant's Drape of Piety
				{ 104, 145168 }, -- Cruel Combatant's Satin Treads
				{ 105, 145170 }, -- Cruel Combatant's Satin Gloves
				{ 106, 145172 }, -- Cruel Combatant's Satin Hood
				{ 107, 145174 }, -- Cruel Combatant's Satin Leggings
				{ 108, 145176 }, -- Cruel Combatant's Satin Robe
				{ 109, 145178 }, -- Cruel Combatant's Satin Mantle
				{ 110, 145180 }, -- Cruel Combatant's Satin Cord
				{ 111, 145182 }, -- Cruel Combatant's Satin Bracers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147639 }, -- Ensemble: Elite Cruel Gladiator's Satin Armor
				{ 3 , 144795 }, -- Cruel Gladiator's Drape of Piety
				{ 4 , 144923 }, -- Cruel Gladiator's Satin Treads
				{ 5 , 144925 }, -- Cruel Gladiator's Satin Gloves
				{ 6 , 144927 }, -- Cruel Gladiator's Satin Hood
				{ 7 , 144929 }, -- Cruel Gladiator's Satin Leggings
				{ 8 , 144931 }, -- Cruel Gladiator's Satin Robe
				{ 9 , 144933 }, -- Cruel Gladiator's Satin Mantle
				{ 10, 144935 }, -- Cruel Gladiator's Satin Cord
				{ 11, 144937 }, -- Cruel Gladiator's Satin Bracers
				{ 16, 147664 }, -- Ensemble: Cruel Gladiator's Satin Armor
				{ 18, 144549 }, -- Cruel Gladiator's Drape of Piety
				{ 19, 144677 }, -- Cruel Gladiator's Satin Treads
				{ 20, 144679 }, -- Cruel Gladiator's Satin Gloves
				{ 21, 144681 }, -- Cruel Gladiator's Satin Hood
				{ 22, 144683 }, -- Cruel Gladiator's Satin Leggings
				{ 23, 144685 }, -- Cruel Gladiator's Satin Robe
				{ 24, 144687 }, -- Cruel Gladiator's Satin Mantle
				{ 25, 144689 }, -- Cruel Gladiator's Satin Cord
				{ 26, 144691 }, -- Cruel Gladiator's Satin Bracers
				{ 101, 147688 }, -- Ensemble: Cruel Combatant's Satin Armor
				{ 103, 145041 }, -- Cruel Combatant's Drape of Piety
				{ 104, 145169 }, -- Cruel Combatant's Satin Treads
				{ 105, 145171 }, -- Cruel Combatant's Satin Gloves
				{ 106, 145173 }, -- Cruel Combatant's Satin Hood
				{ 107, 145175 }, -- Cruel Combatant's Satin Leggings
				{ 108, 145177 }, -- Cruel Combatant's Satin Robe
				{ 109, 145179 }, -- Cruel Combatant's Satin Mantle
				{ 110, 145181 }, -- Cruel Combatant's Satin Cord
				{ 111, 145183 }, -- Cruel Combatant's Satin Bracers
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 147634 }, -- Ensemble: Elite Cruel Gladiator's Leather Armor
				{ 3 , 144796 }, -- Cruel Gladiator's Shadowcape
				{ 4 , 144944 }, -- Cruel Gladiator's Leather Tunic
				{ 5 , 144946 }, -- Cruel Gladiator's Leather Slippers
				{ 6 , 144948 }, -- Cruel Gladiator's Leather Gloves
				{ 7 , 144950 }, -- Cruel Gladiator's Leather Helm
				{ 8 , 144952 }, -- Cruel Gladiator's Leather Legguards
				{ 9 , 144954 }, -- Cruel Gladiator's Leather Spaulders
				{ 10, 144956 }, -- Cruel Gladiator's Leather Belt
				{ 11, 144958 }, -- Cruel Gladiator's Leather Wristguards
				{ 16, 147657 }, -- Ensemble: Cruel Gladiator's Leather Armor
				{ 18, 144550 }, -- Cruel Gladiator's Shadowcape
				{ 19, 144698 }, -- Cruel Gladiator's Leather Tunic
				{ 20, 144700 }, -- Cruel Gladiator's Leather Slippers
				{ 21, 144702 }, -- Cruel Gladiator's Leather Gloves
				{ 22, 144704 }, -- Cruel Gladiator's Leather Helm
				{ 23, 144706 }, -- Cruel Gladiator's Leather Legguards
				{ 24, 144708 }, -- Cruel Gladiator's Leather Spaulders
				{ 25, 144710 }, -- Cruel Gladiator's Leather Belt
				{ 26, 144712 }, -- Cruel Gladiator's Leather Wristguards
				{ 101, 147685 }, -- Ensemble: Cruel Combatant's Leather Armor
				{ 103, 145042 }, -- Cruel Combatant's Shadowcape
				{ 104, 145190 }, -- Cruel Combatant's Leather Tunic
				{ 105, 145192 }, -- Cruel Combatant's Leather Slippers
				{ 106, 145194 }, -- Cruel Combatant's Leather Gloves
				{ 107, 145196 }, -- Cruel Combatant's Leather Helm
				{ 108, 145198 }, -- Cruel Combatant's Leather Legguards
				{ 109, 145200 }, -- Cruel Combatant's Leather Spaulders
				{ 110, 145202 }, -- Cruel Combatant's Leather Belt
				{ 111, 145204 }, -- Cruel Combatant's Leather Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147633 }, -- Ensemble: Elite Cruel Gladiator's Leather Armor
				{ 3 , 144797 }, -- Cruel Gladiator's Shadowcape
				{ 4 , 144945 }, -- Cruel Gladiator's Leather Tunic
				{ 5 , 144947 }, -- Cruel Gladiator's Leather Slippers
				{ 6 , 144949 }, -- Cruel Gladiator's Leather Gloves
				{ 7 , 144951 }, -- Cruel Gladiator's Leather Helm
				{ 8 , 144953 }, -- Cruel Gladiator's Leather Legguards
				{ 9 , 144955 }, -- Cruel Gladiator's Leather Spaulders
				{ 10, 144957 }, -- Cruel Gladiator's Leather Belt
				{ 11, 144959 }, -- Cruel Gladiator's Leather Wristguards
				{ 16, 147658 }, -- Ensemble: Cruel Gladiator's Leather Armor
				{ 18, 144551 }, -- Cruel Gladiator's Shadowcape
				{ 19, 144699 }, -- Cruel Gladiator's Leather Tunic
				{ 20, 144701 }, -- Cruel Gladiator's Leather Slippers
				{ 21, 144703 }, -- Cruel Gladiator's Leather Gloves
				{ 22, 144705 }, -- Cruel Gladiator's Leather Helm
				{ 23, 144707 }, -- Cruel Gladiator's Leather Legguards
				{ 24, 144709 }, -- Cruel Gladiator's Leather Spaulders
				{ 25, 144711 }, -- Cruel Gladiator's Leather Belt
				{ 26, 144713 }, -- Cruel Gladiator's Leather Wristguards
				{ 101, 147686 }, -- Ensemble: Cruel Combatant's Leather Armor
				{ 103, 145043 }, -- Cruel Combatant's Shadowcape
				{ 104, 145191 }, -- Cruel Combatant's Leather Tunic
				{ 105, 145193 }, -- Cruel Combatant's Leather Slippers
				{ 106, 145195 }, -- Cruel Combatant's Leather Gloves
				{ 107, 145197 }, -- Cruel Combatant's Leather Helm
				{ 108, 145199 }, -- Cruel Combatant's Leather Legguards
				{ 109, 145201 }, -- Cruel Combatant's Leather Spaulders
				{ 110, 145203 }, -- Cruel Combatant's Leather Belt
				{ 111, 145205 }, -- Cruel Combatant's Leather Wristguards
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 147637 }, -- Ensemble: Elite Cruel Gladiator's Ringmail Armor
				{ 3 , 144798 }, -- Cruel Gladiator's Totemic Cloak
				{ 4 , 144960 }, -- Cruel Gladiator's Ringmail Armor
				{ 5 , 144962 }, -- Cruel Gladiator's Ringmail Boots
				{ 6 , 144964 }, -- Cruel Gladiator's Ringmail Gauntlets
				{ 7 , 144966 }, -- Cruel Gladiator's Ringmail Helm
				{ 8 , 144968 }, -- Cruel Gladiator's Ringmail Kilt
				{ 9 , 144970 }, -- Cruel Gladiator's Ringmail Spaulders
				{ 10, 144972 }, -- Cruel Gladiator's Ringmail Clasp
				{ 11, 144974 }, -- Cruel Gladiator's Ringmail Armband
				{ 16, 147661 }, -- Ensemble: Cruel Gladiator's Ringmail Armor
				{ 18, 144552 }, -- Cruel Gladiator's Totemic Cloak
				{ 19, 144714 }, -- Cruel Gladiator's Ringmail Armor
				{ 20, 144716 }, -- Cruel Gladiator's Ringmail Boots
				{ 21, 144718 }, -- Cruel Gladiator's Ringmail Gauntlets
				{ 22, 144720 }, -- Cruel Gladiator's Ringmail Helm
				{ 23, 144722 }, -- Cruel Gladiator's Ringmail Kilt
				{ 24, 144724 }, -- Cruel Gladiator's Ringmail Spaulders
				{ 25, 144726 }, -- Cruel Gladiator's Ringmail Clasp
				{ 26, 144728 }, -- Cruel Gladiator's Ringmail Armband
				{ 101, 147673 }, -- Ensemble: Cruel Combatant's Ringmail Armor
				{ 103, 145044 }, -- Cruel Combatant's Totemic Cloak
				{ 104, 145206 }, -- Cruel Combatant's Ringmail Armor
				{ 105, 145208 }, -- Cruel Combatant's Ringmail Boots
				{ 106, 145210 }, -- Cruel Combatant's Ringmail Gauntlets
				{ 107, 145212 }, -- Cruel Combatant's Ringmail Helm
				{ 108, 145214 }, -- Cruel Combatant's Ringmail Kilt
				{ 109, 145216 }, -- Cruel Combatant's Ringmail Spaulders
				{ 110, 145218 }, -- Cruel Combatant's Ringmail Clasp
				{ 111, 145220 }, -- Cruel Combatant's Ringmail Armband
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147638 }, -- Ensemble: Elite Cruel Gladiator's Ringmail Armor
				{ 3 , 144799 }, -- Cruel Gladiator's Totemic Cloak
				{ 4 , 144961 }, -- Cruel Gladiator's Ringmail Armor
				{ 5 , 144963 }, -- Cruel Gladiator's Ringmail Boots
				{ 6 , 144965 }, -- Cruel Gladiator's Ringmail Gauntlets
				{ 7 , 144967 }, -- Cruel Gladiator's Ringmail Helm
				{ 8 , 144969 }, -- Cruel Gladiator's Ringmail Kilt
				{ 9 , 144971 }, -- Cruel Gladiator's Ringmail Spaulders
				{ 10, 144973 }, -- Cruel Gladiator's Ringmail Clasp
				{ 11, 144975 }, -- Cruel Gladiator's Ringmail Armband
				{ 16, 147662 }, -- Ensemble: Cruel Gladiator's Ringmail Armor
				{ 18, 144553 }, -- Cruel Gladiator's Totemic Cloak
				{ 19, 144715 }, -- Cruel Gladiator's Ringmail Armor
				{ 20, 144717 }, -- Cruel Gladiator's Ringmail Boots
				{ 21, 144719 }, -- Cruel Gladiator's Ringmail Gauntlets
				{ 22, 144721 }, -- Cruel Gladiator's Ringmail Helm
				{ 23, 144723 }, -- Cruel Gladiator's Ringmail Kilt
				{ 24, 144725 }, -- Cruel Gladiator's Ringmail Spaulders
				{ 25, 144727 }, -- Cruel Gladiator's Ringmail Clasp
				{ 26, 144729 }, -- Cruel Gladiator's Ringmail Armband
				{ 101, 147674 }, -- Ensemble: Cruel Combatant's Ringmail Armor
				{ 103, 145045 }, -- Cruel Combatant's Totemic Cloak
				{ 104, 145207 }, -- Cruel Combatant's Ringmail Armor
				{ 105, 145209 }, -- Cruel Combatant's Ringmail Boots
				{ 106, 145211 }, -- Cruel Combatant's Ringmail Gauntlets
				{ 107, 145213 }, -- Cruel Combatant's Ringmail Helm
				{ 108, 145215 }, -- Cruel Combatant's Ringmail Leggings
				{ 109, 145217 }, -- Cruel Combatant's Ringmail Spaulders
				{ 110, 145219 }, -- Cruel Combatant's Ringmail Clasp
				{ 111, 145221 }, -- Cruel Combatant's Ringmail Armband
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 147629 }, -- Ensemble: Elite Cruel Gladiator's Felweave Armor
				{ 3 , 144800 }, -- Cruel Gladiator's Felweave Cloak
				{ 4 , 144994 }, -- Cruel Gladiator's Felweave Treads
				{ 5 , 144996 }, -- Cruel Gladiator's Felweave Handguards
				{ 6 , 144998 }, -- Cruel Gladiator's Felweave Cowl
				{ 7 , 145000 }, -- Cruel Gladiator's Felweave Trousers
				{ 8 , 145002 }, -- Cruel Gladiator's Felweave Raiment
				{ 9 , 145004 }, -- Cruel Gladiator's Felweave Amice
				{ 10, 145006 }, -- Cruel Gladiator's Felweave Cord
				{ 11, 145008 }, -- Cruel Gladiator's Felweave Bracers
				{ 16, 147653 }, -- Ensemble: Cruel Gladiator's Felweave Armor
				{ 18, 144554 }, -- Cruel Gladiator's Felweave Cloak
				{ 19, 144748 }, -- Cruel Gladiator's Felweave Treads
				{ 20, 144750 }, -- Cruel Gladiator's Felweave Handguards
				{ 21, 144752 }, -- Cruel Gladiator's Felweave Cowl
				{ 22, 144754 }, -- Cruel Gladiator's Felweave Trousers
				{ 23, 144756 }, -- Cruel Gladiator's Felweave Raiment
				{ 24, 144758 }, -- Cruel Gladiator's Felweave Amice
				{ 25, 144760 }, -- Cruel Gladiator's Felweave Cord
				{ 26, 144762 }, -- Cruel Gladiator's Felweave Bracers
				{ 101, 147681 }, -- Ensemble: Cruel Combatant's Felweave Armor
				{ 103, 145046 }, -- Cruel Combatant's Felweave Cloak
				{ 104, 145240 }, -- Cruel Combatant's Felweave Treads
				{ 105, 145242 }, -- Cruel Combatant's Felweave Handguards
				{ 106, 145244 }, -- Cruel Combatant's Felweave Cowl
				{ 107, 145246 }, -- Cruel Combatant's Felweave Trousers
				{ 108, 145248 }, -- Cruel Combatant's Felweave Raiment
				{ 109, 145250 }, -- Cruel Combatant's Felweave Amice
				{ 110, 145252 }, -- Cruel Combatant's Felweave Cord
				{ 111, 145254 }, -- Cruel Combatant's Felweave Bracers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147630 }, -- Ensemble: Elite Cruel Gladiator's Felweave Armor
				{ 3 , 144801 }, -- Cruel Gladiator's Felweave Cloak
				{ 4 , 144995 }, -- Cruel Gladiator's Felweave Treads
				{ 5 , 144997 }, -- Cruel Gladiator's Felweave Handguards
				{ 6 , 144999 }, -- Cruel Gladiator's Felweave Cowl
				{ 7 , 145001 }, -- Cruel Gladiator's Felweave Trousers
				{ 8 , 145003 }, -- Cruel Gladiator's Felweave Raiment
				{ 9 , 145005 }, -- Cruel Gladiator's Felweave Amice
				{ 10, 145007 }, -- Cruel Gladiator's Felweave Cord
				{ 11, 145009 }, -- Cruel Gladiator's Felweave Bracers
				{ 16, 147654 }, -- Ensemble: Cruel Gladiator's Felweave Armor
				{ 18, 144555 }, -- Cruel Gladiator's Felweave Cloak
				{ 19, 144749 }, -- Cruel Gladiator's Felweave Treads
				{ 20, 144751 }, -- Cruel Gladiator's Felweave Handguards
				{ 21, 144753 }, -- Cruel Gladiator's Felweave Cowl
				{ 22, 144755 }, -- Cruel Gladiator's Felweave Trousers
				{ 23, 144757 }, -- Cruel Gladiator's Felweave Raiment
				{ 24, 144759 }, -- Cruel Gladiator's Felweave Amice
				{ 25, 144761 }, -- Cruel Gladiator's Felweave Cord
				{ 26, 144763 }, -- Cruel Gladiator's Felweave Bracers
				{ 101, 147682 }, -- Ensemble: Cruel Combatant's Felweave Armor
				{ 103, 145047 }, -- Cruel Combatant's Felweave Cloak
				{ 104, 145241 }, -- Cruel Combatant's Felweave Treads
				{ 105, 145243 }, -- Cruel Combatant's Felweave Handguards
				{ 106, 145245 }, -- Cruel Combatant's Felweave Cowl
				{ 107, 145247 }, -- Cruel Combatant's Felweave Trousers
				{ 108, 145249 }, -- Cruel Combatant's Felweave Raiment
				{ 109, 145251 }, -- Cruel Combatant's Felweave Amice
				{ 110, 145253 }, -- Cruel Combatant's Felweave Cord
				{ 111, 145255 }, -- Cruel Combatant's Felweave Bracers
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 147636 }, -- Ensemble: Elite Cruel Gladiator's Plate Armor
				{ 3 , 144802 }, -- Cruel Gladiator's Cloak of Battle
				{ 4 , 145010 }, -- Cruel Gladiator's Plate Chestpiece
				{ 5 , 145012 }, -- Cruel Gladiator's Plate Warboots
				{ 6 , 145014 }, -- Cruel Gladiator's Plate Gauntlets
				{ 7 , 145016 }, -- Cruel Gladiator's Plate Helm
				{ 8 , 145018 }, -- Cruel Gladiator's Plate Legguards
				{ 9 , 145020 }, -- Cruel Gladiator's Plate Shoulders
				{ 10, 145022 }, -- Cruel Gladiator's Plate Girdle
				{ 11, 145024 }, -- Cruel Gladiator's Plate Wristplates
				{ 16, 147660 }, -- Ensemble: Cruel Gladiator's Plate Armor
				{ 18, 144556 }, -- Cruel Gladiator's Cloak of Battle
				{ 19, 144764 }, -- Cruel Gladiator's Plate Chestpiece
				{ 20, 144766 }, -- Cruel Gladiator's Plate Warboots
				{ 21, 144768 }, -- Cruel Gladiator's Plate Gauntlets
				{ 22, 144770 }, -- Cruel Gladiator's Plate Helm
				{ 23, 144772 }, -- Cruel Gladiator's Plate Legguards
				{ 24, 144774 }, -- Cruel Gladiator's Plate Shoulders
				{ 25, 144776 }, -- Cruel Gladiator's Plate Girdle
				{ 26, 144778 }, -- Cruel Gladiator's Plate Wristplates
				{ 101, 147691 }, -- Ensemble: Cruel Combatant's Plate Armor
				{ 103, 145048 }, -- Cruel Combatant's Cloak of Battle
				{ 104, 145256 }, -- Cruel Combatant's Plate Chestpiece
				{ 105, 145258 }, -- Cruel Combatant's Plate Warboots
				{ 106, 145260 }, -- Cruel Combatant's Plate Gauntlets
				{ 107, 145262 }, -- Cruel Combatant's Plate Helm
				{ 108, 145264 }, -- Cruel Combatant's Plate Legguards
				{ 109, 145266 }, -- Cruel Combatant's Plate Shoulders
				{ 110, 145268 }, -- Cruel Combatant's Plate Girdle
				{ 111, 145270 }, -- Cruel Combatant's Plate Wristplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 147635 }, -- Ensemble: Elite Cruel Gladiator's Plate Armor
				{ 3 , 144803 }, -- Cruel Gladiator's Cloak of Battle
				{ 4 , 145011 }, -- Cruel Gladiator's Plate Chestpiece
				{ 5 , 145013 }, -- Cruel Gladiator's Plate Warboots
				{ 6 , 145015 }, -- Cruel Gladiator's Plate Gauntlets
				{ 7 , 145017 }, -- Cruel Gladiator's Plate Helm
				{ 8 , 145019 }, -- Cruel Gladiator's Plate Legguards
				{ 9 , 145021 }, -- Cruel Gladiator's Plate Shoulders
				{ 10, 145023 }, -- Cruel Gladiator's Plate Girdle
				{ 11, 145025 }, -- Cruel Gladiator's Plate Wristplates
				{ 16, 147659 }, -- Ensemble: Cruel Gladiator's Plate Armor
				{ 18, 144557 }, -- Cruel Gladiator's Cloak of Battle
				{ 19, 144765 }, -- Cruel Gladiator's Plate Chestpiece
				{ 20, 144767 }, -- Cruel Gladiator's Plate Warboots
				{ 21, 144769 }, -- Cruel Gladiator's Plate Gauntlets
				{ 22, 144771 }, -- Cruel Gladiator's Plate Helm
				{ 23, 144773 }, -- Cruel Gladiator's Plate Legguards
				{ 24, 144775 }, -- Cruel Gladiator's Plate Shoulders
				{ 25, 144777 }, -- Cruel Gladiator's Plate Girdle
				{ 26, 144779 }, -- Cruel Gladiator's Plate Wristplates
				{ 101, 147692 }, -- Ensemble: Cruel Combatant's Plate Armor
				{ 103, 145049 }, -- Cruel Combatant's Cloak of Battle
				{ 104, 145257 }, -- Cruel Combatant's Plate Chestpiece
				{ 105, 145259 }, -- Cruel Combatant's Plate Warboots
				{ 106, 145261 }, -- Cruel Combatant's Plate Gauntlets
				{ 107, 145263 }, -- Cruel Combatant's Plate Helm
				{ 108, 145265 }, -- Cruel Combatant's Plate Legguards
				{ 109, 145267 }, -- Cruel Combatant's Plate Shoulders
				{ 110, 145269 }, -- Cruel Combatant's Plate Girdle
				{ 111, 145271 }, -- Cruel Combatant's Plate Wristplates
			},
		},
	},
}

data["LEGION3GEAR"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 3).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Legion Season %d Elite"], 3),
			[ALLIANCE_DIFF] = {
				{ 1, 146817, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Helm of the Cruel Gladiator
				{ 2, 146818, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Chest of the Cruel Gladiator
				{ 3, 146819, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Leggings of the Cruel Gladiator
				{ 4, 146820, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Pauldrons of the Cruel Gladiator
				{ 5, 146821, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Gloves of the Cruel Gladiator
				{ 6, 146822, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Cinch of the Cruel Gladiator
				{ 7, 146823, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Treads of the Cruel Gladiator
				{ 8, 146824, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Bracers of the Cruel Gladiator
				{ 9, 146825, [PRICE_EXTRA_ITTYPE] = "echoofdomination:75" }, -- Cloak of the Cruel Gladiator
				-- Amulet
				{ 11, 144900 }, -- Cruel Gladiator's Necklace
				{ 12, 144902 }, -- Cruel Gladiator's Pendant
				{ 13, 144904 }, -- Cruel Gladiator's Choker
				-- Ring
				{ 16, 144938 }, -- Cruel Gladiator's Ring
				{ 17, 144940 }, -- Cruel Gladiator's Band
				{ 18, 144942 }, -- Cruel Gladiator's Signet
				-- Trinket
				{ 20, 144976 }, -- Cruel Gladiator's Badge of Conquest
				{ 21, 144978 }, -- Cruel Gladiator's Accolade of Conquest
				{ 22, 144980 }, -- Cruel Gladiator's Insignia of Conquest
				{ 23, 144982 }, -- Cruel Gladiator's Badge of Dominance
				{ 24, 144984 }, -- Cruel Gladiator's Accolade of Dominance
				{ 25, 144986 }, -- Cruel Gladiator's Insignia of Dominance
				{ 26, 144988 }, -- Cruel Gladiator's Badge of Victory
				{ 27, 144990 }, -- Cruel Gladiator's Accolade of Victory
				{ 28, 144992 }, -- Cruel Gladiator's Insignia of Victory
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 11, 144901 }, -- Cruel Gladiator's Necklace
				{ 12, 144903 }, -- Cruel Gladiator's Pendant
				{ 13, 144905 }, -- Cruel Gladiator's Choker
				-- Ring
				{ 16, 144939 }, -- Cruel Gladiator's Ring
				{ 17, 144941 }, -- Cruel Gladiator's Band
				{ 18, 144943 }, -- Cruel Gladiator's Signet
				-- Trinket
				{ 20, 144977 }, -- Cruel Gladiator's Badge of Conquest
				{ 21, 144979 }, -- Cruel Gladiator's Accolade of Conquest
				{ 22, 144981 }, -- Cruel Gladiator's Insignia of Conquest
				{ 23, 144983 }, -- Cruel Gladiator's Badge of Dominance
				{ 24, 144985 }, -- Cruel Gladiator's Accolade of Dominance
				{ 25, 144987 }, -- Cruel Gladiator's Insignia of Dominance
				{ 26, 144989 }, -- Cruel Gladiator's Badge of Victory
				{ 27, 144991 }, -- Cruel Gladiator's Accolade of Victory
				{ 28, 144993 }, -- Cruel Gladiator's Insignia of Victory
			},
		},
		{
			name = string.format(AL["Legion Season %d"], 3),
			[ALLIANCE_DIFF] = {
				{ 1, 146804, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Helm of the Cruel Gladiator
				{ 2, 146809, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Chest of the Cruel Gladiator
				{ 3, 146810, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Leggings of the Cruel Gladiator
				{ 4, 146811, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Pauldrons of the Cruel Gladiator
				{ 5, 146812, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Gloves of the Cruel Gladiator
				{ 6, 146813, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Cinch of the Cruel Gladiator
				{ 7, 146814, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Treads of the Cruel Gladiator
				{ 8, 146815, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Bracers of the Cruel Gladiator
				{ 9, 146816, [PRICE_EXTRA_ITTYPE] = "echoofbattle:75" }, -- Cloak of the Cruel Gladiator
				-- Amulet
				{ 11, 144654 }, -- Cruel Gladiator's Necklace
				{ 12, 144656 }, -- Cruel Gladiator's Pendant
				{ 13, 144658 }, -- Cruel Gladiator's Choker
				-- Tabard
				{ 15, 147337, [PRICE_EXTRA_ITTYPE] = "markofhonor:50" }, -- Cruel Gladiator's Tabard
				-- Ring
				{ 16, 144692 }, -- Cruel Gladiator's Ring
				{ 17, 144694 }, -- Cruel Gladiator's Band
				{ 18, 144696 }, -- Cruel Gladiator's Signet
				-- Trinket
				{ 20, 144730 }, -- Cruel Gladiator's Badge of Conquest
				{ 21, 144732 }, -- Cruel Gladiator's Accolade of Conquest
				{ 22, 144734 }, -- Cruel Gladiator's Insignia of Conquest
				{ 23, 144736 }, -- Cruel Gladiator's Badge of Dominance
				{ 24, 144738 }, -- Cruel Gladiator's Accolade of Dominance
				{ 25, 144740 }, -- Cruel Gladiator's Insignia of Dominance
				{ 26, 144742 }, -- Cruel Gladiator's Badge of Victory
				{ 27, 144744 }, -- Cruel Gladiator's Accolade of Victory
				{ 28, 144746 }, -- Cruel Gladiator's Insignia of Victory
				-- Cloak
				{ 30, 147360 }, -- Cruel Gladiator's Cloak
				-- Amulet
				{ 111, 145146 }, -- Cruel Combatant's Necklace
				{ 112, 145148 }, -- Cruel Combatant's Pendant
				{ 113, 145150 }, -- Cruel Combatant's Choker
				-- Ring
				{ 116, 145184 }, -- Cruel Combatant's Ring
				{ 117, 145186 }, -- Cruel Combatant's Band
				{ 118, 145188 }, -- Cruel Combatant's Signet
				-- Trinket
				{ 120, 145222 }, -- Cruel Combatant's Badge of Conquest
				{ 121, 145224 }, -- Cruel Combatant's Accolade of Conquest
				{ 122, 145226 }, -- Cruel Combatant's Insignia of Conquest
				{ 123, 145228 }, -- Cruel Combatant's Badge of Dominance
				{ 124, 145230 }, -- Cruel Combatant's Accolade of Dominance
				{ 125, 145232 }, -- Cruel Combatant's Insignia of Dominance
				{ 126, 145234 }, -- Cruel Combatant's Badge of Victory
				{ 127, 145236 }, -- Cruel Combatant's Accolade of Victory
				{ 128, 145238 }, -- Cruel Combatant's Insignia of Victory
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 11, 144655 }, -- Cruel Gladiator's Necklace
				{ 12, 144657 }, -- Cruel Gladiator's Pendant
				{ 13, 144659 }, -- Cruel Gladiator's Choker
				-- Tabard
				{ 15, 147336, [PRICE_EXTRA_ITTYPE] = "markofhonor:50" }, -- Cruel Gladiator's Tabard
				-- Ring
				{ 16, 144693 }, -- Cruel Gladiator's Ring
				{ 17, 144695 }, -- Cruel Gladiator's Band
				{ 18, 144697 }, -- Cruel Gladiator's Signet
				-- Trinket
				{ 20, 144731 }, -- Cruel Gladiator's Badge of Conquest
				{ 21, 144733 }, -- Cruel Gladiator's Accolade of Conquest
				{ 22, 144735 }, -- Cruel Gladiator's Insignia of Conquest
				{ 23, 144737 }, -- Cruel Gladiator's Badge of Dominance
				{ 24, 144739 }, -- Cruel Gladiator's Accolade of Dominance
				{ 25, 144741 }, -- Cruel Gladiator's Insignia of Dominance
				{ 26, 144743 }, -- Cruel Gladiator's Badge of Victory
				{ 27, 144745 }, -- Cruel Gladiator's Accolade of Victory
				{ 28, 144747 }, -- Cruel Gladiator's Insignia of Victory
				-- Cloak
				{ 30, 147357 }, -- Cruel Gladiator's Cloak
				-- Amulet
				{ 111, 145147 }, -- Cruel Combatant's Necklace
				{ 112, 145149 }, -- Cruel Combatant's Pendant
				{ 113, 145151 }, -- Cruel Combatant's Choker
				-- Ring
				{ 116, 145185 }, -- Cruel Combatant's Ring
				{ 117, 145187 }, -- Cruel Combatant's Band
				{ 118, 145189 }, -- Cruel Combatant's Signet
				-- Trinket
				{ 120, 145223 }, -- Cruel Combatant's Badge of Conquest
				{ 121, 145225 }, -- Cruel Combatant's Accolade of Conquest
				{ 122, 145227 }, -- Cruel Combatant's Insignia of Conquest
				{ 123, 145229 }, -- Cruel Combatant's Badge of Dominance
				{ 124, 145231 }, -- Cruel Combatant's Accolade of Dominance
				{ 125, 145233 }, -- Cruel Combatant's Insignia of Dominance
				{ 126, 145235 }, -- Cruel Combatant's Badge of Victory
				{ 127, 145237 }, -- Cruel Combatant's Accolade of Victory
				{ 128, 145239 }, -- Cruel Combatant's Insignia of Victory
			},
		},
	},
}

data["LEGION2SETS"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 2).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 146242 }, -- Ensemble: Elite Fearless Gladiator's Dreadplate Armor
				{ 3 , 143012 }, -- Fearless Gladiator's Dreadplate Chestpiece
				{ 4 , 143013 }, -- Fearless Gladiator's Dreadplate Sabatons
				{ 5 , 143014 }, -- Fearless Gladiator's Dreadplate Gauntlets
				{ 6 , 143015 }, -- Fearless Gladiator's Dreadplate Helm
				{ 7 , 143016 }, -- Fearless Gladiator's Dreadplate Legguards
				{ 8 , 143017 }, -- Fearless Gladiator's Dreadplate Shoulders
				{ 9 , 143018 }, -- Fearless Gladiator's Dreadplate Girdle
				{ 10, 143019 }, -- Fearless Gladiator's Dreadplate Wristplates
				{ 11, 143100 }, -- Fearless Gladiator's Dreadcloak
				{ 16, 146176 }, -- Ensemble: Fearless Gladiator's Dreadplate Armor
				{ 18, 142560 }, -- Fearless Gladiator's Dreadplate Chestpiece
				{ 19, 142561 }, -- Fearless Gladiator's Dreadplate Sabatons
				{ 20, 142562 }, -- Fearless Gladiator's Dreadplate Gauntlets
				{ 21, 142563 }, -- Fearless Gladiator's Dreadplate Helm
				{ 22, 142564 }, -- Fearless Gladiator's Dreadplate Legguards
				{ 23, 142565 }, -- Fearless Gladiator's Dreadplate Shoulders
				{ 24, 142566 }, -- Fearless Gladiator's Dreadplate Girdle
				{ 25, 142567 }, -- Fearless Gladiator's Dreadplate Wristplates
				{ 26, 142648 }, -- Fearless Gladiator's Dreadcloak
				{ 101, 146208 }, -- Ensemble: Fearless Combatant's Dreadplate Armor
				{ 103, 142786 }, -- Fearless Combatant's Dreadplate Chestpiece
				{ 104, 142787 }, -- Fearless Combatant's Dreadplate Sabatons
				{ 105, 142788 }, -- Fearless Combatant's Dreadplate Gauntlets
				{ 106, 142789 }, -- Fearless Combatant's Dreadplate Helm
				{ 107, 142790 }, -- Fearless Combatant's Dreadplate Legguards
				{ 108, 142791 }, -- Fearless Combatant's Dreadplate Shoulders
				{ 109, 142792 }, -- Fearless Combatant's Dreadplate Girdle
				{ 110, 142793 }, -- Fearless Combatant's Dreadplate Wristplates
				{ 111, 142874 }, -- Fearless Combatant's Dreadcloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146243 }, -- Ensemble: Elite Fearless Gladiator's Dreadplate Armor
				{ 3 , 143125 }, -- Fearless Gladiator's Dreadplate Chestpiece
				{ 4 , 143126 }, -- Fearless Gladiator's Dreadplate Sabatons
				{ 5 , 143127 }, -- Fearless Gladiator's Dreadplate Gauntlets
				{ 6 , 143128 }, -- Fearless Gladiator's Dreadplate Helm
				{ 7 , 143129 }, -- Fearless Gladiator's Dreadplate Legguards
				{ 8 , 143130 }, -- Fearless Gladiator's Dreadplate Shoulders
				{ 9 , 143131 }, -- Fearless Gladiator's Dreadplate Girdle
				{ 10, 143132 }, -- Fearless Gladiator's Dreadplate Wristplates
				{ 11, 143213 }, -- Fearless Gladiator's Dreadcloak
				{ 16, 146177 }, -- Ensemble: Fearless Gladiator's Dreadplate Armor
				{ 18, 142673 }, -- Fearless Gladiator's Dreadplate Chestpiece
				{ 19, 142674 }, -- Fearless Gladiator's Dreadplate Sabatons
				{ 20, 142675 }, -- Fearless Gladiator's Dreadplate Gauntlets
				{ 21, 142676 }, -- Fearless Gladiator's Dreadplate Helm
				{ 22, 142677 }, -- Fearless Gladiator's Dreadplate Legguards
				{ 23, 142678 }, -- Fearless Gladiator's Dreadplate Shoulders
				{ 24, 142679 }, -- Fearless Gladiator's Dreadplate Girdle
				{ 25, 142680 }, -- Fearless Gladiator's Dreadplate Wristplates
				{ 26, 142761 }, -- Fearless Gladiator's Dreadcloak
				{ 101, 146209 }, -- Ensemble: Fearless Combatant's Dreadplate Armor
				{ 103, 142899 }, -- Fearless Combatant's Dreadplate Chestpiece
				{ 104, 142900 }, -- Fearless Combatant's Dreadplate Sabatons
				{ 105, 142901 }, -- Fearless Combatant's Dreadplate Gauntlets
				{ 106, 142902 }, -- Fearless Combatant's Dreadplate Helm
				{ 107, 142903 }, -- Fearless Combatant's Dreadplate Legguards
				{ 108, 142904 }, -- Fearless Combatant's Dreadplate Shoulders
				{ 109, 142905 }, -- Fearless Combatant's Dreadplate Girdle
				{ 110, 142906 }, -- Fearless Combatant's Dreadplate Wristplates
				{ 111, 142987 }, -- Fearless Combatant's Dreadcloak
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 146272 }, -- Ensemble: Elite Fearless Gladiator's Felskin Armor
				{ 3 , 143270 }, -- Fearless Gladiator's Felskin Boots
				{ 4 , 143271 }, -- Fearless Gladiator's Felskin Gloves
				{ 5 , 143272 }, -- Fearless Gladiator's Felskin Helm
				{ 6 , 143273 }, -- Fearless Gladiator's Felskin Legguards
				{ 7 , 143274 }, -- Fearless Gladiator's Felskin Tunic
				{ 8 , 143275 }, -- Fearless Gladiator's Felskin Spaulders
				{ 9 , 143276 }, -- Fearless Gladiator's Felskin Belt
				{ 10, 143277 }, -- Fearless Gladiator's Felskin Wristguards
				{ 11, 143320 }, -- Fearless Gladiator's Demonthread Cloak
				{ 16, 146266 }, -- Ensemble: Fearless Gladiator's Felskin Armor
				{ 18, 143238 }, -- Fearless Gladiator's Felskin Boots
				{ 19, 143239 }, -- Fearless Gladiator's Felskin Gloves
				{ 20, 143240 }, -- Fearless Gladiator's Felskin Helm
				{ 21, 143241 }, -- Fearless Gladiator's Felskin Legguards
				{ 22, 143242 }, -- Fearless Gladiator's Felskin Tunic
				{ 23, 143243 }, -- Fearless Gladiator's Felskin Spaulders
				{ 24, 143244 }, -- Fearless Gladiator's Felskin Belt
				{ 25, 143245 }, -- Fearless Gladiator's Felskin Wristguards
				{ 26, 143316 }, -- Fearless Gladiator's Demonthread Cloak
				{ 101, 146268 }, -- Ensemble: Fearless Combatant's Felskin Armor
				{ 103, 143254 }, -- Fearless Combatant's Felskin Boots
				{ 104, 143255 }, -- Fearless Combatant's Felskin Gloves
				{ 105, 143256 }, -- Fearless Combatant's Felskin Helm
				{ 106, 143257 }, -- Fearless Combatant's Felskin Legguards
				{ 107, 143258 }, -- Fearless Combatant's Felskin Tunic
				{ 108, 143259 }, -- Fearless Combatant's Felskin Spaulders
				{ 109, 143260 }, -- Fearless Combatant's Felskin Belt
				{ 110, 143261 }, -- Fearless Combatant's Felskin Wristguards
				{ 111, 143318 }, -- Fearless Combatant's Demonthread Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146273 }, -- Ensemble: Elite Fearless Gladiator's Felskin Armor
				{ 3 , 143278 }, -- Fearless Gladiator's Felskin Boots
				{ 4 , 143279 }, -- Fearless Gladiator's Felskin Gloves
				{ 5 , 143280 }, -- Fearless Gladiator's Felskin Helm
				{ 6 , 143281 }, -- Fearless Gladiator's Felskin Legguards
				{ 7 , 143282 }, -- Fearless Gladiator's Felskin Tunic
				{ 8 , 143283 }, -- Fearless Gladiator's Felskin Spaulders
				{ 9 , 143284 }, -- Fearless Gladiator's Felskin Belt
				{ 10, 143285 }, -- Fearless Gladiator's Felskin Wristguards
				{ 11, 143321 }, -- Fearless Gladiator's Demonthread Cloak
				{ 16, 146267 }, -- Ensemble: Fearless Gladiator's Felskin Armor
				{ 18, 143246 }, -- Fearless Gladiator's Felskin Boots
				{ 19, 143247 }, -- Fearless Gladiator's Felskin Gloves
				{ 20, 143248 }, -- Fearless Gladiator's Felskin Helm
				{ 21, 143249 }, -- Fearless Gladiator's Felskin Legguards
				{ 22, 143250 }, -- Fearless Gladiator's Felskin Tunic
				{ 23, 143251 }, -- Fearless Gladiator's Felskin Spaulders
				{ 24, 143252 }, -- Fearless Gladiator's Felskin Belt
				{ 25, 143253 }, -- Fearless Gladiator's Felskin Wristguards
				{ 26, 143317 }, -- Fearless Gladiator's Demonthread Cloak
				{ 101, 146269 }, -- Ensemble: Fearless Combatant's Felskin Armor
				{ 103, 143262 }, -- Fearless Combatant's Felskin Boots
				{ 104, 143263 }, -- Fearless Combatant's Felskin Gloves
				{ 105, 143264 }, -- Fearless Combatant's Felskin Helm
				{ 106, 143265 }, -- Fearless Combatant's Felskin Legguards
				{ 107, 143266 }, -- Fearless Combatant's Felskin Tunic
				{ 108, 143267 }, -- Fearless Combatant's Felskin Spaulders
				{ 109, 143268 }, -- Fearless Combatant's Felskin Belt
				{ 110, 143269 }, -- Fearless Combatant's Felskin Wristguards
				{ 111, 143319 }, -- Fearless Combatant's Demonthread Cloak
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 146250 }, -- Ensemble: Elite Fearless Gladiator's Dragonhide Armor
				{ 3 , 143020 }, -- Fearless Gladiator's Dragonhide Moccasins
				{ 4 , 143021 }, -- Fearless Gladiator's Dragonhide Gloves
				{ 5 , 143022 }, -- Fearless Gladiator's Dragonhide Helm
				{ 6 , 143023 }, -- Fearless Gladiator's Dragonhide Legguards
				{ 7 , 143024 }, -- Fearless Gladiator's Dragonhide Tunic
				{ 8 , 143025 }, -- Fearless Gladiator's Dragonhide Spaulders
				{ 9 , 143026 }, -- Fearless Gladiator's Dragonhide Belt
				{ 10, 143027 }, -- Fearless Gladiator's Dragonhide Wristguards
				{ 11, 143104 }, -- Fearless Gladiator's Dragonhide Cloak
				{ 16, 146184 }, -- Ensemble: Fearless Gladiator's Dragonhide Armor
				{ 18, 142568 }, -- Fearless Gladiator's Dragonhide Moccasins
				{ 19, 142569 }, -- Fearless Gladiator's Dragonhide Gloves
				{ 20, 142570 }, -- Fearless Gladiator's Dragonhide Helm
				{ 21, 142571 }, -- Fearless Gladiator's Dragonhide Legguards
				{ 22, 142572 }, -- Fearless Gladiator's Dragonhide Robe
				{ 23, 142573 }, -- Fearless Gladiator's Dragonhide Spaulders
				{ 24, 142574 }, -- Fearless Gladiator's Dragonhide Belt
				{ 25, 142575 }, -- Fearless Gladiator's Dragonhide Wristguards
				{ 26, 142649 }, -- Fearless Gladiator's Dragonhide Cloak
				{ 101, 146212 }, -- Ensemble: Fearless Combatant's Dragonhide Armor
				{ 103, 142794 }, -- Fearless Combatant's Dragonhide Moccasins
				{ 104, 142795 }, -- Fearless Combatant's Dragonhide Gloves
				{ 105, 142796 }, -- Fearless Combatant's Dragonhide Helm
				{ 106, 142797 }, -- Fearless Combatant's Dragonhide Legguards
				{ 107, 142798 }, -- Fearless Combatant's Dragonhide Tunic
				{ 108, 142799 }, -- Fearless Combatant's Dragonhide Spaulders
				{ 109, 142800 }, -- Fearless Combatant's Dragonhide Belt
				{ 110, 142801 }, -- Fearless Combatant's Dragonhide Wristguards
				{ 111, 142878 }, -- Fearless Combatant's Dragonhide Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146251 }, -- Ensemble: Elite Fearless Gladiator's Dragonhide Armor
				{ 3 , 143133 }, -- Fearless Gladiator's Dragonhide Moccasins
				{ 4 , 143134 }, -- Fearless Gladiator's Dragonhide Gloves
				{ 5 , 143135 }, -- Fearless Gladiator's Dragonhide Helm
				{ 6 , 143136 }, -- Fearless Gladiator's Dragonhide Legguards
				{ 7 , 143137 }, -- Fearless Gladiator's Dragonhide Tunic
				{ 8 , 143138 }, -- Fearless Gladiator's Dragonhide Spaulders
				{ 9 , 143139 }, -- Fearless Gladiator's Dragonhide Belt
				{ 10, 143140 }, -- Fearless Gladiator's Dragonhide Wristguards
				{ 11, 143217 }, -- Fearless Gladiator's Dragonhide Cloak
				{ 16, 146185 }, -- Ensemble: Fearless Gladiator's Dragonhide Armor
				{ 18, 142681 }, -- Fearless Gladiator's Dragonhide Moccasins
				{ 19, 142682 }, -- Fearless Gladiator's Dragonhide Gloves
				{ 20, 142683 }, -- Fearless Gladiator's Dragonhide Helm
				{ 21, 142684 }, -- Fearless Gladiator's Dragonhide Legguards
				{ 22, 142685 }, -- Fearless Gladiator's Dragonhide Robe
				{ 23, 142686 }, -- Fearless Gladiator's Dragonhide Spaulders
				{ 24, 142687 }, -- Fearless Gladiator's Dragonhide Belt
				{ 25, 142688 }, -- Fearless Gladiator's Dragonhide Wristguards
				{ 26, 142765 }, -- Fearless Gladiator's Dragonhide Cloak
				{ 101, 146213 }, -- Ensemble: Fearless Combatant's Dragonhide Armor
				{ 103, 142907 }, -- Fearless Combatant's Dragonhide Moccasins
				{ 104, 142908 }, -- Fearless Combatant's Dragonhide Gloves
				{ 105, 142909 }, -- Fearless Combatant's Dragonhide Helm
				{ 106, 142910 }, -- Fearless Combatant's Dragonhide Legguards
				{ 107, 142911 }, -- Fearless Combatant's Dragonhide Tunic
				{ 108, 142912 }, -- Fearless Combatant's Dragonhide Spaulders
				{ 109, 142913 }, -- Fearless Combatant's Dragonhide Belt
				{ 110, 142914 }, -- Fearless Combatant's Dragonhide Wristguards
				{ 111, 142991 }, -- Fearless Combatant's Dragonhide Cloak
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 146248 }, -- Ensemble: Elite Fearless Gladiator's Chain Armor
				{ 3 , 143028 }, -- Fearless Gladiator's Chain Armor
				{ 4 , 143029 }, -- Fearless Gladiator's Chain Treads
				{ 5 , 143030 }, -- Fearless Gladiator's Chain Gauntlets
				{ 6 , 143031 }, -- Fearless Gladiator's Chain Helm
				{ 7 , 143032 }, -- Fearless Gladiator's Chain Leggings
				{ 8 , 143033 }, -- Fearless Gladiator's Chain Spaulders
				{ 9 , 143034 }, -- Fearless Gladiator's Chain Clasp
				{ 10, 143035 }, -- Fearless Gladiator's Chain Armband
				{ 11, 143108 }, -- Fearless Gladiator's Drape of the Tracker
				{ 16, 146182 }, -- Ensemble: Fearless Gladiator's Chain Armor
				{ 18, 142576 }, -- Fearless Gladiator's Chain Armor
				{ 19, 142577 }, -- Fearless Gladiator's Chain Treads
				{ 20, 142578 }, -- Fearless Gladiator's Chain Gauntlets
				{ 21, 142579 }, -- Fearless Gladiator's Chain Helm
				{ 22, 142580 }, -- Fearless Gladiator's Chain Leggings
				{ 23, 142581 }, -- Fearless Gladiator's Chain Spaulders
				{ 24, 142582 }, -- Fearless Gladiator's Chain Clasp
				{ 25, 142583 }, -- Fearless Gladiator's Chain Armband
				{ 26, 142652 }, -- Fearless Gladiator's Drape of the Tracker
				{ 101, 146198 }, -- Ensemble: Fearless Combatant's Chain Armor
				{ 103, 142802 }, -- Fearless Combatant's Chain Armor
				{ 104, 142803 }, -- Fearless Combatant's Chain Treads
				{ 105, 142804 }, -- Fearless Combatant's Chain Gauntlets
				{ 106, 142805 }, -- Fearless Combatant's Chain Helm
				{ 107, 142806 }, -- Fearless Combatant's Chain Leggings
				{ 108, 142807 }, -- Fearless Combatant's Chain Spaulders
				{ 109, 142808 }, -- Fearless Combatant's Chain Clasp
				{ 110, 142809 }, -- Fearless Combatant's Chain Armband
				{ 111, 142882 }, -- Fearless Combatant's Drape of the Tracker
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146249 }, -- Ensemble: Elite Fearless Gladiator's Chain Armor
				{ 3 , 143141 }, -- Fearless Gladiator's Chain Armor
				{ 4 , 143142 }, -- Fearless Gladiator's Chain Treads
				{ 5 , 143143 }, -- Fearless Gladiator's Chain Gauntlets
				{ 6 , 143144 }, -- Fearless Gladiator's Chain Helm
				{ 7 , 143145 }, -- Fearless Gladiator's Chain Leggings
				{ 8 , 143146 }, -- Fearless Gladiator's Chain Spaulders
				{ 9 , 143147 }, -- Fearless Gladiator's Chain Clasp
				{ 10, 143148 }, -- Fearless Gladiator's Chain Armband
				{ 11, 143221 }, -- Fearless Gladiator's Drape of the Tracker
				{ 16, 146183 }, -- Ensemble: Fearless Gladiator's Chain Armor
				{ 18, 142689 }, -- Fearless Gladiator's Chain Armor
				{ 19, 142690 }, -- Fearless Gladiator's Chain Treads
				{ 20, 142691 }, -- Fearless Gladiator's Chain Gauntlets
				{ 21, 142692 }, -- Fearless Gladiator's Chain Helm
				{ 22, 142693 }, -- Fearless Gladiator's Chain Leggings
				{ 23, 142694 }, -- Fearless Gladiator's Chain Spaulders
				{ 24, 142695 }, -- Fearless Gladiator's Chain Clasp
				{ 25, 142696 }, -- Fearless Gladiator's Chain Armband
				{ 26, 142769 }, -- Fearless Gladiator's Drape of the Tracker
				{ 101, 146199 }, -- Ensemble: Fearless Combatant's Chain Armor
				{ 103, 142915 }, -- Fearless Combatant's Chain Armor
				{ 104, 142916 }, -- Fearless Combatant's Chain Treads
				{ 105, 142917 }, -- Fearless Combatant's Chain Gauntlets
				{ 106, 142918 }, -- Fearless Combatant's Chain Helm
				{ 107, 142919 }, -- Fearless Combatant's Chain Leggings
				{ 108, 142920 }, -- Fearless Combatant's Chain Spaulders
				{ 109, 142921 }, -- Fearless Combatant's Chain Clasp
				{ 110, 142922 }, -- Fearless Combatant's Chain Armband
				{ 111, 142995 }, -- Fearless Combatant's Drape of the Tracker
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 146256 }, -- Ensemble: Elite Fearless Gladiator's Silk Armor
				{ 3 , 143036 }, -- Fearless Gladiator's Silk Treads
				{ 4 , 143037 }, -- Fearless Gladiator's Silk Handguards
				{ 5 , 143038 }, -- Fearless Gladiator's Silk Cowl
				{ 6 , 143039 }, -- Fearless Gladiator's Silk Trousers
				{ 7 , 143040 }, -- Fearless Gladiator's Silk Robe
				{ 8 , 143041 }, -- Fearless Gladiator's Silk Amice
				{ 9 , 143042 }, -- Fearless Gladiator's Silk Cord
				{ 10, 143043 }, -- Fearless Gladiator's Silk Bracers
				{ 11, 143101 }, -- Fearless Gladiator's Silken Shawl
				{ 16, 146190 }, -- Ensemble: Fearless Gladiator's Silk Armor
				{ 18, 142584 }, -- Fearless Gladiator's Silk Treads
				{ 19, 142585 }, -- Fearless Gladiator's Silk Handguards
				{ 20, 142586 }, -- Fearless Gladiator's Silk Cowl
				{ 21, 142587 }, -- Fearless Gladiator's Silk Trousers
				{ 22, 142588 }, -- Fearless Gladiator's Silk Robe
				{ 23, 142589 }, -- Fearless Gladiator's Silk Amice
				{ 24, 142590 }, -- Fearless Gladiator's Silk Cord
				{ 25, 142591 }, -- Fearless Gladiator's Silk Bracers
				{ 26, 142653 }, -- Fearless Gladiator's Silken Shawl
				{ 101, 146200 }, -- Ensemble: Fearless Combatant's Silk Armor
				{ 103, 142810 }, -- Fearless Combatant's Silk Treads
				{ 104, 142811 }, -- Fearless Combatant's Silk Handguards
				{ 105, 142812 }, -- Fearless Combatant's Silk Cowl
				{ 106, 142813 }, -- Fearless Combatant's Silk Trousers
				{ 107, 142814 }, -- Fearless Combatant's Silk Robe
				{ 108, 142815 }, -- Fearless Combatant's Silk Amice
				{ 109, 142816 }, -- Fearless Combatant's Silk Cord
				{ 110, 142817 }, -- Fearless Combatant's Silk Bracers
				{ 111, 142875 }, -- Fearless Combatant's Silken Shawl
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146257 }, -- Ensemble: Elite Fearless Gladiator's Silk Armor
				{ 3 , 143149 }, -- Fearless Gladiator's Silk Treads
				{ 4 , 143150 }, -- Fearless Gladiator's Silk Handguards
				{ 5 , 143151 }, -- Fearless Gladiator's Silk Cowl
				{ 6 , 143152 }, -- Fearless Gladiator's Silk Trousers
				{ 7 , 143153 }, -- Fearless Gladiator's Silk Robe
				{ 8 , 143154 }, -- Fearless Gladiator's Silk Amice
				{ 9 , 143155 }, -- Fearless Gladiator's Silk Cord
				{ 10, 143156 }, -- Fearless Gladiator's Silk Bracers
				{ 11, 143214 }, -- Fearless Gladiator's Silken Shawl
				{ 16, 146191 }, -- Ensemble: Fearless Gladiator's Silk Armor
				{ 18, 142697 }, -- Fearless Gladiator's Silk Treads
				{ 19, 142698 }, -- Fearless Gladiator's Silk Handguards
				{ 20, 142699 }, -- Fearless Gladiator's Silk Cowl
				{ 21, 142700 }, -- Fearless Gladiator's Silk Trousers
				{ 22, 142701 }, -- Fearless Gladiator's Silk Robe
				{ 23, 142702 }, -- Fearless Gladiator's Silk Amice
				{ 24, 142703 }, -- Fearless Gladiator's Silk Cord
				{ 25, 142704 }, -- Fearless Gladiator's Silk Bracers
				{ 26, 142762 }, -- Fearless Gladiator's Silken Shawl
				{ 101, 146201 }, -- Ensemble: Fearless Combatant's Silk Armor
				{ 103, 142923 }, -- Fearless Combatant's Silk Treads
				{ 104, 142924 }, -- Fearless Combatant's Silk Handguards
				{ 105, 142925 }, -- Fearless Combatant's Silk Cowl
				{ 106, 142926 }, -- Fearless Combatant's Silk Trousers
				{ 107, 142927 }, -- Fearless Combatant's Silk Robe
				{ 108, 142928 }, -- Fearless Combatant's Silk Amice
				{ 109, 142929 }, -- Fearless Combatant's Silk Cord
				{ 110, 142930 }, -- Fearless Combatant's Silk Bracers
				{ 111, 142988 }, -- Fearless Combatant's Silken Shawl
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 146252 }, -- Ensemble: Elite Fearless Gladiator's Ironskin Armor
				{ 3 , 143044 }, -- Fearless Gladiator's Ironskin Slippers
				{ 4 , 143045 }, -- Fearless Gladiator's Ironskin Gloves
				{ 5 , 143046 }, -- Fearless Gladiator's Ironskin Helm
				{ 6 , 143047 }, -- Fearless Gladiator's Ironskin Legguards
				{ 7 , 143048 }, -- Fearless Gladiator's Ironskin Spaulders
				{ 8 , 143049 }, -- Fearless Gladiator's Ironskin Tunic
				{ 9 , 143050 }, -- Fearless Gladiator's Ironskin Belt
				{ 10, 143051 }, -- Fearless Gladiator's Ironskin Wristguards
				{ 11, 143105 }, -- Fearless Gladiator's Ironskin Cloak
				{ 16, 146186 }, -- Ensemble: Fearless Gladiator's Ironskin Armor
				{ 18, 142592 }, -- Fearless Gladiator's Ironskin Slippers
				{ 19, 142593 }, -- Fearless Gladiator's Ironskin Gloves
				{ 20, 142594 }, -- Fearless Gladiator's Ironskin Helm
				{ 21, 142595 }, -- Fearless Gladiator's Ironskin Legguards
				{ 22, 142596 }, -- Fearless Gladiator's Ironskin Spaulders
				{ 23, 142597 }, -- Fearless Gladiator's Ironskin Tunic
				{ 24, 142598 }, -- Fearless Gladiator's Ironskin Belt
				{ 25, 142599 }, -- Fearless Gladiator's Ironskin Wristguards
				{ 26, 142656 }, -- Fearless Gladiator's Ironskin Cloak
				{ 101, 146214 }, -- Ensemble: Fearless Combatant's Ironskin Armor
				{ 103, 142818 }, -- Fearless Combatant's Ironskin Slippers
				{ 104, 142819 }, -- Fearless Combatant's Ironskin Gloves
				{ 105, 142820 }, -- Fearless Combatant's Ironskin Helm
				{ 106, 142821 }, -- Fearless Combatant's Ironskin Legguards
				{ 107, 142822 }, -- Fearless Combatant's Ironskin Spaulders
				{ 108, 142823 }, -- Fearless Combatant's Ironskin Tunic
				{ 109, 142824 }, -- Fearless Combatant's Ironskin Belt
				{ 110, 142825 }, -- Fearless Combatant's Ironskin Wristguards
				{ 111, 142879 }, -- Fearless Combatant's Ironskin Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146253 }, -- Ensemble: Elite Fearless Gladiator's Ironskin Armor
				{ 3 , 143157 }, -- Fearless Gladiator's Ironskin Slippers
				{ 4 , 143158 }, -- Fearless Gladiator's Ironskin Gloves
				{ 5 , 143159 }, -- Fearless Gladiator's Ironskin Helm
				{ 6 , 143160 }, -- Fearless Gladiator's Ironskin Legguards
				{ 7 , 143161 }, -- Fearless Gladiator's Ironskin Spaulders
				{ 8 , 143162 }, -- Fearless Gladiator's Ironskin Tunic
				{ 9 , 143163 }, -- Fearless Gladiator's Ironskin Belt
				{ 10, 143164 }, -- Fearless Gladiator's Ironskin Wristguards
				{ 11, 143218 }, -- Fearless Gladiator's Ironskin Cloak
				{ 16, 146187 }, -- Ensemble: Fearless Gladiator's Ironskin Armor
				{ 18, 142705 }, -- Fearless Gladiator's Ironskin Slippers
				{ 19, 142706 }, -- Fearless Gladiator's Ironskin Gloves
				{ 20, 142707 }, -- Fearless Gladiator's Ironskin Helm
				{ 21, 142708 }, -- Fearless Gladiator's Ironskin Legguards
				{ 22, 142709 }, -- Fearless Gladiator's Ironskin Spaulders
				{ 23, 142710 }, -- Fearless Gladiator's Ironskin Tunic
				{ 24, 142711 }, -- Fearless Gladiator's Ironskin Belt
				{ 25, 142712 }, -- Fearless Gladiator's Ironskin Wristguards
				{ 26, 142766 }, -- Fearless Gladiator's Ironskin Cloak
				{ 101, 146215 }, -- Ensemble: Fearless Combatant's Ironskin Armor
				{ 103, 142931 }, -- Fearless Combatant's Ironskin Slippers
				{ 104, 142932 }, -- Fearless Combatant's Ironskin Gloves
				{ 105, 142933 }, -- Fearless Combatant's Ironskin Helm
				{ 106, 142934 }, -- Fearless Combatant's Ironskin Legguards
				{ 107, 142935 }, -- Fearless Combatant's Ironskin Spaulders
				{ 108, 142936 }, -- Fearless Combatant's Ironskin Tunic
				{ 109, 142937 }, -- Fearless Combatant's Ironskin Belt
				{ 110, 142938 }, -- Fearless Combatant's Ironskin Wristguards
				{ 111, 142992 }, -- Fearless Combatant's Ironskin Cloak
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 146244 }, -- Ensemble: Elite Fearless Gladiator's Scaled Armor
				{ 3 , 143052 }, -- Fearless Gladiator's Scaled Chestpiece
				{ 4 , 143053 }, -- Fearless Gladiator's Scaled Sabatons
				{ 5 , 143054 }, -- Fearless Gladiator's Scaled Gauntlets
				{ 6 , 143055 }, -- Fearless Gladiator's Scaled Helm
				{ 7 , 143056 }, -- Fearless Gladiator's Scaled Legguards
				{ 8 , 143057 }, -- Fearless Gladiator's Scaled Shoulders
				{ 9 , 143058 }, -- Fearless Gladiator's Scaled Girdle
				{ 10, 143059 }, -- Fearless Gladiator's Scaled Wristplates
				{ 11, 143109 }, -- Fearless Gladiator's Greatcloak of Faith
				{ 16, 146178 }, -- Ensemble: Fearless Gladiator's Scaled Armor
				{ 18, 142600 }, -- Fearless Gladiator's Scaled Battlerobe
				{ 19, 142601 }, -- Fearless Gladiator's Scaled Sabatons
				{ 20, 142602 }, -- Fearless Gladiator's Scaled Gauntlets
				{ 21, 142603 }, -- Fearless Gladiator's Scaled Helm
				{ 22, 142604 }, -- Fearless Gladiator's Scaled Legguards
				{ 23, 142605 }, -- Fearless Gladiator's Scaled Shoulders
				{ 24, 142606 }, -- Fearless Gladiator's Scaled Girdle
				{ 25, 142607 }, -- Fearless Gladiator's Scaled Wristplates
				{ 26, 142657 }, -- Fearless Gladiator's Greatcloak of Faith
				{ 101, 146210 }, -- Ensemble: Fearless Combatant's Scaled Armor
				{ 103, 142826 }, -- Fearless Combatant's Scaled Chestpiece
				{ 104, 142827 }, -- Fearless Combatant's Scaled Sabatons
				{ 105, 142828 }, -- Fearless Combatant's Scaled Gauntlets
				{ 106, 142829 }, -- Fearless Combatant's Scaled Helm
				{ 107, 142830 }, -- Fearless Combatant's Scaled Legguards
				{ 108, 142831 }, -- Fearless Combatant's Scaled Shoulders
				{ 109, 142832 }, -- Fearless Combatant's Scaled Girdle
				{ 110, 142833 }, -- Fearless Combatant's Scaled Wristplates
				{ 111, 142883 }, -- Fearless Combatant's Greatcloak of Faith
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146245 }, -- Ensemble: Elite Fearless Gladiator's Scaled Armor
				{ 3 , 143165 }, -- Fearless Gladiator's Scaled Chestpiece
				{ 4 , 143166 }, -- Fearless Gladiator's Scaled Sabatons
				{ 5 , 143167 }, -- Fearless Gladiator's Scaled Gauntlets
				{ 6 , 143168 }, -- Fearless Gladiator's Scaled Helm
				{ 7 , 143169 }, -- Fearless Gladiator's Scaled Legguards
				{ 8 , 143170 }, -- Fearless Gladiator's Scaled Shoulders
				{ 9 , 143171 }, -- Fearless Gladiator's Scaled Girdle
				{ 10, 143172 }, -- Fearless Gladiator's Scaled Wristplates
				{ 11, 143222 }, -- Fearless Gladiator's Greatcloak of Faith
				{ 16, 146179 }, -- Ensemble: Fearless Gladiator's Scaled Armor
				{ 18, 142713 }, -- Fearless Gladiator's Scaled Battlerobe
				{ 19, 142714 }, -- Fearless Gladiator's Scaled Sabatons
				{ 20, 142715 }, -- Fearless Gladiator's Scaled Gauntlets
				{ 21, 142716 }, -- Fearless Gladiator's Scaled Helm
				{ 22, 142717 }, -- Fearless Gladiator's Scaled Legguards
				{ 23, 142718 }, -- Fearless Gladiator's Scaled Shoulders
				{ 24, 142719 }, -- Fearless Gladiator's Scaled Girdle
				{ 25, 142720 }, -- Fearless Gladiator's Scaled Wristplates
				{ 26, 142770 }, -- Fearless Gladiator's Greatcloak of Faith
				{ 101, 146211 }, -- Ensemble: Fearless Combatant's Scaled Armor
				{ 103, 142939 }, -- Fearless Combatant's Scaled Chestpiece
				{ 104, 142940 }, -- Fearless Combatant's Scaled Sabatons
				{ 105, 142941 }, -- Fearless Combatant's Scaled Gauntlets
				{ 106, 142942 }, -- Fearless Combatant's Scaled Helm
				{ 107, 142943 }, -- Fearless Combatant's Scaled Legguards
				{ 108, 142944 }, -- Fearless Combatant's Scaled Shoulders
				{ 109, 142945 }, -- Fearless Combatant's Scaled Girdle
				{ 110, 142946 }, -- Fearless Combatant's Scaled Wristplates
				{ 111, 142996 }, -- Fearless Combatant's Greatcloak of Faith
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 146258 }, -- Ensemble: Elite Fearless Gladiator's Satin Armor
				{ 3 , 143060 }, -- Fearless Gladiator's Satin Treads
				{ 4 , 143061 }, -- Fearless Gladiator's Satin Gloves
				{ 5 , 143062 }, -- Fearless Gladiator's Satin Hood
				{ 6 , 143063 }, -- Fearless Gladiator's Satin Leggings
				{ 7 , 143064 }, -- Fearless Gladiator's Satin Robe
				{ 8 , 143065 }, -- Fearless Gladiator's Satin Mantle
				{ 9 , 143066 }, -- Fearless Gladiator's Satin Cord
				{ 10, 143067 }, -- Fearless Gladiator's Satin Bracers
				{ 11, 143298 }, -- Fearless Gladiator's Drape of Piety
				{ 16, 146192 }, -- Ensemble: Fearless Gladiator's Satin Armor
				{ 18, 142608 }, -- Fearless Gladiator's Satin Treads
				{ 19, 142609 }, -- Fearless Gladiator's Satin Gloves
				{ 20, 142610 }, -- Fearless Gladiator's Satin Hood
				{ 21, 142611 }, -- Fearless Gladiator's Satin Leggings
				{ 22, 142612 }, -- Fearless Gladiator's Satin Robe
				{ 23, 142613 }, -- Fearless Gladiator's Satin Mantle
				{ 24, 142614 }, -- Fearless Gladiator's Satin Cord
				{ 25, 142615 }, -- Fearless Gladiator's Satin Bracers
				{ 26, 143286 }, -- Fearless Gladiator's Drape of Piety
				{ 101, 146202 }, -- Ensemble: Fearless Combatant's Satin Armor
				{ 103, 142834 }, -- Fearless Combatant's Satin Treads
				{ 104, 142835 }, -- Fearless Combatant's Satin Gloves
				{ 105, 142836 }, -- Fearless Combatant's Satin Hood
				{ 106, 142837 }, -- Fearless Combatant's Satin Leggings
				{ 107, 142838 }, -- Fearless Combatant's Satin Robe
				{ 108, 142839 }, -- Fearless Combatant's Satin Mantle
				{ 109, 142840 }, -- Fearless Combatant's Satin Cord
				{ 110, 142841 }, -- Fearless Combatant's Satin Bracers
				{ 111, 143292 }, -- Fearless Combatant's Drape of Piety
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146259 }, -- Ensemble: Elite Fearless Gladiator's Satin Armor
				{ 3 , 143173 }, -- Fearless Gladiator's Satin Treads
				{ 4 , 143174 }, -- Fearless Gladiator's Satin Gloves
				{ 5 , 143175 }, -- Fearless Gladiator's Satin Hood
				{ 6 , 143176 }, -- Fearless Gladiator's Satin Leggings
				{ 7 , 143177 }, -- Fearless Gladiator's Satin Robe
				{ 8 , 143178 }, -- Fearless Gladiator's Satin Mantle
				{ 9 , 143179 }, -- Fearless Gladiator's Satin Cord
				{ 10, 143180 }, -- Fearless Gladiator's Satin Bracers
				{ 11, 143301 }, -- Fearless Gladiator's Drape of Piety
				{ 16, 146193 }, -- Ensemble: Fearless Gladiator's Satin Armor
				{ 18, 142721 }, -- Fearless Gladiator's Satin Treads
				{ 19, 142722 }, -- Fearless Gladiator's Satin Gloves
				{ 20, 142723 }, -- Fearless Gladiator's Satin Hood
				{ 21, 142724 }, -- Fearless Gladiator's Satin Leggings
				{ 22, 142725 }, -- Fearless Gladiator's Satin Robe
				{ 23, 142726 }, -- Fearless Gladiator's Satin Mantle
				{ 24, 142727 }, -- Fearless Gladiator's Satin Cord
				{ 25, 142728 }, -- Fearless Gladiator's Satin Bracers
				{ 26, 143289 }, -- Fearless Gladiator's Drape of Piety
				{ 101, 146203 }, -- Ensemble: Fearless Combatant's Satin Armor
				{ 103, 142947 }, -- Fearless Combatant's Satin Treads
				{ 104, 142948 }, -- Fearless Combatant's Satin Gloves
				{ 105, 142949 }, -- Fearless Combatant's Satin Hood
				{ 106, 142950 }, -- Fearless Combatant's Satin Leggings
				{ 107, 142951 }, -- Fearless Combatant's Satin Robe
				{ 108, 142952 }, -- Fearless Combatant's Satin Mantle
				{ 109, 142953 }, -- Fearless Combatant's Satin Cord
				{ 110, 142954 }, -- Fearless Combatant's Satin Bracers
				{ 111, 143295 }, -- Fearless Combatant's Drape of Piety
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 146254 }, -- Ensemble: Elite Fearless Gladiator's Leather Armor
				{ 3 , 143068 }, -- Fearless Gladiator's Leather Tunic
				{ 4 , 143069 }, -- Fearless Gladiator's Leather Slippers
				{ 5 , 143070 }, -- Fearless Gladiator's Leather Gloves
				{ 6 , 143071 }, -- Fearless Gladiator's Leather Helm
				{ 7 , 143072 }, -- Fearless Gladiator's Leather Legguards
				{ 8 , 143073 }, -- Fearless Gladiator's Leather Spaulders
				{ 9 , 143074 }, -- Fearless Gladiator's Leather Belt
				{ 10, 143075 }, -- Fearless Gladiator's Leather Wristguards
				{ 11, 143299 }, -- Fearless Gladiator's Shadowcape
				{ 16, 146188 }, -- Ensemble: Fearless Gladiator's Leather Armor
				{ 18, 142616 }, -- Fearless Gladiator's Leather Tunic
				{ 19, 142617 }, -- Fearless Gladiator's Leather Slippers
				{ 20, 142618 }, -- Fearless Gladiator's Leather Gloves
				{ 21, 142619 }, -- Fearless Gladiator's Leather Helm
				{ 22, 142620 }, -- Fearless Gladiator's Leather Legguards
				{ 23, 142621 }, -- Fearless Gladiator's Leather Spaulders
				{ 24, 142622 }, -- Fearless Gladiator's Leather Belt
				{ 25, 142623 }, -- Fearless Gladiator's Leather Wristguards
				{ 26, 143287 }, -- Fearless Gladiator's Shadowcape
				{ 101, 146216 }, -- Ensemble: Fearless Combatant's Leather Armor
				{ 103, 142842 }, -- Fearless Combatant's Leather Tunic
				{ 104, 142843 }, -- Fearless Combatant's Leather Slippers
				{ 105, 142844 }, -- Fearless Combatant's Leather Gloves
				{ 106, 142845 }, -- Fearless Combatant's Leather Helm
				{ 107, 142846 }, -- Fearless Combatant's Leather Legguards
				{ 108, 142847 }, -- Fearless Combatant's Leather Spaulders
				{ 109, 142848 }, -- Fearless Combatant's Leather Belt
				{ 110, 142849 }, -- Fearless Combatant's Leather Wristguards
				{ 111, 143293 }, -- Fearless Combatant's Shadowcape
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146255 }, -- Ensemble: Elite Fearless Gladiator's Leather Armor
				{ 3 , 143181 }, -- Fearless Gladiator's Leather Tunic
				{ 4 , 143182 }, -- Fearless Gladiator's Leather Slippers
				{ 5 , 143183 }, -- Fearless Gladiator's Leather Gloves
				{ 6 , 143184 }, -- Fearless Gladiator's Leather Helm
				{ 7 , 143185 }, -- Fearless Gladiator's Leather Legguards
				{ 8 , 143186 }, -- Fearless Gladiator's Leather Spaulders
				{ 9 , 143187 }, -- Fearless Gladiator's Leather Belt
				{ 10, 143188 }, -- Fearless Gladiator's Leather Wristguards
				{ 11, 143302 }, -- Fearless Gladiator's Shadowcape
				{ 16, 146189 }, -- Ensemble: Fearless Gladiator's Leather Armor
				{ 18, 142729 }, -- Fearless Gladiator's Leather Tunic
				{ 19, 142730 }, -- Fearless Gladiator's Leather Slippers
				{ 20, 142731 }, -- Fearless Gladiator's Leather Gloves
				{ 21, 142732 }, -- Fearless Gladiator's Leather Helm
				{ 22, 142733 }, -- Fearless Gladiator's Leather Legguards
				{ 23, 142734 }, -- Fearless Gladiator's Leather Spaulders
				{ 24, 142735 }, -- Fearless Gladiator's Leather Belt
				{ 25, 142736 }, -- Fearless Gladiator's Leather Wristguards
				{ 26, 143290 }, -- Fearless Gladiator's Shadowcape
				{ 101, 146217 }, -- Ensemble: Fearless Combatant's Leather Armor
				{ 103, 142955 }, -- Fearless Combatant's Leather Tunic
				{ 104, 142956 }, -- Fearless Combatant's Leather Slippers
				{ 105, 142957 }, -- Fearless Combatant's Leather Gloves
				{ 106, 142958 }, -- Fearless Combatant's Leather Helm
				{ 107, 142959 }, -- Fearless Combatant's Leather Legguards
				{ 108, 142960 }, -- Fearless Combatant's Leather Spaulders
				{ 109, 142961 }, -- Fearless Combatant's Leather Belt
				{ 110, 142962 }, -- Fearless Combatant's Leather Wristguards
				{ 111, 143296 }, -- Fearless Combatant's Shadowcape
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 146246 }, -- Ensemble: Elite Fearless Gladiator's Ringmail Armor
				{ 3 , 143076 }, -- Fearless Gladiator's Ringmail Armor
				{ 4 , 143077 }, -- Fearless Gladiator's Ringmail Boots
				{ 5 , 143078 }, -- Fearless Gladiator's Ringmail Gauntlets
				{ 6 , 143079 }, -- Fearless Gladiator's Ringmail Helm
				{ 7 , 143080 }, -- Fearless Gladiator's Ringmail Kilt
				{ 8 , 143081 }, -- Fearless Gladiator's Ringmail Spaulders
				{ 9 , 143082 }, -- Fearless Gladiator's Ringmail Clasp
				{ 10, 143083 }, -- Fearless Gladiator's Ringmail Armband
				{ 11, 143300 }, -- Fearless Gladiator's Totemic Cloak
				{ 16, 146180 }, -- Ensemble: Fearless Gladiator's Ringmail Armor
				{ 18, 142624 }, -- Fearless Gladiator's Ringmail Armor
				{ 19, 142625 }, -- Fearless Gladiator's Ringmail Boots
				{ 20, 142626 }, -- Fearless Gladiator's Ringmail Gauntlets
				{ 21, 142627 }, -- Fearless Gladiator's Ringmail Helm
				{ 22, 142628 }, -- Fearless Gladiator's Ringmail Kilt
				{ 23, 142629 }, -- Fearless Gladiator's Ringmail Spaulders
				{ 24, 142630 }, -- Fearless Gladiator's Ringmail Clasp
				{ 25, 142631 }, -- Fearless Gladiator's Ringmail Armband
				{ 26, 143288 }, -- Fearless Gladiator's Totemic Cloak
				{ 101, 146196 }, -- Ensemble: Fearless Combatant's Ringmail Armor
				{ 103, 142850 }, -- Fearless Combatant's Ringmail Armor
				{ 104, 142851 }, -- Fearless Combatant's Ringmail Boots
				{ 105, 142852 }, -- Fearless Combatant's Ringmail Gauntlets
				{ 106, 142853 }, -- Fearless Combatant's Ringmail Helm
				{ 107, 142854 }, -- Fearless Combatant's Ringmail Kilt
				{ 108, 142855 }, -- Fearless Combatant's Ringmail Spaulders
				{ 109, 142856 }, -- Fearless Combatant's Ringmail Clasp
				{ 110, 142857 }, -- Fearless Combatant's Ringmail Armband
				{ 111, 143294 }, -- Fearless Combatant's Totemic Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146247 }, -- Ensemble: Elite Fearless Gladiator's Ringmail Armor
				{ 3 , 143189 }, -- Fearless Gladiator's Ringmail Armor
				{ 4 , 143190 }, -- Fearless Gladiator's Ringmail Boots
				{ 5 , 143191 }, -- Fearless Gladiator's Ringmail Gauntlets
				{ 6 , 143192 }, -- Fearless Gladiator's Ringmail Helm
				{ 7 , 143193 }, -- Fearless Gladiator's Ringmail Kilt
				{ 8 , 143194 }, -- Fearless Gladiator's Ringmail Spaulders
				{ 9 , 143195 }, -- Fearless Gladiator's Ringmail Clasp
				{ 10, 143196 }, -- Fearless Gladiator's Ringmail Armband
				{ 11, 143303 }, -- Fearless Gladiator's Totemic Cloak
				{ 16, 146181 }, -- Ensemble: Fearless Gladiator's Ringmail Armor
				{ 18, 142737 }, -- Fearless Gladiator's Ringmail Armor
				{ 19, 142738 }, -- Fearless Gladiator's Ringmail Boots
				{ 20, 142739 }, -- Fearless Gladiator's Ringmail Gauntlets
				{ 21, 142740 }, -- Fearless Gladiator's Ringmail Helm
				{ 22, 142741 }, -- Fearless Gladiator's Ringmail Kilt
				{ 23, 142742 }, -- Fearless Gladiator's Ringmail Spaulders
				{ 24, 142743 }, -- Fearless Gladiator's Ringmail Clasp
				{ 25, 142744 }, -- Fearless Gladiator's Ringmail Armband
				{ 26, 143291 }, -- Fearless Gladiator's Totemic Cloak
				{ 101, 146197 }, -- Ensemble: Fearless Combatant's Ringmail Armor
				{ 103, 142963 }, -- Fearless Combatant's Ringmail Armor
				{ 104, 142964 }, -- Fearless Combatant's Ringmail Boots
				{ 105, 142965 }, -- Fearless Combatant's Ringmail Gauntlets
				{ 106, 142966 }, -- Fearless Combatant's Ringmail Helm
				{ 107, 142967 }, -- Fearless Combatant's Ringmail Leggings
				{ 108, 142968 }, -- Fearless Combatant's Ringmail Spaulders
				{ 109, 142969 }, -- Fearless Combatant's Ringmail Clasp
				{ 110, 142970 }, -- Fearless Combatant's Ringmail Armband
				{ 111, 143297 }, -- Fearless Combatant's Totemic Cloak
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 146260 }, -- Ensemble: Elite Fearless Gladiator's Felweave Armor
				{ 3 , 143084 }, -- Fearless Gladiator's Felweave Treads
				{ 4 , 143085 }, -- Fearless Gladiator's Felweave Handguards
				{ 5 , 143086 }, -- Fearless Gladiator's Felweave Cowl
				{ 6 , 143087 }, -- Fearless Gladiator's Felweave Trousers
				{ 7 , 143088 }, -- Fearless Gladiator's Felweave Raiment
				{ 8 , 143089 }, -- Fearless Gladiator's Felweave Amice
				{ 9 , 143090 }, -- Fearless Gladiator's Felweave Cord
				{ 10, 143091 }, -- Fearless Gladiator's Felweave Bracers
				{ 11, 143308 }, -- Fearless Gladiator's Felweave Cloak
				{ 16, 146194 }, -- Ensemble: Fearless Gladiator's Felweave Armor
				{ 18, 142632 }, -- Fearless Gladiator's Felweave Treads
				{ 19, 142633 }, -- Fearless Gladiator's Felweave Handguards
				{ 20, 142634 }, -- Fearless Gladiator's Felweave Cowl
				{ 21, 142635 }, -- Fearless Gladiator's Felweave Trousers
				{ 22, 142636 }, -- Fearless Gladiator's Felweave Raiment
				{ 23, 142637 }, -- Fearless Gladiator's Felweave Amice
				{ 24, 142638 }, -- Fearless Gladiator's Felweave Cord
				{ 25, 142639 }, -- Fearless Gladiator's Felweave Bracers
				{ 26, 143304 }, -- Fearless Gladiator's Felweave Cloak
				{ 101, 146204 }, -- Ensemble: Fearless Combatant's Felweave Armor
				{ 103, 142858 }, -- Fearless Combatant's Felweave Treads
				{ 104, 142859 }, -- Fearless Combatant's Felweave Handguards
				{ 105, 142860 }, -- Fearless Combatant's Felweave Cowl
				{ 106, 142861 }, -- Fearless Combatant's Felweave Trousers
				{ 107, 142862 }, -- Fearless Combatant's Felweave Raiment
				{ 108, 142863 }, -- Fearless Combatant's Felweave Amice
				{ 109, 142864 }, -- Fearless Combatant's Felweave Cord
				{ 110, 142865 }, -- Fearless Combatant's Felweave Bracers
				{ 111, 143306 }, -- Fearless Combatant's Felweave Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146261 }, -- Ensemble: Elite Fearless Gladiator's Felweave Armor
				{ 3 , 143197 }, -- Fearless Gladiator's Felweave Treads
				{ 4 , 143198 }, -- Fearless Gladiator's Felweave Handguards
				{ 5 , 143199 }, -- Fearless Gladiator's Felweave Cowl
				{ 6 , 143200 }, -- Fearless Gladiator's Felweave Trousers
				{ 7 , 143201 }, -- Fearless Gladiator's Felweave Raiment
				{ 8 , 143202 }, -- Fearless Gladiator's Felweave Amice
				{ 9 , 143203 }, -- Fearless Gladiator's Felweave Cord
				{ 10, 143204 }, -- Fearless Gladiator's Felweave Bracers
				{ 11, 143309 }, -- Fearless Gladiator's Felweave Cloak
				{ 16, 146195 }, -- Ensemble: Fearless Gladiator's Felweave Armor
				{ 18, 142745 }, -- Fearless Gladiator's Felweave Treads
				{ 19, 142746 }, -- Fearless Gladiator's Felweave Handguards
				{ 20, 142747 }, -- Fearless Gladiator's Felweave Cowl
				{ 21, 142748 }, -- Fearless Gladiator's Felweave Trousers
				{ 22, 142749 }, -- Fearless Gladiator's Felweave Raiment
				{ 23, 142750 }, -- Fearless Gladiator's Felweave Amice
				{ 24, 142751 }, -- Fearless Gladiator's Felweave Cord
				{ 25, 142752 }, -- Fearless Gladiator's Felweave Bracers
				{ 26, 143305 }, -- Fearless Gladiator's Felweave Cloak
				{ 101, 146205 }, -- Ensemble: Fearless Combatant's Felweave Armor
				{ 103, 142971 }, -- Fearless Combatant's Felweave Treads
				{ 104, 142972 }, -- Fearless Combatant's Felweave Handguards
				{ 105, 142973 }, -- Fearless Combatant's Felweave Cowl
				{ 106, 142974 }, -- Fearless Combatant's Felweave Trousers
				{ 107, 142975 }, -- Fearless Combatant's Felweave Raiment
				{ 108, 142976 }, -- Fearless Combatant's Felweave Amice
				{ 109, 142977 }, -- Fearless Combatant's Felweave Cord
				{ 110, 142978 }, -- Fearless Combatant's Felweave Bracers
				{ 111, 143307 }, -- Fearless Combatant's Felweave Cloak
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 146240 }, -- Ensemble: Elite Fearless Gladiator's Plate Armor
				{ 3 , 143092 }, -- Fearless Gladiator's Plate Chestpiece
				{ 4 , 143093 }, -- Fearless Gladiator's Plate Warboots
				{ 5 , 143094 }, -- Fearless Gladiator's Plate Gauntlets
				{ 6 , 143095 }, -- Fearless Gladiator's Plate Helm
				{ 7 , 143096 }, -- Fearless Gladiator's Plate Legguards
				{ 8 , 143097 }, -- Fearless Gladiator's Plate Shoulders
				{ 9 , 143098 }, -- Fearless Gladiator's Plate Girdle
				{ 10, 143099 }, -- Fearless Gladiator's Plate Wristplates
				{ 11, 143314 }, -- Fearless Gladiator's Cloak of Battle
				{ 16, 146174 }, -- Ensemble: Fearless Gladiator's Plate Armor
				{ 18, 142640 }, -- Fearless Gladiator's Plate Chestpiece
				{ 19, 142641 }, -- Fearless Gladiator's Plate Warboots
				{ 20, 142642 }, -- Fearless Gladiator's Plate Gauntlets
				{ 21, 142643 }, -- Fearless Gladiator's Plate Helm
				{ 22, 142644 }, -- Fearless Gladiator's Plate Legguards
				{ 23, 142645 }, -- Fearless Gladiator's Plate Shoulders
				{ 24, 142646 }, -- Fearless Gladiator's Plate Girdle
				{ 25, 142647 }, -- Fearless Gladiator's Plate Wristplates
				{ 26, 143310 }, -- Fearless Gladiator's Cloak of Battle
				{ 101, 146206 }, -- Ensemble: Fearless Combatant's Plate Armor
				{ 103, 142866 }, -- Fearless Combatant's Plate Chestpiece
				{ 104, 142867 }, -- Fearless Combatant's Plate Warboots
				{ 105, 142868 }, -- Fearless Combatant's Plate Gauntlets
				{ 106, 142869 }, -- Fearless Combatant's Plate Helm
				{ 107, 142870 }, -- Fearless Combatant's Plate Legguards
				{ 108, 142871 }, -- Fearless Combatant's Plate Shoulders
				{ 109, 142872 }, -- Fearless Combatant's Plate Girdle
				{ 110, 142873 }, -- Fearless Combatant's Plate Wristplates
				{ 111, 143312 }, -- Fearless Combatant's Cloak of Battle
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146241 }, -- Ensemble: Elite Fearless Gladiator's Plate Armor
				{ 3 , 143205 }, -- Fearless Gladiator's Plate Chestpiece
				{ 4 , 143206 }, -- Fearless Gladiator's Plate Warboots
				{ 5 , 143207 }, -- Fearless Gladiator's Plate Gauntlets
				{ 6 , 143208 }, -- Fearless Gladiator's Plate Helm
				{ 7 , 143209 }, -- Fearless Gladiator's Plate Legguards
				{ 8 , 143210 }, -- Fearless Gladiator's Plate Shoulders
				{ 9 , 143211 }, -- Fearless Gladiator's Plate Girdle
				{ 10, 143212 }, -- Fearless Gladiator's Plate Wristplates
				{ 11, 143315 }, -- Fearless Gladiator's Cloak of Battle
				{ 16, 146175 }, -- Ensemble: Fearless Gladiator's Plate Armor
				{ 18, 142753 }, -- Fearless Gladiator's Plate Chestpiece
				{ 19, 142754 }, -- Fearless Gladiator's Plate Warboots
				{ 20, 142755 }, -- Fearless Gladiator's Plate Gauntlets
				{ 21, 142756 }, -- Fearless Gladiator's Plate Helm
				{ 22, 142757 }, -- Fearless Gladiator's Plate Legguards
				{ 23, 142758 }, -- Fearless Gladiator's Plate Shoulders
				{ 24, 142759 }, -- Fearless Gladiator's Plate Girdle
				{ 25, 142760 }, -- Fearless Gladiator's Plate Wristplates
				{ 26, 143311 }, -- Fearless Gladiator's Cloak of Battle
				{ 101, 146207 }, -- Ensemble: Fearless Combatant's Plate Armor
				{ 103, 142979 }, -- Fearless Combatant's Plate Chestpiece
				{ 104, 142980 }, -- Fearless Combatant's Plate Warboots
				{ 105, 142981 }, -- Fearless Combatant's Plate Gauntlets
				{ 106, 142982 }, -- Fearless Combatant's Plate Helm
				{ 107, 142983 }, -- Fearless Combatant's Plate Legguards
				{ 108, 142984 }, -- Fearless Combatant's Plate Shoulders
				{ 109, 142985 }, -- Fearless Combatant's Plate Girdle
				{ 110, 142986 }, -- Fearless Combatant's Plate Wristplates
				{ 111, 143313 }, -- Fearless Combatant's Cloak of Battle
			},
		},
	},
}

data["LEGION2GEAR"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 2).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Legion Season %d Elite"], 2),
			[ALLIANCE_DIFF] = {
				-- Amulet
				{ 1, 143102 }, -- Fearless Gladiator's Necklace
				{ 2, 143106 }, -- Fearless Gladiator's Pendant
				{ 3, 143110 }, -- Fearless Gladiator's Choker
				-- Ring
				{ 5, 143103 }, -- Fearless Gladiator's Ring
				{ 6, 143107 }, -- Fearless Gladiator's Band
				{ 7, 143111 }, -- Fearless Gladiator's Signet
				-- Trinket
				{ 16, 143112 }, -- Fearless Gladiator's Badge of Conquest
				{ 17, 143113 }, -- Fearless Gladiator's Accolade of Conquest
				{ 18, 143114 }, -- Fearless Gladiator's Insignia of Conquest
				{ 19, 143115 }, -- Fearless Gladiator's Emblem of Cruelty
				{ 20, 143116 }, -- Fearless Gladiator's Emblem of Tenacity
				{ 21, 143117 }, -- Fearless Gladiator's Emblem of Meditation
				{ 22, 143118 }, -- Fearless Gladiator's Badge of Dominance
				{ 23, 143119 }, -- Fearless Gladiator's Accolade of Dominance
				{ 24, 143120 }, -- Fearless Gladiator's Insignia of Dominance
				{ 25, 143121 }, -- Fearless Gladiator's Badge of Victory
				{ 26, 143122 }, -- Fearless Gladiator's Accolade of Victory
				{ 27, 143123 }, -- Fearless Gladiator's Insignia of Victory
				{ 28, 143124 }, -- Fearless Gladiator's Badge of Adaptation
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 1, 143215 }, -- Fearless Gladiator's Necklace
				{ 2, 143219 }, -- Fearless Gladiator's Pendant
				{ 3, 143223 }, -- Fearless Gladiator's Choker
				-- Ring
				{ 5, 143216 }, -- Fearless Gladiator's Ring
				{ 6, 143220 }, -- Fearless Gladiator's Band
				{ 7, 143224 }, -- Fearless Gladiator's Signet
				-- Trinket
				{ 16, 143225 }, -- Fearless Gladiator's Badge of Conquest
				{ 17, 143226 }, -- Fearless Gladiator's Accolade of Conquest
				{ 18, 143227 }, -- Fearless Gladiator's Insignia of Conquest
				{ 19, 143228 }, -- Fearless Gladiator's Emblem of Cruelty
				{ 20, 143229 }, -- Fearless Gladiator's Emblem of Tenacity
				{ 21, 143230 }, -- Fearless Gladiator's Emblem of Meditation
				{ 22, 143231 }, -- Fearless Gladiator's Badge of Dominance
				{ 23, 143232 }, -- Fearless Gladiator's Accolade of Dominance
				{ 24, 143233 }, -- Fearless Gladiator's Insignia of Dominance
				{ 25, 143234 }, -- Fearless Gladiator's Badge of Victory
				{ 26, 143235 }, -- Fearless Gladiator's Accolade of Victory
				{ 27, 143236 }, -- Fearless Gladiator's Insignia of Victory
				{ 28, 143237 }, -- Fearless Gladiator's Badge of Adaptation
			},
		},
		{
			name = string.format(AL["Legion Season %d"], 1),
			[ALLIANCE_DIFF] = {
				-- Amulet
				{ 1, 142650 }, -- Fearless Gladiator's Necklace
				{ 2, 142654 }, -- Fearless Gladiator's Pendant
				{ 3, 142658 }, -- Fearless Gladiator's Choker
				-- Ring
				{ 5, 142651 }, -- Fearless Gladiator's Ring
				{ 6, 142655 }, -- Fearless Gladiator's Band
				{ 7, 142659 }, -- Fearless Gladiator's Signet
				-- Trinket
				{ 16, 142660 }, -- Fearless Gladiator's Badge of Conquest
				{ 17, 142661 }, -- Fearless Gladiator's Accolade of Conquest
				{ 18, 142662 }, -- Fearless Gladiator's Insignia of Conquest
				{ 19, 142663 }, -- Fearless Gladiator's Emblem of Cruelty
				{ 20, 142664 }, -- Fearless Gladiator's Emblem of Tenacity
				{ 21, 142665 }, -- Fearless Gladiator's Emblem of Meditation
				{ 22, 142666 }, -- Fearless Gladiator's Badge of Dominance
				{ 23, 142667 }, -- Fearless Gladiator's Accolade of Dominance
				{ 24, 142668 }, -- Fearless Gladiator's Insignia of Dominance
				{ 25, 142669 }, -- Fearless Gladiator's Badge of Victory
				{ 26, 142670 }, -- Fearless Gladiator's Accolade of Victory
				{ 27, 142671 }, -- Fearless Gladiator's Insignia of Victory
				{ 28, 142672 }, -- Fearless Gladiator's Badge of Adaptation
				-- Mount
				{ 30, 141844 }, -- Fearless Gladiator's Storm Dragon
				-- Amulet
				{ 101, 142876 }, -- Fearless Combatant's Necklace
				{ 102, 142880 }, -- Fearless Combatant's Pendant
				{ 103, 142884 }, -- Fearless Combatant's Choker
				-- Ring
				{ 105, 142877 }, -- Fearless Combatant's Ring
				{ 106, 142881 }, -- Fearless Combatant's Band
				{ 107, 142885 }, -- Fearless Combatant's Signet
				-- Trinket
				{ 116, 142886 }, -- Fearless Combatant's Badge of Conquest
				{ 117, 142887 }, -- Fearless Combatant's Accolade of Conquest
				{ 118, 142888 }, -- Fearless Combatant's Insignia of Conquest
				{ 119, 142889 }, -- Fearless Combatant's Emblem of Cruelty
				{ 120, 142890 }, -- Fearless Combatant's Emblem of Tenacity
				{ 121, 142891 }, -- Fearless Combatant's Emblem of Meditation
				{ 122, 142892 }, -- Fearless Combatant's Badge of Dominance
				{ 123, 142893 }, -- Fearless Combatant's Accolade of Dominance
				{ 124, 142894 }, -- Fearless Combatant's Insignia of Dominance
				{ 125, 142895 }, -- Fearless Combatant's Badge of Victory
				{ 126, 142896 }, -- Fearless Combatant's Accolade of Victory
				{ 127, 142897 }, -- Fearless Combatant's Insignia of Victory
				{ 128, 142898 }, -- Fearless Combatant's Badge of Adaptation
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 1, 142763 }, -- Fearless Gladiator's Necklace
				{ 2, 142767 }, -- Fearless Gladiator's Pendant
				{ 3, 142771 }, -- Fearless Gladiator's Choker
				-- Ring
				{ 5, 142764 }, -- Fearless Gladiator's Ring
				{ 6, 142768 }, -- Fearless Gladiator's Band
				{ 7, 142772 }, -- Fearless Gladiator's Signet
				-- Trinket
				{ 16, 142773 }, -- Fearless Gladiator's Badge of Conquest
				{ 17, 142774 }, -- Fearless Gladiator's Accolade of Conquest
				{ 18, 142775 }, -- Fearless Gladiator's Insignia of Conquest
				{ 19, 142776 }, -- Fearless Gladiator's Emblem of Cruelty
				{ 20, 142777 }, -- Fearless Gladiator's Emblem of Tenacity
				{ 21, 142778 }, -- Fearless Gladiator's Emblem of Meditation
				{ 22, 142779 }, -- Fearless Gladiator's Badge of Dominance
				{ 23, 142780 }, -- Fearless Gladiator's Accolade of Dominance
				{ 24, 142781 }, -- Fearless Gladiator's Insignia of Dominance
				{ 25, 142782 }, -- Fearless Gladiator's Badge of Victory
				{ 26, 142783 }, -- Fearless Gladiator's Accolade of Victory
				{ 27, 142784 }, -- Fearless Gladiator's Insignia of Victory
				{ 28, 142785 }, -- Fearless Gladiator's Badge of Adaptation
				-- Mount
				{ 30, 141844 }, -- Fearless Gladiator's Storm Dragon
				-- Amulet
				{ 101, 142989 }, -- Fearless Combatant's Necklace
				{ 102, 142993 }, -- Fearless Combatant's Pendant
				{ 103, 142997 }, -- Fearless Combatant's Choker
				-- Ring
				{ 105, 142990 }, -- Fearless Combatant's Ring
				{ 106, 142994 }, -- Fearless Combatant's Band
				{ 107, 142998 }, -- Fearless Combatant's Signet
				-- Trinket
				{ 116, 142999 }, -- Fearless Combatant's Badge of Conquest
				{ 117, 143000 }, -- Fearless Combatant's Accolade of Conquest
				{ 118, 143001 }, -- Fearless Combatant's Insignia of Conquest
				{ 119, 143002 }, -- Fearless Combatant's Emblem of Cruelty
				{ 120, 143003 }, -- Fearless Combatant's Emblem of Tenacity
				{ 121, 143004 }, -- Fearless Combatant's Emblem of Meditation
				{ 122, 143005 }, -- Fearless Combatant's Badge of Dominance
				{ 123, 143006 }, -- Fearless Combatant's Accolade of Dominance
				{ 124, 143007 }, -- Fearless Combatant's Insignia of Dominance
				{ 125, 143008 }, -- Fearless Combatant's Badge of Victory
				{ 126, 143009 }, -- Fearless Combatant's Accolade of Victory
				{ 127, 143010 }, -- Fearless Combatant's Insignia of Victory
				{ 128, 143011 }, -- Fearless Combatant's Badge of Adaptation
			},
		},
	},
}

data["LEGION1SETS"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 1).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 146220, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Dreadplate Armor
				{ 3 , 136043 }, -- Vindictive Gladiator's Dreadplate Chestpiece
				{ 4 , 136044 }, -- Vindictive Gladiator's Dreadplate Sabatons
				{ 5 , 136045 }, -- Vindictive Gladiator's Dreadplate Gauntlets
				{ 6 , 136046 }, -- Vindictive Gladiator's Dreadplate Helm
				{ 7 , 136047 }, -- Vindictive Gladiator's Dreadplate Legguards
				{ 8 , 136048 }, -- Vindictive Gladiator's Dreadplate Shoulders
				{ 9 , 136049 }, -- Vindictive Gladiator's Dreadplate Girdle
				{ 10, 136050 }, -- Vindictive Gladiator's Dreadplate Wristplates
				{ 11, 136131 }, -- Vindictive Gladiator's Dreadcloak
				{ 16, 146132, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Dreadplate Armor
				{ 18, 135591 }, -- Vindictive Gladiator's Dreadplate Chestpiece
				{ 19, 135592 }, -- Vindictive Gladiator's Dreadplate Sabatons
				{ 20, 135593 }, -- Vindictive Gladiator's Dreadplate Gauntlets
				{ 21, 135594 }, -- Vindictive Gladiator's Dreadplate Helm
				{ 22, 135595 }, -- Vindictive Gladiator's Dreadplate Legguards
				{ 23, 135596 }, -- Vindictive Gladiator's Dreadplate Shoulders
				{ 24, 135597 }, -- Vindictive Gladiator's Dreadplate Girdle
				{ 25, 135598 }, -- Vindictive Gladiator's Dreadplate Wristplates
				{ 26, 135679 }, -- Vindictive Gladiator's Dreadcloak
				{ 101, 146164, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Dreadplate Armor
				{ 103, 135817 }, -- Vindictive Combatant's Dreadplate Chestpiece
				{ 104, 135818 }, -- Vindictive Combatant's Dreadplate Sabatons
				{ 105, 135819 }, -- Vindictive Combatant's Dreadplate Gauntlets
				{ 106, 135820 }, -- Vindictive Combatant's Dreadplate Helm
				{ 107, 135821 }, -- Vindictive Combatant's Dreadplate Legguards
				{ 108, 135822 }, -- Vindictive Combatant's Dreadplate Shoulders
				{ 109, 135823 }, -- Vindictive Combatant's Dreadplate Girdle
				{ 110, 135824 }, -- Vindictive Combatant's Dreadplate Wristplates
				{ 111, 135905 }, -- Vindictive Combatant's Dreadcloak
				},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146221, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Dreadplate Armor
				{ 3 , 136156 }, -- Vindictive Gladiator's Dreadplate Chestpiece
				{ 4 , 136157 }, -- Vindictive Gladiator's Dreadplate Sabatons
				{ 5 , 136158 }, -- Vindictive Gladiator's Dreadplate Gauntlets
				{ 6 , 136159 }, -- Vindictive Gladiator's Dreadplate Helm
				{ 7 , 136160 }, -- Vindictive Gladiator's Dreadplate Legguards
				{ 8 , 136161 }, -- Vindictive Gladiator's Dreadplate Shoulders
				{ 9 , 136162 }, -- Vindictive Gladiator's Dreadplate Girdle
				{ 10, 136163 }, -- Vindictive Gladiator's Dreadplate Wristplates
				{ 11, 136244 }, -- Vindictive Gladiator's Dreadcloak
				{ 16, 146133, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Dreadplate Armor
				{ 18, 135704 }, -- Vindictive Gladiator's Dreadplate Chestpiece
				{ 19, 135705 }, -- Vindictive Gladiator's Dreadplate Sabatons
				{ 20, 135706 }, -- Vindictive Gladiator's Dreadplate Gauntlets
				{ 21, 135707 }, -- Vindictive Gladiator's Dreadplate Helm
				{ 22, 135708 }, -- Vindictive Gladiator's Dreadplate Legguards
				{ 23, 135709 }, -- Vindictive Gladiator's Dreadplate Shoulders
				{ 24, 135710 }, -- Vindictive Gladiator's Dreadplate Girdle
				{ 25, 135711 }, -- Vindictive Gladiator's Dreadplate Wristplates
				{ 26, 135792 }, -- Vindictive Gladiator's Dreadcloak
				{ 101, 146165, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Dreadplate Armor
				{ 103, 135930 }, -- Vindictive Combatant's Dreadplate Chestpiece
				{ 104, 135931 }, -- Vindictive Combatant's Dreadplate Sabatons
				{ 105, 135932 }, -- Vindictive Combatant's Dreadplate Gauntlets
				{ 106, 135933 }, -- Vindictive Combatant's Dreadplate Helm
				{ 107, 135934 }, -- Vindictive Combatant's Dreadplate Legguards
				{ 108, 135935 }, -- Vindictive Combatant's Dreadplate Shoulders
				{ 109, 135936 }, -- Vindictive Combatant's Dreadplate Girdle
				{ 110, 135937 }, -- Vindictive Combatant's Dreadplate Wristplates
				{ 111, 136018 }, -- Vindictive Combatant's Dreadcloak
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 146270, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Felskin Armor
				{ 3 , 136311 }, -- Vindictive Gladiator's Felskin Boots
				{ 4 , 136312 }, -- Vindictive Gladiator's Felskin Gloves
				{ 5 , 136313 }, -- Vindictive Gladiator's Felskin Helm
				{ 6 , 136314 }, -- Vindictive Gladiator's Felskin Legguards
				{ 7 , 136315 }, -- Vindictive Gladiator's Felskin Tunic
				{ 8 , 136316 }, -- Vindictive Gladiator's Felskin Spaulders
				{ 9 , 136317 }, -- Vindictive Gladiator's Felskin Belt
				{ 10, 136318 }, -- Vindictive Gladiator's Felskin Wristguards
				{ 16, 146262, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Felskin Armor
				{ 18, 136279 }, -- Vindictive Gladiator's Felskin Boots
				{ 19, 136280 }, -- Vindictive Gladiator's Felskin Gloves
				{ 20, 136281 }, -- Vindictive Gladiator's Felskin Helm
				{ 21, 136282 }, -- Vindictive Gladiator's Felskin Legguards
				{ 22, 136283 }, -- Vindictive Gladiator's Felskin Tunic
				{ 23, 136284 }, -- Vindictive Gladiator's Felskin Spaulders
				{ 24, 136285 }, -- Vindictive Gladiator's Felskin Belt
				{ 25, 136286 }, -- Vindictive Gladiator's Felskin Wristguards
				{ 101, 146264, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Felskin Armor
				{ 103, 136295 }, -- Vindictive Combatant's Felskin Boots
				{ 104, 136296 }, -- Vindictive Combatant's Felskin Gloves
				{ 105, 136297 }, -- Vindictive Combatant's Felskin Helm
				{ 106, 136298 }, -- Vindictive Combatant's Felskin Legguards
				{ 107, 136299 }, -- Vindictive Combatant's Felskin Tunic
				{ 108, 136300 }, -- Vindictive Combatant's Felskin Spaulders
				{ 109, 136301 }, -- Vindictive Combatant's Felskin Belt
				{ 110, 136302 }, -- Vindictive Combatant's Felskin Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146271, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Felskin Armor
				{ 3 , 136319 }, -- Vindictive Gladiator's Felskin Boots
				{ 4 , 136320 }, -- Vindictive Gladiator's Felskin Gloves
				{ 5 , 136321 }, -- Vindictive Gladiator's Felskin Helm
				{ 6 , 136322 }, -- Vindictive Gladiator's Felskin Legguards
				{ 7 , 136323 }, -- Vindictive Gladiator's Felskin Tunic
				{ 8 , 136324 }, -- Vindictive Gladiator's Felskin Spaulders
				{ 9 , 136325 }, -- Vindictive Gladiator's Felskin Belt
				{ 10, 136326 }, -- Vindictive Gladiator's Felskin Wristguards
				{ 16, 146263, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Felskin Armor
				{ 18, 136287 }, -- Vindictive Gladiator's Felskin Boots
				{ 19, 136288 }, -- Vindictive Gladiator's Felskin Gloves
				{ 20, 136289 }, -- Vindictive Gladiator's Felskin Helm
				{ 21, 136290 }, -- Vindictive Gladiator's Felskin Legguards
				{ 22, 136291 }, -- Vindictive Gladiator's Felskin Tunic
				{ 23, 136292 }, -- Vindictive Gladiator's Felskin Spaulders
				{ 24, 136293 }, -- Vindictive Gladiator's Felskin Belt
				{ 25, 136294 }, -- Vindictive Gladiator's Felskin Wristguards
				{ 101, 146265, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Felskin Armor
				{ 103, 136303 }, -- Vindictive Combatant's Felskin Boots
				{ 104, 136304 }, -- Vindictive Combatant's Felskin Gloves
				{ 105, 136305 }, -- Vindictive Combatant's Felskin Helm
				{ 106, 136306 }, -- Vindictive Combatant's Felskin Legguards
				{ 107, 136307 }, -- Vindictive Combatant's Felskin Tunic
				{ 108, 136308 }, -- Vindictive Combatant's Felskin Spaulders
				{ 109, 136309 }, -- Vindictive Combatant's Felskin Belt
				{ 110, 136310 }, -- Vindictive Combatant's Felskin Wristguards
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 146228, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Dragonhide Armor
				{ 3 , 136051 }, -- Vindictive Gladiator's Dragonhide Moccasins
				{ 4 , 136052 }, -- Vindictive Gladiator's Dragonhide Gloves
				{ 5 , 136053 }, -- Vindictive Gladiator's Dragonhide Helm
				{ 6 , 136054 }, -- Vindictive Gladiator's Dragonhide Legguards
				{ 7 , 136055 }, -- Vindictive Gladiator's Dragonhide Robe
				{ 8 , 136056 }, -- Vindictive Gladiator's Dragonhide Spaulders
				{ 9 , 136057 }, -- Vindictive Gladiator's Dragonhide Belt
				{ 10, 136058 }, -- Vindictive Gladiator's Dragonhide Wristguards
				{ 11, 136135 }, -- Vindictive Gladiator's Dragonhide Cloak
				{ 16, 146140, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Dragonhide Armor
				{ 18, 135599 }, -- Vindictive Gladiator's Dragonhide Moccasins
				{ 19, 135600 }, -- Vindictive Gladiator's Dragonhide Gloves
				{ 20, 135601 }, -- Vindictive Gladiator's Dragonhide Helm
				{ 21, 135602 }, -- Vindictive Gladiator's Dragonhide Legguards
				{ 22, 135603 }, -- Vindictive Gladiator's Dragonhide Robe
				{ 23, 135604 }, -- Vindictive Gladiator's Dragonhide Spaulders
				{ 24, 135605 }, -- Vindictive Gladiator's Dragonhide Belt
				{ 25, 135606 }, -- Vindictive Gladiator's Dragonhide Wristguards
				{ 26, 135680 }, -- Vindictive Gladiator's Dragonhide Cloak
				{ 101, 146168, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Dragonhide Armor
				{ 103, 135825 }, -- Vindictive Combatant's Dragonhide Moccasins
				{ 104, 135826 }, -- Vindictive Combatant's Dragonhide Gloves
				{ 105, 135827 }, -- Vindictive Combatant's Dragonhide Helm
				{ 106, 135828 }, -- Vindictive Combatant's Dragonhide Legguards
				{ 107, 135829 }, -- Vindictive Combatant's Dragonhide Tunic
				{ 108, 135830 }, -- Vindictive Combatant's Dragonhide Spaulders
				{ 109, 135831 }, -- Vindictive Combatant's Dragonhide Belt
				{ 110, 135832 }, -- Vindictive Combatant's Dragonhide Wristguards
				{ 111, 135909 }, -- Vindictive Combatant's Dragonhide Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146229, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Dragonhide Armor
				{ 3 , 136164 }, -- Vindictive Gladiator's Dragonhide Moccasins
				{ 4 , 136165 }, -- Vindictive Gladiator's Dragonhide Gloves
				{ 5 , 136166 }, -- Vindictive Gladiator's Dragonhide Helm
				{ 6 , 136167 }, -- Vindictive Gladiator's Dragonhide Legguards
				{ 7 , 136168 }, -- Vindictive Gladiator's Dragonhide Robe
				{ 8 , 136169 }, -- Vindictive Gladiator's Dragonhide Spaulders
				{ 9 , 136170 }, -- Vindictive Gladiator's Dragonhide Belt
				{ 10, 136171 }, -- Vindictive Gladiator's Dragonhide Wristguards
				{ 11, 136248 }, -- Vindictive Gladiator's Dragonhide Cloak
				{ 16, 146141, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Dragonhide Armor
				{ 18, 135712 }, -- Vindictive Gladiator's Dragonhide Moccasins
				{ 19, 135713 }, -- Vindictive Gladiator's Dragonhide Gloves
				{ 20, 135714 }, -- Vindictive Gladiator's Dragonhide Helm
				{ 21, 135715 }, -- Vindictive Gladiator's Dragonhide Legguards
				{ 22, 135716 }, -- Vindictive Gladiator's Dragonhide Robe
				{ 23, 135717 }, -- Vindictive Gladiator's Dragonhide Spaulders
				{ 24, 135718 }, -- Vindictive Gladiator's Dragonhide Belt
				{ 25, 135719 }, -- Vindictive Gladiator's Dragonhide Wristguards
				{ 26, 135796 }, -- Vindictive Gladiator's Dragonhide Cloak
				{ 101, 146169, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Dragonhide Armor
				{ 103, 135938 }, -- Vindictive Combatant's Dragonhide Moccasins
				{ 104, 135939 }, -- Vindictive Combatant's Dragonhide Gloves
				{ 105, 135940 }, -- Vindictive Combatant's Dragonhide Helm
				{ 106, 135941 }, -- Vindictive Combatant's Dragonhide Legguards
				{ 107, 135942 }, -- Vindictive Combatant's Dragonhide Tunic
				{ 108, 135943 }, -- Vindictive Combatant's Dragonhide Spaulders
				{ 109, 135944 }, -- Vindictive Combatant's Dragonhide Belt
				{ 110, 135945 }, -- Vindictive Combatant's Dragonhide Wristguards
				{ 111, 136022 }, -- Vindictive Combatant's Dragonhide Cloak
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 146226, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Chain Armor
				{ 3 , 136059 }, -- Vindictive Gladiator's Chain Armor
				{ 4 , 136060 }, -- Vindictive Gladiator's Chain Treads
				{ 5 , 136061 }, -- Vindictive Gladiator's Chain Gauntlets
				{ 6 , 136062 }, -- Vindictive Gladiator's Chain Helm
				{ 7 , 136063 }, -- Vindictive Gladiator's Chain Leggings
				{ 8 , 136064 }, -- Vindictive Gladiator's Chain Spaulders
				{ 9 , 136065 }, -- Vindictive Gladiator's Chain Clasp
				{ 10, 136066 }, -- Vindictive Gladiator's Chain Armband
				{ 16, 146138, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Chain Armor
				{ 18, 135607 }, -- Vindictive Gladiator's Chain Armor
				{ 19, 135608 }, -- Vindictive Gladiator's Chain Treads
				{ 20, 135609 }, -- Vindictive Gladiator's Chain Gauntlets
				{ 21, 135610 }, -- Vindictive Gladiator's Chain Helm
				{ 22, 135611 }, -- Vindictive Gladiator's Chain Leggings
				{ 23, 135612 }, -- Vindictive Gladiator's Chain Spaulders
				{ 24, 135613 }, -- Vindictive Gladiator's Chain Clasp
				{ 25, 135614 }, -- Vindictive Gladiator's Chain Armband
				{ 101, 146154, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Chain Armor
				{ 103, 135833 }, -- Vindictive Combatant's Chain Armor
				{ 104, 135834 }, -- Vindictive Combatant's Chain Treads
				{ 105, 135835 }, -- Vindictive Combatant's Chain Gauntlets
				{ 106, 135836 }, -- Vindictive Combatant's Chain Helm
				{ 107, 135837 }, -- Vindictive Combatant's Chain Leggings
				{ 108, 135838 }, -- Vindictive Combatant's Chain Spaulders
				{ 109, 135839 }, -- Vindictive Combatant's Chain Clasp
				{ 110, 135840 }, -- Vindictive Combatant's Chain Armband
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146227, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Chain Armor
				{ 3 , 136172 }, -- Vindictive Gladiator's Chain Armor
				{ 4 , 136173 }, -- Vindictive Gladiator's Chain Treads
				{ 5 , 136174 }, -- Vindictive Gladiator's Chain Gauntlets
				{ 6 , 136175 }, -- Vindictive Gladiator's Chain Helm
				{ 7 , 136176 }, -- Vindictive Gladiator's Chain Leggings
				{ 8 , 136177 }, -- Vindictive Gladiator's Chain Spaulders
				{ 9 , 136178 }, -- Vindictive Gladiator's Chain Clasp
				{ 10, 136179 }, -- Vindictive Gladiator's Chain Armband
				{ 16, 146139, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Chain Armor
				{ 18, 135720 }, -- Vindictive Gladiator's Chain Armor
				{ 19, 135721 }, -- Vindictive Gladiator's Chain Treads
				{ 20, 135722 }, -- Vindictive Gladiator's Chain Gauntlets
				{ 21, 135723 }, -- Vindictive Gladiator's Chain Helm
				{ 22, 135724 }, -- Vindictive Gladiator's Chain Leggings
				{ 23, 135725 }, -- Vindictive Gladiator's Chain Spaulders
				{ 24, 135726 }, -- Vindictive Gladiator's Chain Clasp
				{ 25, 135727 }, -- Vindictive Gladiator's Chain Armband
				{ 101, 146155, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Chain Armor
				{ 103, 135946 }, -- Vindictive Combatant's Chain Armor
				{ 104, 135947 }, -- Vindictive Combatant's Chain Treads
				{ 105, 135948 }, -- Vindictive Combatant's Chain Gauntlets
				{ 106, 135949 }, -- Vindictive Combatant's Chain Helm
				{ 107, 135950 }, -- Vindictive Combatant's Chain Leggings
				{ 108, 135951 }, -- Vindictive Combatant's Chain Spaulders
				{ 109, 135952 }, -- Vindictive Combatant's Chain Clasp
				{ 110, 135953 }, -- Vindictive Combatant's Chain Armband
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 146234, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Silk Armor
				{ 3 , 136067 }, -- Vindictive Gladiator's Silk Treads
				{ 4 , 136068 }, -- Vindictive Gladiator's Silk Handguards
				{ 5 , 136069 }, -- Vindictive Gladiator's Silk Cowl
				{ 6 , 136070 }, -- Vindictive Gladiator's Silk Trousers
				{ 7 , 136071 }, -- Vindictive Gladiator's Silk Robe
				{ 8 , 136072 }, -- Vindictive Gladiator's Silk Amice
				{ 9 , 136073 }, -- Vindictive Gladiator's Silk Cord
				{ 10, 136074 }, -- Vindictive Gladiator's Silk Bracers
				{ 11, 136132 }, -- Vindictive Gladiator's Silken Shawl
				{ 16, 146146, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Silk Armor
				{ 18, 135615 }, -- Vindictive Gladiator's Silk Treads
				{ 19, 135616 }, -- Vindictive Gladiator's Silk Handguards
				{ 20, 135617 }, -- Vindictive Gladiator's Silk Cowl
				{ 21, 135618 }, -- Vindictive Gladiator's Silk Trousers
				{ 22, 135619 }, -- Vindictive Gladiator's Silk Robe
				{ 23, 135620 }, -- Vindictive Gladiator's Silk Amice
				{ 24, 135621 }, -- Vindictive Gladiator's Silk Cord
				{ 25, 135622 }, -- Vindictive Gladiator's Silk Bracers
				{ 26, 135684 }, -- Vindictive Gladiator's Silken Shawl
				{ 101, 146156, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Silk Armor
				{ 103, 135841 }, -- Vindictive Combatant's Silk Treads
				{ 104, 135842 }, -- Vindictive Combatant's Silk Handguards
				{ 105, 135843 }, -- Vindictive Combatant's Silk Cowl
				{ 106, 135844 }, -- Vindictive Combatant's Silk Trousers
				{ 107, 135845 }, -- Vindictive Combatant's Silk Robe
				{ 108, 135846 }, -- Vindictive Combatant's Silk Amice
				{ 109, 135847 }, -- Vindictive Combatant's Silk Cord
				{ 110, 135848 }, -- Vindictive Combatant's Silk Bracers
				{ 111, 135906 }, -- Vindictive Combatant's Silken Shawl
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146235, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Silk Armor
				{ 3 , 136180 }, -- Vindictive Gladiator's Silk Treads
				{ 4 , 136181 }, -- Vindictive Gladiator's Silk Handguards
				{ 5 , 136182 }, -- Vindictive Gladiator's Silk Cowl
				{ 6 , 136183 }, -- Vindictive Gladiator's Silk Trousers
				{ 7 , 136184 }, -- Vindictive Gladiator's Silk Robe
				{ 8 , 136185 }, -- Vindictive Gladiator's Silk Amice
				{ 9 , 136186 }, -- Vindictive Gladiator's Silk Cord
				{ 10, 136187 }, -- Vindictive Gladiator's Silk Bracers
				{ 11, 136245 }, -- Vindictive Gladiator's Silken Shawl
				{ 16, 146147, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Silk Armor
				{ 18, 135728 }, -- Vindictive Gladiator's Silk Treads
				{ 19, 135729 }, -- Vindictive Gladiator's Silk Handguards
				{ 20, 135730 }, -- Vindictive Gladiator's Silk Cowl
				{ 21, 135731 }, -- Vindictive Gladiator's Silk Trousers
				{ 22, 135732 }, -- Vindictive Gladiator's Silk Robe
				{ 23, 135733 }, -- Vindictive Gladiator's Silk Amice
				{ 24, 135734 }, -- Vindictive Gladiator's Silk Cord
				{ 25, 135735 }, -- Vindictive Gladiator's Silk Bracers
				{ 26, 135793 }, -- Vindictive Gladiator's Silken Shawl
				{ 101, 146157, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Silk Armor
				{ 103, 135954 }, -- Vindictive Combatant's Silk Treads
				{ 104, 135955 }, -- Vindictive Combatant's Silk Handguards
				{ 105, 135956 }, -- Vindictive Combatant's Silk Cowl
				{ 106, 135957 }, -- Vindictive Combatant's Silk Trousers
				{ 107, 135958 }, -- Vindictive Combatant's Silk Robe
				{ 108, 135959 }, -- Vindictive Combatant's Silk Amice
				{ 109, 135960 }, -- Vindictive Combatant's Silk Cord
				{ 110, 135961 }, -- Vindictive Combatant's Silk Bracers
				{ 111, 136019 }, -- Vindictive Combatant's Silken Shawl
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 146230, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Ironskin Armor
				{ 3 , 136075 }, -- Vindictive Gladiator's Ironskin Slippers
				{ 4 , 136076 }, -- Vindictive Gladiator's Ironskin Gloves
				{ 5 , 136077 }, -- Vindictive Gladiator's Ironskin Helm
				{ 6 , 136078 }, -- Vindictive Gladiator's Ironskin Legguards
				{ 7 , 136079 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 8 , 136080 }, -- Vindictive Gladiator's Ironskin Tunic
				{ 9 , 136081 }, -- Vindictive Gladiator's Ironskin Belt
				{ 10, 136082 }, -- Vindictive Gladiator's Ironskin Wristguards
				{ 16, 146142, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Ironskin Armor
				{ 18, 135623 }, -- Vindictive Gladiator's Ironskin Slippers
				{ 19, 135624 }, -- Vindictive Gladiator's Ironskin Gloves
				{ 20, 135625 }, -- Vindictive Gladiator's Ironskin Helm
				{ 21, 135626 }, -- Vindictive Gladiator's Ironskin Legguards
				{ 22, 135627 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 23, 135628 }, -- Vindictive Gladiator's Ironskin Tunic
				{ 24, 135629 }, -- Vindictive Gladiator's Ironskin Belt
				{ 25, 135630 }, -- Vindictive Gladiator's Ironskin Wristguards
				{ 101, 146170, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Ironskin Armor
				{ 103, 135849 }, -- Vindictive Combatant's Ironskin Spaulders
				{ 104, 135850 }, -- Vindictive Combatant's Ironskin Gloves
				{ 105, 135851 }, -- Vindictive Combatant's Ironskin Helm
				{ 106, 135852 }, -- Vindictive Combatant's Ironskin Legguards
				{ 107, 135853 }, -- Vindictive Combatant's Ironskin Spaulders
				{ 108, 135854 }, -- Vindictive Combatant's Ironskin Tunic
				{ 109, 135855 }, -- Vindictive Combatant's Ironskin Belt
				{ 110, 135856 }, -- Vindictive Combatant's Ironskin Wristguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146231, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Ironskin Armor
				{ 3 , 136188 }, -- Vindictive Gladiator's Ironskin Slippers
				{ 4 , 136189 }, -- Vindictive Gladiator's Ironskin Gloves
				{ 5 , 136190 }, -- Vindictive Gladiator's Ironskin Helm
				{ 6 , 136191 }, -- Vindictive Gladiator's Ironskin Legguards
				{ 7 , 136192 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 8 , 136193 }, -- Vindictive Gladiator's Ironskin Tunic
				{ 9 , 136194 }, -- Vindictive Gladiator's Ironskin Belt
				{ 10, 136195 }, -- Vindictive Gladiator's Ironskin Wristguards
				{ 16, 146143, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Ironskin Armor
				{ 18, 135736 }, -- Vindictive Gladiator's Ironskin Slippers
				{ 19, 135737 }, -- Vindictive Gladiator's Ironskin Gloves
				{ 20, 135738 }, -- Vindictive Gladiator's Ironskin Helm
				{ 21, 135739 }, -- Vindictive Gladiator's Ironskin Legguards
				{ 22, 135740 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 23, 135741 }, -- Vindictive Gladiator's Ironskin Tunic
				{ 24, 135742 }, -- Vindictive Gladiator's Ironskin Belt
				{ 25, 135743 }, -- Vindictive Gladiator's Ironskin Wristguards
				{ 101, 146171, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Ironskin Armor
				{ 103, 135962 }, -- Vindictive Combatant's Ironskin Spaulders
				{ 104, 135963 }, -- Vindictive Combatant's Ironskin Gloves
				{ 105, 135964 }, -- Vindictive Combatant's Ironskin Helm
				{ 106, 135965 }, -- Vindictive Combatant's Ironskin Legguards
				{ 107, 135966 }, -- Vindictive Combatant's Ironskin Spaulders
				{ 108, 135967 }, -- Vindictive Combatant's Ironskin Tunic
				{ 109, 135968 }, -- Vindictive Combatant's Ironskin Belt
				{ 110, 135969 }, -- Vindictive Combatant's Ironskin Wristguards
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 146222, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Scaled Armor
				{ 3 , 136083 }, -- Vindictive Gladiator's Scaled Battlerobe
				{ 4 , 136084 }, -- Vindictive Gladiator's Scaled Sabatons
				{ 5 , 136085 }, -- Vindictive Gladiator's Scaled Gauntlets
				{ 6 , 136086 }, -- Vindictive Gladiator's Scaled Helm
				{ 7 , 136087 }, -- Vindictive Gladiator's Scaled Legguards
				{ 8 , 136088 }, -- Vindictive Gladiator's Scaled Shoulders
				{ 9 , 136089 }, -- Vindictive Gladiator's Scaled Girdle
				{ 10, 136090 }, -- Vindictive Gladiator's Scaled Wristplates
				{ 11, 136140 }, -- Vindictive Gladiator's Greatcloak of Faith
				{ 16, 146134, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Scaled Armor
				{ 18, 135631 }, -- Vindictive Gladiator's Scaled Battlerobe
				{ 19, 135632 }, -- Vindictive Gladiator's Scaled Sabatons
				{ 20, 135633 }, -- Vindictive Gladiator's Scaled Gauntlets
				{ 21, 135634 }, -- Vindictive Gladiator's Scaled Helm
				{ 22, 135635 }, -- Vindictive Gladiator's Scaled Legguards
				{ 23, 135636 }, -- Vindictive Gladiator's Scaled Shoulders
				{ 24, 135637 }, -- Vindictive Gladiator's Scaled Girdle
				{ 25, 135638 }, -- Vindictive Gladiator's Scaled Wristplates
				{ 26, 135688 }, -- Vindictive Gladiator's Greatcloak of Faith
				{ 101, 146166, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Scaled Armor
				{ 103, 135857 }, -- Vindictive Combatant's Scaled Chestpiece
				{ 104, 135858 }, -- Vindictive Combatant's Scaled Sabatons
				{ 105, 135859 }, -- Vindictive Combatant's Scaled Gauntlets
				{ 106, 135860 }, -- Vindictive Combatant's Scaled Helm
				{ 107, 135861 }, -- Vindictive Combatant's Scaled Legguards
				{ 108, 135862 }, -- Vindictive Combatant's Scaled Shoulders
				{ 109, 135863 }, -- Vindictive Combatant's Scaled Girdle
				{ 110, 135864 }, -- Vindictive Combatant's Scaled Wristplates
				{ 111, 135914 }, -- Vindictive Combatant's Greatcloak of Faith
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146223, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Scaled Armor
				{ 3 , 136196 }, -- Vindictive Gladiator's Scaled Chestpiece
				{ 4 , 136197 }, -- Vindictive Gladiator's Scaled Sabatons
				{ 5 , 136198 }, -- Vindictive Gladiator's Scaled Gauntlets
				{ 6 , 136199 }, -- Vindictive Gladiator's Scaled Helm
				{ 7 , 136200 }, -- Vindictive Gladiator's Scaled Legguards
				{ 8 , 136201 }, -- Vindictive Gladiator's Scaled Shoulders
				{ 9 , 136202 }, -- Vindictive Gladiator's Scaled Girdle
				{ 10, 136203 }, -- Vindictive Gladiator's Scaled Wristplates
				{ 11, 136253 }, -- Vindictive Gladiator's Greatcloak of Faith
				{ 16, 146135, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Scaled Armor
				{ 18, 135744 }, -- Vindictive Gladiator's Scaled Battlerobe
				{ 19, 135745 }, -- Vindictive Gladiator's Scaled Sabatons
				{ 20, 135746 }, -- Vindictive Gladiator's Scaled Gauntlets
				{ 21, 135747 }, -- Vindictive Gladiator's Scaled Helm
				{ 22, 135748 }, -- Vindictive Gladiator's Scaled Legguards
				{ 23, 135749 }, -- Vindictive Gladiator's Scaled Shoulders
				{ 24, 135750 }, -- Vindictive Gladiator's Scaled Girdle
				{ 25, 135751 }, -- Vindictive Gladiator's Scaled Wristplates
				{ 26, 135801 }, -- Vindictive Gladiator's Greatcloak of Faith
				{ 101, 146167, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Scaled Armor
				{ 103, 135970 }, -- Vindictive Combatant's Scaled Chestpiece
				{ 104, 135971 }, -- Vindictive Combatant's Scaled Sabatons
				{ 105, 135972 }, -- Vindictive Combatant's Scaled Gauntlets
				{ 106, 135973 }, -- Vindictive Combatant's Scaled Helm
				{ 107, 135974 }, -- Vindictive Combatant's Scaled Legguards
				{ 108, 135975 }, -- Vindictive Combatant's Scaled Shoulders
				{ 109, 135976 }, -- Vindictive Combatant's Scaled Girdle
				{ 110, 135977 }, -- Vindictive Combatant's Scaled Wristplates
				{ 111, 136027 }, -- Vindictive Combatant's Greatcloak of Faith
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 146236, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Satin Armor
				{ 3 , 136091 }, -- Vindictive Gladiator's Satin Treads
				{ 4 , 136092 }, -- Vindictive Gladiator's Satin Gloves
				{ 5 , 136093 }, -- Vindictive Gladiator's Satin Hood
				{ 6 , 136094 }, -- Vindictive Gladiator's Satin Leggings
				{ 7 , 136095 }, -- Vindictive Gladiator's Satin Robe
				{ 8 , 136096 }, -- Vindictive Gladiator's Satin Mantle
				{ 9 , 136097 }, -- Vindictive Gladiator's Satin Cord
				{ 10, 136098 }, -- Vindictive Gladiator's Satin Bracers
				{ 11, 136873 }, -- Vindictive Gladiator's Drape of Piety
				{ 16, 146148, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Satin Armor
				{ 18, 135639 }, -- Vindictive Gladiator's Satin Treads
				{ 19, 135640 }, -- Vindictive Gladiator's Satin Gloves
				{ 20, 135641 }, -- Vindictive Gladiator's Satin Hood
				{ 21, 135642 }, -- Vindictive Gladiator's Satin Leggings
				{ 22, 135643 }, -- Vindictive Gladiator's Satin Robe
				{ 23, 135644 }, -- Vindictive Gladiator's Satin Mantle
				{ 24, 135645 }, -- Vindictive Gladiator's Satin Cord
				{ 25, 135646 }, -- Vindictive Gladiator's Satin Bracers
				{ 26, 136861 }, -- Vindictive Gladiator's Drape of Piety
				{ 101, 146158, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Satin Armor
				{ 103, 135865 }, -- Vindictive Combatant's Satin Treads
				{ 104, 135866 }, -- Vindictive Combatant's Satin Gloves
				{ 105, 135867 }, -- Vindictive Combatant's Satin Hood
				{ 106, 135868 }, -- Vindictive Combatant's Satin Leggings
				{ 107, 135869 }, -- Vindictive Combatant's Satin Robe
				{ 108, 135870 }, -- Vindictive Combatant's Satin Mantle
				{ 109, 135871 }, -- Vindictive Combatant's Satin Cord
				{ 110, 135872 }, -- Vindictive Combatant's Satin Bracers
				{ 111, 136867 }, -- Vindictive Combatant's Drape of Piety
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146237, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Satin Armor
				{ 3 , 136204 }, -- Vindictive Gladiator's Satin Treads
				{ 4 , 136205 }, -- Vindictive Gladiator's Satin Gloves
				{ 5 , 136206 }, -- Vindictive Gladiator's Satin Hood
				{ 6 , 136207 }, -- Vindictive Gladiator's Satin Leggings
				{ 7 , 136208 }, -- Vindictive Gladiator's Satin Robe
				{ 8 , 136209 }, -- Vindictive Gladiator's Satin Mantle
				{ 9 , 136210 }, -- Vindictive Gladiator's Satin Cord
				{ 10, 136211 }, -- Vindictive Gladiator's Satin Bracers
				{ 11, 136876 }, -- Vindictive Gladiator's Drape of Piety
				{ 16, 146149, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Satin Armor
				{ 18, 135752 }, -- Vindictive Gladiator's Satin Treads
				{ 19, 135753 }, -- Vindictive Gladiator's Satin Gloves
				{ 20, 135754 }, -- Vindictive Gladiator's Satin Hood
				{ 21, 135755 }, -- Vindictive Gladiator's Satin Leggings
				{ 22, 135756 }, -- Vindictive Gladiator's Satin Robe
				{ 23, 135757 }, -- Vindictive Gladiator's Satin Mantle
				{ 24, 135758 }, -- Vindictive Gladiator's Satin Cord
				{ 25, 135759 }, -- Vindictive Gladiator's Satin Bracers
				{ 26, 136864 }, -- Vindictive Gladiator's Drape of Piety
				{ 101, 146159, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Satin Armor
				{ 103, 135978 }, -- Vindictive Combatant's Satin Treads
				{ 104, 135979 }, -- Vindictive Combatant's Satin Gloves
				{ 105, 135980 }, -- Vindictive Combatant's Satin Hood
				{ 106, 135981 }, -- Vindictive Combatant's Satin Leggings
				{ 107, 135982 }, -- Vindictive Combatant's Satin Robe
				{ 108, 135983 }, -- Vindictive Combatant's Satin Mantle
				{ 109, 135984 }, -- Vindictive Combatant's Satin Cord
				{ 110, 135985 }, -- Vindictive Combatant's Satin Bracers
				{ 111, 136870 }, -- Vindictive Combatant's Drape of Piety
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 146232, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Leather Armor
				{ 3 , 136099 }, -- Vindictive Gladiator's Leather Tunic
				{ 4 , 136100 }, -- Vindictive Gladiator's Leather Slippers
				{ 5 , 136101 }, -- Vindictive Gladiator's Leather Gloves
				{ 6 , 136102 }, -- Vindictive Gladiator's Leather Helm
				{ 7 , 136103 }, -- Vindictive Gladiator's Leather Legguards
				{ 8 , 136104 }, -- Vindictive Gladiator's Leather Spaulders
				{ 9 , 136105 }, -- Vindictive Gladiator's Leather Belt
				{ 10, 136106 }, -- Vindictive Gladiator's Leather Wristguards
				{ 11, 136874 }, -- Vindictive Gladiator's Shadowcape
				{ 16, 146144, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Leather Armor
				{ 18, 135647 }, -- Vindictive Gladiator's Leather Tunic
				{ 19, 135648 }, -- Vindictive Gladiator's Leather Slippers
				{ 20, 135649 }, -- Vindictive Gladiator's Leather Gloves
				{ 21, 135650 }, -- Vindictive Gladiator's Leather Helm
				{ 22, 135651 }, -- Vindictive Gladiator's Leather Legguards
				{ 23, 135652 }, -- Vindictive Gladiator's Leather Spaulders
				{ 24, 135653 }, -- Vindictive Gladiator's Leather Belt
				{ 25, 135654 }, -- Vindictive Gladiator's Leather Wristguards
				{ 26, 136862 }, -- Vindictive Gladiator's Shadowcape
				{ 101, 146172, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Leather Armor
				{ 103, 135873 }, -- Vindictive Combatant's Leather Tunic
				{ 104, 135874 }, -- Vindictive Combatant's Leather Slippers
				{ 105, 135875 }, -- Vindictive Combatant's Leather Gloves
				{ 106, 135876 }, -- Vindictive Combatant's Leather Helm
				{ 107, 135877 }, -- Vindictive Combatant's Leather Legguards
				{ 108, 135878 }, -- Vindictive Combatant's Leather Spaulders
				{ 109, 135879 }, -- Vindictive Combatant's Leather Belt
				{ 110, 135880 }, -- Vindictive Combatant's Leather Wristguards
				{ 111, 136868 }, -- Vindictive Combatant's Shadowcape
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146233, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Leather Armor
				{ 3 , 136212 }, -- Vindictive Gladiator's Leather Tunic
				{ 4 , 136213 }, -- Vindictive Gladiator's Leather Slippers
				{ 5 , 136214 }, -- Vindictive Gladiator's Leather Gloves
				{ 6 , 136215 }, -- Vindictive Gladiator's Leather Helm
				{ 7 , 136216 }, -- Vindictive Gladiator's Leather Legguards
				{ 8 , 136217 }, -- Vindictive Gladiator's Leather Spaulders
				{ 9 , 136218 }, -- Vindictive Gladiator's Leather Belt
				{ 10, 136219 }, -- Vindictive Gladiator's Leather Wristguards
				{ 11, 136877 }, -- Vindictive Gladiator's Shadowcape
				{ 16, 146145, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Leather Armor
				{ 18, 135760 }, -- Vindictive Gladiator's Leather Tunic
				{ 19, 135761 }, -- Vindictive Gladiator's Leather Slippers
				{ 20, 135762 }, -- Vindictive Gladiator's Leather Gloves
				{ 21, 135763 }, -- Vindictive Gladiator's Leather Helm
				{ 22, 135764 }, -- Vindictive Gladiator's Leather Legguards
				{ 23, 135765 }, -- Vindictive Gladiator's Leather Spaulders
				{ 24, 135766 }, -- Vindictive Gladiator's Leather Belt
				{ 25, 135767 }, -- Vindictive Gladiator's Leather Wristguards
				{ 26, 136865 }, -- Vindictive Gladiator's Shadowcape
				{ 101, 146173, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Leather Armor
				{ 103, 135986 }, -- Vindictive Combatant's Leather Tunic
				{ 104, 135987 }, -- Vindictive Combatant's Leather Slippers
				{ 105, 135988 }, -- Vindictive Combatant's Leather Gloves
				{ 106, 135989 }, -- Vindictive Combatant's Leather Helm
				{ 107, 135990 }, -- Vindictive Combatant's Leather Legguards
				{ 108, 135991 }, -- Vindictive Combatant's Leather Spaulders
				{ 109, 135992 }, -- Vindictive Combatant's Leather Belt
				{ 110, 135993 }, -- Vindictive Combatant's Leather Wristguards
				{ 111, 136871 }, -- Vindictive Combatant's Shadowcape
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 146224, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Ringmail Armor
				{ 3 , 136107 }, -- Vindictive Gladiator's Ringmail Armor
				{ 4 , 136108 }, -- Vindictive Gladiator's Ringmail Boots
				{ 5 , 136109 }, -- Vindictive Gladiator's Ringmail Gauntlets
				{ 6 , 136110 }, -- Vindictive Gladiator's Ringmail Helm
				{ 7 , 136111 }, -- Vindictive Gladiator's Ringmail Kilt
				{ 8 , 136112 }, -- Vindictive Gladiator's Ringmail Spaulders
				{ 9 , 136113 }, -- Vindictive Gladiator's Ringmail Clasp
				{ 10, 136114 }, -- Vindictive Gladiator's Ringmail Armband
				{ 11, 136875 }, -- Vindictive Gladiator's Totemic Cloak
				{ 16, 146136, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Ringmail Armor
				{ 18, 135655 }, -- Vindictive Gladiator's Ringmail Armor
				{ 19, 135656 }, -- Vindictive Gladiator's Ringmail Boots
				{ 20, 135657 }, -- Vindictive Gladiator's Ringmail Gauntlets
				{ 21, 135658 }, -- Vindictive Gladiator's Ringmail Helm
				{ 22, 135659 }, -- Vindictive Gladiator's Ringmail Kilt
				{ 23, 135660 }, -- Vindictive Gladiator's Ringmail Spaulders
				{ 24, 135661 }, -- Vindictive Gladiator's Ringmail Clasp
				{ 25, 135662 }, -- Vindictive Gladiator's Ringmail Armband
				{ 26, 136863 }, -- Vindictive Gladiator's Totemic Cloak
				{ 101, 146152, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Ringmail Armor
				{ 103, 135881 }, -- Vindictive Combatant's Ringmail Armor
				{ 104, 135882 }, -- Vindictive Combatant's Ringmail Boots
				{ 105, 135883 }, -- Vindictive Combatant's Ringmail Gauntlets
				{ 106, 135884 }, -- Vindictive Combatant's Ringmail Helm
				{ 107, 135885 }, -- Vindictive Combatant's Ringmail Kilt
				{ 108, 135886 }, -- Vindictive Combatant's Ringmail Spaulders
				{ 109, 135887 }, -- Vindictive Combatant's Ringmail Clasp
				{ 110, 135888 }, -- Vindictive Combatant's Ringmail Armband
				{ 111, 136869 }, -- Vindictive Combatant's Totemic Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146225, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Ringmail Armor
				{ 3 , 136220 }, -- Vindictive Gladiator's Ringmail Armor
				{ 4 , 136221 }, -- Vindictive Gladiator's Ringmail Boots
				{ 5 , 136222 }, -- Vindictive Gladiator's Ringmail Gauntlets
				{ 6 , 136223 }, -- Vindictive Gladiator's Ringmail Helm
				{ 7 , 136224 }, -- Vindictive Gladiator's Ringmail Kilt
				{ 8 , 136225 }, -- Vindictive Gladiator's Ringmail Spaulders
				{ 9 , 136226 }, -- Vindictive Gladiator's Ringmail Clasp
				{ 10, 136227 }, -- Vindictive Gladiator's Ringmail Armband
				{ 11, 136878 }, -- Vindictive Gladiator's Totemic Cloak
				{ 16, 146137, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Ringmail Armor
				{ 18, 135768 }, -- Vindictive Gladiator's Ringmail Armor
				{ 19, 135769 }, -- Vindictive Gladiator's Ringmail Boots
				{ 20, 135770 }, -- Vindictive Gladiator's Ringmail Gauntlets
				{ 21, 135771 }, -- Vindictive Gladiator's Ringmail Helm
				{ 22, 135772 }, -- Vindictive Gladiator's Ringmail Kilt
				{ 23, 135773 }, -- Vindictive Gladiator's Ringmail Spaulders
				{ 24, 135774 }, -- Vindictive Gladiator's Ringmail Clasp
				{ 25, 135775 }, -- Vindictive Gladiator's Ringmail Armband
				{ 26, 136866 }, -- Vindictive Gladiator's Totemic Cloak
				{ 101, 146153, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Ringmail Armor
				{ 103, 135994 }, -- Vindictive Combatant's Ringmail Armor
				{ 104, 135995 }, -- Vindictive Combatant's Ringmail Boots
				{ 105, 135996 }, -- Vindictive Combatant's Ringmail Gauntlets
				{ 106, 135997 }, -- Vindictive Combatant's Ringmail Helm
				{ 107, 135998 }, -- Vindictive Combatant's Ringmail Kilt
				{ 108, 135999 }, -- Vindictive Combatant's Ringmail Spaulders
				{ 109, 136000 }, -- Vindictive Combatant's Ringmail Clasp
				{ 110, 136001 }, -- Vindictive Combatant's Ringmail Armband
				{ 111, 136872 }, -- Vindictive Combatant's Totemic Cloak
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 146238, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Felweave Armor
				{ 3 , 136115 }, -- Vindictive Gladiator's Felweave Treads
				{ 4 , 136116 }, -- Vindictive Gladiator's Felweave Handguards
				{ 5 , 136117 }, -- Vindictive Gladiator's Felweave Cowl
				{ 6 , 136118 }, -- Vindictive Gladiator's Felweave Trousers
				{ 7 , 136119 }, -- Vindictive Gladiator's Felweave Raiment
				{ 8 , 136120 }, -- Vindictive Gladiator's Felweave Amice
				{ 9 , 136121 }, -- Vindictive Gladiator's Felweave Cord
				{ 10, 136122 }, -- Vindictive Gladiator's Felweave Bracers
				{ 11, 136883 }, -- Vindictive Gladiator's Felweave Cloak
				{ 16, 146150, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Felweave Armor
				{ 18, 135663 }, -- Vindictive Gladiator's Felweave Treads
				{ 19, 135664 }, -- Vindictive Gladiator's Felweave Handguards
				{ 20, 135665 }, -- Vindictive Gladiator's Felweave Cowl
				{ 21, 135666 }, -- Vindictive Gladiator's Felweave Trousers
				{ 22, 135667 }, -- Vindictive Gladiator's Felweave Raiment
				{ 23, 135668 }, -- Vindictive Gladiator's Felweave Amice
				{ 24, 135669 }, -- Vindictive Gladiator's Felweave Cord
				{ 25, 135670 }, -- Vindictive Gladiator's Felweave Bracers
				{ 26, 136879 }, -- Vindictive Gladiator's Felweave Cloak
				{ 101, 146160, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Felweave Armor
				{ 103, 135889 }, -- Vindictive Combatant's Felweave Treads
				{ 104, 135890 }, -- Vindictive Combatant's Felweave Handguards
				{ 105, 135891 }, -- Vindictive Combatant's Felweave Cowl
				{ 106, 135892 }, -- Vindictive Combatant's Felweave Trousers
				{ 107, 135893 }, -- Vindictive Combatant's Felweave Raiment
				{ 108, 135894 }, -- Vindictive Combatant's Felweave Amice
				{ 109, 135895 }, -- Vindictive Combatant's Felweave Cord
				{ 110, 135896 }, -- Vindictive Combatant's Felweave Bracers
				{ 111, 136881 }, -- Vindictive Combatant's Felweave Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146239, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Felweave Armor
				{ 3 , 136228 }, -- Vindictive Gladiator's Felweave Treads
				{ 4 , 136229 }, -- Vindictive Gladiator's Felweave Handguards
				{ 5 , 136230 }, -- Vindictive Gladiator's Felweave Cowl
				{ 6 , 136231 }, -- Vindictive Gladiator's Felweave Trousers
				{ 7 , 136232 }, -- Vindictive Gladiator's Felweave Raiment
				{ 8 , 136233 }, -- Vindictive Gladiator's Felweave Amice
				{ 9 , 136234 }, -- Vindictive Gladiator's Felweave Cord
				{ 10, 136235 }, -- Vindictive Gladiator's Felweave Bracers
				{ 11, 136884 }, -- Vindictive Gladiator's Felweave Cloak
				{ 16, 146151, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Felweave Armor
				{ 18, 135776 }, -- Vindictive Gladiator's Felweave Treads
				{ 19, 135777 }, -- Vindictive Gladiator's Felweave Handguards
				{ 20, 135778 }, -- Vindictive Gladiator's Felweave Cowl
				{ 21, 135779 }, -- Vindictive Gladiator's Felweave Trousers
				{ 22, 135780 }, -- Vindictive Gladiator's Felweave Raiment
				{ 23, 135781 }, -- Vindictive Gladiator's Felweave Amice
				{ 24, 135782 }, -- Vindictive Gladiator's Felweave Cord
				{ 25, 135783 }, -- Vindictive Gladiator's Felweave Bracers
				{ 26, 136880 }, -- Vindictive Gladiator's Felweave Cloak
				{ 101, 146161, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Felweave Armor
				{ 103, 136002 }, -- Vindictive Combatant's Felweave Treads
				{ 104, 136003 }, -- Vindictive Combatant's Felweave Handguards
				{ 105, 136004 }, -- Vindictive Combatant's Felweave Cowl
				{ 106, 136005 }, -- Vindictive Combatant's Felweave Trousers
				{ 107, 136006 }, -- Vindictive Combatant's Felweave Raiment
				{ 108, 136007 }, -- Vindictive Combatant's Felweave Amice
				{ 109, 136008 }, -- Vindictive Combatant's Felweave Cord
				{ 110, 136009 }, -- Vindictive Combatant's Felweave Bracers
				{ 111, 136882 }, -- Vindictive Combatant's Felweave Cloak
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 146218, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Plate Armor
				{ 3 , 136123 }, -- Vindictive Gladiator's Plate Chestpiece
				{ 4 , 136124 }, -- Vindictive Gladiator's Plate Warboots
				{ 5 , 136125 }, -- Vindictive Gladiator's Plate Gauntlets
				{ 6 , 136126 }, -- Vindictive Gladiator's Plate Helm
				{ 7 , 136127 }, -- Vindictive Gladiator's Plate Legguards
				{ 8 , 136128 }, -- Vindictive Gladiator's Plate Shoulders
				{ 9 , 136129 }, -- Vindictive Gladiator's Plate Girdle
				{ 10, 136130 }, -- Vindictive Gladiator's Plate Wristplates
				{ 11, 136889 }, -- Vindictive Gladiator's Cloak of Battle
				{ 16, 146130, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Plate Armor
				{ 18, 135671 }, -- Vindictive Gladiator's Plate Chestpiece
				{ 19, 135672 }, -- Vindictive Gladiator's Plate Warboots
				{ 20, 135673 }, -- Vindictive Gladiator's Plate Gauntlets
				{ 21, 135674 }, -- Vindictive Gladiator's Plate Helm
				{ 22, 135675 }, -- Vindictive Gladiator's Plate Legguards
				{ 23, 135676 }, -- Vindictive Gladiator's Plate Shoulders
				{ 24, 135677 }, -- Vindictive Gladiator's Plate Girdle
				{ 25, 135678 }, -- Vindictive Gladiator's Plate Wristplates
				{ 26, 136885 }, -- Vindictive Gladiator's Cloak of Battle
				{ 101, 146162, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Plate Armor
				{ 103, 135897 }, -- Vindictive Combatant's Plate Chestpiece
				{ 104, 135898 }, -- Vindictive Combatant's Plate Warboots
				{ 105, 135899 }, -- Vindictive Combatant's Plate Gauntlets
				{ 106, 135900 }, -- Vindictive Combatant's Plate Helm
				{ 107, 135901 }, -- Vindictive Combatant's Plate Legguards
				{ 108, 135902 }, -- Vindictive Combatant's Plate Shoulders
				{ 109, 135903 }, -- Vindictive Combatant's Plate Girdle
				{ 110, 135904 }, -- Vindictive Combatant's Plate Wristplates
				{ 111, 136887 }, -- Vindictive Combatant's Cloak of Battle
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 146219, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Elite Vindictive Gladiator's Plate Armor
				{ 3 , 136236 }, -- Vindictive Gladiator's Plate Chestpiece
				{ 4 , 136237 }, -- Vindictive Gladiator's Plate Warboots
				{ 5 , 136238 }, -- Vindictive Gladiator's Plate Gauntlets
				{ 6 , 136239 }, -- Vindictive Gladiator's Plate Helm
				{ 7 , 136240 }, -- Vindictive Gladiator's Plate Legguards
				{ 8 , 136241 }, -- Vindictive Gladiator's Plate Shoulders
				{ 9 , 136242 }, -- Vindictive Gladiator's Plate Girdle
				{ 10, 136243 }, -- Vindictive Gladiator's Plate Wristplates
				{ 11, 136890 }, -- Vindictive Gladiator's Cloak of Battle
				{ 16, 146131, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Gladiator's Plate Armor
				{ 18, 135784 }, -- Vindictive Gladiator's Plate Chestpiece
				{ 19, 135785 }, -- Vindictive Gladiator's Plate Warboots
				{ 20, 135786 }, -- Vindictive Gladiator's Plate Gauntlets
				{ 21, 135787 }, -- Vindictive Gladiator's Plate Helm
				{ 22, 135788 }, -- Vindictive Gladiator's Plate Legguards
				{ 23, 135789 }, -- Vindictive Gladiator's Plate Shoulders
				{ 24, 135790 }, -- Vindictive Gladiator's Plate Girdle
				{ 25, 135791 }, -- Vindictive Gladiator's Plate Wristplates
				{ 26, 136886 }, -- Vindictive Gladiator's Cloak of Battle
				{ 101, 146163, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Vindictive Combatant's Plate Armor
				{ 103, 136010 }, -- Vindictive Combatant's Plate Chestpiece
				{ 104, 136011 }, -- Vindictive Combatant's Plate Warboots
				{ 105, 136012 }, -- Vindictive Combatant's Plate Gauntlets
				{ 106, 136013 }, -- Vindictive Combatant's Plate Helm
				{ 107, 136014 }, -- Vindictive Combatant's Plate Legguards
				{ 108, 136015 }, -- Vindictive Combatant's Plate Shoulders
				{ 109, 136016 }, -- Vindictive Combatant's Plate Girdle
				{ 110, 136017 }, -- Vindictive Combatant's Plate Wristplates
				{ 111, 136888 }, -- Vindictive Combatant's Cloak of Battle
			},
		},
	},
}

data["LEGION1GEAR"] = {
	name = string.format(EXPANSION_NAME6.." "..AL["Season %d"], 1).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Legion Season %d Elite"], 1),
			[ALLIANCE_DIFF] = {
				-- Amulet
				{ 1, 136133 }, -- Vindictive Gladiator's Necklace
				{ 2, 136137 }, -- Vindictive Gladiator's Pendant
				{ 3, 136141 }, -- Vindictive Gladiator's Choker
				-- Ring
				{ 5, 136134 }, -- Vindictive Gladiator's Ring
				{ 6, 136138 }, -- Vindictive Gladiator's Band
				{ 7, 136142 }, -- Vindictive Gladiator's Signet
				-- Cloak
				{ 9 , 136136 }, -- Vindictive Gladiator's Ironskin Cloak
				{ 10, 136139 }, -- Vindictive Gladiator's Drape of the Tracker
				{ 11, 136895 }, -- Vindictive Gladiator's Demonthread Cloak
				-- Trinket
				{ 16, 136143 }, -- Vindictive Gladiator's Badge of Conquest
				{ 17, 136144 }, -- Vindictive Gladiator's Accolade of Conquest
				{ 18, 136145 }, -- Vindictive Gladiator's Insignia of Conquest
				{ 19, 136146 }, -- Vindictive Gladiator's Emblem of Cruelty
				{ 20, 136147 }, -- Vindictive Gladiator's Emblem of Tenacity
				{ 21, 136148 }, -- Vindictive Gladiator's Emblem of Meditation
				{ 22, 136149 }, -- Vindictive Gladiator's Badge of Dominance
				{ 23, 136150 }, -- Vindictive Gladiator's Accolade of Dominance
				{ 24, 136151 }, -- Vindictive Gladiator's Insignia of Dominance
				{ 25, 136152 }, -- Vindictive Gladiator's Badge of Victory
				{ 26, 136153 }, -- Vindictive Gladiator's Accolade of Victory
				{ 27, 136154 }, -- Vindictive Gladiator's Insignia of Victory
				{ 28, 136155 }, -- Vindictive Gladiator's Badge of Adaptation
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 1, 136246 }, -- Vindictive Gladiator's Necklace
				{ 2, 136250 }, -- Vindictive Gladiator's Pendant
				{ 3, 136254 }, -- Vindictive Gladiator's Choker
				-- Ring
				{ 5, 136247 }, -- Vindictive Gladiator's Ring
				{ 6, 136251 }, -- Vindictive Gladiator's Band
				{ 7, 136255 }, -- Vindictive Gladiator's Signet
				-- Cloak
				{ 9 , 136249 }, -- Vindictive Gladiator's Ironskin Cloak
				{ 10, 136252 }, -- Vindictive Gladiator's Drape of the Tracker
				{ 11, 136896 }, -- Vindictive Gladiator's Demonthread Cloak
				-- Trinket
				{ 16, 136256 }, -- Vindictive Gladiator's Badge of Conquest
				{ 17, 136257 }, -- Vindictive Gladiator's Accolade of Conquest
				{ 18, 136258 }, -- Vindictive Gladiator's Insignia of Conquest
				{ 19, 136259 }, -- Vindictive Gladiator's Emblem of Cruelty
				{ 20, 136260 }, -- Vindictive Gladiator's Emblem of Tenacity
				{ 21, 136261 }, -- Vindictive Gladiator's Emblem of Meditation
				{ 22, 136262 }, -- Vindictive Gladiator's Badge of Dominance
				{ 23, 136263 }, -- Vindictive Gladiator's Accolade of Dominance
				{ 24, 136264 }, -- Vindictive Gladiator's Insignia of Dominance
				{ 25, 136265 }, -- Vindictive Gladiator's Badge of Victory
				{ 26, 136266 }, -- Vindictive Gladiator's Accolade of Victory
				{ 27, 136267 }, -- Vindictive Gladiator's Insignia of Victory
				{ 28, 136268 }, -- Vindictive Gladiator's Badge of Adaptation
			},
		},
		{
			name = string.format(AL["Legion Season %d"], 1),
			[ALLIANCE_DIFF] = {
				-- Amulet
				{ 1, 135681 }, -- Vindictive Gladiator's Necklace
				{ 2, 135685 }, -- Vindictive Gladiator's Pendant
				{ 3, 135689 }, -- Vindictive Gladiator's Choker
				-- Ring
				{ 5, 135682 }, -- Vindictive Gladiator's Ring
				{ 6, 135686 }, -- Vindictive Gladiator's Band
				{ 7, 135690 }, -- Vindictive Gladiator's Signet
				-- Cloak
				{ 9 , 136891 }, -- Vindictive Gladiator's Demonthread Cloak
				{ 10, 135683 }, -- Vindictive Gladiator's Drape of the Tracker
				{ 11, 135687 }, -- Vindictive Gladiator's Ironskin Cloak
				-- Trinket
				{ 16, 135691 }, -- Vindictive Gladiator's Badge of Conquest
				{ 17, 135692 }, -- Vindictive Gladiator's Accolade of Conquest
				{ 18, 135693 }, -- Vindictive Gladiator's Insignia of Conquest
				{ 19, 135694 }, -- Vindictive Gladiator's Emblem of Cruelty
				{ 20, 135695 }, -- Vindictive Gladiator's Emblem of Tenacity
				{ 21, 135696 }, -- Vindictive Gladiator's Emblem of Meditation
				{ 22, 135697 }, -- Vindictive Gladiator's Badge of Dominance
				{ 23, 135698 }, -- Vindictive Gladiator's Accolade of Dominance
				{ 24, 135699 }, -- Vindictive Gladiator's Insignia of Dominance
				{ 25, 135700 }, -- Vindictive Gladiator's Badge of Victory
				{ 26, 135701 }, -- Vindictive Gladiator's Accolade of Victory
				{ 27, 135702 }, -- Vindictive Gladiator's Insignia of Victory
				{ 28, 135703 }, -- Vindictive Gladiator's Badge of Adaptation
				-- Mount
				{ 30, 141843 }, -- Vindictive Gladiator's Storm Dragon

				-- Amulet
				{ 101, 135907 }, -- Vindictive Combatant's Necklace
				{ 102, 135911 }, -- Vindictive Combatant's Pendant
				{ 103, 135915 }, -- Vindictive Combatant's Choker
				-- Ring
				{ 105, 135908 }, -- Vindictive Combatant's Ring
				{ 106, 135912 }, -- Vindictive Combatant's Band
				{ 107, 135916 }, -- Vindictive Combatant's Signet
				-- Cloak
				{ 109, 135910 }, -- Vindictive Combatant's Ironskin Cloak
				{ 110, 135913 }, -- Vindictive Combatant's Drape of the Tracker
				{ 111, 136893 }, -- Vindictive Combatant's Demonthread Cloak
				-- Trinket
				{ 116, 135917 }, -- Vindictive Combatant's Badge of Conquest
				{ 117, 135918 }, -- Vindictive Combatant's Accolade of Conquest
				{ 118, 135919 }, -- Vindictive Combatant's Insignia of Conquest
				{ 119, 135920 }, -- Vindictive Combatant's Emblem of Cruelty
				{ 120, 135921 }, -- Vindictive Combatant's Emblem of Tenacity
				{ 121, 135922 }, -- Vindictive Combatant's Emblem of Meditation
				{ 122, 135923 }, -- Vindictive Combatant's Badge of Dominance
				{ 123, 135924 }, -- Vindictive Combatant's Accolade of Dominance
				{ 124, 135925 }, -- Vindictive Combatant's Insignia of Dominance
				{ 125, 135926 }, -- Vindictive Combatant's Badge of Victory
				{ 126, 135927 }, -- Vindictive Combatant's Accolade of Victory
				{ 127, 135928 }, -- Vindictive Combatant's Insignia of Victory
				{ 128, 135929 }, -- Vindictive Combatant's Badge of Adaptation
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Amulet
				{ 1, 135794 }, -- Vindictive Gladiator's Necklace
				{ 2, 135798 }, -- Vindictive Gladiator's Pendant
				{ 3, 135802 }, -- Vindictive Gladiator's Choker
				-- Ring
				{ 5, 135795 }, -- Vindictive Gladiator's Ring
				{ 6, 135799 }, -- Vindictive Gladiator's Band
				{ 7, 135803 }, -- Vindictive Gladiator's Signet
				-- Cloak
				{ 9 , 135797 }, -- Vindictive Gladiator's Ironskin Cloak
				{ 10, 135800 }, -- Vindictive Gladiator's Drape of the Tracker
				{ 11, 136892 }, -- Vindictive Gladiator's Demonthread Cloak
				-- Trinket
				{ 16, 135804 }, -- Vindictive Gladiator's Badge of Conquest
				{ 17, 135805 }, -- Vindictive Gladiator's Accolade of Conquest
				{ 18, 135806 }, -- Vindictive Gladiator's Insignia of Conquest
				{ 19, 135807 }, -- Vindictive Gladiator's Emblem of Cruelty
				{ 20, 135808 }, -- Vindictive Gladiator's Emblem of Tenacity
				{ 21, 135809 }, -- Vindictive Gladiator's Emblem of Meditation
				{ 22, 135810 }, -- Vindictive Gladiator's Badge of Dominance
				{ 23, 135811 }, -- Vindictive Gladiator's Accolade of Dominance
				{ 24, 135812 }, -- Vindictive Gladiator's Insignia of Dominance
				{ 25, 135813 }, -- Vindictive Gladiator's Badge of Victory
				{ 26, 135814 }, -- Vindictive Gladiator's Accolade of Victory
				{ 27, 135815 }, -- Vindictive Gladiator's Insignia of Victory
				{ 28, 135816 }, -- Vindictive Gladiator's Badge of Adaptation
				-- Mount
				{ 30, 141843 }, -- Vindictive Gladiator's Storm Dragon

				-- Amulet
				{ 101, 136020 }, -- Vindictive Combatant's Necklace
				{ 102, 136024 }, -- Vindictive Combatant's Pendant
				{ 103, 136028 }, -- Vindictive Combatant's Choker
				-- Ring
				{ 105, 136021 }, -- Vindictive Combatant's Ring
				{ 106, 136025 }, -- Vindictive Combatant's Band
				{ 107, 136029 }, -- Vindictive Combatant's Signet
				-- Cloak
				{ 109, 136023 }, -- Vindictive Combatant's Ironskin Cloak
				{ 110, 136026 }, -- Vindictive Combatant's Drape of the Tracker
				{ 111, 136894 }, -- Vindictive Combatant's Demonthread Cloak
				-- Trinket
				{ 116, 136030 }, -- Vindictive Combatant's Badge of Conquest
				{ 117, 136031 }, -- Vindictive Combatant's Accolade of Conquest
				{ 118, 136032 }, -- Vindictive Combatant's Insignia of Conquest
				{ 119, 136033 }, -- Vindictive Combatant's Emblem of Cruelty
				{ 120, 136034 }, -- Vindictive Combatant's Emblem of Tenacity
				{ 121, 136035 }, -- Vindictive Combatant's Emblem of Meditation
				{ 122, 136036 }, -- Vindictive Combatant's Badge of Dominance
				{ 123, 136037 }, -- Vindictive Combatant's Accolade of Dominance
				{ 124, 136038 }, -- Vindictive Combatant's Insignia of Dominance
				{ 125, 136039 }, -- Vindictive Combatant's Badge of Victory
				{ 126, 136040 }, -- Vindictive Combatant's Accolade of Victory
				{ 127, 136041 }, -- Vindictive Combatant's Insignia of Victory
				{ 128, 136042 }, -- Vindictive Combatant's Badge of Adaptation
			},
		},
	},
}

data["WODS3SETS"] = {
	name = string.format(AL["Warlords Season %d"], 3).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 138493, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Dreadplate Armor
				{ 2, 125827, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dreadplate Helm
				{ 3, 125829, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dreadplate Shoulders
				{ 4, 125825, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dreadplate Chestpiece
				{ 5, 125826, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dreadplate Gauntlets
				{ 6, 125828, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dreadplate Legguards
				{ 16, 138589, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Dreadplate Armor
				{ 17, 126029, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dreadplate Helm
				{ 18, 126031, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dreadplate Shoulders
				{ 19, 126027, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dreadplate Chestpiece
				{ 20, 126028, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dreadplate Gauntlets
				{ 21, 126030, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dreadplate Legguards
				--[[
				{ 16, 126186 }, -- Warmongering Aspirant's Dreadplate Helm
				{ 17, 126188 }, -- Warmongering Aspirant's Dreadplate Shoulders
				{ 18, 126184 }, -- Warmongering Aspirant's Dreadplate Chestpiece
				{ 19, 126185 }, -- Warmongering Aspirant's Dreadplate Gauntlets
				{ 20, 126187 }, -- Warmongering Aspirant's Dreadplate Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138494, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Dreadplate Armor
				{ 2, 126306, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dreadplate Helm
				{ 3, 126308, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dreadplate Shoulders
				{ 4, 126304, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dreadplate Chestpiece
				{ 5, 126305, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dreadplate Gauntlets
				{ 6, 126307, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dreadplate Legguards
				{ 16, 138590, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Dreadplate Armor
				{ 17, 126506, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dreadplate Helm
				{ 18, 126508, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dreadplate Shoulders
				{ 19, 126504, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dreadplate Chestpiece
				{ 20, 126505, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dreadplate Gauntlets
				{ 21, 126507, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dreadplate Legguards
				--[[
				{ 16, 126663 }, -- Warmongering Aspirant's Dreadplate Helm
				{ 17, 126665 }, -- Warmongering Aspirant's Dreadplate Shoulders
				{ 18, 126661 }, -- Warmongering Aspirant's Dreadplate Chestpiece
				{ 19, 126662 }, -- Warmongering Aspirant's Dreadplate Gauntlets
				{ 20, 126664 }, -- Warmongering Aspirant's Dreadplate Legguards
				]]
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 138501, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Dragonhide Armor
				{ 2, 125831, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dragonhide Helm
				{ 3, 125834, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dragonhide Spaulders
				{ 4, 125833, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dragonhide Robes
				{ 5, 125830, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dragonhide Gloves
				{ 6, 125832, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dragonhide Legguards
				{ 16, 138593, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Dragonhide Armor
				{ 17, 126033, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dragonhide Helm
				{ 18, 126036, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dragonhide Spaulders
				{ 19, 126035, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dragonhide Tunic
				{ 20, 126032, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dragonhide Gloves
				{ 21, 126034, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dragonhide Legguards
				--[[
				{ 16, 126190 }, -- Warmongering Aspirant's Dragonhide Helm
				{ 17, 126193 }, -- Warmongering Aspirant's Dragonhide Spaulders
				{ 18, 126192 }, -- Warmongering Aspirant's Dragonhide Tunic
				{ 19, 126189 }, -- Warmongering Aspirant's Dragonhide Gloves
				{ 20, 126191 }, -- Warmongering Aspirant's Dragonhide Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138502, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Dragonhide Armor
				{ 2, 126310, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dragonhide Helm
				{ 3, 126313, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dragonhide Spaulders
				{ 4, 126312, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dragonhide Robes
				{ 5, 126309, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Dragonhide Gloves
				{ 6, 126311, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Dragonhide Legguards
				{ 16, 138594, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Dragonhide Armor
				{ 17, 126510, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dragonhide Helm
				{ 18, 126513, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dragonhide Spaulders
				{ 19, 126512, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dragonhide Tunic
				{ 20, 126509, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Dragonhide Gloves
				{ 21, 126511, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Dragonhide Legguards
				--[[
				{ 16, 126667 }, -- Warmongering Aspirant's Dragonhide Helm
				{ 17, 126670 }, -- Warmongering Aspirant's Dragonhide Spaulders
				{ 18, 126669 }, -- Warmongering Aspirant's Dragonhide Tunic
				{ 19, 126666 }, -- Warmongering Aspirant's Dragonhide Gloves
				{ 20, 126668 }, -- Warmongering Aspirant's Dragonhide Legguards
				]]
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 138499, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Chain Armor
				{ 2, 125837, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chain Helm
				{ 3, 125839, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Chain Spaulders
				{ 4, 125835, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chain Armor
				{ 5, 125836, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Chain Gauntlets
				{ 6, 125838, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chain Leggings
				{ 16, 138537, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Chain Armor
				{ 17, 126039, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Chain Helm
				{ 18, 126041, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Chain Spaulders
				{ 19, 126037, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Chain Armor
				{ 20, 126038, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Chain Gauntlets
				{ 21, 126040, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Chain Leggings
				--[[
				{ 16, 126196 }, -- Warmongering Aspirant's Chain Helm
				{ 17, 126198 }, -- Warmongering Aspirant's Chain Spaulders
				{ 18, 126194 }, -- Warmongering Aspirant's Chain Armor
				{ 19, 126195 }, -- Warmongering Aspirant's Chain Gauntlets
				{ 20, 126197 }, -- Warmongering Aspirant's Chain Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138500, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Chain Armor
				{ 2, 126316, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chain Helm
				{ 3, 126318, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Chain Spaulders
				{ 4, 126314, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chain Armor
				{ 5, 126315, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Chain Gauntlets
				{ 6, 126317, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chain Leggings
				{ 16, 138538, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Chain Armor
				{ 17, 126516, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Chain Helm
				{ 18, 126518, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Chain Spaulders
				{ 19, 126514, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Chain Armor
				{ 20, 126515, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Chain Gauntlets
				{ 21, 126517, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Chain Leggings
				--[[{ 16, 126673 }, -- Warmongering Aspirant's Chain Helm
				{ 17, 126675 }, -- Warmongering Aspirant's Chain Spaulders
				{ 18, 126671 }, -- Warmongering Aspirant's Chain Armor
				{ 19, 126672 }, -- Warmongering Aspirant's Chain Gauntlets
				{ 20, 126674 }, -- Warmongering Aspirant's Chain Leggings
				]]
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 138507, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Silk Armor
				{ 2, 125884, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Silk Cowl
				{ 3, 125887, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Silk Amice
				{ 4, 125886, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Silk Robe
				{ 5, 125883, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Silk Handguards
				{ 6, 125885, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Silk Trousers
				{ 16, 138539, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Silk Armor
				{ 17, 126078, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Silk Cowl
				{ 18, 126081, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Silk Amice
				{ 19, 126080, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Silk Robe
				{ 20, 126077, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Silk Handguards
				{ 21, 126079, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Silk Trousers
				--[[
				{ 16, 126211 }, -- Warmongering Aspirant's Silk Cowl
				{ 17, 126214 }, -- Warmongering Aspirant's Silk Amice
				{ 18, 126213 }, -- Warmongering Aspirant's Silk Robe
				{ 19, 126210 }, -- Warmongering Aspirant's Silk Handguards
				{ 20, 126212 }, -- Warmongering Aspirant's Silk Trousers
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138508, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Silk Armor
				{ 2, 126363, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Silk Cowl
				{ 3, 126366, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Silk Amice
				{ 4, 126365, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Silk Robe
				{ 5, 126362, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Silk Handguards
				{ 6, 126364, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Silk Trousers
				{ 16, 138539, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Silk Armor
				{ 17, 126555, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Silk Cowl
				{ 18, 126558, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Silk Amice
				{ 19, 126557, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Silk Robe
				{ 20, 126554, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Silk Handguards
				{ 21, 126556, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Silk Trousers
				--[[
				{ 16, 126688 }, -- Warmongering Aspirant's Silk Cowl
				{ 17, 126691 }, -- Warmongering Aspirant's Silk Amice
				{ 18, 126690 }, -- Warmongering Aspirant's Silk Robe
				{ 19, 126687 }, -- Warmongering Aspirant's Silk Handguards
				{ 20, 126689 }, -- Warmongering Aspirant's Silk Trousers
				]]
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 138503, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Ironskin Armor
				{ 2, 125908, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ironskin Helm
				{ 3, 125910, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ironskin Spaulders
				{ 4, 125911, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ironskin Tunic
				{ 5, 125907, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ironskin Gloves
				{ 6, 125909, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ironskin Legguards
				{ 16, 138595, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Ironskin Armor
				{ 17, 126094, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ironskin Helm
				{ 18, 126096, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ironskin Spaulders
				{ 19, 126097, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ironskin Tunic
				{ 20, 126093, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ironskin Gloves
				{ 21, 126095, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ironskin Legguards
				--[[
				{ 16, 126219 }, -- Warmongering Aspirant's Ironskin Helm
				{ 17, 126221 }, -- Warmongering Aspirant's Ironskin Spaulders
				{ 18, 126222 }, -- Warmongering Aspirant's Ironskin Tunic
				{ 19, 126218 }, -- Warmongering Aspirant's Ironskin Gloves
				{ 20, 126220 }, -- Warmongering Aspirant's Ironskin Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138504, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Ironskin Armor
				{ 2, 126387, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ironskin Helm
				{ 3, 126389, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ironskin Spaulders
				{ 4, 126390, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ironskin Tunic
				{ 5, 126386, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ironskin Gloves
				{ 6, 126388, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ironskin Legguards
				{ 16, 138596, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Ironskin Armor
				{ 17, 126571, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ironskin Helm
				{ 18, 126573, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ironskin Spaulders
				{ 19, 126574, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ironskin Tunic
				{ 20, 126570, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ironskin Gloves
				{ 21, 126572, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ironskin Legguards
				--[[
				{ 16, 126696 }, -- Warmongering Aspirant's Ironskin Helm
				{ 17, 126698 }, -- Warmongering Aspirant's Ironskin Spaulders
				{ 18, 126699 }, -- Warmongering Aspirant's Ironskin Tunic
				{ 19, 126695 }, -- Warmongering Aspirant's Ironskin Gloves
				{ 20, 126697 }, -- Warmongering Aspirant's Ironskin Legguards
				]]
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 138495, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Scaled Armor
				{ 2, 125914, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Scaled Helm
				{ 3, 125916, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Scaled Shoulders
				{ 4, 125912, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Scaled Chestpiece
				{ 5, 125913, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Scaled Gauntlets
				{ 6, 125915, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Scaled Legguards
				{ 16, 138591, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Scaled Armor
				{ 17, 126100, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Scaled Helm
				{ 18, 126102, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Scaled Shoulders
				{ 19, 126098, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Scaled Chestpiece
				{ 20, 126099, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Scaled Gauntlets
				{ 21, 126101, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Scaled Legguards
				--[[
				{ 16, 126225 }, -- Warmongering Aspirant's Scaled Helm
				{ 17, 126227 }, -- Warmongering Aspirant's Scaled Shoulders
				{ 18, 126223 }, -- Warmongering Aspirant's Scaled Chestpiece
				{ 19, 126224 }, -- Warmongering Aspirant's Scaled Gauntlets
				{ 20, 126226 }, -- Warmongering Aspirant's Scaled Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138496, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Scaled Armor
				{ 2, 126393, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Scaled Helm
				{ 3, 126395, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Scaled Shoulders
				{ 4, 126391, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Scaled Chestpiece
				{ 5, 126392, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Scaled Gauntlets
				{ 6, 126394, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Scaled Legguards
				{ 16, 138591, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Scaled Armor
				{ 17, 126577, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Scaled Helm
				{ 18, 126579, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Scaled Shoulders
				{ 19, 126575, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Scaled Chestpiece
				{ 20, 126576, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Scaled Gauntlets
				{ 21, 126578, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Scaled Legguards
				--[[
				{ 16, 126702 }, -- Warmongering Aspirant's Scaled Helm
				{ 17, 126704 }, -- Warmongering Aspirant's Scaled Shoulders
				{ 18, 126700 }, -- Warmongering Aspirant's Scaled Chestpiece
				{ 19, 126701 }, -- Warmongering Aspirant's Scaled Gauntlets
				{ 20, 126703 }, -- Warmongering Aspirant's Scaled Legguards
				]]
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 138509, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Satin Armor
				{ 2, 125937, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Satin Hood
				{ 3, 125940, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Satin Mantle
				{ 4, 125939, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Satin Robe
				{ 5, 125936, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Satin Gloves
				{ 6, 125938, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Satin Leggings
				{ 16, 138541, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Satin Armor
				{ 17, 126115, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Satin Hood
				{ 18, 126118, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Satin Mantle
				{ 19, 126117, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Satin Robe
				{ 20, 126114, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Satin Gloves
				{ 21, 126116, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Satin Leggings
				--[[
				{ 16, 126232 }, -- Warmongering Aspirant's Satin Hood
				{ 17, 126235 }, -- Warmongering Aspirant's Satin Mantle
				{ 18, 126234 }, -- Warmongering Aspirant's Satin Robe
				{ 19, 126231 }, -- Warmongering Aspirant's Satin Gloves
				{ 20, 126233 }, -- Warmongering Aspirant's Satin Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138510, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Satin Armor
				{ 2, 126416, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Satin Hood
				{ 3, 126419, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Satin Mantle
				{ 4, 126418, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Satin Robe
				{ 5, 126415, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Satin Gloves
				{ 6, 126417, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Satin Leggings
				{ 16, 138542, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Satin Armor
				{ 17, 126592, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Satin Hood
				{ 18, 126595, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Satin Mantle
				{ 19, 126594, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Satin Robe
				{ 20, 126591, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Satin Gloves
				{ 21, 126593, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Satin Leggings
				--[[
				{ 16, 126709 }, -- Warmongering Aspirant's Satin Hood
				{ 17, 126712 }, -- Warmongering Aspirant's Satin Mantle
				{ 18, 126711 }, -- Warmongering Aspirant's Satin Robe
				{ 19, 126708 }, -- Warmongering Aspirant's Satin Gloves
				{ 20, 126710 }, -- Warmongering Aspirant's Satin Leggings
				]]
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 138505, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Leather Armor
				{ 2, 125943, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leather Helm
				{ 3, 125945, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Leather Spaulders
				{ 4, 125941, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leather Tunic
				{ 5, 125942, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Leather Gloves
				{ 6, 125944, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leather Legguards
				{ 16, 138597, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Leather Armor
				{ 17, 126121, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Leather Helm
				{ 18, 126123, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Leather Spaulders
				{ 19, 126119, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Leather Tunic
				{ 20, 126120, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Leather Gloves
				{ 21, 126122, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Leather Legguards
				--[[
				{ 16, 126238 }, -- Warmongering Aspirant's Leather Helm
				{ 17, 126240 }, -- Warmongering Aspirant's Leather Spaulders
				{ 18, 126236 }, -- Warmongering Aspirant's Leather Tunic
				{ 19, 126237 }, -- Warmongering Aspirant's Leather Gloves
				{ 20, 126239 }, -- Warmongering Aspirant's Leather Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138506, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Leather Armor
				{ 2, 126422, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leather Helm
				{ 3, 126424, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Leather Spaulders
				{ 4, 126420, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leather Tunic
				{ 5, 126421, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Leather Gloves
				{ 6, 126423, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leather Legguards
				{ 16, 138598, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Leather Armor
				{ 17, 126598, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Leather Helm
				{ 18, 126600, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Leather Spaulders
				{ 19, 126596, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Leather Tunic
				{ 20, 126597, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Leather Gloves
				{ 21, 126599, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Leather Legguards
				--[[
				{ 16, 126715 }, -- Warmongering Aspirant's Leather Helm
				{ 17, 126717 }, -- Warmongering Aspirant's Leather Spaulders
				{ 18, 126713 }, -- Warmongering Aspirant's Leather Tunic
				{ 19, 126714 }, -- Warmongering Aspirant's Leather Gloves
				{ 20, 126716 }, -- Warmongering Aspirant's Leather Legguards
				]]
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 138497, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Ringmail Armor
				{ 2, 125948, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ringmail Helm
				{ 3, 125950, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ringmail Spaulders
				{ 4, 125946, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ringmail Armor
				{ 5, 125947, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ringmail Gauntlets
				{ 6, 125949, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ringmail Kilt
				{ 16, 138535, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Ringmail Armor
				{ 17, 126126, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ringmail Helm
				{ 18, 126128, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ringmail Spaulders
				{ 19, 126124, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ringmail Armor
				{ 20, 126125, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ringmail Gauntlets
				{ 21, 126127, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ringmail Leggings
				--[[
				{ 16, 126243 }, -- Warmongering Aspirant's Ringmail Helm
				{ 17, 126245 }, -- Warmongering Aspirant's Ringmail Spaulders
				{ 18, 126241 }, -- Warmongering Aspirant's Ringmail Armor
				{ 19, 126242 }, -- Warmongering Aspirant's Ringmail Gauntlets
				{ 20, 126244 }, -- Warmongering Aspirant's Ringmail Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138498, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Ringmail Armor
				{ 2, 126427, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ringmail Helm
				{ 3, 126429, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ringmail Spaulders
				{ 4, 126425, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ringmail Armor
				{ 5, 126426, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Ringmail Gauntlets
				{ 6, 126428, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Ringmail Kilt
				{ 16, 138536, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Ringmail Armor
				{ 17, 126603, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ringmail Helm
				{ 18, 126605, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ringmail Spaulders
				{ 19, 126601, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ringmail Armor
				{ 20, 126602, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Ringmail Gauntlets
				{ 21, 126604, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Ringmail Leggings
				--[[
				{ 16, 126720 }, -- Warmongering Aspirant's Ringmail Helm
				{ 17, 126722 }, -- Warmongering Aspirant's Ringmail Spaulders
				{ 18, 126718 }, -- Warmongering Aspirant's Ringmail Armor
				{ 19, 126719 }, -- Warmongering Aspirant's Ringmail Gauntlets
				{ 20, 126721 }, -- Warmongering Aspirant's Ringmail Leggings
				]]
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 138511, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Felweave Armor
				{ 2, 125990, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Felweave Cowl
				{ 3, 125993, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Felweave Amice
				{ 4, 125992, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Felweave Raiment
				{ 5, 125989, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Felweave Handguards
				{ 6, 125991, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Felweave Trousers
				{ 16, 138543, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Felweave Armor
				{ 17, 126168, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Felweave Cowl
				{ 18, 126171, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Felweave Amice
				{ 19, 126170, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Felweave Raiment
				{ 20, 126167, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Felweave Handguards
				{ 21, 126169, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Felweave Trousers
				--[[
				{ 16, 126259 }, -- Warmongering Aspirant's Felweave Cowl
				{ 17, 126262 }, -- Warmongering Aspirant's Felweave Amice
				{ 18, 126261 }, -- Warmongering Aspirant's Felweave Raiment
				{ 19, 126258 }, -- Warmongering Aspirant's Felweave Handguards
				{ 20, 126260 }, -- Warmongering Aspirant's Felweave Trousers
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138512, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Felweave Armor
				{ 2, 126467, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Felweave Cowl
				{ 3, 126470, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Felweave Amice
				{ 4, 126469, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Felweave Raiment
				{ 5, 126466, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Felweave Handguards
				{ 6, 126468, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Felweave Trousers
				{ 16, 138544, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Felweave Armor
				{ 17, 126645, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Felweave Cowl
				{ 18, 126648, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Felweave Amice
				{ 19, 126647, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Felweave Raiment
				{ 20, 126644, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Felweave Handguards
				{ 21, 126646, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Felweave Trousers
				--[[
				{ 16, 126736 }, -- Warmongering Aspirant's Felweave Cowl
				{ 17, 126739 }, -- Warmongering Aspirant's Felweave Amice
				{ 18, 126738 }, -- Warmongering Aspirant's Felweave Raiment
				{ 19, 126735 }, -- Warmongering Aspirant's Felweave Handguards
				{ 20, 126737 }, -- Warmongering Aspirant's Felweave Trousers
				]]
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 138491, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Plate Armor
				{ 2, 125996, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Helm
				{ 3, 125998, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Shoulders
				{ 4, 125994, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Chestpiece
				{ 5, 125995, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Gauntlets
				{ 6, 125997, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Legguards
				
				{ 16, 138587, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Plate Armor
				{ 17, 126174, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Plate Helm
				{ 18, 126176, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Plate Shoulders
				{ 19, 126172, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Plate Chestpiece
				{ 20, 126173, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Plate Gauntlets
				{ 21, 126175, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Plate Legguards
--[[				
				{ 18, 126265 }, -- Warmongering Aspirant's Plate Helm
				{ 19, 126267 }, -- Warmongering Aspirant's Plate Shoulders
				{ 20, 126263 }, -- Warmongering Aspirant's Plate Chestpiece
				{ 21, 126264 }, -- Warmongering Aspirant's Plate Gauntlets
				{ 22, 126266 }, -- Warmongering Aspirant's Plate Legguards
]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138492, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Gladiator's Plate Armor
				{ 2, 126473, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Helm
				{ 3, 126475, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Shoulders
				{ 4, 126471, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Chestpiece
				{ 5, 126472, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Gauntlets
				{ 6, 126474, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Legguards
				
				{ 16, 138588, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Warmongering Combatant's Plate Armor
				{ 17, 126651, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Plate Helm
				{ 18, 126653, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Plate Shoulders
				{ 19, 126649, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Plate Chestpiece
				{ 20, 126650, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Plate Gauntlets
				{ 21, 126652, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Combatant's Plate Legguards
--[[				
				{ 18, 126742 }, -- Warmongering Aspirant's Plate Helm
				{ 19, 126744 }, -- Warmongering Aspirant's Plate Shoulders
				{ 20, 126740 }, -- Warmongering Aspirant's Plate Chestpiece
				{ 21, 126741 }, -- Warmongering Aspirant's Plate Gauntlets
				{ 22, 126743 }, -- Warmongering Aspirant's Plate Legguards
]]
			},
		},
	},
}

data["WODS3NONSETGEAR"] = {
	name = string.format(AL["Warlords Season %d"], 3).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = { 
		{ -- Cloth
			name = AL["Cloth"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125816, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Hood of Prowess
				{ 2, 125821, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Cowl of Cruelty
				{ 4, 125819, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Amice of Prowess
				{ 5, 125824, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Mantle of Cruelty
				{ 7, 125818, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Robes of Prowess
				{ 8, 125823, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Raiment of Cruelty
				{ 10, 125815, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gloves of Prowess
				{ 11, 125820, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Handguards of Cruelty
				{ 16, 125812, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cuffs of Prowess
				{ 17, 125813, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cuffs of Cruelty
				{ 18, 125814, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cuffs of Victory
				{ 20, 125817, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings of Prowess
				{ 21, 125822, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Trousers of Cruelty
				{ 23, 125806, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cord of Cruelty
				{ 24, 125807, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cord of Prowess
				{ 25, 125808, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cord of Victory
				{ 27, 125809, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Treads of Cruelty
				{ 28, 125810, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Treads of Prowess
				{ 29, 125811, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Treads of Victory
				-- ilvl 680
				--{ 101, 126023 }, -- Warmongering Combatant's Hood of Prowess
				--{ 103, 126026 }, -- Warmongering Combatant's Amice of Prowess
				--{ 105, 126025 }, -- Warmongering Combatant's Robes of Prowess
				--{ 107, 126022 }, -- Warmongering Combatant's Gloves of Prowess
				{ 101, 126020, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cuffs of Prowess
				{ 102, 126021, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cuffs of Cruelty
				--{ 112, 126024 }, -- Warmongering Combatant's Leggings of Prowess
				{ 104, 126016, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cord of Cruelty
				{ 105, 126017, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cord of Prowess
				{ 106, 126018, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Treads of Cruelty
				{ 107, 126019, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Treads of Prowess
				-- ilvl 625
				--{ 119, 126183 }, -- Warmongering Aspirant's Cuffs of Prowess
				--{ 121, 126181 }, -- Warmongering Aspirant's Cord of Cruelty
				--{ 123, 126182 }, -- Warmongering Aspirant's Treads of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126295, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Hood of Prowess
				{ 2, 126300, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Cowl of Cruelty
				{ 4, 126298, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Amice of Prowess
				{ 5, 126303, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Mantle of Cruelty
				{ 7, 126297, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Robes of Prowess
				{ 8, 126302, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Raiment of Cruelty
				{ 10, 126294, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gloves of Prowess
				{ 11, 126299, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Handguards of Cruelty
				{ 16, 126291, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cuffs of Prowess
				{ 17, 126292, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cuffs of Cruelty
				{ 18, 126293, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cuffs of Victory
				{ 20, 126296, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings of Prowess
				{ 21, 126301, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Trousers of Cruelty
				{ 23, 126285, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cord of Cruelty
				{ 24, 126286, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cord of Prowess
				{ 25, 126287, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cord of Victory
				{ 27, 126288, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Treads of Cruelty
				{ 28, 126289, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Treads of Prowess
				{ 29, 126290, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Treads of Victory
				-- ilvl 680
				--{ 101, 126500 }, -- Warmongering Combatant's Hood of Prowess
				--{ 103, 126503 }, -- Warmongering Combatant's Amice of Prowess
				--{ 105, 126502 }, -- Warmongering Combatant's Robes of Prowess
				--{ 107, 126499 }, -- Warmongering Combatant's Gloves of Prowess
				{ 101, 126497, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cuffs of Prowess
				{ 102, 126498, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cuffs of Cruelty
				--{ 112, 126501 }, -- Warmongering Combatant's Leggings of Prowess
				{ 104, 126493, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cord of Cruelty
				{ 105, 126494, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cord of Prowess
				{ 106, 126495, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Treads of Cruelty
				{ 107, 126496, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Treads of Prowess
				-- ilvl 625
				--{ 119, 126660 }, -- Warmongering Aspirant's Cuffs of Prowess
				--{ 121, 126658 }, -- Warmongering Aspirant's Cord of Cruelty
				--{ 123, 126659 }, -- Warmongering Aspirant's Treads of Cruelty
			},
		},
		{ -- Leather
			name = AL["Leather"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125875, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Helm
				{ 2, 125880, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Headcover
				{ 4, 125877, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Spaulders
				{ 5, 125882, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 125873, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Tunic
				{ 8, 125878, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chestguard
				{ 10, 125874, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gloves
				{ 11, 125879, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Grips
				{ 16, 125870, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Bindings of Cruelty
				{ 17, 125871, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Bindings of Prowess
				{ 18, 125872, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Bindings of Victory
				{ 20, 125876, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Legguards
				{ 21, 125881, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings
				{ 23, 125864, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Belt of Prowess
				{ 24, 125865, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Belt of Cruelty
				{ 25, 125866, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Belt of Victory
				{ 27, 125867, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Boots of Cruelty
				{ 28, 125868, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Boots of Prowess
				{ 29, 125869, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Boots of Victory
				-- ilvl 680
				--{ 101, 126074 }, -- Warmongering Combatant's Helm
				--{ 103, 126076 }, -- Warmongering Combatant's Spaulders
				--{ 105, 126072 }, -- Warmongering Combatant's Tunic
				--{ 107, 126073 }, -- Warmongering Combatant's Gloves
				{ 101, 126070, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Bindings of Cruelty
				{ 102, 126071, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Bindings of Prowess
				--{ 112, 126075 }, -- Warmongering Combatant's Legguards
				{ 104, 126066, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Belt of Prowess
				{ 105, 126067, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Belt of Cruelty
				{ 106, 126068, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Boots of Cruelty
				{ 107, 126069, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Boots of Prowess
				-- ilvl 625
				--{ 119, 126209 }, -- Warmongering Aspirant's Bindings of Cruelty
				--{ 121, 126207 }, -- Warmongering Aspirant's Belt of Prowess
				--{ 123, 126208 }, -- Warmongering Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126354, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Helm
				{ 2, 126359, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Headcover
				{ 4, 126356, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Spaulders
				{ 5, 126361, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 126352, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Tunic
				{ 8, 126357, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chestguard
				{ 10, 126353, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gloves
				{ 11, 126358, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Grips
				{ 16, 126349, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Bindings of Cruelty
				{ 17, 126350, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Bindings of Prowess
				{ 18, 126351, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Bindings of Victory
				{ 20, 126355, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Legguards
				{ 21, 126360, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings
				{ 23, 126343, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Belt of Prowess
				{ 24, 126344, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Belt of Cruelty
				{ 25, 126345, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Belt of Victory
				{ 27, 126346, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Boots of Cruelty
				{ 28, 126347, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Boots of Prowess
				{ 29, 126348, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Boots of Victory
				-- ilvl 680
				--{ 101, 126551 }, -- Warmongering Combatant's Helm
				--{ 103, 126553 }, -- Warmongering Combatant's Spaulders
				--{ 105, 126549 }, -- Warmongering Combatant's Tunic
				--{ 107, 126550 }, -- Warmongering Combatant's Gloves
				{ 101, 126547, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Bindings of Cruelty
				{ 102, 126548, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Bindings of Prowess
				--{ 112, 126552 }, -- Warmongering Combatant's Legguards
				{ 104, 126543, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Belt of Prowess
				{ 105, 126544, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Belt of Cruelty
				{ 106, 126545, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Boots of Cruelty
				{ 107, 126546, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Boots of Prowess
				-- ilvl 625
				--{ 119, 126686 }, -- Warmongering Aspirant's Bindings of Cruelty
				--{ 121, 126684 }, -- Warmongering Aspirant's Belt of Prowess
				--{ 123, 126685 }, -- Warmongering Aspirant's Boots of Cruelty
			},
		},
		{ -- Mail
			name = AL["Mail"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125899, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Helm
				{ 2, 125904, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Coif
				{ 4, 125901, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Spaulders
				{ 5, 125906, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 125897, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Armor
				{ 8, 125902, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chestguard
				{ 10, 125898, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gauntlets
				{ 11, 125903, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gloves
				{ 16, 125894, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armbands of Prowess
				{ 17, 125895, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armbands of Cruelty
				{ 18, 125896, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armbands of Victory
				{ 20, 125900, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings
				{ 21, 125905, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings
				{ 23, 125888, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Waistguard of Cruelty
				{ 24, 125889, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Waistguard of Prowess
				{ 25, 125890, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Waistguard of Victory
				{ 27, 125891, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Footguards of Cruelty
				{ 28, 125892, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Footguards of Prowess
				{ 29, 125893, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Footguards of Victory
				-- ilvl 680
				--{ 101, 126090 }, -- Warmongering Combatant's Helm
				--{ 103, 126092 }, -- Warmongering Combatant's Spaulders
				--{ 105, 126088 }, -- Warmongering Combatant's Armor
				--{ 107, 126089 }, -- Warmongering Combatant's Gauntlets
				{ 101, 126086, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armbands of Prowess
				{ 102, 126087, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armbands of Cruelty
				--{ 112, 126091 }, -- Warmongering Combatant's Leggings
				{ 104, 126082, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Waistguard of Cruelty
				{ 105, 126083, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Waistguard of Prowess
				{ 106, 126084, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Footguards of Cruelty
				{ 107, 126085, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Footguards of Prowess
				-- ilvl 625
				--{ 119, 126217 }, -- Warmongering Aspirant's Armbands of Prowess
				--{ 121, 126215 }, -- Warmongering Aspirant's Waistguard of Cruelty
				--{ 123, 126216 }, -- Warmongering Aspirant's Footguards of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126378, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Helm
				{ 2, 126383, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Coif
				{ 4, 126380, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Spaulders
				{ 5, 126385, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 126376, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Armor
				{ 8, 126381, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Chestguard
				{ 10, 126377, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gauntlets
				{ 11, 126382, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Gloves
				{ 16, 126373, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armbands of Prowess
				{ 17, 126374, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armbands of Cruelty
				{ 18, 126375, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armbands of Victory
				{ 20, 126379, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings
				{ 21, 126384, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Leggings
				{ 23, 126367, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Waistguard of Cruelty
				{ 24, 126368, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Waistguard of Prowess
				{ 25, 126369, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Waistguard of Victory
				{ 27, 126370, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Footguards of Cruelty
				{ 28, 126371, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Footguards of Prowess
				{ 29, 126372, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Footguards of Victory
				-- ilvl 680
				--{ 101, 126567 }, -- Warmongering Combatant's Helm
				--{ 103, 126569 }, -- Warmongering Combatant's Spaulders
				--{ 105, 126565 }, -- Warmongering Combatant's Armor
				--{ 107, 126566 }, -- Warmongering Combatant's Gauntlets
				{ 101, 126563, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armbands of Prowess
				{ 102, 126564, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armbands of Cruelty
				--{ 112, 126568 }, -- Warmongering Combatant's Leggings
				{ 104, 126559, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Waistguard of Cruelty
				{ 105, 126560, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Waistguard of Prowess
				{ 106, 126561, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Footguards of Cruelty
				{ 107, 126562, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Footguards of Prowess
				-- ilvl 625
				--{ 119, 126694 }, -- Warmongering Aspirant's Armbands of Prowess
				--{ 121, 126692 }, -- Warmongering Aspirant's Waistguard of Cruelty
				--{ 123, 126693 }, -- Warmongering Aspirant's Footguards of Cruelty
			},
		},
		{ -- Plate
			name = AL["Plate"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125928, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Helmet
				{ 2, 125933, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Visor
				{ 4, 125930, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Shoulderplates
				{ 5, 125935, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Pauldrons
				{ 7, 125926, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Breastplate
				{ 8, 125931, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Chestguard
				{ 10, 125927, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Gloves
				{ 11, 125932, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Grips
				
				{ 16, 125923, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armplates of Cruelty
				{ 17, 125924, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armplates of Prowess
				{ 18, 125925, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armplates of Victory
				{ 20, 125929, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Legplates
				{ 21, 125934, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Leggings
				{ 23, 125917, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Girdle of Cruelty
				{ 24, 125918, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Girdle of Prowess
				{ 25, 125919, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Girdle of Victory
				{ 27, 125920, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Warboots of Cruelty
				{ 28, 125921, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Warboots of Prowess
				{ 29, 125922, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Warboots of Victory
				-- ilvl 700
				--{ 101, 126111 }, -- Warmongering Combatant's Plate Helmet
				--{ 103, 126113 }, -- Warmongering Combatant's Shoulderplates
				--{ 105, 126109 }, -- Warmongering Combatant's Plate Breastplate
				--{ 107, 126110 }, -- Warmongering Combatant's Plate Gloves
				{ 101, 126107, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armplates of Cruelty
				{ 102, 126108, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armplates of Prowess
				--{ 112, 126112 }, -- Warmongering Combatant's Legplates
				{ 104, 126103, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Girdle of Cruelty
				{ 105, 126104, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Girdle of Prowess
				{ 106, 126105, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Warboots of Cruelty
				{ 107, 126106, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Warboots of Prowess
				-- ilvl 625
				--{ 119, 126230 }, -- Warmongering Aspirant's Armplates of Cruelty
				--{ 121, 126228 }, -- Warmongering Aspirant's Girdle of Cruelty
				--{ 123, 126229 }, -- Warmongering Aspirant's Warboots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126407, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Helmet
				{ 2, 126412, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Visor
				{ 4, 126409, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Shoulderplates
				{ 5, 126414, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Pauldrons
				{ 7, 126405, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Breastplate
				{ 8, 126410, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Chestguard
				{ 10, 126406, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Gloves
				{ 11, 126411, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Plate Grips
				{ 16, 126402, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armplates of Cruelty
				{ 17, 126403, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armplates of Prowess
				{ 18, 126404, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Armplates of Victory
				{ 20, 126408, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Legplates
				{ 21, 126413, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Warmongering Gladiator's Plate Leggings
				{ 23, 126396, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Girdle of Cruelty
				{ 24, 126397, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Girdle of Prowess
				{ 25, 126398, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Girdle of Victory
				{ 27, 126399, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Warboots of Cruelty
				{ 28, 126400, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Warboots of Prowess
				{ 29, 126401, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Warboots of Victory
				-- ilvl 700
				--{ 101, 126588 }, -- Warmongering Combatant's Plate Helmet
				--{ 103, 126590 }, -- Warmongering Combatant's Shoulderplates
				--{ 105, 126586 }, -- Warmongering Combatant's Plate Breastplate
				--{ 107, 126587 }, -- Warmongering Combatant's Plate Gloves
				{ 101, 126584, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armplates of Cruelty
				{ 102, 126585, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Armplates of Prowess
				--{ 112, 126589 }, -- Warmongering Combatant's Legplates
				{ 104, 126580, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Girdle of Cruelty
				{ 105, 126581, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Girdle of Prowess
				{ 106, 126582, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Warboots of Cruelty
				{ 107, 126583, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Warboots of Prowess
				-- ilvl 625
				--{ 119, 126707 }, -- Warmongering Aspirant's Armplates of Cruelty
				--{ 121, 126705 }, -- Warmongering Aspirant's Girdle of Cruelty
				--{ 123, 126706 }, -- Warmongering Aspirant's Warboots of Cruelty
			},
		},
--[[		{ -- Amulets
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125801, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Necklace of Cruelty
				{ 2, 125802, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Necklace of Prowess
				{ 3, 125851, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Cruelty
				{ 4, 125852, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Prowess
				{ 5, 125853, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Meditation
				{ 6, 125854, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Contemplation
				{ 7, 125960, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Choker of Cruelty
				{ 8, 125961, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Choker of Prowess
				{ 9, 125967, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Choker of Endurance
				-- ilvl 680
				{ 16, 126011, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Necklace of Cruelty
				{ 17, 126012, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Necklace of Prowess
				{ 18, 126053, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Cruelty
				{ 19, 126054, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Prowess
				{ 20, 126055, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Meditation
				{ 21, 126056, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Contemplation
				{ 22, 126138, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Choker of Cruelty
				{ 23, 126139, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Choker of Prowess
				{ 24, 126164, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Choker of Endurance
				-- ilvl 625
				{ 11, 126178 }, -- Warmongering Aspirant's Necklace of Cruelty
				{ 12, 126201 }, -- Warmongering Aspirant's Pendant of Cruelty
				{ 13, 126202 }, -- Warmongering Aspirant's Pendant of Meditation
				{ 14, 126247 }, -- Warmongering Aspirant's Choker of Cruelty
				{ 15, 126250 }, -- Warmongering Aspirant's Choker of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126280, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Necklace of Cruelty
				{ 2, 126281, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Necklace of Prowess
				{ 3, 126330, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Cruelty
				{ 4, 126331, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Prowess
				{ 5, 126332, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Meditation
				{ 6, 126333, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Pendant of Contemplation
				{ 7, 126439, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Choker of Cruelty
				{ 8, 126440, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Choker of Prowess
				{ 9, 126446, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Choker of Endurance
				-- ilvl 680
				{ 16, 126488, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Necklace of Cruelty
				{ 17, 126489, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Necklace of Prowess
				{ 18, 126530, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Cruelty
				{ 19, 126531, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Prowess
				{ 20, 126532, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Meditation
				{ 21, 126533, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Pendant of Contemplation
				{ 22, 126615, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Choker of Cruelty
				{ 23, 126616, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Choker of Prowess
				{ 24, 126641, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Choker of Endurance
				-- ilvl 625
				{ 11, 126655 }, -- Warmongering Aspirant's Necklace of Cruelty
				{ 12, 126678 }, -- Warmongering Aspirant's Pendant of Cruelty
				{ 13, 126679 }, -- Warmongering Aspirant's Pendant of Meditation
				{ 14, 126724 }, -- Warmongering Aspirant's Choker of Cruelty
				{ 15, 126727 }, -- Warmongering Aspirant's Choker of Endurance
			},
		},]]
		{ -- Cloaks
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125799, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cape of Cruelty
				{ 2, 125800, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cape of Prowess
				{ 3, 125847, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Cruelty
				{ 4, 125848, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Prowess
				{ 5, 125849, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Meditation
				{ 6, 125850, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Contemplation
				{ 7, 125958, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cloak of Cruelty
				{ 8, 125959, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cloak of Prowess
				{ 9, 125966, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cloak of Endurance
				-- ilvl 700
				{ 16, 126009, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cape of Cruelty
				{ 17, 126010, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cape of Prowess
				{ 18, 126049, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Cruelty
				{ 19, 126050, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Prowess
				{ 20, 126051, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Meditation
				{ 21, 126052, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Contemplation
				{ 22, 126136, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cloak of Cruelty
				{ 23, 126137, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cloak of Prowess
				{ 24, 126163, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cloak of Endurance
				-- ilvl 625
				--{ 11, 126177 }, -- Warmongering Aspirant's Cape of Cruelty
				--{ 12, 126199 }, -- Warmongering Aspirant's Drape of Cruelty
				--{ 13, 126200 }, -- Warmongering Aspirant's Drape of Meditation
				--{ 14, 126246 }, -- Warmongering Aspirant's Cloak of Cruelty
				--{ 15, 126249 }, -- Warmongering Aspirant's Cloak of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126278, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cape of Cruelty
				{ 2, 126279, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cape of Prowess
				{ 3, 126326, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Cruelty
				{ 4, 126327, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Prowess
				{ 5, 126328, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Meditation
				{ 6, 126329, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Drape of Contemplation
				{ 7, 126437, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cloak of Cruelty
				{ 8, 126438, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cloak of Prowess
				{ 9, 126445, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Cloak of Endurance
				-- ilvl 700
				{ 16, 126486, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cape of Cruelty
				{ 17, 126487, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cape of Prowess
				{ 18, 126526, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Cruelty
				{ 19, 126527, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Prowess
				{ 20, 126528, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Meditation
				{ 21, 126529, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Drape of Contemplation
				{ 22, 126613, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cloak of Cruelty
				{ 23, 126614, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cloak of Prowess
				{ 24, 126640, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Cloak of Endurance
				-- ilvl 625
				--{ 11, 126654 }, -- Warmongering Aspirant's Cape of Cruelty
				--{ 12, 126676 }, -- Warmongering Aspirant's Drape of Cruelty
				--{ 13, 126677 }, -- Warmongering Aspirant's Drape of Meditation
				--{ 14, 126723 }, -- Warmongering Aspirant's Cloak of Cruelty
				--{ 15, 126726 }, -- Warmongering Aspirant's Cloak of Endurance
			},
		},
--[[
		{ -- Rings
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125803, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Ring of Cruelty
				{ 2, 125804, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Ring of Prowess
				{ 3, 125805, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Ring of Triumph
				{ 4, 125857, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Cruelty
				{ 5, 125858, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Prowess
				{ 6, 125859, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Victory
				{ 7, 125860, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Meditation
				{ 8, 125861, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Contemplation
				{ 9, 125962, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Cruelty
				{ 10, 125963, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Accuracy
				{ 11, 125964, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Ruthlessness
				{ 12, 125968, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Dedication
				{ 13, 125969, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Endurance
				-- ilvl 680
				{ 16, 126013, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Ring of Cruelty
				{ 17, 126014, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Ring of Prowess
				{ 18, 126015, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Ring of Triumph
				{ 19, 126059, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Cruelty
				{ 20, 126060, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Prowess
				{ 21, 126061, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Victory
				{ 22, 126062, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Meditation
				{ 23, 126063, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Contemplation
				{ 24, 126140, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Cruelty
				{ 25, 126141, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Accuracy
				{ 26, 126142, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Ruthlessness
				{ 27, 126165, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Dedication
				{ 28, 126166, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Endurance
				-- ilvl 625
				{ 101, 126179 }, -- Warmongering Aspirant's Ring of Cruelty
				{ 102, 126180 }, -- Warmongering Aspirant's Ring of Prowess
				{ 103, 126203 }, -- Warmongering Aspirant's Band of Cruelty
				{ 104, 126204 }, -- Warmongering Aspirant's Band of Prowess
				{ 105, 126205 }, -- Warmongering Aspirant's Band of Meditation
				{ 106, 126206 }, -- Warmongering Aspirant's Band of Contemplation
				{ 107, 126248 }, -- Warmongering Aspirant's Signet of Cruelty
				{ 108, 126251 }, -- Warmongering Aspirant's Signet of Dedication
				{ 109, 126252 }, -- Warmongering Aspirant's Signet of Endurance
				{ 110, 127120 }, -- Warmongering Aspirant's Signet of Accuracy
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126282, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Ring of Cruelty
				{ 2, 126283, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Ring of Prowess
				{ 3, 126284, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Ring of Triumph
				{ 4, 126336, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Cruelty
				{ 5, 126337, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Prowess
				{ 6, 126338, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Victory
				{ 7, 126339, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Meditation
				{ 8, 126340, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Band of Contemplation
				{ 9, 126441, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Cruelty
				{ 10, 126442, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Accuracy
				{ 11, 126443, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Ruthlessness
				{ 12, 126447, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Dedication
				{ 13, 126448, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Gladiator's Signet of Endurance
				-- ilvl 680
				{ 16, 126490, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Ring of Cruelty
				{ 17, 126491, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Ring of Prowess
				{ 18, 126492, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Ring of Triumph
				{ 19, 126536, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Cruelty
				{ 20, 126537, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Prowess
				{ 21, 126538, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Victory
				{ 22, 126539, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Meditation
				{ 23, 126540, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Band of Contemplation
				{ 24, 126617, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Cruelty
				{ 25, 126618, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Accuracy
				{ 26, 126619, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Ruthlessness
				{ 27, 126642, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Dedication
				{ 28, 126643, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Warmongering Combatant's Signet of Endurance
				-- ilvl 625
				{ 101, 126656 }, -- Warmongering Aspirant's Ring of Cruelty
				{ 102, 126657 }, -- Warmongering Aspirant's Ring of Prowess
				{ 103, 126680 }, -- Warmongering Aspirant's Band of Cruelty
				{ 104, 126681 }, -- Warmongering Aspirant's Band of Prowess
				{ 105, 126682 }, -- Warmongering Aspirant's Band of Meditation
				{ 106, 126683 }, -- Warmongering Aspirant's Band of Contemplation
				{ 107, 126725 }, -- Warmongering Aspirant's Signet of Cruelty
				{ 108, 126728 }, -- Warmongering Aspirant's Signet of Dedication
				{ 109, 126729 }, -- Warmongering Aspirant's Signet of Endurance
				{ 110, 127121 }, -- Warmongering Aspirant's Signet of Accuracy
			},
		},
		{ -- Trinkets
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125970, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of markofhonor
				{ 2, 125975, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of Dominance
				{ 3, 125981, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of Victory
				{ 4, 125983, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of Adaptation
				{ 6, 125972, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Emblem of Cruelty
				{ 7, 125973, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Emblem of Tenacity
				{ 8, 125974, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Emblem of Meditation
				{ 10, 125971, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Insignia of markofhonor
				{ 11, 125976, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Insignia of Dominance
				{ 12, 125982, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Insignia of Victory
				{ 16, 125977, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Cruelty
				{ 17, 125979, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Tenacity
				{ 18, 125980, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Meditation
				{ 19, 127125, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Adaptation
				{ 21, 125984 }, -- Warmongering Gladiator's Accolade of markofhonor
				{ 22, 125985 }, -- Warmongering Gladiator's Accolade of Dominance
				{ 23, 125986 }, -- Warmongering Gladiator's Accolade of Victory
				{ 24, 125987 }, -- Warmongering Gladiator's Accolade of Meditation
				{ 25, 125988 }, -- Warmongering Gladiator's Accolade of Endurance
				-- ilvl 680
				{ 101, 126144, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of markofhonor
				{ 102, 126149, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of Dominance
				{ 103, 126155, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of Victory
				{ 104, 126157, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of Adaptation
				{ 106, 126146, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Emblem of Cruelty
				{ 107, 126147, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Emblem of Tenacity
				{ 108, 126148, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Emblem of Meditation
				{ 110, 126145, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Insignia of markofhonor
				{ 111, 126150, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Insignia of Dominance
				{ 112, 126156, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Insignia of Victory
				{ 116, 126151, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Cruelty
				{ 117, 126153, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Tenacity
				{ 118, 126154, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Meditation
				{ 119, 126152, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Adaptation
				{ 121, 126158 }, -- Warmongering Combatant's Accolade of markofhonor
				{ 122, 126159 }, -- Warmongering Combatant's Accolade of Dominance
				{ 123, 126160 }, -- Warmongering Combatant's Accolade of Victory
				{ 124, 126161 }, -- Warmongering Combatant's Accolade of Meditation
				{ 125, 126162 }, -- Warmongering Combatant's Accolade of Endurance
				-- ilvl 625
				{ 114, 126253 }, -- Warmongering Aspirant's Accolade of markofhonor
				{ 115, 126254 }, -- Warmongering Aspirant's Accolade of Dominance
				{ 127, 126255 }, -- Warmongering Aspirant's Accolade of Victory
				{ 128, 126256 }, -- Warmongering Aspirant's Accolade of Meditation
				{ 129, 126257 }, -- Warmongering Aspirant's Accolade of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126449, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of markofhonor
				{ 2, 126454, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of Dominance
				{ 3, 126458, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of Victory
				{ 4, 126460, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Badge of Adaptation
				{ 6, 126451, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Emblem of Cruelty
				{ 7, 126452, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Emblem of Tenacity
				{ 8, 126453, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Emblem of Meditation
				{ 10, 126450, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Insignia of markofhonor
				{ 11, 126455, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Insignia of Dominance
				{ 12, 126459, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Insignia of Victory
				{ 16, 127126, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Cruelty
				{ 17, 126456, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Tenacity
				{ 18, 126457, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Meditation
				{ 19, 125978, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Medallion of Adaptation
				{ 21, 126461 }, -- Warmongering Gladiator's Accolade of markofhonor
				{ 22, 126462 }, -- Warmongering Gladiator's Accolade of Dominance
				{ 23, 126463 }, -- Warmongering Gladiator's Accolade of Victory
				{ 24, 126464 }, -- Warmongering Gladiator's Accolade of Meditation
				{ 25, 126465 }, -- Warmongering Gladiator's Accolade of Endurance
				-- ilvl 680
				{ 101, 126621, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of markofhonor
				{ 102, 126626, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of Dominance
				{ 103, 126632, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of Victory
				{ 104, 126634, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Badge of Adaptation
				{ 106, 126623, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Emblem of Cruelty
				{ 107, 126624, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Emblem of Tenacity
				{ 108, 126625, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Emblem of Meditation
				{ 110, 126622, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Insignia of markofhonor
				{ 111, 126627, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Insignia of Dominance
				{ 112, 126633, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Insignia of Victory
				{ 116, 126628, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Cruelty
				{ 117, 126629, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Adaptation
				{ 118, 126630, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Tenacity
				{ 119, 126631, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Medallion of Meditation
				{ 121, 126635 }, -- Warmongering Combatant's Accolade of markofhonor
				{ 122, 126636 }, -- Warmongering Combatant's Accolade of Dominance
				{ 123, 126637 }, -- Warmongering Combatant's Accolade of Victory
				{ 124, 126638 }, -- Warmongering Combatant's Accolade of Meditation
				{ 125, 126639 }, -- Warmongering Combatant's Accolade of Endurance
				-- ilvl 625
				{ 114, 126730 }, -- Warmongering Aspirant's Accolade of markofhonor
				{ 115, 126731 }, -- Warmongering Aspirant's Accolade of Dominance
				{ 127, 126732 }, -- Warmongering Aspirant's Accolade of Victory
				{ 128, 126733 }, -- Warmongering Aspirant's Accolade of Meditation
				{ 129, 126734 }, -- Warmongering Aspirant's Accolade of Endurance
			},
		},
]]
--[[
		{ -- Miscellaneous
			name = AL["Miscellaneous"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 127369, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" }, -- Warmongering Gladiator's Tabard
				{ 3, 120286, [PRICE_EXTRA_ITTYPE] = "markofhonor:2500" }, -- Enchanter's Illusion - Glorious Tyranny
				{ 4, 120287, [PRICE_EXTRA_ITTYPE] = "markofhonor:2500" }, -- Enchanter's Illusion - Primal Victory
				-- ilvl 680
				-- ilvl 625
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- ilvl 710
				{ 1, 127371, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" }, -- Warmongering Gladiator's Tabard
				-- ilvl 680
				-- ilvl 625
			},
		},
]]
	},
}

data["WODS3WEAPONS"] = {
	name = string.format(AL["Warlords Season %d"], 3).." "..AL["Weapons"],
	ContentType = NORMAL_ITTYPE,
	items = {
--[[		{
			name = string.format(AL["ilvl %d"], 705).." "..AL["Elite"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
]]
		{
			name = string.format(AL["ilvl %d"], 710).." (740)",
			[ALLIANCE_DIFF] = {
				{ 1, 138635, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Warmongering Gladiator's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 125789, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Cleaver
				{ 4, 125951, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Hacker
				{ 5, 125792, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Pummeler
				{ 6, 125841, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Gavel
				{ 7, 125953, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Bonecracker
				{ 8, 125793, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Quickblade
				{ 9, 125842, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Mageblade
				{ 10, 125954, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Slicer
				{ 11, 125791, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Ripper
				{ 12, 125952, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Render
				{ 13, 125790, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Shanker
				{ 14, 125840, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Spellblade
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 125955, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Decapitator
				{ 18, 125956, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Bonegrinder
				{ 19, 125797, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Pike
				{ 20, 125957, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Greatsword
				{ 21, 125798, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Staff
				{ 22, 125845, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Battle Staff
				{ 23, 125846, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 125794, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Longbow
				{ 26, 125796, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Rifle
				{ 27, 125795, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Heavy Crossbow
				{ 28, 125843, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Baton of Light
				{ 29, 125844, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 125862, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Redoubt
				{ 103, 125863, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Barrier
				{ 104, 125965, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 125855, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Endgame
				{ 118, 125856, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 138636, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Warmongering Gladiator's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 126268, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Cleaver
				{ 4, 126430, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Hacker
				{ 5, 126271, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Pummeler
				{ 6, 126320, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Gavel
				{ 7, 126432, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Bonecracker
				{ 8, 126272, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Quickblade
				{ 9, 126321, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Mageblade
				{ 10, 126433, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Slicer
				{ 11, 126270, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Ripper
				{ 12, 126431, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Render
				{ 13, 126269, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Shanker
				{ 14, 126319, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Spellblade
				-- Two Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 126434, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Decapitator
				{ 18, 126435, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Bonegrinder
				{ 19, 126276, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Pike
				{ 20, 126436, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Greatsword
				{ 21, 126277, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Staff
				{ 22, 126324, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Battle Staff
				{ 23, 126325, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 126273, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Longbow
				{ 26, 126275, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Rifle
				{ 27, 126274, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Heavy Crossbow
				{ 28, 126322, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Baton of Light
				{ 29, 126323, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Gladiator's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 126341, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Redoubt
				{ 103, 126342, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Barrier
				{ 104, 126444, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 126334, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Endgame
				{ 118, 126335, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Gladiator's Reprieve
			},
		},
		{
			name = string.format(AL["ilvl %d"], 700).." (730)",
			[ALLIANCE_DIFF] = {
				{ 1, 138628, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Warmongering Combatant's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 125999, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Cleaver
				{ 4, 126129, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Hacker
				{ 5, 127379, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Chopper
				{ 6, 126002, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Pummeler
				{ 7, 126043, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Gavel
				{ 8, 126131, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Bonecracker
				{ 9, 126003, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Quickblade
				{ 10, 126044, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Mageblade
				{ 11, 126132, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Slicer
				{ 12, 126001, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Ripper
				{ 13, 126130, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Render
				{ 14, 126000, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Shanker
				{ 15, 126042, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Spellblade
				-- Two Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 126133, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Decapitator
				{ 18, 126134, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Bonegrinder
				{ 19, 126007, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Pike
				{ 20, 126135, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Greatsword
				{ 21, 126008, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Staff
				{ 22, 126047, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Battle Staff
				{ 23, 126048, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 126004, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Longbow
				{ 26, 126006, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Rifle
				{ 27, 126005, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Heavy Crossbow
				{ 28, 126045, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Baton of Light
				{ 29, 126046, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 126064, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Redoubt
				{ 103, 126065, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Barrier
				{ 104, 126143, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 126057, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Endgame
				{ 118, 126058, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 138629, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Warmongering Combatant's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 126476, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Cleaver
				{ 4, 126606, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Hacker
				{ 5, 127378, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Chopper
				{ 6, 126479, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Pummeler
				{ 7, 126520, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Gavel
				{ 8, 126608, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Bonecracker
				{ 9, 126480, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Quickblade
				{ 10, 126521, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Mageblade
				{ 11, 126609, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Slicer
				{ 12, 126478, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Ripper
				{ 13, 126607, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Render
				{ 14, 126477, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Shanker
				{ 15, 126519, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Spellblade
				-- Two Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 126610, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Decapitator
				{ 18, 126611, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Bonegrinder
				{ 19, 126484, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Pike
				{ 20, 126612, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Greatsword
				{ 21, 126485, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Staff
				{ 22, 126524, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Battle Staff
				{ 23, 126525, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 126481, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Longbow
				{ 26, 126483, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Rifle
				{ 27, 126482, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Heavy Crossbow
				{ 28, 126522, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Baton of Light
				{ 29, 126523, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Warmongering Combatant's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 126541, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Redoubt
				{ 103, 126542, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Barrier
				{ 104, 126620, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 126534, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Endgame
				{ 118, 126535, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Warmongering Combatant's Reprieve
			},
		},
	},
}

data["WODS2SETS"] = {
	name = string.format(AL["Warlords Season %d"], 2).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 138515, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Dreadplate Armor
				{ 2, 124713, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dreadplate Helm
				{ 3, 124715, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dreadplate Shoulders
				{ 4, 124711, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dreadplate Chestpiece
				{ 5, 124712, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dreadplate Gauntlets
				{ 6, 124714, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dreadplate Legguards
				{ 16, 138601, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Dreadplate Armor
				{ 17, 124915, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dreadplate Helm
				{ 18, 124917, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dreadplate Shoulders
				{ 19, 124913, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dreadplate Chestpiece
				{ 20, 124914, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dreadplate Gauntlets
				{ 21, 124916, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dreadplate Legguards
				--[[
				{ 16, 125072  }, -- Wild Aspirant's Dreadplate Helm
				{ 17, 125074  }, -- Wild Aspirant's Dreadplate Shoulders
				{ 18, 125070  }, -- Wild Aspirant's Dreadplate Chestpiece
				{ 19, 125071  }, -- Wild Aspirant's Dreadplate Gauntlets
				{ 20, 125073  }, -- Wild Aspirant's Dreadplate Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138516, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Dreadplate Armor
				{ 2, 125192, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dreadplate Helm
				{ 3, 125194, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dreadplate Shoulders
				{ 4, 125190, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dreadplate Chestpiece
				{ 5, 125191, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dreadplate Gauntlets
				{ 6, 125193, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dreadplate Legguards
				{ 16, 138602, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Dreadplate Armor
				{ 17, 125392, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dreadplate Helm
				{ 18, 125394, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dreadplate Shoulders
				{ 19, 125390, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dreadplate Chestpiece
				{ 20, 125391, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dreadplate Gauntlets
				{ 21, 125393, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dreadplate Legguards
				--[[
				{ 16, 125549  }, -- Wild Aspirant's Dreadplate Helm
				{ 17, 125551  }, -- Wild Aspirant's Dreadplate Shoulders
				{ 18, 125547  }, -- Wild Aspirant's Dreadplate Chestpiece
				{ 19, 125548  }, -- Wild Aspirant's Dreadplate Gauntlets
				{ 20, 125550  }, -- Wild Aspirant's Dreadplate Legguards
				]]
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 138523, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Dragonhide Armor
				{ 2, 124717, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dragonhide Helm
				{ 3, 124720, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dragonhide Spaulders
				{ 4, 124719, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dragonhide Robes
				{ 5, 124716, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dragonhide Gloves
				{ 6, 124718, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dragonhide Legguards
				{ 16, 138603, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Scaled Armor
				{ 17, 124919, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dragonhide Helm
				{ 18, 124922, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dragonhide Spaulders
				{ 19, 124921, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dragonhide Tunic
				{ 20, 124918, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dragonhide Gloves
				{ 21, 124920, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dragonhide Legguards
				--[[
				{ 16, 125076  }, -- Wild Aspirant's Dragonhide Helm
				{ 17, 125079  }, -- Wild Aspirant's Dragonhide Spaulders
				{ 18, 125078  }, -- Wild Aspirant's Dragonhide Tunic
				{ 19, 125075  }, -- Wild Aspirant's Dragonhide Gloves
				{ 20, 125077  }, -- Wild Aspirant's Dragonhide Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138524, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Dragonhide Armor
				{ 2, 125196, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dragonhide Helm
				{ 3, 125199, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dragonhide Spaulders
				{ 4, 125198, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dragonhide Tunic
				{ 5, 125195, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Dragonhide Gloves
				{ 6, 125197, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Dragonhide Legguards
				{ 16, 138604, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Scaled Armor
				{ 17, 125396, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dragonhide Helm
				{ 18, 125399, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dragonhide Spaulders
				{ 19, 125398, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dragonhide Tunic
				{ 20, 125395, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Dragonhide Gloves
				{ 21, 125397, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Dragonhide Legguards
				--[[
				{ 16, 125553  }, -- Wild Aspirant's Dragonhide Helm
				{ 17, 125556  }, -- Wild Aspirant's Dragonhide Spaulders
				{ 18, 125555  }, -- Wild Aspirant's Dragonhide Tunic
				{ 19, 125552  }, -- Wild Aspirant's Dragonhide Gloves
				{ 20, 125554  }, -- Wild Aspirant's Dragonhide Legguards
				]]
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 138521, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Chain Armor
				{ 2, 124723, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Chain Helm
				{ 3, 124725, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Chain Spaulders
				{ 4, 124721, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Chain Armor
				{ 5, 124722, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Chain Gauntlets
				{ 6, 124724, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Chain Leggings
				{ 16, 138547, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Chain Armor
				{ 17, 124925, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Chain Helm
				{ 18, 124927, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Chain Spaulders
				{ 19, 124923, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Chain Armor
				{ 20, 124924, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Chain Gauntlets
				{ 21, 124926, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Chain Leggings
				--[[
				{ 16, 125082  }, -- Wild Aspirant's Chain Helm
				{ 17, 125084  }, -- Wild Aspirant's Chain Spaulders
				{ 18, 125080  }, -- Wild Aspirant's Chain Armor
				{ 19, 125081  }, -- Wild Aspirant's Chain Gauntlets
				{ 20, 125083  }, -- Wild Aspirant's Chain Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138522, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Chain Armor
				{ 2, 125202, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Chain Helm
				{ 3, 125204, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Chain Spaulders
				{ 4, 125200, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Chain Armor
				{ 5, 125201, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Chain Gauntlets
				{ 6, 125203, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Chain Leggings
				{ 16, 138548, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Chain Armor
				{ 17, 125402, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Chain Helm
				{ 18, 125404, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Chain Spaulders
				{ 19, 125400, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Chain Armor
				{ 20, 125401, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Chain Gauntlets
				{ 21, 125403, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Chain Leggings
				--[[
				{ 16, 125559  }, -- Wild Aspirant's Chain Helm
				{ 17, 125561  }, -- Wild Aspirant's Chain Spaulders
				{ 18, 125557  }, -- Wild Aspirant's Chain Armor
				{ 19, 125558  }, -- Wild Aspirant's Chain Gauntlets
				{ 20, 125560  }, -- Wild Aspirant's Chain Leggings
				]]
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 138529, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Silk Armor
				{ 2, 124770, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Silk Cowl
				{ 3, 124773, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Silk Amice
				{ 4, 124772, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Silk Robe
				{ 5, 124769, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Silk Handguards
				{ 6, 124771, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Silk Trousers
				{ 16, 138549, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Silk Armor
				{ 17, 124964, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Silk Cowl
				{ 18, 124967, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Silk Amice
				{ 19, 124966, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Silk Robe
				{ 20, 124963, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Silk Handguards
				{ 21, 124965, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Silk Trousers
				--[[
				{ 16, 125097  }, -- Wild Aspirant's Silk Cowl
				{ 17, 125100  }, -- Wild Aspirant's Silk Amice
				{ 18, 125099  }, -- Wild Aspirant's Silk Robe
				{ 19, 125096  }, -- Wild Aspirant's Silk Handguards
				{ 20, 125098  }, -- Wild Aspirant's Silk Trousers
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138530, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Silk Armor
				{ 2, 125249, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Silk Cowl
				{ 3, 125252, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Silk Amice
				{ 4, 125251, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Silk Robe
				{ 5, 125248, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Silk Handguards
				{ 6, 125250, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Silk Trousers
				{ 16, 138550, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Silk Armor
				{ 17, 125441, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Silk Cowl
				{ 18, 125444, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Silk Amice
				{ 19, 125443, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Silk Robe
				{ 20, 125440, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Silk Handguards
				{ 21, 125442, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Silk Trousers
				--[[
				{ 16, 125574  }, -- Wild Aspirant's Silk Cowl
				{ 17, 125577  }, -- Wild Aspirant's Silk Amice
				{ 18, 125576  }, -- Wild Aspirant's Silk Robe
				{ 19, 125573  }, -- Wild Aspirant's Silk Handguards
				{ 20, 125575  }, -- Wild Aspirant's Silk Trousers
				]]
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 138525, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Ironskin Armor
				{ 2, 124794, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ironskin Helm
				{ 3, 124796, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ironskin Spaulders
				{ 4, 124797, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ironskin Tunic
				{ 5, 124793, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ironskin Gloves
				{ 6, 124795, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ironskin Legguards
				{ 16, 138607, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Ironskin Armor
				{ 17, 124980, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ironskin Helm
				{ 18, 124982, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ironskin Spaulders
				{ 19, 124983, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ironskin Tunic
				{ 20, 124979, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ironskin Gloves
				{ 21, 124981, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ironskin Legguards
				--[[
				{ 16, 125105  }, -- Wild Aspirant's Ironskin Helm
				{ 17, 125107  }, -- Wild Aspirant's Ironskin Spaulders
				{ 18, 125108  }, -- Wild Aspirant's Ironskin Tunic
				{ 19, 125104  }, -- Wild Aspirant's Ironskin Gloves
				{ 20, 125106  }, -- Wild Aspirant's Ironskin Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138526, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Ironskin Armor
				{ 2, 125273, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ironskin Helm
				{ 3, 125275, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ironskin Spaulders
				{ 4, 125276, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ironskin Tunic
				{ 5, 125272, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ironskin Gloves
				{ 6, 125274, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ironskin Legguards
				{ 16, 138608, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Ironskin Armor
				{ 17, 125457, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ironskin Helm
				{ 18, 125459, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ironskin Spaulders
				{ 19, 125460, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ironskin Tunic
				{ 20, 125456, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ironskin Gloves
				{ 21, 125458, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ironskin Legguards
				--[[
				{ 16, 125582  }, -- Wild Aspirant's Ironskin Helm
				{ 17, 125584  }, -- Wild Aspirant's Ironskin Spaulders
				{ 18, 125585  }, -- Wild Aspirant's Ironskin Tunic
				{ 19, 125581  }, -- Wild Aspirant's Ironskin Gloves
				{ 20, 125583  }, -- Wild Aspirant's Ironskin Legguards
				]]
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 138517, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Scaled Armor
				{ 2, 124800, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Scaled Helm
				{ 3, 124802, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Scaled Shoulders
				{ 4, 124798, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Scaled Chestpiece
				{ 5, 124799, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Scaled Gauntlets
				{ 6, 124801, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Scaled Legguards
				{ 16, 138603, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Scaled Armor
				{ 17, 124986, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Scaled Helm
				{ 18, 124988, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Scaled Shoulders
				{ 19, 124984, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Scaled Chestpiece
				{ 20, 124985, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Scaled Gauntlets
				{ 21, 124987, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Scaled Legguards
				--[[
				{ 16, 125111  }, -- Wild Aspirant's Scaled Helm
				{ 17, 125113  }, -- Wild Aspirant's Scaled Shoulders
				{ 18, 125109  }, -- Wild Aspirant's Scaled Chestpiece
				{ 19, 125110  }, -- Wild Aspirant's Scaled Gauntlets
				{ 20, 125112  }, -- Wild Aspirant's Scaled Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138518, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Scaled Armor
				{ 2, 125279, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Scaled Helm
				{ 3, 125281, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Scaled Shoulders
				{ 4, 125277, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Scaled Chestpiece
				{ 5, 125278, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Scaled Gauntlets
				{ 6, 125280, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Scaled Legguards
				{ 16, 138603, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Scaled Armor
				{ 17, 125463, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Scaled Helm
				{ 18, 125465, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Scaled Shoulders
				{ 19, 125461, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Scaled Chestpiece
				{ 20, 125462, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Scaled Gauntlets
				{ 21, 125464, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Scaled Legguards
				--[[
				{ 16, 125588  }, -- Wild Aspirant's Scaled Helm
				{ 17, 125590  }, -- Wild Aspirant's Scaled Shoulders
				{ 18, 125586  }, -- Wild Aspirant's Scaled Chestpiece
				{ 19, 125587  }, -- Wild Aspirant's Scaled Gauntlets
				{ 20, 125589  }, -- Wild Aspirant's Scaled Legguards
				]]
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 138531, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Satin Armor
				{ 2, 124823, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Satin Hood
				{ 3, 124826, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Satin Mantle
				{ 4, 124825, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Satin Robe
				{ 5, 124822, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Satin Gloves
				{ 6, 124824, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Satin Leggings
				{ 16, 138551, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Satin Armor
				{ 17, 125001, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Satin Hood
				{ 18, 125004, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Satin Mantle
				{ 19, 125003, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Satin Robe
				{ 20, 125000, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Satin Gloves
				{ 21, 125002, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Satin Leggings
				--[[
				{ 16, 125118  }, -- Wild Aspirant's Satin Hood
				{ 17, 125121  }, -- Wild Aspirant's Satin Mantle
				{ 18, 125120  }, -- Wild Aspirant's Satin Robe
				{ 19, 125117  }, -- Wild Aspirant's Satin Gloves
				{ 20, 125119  }, -- Wild Aspirant's Satin Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138532, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Satin Armor
				{ 2, 125302, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Satin Hood
				{ 3, 125305, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Satin Mantle
				{ 4, 125304, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Satin Robe
				{ 5, 125301, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Satin Gloves
				{ 6, 125303, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Satin Leggings
				{ 16, 138552, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Satin Armor
				{ 17, 125478, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Satin Hood
				{ 18, 125481, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Satin Mantle
				{ 19, 125480, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Satin Robe
				{ 20, 125477, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Satin Gloves
				{ 21, 125479, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Satin Leggings
				--[[
				{ 16, 125595  }, -- Wild Aspirant's Satin Hood
				{ 17, 125598  }, -- Wild Aspirant's Satin Mantle
				{ 18, 125597  }, -- Wild Aspirant's Satin Robe
				{ 19, 125594  }, -- Wild Aspirant's Satin Gloves
				{ 20, 125596  }, -- Wild Aspirant's Satin Leggings
				]]
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 138527, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Leather Armor
				{ 2, 124829, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Leather Helm
				{ 3, 124831, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Leather Spaulders
				{ 4, 124827, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Leather Tunic
				{ 5, 124828, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Leather Gloves
				{ 6, 124830, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Leather Legguards
				{ 16, 138609, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Leather Armor
				{ 17, 125007, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Leather Helm
				{ 18, 125009, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Leather Spaulders
				{ 19, 125005, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Leather Tunic
				{ 20, 125006, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Leather Gloves
				{ 21, 125008, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Leather Legguards
				--[[
				{ 16, 125124  }, -- Wild Aspirant's Leather Helm
				{ 17, 125126  }, -- Wild Aspirant's Leather Spaulders
				{ 18, 125122  }, -- Wild Aspirant's Leather Tunic
				{ 19, 125123  }, -- Wild Aspirant's Leather Gloves
				{ 20, 125125  }, -- Wild Aspirant's Leather Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138528, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Leather Armor
				{ 2, 125308, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Leather Helm
				{ 3, 125310, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Leather Spaulders
				{ 4, 125306, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Leather Tunic
				{ 5, 125307, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Leather Gloves
				{ 6, 125309, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Leather Legguards
				{ 16, 138609, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Leather Armor
				{ 17, 125484, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Leather Helm
				{ 18, 125486, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Leather Spaulders
				{ 19, 125482, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Leather Tunic
				{ 20, 125483, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Leather Gloves
				{ 21, 125485, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Leather Legguards
				--[[
				{ 16, 125601  }, -- Wild Aspirant's Leather Helm
				{ 17, 125603  }, -- Wild Aspirant's Leather Spaulders
				{ 18, 125599  }, -- Wild Aspirant's Leather Tunic
				{ 19, 125600  }, -- Wild Aspirant's Leather Gloves
				{ 20, 125602  }, -- Wild Aspirant's Leather Legguards
				]]
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 138519, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Ringmail Armor
				{ 2, 124834, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ringmail Helm
				{ 3, 124836, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ringmail Spaulders
				{ 4, 124832, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ringmail Armor
				{ 5, 124833, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ringmail Gauntlets
				{ 6, 124835, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ringmail Leggings
				{ 16, 138545, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Ringmail Armor
				{ 17, 125012, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ringmail Helm
				{ 18, 125014, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ringmail Spaulders
				{ 19, 125010, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ringmail Armor
				{ 20, 125011, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ringmail Gauntlets
				{ 21, 125013, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ringmail Leggings
				--[[
				{ 16, 125129  }, -- Wild Aspirant's Ringmail Helm
				{ 17, 125131  }, -- Wild Aspirant's Ringmail Spaulders
				{ 18, 125127  }, -- Wild Aspirant's Ringmail Armor
				{ 19, 125128  }, -- Wild Aspirant's Ringmail Gauntlets
				{ 20, 125130  }, -- Wild Aspirant's Ringmail Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138520, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Ringmail Armor
				{ 2, 125313, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ringmail Helm
				{ 3, 125315, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ringmail Spaulders
				{ 4, 125311, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ringmail Armor
				{ 5, 125312, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Ringmail Gauntlets
				{ 6, 125314, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Ringmail Leggings
				{ 16, 138545, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Ringmail Armor
				{ 17, 125489, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ringmail Helm
				{ 18, 125491, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ringmail Spaulders
				{ 19, 125487, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ringmail Armor
				{ 20, 125488, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Ringmail Gauntlets
				{ 21, 125490, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Ringmail Leggings
				--[[
				{ 16, 125606  }, -- Wild Aspirant's Ringmail Helm
				{ 17, 125608  }, -- Wild Aspirant's Ringmail Spaulders
				{ 18, 125604  }, -- Wild Aspirant's Ringmail Armor
				{ 19, 125605  }, -- Wild Aspirant's Ringmail Gauntlets
				{ 20, 125607  }, -- Wild Aspirant's Ringmail Leggings
				]]
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 138533, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Felweave Armor
				{ 2, 124876, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Felweave Cowl
				{ 3, 124879, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Felweave Amice
				{ 4, 124878, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Felweave Raiment
				{ 5, 124875, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Felweave Handguards
				{ 6, 124877, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Felweave Trousers
				{ 16, 138553, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Felweave Armor
				{ 17, 125054, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Felweave Cowl
				{ 18, 125057, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Felweave Amice
				{ 19, 125056, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Felweave Raiment
				{ 20, 125053, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Felweave Handguards
				{ 21, 125055, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Felweave Trousers
				--[[
				{ 16, 125145  }, -- Wild Aspirant's Felweave Cowl
				{ 17, 125148  }, -- Wild Aspirant's Felweave Amice
				{ 18, 125147  }, -- Wild Aspirant's Felweave Raiment
				{ 19, 125144  }, -- Wild Aspirant's Felweave Handguards
				{ 20, 125146  }, -- Wild Aspirant's Felweave Trousers
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138534, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Felweave Armor
				{ 2, 125353, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Felweave Cowl
				{ 3, 125356, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Felweave Amice
				{ 4, 125355, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Felweave Raiment
				{ 5, 125352, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Felweave Handguards
				{ 6, 125354, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Felweave Trousers
				{ 16, 138554, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Felweave Armor
				{ 17, 125531, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Felweave Cowl
				{ 18, 125534, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Felweave Amice
				{ 19, 125533, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Felweave Raiment
				{ 20, 125530, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Felweave Handguards
				{ 21, 125532, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Felweave Trousers
				--[[
				{ 16, 125622  }, -- Wild Aspirant's Felweave Cowl
				{ 17, 125625  }, -- Wild Aspirant's Felweave Amice
				{ 18, 125624  }, -- Wild Aspirant's Felweave Raiment
				{ 19, 125621  }, -- Wild Aspirant's Felweave Handguards
				{ 20, 125623  }, -- Wild Aspirant's Felweave Trousers
				]]
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 138513, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Plate Armor
				{ 2, 124882, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Plate Helm
				{ 3, 124884, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Plate Shoulders
				{ 4, 124880, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Plate Chestpiece
				{ 5, 124881, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Plate Gauntlets
				{ 6, 124883, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Plate Legguards
				{ 16, 138599, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Plate Armor
				{ 17, 125060, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Plate Helm
				{ 18, 125062, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Plate Shoulders
				{ 19, 125058, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Plate Chestpiece
				{ 20, 125059, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Plate Gauntlets
				{ 21, 125061, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Plate Legguards
				--[[
				{ 16, 125151  }, -- Wild Aspirant's Plate Helm
				{ 17, 125153  }, -- Wild Aspirant's Plate Shoulders
				{ 18, 125149  }, -- Wild Aspirant's Plate Chestpiece
				{ 19, 125150  }, -- Wild Aspirant's Plate Gauntlets
				{ 20, 125152  }, -- Wild Aspirant's Plate Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138514, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Gladiator's Plate Armor
				{ 2, 125359, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Plate Helm
				{ 3, 125361, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Plate Shoulders
				{ 4, 125357, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Plate Chestpiece
				{ 5, 125358, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Gladiator's Plate Gauntlets
				{ 6, 125360, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Gladiator's Plate Legguards
				{ 16, 138599, [PRICE_EXTRA_ITTYPE] = "markofhonor:12"  }, -- Ensemble: Wild Combatant's Plate Armor
				{ 17, 125537, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Plate Helm
				{ 18, 125539, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Plate Shoulders
				{ 19, 125535, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Plate Chestpiece
				{ 20, 125536, [PRICE_EXTRA_ITTYPE] = "markofhonor:2"  }, -- Wild Combatant's Plate Gauntlets
				{ 21, 125538, [PRICE_EXTRA_ITTYPE] = "markofhonor:3"  }, -- Wild Combatant's Plate Legguards
				--[[
				{ 16, 125628  }, -- Wild Aspirant's Plate Helm
				{ 17, 125630  }, -- Wild Aspirant's Plate Shoulders
				{ 18, 125626  }, -- Wild Aspirant's Plate Chestpiece
				{ 19, 125627  }, -- Wild Aspirant's Plate Gauntlets
				{ 20, 125629  }, -- Wild Aspirant's Plate Legguards
				]]
			},
		},
	},
}

data["WODS2NONSETGEAR"] = {
	name = string.format(AL["Warlords Season %d"], 2).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- Cloth
			name = AL["Cloth"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124761, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Helm
				{ 2, 124766, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Headcover
				{ 4, 124763, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Spaulders
				{ 5, 124768, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Pauldrons
				{ 7, 124759, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Tunic
				{ 8, 124764, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Chestguard
				{ 10, 124760, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gloves
				{ 11, 124765, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Grips
				{ 16, 124762, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Legguards
				{ 17, 124767, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 18, 124756, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Cruelty
				{ 19, 124757, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Prowess
				{ 20, 124758, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Victory
				{ 22, 124750, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 124751, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 124752, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Victory
				{ 26, 124753, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 124754, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 124755, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				--{ 101, 124960 }, -- Wild Combatant's Helm
				--{ 103, 124962 }, -- Wild Combatant's Spaulders
				--{ 105, 124958 }, -- Wild Combatant's Tunic
				--{ 107, 124959 }, -- Wild Combatant's Gloves
				{ 101, 124956, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Cruelty
				{ 102, 124957, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Prowess
				--{ 112, 124961 }, -- Wild Combatant's Legguards
				{ 104, 124952, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Prowess
				{ 105, 124953, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Cruelty
				{ 106, 124954, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Cruelty
				{ 107, 124955, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				--{ 119, 125095 }, -- Wild Aspirant's Bindings of Cruelty
				--{ 121, 125093 }, -- Wild Aspirant's Belt of Prowess
				--{ 123, 125094 }, -- Wild Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125240, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Helm
				{ 2, 125245, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Headcover
				{ 4, 125242, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Spaulders
				{ 5, 125247, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Pauldrons
				{ 7, 125238, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Tunic
				{ 8, 125243, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Chestguard
				{ 10, 125239, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gloves
				{ 11, 125244, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Grips
				{ 16, 125235, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Cruelty
				{ 17, 125236, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Prowess
				{ 18, 125237, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Victory
				{ 19, 125241, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Legguards
				{ 20, 125246, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 22, 125229, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 125230, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 125231, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Victory
				{ 26, 125232, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 125233, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 125234, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				--{ 101, 125437 }, -- Wild Combatant's Helm
				--{ 103, 125439 }, -- Wild Combatant's Spaulders
				--{ 105, 125435 }, -- Wild Combatant's Tunic
				--{ 107, 125436 }, -- Wild Combatant's Gloves
				{ 101, 125433, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Cruelty
				{ 102, 125434, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Prowess
				--{ 112, 125438 }, -- Wild Combatant's Legguards
				{ 104, 125429, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Prowess
				{ 105, 125430, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Cruelty
				{ 106, 125431, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Cruelty
				{ 107, 125432, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				--{ 119, 125572 }, -- Wild Aspirant's Bindings of Cruelty
				--{ 121, 125570 }, -- Wild Aspirant's Belt of Prowess
				--{ 123, 125571 }, -- Wild Aspirant's Boots of Cruelty
			},
		},
		{ -- Leather
			name = AL["Leather"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124761, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Helm
				{ 2, 124766, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Headcover
				{ 4, 124763, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Spaulders
				{ 5, 124768, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Pauldrons
				{ 7, 124759, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Tunic
				{ 8, 124764, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Chestguard
				{ 10, 124760, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gloves
				{ 11, 124765, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Grips
				{ 16, 124762, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Legguards
				{ 17, 124767, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 18, 124756, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Cruelty
				{ 19, 124757, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Prowess
				{ 20, 124758, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Victory
				{ 22, 124750, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 124751, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 124752, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Victory
				{ 26, 124753, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 124754, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 124755, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				--{ 101, 124960 }, -- Wild Combatant's Helm
				--{ 103, 124962 }, -- Wild Combatant's Spaulders
				--{ 105, 124958 }, -- Wild Combatant's Tunic
				--{ 107, 124959 }, -- Wild Combatant's Gloves
				{ 101, 124956, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Cruelty
				{ 102, 124957, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Prowess
				--{ 112, 124961 }, -- Wild Combatant's Legguards
				{ 104, 124952, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Prowess
				{ 105, 124953, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Cruelty
				{ 106, 124954, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Cruelty
				{ 107, 124955, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				--{ 119, 125095 }, -- Wild Aspirant's Bindings of Cruelty
				--{ 121, 125093 }, -- Wild Aspirant's Belt of Prowess
				--{ 123, 125094 }, -- Wild Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125240, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Helm
				{ 2, 125245, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Headcover
				{ 4, 125242, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Spaulders
				{ 5, 125247, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Pauldrons
				{ 7, 125238, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Tunic
				{ 8, 125243, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Chestguard
				{ 10, 125239, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gloves
				{ 11, 125244, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Grips
				{ 16, 125235, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Cruelty
				{ 17, 125236, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Prowess
				{ 18, 125237, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Bindings of Victory
				{ 19, 125241, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Legguards
				{ 20, 125246, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 22, 125229, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 125230, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 125231, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Belt of Victory
				{ 26, 125232, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 125233, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 125234, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				--{ 101, 125437 }, -- Wild Combatant's Helm
				--{ 103, 125439 }, -- Wild Combatant's Spaulders
				--{ 105, 125435 }, -- Wild Combatant's Tunic
				--{ 107, 125436 }, -- Wild Combatant's Gloves
				{ 101, 125433, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Cruelty
				{ 102, 125434, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Bindings of Prowess
				--{ 112, 125438 }, -- Wild Combatant's Legguards
				{ 104, 125429, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Prowess
				{ 105, 125430, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Belt of Cruelty
				{ 106, 125431, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Cruelty
				{ 107, 125432, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				--{ 119, 125572 }, -- Wild Aspirant's Bindings of Cruelty
				--{ 121, 125570 }, -- Wild Aspirant's Belt of Prowess
				--{ 123, 125571 }, -- Wild Aspirant's Boots of Cruelty
			},
		},
		{ -- Mail
			name = AL["Mail"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124785, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Helm
				{ 2, 124790, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Coif
				{ 4, 124787, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Spaulders
				{ 5, 124792, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Pauldrons
				{ 7, 124783, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Armor
				{ 8, 124788, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Chestguard
				{ 10, 124784, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gauntlets
				{ 11, 124789, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gloves
				{ 16, 124780, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armbands of Prowess
				{ 17, 124781, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armbands of Cruelty
				{ 18, 124782, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armbands of Victory
				{ 19, 124786, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 20, 124791, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 22, 124774, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Waistguard of Cruelty
				{ 23, 124775, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Waistguard of Prowess
				{ 24, 124776, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Waistguard of Victory
				{ 26, 124777, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Footguards of Cruelty
				{ 27, 124778, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Footguards of Prowess
				{ 28, 124779, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Footguards of Victory
				-- ilvl 670
				--{ 101, 124976 }, -- Wild Combatant's Helm
				--{ 103, 124978 }, -- Wild Combatant's Spaulders
				--{ 105, 124974 }, -- Wild Combatant's Armor
				--{ 107, 124975 }, -- Wild Combatant's Gauntlets
				{ 101, 124972, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armbands of Prowess
				{ 102, 124973, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armbands of Cruelty
				--{ 112, 124977 }, -- Wild Combatant's Leggings
				{ 104, 124968, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Waistguard of Cruelty
				{ 105, 124969, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Waistguard of Prowess
				{ 106, 124970, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Footguards of Cruelty
				{ 107, 124971, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Footguards of Prowess
				-- ilvl 625
				--{ 119, 125103 }, -- Wild Aspirant's Armbands of Prowess
				--{ 121, 125101 }, -- Wild Aspirant's Waistguard of Cruelty
				--{ 123, 125102 }, -- Wild Aspirant's Footguards of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125264, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Helm
				{ 2, 125269, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Coif
				{ 4, 125266, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Spaulders
				{ 5, 125271, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Pauldrons
				{ 7, 125262, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Armor
				{ 8, 125267, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Chestguard
				{ 10, 125263, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gauntlets
				{ 11, 125268, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Gloves
				{ 16, 125259, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armbands of Prowess
				{ 17, 125260, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armbands of Cruelty
				{ 18, 125261, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armbands of Victory
				{ 19, 125265, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 20, 125270, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Leggings
				{ 22, 125253, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Waistguard of Cruelty
				{ 23, 125254, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Waistguard of Prowess
				{ 24, 125255, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Waistguard of Victory
				{ 26, 125256, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Footguards of Cruelty
				{ 27, 125257, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Footguards of Prowess
				{ 28, 125258, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Footguards of Victory
				-- ilvl 670
				--{ 101, 125453 }, -- Wild Combatant's Helm
				--{ 103, 125455 }, -- Wild Combatant's Spaulders
				--{ 105, 125451 }, -- Wild Combatant's Armor
				--{ 107, 125452 }, -- Wild Combatant's Gauntlets
				{ 101, 125449, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armbands of Prowess
				{ 102, 125450, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armbands of Cruelty
				--{ 112, 125454 }, -- Wild Combatant's Leggings
				{ 104, 125445, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Waistguard of Cruelty
				{ 105, 125446, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Waistguard of Prowess
				{ 106, 125447, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Footguards of Cruelty
				{ 107, 125448, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Footguards of Prowess
				-- ilvl 625
				--{ 119, 125580 }, -- Wild Aspirant's Armbands of Prowess
				--{ 121, 125578 }, -- Wild Aspirant's Waistguard of Cruelty
				--{ 123, 125579 }, -- Wild Aspirant's Footguards of Cruelty
			},
		},
		{ -- Plate
			name = AL["Plate"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124814, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Helmet
				{ 2, 124819, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Visor
				{ 4, 124816, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Shoulderplates
				{ 5, 124821, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Plate Pauldrons
				{ 7, 124812, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Breastplate
				{ 8, 124817, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Chestguard
				{ 10, 124813, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Plate Gloves
				{ 11, 124818, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Plate Grips
				{ 16, 124809, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armplates of Cruelty
				{ 17, 124810, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armplates of Prowess
				{ 18, 124811, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armplates of Victory
				{ 19, 124815, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Legplates
				{ 20, 124820, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Leggings
				{ 22, 124803, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Girdle of Cruelty
				{ 23, 124804, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Girdle of Prowess
				{ 24, 124805, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Girdle of Victory
				{ 26, 124806, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Warboots of Cruelty
				{ 27, 124807, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Warboots of Prowess
				{ 28, 124808, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Warboots of Victory
				-- ilvl 670
				--{ 101, 124997 }, -- Wild Combatant's Plate Helmet
				--{ 103, 124999 }, -- Wild Combatant's Shoulderplates
				--{ 105, 124995 }, -- Wild Combatant's Plate Breastplate
				--{ 107, 124996 }, -- Wild Combatant's Plate Gloves
				{ 101, 124993, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armplates of Cruelty
				{ 102, 124994, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armplates of Prowess
				--{ 112, 124998 }, -- Wild Combatant's Legplates
				{ 104, 124989, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Girdle of Cruelty
				{ 105, 124990, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Girdle of Prowess
				{ 106, 124991, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Warboots of Cruelty
				{ 107, 124992, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Warboots of Prowess
				-- ilvl 625
				--{ 119, 125116 }, -- Wild Aspirant's Armplates of Cruelty
				--{ 121, 125114 }, -- Wild Aspirant's Girdle of Cruelty
				--{ 123, 125115 }, -- Wild Aspirant's Warboots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125293, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Helmet
				{ 2, 125298, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Visor
				{ 4, 125295, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Shoulderplates
				{ 5, 125300, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Plate Pauldrons
				{ 7, 125291, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Breastplate
				{ 8, 125296, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Chestguard
				{ 10, 125292, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Plate Gloves
				{ 11, 125297, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Plate Grips
				{ 16, 125288, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armplates of Cruelty
				{ 17, 125289, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armplates of Prowess
				{ 18, 125290, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Armplates of Victory
				{ 19, 125294, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Legplates
				{ 20, 125299, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Wild Gladiator's Plate Leggings
				{ 22, 125282, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Girdle of Cruelty
				{ 23, 125283, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Girdle of Prowess
				{ 24, 125284, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Girdle of Victory
				{ 26, 125285, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Warboots of Cruelty
				{ 27, 125286, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Warboots of Prowess
				{ 28, 125287, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Warboots of Victory
				-- ilvl 670
				--{ 101, 125474 }, -- Wild Combatant's Plate Helmet
				--{ 103, 125476 }, -- Wild Combatant's Shoulderplates
				--{ 105, 125472 }, -- Wild Combatant's Plate Breastplate
				--{ 107, 125473 }, -- Wild Combatant's Plate Gloves
				{ 101, 125470, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armplates of Cruelty
				{ 102, 125471, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Armplates of Prowess
				--{ 112, 125475 }, -- Wild Combatant's Legplates
				{ 104, 125466, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Girdle of Cruelty
				{ 105, 125467, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Girdle of Prowess
				{ 106, 125468, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Warboots of Cruelty
				{ 107, 125469, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Warboots of Prowess
				-- ilvl 625
				--{ 119, 125593 }, -- Wild Aspirant's Armplates of Cruelty
				--{ 121, 125591 }, -- Wild Aspirant's Girdle of Cruelty
				--{ 123, 125592 }, -- Wild Aspirant's Warboots of Cruelty
			},
		},
	--[[
		{ -- Amulets
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124687, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Necklace of Cruelty
				{ 2, 124688, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Necklace of Prowess
				{ 3, 124737, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Cruelty
				{ 4, 124738, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Prowess
				{ 5, 124739, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Meditation
				{ 6, 124740, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Contemplation
				{ 7, 124846, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Choker of Cruelty
				{ 8, 124847, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Choker of Prowess
				{ 9, 124853, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Choker of Endurance
				-- ilvl 670
				{ 16, 124897, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Necklace of Cruelty
				{ 17, 124898, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Necklace of Prowess
				{ 18, 124939, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Cruelty
				{ 19, 124940, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Prowess
				{ 20, 124941, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Meditation
				{ 21, 124942, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Contemplation
				{ 22, 125024, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Choker of Cruelty
				{ 23, 125025, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Choker of Prowess
				{ 24, 125050, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Choker of Endurance
				-- ilvl 625
				{ 26, 125064 }, -- Wild Aspirant's Necklace of Cruelty
				{ 27, 125087 }, -- Wild Aspirant's Pendant of Cruelty
				{ 28, 125088 }, -- Wild Aspirant's Pendant of Meditation
				{ 29, 125133 }, -- Wild Aspirant's Choker of Cruelty
				{ 30, 125136 }, -- Wild Aspirant's Choker of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125166, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Necklace of Cruelty
				{ 2, 125167, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Necklace of Prowess
				{ 3, 125216, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Cruelty
				{ 4, 125217, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Prowess
				{ 5, 125218, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Meditation
				{ 6, 125219, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Pendant of Contemplation
				{ 7, 125325, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Choker of Cruelty
				{ 8, 125326, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Choker of Prowess
				{ 9, 125332, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Choker of Endurance
				-- ilvl 670
				{ 16, 125374, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Necklace of Cruelty
				{ 17, 125375, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Necklace of Prowess
				{ 18, 125416, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Cruelty
				{ 19, 125417, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Prowess
				{ 20, 125418, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Meditation
				{ 21, 125419, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Pendant of Contemplation
				{ 22, 125501, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Choker of Cruelty
				{ 23, 125502, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Choker of Prowess
				{ 24, 125527, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Choker of Endurance
				-- ilvl 625
				{ 26, 125541 }, -- Wild Aspirant's Necklace of Cruelty
				{ 27, 125564 }, -- Wild Aspirant's Pendant of Cruelty
				{ 28, 125565 }, -- Wild Aspirant's Pendant of Meditation
				{ 29, 125610 }, -- Wild Aspirant's Choker of Cruelty
				{ 30, 125613 }, -- Wild Aspirant's Choker of Endurance
			},
		},
	]]
		{ -- Cloaks
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124685, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cape of Cruelty
				{ 2, 124686, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cape of Prowess
				{ 3, 124733, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Cruelty
				{ 4, 124734, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Prowess
				{ 5, 124735, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Meditation
				{ 6, 124736, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Contemplation
				{ 7, 124844, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cloak of Cruelty
				{ 8, 124845, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cloak of Prowess
				{ 9, 124852, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cloak of Endurance
				-- ilvl 650
				{ 16, 124895, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cape of Cruelty
				{ 17, 124896, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cape of Prowess
				{ 18, 124935, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Cruelty
				{ 19, 124936, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Prowess
				{ 20, 124937, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Meditation
				{ 21, 124938, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Contemplation
				{ 22, 125022, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cloak of Cruelty
				{ 23, 125023, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cloak of Prowess
				{ 24, 125049, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cloak of Endurance
--[[
				-- ilvl 625
				{ 11, 125063 }, -- Wild Aspirant's Cape of Cruelty
				{ 12, 125085 }, -- Wild Aspirant's Drape of Cruelty
				{ 13, 125086 }, -- Wild Aspirant's Drape of Meditation
				{ 14, 125132 }, -- Wild Aspirant's Cloak of Cruelty
				{ 15, 125135 }, -- Wild Aspirant's Cloak of Endurance
				-- ilvl 100
				{ 26, 127375 }, -- Wild Gladiator's Greatcloak
]]
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125164, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cape of Cruelty
				{ 2, 125165, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cape of Prowess
				{ 3, 125212, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Cruelty
				{ 4, 125213, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Prowess
				{ 5, 125214, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Meditation
				{ 6, 125215, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Drape of Contemplation
				{ 7, 125323, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cloak of Cruelty
				{ 8, 125324, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cloak of Prowess
				{ 9, 125331, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Cloak of Endurance
				-- ilvl 670
				{ 16, 125372, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cape of Cruelty
				{ 17, 125373, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cape of Prowess
				{ 18, 125412, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Cruelty
				{ 19, 125413, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Prowess
				{ 20, 125414, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Meditation
				{ 21, 125415, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Drape of Contemplation
				{ 22, 125499, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cloak of Cruelty
				{ 23, 125500, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cloak of Prowess
				{ 24, 125526, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Cloak of Endurance
--[[
				-- ilvl 625
				{ 11, 125540 }, -- Wild Aspirant's Cape of Cruelty
				{ 12, 125562 }, -- Wild Aspirant's Drape of Cruelty
				{ 13, 125563 }, -- Wild Aspirant's Drape of Meditation
				{ 14, 125609 }, -- Wild Aspirant's Cloak of Cruelty
				{ 15, 125612 }, -- Wild Aspirant's Cloak of Endurance
				-- ilvl 100
				{ 26, 127374 }, -- Wild Gladiator's Greatcloak
]]
			},
		},
--[[
		{
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124689, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Ring of Cruelty
				{ 2, 124690, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Ring of Prowess
				{ 3, 124691, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Ring of Triumph
				{ 4, 124743, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Cruelty
				{ 5, 124744, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Prowess
				{ 6, 124745, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Victory
				{ 7, 124746, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Meditation
				{ 8, 124747, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Contemplation
				{ 9, 124848, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Cruelty
				{ 10, 124849, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Accuracy
				{ 11, 124850, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Ruthlessness
				{ 12, 124854, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Dedication
				{ 13, 124855, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Endurance
				-- ilvl 670
				{ 16, 124899, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Ring of Cruelty
				{ 17, 124900, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Ring of Prowess
				{ 18, 124901, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Ring of Triumph
				{ 19, 124945, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Cruelty
				{ 20, 124946, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Prowess
				{ 21, 124947, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Victory
				{ 22, 124948, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Meditation
				{ 23, 124949, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Contemplation
				{ 24, 125026, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Cruelty
				{ 25, 125027, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Accuracy
				{ 26, 125028, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Ruthlessness
				{ 27, 125051, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Dedication
				{ 28, 125052, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Endurance
				-- ilvl 625
				{ 101, 125065 }, -- Wild Aspirant's Ring of Cruelty
				{ 102, 125066 }, -- Wild Aspirant's Ring of Prowess
				{ 103, 125089 }, -- Wild Aspirant's Band of Cruelty
				{ 104, 125090 }, -- Wild Aspirant's Band of Prowess
				{ 105, 125091 }, -- Wild Aspirant's Band of Meditation
				{ 106, 125092 }, -- Wild Aspirant's Band of Contemplation
				{ 107, 125134 }, -- Wild Aspirant's Signet of Cruelty
				{ 108, 125137 }, -- Wild Aspirant's Signet of Dedication
				{ 109, 125138 }, -- Wild Aspirant's Signet of Endurance
				{ 110, 127118 }, -- Wild Aspirant's Signet of Accuracy
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125168, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Ring of Cruelty
				{ 2, 125169, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Ring of Prowess
				{ 3, 125170, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Ring of Triumph
				{ 4, 125222, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Cruelty
				{ 5, 125223, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Prowess
				{ 6, 125224, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Victory
				{ 7, 125225, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Meditation
				{ 8, 125226, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Band of Contemplation
				{ 9, 125327, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Cruelty
				{ 10, 125328, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Accuracy
				{ 11, 125329, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Ruthlessness
				{ 12, 125333, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Dedication
				{ 13, 125334, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Gladiator's Signet of Endurance
				-- ilvl 670
				{ 16, 125376, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Ring of Cruelty
				{ 17, 125377, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Ring of Prowess
				{ 18, 125378, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Ring of Triumph
				{ 19, 125422, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Cruelty
				{ 20, 125423, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Prowess
				{ 21, 125424, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Victory
				{ 22, 125425, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Meditation
				{ 23, 125426, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Band of Contemplation
				{ 24, 125503, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Cruelty
				{ 25, 125504, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Accuracy
				{ 26, 125505, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Ruthlessness
				{ 27, 125528, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Dedication
				{ 28, 125529, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" }, -- Wild Combatant's Signet of Endurance
				-- ilvl 625
				{ 101, 125542 }, -- Wild Aspirant's Ring of Cruelty
				{ 102, 125543 }, -- Wild Aspirant's Ring of Prowess
				{ 103, 125566 }, -- Wild Aspirant's Band of Cruelty
				{ 104, 125567 }, -- Wild Aspirant's Band of Prowess
				{ 105, 125568 }, -- Wild Aspirant's Band of Meditation
				{ 106, 125569 }, -- Wild Aspirant's Band of Contemplation
				{ 107, 125611 }, -- Wild Aspirant's Signet of Cruelty
				{ 108, 125614 }, -- Wild Aspirant's Signet of Dedication
				{ 109, 125615 }, -- Wild Aspirant's Signet of Endurance
				{ 110, 127119 }, -- Wild Aspirant's Signet of Accuracy
			},
		},
]]
--[[
		{
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124856, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of markofhonor
				{ 2, 124857, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Insignia of markofhonor
				{ 3, 124858, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Emblem of Cruelty
				{ 4, 124859, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Emblem of Tenacity
				{ 5, 124860, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Emblem of Meditation
				{ 6, 124861, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of Dominance
				{ 7, 124862, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Insignia of Dominance
				{ 8, 124863, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Cruelty
				{ 9, 124865, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Tenacity
				{ 10, 124866, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Meditation
				{ 16, 124867, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of Victory
				{ 17, 124868, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Insignia of Victory
				{ 18, 124869, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of Adaptation
				{ 19, 124870 }, -- Wild Gladiator's Accolade of markofhonor
				{ 20, 124871 }, -- Wild Gladiator's Accolade of Dominance
				{ 21, 124872 }, -- Wild Gladiator's Accolade of Victory
				{ 22, 124873 }, -- Wild Gladiator's Accolade of Meditation
				{ 23, 124874 }, -- Wild Gladiator's Accolade of Endurance
				{ 24, 127123, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Adaptation
				-- ilvl 670
				{ 101, 125030, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of markofhonor
				{ 102, 125031, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Insignia of markofhonor
				{ 103, 125032, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Emblem of Cruelty
				{ 104, 125033, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Emblem of Tenacity
				{ 105, 125034, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Emblem of Meditation
				{ 106, 125035, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of Dominance
				{ 107, 125036, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Insignia of Dominance
				{ 108, 125037, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Cruelty
				{ 109, 125038, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Adaptation
				{ 110, 125039, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Tenacity
				{ 111, 125040, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Meditation
				{ 112, 125041, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of Victory
				{ 113, 125042, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Insignia of Victory
				{ 114, 125043, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of Adaptation
				{ 115, 125044 }, -- Wild Combatant's Accolade of markofhonor
				{ 116, 125045 }, -- Wild Combatant's Accolade of Dominance
				{ 117, 125046 }, -- Wild Combatant's Accolade of Victory
				{ 118, 125047 }, -- Wild Combatant's Accolade of Meditation
				{ 119, 125048 }, -- Wild Combatant's Accolade of Endurance
				-- ilvl 625
				{ 121, 125139 }, -- Wild Aspirant's Accolade of markofhonor
				{ 122, 125140 }, -- Wild Aspirant's Accolade of Dominance
				{ 123, 125141 }, -- Wild Aspirant's Accolade of Victory
				{ 124, 125142 }, -- Wild Aspirant's Accolade of Meditation
				{ 125, 125143 }, -- Wild Aspirant's Accolade of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 124864, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Adaptation
				{ 2, 125335, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of markofhonor
				{ 3, 125336, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Insignia of markofhonor
				{ 4, 125337, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Emblem of Cruelty
				{ 5, 125338, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Emblem of Tenacity
				{ 6, 125339, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Emblem of Meditation
				{ 7, 125340, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of Dominance
				{ 8, 125341, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Insignia of Dominance
				{ 9, 125342, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Tenacity
				{ 10, 125343, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Meditation
				{ 16, 125344, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of Victory
				{ 17, 125345, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Insignia of Victory
				{ 18, 125346, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Badge of Adaptation
				{ 19, 125347 }, -- Wild Gladiator's Accolade of markofhonor
				{ 20, 125348 }, -- Wild Gladiator's Accolade of Dominance
				{ 21, 125349 }, -- Wild Gladiator's Accolade of Victory
				{ 22, 125350 }, -- Wild Gladiator's Accolade of Meditation
				{ 23, 125351 }, -- Wild Gladiator's Accolade of Endurance
				{ 24, 127124, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Medallion of Cruelty
				-- ilvl 670
				{ 101, 125507, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of markofhonor
				{ 102, 125508, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Insignia of markofhonor
				{ 103, 125509, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Emblem of Cruelty
				{ 104, 125510, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Emblem of Tenacity
				{ 105, 125511, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Emblem of Meditation
				{ 106, 125512, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of Dominance
				{ 107, 125513, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Insignia of Dominance
				{ 108, 125514, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Cruelty
				{ 109, 125515, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Adaptation
				{ 110, 125516, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Tenacity
				{ 111, 125517, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Medallion of Meditation
				{ 112, 125518, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of Victory
				{ 113, 125519, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Insignia of Victory
				{ 114, 125520, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Badge of Adaptation
				{ 115, 125521 }, -- Wild Combatant's Accolade of markofhonor
				{ 116, 125522 }, -- Wild Combatant's Accolade of Dominance
				{ 117, 125523 }, -- Wild Combatant's Accolade of Victory
				{ 118, 125524 }, -- Wild Combatant's Accolade of Meditation
				{ 119, 125525 }, -- Wild Combatant's Accolade of Endurance
				-- ilvl 625
				{ 121, 125616 }, -- Wild Aspirant's Accolade of markofhonor
				{ 122, 125617 }, -- Wild Aspirant's Accolade of Dominance
				{ 123, 125618 }, -- Wild Aspirant's Accolade of Victory
				{ 124, 125619 }, -- Wild Aspirant's Accolade of Meditation
				{ 125, 125620 }, -- Wild Aspirant's Accolade of Endurance
			},
		},
]]
--[[
		{
			name = AL["Miscellaneous"],
			[ALLIANCE_DIFF] = {
				{ 1, 127366 }, -- Wild Gladiator's Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 127365 }, -- Wild Gladiator's Tabard
			},
		},
]]
	},
}

data["WODS2WEAPONS"] = {
	name = string.format(AL["Warlords Season %d"], 2).." "..AL["Weapons"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- 700
			name = string.format(AL["ilvl %d"], 700).." (730)",
			[ALLIANCE_DIFF] = {
				{ 1, 138633, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Wild Gladiator's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 124675, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Cleaver
				{ 4, 124837, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Hacker
				{ 5, 124678, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Pummeler
				{ 6, 124727, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Gavel
				{ 7, 124839, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Bonecracker
				{ 8, 124679, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Quickblade
				{ 9, 124728, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Mageblade
				{ 10, 124840, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Slicer
				{ 11, 124677, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Ripper
				{ 12, 124838, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Render
				{ 13, 124676, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Shanker
				{ 14, 124726, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Spellblade
				{ 15, 129934, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Runeaxe
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 124841, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Decapitator
				{ 18, 124842, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Bonegrinder
				{ 19, 124683, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Pike
				{ 20, 124843, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Greatsword
				{ 21, 124684, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Staff
				{ 22, 124731, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Battle Staff
				{ 23, 124732, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 124680, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Longbow
				{ 26, 124682, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Rifle
				{ 27, 124681, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Heavy Crossbow
				{ 28, 124729, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Baton of Light
				{ 29, 124730, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 124748, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Redoubt
				{ 103, 124749, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Barrier
				{ 104, 124851, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 124741, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Endgame
				{ 118, 124742, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Reprieve			},
			},
			[HORDE_DIFF] = {
				{ 1, 138634, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Wild Gladiator's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 125154, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Cleaver
				{ 4, 125316, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Hacker
				{ 5, 125157, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Pummeler
				{ 6, 125206, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Gavel
				{ 7, 125318, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Bonecracker
				{ 8, 125158, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Quickblade
				{ 9, 125207, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Mageblade
				{ 10, 125319, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Slicer
				{ 11, 125156, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Ripper
				{ 12, 125317, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Render
				{ 13, 125155, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Shanker
				{ 14, 125205, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Spellblade
				{ 15, 129935, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Runeaxe
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 125320, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Decapitator
				{ 18, 125321, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Bonegrinder
				{ 19, 125162, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Pike
				{ 20, 125322, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Greatsword
				{ 21, 125163, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Staff
				{ 22, 125210, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Battle Staff
				{ 23, 125211, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 125159, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Longbow
				{ 26, 125161, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Rifle
				{ 27, 125160, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Heavy Crossbow
				{ 28, 125208, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Baton of Light
				{ 29, 125209, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Gladiator's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 125227, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Redoubt
				{ 103, 125228, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Barrier
				{ 104, 125330, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 125220, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Endgame
				{ 118, 125221, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Gladiator's Reprieve
			},
		},
		{ -- 670
			name = string.format(AL["ilvl %d"], 670).." (715)",
			[ALLIANCE_DIFF] = {
				{ 1, 138630, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Wild Combatant's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 124885, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Cleaver
				{ 4, 125015, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Hacker
				{ 5, 124888, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Pummeler
				{ 6, 124929, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Gavel
				{ 7, 125017, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Bonecracker
				{ 8, 124889, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Quickblade
				{ 9, 124930, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Mageblade
				{ 10, 125018, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Slicer
				{ 11, 124887, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Ripper
				{ 12, 125016, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Render
				{ 13, 124886, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Shanker
				{ 14, 124928, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Spellblade
				{ 15, 127381, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Chopper
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 125019, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Decapitator
				{ 18, 125020, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Bonegrinder
				{ 19, 124893, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Pike
				{ 20, 125021, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Greatsword
				{ 21, 124894, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Staff
				{ 22, 124933, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Battle Staff
				{ 23, 124934, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 124890, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Longbow
				{ 26, 124892, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Rifle
				{ 27, 124891, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Heavy Crossbow
				{ 28, 124931, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Baton of Light
				{ 29, 124932, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 124950, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Redoubt
				{ 103, 124951, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Barrier
				{ 104, 125029, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 124943, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Endgame
				{ 118, 124944, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 138629, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Wild Combatant's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 125362, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Cleaver
				{ 4, 125492, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Hacker
				{ 5, 125365, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Pummeler
				{ 6, 125406, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Gavel
				{ 7, 125494, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Bonecracker
				{ 8, 125366, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Quickblade
				{ 9, 125407, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Mageblade
				{ 10, 125495, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Slicer
				{ 11, 125364, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Ripper
				{ 12, 125493, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Render
				{ 13, 125363, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Shanker
				{ 14, 125405, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Spellblade
				{ 15, 127380, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Chopper
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 125496, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Decapitator
				{ 18, 125497, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Bonegrinder
				{ 19, 125370, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Pike
				{ 20, 125498, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Greatsword
				{ 21, 125371, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Staff
				{ 22, 125410, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Battle Staff
				{ 23, 125411, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 125367, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Longbow
				{ 26, 125369, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Rifle
				{ 27, 125368, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Heavy Crossbow
				{ 28, 125408, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Baton of Light
				{ 29, 125409, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" }, -- Wild Combatant's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 125427, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Redoubt
				{ 103, 125428, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Barrier
				{ 104, 125506, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 125420, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Endgame
				{ 118, 125421, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Wild Combatant's Reprieve
			},
		},
	},
}

data["WODS1SETS"] = {
	name = string.format(AL["Warlords Season %d"], 1).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 138557, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Dreadplate Armor
				{ 2, 115631, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dreadplate Helm
				{ 3, 115633, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dreadplate Shoulders
				{ 4, 115629, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dreadplate Chestpiece
				{ 5, 115630, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dreadplate Gauntlets
				{ 6, 115632, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dreadplate Legguards
				{ 16, 138613, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Primal Combatant's Dreadplate Armor
				{ 17, 115051, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dreadplate Helm
				{ 18, 115053, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dreadplate Shoulders
				{ 19, 115049, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dreadplate Chestpiece
				{ 20, 115050, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dreadplate Gauntlets
				{ 21, 115052, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dreadplate Legguards
				--[[
				{ 22, 115199 },	-- Primal Aspirant's Dreadplate Helm
				{ 23, 115201 },	-- Primal Aspirant's Dreadplate Shoulders
				{ 24, 115197 },	-- Primal Aspirant's Dreadplate Chestpiece
				{ 25, 115198 },	-- Primal Aspirant's Dreadplate Gauntlets
				{ 26, 115200 },	-- Primal Aspirant's Dreadplate Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138558, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Dreadplate Armor
				{ 2, 111104, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dreadplate Helm
				{ 3, 111106, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dreadplate Shoulders
				{ 4, 111102, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dreadplate Chestpiece
				{ 5, 111103, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dreadplate Gauntlets
				{ 6, 111105, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dreadplate Legguards
				{ 16, 138614, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" }, -- Ensemble: Primal Combatant's Dreadplate Armor
				{ 17, 119841, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dreadplate Helm
				{ 18, 119843, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dreadplate Shoulders
				{ 19, 119839, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dreadplate Chestpiece
				{ 20, 119840, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dreadplate Gauntlets
				{ 21, 119842, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dreadplate Legguards
				--[[
				{ 22, 119976 },	-- Primal Aspirant's Dreadplate Helm
				{ 23, 119978 },	-- Primal Aspirant's Dreadplate Shoulders
				{ 24, 119974 },	-- Primal Aspirant's Dreadplate Chestpiece
				{ 25, 119975 },	-- Primal Aspirant's Dreadplate Gauntlets
				{ 26, 119977 },	-- Primal Aspirant's Dreadplate Legguards
				]]
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 138565, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Dragonhide Armor
				{ 2, 115635, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dragonhide Helm
				{ 3, 115638, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dragonhide Spaulders
				{ 4, 115637, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dragonhide Robes
				{ 5, 115634, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dragonhide Gloves
				{ 6, 115636, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dragonhide Legguards
				{ 16, 138617, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },-- Ensemble: Primal Combatant's Dragonhide Armor
				{ 17, 115055, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dragonhide Helm
				{ 18, 115058, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dragonhide Spaulders
				{ 19, 115057, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dragonhide Robes
				{ 20, 115054, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dragonhide Gloves
				{ 21, 115056, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dragonhide Legguards
				--[[
				{ 22, 115203 },	-- Primal Aspirant's Dragonhide Helm
				{ 23, 115206 },	-- Primal Aspirant's Dragonhide Spaulders
				{ 24, 115205 },	-- Primal Aspirant's Dragonhide Robes
				{ 25, 115202 },	-- Primal Aspirant's Dragonhide Gloves
				{ 26, 115204 },	-- Primal Aspirant's Dragonhide Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138566, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Dragonhide Armor
				{ 2, 111108, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dragonhide Helm
				{ 3, 111111, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dragonhide Spaulders
				{ 4, 111110, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dragonhide Robes
				{ 5, 111107, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Dragonhide Gloves
				{ 6, 111109, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Dragonhide Legguards
				{ 16, 138618, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },-- Ensemble: Primal Combatant's Dragonhide Armor
				{ 17, 119845, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dragonhide Helm
				{ 18, 119848, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dragonhide Spaulders
				{ 19, 119847, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dragonhide Robes
				{ 20, 119844, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Dragonhide Gloves
				{ 21, 119846, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Dragonhide Legguards
				--[[
				{ 22, 119980 },	-- Primal Aspirant's Dragonhide Helm
				{ 23, 119983 },	-- Primal Aspirant's Dragonhide Spaulders
				{ 24, 119982 },	-- Primal Aspirant's Dragonhide Robes
				{ 25, 119979 },	-- Primal Aspirant's Dragonhide Gloves
				{ 26, 119981 },	-- Primal Aspirant's Dragonhide Legguards
				]]
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 138563, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Chain Armor
				{ 2, 115641, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chain Helm
				{ 3, 115643, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Chain Spaulders
				{ 4, 115639, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chain Armor
				{ 5, 115640, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Chain Gauntlets
				{ 6, 115642, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chain Leggings
				{ 16, 138579, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Chain Armor
				{ 17, 115061, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Chain Helm
				{ 18, 115063, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Chain Spaulders
				{ 19, 115059, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Chain Armor
				{ 20, 115060, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Chain Gauntlets
				{ 21, 115062, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Chain Leggings
				--[[
				{ 22, 115209 },	-- Primal Aspirant's Chain Helm
				{ 23, 115211 },	-- Primal Aspirant's Chain Spaulders
				{ 24, 115207 },	-- Primal Aspirant's Chain Armor
				{ 25, 115208 },	-- Primal Aspirant's Chain Gauntlets
				{ 26, 115210 },	-- Primal Aspirant's Chain Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138564, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Chain Armor
				{ 2, 111114, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chain Helm
				{ 3, 111116, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Chain Spaulders
				{ 4, 111112, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chain Armor
				{ 5, 111113, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Chain Gauntlets
				{ 6, 111115, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chain Leggings
				{ 16, 138580, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Chain Armor
				{ 17, 119851, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Chain Helm
				{ 18, 119853, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Chain Spaulders
				{ 19, 119849, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Chain Armor
				{ 20, 119850, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Chain Gauntlets
				{ 21, 119852, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Chain Leggings
				--[[
				{ 22, 119986 },	-- Primal Aspirant's Chain Helm
				{ 23, 119988 },	-- Primal Aspirant's Chain Spaulders
				{ 24, 119984 },	-- Primal Aspirant's Chain Armor
				{ 25, 119985 },	-- Primal Aspirant's Chain Gauntlets
				{ 26, 119987 },	-- Primal Aspirant's Chain Leggings
				]]
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 138571, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Silk Armor
				{ 2, 115678, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Silk Cowl
				{ 3, 115681, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Silk Amice
				{ 4, 115680, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Silk Robe
				{ 5, 115677, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Silk Handguards
				{ 6, 115679, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Silk Trousers
				{ 16, 138581, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Silk Armor
				{ 17, 115091, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Silk Cowl
				{ 18, 115094, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Silk Amice
				{ 19, 115093, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Silk Robe
				{ 20, 115090, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Silk Handguards
				{ 21, 115092, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Silk Trousers
				--[[
				{ 22, 115221 },	-- Primal Aspirant's Silk Cowl
				{ 23, 115224 },	-- Primal Aspirant's Silk Amice
				{ 24, 115223 },	-- Primal Aspirant's Silk Robe
				{ 25, 115220 },	-- Primal Aspirant's Silk Handguards
				{ 26, 115222 },	-- Primal Aspirant's Silk Trousers
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138572, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Silk Armor
				{ 2, 111151, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Silk Cowl
				{ 3, 111154, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Silk Amice
				{ 4, 111153, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Silk Robe
				{ 5, 111150, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Silk Handguards
				{ 6, 111152, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Silk Trousers
				{ 16, 138581, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Silk Armor
				{ 17, 119874, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Silk Cowl
				{ 18, 119877, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Silk Amice
				{ 19, 119876, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Silk Robe
				{ 20, 119873, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Silk Handguards
				{ 21, 119875, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Silk Trousers
				--[[
				{ 22, 119998 },	-- Primal Aspirant's Silk Cowl
				{ 23, 120001 },	-- Primal Aspirant's Silk Amice
				{ 24, 120000 },	-- Primal Aspirant's Silk Robe
				{ 25, 119997 },	-- Primal Aspirant's Silk Handguards
				{ 26, 119999 },	-- Primal Aspirant's Silk Trousers
				]]
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 138567, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Ironskin Armor
				{ 2, 115692, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ironskin Helm
				{ 3, 115694, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ironskin Spaulders
				{ 4, 115695, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ironskin Tunic
				{ 5, 115691, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ironskin Gloves
				{ 6, 115693, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ironskin Legguards
				{ 16, 138619, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Ironskin Armor
				{ 17, 115102, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ironskin Helm
				{ 18, 115104, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ironskin Spaulders
				{ 19, 115105, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ironskin Tunic
				{ 20, 115101, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ironskin Gloves
				{ 21, 115103, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ironskin Legguards
				--[[
				{ 22, 115229 },	-- Primal Aspirant's Ironskin Helm
				{ 23, 115231 },	-- Primal Aspirant's Ironskin Spaulders
				{ 24, 115232 },	-- Primal Aspirant's Ironskin Tunic
				{ 25, 115228 },	-- Primal Aspirant's Ironskin Gloves
				{ 26, 115230 },	-- Primal Aspirant's Ironskin Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138568, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Ironskin Armor
				{ 2, 111165, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ironskin Helm
				{ 3, 111167, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ironskin Spaulders
				{ 4, 111168, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ironskin Tunic
				{ 5, 111164, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ironskin Gloves
				{ 6, 111166, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ironskin Legguards
				{ 16, 138620, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Ironskin Armor
				{ 17, 119885, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ironskin Helm
				{ 18, 119887, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ironskin Spaulders
				{ 19, 119888, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ironskin Tunic
				{ 20, 119884, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ironskin Gloves
				{ 21, 119886, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ironskin Legguards
				--[[
				{ 22, 120006 },	-- Primal Aspirant's Ironskin Helm
				{ 23, 120008 },	-- Primal Aspirant's Ironskin Spaulders
				{ 24, 120009 },	-- Primal Aspirant's Ironskin Tunic
				{ 25, 120005 },	-- Primal Aspirant's Ironskin Gloves
				{ 26, 120007 },	-- Primal Aspirant's Ironskin Legguards
				]]
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 138559, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Ironskin Armor
				{ 2, 115698, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Scaled Helm
				{ 3, 115700, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Scaled Shoulders
				{ 4, 115696, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Scaled Chestpiece
				{ 5, 115697, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Scaled Gauntlets
				{ 6, 115699, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Scaled Legguards
				{ 16, 138615, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Scaled Armor
				{ 17, 115108, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Scaled Helm
				{ 18, 115110, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Scaled Shoulders
				{ 19, 115106, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Scaled Chestpiece
				{ 20, 115107, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Scaled Gauntlets
				{ 21, 115109, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Scaled Legguards
				--[[
				{ 22, 115235 },	-- Primal Aspirant's Scaled Helm
				{ 23, 115237 },	-- Primal Aspirant's Scaled Shoulders
				{ 24, 115233 },	-- Primal Aspirant's Scaled Chestpiece
				{ 25, 115234 },	-- Primal Aspirant's Scaled Gauntlets
				{ 26, 115236 },	-- Primal Aspirant's Scaled Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138560, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Ironskin Armor
				{ 2, 111171, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Scaled Helm
				{ 3, 111173, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Scaled Shoulders
				{ 4, 111169, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Scaled Chestpiece
				{ 5, 111170, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Scaled Gauntlets
				{ 6, 111172, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Scaled Legguards
				{ 16, 138616, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Scaled Armor
				{ 17, 119891, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Scaled Helm
				{ 18, 119893, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Scaled Shoulders
				{ 19, 119889, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Scaled Chestpiece
				{ 20, 119890, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Scaled Gauntlets
				{ 21, 119892, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Scaled Legguards
				--[[
				{ 22, 120012 },	-- Primal Aspirant's Scaled Helm
				{ 23, 120014 },	-- Primal Aspirant's Scaled Shoulders
				{ 24, 120010 },	-- Primal Aspirant's Scaled Chestpiece
				{ 25, 120011 },	-- Primal Aspirant's Scaled Gauntlets
				{ 26, 120013 },	-- Primal Aspirant's Scaled Legguards
				]]
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 138573, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Satin Armor
				{ 2, 115711, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Satin Hood
				{ 3, 115714, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Satin Mantle
				{ 4, 115713, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Satin Robe
				{ 5, 115710, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Satin Gloves
				{ 6, 115712, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Satin Leggings
				{ 16, 138583, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Satin Armor
				{ 17, 115118, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Satin Hood
				{ 18, 115121, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Satin Mantle
				{ 19, 115120, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Satin Robe
				{ 20, 115117, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Satin Gloves
				{ 21, 115119, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Satin Leggings
				--[[
				{ 22, 115242 },	-- Primal Aspirant's Satin Hood
				{ 23, 115245 },	-- Primal Aspirant's Satin Mantle
				{ 24, 115244 },	-- Primal Aspirant's Satin Robe
				{ 25, 115241 },	-- Primal Aspirant's Satin Gloves
				{ 26, 115243 },	-- Primal Aspirant's Satin Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138574, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Satin Armor
				{ 2, 111184, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Satin Hood
				{ 3, 111187, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Satin Mantle
				{ 4, 111186, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Satin Robe
				{ 5, 111183, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Satin Gloves
				{ 6, 111185, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Satin Leggings
				{ 16, 138584, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Satin Armor
				{ 17, 119901, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Satin Hood
				{ 18, 119904, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Satin Mantle
				{ 19, 119903, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Satin Robe
				{ 20, 119900, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Satin Gloves
				{ 21, 119902, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Satin Leggings
				--[[
				{ 22, 120019 },	-- Primal Aspirant's Satin Hood
				{ 23, 120022 },	-- Primal Aspirant's Satin Mantle
				{ 24, 120021 },	-- Primal Aspirant's Satin Robe
				{ 25, 120018 },	-- Primal Aspirant's Satin Gloves
				{ 26, 120020 },	-- Primal Aspirant's Satin Leggings
				]]
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 138569, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Leather Armor
				{ 2, 115717, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leather Helm
				{ 3, 115719, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Leather Spaulders
				{ 4, 115715, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leather Tunic
				{ 5, 115716, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Leather Gloves
				{ 6, 115718, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leather Legguards
				{ 16, 138621, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Leather Armor
				{ 17, 115124, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leather Helm
				{ 18, 115126, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Leather Spaulders
				{ 19, 115122, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leather Tunic
				{ 20, 115123, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Leather Gloves
				{ 21, 115125, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leather Legguards
				--[[
				{ 22, 115248 },	-- Primal Aspirant's Leather Helm
				{ 23, 115250 },	-- Primal Aspirant's Leather Spaulders
				{ 24, 115246 },	-- Primal Aspirant's Leather Tunic
				{ 25, 115247 },	-- Primal Aspirant's Leather Gloves
				{ 26, 115249 },	-- Primal Aspirant's Leather Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138570, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Leather Armor
				{ 2, 111190, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leather Helm
				{ 3, 111192, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Leather Spaulders
				{ 4, 111188, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leather Tunic
				{ 5, 111189, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Leather Gloves
				{ 6, 111191, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leather Legguards
				{ 16, 138622, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Leather Armor
				{ 17, 119907, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leather Helm
				{ 18, 119909, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Leather Spaulders
				{ 19, 119905, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leather Tunic
				{ 20, 119906, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Leather Gloves
				{ 21, 119908, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leather Legguards
				--[[
				{ 22, 120025 },	-- Primal Aspirant's Leather Helm
				{ 23, 120027 },	-- Primal Aspirant's Leather Spaulders
				{ 24, 120023 },	-- Primal Aspirant's Leather Tunic
				{ 25, 120024 },	-- Primal Aspirant's Leather Gloves
				{ 26, 120026 },	-- Primal Aspirant's Leather Legguards
				]]
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 138561, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Ringmail Armor
				{ 2, 115722, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ringmail Helm
				{ 3, 115724, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ringmail Spaulders
				{ 4, 115720, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ringmail Armor
				{ 5, 115721, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ringmail Gauntlets
				{ 6, 115723, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ringmail Leggings
				{ 16, 138577, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Ringmail Armor
				{ 17, 115129, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ringmail Helm
				{ 18, 115131, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ringmail Spaulders
				{ 19, 115127, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ringmail Armor
				{ 20, 115128, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ringmail Gauntlets
				{ 21, 115130, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ringmail Leggings
				--[[
				{ 22, 115253 },	-- Primal Aspirant's Ringmail Helm
				{ 23, 115255 },	-- Primal Aspirant's Ringmail Spaulders
				{ 24, 115251 },	-- Primal Aspirant's Ringmail Armor
				{ 25, 115252 },	-- Primal Aspirant's Ringmail Gauntlets
				{ 26, 115254 },	-- Primal Aspirant's Ringmail Leggings
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138562, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Ringmail Armor
				{ 2, 111195, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ringmail Helm
				{ 3, 111197, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ringmail Spaulders
				{ 4, 111193, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ringmail Armor
				{ 5, 111194, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ringmail Gauntlets
				{ 6, 111196, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Ringmail Leggings
				{ 16, 138578, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Ringmail Armor
				{ 17, 119912, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ringmail Helm
				{ 18, 119915, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ringmail Spaulders
				{ 19, 119910, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ringmail Armor
				{ 20, 119911, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Ringmail Gauntlets
				{ 21, 119913, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Ringmail Leggings
				--[[
				{ 22, 120030 },	-- Primal Aspirant's Ringmail Helm
				{ 23, 120032 },	-- Primal Aspirant's Ringmail Spaulders
				{ 24, 120028 },	-- Primal Aspirant's Ringmail Armor
				{ 25, 120029 },	-- Primal Aspirant's Ringmail Gauntlets
				{ 26, 120031 },	-- Primal Aspirant's Ringmail Leggings
				]]
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 138575, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Felweave Armor
				{ 2, 115762, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Felweave Cowl
				{ 3, 115765, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Felweave Amice
				{ 4, 115764, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Felweave Raiment
				{ 5, 115761, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Felweave Handguards
				{ 6, 115763, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Felweave Trousers
				{ 16, 138585, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Felweave Armor
				{ 17, 115162, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Felweave Cowl
				{ 18, 115165, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Felweave Amice
				{ 19, 115164, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Felweave Raiment
				{ 20, 115161, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Felweave Handguards
				{ 21, 115163, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Felweave Trousers
				--[[
				{ 22, 115259 },	-- Primal Aspirant's Felweave Cowl
				{ 23, 115262 },	-- Primal Aspirant's Felweave Amice
				{ 24, 115261 },	-- Primal Aspirant's Felweave Raiment
				{ 25, 115258 },	-- Primal Aspirant's Felweave Handguards
				{ 26, 115260 },	-- Primal Aspirant's Felweave Trousers
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138576, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Felweave Armor
				{ 2, 111235, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Felweave Cowl
				{ 3, 111238, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Felweave Amice
				{ 4, 111237, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Felweave Raiment
				{ 5, 111234, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Felweave Handguards
				{ 6, 111236, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Felweave Trousers
				{ 16, 138586, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Felweave Armor
				{ 17, 119939, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Felweave Cowl
				{ 18, 119942, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Felweave Amice
				{ 19, 119941, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Felweave Raiment
				{ 20, 119938, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Felweave Handguards
				{ 21, 119940, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Felweave Trousers
				--[[
				{ 22, 120036 },	-- Primal Aspirant's Felweave Cowl
				{ 23, 120039 },	-- Primal Aspirant's Felweave Amice
				{ 24, 120038 },	-- Primal Aspirant's Felweave Raiment
				{ 25, 120035 },	-- Primal Aspirant's Felweave Handguards
				{ 26, 120037 },	-- Primal Aspirant's Felweave Trousers
				]]
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 138555, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Plate Armor
				{ 2, 115768, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Helm
				{ 3, 115770, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Shoulders
				{ 4, 115766, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Chestpiece
				{ 5, 115767, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Gauntlets
				{ 6, 115769, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Legguards
				{ 16, 138611, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Plate Armor
				{ 17, 115168, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Helm
				{ 18, 115170, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Plate Shoulders
				{ 19, 115166, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Chestpiece
				{ 20, 115167, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Plate Gauntlets
				{ 21, 115169, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Legguards
				--[[
				{ 22, 115265 },	-- Primal Aspirant's Plate Helm
				{ 23, 115267 },	-- Primal Aspirant's Plate Shoulders
				{ 24, 115263 },	-- Primal Aspirant's Plate Chestpiece
				{ 25, 115264 },	-- Primal Aspirant's Plate Gauntlets
				{ 26, 115266 },	-- Primal Aspirant's Plate Legguards
				]]
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 138556, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Gladiator's Plate Armor
				{ 2, 111241, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Helm
				{ 3, 111243, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Shoulders
				{ 4, 111239, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Chestpiece
				{ 5, 111240, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Gauntlets
				{ 6, 111242, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Legguards
				{ 16, 138612, [PRICE_EXTRA_ITTYPE] = "markofhonor:12" },	-- Ensemble: Primal Combatant's Plate Armor
				{ 17, 119945, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Helm
				{ 18, 119947, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Plate Shoulders
				{ 19, 119943, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Chestpiece
				{ 20, 119944, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Plate Gauntlets
				{ 21, 119946, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Legguards
				--[[
				{ 22, 120042 },	-- Primal Aspirant's Plate Helm
				{ 23, 120044 },	-- Primal Aspirant's Plate Shoulders
				{ 24, 120040 },	-- Primal Aspirant's Plate Chestpiece
				{ 25, 120041 },	-- Primal Aspirant's Plate Gauntlets
				{ 26, 120043 },	-- Primal Aspirant's Plate Legguards
				]]
			},
		},
	},
}

data["WODS1NONSETGEAR"] = {
	name = string.format(AL["Warlords Season %d"], 1).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- Cloth
			name = AL["Cloth"],
			[ALLIANCE_DIFF] = {
				{ 1, 115611, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Hood of Prowess
				{ 2, 115614, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Amice of Prowess
				{ 3, 115613, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Robes of Prowess
				{ 4, 115610, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gloves of Prowess
				{ 5, 115612, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings of Prowess
				{ 7, 115627, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cuffs of Cruelty
				{ 8, 115626, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cuffs of Prowess
				{ 10, 115620, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cord of Cruelty
				{ 11, 115621, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cord of Prowess
				{ 13, 115623, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Treads of Cruelty
				{ 14, 115624, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Treads of Prowess
				{ 16, 115616, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Cowl of Cruelty
				{ 17, 115619, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Mantle of Cruelty
				{ 18, 115618, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Raiment of Cruelty
				{ 19, 115628, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cuffs of Victory
				{ 20, 115615, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Handguards of Cruelty
				{ 21, 115622, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cord of Victory
				{ 22, 115617, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Trousers of Cruelty
				{ 23, 115625, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Treads of Victory
				{ 101, 115039, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Hood of Prowess
				{ 102, 115042, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Amice of Prowess
				{ 103, 115041, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Robes of Prowess
				{ 104, 115038, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Gloves of Prowess
				{ 105, 115040, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leggings of Prowess
				{ 107, 115048, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cuffs of Cruelty
				{ 108, 115047, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cuffs of Prowess
				{ 110, 115043, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cord of Cruelty
				{ 111, 115044, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cord of Prowess
				{ 113, 115045, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Treads of Cruelty
				{ 114, 115046, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Treads of Prowess
				--{ 116, 115196 },	-- Primal Aspirant's Cuffs of Prowess
				--{ 117, 115194 },	-- Primal Aspirant's Cord of Cruelty
				--{ 118, 115195 },	-- Primal Aspirant's Treads of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111084, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Hood of Prowess
				{ 2, 111087, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Amice of Prowess
				{ 3, 111086, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Robes of Prowess
				{ 4, 111083, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gloves of Prowess
				{ 5, 111085, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings of Prowess
				{ 7, 111100, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cuffs of Cruelty
				{ 8, 111099, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cuffs of Prowess
				{ 10, 111093, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cord of Cruelty
				{ 11, 111094, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cord of Prowess
				{ 13, 111096, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Treads of Cruelty
				{ 14, 111097, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Treads of Prowess
				{ 16, 111089, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Cowl of Cruelty
				{ 17, 111092, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Mantle of Cruelty
				{ 18, 111091, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Raiment of Cruelty
				{ 19, 111101, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cuffs of Victory
				{ 20, 111088, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Handguards of Cruelty
				{ 21, 111095, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cord of Victory
				{ 22, 111090, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Trousers of Cruelty
				{ 23, 111098, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Treads of Victory
				{ 101, 119829, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Hood of Prowess
				{ 102, 119832, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Amice of Prowess
				{ 103, 119831, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Robes of Prowess
				{ 104, 119828, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Gloves of Prowess
				{ 105, 119830, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leggings of Prowess
				{ 107, 119838, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cuffs of Cruelty
				{ 108, 119837, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cuffs of Prowess
				{ 110, 119833, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cord of Cruelty
				{ 111, 119834, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cord of Prowess
				{ 113, 119835, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Treads of Cruelty
				{ 114, 119836, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Treads of Prowess
				--{ 116, 119973 },	-- Primal Aspirant's Cuffs of Prowess
				--{ 117, 119971 },	-- Primal Aspirant's Cord of Cruelty
				--{ 118, 119972 },	-- Primal Aspirant's Treads of Cruelty
			},
		},
		{ -- Leather
			name = AL["Leather"],
			[ALLIANCE_DIFF] = {
				{ 1, 115775, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Helm
				{ 2, 115777, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Spaulders
				{ 3, 115773, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Tunic
				{ 4, 115774, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gloves
				{ 5, 115776, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Legguards
				{ 7, 115674, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Bindings of Cruelty
				{ 8, 115675, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Bindings of Prowess
				{ 10, 115669, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Belt of Cruelty
				{ 11, 115668, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Belt of Prowess
				{ 13, 115671, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Boots of Cruelty
				{ 14, 115672, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Boots of Prowess
				{ 16, 115785, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Headcover
				{ 17, 115787, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Pauldrons
				{ 18, 115783, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chestguard
				{ 19, 115676, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Bindings of Victory
				{ 20, 115784, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Grips
				{ 21, 115670, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Belt of Victory
				{ 22, 115786, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings
				{ 23, 115673, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Boots of Victory
				{ 101, 115175, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Helm
				{ 102, 115177, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Spaulders
				{ 103, 115173, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Tunic
				{ 104, 115174, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Gloves
				{ 105, 115176, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Legguards
				{ 107, 115088, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Bindings of Cruelty
				{ 108, 115089, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Bindings of Prowess
				{ 110, 115085, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Belt of Cruelty
				{ 111, 115084, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Belt of Prowess
				{ 113, 115086, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Boots of Cruelty
				{ 114, 115087, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Boots of Prowess
				--{ 116, 115219 },	-- Primal Aspirant's Bindings of Cruelty
				--{ 117, 115217 },	-- Primal Aspirant's Belt of Prowess
				--{ 118, 115218 },	-- Primal Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111275, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Helm
				{ 2, 111277, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Spaulders
				{ 3, 111273, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Tunic
				{ 4, 111274, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gloves
				{ 5, 111276, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Legguards
				{ 7, 111147, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Bindings of Cruelty
				{ 8, 111148, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Bindings of Prowess
				{ 10, 111142, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Belt of Cruelty
				{ 11, 111141, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Belt of Prowess
				{ 13, 111144, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Boots of Cruelty
				{ 14, 111145, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Boots of Prowess
				{ 16, 111285, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Headcover
				{ 17, 111287, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Pauldrons
				{ 18, 111283, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chestguard
				{ 19, 111149, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Bindings of Victory
				{ 20, 111284, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Grips
				{ 21, 111143, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Belt of Victory
				{ 22, 111286, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings
				{ 23, 111146, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Boots of Victory
				{ 101, 119952, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Helm
				{ 102, 119954, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Spaulders
				{ 103, 119950, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Tunic
				{ 104, 119951, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Gloves
				{ 105, 119953, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Legguards
				{ 107, 119871, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Bindings of Cruelty
				{ 108, 119872, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Bindings of Prowess
				{ 110, 119868, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Belt of Cruelty
				{ 111, 119867, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Belt of Prowess
				{ 113, 119869, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Boots of Cruelty
				{ 114, 119870, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Boots of Prowess
				--{ 116, 119996 },	-- Primal Aspirant's Bindings of Cruelty
				--{ 117, 119994 },	-- Primal Aspirant's Belt of Prowess
				--{ 118, 119995 },	-- Primal Aspirant's Boots of Cruelty
			},
		},
		{ -- Mail
			name = AL["Mail"],
			[ALLIANCE_DIFF] = {
				{ 1, 115780, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Helm
				{ 2, 115782, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Spaulders
				{ 3, 115778, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Armor
				{ 4, 115779, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gauntlets
				{ 5, 115781, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings
				{ 7, 115689, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armbands of Cruelty
				{ 8, 115688, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armbands of Prowess
				{ 10, 115682, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Waistguard of Cruelty
				{ 11, 115683, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Waistguard of Prowess
				{ 13, 115685, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Footguards of Cruelty
				{ 14, 115686, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Footguards of Prowess
				{ 16, 115790, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Coif
				{ 17, 115792, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Pauldrons
				{ 18, 115788, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chestguard
				{ 19, 115690, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armbands of Victory
				{ 20, 115789, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gloves
				{ 21, 115684, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Waistguard of Victory
				{ 22, 115791, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings
				{ 23, 115687, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Footguards of Victory
				{ 101, 115180, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Helm
				{ 102, 115182, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Spaulders
				{ 103, 115178, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Armor
				{ 104, 115179, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Gauntlets
				{ 105, 115181, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leggings
				{ 107, 115100, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armbands of Cruelty
				{ 108, 115099, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armbands of Prowess
				{ 110, 115095, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Waistguard of Cruelty
				{ 111, 115096, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Waistguard of Prowess
				{ 113, 115097, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Footguards of Cruelty
				{ 114, 115098, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Footguards of Prowess
				--{ 116, 115227 },	-- Primal Aspirant's Armbands of Prowess
				--{ 117, 115225 },	-- Primal Aspirant's Waistguard of Cruelty
				--{ 118, 115226 },	-- Primal Aspirant's Footguards of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111280, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Helm
				{ 2, 111282, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Spaulders
				{ 3, 111278, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Armor
				{ 4, 111279, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gauntlets
				{ 5, 111281, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings
				{ 7, 111162, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armbands of Cruelty
				{ 8, 111161, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armbands of Prowess
				{ 10, 111155, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Waistguard of Cruelty
				{ 11, 111156, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Waistguard of Prowess
				{ 13, 111158, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Footguards of Cruelty
				{ 14, 111159, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Footguards of Prowess
				{ 16, 111290, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Coif
				{ 17, 111292, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Pauldrons
				{ 18, 111288, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Chestguard
				{ 19, 111163, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armbands of Victory
				{ 20, 111289, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Gloves
				{ 21, 111157, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Waistguard of Victory
				{ 22, 111291, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Leggings
				{ 23, 111160, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Footguards of Victory
				{ 101, 119957, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Helm
				{ 102, 119959, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Spaulders
				{ 103, 119955, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Armor
				{ 104, 119956, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Gauntlets
				{ 105, 119958, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Leggings
				{ 107, 119883, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armbands of Cruelty
				{ 108, 119882, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armbands of Prowess
				{ 110, 119878, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Waistguard of Cruelty
				{ 111, 119879, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Waistguard of Prowess
				{ 113, 119880, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Footguards of Cruelty
				{ 114, 119881, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Footguards of Prowess
				--{ 116, 120004 },	-- Primal Aspirant's Armbands of Prowess
				--{ 117, 120002 },	-- Primal Aspirant's Waistguard of Cruelty
				--{ 118, 120003 },	-- Primal Aspirant's Footguards of Cruelty
			},
		},
		{ -- Plate
			name = AL["Plate"],
			[ALLIANCE_DIFF] = {
				{ 1, 115738, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Helmet
				{ 2, 115743, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Visor
				{ 4, 115740, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Shoulderplates
				{ 5, 115745, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Pauldrons
				{ 7, 115736, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Breastplate
				{ 8, 115741, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Chestguard
				{ 10, 115737, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Gloves
				{ 11, 115742, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Grips
				{ 16, 115707, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armplates of Cruelty
				{ 17, 115708, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armplates of Prowess
				{ 18, 115709, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armplates of Victory
				{ 19, 115739, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Legplates
				{ 20, 115744, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Leggings
				{ 22, 115701, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Girdle of Cruelty
				{ 23, 115702, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Girdle of Prowess
				{ 24, 115703, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Girdle of Victory
				{ 26, 115704, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Warboots of Cruelty
				{ 27, 115705, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Warboots of Prowess
				{ 28, 115706, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Warboots of Victory
				{ 101, 115143, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Helmet
				{ 103, 115145, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Shoulderplates
				{ 105, 115141, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Breastplate
				{ 107, 115142, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Plate Gloves
				{ 109, 115144, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Legplates
				{ 116, 115115, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armplates of Cruelty
				{ 117, 115116, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armplates of Prowess
				{ 119, 115111, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Girdle of Cruelty
				{ 120, 115112, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Girdle of Prowess
				{ 122, 115113, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Warboots of Cruelty
				{ 123, 115114, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Warboots of Prowess
				--{ 116, 115240 },	-- Primal Aspirant's Armplates of Cruelty
				--{ 117, 115238 },	-- Primal Aspirant's Girdle of Cruelty
				--{ 118, 115239 },	-- Primal Aspirant's Warboots of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111211, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Helmet
				{ 2, 111216, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Visor
				{ 4, 111213, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Shoulderplates
				{ 5, 111218, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Pauldrons
				{ 7, 111209, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Breastplate
				{ 8, 111214, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Chestguard
				{ 10, 111210, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Gloves
				{ 11, 111215, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Plate Grips
				{ 16, 111180, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armplates of Cruelty
				{ 17, 111181, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armplates of Prowess
				{ 18, 111182, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Armplates of Victory
				{ 19, 111212, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Legplates
				{ 20, 111217, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Plate Leggings
				{ 22, 111174, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Girdle of Cruelty
				{ 23, 111175, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Girdle of Prowess
				{ 24, 111176, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Girdle of Victory
				{ 26, 111177, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Warboots of Cruelty
				{ 27, 111178, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Warboots of Prowess
				{ 28, 111179, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Warboots of Victory
				{ 101, 119920, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Helmet
				{ 103, 119922, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Shoulderplates
				{ 105, 119918, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Plate Breastplate
				{ 107, 119919, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Plate Gloves
				{ 109, 119921, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Combatant's Legplates
				{ 116, 119898, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armplates of Cruelty
				{ 117, 119899, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Armplates of Prowess
				{ 119, 119894, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Girdle of Cruelty
				{ 120, 119895, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Girdle of Prowess
				{ 122, 119896, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Warboots of Cruelty
				{ 123, 119897, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Warboots of Prowess
				--{ 116, 120017 },	-- Primal Aspirant's Armplates of Cruelty
				--{ 117, 120015 },	-- Primal Aspirant's Girdle of Cruelty
				--{ 118, 120016 },	-- Primal Aspirant's Warboots of Cruelty
			},
		},
		--[[{ -- Amulets
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
				{ 1, 115734, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Choker of Cruelty
				{ 2, 120108, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Choker of Endurance
				{ 3, 115735, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Choker of Prowess
				{ 5, 115606, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Necklace of Cruelty
				{ 6, 115607, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Necklace of Prowess
				{ 8, 115658, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Contemplation
				{ 9, 115655, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Cruelty
				{ 10, 115657, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Meditation
				{ 11, 115656, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Prowess
				{ 16, 115139, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Choker of Cruelty
				{ 17, 115140, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Choker of Prowess
				{ 18, 115034, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Necklace of Cruelty
				{ 19, 115035, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Necklace of Prowess
				{ 20, 115074, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Contemplation
				{ 21, 115071, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Cruelty
				{ 22, 115073, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Meditation
				{ 23, 115072, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Prowess
				{ 25, 115256 },	-- Primal Aspirant's Choker of Cruelty
				{ 26, 115191 },	-- Primal Aspirant's Necklace of Cruelty
				{ 27, 115212 },	-- Primal Aspirant's Pendant of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111207, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Choker of Cruelty
				{ 2, 120107, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Choker of Endurance
				{ 3, 111208, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Choker of Prowess
				{ 5, 111079, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Necklace of Cruelty
				{ 6, 111080, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Necklace of Prowess
				{ 8, 111131, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Contemplation
				{ 9, 111128, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Cruelty
				{ 10, 111130, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Meditation
				{ 11, 111129, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Pendant of Prowess
				{ 16, 119916, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Choker of Cruelty
				{ 17, 119917, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Choker of Prowess
				{ 18, 119824, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Necklace of Cruelty
				{ 19, 119825, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Necklace of Prowess
				{ 20, 119857, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Contemplation
				{ 21, 119854, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Cruelty
				{ 22, 119856, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Meditation
				{ 23, 119855, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Pendant of Prowess
				{ 25, 120033 },	-- Primal Aspirant's Choker of Cruelty
				{ 26, 119968 },	-- Primal Aspirant's Necklace of Cruelty
				{ 27, 119989 },	-- Primal Aspirant's Pendant of Cruelty
			},
		},
]]
		{ -- Cloaks
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
				{ 1, 115604, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cape of Cruelty
				{ 2, 115605, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cape of Prowess
				{ 4, 115732, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cloak of Cruelty
				{ 5, 120100, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cloak of Endurance
				{ 6, 115733, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cloak of Prowess
				{ 8, 115654, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Contemplation
				{ 9, 115651, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Cruelty
				{ 10, 115653, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Meditation
				{ 11, 115652, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Prowess
				{ 16, 115183, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cape of Cruelty
				{ 17, 115184, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cape of Prowess
				{ 18, 115189, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cloak of Cruelty
				{ 19, 115190, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cloak of Prowess
				{ 20, 115188, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Contemplation
				{ 21, 115185, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Cruelty
				{ 22, 115187, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Meditation
				{ 23, 115186, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Prowess
				--[[
				{ 25, 115268 },	-- Primal Aspirant's Cape of Cruelty
				{ 26, 115271 },	-- Primal Aspirant's Cloak of Cruelty
				{ 27, 115269 },	-- Primal Aspirant's Drape of Cruelty
				{ 28, 115270 },	-- Primal Aspirant's Drape of Meditation
				]]
			},
			[HORDE_DIFF] = {
				{ 1, 111077, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cape of Cruelty
				{ 2, 111078, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cape of Prowess
				{ 4, 111205, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cloak of Cruelty
				{ 5, 120099, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cloak of Endurance
				{ 6, 111206, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Cloak of Prowess
				{ 8, 111127, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Contemplation
				{ 9, 111124, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Cruelty
				{ 10, 111126, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Meditation
				{ 11, 111125, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Drape of Prowess
				{ 16, 119960, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cape of Cruelty
				{ 17, 119961, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cape of Prowess
				{ 18, 119966, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cloak of Cruelty
				{ 19, 119967, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Cloak of Prowess
				{ 20, 119965, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Contemplation
				{ 21, 119962, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Cruelty
				{ 22, 119964, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Meditation
				{ 23, 119963, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Drape of Prowess
				--[[
				{ 25, 120045 },	-- Primal Aspirant's Cape of Cruelty
				{ 26, 120048 },	-- Primal Aspirant's Cloak of Cruelty
				{ 27, 120046 },	-- Primal Aspirant's Drape of Cruelty
				{ 28, 120047 },	-- Primal Aspirant's Drape of Meditation
				]]
			},
		},
--[[
		{ -- Rings
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
				{ 1, 115665, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Contemplation
				{ 2, 115661, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Cruelty
				{ 3, 115664, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Meditation
				{ 4, 115662, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Prowess
				{ 5, 115663, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Victory
				{ 7, 115608, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Ring of Cruelty
				{ 8, 115609, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Ring of Prowess
				{ 9, 115771, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Ring of Prowess
				{ 11, 115747, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Accuracy
				{ 12, 115772, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Accuracy
				{ 13, 115746, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Cruelty
				{ 14, 120104, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Endurance
				{ 16, 115081, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Contemplation
				{ 17, 115077, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Cruelty
				{ 18, 115080, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Meditation
				{ 19, 115078, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Prowess
				{ 20, 115079, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Victory
				{ 21, 115036, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Ring of Cruelty
				{ 22, 115037, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Ring of Prowess
				{ 23, 115171, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Ring of Prowess
				{ 24, 115147, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Signet of Accuracy
				{ 25, 115172, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Signet of Accuracy
				{ 26, 115146, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Signet of Cruelty
				{ 101, 115216 },	-- Primal Aspirant's Band of Contemplation
				{ 102, 115213 },	-- Primal Aspirant's Band of Cruelty
				{ 103, 115215 },	-- Primal Aspirant's Band of Meditation
				{ 104, 115214 },	-- Primal Aspirant's Band of Prowess
				{ 105, 115192 },	-- Primal Aspirant's Ring of Cruelty
				{ 106, 115193 },	-- Primal Aspirant's Ring of Prowess
				{ 107, 115257 },	-- Primal Aspirant's Signet of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111138, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Contemplation
				{ 2, 111134, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Cruelty
				{ 3, 111137, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Meditation
				{ 4, 111135, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Prowess
				{ 5, 111136, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Band of Victory
				{ 7, 111081, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Ring of Cruelty
				{ 8, 111082, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Ring of Prowess
				{ 9, 111271, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Ring of Prowess
				{ 11, 111220, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Accuracy
				{ 12, 111272, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Accuracy
				{ 13, 111219, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Cruelty
				{ 14, 120103, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Signet of Endurance
				{ 16, 119864, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Contemplation
				{ 17, 119860, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Cruelty
				{ 18, 119863, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Meditation
				{ 19, 119861, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Prowess
				{ 20, 119862, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Band of Victory
				{ 21, 119826, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Ring of Cruelty
				{ 22, 119827, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Ring of Prowess
				{ 23, 119948, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Ring of Prowess
				{ 24, 119924, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Signet of Accuracy
				{ 25, 119949, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Signet of Accuracy
				{ 26, 119923, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Combatant's Signet of Cruelty
				{ 101, 119993 },	-- Primal Aspirant's Band of Contemplation
				{ 102, 119990 },	-- Primal Aspirant's Band of Cruelty
				{ 103, 119992 },	-- Primal Aspirant's Band of Meditation
				{ 104, 119991 },	-- Primal Aspirant's Band of Prowess
				{ 105, 119969 },	-- Primal Aspirant's Ring of Cruelty
				{ 106, 119970 },	-- Primal Aspirant's Ring of Prowess
				{ 107, 120034 },	-- Primal Aspirant's Signet of Cruelty
			},
		},
		{ -- Trinkets
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				{ 1, 115496, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of Adaptation
				{ 2, 115749, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of markofhonor
				{ 3, 115754, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of Dominance
				{ 4, 115759, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of Victory
				{ 5, 115751, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Emblem of Cruelty
				{ 6, 115753, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Emblem of Meditation
				{ 7, 115752, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Emblem of Tenacity
				{ 8, 115750, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Insignia of markofhonor
				{ 9, 115755, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Insignia of Dominance
				{ 10, 115760, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Insignia of Victory
				{ 11, 115756, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Medallion of Cruelty
				{ 12, 115758, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Medallion of Meditation
				{ 13, 115757, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Medallion of Tenacity
				{ 16, 115521, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of Adaptation
				{ 17, 115149, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of markofhonor
				{ 18, 115154, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of Dominance
				{ 19, 115159, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of Victory
				{ 20, 115151, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Emblem of Cruelty
				{ 21, 115153, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Emblem of Meditation
				{ 22, 115152, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Emblem of Tenacity
				{ 23, 115150, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Insignia of markofhonor
				{ 24, 115155, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Insignia of Dominance
				{ 25, 115160, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Insignia of Victory
				{ 26, 115156, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Medallion of Cruelty
				{ 27, 115158, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Medallion of Meditation
				{ 28, 115157, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Medallion of Tenacity
			},
			[HORDE_DIFF] = {
				{ 1, 115495, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of Adaptation
				{ 2, 111222, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of markofhonor
				{ 3, 111222, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of Dominance
				{ 4, 111232, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Badge of Victory
				{ 5, 111224, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Emblem of Cruelty
				{ 6, 111226, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Emblem of Meditation
				{ 7, 111225, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Emblem of Tenacity
				{ 8, 111223, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Insignia of markofhonor
				{ 9, 111228, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Insignia of Dominance
				{ 10, 111233, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Insignia of Victory
				{ 11, 111229, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Medallion of Cruelty
				{ 12, 111231, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Medallion of Meditation
				{ 13, 111230, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Medallion of Tenacity
				{ 16, 120049, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of Adaptation
				{ 17, 119926, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of markofhonor
				{ 18, 119931, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of Dominance
				{ 19, 119936, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Badge of Victory
				{ 20, 119928, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Emblem of Cruelty
				{ 21, 119930, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Emblem of Meditation
				{ 22, 119929, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Emblem of Tenacity
				{ 23, 119927, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Insignia of markofhonor
				{ 24, 119932, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Insignia of Dominance
				{ 25, 119937, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Insignia of Victory
				{ 26, 119933, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Medallion of Cruelty
				{ 27, 119935, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Medallion of Meditation
				{ 28, 119934, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Medallion of Tenacity
			},
		},
		{ -- Miscellaneous
			name = AL["Miscellaneous"],
			[ALLIANCE_DIFF] = {
				{ 1, 115979, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Primal Gladiator's Greatcloak (r2600)
				{ 3, 115972, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Primal Gladiator's Tabard (r2600)
				{ 16, 115976, [PRICE_EXTRA_ITTYPE] = "112160:1:markofhonor:500" },	-- Enchant Weapon - Glory of the Blackrock (r2400)
				{ 17, 115978, [PRICE_EXTRA_ITTYPE] = "112165:1:markofhonor:500" },	-- Enchant Weapon - Glory of the Frostwolf (r2400)
				{ 18, 115975, [PRICE_EXTRA_ITTYPE] = "112115:1:markofhonor:500" },	-- Enchant Weapon - Glory of the Shadowmoon (r2400)
				{ 19, 115973, [PRICE_EXTRA_ITTYPE] = "110682:1:markofhonor:500" },	-- Enchant Weapon - Glory of the Thunderlord (r2400)
				{ 20, 115977, [PRICE_EXTRA_ITTYPE] = "112164:1:markofhonor:500" },	-- Enchant Weapon - Glory of the Warsong (r2400)
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
]]
	},
}

data["WODS1WEAPONS"] = {
	name = string.format(AL["Warlords Season %d"], 1).." "..AL["Weapons"],
	ContentType = NORMAL_ITTYPE,
	items = {
--[[
		{
			name = string.format(AL["ilvl %d"], 660).." "..AL["Elite"],
			[ALLIANCE_DIFF] = {
				{ 1, 115949, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Render (r2000)
				{ 2, 115948, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Ripper (r2000)
				{ 4, 115832, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Spellblade (r2000)
				{ 5, 115947, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Shanker (r2000)
				{ 7, 115950, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Mageblade (r2000)
				{ 8, 115822, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Quickblade (r2000)
				{ 9, 115954, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Slicer (r2000)
				{ 11, 115820, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Cleaver (r2000)
				{ 12, 115952, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Hacker (r2000)
				{ 16, 115953, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Bonecracker (r2000)
				{ 17, 115863, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Primal Gladiator's Gavel (r2000)
				{ 18, 115821, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Pummeler (r2000)
				{ 20, 115819, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Greatsword (r2000)
				{ 21, 115817, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Decapitator (r2000)
				{ 22, 115818, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Bonegrinder (r2000)
				{ 24, 115910, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Pike (r2000)
				{ 26, 115833, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Battle Staff (r2000)
				{ 27, 115865, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Energy Staff (r2000)
				{ 101, 115831, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Barrier (r2000)
				{ 102, 115864, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Redoubt (r2000)
				{ 103, 115955, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Shield Wall (r2000)
				{ 105, 115836, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Heavy Crossbow (r2000)
				{ 106, 115823, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Longbow (r2000)
				{ 107, 115862, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Rifle (r2000)
				{ 116, 115951, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Baton of Light (r2000)
				{ 117, 115835, [PRICE_EXTRA_ITTYPE] = "markofhonor:3500" },	-- Primal Gladiator's Touch of Defeat (r2000)
				{ 119, 115834, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Reprieve (r2000)
				{ 120, 115830, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Primal Gladiator's Endgame (r2000)
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
]]
		{
			name = string.format(AL["ilvl %d"], 660).." (690)",
			[ALLIANCE_DIFF] = {
				{ 1, 138631, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Primal Gladiator's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 115594, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Cleaver
				{ 4, 115725, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Hacker
				{ 5, 115597, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Pummeler
				{ 6, 115645, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Gavel
				{ 7, 115727, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Bonecracker
				{ 8, 115598, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Quickblade
				{ 9, 115646, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Mageblade
				{ 10, 115728, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Slicer
				{ 11, 115596, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Ripper
				{ 12, 115726, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Render
				{ 13, 115595, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Shanker
				{ 14, 115644, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Spellblade
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 115729, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Decapitator
				{ 18, 115730, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Bonegrinder
				{ 19, 115602, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Pike
				{ 20, 115731, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Greatsword
				{ 21, 115649, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Battle Staff
				{ 22, 115650, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Energy Staff
				-- Ranged
				{ 23, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 24, 115599, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Longbow
				{ 25, 115601, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Rifle
				--{ 26, 115600, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Heavy Crossbow
				{ 26, 115647, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Baton of Light
				{ 27, 115648, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 115666, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Redoubt
				{ 103, 115667, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Barrier
				{ 104, 115748, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 115659, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Endgame
				{ 118, 115660, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 138632, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Primal Gladiator's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 111067, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Cleaver
				{ 4, 111198, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Hacker
				{ 5, 111070, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Pummeler
				{ 6, 111118, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Gavel
				{ 7, 111200, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Bonecracker
				{ 8, 111071, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Quickblade
				{ 9, 111119, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Mageblade
				{ 10, 111201, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Slicer
				{ 11, 111069, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Ripper
				{ 12, 111199, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Render
				{ 13, 111068, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Shanker
				{ 14, 111117, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Spellblade
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 111202, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Decapitator
				{ 18, 111203, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Bonegrinder
				{ 19, 111075, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Pike
				{ 20, 111204, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Greatsword
				{ 21, 111122, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Battle Staff
				{ 22, 111123, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Energy Staff
				-- Ranged
				{ 23, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 24, 111072, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Longbow
				{ 25, 111074, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Rifle
				--{ 26, 111073, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Heavy Crossbow
				{ 26, 111120, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Baton of Light
				{ 27, 111121, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Gladiator's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 111139, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Redoubt
				{ 103, 111140, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Barrier
				{ 104, 111221, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 111132, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Endgame
				{ 118, 111133, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Gladiator's Reprieve
			},
		},
		{
			name = string.format(AL["ilvl %d"], 620).." (675)",
			[ALLIANCE_DIFF] = {
				{ 1, 138625, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Primal Combatant's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 120053, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Cleaver
				{ 4, 120070, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Hacker
				{ 5, 120056, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Pummeler
				{ 6, 120064, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Gavel
				{ 7, 120072, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Bonecracker
				{ 8, 120057, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Quickblade
				--{ 9, 120065, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Mageblade
				{ 9, 120073, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Slicer
				{ 10, 120055, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Ripper
				{ 11, 120071, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Render
				{ 12, 120054, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Shanker
				{ 13, 120063, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Spellblade				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 120074, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Decapitator
				{ 18, 120075, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Bonegrinder
				{ 19, 120061, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Pike
				{ 20, 120076, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Greatsword
				{ 21, 120062, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Staff
				{ 22, 120068, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Battle Staff
				{ 23, 120069, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 120058, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Longbow
				{ 26, 120060, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Rifle
				{ 27, 120059, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Heavy Crossbow
				{ 28, 120066, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Baton of Light
				{ 29, 120067, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 115082, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Redoubt
				{ 103, 115083, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Barrier
				{ 104, 115148, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 115075, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Endgame
				{ 118, 115076, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 138626, [PRICE_EXTRA_ITTYPE] = "markofhonor:80" }, -- Arsenal: Primal Combatant's Weapons
				-- One-Hand
				{ 2, "INV_Weapon_ShortBlade_05", nil, INVTYPE_WEAPON },
				{ 3, 115024, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Cleaver
				{ 4, 115132, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Hacker
				{ 5, 115027, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Pummeler
				{ 6, 115065, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Gavel
				{ 7, 115134, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Bonecracker
				{ 8, 115028, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Quickblade
				--{ 9, 115066, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Mageblade
				{ 9, 115135, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Slicer
				{ 10, 115026, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Ripper
				{ 11, 115133, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Render
				{ 12, 115025, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Shanker
				{ 13, 115064, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Spellblade
				-- Two-Hand
				{ 16, "INV_Weapon_Halberd_23", nil, INVTYPE_2HWEAPON },
				{ 17, 115136, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Decapitator
				{ 18, 115137, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Bonegrinder
				{ 19, 115032, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Pike
				{ 20, 115138, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Greatsword
				{ 21, 115033, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Staff
				{ 22, 115069, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Battle Staff
				{ 23, 115070, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Energy Staff
				-- Ranged
				{ 24, "INV_Weapon_Bow_06", nil, INVTYPE_RANGED },
				{ 25, 115029, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Longbow
				{ 26, 115031, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Rifle
				{ 27, 115030, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Heavy Crossbow
				{ 28, 115067, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Baton of Light
				{ 29, 115068, [PRICE_EXTRA_ITTYPE] = "markofhonor:5" },	-- Primal Combatant's Touch of Defeat
				-- Shield
				{ 101, "INV_Shield_1H_PVPDraenorS2_D_02", nil, SHIELDSLOT },
				{ 102, 119865, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Redoubt
				{ 103, 119866, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Barrier
				{ 104, 119925, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Shield Wall
				-- Off-Hand
				{ 116, "INV_Offhand_1h_PVPDraenorS1_D_02", nil, INVTYPE_WEAPONOFFHAND },
				{ 117, 119858, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Endgame
				{ 118, 119859, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Primal Combatant's Reprieve
			},
		},
	},
}

-- Mists of Pandaria Season 15
data["MOPS15SETS"] = {
	name = string.format(AL["Season %d"], 15).." "..AL["Class Sets"].." ("..EXPANSION_NAME4..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 102713, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dreadplate Helm
				{ 2, 102652, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Dreadplate Shoulders
				{ 3, 102676, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dreadplate Chestpiece
				{ 4, 102650, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Dreadplate Gauntlets
				{ 5, 102651, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dreadplate Legguards
				{ 16, 103181, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Helm
				{ 17, 103183, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dreadplate Shoulders
				{ 18, 103179, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Chestpiece
				{ 19, 103180, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dreadplate Gauntlets
				{ 20, 103182, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 103378, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Helm
				{ 2, 103380, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dreadplate Shoulders
				{ 3, 103376, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Chestpiece
				{ 4, 103377, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dreadplate Gauntlets
				{ 5, 103379, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Legguards
				{ 16, 102910, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Helm
				{ 17, 102849, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dreadplate Shoulders
				{ 18, 102873, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Chestpiece
				{ 19, 102847, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dreadplate Gauntlets
				{ 20, 102848, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dreadplate Legguards
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				-- Moonkin, 550 > 522
				{ 1, 102634, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Wyrmhide Helm
				{ 2, 102700, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Wyrmhide Spaulders
				{ 3, 102614, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Wyrmhide Robes
				{ 4, 102696, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Wyrmhide Gloves
				{ 5, 102767, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Wyrmhide Legguards
				{ 16, 103202, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Wyrmhide Helm
				{ 17, 103205, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Wyrmhide Spaulders
				{ 18, 103204, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Wyrmhide Robes
				{ 19, 103201, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Wyrmhide Gloves
				{ 20, 103203, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Wyrmhide Legguards
				-- Cat/Bear, 550 > 522
				{ 7, 102653, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dragonhide Helm
				{ 8, 102741, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Dragonhide Spaulders
				{ 9, 102740, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dragonhide Robes
				{ 10, 102739, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Dragonhide Gloves
				{ 11, 102654, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dragonhide Legguards
				{ 22, 103185, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dragonhide Helm
				{ 23, 103188, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dragonhide Spaulders
				{ 24, 103187, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dragonhide Robes
				{ 25, 103184, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dragonhide Gloves
				{ 26, 103186, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dragonhide Legguards
				-- Heal, 550 > 522
				{ 101, 102776, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Kodohide Helm
				{ 102, 102658, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Kodohide Spaulders
				{ 103, 102721, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Kodohide Robes
				{ 104, 102657, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Kodohide Gloves
				{ 105, 102761, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Kodohide Legguards
				{ 116, 103193, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Kodohide Helm
				{ 117, 103196, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Kodohide Spaulders
				{ 118, 103195, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Kodohide Robes
				{ 119, 103192, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Kodohide Gloves
				{ 120, 103194, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Kodohide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Moonkin, 550 > 522
				{ 1, 103399, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Wyrmhide Helm
				{ 2, 103402, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Wyrmhide Spaulders
				{ 3, 103401, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Wyrmhide Robes
				{ 4, 103398, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Wyrmhide Gloves
				{ 5, 103400, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Wyrmhide Legguards
				{ 16, 102831, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Wyrmhide Helm
				{ 17, 102897, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Wyrmhide Spaulders
				{ 18, 102811, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Wyrmhide Robes
				{ 19, 102893, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Wyrmhide Gloves
				{ 20, 102964, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Wyrmhide Legguards
				-- Cat/Bear, 550 > 522
				{ 7, 103382, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dragonhide Helm
				{ 8, 103385, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Dragonhide Spaulders
				{ 9, 103384, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dragonhide Robes
				{ 10, 103381, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Dragonhide Gloves
				{ 11, 103383, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Dragonhide Legguards
				{ 22, 102850, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dragonhide Helm
				{ 23, 102938, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dragonhide Spaulders
				{ 24, 102937, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dragonhide Robes
				{ 25, 102936, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Dragonhide Gloves
				{ 26, 102851, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Dragonhide Legguards
				-- Heal, 550 > 522
				{ 101, 103390, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Kodohide Helm
				{ 102, 103393, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Kodohide Spaulders
				{ 103, 103392, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Kodohide Robes
				{ 104, 103389, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Kodohide Gloves
				{ 105, 103391, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Kodohide Legguards
				{ 116, 102973, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Kodohide Helm
				{ 117, 102855, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Kodohide Spaulders
				{ 118, 102918, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Kodohide Robes
				{ 119, 102854, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Kodohide Gloves
				{ 120, 102958, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Kodohide Legguards
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 102690, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Chain Helm
				{ 2, 102734, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Chain Spaulders
				{ 3, 102689, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Chain Armor
				{ 4, 102737, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Chain Gauntlets
				{ 5, 102670, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Chain Leggings
				{ 16, 103221, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Chain Helm
				{ 17, 103223, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Chain Spaulders
				{ 18, 103219, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Chain Armor
				{ 19, 103220, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Chain Gauntlets
				{ 20, 103222, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 103418, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Chain Helm
				{ 2, 103420, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Chain Spaulders
				{ 3, 103416, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Chain Armor
				{ 4, 103417, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Chain Gauntlets
				{ 5, 103419, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Chain Leggings
				{ 16, 102887, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Chain Helm
				{ 17, 102931, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Chain Spaulders
				{ 18, 102886, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Chain Armor
				{ 19, 102934, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Chain Gauntlets
				{ 20, 102867, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Chain Leggings
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 102667, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Silk Cowl
				{ 2, 102673, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Silk Amice
				{ 3, 102715, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Silk Robe
				{ 4, 102735, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Silk Handguards
				{ 5, 102648, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Silk Trousers
				{ 16, 103225, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Silk Cowl
				{ 17, 103228, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Silk Amice
				{ 18, 103227, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Silk Robe
				{ 19, 103224, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Silk Handguards
				{ 20, 103226, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 103422, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Silk Cowl
				{ 2, 103425, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Silk Amice
				{ 3, 103424, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Silk Robe
				{ 4, 103421, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Silk Handguards
				{ 5, 103423, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Silk Trousers
				{ 16, 102864, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Silk Cowl
				{ 17, 102870, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Silk Amice
				{ 18, 102912, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Silk Robe
				{ 19, 102932, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Silk Handguards
				{ 20, 102845, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Silk Trousers
			},
		},
		{
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				-- Windwalker, 550 > 522
				{ 1, 102712, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ironskin Helm
				{ 2, 102626, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ironskin Spaulders
				{ 3, 102720, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ironskin Tunic
				{ 4, 102675, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ironskin Gloves
				{ 5, 102656, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ironskin Legguards
				{ 16, 103233, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ironskin Helm
				{ 17, 103235, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ironskin Spaulders
				{ 18, 103236, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ironskin Tunic
				{ 19, 103232, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ironskin Gloves
				{ 20, 103234, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ironskin Legguards
				-- Mistweaver, 550 > 522
				{ 7, 102628, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Copperskin Helm
				{ 8, 102777, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Copperskin Spaulders
				{ 9, 102763, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Copperskin Tunic
				{ 10, 102627, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Copperskin Gloves
				{ 11, 102762, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Copperskin Legguards
				{ 22, 103238, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Copperskin Helm
				{ 23, 103240, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Copperskin Spaulders
				{ 24, 103241, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Copperskin Tunic
				{ 25, 103237, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Copperskin Gloves
				{ 26, 103239, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Copperskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Windwalker, 550 > 522
				{ 1, 103430, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ironskin Helm
				{ 2, 103432, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ironskin Spaulders
				{ 3, 103433, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ironskin Tunic
				{ 4, 103429, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ironskin Gloves
				{ 5, 103431, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ironskin Legguards
				{ 16, 102909, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ironskin Helm
				{ 17, 102823, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ironskin Spaulders
				{ 18, 102917, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ironskin Tunic
				{ 19, 102872, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ironskin Gloves
				{ 20, 102853, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ironskin Legguards
				-- Mistweaver, 550 > 522
				{ 7, 103435, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Copperskin Helm
				{ 8, 103437, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Copperskin Spaulders
				{ 9, 103438, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Copperskin Tunic
				{ 10, 103434, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Copperskin Gloves
				{ 11, 103436, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Copperskin Legguards
				{ 22, 102825, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Copperskin Helm
				{ 23, 102974, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Copperskin Spaulders
				{ 24, 102960, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Copperskin Tunic
				{ 25, 102824, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Copperskin Gloves
				{ 26, 102959, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Copperskin Legguards
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				-- Retribution, 550 > 522
				{ 1, 102779, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Scaled Helm
				{ 2, 102744, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Scaled Spaulders
				{ 3, 102747, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Scaled Chestguard
				{ 4, 102630, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Scaled Gloves
				{ 5, 102780, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Scaled Legguards
				{ 16, 103244, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Scaled Helm
				{ 17, 103246, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Scaled Spaulders
				{ 18, 103242, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Scaled Chestguard
				{ 19, 103243, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Scaled Gloves
				{ 20, 103245, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Scaled Legguards
				-- Holy, 550 > 522
				{ 7, 102635, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ornamented Helm
				{ 8, 102697, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ornamented Spaulders
				{ 9, 102632, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ornamented Chestguard
				{ 10, 102722, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ornamented Gloves
				{ 11, 102768, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ornamented Legguards
				{ 22, 103255, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ornamented Helm
				{ 23, 103257, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ornamented Spaulders
				{ 24, 103253, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ornamented Chestguard
				{ 25, 103254, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ornamented Gloves
				{ 26, 103256, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ornamented Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Retribution, 550 > 522
				{ 1, 103441, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Scaled Helm
				{ 2, 103443, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Scaled Spaulders
				{ 3, 103439, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Scaled Chestguard
				{ 4, 103440, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Scaled Gloves
				{ 5, 103442, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Scaled Legguards
				{ 16, 102976, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Scaled Helm
				{ 17, 102941, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Scaled Spaulders
				{ 18, 102944, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Scaled Chestguard
				{ 19, 102827, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Scaled Gloves
				{ 20, 102977, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Scaled Legguards
				-- Holy, 550 > 522
				{ 7, 103452, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ornamented Helm
				{ 8, 103454, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ornamented Spaulders
				{ 9, 103450, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ornamented Chestguard
				{ 10, 103451, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Prideful Gladiator's Ornamented Gloves
				{ 11, 103453, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Prideful Gladiator's Ornamented Legguards
				{ 22, 102832, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ornamented Helm
				{ 23, 102894, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ornamented Spaulders
				{ 24, 102829, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ornamented Chestguard
				{ 25, 102919, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" },	-- Grievous Gladiator's Ornamented Gloves
				{ 26, 102965, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" },	-- Grievous Gladiator's Ornamented Legguards
			},
		},
	},
}
-- Classic Season 13
data["CLASSICS13SETS"] = {
	name = string.format(AL["Season %d"], 13).." "..AL["Class Sets"].." ("..EXPANSION_NAME4..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 91151 }, -- Tyrannical Gladiator's Dreadplate Helm
				{ 2, 91155 }, -- Tyrannical Gladiator's Dreadplate Shoulders
				{ 3, 91147 }, -- Tyrannical Gladiator's Dreadplate Chestpiece
				{ 4, 91149 }, -- Tyrannical Gladiator's Dreadplate Gauntlets
				{ 5, 91153 }, -- Tyrannical Gladiator's Dreadplate Legguards
				{ 16, 91504, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Dreadplate Helm
				{ 17, 91508, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Dreadplate Shoulders
				{ 18, 91500, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Dreadplate Chestpiece
				{ 19, 91502, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Dreadplate Gauntlets
				{ 20, 91506, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94429 }, -- Tyrannical Gladiator's Dreadplate Helm
				{ 2, 94366 }, -- Tyrannical Gladiator's Dreadplate Shoulders
				{ 3, 94392 }, -- Tyrannical Gladiator's Dreadplate Chestpiece
				{ 4, 94364 }, -- Tyrannical Gladiator's Dreadplate Gauntlets
				{ 5, 94365 }, -- Tyrannical Gladiator's Dreadplate Legguards
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 91159 }, -- Tyrannical Gladiator's Dragonhide Helm
				{ 2, 91165 }, -- Tyrannical Gladiator's Dragonhide Spaulders
				{ 3, 91163 }, -- Tyrannical Gladiator's Dragonhide Robes
				{ 4, 91157 }, -- Tyrannical Gladiator's Dragonhide Gloves
				{ 5, 91161 }, -- Tyrannical Gladiator's Dragonhide Legguards
				{ 7, 91174 }, -- Tyrannical Gladiator's Kodohide Helm
				{ 8, 91180 }, -- Tyrannical Gladiator's Kodohide Spaulders
				{ 9, 91178 }, -- Tyrannical Gladiator's Kodohide Robes
				{ 10, 91172 }, -- Tyrannical Gladiator's Kodohide Gloves
				{ 11, 91176 }, -- Tyrannical Gladiator's Kodohide Legguards
				{ 16, 91191 }, -- Tyrannical Gladiator's Wyrmhide Helm
				{ 17, 91197 }, -- Tyrannical Gladiator's Wyrmhide Spaulders
				{ 18, 91195 }, -- Tyrannical Gladiator's Wyrmhide Robes
				{ 19, 91189 }, -- Tyrannical Gladiator's Wyrmhide Gloves
				{ 20, 91193 }, -- Tyrannical Gladiator's Wyrmhide Legguards
				{ 101, 91512, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Dragonhide Helm
				{ 102, 91518, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Dragonhide Spaulders
				{ 103, 91516, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Dragonhide Robes
				{ 104, 91510, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Dragonhide Gloves
				{ 105, 91514, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Dragonhide Legguards
				{ 107, 91527, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Kodohide Helm
				{ 108, 91533, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Kodohide Spaulders
				{ 109, 91531, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Kodohide Robes
				{ 110, 91525, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Kodohide Gloves
				{ 111, 91529, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Kodohide Legguards
				{ 116, 91544, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Wyrmhide Helm
				{ 117, 91550, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Wyrmhide Spaulders
				{ 118, 91548, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Wyrmhide Robes
				{ 119, 91542, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Wyrmhide Gloves
				{ 120, 91546, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94367 }, -- Tyrannical Gladiator's Dragonhide Helm
				{ 2, 94457 }, -- Tyrannical Gladiator's Dragonhide Spaulders
				{ 3, 94456 }, -- Tyrannical Gladiator's Dragonhide Robes
				{ 4, 94455 }, -- Tyrannical Gladiator's Dragonhide Gloves
				{ 5, 94368 }, -- Tyrannical Gladiator's Dragonhide Legguards
				{ 7, 94492 }, -- Tyrannical Gladiator's Kodohide Helm
				{ 8, 94372 }, -- Tyrannical Gladiator's Kodohide Spaulders
				{ 9, 94437 }, -- Tyrannical Gladiator's Kodohide Robes
				{ 10, 94371 }, -- Tyrannical Gladiator's Kodohide Gloves
				{ 11, 94477 }, -- Tyrannical Gladiator's Kodohide Legguards
				{ 16, 94347 }, -- Tyrannical Gladiator's Wyrmhide Helm
				{ 17, 94416 }, -- Tyrannical Gladiator's Wyrmhide Spaulders
				{ 18, 94327 }, -- Tyrannical Gladiator's Wyrmhide Robes
				{ 19, 94412 }, -- Tyrannical Gladiator's Wyrmhide Gloves
				{ 20, 94483 }, -- Tyrannical Gladiator's Wyrmhide Legguards
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 91226 }, -- Tyrannical Gladiator's Chain Helm
				{ 2, 91230 }, -- Tyrannical Gladiator's Chain Spaulders
				{ 3, 91222 }, -- Tyrannical Gladiator's Chain Armor
				{ 4, 91224 }, -- Tyrannical Gladiator's Chain Gauntlets
				{ 5, 91228 }, -- Tyrannical Gladiator's Chain Leggings
				{ 16, 91579, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Chain Helm
				{ 17, 91583, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Chain Spaulders
				{ 18, 91575, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Chain Armor
				{ 19, 91577, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Chain Gauntlets
				{ 20, 91581, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94406 }, -- Tyrannical Gladiator's Chain Helm
				{ 2, 94450 }, -- Tyrannical Gladiator's Chain Spaulders
				{ 3, 94405 }, -- Tyrannical Gladiator's Chain Armor
				{ 4, 94453 }, -- Tyrannical Gladiator's Chain Gauntlets
				{ 5, 94384 }, -- Tyrannical Gladiator's Chain Leggings
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 91234 }, -- Tyrannical Gladiator's Silk Cowl
				{ 2, 91240 }, -- Tyrannical Gladiator's Silk Amice
				{ 3, 91238 }, -- Tyrannical Gladiator's Silk Robe
				{ 4, 91232 }, -- Tyrannical Gladiator's Silk Handguards
				{ 5, 91236 }, -- Tyrannical Gladiator's Silk Trousers
				{ 16, 91587, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Silk Cowl
				{ 17, 91593, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Silk Amice
				{ 18, 91591, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Silk Robe
				{ 19, 91585, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Silk Handguards
				{ 20, 91589, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94381 }, -- Tyrannical Gladiator's Silk Cowl
				{ 2, 94389 }, -- Tyrannical Gladiator's Silk Amice
				{ 3, 94431 }, -- Tyrannical Gladiator's Silk Robe
				{ 4, 94451 }, -- Tyrannical Gladiator's Silk Handguards
				{ 5, 94362 }, -- Tyrannical Gladiator's Silk Trousers
			},
		},
		{
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 91259 }, -- Tyrannical Gladiator's Copperskin Helm
				{ 2, 91263 }, -- Tyrannical Gladiator's Copperskin Spaulders
				{ 3, 91265 }, -- Tyrannical Gladiator's Copperskin Tunic
				{ 4, 91257 }, -- Tyrannical Gladiator's Copperskin Gloves
				{ 5, 91261 }, -- Tyrannical Gladiator's Copperskin Legguards
				{ 16, 91249 }, -- Tyrannical Gladiator's Ironskin Helm
				{ 17, 91253 }, -- Tyrannical Gladiator's Ironskin Spaulders
				{ 18, 91255 }, -- Tyrannical Gladiator's Ironskin Tunic
				{ 19, 91247 }, -- Tyrannical Gladiator's Ironskin Gloves
				{ 20, 91251 }, -- Tyrannical Gladiator's Ironskin Legguards
				{ 7, 91612, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Copperskin Helm
				{ 8, 91616, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Copperskin Spaulders
				{ 9, 91618, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Copperskin Tunic
				{ 10, 91610, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Copperskin Gloves
				{ 11, 91614, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Copperskin Legguards
				{ 22, 91602, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ironskin Helm
				{ 23, 91606, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Ironskin Spaulders
				{ 24, 91608, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ironskin Tunic
				{ 25, 91600, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Ironskin Gloves
				{ 26, 91604, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ironskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94341 }, -- Tyrannical Gladiator's Copperskin Helm
				{ 2, 94493 }, -- Tyrannical Gladiator's Copperskin Spaulders
				{ 3, 94479 }, -- Tyrannical Gladiator's Copperskin Tunic
				{ 4, 94340 }, -- Tyrannical Gladiator's Copperskin Gloves
				{ 5, 94478 }, -- Tyrannical Gladiator's Copperskin Legguards
				{ 16, 94428 }, -- Tyrannical Gladiator's Ironskin Helm
				{ 17, 94339 }, -- Tyrannical Gladiator's Ironskin Spaulders
				{ 18, 94436 }, -- Tyrannical Gladiator's Ironskin Tunic
				{ 19, 94391 }, -- Tyrannical Gladiator's Ironskin Gloves
				{ 20, 94370 }, -- Tyrannical Gladiator's Ironskin Legguards
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 91291 }, -- Tyrannical Gladiator's Ornamented Headcover
				{ 2, 91295 }, -- Tyrannical Gladiator's Ornamented Spaulders
				{ 3, 91287 }, -- Tyrannical Gladiator's Ornamented Chestguard
				{ 4, 91289 }, -- Tyrannical Gladiator's Ornamented Gloves
				{ 5, 91293 }, -- Tyrannical Gladiator's Ornamented Legplates
				{ 16, 91271 }, -- Tyrannical Gladiator's Scaled Helm
				{ 17, 91275 }, -- Tyrannical Gladiator's Scaled Shoulders
				{ 18, 91267 }, -- Tyrannical Gladiator's Scaled Chestpiece
				{ 19, 91269 }, -- Tyrannical Gladiator's Scaled Gauntlets
				{ 20, 91273 }, -- Tyrannical Gladiator's Scaled Legguards
				{ 7, 91644, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ornamented Headcover
				{ 8, 91648, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Ornamented Spaulders
				{ 9, 91640, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ornamented Chestguard
				{ 10, 91642, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Ornamented Gloves
				{ 11, 91646, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ornamented Legplates
				{ 22, 91624, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Scaled Helm
				{ 23, 91628, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Scaled Shoulders
				{ 24, 91620, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Scaled Chestpiece
				{ 25, 91622, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Scaled Gauntlets
				{ 26, 91626, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94348 }, -- Tyrannical Gladiator's Ornamented Headcover
				{ 2, 94413 }, -- Tyrannical Gladiator's Ornamented Spaulders
				{ 3, 94345 }, -- Tyrannical Gladiator's Ornamented Chestguard
				{ 4, 94438 }, -- Tyrannical Gladiator's Ornamented Gloves
				{ 5, 94484 }, -- Tyrannical Gladiator's Ornamented Legplates
				{ 16, 94495 }, -- Tyrannical Gladiator's Scaled Helm
				{ 17, 94460 }, -- Tyrannical Gladiator's Scaled Shoulders
				{ 18, 94463 }, -- Tyrannical Gladiator's Scaled Chestpiece
				{ 19, 94343 }, -- Tyrannical Gladiator's Scaled Gauntlets
				{ 20, 94496 }, -- Tyrannical Gladiator's Scaled Legguards
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 91311 }, -- Tyrannical Gladiator's Mooncloth Helm
				{ 2, 91317 }, -- Tyrannical Gladiator's Mooncloth Mantle
				{ 3, 91315 }, -- Tyrannical Gladiator's Mooncloth Robe
				{ 4, 91309 }, -- Tyrannical Gladiator's Mooncloth Gloves
				{ 5, 91313 }, -- Tyrannical Gladiator's Mooncloth Leggings
				{ 16, 91321 }, -- Tyrannical Gladiator's Satin Hood
				{ 17, 91327 }, -- Tyrannical Gladiator's Satin Mantle
				{ 18, 91325 }, -- Tyrannical Gladiator's Satin Robe
				{ 19, 91319 }, -- Tyrannical Gladiator's Satin Gloves
				{ 20, 91323 }, -- Tyrannical Gladiator's Satin Leggings
				{ 7, 91664, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Mooncloth Helm
				{ 8, 91670, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Mooncloth Mantle
				{ 9, 91668, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Mooncloth Robe
				{ 10, 91662, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Mooncloth Gloves
				{ 11, 91666, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Mooncloth Leggings
				{ 22, 91674, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Satin Hood
				{ 23, 91680, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Satin Mantle
				{ 24, 91678, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Satin Robe
				{ 25, 91672, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Satin Gloves
				{ 26, 91676, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94419 }, -- Tyrannical Gladiator's Mooncloth Helm
				{ 2, 94466 }, -- Tyrannical Gladiator's Mooncloth Mantle
				{ 3, 94397 }, -- Tyrannical Gladiator's Mooncloth Robe
				{ 4, 94328 }, -- Tyrannical Gladiator's Mooncloth Gloves
				{ 5, 94420 }, -- Tyrannical Gladiator's Mooncloth Leggings
				{ 16, 94467 }, -- Tyrannical Gladiator's Satin Hood
				{ 17, 94385 }, -- Tyrannical Gladiator's Satin Mantle
				{ 18, 94335 }, -- Tyrannical Gladiator's Satin Robe
				{ 19, 94423 }, -- Tyrannical Gladiator's Satin Gloves
				{ 20, 94334 }, -- Tyrannical Gladiator's Satin Leggings
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 91344 }, -- Tyrannical Gladiator's Leather Helm
				{ 2, 91348 }, -- Tyrannical Gladiator's Leather Spaulders
				{ 3, 91340 }, -- Tyrannical Gladiator's Leather Tunic
				{ 4, 91342 }, -- Tyrannical Gladiator's Leather Gloves
				{ 5, 91346 }, -- Tyrannical Gladiator's Leather Legguards
				{ 16, 91697, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Leather Helm
				{ 17, 91701, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Leather Spaulders
				{ 18, 91693, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Leather Tunic
				{ 19, 91695, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Leather Gloves
				{ 20, 91699, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94426 }, -- Tyrannical Gladiator's Leather Helm
				{ 2, 94447 }, -- Tyrannical Gladiator's Leather Spaulders
				{ 3, 94443 }, -- Tyrannical Gladiator's Leather Tunic
				{ 4, 94377 }, -- Tyrannical Gladiator's Leather Gloves
				{ 5, 94446 }, -- Tyrannical Gladiator's Leather Legguards
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 91372 }, -- Tyrannical Gladiator's Linked Helm
				{ 2, 91376 }, -- Tyrannical Gladiator's Linked Spaulders
				{ 3, 91368 }, -- Tyrannical Gladiator's Linked Armor
				{ 4, 91370 }, -- Tyrannical Gladiator's Linked Gauntlets
				{ 5, 91374 }, -- Tyrannical Gladiator's Linked Leggings
				{ 7, 91384 }, -- Tyrannical Gladiator's Mail Helm
				{ 8, 91388 }, -- Tyrannical Gladiator's Mail Spaulders
				{ 9, 91380 }, -- Tyrannical Gladiator's Mail Armor
				{ 10, 91382 }, -- Tyrannical Gladiator's Mail Gauntlets
				{ 11, 91386 }, -- Tyrannical Gladiator's Mail Leggings
				{ 16, 91362 }, -- Tyrannical Gladiator's Ringmail Helm
				{ 17, 91366 }, -- Tyrannical Gladiator's Ringmail Spaulders
				{ 18, 91358 }, -- Tyrannical Gladiator's Ringmail Armor
				{ 19, 91360 }, -- Tyrannical Gladiator's Ringmail Gauntlets
				{ 20, 91364 }, -- Tyrannical Gladiator's Ringmail Leggings
				{ 101, 91725, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Linked Helm
				{ 102, 91729, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Linked Spaulders
				{ 103, 91721, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Linked Armor
				{ 104, 91723, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Linked Gauntlets
				{ 105, 91727, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Linked Leggings
				{ 107, 91737, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Mail Helm
				{ 108, 91741, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Mail Spaulders
				{ 109, 91733, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Mail Armor
				{ 110, 91735, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Mail Gauntlets
				{ 111, 91739, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Mail Leggings
				{ 116, 91715, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ringmail Helm
				{ 117, 91719, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Ringmail Spaulders
				{ 118, 91711, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ringmail Armor
				{ 119, 91713, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Ringmail Gauntlets
				{ 120, 91717, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94430 }, -- Tyrannical Gladiator's Linked Helm
				{ 2, 94342 }, -- Tyrannical Gladiator's Linked Spaulders
				{ 3, 94475 }, -- Tyrannical Gladiator's Linked Armor
				{ 4, 94458 }, -- Tyrannical Gladiator's Linked Gauntlets
				{ 5, 94494 }, -- Tyrannical Gladiator's Linked Leggings
				{ 7, 94409 }, -- Tyrannical Gladiator's Mail Helm
				{ 8, 94350 }, -- Tyrannical Gladiator's Mail Spaulders
				{ 9, 94459 }, -- Tyrannical Gladiator's Mail Armor
				{ 10, 94408 }, -- Tyrannical Gladiator's Mail Gauntlets
				{ 11, 94497 }, -- Tyrannical Gladiator's Mail Leggings
				{ 16, 94434 }, -- Tyrannical Gladiator's Ringmail Helm
				{ 17, 94369 }, -- Tyrannical Gladiator's Ringmail Spaulders
				{ 18, 94433 }, -- Tyrannical Gladiator's Ringmail Armor
				{ 19, 94490 }, -- Tyrannical Gladiator's Ringmail Gauntlets
				{ 20, 94435 }, -- Tyrannical Gladiator's Ringmail Leggings
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 91422 }, -- Tyrannical Gladiator's Felweave Cowl
				{ 2, 91428 }, -- Tyrannical Gladiator's Felweave Amice
				{ 3, 91426 }, -- Tyrannical Gladiator's Felweave Raiment
				{ 4, 91420 }, -- Tyrannical Gladiator's Felweave Handguards
				{ 5, 91424 }, -- Tyrannical Gladiator's Felweave Trousers
				{ 16, 91775, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Felweave Cowl
				{ 17, 91781, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Felweave Amice
				{ 18, 91779, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Felweave Raiment
				{ 19, 91773, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Felweave Handguards
				{ 20, 91777, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94442 }, -- Tyrannical Gladiator's Felweave Cowl
				{ 2, 94398 }, -- Tyrannical Gladiator's Felweave Amice
				{ 3, 94375 }, -- Tyrannical Gladiator's Felweave Raiment
				{ 4, 94441 }, -- Tyrannical Gladiator's Felweave Handguards
				{ 5, 94471 }, -- Tyrannical Gladiator's Felweave Trousers
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 91434 }, -- Tyrannical Gladiator's Plate Helm
				{ 2, 91438 }, -- Tyrannical Gladiator's Plate Shoulders
				{ 3, 91430 }, -- Tyrannical Gladiator's Plate Chestpiece
				{ 4, 91432 }, -- Tyrannical Gladiator's Plate Gauntlets
				{ 5, 91436 }, -- Tyrannical Gladiator's Plate Legguards
				{ 16, 91787, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Plate Helm
				{ 17, 91791, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Plate Shoulders
				{ 18, 91783, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Plate Chestpiece
				{ 19, 91785, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Malevolent Gladiator's Plate Gauntlets
				{ 20, 91789, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Malevolent Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 94332 }, -- Tyrannical Gladiator's Plate Helm
				{ 2, 94401 }, -- Tyrannical Gladiator's Plate Shoulders
				{ 3, 94444 }, -- Tyrannical Gladiator's Plate Chestpiece
				{ 4, 94331 }, -- Tyrannical Gladiator's Plate Gauntlets
				{ 5, 94448 }, -- Tyrannical Gladiator's Plate Legguards
			},
		},
	},
}
-- Classic Season 12
data["CLASSICS12SETS"] = {
	name = string.format(AL["Season %d"], 12).." "..AL["Class Sets"].." ("..EXPANSION_NAME4..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 84853 }, -- Malevolent Gladiator's Dreadplate Helm
				{ 2, 84918 }, -- Malevolent Gladiator's Dreadplate Shoulders
				{ 3, 84795 }, -- Malevolent Gladiator's Dreadplate Chestpiece
				{ 4, 84835 }, -- Malevolent Gladiator's Dreadplate Gauntlets
				{ 5, 84872 }, -- Malevolent Gladiator's Dreadplate Legguards
				{ 16, 84374, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Dreadplate Helm
				{ 17, 84376, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Dreadplate Shoulders
				{ 18, 84372, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Dreadplate Chestpiece
				{ 19, 84373, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Dreadplate Gauntlets
				{ 20, 84375, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 84852 }, -- Malevolent Gladiator's Dragonhide Helm
				{ 2, 84916 }, -- Malevolent Gladiator's Dragonhide Spaulders
				{ 3, 84901 }, -- Malevolent Gladiator's Dragonhide Robes
				{ 4, 84832 }, -- Malevolent Gladiator's Dragonhide Gloves
				{ 5, 84871 }, -- Malevolent Gladiator's Dragonhide Legguards
				{ 7, 84850 }, -- Malevolent Gladiator's Kodohide Helm
				{ 8, 84927 }, -- Malevolent Gladiator's Kodohide Spaulders
				{ 9, 84907 }, -- Malevolent Gladiator's Kodohide Robes
				{ 10, 84833 }, -- Malevolent Gladiator's Kodohide Gloves
				{ 11, 84882 }, -- Malevolent Gladiator's Kodohide Legguards
				{ 16, 84861 }, -- Malevolent Gladiator's Wyrmhide Helm
				{ 17, 84925 }, -- Malevolent Gladiator's Wyrmhide Spaulders
				{ 18, 84906 }, -- Malevolent Gladiator's Wyrmhide Robes
				{ 19, 84843 }, -- Malevolent Gladiator's Wyrmhide Gloves
				{ 20, 84880 }, -- Malevolent Gladiator's Wyrmhide Legguards
				{ 101, 84378, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Dragonhide Helm
				{ 102, 84381, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Dragonhide Spaulders
				{ 103, 84380, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Dragonhide Robes
				{ 104, 84377, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Dragonhide Gloves
				{ 105, 84379, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Dragonhide Legguards
				{ 107, 84386, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Kodohide Helm
				{ 109, 84389, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Kodohide Spaulders
				{ 110, 84388, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Kodohide Robes
				{ 111, 84385, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Kodohide Gloves
				{ 112, 84387, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Kodohide Legguards
				{ 116, 84394, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Wyrmhide Helm
				{ 117, 84397, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Wyrmhide Spaulders
				{ 118, 84396, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Wyrmhide Robes
				{ 119, 84393, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Wyrmhide Gloves
				{ 120, 84395, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 84858 }, -- Malevolent Gladiator's Chain Helm
				{ 2, 84921 }, -- Malevolent Gladiator's Chain Spaulders
				{ 3, 84796 }, -- Malevolent Gladiator's Chain Armor
				{ 4, 84841 }, -- Malevolent Gladiator's Chain Gauntlets
				{ 5, 84874 }, -- Malevolent Gladiator's Chain Leggings
				{ 16, 84410, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Chain Helm
				{ 17, 84412, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Chain Spaulders
				{ 18, 84408, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Chain Armor
				{ 19, 84409, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Chain Gauntlets
				{ 20, 84411, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 84855 }, -- Malevolent Gladiator's Silk Cowl
				{ 2, 84917 }, -- Malevolent Gladiator's Silk Amice
				{ 3, 84904 }, -- Malevolent Gladiator's Silk Robe
				{ 4, 84837 }, -- Malevolent Gladiator's Silk Handguards
				{ 5, 84875 }, -- Malevolent Gladiator's Silk Trousers
				{ 16, 84414, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Silk Cowl
				{ 17, 84417, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Silk Amice
				{ 18, 84416, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Silk Robe
				{ 19, 84413, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Silk Handguards
				{ 20, 84415, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 84854 }, -- Malevolent Gladiator's Copperskin Helm
				{ 2, 84920 }, -- Malevolent Gladiator's Copperskin Spaulders
				{ 3, 84903 }, -- Malevolent Gladiator's Copperskin Tunic
				{ 4, 84836 }, -- Malevolent Gladiator's Copperskin Gloves
				{ 5, 84873 }, -- Malevolent Gladiator's Copperskin Legguards
				{ 7, 84857 }, -- Malevolent Gladiator's Ironskin Helm
				{ 8, 84919 }, -- Malevolent Gladiator's Ironskin Spaulders
				{ 9, 84902 }, -- Malevolent Gladiator's Ironskin Tunic
				{ 10, 84839 }, -- Malevolent Gladiator's Ironskin Gloves
				{ 11, 84877 }, -- Malevolent Gladiator's Ironskin Legguards
				{ 16, 84549, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Copperskin Helm
				{ 17, 84552, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Copperskin Spaulders
				{ 18, 84551, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Copperskin Tunic
				{ 19, 84548, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Copperskin Gloves
				{ 20, 84550, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Copperskin Legguards
				{ 22, 84544, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ironskin Helm
				{ 23, 84547, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Ironskin Spaulders
				{ 24, 84546, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ironskin Tunic
				{ 25, 84543, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Ironskin Gloves
				{ 26, 84545, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ironskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 84849 }, -- Malevolent Gladiator's Ornamented Headcover
				{ 2, 84914 }, -- Malevolent Gladiator's Ornamented Spaulders
				{ 3, 84793 }, -- Malevolent Gladiator's Ornamented Chestguard
				{ 4, 84831 }, -- Malevolent Gladiator's Ornamented Gloves
				{ 5, 84869 }, -- Malevolent Gladiator's Ornamented Legplates
				{ 7, 84851 }, -- Malevolent Gladiator's Scaled Helm
				{ 8, 84915 }, -- Malevolent Gladiator's Scaled Shoulders
				{ 9, 84794 }, -- Malevolent Gladiator's Scaled Chestpiece
				{ 10, 84834 }, -- Malevolent Gladiator's Scaled Gauntlets
				{ 11, 84870 }, -- Malevolent Gladiator's Scaled Legguards
				{ 16, 84431, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ornamented Headcover
				{ 17, 84433, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Ornamented Spaulders
				{ 18, 84429, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ornamented Chestguard
				{ 19, 84430, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Ornamented Gloves
				{ 20, 84432, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ornamented Legplates
				{ 22, 84420, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Scaled Helm
				{ 23, 84422, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Scaled Shoulders
				{ 24, 84418, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Scaled Chestpiece
				{ 25, 84419, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Scaled Gauntlets
				{ 26, 84421, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 84863 }, -- Malevolent Gladiator's Mooncloth Helm
				{ 2, 84928 }, -- Malevolent Gladiator's Mooncloth Mantle
				{ 3, 84908 }, -- Malevolent Gladiator's Mooncloth Robe
				{ 4, 84846 }, -- Malevolent Gladiator's Mooncloth Gloves
				{ 5, 84883 }, -- Malevolent Gladiator's Mooncloth Leggings
				{ 7, 84864 }, -- Malevolent Gladiator's Satin Hood
				{ 8, 84929 }, -- Malevolent Gladiator's Satin Mantle
				{ 9, 84909 }, -- Malevolent Gladiator's Satin Robe
				{ 10, 84838 }, -- Malevolent Gladiator's Satin Gloves
				{ 11, 84884 }, -- Malevolent Gladiator's Satin Leggings
				{ 16, 84441, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Mooncloth Helm
				{ 17, 84444, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Mooncloth Mantle
				{ 18, 84443, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Mooncloth Robe
				{ 19, 84440, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Mooncloth Gloves
				{ 20, 84442, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Mooncloth Leggings
				{ 22, 84446, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Satin Hood
				{ 23, 84449, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Satin Mantle
				{ 24, 84448, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Satin Robe
				{ 25, 84445, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Satin Gloves
				{ 26, 84447, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 84848 }, -- Malevolent Gladiator's Leather Helm
				{ 2, 84913 }, -- Malevolent Gladiator's Leather Spaulders
				{ 3, 84792 }, -- Malevolent Gladiator's Leather Tunic
				{ 4, 84830 }, -- Malevolent Gladiator's Leather Gloves
				{ 5, 84868 }, -- Malevolent Gladiator's Leather Legguards
				{ 16, 84464, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Leather Helm
				{ 17, 84466, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Leather Spaulders
				{ 18, 84462, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Leather Tunic
				{ 19, 84463, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Leather Gloves
				{ 20, 84465, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 84862 }, -- Malevolent Gladiator's Linked Helm
				{ 2, 84926 }, -- Malevolent Gladiator's Linked Spaulders
				{ 3, 84799 }, -- Malevolent Gladiator's Linked Armor
				{ 4, 84844 }, -- Malevolent Gladiator's Linked Gauntlets
				{ 5, 84881 }, -- Malevolent Gladiator's Linked Leggings
				{ 7, 84860 }, -- Malevolent Gladiator's Mail Helm
				{ 8, 84924 }, -- Malevolent Gladiator's Mail Spaulders
				{ 9, 84798 }, -- Malevolent Gladiator's Mail Armor
				{ 10, 84845 }, -- Malevolent Gladiator's Mail Gauntlets
				{ 11, 84879 }, -- Malevolent Gladiator's Mail Leggings
				{ 16, 84865 }, -- Malevolent Gladiator's Ringmail Helm
				{ 17, 84930 }, -- Malevolent Gladiator's Ringmail Spaulders
				{ 18, 84800 }, -- Malevolent Gladiator's Ringmail Armor
				{ 19, 84847 }, -- Malevolent Gladiator's Ringmail Gauntlets
				{ 20, 84885 }, -- Malevolent Gladiator's Ringmail Leggings
				{ 101, 84479, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Linked Helm
				{ 102, 84481, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Linked Spaulders
				{ 103, 84477, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Linked Armor
				{ 104, 84478, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Linked Gauntlets
				{ 205, 84480, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Linked Leggings
				{ 107, 84485, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Mail Helm
				{ 108, 84487, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Mail Spaulders
				{ 109, 84483, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Mail Armor
				{ 110, 84484, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Mail Gauntlets
				{ 111, 84486, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Mail Leggings
				{ 116, 84474, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ringmail Helm
				{ 117, 84476, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Ringmail Spaulders
				{ 118, 84472, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ringmail Armor
				{ 119, 84473, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Ringmail Gauntlets
				{ 120, 84475, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 84859 }, -- Malevolent Gladiator's Felweave Cowl
				{ 2, 84923 }, -- Malevolent Gladiator's Felweave Amice
				{ 3, 84905 }, -- Malevolent Gladiator's Felweave Raiment
				{ 4, 84842 }, -- Malevolent Gladiator's Felweave Handguards
				{ 5, 84878 }, -- Malevolent Gladiator's Felweave Trousers
				{ 16, 84500, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Felweave Cowl
				{ 17, 84503, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Felweave Amice
				{ 18, 84502, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Felweave Raiment
				{ 19, 84499, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Felweave Handguards
				{ 20, 84501, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 84856 }, -- Malevolent Gladiator's Plate Helm
				{ 2, 84922 }, -- Malevolent Gladiator's Plate Shoulders
				{ 3, 84797 }, -- Malevolent Gladiator's Plate Chestpiece
				{ 4, 84840 }, -- Malevolent Gladiator's Plate Gauntlets
				{ 5, 84876 }, -- Malevolent Gladiator's Plate Legguards
				{ 16, 84506, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Plate Helm
				{ 17, 84508, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Plate Shoulders
				{ 18, 84504, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Plate Chestpiece
				{ 19, 84505, [PRICE_EXTRA_ITTYPE] = "markofhonor:2" }, -- Dreadful Gladiator's Plate Gauntlets
				{ 20, 84507, [PRICE_EXTRA_ITTYPE] = "markofhonor:3" }, -- Dreadful Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 11
data["CLASSICS11SETS"] = {
	name = string.format(AL["Season %d"], 11).." "..AL["Class Sets"].." ("..EXPANSION_NAME3..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 73618, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Dreadplate Helm
				{ 2, 73616, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Dreadplate Shoulders
				{ 3, 73620, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Dreadplate Chestpiece
				{ 4, 73619, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Dreadplate Gauntlets
				{ 5, 73617, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Dreadplate Legguards
				{ 16, 72334, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dreadplate Helm
				{ 17, 72336, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dreadplate Shoulders
				{ 18, 72332, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dreadplate Chestpiece
				{ 19, 72333, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dreadplate Gauntlets
				{ 20, 72335, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 73614, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Dragonhide Helm
				{ 2, 73611, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Dragonhide Spaulders
				{ 3, 73612, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Dragonhide Robes
				{ 4, 73615, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Dragonhide Gloves
				{ 5, 73613, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Dragonhide Legguards
				{ 7, 73606, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Kodohide Helm
				{ 8, 73603, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Kodohide Spaulders
				{ 9, 73604, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Kodohide Robes
				{ 10, 73607, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Kodohide Gloves
				{ 11, 73605, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Kodohide Legguards
				{ 16, 73598, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Wyrmhide Helm
				{ 17, 73595, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Wyrmhide Spaulders
				{ 18, 73596, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Wyrmhide Robes
				{ 19, 73599, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Wyrmhide Gloves
				{ 20, 73597, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Wyrmhide Legguards
				{ 22, 72338, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dragonhide Helm
				{ 23, 72341, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dragonhide Spaulders
				{ 24, 72340, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dragonhide Robes
				{ 25, 72337, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dragonhide Gloves
				{ 26, 72339, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dragonhide Legguards
				{ 27, 72346, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Kodohide Helm
				{ 101, 72349, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Kodohide Spaulders
				{ 102, 72348, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Kodohide Robes
				{ 103, 72345, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Kodohide Gloves
				{ 104, 72347, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Kodohide Legguards
				{ 116, 72354, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Wyrmhide Helm
				{ 117, 72357, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Wyrmhide Spaulders
				{ 118, 72356, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Wyrmhide Robes
				{ 119, 72353, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Wyrmhide Gloves
				{ 120, 72355, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 73582, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Chain Helm
				{ 2, 73580, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Chain Spaulders
				{ 3, 73584, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Chain Armor
				{ 4, 73583, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Chain Gauntlets
				{ 5, 73581, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Chain Leggings
				{ 16, 72370, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Chain Helm
				{ 17, 72372, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Chain Spaulders
				{ 18, 72368, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Chain Armor
				{ 19, 72369, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Chain Gauntlets
				{ 20, 72371, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 73575, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Silk Cowl
				{ 2, 73572, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Silk Amice
				{ 3, 73573, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Silk Robe
				{ 4, 73576, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Silk Handguards
				{ 5, 73574, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Silk Trousers
				{ 16, 72374, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Silk Cowl
				{ 17, 72377, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Silk Amice
				{ 18, 72376, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Silk Robe
				{ 19, 72373, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Silk Handguards
				{ 20, 72375, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 73558, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ornamented Headcover
				{ 2, 73556, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Ornamented Spaulders
				{ 3, 73560, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ornamented Chestguard
				{ 3, 88170, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ornamented Battlerobe
				{ 4, 73559, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Ornamented Gloves
				{ 5, 73557, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ornamented Legplates
				{ 7, 73569, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Scaled Helm
				{ 8, 73567, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Scaled Shoulders
				{ 9, 73571, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Scaled Chestpiece
				{ 10, 73570, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Scaled Gauntlets
				{ 11, 73568, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Scaled Legguards
				{ 16, 72391, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ornamented Headcover
				{ 17, 72393, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ornamented Spaulders
				{ 18, 72389, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ornamented Chestguard
				{ 19, 72390, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ornamented Gloves
				{ 20, 72392, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ornamented Legplates
				{ 22, 72380, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Scaled Helm
				{ 23, 72382, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Scaled Shoulders
				{ 24, 72378, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Scaled Chestpiece
				{ 25, 72379, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Scaled Gauntlets
				{ 26, 72381, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 73548, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Mooncloth Helm
				{ 2, 73545, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Mooncloth Mantle
				{ 3, 73546, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Mooncloth Robe
				{ 4, 73549, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Mooncloth Gloves
				{ 5, 73547, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Mooncloth Leggings
				{ 7, 73543, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Satin Hood
				{ 8, 73540, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Satin Mantle
				{ 9, 73541, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Satin Robe
				{ 10, 73544, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Satin Gloves
				{ 11, 73542, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Satin Leggings
				{ 16, 72401, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mooncloth Helm
				{ 17, 72404, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mooncloth Mantle
				{ 18, 72403, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mooncloth Robe
				{ 19, 72400, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mooncloth Gloves
				{ 20, 72402, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mooncloth Leggings
				{ 22, 72406, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Satin Hood
				{ 23, 72409, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Satin Mantle
				{ 24, 72408, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Satin Robe
				{ 25, 72405, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Satin Gloves
				{ 26, 72407, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 73525, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Leather Helm
				{ 2, 73523, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Leather Spaulders
				{ 3, 73527, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Leather Tunic
				{ 4, 73526, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Leather Gloves
				{ 5, 73524, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Leather Legguards
				{ 16, 72424, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Leather Helm
				{ 17, 72426, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Leather Spaulders
				{ 18, 72422, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Leather Tunic
				{ 19, 72423, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Leather Gloves
				{ 20, 72425, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 73510, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Linked Helm
				{ 2, 73508, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Linked Spaulders
				{ 3, 73512, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Linked Armor
				{ 4, 73511, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Linked Gauntlets
				{ 5, 73509, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Linked Leggings
				{ 7, 73504, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Mail Helm
				{ 8, 73502, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Mail Spaulders
				{ 9, 73506, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Mail Armor
				{ 10, 73505, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Mail Gauntlets
				{ 11, 73503, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Mail Leggings
				{ 16, 73515, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ringmail Helm
				{ 17, 73513, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Ringmail Spaulders
				{ 18, 73517, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ringmail Armor
				{ 19, 73516, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Ringmail Gauntlets
				{ 20, 73514, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Ringmail Leggings
				{ 22, 72439, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Linked Helm
				{ 23, 72441, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Linked Spaulders
				{ 24, 72437, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Linked Armor
				{ 25, 72438, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Linked Gauntlets
				{ 26, 72440, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Linked Leggings
				{ 101, 72445, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mail Helm
				{ 102, 72447, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mail Spaulders
				{ 103, 72443, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mail Armor
				{ 104, 72444, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mail Gauntlets
				{ 105, 72446, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mail Leggings
				{ 116, 72434, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ringmail Helm
				{ 117, 72436, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ringmail Spaulders
				{ 118, 72432, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ringmail Armor
				{ 119, 72433, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ringmail Gauntlets
				{ 120, 72435, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 73486, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Felweave Cowl
				{ 2, 73483, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Felweave Amice
				{ 3, 73484, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Felweave Raiment
				{ 4, 73487, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Felweave Handguards
				{ 5, 73485, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Felweave Trousers
				{ 16, 72460, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Felweave Cowl
				{ 17, 72463, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Felweave Amice
				{ 18, 72462, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Felweave Raiment
				{ 19, 72459, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Felweave Handguards
				{ 20, 72461, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 73480, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Plate Helm
				{ 2, 73478, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Plate Shoulders
				{ 3, 73482, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Plate Chestpiece
				{ 4, 73481, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Cataclysmic Gladiator's Plate Gauntlets
				{ 5, 73479, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Cataclysmic Gladiator's Plate Legguards
				{ 16, 72466, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Plate Helm
				{ 17, 72468, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Plate Shoulders
				{ 18, 72464, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Plate Chestpiece
				{ 19, 72465, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Plate Gauntlets
				{ 20, 72467, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 10
data["CLASSICS10SETS"] = {
	name = string.format(AL["Season %d"], 10).." "..AL["Class Sets"].." ("..EXPANSION_NAME3..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 70246, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dreadplate Helm
				{ 2, 70248, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dreadplate Shoulders
				{ 3, 70244, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dreadplate Chestpiece
				{ 4, 70245, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dreadplate Gauntlets
				{ 5, 70247, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 70280, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dragonhide Helm
				{ 2, 70283, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dragonhide Spaulders
				{ 3, 70282, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dragonhide Robes
				{ 4, 70279, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Dragonhide Gloves
				{ 5, 70281, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Dragonhide Legguards
				{ 7, 70285, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Kodohide Helm
				{ 8, 70288, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Kodohide Spaulders
				{ 9, 70287, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Kodohide Robes
				{ 10, 70284, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Kodohide Gloves
				{ 11, 70286, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Kodohide Legguards
				{ 16, 70290, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Wyrmhide Helm
				{ 17, 70293, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Wyrmhide Spaulders
				{ 18, 70292, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Wyrmhide Robes
				{ 19, 70289, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Wyrmhide Gloves
				{ 20, 70291, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 70261, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Chain Helm
				{ 2, 70263, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Chain Spaulders
				{ 3, 70259, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Chain Armor
				{ 4, 70260, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Chain Gauntlets
				{ 5, 70262, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 70300, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Silk Cowl
				{ 2, 70303, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Silk Amice
				{ 3, 70302, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Silk Robe
				{ 4, 70299, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Silk Handguards
				{ 5, 70301, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 70355, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ornamented Headcover
				{ 2, 70357, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ornamented Spaulders
				{ 3, 70353, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ornamented Chestguard
				{ 4, 70354, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ornamented Gloves
				{ 5, 70356, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ornamented Legplates
				{ 16, 70251, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Scaled Helm
				{ 17, 70253, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Scaled Shoulders
				{ 18, 70249, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Scaled Chestpiece
				{ 19, 70250, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Scaled Gauntlets
				{ 20, 70252, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 70305, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mooncloth Helm
				{ 2, 70308, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mooncloth Mantle
				{ 3, 70307, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mooncloth Robe
				{ 4, 70304, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mooncloth Gloves
				{ 5, 70306, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mooncloth Leggings
				{ 16, 70310, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Satin Hood
				{ 17, 70313, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Satin Mantle
				{ 18, 70312, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Satin Robe
				{ 19, 70309, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Satin Gloves
				{ 20, 70311, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 70296, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Leather Helm
				{ 2, 70298, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Leather Spaulders
				{ 3, 70294, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Leather Tunic
				{ 4, 70295, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Leather Gloves
				{ 5, 70297, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 70271, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Linked Helm
				{ 2, 70273, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Linked Spaulders
				{ 3, 70269, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Linked Armor
				{ 4, 70270, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Linked Gauntlets
				{ 5, 70272, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Linked Leggings
				{ 7, 70276, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mail Helm
				{ 8, 70278, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mail Spaulders
				{ 9, 70274, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mail Armor
				{ 10, 70275, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Mail Gauntlets
				{ 11, 70277, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Mail Leggings
				{ 16, 70266, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ringmail Helm
				{ 17, 70268, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ringmail Spaulders
				{ 18, 70264, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ringmail Armor
				{ 19, 70265, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Ringmail Gauntlets
				{ 20, 70267, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 70315, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Felweave Cowl
				{ 2, 70318, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Felweave Amice
				{ 3, 70317, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Felweave Raiment
				{ 4, 70314, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Felweave Handguards
				{ 5, 70316, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 70256, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Plate Helm
				{ 2, 70258, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Plate Shoulders
				{ 3, 70254, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Plate Chestpiece
				{ 4, 70255, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Ruthless Gladiator's Plate Gauntlets
				{ 5, 70257, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Ruthless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}

-- Classic Season 9
data["CLASSICS9SETS"] = {
	name = string.format(AL["Season %d"], 9).." "..AL["Class Sets"].." ("..EXPANSION_NAME3..")",
	ContentType = NORMAL_ITTYPE,
	items = {
			{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 60410, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Dreadplate Helm
				{ 2, 60412, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Dreadplate Shoulders
				{ 3, 60408, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Dreadplate Chestpiece
				{ 4, 60409, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Dreadplate Gauntlets
				{ 5, 60411, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 60444, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Dragonhide Helm
				{ 2, 60447, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Dragonhide Spaulders
				{ 3, 60446, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Dragonhide Robes
				{ 4, 60443, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Dragonhide Gloves
				{ 5, 60445, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Dragonhide Legguards
				{ 7, 60449, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Kodohide Helm
				{ 8, 60452, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Kodohide Spaulders
				{ 9, 60451, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Kodohide Robes
				{ 10, 60448, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Kodohide Gloves
				{ 11, 60450, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Kodohide Legguards
				{ 16, 60454, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Wyrmhide Helm
				{ 17, 60457, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Wyrmhide Spaulders
				{ 18, 60456, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Wyrmhide Robes
				{ 19, 60453, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Wyrmhide Gloves
				{ 20, 60455, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 60425, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Chain Helm
				{ 2, 60427, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Chain Spaulders
				{ 3, 60423, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Chain Armor
				{ 4, 60424, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Chain Gauntlets
				{ 5, 60426, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 60464, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Silk Cowl
				{ 2, 60467, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Silk Amice
				{ 3, 60466, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Silk Robe
				{ 4, 60463, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Silk Handguards
				{ 5, 60465, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 60603, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Ornamented Headcover
				{ 2, 60605, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Ornamented Spaulders
				{ 3, 60601, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Ornamented Chestguard
				{ 4, 60602, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Ornamented Gloves
				{ 5, 60604, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Ornamented Legplates
				{ 16, 60415, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Scaled Helm
				{ 17, 60417, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Scaled Shoulders
				{ 18, 60413, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Scaled Chestpiece
				{ 19, 60414, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Scaled Gauntlets
				{ 20, 60416, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 60469, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Mooncloth Helm
				{ 2, 60472, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Mooncloth Mantle
				{ 3, 60471, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Mooncloth Robe
				{ 4, 60468, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Mooncloth Gloves
				{ 5, 60470, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Mooncloth Leggings
				{ 16, 60474, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Satin Hood
				{ 17, 60477, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Satin Mantle
				{ 18, 60476, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Satin Robe
				{ 19, 60473, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Satin Gloves
				{ 20, 60475, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 60460, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Leather Helm
				{ 2, 60462, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Leather Spaulders
				{ 3, 60458, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Leather Tunic
				{ 4, 60459, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Leather Gloves
				{ 5, 60461, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 60435, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Linked Helm
				{ 2, 60437, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Linked Spaulders
				{ 3, 60433, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Linked Armor
				{ 4, 60434, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Linked Gauntlets
				{ 5, 60436, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Linked Leggings
				{ 7, 60440, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Mail Helm
				{ 8, 60442, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Mail Spaulders
				{ 9, 60438, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Mail Armor
				{ 10, 60439, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Mail Gauntlets
				{ 11, 60441, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Mail Leggings
				{ 16, 60430, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Ringmail Helm
				{ 17, 60432, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Ringmail Spaulders
				{ 18, 60428, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Ringmail Armor
				{ 19, 60429, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Ringmail Gauntlets
				{ 20, 60431, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 60479, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Felweave Cowl
				{ 2, 60482, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Felweave Amice
				{ 3, 60481, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Felweave Raiment
				{ 4, 60478, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Felweave Handguards
				{ 5, 60480, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 60420, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Plate Helm
				{ 2, 60422, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Plate Shoulders
				{ 3, 60418, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Plate Chestpiece
				{ 4, 60419, [PRICE_EXTRA_ITTYPE] = "markofhonor:825" }, -- Vicious Gladiator's Plate Gauntlets
				{ 5, 60421, [PRICE_EXTRA_ITTYPE] = "markofhonor:1100" }, -- Vicious Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 8
data["CLASSICS8SETS"] = {
	name = string.format(AL["Season %d"], 8).." "..AL["Class Sets"].." ("..EXPANSION_NAME2..")",
	ContentType = NORMAL_ITTYPE,
	items = {
			{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 51415, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Dreadplate Helm
				{ 2, 51418, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Dreadplate Shoulders
				{ 3, 51413, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Dreadplate Chestpiece
				{ 4, 51414, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Dreadplate Gauntlets
				{ 5, 51416, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 51427, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Dragonhide Helm
				{ 2, 51430, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Dragonhide Spaulders
				{ 3, 51425, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Dragonhide Robes
				{ 4, 51426, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Dragonhide Gloves
				{ 5, 51428, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Dragonhide Legguards
				{ 7, 51421, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Kodohide Helm
				{ 8, 51424, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Kodohide Spaulders
				{ 9, 51419, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Kodohide Robes
				{ 10, 51420, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Kodohide Gloves
				{ 11, 51422, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Kodohide Legguards
				{ 16, 51435, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Wyrmhide Helm
				{ 17, 51438, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Wyrmhide Spaulders
				{ 18, 51433, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Wyrmhide Robes
				{ 19, 51434, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Wyrmhide Gloves
				{ 20, 51436, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 51460, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Chain Helm
				{ 2, 51462, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Chain Spaulders
				{ 3, 51458, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Chain Armor
				{ 4, 51459, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Chain Gauntlets
				{ 5, 51461, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 51465, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Silk Cowl
				{ 2, 51467, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Silk Amice
				{ 3, 51463, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Silk Raiment
				{ 4, 51464, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Silk Handguards
				{ 5, 51466, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 51470, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Ornamented Headcover
				{ 2, 51473, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Ornamented Spaulders
				{ 3, 51468, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Ornamented Chestguard
				{ 4, 51469, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Ornamented Gloves
				{ 5, 51471, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Ornamented Legplates
				{ 16, 51476, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Scaled Helm
				{ 17, 51479, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Scaled Shoulders
				{ 18, 51474, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Scaled Chestpiece
				{ 19, 51475, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Scaled Gauntlets
				{ 20, 51477, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 51484, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Mooncloth Hood
				{ 2, 51486, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Mooncloth Mantle
				{ 3, 51482, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Mooncloth Robe
				{ 4, 51483, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Mooncloth Gloves
				{ 5, 51485, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Mooncloth Leggings
				{ 16, 51489, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Satin Hood
				{ 17, 51491, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Satin Mantle
				{ 18, 51487, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Satin Robe
				{ 19, 51488, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Satin Gloves
				{ 20, 51490, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 51494, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Leather Helm
				{ 2, 51496, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Leather Spaulders
				{ 3, 51492, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Leather Tunic
				{ 4, 51493, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Leather Gloves
				{ 5, 51495, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 51505, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Linked Helm
				{ 2, 51508, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Linked Spaulders
				{ 3, 51503, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Linked Armor
				{ 4, 51504, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Linked Gauntlets
				{ 5, 51506, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Linked Leggings
				{ 7, 51511, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Mail Helm
				{ 8, 51514, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Mail Spaulders
				{ 9, 51509, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Mail Armor
				{ 10, 51510, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Mail Gauntlets
				{ 11, 51512, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Mail Leggings
				{ 16, 51499, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Ringmail Helm
				{ 17, 51502, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Ringmail Spaulders
				{ 18, 51497, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Ringmail Armor
				{ 19, 51498, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Ringmail Gauntlets
				{ 20, 51500, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 51538, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Felweave Cowl
				{ 2, 51540, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Felweave Amice
				{ 3, 51536, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Felweave Raiment
				{ 4, 51537, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Felweave Handguards
				{ 5, 51539, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 51543, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Plate Helm
				{ 2, 51545, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Plate Shoulders
				{ 3, 51541, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Plate Chestpiece
				{ 4, 51542, [PRICE_EXTRA_ITTYPE] = "markofhonor:1040" }, -- Wrathful Gladiator's Plate Gauntlets
				{ 5, 51544, [PRICE_EXTRA_ITTYPE] = "markofhonor:1650" }, -- Wrathful Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 7
data["CLASSICS7SETS"] = {
	name = string.format(AL["Season %d"], 7).." "..AL["Class Sets"].." ("..EXPANSION_NAME2..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 40830, [PRICE_EXTRA_ITTYPE] = "money:1713600" }, --Relentless Gladiator's Dreadplate Helm
				{ 2, 40871, [PRICE_EXTRA_ITTYPE] = "money:1719300" }, --Relentless Gladiator's Dreadplate Shoulders
				{ 3, 40791, [PRICE_EXTRA_ITTYPE] = "money:2239200" }, --Relentless Gladiator's Dreadplate Chestpiece
				{ 4, 40811, [PRICE_EXTRA_ITTYPE] = "money:1155400" }, --Relentless Gladiator's Dreadplate Gauntlets
				{ 5, 40851, [PRICE_EXTRA_ITTYPE] = "money:2297000" }, --Relentless Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 41679, [PRICE_EXTRA_ITTYPE] = "money:1578700" }, --Relentless Gladiator's Dragonhide Helm
				{ 2, 41716, [PRICE_EXTRA_ITTYPE] = "money:1725900" }, --Relentless Gladiator's Dragonhide Spaulders
				{ 3, 41662, [PRICE_EXTRA_ITTYPE] = "money:2133700" }, --Relentless Gladiator's Dragonhide Robes
				{ 4, 41774, [PRICE_EXTRA_ITTYPE] = "money:1068800" }, --Relentless Gladiator's Dragonhide Gloves
				{ 5, 41668, [PRICE_EXTRA_ITTYPE] = "money:2182500" }, --Relentless Gladiator's Dragonhide Legguards
				{ 7, 41322, [PRICE_EXTRA_ITTYPE] = "money:1713100" }, --Relentless Gladiator's Kodohide Helm
				{ 8, 41276, [PRICE_EXTRA_ITTYPE] = "money:1677000" }, --Relentless Gladiator's Kodohide Spaulders
				{ 9, 41311, [PRICE_EXTRA_ITTYPE] = "money:2199100" }, --Relentless Gladiator's Kodohide Robes
				{ 10, 41288, [PRICE_EXTRA_ITTYPE] = "money:1064100" }, --Relentless Gladiator's Kodohide Gloves
				{ 11, 41299, [PRICE_EXTRA_ITTYPE] = "money:2264400" }, --Relentless Gladiator's Kodohide Legguards
				{ 16, 41328, [PRICE_EXTRA_ITTYPE] = "money:1627600" }, --Relentless Gladiator's Wyrmhide Helm
				{ 17, 41282, [PRICE_EXTRA_ITTYPE] = "money:1713500" }, --Relentless Gladiator's Wyrmhide Spaulders
				{ 18, 41317, [PRICE_EXTRA_ITTYPE] = "money:2247800" }, --Relentless Gladiator's Wyrmhide Robes
				{ 19, 41294, [PRICE_EXTRA_ITTYPE] = "money:1118200" }, --Relentless Gladiator's Wyrmhide Gloves
				{ 20, 41305, [PRICE_EXTRA_ITTYPE] = "money:2313100" }, --Relentless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 41158, [PRICE_EXTRA_ITTYPE] = "money:1602500" }, --Relentless Gladiator's Chain Helm
				{ 2, 41218, [PRICE_EXTRA_ITTYPE] = "money:1645800" }, --Relentless Gladiator's Chain Spaulders
				{ 3, 41088, [PRICE_EXTRA_ITTYPE] = "money:2223400" }, --Relentless Gladiator's Chain Armor
				{ 4, 41144, [PRICE_EXTRA_ITTYPE] = "money:1101200" }, --Relentless Gladiator's Chain Gauntlets
				{ 5, 41206, [PRICE_EXTRA_ITTYPE] = "money:2264200" }, --Relentless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 41947, [PRICE_EXTRA_ITTYPE] = "money:1590400" }, --Relentless Gladiator's Silk Cowl
				{ 2, 41966, [PRICE_EXTRA_ITTYPE] = "money:1628100" }, --Relentless Gladiator's Silk Amice
				{ 3, 41954, [PRICE_EXTRA_ITTYPE] = "money:2240300" }, --Relentless Gladiator's Silk Raiment
				{ 4, 41972, [PRICE_EXTRA_ITTYPE] = "money:1118200" }, --Relentless Gladiator's Silk Handguards
				{ 5, 41960, [PRICE_EXTRA_ITTYPE] = "money:2289000" }, --Relentless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 40934, [PRICE_EXTRA_ITTYPE] = "money:1614800" }, --Relentless Gladiator's Ornamented Headcover
				{ 2, 40964, [PRICE_EXTRA_ITTYPE] = "money:1719400" }, --Relentless Gladiator's Ornamented Spaulders
				{ 3, 40910, [PRICE_EXTRA_ITTYPE] = "money:2124900" }, --Relentless Gladiator's Ornamented Chestguard
				{ 4, 40928, [PRICE_EXTRA_ITTYPE] = "money:1060100" }, --Relentless Gladiator's Ornamented Gloves
				{ 5, 40940, [PRICE_EXTRA_ITTYPE] = "money:2264600" }, --Relentless Gladiator's Ornamented Legplates
				{ 16, 40831, [PRICE_EXTRA_ITTYPE] = "money:1719600" }, --Relentless Gladiator's Scaled Helm
				{ 17, 40872, [PRICE_EXTRA_ITTYPE] = "money:1725200" }, --Relentless Gladiator's Scaled Shoulders
				{ 18, 40792, [PRICE_EXTRA_ITTYPE] = "money:2247400" }, --Relentless Gladiator's Scaled Chestpiece
				{ 19, 40812, [PRICE_EXTRA_ITTYPE] = "money:1159400" }, --Relentless Gladiator's Scaled Gauntlets
				{ 20, 40852, [PRICE_EXTRA_ITTYPE] = "money:2305200" }, --Relentless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 41855, [PRICE_EXTRA_ITTYPE] = "money:1640200" }, --Relentless Gladiator's Mooncloth Hood
				{ 2, 41870, [PRICE_EXTRA_ITTYPE] = "money:1609500" }, --Relentless Gladiator's Mooncloth Mantle
				{ 3, 41860, [PRICE_EXTRA_ITTYPE] = "money:2231800" }, --Relentless Gladiator's Mooncloth Robe
				{ 4, 41875, [PRICE_EXTRA_ITTYPE] = "money:1101700" }, --Relentless Gladiator's Mooncloth Gloves
				{ 5, 41865, [PRICE_EXTRA_ITTYPE] = "money:2272600" }, --Relentless Gladiator's Mooncloth Leggings
				{ 16, 41916, [PRICE_EXTRA_ITTYPE] = "money:1645600" }, --Relentless Gladiator's Satin Hood
				{ 17, 41935, [PRICE_EXTRA_ITTYPE] = "money:1683300" }, --Relentless Gladiator's Satin Mantle
				{ 18, 41922, [PRICE_EXTRA_ITTYPE] = "money:2306100" }, --Relentless Gladiator's Satin Robe
				{ 19, 41941, [PRICE_EXTRA_ITTYPE] = "money:1155200" }, --Relentless Gladiator's Satin Gloves
				{ 20, 41928, [PRICE_EXTRA_ITTYPE] = "money:2133100" }, --Relentless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 41673, [PRICE_EXTRA_ITTYPE] = "money:1664200" }, --Relentless Gladiator's Leather Helm
				{ 2, 41684, [PRICE_EXTRA_ITTYPE] = "money:1609200" }, --Relentless Gladiator's Leather Spaulders
				{ 3, 41651, [PRICE_EXTRA_ITTYPE] = "money:2207000" }, --Relentless Gladiator's Leather Tunic
				{ 4, 41768, [PRICE_EXTRA_ITTYPE] = "money:1126200" }, --Relentless Gladiator's Leather Gloves
				{ 5, 41656, [PRICE_EXTRA_ITTYPE] = "money:2247800" }, --Relentless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 41152, [PRICE_EXTRA_ITTYPE] = "money:1732000" }, --Relentless Gladiator's Linked Helm
				{ 2, 41212, [PRICE_EXTRA_ITTYPE] = "money:1609300" }, --Relentless Gladiator's Linked Spaulders
				{ 3, 41082, [PRICE_EXTRA_ITTYPE] = "money:2174700" }, --Relentless Gladiator's Linked Armor
				{ 4, 41138, [PRICE_EXTRA_ITTYPE] = "money:1076700" }, --Relentless Gladiator's Linked Gauntlets
				{ 5, 41200, [PRICE_EXTRA_ITTYPE] = "money:2215200" }, --Relentless Gladiator's Linked Leggings
				{ 7, 41020, [PRICE_EXTRA_ITTYPE] = "money:1738300" }, --Relentless Gladiator's Mail Helm
				{ 8, 41045, [PRICE_EXTRA_ITTYPE] = "money:1602500" }, --Relentless Gladiator's Mail Spaulders
				{ 9, 40995, [PRICE_EXTRA_ITTYPE] = "money:2223200" }, --Relentless Gladiator's Mail Armor
				{ 10, 41008, [PRICE_EXTRA_ITTYPE] = "money:1089100" }, --Relentless Gladiator's Mail Gauntlets
				{ 11, 41034, [PRICE_EXTRA_ITTYPE] = "money:2273000" }, --Relentless Gladiator's Mail Leggings
				{ 16, 41014, [PRICE_EXTRA_ITTYPE] = "money:1657900" }, --Relentless Gladiator's Ringmail Helm
				{ 17, 41039, [PRICE_EXTRA_ITTYPE] = "money:1732000" }, --Relentless Gladiator's Ringmail Spaulders
				{ 18, 40994, [PRICE_EXTRA_ITTYPE] = "money:2215000" }, --Relentless Gladiator's Ringmail Armor
				{ 19, 41002, [PRICE_EXTRA_ITTYPE] = "money:1064600" }, --Relentless Gladiator's Ringmail Gauntlets
				{ 20, 41028, [PRICE_EXTRA_ITTYPE] = "money:2165600" }, --Relentless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 41994, [PRICE_EXTRA_ITTYPE] = "money:1676500" }, --Relentless Gladiator's Felweave Cowl
				{ 2, 42012, [PRICE_EXTRA_ITTYPE] = "money:1664200" }, --Relentless Gladiator's Felweave Amice
				{ 3, 41999, [PRICE_EXTRA_ITTYPE] = "money:2117300" }, --Relentless Gladiator's Felweave Raiment
				{ 4, 42018, [PRICE_EXTRA_ITTYPE] = "money:1060500" }, --Relentless Gladiator's Felweave Handguards
				{ 5, 42006, [PRICE_EXTRA_ITTYPE] = "money:2174300" }, --Relentless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 40829, [PRICE_EXTRA_ITTYPE] = "money:1707500" }, --Relentless Gladiator's Plate Helm
				{ 2, 40870, [PRICE_EXTRA_ITTYPE] = "money:1713100" }, --Relentless Gladiator's Plate Shoulders
				{ 3, 40790, [PRICE_EXTRA_ITTYPE] = "money:2231000" }, --Relentless Gladiator's Plate Chestpiece
				{ 4, 40810, [PRICE_EXTRA_ITTYPE] = "money:1151200" }, --Relentless Gladiator's Plate Gauntlets
				{ 5, 40850, [PRICE_EXTRA_ITTYPE] = "money:2288800" }, --Relentless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 6
data["CLASSICS6SETS"] = {
	name = string.format(AL["Season %d"], 6).." "..AL["Class Sets"].." ("..EXPANSION_NAME2..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 40827, [PRICE_EXTRA_ITTYPE] = "money:1611900" }, --Furious Gladiator's Dreadplate Helm
				{ 2, 40868, [PRICE_EXTRA_ITTYPE] = "money:1617200" }, --Furious Gladiator's Dreadplate Shoulders
				{ 3, 40787, [PRICE_EXTRA_ITTYPE] = "money:2098100" }, --Furious Gladiator's Dreadplate Chestpiece
				{ 4, 40809, [PRICE_EXTRA_ITTYPE] = "money:1090700" }, --Furious Gladiator's Dreadplate Gauntlets
				{ 5, 40848, [PRICE_EXTRA_ITTYPE] = "money:2160800" }, --Furious Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 41678, [PRICE_EXTRA_ITTYPE] = "money:1653000" }, --Furious Gladiator's Dragonhide Helm
				{ 2, 41715, [PRICE_EXTRA_ITTYPE] = "money:1635200" }, --Furious Gladiator's Dragonhide Spaulders
				{ 3, 41661, [PRICE_EXTRA_ITTYPE] = "money:2021000" }, --Furious Gladiator's Dragonhide Robes
				{ 4, 41773, [PRICE_EXTRA_ITTYPE] = "money:1012300" }, --Furious Gladiator's Dragonhide Gloves
				{ 5, 41667, [PRICE_EXTRA_ITTYPE] = "money:2067300" }, --Furious Gladiator's Dragonhide Legguards
				{ 7, 41321, [PRICE_EXTRA_ITTYPE] = "money:1623000" }, --Furious Gladiator's Kodohide Helm
				{ 8, 41275, [PRICE_EXTRA_ITTYPE] = "money:1588700" }, --Furious Gladiator's Kodohide Spaulders
				{ 9, 41310, [PRICE_EXTRA_ITTYPE] = "money:2083100" }, --Furious Gladiator's Kodohide Robes
				{ 10, 41287, [PRICE_EXTRA_ITTYPE] = "money:1007900" }, --Furious Gladiator's Kodohide Gloves
				{ 11, 41298, [PRICE_EXTRA_ITTYPE] = "money:2145200" }, --Furious Gladiator's Kodohide Legguards
				{ 16, 41327, [PRICE_EXTRA_ITTYPE] = "money:1541900" }, --Furious Gladiator's Wyrmhide Helm
				{ 17, 41281, [PRICE_EXTRA_ITTYPE] = "money:1623500" }, --Furious Gladiator's Wyrmhide Spaulders
				{ 18, 41316, [PRICE_EXTRA_ITTYPE] = "money:2129500" }, --Furious Gladiator's Wyrmhide Robes
				{ 19, 41293, [PRICE_EXTRA_ITTYPE] = "money:1059300" }, --Furious Gladiator's Wyrmhide Gloves
				{ 20, 41304, [PRICE_EXTRA_ITTYPE] = "money:2191800" }, --Furious Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 41157, [PRICE_EXTRA_ITTYPE] = "money:1518000" }, --Furious Gladiator's Chain Helm
				{ 2, 41217, [PRICE_EXTRA_ITTYPE] = "money:1559200" }, --Furious Gladiator's Chain Spaulders
				{ 3, 41087, [PRICE_EXTRA_ITTYPE] = "money:2106300" }, --Furious Gladiator's Chain Armor
				{ 4, 41143, [PRICE_EXTRA_ITTYPE] = "money:1043100" }, --Furious Gladiator's Chain Gauntlets
				{ 5, 41205, [PRICE_EXTRA_ITTYPE] = "money:2145000" }, --Furious Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 41946, [PRICE_EXTRA_ITTYPE] = "money:1506400" }, --Furious Gladiator's Silk Cowl
				{ 2, 41965, [PRICE_EXTRA_ITTYPE] = "money:1500400" }, --Furious Gladiator's Silk Amice
				{ 3, 41953, [PRICE_EXTRA_ITTYPE] = "money:2122300" }, --Furious Gladiator's Silk Raiment
				{ 4, 41971, [PRICE_EXTRA_ITTYPE] = "money:1059200" }, --Furious Gladiator's Silk Handguards
				{ 5, 41959, [PRICE_EXTRA_ITTYPE] = "money:2168800" }, --Furious Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 40933, [PRICE_EXTRA_ITTYPE] = "money:1529600" }, --Furious Gladiator's Ornamented Headcover
				{ 2, 40963, [PRICE_EXTRA_ITTYPE] = "money:1629000" }, --Furious Gladiator's Ornamented Spaulders
				{ 3, 40907, [PRICE_EXTRA_ITTYPE] = "money:2208000" }, --Furious Gladiator's Ornamented Chestguard
				{ 4, 40927, [PRICE_EXTRA_ITTYPE] = "money:1110200" }, --Furious Gladiator's Ornamented Gloves
				{ 5, 40939, [PRICE_EXTRA_ITTYPE] = "money:2145700" }, --Furious Gladiator's Ornamented Legplates
				{ 16, 40828, [PRICE_EXTRA_ITTYPE] = "money:1617700" }, --Furious Gladiator's Scaled Helm
				{ 17, 40869, [PRICE_EXTRA_ITTYPE] = "money:1623000" }, --Furious Gladiator's Scaled Shoulders
				{ 18, 40788, [PRICE_EXTRA_ITTYPE] = "money:2105900" }, --Furious Gladiator's Scaled Chestpiece
				{ 19, 40808, [PRICE_EXTRA_ITTYPE] = "money:1058700" }, --Furious Gladiator's Scaled Gauntlets
				{ 20, 40849, [PRICE_EXTRA_ITTYPE] = "money:2168400" }, --Furious Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 41854, [PRICE_EXTRA_ITTYPE] = "money:1553800" }, --Furious Gladiator's Mooncloth Hood
				{ 2, 41869, [PRICE_EXTRA_ITTYPE] = "money:1640700" }, --Furious Gladiator's Mooncloth Mantle
				{ 3, 41859, [PRICE_EXTRA_ITTYPE] = "money:2114300" }, --Furious Gladiator's Mooncloth Robe
				{ 4, 41874, [PRICE_EXTRA_ITTYPE] = "money:1043600" }, --Furious Gladiator's Mooncloth Gloves
				{ 5, 41864, [PRICE_EXTRA_ITTYPE] = "money:2153000" }, --Furious Gladiator's Mooncloth Leggings
				{ 16, 41915, [PRICE_EXTRA_ITTYPE] = "money:1558900" }, --Furious Gladiator's Satin Hood
				{ 17, 41934, [PRICE_EXTRA_ITTYPE] = "money:1594700" }, --Furious Gladiator's Satin Mantle
				{ 18, 41921, [PRICE_EXTRA_ITTYPE] = "money:2184800" }, --Furious Gladiator's Satin Robe
				{ 19, 41940, [PRICE_EXTRA_ITTYPE] = "money:1094600" }, --Furious Gladiator's Satin Gloves
				{ 20, 41927, [PRICE_EXTRA_ITTYPE] = "money:2020400" }, --Furious Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 41672, [PRICE_EXTRA_ITTYPE] = "money:1576500" }, --Furious Gladiator's Leather Helm
				{ 2, 41683, [PRICE_EXTRA_ITTYPE] = "money:1524200" }, --Furious Gladiator's Leather Spaulders
				{ 3, 41650, [PRICE_EXTRA_ITTYPE] = "money:2090900" }, --Furious Gladiator's Leather Tunic
				{ 4, 41767, [PRICE_EXTRA_ITTYPE] = "money:1067000" }, --Furious Gladiator's Leather Gloves
				{ 5, 41655, [PRICE_EXTRA_ITTYPE] = "money:2129500" }, --Furious Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 41151, [PRICE_EXTRA_ITTYPE] = "money:1641000" }, --Furious Gladiator's Linked Helm
				{ 2, 41211, [PRICE_EXTRA_ITTYPE] = "money:1524400" }, --Furious Gladiator's Linked Spaulders
				{ 3, 41081, [PRICE_EXTRA_ITTYPE] = "money:2004100" }, --Furious Gladiator's Linked Armor
				{ 4, 41137, [PRICE_EXTRA_ITTYPE] = "money:1019800" }, --Furious Gladiator's Linked Gauntlets
				{ 5, 41199, [PRICE_EXTRA_ITTYPE] = "money:2098700" }, --Furious Gladiator's Linked Leggings
				{ 7, 41019, [PRICE_EXTRA_ITTYPE] = "money:1647000" }, --Furious Gladiator's Mail Helm
				{ 8, 41044, [PRICE_EXTRA_ITTYPE] = "money:1518000" }, --Furious Gladiator's Mail Spaulders
				{ 9, 40993, [PRICE_EXTRA_ITTYPE] = "money:2098300" }, --Furious Gladiator's Mail Armor
				{ 10, 41007, [PRICE_EXTRA_ITTYPE] = "money:1031700" }, --Furious Gladiator's Mail Gauntlets
				{ 11, 41033, [PRICE_EXTRA_ITTYPE] = "money:2097900" }, --Furious Gladiator's Mail Leggings
				{ 16, 41013, [PRICE_EXTRA_ITTYPE] = "money:1570500" }, --Furious Gladiator's Ringmail Helm
				{ 17, 41038, [PRICE_EXTRA_ITTYPE] = "money:1641000" }, --Furious Gladiator's Ringmail Spaulders
				{ 18, 40992, [PRICE_EXTRA_ITTYPE] = "money:2090500" }, --Furious Gladiator's Ringmail Armor
				{ 19, 41001, [PRICE_EXTRA_ITTYPE] = "money:1086200" }, --Furious Gladiator's Ringmail Gauntlets
				{ 20, 41027, [PRICE_EXTRA_ITTYPE] = "money:2051300" }, --Furious Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 41993, [PRICE_EXTRA_ITTYPE] = "money:1588400" }, --Furious Gladiator's Felweave Cowl
				{ 2, 42011, [PRICE_EXTRA_ITTYPE] = "money:1576500" }, --Furious Gladiator's Felweave Amice
				{ 3, 41998, [PRICE_EXTRA_ITTYPE] = "money:2005400" }, --Furious Gladiator's Felweave Raiment
				{ 4, 42017, [PRICE_EXTRA_ITTYPE] = "money:1110400" }, --Furious Gladiator's Felweave Handguards
				{ 5, 42005, [PRICE_EXTRA_ITTYPE] = "money:2059500" }, --Furious Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 40826, [PRICE_EXTRA_ITTYPE] = "money:1606200" }, --Furious Gladiator's Plate Helm
				{ 2, 40866, [PRICE_EXTRA_ITTYPE] = "money:1605700" }, --Furious Gladiator's Plate Shoulders
				{ 3, 40789, [PRICE_EXTRA_ITTYPE] = "money:2113400" }, --Furious Gladiator's Plate Chestpiece
				{ 4, 40807, [PRICE_EXTRA_ITTYPE] = "money:1054900" }, --Furious Gladiator's Plate Gauntlets
				{ 5, 40847, [PRICE_EXTRA_ITTYPE] = "money:2153000" }, --Furious Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
--[[data["CLASSICS6NONSET"] = {
	name = string.format(AL["Season %d"], 6).." "..AL["Non-Set Gear"].." ("..EXPANSION_NAME2..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = AL["Cloth"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Leather"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Mail"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Plate"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = AL["Miscellaneous"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
]]
-- Classic Season 5
data["CLASSICS5SETS"] = {
	name = string.format(AL["Season %d"], 5).." "..AL["Class Sets"].." ("..EXPANSION_NAME2..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 40824, [PRICE_EXTRA_ITTYPE] = "money:1418900" }, -- Deadly Gladiator's Dreadplate Helm
				{ 2, 40863, [PRICE_EXTRA_ITTYPE] = "money:1451400" }, -- Deadly Gladiator's Dreadplate Shoulders
				{ 3, 40784, [PRICE_EXTRA_ITTYPE] = "money:1896000" }, -- Deadly Gladiator's Dreadplate Chestpiece
				{ 4, 40806, [PRICE_EXTRA_ITTYPE] = "money:960400" }, -- Deadly Gladiator's Dreadplate Gauntlets
				{ 5, 40845, [PRICE_EXTRA_ITTYPE] = "money:1953400" }, -- Deadly Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 41677, [PRICE_EXTRA_ITTYPE] = "money:1505300" }, -- Deadly Gladiator's Dragonhide Helm
				{ 2, 41714, [PRICE_EXTRA_ITTYPE] = "money:1489000" }, -- Deadly Gladiator's Dragonhide Spaulders
				{ 3, 41660, [PRICE_EXTRA_ITTYPE] = "money:1981300" }, -- Deadly Gladiator's Dragonhide Robes
				{ 4, 41772, [PRICE_EXTRA_ITTYPE] = "money:992700" }, -- Deadly Gladiator's Dragonhide Gloves
				{ 5, 41666, [PRICE_EXTRA_ITTYPE] = "money:1882000" }, -- Deadly Gladiator's Dragonhide Legguards
				{ 7, 41320, [PRICE_EXTRA_ITTYPE] = "money:1477800" }, -- Deadly Gladiator's Kodohide Helm
				{ 8, 41274, [PRICE_EXTRA_ITTYPE] = "money:1408400" }, -- Deadly Gladiator's Kodohide Spaulders
				{ 9, 41309, [PRICE_EXTRA_ITTYPE] = "money:1896400" }, -- Deadly Gladiator's Kodohide Robes
				{ 10, 41286, [PRICE_EXTRA_ITTYPE] = "money:1014300" }, -- Deadly Gladiator's Kodohide Gloves
				{ 11, 41297, [PRICE_EXTRA_ITTYPE] = "money:1953200" }, -- Deadly Gladiator's Kodohide Legguards
				{ 16, 41326, [PRICE_EXTRA_ITTYPE] = "money:1403600" }, -- Deadly Gladiator's Wyrmhide Helm
				{ 17, 41280, [PRICE_EXTRA_ITTYPE] = "money:1478200" }, -- Deadly Gladiator's Wyrmhide Spaulders
				{ 18, 41315, [PRICE_EXTRA_ITTYPE] = "money:1938900" }, -- Deadly Gladiator's Wyrmhide Robes
				{ 19, 41292, [PRICE_EXTRA_ITTYPE] = "money:964400" }, -- Deadly Gladiator's Wyrmhide Gloves
				{ 20, 41303, [PRICE_EXTRA_ITTYPE] = "money:1995700" }, -- Deadly Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 41156, [PRICE_EXTRA_ITTYPE] = "money:1381800" }, -- Deadly Gladiator's Chain Helm
				{ 2, 41216, [PRICE_EXTRA_ITTYPE] = "money:1419400" }, -- Deadly Gladiator's Chain Spaulders
				{ 3, 41086, [PRICE_EXTRA_ITTYPE] = "money:1917800" }, -- Deadly Gladiator's Chain Armor
				{ 4, 41142, [PRICE_EXTRA_ITTYPE] = "money:949700" }, -- Deadly Gladiator's Chain Gauntlets
				{ 5, 41204, [PRICE_EXTRA_ITTYPE] = "money:1953000" }, -- Deadly Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 41945, [PRICE_EXTRA_ITTYPE] = "money:1371200" }, -- Deadly Gladiator's Silk Cowl
				{ 2, 41964, [PRICE_EXTRA_ITTYPE] = "money:1509900" }, -- Deadly Gladiator's Silk Amice
				{ 3, 41951, [PRICE_EXTRA_ITTYPE] = "money:1925300" }, -- Deadly Gladiator's Silk Raiment
				{ 4, 41970, [PRICE_EXTRA_ITTYPE] = "money:964400" }, -- Deadly Gladiator's Silk Handguards
				{ 5, 41958, [PRICE_EXTRA_ITTYPE] = "money:1974700" }, -- Deadly Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 40932, [PRICE_EXTRA_ITTYPE] = "money:1392400" }, -- Deadly Gladiator's Ornamented Headcover
				{ 2, 40962, [PRICE_EXTRA_ITTYPE] = "money:1483300" }, -- Deadly Gladiator's Ornamented Spaulders
				{ 3, 40905, [PRICE_EXTRA_ITTYPE] = "money:1952600" }, -- Deadly Gladiator's Ornamented Chestguard
				{ 4, 40926, [PRICE_EXTRA_ITTYPE] = "money:1010900" }, -- Deadly Gladiator's Ornamented Gloves
				{ 5, 40938, [PRICE_EXTRA_ITTYPE] = "money:1953600" }, -- Deadly Gladiator's Ornamented Legplates
				{ 16, 40825, [PRICE_EXTRA_ITTYPE] = "money:1462400" }, -- Deadly Gladiator's Scaled Helm
				{ 17, 40864, [PRICE_EXTRA_ITTYPE] = "money:1456600" }, -- Deadly Gladiator's Scaled Shoulders
				{ 18, 40785, [PRICE_EXTRA_ITTYPE] = "money:1903000" }, -- Deadly Gladiator's Scaled Chestpiece
				{ 19, 40805, [PRICE_EXTRA_ITTYPE] = "money:956800" }, -- Deadly Gladiator's Scaled Gauntlets
				{ 20, 40846, [PRICE_EXTRA_ITTYPE] = "money:1960300" }, -- Deadly Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 41853, [PRICE_EXTRA_ITTYPE] = "money:1376400" }, -- Deadly Gladiator's Mooncloth Hood
				{ 2, 41868, [PRICE_EXTRA_ITTYPE] = "money:1493900" }, -- Deadly Gladiator's Mooncloth Mantle
				{ 3, 41858, [PRICE_EXTRA_ITTYPE] = "money:1925100" }, -- Deadly Gladiator's Mooncloth Robe
				{ 4, 41873, [PRICE_EXTRA_ITTYPE] = "money:950100" }, -- Deadly Gladiator's Mooncloth Gloves
				{ 5, 41863, [PRICE_EXTRA_ITTYPE] = "money:1960300" }, -- Deadly Gladiator's Mooncloth Leggings
				{ 16, 41914, [PRICE_EXTRA_ITTYPE] = "money:1419300" }, -- Deadly Gladiator's Satin Hood
				{ 17, 41933, [PRICE_EXTRA_ITTYPE] = "money:1413800" }, -- Deadly Gladiator's Satin Mantle
				{ 18, 41920, [PRICE_EXTRA_ITTYPE] = "money:1989400" }, -- Deadly Gladiator's Satin Robe
				{ 19, 41939, [PRICE_EXTRA_ITTYPE] = "money:996700" }, -- Deadly Gladiator's Satin Gloves
				{ 20, 41926, [PRICE_EXTRA_ITTYPE] = "money:1839100" }, -- Deadly Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 41671, [PRICE_EXTRA_ITTYPE] = "money:1435300" }, -- Deadly Gladiator's Leather Helm
				{ 2, 41682, [PRICE_EXTRA_ITTYPE] = "money:1387500" }, -- Deadly Gladiator's Leather Spaulders
				{ 3, 41649, [PRICE_EXTRA_ITTYPE] = "money:1903500" }, -- Deadly Gladiator's Leather Tunic
				{ 4, 41766, [PRICE_EXTRA_ITTYPE] = "money:971400" }, -- Deadly Gladiator's Leather Gloves
				{ 5, 41654, [PRICE_EXTRA_ITTYPE] = "money:1938900" }, -- Deadly Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 41150, [PRICE_EXTRA_ITTYPE] = "money:1494400" }, -- Deadly Gladiator's Linked Helm
				{ 2, 41210, [PRICE_EXTRA_ITTYPE] = "money:1493800" }, -- Deadly Gladiator's Linked Spaulders
				{ 3, 41080, [PRICE_EXTRA_ITTYPE] = "money:2016900" }, -- Deadly Gladiator's Linked Armor
				{ 4, 41136, [PRICE_EXTRA_ITTYPE] = "money:928300" }, -- Deadly Gladiator's Linked Gauntlets
				{ 5, 41198, [PRICE_EXTRA_ITTYPE] = "money:1910700" }, -- Deadly Gladiator's Linked Leggings
				{ 7, 41018, [PRICE_EXTRA_ITTYPE] = "money:1499800" }, -- Deadly Gladiator's Mail Helm
				{ 8, 41043, [PRICE_EXTRA_ITTYPE] = "money:1381800" }, -- Deadly Gladiator's Mail Spaulders
				{ 9, 40991, [PRICE_EXTRA_ITTYPE] = "money:1903300" }, -- Deadly Gladiator's Mail Armor
				{ 10, 41006, [PRICE_EXTRA_ITTYPE] = "money:939200" }, -- Deadly Gladiator's Mail Gauntlets
				{ 11, 41032, [PRICE_EXTRA_ITTYPE] = "money:1909900" }, -- Deadly Gladiator's Mail Leggings
				{ 16, 41012, [PRICE_EXTRA_ITTYPE] = "money:1429800" }, -- Deadly Gladiator's Ringmail Helm
				{ 17, 41037, [PRICE_EXTRA_ITTYPE] = "money:1494400" }, -- Deadly Gladiator's Ringmail Spaulders
				{ 18, 40990, [PRICE_EXTRA_ITTYPE] = "money:1896200" }, -- Deadly Gladiator's Ringmail Armor
				{ 19, 41000, [PRICE_EXTRA_ITTYPE] = "money:989000" }, -- Deadly Gladiator's Ringmail Gauntlets
				{ 20, 41026, [PRICE_EXTRA_ITTYPE] = "money:1867400" }, -- Deadly Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 41992, [PRICE_EXTRA_ITTYPE] = "money:1446100" }, -- Deadly Gladiator's Felweave Cowl
				{ 2, 42010, [PRICE_EXTRA_ITTYPE] = "money:1435300" }, -- Deadly Gladiator's Felweave Amice
				{ 3, 41997, [PRICE_EXTRA_ITTYPE] = "money:1967200" }, -- Deadly Gladiator's Felweave Raiment
				{ 4, 42016, [PRICE_EXTRA_ITTYPE] = "money:1011200" }, -- Deadly Gladiator's Felweave Handguards
				{ 5, 42004, [PRICE_EXTRA_ITTYPE] = "money:1875100" }, -- Deadly Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 40823, [PRICE_EXTRA_ITTYPE] = "money:1413500" }, -- Deadly Gladiator's Plate Helm
				{ 2, 40862, [PRICE_EXTRA_ITTYPE] = "money:1446100" }, -- Deadly Gladiator's Plate Shoulders
				{ 3, 40786, [PRICE_EXTRA_ITTYPE] = "money:1910100" }, -- Deadly Gladiator's Plate Chestpiece
				{ 4, 40804, [PRICE_EXTRA_ITTYPE] = "money:953200" }, -- Deadly Gladiator's Plate Gauntlets
				{ 5, 40844, [PRICE_EXTRA_ITTYPE] = "money:1946300" }, -- Deadly Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 4
data["CLASSICS4SETS"] = {
	name = string.format(AL["Season %d"], 4).." "..AL["Class Sets"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 40442, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dreadplate Helm
				{ 2, 40444, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Dreadplate Shoulders
				{ 3, 40440, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dreadplate Chestpiece
				{ 4, 40441, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Dreadplate Gauntlets
				{ 5, 40443, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dreadplate Legguards
				
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 34999, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dragonhide Helm
				{ 2, 35001, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Dragonhide Spaulders
				{ 3, 35002, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dragonhide Tunic
				{ 4, 34998, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Dragonhide Gloves
				{ 5, 35000, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dragonhide Legguards
				{ 7, 35023, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Kodohide Helm
				{ 8, 35025, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Kodohide Spaulders
				{ 9, 35026, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Kodohide Tunic
				{ 10, 35022, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Kodohide Gloves
				{ 11, 35024, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Kodohide Legguards
				{ 16, 35112, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Wyrmhide Helm
				{ 17, 35114, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Wyrmhide Spaulders
				{ 18, 35115, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Wyrmhide Tunic
				{ 19, 35111, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Wyrmhide Gloves
				{ 20, 35113, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 34992, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Chain Helm
				{ 2, 34994, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Chain Spaulders
				{ 3, 34990, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Chain Armor
				{ 4, 34991, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Chain Gauntlets
				{ 5, 34993, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 35097, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Silk Cowl
				{ 2, 35096, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Silk Amice
				{ 3, 35099, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Silk Raiment
				{ 5, 35098, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Silk Handguards
				{ 6, 35100, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 35029, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Lamellar Helm
				{ 2, 35031, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Lamellar Shoulders
				{ 3, 35027, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Lamellar Chestpiece
				{ 4, 35028, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Lamellar Gauntlets
				{ 5, 35030, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Lamellar Legguards
				{ 7, 35061, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Ornamented Headcover
				{ 8, 35063, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Ornamented Spaulders
				{ 9, 35059, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Ornamented Chestguard
				{ 10, 35060, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Ornamented Gloves
				{ 11, 35062, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Ornamented Legplates
				{ 16, 35090, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Scaled Helm
				{ 17, 35092, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Scaled Shoulders
				{ 18, 35088, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Scaled Chestpiece
				{ 19, 35089, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Scaled Gauntlets
				{ 20, 35091, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 35054, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Mooncloth Hood
				{ 2, 35056, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Mooncloth Mantle
				{ 3, 35057, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Mooncloth Robe
				{ 4, 35053, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Mooncloth Gloves
				{ 5, 35055, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Mooncloth Leggings
				{ 16, 35084, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Satin Hood
				{ 17, 35086, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Satin Mantle
				{ 18, 35087, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Satin Robe
				{ 19, 35083, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Satin Gloves
				{ 20, 35085, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 35033, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Leather Helm
				{ 2, 35035, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Leather Spaulders
				{ 3, 35036, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Leather Tunic
				{ 6, 35032, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Leather Gloves
				{ 5, 35034, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 35044, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Linked Helm
				{ 2, 35046, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Linked Spaulders
				{ 3, 35042, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Linked Armor
				{ 4, 35043, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Linked Gauntlets
				{ 5, 35045, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Linked Leggings
				{ 7, 35050, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Mail Helm
				{ 8, 35052, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Mail Spaulders
				{ 9, 35048, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Mail Armor
				{ 10, 35049, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Mail Gauntlets
				{ 11, 35051, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Mail Leggings
				{ 16, 35079, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Ringmail Helm
				{ 17, 35081, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Ringmail Spaulders
				{ 18, 35077, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Ringmail Armor
				{ 19, 35078, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Ringmail Gauntlets
				{ 20, 35080, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 35004, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dreadweave Hood
				{ 2, 35006, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Dreadweave Mantle
				{ 3, 35007, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dreadweave Robe
				{ 4, 35003, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Dreadweave Gloves
				{ 5, 35005, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Dreadweave Leggings
				{ 16, 35010, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Felweave Cowl
				{ 17, 35009, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Felweave Amice
				{ 18, 35012, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Felweave Raiment
				{ 19, 35011, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Felweave Handguards
				{ 20, 35013, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 35068, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Plate Helm
				{ 2, 35070, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Plate Shoulders
				{ 3, 35066, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Plate Chestpiece
				{ 6, 35067, [PRICE_EXTRA_ITTYPE] = "markofhonor:140"  }, -- Brutal Gladiator's Plate Gauntlets
				{ 5, 35069, [PRICE_EXTRA_ITTYPE] = "markofhonor:175"  }, -- Brutal Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 3
data["CLASSICS3SETS"] = {
	name = string.format(AL["Season %d"], 3).." "..AL["Class Sets"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33672, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Dragonhide Helm
				{ 2, 33674, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Dragonhide Spaulders
				{ 3, 33675, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Dragonhide Tunic
				{ 4, 33671, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Dragonhide Gloves
				{ 5, 33673, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Dragonhide Legguards
				--
				{ 7, 33691, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Kodohide Helm
				{ 8, 33693, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Kodohide Spaulders
				{ 9, 33694, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Kodohide Tunic
				{ 10, 33690, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Kodohide Gloves
				{ 11, 33692, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Kodohide Legguards
				--
				{ 16, 33768, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Wyrmhide Helm
				{ 17, 33770, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Wyrmhide Spaulders
				{ 18, 33771, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Wyrmhide Tunic
				{ 19, 33767, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Wyrmhide Gloves
				{ 20, 33769, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 33666, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Chain Helm
				{ 2, 33668, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Chain Spaulders
				{ 3, 33664, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Chain Armor
				{ 4, 33665, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Chain Gauntlets
				{ 5, 33667, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 33758, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Silk Cowl
				{ 2, 33757, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Silk Amice
				{ 3, 33760, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Silk Raiment
				{ 4, 33759, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Silk Handguards
				{ 5, 33761, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33697, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Lamellar Helm
				{ 2, 33699, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Lamellar Shoulders
				{ 3, 33695, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Lamellar Chestpiece
				{ 4, 33696, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Lamellar Gauntlets
				{ 5, 33698, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Lamellar Legguards
				--
				{ 7, 33724, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Ornamented Headcover
				{ 8, 33726, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Ornamented Spaulders
				{ 9, 33722, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Ornamented Chestguard
				{ 10, 33723, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Ornamented Gloves
				{ 11, 33725, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Ornamented Legplates
				--
				{ 16, 33751, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Scaled Helm
				{ 17, 33753, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Scaled Shoulders
				{ 18, 33749, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Scaled Chestpiece
				{ 19, 33750, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Scaled Gauntlets
				{ 20, 33752, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33718, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Mooncloth Hood
				{ 2, 33720, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Mooncloth Mantle
				{ 3, 33721, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Mooncloth Robe
				{ 4, 33717, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Mooncloth Gloves
				{ 5, 33719, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Mooncloth Leggings
				{ 16, 33745, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Satin Hood
				{ 17, 33747, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Satin Mantle
				{ 18, 33748, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Satin Robe
				{ 19, 33744, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Satin Gloves
				{ 20, 33746, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 33701, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Leather Helm
				{ 2, 33703, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Leather Spaulders
				{ 3, 33704, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Leather Tunic
				{ 4, 33700, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Leather Gloves
				{ 5, 33702, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33708, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Linked Helm
				{ 2, 33710, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Linked Spaulders
				{ 3, 33706, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Linked Armor
				{ 4, 33707, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Linked Gauntlets
				{ 5, 33709, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Linked Leggings
				--
				{ 7, 33713, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Mail Helm
				{ 8, 33715, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Mail Spaulders
				{ 9, 33711, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Vengeful Gladiator's Mail Armor
				{ 10, 33712, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Mail Gauntlets
				{ 11, 33714, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Mail Leggings
				--
				{ 16, 33740, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Ringmail Helm
				{ 17, 33742, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Ringmail Spaulders
				{ 18, 33738, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Ringmail Armor
				{ 19, 33739, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Ringmail Gauntlets
				{ 20, 33741, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33677, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Dreadweave Hood
				{ 2, 33679, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Dreadweave Mantle
				{ 3, 33680, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Dreadweave Robe
				{ 4, 33676, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Dreadweave Gloves
				{ 5, 33678, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Dreadweave Leggings
				--
				{ 16, 33683, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Felweave Cowl
				{ 17, 33682, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Felweave Amice
				{ 18, 33685, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Felweave Raiment
				{ 19, 33684, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Felweave Handguards
				{ 20, 33686, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 33730, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Plate Helm
				{ 2, 33732, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Plate Shoulders
				{ 3, 33728, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Plate Chestpiece
				{ 4, 33729, [PRICE_EXTRA_ITTYPE] = "markofhonor:750" },	-- Vengeful Gladiator's Plate Gauntlets
				{ 5, 33731, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000" },	-- Vengeful Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
	},
}
data["CLASSICS3WEAPONS"] = {
	name = string.format(AL["Season %d"], 3).." "..AL["Weapons"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Weapons"]),
			[ALLIANCE_DIFF] = {
				{ 1, 34059, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Baton of Light
				{ 2, 34540, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Battle Staff
				{ 3, 33006, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Heavy Crossbow
				{ 4, 34066, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Piercing Touch
				{ 5, 33755, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Shield Wall
				{ 6, 33764, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Touch of Defeat
				{ 7, 33766, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's War Staff
				{ 8, 33669, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Cleaver
				{ 9, 33687, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Gavel
				{ 10, 33705, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Fleshslicer
				{ 11, 33733, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Pummeler
				{ 12, 33737, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Ripper
				{ 13, 33743, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Salvation
				{ 14, 33754, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Shanker
				{ 15, 33762, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Slicer
				{ 16, 33763, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Spellblade
				{ 17, 34016, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Slasher
				{ 18, 33661, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Barrier
				{ 19, 33735, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Redoubt
				{ 20, 34529, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Longbow
				{ 21, 34530, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Rifle
				{ 22, 33663, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Bonegrinder
				{ 23, 33670, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Decapitator
				{ 24, 33688, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Greatsword
				{ 25, 33716, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Staff
				{ 26, 33727, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Painsaw
				{ 27, 34014, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Vengeful Gladiator's Waraxe
				{ 28, 33662, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Bonecracker
				{ 29, 33689, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Hacker
				{ 30, 33734, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Quickblade
				{ 101, 33756, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Shiv
				{ 102, 33801, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Mutilator
				{ 103, 34015, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Chopper
				{ 104, 33681, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Endgame
				{ 105, 33736, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Reprieve
				{ 106, 34033, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Vengeful Gladiator's Grimoire
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
	},
}
-- Classic Season 2
data["CLASSICS2SETS"] = {
	name = string.format(AL["Season %d"], 2).." "..AL["Class Sets"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				-- Feral / Guardian
				{ 1, 31968, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Dragonhide Helm
				{ 2, 31971, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Dragonhide Spaulders
				{ 3, 31972, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Dragonhide Tunic
				{ 4, 31967, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Dragonhide Gloves
				{ 5, 31969, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Dragonhide Legguards
				-- Restoration
				{ 7, 31988, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Kodohide Helm
				{ 8, 31990, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Kodohide Spaulders
				{ 9, 31991, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Kodohide Tunic
				{ 10, 31987, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Kodohide Gloves
				{ 11, 31989, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Kodohide Legguards
				-- Balance
				{ 16, 32057, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Wyrmhide Helm
				{ 17, 32059, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Wyrmhide Spaulders
				{ 18, 32060, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Wyrmhide Tunic
				{ 19, 32056, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Wyrmhide Gloves
				{ 20, 32058, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 31962, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Chain Helm
   				{ 2, 31964, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Chain Spaulders
				{ 3, 31960, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Chain Armor
				{ 4, 31961, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Chain Gauntlets
				{ 5, 31963, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 32048, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Silk Cowl
   				{ 2, 32047, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Silk Amice
   				{ 3, 32050, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Silk Raiment
   				{ 4, 32049, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Silk Handguards
   				{ 5, 32051, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 31997, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Lamellar Helm
				{ 2, 31996, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Lamellar Shoulders
				{ 3, 31992, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Lamellar Chestpiece
				{ 4, 31993, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Lamellar Gauntlets
				{ 5, 31995, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Lamellar Legguards
				--
				{ 7, 32022, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Ornamented Headcover
				{ 8, 32024, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Ornamented Spaulders
				{ 9, 32020, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Ornamented Chestguard
				{ 10, 32021, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Ornamented Gloves
				{ 11, 32023, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Ornamented Legplates
				--
				{ 16, 32041, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Scaled Helm
				{ 17, 32043, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Scaled Shoulders
				{ 18, 32039, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Scaled Chestpiece
				{ 19, 32040, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Scaled Gauntlets
				{ 20, 32042, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 32016, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Mooncloth Hood
				{ 2, 32018, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Mooncloth Mantle
				{ 3, 32019, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Mooncloth Robe
				{ 4, 32015, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Mooncloth Gloves
				{ 5, 32017, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Mooncloth Leggings
				--
				{ 16, 32035, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Satin Hood
				{ 17, 32037, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Satin Mantle
				{ 18, 32038, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Satin Robe
				{ 19, 32034, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Satin Gloves
				{ 20, 32036, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 31999, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Leather Helm
				{ 2, 32001, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Leather Spaulders
				{ 3, 32002, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Leather Tunic
				{ 4, 31998, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Leather Gloves
				{ 5, 32000, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 32006, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Linked Helm
				{ 2, 32008, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Linked Spaulders
				{ 3, 32004, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Linked Armor
				{ 4, 32005, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Linked Gauntlets
				{ 5, 32007, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Linked Leggings
				--
				{ 7, 32011, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Mail Helm
				{ 8, 32013, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Mail Spaulders
				{ 9, 32009, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Mail Armor
				{ 10, 32010, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Mail Gauntlets
				{ 11, 32012, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Mail Leggings
				--
				{ 16, 32031, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Ringmail Helm
				{ 17, 32033, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Ringmail Spaulders
				{ 18, 32029, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Ringmail Armor
				{ 19, 32030, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Ringmail Gauntlets
				{ 20, 32032, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 31974, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Dreadweave Hood
				{ 2, 31976, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Dreadweave Mantle
				{ 3, 31977, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Dreadweave Robe
				{ 4, 31973, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Dreadweave Gloves
				{ 5, 31975, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Dreadweave Leggings
				--
				{ 16, 31980, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Felweave Cowl
				{ 17, 31979, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Felweave Amice
				{ 18, 31982, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Felweave Raiment
				{ 19, 31981, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Felweave Handguards
				{ 20, 31983, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 30488, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Plate Helm
				{ 2, 30490, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Plate Shoulders
				{ 3, 30486, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Plate Chestpiece
				{ 4, 30487, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  },	-- Merciless Gladiator's Plate Gauntlets
				{ 5, 30489, [PRICE_EXTRA_ITTYPE] = "markofhonor:1000"  },	-- Merciless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
	},
}
data["CLASSICS2WEAPONS"] = {
	name = string.format(AL["Season %d"], 2).." "..AL["Weapons"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Weapons"]),
			[ALLIANCE_DIFF] = {
				{ 1, 31965, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Cleaver
				{ 2, 31986, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Crossbow of the Phoenix
				{ 3, 32045, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Shield Wall
				{ 4, 32962, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Touch of Defeat
				{ 5, 32055, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Merciless Gladiator's War Staff
				{ 6, 32003, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Fleshslicer
				{ 7, 32026, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Pummeler
				{ 8, 32028, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Ripper
				{ 9, 32044, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Shanker
				{ 10, 32052, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Slicer
				{ 11, 32053, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Spellblade
				{ 12, 32963, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Gavel
				{ 13, 32964, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Salvation
				{ 14, 33313, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Barrier
				{ 15, 31959, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Merciless Gladiator's Bonegrinder
				{ 16, 31966, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Merciless Gladiator's Decapitator
				{ 17, 31984, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Merciless Gladiator's Greatsword
				{ 18, 32014, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Merciless Gladiator's Maul
				{ 19, 32025, [PRICE_EXTRA_ITTYPE] = "markofhonor:1500"  }, -- Merciless Gladiator's Painsaw
				{ 20, 31958, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Bonecracker
				{ 21, 31985, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Hacker
				{ 22, 32027, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Quickblade
				{ 23, 32046, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Shiv
				{ 24, 31978, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Endgame
				{ 25, 32961, [PRICE_EXTRA_ITTYPE] = "markofhonor:750"  }, -- Merciless Gladiator's Reprieve
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 1
data["CLASSICS1SETS"] = {
	name = string.format(AL["Season %d"], 1).." "..AL["Class Sets"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
				-- Guardian
				{ 1, 28127 },	-- Gladiator's Dragonhide Helm
				{ 2, 28129 },	-- Gladiator's Dragonhide Spaulders
				{ 3, 28130 },	-- Gladiator's Dragonhide Tunic
				{ 4, 28126 },	-- Gladiator's Dragonhide Gloves
				{ 5, 28128 },	-- Gladiator's Dragonhide Legguards
				-- Restoration
				{ 7, 31376 },	-- Gladiator's Kodohide Helm
				{ 8, 31378 },	-- Gladiator's Kodohide Spaulders
				{ 9, 31379 },	-- Gladiator's Kodohide Tunic
				{ 10, 31375 },	-- Gladiator's Kodohide Gloves
				{ 11, 31377 },	-- Gladiator's Kodohide Legguards
				-- Feral
				{ 16, 28137 },	-- Gladiator's Wyrmhide Helm
				{ 17, 28139 },	-- Gladiator's Wyrmhide Spaulders
				{ 18, 28140 },	-- Gladiator's Wyrmhide Tunic
				{ 19, 28136 },	-- Gladiator's Wyrmhide Gloves
				{ 20, 28138 }, 	-- Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 28331 },	-- Gladiator's Chain Helm
				{ 2, 28333 },	-- Gladiator's Chain Spaulders
				{ 3, 28334 }, 	-- Gladiator's Chain Armor
				{ 4, 28335 },	-- Gladiator's Chain Gauntlets
				{ 5, 28332 },	-- Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 25855 },	-- Gladiator's Silk Cowl
				{ 2, 25854 },	-- Gladiator's Silk Amice
				{ 3, 25856 },	-- Gladiator's Silk Raiment
				{ 4, 25857 },	-- Gladiator's Silk Handguards
				{ 5, 25858 },	-- Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ALIL["SHAMAN"].." / "..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
				-- Retribution
				{ 1, 27704 },	-- Gladiator's Lamellar Helm
				{ 2, 27706 },	-- Gladiator's Lamellar Shoulders
				{ 3, 27702 },	-- Gladiator's Lamellar Chestpiece
				{ 4, 27703 },	-- Gladiator's Lamellar Gauntlets
				{ 5, 27705 },	-- Gladiator's Lamellar Legguards
				-- 
				{ 7, 27881 },	-- Gladiator's Scaled Helm
				{ 8, 27883 },	-- Gladiator's Scaled Shoulders
				{ 9, 27879 },	-- Gladiator's Scaled Chestpiece
				{ 10, 27880 },	-- Gladiator's Scaled Gauntlets
				{ 11, 27882 },	-- Gladiator's Scaled Legguards
				-- Holy
				{ 16, 31616 },	-- Gladiator's Ornamented Headcover
				{ 17, 31619 },	-- Gladiator's Ornamented Spaulders				
				{ 18, 31613 },	-- Gladiator's Ornamented Chestguard
				{ 19, 31614 },	-- Gladiator's Ornamented Gloves
				{ 20, 31618 },	-- Gladiator's Ornamented Legplates
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Enhancement
				{ 1, 25998 },  -- Gladiator's Linked Helm
				{ 2, 25999 },  -- Gladiator's Linked Spaulders
				{ 3, 25997 },  -- Gladiator's Linked Armor
				{ 4, 26000 },  -- Gladiator's Linked Gauntlets
				{ 5, 26001 },  -- Gladiator's Linked Leggings
				-- Elemental
				{ 7, 27471 },  -- Gladiator's Mail Helm
				{ 8, 27473 },  -- Gladiator's Mail Spaulders
				{ 9, 27469 },  -- Gladiator's Mail Armor
				{ 10, 27470 },  -- Gladiator's Mail Gauntlets
				{ 11, 27472 },  -- Gladiator's Mail Leggings
				-- Restoration
				{ 16, 31400 },  -- Gladiator's Ringmail Helm
				{ 17, 31407 },  -- Gladiator's Ringmail Spaulders
				{ 18, 31396 },  -- Gladiator's Ringmail Armor
				{ 19, 31397 },  -- Gladiator's Ringmail Gauntlets
				{ 20, 31406 },  -- Gladiator's Ringmail Leggings

			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
				-- Holy
				{ 1, 31410 },	-- Gladiator's Mooncloth Hood
				{ 2, 31412 },	-- Gladiator's Mooncloth Mantle
				{ 3, 31413 },	-- Gladiator's Mooncloth Robe
				{ 4, 31409 },	-- Gladiator's Mooncloth Gloves
				{ 5, 31411 },	-- Gladiator's Mooncloth Leggings
				-- Shadow
				{ 16, 27708 },	-- Gladiator's Satin Hood
				{ 17, 27710 },	-- Gladiator's Satin Mantle
				{ 18, 27711 },	-- Gladiator's Satin Robe
				{ 19, 27707 },	-- Gladiator's Satin Gloves
				{ 20, 27709 },	-- Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 25830 },	-- Gladiator's Leather Helm
				{ 2, 25832 },	-- Gladiator's Leather Spaulders
				{ 3, 25831 },	-- Gladiator's Leather Tunic
				{ 4, 25834 },	-- Gladiator's Leather Gloves
				{ 5, 25833 },	-- Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 24553 },	-- Gladiator's Dreadweave Hood
				{ 2, 24554 },	-- Gladiator's Dreadweave Mantle
				{ 3, 24552 },	-- Gladiator's Dreadweave Robe
				{ 4, 24556 },	-- Gladiator's Dreadweave Gloves
				{ 5, 24555 },	-- Gladiator's Dreadweave Leggings
				{ 16, 30187 },	-- Gladiator's Felweave Cowl
				{ 17, 30186 },	-- Gladiator's Felweave Amice
				{ 18, 30200 },	-- Gladiator's Felweave Raiment
				{ 19, 30188 },	-- Gladiator's Felweave Handguards
				{ 20, 30201 },	-- Gladiator's Felweave Trousers

			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 24545 },	-- Gladiator's Plate Helm
				{ 2, 24546 },	-- Gladiator's Plate Shoulders
				{ 3, 24544 },	-- Gladiator's Plate Chestpiece
				{ 4, 24549 },	-- Gladiator's Plate Gauntlets
				{ 5, 24547 },	-- Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
data["CLASSICS1WEAPONS"] = {
	name = string.format(AL["Season %d"], 1).." "..AL["Weapons"].." ("..EXPANSION_NAME1..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Weapons"]),
			[ALLIANCE_DIFF] = {
				{ 1, 28294 }, -- Gladiator's Heavy Crossbow
				{ 3, 28320 }, -- Gladiator's Touch of Defeat
				{ 5, 28314 }, -- Gladiator's Fleshslicer				
				{ 6, 28313 }, -- Gladiator's Ripper
				{ 7, 32450 }, -- Gladiator's Gavel
				{ 8, 28305 }, -- Gladiator's Pummeler
				{ 9, 32451 }, -- Gladiator's Salvation
				{ 10, 28312 }, -- Gladiator's Shanker
				{ 11, 28297 }, -- Gladiator's Spellblade
				{ 12, 28295 }, -- Gladiator's Slicer
				{ 13, 28308 }, -- Gladiator's Cleaver
				{ 16, 24557 }, -- Gladiator's War Staff
				{ 17, 28299 }, -- Gladiator's Bonegrinder
				{ 18, 28298 }, -- Gladiator's Decapitator
				{ 19, 24550 }, -- Gladiator's Greatsword
				{ 20, 28476 }, -- Gladiator's Maul
				{ 21, 28300 }, -- Gladiator's Painsaw
				{ 23, 28302 }, -- Gladiator's Bonecracker
				{ 24, 28309 }, -- Gladiator's Hacker
				{ 25, 28307 }, -- Gladiator's Quickblade
				{ 26, 28310 }, -- Gladiator's Shiv
				{ 28, 28358 }, -- Gladiator's Shield Wall
				{ 29, 28346 }, -- Gladiator's Endgame
				{ 30, 32452 }, -- Gladiator's Reprieve
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
