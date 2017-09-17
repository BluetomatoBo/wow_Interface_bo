-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0214


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor = 9.46, MasteryRating = 8.56, Versatility = 8.44, Leech = 7.35, CritRating = 5.19, HasteRating = 5.09, Strength = 3.21, Stamina = 3.02, Avoidance = 0.67, MinDamage = 0.235, MaxDamage = 0.235, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ CritRating = 17.87, Strength = 17.51, HasteRating = 15.33, MasteryRating = 14.85, Versatility = 13.87, MaxDamage = 1.8875, MinDamage = 1.8875, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ MasteryRating = 19.39, HasteRating = 18.68, Strength = 17.9, CritRating = 15.65, Versatility = 14.24, MinDamage = 1.555, MaxDamage = 1.555, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ CritRating = 23.02, HasteRating = 14.86, Agility = 14.28, Versatility = 13.89, MasteryRating = 12.77, MaxDamage = 4.7475, MinDamage = 4.7475, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Leech = 11.12, Armor = 6.69, Versatility = 3.74, Agility = 2.57, CritRating = 2.38, Stamina = 2.26, MasteryRating = 2.05, HasteRating = 1.98, Avoidance = 1.73, MinDamage = 0.0275, MaxDamage = 0.0275, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ MasteryRating = 19.17, HasteRating = 18.86, CritRating = 15.59, Intellect = 15.38, Versatility = 15.37, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility = 19.65, CritRating = 17.22, MasteryRating = 16.86, Versatility = 14.89, HasteRating = 7.87, MinDamage = 5.22, MaxDamage = 5.22, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Leech = 15.21, Armor = 12.88, Versatility = 4.45, MasteryRating = 3.64, Stamina = 3.02, HasteRating = 2.4, Agility = 2.02, Avoidance = 0.96, CritRating = 0.92, MinDamage = 0.01, MovementSpeed = 0.01, MaxDamage = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ MasteryRating = 19.24, CritRating = 14.99, Versatility = 14.28, Intellect = 12.54, HasteRating = 9.97, Leech = 6.72, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ MasteryRating = 22.26, Agility = 19.58, HasteRating = 18.8, CritRating = 17.13, Versatility = 14.89, MinDamage = 2.085, MaxDamage = 2.085, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ MasteryRating = 25.47, CritRating = 19.86, HasteRating = 18.36, Agility = 16.35, Versatility = 16.14, MinDamage = 7.865, MaxDamage = 7.865, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ HasteRating = 17.9, Agility = 17.59, CritRating = 15.49, Versatility = 15.16, MasteryRating = 3.74, MinDamage = 2.96, MaxDamage = 2.96, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ HasteRating = 18.64, CritRating = 16.78, Intellect = 16.07, Versatility = 16.04, MasteryRating = 14.07, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ HasteRating = 18.34, CritRating = 17.78, Intellect = 16.51, Versatility = 16.34, MasteryRating = 14.66, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ HasteRating = 17.63, CritRating = 17.15, Intellect = 17.02, Versatility = 16.09, MasteryRating = 12.01, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Leech = 28.74, Armor = 6.94, CritRating = 6.35, Versatility = 6.15, Agility = 4.53, Avoidance = 4.43, MasteryRating = 4.35, Stamina = 1.82, HasteRating = 0.35, MinDamage = 0.205, MaxDamage = 0.205, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ CritRating = 17.13, Versatility = 16.62, Intellect = 15.52, MasteryRating = 13.47, HasteRating = 11.51, Leech = 6.93, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility = 18.07, MasteryRating = 14.62, CritRating = 13.98, Versatility = 12.89, HasteRating = 9.78, MaxDamage = 0.5575, MinDamage = 0.5575, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ CritRating = 17.16, HasteRating = 14.68, MasteryRating = 13.83, Leech = 12.64, Versatility = 12.18, Intellect = 11.27, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Leech = 9.91, Versatility = 8.53, HasteRating = 8.3, Armor = 7.16, MasteryRating = 6.51, Stamina = 6.38, CritRating = 3.96, Strength = 2.62, Avoidance = 0.9, MinDamage = 0.355, MaxDamage = 0.355, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ HasteRating = 15.8, CritRating = 15.54, Strength = 14.42, Versatility = 13.97, MasteryRating = 11.7, MinDamage = 5.35, MaxDamage = 5.35, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ HasteRating = 20.82, CritRating = 10.16, Intellect = 9.75, Versatility = 9.33, MasteryRating = 9.01, Leech = 2.38, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ CritRating = 18.19, Versatility = 15.94, Intellect = 15.32, MasteryRating = 13.55, Leech = 7.88, HasteRating = 1.4, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ HasteRating = 26.99, CritRating = 18.25, MasteryRating = 16.72, Intellect = 15.48, Versatility = 15.37, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ MasteryRating = 21.98, Agility = 20.46, Versatility = 16.04, CritRating = 15.62, HasteRating = 8.8, MaxDamage = 2.2025, MinDamage = 2.2025, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility = 18.8, HasteRating = 14.73, Versatility = 13.68, CritRating = 11.75, MasteryRating = 9.3, MaxDamage = 1.4925, MinDamage = 1.4925, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility = 19.52, MasteryRating = 16.01, Versatility = 15.55, CritRating = 15.53, HasteRating = 7.58, MaxDamage = 3.6075, MinDamage = 3.6075, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ CritRating = 19.3, Versatility = 16.81, Intellect = 16.48, MasteryRating = 15.95, HasteRating = 15.71, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ HasteRating = 21.57, MasteryRating = 19.89, Agility = 19.71, CritRating = 16.66, Versatility = 16.31, MaxDamage = 3.6075, MinDamage = 3.6075, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ CritRating = 19.01, MasteryRating = 16.36, Versatility = 14.66, Intellect = 14.37, HasteRating = 8.67, Leech = 8.08, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ HasteRating = 20.33, MasteryRating = 19.92, CritRating = 18.4, Intellect = 15.52, Versatility = 14.62, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ HasteRating = 26.5, MasteryRating = 18.04, CritRating = 16.03, Intellect = 15.54, Versatility = 15.36, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ HasteRating = 21.34, CritRating = 19.02, MasteryRating = 17.09, Versatility = 16.93, Intellect = 16.81, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ MasteryRating = 26.31, HasteRating = 16.96, Strength = 16.59, Versatility = 15.59, CritRating = 14.11, MinDamage = 6, MaxDamage = 6, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ HasteRating = 18.94, CritRating = 13.95, MasteryRating = 13.88, Versatility = 13.15, Strength = 12.16, MaxDamage = 2.6575, MinDamage = 2.6575, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Leech = 17.91, Versatility = 10.54, Strength = 7.83, MasteryRating = 7.6, HasteRating = 6.73, Armor = 5.94, Stamina = 4.63, CritRating = 1.18, Avoidance = 0.02, MinDamage = 0.015, MaxDamage = 0.015, MovementSpeed = 0.01 }
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
