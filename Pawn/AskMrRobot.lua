-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0117

function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor = 50.36, Versatility = 12.4, Stamina = 11.84, Leech = 10.57, CritRating = 7.3, Strength = 5.66, HasteRating = 4.36, MasteryRating = 3.91, Avoidance = 0.92, MinDamage = 0.285, MaxDamage = 0.285, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ CritRating = 16.57, Strength = 16.15, MasteryRating = 12.4, HasteRating = 10.36, Versatility = 9.23, MaxDamage = 2.0975, MinDamage = 2.0975, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Strength = 15.48, MasteryRating = 12.34, CritRating = 9.78, HasteRating = 9.05, Versatility = 8.7, MinDamage = 1.48, MaxDamage = 1.48, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility = 16.46, CritRating = 10.44, Versatility = 9.71, MasteryRating = 8.18, HasteRating = 7.76, MaxDamage = 2.925, MinDamage = 2.925, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Armor = 57.74, Leech = 14.44, Versatility = 11.15, Stamina = 10.39, Agility = 9.13, MasteryRating = 9.09, CritRating = 7.65, HasteRating = 5.95, Avoidance = 1.37, MaxDamage = 0.29, MinDamage = 0.29, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ MasteryRating = 16.06, Intellect = 15.94, HasteRating = 14.22, CritRating = 11.94, Versatility = 10.82, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility = 12.88, CritRating = 7.95, MasteryRating = 7.08, Versatility = 6.93, HasteRating = 6.91, MinDamage = 3.305, MaxDamage = 3.305, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Armor = 106.39, Leech = 17.14, Stamina = 15.41, Versatility = 11.89, MasteryRating = 11.13, HasteRating = 5.65, CritRating = 3.88, Avoidance = 3.56, Agility = 2.84, MaxDamage = 0.1775, MinDamage = 0.1775, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ MasteryRating = 15.14, Intellect = 12.96, CritRating = 9.81, Versatility = 8.91, HasteRating = 8.19, Leech = 4.86, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility = 19.07, MasteryRating = 16.92, HasteRating = 11.81, CritRating = 11.72, Versatility = 10.34, MinDamage = 1.12, MaxDamage = 1.12, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ MasteryRating = 18.74, Agility = 15.2, HasteRating = 13.1, CritRating = 12.79, Versatility = 10.48, MinDamage = 6.25, MaxDamage = 6.25, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility = 16.1, CritRating = 9.46, Versatility = 8.98, HasteRating = 7.54, MinDamage = 1.695, MaxDamage = 1.695, MasteryRating = 1.55, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Intellect = 11.81, CritRating = 9.48, Versatility = 8.79, HasteRating = 8.69, MasteryRating = 8.22, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Intellect = 17.14, CritRating = 13.3, MasteryRating = 13.02, HasteRating = 12.76, Versatility = 11.72, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ HasteRating = 17.82, Intellect = 15.88, CritRating = 12.63, Versatility = 10.64, MasteryRating = 5.63, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Armor = 52.17, Leech = 14.87, Stamina = 13.57, Versatility = 11.06, MasteryRating = 10.09, CritRating = 7.47, Agility = 7.03, HasteRating = 6.36, Avoidance = 1.39, MinDamage = 0.01, MovementSpeed = 0.01, MaxDamage = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Intellect = 12.31, CritRating = 9.1, Versatility = 8.47, MasteryRating = 8.19, HasteRating = 6.49, Leech = 3.98, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility = 19.36, CritRating = 10.44, MasteryRating = 10.14, Versatility = 9.62, HasteRating = 7.9, MaxDamage = 0.53, MinDamage = 0.53, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Intellect = 12.69, CritRating = 11.84, MasteryRating = 10.45, Versatility = 8.75, Leech = 3.62, HasteRating = 3.39, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor = 42.72, Stamina = 11.8, HasteRating = 10.8, Versatility = 9.25, MasteryRating = 8.49, CritRating = 8, Leech = 7.87, Strength = 3.52, Avoidance = 3.27, MinDamage = 0.02, MaxDamage = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Strength = 14.92, HasteRating = 11.89, CritRating = 11.11, Versatility = 9.9, MasteryRating = 5.08, MinDamage = 4.115, MaxDamage = 4.115, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Intellect = 11.28, CritRating = 8.2, Leech = 8.17, Versatility = 7.63, MasteryRating = 4.79, HasteRating = 2.84, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Intellect = 14.71, CritRating = 14.7, MasteryRating = 12.35, Versatility = 10.22, HasteRating = 4.21, Leech = 3.79, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ HasteRating = 15.1, CritRating = 13.33, Intellect = 12.27, MasteryRating = 11.86, Versatility = 8.72, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility = 17.46, MasteryRating = 13.05, CritRating = 10.66, Versatility = 8.75, HasteRating = 4.4, MaxDamage = 0.84, MinDamage = 0.84, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility = 16.64, HasteRating = 9.77, CritRating = 9.4, Versatility = 9.17, MasteryRating = 8.33, MovementSpeed = 1.87, MaxDamage = 1.775, MinDamage = 1.775, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility = 16.83, MasteryRating = 11.26, CritRating = 9, Versatility = 8.78, HasteRating = 4.65, MaxDamage = 1.4625, MinDamage = 1.4625, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ CritRating = 17.57, HasteRating = 15.61, Intellect = 15.11, Versatility = 10.2, MasteryRating = 7.21, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility = 14.49, MasteryRating = 12.09, HasteRating = 10.96, CritRating = 9.13, Versatility = 8.42, MaxDamage = 2.39, MinDamage = 2.39, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Intellect = 12.51, CritRating = 12.46, MasteryRating = 9.84, Versatility = 8.81, HasteRating = 6.05, Leech = 3.34, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Intellect = 12.95, HasteRating = 11.98, CritRating = 10.31, Versatility = 8.69, MasteryRating = 7.99, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ HasteRating = 14.2, Intellect = 10.27, CritRating = 8.06, Versatility = 7.89, MasteryRating = 5.69, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Intellect = 16.33, HasteRating = 16.32, MasteryRating = 14.28, CritRating = 13.05, Versatility = 11.36, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ HasteRating = 14.91, Strength = 12.64, MasteryRating = 11.12, Versatility = 9.94, CritRating = 9.71, MinDamage = 6.385, MaxDamage = 6.385, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ HasteRating = 10, Strength = 9.68, Versatility = 7.53, CritRating = 7.19, MasteryRating = 6.29, MaxDamage = 2.25, MinDamage = 2.25, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor = 29.84, Leech = 16.32, Strength = 14.15, Versatility = 13.14, MasteryRating = 11.53, Stamina = 8.15, CritRating = 2.7, HasteRating = 1.88, Avoidance = 0.02, MinDamage = 0.015, MaxDamage = 0.015, MovementSpeed = 0.01 }
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
