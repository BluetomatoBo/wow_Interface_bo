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

data["LEGION1SETS"] = {
	name = string.format(AL["Legion"].." "..AL["Season %d"], 1).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 135594 }, -- Vindictive Gladiator's Dreadplate Helm
				{ 2, 135596 }, -- Vindictive Gladiator's Dreadplate Shoulders
				{ 3, 135591 }, -- Vindictive Gladiator's Dreadplate Chestpiece
				{ 4, 135598 }, -- Vindictive Gladiator's Dreadplate Wristplates
				{ 5, 135593 }, -- Vindictive Gladiator's Dreadplate Gauntlets
				{ 6, 135597 }, -- Vindictive Gladiator's Dreadplate Girdle
				{ 7, 135595 }, -- Vindictive Gladiator's Dreadplate Legguards
				{ 8, 135592 }, -- Vindictive Gladiator's Dreadplate Sabatons
				{ 9, 135679 }, -- Vindictive Gladiator's Dreadcloak
				{ 16, 135820 }, -- Vindictive Combatant's Dreadplate Helm
				{ 17, 135822 }, -- Vindictive Combatant's Dreadplate Shoulders
				{ 18, 135817 }, -- Vindictive Combatant's Dreadplate Chestpiece
				{ 19, 135824 }, -- Vindictive Combatant's Dreadplate Wristplates
				{ 20, 135819 }, -- Vindictive Combatant's Dreadplate Gauntlets
				{ 21, 135823 }, -- Vindictive Combatant's Dreadplate Girdle
				{ 22, 135821 }, -- Vindictive Combatant's Dreadplate Legguards
				{ 23, 135818 }, -- Vindictive Combatant's Dreadplate Sabatons
				{ 24, 135905 }, -- Vindictive Combatant's Dreadcloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135707 }, -- Vindictive Gladiator's Dreadplate Helm
				{ 2, 135709 }, -- Vindictive Gladiator's Dreadplate Shoulders
				{ 3, 135704 }, -- Vindictive Gladiator's Dreadplate Chestpiece
				{ 4, 135711 }, -- Vindictive Gladiator's Dreadplate Wristplates
				{ 5, 135706 }, -- Vindictive Gladiator's Dreadplate Gauntlets
				{ 6, 135710 }, -- Vindictive Gladiator's Dreadplate Girdle
				{ 7, 135708 }, -- Vindictive Gladiator's Dreadplate Legguards
				{ 8, 135705 }, -- Vindictive Gladiator's Dreadplate Sabatons
				{ 9, 135792 }, -- Vindictive Gladiator's Dreadcloak
				{ 16, 135933 }, -- Vindictive Combatant's Dreadplate Helm
				{ 17, 135935 }, -- Vindictive Combatant's Dreadplate Shoulders
				{ 18, 135930 }, -- Vindictive Combatant's Dreadplate Chestpiece
				{ 19, 135937 }, -- Vindictive Combatant's Dreadplate Wristplates
				{ 20, 135932 }, -- Vindictive Combatant's Dreadplate Gauntlets
				{ 21, 135936 }, -- Vindictive Combatant's Dreadplate Girdle
				{ 22, 135934 }, -- Vindictive Combatant's Dreadplate Legguards
				{ 23, 135931 }, -- Vindictive Combatant's Dreadplate Sabatons
				{ 24, 136018 }, -- Vindictive Combatant's Dreadcloak
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEMONHUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 136281 }, -- Vindictive Gladiator's Felskin Helm
				{ 2, 136284 }, -- Vindictive Gladiator's Felskin Spaulders
				{ 3, 136283 }, -- Vindictive Gladiator's Felskin Tunic
				{ 4, 136286 }, -- Vindictive Gladiator's Felskin Wristguards
				{ 5, 136280 }, -- Vindictive Gladiator's Felskin Gloves
				{ 6, 136285 }, -- Vindictive Gladiator's Felskin Belt
				{ 7, 136282 }, -- Vindictive Gladiator's Felskin Legguards
				{ 8, 136279 }, -- Vindictive Gladiator's Felskin Boots
				{ 16, 136297 }, -- Vindictive Combatant's Felskin Helm
				{ 17, 136300 }, -- Vindictive Combatant's Felskin Spaulders
				{ 18, 136299 }, -- Vindictive Combatant's Felskin Tunic
				{ 19, 136302 }, -- Vindictive Combatant's Felskin Wristguards
				{ 20, 136296 }, -- Vindictive Combatant's Felskin Gloves
				{ 21, 136301 }, -- Vindictive Combatant's Felskin Belt
				{ 22, 136298 }, -- Vindictive Combatant's Felskin Legguards
				{ 23, 136295 }, -- Vindictive Combatant's Felskin Boots
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 136289 }, -- Vindictive Gladiator's Felskin Helm
				{ 2, 136292 }, -- Vindictive Gladiator's Felskin Spaulders
				{ 3, 136291 }, -- Vindictive Gladiator's Felskin Tunic
				{ 4, 136294 }, -- Vindictive Gladiator's Felskin Wristguards
				{ 5, 136288 }, -- Vindictive Gladiator's Felskin Gloves
				{ 6, 136293 }, -- Vindictive Gladiator's Felskin Belt
				{ 7, 136290 }, -- Vindictive Gladiator's Felskin Legguards
				{ 8, 136287 }, -- Vindictive Gladiator's Felskin Boots
				{ 16, 136305 }, -- Vindictive Combatant's Felskin Helm
				{ 17, 136308 }, -- Vindictive Combatant's Felskin Spaulders
				{ 18, 136307 }, -- Vindictive Combatant's Felskin Tunic
				{ 19, 136310 }, -- Vindictive Combatant's Felskin Wristguards
				{ 20, 136304 }, -- Vindictive Combatant's Felskin Gloves
				{ 21, 136309 }, -- Vindictive Combatant's Felskin Belt
				{ 22, 136306 }, -- Vindictive Combatant's Felskin Legguards
				{ 23, 136303 }, -- Vindictive Combatant's Felskin Boots
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 135601 }, -- Vindictive Gladiator's Dragonhide Helm
				{ 2, 135604 }, -- Vindictive Gladiator's Dragonhide Spaulders
				{ 3, 135603 }, -- Vindictive Gladiator's Dragonhide Robe
				{ 4, 135606 }, -- Vindictive Gladiator's Dragonhide Wristguards
				{ 5, 135600 }, -- Vindictive Gladiator's Dragonhide Gloves
				{ 6, 135605 }, -- Vindictive Gladiator's Dragonhide Belt
				{ 7, 135602 }, -- Vindictive Gladiator's Dragonhide Legguards
				{ 8, 135599 }, -- Vindictive Gladiator's Dragonhide Moccasins
				{ 9, 135680 }, -- Vindictive Gladiator's Dragonhide Cloak
				{ 16, 135827 }, -- Vindictive Combatant's Dragonhide Helm
				{ 17, 135830 }, -- Vindictive Combatant's Dragonhide Spaulders
				{ 18, 135829 }, -- Vindictive Combatant's Dragonhide Tunic
				{ 19, 135832 }, -- Vindictive Combatant's Dragonhide Wristguards
				{ 20, 135826 }, -- Vindictive Combatant's Dragonhide Gloves
				{ 21, 135831 }, -- Vindictive Combatant's Dragonhide Belt
				{ 22, 135828 }, -- Vindictive Combatant's Dragonhide Legguards
				{ 23, 135825 }, -- Vindictive Combatant's Dragonhide Moccasins
				{ 24, 135909 }, -- Vindictive Combatant's Dragonhide Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135714 }, -- Vindictive Gladiator's Dragonhide Helm
				{ 2, 135717 }, -- Vindictive Gladiator's Dragonhide Spaulders
				{ 3, 135716 }, -- Vindictive Gladiator's Dragonhide Robe
				{ 4, 135719 }, -- Vindictive Gladiator's Dragonhide Wristguards
				{ 5, 135713 }, -- Vindictive Gladiator's Dragonhide Gloves
				{ 6, 135718 }, -- Vindictive Gladiator's Dragonhide Belt
				{ 7, 135715 }, -- Vindictive Gladiator's Dragonhide Legguards
				{ 8, 135712 }, -- Vindictive Gladiator's Dragonhide Moccasins
				{ 9, 135796 }, -- Vindictive Gladiator's Dragonhide Cloak
				{ 16, 135940 }, -- Vindictive Combatant's Dragonhide Helm
				{ 17, 135943 }, -- Vindictive Combatant's Dragonhide Spaulders
				{ 18, 135942 }, -- Vindictive Combatant's Dragonhide Tunic
				{ 19, 135945 }, -- Vindictive Combatant's Dragonhide Wristguards
				{ 20, 135939 }, -- Vindictive Combatant's Dragonhide Gloves
				{ 21, 135944 }, -- Vindictive Combatant's Dragonhide Belt
				{ 22, 135941 }, -- Vindictive Combatant's Dragonhide Legguards
				{ 23, 135938 }, -- Vindictive Combatant's Dragonhide Moccasins
				{ 24, 136022 }, -- Vindictive Combatant's Dragonhide Cloak
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 135610 }, -- Vindictive Gladiator's Chain Helm
				{ 2, 135612 }, -- Vindictive Gladiator's Chain Spaulders
				{ 3, 135607 }, -- Vindictive Gladiator's Chain Armor
				{ 4, 135614 }, -- Vindictive Gladiator's Chain Armband
				{ 5, 135609 }, -- Vindictive Gladiator's Chain Gauntlets
				{ 6, 135613 }, -- Vindictive Gladiator's Chain Clasp
				{ 7, 135611 }, -- Vindictive Gladiator's Chain Leggings
				{ 8, 135608 }, -- Vindictive Gladiator's Chain Treads
				{ 16, 135836 }, -- Vindictive Combatant's Chain Helm
				{ 17, 135838 }, -- Vindictive Combatant's Chain Spaulders
				{ 18, 135833 }, -- Vindictive Combatant's Chain Armor
				{ 19, 135840 }, -- Vindictive Combatant's Chain Armband
				{ 20, 135835 }, -- Vindictive Combatant's Chain Gauntlets
				{ 21, 135839 }, -- Vindictive Combatant's Chain Clasp
				{ 22, 135837 }, -- Vindictive Combatant's Chain Leggings
				{ 23, 135834 }, -- Vindictive Combatant's Chain Treads
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135723 }, -- Vindictive Gladiator's Chain Helm
				{ 2, 135725 }, -- Vindictive Gladiator's Chain Spaulders
				{ 3, 135720 }, -- Vindictive Gladiator's Chain Armor
				{ 4, 135727 }, -- Vindictive Gladiator's Chain Armband
				{ 5, 135722 }, -- Vindictive Gladiator's Chain Gauntlets
				{ 6, 135726 }, -- Vindictive Gladiator's Chain Clasp
				{ 7, 135724 }, -- Vindictive Gladiator's Chain Leggings
				{ 8, 135721 }, -- Vindictive Gladiator's Chain Treads
				{ 16, 135949 }, -- Vindictive Combatant's Chain Helm
				{ 17, 135951 }, -- Vindictive Combatant's Chain Spaulders
				{ 18, 135946 }, -- Vindictive Combatant's Chain Armor
				{ 19, 135953 }, -- Vindictive Combatant's Chain Armband
				{ 20, 135948 }, -- Vindictive Combatant's Chain Gauntlets
				{ 21, 135952 }, -- Vindictive Combatant's Chain Clasp
				{ 22, 135950 }, -- Vindictive Combatant's Chain Leggings
				{ 23, 135947 }, -- Vindictive Combatant's Chain Treads
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 135617 }, -- Vindictive Gladiator's Silk Cowl
				{ 2, 135620 }, -- Vindictive Gladiator's Silk Amice
				{ 3, 135619 }, -- Vindictive Gladiator's Silk Robe
				{ 4, 135622 }, -- Vindictive Gladiator's Silk Bracers
				{ 5, 135616 }, -- Vindictive Gladiator's Silk Handguards
				{ 6, 135621 }, -- Vindictive Gladiator's Silk Cord
				{ 7, 135618 }, -- Vindictive Gladiator's Silk Trousers
				{ 8, 135615 }, -- Vindictive Gladiator's Silk Treads
				{ 9, 135684 }, -- Vindictive Gladiator's Silken Shawl
				{ 16, 135843 }, -- Vindictive Combatant's Silk Cowl
				{ 17, 135846 }, -- Vindictive Combatant's Silk Amice
				{ 18, 135845 }, -- Vindictive Combatant's Silk Robe
				{ 19, 135848 }, -- Vindictive Combatant's Silk Bracers
				{ 20, 135842 }, -- Vindictive Combatant's Silk Handguards
				{ 21, 135847 }, -- Vindictive Combatant's Silk Cord
				{ 22, 135844 }, -- Vindictive Combatant's Silk Trousers
				{ 23, 135841 }, -- Vindictive Combatant's Silk Treads
				{ 24, 135906 }, -- Vindictive Combatant's Silken Shawl
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135730 }, -- Vindictive Gladiator's Silk Cowl
				{ 2, 135733 }, -- Vindictive Gladiator's Silk Amice
				{ 3, 135732 }, -- Vindictive Gladiator's Silk Robe
				{ 4, 135735 }, -- Vindictive Gladiator's Silk Bracers
				{ 5, 135729 }, -- Vindictive Gladiator's Silk Handguards
				{ 6, 135734 }, -- Vindictive Gladiator's Silk Cord
				{ 7, 135731 }, -- Vindictive Gladiator's Silk Trousers
				{ 8, 135728 }, -- Vindictive Gladiator's Silk Treads
				{ 9, 135793 }, -- Vindictive Gladiator's Silken Shawl
				{ 16, 135956 }, -- Vindictive Combatant's Silk Cowl
				{ 17, 135959 }, -- Vindictive Combatant's Silk Amice
				{ 18, 135958 }, -- Vindictive Combatant's Silk Robe
				{ 19, 135961 }, -- Vindictive Combatant's Silk Bracers
				{ 20, 135955 }, -- Vindictive Combatant's Silk Handguards
				{ 21, 135960 }, -- Vindictive Combatant's Silk Cord
				{ 22, 135957 }, -- Vindictive Combatant's Silk Trousers
				{ 23, 135954 }, -- Vindictive Combatant's Silk Treads
				{ 24, 136019 }, -- Vindictive Combatant's Silken Shawl
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 135625 }, -- Vindictive Gladiator's Ironskin Helm
				{ 2, 135627 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 3, 135628 }, -- Vindictive Gladiator's Ironskin Tunic
				{ 4, 135630 }, -- Vindictive Gladiator's Ironskin Wristguards
				{ 5, 135624 }, -- Vindictive Gladiator's Ironskin Gloves
				{ 6, 135629 }, -- Vindictive Gladiator's Ironskin Belt
				{ 7, 135626 }, -- Vindictive Gladiator's Ironskin Legguards
				{ 8, 135623 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 16, 135851 }, -- Vindictive Combatant's Ironskin Helm
				{ 17, 135853 }, -- Vindictive Combatant's Ironskin Spaulders
				{ 18, 135854 }, -- Vindictive Combatant's Ironskin Tunic
				{ 19, 135856 }, -- Vindictive Combatant's Ironskin Wristguards
				{ 20, 135850 }, -- Vindictive Combatant's Ironskin Gloves
				{ 21, 135855 }, -- Vindictive Combatant's Ironskin Belt
				{ 22, 135852 }, -- Vindictive Combatant's Ironskin Legguards
				{ 23, 135849 }, -- Vindictive Combatant's Ironskin Spaulders
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135738 }, -- Vindictive Gladiator's Ironskin Helm
				{ 2, 135740 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 3, 135741 }, -- Vindictive Gladiator's Ironskin Tunic
				{ 4, 135743 }, -- Vindictive Gladiator's Ironskin Wristguards
				{ 5, 135737 }, -- Vindictive Gladiator's Ironskin Gloves
				{ 6, 135742 }, -- Vindictive Gladiator's Ironskin Belt
				{ 7, 135739 }, -- Vindictive Gladiator's Ironskin Legguards
				{ 8, 135736 }, -- Vindictive Gladiator's Ironskin Spaulders
				{ 16, 135964 }, -- Vindictive Combatant's Ironskin Helm
				{ 17, 135966 }, -- Vindictive Combatant's Ironskin Spaulders
				{ 18, 135967 }, -- Vindictive Combatant's Ironskin Tunic
				{ 19, 135969 }, -- Vindictive Combatant's Ironskin Wristguards
				{ 20, 135963 }, -- Vindictive Combatant's Ironskin Gloves
				{ 21, 135968 }, -- Vindictive Combatant's Ironskin Belt
				{ 22, 135965 }, -- Vindictive Combatant's Ironskin Legguards
				{ 23, 135962 }, -- Vindictive Combatant's Ironskin Spaulders
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 135634 }, -- Vindictive Gladiator's Scaled Helm
				{ 2, 135636 }, -- Vindictive Gladiator's Scaled Shoulders
				{ 3, 135631 }, -- Vindictive Gladiator's Scaled Battlerobe
				{ 4, 135638 }, -- Vindictive Gladiator's Scaled Wristplates
				{ 5, 135633 }, -- Vindictive Gladiator's Scaled Gauntlets
				{ 6, 135637 }, -- Vindictive Gladiator's Scaled Girdle
				{ 7, 135635 }, -- Vindictive Gladiator's Scaled Legguards
				{ 8, 135632 }, -- Vindictive Gladiator's Scaled Sabatons
				{ 9, 135688 }, -- Vindictive Gladiator's Greatcloak of Faith
				{ 16, 135860 }, -- Vindictive Combatant's Scaled Helm
				{ 17, 135862 }, -- Vindictive Combatant's Scaled Shoulders
				{ 18, 135857 }, -- Vindictive Combatant's Scaled Chestpiece
				{ 19, 135864 }, -- Vindictive Combatant's Scaled Wristplates
				{ 20, 135859 }, -- Vindictive Combatant's Scaled Gauntlets
				{ 21, 135863 }, -- Vindictive Combatant's Scaled Girdle
				{ 22, 135861 }, -- Vindictive Combatant's Scaled Legguards
				{ 23, 135858 }, -- Vindictive Combatant's Scaled Sabatons
				{ 24, 135914 }, -- Vindictive Combatant's Greatcloak of Faith
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135747 }, -- Vindictive Gladiator's Scaled Helm
				{ 2, 135749 }, -- Vindictive Gladiator's Scaled Shoulders
				{ 3, 135744 }, -- Vindictive Gladiator's Scaled Battleplate
				{ 4, 135751 }, -- Vindictive Gladiator's Scaled Wristplates
				{ 5, 135746 }, -- Vindictive Gladiator's Scaled Gauntlets
				{ 6, 135750 }, -- Vindictive Gladiator's Scaled Girdle
				{ 7, 135748 }, -- Vindictive Gladiator's Scaled Legguards
				{ 8, 135745 }, -- Vindictive Gladiator's Scaled Sabatons
				{ 9, 135801 }, -- Vindictive Gladiator's Greatcloak of Faith
				{ 16, 135973 }, -- Vindictive Combatant's Scaled Helm
				{ 17, 135975 }, -- Vindictive Combatant's Scaled Shoulders
				{ 18, 135970 }, -- Vindictive Combatant's Scaled Chestpiece
				{ 19, 135977 }, -- Vindictive Combatant's Scaled Wristplates
				{ 20, 135972 }, -- Vindictive Combatant's Scaled Gauntlets
				{ 21, 135976 }, -- Vindictive Combatant's Scaled Girdle
				{ 22, 135974 }, -- Vindictive Combatant's Scaled Legguards
				{ 23, 135971 }, -- Vindictive Combatant's Scaled Sabatons
				{ 24, 136027 }, -- Vindictive Combatant's Greatcloak of Faith
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 135641 }, -- Vindictive Gladiator's Satin Hood
				{ 2, 135644 }, -- Vindictive Gladiator's Satin Mantle
				{ 3, 135643 }, -- Vindictive Gladiator's Satin Robe
				{ 4, 135646 }, -- Vindictive Gladiator's Satin Bracers
				{ 5, 135640 }, -- Vindictive Gladiator's Satin Gloves
				{ 6, 135645 }, -- Vindictive Gladiator's Satin Cord
				{ 7, 135642 }, -- Vindictive Gladiator's Satin Leggings
				{ 8, 135639 }, -- Vindictive Gladiator's Satin Treads
				{ 9, 136861 }, -- Vindictive Gladiator's Drape of Piety
				{ 16, 135867 }, -- Vindictive Combatant's Satin Hood
				{ 17, 135870 }, -- Vindictive Combatant's Satin Mantle
				{ 18, 135869 }, -- Vindictive Combatant's Satin Robe
				{ 19, 135872 }, -- Vindictive Combatant's Satin Bracers
				{ 20, 135866 }, -- Vindictive Combatant's Satin Gloves
				{ 21, 135871 }, -- Vindictive Combatant's Satin Cord
				{ 22, 135868 }, -- Vindictive Combatant's Satin Leggings
				{ 23, 135865 }, -- Vindictive Combatant's Satin Treads
				{ 24, 136867 }, -- Vindictive Combatant's Drape of Piety
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135754 }, -- Vindictive Gladiator's Satin Hood
				{ 2, 135757 }, -- Vindictive Gladiator's Satin Mantle
				{ 3, 135756 }, -- Vindictive Gladiator's Satin Robe
				{ 4, 135759 }, -- Vindictive Gladiator's Satin Bracers
				{ 5, 135753 }, -- Vindictive Gladiator's Satin Gloves
				{ 6, 135758 }, -- Vindictive Gladiator's Satin Cord
				{ 7, 135755 }, -- Vindictive Gladiator's Satin Leggings
				{ 8, 135752 }, -- Vindictive Gladiator's Satin Treads
				{ 9, 136864 }, -- Vindictive Gladiator's Drape of Piety
				{ 16, 135980 }, -- Vindictive Combatant's Satin Hood
				{ 17, 135983 }, -- Vindictive Combatant's Satin Mantle
				{ 18, 135982 }, -- Vindictive Combatant's Satin Robe
				{ 19, 135985 }, -- Vindictive Combatant's Satin Bracers
				{ 20, 135979 }, -- Vindictive Combatant's Satin Gloves
				{ 21, 135984 }, -- Vindictive Combatant's Satin Cord
				{ 22, 135981 }, -- Vindictive Combatant's Satin Leggings
				{ 23, 135978 }, -- Vindictive Combatant's Satin Treads
				{ 24, 136870 }, -- Vindictive Combatant's Drape of Piety
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 135650 }, -- Vindictive Gladiator's Leather Helm
				{ 2, 135652 }, -- Vindictive Gladiator's Leather Spaulders
				{ 3, 135647 }, -- Vindictive Gladiator's Leather Tunic
				{ 4, 135654 }, -- Vindictive Gladiator's Leather Wristguards
				{ 5, 135649 }, -- Vindictive Gladiator's Leather Gloves
				{ 6, 135653 }, -- Vindictive Gladiator's Leather Belt
				{ 7, 135651 }, -- Vindictive Gladiator's Leather Legguards
				{ 8, 135648 }, -- Vindictive Gladiator's Leather Slippers
				{ 9, 136862 }, -- Vindictive Gladiator's Shadowcape
				{ 16, 135876 }, -- Vindictive Combatant's Leather Helm
				{ 17, 135878 }, -- Vindictive Combatant's Leather Spaulders
				{ 18, 135873 }, -- Vindictive Combatant's Leather Tunic
				{ 19, 135880 }, -- Vindictive Combatant's Leather Wristguards
				{ 20, 135875 }, -- Vindictive Combatant's Leather Gloves
				{ 21, 135879 }, -- Vindictive Combatant's Leather Belt
				{ 22, 135877 }, -- Vindictive Combatant's Leather Legguards
				{ 23, 135874 }, -- Vindictive Combatant's Leather Slippers
				{ 24, 136868 }, -- Vindictive Combatant's Shadowcape
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135763 }, -- Vindictive Gladiator's Leather Helm
				{ 2, 135765 }, -- Vindictive Gladiator's Leather Spaulders
				{ 3, 135760 }, -- Vindictive Gladiator's Leather Tunic
				{ 4, 135767 }, -- Vindictive Gladiator's Leather Wristguards
				{ 5, 135762 }, -- Vindictive Gladiator's Leather Gloves
				{ 6, 135766 }, -- Vindictive Gladiator's Leather Belt
				{ 7, 135764 }, -- Vindictive Gladiator's Leather Legguards
				{ 8, 135761 }, -- Vindictive Gladiator's Leather Slippers
				{ 9, 136865 }, -- Vindictive Gladiator's Shadowcape
				{ 16, 135989 }, -- Vindictive Combatant's Leather Helm
				{ 17, 135991 }, -- Vindictive Combatant's Leather Spaulders
				{ 18, 135986 }, -- Vindictive Combatant's Leather Tunic
				{ 19, 135993 }, -- Vindictive Combatant's Leather Wristguards
				{ 20, 135988 }, -- Vindictive Combatant's Leather Gloves
				{ 21, 135992 }, -- Vindictive Combatant's Leather Belt
				{ 22, 135990 }, -- Vindictive Combatant's Leather Legguards
				{ 23, 135987 }, -- Vindictive Combatant's Leather Slippers
				{ 24, 136871 }, -- Vindictive Combatant's Shadowcape
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 135658 }, -- Vindictive Gladiator's Ringmail Helm
				{ 2, 135660 }, -- Vindictive Gladiator's Ringmail Spaulders
				{ 3, 135655 }, -- Vindictive Gladiator's Ringmail Armor
				{ 4, 135662 }, -- Vindictive Gladiator's Ringmail Armband
				{ 5, 135657 }, -- Vindictive Gladiator's Ringmail Gauntlets
				{ 6, 135661 }, -- Vindictive Gladiator's Ringmail Clasp
				{ 7, 135659 }, -- Vindictive Gladiator's Ringmail Kilt
				{ 8, 135656 }, -- Vindictive Gladiator's Ringmail Boots
				{ 9, 136863 }, -- Vindictive Gladiator's Totemic Cloak
				{ 16, 135884 }, -- Vindictive Combatant's Ringmail Helm
				{ 17, 135886 }, -- Vindictive Combatant's Ringmail Spaulders
				{ 18, 135881 }, -- Vindictive Combatant's Ringmail Armor
				{ 19, 135888 }, -- Vindictive Combatant's Ringmail Armband
				{ 20, 135883 }, -- Vindictive Combatant's Ringmail Gauntlets
				{ 21, 135887 }, -- Vindictive Combatant's Ringmail Clasp
				{ 22, 135885 }, -- Vindictive Combatant's Ringmail Kilt
				{ 23, 135882 }, -- Vindictive Combatant's Ringmail Boots
				{ 24, 136869 }, -- Vindictive Combatant's Totemic Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135771 }, -- Vindictive Gladiator's Ringmail Helm
				{ 2, 135773 }, -- Vindictive Gladiator's Ringmail Spaulders
				{ 3, 135768 }, -- Vindictive Gladiator's Ringmail Armor
				{ 4, 135775 }, -- Vindictive Gladiator's Ringmail Armband
				{ 5, 135770 }, -- Vindictive Gladiator's Ringmail Gauntlets
				{ 6, 135774 }, -- Vindictive Gladiator's Ringmail Clasp
				{ 7, 135772 }, -- Vindictive Gladiator's Ringmail Kilt
				{ 8, 135769 }, -- Vindictive Gladiator's Ringmail Boots
				{ 9, 136866 }, -- Vindictive Gladiator's Totemic Cloak
				{ 16, 135997 }, -- Vindictive Combatant's Ringmail Helm
				{ 17, 135999 }, -- Vindictive Combatant's Ringmail Spaulders
				{ 18, 135994 }, -- Vindictive Combatant's Ringmail Armor
				{ 19, 136001 }, -- Vindictive Combatant's Ringmail Armband
				{ 20, 135996 }, -- Vindictive Combatant's Ringmail Gauntlets
				{ 21, 136000 }, -- Vindictive Combatant's Ringmail Clasp
				{ 22, 135998 }, -- Vindictive Combatant's Ringmail Kilt
				{ 23, 135995 }, -- Vindictive Combatant's Ringmail Boots
				{ 24, 136872 }, -- Vindictive Combatant's Totemic Cloak
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 135665 }, -- Vindictive Gladiator's Felweave Cowl
				{ 2, 135668 }, -- Vindictive Gladiator's Felweave Amice
				{ 3, 135667 }, -- Vindictive Gladiator's Felweave Raiment
				{ 4, 135670 }, -- Vindictive Gladiator's Felweave Bracers
				{ 5, 135664 }, -- Vindictive Gladiator's Felweave Handguards
				{ 6, 135669 }, -- Vindictive Gladiator's Felweave Cord
				{ 7, 135666 }, -- Vindictive Gladiator's Felweave Trousers
				{ 8, 135663 }, -- Vindictive Gladiator's Felweave Treads
				{ 9, 136879 }, -- Vindictive Gladiator's Felweave Cloak
				{ 16, 135891 }, -- Vindictive Combatant's Felweave Cowl
				{ 17, 135894 }, -- Vindictive Combatant's Felweave Amice
				{ 18, 135893 }, -- Vindictive Combatant's Felweave Raiment
				{ 19, 135896 }, -- Vindictive Combatant's Felweave Bracers
				{ 20, 135890 }, -- Vindictive Combatant's Felweave Handguards
				{ 21, 135895 }, -- Vindictive Combatant's Felweave Cord
				{ 22, 135892 }, -- Vindictive Combatant's Felweave Trousers
				{ 23, 135889 }, -- Vindictive Combatant's Felweave Treads
				{ 24, 136881 }, -- Vindictive Combatant's Felweave Cloak
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135778 }, -- Vindictive Gladiator's Felweave Cowl
				{ 2, 135781 }, -- Vindictive Gladiator's Felweave Amice
				{ 3, 135780 }, -- Vindictive Gladiator's Felweave Raiment
				{ 4, 135783 }, -- Vindictive Gladiator's Felweave Bracers
				{ 5, 135777 }, -- Vindictive Gladiator's Felweave Handguards
				{ 6, 135782 }, -- Vindictive Gladiator's Felweave Cord
				{ 7, 135779 }, -- Vindictive Gladiator's Felweave Trousers
				{ 8, 135776 }, -- Vindictive Gladiator's Felweave Treads
				{ 9, 136880 }, -- Vindictive Gladiator's Felweave Cloak
				{ 16, 136004 }, -- Vindictive Combatant's Felweave Cowl
				{ 17, 136007 }, -- Vindictive Combatant's Felweave Amice
				{ 18, 136006 }, -- Vindictive Combatant's Felweave Raiment
				{ 19, 136009 }, -- Vindictive Combatant's Felweave Bracers
				{ 20, 136003 }, -- Vindictive Combatant's Felweave Handguards
				{ 21, 136008 }, -- Vindictive Combatant's Felweave Cord
				{ 22, 136005 }, -- Vindictive Combatant's Felweave Trousers
				{ 23, 136002 }, -- Vindictive Combatant's Felweave Treads
				{ 24, 136882 }, -- Vindictive Combatant's Felweave Cloak
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 135674 }, -- Vindictive Gladiator's Plate Helm
				{ 2, 135676 }, -- Vindictive Gladiator's Plate Shoulders
				{ 3, 135671 }, -- Vindictive Gladiator's Plate Chestpiece
				{ 4, 135678 }, -- Vindictive Gladiator's Plate Wristplates
				{ 5, 135673 }, -- Vindictive Gladiator's Plate Gauntlets
				{ 6, 135677 }, -- Vindictive Gladiator's Plate Girdle
				{ 7, 135675 }, -- Vindictive Gladiator's Plate Legguards
				{ 8, 135672 }, -- Vindictive Gladiator's Plate Warboots
				{ 9, 136885 }, -- Vindictive Gladiator's Cloak of Battle
				{ 16, 135900 }, -- Vindictive Combatant's Plate Helm
				{ 17, 135902 }, -- Vindictive Combatant's Plate Shoulders
				{ 18, 135897 }, -- Vindictive Combatant's Plate Chestpiece
				{ 19, 135904 }, -- Vindictive Combatant's Plate Wristplates
				{ 20, 135899 }, -- Vindictive Combatant's Plate Gauntlets
				{ 21, 135903 }, -- Vindictive Combatant's Plate Girdle
				{ 22, 135901 }, -- Vindictive Combatant's Plate Legguards
				{ 23, 135898 }, -- Vindictive Combatant's Plate Warboots
				{ 24, 136887 }, -- Vindictive Combatant's Cloak of Battle
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 135787 }, -- Vindictive Gladiator's Plate Helm
				{ 2, 135789 }, -- Vindictive Gladiator's Plate Shoulders
				{ 3, 135784 }, -- Vindictive Gladiator's Plate Chestpiece
				{ 4, 135791 }, -- Vindictive Gladiator's Plate Wristplates
				{ 5, 135786 }, -- Vindictive Gladiator's Plate Gauntlets
				{ 6, 135790 }, -- Vindictive Gladiator's Plate Girdle
				{ 7, 135788 }, -- Vindictive Gladiator's Plate Legguards
				{ 8, 135785 }, -- Vindictive Gladiator's Plate Warboots
				{ 9, 136886 }, -- Vindictive Gladiator's Cloak of Battle
				{ 16, 136013 }, -- Vindictive Combatant's Plate Helm
				{ 17, 136015 }, -- Vindictive Combatant's Plate Shoulders
				{ 18, 136010 }, -- Vindictive Combatant's Plate Chestpiece
				{ 19, 136017 }, -- Vindictive Combatant's Plate Wristplates
				{ 20, 136012 }, -- Vindictive Combatant's Plate Gauntlets
				{ 21, 136016 }, -- Vindictive Combatant's Plate Girdle
				{ 22, 136014 }, -- Vindictive Combatant's Plate Legguards
				{ 23, 136011 }, -- Vindictive Combatant's Plate Warboots
				{ 24, 136888 }, -- Vindictive Combatant's Cloak of Battle
			},
		},
	},
}
data["WODS3SETS"] = {
	name = string.format(AL["Warlords Season %d"], 3).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 125827, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dreadplate Helm
				{ 2, 125829, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dreadplate Shoulders
				{ 3, 125825, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dreadplate Chestpiece
				{ 4, 125826, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dreadplate Gauntlets
				{ 5, 125828, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dreadplate Legguards
				{ 7, 126029, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dreadplate Helm
				{ 8, 126031, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dreadplate Shoulders
				{ 9, 126027, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dreadplate Chestpiece
				{ 10, 126028, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dreadplate Gauntlets
				{ 11, 126030, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dreadplate Legguards
				{ 16, 126186 }, -- Warmongering Aspirant's Dreadplate Helm
				{ 17, 126188 }, -- Warmongering Aspirant's Dreadplate Shoulders
				{ 18, 126184 }, -- Warmongering Aspirant's Dreadplate Chestpiece
				{ 19, 126185 }, -- Warmongering Aspirant's Dreadplate Gauntlets
				{ 20, 126187 }, -- Warmongering Aspirant's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126306, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dreadplate Helm
				{ 2, 126308, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dreadplate Shoulders
				{ 3, 126304, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dreadplate Chestpiece
				{ 4, 126305, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dreadplate Gauntlets
				{ 5, 126307, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dreadplate Legguards
				{ 7, 126506, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dreadplate Helm
				{ 8, 126508, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dreadplate Shoulders
				{ 9, 126504, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dreadplate Chestpiece
				{ 10, 126505, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dreadplate Gauntlets
				{ 11, 126507, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dreadplate Legguards
				{ 16, 126663 }, -- Warmongering Aspirant's Dreadplate Helm
				{ 17, 126665 }, -- Warmongering Aspirant's Dreadplate Shoulders
				{ 18, 126661 }, -- Warmongering Aspirant's Dreadplate Chestpiece
				{ 19, 126662 }, -- Warmongering Aspirant's Dreadplate Gauntlets
				{ 20, 126664 }, -- Warmongering Aspirant's Dreadplate Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 125831, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dragonhide Helm
				{ 2, 125834, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dragonhide Spaulders
				{ 3, 125833, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dragonhide Robes
				{ 4, 125830, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dragonhide Gloves
				{ 5, 125832, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dragonhide Legguards
				{ 7, 126033, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dragonhide Helm
				{ 8, 126036, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dragonhide Spaulders
				{ 9, 126035, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dragonhide Tunic
				{ 10, 126032, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dragonhide Gloves
				{ 11, 126034, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dragonhide Legguards
				{ 16, 126190 }, -- Warmongering Aspirant's Dragonhide Helm
				{ 17, 126193 }, -- Warmongering Aspirant's Dragonhide Spaulders
				{ 18, 126192 }, -- Warmongering Aspirant's Dragonhide Tunic
				{ 19, 126189 }, -- Warmongering Aspirant's Dragonhide Gloves
				{ 20, 126191 }, -- Warmongering Aspirant's Dragonhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126310, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dragonhide Helm
				{ 2, 126313, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dragonhide Spaulders
				{ 3, 126312, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dragonhide Robes
				{ 4, 126309, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Dragonhide Gloves
				{ 5, 126311, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Dragonhide Legguards
				{ 7, 126510, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dragonhide Helm
				{ 8, 126513, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dragonhide Spaulders
				{ 9, 126512, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dragonhide Tunic
				{ 10, 126509, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Dragonhide Gloves
				{ 11, 126511, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Dragonhide Legguards
				{ 16, 126667 }, -- Warmongering Aspirant's Dragonhide Helm
				{ 17, 126670 }, -- Warmongering Aspirant's Dragonhide Spaulders
				{ 18, 126669 }, -- Warmongering Aspirant's Dragonhide Tunic
				{ 19, 126666 }, -- Warmongering Aspirant's Dragonhide Gloves
				{ 20, 126668 }, -- Warmongering Aspirant's Dragonhide Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 125837, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chain Helm
				{ 2, 125839, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Chain Spaulders
				{ 3, 125835, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chain Armor
				{ 4, 125836, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Chain Gauntlets
				{ 5, 125838, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chain Leggings
				{ 7, 126039, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Chain Helm
				{ 8, 126041, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Chain Spaulders
				{ 9, 126037, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Chain Armor
				{ 10, 126038, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Chain Gauntlets
				{ 11, 126040, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Chain Leggings
				{ 16, 126196 }, -- Warmongering Aspirant's Chain Helm
				{ 17, 126198 }, -- Warmongering Aspirant's Chain Spaulders
				{ 18, 126194 }, -- Warmongering Aspirant's Chain Armor
				{ 19, 126195 }, -- Warmongering Aspirant's Chain Gauntlets
				{ 20, 126197 }, -- Warmongering Aspirant's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126316, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chain Helm
				{ 2, 126318, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Chain Spaulders
				{ 3, 126314, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chain Armor
				{ 4, 126315, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Chain Gauntlets
				{ 5, 126317, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chain Leggings
				{ 7, 126516, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Chain Helm
				{ 8, 126518, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Chain Spaulders
				{ 9, 126514, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Chain Armor
				{ 10, 126515, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Chain Gauntlets
				{ 11, 126517, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Chain Leggings
				{ 16, 126673 }, -- Warmongering Aspirant's Chain Helm
				{ 17, 126675 }, -- Warmongering Aspirant's Chain Spaulders
				{ 18, 126671 }, -- Warmongering Aspirant's Chain Armor
				{ 19, 126672 }, -- Warmongering Aspirant's Chain Gauntlets
				{ 20, 126674 }, -- Warmongering Aspirant's Chain Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 125884, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Silk Cowl
				{ 2, 125887, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Silk Amice
				{ 3, 125886, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Silk Robe
				{ 4, 125883, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Silk Handguards
				{ 5, 125885, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Silk Trousers
				{ 7, 126078, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Silk Cowl
				{ 8, 126081, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Silk Amice
				{ 9, 126080, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Silk Robe
				{ 10, 126077, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Silk Handguards
				{ 11, 126079, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Silk Trousers
				{ 16, 126211 }, -- Warmongering Aspirant's Silk Cowl
				{ 17, 126214 }, -- Warmongering Aspirant's Silk Amice
				{ 18, 126213 }, -- Warmongering Aspirant's Silk Robe
				{ 19, 126210 }, -- Warmongering Aspirant's Silk Handguards
				{ 20, 126212 }, -- Warmongering Aspirant's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126363, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Silk Cowl
				{ 2, 126366, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Silk Amice
				{ 3, 126365, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Silk Robe
				{ 4, 126362, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Silk Handguards
				{ 5, 126364, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Silk Trousers
				{ 7, 126555, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Silk Cowl
				{ 8, 126558, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Silk Amice
				{ 9, 126557, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Silk Robe
				{ 10, 126554, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Silk Handguards
				{ 11, 126556, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Silk Trousers
				{ 16, 126688 }, -- Warmongering Aspirant's Silk Cowl
				{ 17, 126691 }, -- Warmongering Aspirant's Silk Amice
				{ 18, 126690 }, -- Warmongering Aspirant's Silk Robe
				{ 19, 126687 }, -- Warmongering Aspirant's Silk Handguards
				{ 20, 126689 }, -- Warmongering Aspirant's Silk Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 125908, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ironskin Helm
				{ 2, 125910, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ironskin Spaulders
				{ 3, 125911, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ironskin Tunic
				{ 4, 125907, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ironskin Gloves
				{ 5, 125909, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ironskin Legguards
				{ 7, 126094, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ironskin Helm
				{ 8, 126096, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ironskin Spaulders
				{ 9, 126097, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ironskin Tunic
				{ 10, 126093, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ironskin Gloves
				{ 11, 126095, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ironskin Legguards
				{ 16, 126219 }, -- Warmongering Aspirant's Ironskin Helm
				{ 17, 126221 }, -- Warmongering Aspirant's Ironskin Spaulders
				{ 18, 126222 }, -- Warmongering Aspirant's Ironskin Tunic
				{ 19, 126218 }, -- Warmongering Aspirant's Ironskin Gloves
				{ 20, 126220 }, -- Warmongering Aspirant's Ironskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126387, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ironskin Helm
				{ 2, 126389, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ironskin Spaulders
				{ 3, 126390, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ironskin Tunic
				{ 4, 126386, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ironskin Gloves
				{ 5, 126388, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ironskin Legguards
				{ 7, 126571, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ironskin Helm
				{ 8, 126573, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ironskin Spaulders
				{ 9, 126574, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ironskin Tunic
				{ 10, 126570, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ironskin Gloves
				{ 11, 126572, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ironskin Legguards
				{ 16, 126696 }, -- Warmongering Aspirant's Ironskin Helm
				{ 17, 126698 }, -- Warmongering Aspirant's Ironskin Spaulders
				{ 18, 126699 }, -- Warmongering Aspirant's Ironskin Tunic
				{ 19, 126695 }, -- Warmongering Aspirant's Ironskin Gloves
				{ 20, 126697 }, -- Warmongering Aspirant's Ironskin Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 125914, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Scaled Helm
				{ 2, 125916, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Scaled Shoulders
				{ 3, 125912, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Scaled Chestpiece
				{ 4, 125913, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Scaled Gauntlets
				{ 5, 125915, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Scaled Legguards
				{ 7, 126100, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Scaled Helm
				{ 8, 126102, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Scaled Shoulders
				{ 9, 126098, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Scaled Chestpiece
				{ 10, 126099, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Scaled Gauntlets
				{ 11, 126101, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Scaled Legguards
				{ 16, 126225 }, -- Warmongering Aspirant's Scaled Helm
				{ 17, 126227 }, -- Warmongering Aspirant's Scaled Shoulders
				{ 18, 126223 }, -- Warmongering Aspirant's Scaled Chestpiece
				{ 19, 126224 }, -- Warmongering Aspirant's Scaled Gauntlets
				{ 20, 126226 }, -- Warmongering Aspirant's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126393, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Scaled Helm
				{ 2, 126395, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Scaled Shoulders
				{ 3, 126391, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Scaled Chestpiece
				{ 4, 126392, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Scaled Gauntlets
				{ 5, 126394, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Scaled Legguards
				{ 7, 126577, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Scaled Helm
				{ 8, 126579, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Scaled Shoulders
				{ 9, 126575, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Scaled Chestpiece
				{ 10, 126576, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Scaled Gauntlets
				{ 11, 126578, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Scaled Legguards
				{ 16, 126702 }, -- Warmongering Aspirant's Scaled Helm
				{ 17, 126704 }, -- Warmongering Aspirant's Scaled Shoulders
				{ 18, 126700 }, -- Warmongering Aspirant's Scaled Chestpiece
				{ 19, 126701 }, -- Warmongering Aspirant's Scaled Gauntlets
				{ 20, 126703 }, -- Warmongering Aspirant's Scaled Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 125937, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Satin Hood
				{ 2, 125940, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Satin Mantle
				{ 3, 125939, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Satin Robe
				{ 4, 125936, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Satin Gloves
				{ 5, 125938, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Satin Leggings
				{ 7, 126115, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Satin Hood
				{ 8, 126118, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Satin Mantle
				{ 9, 126117, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Satin Robe
				{ 10, 126114, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Satin Gloves
				{ 11, 126116, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Satin Leggings
				{ 16, 126232 }, -- Warmongering Aspirant's Satin Hood
				{ 17, 126235 }, -- Warmongering Aspirant's Satin Mantle
				{ 18, 126234 }, -- Warmongering Aspirant's Satin Robe
				{ 19, 126231 }, -- Warmongering Aspirant's Satin Gloves
				{ 20, 126233 }, -- Warmongering Aspirant's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126416, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Satin Hood
				{ 2, 126419, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Satin Mantle
				{ 3, 126418, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Satin Robe
				{ 4, 126415, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Satin Gloves
				{ 5, 126417, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Satin Leggings
				{ 7, 126592, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Satin Hood
				{ 8, 126595, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Satin Mantle
				{ 9, 126594, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Satin Robe
				{ 10, 126591, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Satin Gloves
				{ 11, 126593, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Satin Leggings
				{ 16, 126709 }, -- Warmongering Aspirant's Satin Hood
				{ 17, 126712 }, -- Warmongering Aspirant's Satin Mantle
				{ 18, 126711 }, -- Warmongering Aspirant's Satin Robe
				{ 19, 126708 }, -- Warmongering Aspirant's Satin Gloves
				{ 20, 126710 }, -- Warmongering Aspirant's Satin Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 125943, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leather Helm
				{ 2, 125945, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Leather Spaulders
				{ 3, 125941, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leather Tunic
				{ 4, 125942, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Leather Gloves
				{ 5, 125944, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leather Legguards
				{ 7, 126121, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Leather Helm
				{ 8, 126123, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Leather Spaulders
				{ 9, 126119, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Leather Tunic
				{ 10, 126120, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Leather Gloves
				{ 11, 126122, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Leather Legguards
				{ 16, 126238 }, -- Warmongering Aspirant's Leather Helm
				{ 17, 126240 }, -- Warmongering Aspirant's Leather Spaulders
				{ 18, 126236 }, -- Warmongering Aspirant's Leather Tunic
				{ 19, 126237 }, -- Warmongering Aspirant's Leather Gloves
				{ 20, 126239 }, -- Warmongering Aspirant's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126422, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leather Helm
				{ 2, 126424, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Leather Spaulders
				{ 3, 126420, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leather Tunic
				{ 4, 126421, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Leather Gloves
				{ 5, 126423, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leather Legguards
				{ 7, 126598, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Leather Helm
				{ 8, 126600, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Leather Spaulders
				{ 9, 126596, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Leather Tunic
				{ 10, 126597, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Leather Gloves
				{ 11, 126599, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Leather Legguards
				{ 16, 126715 }, -- Warmongering Aspirant's Leather Helm
				{ 17, 126717 }, -- Warmongering Aspirant's Leather Spaulders
				{ 18, 126713 }, -- Warmongering Aspirant's Leather Tunic
				{ 19, 126714 }, -- Warmongering Aspirant's Leather Gloves
				{ 20, 126716 }, -- Warmongering Aspirant's Leather Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 125948, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ringmail Helm
				{ 2, 125950, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ringmail Spaulders
				{ 3, 125946, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ringmail Armor
				{ 4, 125947, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ringmail Gauntlets
				{ 5, 125949, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ringmail Kilt
				{ 7, 126126, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ringmail Helm
				{ 8, 126128, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ringmail Spaulders
				{ 9, 126124, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ringmail Armor
				{ 10, 126125, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ringmail Gauntlets
				{ 11, 126127, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ringmail Leggings
				{ 16, 126243 }, -- Warmongering Aspirant's Ringmail Helm
				{ 17, 126245 }, -- Warmongering Aspirant's Ringmail Spaulders
				{ 18, 126241 }, -- Warmongering Aspirant's Ringmail Armor
				{ 19, 126242 }, -- Warmongering Aspirant's Ringmail Gauntlets
				{ 20, 126244 }, -- Warmongering Aspirant's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126427, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ringmail Helm
				{ 2, 126429, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ringmail Spaulders
				{ 3, 126425, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ringmail Armor
				{ 4, 126426, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ringmail Gauntlets
				{ 5, 126428, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Ringmail Kilt
				{ 7, 126603, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ringmail Helm
				{ 8, 126605, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ringmail Spaulders
				{ 9, 126601, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ringmail Armor
				{ 10, 126602, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ringmail Gauntlets
				{ 11, 126604, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Ringmail Leggings
				{ 16, 126720 }, -- Warmongering Aspirant's Ringmail Helm
				{ 17, 126722 }, -- Warmongering Aspirant's Ringmail Spaulders
				{ 18, 126718 }, -- Warmongering Aspirant's Ringmail Armor
				{ 19, 126719 }, -- Warmongering Aspirant's Ringmail Gauntlets
				{ 20, 126721 }, -- Warmongering Aspirant's Ringmail Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 125990, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Felweave Cowl
				{ 2, 125993, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Felweave Amice
				{ 3, 125992, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Felweave Raiment
				{ 4, 125989, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Felweave Handguards
				{ 5, 125991, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Felweave Trousers
				{ 7, 126168, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Felweave Cowl
				{ 8, 126171, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Felweave Amice
				{ 9, 126170, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Felweave Raiment
				{ 10, 126167, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Felweave Handguards
				{ 11, 126169, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Felweave Trousers
				{ 16, 126259 }, -- Warmongering Aspirant's Felweave Cowl
				{ 17, 126262 }, -- Warmongering Aspirant's Felweave Amice
				{ 18, 126261 }, -- Warmongering Aspirant's Felweave Raiment
				{ 19, 126258 }, -- Warmongering Aspirant's Felweave Handguards
				{ 20, 126260 }, -- Warmongering Aspirant's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126467, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Felweave Cowl
				{ 2, 126470, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Felweave Amice
				{ 3, 126469, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Felweave Raiment
				{ 4, 126466, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Felweave Handguards
				{ 5, 126468, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Felweave Trousers
				{ 7, 126645, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Felweave Cowl
				{ 8, 126648, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Felweave Amice
				{ 9, 126647, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Felweave Raiment
				{ 10, 126644, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Felweave Handguards
				{ 11, 126646, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Felweave Trousers
				{ 16, 126736 }, -- Warmongering Aspirant's Felweave Cowl
				{ 17, 126739 }, -- Warmongering Aspirant's Felweave Amice
				{ 18, 126738 }, -- Warmongering Aspirant's Felweave Raiment
				{ 19, 126735 }, -- Warmongering Aspirant's Felweave Handguards
				{ 20, 126737 }, -- Warmongering Aspirant's Felweave Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 125996, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Helm
				{ 2, 125998, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Shoulders
				{ 3, 125994, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Chestpiece
				{ 4, 125995, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Gauntlets
				{ 5, 125997, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Legguards
				{ 7, 126174, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Plate Helm
				{ 8, 126176, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Plate Shoulders
				{ 9, 126172, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Plate Chestpiece
				{ 10, 126173, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Plate Gauntlets
				{ 11, 126175, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Plate Legguards
				{ 16, 126265 }, -- Warmongering Aspirant's Plate Helm
				{ 17, 126267 }, -- Warmongering Aspirant's Plate Shoulders
				{ 18, 126263 }, -- Warmongering Aspirant's Plate Chestpiece
				{ 19, 126264 }, -- Warmongering Aspirant's Plate Gauntlets
				{ 20, 126266 }, -- Warmongering Aspirant's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 126473, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Helm
				{ 2, 126475, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Shoulders
				{ 3, 126471, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Chestpiece
				{ 4, 126472, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Gauntlets
				{ 5, 126474, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Legguards
				{ 7, 126651, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Plate Helm
				{ 8, 126653, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Plate Shoulders
				{ 9, 126649, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Plate Chestpiece
				{ 10, 126650, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Plate Gauntlets
				{ 11, 126652, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Plate Legguards
				{ 16, 126742 }, -- Warmongering Aspirant's Plate Helm
				{ 17, 126744 }, -- Warmongering Aspirant's Plate Shoulders
				{ 18, 126740 }, -- Warmongering Aspirant's Plate Chestpiece
				{ 19, 126741 }, -- Warmongering Aspirant's Plate Gauntlets
				{ 20, 126743 }, -- Warmongering Aspirant's Plate Legguards
			},
		},
	},
}

data["WODS3NONSETGEAR"] = {
	name = string.format(AL["Warlords Season %d"], 3).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ALIL["Cloth"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125816, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Hood of Prowess
				{ 2, 125821, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Cowl of Cruelty
				{ 4, 125819, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Amice of Prowess
				{ 5, 125824, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Mantle of Cruelty
				{ 7, 125818, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Robes of Prowess
				{ 8, 125823, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Raiment of Cruelty
				{ 10, 125815, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gloves of Prowess
				{ 11, 125820, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Handguards of Cruelty
				{ 16, 125812, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cuffs of Prowess
				{ 17, 125813, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cuffs of Cruelty
				{ 18, 125814, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cuffs of Victory
				{ 20, 125817, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings of Prowess
				{ 21, 125822, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Trousers of Cruelty
				{ 23, 125806, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cord of Cruelty
				{ 24, 125807, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cord of Prowess
				{ 25, 125808, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cord of Victory
				{ 27, 125809, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Treads of Cruelty
				{ 28, 125810, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Treads of Prowess
				{ 29, 125811, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Treads of Victory
				-- ilvl 680
				{ 101, 126023 }, -- Warmongering Combatant's Hood of Prowess
				{ 103, 126026 }, -- Warmongering Combatant's Amice of Prowess
				{ 105, 126025 }, -- Warmongering Combatant's Robes of Prowess
				{ 107, 126022 }, -- Warmongering Combatant's Gloves of Prowess
				{ 109, 126020, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cuffs of Prowess
				{ 110, 126021, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cuffs of Cruelty
				{ 112, 126024 }, -- Warmongering Combatant's Leggings of Prowess
				{ 114, 126016, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Cord of Cruelty
				{ 115, 126017, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Cord of Prowess
				{ 116, 126018, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Treads of Cruelty
				{ 117, 126019, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Treads of Prowess
				-- ilvl 625
				{ 119, 126183 }, -- Warmongering Aspirant's Cuffs of Prowess
				{ 121, 126181 }, -- Warmongering Aspirant's Cord of Cruelty
				{ 123, 126182 }, -- Warmongering Aspirant's Treads of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126295, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Hood of Prowess
				{ 2, 126300, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Cowl of Cruelty
				{ 4, 126298, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Amice of Prowess
				{ 5, 126303, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Mantle of Cruelty
				{ 7, 126297, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Robes of Prowess
				{ 8, 126302, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Raiment of Cruelty
				{ 10, 126294, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gloves of Prowess
				{ 11, 126299, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Handguards of Cruelty
				{ 16, 126291, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cuffs of Prowess
				{ 17, 126292, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cuffs of Cruelty
				{ 18, 126293, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cuffs of Victory
				{ 20, 126296, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings of Prowess
				{ 21, 126301, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Trousers of Cruelty
				{ 23, 126285, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cord of Cruelty
				{ 24, 126286, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cord of Prowess
				{ 25, 126287, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cord of Victory
				{ 27, 126288, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Treads of Cruelty
				{ 28, 126289, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Treads of Prowess
				{ 29, 126290, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Treads of Victory
				-- ilvl 680
				{ 101, 126500 }, -- Warmongering Combatant's Hood of Prowess
				{ 103, 126503 }, -- Warmongering Combatant's Amice of Prowess
				{ 105, 126502 }, -- Warmongering Combatant's Robes of Prowess
				{ 107, 126499 }, -- Warmongering Combatant's Gloves of Prowess
				{ 109, 126497, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cuffs of Prowess
				{ 110, 126498, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cuffs of Cruelty
				{ 112, 126501 }, -- Warmongering Combatant's Leggings of Prowess
				{ 114, 126493, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Cord of Cruelty
				{ 115, 126494, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Cord of Prowess
				{ 116, 126495, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Treads of Cruelty
				{ 117, 126496, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Treads of Prowess
				-- ilvl 625
				{ 119, 126660 }, -- Warmongering Aspirant's Cuffs of Prowess
				{ 121, 126658 }, -- Warmongering Aspirant's Cord of Cruelty
				{ 123, 126659 }, -- Warmongering Aspirant's Treads of Cruelty
			},
		},
		{
			name = ALIL["Leather"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125875, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Helm
				{ 2, 125880, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Headcover
				{ 4, 125877, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Spaulders
				{ 5, 125882, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 125873, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Tunic
				{ 8, 125878, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chestguard
				{ 10, 125874, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gloves
				{ 11, 125879, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Grips
				{ 16, 125870, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Bindings of Cruelty
				{ 17, 125871, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Bindings of Prowess
				{ 18, 125872, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Bindings of Victory
				{ 20, 125876, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Legguards
				{ 21, 125881, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings
				{ 23, 125864, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Belt of Prowess
				{ 24, 125865, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Belt of Cruelty
				{ 25, 125866, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Belt of Victory
				{ 27, 125867, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Boots of Cruelty
				{ 28, 125868, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Boots of Prowess
				{ 29, 125869, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Boots of Victory
				-- ilvl 680
				{ 101, 126074 }, -- Warmongering Combatant's Helm
				{ 103, 126076 }, -- Warmongering Combatant's Spaulders
				{ 105, 126072 }, -- Warmongering Combatant's Tunic
				{ 107, 126073 }, -- Warmongering Combatant's Gloves
				{ 109, 126070, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Bindings of Cruelty
				{ 110, 126071, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Bindings of Prowess
				{ 112, 126075 }, -- Warmongering Combatant's Legguards
				{ 114, 126066, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Belt of Prowess
				{ 115, 126067, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Belt of Cruelty
				{ 116, 126068, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Boots of Cruelty
				{ 117, 126069, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Boots of Prowess
				-- ilvl 625
				{ 119, 126209 }, -- Warmongering Aspirant's Bindings of Cruelty
				{ 121, 126207 }, -- Warmongering Aspirant's Belt of Prowess
				{ 123, 126208 }, -- Warmongering Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126354, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Helm
				{ 2, 126359, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Headcover
				{ 4, 126356, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Spaulders
				{ 5, 126361, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 126352, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Tunic
				{ 8, 126357, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chestguard
				{ 10, 126353, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gloves
				{ 11, 126358, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Grips
				{ 16, 126349, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Bindings of Cruelty
				{ 17, 126350, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Bindings of Prowess
				{ 18, 126351, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Bindings of Victory
				{ 20, 126355, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Legguards
				{ 21, 126360, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings
				{ 23, 126343, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Belt of Prowess
				{ 24, 126344, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Belt of Cruelty
				{ 25, 126345, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Belt of Victory
				{ 27, 126346, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Boots of Cruelty
				{ 28, 126347, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Boots of Prowess
				{ 29, 126348, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Boots of Victory
				-- ilvl 680
				{ 101, 126551 }, -- Warmongering Combatant's Helm
				{ 103, 126553 }, -- Warmongering Combatant's Spaulders
				{ 105, 126549 }, -- Warmongering Combatant's Tunic
				{ 107, 126550 }, -- Warmongering Combatant's Gloves
				{ 109, 126547, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Bindings of Cruelty
				{ 110, 126548, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Bindings of Prowess
				{ 112, 126552 }, -- Warmongering Combatant's Legguards
				{ 114, 126543, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Belt of Prowess
				{ 115, 126544, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Belt of Cruelty
				{ 116, 126545, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Boots of Cruelty
				{ 117, 126546, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Boots of Prowess
				-- ilvl 625
				{ 119, 126686 }, -- Warmongering Aspirant's Bindings of Cruelty
				{ 121, 126684 }, -- Warmongering Aspirant's Belt of Prowess
				{ 123, 126685 }, -- Warmongering Aspirant's Boots of Cruelty
			},
		},
		{
			name = ALIL["Mail"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125899, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Helm
				{ 2, 125904, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Coif
				{ 4, 125901, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Spaulders
				{ 5, 125906, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 125897, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Armor
				{ 8, 125902, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chestguard
				{ 10, 125898, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gauntlets
				{ 11, 125903, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gloves
				{ 16, 125894, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armbands of Prowess
				{ 17, 125895, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armbands of Cruelty
				{ 18, 125896, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armbands of Victory
				{ 20, 125900, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings
				{ 21, 125905, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings
				{ 23, 125888, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Waistguard of Cruelty
				{ 24, 125889, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Waistguard of Prowess
				{ 25, 125890, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Waistguard of Victory
				{ 27, 125891, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Footguards of Cruelty
				{ 28, 125892, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Footguards of Prowess
				{ 29, 125893, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Footguards of Victory
				-- ilvl 680
				{ 101, 126090 }, -- Warmongering Combatant's Helm
				{ 103, 126092 }, -- Warmongering Combatant's Spaulders
				{ 105, 126088 }, -- Warmongering Combatant's Armor
				{ 107, 126089 }, -- Warmongering Combatant's Gauntlets
				{ 109, 126086, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armbands of Prowess
				{ 110, 126087, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armbands of Cruelty
				{ 112, 126091 }, -- Warmongering Combatant's Leggings
				{ 114, 126082, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Waistguard of Cruelty
				{ 115, 126083, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Waistguard of Prowess
				{ 116, 126084, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Footguards of Cruelty
				{ 117, 126085, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Footguards of Prowess
				-- ilvl 625
				{ 119, 126217 }, -- Warmongering Aspirant's Armbands of Prowess
				{ 121, 126215 }, -- Warmongering Aspirant's Waistguard of Cruelty
				{ 123, 126216 }, -- Warmongering Aspirant's Footguards of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126378, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Helm
				{ 2, 126383, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Coif
				{ 4, 126380, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Spaulders
				{ 5, 126385, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Pauldrons
				{ 7, 126376, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Armor
				{ 8, 126381, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Chestguard
				{ 10, 126377, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gauntlets
				{ 11, 126382, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Gloves
				{ 16, 126373, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armbands of Prowess
				{ 17, 126374, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armbands of Cruelty
				{ 18, 126375, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armbands of Victory
				{ 20, 126379, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings
				{ 21, 126384, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Leggings
				{ 23, 126367, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Waistguard of Cruelty
				{ 24, 126368, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Waistguard of Prowess
				{ 25, 126369, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Waistguard of Victory
				{ 27, 126370, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Footguards of Cruelty
				{ 28, 126371, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Footguards of Prowess
				{ 29, 126372, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Footguards of Victory
				-- ilvl 680
				{ 101, 126567 }, -- Warmongering Combatant's Helm
				{ 103, 126569 }, -- Warmongering Combatant's Spaulders
				{ 105, 126565 }, -- Warmongering Combatant's Armor
				{ 107, 126566 }, -- Warmongering Combatant's Gauntlets
				{ 109, 126563, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armbands of Prowess
				{ 110, 126564, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armbands of Cruelty
				{ 112, 126568 }, -- Warmongering Combatant's Leggings
				{ 114, 126559, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Waistguard of Cruelty
				{ 115, 126560, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Waistguard of Prowess
				{ 116, 126561, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Footguards of Cruelty
				{ 117, 126562, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Footguards of Prowess
				-- ilvl 625
				{ 119, 126694 }, -- Warmongering Aspirant's Armbands of Prowess
				{ 121, 126692 }, -- Warmongering Aspirant's Waistguard of Cruelty
				{ 123, 126693 }, -- Warmongering Aspirant's Footguards of Cruelty
			},
		},
		{
			name = ALIL["Plate"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125928, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Helmet
				{ 2, 125933, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Visor
				{ 4, 125930, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Shoulderplates
				{ 5, 125935, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Pauldrons
				{ 7, 125926, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Breastplate
				{ 8, 125931, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Chestguard
				{ 10, 125927, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Gloves
				{ 11, 125932, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Grips
				{ 16, 125923, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armplates of Cruelty
				{ 17, 125924, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armplates of Prowess
				{ 18, 125925, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armplates of Victory
				{ 20, 125929, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Legplates
				{ 21, 125934, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Leggings
				{ 22, 125917, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Girdle of Cruelty
				{ 23, 125918, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Girdle of Prowess
				{ 24, 125919, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Girdle of Victory
				{ 26, 125920, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Warboots of Cruelty
				{ 27, 125921, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Warboots of Prowess
				{ 28, 125922, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Warboots of Victory
				-- ilvl 680
				{ 101, 126111 }, -- Warmongering Combatant's Plate Helmet
				{ 103, 126113 }, -- Warmongering Combatant's Shoulderplates
				{ 105, 126109 }, -- Warmongering Combatant's Plate Breastplate
				{ 107, 126110 }, -- Warmongering Combatant's Plate Gloves
				{ 109, 126107, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armplates of Cruelty
				{ 110, 126108, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armplates of Prowess
				{ 112, 126112 }, -- Warmongering Combatant's Legplates
				{ 114, 126103, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Girdle of Cruelty
				{ 115, 126104, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Girdle of Prowess
				{ 116, 126105, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Warboots of Cruelty
				{ 117, 126106, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Warboots of Prowess
				-- ilvl 625
				{ 119, 126230 }, -- Warmongering Aspirant's Armplates of Cruelty
				{ 121, 126228 }, -- Warmongering Aspirant's Girdle of Cruelty
				{ 123, 126229 }, -- Warmongering Aspirant's Warboots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126407, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Helmet
				{ 2, 126412, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Visor
				{ 4, 126409, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Shoulderplates
				{ 5, 126414, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Pauldrons
				{ 7, 126405, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Breastplate
				{ 8, 126410, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Chestguard
				{ 10, 126406, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Gloves
				{ 11, 126411, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Plate Grips
				{ 16, 126402, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armplates of Cruelty
				{ 17, 126403, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armplates of Prowess
				{ 18, 126404, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Armplates of Victory
				{ 20, 126408, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Legplates
				{ 21, 126413, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Plate Leggings
				{ 23, 126396, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Girdle of Cruelty
				{ 24, 126397, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Girdle of Prowess
				{ 25, 126398, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Girdle of Victory
				{ 27, 126399, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Warboots of Cruelty
				{ 28, 126400, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Warboots of Prowess
				{ 29, 126401, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Warboots of Victory
				-- ilvl 680
				{ 101, 126588 }, -- Warmongering Combatant's Plate Helmet
				{ 103, 126590 }, -- Warmongering Combatant's Shoulderplates
				{ 105, 126586 }, -- Warmongering Combatant's Plate Breastplate
				{ 107, 126587 }, -- Warmongering Combatant's Plate Gloves
				{ 109, 126584, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armplates of Cruelty
				{ 110, 126585, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Armplates of Prowess
				{ 112, 126589 }, -- Warmongering Combatant's Legplates
				{ 114, 126580, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Girdle of Cruelty
				{ 115, 126581, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Girdle of Prowess
				{ 116, 126582, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Warboots of Cruelty
				{ 117, 126583, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Warboots of Prowess
				-- ilvl 625
				{ 119, 126707 }, -- Warmongering Aspirant's Armplates of Cruelty
				{ 121, 126705 }, -- Warmongering Aspirant's Girdle of Cruelty
				{ 123, 126706 }, -- Warmongering Aspirant's Warboots of Cruelty
			},
		},
		{
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125801, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Necklace of Cruelty
				{ 2, 125802, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Necklace of Prowess
				{ 3, 125851, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Cruelty
				{ 4, 125852, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Prowess
				{ 5, 125853, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Meditation
				{ 6, 125854, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Contemplation
				{ 7, 125960, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Choker of Cruelty
				{ 8, 125961, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Choker of Prowess
				{ 9, 125967, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Choker of Endurance
				-- ilvl 680
				{ 16, 126011, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Necklace of Cruelty
				{ 17, 126012, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Necklace of Prowess
				{ 18, 126053, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Cruelty
				{ 19, 126054, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Prowess
				{ 20, 126055, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Meditation
				{ 21, 126056, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Contemplation
				{ 22, 126138, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Choker of Cruelty
				{ 23, 126139, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Choker of Prowess
				{ 24, 126164, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Choker of Endurance
				-- ilvl 625
				{ 11, 126178 }, -- Warmongering Aspirant's Necklace of Cruelty
				{ 12, 126201 }, -- Warmongering Aspirant's Pendant of Cruelty
				{ 13, 126202 }, -- Warmongering Aspirant's Pendant of Meditation
				{ 14, 126247 }, -- Warmongering Aspirant's Choker of Cruelty
				{ 15, 126250 }, -- Warmongering Aspirant's Choker of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126280, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Necklace of Cruelty
				{ 2, 126281, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Necklace of Prowess
				{ 3, 126330, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Cruelty
				{ 4, 126331, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Prowess
				{ 5, 126332, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Meditation
				{ 6, 126333, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Pendant of Contemplation
				{ 7, 126439, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Choker of Cruelty
				{ 8, 126440, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Choker of Prowess
				{ 9, 126446, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Choker of Endurance
				-- ilvl 680
				{ 16, 126488, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Necklace of Cruelty
				{ 17, 126489, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Necklace of Prowess
				{ 18, 126530, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Cruelty
				{ 19, 126531, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Prowess
				{ 20, 126532, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Meditation
				{ 21, 126533, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Pendant of Contemplation
				{ 22, 126615, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Choker of Cruelty
				{ 23, 126616, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Choker of Prowess
				{ 24, 126641, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Choker of Endurance
				-- ilvl 625
				{ 11, 126655 }, -- Warmongering Aspirant's Necklace of Cruelty
				{ 12, 126678 }, -- Warmongering Aspirant's Pendant of Cruelty
				{ 13, 126679 }, -- Warmongering Aspirant's Pendant of Meditation
				{ 14, 126724 }, -- Warmongering Aspirant's Choker of Cruelty
				{ 15, 126727 }, -- Warmongering Aspirant's Choker of Endurance
			},
		},
		{
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125799, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cape of Cruelty
				{ 2, 125800, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cape of Prowess
				{ 3, 125847, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Cruelty
				{ 4, 125848, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Prowess
				{ 5, 125849, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Meditation
				{ 6, 125850, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Contemplation
				{ 7, 125958, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cloak of Cruelty
				{ 8, 125959, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cloak of Prowess
				{ 9, 125966, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cloak of Endurance
				-- ilvl 680
				{ 16, 126009, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cape of Cruelty
				{ 17, 126010, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cape of Prowess
				{ 18, 126049, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Cruelty
				{ 19, 126050, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Prowess
				{ 20, 126051, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Meditation
				{ 21, 126052, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Contemplation
				{ 22, 126136, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cloak of Cruelty
				{ 23, 126137, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cloak of Prowess
				{ 24, 126163, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cloak of Endurance
				-- ilvl 625
				{ 11, 126177 }, -- Warmongering Aspirant's Cape of Cruelty
				{ 12, 126199 }, -- Warmongering Aspirant's Drape of Cruelty
				{ 13, 126200 }, -- Warmongering Aspirant's Drape of Meditation
				{ 14, 126246 }, -- Warmongering Aspirant's Cloak of Cruelty
				{ 15, 126249 }, -- Warmongering Aspirant's Cloak of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126278, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cape of Cruelty
				{ 2, 126279, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cape of Prowess
				{ 3, 126326, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Cruelty
				{ 4, 126327, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Prowess
				{ 5, 126328, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Meditation
				{ 6, 126329, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Drape of Contemplation
				{ 7, 126437, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cloak of Cruelty
				{ 8, 126438, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cloak of Prowess
				{ 9, 126445, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Cloak of Endurance
				-- ilvl 680
				{ 16, 126486, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cape of Cruelty
				{ 17, 126487, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cape of Prowess
				{ 18, 126526, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Cruelty
				{ 19, 126527, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Prowess
				{ 20, 126528, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Meditation
				{ 21, 126529, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Drape of Contemplation
				{ 22, 126613, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cloak of Cruelty
				{ 23, 126614, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cloak of Prowess
				{ 24, 126640, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Cloak of Endurance
				-- ilvl 625
				{ 11, 126654 }, -- Warmongering Aspirant's Cape of Cruelty
				{ 12, 126676 }, -- Warmongering Aspirant's Drape of Cruelty
				{ 13, 126677 }, -- Warmongering Aspirant's Drape of Meditation
				{ 14, 126723 }, -- Warmongering Aspirant's Cloak of Cruelty
				{ 15, 126726 }, -- Warmongering Aspirant's Cloak of Endurance
			},
		},
		{
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125803, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Ring of Cruelty
				{ 2, 125804, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Ring of Prowess
				{ 3, 125805, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Ring of Triumph
				{ 4, 125857, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Cruelty
				{ 5, 125858, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Prowess
				{ 6, 125859, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Victory
				{ 7, 125860, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Meditation
				{ 8, 125861, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Contemplation
				{ 9, 125962, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Cruelty
				{ 10, 125963, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Accuracy
				{ 11, 125964, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Ruthlessness
				{ 12, 125968, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Dedication
				{ 13, 125969, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Endurance
				-- ilvl 680
				{ 16, 126013, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Ring of Cruelty
				{ 17, 126014, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Ring of Prowess
				{ 18, 126015, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Ring of Triumph
				{ 19, 126059, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Cruelty
				{ 20, 126060, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Prowess
				{ 21, 126061, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Victory
				{ 22, 126062, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Meditation
				{ 23, 126063, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Contemplation
				{ 24, 126140, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Cruelty
				{ 25, 126141, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Accuracy
				{ 26, 126142, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Ruthlessness
				{ 27, 126165, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Dedication
				{ 28, 126166, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Endurance
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
				{ 1, 126282, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Ring of Cruelty
				{ 2, 126283, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Ring of Prowess
				{ 3, 126284, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Ring of Triumph
				{ 4, 126336, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Cruelty
				{ 5, 126337, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Prowess
				{ 6, 126338, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Victory
				{ 7, 126339, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Meditation
				{ 8, 126340, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Band of Contemplation
				{ 9, 126441, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Cruelty
				{ 10, 126442, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Accuracy
				{ 11, 126443, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Ruthlessness
				{ 12, 126447, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Dedication
				{ 13, 126448, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Signet of Endurance
				-- ilvl 680
				{ 16, 126490, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Ring of Cruelty
				{ 17, 126491, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Ring of Prowess
				{ 18, 126492, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Ring of Triumph
				{ 19, 126536, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Cruelty
				{ 20, 126537, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Prowess
				{ 21, 126538, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Victory
				{ 22, 126539, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Meditation
				{ 23, 126540, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Band of Contemplation
				{ 24, 126617, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Cruelty
				{ 25, 126618, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Accuracy
				{ 26, 126619, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Ruthlessness
				{ 27, 126642, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Dedication
				{ 28, 126643, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Signet of Endurance
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
		{
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 125970, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Conquest
				{ 2, 125975, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Dominance
				{ 3, 125981, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Victory
				{ 4, 125983, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Adaptation
				{ 6, 125972, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Emblem of Cruelty
				{ 7, 125973, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Emblem of Tenacity
				{ 8, 125974, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Emblem of Meditation
				{ 10, 125971, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Insignia of Conquest
				{ 11, 125976, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Insignia of Dominance
				{ 12, 125982, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Insignia of Victory
				{ 16, 125977, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Cruelty
				{ 17, 125979, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Tenacity
				{ 18, 125980, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Meditation
				{ 19, 127125, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Adaptation
				{ 21, 125984 }, -- Warmongering Gladiator's Accolade of Conquest
				{ 22, 125985 }, -- Warmongering Gladiator's Accolade of Dominance
				{ 23, 125986 }, -- Warmongering Gladiator's Accolade of Victory
				{ 24, 125987 }, -- Warmongering Gladiator's Accolade of Meditation
				{ 25, 125988 }, -- Warmongering Gladiator's Accolade of Endurance
				-- ilvl 680
				{ 101, 126144, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Conquest
				{ 102, 126149, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Dominance
				{ 103, 126155, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Victory
				{ 104, 126157, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Adaptation
				{ 106, 126146, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Emblem of Cruelty
				{ 107, 126147, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Emblem of Tenacity
				{ 108, 126148, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Emblem of Meditation
				{ 110, 126145, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Insignia of Conquest
				{ 111, 126150, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Insignia of Dominance
				{ 112, 126156, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Insignia of Victory
				{ 116, 126151, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Cruelty
				{ 117, 126153, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Tenacity
				{ 118, 126154, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Meditation
				{ 119, 126152, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Adaptation
				{ 121, 126158 }, -- Warmongering Combatant's Accolade of Conquest
				{ 122, 126159 }, -- Warmongering Combatant's Accolade of Dominance
				{ 123, 126160 }, -- Warmongering Combatant's Accolade of Victory
				{ 124, 126161 }, -- Warmongering Combatant's Accolade of Meditation
				{ 125, 126162 }, -- Warmongering Combatant's Accolade of Endurance
				-- ilvl 625
				{ 114, 126253 }, -- Warmongering Aspirant's Accolade of Conquest
				{ 115, 126254 }, -- Warmongering Aspirant's Accolade of Dominance
				{ 127, 126255 }, -- Warmongering Aspirant's Accolade of Victory
				{ 128, 126256 }, -- Warmongering Aspirant's Accolade of Meditation
				{ 129, 126257 }, -- Warmongering Aspirant's Accolade of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 710
				{ 1, 126449, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Conquest
				{ 2, 126454, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Dominance
				{ 3, 126458, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Victory
				{ 4, 126460, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Badge of Adaptation
				{ 6, 126451, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Emblem of Cruelty
				{ 7, 126452, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Emblem of Tenacity
				{ 8, 126453, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Emblem of Meditation
				{ 10, 126450, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Insignia of Conquest
				{ 11, 126455, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Insignia of Dominance
				{ 12, 126459, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Insignia of Victory
				{ 16, 127126, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Cruelty
				{ 17, 126456, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Tenacity
				{ 18, 126457, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Meditation
				{ 19, 125978, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Medallion of Adaptation
				{ 21, 126461 }, -- Warmongering Gladiator's Accolade of Conquest
				{ 22, 126462 }, -- Warmongering Gladiator's Accolade of Dominance
				{ 23, 126463 }, -- Warmongering Gladiator's Accolade of Victory
				{ 24, 126464 }, -- Warmongering Gladiator's Accolade of Meditation
				{ 25, 126465 }, -- Warmongering Gladiator's Accolade of Endurance
				-- ilvl 680
				{ 101, 126621, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Conquest
				{ 102, 126626, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Dominance
				{ 103, 126632, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Victory
				{ 104, 126634, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Badge of Adaptation
				{ 106, 126623, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Emblem of Cruelty
				{ 107, 126624, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Emblem of Tenacity
				{ 108, 126625, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Emblem of Meditation
				{ 110, 126622, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Insignia of Conquest
				{ 111, 126627, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Insignia of Dominance
				{ 112, 126633, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Insignia of Victory
				{ 116, 126628, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Cruelty
				{ 117, 126629, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Adaptation
				{ 118, 126630, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Tenacity
				{ 119, 126631, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Medallion of Meditation
				{ 121, 126635 }, -- Warmongering Combatant's Accolade of Conquest
				{ 122, 126636 }, -- Warmongering Combatant's Accolade of Dominance
				{ 123, 126637 }, -- Warmongering Combatant's Accolade of Victory
				{ 124, 126638 }, -- Warmongering Combatant's Accolade of Meditation
				{ 125, 126639 }, -- Warmongering Combatant's Accolade of Endurance
				-- ilvl 625
				{ 114, 126730 }, -- Warmongering Aspirant's Accolade of Conquest
				{ 115, 126731 }, -- Warmongering Aspirant's Accolade of Dominance
				{ 127, 126732 }, -- Warmongering Aspirant's Accolade of Victory
				{ 128, 126733 }, -- Warmongering Aspirant's Accolade of Meditation
				{ 129, 126734 }, -- Warmongering Aspirant's Accolade of Endurance
			},
		},
		{
			name = AL["Miscellaneous"],
			[ALLIANCE_DIFF] = {
				-- ilvl 710
				{ 1, 127369, [PRICE_EXTRA_ITTYPE] = "conquest:1000" }, -- Warmongering Gladiator's Tabard
				{ 3, 120286, [PRICE_EXTRA_ITTYPE] = "conquest:2500" }, -- Enchanter's Illusion - Glorious Tyranny
				{ 4, 120287, [PRICE_EXTRA_ITTYPE] = "conquest:2500" }, -- Enchanter's Illusion - Primal Victory
				-- ilvl 680
				-- ilvl 625
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- ilvl 710
				{ 1, 127371, [PRICE_EXTRA_ITTYPE] = "conquest:1000" }, -- Warmongering Gladiator's Tabard
				-- ilvl 680
				-- ilvl 625
			},
		},
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
				{ 1, 125789, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cleaver
				{ 2, 125951, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Hacker
				{ 3, 125792, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Pummeler
				{ 4, 125841, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Gavel
				{ 5, 125953, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Bonecracker
				{ 6, 125793, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Quickblade
				{ 7, 125842, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Mageblade
				{ 8, 125954, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Slicer
				{ 9, 125791, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ripper
				{ 10, 125952, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Render
				{ 11, 125790, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Shanker
				{ 12, 125840, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Spellblade
				-- Two-Hand
				{ 16, 125955, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Decapitator
				{ 17, 125956, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Bonegrinder
				{ 18, 125797, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Pike
				{ 19, 125957, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Greatsword
				{ 20, 125798, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Staff
				{ 21, 125845, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Battle Staff
				{ 22, 125846, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Energy Staff
				-- Ranged
				{ 24, 125794, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Longbow
				{ 25, 125796, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Rifle
				{ 26, 125795, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Heavy Crossbow
				{ 27, 125843, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Baton of Light
				{ 28, 125844, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Touch of Defeat
				-- Shield
				{ 101, 125862, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Redoubt
				{ 102, 125863, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Barrier
				{ 103, 125965, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Shield Wall
				-- Off-Hand
				{ 116, 125855, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Endgame
				{ 117, 125856, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 126268, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Cleaver
				{ 2, 126430, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Hacker
				{ 3, 126271, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Pummeler
				{ 4, 126320, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Gavel
				{ 5, 126432, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Bonecracker
				{ 6, 126272, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Quickblade
				{ 7, 126321, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Mageblade
				{ 8, 126433, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Slicer
				{ 9, 126270, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Ripper
				{ 10, 126431, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Render
				{ 11, 126269, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Warmongering Gladiator's Shanker
				{ 12, 126319, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Spellblade
				-- Two Hand
				{ 16, 126434, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Decapitator
				{ 17, 126435, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Bonegrinder
				{ 18, 126276, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Pike
				{ 19, 126436, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Greatsword
				{ 20, 126277, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Staff
				{ 21, 126324, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Battle Staff
				{ 22, 126325, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Energy Staff
				-- Ranged
				{ 24, 126273, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Longbow
				{ 25, 126275, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Rifle
				{ 26, 126274, [PRICE_EXTRA_ITTYPE] = "conquest:3500" }, -- Warmongering Gladiator's Heavy Crossbow
				{ 27, 126322, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Baton of Light
				{ 28, 126323, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Warmongering Gladiator's Touch of Defeat
				-- Shield
				{ 101, 126341, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Redoubt
				{ 102, 126342, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Barrier
				{ 103, 126444, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Shield Wall
				-- Off-Hand
				{ 116, 126334, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Endgame
				{ 117, 126335, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Warmongering Gladiator's Reprieve
			},
		},
		{
			name = string.format(AL["ilvl %d"], 700).." (730)",
			[ALLIANCE_DIFF] = {
				{ 1, 125999, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Cleaver
				{ 2, 126129, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Hacker
				{ 3, 127379, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Chopper
				{ 4, 126002, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Pummeler
				{ 5, 126043, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Gavel
				{ 6, 126131, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Bonecracker
				{ 7, 126003, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Quickblade
				{ 8, 126044, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Mageblade
				{ 9, 126132, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Slicer
				{ 10, 126001, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ripper
				{ 11, 126130, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Render
				{ 12, 126000, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Shanker
				{ 13, 126042, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Spellblade
				-- Two Hand
				{ 16, 126133, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Decapitator
				{ 17, 126134, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Bonegrinder
				{ 18, 126007, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Pike
				{ 19, 126135, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Greatsword
				{ 20, 126008, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Staff
				{ 21, 126047, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Battle Staff
				{ 22, 126048, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Energy Staff
				-- Ranged
				{ 24, 126004, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Longbow
				{ 25, 126006, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Rifle
				{ 26, 126005, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Heavy Crossbow
				{ 27, 126045, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Baton of Light
				{ 28, 126046, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Touch of Defeat
				-- Shield
				{ 101, 126064, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Redoubt
				{ 102, 126065, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Barrier
				{ 103, 126143, [PRICE_EXTRA_ITTYPE] = "honor:1000" }, -- Warmongering Combatant's Shield Wall
				-- Off-Hand
				{ 116, 126057, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Endgame
				{ 117, 126058, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Reprieve
			},
			[HORDE_DIFF] = {
				{ 1, 126476, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Cleaver
				{ 2, 126606, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Hacker
				{ 3, 127378, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Chopper
				{ 4, 126479, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Pummeler
				{ 5, 126520, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Gavel
				{ 6, 126608, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Bonecracker
				{ 7, 126480, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Quickblade
				{ 8, 126521, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Mageblade
				{ 9, 126609, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Slicer
				{ 10, 126478, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Ripper
				{ 11, 126607, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Render
				{ 12, 126477, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Warmongering Combatant's Shanker
				{ 13, 126519, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Spellblade
				-- Two Hand
				{ 16, 126610, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Decapitator
				{ 17, 126611, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Bonegrinder
				{ 18, 126484, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Pike
				{ 19, 126612, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Greatsword
				{ 20, 126485, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Staff
				{ 21, 126524, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Battle Staff
				{ 22, 126525, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Energy Staff
				-- Ranged
				{ 24, 126481, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Longbow
				{ 25, 126483, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Rifle
				{ 26, 126482, [PRICE_EXTRA_ITTYPE] = "honor:3500" }, -- Warmongering Combatant's Heavy Crossbow
				{ 27, 126522, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Baton of Light
				{ 28, 126523, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Warmongering Combatant's Touch of Defeat
				-- Shield
				{ 101, 126541, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Redoubt
				{ 102, 126542, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Barrier
				{ 103, 126620, [PRICE_EXTRA_ITTYPE] = "honor:1000" }, -- Warmongering Combatant's Shield Wall
				-- Off-Hand
				{ 116, 126534, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Endgame
				{ 117, 126535, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Warmongering Combatant's Reprieve
			},
		},
	},
}

data["WODS2SETS"] = {
	name = string.format(AL["Warlords Season %d"], 2).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 124713, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dreadplate Helm
				{ 2, 124715, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dreadplate Shoulders
				{ 3, 124711, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dreadplate Chestpiece
				{ 4, 124712, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dreadplate Gauntlets
				{ 5, 124714, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dreadplate Legguards
				{ 7, 124915, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dreadplate Helm
				{ 8, 124917, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dreadplate Shoulders
				{ 9, 124913, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dreadplate Chestpiece
				{ 10, 124914, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dreadplate Gauntlets
				{ 11, 124916, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dreadplate Legguards
				{ 16, 125072  }, -- Wild Aspirant's Dreadplate Helm
				{ 17, 125074  }, -- Wild Aspirant's Dreadplate Shoulders
				{ 18, 125070  }, -- Wild Aspirant's Dreadplate Chestpiece
				{ 19, 125071  }, -- Wild Aspirant's Dreadplate Gauntlets
				{ 20, 125073  }, -- Wild Aspirant's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125192, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dreadplate Helm
				{ 2, 125194, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dreadplate Shoulders
				{ 3, 125190, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dreadplate Chestpiece
				{ 4, 125191, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dreadplate Gauntlets
				{ 5, 125193, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dreadplate Legguards
				{ 7, 125392, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dreadplate Helm
				{ 8, 125394, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dreadplate Shoulders
				{ 9, 125390, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dreadplate Chestpiece
				{ 10, 125391, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dreadplate Gauntlets
				{ 11, 125393, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dreadplate Legguards
				{ 16, 125549  }, -- Wild Aspirant's Dreadplate Helm
				{ 17, 125551  }, -- Wild Aspirant's Dreadplate Shoulders
				{ 18, 125547  }, -- Wild Aspirant's Dreadplate Chestpiece
				{ 19, 125548  }, -- Wild Aspirant's Dreadplate Gauntlets
				{ 20, 125550  }, -- Wild Aspirant's Dreadplate Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 124717, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dragonhide Helm
				{ 2, 124720, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dragonhide Spaulders
				{ 3, 124719, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dragonhide Robes
				{ 4, 124716, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dragonhide Gloves
				{ 5, 124718, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dragonhide Legguards
				{ 7, 124919, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dragonhide Helm
				{ 8, 124922, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dragonhide Spaulders
				{ 9, 124921, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dragonhide Tunic
				{ 10, 124918, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dragonhide Gloves
				{ 11, 124920, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dragonhide Legguards
				{ 16, 125076  }, -- Wild Aspirant's Dragonhide Helm
				{ 17, 125079  }, -- Wild Aspirant's Dragonhide Spaulders
				{ 18, 125078  }, -- Wild Aspirant's Dragonhide Tunic
				{ 19, 125075  }, -- Wild Aspirant's Dragonhide Gloves
				{ 20, 125077  }, -- Wild Aspirant's Dragonhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125196, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dragonhide Helm
				{ 2, 125199, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dragonhide Spaulders
				{ 3, 125198, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dragonhide Tunic
				{ 4, 125195, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Dragonhide Gloves
				{ 5, 125197, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Dragonhide Legguards
				{ 7, 125396, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dragonhide Helm
				{ 8, 125399, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dragonhide Spaulders
				{ 9, 125398, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dragonhide Tunic
				{ 10, 125395, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Dragonhide Gloves
				{ 11, 125397, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Dragonhide Legguards
				{ 16, 125553  }, -- Wild Aspirant's Dragonhide Helm
				{ 17, 125556  }, -- Wild Aspirant's Dragonhide Spaulders
				{ 18, 125555  }, -- Wild Aspirant's Dragonhide Tunic
				{ 19, 125552  }, -- Wild Aspirant's Dragonhide Gloves
				{ 20, 125554  }, -- Wild Aspirant's Dragonhide Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 124723, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Chain Helm
				{ 2, 124725, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Chain Spaulders
				{ 3, 124721, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Chain Armor
				{ 4, 124722, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Chain Gauntlets
				{ 5, 124724, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Chain Leggings
				{ 7, 124925, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Chain Helm
				{ 8, 124927, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Chain Spaulders
				{ 9, 124923, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Chain Armor
				{ 10, 124924, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Chain Gauntlets
				{ 11, 124926, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Chain Leggings
				{ 16, 125082  }, -- Wild Aspirant's Chain Helm
				{ 17, 125084  }, -- Wild Aspirant's Chain Spaulders
				{ 18, 125080  }, -- Wild Aspirant's Chain Armor
				{ 19, 125081  }, -- Wild Aspirant's Chain Gauntlets
				{ 20, 125083  }, -- Wild Aspirant's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125202, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Chain Helm
				{ 2, 125204, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Chain Spaulders
				{ 3, 125200, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Chain Armor
				{ 4, 125201, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Chain Gauntlets
				{ 5, 125203, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Chain Leggings
				{ 7, 125402, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Chain Helm
				{ 8, 125404, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Chain Spaulders
				{ 9, 125400, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Chain Armor
				{ 10, 125401, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Chain Gauntlets
				{ 11, 125403, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Chain Leggings
				{ 16, 125559  }, -- Wild Aspirant's Chain Helm
				{ 17, 125561  }, -- Wild Aspirant's Chain Spaulders
				{ 18, 125557  }, -- Wild Aspirant's Chain Armor
				{ 19, 125558  }, -- Wild Aspirant's Chain Gauntlets
				{ 20, 125560  }, -- Wild Aspirant's Chain Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 124770, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Silk Cowl
				{ 2, 124773, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Silk Amice
				{ 3, 124772, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Silk Robe
				{ 4, 124769, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Silk Handguards
				{ 5, 124771, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Silk Trousers
				{ 7, 124964, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Silk Cowl
				{ 8, 124967, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Silk Amice
				{ 9, 124966, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Silk Robe
				{ 10, 124963, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Silk Handguards
				{ 11, 124965, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Silk Trousers
				{ 16, 125097  }, -- Wild Aspirant's Silk Cowl
				{ 17, 125100  }, -- Wild Aspirant's Silk Amice
				{ 18, 125099  }, -- Wild Aspirant's Silk Robe
				{ 19, 125096  }, -- Wild Aspirant's Silk Handguards
				{ 20, 125098  }, -- Wild Aspirant's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125249, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Silk Cowl
				{ 2, 125252, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Silk Amice
				{ 3, 125251, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Silk Robe
				{ 4, 125248, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Silk Handguards
				{ 5, 125250, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Silk Trousers
				{ 7, 125441, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Silk Cowl
				{ 8, 125444, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Silk Amice
				{ 9, 125443, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Silk Robe
				{ 10, 125440, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Silk Handguards
				{ 11, 125442, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Silk Trousers
				{ 16, 125574  }, -- Wild Aspirant's Silk Cowl
				{ 17, 125577  }, -- Wild Aspirant's Silk Amice
				{ 18, 125576  }, -- Wild Aspirant's Silk Robe
				{ 19, 125573  }, -- Wild Aspirant's Silk Handguards
				{ 20, 125575  }, -- Wild Aspirant's Silk Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 124794, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ironskin Helm
				{ 2, 124796, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ironskin Spaulders
				{ 3, 124797, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ironskin Tunic
				{ 4, 124793, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ironskin Gloves
				{ 5, 124795, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ironskin Legguards
				{ 7, 124980, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ironskin Helm
				{ 8, 124982, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ironskin Spaulders
				{ 9, 124983, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ironskin Tunic
				{ 10, 124979, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ironskin Gloves
				{ 11, 124981, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ironskin Legguards
				{ 16, 125105  }, -- Wild Aspirant's Ironskin Helm
				{ 17, 125107  }, -- Wild Aspirant's Ironskin Spaulders
				{ 18, 125108  }, -- Wild Aspirant's Ironskin Tunic
				{ 19, 125104  }, -- Wild Aspirant's Ironskin Gloves
				{ 20, 125106  }, -- Wild Aspirant's Ironskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125273, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ironskin Helm
				{ 2, 125275, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ironskin Spaulders
				{ 3, 125276, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ironskin Tunic
				{ 4, 125272, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ironskin Gloves
				{ 5, 125274, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ironskin Legguards
				{ 7, 125457, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ironskin Helm
				{ 8, 125459, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ironskin Spaulders
				{ 9, 125460, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ironskin Tunic
				{ 10, 125456, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ironskin Gloves
				{ 11, 125458, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ironskin Legguards
				{ 16, 125582  }, -- Wild Aspirant's Ironskin Helm
				{ 17, 125584  }, -- Wild Aspirant's Ironskin Spaulders
				{ 18, 125585  }, -- Wild Aspirant's Ironskin Tunic
				{ 19, 125581  }, -- Wild Aspirant's Ironskin Gloves
				{ 20, 125583  }, -- Wild Aspirant's Ironskin Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 124800, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Scaled Helm
				{ 2, 124802, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Scaled Shoulders
				{ 3, 124798, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Scaled Chestpiece
				{ 4, 124799, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Scaled Gauntlets
				{ 5, 124801, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Scaled Legguards
				{ 7, 124986, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Scaled Helm
				{ 8, 124988, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Scaled Shoulders
				{ 9, 124984, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Scaled Chestpiece
				{ 10, 124985, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Scaled Gauntlets
				{ 11, 124987, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Scaled Legguards
				{ 16, 125111  }, -- Wild Aspirant's Scaled Helm
				{ 17, 125113  }, -- Wild Aspirant's Scaled Shoulders
				{ 18, 125109  }, -- Wild Aspirant's Scaled Chestpiece
				{ 19, 125110  }, -- Wild Aspirant's Scaled Gauntlets
				{ 20, 125112  }, -- Wild Aspirant's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125279, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Scaled Helm
				{ 2, 125281, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Scaled Shoulders
				{ 3, 125277, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Scaled Chestpiece
				{ 4, 125278, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Scaled Gauntlets
				{ 5, 125280, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Scaled Legguards
				{ 7, 125463, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Scaled Helm
				{ 8, 125465, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Scaled Shoulders
				{ 9, 125461, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Scaled Chestpiece
				{ 10, 125462, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Scaled Gauntlets
				{ 11, 125464, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Scaled Legguards
				{ 16, 125588  }, -- Wild Aspirant's Scaled Helm
				{ 17, 125590  }, -- Wild Aspirant's Scaled Shoulders
				{ 18, 125586  }, -- Wild Aspirant's Scaled Chestpiece
				{ 19, 125587  }, -- Wild Aspirant's Scaled Gauntlets
				{ 20, 125589  }, -- Wild Aspirant's Scaled Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 124823, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Satin Hood
				{ 2, 124826, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Satin Mantle
				{ 3, 124825, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Satin Robe
				{ 4, 124822, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Satin Gloves
				{ 5, 124824, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Satin Leggings
				{ 7, 125001, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Satin Hood
				{ 8, 125004, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Satin Mantle
				{ 9, 125003, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Satin Robe
				{ 10, 125000, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Satin Gloves
				{ 11, 125002, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Satin Leggings
				{ 16, 125118  }, -- Wild Aspirant's Satin Hood
				{ 17, 125121  }, -- Wild Aspirant's Satin Mantle
				{ 18, 125120  }, -- Wild Aspirant's Satin Robe
				{ 19, 125117  }, -- Wild Aspirant's Satin Gloves
				{ 20, 125119  }, -- Wild Aspirant's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125302, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Satin Hood
				{ 2, 125305, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Satin Mantle
				{ 3, 125304, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Satin Robe
				{ 4, 125301, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Satin Gloves
				{ 5, 125303, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Satin Leggings
				{ 7, 125478, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Satin Hood
				{ 8, 125481, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Satin Mantle
				{ 9, 125480, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Satin Robe
				{ 10, 125477, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Satin Gloves
				{ 11, 125479, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Satin Leggings
				{ 16, 125595  }, -- Wild Aspirant's Satin Hood
				{ 17, 125598  }, -- Wild Aspirant's Satin Mantle
				{ 18, 125597  }, -- Wild Aspirant's Satin Robe
				{ 19, 125594  }, -- Wild Aspirant's Satin Gloves
				{ 20, 125596  }, -- Wild Aspirant's Satin Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 124829, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Leather Helm
				{ 2, 124831, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Leather Spaulders
				{ 3, 124827, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Leather Tunic
				{ 4, 124828, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Leather Gloves
				{ 5, 124830, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Leather Legguards
				{ 7, 125007, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Leather Helm
				{ 8, 125009, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Leather Spaulders
				{ 9, 125005, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Leather Tunic
				{ 10, 125006, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Leather Gloves
				{ 11, 125008, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Leather Legguards
				{ 16, 125124  }, -- Wild Aspirant's Leather Helm
				{ 17, 125126  }, -- Wild Aspirant's Leather Spaulders
				{ 18, 125122  }, -- Wild Aspirant's Leather Tunic
				{ 19, 125123  }, -- Wild Aspirant's Leather Gloves
				{ 20, 125125  }, -- Wild Aspirant's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125308, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Leather Helm
				{ 2, 125310, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Leather Spaulders
				{ 3, 125306, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Leather Tunic
				{ 4, 125307, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Leather Gloves
				{ 5, 125309, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Leather Legguards
				{ 7, 125484, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Leather Helm
				{ 8, 125486, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Leather Spaulders
				{ 9, 125482, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Leather Tunic
				{ 10, 125483, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Leather Gloves
				{ 11, 125485, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Leather Legguards
				{ 16, 125601  }, -- Wild Aspirant's Leather Helm
				{ 17, 125603  }, -- Wild Aspirant's Leather Spaulders
				{ 18, 125599  }, -- Wild Aspirant's Leather Tunic
				{ 19, 125600  }, -- Wild Aspirant's Leather Gloves
				{ 20, 125602  }, -- Wild Aspirant's Leather Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 124834, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ringmail Helm
				{ 2, 124836, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ringmail Spaulders
				{ 3, 124832, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ringmail Armor
				{ 4, 124833, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ringmail Gauntlets
				{ 5, 124835, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ringmail Leggings
				{ 7, 125012, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ringmail Helm
				{ 8, 125014, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ringmail Spaulders
				{ 9, 125010, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ringmail Armor
				{ 10, 125011, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ringmail Gauntlets
				{ 11, 125013, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ringmail Leggings
				{ 16, 125129  }, -- Wild Aspirant's Ringmail Helm
				{ 17, 125131  }, -- Wild Aspirant's Ringmail Spaulders
				{ 18, 125127  }, -- Wild Aspirant's Ringmail Armor
				{ 19, 125128  }, -- Wild Aspirant's Ringmail Gauntlets
				{ 20, 125130  }, -- Wild Aspirant's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125313, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ringmail Helm
				{ 2, 125315, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ringmail Spaulders
				{ 3, 125311, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ringmail Armor
				{ 4, 125312, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Ringmail Gauntlets
				{ 5, 125314, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Ringmail Leggings
				{ 7, 125489, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ringmail Helm
				{ 8, 125491, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ringmail Spaulders
				{ 9, 125487, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ringmail Armor
				{ 10, 125488, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Ringmail Gauntlets
				{ 11, 125490, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Ringmail Leggings
				{ 16, 125606  }, -- Wild Aspirant's Ringmail Helm
				{ 17, 125608  }, -- Wild Aspirant's Ringmail Spaulders
				{ 18, 125604  }, -- Wild Aspirant's Ringmail Armor
				{ 19, 125605  }, -- Wild Aspirant's Ringmail Gauntlets
				{ 20, 125607  }, -- Wild Aspirant's Ringmail Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 124876, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Felweave Cowl
				{ 2, 124879, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Felweave Amice
				{ 3, 124878, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Felweave Raiment
				{ 4, 124875, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Felweave Handguards
				{ 5, 124877, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Felweave Trousers
				{ 7, 125054, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Felweave Cowl
				{ 8, 125057, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Felweave Amice
				{ 9, 125056, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Felweave Raiment
				{ 10, 125053, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Felweave Handguards
				{ 11, 125055, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Felweave Trousers
				{ 16, 125145  }, -- Wild Aspirant's Felweave Cowl
				{ 17, 125148  }, -- Wild Aspirant's Felweave Amice
				{ 18, 125147  }, -- Wild Aspirant's Felweave Raiment
				{ 19, 125144  }, -- Wild Aspirant's Felweave Handguards
				{ 20, 125146  }, -- Wild Aspirant's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125353, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Felweave Cowl
				{ 2, 125356, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Felweave Amice
				{ 3, 125355, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Felweave Raiment
				{ 4, 125352, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Felweave Handguards
				{ 5, 125354, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Felweave Trousers
				{ 7, 125531, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Felweave Cowl
				{ 8, 125534, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Felweave Amice
				{ 9, 125533, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Felweave Raiment
				{ 10, 125530, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Felweave Handguards
				{ 11, 125532, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Felweave Trousers
				{ 16, 125622  }, -- Wild Aspirant's Felweave Cowl
				{ 17, 125625  }, -- Wild Aspirant's Felweave Amice
				{ 18, 125624  }, -- Wild Aspirant's Felweave Raiment
				{ 19, 125621  }, -- Wild Aspirant's Felweave Handguards
				{ 20, 125623  }, -- Wild Aspirant's Felweave Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 124882, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Plate Helm
				{ 2, 124884, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Plate Shoulders
				{ 3, 124880, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Plate Chestpiece
				{ 4, 124881, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Plate Gauntlets
				{ 5, 124883, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Plate Legguards
				{ 7, 125060, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Plate Helm
				{ 8, 125062, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Plate Shoulders
				{ 9, 125058, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Plate Chestpiece
				{ 10, 125059, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Plate Gauntlets
				{ 11, 125061, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Plate Legguards
				{ 16, 125151  }, -- Wild Aspirant's Plate Helm
				{ 17, 125153  }, -- Wild Aspirant's Plate Shoulders
				{ 18, 125149  }, -- Wild Aspirant's Plate Chestpiece
				{ 19, 125150  }, -- Wild Aspirant's Plate Gauntlets
				{ 20, 125152  }, -- Wild Aspirant's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 125359, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Plate Helm
				{ 2, 125361, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Plate Shoulders
				{ 3, 125357, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Plate Chestpiece
				{ 4, 125358, [PRICE_EXTRA_ITTYPE] = "conquest:1750"  }, -- Wild Gladiator's Plate Gauntlets
				{ 5, 125360, [PRICE_EXTRA_ITTYPE] = "conquest:2250"  }, -- Wild Gladiator's Plate Legguards
				{ 7, 125537, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Plate Helm
				{ 8, 125539, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Plate Shoulders
				{ 9, 125535, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Plate Chestpiece
				{ 10, 125536, [PRICE_EXTRA_ITTYPE] = "honor:1750"  }, -- Wild Combatant's Plate Gauntlets
				{ 11, 125538, [PRICE_EXTRA_ITTYPE] = "honor:2250"  }, -- Wild Combatant's Plate Legguards
				{ 16, 125628  }, -- Wild Aspirant's Plate Helm
				{ 17, 125630  }, -- Wild Aspirant's Plate Shoulders
				{ 18, 125626  }, -- Wild Aspirant's Plate Chestpiece
				{ 19, 125627  }, -- Wild Aspirant's Plate Gauntlets
				{ 20, 125629  }, -- Wild Aspirant's Plate Legguards
			},
		},
	},
}

data["WODS2NONSETGEAR"] = {
	name = string.format(AL["Warlords Season %d"], 2).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ALIL["Cloth"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124761, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Helm
				{ 2, 124766, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Headcover
				{ 4, 124763, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Spaulders
				{ 5, 124768, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Pauldrons
				{ 7, 124759, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Tunic
				{ 8, 124764, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Chestguard
				{ 10, 124760, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gloves
				{ 11, 124765, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Grips
				{ 16, 124762, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Legguards
				{ 17, 124767, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 18, 124756, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Cruelty
				{ 19, 124757, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Prowess
				{ 20, 124758, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Victory
				{ 22, 124750, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 124751, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 124752, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Victory
				{ 26, 124753, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 124754, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 124755, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				{ 101, 124960 }, -- Wild Combatant's Helm
				{ 103, 124962 }, -- Wild Combatant's Spaulders
				{ 105, 124958 }, -- Wild Combatant's Tunic
				{ 107, 124959 }, -- Wild Combatant's Gloves
				{ 109, 124956, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Cruelty
				{ 110, 124957, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Prowess
				{ 112, 124961 }, -- Wild Combatant's Legguards
				{ 114, 124952, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Prowess
				{ 115, 124953, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Cruelty
				{ 116, 124954, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Cruelty
				{ 117, 124955, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				{ 119, 125095 }, -- Wild Aspirant's Bindings of Cruelty
				{ 121, 125093 }, -- Wild Aspirant's Belt of Prowess
				{ 123, 125094 }, -- Wild Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125240, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Helm
				{ 2, 125245, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Headcover
				{ 4, 125242, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Spaulders
				{ 5, 125247, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Pauldrons
				{ 7, 125238, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Tunic
				{ 8, 125243, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Chestguard
				{ 10, 125239, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gloves
				{ 11, 125244, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Grips
				{ 16, 125235, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Cruelty
				{ 17, 125236, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Prowess
				{ 18, 125237, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Victory
				{ 19, 125241, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Legguards
				{ 20, 125246, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 22, 125229, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 125230, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 125231, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Victory
				{ 26, 125232, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 125233, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 125234, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				{ 101, 125437 }, -- Wild Combatant's Helm
				{ 103, 125439 }, -- Wild Combatant's Spaulders
				{ 105, 125435 }, -- Wild Combatant's Tunic
				{ 107, 125436 }, -- Wild Combatant's Gloves
				{ 109, 125433, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Cruelty
				{ 110, 125434, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Prowess
				{ 112, 125438 }, -- Wild Combatant's Legguards
				{ 114, 125429, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Prowess
				{ 115, 125430, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Cruelty
				{ 116, 125431, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Cruelty
				{ 117, 125432, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				{ 119, 125572 }, -- Wild Aspirant's Bindings of Cruelty
				{ 121, 125570 }, -- Wild Aspirant's Belt of Prowess
				{ 123, 125571 }, -- Wild Aspirant's Boots of Cruelty
			},
		},
		{
			name = ALIL["Leather"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124761, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Helm
				{ 2, 124766, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Headcover
				{ 4, 124763, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Spaulders
				{ 5, 124768, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Pauldrons
				{ 7, 124759, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Tunic
				{ 8, 124764, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Chestguard
				{ 10, 124760, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gloves
				{ 11, 124765, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Grips
				{ 16, 124762, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Legguards
				{ 17, 124767, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 18, 124756, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Cruelty
				{ 19, 124757, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Prowess
				{ 20, 124758, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Victory
				{ 22, 124750, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 124751, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 124752, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Victory
				{ 26, 124753, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 124754, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 124755, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				{ 101, 124960 }, -- Wild Combatant's Helm
				{ 103, 124962 }, -- Wild Combatant's Spaulders
				{ 105, 124958 }, -- Wild Combatant's Tunic
				{ 107, 124959 }, -- Wild Combatant's Gloves
				{ 109, 124956, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Cruelty
				{ 110, 124957, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Prowess
				{ 112, 124961 }, -- Wild Combatant's Legguards
				{ 114, 124952, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Prowess
				{ 115, 124953, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Cruelty
				{ 116, 124954, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Cruelty
				{ 117, 124955, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				{ 119, 125095 }, -- Wild Aspirant's Bindings of Cruelty
				{ 121, 125093 }, -- Wild Aspirant's Belt of Prowess
				{ 123, 125094 }, -- Wild Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125240, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Helm
				{ 2, 125245, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Headcover
				{ 4, 125242, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Spaulders
				{ 5, 125247, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Pauldrons
				{ 7, 125238, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Tunic
				{ 8, 125243, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Chestguard
				{ 10, 125239, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gloves
				{ 11, 125244, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Grips
				{ 16, 125235, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Cruelty
				{ 17, 125236, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Prowess
				{ 18, 125237, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Bindings of Victory
				{ 19, 125241, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Legguards
				{ 20, 125246, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 22, 125229, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Prowess
				{ 23, 125230, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Cruelty
				{ 24, 125231, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Belt of Victory
				{ 26, 125232, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Cruelty
				{ 27, 125233, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Prowess
				{ 28, 125234, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Boots of Victory
				-- ilvl 670
				{ 101, 125437 }, -- Wild Combatant's Helm
				{ 103, 125439 }, -- Wild Combatant's Spaulders
				{ 105, 125435 }, -- Wild Combatant's Tunic
				{ 107, 125436 }, -- Wild Combatant's Gloves
				{ 109, 125433, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Cruelty
				{ 110, 125434, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Bindings of Prowess
				{ 112, 125438 }, -- Wild Combatant's Legguards
				{ 114, 125429, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Prowess
				{ 115, 125430, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Belt of Cruelty
				{ 116, 125431, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Cruelty
				{ 117, 125432, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Boots of Prowess
				-- ilvl 625
				{ 119, 125572 }, -- Wild Aspirant's Bindings of Cruelty
				{ 121, 125570 }, -- Wild Aspirant's Belt of Prowess
				{ 123, 125571 }, -- Wild Aspirant's Boots of Cruelty
			},
		},
		{
			name = ALIL["Mail"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124785, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Helm
				{ 2, 124790, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Coif
				{ 4, 124787, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Spaulders
				{ 5, 124792, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Pauldrons
				{ 7, 124783, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Armor
				{ 8, 124788, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Chestguard
				{ 10, 124784, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gauntlets
				{ 11, 124789, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gloves
				{ 16, 124780, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armbands of Prowess
				{ 17, 124781, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armbands of Cruelty
				{ 18, 124782, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armbands of Victory
				{ 19, 124786, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 20, 124791, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 22, 124774, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Waistguard of Cruelty
				{ 23, 124775, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Waistguard of Prowess
				{ 24, 124776, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Waistguard of Victory
				{ 26, 124777, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Footguards of Cruelty
				{ 27, 124778, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Footguards of Prowess
				{ 28, 124779, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Footguards of Victory
				-- ilvl 670
				{ 101, 124976 }, -- Wild Combatant's Helm
				{ 103, 124978 }, -- Wild Combatant's Spaulders
				{ 105, 124974 }, -- Wild Combatant's Armor
				{ 107, 124975 }, -- Wild Combatant's Gauntlets
				{ 109, 124972, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armbands of Prowess
				{ 110, 124973, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armbands of Cruelty
				{ 112, 124977 }, -- Wild Combatant's Leggings
				{ 114, 124968, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Waistguard of Cruelty
				{ 115, 124969, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Waistguard of Prowess
				{ 116, 124970, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Footguards of Cruelty
				{ 117, 124971, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Footguards of Prowess
				-- ilvl 625
				{ 119, 125103 }, -- Wild Aspirant's Armbands of Prowess
				{ 121, 125101 }, -- Wild Aspirant's Waistguard of Cruelty
				{ 123, 125102 }, -- Wild Aspirant's Footguards of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125264, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Helm
				{ 2, 125269, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Coif
				{ 4, 125266, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Spaulders
				{ 5, 125271, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Pauldrons
				{ 7, 125262, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Armor
				{ 8, 125267, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Chestguard
				{ 10, 125263, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gauntlets
				{ 11, 125268, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Gloves
				{ 16, 125259, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armbands of Prowess
				{ 17, 125260, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armbands of Cruelty
				{ 18, 125261, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armbands of Victory
				{ 19, 125265, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 20, 125270, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Leggings
				{ 22, 125253, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Waistguard of Cruelty
				{ 23, 125254, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Waistguard of Prowess
				{ 24, 125255, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Waistguard of Victory
				{ 26, 125256, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Footguards of Cruelty
				{ 27, 125257, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Footguards of Prowess
				{ 28, 125258, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Footguards of Victory
				-- ilvl 670
				{ 101, 125453 }, -- Wild Combatant's Helm
				{ 103, 125455 }, -- Wild Combatant's Spaulders
				{ 105, 125451 }, -- Wild Combatant's Armor
				{ 107, 125452 }, -- Wild Combatant's Gauntlets
				{ 109, 125449, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armbands of Prowess
				{ 110, 125450, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armbands of Cruelty
				{ 112, 125454 }, -- Wild Combatant's Leggings
				{ 114, 125445, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Waistguard of Cruelty
				{ 115, 125446, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Waistguard of Prowess
				{ 116, 125447, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Footguards of Cruelty
				{ 117, 125448, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Footguards of Prowess
				-- ilvl 625
				{ 119, 125580 }, -- Wild Aspirant's Armbands of Prowess
				{ 121, 125578 }, -- Wild Aspirant's Waistguard of Cruelty
				{ 123, 125579 }, -- Wild Aspirant's Footguards of Cruelty
			},
		},
		{
			name = ALIL["Plate"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124814, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Helmet
				{ 2, 124819, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Visor
				{ 4, 124816, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Shoulderplates
				{ 5, 124821, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Plate Pauldrons
				{ 7, 124812, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Breastplate
				{ 8, 124817, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Chestguard
				{ 10, 124813, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Plate Gloves
				{ 11, 124818, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Plate Grips
				{ 16, 124809, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armplates of Cruelty
				{ 17, 124810, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armplates of Prowess
				{ 18, 124811, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armplates of Victory
				{ 19, 124815, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Legplates
				{ 20, 124820, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Leggings
				{ 22, 124803, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Girdle of Cruelty
				{ 23, 124804, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Girdle of Prowess
				{ 24, 124805, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Girdle of Victory
				{ 26, 124806, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Warboots of Cruelty
				{ 27, 124807, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Warboots of Prowess
				{ 28, 124808, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Warboots of Victory
				-- ilvl 670
				{ 101, 124997 }, -- Wild Combatant's Plate Helmet
				{ 103, 124999 }, -- Wild Combatant's Shoulderplates
				{ 105, 124995 }, -- Wild Combatant's Plate Breastplate
				{ 107, 124996 }, -- Wild Combatant's Plate Gloves
				{ 109, 124993, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armplates of Cruelty
				{ 110, 124994, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armplates of Prowess
				{ 112, 124998 }, -- Wild Combatant's Legplates
				{ 114, 124989, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Girdle of Cruelty
				{ 115, 124990, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Girdle of Prowess
				{ 116, 124991, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Warboots of Cruelty
				{ 117, 124992, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Warboots of Prowess
				-- ilvl 625
				{ 119, 125116 }, -- Wild Aspirant's Armplates of Cruelty
				{ 121, 125114 }, -- Wild Aspirant's Girdle of Cruelty
				{ 123, 125115 }, -- Wild Aspirant's Warboots of Cruelty
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125293, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Helmet
				{ 2, 125298, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Visor
				{ 4, 125295, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Shoulderplates
				{ 5, 125300, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Plate Pauldrons
				{ 7, 125291, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Breastplate
				{ 8, 125296, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Chestguard
				{ 10, 125292, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Plate Gloves
				{ 11, 125297, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Plate Grips
				{ 16, 125288, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armplates of Cruelty
				{ 17, 125289, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armplates of Prowess
				{ 18, 125290, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Armplates of Victory
				{ 19, 125294, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Legplates
				{ 20, 125299, [PRICE_EXTRA_ITTYPE] = "conquest:2250" }, -- Wild Gladiator's Plate Leggings
				{ 22, 125282, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Girdle of Cruelty
				{ 23, 125283, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Girdle of Prowess
				{ 24, 125284, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Girdle of Victory
				{ 26, 125285, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Warboots of Cruelty
				{ 27, 125286, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Warboots of Prowess
				{ 28, 125287, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Warboots of Victory
				-- ilvl 670
				{ 101, 125474 }, -- Wild Combatant's Plate Helmet
				{ 103, 125476 }, -- Wild Combatant's Shoulderplates
				{ 105, 125472 }, -- Wild Combatant's Plate Breastplate
				{ 107, 125473 }, -- Wild Combatant's Plate Gloves
				{ 109, 125470, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armplates of Cruelty
				{ 110, 125471, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Armplates of Prowess
				{ 112, 125475 }, -- Wild Combatant's Legplates
				{ 114, 125466, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Girdle of Cruelty
				{ 115, 125467, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Girdle of Prowess
				{ 116, 125468, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Warboots of Cruelty
				{ 117, 125469, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Warboots of Prowess
				-- ilvl 625
				{ 119, 125593 }, -- Wild Aspirant's Armplates of Cruelty
				{ 121, 125591 }, -- Wild Aspirant's Girdle of Cruelty
				{ 123, 125592 }, -- Wild Aspirant's Warboots of Cruelty
			},
		},
		{
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124687, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Necklace of Cruelty
				{ 2, 124688, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Necklace of Prowess
				{ 3, 124737, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Cruelty
				{ 4, 124738, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Prowess
				{ 5, 124739, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Meditation
				{ 6, 124740, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Contemplation
				{ 7, 124846, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Choker of Cruelty
				{ 8, 124847, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Choker of Prowess
				{ 9, 124853, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Choker of Endurance
				-- ilvl 670
				{ 16, 124897, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Necklace of Cruelty
				{ 17, 124898, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Necklace of Prowess
				{ 18, 124939, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Cruelty
				{ 19, 124940, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Prowess
				{ 20, 124941, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Meditation
				{ 21, 124942, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Contemplation
				{ 22, 125024, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Choker of Cruelty
				{ 23, 125025, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Choker of Prowess
				{ 24, 125050, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Choker of Endurance
				-- ilvl 625
				{ 26, 125064 }, -- Wild Aspirant's Necklace of Cruelty
				{ 27, 125087 }, -- Wild Aspirant's Pendant of Cruelty
				{ 28, 125088 }, -- Wild Aspirant's Pendant of Meditation
				{ 29, 125133 }, -- Wild Aspirant's Choker of Cruelty
				{ 30, 125136 }, -- Wild Aspirant's Choker of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125166, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Necklace of Cruelty
				{ 2, 125167, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Necklace of Prowess
				{ 3, 125216, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Cruelty
				{ 4, 125217, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Prowess
				{ 5, 125218, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Meditation
				{ 6, 125219, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Pendant of Contemplation
				{ 7, 125325, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Choker of Cruelty
				{ 8, 125326, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Choker of Prowess
				{ 9, 125332, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Choker of Endurance
				-- ilvl 670
				{ 16, 125374, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Necklace of Cruelty
				{ 17, 125375, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Necklace of Prowess
				{ 18, 125416, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Cruelty
				{ 19, 125417, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Prowess
				{ 20, 125418, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Meditation
				{ 21, 125419, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Pendant of Contemplation
				{ 22, 125501, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Choker of Cruelty
				{ 23, 125502, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Choker of Prowess
				{ 24, 125527, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Choker of Endurance
				-- ilvl 625
				{ 26, 125541 }, -- Wild Aspirant's Necklace of Cruelty
				{ 27, 125564 }, -- Wild Aspirant's Pendant of Cruelty
				{ 28, 125565 }, -- Wild Aspirant's Pendant of Meditation
				{ 29, 125610 }, -- Wild Aspirant's Choker of Cruelty
				{ 30, 125613 }, -- Wild Aspirant's Choker of Endurance
			},
		},
		{
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124685, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cape of Cruelty
				{ 2, 124686, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cape of Prowess
				{ 3, 124733, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Cruelty
				{ 4, 124734, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Prowess
				{ 5, 124735, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Meditation
				{ 6, 124736, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Contemplation
				{ 7, 124844, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cloak of Cruelty
				{ 8, 124845, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cloak of Prowess
				{ 9, 124852, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cloak of Endurance
				-- ilvl 650
				{ 16, 124895, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cape of Cruelty
				{ 17, 124896, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cape of Prowess
				{ 18, 124935, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Cruelty
				{ 19, 124936, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Prowess
				{ 20, 124937, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Meditation
				{ 21, 124938, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Contemplation
				{ 22, 125022, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cloak of Cruelty
				{ 23, 125023, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cloak of Prowess
				{ 24, 125049, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cloak of Endurance
				-- ilvl 625
				{ 11, 125063 }, -- Wild Aspirant's Cape of Cruelty
				{ 12, 125085 }, -- Wild Aspirant's Drape of Cruelty
				{ 13, 125086 }, -- Wild Aspirant's Drape of Meditation
				{ 14, 125132 }, -- Wild Aspirant's Cloak of Cruelty
				{ 15, 125135 }, -- Wild Aspirant's Cloak of Endurance
				-- ilvl 100
				{ 26, 127375 }, -- Wild Gladiator's Greatcloak
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 125164, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cape of Cruelty
				{ 2, 125165, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cape of Prowess
				{ 3, 125212, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Cruelty
				{ 4, 125213, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Prowess
				{ 5, 125214, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Meditation
				{ 6, 125215, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Drape of Contemplation
				{ 7, 125323, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cloak of Cruelty
				{ 8, 125324, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cloak of Prowess
				{ 9, 125331, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Cloak of Endurance
				-- ilvl 670
				{ 16, 125372, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cape of Cruelty
				{ 17, 125373, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cape of Prowess
				{ 18, 125412, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Cruelty
				{ 19, 125413, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Prowess
				{ 20, 125414, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Meditation
				{ 21, 125415, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Drape of Contemplation
				{ 22, 125499, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cloak of Cruelty
				{ 23, 125500, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cloak of Prowess
				{ 24, 125526, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Cloak of Endurance
				-- ilvl 625
				{ 11, 125540 }, -- Wild Aspirant's Cape of Cruelty
				{ 12, 125562 }, -- Wild Aspirant's Drape of Cruelty
				{ 13, 125563 }, -- Wild Aspirant's Drape of Meditation
				{ 14, 125609 }, -- Wild Aspirant's Cloak of Cruelty
				{ 15, 125612 }, -- Wild Aspirant's Cloak of Endurance
				-- ilvl 100
				{ 26, 127374 }, -- Wild Gladiator's Greatcloak
			},
		},
		{
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124689, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Ring of Cruelty
				{ 2, 124690, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Ring of Prowess
				{ 3, 124691, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Ring of Triumph
				{ 4, 124743, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Cruelty
				{ 5, 124744, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Prowess
				{ 6, 124745, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Victory
				{ 7, 124746, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Meditation
				{ 8, 124747, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Contemplation
				{ 9, 124848, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Cruelty
				{ 10, 124849, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Accuracy
				{ 11, 124850, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Ruthlessness
				{ 12, 124854, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Dedication
				{ 13, 124855, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Endurance
				-- ilvl 670
				{ 16, 124899, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Ring of Cruelty
				{ 17, 124900, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Ring of Prowess
				{ 18, 124901, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Ring of Triumph
				{ 19, 124945, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Cruelty
				{ 20, 124946, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Prowess
				{ 21, 124947, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Victory
				{ 22, 124948, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Meditation
				{ 23, 124949, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Contemplation
				{ 24, 125026, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Cruelty
				{ 25, 125027, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Accuracy
				{ 26, 125028, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Ruthlessness
				{ 27, 125051, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Dedication
				{ 28, 125052, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Endurance
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
				{ 1, 125168, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Ring of Cruelty
				{ 2, 125169, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Ring of Prowess
				{ 3, 125170, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Ring of Triumph
				{ 4, 125222, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Cruelty
				{ 5, 125223, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Prowess
				{ 6, 125224, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Victory
				{ 7, 125225, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Meditation
				{ 8, 125226, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Band of Contemplation
				{ 9, 125327, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Cruelty
				{ 10, 125328, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Accuracy
				{ 11, 125329, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Ruthlessness
				{ 12, 125333, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Dedication
				{ 13, 125334, [PRICE_EXTRA_ITTYPE] = "conquest:1250" }, -- Wild Gladiator's Signet of Endurance
				-- ilvl 670
				{ 16, 125376, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Ring of Cruelty
				{ 17, 125377, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Ring of Prowess
				{ 18, 125378, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Ring of Triumph
				{ 19, 125422, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Cruelty
				{ 20, 125423, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Prowess
				{ 21, 125424, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Victory
				{ 22, 125425, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Meditation
				{ 23, 125426, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Band of Contemplation
				{ 24, 125503, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Cruelty
				{ 25, 125504, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Accuracy
				{ 26, 125505, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Ruthlessness
				{ 27, 125528, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Dedication
				{ 28, 125529, [PRICE_EXTRA_ITTYPE] = "honor:1250" }, -- Wild Combatant's Signet of Endurance
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
		{
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				-- ilvl 700
				{ 1, 124856, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Conquest
				{ 2, 124857, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Insignia of Conquest
				{ 3, 124858, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Emblem of Cruelty
				{ 4, 124859, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Emblem of Tenacity
				{ 5, 124860, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Emblem of Meditation
				{ 6, 124861, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Dominance
				{ 7, 124862, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Insignia of Dominance
				{ 8, 124863, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Cruelty
				{ 9, 124865, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Tenacity
				{ 10, 124866, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Meditation
				{ 16, 124867, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Victory
				{ 17, 124868, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Insignia of Victory
				{ 18, 124869, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Adaptation
				{ 19, 124870 }, -- Wild Gladiator's Accolade of Conquest
				{ 20, 124871 }, -- Wild Gladiator's Accolade of Dominance
				{ 21, 124872 }, -- Wild Gladiator's Accolade of Victory
				{ 22, 124873 }, -- Wild Gladiator's Accolade of Meditation
				{ 23, 124874 }, -- Wild Gladiator's Accolade of Endurance
				{ 24, 127123, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Adaptation
				-- ilvl 670
				{ 101, 125030, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Conquest
				{ 102, 125031, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Insignia of Conquest
				{ 103, 125032, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Emblem of Cruelty
				{ 104, 125033, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Emblem of Tenacity
				{ 105, 125034, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Emblem of Meditation
				{ 106, 125035, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Dominance
				{ 107, 125036, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Insignia of Dominance
				{ 108, 125037, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Cruelty
				{ 109, 125038, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Adaptation
				{ 110, 125039, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Tenacity
				{ 111, 125040, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Meditation
				{ 112, 125041, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Victory
				{ 113, 125042, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Insignia of Victory
				{ 114, 125043, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Adaptation
				{ 115, 125044 }, -- Wild Combatant's Accolade of Conquest
				{ 116, 125045 }, -- Wild Combatant's Accolade of Dominance
				{ 117, 125046 }, -- Wild Combatant's Accolade of Victory
				{ 118, 125047 }, -- Wild Combatant's Accolade of Meditation
				{ 119, 125048 }, -- Wild Combatant's Accolade of Endurance
				-- ilvl 625
				{ 121, 125139 }, -- Wild Aspirant's Accolade of Conquest
				{ 122, 125140 }, -- Wild Aspirant's Accolade of Dominance
				{ 123, 125141 }, -- Wild Aspirant's Accolade of Victory
				{ 124, 125142 }, -- Wild Aspirant's Accolade of Meditation
				{ 125, 125143 }, -- Wild Aspirant's Accolade of Endurance
			},
			[HORDE_DIFF] = {
				-- ilvl 700
				{ 1, 124864, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Adaptation
				{ 2, 125335, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Conquest
				{ 3, 125336, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Insignia of Conquest
				{ 4, 125337, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Emblem of Cruelty
				{ 5, 125338, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Emblem of Tenacity
				{ 6, 125339, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Emblem of Meditation
				{ 7, 125340, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Dominance
				{ 8, 125341, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Insignia of Dominance
				{ 9, 125342, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Tenacity
				{ 10, 125343, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Meditation
				{ 16, 125344, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Victory
				{ 17, 125345, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Insignia of Victory
				{ 18, 125346, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Badge of Adaptation
				{ 19, 125347 }, -- Wild Gladiator's Accolade of Conquest
				{ 20, 125348 }, -- Wild Gladiator's Accolade of Dominance
				{ 21, 125349 }, -- Wild Gladiator's Accolade of Victory
				{ 22, 125350 }, -- Wild Gladiator's Accolade of Meditation
				{ 23, 125351 }, -- Wild Gladiator's Accolade of Endurance
				{ 24, 127124, [PRICE_EXTRA_ITTYPE] = "conquest:1750" }, -- Wild Gladiator's Medallion of Cruelty
				-- ilvl 670
				{ 101, 125507, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Conquest
				{ 102, 125508, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Insignia of Conquest
				{ 103, 125509, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Emblem of Cruelty
				{ 104, 125510, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Emblem of Tenacity
				{ 105, 125511, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Emblem of Meditation
				{ 106, 125512, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Dominance
				{ 107, 125513, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Insignia of Dominance
				{ 108, 125514, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Cruelty
				{ 109, 125515, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Adaptation
				{ 110, 125516, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Tenacity
				{ 111, 125517, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Medallion of Meditation
				{ 112, 125518, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Victory
				{ 113, 125519, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Insignia of Victory
				{ 114, 125520, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Wild Combatant's Badge of Adaptation
				{ 115, 125521 }, -- Wild Combatant's Accolade of Conquest
				{ 116, 125522 }, -- Wild Combatant's Accolade of Dominance
				{ 117, 125523 }, -- Wild Combatant's Accolade of Victory
				{ 118, 125524 }, -- Wild Combatant's Accolade of Meditation
				{ 119, 125525 }, -- Wild Combatant's Accolade of Endurance
				-- ilvl 625
				{ 121, 125616 }, -- Wild Aspirant's Accolade of Conquest
				{ 122, 125617 }, -- Wild Aspirant's Accolade of Dominance
				{ 123, 125618 }, -- Wild Aspirant's Accolade of Victory
				{ 124, 125619 }, -- Wild Aspirant's Accolade of Meditation
				{ 125, 125620 }, -- Wild Aspirant's Accolade of Endurance
			},
		},
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

	},
}
--[[
data["WODS2WEAPONS"] = {
	name = string.format(AL["Warlords Season %d"], 2).." "..AL["Weapons"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["ilvl %d"], 700).." "..AL["Elite"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = string.format(AL["ilvl %d"], 700).." (730)",
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = string.format(AL["ilvl %d"], 670).." (715)",
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
	},
}
]]
data["WODS1SETS"] = {
	name = string.format(AL["Warlords Season %d"], 1).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 115631, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Helm
				{ 2, 115633, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Shoulders
				{ 3, 115629, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Chestpiece
				{ 4, 115630, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Gauntlets
				{ 5, 115632, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Legguards
				{ 7, 115839, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Helm (r2000)
				{ 8, 115841, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Shoulders (r2000)
				{ 9, 115837, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Chestpiece (r2000)
				{ 10, 115838, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Gauntlets (r2000)
				{ 11, 115906, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Girdle (r2000)
				{ 12, 115840, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Legguards (r2000)
				{ 13, 115909, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Warboots (r2000)
				{ 16, 115051, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dreadplate Helm
				{ 17, 115053, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dreadplate Shoulders
				{ 18, 115049, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dreadplate Chestpiece
				{ 19, 115050, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dreadplate Gauntlets
				{ 20, 115052, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dreadplate Legguards
				{ 22, 115199 },	-- Primal Aspirant's Dreadplate Helm
				{ 23, 115201 },	-- Primal Aspirant's Dreadplate Shoulders
				{ 24, 115197 },	-- Primal Aspirant's Dreadplate Chestpiece
				{ 25, 115198 },	-- Primal Aspirant's Dreadplate Gauntlets
				{ 26, 115200 },	-- Primal Aspirant's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111104, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Helm
				{ 2, 111106, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Shoulders
				{ 3, 111102, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Chestpiece
				{ 4, 111103, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dreadplate Gauntlets
				{ 5, 111105, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dreadplate Legguards
				{ 16, 119841, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dreadplate Helm
				{ 17, 119843, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dreadplate Shoulders
				{ 18, 119839, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dreadplate Chestpiece
				{ 19, 119840, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dreadplate Gauntlets
				{ 20, 119842, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dreadplate Legguards
				{ 22, 119976 },	-- Primal Aspirant's Dreadplate Helm
				{ 23, 119978 },	-- Primal Aspirant's Dreadplate Shoulders
				{ 24, 119974 },	-- Primal Aspirant's Dreadplate Chestpiece
				{ 25, 119975 },	-- Primal Aspirant's Dreadplate Gauntlets
				{ 26, 119977 },	-- Primal Aspirant's Dreadplate Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 115635, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Helm
				{ 2, 115638, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Spaulders
				{ 3, 115637, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Robes
				{ 4, 115634, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Gloves
				{ 5, 115636, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Legguards
				{ 7, 115843, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Helm (r2000)
				{ 8, 115846, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Spaulders (r2000)
				{ 9, 115845, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Robes (r2000)
				{ 10, 115842, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Gloves (r2000)
				{ 11, 115971, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Belt (r2000)
				{ 12, 115844, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Legguards (r2000)
				{ 13, 115970, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Footguards (r2000)
				{ 16, 115055, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dragonhide Helm
				{ 17, 115058, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dragonhide Spaulders
				{ 18, 115057, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dragonhide Robes
				{ 19, 115054, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dragonhide Gloves
				{ 20, 115056, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dragonhide Legguards
				{ 22, 115203 },	-- Primal Aspirant's Dragonhide Helm
				{ 23, 115206 },	-- Primal Aspirant's Dragonhide Spaulders
				{ 24, 115205 },	-- Primal Aspirant's Dragonhide Robes
				{ 25, 115202 },	-- Primal Aspirant's Dragonhide Gloves
				{ 26, 115204 },	-- Primal Aspirant's Dragonhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111108, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Helm
				{ 2, 111111, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Spaulders
				{ 3, 111110, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Robes
				{ 4, 111107, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Dragonhide Gloves
				{ 5, 111109, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Dragonhide Legguards
				{ 16, 119845, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dragonhide Helm
				{ 17, 119848, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dragonhide Spaulders
				{ 18, 119847, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dragonhide Robes
				{ 19, 119844, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Dragonhide Gloves
				{ 20, 119846, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Dragonhide Legguards
				{ 22, 119980 },	-- Primal Aspirant's Dragonhide Helm
				{ 23, 119983 },	-- Primal Aspirant's Dragonhide Spaulders
				{ 24, 119982 },	-- Primal Aspirant's Dragonhide Robes
				{ 25, 119979 },	-- Primal Aspirant's Dragonhide Gloves
				{ 26, 119981 },	-- Primal Aspirant's Dragonhide Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 115641, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Helm
				{ 2, 115643, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Spaulders
				{ 3, 115639, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Armor
				{ 4, 115640, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Gauntlets
				{ 5, 115642, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Leggings
				{ 7, 115872, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Helm (r2000)
				{ 8, 115874, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Spaulders (r2000)
				{ 9, 115870, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Armor (r2000)
				{ 10, 115871, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Gauntlets (r2000)
				{ 11, 115866, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Links (r2000)
				{ 12, 115873, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Leggings (r2000)
				{ 13, 115868, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Sabatons (r2000)
				{ 16, 115061, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Chain Helm
				{ 17, 115063, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Chain Spaulders
				{ 18, 115059, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Chain Armor
				{ 19, 115060, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Chain Gauntlets
				{ 20, 115062, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Chain Leggings
				{ 22, 115209 },	-- Primal Aspirant's Chain Helm
				{ 23, 115211 },	-- Primal Aspirant's Chain Spaulders
				{ 24, 115207 },	-- Primal Aspirant's Chain Armor
				{ 25, 115208 },	-- Primal Aspirant's Chain Gauntlets
				{ 26, 115210 },	-- Primal Aspirant's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111114, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Helm
				{ 2, 111116, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Spaulders
				{ 3, 111112, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Armor
				{ 4, 111113, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Chain Gauntlets
				{ 5, 111115, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chain Leggings
				{ 16, 119851, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Chain Helm
				{ 17, 119853, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Chain Spaulders
				{ 18, 119849, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Chain Armor
				{ 19, 119850, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Chain Gauntlets
				{ 20, 119852, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Chain Leggings
				{ 22, 119986 },	-- Primal Aspirant's Chain Helm
				{ 23, 119988 },	-- Primal Aspirant's Chain Spaulders
				{ 24, 119984 },	-- Primal Aspirant's Chain Armor
				{ 25, 119985 },	-- Primal Aspirant's Chain Gauntlets
				{ 26, 119987 },	-- Primal Aspirant's Chain Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 115678, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Cowl
				{ 2, 115681, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Amice
				{ 3, 115680, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Robe
				{ 4, 115677, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Handguards
				{ 5, 115679, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Trousers
				{ 7, 115876, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Cowl (r2000)
				{ 8, 115879, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Amice (r2000)
				{ 9, 115878, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Robe (r2000)
				{ 10, 115875, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Handguards (r2000)
				{ 11, 115824, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Cord (r2000)
				{ 12, 115877, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Trousers (r2000)
				{ 13, 115827, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Treads (r2000)
				{ 16, 115091, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Silk Cowl
				{ 17, 115094, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Silk Amice
				{ 18, 115093, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Silk Robe
				{ 19, 115090, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Silk Handguards
				{ 20, 115092, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Silk Trousers
				{ 22, 115221 },	-- Primal Aspirant's Silk Cowl
				{ 23, 115224 },	-- Primal Aspirant's Silk Amice
				{ 24, 115223 },	-- Primal Aspirant's Silk Robe
				{ 25, 115220 },	-- Primal Aspirant's Silk Handguards
				{ 26, 115222 },	-- Primal Aspirant's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111151, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Cowl
				{ 2, 111154, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Amice
				{ 3, 111153, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Robe
				{ 4, 111150, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Silk Handguards
				{ 5, 111152, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Silk Trousers
				{ 16, 119874, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Silk Cowl
				{ 17, 119877, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Silk Amice
				{ 18, 119876, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Silk Robe
				{ 19, 119873, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Silk Handguards
				{ 20, 119875, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Silk Trousers
				{ 22, 119998 },	-- Primal Aspirant's Silk Cowl
				{ 23, 120001 },	-- Primal Aspirant's Silk Amice
				{ 24, 120000 },	-- Primal Aspirant's Silk Robe
				{ 25, 119997 },	-- Primal Aspirant's Silk Handguards
				{ 26, 119999 },	-- Primal Aspirant's Silk Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			[ALLIANCE_DIFF] = {
				{ 1, 115692, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Helm
				{ 2, 115694, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Spaulders
				{ 3, 115695, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Tunic
				{ 4, 115691, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Gloves
				{ 5, 115693, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Legguards
				{ 7, 115883, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Helm (r2000)
				{ 8, 115885, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Spaulders (r2000)
				{ 9, 115886, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Tunic (r2000)
				{ 10, 115882, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Gloves (r2000)
				{ 11, 115880, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Waistband (r2000)
				{ 12, 115884, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Legguards (r2000)
				{ 13, 115881, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Boots (r2000)
				{ 16, 115102, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ironskin Helm
				{ 17, 115104, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ironskin Spaulders
				{ 18, 115105, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ironskin Tunic
				{ 19, 115101, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ironskin Gloves
				{ 20, 115103, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ironskin Legguards
				{ 22, 115229 },	-- Primal Aspirant's Ironskin Helm
				{ 23, 115231 },	-- Primal Aspirant's Ironskin Spaulders
				{ 24, 115232 },	-- Primal Aspirant's Ironskin Tunic
				{ 25, 115228 },	-- Primal Aspirant's Ironskin Gloves
				{ 26, 115230 },	-- Primal Aspirant's Ironskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111165, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Helm
				{ 2, 111167, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Spaulders
				{ 3, 111168, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Tunic
				{ 4, 111164, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ironskin Gloves
				{ 5, 111166, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ironskin Legguards
				{ 16, 119885, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ironskin Helm
				{ 17, 119887, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ironskin Spaulders
				{ 18, 119888, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ironskin Tunic
				{ 19, 119884, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ironskin Gloves
				{ 20, 119886, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ironskin Legguards
				{ 22, 120006 },	-- Primal Aspirant's Ironskin Helm
				{ 23, 120008 },	-- Primal Aspirant's Ironskin Spaulders
				{ 24, 120009 },	-- Primal Aspirant's Ironskin Tunic
				{ 25, 120005 },	-- Primal Aspirant's Ironskin Gloves
				{ 26, 120007 },	-- Primal Aspirant's Ironskin Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 115698, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Helm
				{ 2, 115700, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Shoulders
				{ 3, 115696, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Chestpiece
				{ 4, 115697, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Gauntlets
				{ 5, 115699, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Legguards
				{ 7, 115894, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Helm (r2000)
				{ 8, 115896, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Shoulders (r2000)
				{ 9, 115892, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Chestpiece (r2000)
				{ 10, 115893, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Gauntlets (r2000)
				{ 11, 115897, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Clasp (r2000)
				{ 12, 115895, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Legguards (r2000)
				{ 13, 115900, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Greaves (r2000)
				{ 16, 115108, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Scaled Helm
				{ 17, 115110, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Scaled Shoulders
				{ 18, 115106, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Scaled Chestpiece
				{ 19, 115107, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Scaled Gauntlets
				{ 20, 115109, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Scaled Legguards
				{ 22, 115235 },	-- Primal Aspirant's Scaled Helm
				{ 23, 115237 },	-- Primal Aspirant's Scaled Shoulders
				{ 24, 115233 },	-- Primal Aspirant's Scaled Chestpiece
				{ 25, 115234 },	-- Primal Aspirant's Scaled Gauntlets
				{ 26, 115236 },	-- Primal Aspirant's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111171, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Helm
				{ 2, 111173, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Shoulders
				{ 3, 111169, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Chestpiece
				{ 4, 111170, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Scaled Gauntlets
				{ 5, 111172, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Scaled Legguards
				{ 16, 119891, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Scaled Helm
				{ 17, 119893, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Scaled Shoulders
				{ 18, 119889, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Scaled Chestpiece
				{ 19, 119890, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Scaled Gauntlets
				{ 20, 119892, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Scaled Legguards
				{ 22, 120012 },	-- Primal Aspirant's Scaled Helm
				{ 23, 120014 },	-- Primal Aspirant's Scaled Shoulders
				{ 24, 120010 },	-- Primal Aspirant's Scaled Chestpiece
				{ 25, 120011 },	-- Primal Aspirant's Scaled Gauntlets
				{ 26, 120013 },	-- Primal Aspirant's Scaled Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 115711, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Hood
				{ 2, 115714, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Mantle
				{ 3, 115713, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Robe
				{ 4, 115710, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Gloves
				{ 5, 115712, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Leggings
				{ 7, 115917, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Hood (r2000)
				{ 8, 115920, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Mantle (r2000)
				{ 9, 115919, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Robe (r2000)
				{ 10, 115916, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Gloves (r2000)
				{ 11, 115969, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Cord (r2000)
				{ 12, 115918, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Leggings (r2000)
				{ 13, 115968, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Treads (r2000)
				{ 16, 115118, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Satin Hood
				{ 17, 115121, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Satin Mantle
				{ 18, 115120, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Satin Robe
				{ 19, 115117, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Satin Gloves
				{ 20, 115119, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Satin Leggings
				{ 22, 115242 },	-- Primal Aspirant's Satin Hood
				{ 23, 115245 },	-- Primal Aspirant's Satin Mantle
				{ 24, 115244 },	-- Primal Aspirant's Satin Robe
				{ 25, 115241 },	-- Primal Aspirant's Satin Gloves
				{ 26, 115243 },	-- Primal Aspirant's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111184, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Hood
				{ 2, 111187, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Mantle
				{ 3, 111186, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Robe
				{ 4, 111183, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Satin Gloves
				{ 5, 111185, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Satin Leggings
				{ 16, 119901, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Satin Hood
				{ 17, 119904, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Satin Mantle
				{ 18, 119903, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Satin Robe
				{ 19, 119900, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Satin Gloves
				{ 20, 119902, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Satin Leggings
				{ 22, 120019 },	-- Primal Aspirant's Satin Hood
				{ 23, 120022 },	-- Primal Aspirant's Satin Mantle
				{ 24, 120021 },	-- Primal Aspirant's Satin Robe
				{ 25, 120018 },	-- Primal Aspirant's Satin Gloves
				{ 26, 120020 },	-- Primal Aspirant's Satin Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 115717, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Helm
				{ 2, 115719, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Spaulders
				{ 3, 115715, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Tunic
				{ 4, 115716, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Gloves
				{ 5, 115718, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Legguards
				{ 7, 115925, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Helm (r2000)
				{ 8, 115927, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Spaulders (r2000)
				{ 9, 115923, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Tunic (r2000)
				{ 10, 115924, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Gloves (r2000)
				{ 11, 115921, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Waistband (r2000)
				{ 12, 115926, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Legguards (r2000)
				{ 13, 115922, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Boots (r2000)
				{ 16, 115124, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leather Helm
				{ 17, 115126, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Leather Spaulders
				{ 18, 115122, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leather Tunic
				{ 19, 115123, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Leather Gloves
				{ 20, 115125, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leather Legguards
				{ 22, 115248 },	-- Primal Aspirant's Leather Helm
				{ 23, 115250 },	-- Primal Aspirant's Leather Spaulders
				{ 24, 115246 },	-- Primal Aspirant's Leather Tunic
				{ 25, 115247 },	-- Primal Aspirant's Leather Gloves
				{ 26, 115249 },	-- Primal Aspirant's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111190, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Helm
				{ 2, 111192, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Spaulders
				{ 3, 111188, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Tunic
				{ 4, 111189, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Leather Gloves
				{ 5, 111191, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leather Legguards
				{ 16, 119907, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leather Helm
				{ 17, 119909, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Leather Spaulders
				{ 18, 119905, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leather Tunic
				{ 19, 119906, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Leather Gloves
				{ 20, 119908, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leather Legguards
				{ 22, 120025 },	-- Primal Aspirant's Leather Helm
				{ 23, 120027 },	-- Primal Aspirant's Leather Spaulders
				{ 24, 120023 },	-- Primal Aspirant's Leather Tunic
				{ 25, 120024 },	-- Primal Aspirant's Leather Gloves
				{ 26, 120026 },	-- Primal Aspirant's Leather Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 115722, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Helm
				{ 2, 115724, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Spaulders
				{ 3, 115720, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Armor
				{ 4, 115721, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Gauntlets
				{ 5, 115723, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Leggings
				{ 7, 115933, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Helm (r2000)
				{ 8, 115935, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Spaulders (r2000)
				{ 9, 115931, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Armor (r2000)
				{ 10, 115932, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Gauntlets (r2000)
				{ 11, 115928, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Waistguard (r2000)
				{ 12, 115934, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Leggings (r2000)
				{ 13, 115929, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Footguards (r2000)
				{ 16, 115129, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ringmail Helm
				{ 17, 115131, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ringmail Spaulders
				{ 18, 115127, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ringmail Armor
				{ 19, 115128, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ringmail Gauntlets
				{ 20, 115130, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ringmail Leggings
				{ 22, 115253 },	-- Primal Aspirant's Ringmail Helm
				{ 23, 115255 },	-- Primal Aspirant's Ringmail Spaulders
				{ 24, 115251 },	-- Primal Aspirant's Ringmail Armor
				{ 25, 115252 },	-- Primal Aspirant's Ringmail Gauntlets
				{ 26, 115254 },	-- Primal Aspirant's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111195, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Helm
				{ 2, 111197, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Spaulders
				{ 3, 111193, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Armor
				{ 4, 111194, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ringmail Gauntlets
				{ 5, 111196, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Ringmail Leggings
				{ 16, 119912, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ringmail Helm
				{ 17, 119915, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ringmail Spaulders
				{ 18, 119910, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ringmail Armor
				{ 19, 119911, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ringmail Gauntlets
				{ 20, 119913, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Ringmail Leggings
				{ 22, 120030 },	-- Primal Aspirant's Ringmail Helm
				{ 23, 120032 },	-- Primal Aspirant's Ringmail Spaulders
				{ 24, 120028 },	-- Primal Aspirant's Ringmail Armor
				{ 25, 120029 },	-- Primal Aspirant's Ringmail Gauntlets
				{ 26, 120031 },	-- Primal Aspirant's Ringmail Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 115762, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Cowl
				{ 2, 115765, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Amice
				{ 3, 115764, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Raiment
				{ 4, 115761, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Handguards
				{ 5, 115763, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Trousers
				{ 7, 115957, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Cowl (r2000)
				{ 8, 115960, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Amice (r2000)
				{ 9, 115959, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Raiment (r2000)
				{ 10, 115956, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Handguards (r2000)
				{ 11, 115825, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Cord (r2000)
				{ 12, 115958, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Trousers (r2000)
				{ 13, 115828, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Treads (r2000)
				{ 16, 115162, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Felweave Cowl
				{ 17, 115165, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Felweave Amice
				{ 18, 115164, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Felweave Raiment
				{ 19, 115161, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Felweave Handguards
				{ 20, 115163, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Felweave Trousers
				{ 22, 115259 },	-- Primal Aspirant's Felweave Cowl
				{ 23, 115262 },	-- Primal Aspirant's Felweave Amice
				{ 24, 115261 },	-- Primal Aspirant's Felweave Raiment
				{ 25, 115258 },	-- Primal Aspirant's Felweave Handguards
				{ 26, 115260 },	-- Primal Aspirant's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111235, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Cowl
				{ 2, 111238, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Amice
				{ 3, 111237, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Raiment
				{ 4, 111234, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Felweave Handguards
				{ 5, 111236, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Felweave Trousers
				{ 16, 119939, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Felweave Cowl
				{ 17, 119942, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Felweave Amice
				{ 18, 119941, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Felweave Raiment
				{ 19, 119938, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Felweave Handguards
				{ 20, 119940, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Felweave Trousers
				{ 22, 120036 },	-- Primal Aspirant's Felweave Cowl
				{ 23, 120039 },	-- Primal Aspirant's Felweave Amice
				{ 24, 120038 },	-- Primal Aspirant's Felweave Raiment
				{ 25, 120035 },	-- Primal Aspirant's Felweave Handguards
				{ 26, 120037 },	-- Primal Aspirant's Felweave Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 115768, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Helm
				{ 2, 115770, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Shoulders
				{ 3, 115766, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestpiece
				{ 4, 115767, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Gauntlets
				{ 5, 115769, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Legguards
				{ 7, 115963, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Helm (r2000)
				{ 8, 115965, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Shoulders (r2000)
				{ 9, 115961, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestpiece (r2000)
				{ 10, 115962, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Gauntlets (r2000)
				{ 11, 115907, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Girdle (r2000)
				{ 12, 115964, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Legguards (r2000)
				{ 13, 115908, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Warboots (r2000)
				{ 16, 115168, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Helm
				{ 17, 115170, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Shoulders
				{ 18, 115166, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Chestpiece
				{ 19, 115167, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Gauntlets
				{ 20, 115169, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Legguards
				{ 22, 115265 },	-- Primal Aspirant's Plate Helm
				{ 23, 115267 },	-- Primal Aspirant's Plate Shoulders
				{ 24, 115263 },	-- Primal Aspirant's Plate Chestpiece
				{ 25, 115264 },	-- Primal Aspirant's Plate Gauntlets
				{ 26, 115266 },	-- Primal Aspirant's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 111241, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Helm
				{ 2, 111243, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Shoulders
				{ 3, 111239, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestpiece
				{ 4, 111240, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Gauntlets
				{ 5, 111242, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Legguards
				{ 16, 119945, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Helm
				{ 17, 119947, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Shoulders
				{ 18, 119943, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Chestpiece
				{ 19, 119944, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Gauntlets
				{ 20, 119946, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Legguards
				{ 22, 120042 },	-- Primal Aspirant's Plate Helm
				{ 23, 120044 },	-- Primal Aspirant's Plate Shoulders
				{ 24, 120040 },	-- Primal Aspirant's Plate Chestpiece
				{ 25, 120041 },	-- Primal Aspirant's Plate Gauntlets
				{ 26, 120043 },	-- Primal Aspirant's Plate Legguards
			},
		},
	},
}

data["WODS1NONSETGEAR"] = {
	name = string.format(AL["Warlords Season %d"], 1).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ALIL["Cloth"],
			[ALLIANCE_DIFF] = {
				{ 1, 115611, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Hood of Prowess
				{ 2, 115614, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Amice of Prowess
				{ 3, 115613, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Robes of Prowess
				{ 4, 115610, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gloves of Prowess
				{ 5, 115612, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings of Prowess
				{ 7, 115627, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cuffs of Cruelty
				{ 8, 115626, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cuffs of Prowess
				{ 10, 115620, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cord of Cruelty
				{ 11, 115621, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cord of Prowess
				{ 13, 115623, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Treads of Cruelty
				{ 14, 115624, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Treads of Prowess
				{ 16, 115616, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Cowl of Cruelty
				{ 17, 115619, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Mantle of Cruelty
				{ 18, 115618, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Raiment of Cruelty
				{ 19, 115628, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cuffs of Victory
				{ 20, 115615, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Handguards of Cruelty
				{ 21, 115622, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cord of Victory
				{ 22, 115617, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Trousers of Cruelty
				{ 23, 115625, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Treads of Victory
				{ 101, 115039, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Hood of Prowess
				{ 102, 115042, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Amice of Prowess
				{ 103, 115041, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Robes of Prowess
				{ 104, 115038, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Gloves of Prowess
				{ 105, 115040, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leggings of Prowess
				{ 107, 115048, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cuffs of Cruelty
				{ 108, 115047, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cuffs of Prowess
				{ 110, 115043, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Cord of Cruelty
				{ 111, 115044, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Cord of Prowess
				{ 113, 115045, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Treads of Cruelty
				{ 114, 115046, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Treads of Prowess
				{ 116, 115196 },	-- Primal Aspirant's Cuffs of Prowess
				{ 117, 115194 },	-- Primal Aspirant's Cord of Cruelty
				{ 118, 115195 },	-- Primal Aspirant's Treads of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111084, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Hood of Prowess
				{ 2, 111087, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Amice of Prowess
				{ 3, 111086, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Robes of Prowess
				{ 4, 111083, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gloves of Prowess
				{ 5, 111085, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings of Prowess
				{ 7, 111100, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cuffs of Cruelty
				{ 8, 111099, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cuffs of Prowess
				{ 10, 111093, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cord of Cruelty
				{ 11, 111094, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cord of Prowess
				{ 13, 111096, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Treads of Cruelty
				{ 14, 111097, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Treads of Prowess
				{ 16, 111089, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Cowl of Cruelty
				{ 17, 111092, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Mantle of Cruelty
				{ 18, 111091, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Raiment of Cruelty
				{ 19, 111101, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cuffs of Victory
				{ 20, 111088, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Handguards of Cruelty
				{ 21, 111095, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cord of Victory
				{ 22, 111090, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Trousers of Cruelty
				{ 23, 111098, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Treads of Victory
				{ 101, 119829, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Hood of Prowess
				{ 102, 119832, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Amice of Prowess
				{ 103, 119831, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Robes of Prowess
				{ 104, 119828, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Gloves of Prowess
				{ 105, 119830, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leggings of Prowess
				{ 107, 119838, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cuffs of Cruelty
				{ 108, 119837, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cuffs of Prowess
				{ 110, 119833, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Cord of Cruelty
				{ 111, 119834, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Cord of Prowess
				{ 113, 119835, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Treads of Cruelty
				{ 114, 119836, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Treads of Prowess
				{ 116, 119973 },	-- Primal Aspirant's Cuffs of Prowess
				{ 117, 119971 },	-- Primal Aspirant's Cord of Cruelty
				{ 118, 119972 },	-- Primal Aspirant's Treads of Cruelty
			},
		},
		{
			name = ALIL["Leather"],
			[ALLIANCE_DIFF] = {
				{ 1, 115775, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Helm
				{ 2, 115777, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Spaulders
				{ 3, 115773, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Tunic
				{ 4, 115774, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gloves
				{ 5, 115776, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Legguards
				{ 7, 115674, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Bindings of Cruelty
				{ 8, 115675, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Bindings of Prowess
				{ 10, 115669, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Belt of Cruelty
				{ 11, 115668, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Belt of Prowess
				{ 13, 115671, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Boots of Cruelty
				{ 14, 115672, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Boots of Prowess
				{ 16, 115785, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Headcover
				{ 17, 115787, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pauldrons
				{ 18, 115783, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chestguard
				{ 19, 115676, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Bindings of Victory
				{ 20, 115784, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Grips
				{ 21, 115670, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Belt of Victory
				{ 22, 115786, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings
				{ 23, 115673, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Boots of Victory
				{ 101, 115175, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Helm
				{ 102, 115177, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Spaulders
				{ 103, 115173, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Tunic
				{ 104, 115174, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Gloves
				{ 105, 115176, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Legguards
				{ 107, 115088, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Bindings of Cruelty
				{ 108, 115089, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Bindings of Prowess
				{ 110, 115085, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Belt of Cruelty
				{ 111, 115084, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Belt of Prowess
				{ 113, 115086, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Boots of Cruelty
				{ 114, 115087, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Boots of Prowess
				{ 116, 115219 },	-- Primal Aspirant's Bindings of Cruelty
				{ 117, 115217 },	-- Primal Aspirant's Belt of Prowess
				{ 118, 115218 },	-- Primal Aspirant's Boots of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111275, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Helm
				{ 2, 111277, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Spaulders
				{ 3, 111273, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Tunic
				{ 4, 111274, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gloves
				{ 5, 111276, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Legguards
				{ 7, 111147, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Bindings of Cruelty
				{ 8, 111148, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Bindings of Prowess
				{ 10, 111142, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Belt of Cruelty
				{ 11, 111141, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Belt of Prowess
				{ 13, 111144, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Boots of Cruelty
				{ 14, 111145, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Boots of Prowess
				{ 16, 111285, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Headcover
				{ 17, 111287, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pauldrons
				{ 18, 111283, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chestguard
				{ 19, 111149, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Bindings of Victory
				{ 20, 111284, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Grips
				{ 21, 111143, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Belt of Victory
				{ 22, 111286, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings
				{ 23, 111146, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Boots of Victory
				{ 101, 119952, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Helm
				{ 102, 119954, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Spaulders
				{ 103, 119950, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Tunic
				{ 104, 119951, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Gloves
				{ 105, 119953, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Legguards
				{ 107, 119871, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Bindings of Cruelty
				{ 108, 119872, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Bindings of Prowess
				{ 110, 119868, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Belt of Cruelty
				{ 111, 119867, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Belt of Prowess
				{ 113, 119869, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Boots of Cruelty
				{ 114, 119870, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Boots of Prowess
				{ 116, 119996 },	-- Primal Aspirant's Bindings of Cruelty
				{ 117, 119994 },	-- Primal Aspirant's Belt of Prowess
				{ 118, 119995 },	-- Primal Aspirant's Boots of Cruelty
			},
		},
		{
			name = ALIL["Mail"],
			[ALLIANCE_DIFF] = {
				{ 1, 115780, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Helm
				{ 2, 115782, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Spaulders
				{ 3, 115778, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Armor
				{ 4, 115779, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gauntlets
				{ 5, 115781, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings
				{ 7, 115689, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armbands of Cruelty
				{ 8, 115688, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armbands of Prowess
				{ 10, 115682, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Waistguard of Cruelty
				{ 11, 115683, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Waistguard of Prowess
				{ 13, 115685, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Footguards of Cruelty
				{ 14, 115686, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Footguards of Prowess
				{ 16, 115790, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Coif
				{ 17, 115792, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pauldrons
				{ 18, 115788, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chestguard
				{ 19, 115690, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armbands of Victory
				{ 20, 115789, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gloves
				{ 21, 115684, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Waistguard of Victory
				{ 22, 115791, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings
				{ 23, 115687, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Footguards of Victory
				{ 101, 115180, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Helm
				{ 102, 115182, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Spaulders
				{ 103, 115178, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Armor
				{ 104, 115179, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Gauntlets
				{ 105, 115181, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leggings
				{ 107, 115100, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armbands of Cruelty
				{ 108, 115099, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armbands of Prowess
				{ 110, 115095, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Waistguard of Cruelty
				{ 111, 115096, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Waistguard of Prowess
				{ 113, 115097, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Footguards of Cruelty
				{ 114, 115098, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Footguards of Prowess
				{ 116, 115227 },	-- Primal Aspirant's Armbands of Prowess
				{ 117, 115225 },	-- Primal Aspirant's Waistguard of Cruelty
				{ 118, 115226 },	-- Primal Aspirant's Footguards of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111280, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Helm
				{ 2, 111282, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Spaulders
				{ 3, 111278, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Armor
				{ 4, 111279, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gauntlets
				{ 5, 111281, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings
				{ 7, 111162, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armbands of Cruelty
				{ 8, 111161, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armbands of Prowess
				{ 10, 111155, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Waistguard of Cruelty
				{ 11, 111156, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Waistguard of Prowess
				{ 13, 111158, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Footguards of Cruelty
				{ 14, 111159, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Footguards of Prowess
				{ 16, 111290, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Coif
				{ 17, 111292, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pauldrons
				{ 18, 111288, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Chestguard
				{ 19, 111163, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armbands of Victory
				{ 20, 111289, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Gloves
				{ 21, 111157, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Waistguard of Victory
				{ 22, 111291, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Leggings
				{ 23, 111160, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Footguards of Victory
				{ 101, 119957, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Helm
				{ 102, 119959, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Spaulders
				{ 103, 119955, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Armor
				{ 104, 119956, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Gauntlets
				{ 105, 119958, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Leggings
				{ 107, 119883, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armbands of Cruelty
				{ 108, 119882, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armbands of Prowess
				{ 110, 119878, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Waistguard of Cruelty
				{ 111, 119879, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Waistguard of Prowess
				{ 113, 119880, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Footguards of Cruelty
				{ 114, 119881, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Footguards of Prowess
				{ 116, 120004 },	-- Primal Aspirant's Armbands of Prowess
				{ 117, 120002 },	-- Primal Aspirant's Waistguard of Cruelty
				{ 118, 120003 },	-- Primal Aspirant's Footguards of Cruelty
			},
		},
		{
			name = ALIL["Plate"],
			[ALLIANCE_DIFF] = {
				{ 1, 115738, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Helm
				{ 2, 115740, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Shoulders
				{ 3, 115736, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestpiece
				{ 4, 115737, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Gauntlets
				{ 5, 115739, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Legguards
				{ 7, 115707, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armplates of Cruelty
				{ 8, 115708, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armplates of Prowess
				{ 10, 115701, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Girdle of Cruelty
				{ 11, 115702, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Girdle of Prowess
				{ 13, 115704, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Warboots of Cruelty
				{ 14, 115705, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Warboots of Prowess
				{ 16, 115743, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Visor
				{ 17, 115745, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Pauldrons
				{ 18, 115741, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestguard
				{ 19, 115709, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armplates of Victory
				{ 20, 115742, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Grips
				{ 21, 115703, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Girdle of Victory
				{ 22, 115744, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Leggings
				{ 23, 115706, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Warboots of Victory
				{ 101, 115143, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Helm
				{ 102, 115145, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Shoulders
				{ 103, 115141, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Chestpiece
				{ 104, 115142, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Gauntlets
				{ 105, 115144, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Legguards
				{ 107, 115115, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armplates of Cruelty
				{ 108, 115116, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armplates of Prowess
				{ 110, 115111, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Girdle of Cruelty
				{ 111, 115112, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Girdle of Prowess
				{ 113, 115113, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Warboots of Cruelty
				{ 114, 115114, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Warboots of Prowess
				{ 116, 115240 },	-- Primal Aspirant's Armplates of Cruelty
				{ 117, 115238 },	-- Primal Aspirant's Girdle of Cruelty
				{ 118, 115239 },	-- Primal Aspirant's Warboots of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111211, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Helm
				{ 2, 111213, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Shoulders
				{ 3, 111209, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestpiece
				{ 4, 111210, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Gauntlets
				{ 5, 111212, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Legguards
				{ 7, 111180, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armplates of Cruelty
				{ 8, 111181, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armplates of Prowess
				{ 10, 111174, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Girdle of Cruelty
				{ 11, 111175, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Girdle of Prowess
				{ 13, 111177, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Warboots of Cruelty
				{ 14, 111178, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Warboots of Prowess
				{ 16, 111216, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Visor
				{ 17, 111218, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Pauldrons
				{ 18, 111214, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Chestguard
				{ 19, 111182, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Armplates of Victory
				{ 20, 111215, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Plate Grips
				{ 21, 111176, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Girdle of Victory
				{ 22, 111217, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Plate Leggings
				{ 23, 111179, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Warboots of Victory
				{ 101, 119920, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Helm
				{ 102, 119922, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Shoulders
				{ 103, 119918, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Chestpiece
				{ 104, 119919, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Plate Gauntlets
				{ 105, 119921, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Plate Legguards
				{ 107, 119898, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armplates of Cruelty
				{ 108, 119899, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Armplates of Prowess
				{ 110, 119894, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Girdle of Cruelty
				{ 111, 119895, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Girdle of Prowess
				{ 113, 119896, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Warboots of Cruelty
				{ 114, 119897, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Warboots of Prowess
				{ 116, 120017 },	-- Primal Aspirant's Armplates of Cruelty
				{ 117, 120015 },	-- Primal Aspirant's Girdle of Cruelty
				{ 118, 120016 },	-- Primal Aspirant's Warboots of Cruelty
			},
		},
		{
			name = AL["Amulets"],
			[ALLIANCE_DIFF] = {
				{ 1, 115734, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Choker of Cruelty
				{ 2, 120108, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Choker of Endurance
				{ 3, 115735, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Choker of Prowess
				{ 5, 115606, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Necklace of Cruelty
				{ 6, 115607, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Necklace of Prowess
				{ 8, 115658, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Contemplation
				{ 9, 115655, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Cruelty
				{ 10, 115657, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Meditation
				{ 11, 115656, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Prowess
				{ 16, 115139, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Choker of Cruelty
				{ 17, 115140, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Choker of Prowess
				{ 18, 115034, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Necklace of Cruelty
				{ 19, 115035, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Necklace of Prowess
				{ 20, 115074, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Contemplation
				{ 21, 115071, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Cruelty
				{ 22, 115073, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Meditation
				{ 23, 115072, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Prowess
				{ 25, 115256 },	-- Primal Aspirant's Choker of Cruelty
				{ 26, 115191 },	-- Primal Aspirant's Necklace of Cruelty
				{ 27, 115212 },	-- Primal Aspirant's Pendant of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111207, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Choker of Cruelty
				{ 2, 120107, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Choker of Endurance
				{ 3, 111208, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Choker of Prowess
				{ 5, 111079, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Necklace of Cruelty
				{ 6, 111080, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Necklace of Prowess
				{ 8, 111131, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Contemplation
				{ 9, 111128, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Cruelty
				{ 10, 111130, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Meditation
				{ 11, 111129, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Pendant of Prowess
				{ 16, 119916, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Choker of Cruelty
				{ 17, 119917, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Choker of Prowess
				{ 18, 119824, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Necklace of Cruelty
				{ 19, 119825, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Necklace of Prowess
				{ 20, 119857, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Contemplation
				{ 21, 119854, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Cruelty
				{ 22, 119856, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Meditation
				{ 23, 119855, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Pendant of Prowess
				{ 25, 120033 },	-- Primal Aspirant's Choker of Cruelty
				{ 26, 119968 },	-- Primal Aspirant's Necklace of Cruelty
				{ 27, 119989 },	-- Primal Aspirant's Pendant of Cruelty
			},
		},
		{
			name = AL["Cloaks"],
			[ALLIANCE_DIFF] = {
				{ 1, 115604, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cape of Cruelty
				{ 2, 115605, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cape of Prowess
				{ 4, 115732, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cloak of Cruelty
				{ 5, 120100, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cloak of Endurance
				{ 6, 115733, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cloak of Prowess
				{ 8, 115654, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Contemplation
				{ 9, 115651, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Cruelty
				{ 10, 115653, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Meditation
				{ 11, 115652, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Prowess
				{ 16, 115183, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cape of Cruelty
				{ 17, 115184, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cape of Prowess
				{ 18, 115189, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cloak of Cruelty
				{ 19, 115190, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cloak of Prowess
				{ 20, 115188, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Contemplation
				{ 21, 115185, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Cruelty
				{ 22, 115187, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Meditation
				{ 23, 115186, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Prowess
				{ 25, 115268 },	-- Primal Aspirant's Cape of Cruelty
				{ 26, 115271 },	-- Primal Aspirant's Cloak of Cruelty
				{ 27, 115269 },	-- Primal Aspirant's Drape of Cruelty
				{ 28, 115270 },	-- Primal Aspirant's Drape of Meditation
			},
			[HORDE_DIFF] = {
				{ 1, 111077, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cape of Cruelty
				{ 2, 111078, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cape of Prowess
				{ 4, 111205, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cloak of Cruelty
				{ 5, 120099, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cloak of Endurance
				{ 6, 111206, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Cloak of Prowess
				{ 8, 111127, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Contemplation
				{ 9, 111124, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Cruelty
				{ 10, 111126, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Meditation
				{ 11, 111125, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Drape of Prowess
				{ 16, 119960, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cape of Cruelty
				{ 17, 119961, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cape of Prowess
				{ 18, 119966, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cloak of Cruelty
				{ 19, 119967, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Cloak of Prowess
				{ 20, 119965, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Contemplation
				{ 21, 119962, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Cruelty
				{ 22, 119964, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Meditation
				{ 23, 119963, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Drape of Prowess
				{ 25, 120045 },	-- Primal Aspirant's Cape of Cruelty
				{ 26, 120048 },	-- Primal Aspirant's Cloak of Cruelty
				{ 27, 120046 },	-- Primal Aspirant's Drape of Cruelty
				{ 28, 120047 },	-- Primal Aspirant's Drape of Meditation
			},
		},
		{
			name = AL["Rings"],
			[ALLIANCE_DIFF] = {
				{ 1, 115665, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Contemplation
				{ 2, 115661, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Cruelty
				{ 3, 115664, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Meditation
				{ 4, 115662, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Prowess
				{ 5, 115663, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Victory
				{ 7, 115608, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Ring of Cruelty
				{ 8, 115609, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Ring of Prowess
				{ 9, 115771, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Ring of Prowess
				{ 11, 115747, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Accuracy
				{ 12, 115772, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Accuracy
				{ 13, 115746, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Cruelty
				{ 14, 120104, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Endurance
				{ 16, 115081, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Contemplation
				{ 17, 115077, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Cruelty
				{ 18, 115080, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Meditation
				{ 19, 115078, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Prowess
				{ 20, 115079, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Victory
				{ 21, 115036, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Ring of Cruelty
				{ 22, 115037, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Ring of Prowess
				{ 23, 115171, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Ring of Prowess
				{ 24, 115147, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Signet of Accuracy
				{ 25, 115172, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Signet of Accuracy
				{ 26, 115146, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Signet of Cruelty
				{ 101, 115216 },	-- Primal Aspirant's Band of Contemplation
				{ 102, 115213 },	-- Primal Aspirant's Band of Cruelty
				{ 103, 115215 },	-- Primal Aspirant's Band of Meditation
				{ 104, 115214 },	-- Primal Aspirant's Band of Prowess
				{ 105, 115192 },	-- Primal Aspirant's Ring of Cruelty
				{ 106, 115193 },	-- Primal Aspirant's Ring of Prowess
				{ 107, 115257 },	-- Primal Aspirant's Signet of Cruelty
			},
			[HORDE_DIFF] = {
				{ 1, 111138, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Contemplation
				{ 2, 111134, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Cruelty
				{ 3, 111137, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Meditation
				{ 4, 111135, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Prowess
				{ 5, 111136, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Band of Victory
				{ 7, 111081, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Ring of Cruelty
				{ 8, 111082, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Ring of Prowess
				{ 9, 111271, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Ring of Prowess
				{ 11, 111220, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Accuracy
				{ 12, 111272, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Accuracy
				{ 13, 111219, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Cruelty
				{ 14, 120103, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Signet of Endurance
				{ 16, 119864, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Contemplation
				{ 17, 119860, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Cruelty
				{ 18, 119863, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Meditation
				{ 19, 119861, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Prowess
				{ 20, 119862, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Band of Victory
				{ 21, 119826, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Ring of Cruelty
				{ 22, 119827, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Ring of Prowess
				{ 23, 119948, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Ring of Prowess
				{ 24, 119924, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Signet of Accuracy
				{ 25, 119949, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Signet of Accuracy
				{ 26, 119923, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Signet of Cruelty
				{ 101, 119993 },	-- Primal Aspirant's Band of Contemplation
				{ 102, 119990 },	-- Primal Aspirant's Band of Cruelty
				{ 103, 119992 },	-- Primal Aspirant's Band of Meditation
				{ 104, 119991 },	-- Primal Aspirant's Band of Prowess
				{ 105, 119969 },	-- Primal Aspirant's Ring of Cruelty
				{ 106, 119970 },	-- Primal Aspirant's Ring of Prowess
				{ 107, 120034 },	-- Primal Aspirant's Signet of Cruelty
			},
		},
		{
			name = AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				{ 1, 115496, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Adaptation
				{ 2, 115749, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Conquest
				{ 3, 115754, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Dominance
				{ 4, 115759, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Victory
				{ 5, 115751, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Emblem of Cruelty
				{ 6, 115753, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Emblem of Meditation
				{ 7, 115752, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Emblem of Tenacity
				{ 8, 115750, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Insignia of Conquest
				{ 9, 115755, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Insignia of Dominance
				{ 10, 115760, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Insignia of Victory
				{ 11, 115756, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Medallion of Cruelty
				{ 12, 115758, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Medallion of Meditation
				{ 13, 115757, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Medallion of Tenacity
				{ 16, 115521, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Adaptation
				{ 17, 115149, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Conquest
				{ 18, 115154, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Dominance
				{ 19, 115159, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Victory
				{ 20, 115151, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Emblem of Cruelty
				{ 21, 115153, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Emblem of Meditation
				{ 22, 115152, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Emblem of Tenacity
				{ 23, 115150, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Insignia of Conquest
				{ 24, 115155, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Insignia of Dominance
				{ 25, 115160, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Insignia of Victory
				{ 26, 115156, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Medallion of Cruelty
				{ 27, 115158, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Medallion of Meditation
				{ 28, 115157, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Medallion of Tenacity
			},
			[HORDE_DIFF] = {
				{ 1, 115495, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Adaptation
				{ 2, 111222, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Conquest
				{ 3, 111222, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Dominance
				{ 4, 111232, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Badge of Victory
				{ 5, 111224, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Emblem of Cruelty
				{ 6, 111226, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Emblem of Meditation
				{ 7, 111225, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Emblem of Tenacity
				{ 8, 111223, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Insignia of Conquest
				{ 9, 111228, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Insignia of Dominance
				{ 10, 111233, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Insignia of Victory
				{ 11, 111229, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Medallion of Cruelty
				{ 12, 111231, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Medallion of Meditation
				{ 13, 111230, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Medallion of Tenacity
				{ 16, 120049, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Adaptation
				{ 17, 119926, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Conquest
				{ 18, 119931, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Dominance
				{ 19, 119936, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Badge of Victory
				{ 20, 119928, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Emblem of Cruelty
				{ 21, 119930, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Emblem of Meditation
				{ 22, 119929, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Emblem of Tenacity
				{ 23, 119927, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Insignia of Conquest
				{ 24, 119932, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Insignia of Dominance
				{ 25, 119937, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Insignia of Victory
				{ 26, 119933, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Medallion of Cruelty
				{ 27, 119935, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Medallion of Meditation
				{ 28, 119934, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Medallion of Tenacity
			},
		},
		{
			name = AL["Miscellaneous"],
			[ALLIANCE_DIFF] = {
				{ 1, 115979, [PRICE_EXTRA_ITTYPE] = "conquest:1000" },	-- Primal Gladiator's Greatcloak (r2600)
				{ 3, 115972, [PRICE_EXTRA_ITTYPE] = "conquest:1000" },	-- Primal Gladiator's Tabard (r2600)
				{ 16, 115976, [PRICE_EXTRA_ITTYPE] = "112160:1:conquest:500" },	-- Enchant Weapon - Glory of the Blackrock (r2400)
				{ 17, 115978, [PRICE_EXTRA_ITTYPE] = "112165:1:conquest:500" },	-- Enchant Weapon - Glory of the Frostwolf (r2400)
				{ 18, 115975, [PRICE_EXTRA_ITTYPE] = "112115:1:conquest:500" },	-- Enchant Weapon - Glory of the Shadowmoon (r2400)
				{ 19, 115973, [PRICE_EXTRA_ITTYPE] = "110682:1:conquest:500" },	-- Enchant Weapon - Glory of the Thunderlord (r2400)
				{ 20, 115977, [PRICE_EXTRA_ITTYPE] = "112164:1:conquest:500" },	-- Enchant Weapon - Glory of the Warsong (r2400)
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}

data["WODS1WEAPONS"] = {
	name = string.format(AL["Warlords Season %d"], 1).." "..AL["Weapons"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["ilvl %d"], 660).." "..AL["Elite"],
			[ALLIANCE_DIFF] = {
				{ 1, 115949, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Render (r2000)
				{ 2, 115948, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ripper (r2000)
				{ 4, 115832, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Spellblade (r2000)
				{ 5, 115947, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Shanker (r2000)
				{ 7, 115950, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Mageblade (r2000)
				{ 8, 115822, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Quickblade (r2000)
				{ 9, 115954, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Slicer (r2000)
				{ 11, 115820, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cleaver (r2000)
				{ 12, 115952, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Hacker (r2000)
				{ 16, 115953, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Bonecracker (r2000)
				{ 17, 115863, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Gavel (r2000)
				{ 18, 115821, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pummeler (r2000)
				{ 20, 115819, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Greatsword (r2000)
				{ 21, 115817, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Decapitator (r2000)
				{ 22, 115818, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Bonegrinder (r2000)
				{ 24, 115910, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Pike (r2000)
				{ 26, 115833, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Battle Staff (r2000)
				{ 27, 115865, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Energy Staff (r2000)
				{ 101, 115831, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Barrier (r2000)
				{ 102, 115864, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Redoubt (r2000)
				{ 103, 115955, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Shield Wall (r2000)
				{ 105, 115836, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Heavy Crossbow (r2000)
				{ 106, 115823, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Longbow (r2000)
				{ 107, 115862, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Rifle (r2000)
				{ 116, 115951, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Baton of Light (r2000)
				{ 117, 115835, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Touch of Defeat (r2000)
				{ 119, 115834, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Reprieve (r2000)
				{ 120, 115830, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Endgame (r2000)
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = string.format(AL["ilvl %d"], 660).." (690)",
			[ALLIANCE_DIFF] = {
				{ 1, 115726, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Render
				{ 2, 115596, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ripper
				{ 4, 115644, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Spellblade
				{ 5, 115595, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Shanker
				{ 7, 115646, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Mageblade
				{ 8, 115598, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Quickblade
				{ 9, 115728, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Slicer
				{ 11, 115594, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cleaver
				{ 12, 115725, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Hacker
				{ 16, 115727, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Bonecracker
				{ 17, 115645, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Gavel
				{ 18, 115597, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pummeler
				{ 20, 115731, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Greatsword
				{ 21, 115729, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Decapitator
				{ 22, 115730, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Bonegrinder
				{ 24, 115602, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Pike
				{ 26, 115649, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Battle Staff
				{ 27, 115650, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Energy Staff
				{ 101, 115667, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Barrier
				{ 102, 115666, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Redoubt
				{ 103, 115748, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Shield Wall
				{ 105, 115600, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Heavy Crossbow
				{ 106, 115599, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Longbow
				{ 107, 115601, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Rifle
				{ 116, 115647, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Baton of Light
				{ 117, 115648, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Touch of Defeat
				{ 119, 115660, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Reprieve
				{ 120, 115659, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Endgame
			},
			[HORDE_DIFF] = {
				{ 1, 111199, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Render
				{ 2, 111069, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Ripper
				{ 4, 111117, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Spellblade
				{ 5, 111068, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Shanker
				{ 7, 111119, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Mageblade
				{ 8, 111071, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Quickblade
				{ 9, 111201, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Slicer
				{ 11, 111067, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Cleaver
				{ 12, 111198, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Hacker
				{ 16, 111200, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Bonecracker
				{ 17, 111118, [PRICE_EXTRA_ITTYPE] = "conquest:2250" },	-- Primal Gladiator's Gavel
				{ 18, 111070, [PRICE_EXTRA_ITTYPE] = "conquest:1750" },	-- Primal Gladiator's Pummeler
				{ 20, 111204, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Greatsword
				{ 21, 111202, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Decapitator
				{ 22, 111203, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Bonegrinder
				{ 24, 111075, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Pike
				{ 26, 111122, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Battle Staff
				{ 27, 111123, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Energy Staff
				{ 101, 111140, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Barrier
				{ 102, 111139, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Redoubt
				{ 103, 111221, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Shield Wall
				{ 105, 111073, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Heavy Crossbow
				{ 106, 111072, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Longbow
				{ 107, 111074, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Rifle
				{ 116, 111120, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Baton of Light
				{ 117, 111121, [PRICE_EXTRA_ITTYPE] = "conquest:3500" },	-- Primal Gladiator's Touch of Defeat
				{ 119, 111133, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Reprieve
				{ 120, 111132, [PRICE_EXTRA_ITTYPE] = "conquest:1250" },	-- Primal Gladiator's Endgame
			},
		},
		{
			name = string.format(AL["ilvl %d"], 620).." (675)",
			[ALLIANCE_DIFF] = {
				{ 1, 120071, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Render
				{ 2, 120055, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ripper
				{ 4, 120063, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Spellblade
				{ 5, 120054, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Shanker
				{ 7, 120065, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Mageblade
				{ 8, 120057, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Quickblade
				{ 9, 120073, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Slicer
				{ 11, 120053, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Cleaver
				{ 12, 120070, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Hacker
				{ 16, 120072, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Bonecracker
				{ 17, 120064, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Gavel
				{ 18, 120056, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Pummeler
				{ 20, 120076, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Greatsword
				{ 21, 120074, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Decapitator
				{ 22, 120075, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Bonegrinder
				{ 24, 120061, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Pike
				{ 26, 120068, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Battle Staff
				{ 27, 120069, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Energy Staff
				{ 28, 120062, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Staff
				{ 101, 115083, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Barrier
				{ 102, 115082, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Redoubt
				{ 103, 115148, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Shield Wall
				{ 105, 120059, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Heavy Crossbow
				{ 106, 120058, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Longbow
				{ 107, 120060, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Rifle
				{ 116, 120066, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Baton of Light
				{ 117, 120067, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Touch of Defeat
				{ 119, 115076, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Reprieve
				{ 120, 115075, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Endgame
			},
			[HORDE_DIFF] = {
				{ 1, 115133, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Render
				{ 2, 115026, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Ripper
				{ 4, 115064, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Spellblade
				{ 5, 115025, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Shanker
				{ 7, 115066, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Mageblade
				{ 8, 115028, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Quickblade
				{ 9, 115135, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Slicer
				{ 11, 115024, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Cleaver
				{ 12, 115132, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Hacker
				{ 16, 115134, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Bonecracker
				{ 17, 115065, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Primal Combatant's Gavel
				{ 18, 115027, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Primal Combatant's Pummeler
				{ 20, 115138, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Greatsword
				{ 21, 115136, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Decapitator
				{ 22, 115137, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Bonegrinder
				{ 24, 115032, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Pike
				{ 26, 115069, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Battle Staff
				{ 27, 115070, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Energy Staff
				{ 28, 115033, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Staff
				{ 101, 119866, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Barrier
				{ 102, 119865, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Redoubt
				{ 103, 119925, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Shield Wall
				{ 105, 115030, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Heavy Crossbow
				{ 106, 115029, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Longbow
				{ 107, 115031, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Rifle
				{ 116, 115067, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Baton of Light
				{ 117, 115068, [PRICE_EXTRA_ITTYPE] = "honor:3500" },	-- Primal Combatant's Touch of Defeat
				{ 119, 119859, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Reprieve
				{ 120, 119858, [PRICE_EXTRA_ITTYPE] = "honor:1250" },	-- Primal Combatant's Endgame
			},
		},
	},
}
-- Mists of Pandaria Season 15
data["MOPS15SETS"] = {
	name = string.format(AL["Season %d"], 15).." "..AL["Class Sets"].." ("..AL["Mists of Pandaria"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 102713, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dreadplate Helm
				{ 2, 102652, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Dreadplate Shoulders
				{ 3, 102676, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dreadplate Chestpiece
				{ 4, 102650, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Dreadplate Gauntlets
				{ 5, 102651, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dreadplate Legguards
				{ 16, 103181, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Helm
				{ 17, 103183, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dreadplate Shoulders
				{ 18, 103179, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Chestpiece
				{ 19, 103180, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dreadplate Gauntlets
				{ 20, 103182, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 103378, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Helm
				{ 2, 103380, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dreadplate Shoulders
				{ 3, 103376, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Chestpiece
				{ 4, 103377, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dreadplate Gauntlets
				{ 5, 103379, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Legguards
				{ 16, 102910, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Helm
				{ 17, 102849, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dreadplate Shoulders
				{ 18, 102873, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Chestpiece
				{ 19, 102847, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dreadplate Gauntlets
				{ 20, 102848, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dreadplate Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				-- Moonkin, 550 > 522
				{ 1, 102634, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Wyrmhide Helm
				{ 2, 102700, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Wyrmhide Spaulders
				{ 3, 102614, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Wyrmhide Robes
				{ 4, 102696, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Wyrmhide Gloves
				{ 5, 102767, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Wyrmhide Legguards
				{ 16, 103202, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Wyrmhide Helm
				{ 17, 103205, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Wyrmhide Spaulders
				{ 18, 103204, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Wyrmhide Robes
				{ 19, 103201, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Wyrmhide Gloves
				{ 20, 103203, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Wyrmhide Legguards
				-- Cat/Bear, 550 > 522
				{ 7, 102653, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dragonhide Helm
				{ 8, 102741, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Dragonhide Spaulders
				{ 9, 102740, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dragonhide Robes
				{ 10, 102739, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Dragonhide Gloves
				{ 11, 102654, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dragonhide Legguards
				{ 22, 103185, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dragonhide Helm
				{ 23, 103188, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dragonhide Spaulders
				{ 24, 103187, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dragonhide Robes
				{ 25, 103184, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dragonhide Gloves
				{ 26, 103186, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dragonhide Legguards
				-- Heal, 550 > 522
				{ 101, 102776, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Kodohide Helm
				{ 102, 102658, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Kodohide Spaulders
				{ 103, 102721, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Kodohide Robes
				{ 104, 102657, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Kodohide Gloves
				{ 105, 102761, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Kodohide Legguards
				{ 116, 103193, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Kodohide Helm
				{ 117, 103196, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Kodohide Spaulders
				{ 118, 103195, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Kodohide Robes
				{ 119, 103192, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Kodohide Gloves
				{ 120, 103194, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Kodohide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Moonkin, 550 > 522
				{ 1, 103399, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Wyrmhide Helm
				{ 2, 103402, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Wyrmhide Spaulders
				{ 3, 103401, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Wyrmhide Robes
				{ 4, 103398, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Wyrmhide Gloves
				{ 5, 103400, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Wyrmhide Legguards
				{ 16, 102831, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Wyrmhide Helm
				{ 17, 102897, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Wyrmhide Spaulders
				{ 18, 102811, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Wyrmhide Robes
				{ 19, 102893, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Wyrmhide Gloves
				{ 20, 102964, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Wyrmhide Legguards
				-- Cat/Bear, 550 > 522
				{ 7, 103382, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dragonhide Helm
				{ 8, 103385, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Dragonhide Spaulders
				{ 9, 103384, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dragonhide Robes
				{ 10, 103381, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Dragonhide Gloves
				{ 11, 103383, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Dragonhide Legguards
				{ 22, 102850, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dragonhide Helm
				{ 23, 102938, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dragonhide Spaulders
				{ 24, 102937, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dragonhide Robes
				{ 25, 102936, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Dragonhide Gloves
				{ 26, 102851, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Dragonhide Legguards
				-- Heal, 550 > 522
				{ 101, 103390, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Kodohide Helm
				{ 102, 103393, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Kodohide Spaulders
				{ 103, 103392, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Kodohide Robes
				{ 104, 103389, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Kodohide Gloves
				{ 105, 103391, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Kodohide Legguards
				{ 116, 102973, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Kodohide Helm
				{ 117, 102855, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Kodohide Spaulders
				{ 118, 102918, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Kodohide Robes
				{ 119, 102854, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Kodohide Gloves
				{ 120, 102958, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Kodohide Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 102690, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Chain Helm
				{ 2, 102734, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Chain Spaulders
				{ 3, 102689, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Chain Armor
				{ 4, 102737, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Chain Gauntlets
				{ 5, 102670, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Chain Leggings
				{ 16, 103221, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Chain Helm
				{ 17, 103223, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Chain Spaulders
				{ 18, 103219, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Chain Armor
				{ 19, 103220, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Chain Gauntlets
				{ 20, 103222, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 103418, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Chain Helm
				{ 2, 103420, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Chain Spaulders
				{ 3, 103416, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Chain Armor
				{ 4, 103417, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Chain Gauntlets
				{ 5, 103419, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Chain Leggings
				{ 16, 102887, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Chain Helm
				{ 17, 102931, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Chain Spaulders
				{ 18, 102886, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Chain Armor
				{ 19, 102934, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Chain Gauntlets
				{ 20, 102867, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Chain Leggings
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 102667, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Silk Cowl
				{ 2, 102673, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Silk Amice
				{ 3, 102715, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Silk Robe
				{ 4, 102735, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Silk Handguards
				{ 5, 102648, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Silk Trousers
				{ 16, 103225, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Silk Cowl
				{ 17, 103228, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Silk Amice
				{ 18, 103227, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Silk Robe
				{ 19, 103224, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Silk Handguards
				{ 20, 103226, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 103422, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Silk Cowl
				{ 2, 103425, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Silk Amice
				{ 3, 103424, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Silk Robe
				{ 4, 103421, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Silk Handguards
				{ 5, 103423, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Silk Trousers
				{ 16, 102864, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Silk Cowl
				{ 17, 102870, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Silk Amice
				{ 18, 102912, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Silk Robe
				{ 19, 102932, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Silk Handguards
				{ 20, 102845, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Silk Trousers
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
			[ALLIANCE_DIFF] = {
				-- Windwalker, 550 > 522
				{ 1, 102712, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ironskin Helm
				{ 2, 102626, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ironskin Spaulders
				{ 3, 102720, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ironskin Tunic
				{ 4, 102675, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ironskin Gloves
				{ 5, 102656, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ironskin Legguards
				{ 16, 103233, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ironskin Helm
				{ 17, 103235, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ironskin Spaulders
				{ 18, 103236, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ironskin Tunic
				{ 19, 103232, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ironskin Gloves
				{ 20, 103234, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ironskin Legguards
				-- Mistweaver, 550 > 522
				{ 7, 102628, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Copperskin Helm
				{ 8, 102777, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Copperskin Spaulders
				{ 9, 102763, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Copperskin Tunic
				{ 10, 102627, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Copperskin Gloves
				{ 11, 102762, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Copperskin Legguards
				{ 22, 103238, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Copperskin Helm
				{ 23, 103240, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Copperskin Spaulders
				{ 24, 103241, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Copperskin Tunic
				{ 25, 103237, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Copperskin Gloves
				{ 26, 103239, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Copperskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Windwalker, 550 > 522
				{ 1, 103430, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ironskin Helm
				{ 2, 103432, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ironskin Spaulders
				{ 3, 103433, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ironskin Tunic
				{ 4, 103429, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ironskin Gloves
				{ 5, 103431, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ironskin Legguards
				{ 16, 102909, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ironskin Helm
				{ 17, 102823, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ironskin Spaulders
				{ 18, 102917, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ironskin Tunic
				{ 19, 102872, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ironskin Gloves
				{ 20, 102853, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ironskin Legguards
				-- Mistweaver, 550 > 522
				{ 7, 103435, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Copperskin Helm
				{ 8, 103437, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Copperskin Spaulders
				{ 9, 103438, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Copperskin Tunic
				{ 10, 103434, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Copperskin Gloves
				{ 11, 103436, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Copperskin Legguards
				{ 22, 102825, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Copperskin Helm
				{ 23, 102974, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Copperskin Spaulders
				{ 24, 102960, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Copperskin Tunic
				{ 25, 102824, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Copperskin Gloves
				{ 26, 102959, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Copperskin Legguards
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				-- Retribution, 550 > 522
				{ 1, 102779, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Scaled Helm
				{ 2, 102744, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Scaled Spaulders
				{ 3, 102747, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Scaled Chestguard
				{ 4, 102630, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Scaled Gloves
				{ 5, 102780, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Scaled Legguards
				{ 16, 103244, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Scaled Helm
				{ 17, 103246, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Scaled Spaulders
				{ 18, 103242, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Scaled Chestguard
				{ 19, 103243, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Scaled Gloves
				{ 20, 103245, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Scaled Legguards
				-- Holy, 550 > 522
				{ 7, 102635, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ornamented Helm
				{ 8, 102697, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ornamented Spaulders
				{ 9, 102632, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ornamented Chestguard
				{ 10, 102722, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ornamented Gloves
				{ 11, 102768, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ornamented Legguards
				{ 22, 103255, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ornamented Helm
				{ 23, 103257, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ornamented Spaulders
				{ 24, 103253, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ornamented Chestguard
				{ 25, 103254, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ornamented Gloves
				{ 26, 103256, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ornamented Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				-- Retribution, 550 > 522
				{ 1, 103441, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Scaled Helm
				{ 2, 103443, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Scaled Spaulders
				{ 3, 103439, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Scaled Chestguard
				{ 4, 103440, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Scaled Gloves
				{ 5, 103442, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Scaled Legguards
				{ 16, 102976, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Scaled Helm
				{ 17, 102941, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Scaled Spaulders
				{ 18, 102944, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Scaled Chestguard
				{ 19, 102827, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Scaled Gloves
				{ 20, 102977, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Scaled Legguards
				-- Holy, 550 > 522
				{ 7, 103452, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ornamented Helm
				{ 8, 103454, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ornamented Spaulders
				{ 9, 103450, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ornamented Chestguard
				{ 10, 103451, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Prideful Gladiator's Ornamented Gloves
				{ 11, 103453, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Prideful Gladiator's Ornamented Legguards
				{ 22, 102832, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ornamented Helm
				{ 23, 102894, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ornamented Spaulders
				{ 24, 102829, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ornamented Chestguard
				{ 25, 102919, [PRICE_EXTRA_ITTYPE] = "honor:1750" },	-- Grievous Gladiator's Ornamented Gloves
				{ 26, 102965, [PRICE_EXTRA_ITTYPE] = "honor:2250" },	-- Grievous Gladiator's Ornamented Legguards
			},
		},
	},
}
-- Classic Season 13
data["CLASSICS13SETS"] = {
	name = string.format(AL["Season %d"], 13).." "..AL["Class Sets"].." ("..AL["Mists of Pandaria"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 91151 }, -- Tyrannical Gladiator's Dreadplate Helm
				{ 2, 91155 }, -- Tyrannical Gladiator's Dreadplate Shoulders
				{ 3, 91147 }, -- Tyrannical Gladiator's Dreadplate Chestpiece
				{ 4, 91149 }, -- Tyrannical Gladiator's Dreadplate Gauntlets
				{ 5, 91153 }, -- Tyrannical Gladiator's Dreadplate Legguards
				{ 16, 91504, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Dreadplate Helm
				{ 17, 91508, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Dreadplate Shoulders
				{ 18, 91500, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Dreadplate Chestpiece
				{ 19, 91502, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Dreadplate Gauntlets
				{ 20, 91506, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Dreadplate Legguards
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
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
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
				{ 101, 91512, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Dragonhide Helm
				{ 102, 91518, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Dragonhide Spaulders
				{ 103, 91516, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Dragonhide Robes
				{ 104, 91510, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Dragonhide Gloves
				{ 105, 91514, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Dragonhide Legguards
				{ 107, 91527, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Kodohide Helm
				{ 108, 91533, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Kodohide Spaulders
				{ 109, 91531, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Kodohide Robes
				{ 110, 91525, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Kodohide Gloves
				{ 111, 91529, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Kodohide Legguards
				{ 116, 91544, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Wyrmhide Helm
				{ 117, 91550, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Wyrmhide Spaulders
				{ 118, 91548, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Wyrmhide Robes
				{ 119, 91542, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Wyrmhide Gloves
				{ 120, 91546, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Wyrmhide Legguards
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
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 91226 }, -- Tyrannical Gladiator's Chain Helm
				{ 2, 91230 }, -- Tyrannical Gladiator's Chain Spaulders
				{ 3, 91222 }, -- Tyrannical Gladiator's Chain Armor
				{ 4, 91224 }, -- Tyrannical Gladiator's Chain Gauntlets
				{ 5, 91228 }, -- Tyrannical Gladiator's Chain Leggings
				{ 16, 91579, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Chain Helm
				{ 17, 91583, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Chain Spaulders
				{ 18, 91575, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Chain Armor
				{ 19, 91577, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Chain Gauntlets
				{ 20, 91581, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Chain Leggings
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
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 91234 }, -- Tyrannical Gladiator's Silk Cowl
				{ 2, 91240 }, -- Tyrannical Gladiator's Silk Amice
				{ 3, 91238 }, -- Tyrannical Gladiator's Silk Robe
				{ 4, 91232 }, -- Tyrannical Gladiator's Silk Handguards
				{ 5, 91236 }, -- Tyrannical Gladiator's Silk Trousers
				{ 16, 91587, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Silk Cowl
				{ 17, 91593, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Silk Amice
				{ 18, 91591, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Silk Robe
				{ 19, 91585, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Silk Handguards
				{ 20, 91589, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Silk Trousers
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
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
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
				{ 7, 91612, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Copperskin Helm
				{ 8, 91616, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Copperskin Spaulders
				{ 9, 91618, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Copperskin Tunic
				{ 10, 91610, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Copperskin Gloves
				{ 11, 91614, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Copperskin Legguards
				{ 22, 91602, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ironskin Helm
				{ 23, 91606, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Ironskin Spaulders
				{ 24, 91608, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ironskin Tunic
				{ 25, 91600, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Ironskin Gloves
				{ 26, 91604, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ironskin Legguards
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
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
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
				{ 7, 91644, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ornamented Headcover
				{ 8, 91648, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Ornamented Spaulders
				{ 9, 91640, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ornamented Chestguard
				{ 10, 91642, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Ornamented Gloves
				{ 11, 91646, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ornamented Legplates
				{ 22, 91624, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Scaled Helm
				{ 23, 91628, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Scaled Shoulders
				{ 24, 91620, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Scaled Chestpiece
				{ 25, 91622, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Scaled Gauntlets
				{ 26, 91626, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Scaled Legguards
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
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
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
				{ 7, 91664, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Mooncloth Helm
				{ 8, 91670, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Mooncloth Mantle
				{ 9, 91668, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Mooncloth Robe
				{ 10, 91662, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Mooncloth Gloves
				{ 11, 91666, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Mooncloth Leggings
				{ 22, 91674, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Satin Hood
				{ 23, 91680, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Satin Mantle
				{ 24, 91678, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Satin Robe
				{ 25, 91672, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Satin Gloves
				{ 26, 91676, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Satin Leggings
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
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 91344 }, -- Tyrannical Gladiator's Leather Helm
				{ 2, 91348 }, -- Tyrannical Gladiator's Leather Spaulders
				{ 3, 91340 }, -- Tyrannical Gladiator's Leather Tunic
				{ 4, 91342 }, -- Tyrannical Gladiator's Leather Gloves
				{ 5, 91346 }, -- Tyrannical Gladiator's Leather Legguards
				{ 16, 91697, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Leather Helm
				{ 17, 91701, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Leather Spaulders
				{ 18, 91693, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Leather Tunic
				{ 19, 91695, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Leather Gloves
				{ 20, 91699, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Leather Legguards
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
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
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
				{ 101, 91725, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Linked Helm
				{ 102, 91729, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Linked Spaulders
				{ 103, 91721, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Linked Armor
				{ 104, 91723, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Linked Gauntlets
				{ 105, 91727, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Linked Leggings
				{ 107, 91737, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Mail Helm
				{ 108, 91741, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Mail Spaulders
				{ 109, 91733, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Mail Armor
				{ 110, 91735, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Mail Gauntlets
				{ 111, 91739, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Mail Leggings
				{ 116, 91715, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ringmail Helm
				{ 117, 91719, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Ringmail Spaulders
				{ 118, 91711, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ringmail Armor
				{ 119, 91713, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Ringmail Gauntlets
				{ 120, 91717, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Ringmail Leggings
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 91422 }, -- Tyrannical Gladiator's Felweave Cowl
				{ 2, 91428 }, -- Tyrannical Gladiator's Felweave Amice
				{ 3, 91426 }, -- Tyrannical Gladiator's Felweave Raiment
				{ 4, 91420 }, -- Tyrannical Gladiator's Felweave Handguards
				{ 5, 91424 }, -- Tyrannical Gladiator's Felweave Trousers
				{ 16, 91775, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Felweave Cowl
				{ 17, 91781, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Felweave Amice
				{ 18, 91779, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Felweave Raiment
				{ 19, 91773, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Felweave Handguards
				{ 20, 91777, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Felweave Trousers
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 91434 }, -- Tyrannical Gladiator's Plate Helm
				{ 2, 91438 }, -- Tyrannical Gladiator's Plate Shoulders
				{ 3, 91430 }, -- Tyrannical Gladiator's Plate Chestpiece
				{ 4, 91432 }, -- Tyrannical Gladiator's Plate Gauntlets
				{ 5, 91436 }, -- Tyrannical Gladiator's Plate Legguards
				{ 16, 91787, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Plate Helm
				{ 17, 91791, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Plate Shoulders
				{ 18, 91783, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Plate Chestpiece
				{ 19, 91785, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Malevolent Gladiator's Plate Gauntlets
				{ 20, 91789, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Malevolent Gladiator's Plate Legguards
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
	name = string.format(AL["Season %d"], 12).." "..AL["Class Sets"].." ("..AL["Mists of Pandaria"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 84853 }, -- Malevolent Gladiator's Dreadplate Helm
				{ 2, 84918 }, -- Malevolent Gladiator's Dreadplate Shoulders
				{ 3, 84795 }, -- Malevolent Gladiator's Dreadplate Chestpiece
				{ 4, 84835 }, -- Malevolent Gladiator's Dreadplate Gauntlets
				{ 5, 84872 }, -- Malevolent Gladiator's Dreadplate Legguards
				{ 16, 84374, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Dreadplate Helm
				{ 17, 84376, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Dreadplate Shoulders
				{ 18, 84372, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Dreadplate Chestpiece
				{ 19, 84373, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Dreadplate Gauntlets
				{ 20, 84375, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
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
				{ 101, 84378, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Dragonhide Helm
				{ 102, 84381, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Dragonhide Spaulders
				{ 103, 84380, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Dragonhide Robes
				{ 104, 84377, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Dragonhide Gloves
				{ 105, 84379, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Dragonhide Legguards
				{ 107, 84386, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Kodohide Helm
				{ 109, 84389, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Kodohide Spaulders
				{ 110, 84388, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Kodohide Robes
				{ 111, 84385, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Kodohide Gloves
				{ 112, 84387, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Kodohide Legguards
				{ 116, 84394, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Wyrmhide Helm
				{ 117, 84397, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Wyrmhide Spaulders
				{ 118, 84396, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Wyrmhide Robes
				{ 119, 84393, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Wyrmhide Gloves
				{ 120, 84395, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 84858 }, -- Malevolent Gladiator's Chain Helm
				{ 2, 84921 }, -- Malevolent Gladiator's Chain Spaulders
				{ 3, 84796 }, -- Malevolent Gladiator's Chain Armor
				{ 4, 84841 }, -- Malevolent Gladiator's Chain Gauntlets
				{ 5, 84874 }, -- Malevolent Gladiator's Chain Leggings
				{ 16, 84410, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Chain Helm
				{ 17, 84412, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Chain Spaulders
				{ 18, 84408, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Chain Armor
				{ 19, 84409, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Chain Gauntlets
				{ 20, 84411, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 84855 }, -- Malevolent Gladiator's Silk Cowl
				{ 2, 84917 }, -- Malevolent Gladiator's Silk Amice
				{ 3, 84904 }, -- Malevolent Gladiator's Silk Robe
				{ 4, 84837 }, -- Malevolent Gladiator's Silk Handguards
				{ 5, 84875 }, -- Malevolent Gladiator's Silk Trousers
				{ 16, 84414, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Silk Cowl
				{ 17, 84417, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Silk Amice
				{ 18, 84416, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Silk Robe
				{ 19, 84413, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Silk Handguards
				{ 20, 84415, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MONK"],
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
				{ 16, 84549, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Copperskin Helm
				{ 17, 84552, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Copperskin Spaulders
				{ 18, 84551, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Copperskin Tunic
				{ 19, 84548, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Copperskin Gloves
				{ 20, 84550, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Copperskin Legguards
				{ 22, 84544, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ironskin Helm
				{ 23, 84547, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Ironskin Spaulders
				{ 24, 84546, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ironskin Tunic
				{ 25, 84543, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Ironskin Gloves
				{ 26, 84545, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ironskin Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
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
				{ 16, 84431, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ornamented Headcover
				{ 17, 84433, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Ornamented Spaulders
				{ 18, 84429, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ornamented Chestguard
				{ 19, 84430, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Ornamented Gloves
				{ 20, 84432, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ornamented Legplates
				{ 22, 84420, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Scaled Helm
				{ 23, 84422, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Scaled Shoulders
				{ 24, 84418, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Scaled Chestpiece
				{ 25, 84419, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Scaled Gauntlets
				{ 26, 84421, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
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
				{ 16, 84441, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Mooncloth Helm
				{ 17, 84444, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Mooncloth Mantle
				{ 18, 84443, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Mooncloth Robe
				{ 19, 84440, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Mooncloth Gloves
				{ 20, 84442, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Mooncloth Leggings
				{ 22, 84446, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Satin Hood
				{ 23, 84449, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Satin Mantle
				{ 24, 84448, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Satin Robe
				{ 25, 84445, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Satin Gloves
				{ 26, 84447, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 84848 }, -- Malevolent Gladiator's Leather Helm
				{ 2, 84913 }, -- Malevolent Gladiator's Leather Spaulders
				{ 3, 84792 }, -- Malevolent Gladiator's Leather Tunic
				{ 4, 84830 }, -- Malevolent Gladiator's Leather Gloves
				{ 5, 84868 }, -- Malevolent Gladiator's Leather Legguards
				{ 16, 84464, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Leather Helm
				{ 17, 84466, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Leather Spaulders
				{ 18, 84462, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Leather Tunic
				{ 19, 84463, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Leather Gloves
				{ 20, 84465, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
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
				{ 101, 84479, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Linked Helm
				{ 102, 84481, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Linked Spaulders
				{ 103, 84477, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Linked Armor
				{ 104, 84478, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Linked Gauntlets
				{ 205, 84480, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Linked Leggings
				{ 107, 84485, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Mail Helm
				{ 108, 84487, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Mail Spaulders
				{ 109, 84483, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Mail Armor
				{ 110, 84484, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Mail Gauntlets
				{ 111, 84486, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Mail Leggings
				{ 116, 84474, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ringmail Helm
				{ 117, 84476, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Ringmail Spaulders
				{ 118, 84472, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ringmail Armor
				{ 119, 84473, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Ringmail Gauntlets
				{ 120, 84475, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 84859 }, -- Malevolent Gladiator's Felweave Cowl
				{ 2, 84923 }, -- Malevolent Gladiator's Felweave Amice
				{ 3, 84905 }, -- Malevolent Gladiator's Felweave Raiment
				{ 4, 84842 }, -- Malevolent Gladiator's Felweave Handguards
				{ 5, 84878 }, -- Malevolent Gladiator's Felweave Trousers
				{ 16, 84500, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Felweave Cowl
				{ 17, 84503, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Felweave Amice
				{ 18, 84502, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Felweave Raiment
				{ 19, 84499, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Felweave Handguards
				{ 20, 84501, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 84856 }, -- Malevolent Gladiator's Plate Helm
				{ 2, 84922 }, -- Malevolent Gladiator's Plate Shoulders
				{ 3, 84797 }, -- Malevolent Gladiator's Plate Chestpiece
				{ 4, 84840 }, -- Malevolent Gladiator's Plate Gauntlets
				{ 5, 84876 }, -- Malevolent Gladiator's Plate Legguards
				{ 16, 84506, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Plate Helm
				{ 17, 84508, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Plate Shoulders
				{ 18, 84504, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Plate Chestpiece
				{ 19, 84505, [PRICE_EXTRA_ITTYPE] = "honor:1750" }, -- Dreadful Gladiator's Plate Gauntlets
				{ 20, 84507, [PRICE_EXTRA_ITTYPE] = "honor:2250" }, -- Dreadful Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 11
data["CLASSICS11SETS"] = {
	name = string.format(AL["Season %d"], 11).." "..AL["Class Sets"].." ("..AL["Cataclysm"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 73618, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Dreadplate Helm
				{ 2, 73616, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Dreadplate Shoulders
				{ 3, 73620, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Dreadplate Chestpiece
				{ 4, 73619, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Dreadplate Gauntlets
				{ 5, 73617, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Dreadplate Legguards
				{ 16, 72334, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dreadplate Helm
				{ 17, 72336, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dreadplate Shoulders
				{ 18, 72332, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dreadplate Chestpiece
				{ 19, 72333, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dreadplate Gauntlets
				{ 20, 72335, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 73614, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Dragonhide Helm
				{ 2, 73611, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Dragonhide Spaulders
				{ 3, 73612, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Dragonhide Robes
				{ 4, 73615, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Dragonhide Gloves
				{ 5, 73613, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Dragonhide Legguards
				{ 7, 73606, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Kodohide Helm
				{ 8, 73603, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Kodohide Spaulders
				{ 9, 73604, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Kodohide Robes
				{ 10, 73607, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Kodohide Gloves
				{ 11, 73605, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Kodohide Legguards
				{ 16, 73598, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Wyrmhide Helm
				{ 17, 73595, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Wyrmhide Spaulders
				{ 18, 73596, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Wyrmhide Robes
				{ 19, 73599, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Wyrmhide Gloves
				{ 20, 73597, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Wyrmhide Legguards
				{ 22, 72338, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dragonhide Helm
				{ 23, 72341, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dragonhide Spaulders
				{ 24, 72340, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dragonhide Robes
				{ 25, 72337, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dragonhide Gloves
				{ 26, 72339, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dragonhide Legguards
				{ 27, 72346, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Kodohide Helm
				{ 101, 72349, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Kodohide Spaulders
				{ 102, 72348, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Kodohide Robes
				{ 103, 72345, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Kodohide Gloves
				{ 104, 72347, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Kodohide Legguards
				{ 116, 72354, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Wyrmhide Helm
				{ 117, 72357, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Wyrmhide Spaulders
				{ 118, 72356, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Wyrmhide Robes
				{ 119, 72353, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Wyrmhide Gloves
				{ 120, 72355, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 73582, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Chain Helm
				{ 2, 73580, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Chain Spaulders
				{ 3, 73584, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Chain Armor
				{ 4, 73583, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Chain Gauntlets
				{ 5, 73581, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Chain Leggings
				{ 16, 72370, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Chain Helm
				{ 17, 72372, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Chain Spaulders
				{ 18, 72368, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Chain Armor
				{ 19, 72369, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Chain Gauntlets
				{ 20, 72371, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 73575, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Silk Cowl
				{ 2, 73572, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Silk Amice
				{ 3, 73573, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Silk Robe
				{ 4, 73576, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Silk Handguards
				{ 5, 73574, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Silk Trousers
				{ 16, 72374, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Silk Cowl
				{ 17, 72377, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Silk Amice
				{ 18, 72376, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Silk Robe
				{ 19, 72373, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Silk Handguards
				{ 20, 72375, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 73558, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ornamented Headcover
				{ 2, 73556, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Ornamented Spaulders
				{ 3, 73560, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ornamented Chestguard
				{ 3, 88170, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ornamented Battlerobe
				{ 4, 73559, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Ornamented Gloves
				{ 5, 73557, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ornamented Legplates
				{ 7, 73569, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Scaled Helm
				{ 8, 73567, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Scaled Shoulders
				{ 9, 73571, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Scaled Chestpiece
				{ 10, 73570, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Scaled Gauntlets
				{ 11, 73568, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Scaled Legguards
				{ 16, 72391, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ornamented Headcover
				{ 17, 72393, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ornamented Spaulders
				{ 18, 72389, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ornamented Chestguard
				{ 19, 72390, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ornamented Gloves
				{ 20, 72392, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ornamented Legplates
				{ 22, 72380, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Scaled Helm
				{ 23, 72382, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Scaled Shoulders
				{ 24, 72378, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Scaled Chestpiece
				{ 25, 72379, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Scaled Gauntlets
				{ 26, 72381, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 73548, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Mooncloth Helm
				{ 2, 73545, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Mooncloth Mantle
				{ 3, 73546, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Mooncloth Robe
				{ 4, 73549, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Mooncloth Gloves
				{ 5, 73547, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Mooncloth Leggings
				{ 7, 73543, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Satin Hood
				{ 8, 73540, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Satin Mantle
				{ 9, 73541, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Satin Robe
				{ 10, 73544, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Satin Gloves
				{ 11, 73542, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Satin Leggings
				{ 16, 72401, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mooncloth Helm
				{ 17, 72404, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mooncloth Mantle
				{ 18, 72403, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mooncloth Robe
				{ 19, 72400, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mooncloth Gloves
				{ 20, 72402, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mooncloth Leggings
				{ 22, 72406, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Satin Hood
				{ 23, 72409, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Satin Mantle
				{ 24, 72408, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Satin Robe
				{ 25, 72405, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Satin Gloves
				{ 26, 72407, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 73525, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Leather Helm
				{ 2, 73523, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Leather Spaulders
				{ 3, 73527, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Leather Tunic
				{ 4, 73526, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Leather Gloves
				{ 5, 73524, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Leather Legguards
				{ 16, 72424, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Leather Helm
				{ 17, 72426, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Leather Spaulders
				{ 18, 72422, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Leather Tunic
				{ 19, 72423, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Leather Gloves
				{ 20, 72425, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 73510, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Linked Helm
				{ 2, 73508, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Linked Spaulders
				{ 3, 73512, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Linked Armor
				{ 4, 73511, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Linked Gauntlets
				{ 5, 73509, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Linked Leggings
				{ 7, 73504, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Mail Helm
				{ 8, 73502, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Mail Spaulders
				{ 9, 73506, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Mail Armor
				{ 10, 73505, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Mail Gauntlets
				{ 11, 73503, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Mail Leggings
				{ 16, 73515, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ringmail Helm
				{ 17, 73513, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Ringmail Spaulders
				{ 18, 73517, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ringmail Armor
				{ 19, 73516, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Ringmail Gauntlets
				{ 20, 73514, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Ringmail Leggings
				{ 22, 72439, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Linked Helm
				{ 23, 72441, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Linked Spaulders
				{ 24, 72437, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Linked Armor
				{ 25, 72438, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Linked Gauntlets
				{ 26, 72440, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Linked Leggings
				{ 101, 72445, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mail Helm
				{ 102, 72447, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mail Spaulders
				{ 103, 72443, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mail Armor
				{ 104, 72444, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mail Gauntlets
				{ 105, 72446, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mail Leggings
				{ 116, 72434, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ringmail Helm
				{ 117, 72436, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ringmail Spaulders
				{ 118, 72432, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ringmail Armor
				{ 119, 72433, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ringmail Gauntlets
				{ 120, 72435, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 73486, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Felweave Cowl
				{ 2, 73483, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Felweave Amice
				{ 3, 73484, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Felweave Raiment
				{ 4, 73487, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Felweave Handguards
				{ 5, 73485, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Felweave Trousers
				{ 16, 72460, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Felweave Cowl
				{ 17, 72463, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Felweave Amice
				{ 18, 72462, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Felweave Raiment
				{ 19, 72459, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Felweave Handguards
				{ 20, 72461, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 73480, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Plate Helm
				{ 2, 73478, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Plate Shoulders
				{ 3, 73482, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Plate Chestpiece
				{ 4, 73481, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Cataclysmic Gladiator's Plate Gauntlets
				{ 5, 73479, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Cataclysmic Gladiator's Plate Legguards
				{ 16, 72466, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Plate Helm
				{ 17, 72468, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Plate Shoulders
				{ 18, 72464, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Plate Chestpiece
				{ 19, 72465, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Plate Gauntlets
				{ 20, 72467, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 10
data["CLASSICS10SETS"] = {
	name = string.format(AL["Season %d"], 10).." "..AL["Class Sets"].." ("..AL["Cataclysm"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 70246, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dreadplate Helm
				{ 2, 70248, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dreadplate Shoulders
				{ 3, 70244, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dreadplate Chestpiece
				{ 4, 70245, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dreadplate Gauntlets
				{ 5, 70247, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 70280, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dragonhide Helm
				{ 2, 70283, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dragonhide Spaulders
				{ 3, 70282, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dragonhide Robes
				{ 4, 70279, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Dragonhide Gloves
				{ 5, 70281, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Dragonhide Legguards
				{ 7, 70285, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Kodohide Helm
				{ 8, 70288, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Kodohide Spaulders
				{ 9, 70287, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Kodohide Robes
				{ 10, 70284, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Kodohide Gloves
				{ 11, 70286, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Kodohide Legguards
				{ 16, 70290, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Wyrmhide Helm
				{ 17, 70293, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Wyrmhide Spaulders
				{ 18, 70292, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Wyrmhide Robes
				{ 19, 70289, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Wyrmhide Gloves
				{ 20, 70291, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 70261, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Chain Helm
				{ 2, 70263, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Chain Spaulders
				{ 3, 70259, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Chain Armor
				{ 4, 70260, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Chain Gauntlets
				{ 5, 70262, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 70300, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Silk Cowl
				{ 2, 70303, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Silk Amice
				{ 3, 70302, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Silk Robe
				{ 4, 70299, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Silk Handguards
				{ 5, 70301, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 70355, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ornamented Headcover
				{ 2, 70357, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ornamented Spaulders
				{ 3, 70353, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ornamented Chestguard
				{ 4, 70354, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ornamented Gloves
				{ 5, 70356, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ornamented Legplates
				{ 16, 70251, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Scaled Helm
				{ 17, 70253, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Scaled Shoulders
				{ 18, 70249, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Scaled Chestpiece
				{ 19, 70250, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Scaled Gauntlets
				{ 20, 70252, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 70305, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mooncloth Helm
				{ 2, 70308, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mooncloth Mantle
				{ 3, 70307, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mooncloth Robe
				{ 4, 70304, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mooncloth Gloves
				{ 5, 70306, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mooncloth Leggings
				{ 16, 70310, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Satin Hood
				{ 17, 70313, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Satin Mantle
				{ 18, 70312, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Satin Robe
				{ 19, 70309, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Satin Gloves
				{ 20, 70311, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 70296, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Leather Helm
				{ 2, 70298, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Leather Spaulders
				{ 3, 70294, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Leather Tunic
				{ 4, 70295, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Leather Gloves
				{ 5, 70297, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 70271, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Linked Helm
				{ 2, 70273, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Linked Spaulders
				{ 3, 70269, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Linked Armor
				{ 4, 70270, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Linked Gauntlets
				{ 5, 70272, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Linked Leggings
				{ 7, 70276, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mail Helm
				{ 8, 70278, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mail Spaulders
				{ 9, 70274, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mail Armor
				{ 10, 70275, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Mail Gauntlets
				{ 11, 70277, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Mail Leggings
				{ 16, 70266, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ringmail Helm
				{ 17, 70268, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ringmail Spaulders
				{ 18, 70264, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ringmail Armor
				{ 19, 70265, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Ringmail Gauntlets
				{ 20, 70267, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 70315, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Felweave Cowl
				{ 2, 70318, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Felweave Amice
				{ 3, 70317, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Felweave Raiment
				{ 4, 70314, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Felweave Handguards
				{ 5, 70316, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 70256, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Plate Helm
				{ 2, 70258, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Plate Shoulders
				{ 3, 70254, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Plate Chestpiece
				{ 4, 70255, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Ruthless Gladiator's Plate Gauntlets
				{ 5, 70257, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Ruthless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}

-- Classic Season 9
data["CLASSICS9SETS"] = {
	name = string.format(AL["Season %d"], 9).." "..AL["Class Sets"].." ("..AL["Cataclysm"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
			{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 60410, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Dreadplate Helm
				{ 2, 60412, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Dreadplate Shoulders
				{ 3, 60408, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Dreadplate Chestpiece
				{ 4, 60409, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Dreadplate Gauntlets
				{ 5, 60411, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 60444, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Dragonhide Helm
				{ 2, 60447, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Dragonhide Spaulders
				{ 3, 60446, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Dragonhide Robes
				{ 4, 60443, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Dragonhide Gloves
				{ 5, 60445, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Dragonhide Legguards
				{ 7, 60449, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Kodohide Helm
				{ 8, 60452, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Kodohide Spaulders
				{ 9, 60451, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Kodohide Robes
				{ 10, 60448, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Kodohide Gloves
				{ 11, 60450, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Kodohide Legguards
				{ 16, 60454, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Wyrmhide Helm
				{ 17, 60457, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Wyrmhide Spaulders
				{ 18, 60456, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Wyrmhide Robes
				{ 19, 60453, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Wyrmhide Gloves
				{ 20, 60455, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 60425, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Chain Helm
				{ 2, 60427, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Chain Spaulders
				{ 3, 60423, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Chain Armor
				{ 4, 60424, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Chain Gauntlets
				{ 5, 60426, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 60464, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Silk Cowl
				{ 2, 60467, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Silk Amice
				{ 3, 60466, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Silk Robe
				{ 4, 60463, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Silk Handguards
				{ 5, 60465, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 60603, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Ornamented Headcover
				{ 2, 60605, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Ornamented Spaulders
				{ 3, 60601, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Ornamented Chestguard
				{ 4, 60602, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Ornamented Gloves
				{ 5, 60604, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Ornamented Legplates
				{ 16, 60415, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Scaled Helm
				{ 17, 60417, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Scaled Shoulders
				{ 18, 60413, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Scaled Chestpiece
				{ 19, 60414, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Scaled Gauntlets
				{ 20, 60416, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 60469, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Mooncloth Helm
				{ 2, 60472, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Mooncloth Mantle
				{ 3, 60471, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Mooncloth Robe
				{ 4, 60468, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Mooncloth Gloves
				{ 5, 60470, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Mooncloth Leggings
				{ 16, 60474, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Satin Hood
				{ 17, 60477, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Satin Mantle
				{ 18, 60476, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Satin Robe
				{ 19, 60473, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Satin Gloves
				{ 20, 60475, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 60460, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Leather Helm
				{ 2, 60462, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Leather Spaulders
				{ 3, 60458, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Leather Tunic
				{ 4, 60459, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Leather Gloves
				{ 5, 60461, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 60435, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Linked Helm
				{ 2, 60437, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Linked Spaulders
				{ 3, 60433, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Linked Armor
				{ 4, 60434, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Linked Gauntlets
				{ 5, 60436, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Linked Leggings
				{ 7, 60440, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Mail Helm
				{ 8, 60442, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Mail Spaulders
				{ 9, 60438, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Mail Armor
				{ 10, 60439, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Mail Gauntlets
				{ 11, 60441, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Mail Leggings
				{ 16, 60430, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Ringmail Helm
				{ 17, 60432, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Ringmail Spaulders
				{ 18, 60428, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Ringmail Armor
				{ 19, 60429, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Ringmail Gauntlets
				{ 20, 60431, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 60479, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Felweave Cowl
				{ 2, 60482, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Felweave Amice
				{ 3, 60481, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Felweave Raiment
				{ 4, 60478, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Felweave Handguards
				{ 5, 60480, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 60420, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Plate Helm
				{ 2, 60422, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Plate Shoulders
				{ 3, 60418, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Plate Chestpiece
				{ 4, 60419, [PRICE_EXTRA_ITTYPE] = "honor:825" }, -- Vicious Gladiator's Plate Gauntlets
				{ 5, 60421, [PRICE_EXTRA_ITTYPE] = "honor:1100" }, -- Vicious Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 8
data["CLASSICS8SETS"] = {
	name = string.format(AL["Season %d"], 8).." "..AL["Class Sets"].." ("..AL["Wrath of the Lich King"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
			{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 51415, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Dreadplate Helm
				{ 2, 51418, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Dreadplate Shoulders
				{ 3, 51413, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Dreadplate Chestpiece
				{ 4, 51414, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Dreadplate Gauntlets
				{ 5, 51416, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Dreadplate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 51427, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Dragonhide Helm
				{ 2, 51430, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Dragonhide Spaulders
				{ 3, 51425, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Dragonhide Robes
				{ 4, 51426, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Dragonhide Gloves
				{ 5, 51428, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Dragonhide Legguards
				{ 7, 51421, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Kodohide Helm
				{ 8, 51424, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Kodohide Spaulders
				{ 9, 51419, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Kodohide Robes
				{ 10, 51420, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Kodohide Gloves
				{ 11, 51422, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Kodohide Legguards
				{ 16, 51435, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Wyrmhide Helm
				{ 17, 51438, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Wyrmhide Spaulders
				{ 18, 51433, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Wyrmhide Robes
				{ 19, 51434, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Wyrmhide Gloves
				{ 20, 51436, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 51460, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Chain Helm
				{ 2, 51462, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Chain Spaulders
				{ 3, 51458, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Chain Armor
				{ 4, 51459, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Chain Gauntlets
				{ 5, 51461, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 51465, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Silk Cowl
				{ 2, 51467, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Silk Amice
				{ 3, 51463, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Silk Raiment
				{ 4, 51464, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Silk Handguards
				{ 5, 51466, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 51470, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Ornamented Headcover
				{ 2, 51473, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Ornamented Spaulders
				{ 3, 51468, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Ornamented Chestguard
				{ 4, 51469, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Ornamented Gloves
				{ 5, 51471, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Ornamented Legplates
				{ 16, 51476, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Scaled Helm
				{ 17, 51479, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Scaled Shoulders
				{ 18, 51474, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Scaled Chestpiece
				{ 19, 51475, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Scaled Gauntlets
				{ 20, 51477, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 51484, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Mooncloth Hood
				{ 2, 51486, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Mooncloth Mantle
				{ 3, 51482, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Mooncloth Robe
				{ 4, 51483, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Mooncloth Gloves
				{ 5, 51485, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Mooncloth Leggings
				{ 16, 51489, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Satin Hood
				{ 17, 51491, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Satin Mantle
				{ 18, 51487, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Satin Robe
				{ 19, 51488, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Satin Gloves
				{ 20, 51490, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 51494, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Leather Helm
				{ 2, 51496, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Leather Spaulders
				{ 3, 51492, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Leather Tunic
				{ 4, 51493, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Leather Gloves
				{ 5, 51495, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 51505, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Linked Helm
				{ 2, 51508, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Linked Spaulders
				{ 3, 51503, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Linked Armor
				{ 4, 51504, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Linked Gauntlets
				{ 5, 51506, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Linked Leggings
				{ 7, 51511, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Mail Helm
				{ 8, 51514, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Mail Spaulders
				{ 9, 51509, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Mail Armor
				{ 10, 51510, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Mail Gauntlets
				{ 11, 51512, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Mail Leggings
				{ 16, 51499, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Ringmail Helm
				{ 17, 51502, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Ringmail Spaulders
				{ 18, 51497, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Ringmail Armor
				{ 19, 51498, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Ringmail Gauntlets
				{ 20, 51500, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 51538, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Felweave Cowl
				{ 2, 51540, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Felweave Amice
				{ 3, 51536, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Felweave Raiment
				{ 4, 51537, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Felweave Handguards
				{ 5, 51539, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 51543, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Plate Helm
				{ 2, 51545, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Plate Shoulders
				{ 3, 51541, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Plate Chestpiece
				{ 4, 51542, [PRICE_EXTRA_ITTYPE] = "honor:1040" }, -- Wrathful Gladiator's Plate Gauntlets
				{ 5, 51544, [PRICE_EXTRA_ITTYPE] = "honor:1650" }, -- Wrathful Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 7
data["CLASSICS7SETS"] = {
	name = string.format(AL["Season %d"], 7).." "..AL["Class Sets"].." ("..AL["Wrath of the Lich King"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
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
	name = string.format(AL["Season %d"], 6).." "..AL["Class Sets"].." ("..AL["Wrath of the Lich King"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
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
	name = string.format(AL["Season %d"], 6).." "..AL["Non-Set Gear"].." ("..AL["Wrath of the Lich King"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = ALIL["Cloth"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = ALIL["Leather"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = ALIL["Mail"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
			},
		},
		{
			name = ALIL["Plate"],
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
	name = string.format(AL["Season %d"], 5).." "..AL["Class Sets"].." ("..AL["Wrath of the Lich King"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
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
	name = string.format(AL["Season %d"], 4).." "..AL["Class Sets"].." ("..AL["Burning Crusade"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
				{ 1, 40442, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dreadplate Helm
				{ 2, 40444, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Dreadplate Shoulders
				{ 3, 40440, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dreadplate Chestpiece
				{ 4, 40441, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Dreadplate Gauntlets
				{ 5, 40443, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dreadplate Legguards
				
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				{ 1, 34999, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dragonhide Helm
				{ 2, 35001, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Dragonhide Spaulders
				{ 3, 35002, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dragonhide Tunic
				{ 4, 34998, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Dragonhide Gloves
				{ 5, 35000, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dragonhide Legguards
				{ 7, 35023, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Kodohide Helm
				{ 8, 35025, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Kodohide Spaulders
				{ 9, 35026, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Kodohide Tunic
				{ 10, 35022, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Kodohide Gloves
				{ 11, 35024, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Kodohide Legguards
				{ 16, 35112, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Wyrmhide Helm
				{ 17, 35114, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Wyrmhide Spaulders
				{ 18, 35115, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Wyrmhide Tunic
				{ 19, 35111, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Wyrmhide Gloves
				{ 20, 35113, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 34992, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Chain Helm
				{ 2, 34994, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Chain Spaulders
				{ 3, 34990, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Chain Armor
				{ 4, 34991, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Chain Gauntlets
				{ 5, 34993, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 35097, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Silk Cowl
				{ 2, 35096, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Silk Amice
				{ 3, 35099, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Silk Raiment
				{ 5, 35098, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Silk Handguards
				{ 6, 35100, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				{ 1, 35029, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Lamellar Helm
				{ 2, 35031, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Lamellar Shoulders
				{ 3, 35027, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Lamellar Chestpiece
				{ 4, 35028, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Lamellar Gauntlets
				{ 5, 35030, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Lamellar Legguards
				{ 7, 35061, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Ornamented Headcover
				{ 8, 35063, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Ornamented Spaulders
				{ 9, 35059, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Ornamented Chestguard
				{ 10, 35060, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Ornamented Gloves
				{ 11, 35062, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Ornamented Legplates
				{ 16, 35090, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Scaled Helm
				{ 17, 35092, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Scaled Shoulders
				{ 18, 35088, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Scaled Chestpiece
				{ 19, 35089, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Scaled Gauntlets
				{ 20, 35091, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				{ 1, 35054, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Mooncloth Hood
				{ 2, 35056, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Mooncloth Mantle
				{ 3, 35057, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Mooncloth Robe
				{ 4, 35053, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Mooncloth Gloves
				{ 5, 35055, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Mooncloth Leggings
				{ 16, 35084, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Satin Hood
				{ 17, 35086, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Satin Mantle
				{ 18, 35087, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Satin Robe
				{ 19, 35083, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Satin Gloves
				{ 20, 35085, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 35033, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Leather Helm
				{ 2, 35035, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Leather Spaulders
				{ 3, 35036, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Leather Tunic
				{ 6, 35032, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Leather Gloves
				{ 5, 35034, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				{ 1, 35044, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Linked Helm
				{ 2, 35046, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Linked Spaulders
				{ 3, 35042, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Linked Armor
				{ 4, 35043, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Linked Gauntlets
				{ 5, 35045, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Linked Leggings
				{ 7, 35050, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Mail Helm
				{ 8, 35052, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Mail Spaulders
				{ 9, 35048, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Mail Armor
				{ 10, 35049, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Mail Gauntlets
				{ 11, 35051, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Mail Leggings
				{ 16, 35079, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Ringmail Helm
				{ 17, 35081, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Ringmail Spaulders
				{ 18, 35077, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Ringmail Armor
				{ 19, 35078, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Ringmail Gauntlets
				{ 20, 35080, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				{ 1, 35004, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dreadweave Hood
				{ 2, 35006, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Dreadweave Mantle
				{ 3, 35007, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dreadweave Robe
				{ 4, 35003, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Dreadweave Gloves
				{ 5, 35005, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Dreadweave Leggings
				{ 16, 35010, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Felweave Cowl
				{ 17, 35009, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Felweave Amice
				{ 18, 35012, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Felweave Raiment
				{ 19, 35011, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Felweave Handguards
				{ 20, 35013, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 35068, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Plate Helm
				{ 2, 35070, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Plate Shoulders
				{ 3, 35066, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Plate Chestpiece
				{ 6, 35067, [PRICE_EXTRA_ITTYPE] = "honor:140"  }, -- Brutal Gladiator's Plate Gauntlets
				{ 5, 35069, [PRICE_EXTRA_ITTYPE] = "honor:175"  }, -- Brutal Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 3
data["CLASSICS3SETS"] = {
	name = string.format(AL["Season %d"], 3).." "..AL["Class Sets"].." ("..AL["Burning Crusade"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33672, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Dragonhide Helm
				{ 2, 33674, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Dragonhide Spaulders
				{ 3, 33675, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Dragonhide Tunic
				{ 4, 33671, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Dragonhide Gloves
				{ 5, 33673, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Dragonhide Legguards
				--
				{ 7, 33691, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Kodohide Helm
				{ 8, 33693, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Kodohide Spaulders
				{ 9, 33694, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Kodohide Tunic
				{ 10, 33690, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Kodohide Gloves
				{ 11, 33692, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Kodohide Legguards
				--
				{ 16, 33768, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Wyrmhide Helm
				{ 17, 33770, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Wyrmhide Spaulders
				{ 18, 33771, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Wyrmhide Tunic
				{ 19, 33767, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Wyrmhide Gloves
				{ 20, 33769, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 33666, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Chain Helm
				{ 2, 33668, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Chain Spaulders
				{ 3, 33664, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Chain Armor
				{ 4, 33665, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Chain Gauntlets
				{ 5, 33667, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 33758, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Silk Cowl
				{ 2, 33757, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Silk Amice
				{ 3, 33760, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Silk Raiment
				{ 4, 33759, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Silk Handguards
				{ 5, 33761, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33697, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Lamellar Helm
				{ 2, 33699, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Lamellar Shoulders
				{ 3, 33695, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Lamellar Chestpiece
				{ 4, 33696, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Lamellar Gauntlets
				{ 5, 33698, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Lamellar Legguards
				--
				{ 7, 33724, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Ornamented Headcover
				{ 8, 33726, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Ornamented Spaulders
				{ 9, 33722, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Ornamented Chestguard
				{ 10, 33723, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Ornamented Gloves
				{ 11, 33725, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Ornamented Legplates
				--
				{ 16, 33751, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Scaled Helm
				{ 17, 33753, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Scaled Shoulders
				{ 18, 33749, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Scaled Chestpiece
				{ 19, 33750, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Scaled Gauntlets
				{ 20, 33752, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33718, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Mooncloth Hood
				{ 2, 33720, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Mooncloth Mantle
				{ 3, 33721, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Mooncloth Robe
				{ 4, 33717, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Mooncloth Gloves
				{ 5, 33719, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Mooncloth Leggings
				{ 16, 33745, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Satin Hood
				{ 17, 33747, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Satin Mantle
				{ 18, 33748, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Satin Robe
				{ 19, 33744, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Satin Gloves
				{ 20, 33746, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 33701, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Leather Helm
				{ 2, 33703, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Leather Spaulders
				{ 3, 33704, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Leather Tunic
				{ 4, 33700, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Leather Gloves
				{ 5, 33702, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33708, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Linked Helm
				{ 2, 33710, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Linked Spaulders
				{ 3, 33706, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Linked Armor
				{ 4, 33707, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Linked Gauntlets
				{ 5, 33709, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Linked Leggings
				--
				{ 7, 33713, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Mail Helm
				{ 8, 33715, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Mail Spaulders
				{ 9, 33711, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Vengeful Gladiator's Mail Armor
				{ 10, 33712, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Mail Gauntlets
				{ 11, 33714, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Mail Leggings
				--
				{ 16, 33740, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Ringmail Helm
				{ 17, 33742, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Ringmail Spaulders
				{ 18, 33738, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Ringmail Armor
				{ 19, 33739, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Ringmail Gauntlets
				{ 20, 33741, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 33677, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Dreadweave Hood
				{ 2, 33679, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Dreadweave Mantle
				{ 3, 33680, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Dreadweave Robe
				{ 4, 33676, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Dreadweave Gloves
				{ 5, 33678, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Dreadweave Leggings
				--
				{ 16, 33683, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Felweave Cowl
				{ 17, 33682, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Felweave Amice
				{ 18, 33685, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Felweave Raiment
				{ 19, 33684, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Felweave Handguards
				{ 20, 33686, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 33730, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Plate Helm
				{ 2, 33732, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Plate Shoulders
				{ 3, 33728, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Plate Chestpiece
				{ 4, 33729, [PRICE_EXTRA_ITTYPE] = "honor:750" },	-- Vengeful Gladiator's Plate Gauntlets
				{ 5, 33731, [PRICE_EXTRA_ITTYPE] = "honor:1000" },	-- Vengeful Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
	},
}
data["CLASSICS3WEAPONS"] = {
	name = string.format(AL["Season %d"], 3).." "..AL["Weapons"].." ("..AL["Burning Crusade"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Weapons"]),
			[ALLIANCE_DIFF] = {
				{ 1, 34059, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Baton of Light
				{ 2, 34540, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Battle Staff
				{ 3, 33006, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Heavy Crossbow
				{ 4, 34066, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Piercing Touch
				{ 5, 33755, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Shield Wall
				{ 6, 33764, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Touch of Defeat
				{ 7, 33766, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's War Staff
				{ 8, 33669, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Cleaver
				{ 9, 33687, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Gavel
				{ 10, 33705, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Fleshslicer
				{ 11, 33733, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Pummeler
				{ 12, 33737, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Ripper
				{ 13, 33743, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Salvation
				{ 14, 33754, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Shanker
				{ 15, 33762, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Slicer
				{ 16, 33763, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Spellblade
				{ 17, 34016, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Slasher
				{ 18, 33661, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Barrier
				{ 19, 33735, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Redoubt
				{ 20, 34529, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Longbow
				{ 21, 34530, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Rifle
				{ 22, 33663, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Bonegrinder
				{ 23, 33670, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Decapitator
				{ 24, 33688, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Greatsword
				{ 25, 33716, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Staff
				{ 26, 33727, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Painsaw
				{ 27, 34014, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Vengeful Gladiator's Waraxe
				{ 28, 33662, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Bonecracker
				{ 29, 33689, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Hacker
				{ 30, 33734, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Quickblade
				{ 101, 33756, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Shiv
				{ 102, 33801, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Mutilator
				{ 103, 34015, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Chopper
				{ 104, 33681, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Endgame
				{ 105, 33736, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Reprieve
				{ 106, 34033, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Vengeful Gladiator's Grimoire
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
	name = string.format(AL["Season %d"], 2).." "..AL["Class Sets"].." ("..AL["Burning Crusade"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
			[ALLIANCE_DIFF] = {
				-- Feral / Guardian
				{ 1, 31968, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Dragonhide Helm
				{ 2, 31971, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Dragonhide Spaulders
				{ 3, 31972, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Dragonhide Tunic
				{ 4, 31967, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Dragonhide Gloves
				{ 5, 31969, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Dragonhide Legguards
				-- Restoration
				{ 7, 31988, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Kodohide Helm
				{ 8, 31990, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Kodohide Spaulders
				{ 9, 31991, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Kodohide Tunic
				{ 10, 31987, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Kodohide Gloves
				{ 11, 31989, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Kodohide Legguards
				-- Balance
				{ 16, 32057, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Wyrmhide Helm
				{ 17, 32059, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Wyrmhide Spaulders
				{ 18, 32060, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Wyrmhide Tunic
				{ 19, 32056, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Wyrmhide Gloves
				{ 20, 32058, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Wyrmhide Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
			[ALLIANCE_DIFF] = {
				{ 1, 31962, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Chain Helm
   				{ 2, 31964, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Chain Spaulders
				{ 3, 31960, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Chain Armor
				{ 4, 31961, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Chain Gauntlets
				{ 5, 31963, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Chain Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
			[ALLIANCE_DIFF] = {
				{ 1, 32048, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Silk Cowl
   				{ 2, 32047, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Silk Amice
   				{ 3, 32050, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Silk Raiment
   				{ 4, 32049, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Silk Handguards
   				{ 5, 32051, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Silk Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 31997, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Lamellar Helm
				{ 2, 31996, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Lamellar Shoulders
				{ 3, 31992, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Lamellar Chestpiece
				{ 4, 31993, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Lamellar Gauntlets
				{ 5, 31995, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Lamellar Legguards
				--
				{ 7, 32022, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Ornamented Headcover
				{ 8, 32024, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Ornamented Spaulders
				{ 9, 32020, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Ornamented Chestguard
				{ 10, 32021, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Ornamented Gloves
				{ 11, 32023, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Ornamented Legplates
				--
				{ 16, 32041, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Scaled Helm
				{ 17, 32043, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Scaled Shoulders
				{ 18, 32039, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Scaled Chestpiece
				{ 19, 32040, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Scaled Gauntlets
				{ 20, 32042, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Scaled Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 32016, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Mooncloth Hood
				{ 2, 32018, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Mooncloth Mantle
				{ 3, 32019, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Mooncloth Robe
				{ 4, 32015, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Mooncloth Gloves
				{ 5, 32017, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Mooncloth Leggings
				--
				{ 16, 32035, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Satin Hood
				{ 17, 32037, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Satin Mantle
				{ 18, 32038, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Satin Robe
				{ 19, 32034, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Satin Gloves
				{ 20, 32036, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Satin Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
			[ALLIANCE_DIFF] = {
				{ 1, 31999, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Leather Helm
				{ 2, 32001, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Leather Spaulders
				{ 3, 32002, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Leather Tunic
				{ 4, 31998, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Leather Gloves
				{ 5, 32000, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Leather Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 32006, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Linked Helm
				{ 2, 32008, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Linked Spaulders
				{ 3, 32004, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Linked Armor
				{ 4, 32005, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Linked Gauntlets
				{ 5, 32007, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Linked Leggings
				--
				{ 7, 32011, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Mail Helm
				{ 8, 32013, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Mail Spaulders
				{ 9, 32009, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Mail Armor
				{ 10, 32010, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Mail Gauntlets
				{ 11, 32012, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Mail Leggings
				--
				{ 16, 32031, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Ringmail Helm
				{ 17, 32033, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Ringmail Spaulders
				{ 18, 32029, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Ringmail Armor
				{ 19, 32030, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Ringmail Gauntlets
				{ 20, 32032, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Ringmail Leggings
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
			[ALLIANCE_DIFF] = {
				--
				{ 1, 31974, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Dreadweave Hood
				{ 2, 31976, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Dreadweave Mantle
				{ 3, 31977, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Dreadweave Robe
				{ 4, 31973, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Dreadweave Gloves
				{ 5, 31975, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Dreadweave Leggings
				--
				{ 16, 31980, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Felweave Cowl
				{ 17, 31979, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Felweave Amice
				{ 18, 31982, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Felweave Raiment
				{ 19, 31981, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Felweave Handguards
				{ 20, 31983, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Felweave Trousers
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
		{
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
			[ALLIANCE_DIFF] = {
				{ 1, 30488, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Plate Helm
				{ 2, 30490, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Plate Shoulders
				{ 3, 30486, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Plate Chestpiece
				{ 4, 30487, [PRICE_EXTRA_ITTYPE] = "honor:750"  },	-- Merciless Gladiator's Plate Gauntlets
				{ 5, 30489, [PRICE_EXTRA_ITTYPE] = "honor:1000"  },	-- Merciless Gladiator's Plate Legguards
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				--
			},
		},
	},
}
data["CLASSICS2WEAPONS"] = {
	name = string.format(AL["Season %d"], 2).." "..AL["Weapons"].." ("..AL["Burning Crusade"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = string.format(AL["Weapons"]),
			[ALLIANCE_DIFF] = {
				{ 1, 31965, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Cleaver
				{ 2, 31986, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Crossbow of the Phoenix
				{ 3, 32045, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Shield Wall
				{ 4, 32962, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Touch of Defeat
				{ 5, 32055, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Merciless Gladiator's War Staff
				{ 6, 32003, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Fleshslicer
				{ 7, 32026, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Pummeler
				{ 8, 32028, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Ripper
				{ 9, 32044, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Shanker
				{ 10, 32052, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Slicer
				{ 11, 32053, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Spellblade
				{ 12, 32963, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Gavel
				{ 13, 32964, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Salvation
				{ 14, 33313, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Barrier
				{ 15, 31959, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Merciless Gladiator's Bonegrinder
				{ 16, 31966, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Merciless Gladiator's Decapitator
				{ 17, 31984, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Merciless Gladiator's Greatsword
				{ 18, 32014, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Merciless Gladiator's Maul
				{ 19, 32025, [PRICE_EXTRA_ITTYPE] = "honor:1500"  }, -- Merciless Gladiator's Painsaw
				{ 20, 31958, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Bonecracker
				{ 21, 31985, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Hacker
				{ 22, 32027, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Quickblade
				{ 23, 32046, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Shiv
				{ 24, 31978, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Endgame
				{ 25, 32961, [PRICE_EXTRA_ITTYPE] = "honor:750"  }, -- Merciless Gladiator's Reprieve
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- Classic Season 1
data["CLASSICS1SETS"] = {
	name = string.format(AL["Season %d"], 1).." "..AL["Class Sets"].." ("..AL["Burning Crusade"]..")",
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = LOCALIZED_CLASS_NAMES_MALE["DRUID"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["MAGE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"].." / "..LOCALIZED_CLASS_NAMES_MALE["PALADIN"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],
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
			name = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],
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
	name = string.format(AL["Season %d"], 1).." "..AL["Weapons"].." ("..AL["Burning Crusade"]..")",
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