-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0208
-- Currently using the Mythic+ level 870 weights.


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor = 30.28, Versatility = 13.8, MasteryRating = 12.42, Leech = 11.62, CritRating = 8.23, HasteRating = 8.16, Strength = 5.86, Stamina = 5.3, MinDamage = 0.67, MaxDamage = 0.67, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Strength = 15.91, CritRating = 15.76, HasteRating = 13.8, MasteryRating = 12.94, Versatility = 12.35, MaxDamage = 1.7325, MinDamage = 1.7325, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ MasteryRating = 17.76, Strength = 17.75, HasteRating = 17.68, CritRating = 14.71, Versatility = 13.42, MinDamage = 1.57, MaxDamage = 1.57, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ CritRating = 23.13, HasteRating = 15.51, Agility = 14.29, Versatility = 13.63, MasteryRating = 12.77, MaxDamage = 4.69, MinDamage = 4.69, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Leech = 12.98, Armor = 8.56, Versatility = 4.32, Avoidance = 4.22, Agility = 3.46, CritRating = 2.85, HasteRating = 2.73, Stamina = 2.7, MasteryRating = 2.46, MinDamage = 0.32, MaxDamage = 0.32, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ HasteRating = 18.86, MasteryRating = 18.66, Intellect = 15.66, Versatility = 15.39, CritRating = 15.33, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility = 19.79, CritRating = 17.08, MasteryRating = 16.44, Versatility = 14.76, HasteRating = 8.96, MinDamage = 5.39, MaxDamage = 5.39, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Armor = 45.79, Leech = 21.28, Versatility = 8.04, MasteryRating = 6.57, Stamina = 5.52, HasteRating = 5.51, CritRating = 2.58, Agility = 2.4, Avoidance = 1.32, MinDamage = 0.02, MaxDamage = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ MasteryRating = 16.24, CritRating = 13.43, Intellect = 12.11, Versatility = 12.09, HasteRating = 9.13, Leech = 5.88, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ MasteryRating = 21.53, Agility = 19.32, HasteRating = 18.71, CritRating = 15.97, Versatility = 14.47, MinDamage = 2.08, MaxDamage = 2.08, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 })

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ MasteryRating = 25.3, CritRating = 19.46, HasteRating = 18.6, Agility = 16.68, Versatility = 15.98, MinDamage = 8.045, MaxDamage = 8.045, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ HasteRating = 17.45, Agility = 16.33, CritRating = 14.76, Versatility = 14.27, MasteryRating = 4.01, MinDamage = 2.945, MaxDamage = 2.945, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ HasteRating = 18.49, CritRating = 16.29, Intellect = 15.67, Versatility = 15.51, MasteryRating = 13.88, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ HasteRating = 18.24, CritRating = 17.38, Intellect = 16.15, Versatility = 15.78, MasteryRating = 14.12, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ HasteRating = 19.19, CritRating = 17.72, Intellect = 16.98, Versatility = 15.93, MasteryRating = 12.58, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Armor = 10.84, Leech = 9, Versatility = 3.98, Stamina = 3.73, HasteRating = 3.15, MasteryRating = 2.95, Agility = 2.52, CritRating = 1.66, Avoidance = 1.04, MinDamage = 0.19, MaxDamage = 0.19, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ CritRating = 15.86, Intellect = 15.36, Versatility = 15.23, MasteryRating = 12.36, HasteRating = 11.91, Leech = 2.18, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility = 17.95, MasteryRating = 13.79, CritRating = 13.08, Versatility = 12.3, HasteRating = 9.69, MaxDamage = 0.69, MinDamage = 0.69, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ CritRating = 16.65, HasteRating = 14.35, MasteryRating = 13.21, Versatility = 11.19, Intellect = 10.95, Leech = 10.11, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Leech = 11.32, Versatility = 10.08, HasteRating = 10.07, Armor = 8.6, MasteryRating = 7.51, Stamina = 7.47, CritRating = 5.12, Strength = 3.18, Avoidance = 0.02, MinDamage = 0.015, MaxDamage = 0.015, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ HasteRating = 15.14, CritRating = 14.83, Strength = 13.42, Versatility = 13.07, MasteryRating = 10.74, MinDamage = 5.305, MaxDamage = 5.305, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ HasteRating = 19.77, Intellect = 9.86, CritRating = 9.04, Versatility = 8.6, MasteryRating = 8.07, Leech = 0.93, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ CritRating = 16.53, Intellect = 14.89, Versatility = 14.69, MasteryRating = 13.1, Leech = 7.65, HasteRating = 1.89, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ HasteRating = 23.69, CritRating = 17.76, Intellect = 15.78, MasteryRating = 15.6, Versatility = 14.72, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ MasteryRating = 21.29, Agility = 20.67, Versatility = 15.62, CritRating = 15.02, HasteRating = 8.82, MaxDamage = 1.7375, MinDamage = 1.7375, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility = 18.36, HasteRating = 16, Versatility = 13.56, CritRating = 12.46, MasteryRating = 9.48, MaxDamage = 1.8625, MinDamage = 1.8625, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility = 19.39, MasteryRating = 16.04, Versatility = 15.73, CritRating = 15.62, HasteRating = 8.37, MaxDamage = 3.9775, MinDamage = 3.9775, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ CritRating = 17.91, Intellect = 15.94, HasteRating = 15.45, Versatility = 15.05, MasteryRating = 14.84, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ HasteRating = 22.07, MasteryRating = 20.12, Agility = 19.34, CritRating = 16.53, Versatility = 16.03, MaxDamage = 3.33, MinDamage = 3.33, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ CritRating = 18.11, MasteryRating = 15.16, Intellect = 14.34, Versatility = 13.94, HasteRating = 9.24, Leech = 7.15, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ HasteRating = 21.34, MasteryRating = 20.4, CritRating = 18.48, Intellect = 16.62, Versatility = 15.18, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ HasteRating = 28.54, MasteryRating = 18.59, CritRating = 16.99, Versatility = 16.57, Intellect = 15.32, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ HasteRating = 20.12, CritRating = 17.67, MasteryRating = 15.76, Intellect = 15.64, Versatility = 15.4, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ MasteryRating = 25.23, HasteRating = 16.48, Strength = 16.27, Versatility = 15.2, CritRating = 13.15, MinDamage = 5.91, MaxDamage = 5.91, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ HasteRating = 18.44, CritRating = 13.27, MasteryRating = 13.19, Versatility = 12.7, Strength = 12.35, MaxDamage = 2.815, MinDamage = 2.815, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Leech = 6.08, Armor = 3.52, Strength = 3.09, Versatility = 2.43, MasteryRating = 2.02, Stamina = 1.26, HasteRating = 1.18, MinDamage = 0.065, MaxDamage = 0.065, Avoidance = 0.02, MovementSpeed = 0.01, CritRating = 0 }
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
