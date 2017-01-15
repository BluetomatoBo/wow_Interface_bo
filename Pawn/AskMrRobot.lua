-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0112

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
	{ Agility = 15.32, CritRating = 9.75, Versatility = 9.06, MasteryRating = 7.68, HasteRating = 7.26, MaxDamage = 2.65, MinDamage = 2.65, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
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
	{ Intellect = 14.19, MasteryRating = 12.74, HasteRating = 12.72, CritRating = 10.32, Versatility = 9.59, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility = 12.53, CritRating = 7.41, Versatility = 6.85, MasteryRating = 6.67, HasteRating = 5.81, MaxDamage = 1.7825, MinDamage = 1.7825, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
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
	{ Agility = 17.24, MasteryRating = 13.53, HasteRating = 11.86, CritRating = 10.25, Versatility = 9.14, MinDamage = 0.84, MaxDamage = 0.84, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ MasteryRating = 15.16, Agility = 12.9, HasteRating = 10.68, CritRating = 10.46, Versatility = 8.48, MinDamage = 5.27, MaxDamage = 5.27, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility = 16.79, CritRating = 10.12, Versatility = 9.99, HasteRating = 8.88, MinDamage = 2.615, MaxDamage = 2.615, MasteryRating = 1.38, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Intellect = 12.25, CritRating = 9.41, HasteRating = 8.84, Versatility = 8.59, MasteryRating = 8.27, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Intellect = 16.74, MasteryRating = 13.13, CritRating = 12.68, HasteRating = 12.22, Versatility = 11.43, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ HasteRating = 17.26, Intellect = 14.95, CritRating = 12.07, Versatility = 10.05, MasteryRating = 5.28, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
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
	{ Agility = 19.72, CritRating = 10.7, MasteryRating = 10.43, Versatility = 9.9, HasteRating = 8.24, MaxDamage = 0.49, MinDamage = 0.49, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Intellect = 11.29, CritRating = 9.26, MasteryRating = 7.97, Versatility = 6.76, HasteRating = 2.92, Leech = 2.07, Avoidance = 0.02, MovementSpeed = 0.01 }
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
	{ Strength = 14.27, HasteRating = 12.18, CritRating = 10.51, Versatility = 9.19, MasteryRating = 4.23, MinDamage = 4.135, MaxDamage = 4.135, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Intellect = 11.89, CritRating = 8.6, Leech = 7.95, Versatility = 7.88, HasteRating = 6.57, MasteryRating = 4.88, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Intellect = 14.54, CritRating = 14.38, MasteryRating = 12.22, Versatility = 10.08, HasteRating = 4.08, Leech = 3.48, Avoidance = 0.02, MovementSpeed = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ HasteRating = 17.39, CritRating = 14.72, Intellect = 13.72, MasteryRating = 13.5, Versatility = 9.37, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility = 17.43, MasteryRating = 11.74, CritRating = 11.33, Versatility = 8.9, HasteRating = 5.34, MaxDamage = 0.96, MinDamage = 0.96, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility = 18.81, MasteryRating = 11.42, CritRating = 10.36, Versatility = 10.14, HasteRating = 9.79, MaxDamage = 2.2, MinDamage = 2.2, MovementSpeed = 2.01, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility = 17.02, MasteryRating = 11.55, CritRating = 9.31, Versatility = 9.06, HasteRating = 4.47, MaxDamage = 1.47, MinDamage = 1.47, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ CritRating = 17.66, HasteRating = 15.62, Intellect = 15.04, Versatility = 10.25, MasteryRating = 7.28, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility = 13.91, MasteryRating = 11.48, HasteRating = 10.37, CritRating = 8.63, Versatility = 8.06, MaxDamage = 2.2925, MinDamage = 2.2925, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
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
	{ Intellect = 12.94, HasteRating = 12.39, CritRating = 10.92, MasteryRating = 9.28, Versatility = 9.25, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ HasteRating = 14.33, Intellect = 10.31, CritRating = 8.01, Versatility = 7.78, MasteryRating = 5.71, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ HasteRating = 15.57, Intellect = 15.41, MasteryRating = 13.51, CritRating = 12.33, Versatility = 10.89, Avoidance = 0.03, MovementSpeed = 0.02, Leech = 0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ HasteRating = 13.27, Strength = 11.76, MasteryRating = 10.27, CritRating = 9.55, Versatility = 9.23, MinDamage = 6.08, MaxDamage = 6.08, MovementSpeed = 0.03, Avoidance = 0.02, Leech = 0.01 }
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
	{ Armor = 26.82, Leech = 19.91, Versatility = 15.92, Strength = 14.16, MasteryRating = 12.99, Stamina = 9.17, CritRating = 4, HasteRating = 3.74, Avoidance = 1.49, MinDamage = 0.405, MaxDamage = 0.405, MovementSpeed = 0.01 }
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
