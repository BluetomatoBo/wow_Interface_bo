-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2018 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0228


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=0.22, Avoidance=0.08, CritRating=0.83, HasteRating=0.61, Indestructible=0.01, Leech=0.06, MasteryRating=0.71, MaxDamage=0.59, MinDamage=0.59, MovementSpeed=0.01, Stamina=0.47, Strength=0.91, Versatility=0.90 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=1.09, HasteRating=1.08, Indestructible=0.01, Leech=0.01, MasteryRating=0.69, MaxDamage=0.99, MinDamage=0.99, MovementSpeed=0.03, Strength=1.79, Versatility=0.99 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.32, HasteRating=1.48, Indestructible=0.01, Leech=0.01, MasteryRating=1.04, MaxDamage=1.33, MinDamage=1.33, MovementSpeed=0.03, Strength=1.82, Versatility=1.22 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=1.78, Avoidance=0.02, CritRating=0.99, HasteRating=1.08, Indestructible=0.01, Leech=0.01, MasteryRating=0.95, MaxDamage=1.39, MinDamage=1.39, MovementSpeed=0.03, Versatility=1.09 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=1.35, Armor=0.44, Avoidance=0.10, CritRating=0.94, HasteRating=1.02, Indestructible=0.01, Leech=0.08, MasteryRating=0.68, MaxDamage=0.92, MinDamage=0.92, MovementSpeed=0.01, Stamina=0.56, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.43, HasteRating=1.44, Indestructible=0.01, Intellect=2.03, Leech=0.01, MasteryRating=1.24, MovementSpeed=0.02, Versatility=1.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=1.53, Avoidance=0.02, CritRating=1.25, HasteRating=1.70, Indestructible=0.01, Leech=0.01, MasteryRating=1.00, MaxDamage=2.19, MinDamage=2.19, MovementSpeed=0.03, Versatility=1.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=1.16, Armor=0.71, Avoidance=0.17, CritRating=0.97, HasteRating=1.20, Indestructible=0.01, Leech=0.13, MasteryRating=1.10, MaxDamage=0.98, MinDamage=0.98, MovementSpeed=0.01, Stamina=0.77, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=1.78, HasteRating=1.53, Indestructible=0.01, Intellect=2.62, Leech=0.91, MasteryRating=2.15, MovementSpeed=0.01, Versatility=1.71 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=2.13, Avoidance=0.03, CritRating=1.63, HasteRating=1.39, Indestructible=0.01, Leech=0.01, MasteryRating=1.33, MaxDamage=0.83, MinDamage=0.83, MovementSpeed=0.02, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=1.71, Avoidance=0.03, CritRating=1.10, HasteRating=1.09, Indestructible=0.01, Leech=0.01, MasteryRating=0.89, MaxDamage=1.65, MinDamage=1.65, MovementSpeed=0.02, Versatility=1.05 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=2.06, Avoidance=0.02, CritRating=1.36, HasteRating=1.50, Indestructible=0.01, Leech=0.01, MasteryRating=0.74, MaxDamage=1.55, MinDamage=1.55, MovementSpeed=0.03, Versatility=1.29 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.45, HasteRating=0.75, Indestructible=0.01, Intellect=2.02, Leech=0.01, MasteryRating=1.53, MovementSpeed=0.02, Versatility=1.23 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.85, HasteRating=1.76, Indestructible=0.01, Intellect=2.15, Leech=0.01, MasteryRating=1.51, MovementSpeed=0.02, Versatility=1.40 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=1.30, HasteRating=1.70, Indestructible=0.01, Intellect=2.41, Leech=0.01, MasteryRating=1.69, MovementSpeed=0.02, Versatility=1.64 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=0.97, Armor=0.07, Avoidance=0.05, CritRating=0.66, HasteRating=0.50, Indestructible=0.01, Leech=0.04, MasteryRating=0.84, MaxDamage=0.60, MinDamage=0.60, MovementSpeed=0.01, Stamina=0.47, Versatility=0.81 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=2.93, HasteRating=0.63, Indestructible=0.01, Intellect=4.60, Leech=0.93, MasteryRating=2.65, MovementSpeed=0.01, Versatility=2.82 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=1.99, Avoidance=0.02, CritRating=1.33, HasteRating=1.05, Indestructible=0.01, Leech=0.01, MasteryRating=1.55, MaxDamage=2.15, MinDamage=2.15, MovementSpeed=0.03, Versatility=1.43 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=1.69, HasteRating=0.01, Indestructible=0.01, Intellect=3.93, Leech=5.74, MasteryRating=3.04, MovementSpeed=0.01, Versatility=2.51 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=0.21, Avoidance=0.12, CritRating=1.08, HasteRating=1.03, Indestructible=0.01, Leech=0.09, MasteryRating=1.34, MaxDamage=1.02, MinDamage=1.02, MovementSpeed=0.01, Stamina=0.56, Strength=1.19, Versatility=1.11 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.51, HasteRating=1.34, Indestructible=0.01, Leech=0.01, MasteryRating=1.24, MaxDamage=1.70, MinDamage=1.70, MovementSpeed=0.03, Strength=2.09, Versatility=1.42 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=1.78, HasteRating=0.42, Indestructible=0.01, Intellect=3.07, Leech=1.07, MasteryRating=1.82, MovementSpeed=0.01, Versatility=1.91 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=3.38, HasteRating=0.19, Indestructible=0.01, Intellect=5.04, Leech=0.17, MasteryRating=4.79, MovementSpeed=0.01, Versatility=3.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.87, HasteRating=2.18, Indestructible=0.01, Intellect=2.17, Leech=0.01, MasteryRating=1.57, MovementSpeed=0.02, Versatility=1.42 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=2.40, Avoidance=0.02, CritRating=1.64, HasteRating=1.84, Indestructible=0.01, Leech=0.01, MasteryRating=1.55, MaxDamage=2.52, MinDamage=2.52, MovementSpeed=0.03, Versatility=1.33 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=2.03, Avoidance=0.02, CritRating=1.28, HasteRating=1.34, Indestructible=0.01, Leech=0.01, MasteryRating=0.84, MaxDamage=1.85, MinDamage=1.85, MovementSpeed=0.03, Versatility=1.15 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=1.72, Avoidance=0.02, CritRating=1.20, HasteRating=1.17, Indestructible=0.01, Leech=0.01, MasteryRating=0.09, MaxDamage=1.97, MinDamage=1.97, MovementSpeed=0.03, Versatility=1.07 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.56, HasteRating=1.60, Indestructible=0.01, Intellect=2.02, Leech=0.01, MasteryRating=1.00, MovementSpeed=0.02, Versatility=1.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=2.40, Avoidance=0.02, CritRating=1.63, HasteRating=1.75, Indestructible=0.01, Leech=0.01, MasteryRating=3.00, MaxDamage=1.92, MinDamage=1.92, MovementSpeed=0.03, Versatility=1.51 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=2.92, HasteRating=0.94, Indestructible=0.01, Intellect=3.81, Leech=0.72, MasteryRating=2.78, MovementSpeed=0.01, Versatility=2.23 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.44, HasteRating=1.58, Indestructible=0.01, Intellect=2.13, Leech=0.01, MasteryRating=1.93, MovementSpeed=0.02, Versatility=1.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.41, HasteRating=1.42, Indestructible=0.01, Intellect=2.11, Leech=0.01, MasteryRating=1.50, MovementSpeed=0.02, Versatility=1.29 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=1.94, HasteRating=2.18, Indestructible=0.01, Intellect=2.66, Leech=0.01, MasteryRating=1.95, MovementSpeed=0.02, Versatility=1.74 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.34, HasteRating=1.36, Indestructible=0.01, Leech=0.01, MasteryRating=0.19, MaxDamage=1.33, MinDamage=1.33, MovementSpeed=0.03, Strength=1.71, Versatility=1.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.21, HasteRating=1.30, Indestructible=0.01, Leech=0.01, MasteryRating=1.15, MaxDamage=1.04, MinDamage=1.04, MovementSpeed=0.03, Strength=1.60, Versatility=1.11 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=0.25, Avoidance=0.11, CritRating=0.91, HasteRating=0.71, Indestructible=0.01, Leech=0.09, MasteryRating=1.05, MaxDamage=0.94, MinDamage=0.94, MovementSpeed=0.01, Stamina=0.60, Strength=1.29, Versatility=1.13 }
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
