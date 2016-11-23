-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2016 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0108

function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{["Armor"] = 9.26, ["Leech"] = 1.75, ["Versatility"] = 2.59, ["HasteRating"] = 1.95, ["Stamina"] = 2.16, ["MasteryRating"] = 1.7, ["Avoidance"] = 1.79, ["CritRating"] = 1.46, ["Strength"] = 1.14, ["MinDamage"] = 0.1/2, ["MaxDamage"] = 0.1/2, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{["Strength"] = 9.3, ["CritRating"] = 8.35, ["HasteRating"] = 8.15, ["Versatility"] = 7.01, ["MasteryRating"] = 6.48, ["MinDamage"] = (3.76+2.08)/4, ["MaxDamage"] = (3.76+2.08)/4, ["MovementSpeed"] = 0.58, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{["Strength"] = 8.65, ["CritRating"] = 7.11, ["HasteRating"] = 6.93, ["Versatility"] = 5.39, ["MasteryRating"] = 5.16, ["MinDamage"] = 2.01/2, ["MaxDamage"] = 2.01/2, ["MovementSpeed"] = 0.34, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{["CritRating"] = 8.46, ["Agility"] = 8.25, ["Versatility"] = 7.13, ["HasteRating"] = 6.87, ["MinDamage"] = (6.53+2.48)/4, ["MaxDamage"] = (6.53+2.48)/4, ["MasteryRating"] = 6.35, ["MovementSpeed"] = 0.58, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{["Armor"] = 14.69, ["Leech"] = 3.16, ["MasteryRating"] = 2.1, ["Versatility"] = 2.07, ["Stamina"] = 1.54, ["Agility"] = 1.85, ["HasteRating"] = 1.72, ["CritRating"] = 1.64, ["Avoidance"] = 1.34, ["MinDamage"] = (0.12+0.03)/4, ["MaxDamage"] = (0.12+0.03)/4, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{["Intellect"] = 8.62, ["HasteRating"] = 7.47, ["CritRating"] = 6.29, ["Versatility"] = 6.14, ["MasteryRating"] = 5.65, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{["Agility"] = 11.19, ["CritRating"] = 8.04, ["Versatility"] = 7.2, ["HasteRating"] = 7.79, ["MasteryRating"] = 6.76, ["MinDamage"] = (5.25+0)/4, ["MaxDamage"] = (5.25+0)/4, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{["Armor"] = 13.5, ["Avoidance"] = 0.8, ["Versatility"] = 0.68, ["MasteryRating"] = 0.57, ["HasteRating"] = 0.38, ["CritRating"] = 0.31, ["Agility"] = 0.12, ["Leech"] = 1.49, ["Stamina"] = 0.01, ["MovementSpeed"] = 0.02, ["MinDamage"] = (0.01+0)/4, ["MaxDamage"] = (0.01+0)/4}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{["Intellect"] = 18, ["MasteryRating"] = 27.58, ["CritRating"] = 13.14, ["Versatility"] = 11.9, ["HasteRating"] = 12.17, ["Leech"] = 5.02, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{["Agility"] = 9.09, ["MasteryRating"] = 7.6, ["HasteRating"] = 6.38, ["CritRating"] = 5.87, ["Versatility"] = 5.53, ["MinDamage"] = (1.7+0)/4, ["MaxDamage"] = (1.7+0)/4, ["Leech"] = 0.02, ["MovementSpeed"] = 0.08, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{["MasteryRating"] = 9.55, ["Agility"] = 7.61, ["MinDamage"] = (7.12+0)/2, ["MaxDamage"] = (7.12+0)/2, ["CritRating"] = 6.51, ["HasteRating"] = 6.4, ["Versatility"] = 5.73, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{["Agility"] = 9.69, ["Versatility"] = 6.03, ["CritRating"] = 5.78, ["HasteRating"] = 4.97, ["MasteryRating"] = 1.11, ["MinDamage"] = (2.27+0)/2, ["MaxDamage"] = (2.27+0)/2, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{["Intellect"] = 8.06, ["MasteryRating"] = 6.46, ["CritRating"] = 6.47, ["Versatility"] = 6.23, ["HasteRating"] = 6.06, ["Leech"] = 0.02, ["MovementSpeed"] = 0.2, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{["CritRating"] = 7.18, ["Intellect"] = 7.38, ["Versatility"] = 5.29, ["HasteRating"] = 5.28, ["MasteryRating"] = 4.75, ["Leech"] = 0.02, ["MovementSpeed"] = 0.25, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{["HasteRating"] = 10.21, ["Intellect"] = 9.86, ["CritRating"] = 9.17, ["Versatility"] = 7.03, ["MasteryRating"] = 5.89, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{["Armor"] = 1.49, ["Leech"] = 3.02, ["CritRating"] = 1.32, ["Stamina"] = 1.22, ["Avoidance"] = 1.19, ["HasteRating"] = 0.47, ["MasteryRating"] = 0.43, ["Versatility"] = 0.35, ["Agility"] = 0.44, ["MovementSpeed"] = 0.01, ["MinDamage"] = (0.04+0)/2, ["MaxDamage"] = (0.04+0)/2}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{["Intellect"] = 13.37, ["CritRating"] = 9.63, ["Versatility"] = 9.4, ["HasteRating"] = 4.97, ["MasteryRating"] = 4.44, ["Leech"] = 3.23, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{["Agility"] = 10.06, ["MasteryRating"] = 6.9, ["CritRating"] = 6.12, ["Versatility"] = 6.08, ["HasteRating"] = 4.7, ["MinDamage"] = (1.56+0.78)/4, ["MaxDamage"] = (1.56+0.78)/4, ["MovementSpeed"] = 0.01, ["Leech"] = 0.03, ["Avoidance"] = 0.02}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{["Intellect"] = 13.56, ["MasteryRating"] = 12.1, ["CritRating"] = 11.74, ["Versatility"] = 8.95, ["Leech"] = 2.54, ["HasteRating"] = 3.01, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{["Armor"] = 4.77, ["Leech"] = 2.41, ["Avoidance"] = 1.25, ["Versatility"] = 1.44, ["MasteryRating"] = 1.54, ["HasteRating"] = 0.99, ["CritRating"] = 0.76, ["Stamina"] = 0.56, ["Strength"] = 0.57, ["MovementSpeed"] = 0.01, ["MinDamage"] = (0.02+0)/4, ["MaxDamage"] = (0.02+0)/4}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{["HasteRating"] = 7.64, ["Strength"] = 7.72, ["CritRating"] = 6.35, ["Versatility"] = 6.06, ["MinDamage"] = (5.83+0)/4, ["MaxDamage"] = (5.83+0)/4, ["MasteryRating"] = 4.9, ["MovementSpeed"] = 0.59, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{["Intellect"] = 16.92, ["CritRating"] = 11.96, ["Versatility"] = 11.21, ["MasteryRating"] = 10.68, ["HasteRating"] = 7.93, ["Leech"] = 1.8, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{["Intellect"] = 14.84, ["CritRating"] = 12.9, ["MasteryRating"] = 11.61, ["Versatility"] = 10.15, ["HasteRating"] = 4.44, ["Leech"] = 2.95, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{["HasteRating"] = 15.73, ["CritRating"] = 12.68, ["Intellect"] = 8.72, ["MasteryRating"] = 8.11, ["Versatility"] = 6.52, ["Leech"] = 0.02, ["MovementSpeed"] = 0.16, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{["Agility"] = 11.11, ["CritRating"] = 8.81, ["MasteryRating"] = 8.68, ["Versatility"] = 7.45, ["HasteRating"] = 5.16, ["MinDamage"] = (3.43+1.68)/4, ["MaxDamage"] = (3.43+1.68)/4, ["MovementSpeed"] = 0.01, ["Leech"] = 0.03, ["Avoidance"] = 0.02}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{["Agility"] = 10.7, ["MasteryRating"] = 8.17, ["Versatility"] = 7.11, ["HasteRating"] = 6.97, ["CritRating"] = 6.74, ["MinDamage"] = (3.43+1.42)/4, ["MaxDamage"] = (3.43+1.42)/4, ["MovementSpeed"] = 0.38, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{["Agility"] = 9.84, ["MasteryRating"] = 6.01, ["Versatility"] = 6.63, ["CritRating"] = 6.19, ["MinDamage"] = (6.23+0.46)/4, ["MaxDamage"] = (6.23+0.46)/4, ["HasteRating"] = 5.29, ["MovementSpeed"] = 0.33, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{["Intellect"] = 8.12, ["CritRating"] = 7.49, ["HasteRating"] = 6.52, ["Versatility"] = 5.85, ["MasteryRating"] = 6.06, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{["MasteryRating"] = 10.46, ["Agility"] = 10.19, ["HasteRating"] = 9.14, ["Versatility"] = 7.23, ["CritRating"] = 6.95, ["MinDamage"] = (4.63+1.75)/4, ["MaxDamage"] = (4.63+1.75)/4, ["MovementSpeed"] = 0.34, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{["Intellect"] = 13.32, ["CritRating"] = 11.71, ["Versatility"] = 8.53, ["HasteRating"] = 7.28, ["MasteryRating"] = 9.38, ["Leech"] = 2.68, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{["HasteRating"] = 9.38, ["MasteryRating"] = 8.76, ["Intellect"] = 8.07, ["CritRating"] = 6.01, ["Versatility"] = 5.49, ["MovementSpeed"] = 0.02, ["Leech"] = 0.03, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{["HasteRating"] = 11.79, ["Intellect"] = 8.7, ["CritRating"] = 6.98, ["Versatility"] = 7.01, ["MasteryRating"] = 6.24, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{["HasteRating"] = 8.05, ["Intellect"] = 7.99, ["MasteryRating"] = 6.48, ["CritRating"] = 6.29, ["Versatility"] = 5.74, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{["MasteryRating"] = 11.59, ["HasteRating"] = 9.14, ["Strength"] = 7.52, ["MinDamage"] = (7.52+0)/4, ["MaxDamage"] = (7.52+0)/4, ["Versatility"] = 6.8, ["CritRating"] = 6, ["Leech"] = 0.02, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.14}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{["HasteRating"] = 10.43, ["MasteryRating"] = 7.07, ["Versatility"] = 7.28, ["CritRating"] = 6.89, ["Strength"] = 6.85, ["MinDamage"] = (4.27+2.1)/4, ["MaxDamage"] = (4.27+2.1)/4, ["MovementSpeed"] = 0.01, ["Leech"] = 0.03, ["Avoidance"] = 0.02}
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{["Armor"] = 7.57, ["Leech"] = 3.5, ["Versatility"] = 2.33, ["Strength"] = 2.17, ["Avoidance"] = 1.45, ["MasteryRating"] = 1.89, ["Stamina"] = 0.88, ["CritRating"] = 0.69, ["HasteRating"] = 0.68, ["MovementSpeed"] = 0.02, ["MinDamage"] = (0.01+0)/4, ["MaxDamage"] = (0.01+0)/4}
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
