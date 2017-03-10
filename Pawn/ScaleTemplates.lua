-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Scale templates
------------------------------------------------------------


-- Test code for getting spec IDs matched up:
--/script local Index; for Index = 1, GetNumSpecializations() do local ID, Name = GetSpecializationInfo(Index) VgerCore.Message("(" .. Index .. ") Spec ID " .. ID .. " is " .. Name) end

-- Returns the template from PawnScaleTemplates for a given class ID and spec ID.
function PawnFindScaleTemplate(ClassID, SpecID)
	local _, Template
	
	for _, Template in pairs(PawnScaleTemplates) do
		if Template.ClassID == ClassID and Template.SpecID == SpecID then return Template end
	end

	VgerCore.Fail("Failed to find a scale template for class " .. tostring(ClassID) .. " and spec " .. tostring(SpecID))
end

-- Returns a starter set of stat values for a given template row returned by PawnFindScaleTemplate.
function PawnGetStatValuesForTemplate(Template, NoStats)
	local _, _, _, _, Role = GetSpecializationInfoForClassID(Template.ClassID, Template.SpecID)
	
	local ScaleValues
	if NoStats then
		ScaleValues = {}
	else
		ScaleValues = 
		{
			["Stamina"] = 0.01,

			["CritRating"] = 0.5,
			["HasteRating"] = 0.5,
			["MasteryRating"] = 0.5,
			["Versatility"] = 0.5,

			["MovementSpeed"] = 0.01,
			["Avoidance"] = 0.01,
			["Leech"] = 0.01,
			["Indestructible"] = 0.01,
		}

		ScaleValues[Template.PrimaryStat] = 1

		if Role == "TANK" then
			ScaleValues.Stamina = 1
			ScaleValues.Armor = 1
		end
	end

	local StatName
	for _, StatName in pairs(Template.UnusableStats) do
		ScaleValues[StatName] = PawnIgnoreStatValue
	end

	return ScaleValues
end



-- PawnScaleTemplates: Master list of scale templates for each class and spec. 
PawnScaleTemplates =
{

{
	["ClassID"] = 6, -- Death Knight
	["SpecID"] = 1, -- Blood
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsDagger", "IsFist", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsStaff", "IsWarglaive", "IsShield" }
},

{
	["ClassID"] = 6, -- Death Knight
	["SpecID"] = 2, -- Frost
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsDagger", "IsFist", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsStaff", "IsWarglaive", "IsShield" }
},

{
	["ClassID"] = 6, -- Death Knight
	["SpecID"] = 3, -- Unholy
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsDagger", "IsFist", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsStaff", "IsWarglaive", "IsShield" }
},

