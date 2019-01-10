-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2019 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0231


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=49.61, Avoidance=5.23, CritRating=37.23, HasteRating=27.55, Indestructible=0.01, Leech=11.35, MasteryRating=28.67, MaxDamage=12.26, MinDamage=12.26, MovementSpeed=0.01, Stamina=45.95, Strength=26.04, Versatility=55.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=1.25, HasteRating=1.06, Indestructible=0.01, Leech=0.01, MasteryRating=1.35, MaxDamage=1.22, MinDamage=1.22, MovementSpeed=0.03, Strength=1.79, Versatility=1.05 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.20, HasteRating=1.28, Indestructible=0.01, Leech=0.01, MasteryRating=1.06, MaxDamage=1.20, MinDamage=1.20, MovementSpeed=0.03, Strength=1.70, Versatility=1.07 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=1.77, Avoidance=0.02, CritRating=1.01, HasteRating=1.12, Indestructible=0.01, Leech=0.01, MasteryRating=0.86, MaxDamage=1.60, MinDamage=1.60, MovementSpeed=0.03, Versatility=1.06 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=23.72, Armor=71.15, Avoidance=8.77, CritRating=30.08, HasteRating=32.84, Indestructible=0.01, Leech=18.04, MasteryRating=11.95, MaxDamage=4.73, MinDamage=4.73, MovementSpeed=0.01, Stamina=34.34, Versatility=42.90 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.16, HasteRating=1.34, Indestructible=0.01, Intellect=1.68, Leech=0.01, MasteryRating=0.93, MovementSpeed=0.02, Versatility=1.03 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=1.57, Avoidance=0.02, CritRating=1.23, HasteRating=1.46, Indestructible=0.01, Leech=0.01, MasteryRating=0.66, MaxDamage=1.23, MinDamage=1.23, MovementSpeed=0.03, Versatility=1.00 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=16.27, Armor=65.03, Avoidance=4.78, CritRating=17.19, HasteRating=13.24, Indestructible=0.01, Leech=10.56, MasteryRating=23.85, MaxDamage=1.52, MinDamage=1.52, MovementSpeed=0.01, Stamina=29.04, Versatility=25.60 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=1.95, HasteRating=1.94, Indestructible=0.01, Intellect=2.77, Leech=3.04, MasteryRating=2.23, MovementSpeed=0.01, Versatility=2.12 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=1.63, Avoidance=0.03, CritRating=1.11, HasteRating=1.01, Indestructible=0.01, Leech=0.01, MasteryRating=1.05, MaxDamage=0.81, MinDamage=0.81, MovementSpeed=0.02, Versatility=0.91 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=1.62, Avoidance=0.03, CritRating=0.88, HasteRating=1.15, Indestructible=0.01, Leech=0.01, MasteryRating=1.27, MaxDamage=1.49, MinDamage=1.49, MovementSpeed=0.02, Versatility=0.98 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=1.73, Avoidance=0.02, CritRating=1.12, HasteRating=1.35, Indestructible=0.01, Leech=0.01, MasteryRating=0.90, MaxDamage=1.05, MinDamage=1.05, MovementSpeed=0.03, Versatility=1.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.24, HasteRating=1.23, Indestructible=0.01, Intellect=1.80, Leech=0.01, MasteryRating=0.96, MovementSpeed=0.02, Versatility=1.08 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.19, HasteRating=1.36, Indestructible=0.01, Intellect=1.76, Leech=0.01, MasteryRating=1.01, MovementSpeed=0.02, Versatility=1.08 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=1.09, HasteRating=1.10, Indestructible=0.01, Intellect=1.69, Leech=0.01, MasteryRating=0.88, MovementSpeed=0.02, Versatility=1.03 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=47.60, Armor=76.85, Avoidance=4.76, CritRating=21.12, HasteRating=32.08, Indestructible=0.01, Leech=21.91, MasteryRating=67.08, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=47.56, Versatility=44.22 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=1.68, HasteRating=0.73, Indestructible=0.01, Intellect=2.36, Leech=2.65, MasteryRating=1.71, MovementSpeed=0.01, Versatility=1.75 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=1.50, Avoidance=0.02, CritRating=0.84, HasteRating=0.71, Indestructible=0.01, Leech=0.01, MasteryRating=0.83, MaxDamage=1.18, MinDamage=1.18, MovementSpeed=0.03, Versatility=1.09 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=1.98, HasteRating=0.29, Indestructible=0.01, Intellect=2.92, Leech=3.67, MasteryRating=2.39, MovementSpeed=0.01, Versatility=2.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=22.29, Avoidance=8.53, CritRating=20.31, HasteRating=16.83, Indestructible=0.01, Leech=9.79, MasteryRating=36.30, MaxDamage=1.93, MinDamage=1.93, MovementSpeed=0.01, Stamina=24.82, Strength=13.15, Versatility=26.77 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.18, HasteRating=1.36, Indestructible=0.01, Leech=0.01, MasteryRating=1.17, MaxDamage=1.33, MinDamage=1.33, MovementSpeed=0.03, Strength=1.70, Versatility=1.08 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=1.70, HasteRating=0.65, Indestructible=0.01, Intellect=2.48, Leech=2.29, MasteryRating=1.22, MovementSpeed=0.01, Versatility=1.92 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=2.31, HasteRating=0.03, Indestructible=0.01, Intellect=3.25, Leech=3.04, MasteryRating=2.86, MovementSpeed=0.01, Versatility=2.24 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.24, HasteRating=1.45, Indestructible=0.01, Intellect=1.67, Leech=0.01, MasteryRating=1.08, MovementSpeed=0.02, Versatility=1.02 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=1.64, Avoidance=0.02, CritRating=1.25, HasteRating=1.46, Indestructible=0.01, Leech=0.01, MasteryRating=1.08, MaxDamage=2.26, MinDamage=2.26, MovementSpeed=0.03, Versatility=0.99 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=1.78, Avoidance=0.02, CritRating=1.13, HasteRating=1.07, Indestructible=0.01, Leech=0.01, MasteryRating=1.06, MaxDamage=1.69, MinDamage=1.69, MovementSpeed=0.03, Versatility=1.05 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=1.70, Avoidance=0.02, CritRating=1.15, HasteRating=0.99, Indestructible=0.01, Leech=0.01, MasteryRating=1.04, MaxDamage=2.42, MinDamage=2.42, MovementSpeed=0.03, Versatility=1.02 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.24, HasteRating=1.31, Indestructible=0.01, Intellect=1.69, Leech=0.01, MasteryRating=0.92, MovementSpeed=0.02, Versatility=1.05 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=1.66, Avoidance=0.02, CritRating=1.06, HasteRating=1.20, Indestructible=0.01, Leech=0.01, MasteryRating=0.93, MaxDamage=1.15, MinDamage=1.15, MovementSpeed=0.03, Versatility=0.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=2.30, HasteRating=0.88, Indestructible=0.01, Intellect=2.52, Leech=2.27, MasteryRating=1.95, MovementSpeed=0.01, Versatility=1.89 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.12, HasteRating=1.34, Indestructible=0.01, Intellect=1.66, Leech=0.01, MasteryRating=1.39, MovementSpeed=0.02, Versatility=1.02 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.22, HasteRating=1.19, Indestructible=0.01, Intellect=1.80, Leech=0.01, MasteryRating=1.13, MovementSpeed=0.02, Versatility=1.11 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=1.20, HasteRating=1.36, Indestructible=0.01, Intellect=1.77, Leech=0.01, MasteryRating=1.31, MovementSpeed=0.02, Versatility=1.08 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.25, HasteRating=1.15, Indestructible=0.01, Leech=0.01, MasteryRating=1.11, MaxDamage=1.29, MinDamage=1.29, MovementSpeed=0.03, Strength=1.62, Versatility=1.02 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.03, HasteRating=1.33, Indestructible=0.01, Leech=0.01, MasteryRating=1.19, MaxDamage=0.87, MinDamage=0.87, MovementSpeed=0.03, Strength=1.57, Versatility=0.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=22.57, Avoidance=12.46, CritRating=18.29, HasteRating=16.01, Indestructible=0.01, Leech=11.54, MasteryRating=27.40, MaxDamage=18.36, MinDamage=18.36, MovementSpeed=0.01, Stamina=27.02, Strength=28.20, Versatility=33.74 }
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
