-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2018 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0220 -- no actual weight updates in this version, but gem values changed


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=0.95, Avoidance=0.01, CritRating=12.46, HasteRating=11.24, Indestructible=0.01, Leech=0.95, MasteryRating=9.64, MaxDamage=0.00, MinDamage=0.00, MovementSpeed=0.00, Stamina=0.95, Strength=12.89, Versatility=10.39 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=25.30, HasteRating=23.39, Indestructible=0.01, Leech=0.01, MasteryRating=20.94, MaxDamage=2.67, MinDamage=2.67, MovementSpeed=0.03, Strength=22.89, Versatility=18.91 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=19.17, HasteRating=22.85, Indestructible=0.01, Leech=0.01, MasteryRating=24.22, MaxDamage=1.73, MinDamage=1.73, MovementSpeed=0.03, Strength=21.22, Versatility=17.50 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=19.25, Avoidance=0.02, CritRating=27.74, HasteRating=16.47, Indestructible=0.01, Leech=0.01, MasteryRating=18.98, MaxDamage=8.15, MinDamage=8.15, MovementSpeed=0.03, Versatility=19.11 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=16.64, Avoidance=0.00, CritRating=14.23, HasteRating=11.99, Indestructible=0.01, Leech=0.00, MasteryRating=13.66, MovementSpeed=0.00, Stamina=0.00, Versatility=13.52 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=21.01, HasteRating=24.03, Indestructible=0.01, Intellect=18.14, Leech=0.01, MasteryRating=23.45, MovementSpeed=0.02, Versatility=18.84 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=23.44, Avoidance=0.02, CritRating=19.92, HasteRating=10.33, Indestructible=0.01, Leech=0.01, MasteryRating=15.34, MaxDamage=6.64, MinDamage=6.64, MovementSpeed=0.03, Versatility=18.43 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=13.01, Avoidance=0.01, CritRating=11.78, HasteRating=14.19, Indestructible=0.01, Leech=0.00, MasteryRating=11.63, MovementSpeed=0.00, Stamina=0.00, Versatility=11.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=13.36, HasteRating=7.70, Indestructible=0.01, Intellect=10.86, Leech=4.93, MasteryRating=12.98, MovementSpeed=0.01, Versatility=12.09 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=24.86, Avoidance=0.03, CritRating=23.30, HasteRating=26.67, Indestructible=0.01, Leech=0.01, MasteryRating=29.62, MaxDamage=2.33, MinDamage=2.33, MovementSpeed=0.02, Versatility=20.00 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=19.88, Avoidance=0.03, CritRating=27.88, HasteRating=25.12, Indestructible=0.01, Leech=0.01, MasteryRating=33.35, MaxDamage=9.83, MinDamage=9.83, MovementSpeed=0.02, Versatility=20.51 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=21.89, Avoidance=0.02, CritRating=20.76, HasteRating=21.92, Indestructible=0.01, Leech=0.01, MasteryRating=4.85, MaxDamage=3.53, MinDamage=3.53, MovementSpeed=0.03, Versatility=19.78 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=18.59, HasteRating=18.82, Indestructible=0.01, Intellect=17.27, Leech=0.01, MasteryRating=16.16, MovementSpeed=0.02, Versatility=17.94 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=20.27, HasteRating=19.85, Indestructible=0.01, Intellect=17.35, Leech=0.01, MasteryRating=16.59, MovementSpeed=0.02, Versatility=18.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=21.16, HasteRating=23.32, Indestructible=0.01, Intellect=18.52, Leech=0.01, MasteryRating=13.09, MovementSpeed=0.02, Versatility=19.28 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=28.83, Armor=27.31, Avoidance=0.01, CritRating=26.35, HasteRating=21.04, Indestructible=0.01, Leech=35.14, MasteryRating=29.39, MaxDamage=0.00, MinDamage=0.00, MovementSpeed=0.00, Stamina=16.45, Versatility=35.59 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=13.86, HasteRating=13.01, Indestructible=0.01, Intellect=11.09, Leech=0.93, MasteryRating=7.53, MovementSpeed=0.01, Versatility=13.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=24.05, Avoidance=0.02, CritRating=19.45, HasteRating=13.03, Indestructible=0.01, Leech=0.01, MasteryRating=20.18, MaxDamage=0.93, MinDamage=0.93, MovementSpeed=0.03, Versatility=18.57 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=17.52, HasteRating=16.82, Indestructible=0.01, Intellect=9.93, Leech=10.61, MasteryRating=13.58, MovementSpeed=0.01, Versatility=12.31 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=10.80, Avoidance=0.01, CritRating=27.40, HasteRating=32.38, Indestructible=0.01, Leech=13.17, MasteryRating=28.02, MaxDamage=0.00, MinDamage=0.00, MovementSpeed=0.00, Stamina=10.84, Strength=26.68, Versatility=29.70 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=22.60, HasteRating=20.12, Indestructible=0.01, Leech=0.01, MasteryRating=18.64, MaxDamage=6.49, MinDamage=6.49, MovementSpeed=0.03, Strength=17.78, Versatility=18.39 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=9.97, HasteRating=22.10, Indestructible=0.01, Intellect=8.91, Leech=0.56, MasteryRating=7.71, MovementSpeed=0.01, Versatility=9.38 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=19.01, HasteRating=8.04, Indestructible=0.01, Intellect=15.08, Leech=5.94, MasteryRating=15.07, MovementSpeed=0.01, Versatility=16.64 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=20.57, HasteRating=30.16, Indestructible=0.01, Intellect=17.40, Leech=0.01, MasteryRating=19.91, MovementSpeed=0.02, Versatility=17.12 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=21.41, Avoidance=0.02, CritRating=19.88, HasteRating=9.86, Indestructible=0.01, Leech=0.01, MasteryRating=23.53, MaxDamage=2.96, MinDamage=2.96, MovementSpeed=0.03, Versatility=17.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=19.96, Avoidance=0.02, CritRating=13.00, HasteRating=12.85, Indestructible=0.01, Leech=0.01, MasteryRating=9.74, MaxDamage=3.14, MinDamage=3.14, MovementSpeed=0.77, Versatility=16.57 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=21.50, Avoidance=0.02, CritRating=22.03, HasteRating=7.88, Indestructible=0.01, Leech=0.01, MasteryRating=18.87, MaxDamage=8.04, MinDamage=8.04, MovementSpeed=0.03, Versatility=18.19 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=22.88, HasteRating=22.71, Indestructible=0.01, Intellect=19.32, Leech=0.01, MasteryRating=17.48, MovementSpeed=0.02, Versatility=19.79 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=21.72, Avoidance=0.02, CritRating=18.65, HasteRating=24.63, Indestructible=0.01, Leech=0.01, MasteryRating=21.24, MaxDamage=4.78, MinDamage=4.78, MovementSpeed=0.03, Versatility=18.82 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=18.29, HasteRating=11.67, Indestructible=0.01, Intellect=13.00, Leech=4.47, MasteryRating=14.70, MovementSpeed=0.01, Versatility=14.36 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=22.83, HasteRating=24.85, Indestructible=0.01, Intellect=17.62, Leech=0.01, MasteryRating=25.22, MovementSpeed=0.02, Versatility=18.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=19.43, HasteRating=34.99, Indestructible=0.01, Intellect=17.78, Leech=0.01, MasteryRating=21.29, MovementSpeed=0.02, Versatility=18.66 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=22.49, HasteRating=26.85, Indestructible=0.01, Intellect=19.21, Leech=0.01, MasteryRating=22.62, MovementSpeed=0.02, Versatility=19.76 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=14.55, HasteRating=17.62, Indestructible=0.01, Leech=0.01, MasteryRating=27.99, MaxDamage=6.38, MinDamage=6.38, MovementSpeed=0.03, Strength=16.83, Versatility=17.58 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=18.82, HasteRating=22.69, Indestructible=0.01, Leech=0.01, MasteryRating=16.12, MaxDamage=4.28, MinDamage=4.28, MovementSpeed=0.03, Strength=13.84, Versatility=15.58 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Avoidance=0.01, CritRating=14.06, HasteRating=17.22, Indestructible=0.01, Leech=0.01, MasteryRating=15.63, MovementSpeed=0.00, Stamina=0.00, Strength=18.07, Versatility=13.62 }
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