{
	["ClassID"] = 12, -- Demon Hunter
	["SpecID"] = 1, -- Havoc
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "Is2HAxe", "Is2HMace", "Is2HSword", "IsPolearm", "IsStaff", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 12, -- Demon Hunter
	["SpecID"] = 2, -- Vengeance
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "Is2HAxe", "Is2HMace", "Is2HSword", "IsPolearm", "IsStaff", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 1, -- Balance
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsAxe", "Is2HAxe", "IsSword", "Is2HSword", "IsWarglaive", "IsOffHand", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 2, -- Feral
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsAxe", "Is2HAxe", "IsSword", "Is2HSword", "IsWarglaive", "IsMail", "IsPlate", "IsShield" } -- ideally IsOffHand should be here as well, but the feral artifact is dual-wielded
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 3, -- Guardian
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsAxe", "Is2HAxe", "IsSword", "Is2HSword", "IsWarglaive", "IsMail", "IsPlate", "IsShield" } -- ideally IsOffHand should be here as well, but the guardian artifact is dual-wielded
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 4, -- Restoration
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsAxe", "Is2HAxe", "IsSword", "Is2HSword", "IsWarglaive", "IsOffHand", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 3, -- Hunter
	["SpecID"] = 1, -- Beast Mastery
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsWand", "IsFrill", "IsDagger", "IsPolearm", "IsStaff", "IsFist", "IsSword", "Is2HSword", "IsMace", "Is2HMace", "IsAxe", "Is2HAxe", "IsWarglaive", "IsOffHand", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 3, -- Hunter
	["SpecID"] = 2, -- Marksmanship
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsWand", "IsFrill", "IsDagger", "IsPolearm", "IsStaff", "IsFist", "IsSword", "Is2HSword", "IsMace", "Is2HMace", "IsAxe", "Is2HAxe", "IsWarglaive", "IsOffHand", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 3, -- Hunter
	["SpecID"] = 3, -- Survival
	["PrimaryStat"] = "Agility",
	["UnusableStats"] = { "IsWand", "IsFrill", "IsMace", "Is2HMace", "IsWarglaive", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 8, -- Mage
	["SpecID"] = 1, -- Arcane
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 8, -- Mage
	["SpecID"] = 2, -- Fire
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 8, -- Mage
	["SpecID"] = 3, -- Frost
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 10, -- Monk
	["SpecID"] = 1, -- Brewmaster
	["PrimaryStat"] = "Agility",
	["UnusableStats"] = { "IsDagger", "Is2HAxe", "Is2HMace", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 10, -- Monk
	["SpecID"] = 2, -- Mistweaver
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsDagger", "Is2HAxe", "Is2HMace", "Is2HSword", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 10, -- Monk
	["SpecID"] = 3, -- Windwalker
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsDagger", "Is2HAxe", "Is2HMace", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 2, -- Paladin
	["SpecID"] = 1, -- Holy
	["PrimaryStat"] = "Intellect",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsDagger", "IsFist", "IsStaff", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand" }
},

{
	["ClassID"] = 2, -- Paladin
	["SpecID"] = 2, -- Protection
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsDagger", "IsFist", "IsStaff", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand" }
},

{
	["ClassID"] = 2, -- Paladin
	["SpecID"] = 3, -- Retribution
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsDagger", "IsFist", "IsStaff", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand" }
},

{
	["ClassID"] = 5, -- Priest
	["SpecID"] = 1, -- Discipline
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "IsSword", "Is2HSword", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 5, -- Priest
	["SpecID"] = 2, -- Holy
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "IsSword", "Is2HSword", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 5, -- Priest
	["SpecID"] = 3, -- Shadow
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "IsSword", "Is2HSword", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 4, -- Rogue
	["SpecID"] = 1, -- Assassination
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFist", "IsPolearm", "IsStaff", "IsAxe", "Is2HAxe", "IsMace", "Is2HMace", "IsSword", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 4, -- Rogue
	["SpecID"] = 2, -- Outlaw
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsPolearm", "IsStaff", "Is2HAxe", "Is2HMace", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 4, -- Rogue
	["SpecID"] = 3, -- Subtlety
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFist", "IsPolearm", "IsStaff", "IsAxe", "Is2HAxe", "IsMace", "Is2HMace", "IsSword", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 7, -- Shaman
	["SpecID"] = 1, -- Elemental
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsPolearm", "IsSword", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand", "IsPlate" }
},

{
	["ClassID"] = 7, -- Shaman
	["SpecID"] = 2, -- Enhancement
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsPolearm", "IsSword", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 7, -- Shaman
	["SpecID"] = 3, -- Restoration
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsPolearm", "IsSword", "Is2HSword", "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand", "IsPlate" }
},

{
	["ClassID"] = 9, -- Warlock
	["SpecID"] = 1, -- Affliction
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 9, -- Warlock
	["SpecID"] = 2, -- Demonology
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 9, -- Warlock
	["SpecID"] = 3, -- Destruction
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield" }
},

{
	["ClassID"] = 1, -- Warrior
	["SpecID"] = 1, -- Arms
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive" }
},

{
	["ClassID"] = 1, -- Warrior
	["SpecID"] = 2, -- Fury
	["PrimaryStat"] = "Strength",
	["UnusableStats"] = { "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive" }
},

{
	["ClassID"] = 1, -- Warrior
	["SpecID"] = 3, -- Protection
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsWand", "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand" }
},

}