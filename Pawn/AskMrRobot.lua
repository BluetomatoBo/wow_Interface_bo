-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2016 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0111

function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{["Armor"] = 9.34, ["Leech"] = 2.54, ["Versatility"] = 2.64, ["HasteRating"] = 2, ["Stamina"] = 2.18, ["MasteryRating"] = 1.75, ["Avoidance"] = 1.23, ["CritRating"] = 1.51, ["Strength"] = 1.16, ["MinDamage"] = 0.08/2, ["MaxDamage"] = 0.08/2, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{["Strength"] = 9.48, ["CritRating"] = 8.26, ["HasteRating"] = 8.06, ["Versatility"] = 6.97, ["MasteryRating"] = 6.34, ["MinDamage"] = (3.72+2.21)/4, ["MaxDamage"] = (3.72+2.21)/4, ["MovementSpeed"] = 0.79, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{["Strength"] = 8.62, ["CritRating"] = 7.2, ["HasteRating"] = 6.99, ["Versatility"] = 5.49, ["MasteryRating"] = 5.21, ["MinDamage"] = 2.04/2, ["MaxDamage"] = 2.04/2, ["MovementSpeed"] = 0.78, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{["CritRating"] = 8.31, ["Agility"] = 8.15, ["Versatility"] = 7.02, ["HasteRating"] = 6.76, ["MinDamage"] = (6.48+2.5)/4, ["MaxDamage"] = (6.48+2.5)/4, ["MasteryRating"] = 6.25, ["MovementSpeed"] = 0.38, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{["Armor"] = 14.13, ["Leech"] = 2.2, ["MasteryRating"] = 1.97, ["Versatility"] = 1.98, ["Stamina"] = 1.54, ["Agility"] = 1.73, ["HasteRating"] = 1.62, ["CritRating"] = 1.57, ["Avoidance"] = 0.38, ["MinDamage"] = (0.09+0.01)/4, ["MaxDamage"] = (0.09+0.01)/4, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{["Intellect"] = 8.67, ["HasteRating"] = 7.61, ["CritRating"] = 6.38, ["Versatility"] = 6.25, ["MasteryRating"] = 5.71, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{["Agility"] = 11.16, ["CritRating"] = 8.04, ["Versatility"] = 7.15, ["HasteRating"] = 7.8, ["MasteryRating"] = 6.66, ["MinDamage"] = (4.97+0)/4, ["MaxDamage"] = (4.97+0)/4, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{["Armor"] = 13.17, ["Avoidance"] = 0.29, ["Versatility"] = 0.72, ["MasteryRating"] = 0.62, ["HasteRating"] = 0.43, ["CritRating"] = 0.35, ["Agility"] = 0.17, ["Leech"] = 1.39, ["Stamina"] = 0.01, ["MovementSpeed"] = 0.01, ["MinDamage"] = (0.04+0)/4, ["MaxDamage"] = (0.04+0)/4}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{["Intellect"] = 14.41, ["MasteryRating"] = 13.16, ["CritRating"] = 10.56, ["Versatility"] = 9.48, ["HasteRating"] = 9.38, ["Leech"] = 3.98, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{["Agility"] = 9.08, ["MasteryRating"] = 7.48, ["HasteRating"] = 6.3, ["CritRating"] = 5.77, ["Versatility"] = 5.42, ["MinDamage"] = (1.74+0)/4, ["MaxDamage"] = (1.74+0)/4, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{["MasteryRating"] = 9.63, ["Agility"] = 7.63, ["MinDamage"] = (7.19+0)/2, ["MaxDamage"] = (7.19+0)/2, ["CritRating"] = 6.65, ["HasteRating"] = 6.49, ["Versatility"] = 5.86, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{["Agility"] = 9.79, ["Versatility"] = 6.06, ["CritRating"] = 5.78, ["HasteRating"] = 5, ["MasteryRating"] = 1.12, ["MinDamage"] = (2.24+0)/2, ["MaxDamage"] = (2.24+0)/2, ["Leech"] = 0.02, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.2}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{["Intellect"] = 8.08, ["MasteryRating"] = 6.57, ["CritRating"] = 6.59, ["Versatility"] = 6.33, ["HasteRating"] = 6.09, ["Leech"] = 0.02, ["MovementSpeed"] = 0.36, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{["CritRating"] = 7.33, ["Intellect"] = 7.35, ["Versatility"] = 5.42, ["HasteRating"] = 5.39, ["MasteryRating"] = 4.88, ["Leech"] = 0.02, ["MovementSpeed"] = 0.25, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{["HasteRating"] = 10.52, ["Intellect"] = 9.93, ["CritRating"] = 9.3, ["Versatility"] = 7.34, ["MasteryRating"] = 6.17, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{["Armor"] = 1.76, ["Leech"] = 1.1, ["CritRating"] = 1.29, ["Stamina"] = 1.24, ["Avoidance"] = 0.39, ["HasteRating"] = 0.42, ["MasteryRating"] = 0.38, ["Versatility"] = 0.32, ["Agility"] = 0.44, ["MovementSpeed"] = 0.01, ["MinDamage"] = (0.01+0)/2, ["MaxDamage"] = (0.01+0)/2}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{["Intellect"] = 13.46, ["CritRating"] = 9.6, ["Versatility"] = 9.46, ["HasteRating"] = 4.99, ["MasteryRating"] = 4.47, ["Leech"] = 3.27, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{["Agility"] = 10.1, ["MasteryRating"] = 7.06, ["CritRating"] = 6.23, ["Versatility"] = 6.19, ["HasteRating"] = 4.9, ["MinDamage"] = (1.6+0.78)/4, ["MaxDamage"] = (1.6+0.78)/4, ["MovementSpeed"] = 0.01, ["Leech"] = 0.03, ["Avoidance"] = 0.02}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{["Intellect"] = 13.5, ["MasteryRating"] = 12.28, ["CritRating"] = 11.84, ["Versatility"] = 8.11, ["Leech"] = 3.13, ["HasteRating"] = 3.14, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{["Armor"] = 4.89, ["Leech"] = 2.04, ["Avoidance"] = 1.36, ["Versatility"] = 1.55, ["MasteryRating"] = 1.72, ["HasteRating"] = 1.07, ["CritRating"] = 0.88, ["Stamina"] = 0.6, ["Strength"] = 0.76, ["MovementSpeed"] = 0.01, ["MinDamage"] = (0.03+0)/4, ["MaxDamage"] = (0.03+0)/4}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{["HasteRating"] = 8.08, ["Strength"] = 7.55, ["CritRating"] = 6.69, ["Versatility"] = 6.32, ["MinDamage"] = (5.94+0)/4, ["MaxDamage"] = (5.94+0)/4, ["MasteryRating"] = 5.23, ["MovementSpeed"] = 0.4, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{["Intellect"] = 16.92, ["CritRating"] = 12.14, ["Versatility"] = 11.33, ["MasteryRating"] = 10.97, ["HasteRating"] = 8.17, ["Leech"] = 1.72, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{["Intellect"] = 15.28, ["CritRating"] = 13.05, ["MasteryRating"] = 11.81, ["Versatility"] = 10.22, ["HasteRating"] = 4.55, ["Leech"] = 2.65, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{["HasteRating"] = 10.16, ["CritRating"] = 10.82, ["Intellect"] = 10.15, ["MasteryRating"] = 9.5, ["Versatility"] = 7.41, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{["Agility"] = 11, ["CritRating"] = 8.92, ["MasteryRating"] = 8.83, ["Versatility"] = 7.41, ["HasteRating"] = 5.23, ["MinDamage"] = (3.32+1.68)/4, ["MaxDamage"] = (3.32+1.68)/4, ["MovementSpeed"] = 0.6, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{["Agility"] = 10.73, ["MasteryRating"] = 8.09, ["Versatility"] = 7.1, ["HasteRating"] = 6.82, ["CritRating"] = 6.69, ["MinDamage"] = (3.37+1.42)/4, ["MaxDamage"] = (3.37+1.42)/4, ["MovementSpeed"] = 0.66, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{["Agility"] = 9.85, ["MasteryRating"] = 6.04, ["Versatility"] = 6.68, ["CritRating"] = 6.23, ["MinDamage"] = (6.38+0.57)/4, ["MaxDamage"] = (6.38+0.57)/4, ["HasteRating"] = 5.32, ["MovementSpeed"] = 0.01, ["Leech"] = 0.03, ["Avoidance"] = 0.02}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{["Intellect"] = 8.18, ["CritRating"] = 7.62, ["HasteRating"] = 6.57, ["Versatility"] = 5.87, ["MasteryRating"] = 6.01, ["Leech"] = 0.02, ["MovementSpeed"] = 0.3, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{["MasteryRating"] = 10.63, ["Agility"] = 10.24, ["HasteRating"] = 9.28, ["Versatility"] = 7.3, ["CritRating"] = 7.08, ["MinDamage"] = (4.91+1.87)/4, ["MaxDamage"] = (4.91+1.87)/4, ["MovementSpeed"] = 1.03, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{["Intellect"] = 13.39, ["CritRating"] = 11.77, ["Versatility"] = 8.7, ["HasteRating"] = 7.45, ["MasteryRating"] = 9.45, ["Leech"] = 2.54, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{["HasteRating"] = 7.34, ["MasteryRating"] = 8.32, ["Intellect"] = 7.69, ["CritRating"] = 5.81, ["Versatility"] = 5.39, ["MovementSpeed"] = 0.02, ["Leech"] = 0.03, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{["HasteRating"] = 11.78, ["Intellect"] = 8.65, ["CritRating"] = 6.94, ["Versatility"] = 6.93, ["MasteryRating"] = 6.11, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{["HasteRating"] = 8.04, ["Intellect"] = 8.04, ["MasteryRating"] = 6.58, ["CritRating"] = 6.27, ["Versatility"] = 5.77, ["Leech"] = 0.02, ["MovementSpeed"] = 0.29, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{["MasteryRating"] = 11.25, ["HasteRating"] = 8.78, ["Strength"] = 7.42, ["MinDamage"] = (7.51+0)/4, ["MaxDamage"] = (7.51+0)/4, ["Versatility"] = 6.51, ["CritRating"] = 5.7, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{["HasteRating"] = 10.3, ["MasteryRating"] = 6.87, ["Versatility"] = 7.22, ["CritRating"] = 6.76, ["Strength"] = 7.03, ["MinDamage"] = (4.31+2.02)/4, ["MaxDamage"] = (4.31+2.02)/4, ["MovementSpeed"] = 0.01, ["Leech"] = 0.03, ["Avoidance"] = 0.02}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{["Armor"] = 7.5, ["Leech"] = 2.44, ["Versatility"] = 2.45, ["Strength"] = 2.42, ["Avoidance"] = 1.72, ["MasteryRating"] = 2.01, ["Stamina"] = 0.86, ["CritRating"] = 0.59, ["HasteRating"] = 0.9, ["MovementSpeed"] = 0.01, ["MinDamage"] = (0.02+0)/4, ["MaxDamage"] = (0.02+0)/4}
)

------------------------------------------------------------

-- PawnMrRobotScaleProviderOptions.LastAdded keeps track of the last time that we tried to automatically enable scales for this character.
if not PawnMrRobotScaleProviderOptions then PawnMrRobotScaleProviderOptions = { } end
if not PawnMrRobotScaleProviderOptions.LastAdded then PawnMrRobotScaleProviderOptions.LastAdded = 0 end

local _, Class = UnitClass("player")
if PawnMrRobotScaleProviderOptions.LastClass ~= nil and Class ~= PawnMrRobotScaleProviderOptions.LastClass then
	-- If the character has changed class since last time, let's start over.
	PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
	PawnMrRobotScaleProviderOptions.LastAdded = 0
end
PawnMrRobotScaleProviderOptions.LastClass = Class

-- These scales are new, and we don't need any upgrade logic yet.
PawnMrRobotScaleProviderOptions.LastAdded = 1

-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
PawnMrRobotScaleProvider_AddScales = nil

end -- PawnMrRobotScaleProvider_AddScales

------------------------------------------------------------

PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.AskMrRobotProvider, PawnMrRobotScaleProvider_AddScales)
