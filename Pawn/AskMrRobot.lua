-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2019 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0236


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=17.80, Avoidance=17.33, CritRating=17.69, HasteRating=14.29, Indestructible=0.01, Leech=8.39, MasteryRating=16.33, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=14.73, Strength=12.67, Versatility=28.98 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=1.51, HasteRating=1.27, Indestructible=0.01, Leech=0.01, MasteryRating=1.61, MaxDamage=1.26, MinDamage=1.26, MovementSpeed=0.03, Strength=1.83, Versatility=1.31 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.49, HasteRating=1.58, Indestructible=0.01, Leech=0.01, MasteryRating=1.26, MaxDamage=1.28, MinDamage=1.28, MovementSpeed=0.03, Strength=1.78, Versatility=1.34 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=1.84, Avoidance=0.02, CritRating=1.27, HasteRating=1.44, Indestructible=0.01, Leech=0.01, MasteryRating=1.05, MaxDamage=1.57, MinDamage=1.57, MovementSpeed=0.03, Versatility=1.32 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=9.90, Armor=46.73, Avoidance=0.02, CritRating=21.90, HasteRating=23.62, Indestructible=0.01, Leech=18.11, MasteryRating=4.11, MaxDamage=0.02, MinDamage=0.02, MovementSpeed=0.01, Stamina=17.20, Versatility=35.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.50, HasteRating=1.86, Indestructible=0.01, Intellect=1.87, Leech=0.01, MasteryRating=1.77, MovementSpeed=0.02, Versatility=1.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=1.80, Avoidance=0.02, CritRating=1.82, HasteRating=1.39, Indestructible=0.01, Leech=0.01, MasteryRating=1.57, MaxDamage=1.42, MinDamage=1.42, MovementSpeed=0.03, Versatility=1.34 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=9.29, Armor=28.15, Avoidance=10.14, CritRating=11.46, HasteRating=7.94, Indestructible=0.01, Leech=9.16, MasteryRating=14.69, MaxDamage=4.10, MinDamage=4.10, MovementSpeed=0.01, Stamina=10.34, Versatility=16.28 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=2.49, HasteRating=3.28, Indestructible=0.01, Intellect=2.91, Leech=1.86, MasteryRating=2.63, MovementSpeed=0.01, Versatility=2.68 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=1.79, Avoidance=0.03, CritRating=1.38, HasteRating=1.37, Indestructible=0.01, Leech=0.01, MasteryRating=1.47, MaxDamage=0.91, MinDamage=0.91, MovementSpeed=0.02, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=1.78, Avoidance=0.03, CritRating=1.39, HasteRating=1.47, Indestructible=0.01, Leech=0.01, MasteryRating=1.66, MaxDamage=1.71, MinDamage=1.71, MovementSpeed=0.02, Versatility=1.31 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=1.85, Avoidance=0.02, CritRating=1.44, HasteRating=1.86, Indestructible=0.01, Leech=0.01, MasteryRating=1.17, MaxDamage=1.13, MinDamage=1.13, MovementSpeed=0.03, Versatility=1.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.54, HasteRating=1.60, Indestructible=0.01, Intellect=1.85, Leech=0.01, MasteryRating=1.13, MovementSpeed=0.02, Versatility=1.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.25, HasteRating=1.47, Indestructible=0.01, Intellect=1.79, Leech=0.01, MasteryRating=1.41, MovementSpeed=0.02, Versatility=1.33 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=1.46, HasteRating=1.45, Indestructible=0.01, Intellect=1.80, Leech=0.01, MasteryRating=1.17, MovementSpeed=0.02, Versatility=1.34 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=8.34, Armor=14.74, Avoidance=7.02, CritRating=1.34, HasteRating=7.69, Indestructible=0.01, Leech=10.61, MasteryRating=13.25, MaxDamage=2.09, MinDamage=2.09, MovementSpeed=0.01, Stamina=5.98, Versatility=6.83 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=2.71, HasteRating=0.44, Indestructible=0.01, Intellect=2.89, Leech=3.45, MasteryRating=2.19, MovementSpeed=0.01, Versatility=2.72 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=1.64, Avoidance=0.02, CritRating=1.38, HasteRating=1.11, Indestructible=0.01, Leech=0.01, MasteryRating=1.28, MaxDamage=1.31, MinDamage=1.31, MovementSpeed=0.03, Versatility=1.41 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=2.41, HasteRating=0.17, Indestructible=0.01, Intellect=2.90, Leech=3.65, MasteryRating=3.02, MovementSpeed=0.01, Versatility=2.80 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=15.19, Avoidance=0.02, CritRating=15.61, HasteRating=12.79, Indestructible=0.01, Leech=6.65, MasteryRating=29.29, MaxDamage=4.62, MinDamage=4.62, MovementSpeed=0.01, Stamina=11.91, Strength=6.34, Versatility=19.81 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.42, HasteRating=1.61, Indestructible=0.01, Leech=0.01, MasteryRating=1.40, MaxDamage=1.29, MinDamage=1.29, MovementSpeed=0.03, Strength=1.72, Versatility=1.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=2.44, HasteRating=1.03, Indestructible=0.01, Intellect=2.68, Leech=2.50, MasteryRating=1.83, MovementSpeed=0.01, Versatility=2.65 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=3.03, HasteRating=0.83, Indestructible=0.01, Intellect=3.55, Leech=3.83, MasteryRating=3.97, MovementSpeed=0.01, Versatility=3.13 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.56, HasteRating=1.97, Indestructible=0.01, Intellect=1.75, Leech=0.01, MasteryRating=1.44, MovementSpeed=0.02, Versatility=1.26 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=1.62, Avoidance=0.02, CritRating=1.53, HasteRating=1.76, Indestructible=0.01, Leech=0.01, MasteryRating=1.28, MaxDamage=2.21, MinDamage=2.21, MovementSpeed=0.03, Versatility=1.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=1.72, Avoidance=0.02, CritRating=1.37, HasteRating=1.29, Indestructible=0.01, Leech=0.01, MasteryRating=1.10, MaxDamage=1.60, MinDamage=1.60, MovementSpeed=0.03, Versatility=1.26 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=1.71, Avoidance=0.02, CritRating=1.37, HasteRating=1.20, Indestructible=0.01, Leech=0.01, MasteryRating=1.19, MaxDamage=2.40, MinDamage=2.40, MovementSpeed=0.03, Versatility=1.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.82, HasteRating=1.61, Indestructible=0.01, Intellect=1.87, Leech=0.01, MasteryRating=0.75, MovementSpeed=0.02, Versatility=1.41 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=1.86, Avoidance=0.02, CritRating=1.52, HasteRating=1.65, Indestructible=0.01, Leech=0.01, MasteryRating=1.36, MaxDamage=1.58, MinDamage=1.58, MovementSpeed=0.03, Versatility=1.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=3.60, HasteRating=1.09, Indestructible=0.01, Intellect=2.83, Leech=3.08, MasteryRating=3.06, MovementSpeed=0.01, Versatility=2.80 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.29, HasteRating=1.49, Indestructible=0.01, Intellect=1.56, Leech=0.01, MasteryRating=1.57, MovementSpeed=0.02, Versatility=1.15 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.61, HasteRating=1.86, Indestructible=0.01, Intellect=2.02, Leech=0.01, MasteryRating=1.80, MovementSpeed=0.02, Versatility=1.52 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=1.56, HasteRating=1.71, Indestructible=0.01, Intellect=1.86, Leech=0.01, MasteryRating=1.63, MovementSpeed=0.02, Versatility=1.40 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.56, HasteRating=1.47, Indestructible=0.01, Leech=0.01, MasteryRating=1.36, MaxDamage=1.30, MinDamage=1.30, MovementSpeed=0.03, Strength=1.68, Versatility=1.29 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.28, HasteRating=1.67, Indestructible=0.01, Leech=0.01, MasteryRating=1.45, MaxDamage=0.88, MinDamage=0.88, MovementSpeed=0.03, Strength=1.61, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=13.27, Avoidance=4.93, CritRating=10.16, HasteRating=6.75, Indestructible=0.01, Leech=10.15, MasteryRating=15.59, MaxDamage=10.89, MinDamage=10.89, MovementSpeed=0.01, Stamina=10.82, Strength=15.57, Versatility=20.75 }
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
