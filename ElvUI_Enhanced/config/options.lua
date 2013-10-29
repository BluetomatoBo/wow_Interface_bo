local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local EO = E:NewModule('EnhancedOptions', 'AceEvent-3.0')
local EP = LibStub('LibElvUIPlugin-1.0')
local ElvUIEnhanced = select(1, ...)

local tsort = table.sort

local positionValues = {
	TOPLEFT = 'TOPLEFT',
	LEFT = 'LEFT',
	BOTTOMLEFT = 'BOTTOMLEFT',
	RIGHT = 'RIGHT',
	TOPRIGHT = 'TOPRIGHT',
	BOTTOMRIGHT = 'BOTTOMRIGHT',
	CENTER = 'CENTER',
	TOP = 'TOP',
	BOTTOM = 'BOTTOM',
}

local raidmarkerVisibility = {
	DEFAULT = L['Use Default'],
	INPARTY = AGGRO_WARNING_IN_PARTY,
}

local function ColorizeSettingName(settingName)
	return ("|cffE0B0FF%s|r"):format(settingName)
end

function EO:DataTextOptions()
	local EDT = E:GetModule('ExtraDataTexts')

	E.Options.args.datatexts.args.actionbar1 = {
		order = 20,
		name = ColorizeSettingName(L['Actionbar1DataPanel']),
		type = 'toggle',
		set = function(info, value) 
			E.db.datatexts[ info[#info] ] = value
			EDT:ToggleSettings(1)
		end,
	}
	
	E.Options.args.datatexts.args.actionbar3 = {
		order = 21,
		name = ColorizeSettingName(L['Actionbar3DataPanel']),
		type = 'toggle',
		set = function(info, value) 
			E.db.datatexts[ info[#info] ] = value
			EDT:ToggleSettings(3)
		end,
	}
	
	E.Options.args.datatexts.args.actionbar5 = {
		order = 22,
		name = ColorizeSettingName(L['Actionbar5DataPanel']),
		type = 'toggle',
		set = function(info, value) 
			E.db.datatexts[ info[#info] ] = value
			EDT:ToggleSettings(5)
		end,
	}
end

function EO:EquipmentOptions()
	local EQ = E:GetModule('Equipment')
	local PD = E:GetModule('PaperDoll')
	local BI = E:GetModule('BagInfo')

	E.Options.args.equipment = {
		type = 'group',
		name = ColorizeSettingName(L['Equipment']),
		get = function(info) return E.private.equipment[ info[#info] ] end,
		set = function(info, value) E.private.equipment[ info[#info] ] = value end,
		args = {
			intro = {
				order = 1,
				type = 'description',
				name = L["EQUIPMENT_DESC"],
			},
			specialization = {
				order = 2,
				type = "group",
				name = L["Specialization"],
				guiInline = true,
				disabled = function() return GetNumEquipmentSets() == 0 end,
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L["Enable"],
						desc = L['Enable/Disable the specialization switch.'],
						get = function(info) return E.private.equipment.specialization.enable end,
						set = function(info, value) E.private.equipment.specialization.enable = value end
					},
					primary = {
						type = "select",
						order = 2,
						name = L["Primary Talent"],
						desc = L["Choose the equipment set to use for your primary specialization."],
						disabled = function() return not E.private.equipment.specialization.enable end,
						values = function()
							local sets = { ["none"] = L["No Change"] }
							for i = 1, GetNumEquipmentSets() do
								local name = GetEquipmentSetInfo(i)
								if name then
									sets[name] = name
								end
							end
							tsort(sets, function(a, b) return a < b end)
							return sets
						end,
					},
					secondary = {
						type = "select",
						order = 3,
						name = L["Secondary Talent"],
						desc = L["Choose the equipment set to use for your secondary specialization."],
						disabled = function() return not E.private.equipment.specialization.enable end,
						values = function()
							local sets = { ["none"] = L["No Change"] }
							for i = 1, GetNumEquipmentSets() do
								local name, _, _, _, _, _, _, _, _ = GetEquipmentSetInfo(i)
								if name then
									sets[name] = name
								end
							end
							tsort(sets, function(a, b) return a < b end)
							return sets
						end,
					},
				},
			},
			battleground = {
				order = 3,
				type = "group",
				name = L["Battleground"],
				guiInline = true,
				disabled = function() return GetNumEquipmentSets() == 0 end,
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L["Enable"],
						desc = L['Enable/Disable the battleground switch.'],
						get = function(info) return E.private.equipment.battleground.enable end,
						set = function(info, value) E.private.equipment.battleground.enable = value end
					},
					equipmentset = {
						type = "select",
						order = 2,
						name = L["Equipment Set"],
						desc = L["Choose the equipment set to use when you enter a battleground or arena."],
						disabled = function() return not E.private.equipment.battleground.enable end,
						values = function()
							local sets = {
								["none"] = L["No Change"],
							}
							for i = 1, GetNumEquipmentSets() do
								local name = GetEquipmentSetInfo(i)
								if name then
									sets[name] = name
								end
							end
							tsort(sets, function(a, b) return a < b end)
							return sets
						end,
					},
				},
			},
			intro2 = {
				type = "description",
				name = L["DURABILITY_DESC"],
				order = 4,
			},		
			durability = {
				type = 'group',
				name = DURABILITY,
				guiInline = true,
				order = 5,
				get = function(info) return E.private.equipment.durability[ info[#info] ] end,
				set = function(info, value) E.private.equipment.durability[ info[#info] ] = value PD:UpdatePaperDoll() end,
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L["Enable"],
						desc = L["Enable/Disable the display of durability information on the character screen."],
					},
					onlydamaged = {
						type = "toggle",
						order = 2,
						name = L["Damaged Only"],
						desc = L["Only show durabitlity information for items that are damaged."],
						disabled = function() return not E.private.equipment.durability.enable end,
					},
				},
			},
			intro3 = {
				type = "description",
				name = L["ITEMLEVEL_DESC"],
				order = 6,
			},		
			itemlevel = {
				type = 'group',
				name = STAT_AVERAGE_ITEM_LEVEL,
				guiInline = true,
				order = 7,
				get = function(info) return E.private.equipment.itemlevel[ info[#info] ] end,
				set = function(info, value) E.private.equipment.itemlevel[ info[#info] ] = value PD:UpdatePaperDoll() end,
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L["Enable"],
						desc = L["Enable/Disable the display of item levels on the character screen."],
					},
				},
			},
			misc = {
				type = 'group',
				name = L["Miscellaneous"],
				guiInline = true,
				order = 8,
				get = function(info) return E.private.equipment.misc[ info[#info] ] end,
				set = function(info, value) E.private.equipment.misc[ info[#info] ] = value end,
				disabled = function() return not E.private.bags.enable end,
				args = {
					setoverlay = {
						type = "toggle",
						order = 1,
						name = L['Equipment Set Overlay'],
						desc = L['Show the associated equipment sets for the items in your bags (or bank).'],
						set = function(info, value) E.private.equipment.misc[ info[#info] ] = value BI:ToggleSettings() end,
					}
				}
			}
		},
	}
	
	EQ:UpdateTalentConfiguration()
end

function EO:FarmerOptions()
	local F = E:GetModule('Farmer')

	E.Options.args.farmer = {
		type = 'group',
		name = ColorizeSettingName(L['Farmer']),
		get = function(info) return E.private.farmer[ info[#info] ] end,
		set = function(info, value) E.private.farmer[ info[#info] ] = value end,
		args = {
			intro = {
				order = 1,
				type = 'description',
				name = L["FARMER_DESC"],
			},
			enabled = {
				order = 2,
				type = 'toggle',
				name = L['Enable'],
				set = function(info, value) E.private.farmer.enabled = value E:StaticPopup_Show("PRIVATE_RL") end
			},
			farmbars = {
				order = 3,
				type = "group",
				name = L["Farmer Bars"],
				guiInline = true,
				disabled = function() return not E.private.farmer.enabled end,
				get = function(info) return E.private.farmer.farmbars[ info[#info] ] end,
				set = function(info, value) E.private.farmer.farmbars[ info[#info] ] = value end,
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L['Enable'],
						desc = L['Enable/Disable the farmer bars.'],
						set = function(info, value) E.private.farmer.farmbars.enable = value F:UpdateLayout() end
					},
					onlyactive = {
						order = 2,
						type = 'toggle',
						name = L['Only active buttons'],
						desc = L['Only show the buttons for the seeds, portals, tools you have in your bags.'],
						set = function(info, value) E.private.farmer.farmbars.onlyactive = value F:UpdateLayout() end,
						disabled = function() return not E.private.farmer.farmbars.enable end,
					},
					droptools = {
						order = 3,
						type = 'toggle',
						name = L['Drop Tools'],
						desc = L['Automatically drop tools from your bags when leaving the farming area.'],
						disabled = function() return not E.private.farmer.farmbars.enable end,
					},
					seedbardirection = {
						order = 4,
						type = 'select',
						name = L['Seed Bar Direction'],
						desc = L['The direction of the seed bar buttons (Horizontal or Vertical).'],
						set = function(info, value) E.private.farmer.farmbars.seedbardirection = value F:UpdateLayout() end,
						disabled = function() return not E.private.farmer.farmbars.enable end,
						values = {
							['VERTICAL'] = L['Vertical'],
							['HORIZONTAL'] = L['Horizontal'],
						},
					},				
				},
			},
		},
	}
end

function EO:MapOptions()
	local MB = E:GetModule('MinimapButtons')

	E.Options.args.general.args.minimap.args.locationdigits = {
		order = 4,
		type = 'range',
		name = ColorizeSettingName(L['Location Digits']),
		desc = L['Number of digits for map location.'],
		min = 0, max = 2, step = 1,
		get = function(info) return E.private.general.minimap.locationdigits end,
		set = function(info, value) E.private.general.minimap.locationdigits = value; E:GetModule('Minimap'):UpdateSettings() end,					
		disabled = function() return E.db.general.minimap.locationText ~= 'ABOVE' end,
	}

	E.Options.args.general.args.minimap.args.hideincombat = {
		order = 5,
		type = 'toggle',
		name = ColorizeSettingName(L["Combat Hide"]),
		desc = L["Hide minimap while in combat."],
		get = function(info) return E.private.general.minimap.hideincombat end,
		set = function(info, value) E.private.general.minimap.hideincombat = value; E:GetModule('Minimap'):UpdateSettings() end,					
	}
	
	E.Options.args.general.args.minimap.args.fadeindelay = {
		order = 6,
		type = 'range',
		name = ColorizeSettingName(L["FadeIn Delay"]),
		desc = L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"],
		min = 0, max = 20, step = 1,
		get = function(info) return E.private.general.minimap.fadeindelay end,	
		set = function(info, value) E.private.general.minimap.fadeindelay = value end,	
		disabled = function() return not E.private.general.minimap.hideincombat end,
	}
	
	E.Options.args.general.args.minimapbar = {
		order = 4,
		get = function(info) return E.private.general.minimapbar[ info[#info] ] end,
		set = function(info, value) E.private.general.minimapbar[ info[#info] ] = value; MB:UpdateLayout() end,
		type = "group",
		name = ColorizeSettingName(L["Minimap Button Bar"]),
		args = {
			skinButtons = {
				order = 1,
				type = 'toggle',
				name = L['Skin Buttons'],
				desc = L['Skins the minimap buttons in Elv UI style.'],
				set = function(info, value) E.private.general.minimapbar.skinButtons = value; E:StaticPopup_Show("PRIVATE_RL") end,					
			},
			skinStyle = {
				order = 2,
				type = 'select',
				name = L['Skin Style'],
				desc = L['Change settings for how the minimap buttons are skinned.'],
				disabled = function() return not E.private.general.minimapbar.skinButtons end,
				values = {
					['NOANCHOR'] = L['No Anchor Bar'],
					['HORIZONTAL'] = L['Horizontal Anchor Bar'],
					['VERTICAL'] = L['Vertical Anchor Bar'],
				},
			},
			layoutDirection = {
				order = 3,
				type = 'select',
				name = L['Layout Direction'],
				desc = L['Normal is right to left or top to bottom, or select reversed to switch directions.'],
				disabled = function() return not E.private.general.minimapbar.skinButtons or E.private.general.minimapbar.skinStyle == 'NOANCHOR' end,
				values = {
					['NORMAL'] = L['Normal'],
					['REVERSED'] = L['Reversed'],
				},
			},
			buttonSize = {
				order = 4,
				type = 'range',
				name = L['Button Size'],
				desc = L['The size of the minimap buttons.'],
				min = 16, max = 40, step = 1,
				disabled = function() return not E.private.general.minimapbar.skinButtons or E.private.general.minimapbar.skinStyle == 'NOANCHOR' end,
			},
			backdrop = {
				type = 'toggle',
				order = 5,
				name = L["Backdrop"],
				disabled = function() return not E.private.general.minimapbar.skinButtons or E.private.general.minimapbar.skinStyle == 'NOANCHOR' end,
			},			
			mouseover = {
				order = 6,
				name = L['Mouse Over'],
				desc = L['The frame is not shown unless you mouse over the frame.'],
				type = "toggle",
				set = function(info, value) E.private.general.minimapbar.mouseover = value; MB:ChangeMouseOverSetting() end,
				disabled = function() return not E.private.general.minimapbar.skinButtons or E.private.general.minimapbar.skinStyle == 'NOANCHOR' end,
			},
		}
	}
	
	E.Options.args.general.args.minimap.args.locationText.values = {
		['MOUSEOVER'] = L['Minimap Mouseover'],
		['SHOW'] = L['Always Display'],
		['ABOVE'] = L['Above Minimap'],
		['HIDE'] = L['Hide'],
	}
end

function EO:MiscOptions()
	local M = E:GetModule('MiscEnh')

	E.Options.args.general.args.general.args.pvpautorelease = {
		order = 40,
		type = "toggle",
		name = ColorizeSettingName(L['PvP Autorelease']),
		desc = L['Automatically release body when killed inside a battleground.'],
		get = function(info) return E.private.general.pvpautorelease end,
		set = function(info, value) E.private.general.pvpautorelease = value; E:StaticPopup_Show("PRIVATE_RL") end,
	}
	
	E.Options.args.general.args.general.args.autorepchange = {
		order = 41,
		type = "toggle",
		name = ColorizeSettingName(L['Track Reputation']),
		desc = L['Automatically change your watched faction on the reputation bar to the faction you got reputation points for.'],
		get = function(info) return E.private.general.autorepchange end,
		set = function(info, value) E.private.general.autorepchange = value; end,
	}
	
	E.Options.args.general.args.general.args.selectquestreward = {
		order = 42,
		type = "toggle",
		name = ColorizeSettingName(L['Select Quest Reward']),
		desc = L['Automatically select the quest reward with the highest vendor sell value.'],
		get = function(info) return E.private.general.selectquestreward end,
		set = function(info, value) E.private.general.selectquestreward = value; end,
	}
	
	E.Options.args.general.args.general.args.movertransparancy = {
		order = 4,
		type = 'range',
    isPercent = true,
    name = ColorizeSettingName(L["Mover Transparency"]),
    desc = L["Changes the transparency of all the movers."],
    min = 0, max = 1, step = 0.01,
    set = function(info, value) E.db.general.movertransparancy = value M:UpdateMoverTransparancy() end,
    get = function(info) return E.db.general.movertransparancy end,
	}
end

function EO:NameplateOptions()
	E.Options.args.nameplate.args.general.args.targetcount = {
		type = "toggle",
		order = 13,
		name = ColorizeSettingName(L["Target Count"]),
		desc = L["Display the number of party / raid members targetting the nameplate unit."],
	}
	E.Options.args.nameplate.args.general.args.showthreat = {
		type = "toggle",
		order = 13,
		name = ColorizeSettingName(L["Threat Text"]),
		desc = L["Display threat level as text on targeted, boss or mouseover nameplate."],
	}
end

function EO:RaidMarkerOptions()
	local RM = E:GetModule('RaidMarkerBar')
	
	E.Options.args.general.args.raidmarkerbar = {
		order = 7,
		get = function(info) return E.private.general.raidmarkerbar[ info[#info] ] end,	
		set = function(info, value) E.private.general.raidmarkerbar[ info[#info] ] = value; RM:ToggleSettings() end,
		type = "group",
		name = ColorizeSettingName(L['Raid Marker Bar']),
		args = {
			enable = {
				type = 'toggle',
				order = 2,
				name = L['Enable'],
				desc = L['Display a quick action bar for raid targets and world markers.'],	
			},
			visibility = {		
				type = 'select',
				order = 3,
				name = L["Visibility"],
				disabled = function() return not E.private.general.raidmarkerbar.enable end,
				values = raidmarkerVisibility,
			},
			backdrop = {
				type = 'toggle',
				order = 4,
				name = L["Backdrop"],
				disabled = function() return not E.private.general.raidmarkerbar.enable end,			
			},
			buttonSize = {
				order = 5,
				type = 'range',
				name = L['Button Size'],
				min = 16, max = 40, step = 1,
				disabled = function() return not E.private.general.raidmarkerbar.enable end,
			},
			spacing = {
				order = 6,
				type = 'range',
				name = L["Button Spacing"],
				min = 0, max = 10, step = 1,
				disabled = function() return not E.private.general.raidmarkerbar.enable end,
			},
			orientation = {
				order = 7,
				type = 'select',
				name = L['Orientation'],
				disabled = function() return not E.private.general.raidmarkerbar.enable end,
				values = {
					['HORIZONTAL'] = L['Horizontal'],
					['VERTICAL'] = L['Vertical'],
				},
			},
			modifier = {
				order = 8,
				type = 'select',
				name = L['Modifier Key'],
				desc = L['Set the modifier key for placing world markers.'],
				disabled = function() return not E.private.general.raidmarkerbar.enable end,
				values = {
					['shift-'] = L['Shift Key'],
					['ctrl-'] = L['Ctrl Key'],
					['alt-'] = L['Alt Key'],
				}
			}
		}
	}
end

function EO:TooltipOptions()
	E.Options.args.tooltip.args.general.args.progressInfo = {
		order = 8,
		type = 'toggle',
		name = ColorizeSettingName(L['Progression Info']),
		desc = L['Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit.'],
	}
end

function EO:UnitFramesOptions()
	local UF = E:GetModule('UnitFrames')
	local HG = E:GetModule('HealGlow')
	local TC = E:GetModule('TargetClass')
	
	E.Options.args.unitframe.args.general.args.healglowGroup = {
		order = 2,
		type = 'group',
		guiInline = true,
		name = ColorizeSettingName(L['Heal Glow']),
		args = {
			healglow = {
				type = 'toggle',
				order = 2,
				name = L['Enable'],
				desc = L['Direct AoE heals will let the unit frames of the affected party / raid members glow for the defined time period.'],	
				set = function(info, value) E.db.unitframe[ info[#info] ] = value; HG:UpdateSettings() end,
			},
			glowtime = {
				type = 'range',
				order = 3,
				name = L["Glow Duration"],
				desc = L["The amount of time the unit frames of party / raid members will glow when affected by a direct AoE heal."],
				min = .2, max = 3, step = .1,
				set = function(info, value) E.db.unitframe[ info[#info] ] = value; HG:UpdateSettings() end,
			},	
			glowcolor = {
				type = 'color',
				name = L["Glow Color"],
				order = 4,
				get = function(info)
					local t = E.db.unitframe[ info[#info] ]
					return t.r, t.g, t.b, t.a
				end,
				set = function(info, r, g, b)
					local t = E.db.unitframe[ info[#info] ]
					t.r, t.g, t.b = r, g, b
					HG:UpdateSettings()
				end,
			}
		},
	}

	--Target
	E.Options.args.unitframe.args.target.args.gps = {
		order = 1000,
		type = 'group',
		name = ColorizeSettingName(L['GPS']),
		get = function(info) return E.db.unitframe.units['target']['gps'][ info[#info] ] end,
		set = function(info, value) E.db.unitframe.units['target']['gps'][ info[#info] ] = value; UF:CreateAndUpdateUF('target') end,
		args = {
			enable = {
				type = 'toggle',
				order = 1,
				name = L['Enable'],
				desc = L['Show the direction and distance to the selected party or raid member.'],
			},
			position = {
				type = 'select',
				order = 3,
				name = L['Position'],
				values = positionValues,
			},
		},
	}
	
	E.Options.args.unitframe.args.target.args.attackicon = {
		order = 1001,
		type = 'group',
		name = ColorizeSettingName(L['Attack Icon']),
		get = function(info) return E.db.unitframe.units['target']['attackicon'][ info[#info] ] end,
		set = function(info, value) E.db.unitframe.units['target']['attackicon'][ info[#info] ] = value end,
		args = {
			enable = {
				type = 'toggle',
				order = 1,
				name = L['Enable'],
				desc = L['Show attack icon for units that are not tapped by you or your group, but still give kill credit when attacked.'],
			},
			xOffset = {
				order = 4,
				type = 'range',
				name = L['xOffset'],
				min = -60, max = 60, step = 1,
			},
			yOffset = {
				order = 5,
				type = 'range',
				name = L['yOffset'],
				min = -60, max = 60, step = 1,
			},
		},
	}	
	
	E.Options.args.unitframe.args.target.args.classicon = {
		order = 1002,
		type = 'group',
		name = ColorizeSettingName(L["Class Icons"]),
		get = function(info) return E.db.unitframe.units['target']['classicon'][ info[#info] ] end,
		set = function(info, value) E.db.unitframe.units['target']['classicon'][ info[#info] ] = value; TC:ToggleSettings() end,
		args = {
			enable = {
				type = 'toggle',
				order = 1,
				name = L['Enable'],
				desc = L['Show class icon for units.'],
			},
			size = {
				order = 4,
				type = 'range',
				name = L['Size'],
				desc = L['Size of the indicator icon.'],
				min = 16, max = 40, step = 1,
			},
			xOffset = {
				order = 5,
				type = 'range',
				name = L['xOffset'],
				min = -100, max = 100, step = 1,
			},
			yOffset = {
				order = 6,
				type = 'range',
				name = L['yOffset'],
				min = -80, max = 40, step = 1,
			},
		},
	}	

	
	--Focus
	E.Options.args.unitframe.args.focus.args.gps = {
		order = 1000,
		type = 'group',
		name = ColorizeSettingName(L['GPS']),
		get = function(info) return E.db.unitframe.units['focus']['gps'][ info[#info] ] end,
		set = function(info, value) E.db.unitframe.units['focus']['gps'][ info[#info] ] = value; UF:CreateAndUpdateUF('focus') end,
		args = {
			enable = {
				type = 'toggle',
				order = 1,
				name = L['Enable'],
				desc = L['Show the direction and distance to the selected party or raid member.'],
			},
			position = {
				type = 'select',
				order = 3,
				name = L['Position'],
				values = positionValues,
			},
		},
	}

	E.Options.args.unitframe.args.general.args.generalGroup.args.autoRoleSet = {
		order = 6,
		name = ColorizeSettingName(L['Automatic Role Assignment']),
		desc = L['Enables the automatic role assignment based on specialization for party / raid members (only work when you are group leader or group assist).'],
		type = 'toggle',
	}
	
	E.Options.args.unitframe.args.general.args.generalGroup.args.hideroleincombat = {
		order = 7,
		name = ColorizeSettingName(L['Hide Role Icon in combat']),
		desc = L['All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat.'],
		type = 'toggle',
		set = function(info, value) E.db.unitframe[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end,
	}

end

function EO:WatchFrame()
	local WF = E:GetModule('WatchFrame')
	
	local choices = {
		['NONE'] = L['None'],
		['COLLAPSED'] = L['Collapsed'],
		['HIDDEN'] = L['Hidden'],
	}
	
	E.Options.args.watchframe = {
		type = 'group',
		name = ColorizeSettingName(L['WatchFrame']),
		get = function(info) return E.private.watchframe[ info[#info] ] end,
		set = function(info, value) E.private.watchframe[ info[#info] ] = value; WF:UpdateSettings() end,
		args = {
			intro = {
				order = 1,
				type = 'description',
				name = L["WATCHFRAME_DESC"],
			},
			enable = {
				order = 2,
				type = 'toggle',
				name = L['Enable'],
			},
			settings = {
				order = 3,
				type = "group",
				name = L['Settings'],
				guiInline = true,
				disabled = function() return not E.private.watchframe.enable end,
				get = function(info) return E.db.watchframe[ info[#info] ] end,
				set = function(info, value) E.db.watchframe[ info[#info] ] = value end,
				args = {
					city = {
						order = 4,
						type = 'select',
						name = L['City (Resting)'],
						values = choices,
					},
					pvp = {
						order = 5,
						type = 'select',
						name = L['PvP'],
						values = choices,
					},
					arena = {
						order = 6,
						type = 'select',
						name = L['Arena'],
						values = choices,
					},
					party = {
						order = 7,
						type = 'select',
						name = L['Party'],
						values = choices,
					},
					raid = {
						order = 8,
						type = 'select',
						name = L['Raid'],
						values = choices,
					},
				}
			}
		}
	}	
end

function EO:GetOptions()
	EO:DataTextOptions()
	EO:EquipmentOptions()
	EO:FarmerOptions()
	EO:MapOptions()
	EO:MiscOptions()
	EO:NameplateOptions()
	EO:RaidMarkerOptions()
	EO:TooltipOptions()		
	EO:UnitFramesOptions()
	EO:WatchFrame()
end

E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'] = {
	text = L['INCOMPATIBLE_ADDON'],
	OnAccept = function(self) DisableAddOn(E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].addon); ReloadUI(); end,
	OnCancel = function(self) E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].optiontable[E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].value] = false; ReloadUI(); end,
	timeout = 0,
	whileDead = 1,	
	hideOnEscape = false,	
}

E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON2'] = {
	text = L['INCOMPATIBLE_ADDON'],
	OnAccept = function(self) DisableAddOn(E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON2'].addon); ReloadUI(); end,
	timeout = 0,
	whileDead = 1,	
	hideOnEscape = false,	
}

function EO:IncompatibleAddOn(addon, module, optiontable, value)
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].button1 = addon
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].button2 = 'Enhanced: '..module
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].addon = addon
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].module = module
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].optiontable = optiontable
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].value = value
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON'].showAlert = true
	E:StaticPopup_Show('ENHANCED_INCOMPATIBLE_ADDON', addon, module)
end

function EO:IncompatibleAddOn2(addon, module)
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON2'].button1 = addon
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON2'].addon = addon
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON2'].module = module
	E.PopupDialogs['ENHANCED_INCOMPATIBLE_ADDON2'].showAlert = true
	E:StaticPopup_Show('ENHANCED_INCOMPATIBLE_ADDON2', addon, module)
end

function EO:CheckIncompatible()
	if E.global.ignoreIncompatible then return end

	if IsAddOnLoaded('SquareMinimapButtons') and E.private.general.minimapbar.skinButtons then
		EO:IncompatibleAddOn('SquareMinimapButtons', 'MinimapButtons', E.private.general.minimapbar, "skinButtons")
	end
	
	if IsAddOnLoaded('ElvUI_HyperDT') then
		EO:IncompatibleAddOn2('ElvUI_HyperDT', 'Enhanced Datatext')
	end
	if IsAddOnLoaded('ElvUI_TransparentMovers') then
		EO:IncompatibleAddOn2('ElvUI_TransparentMovers', 'Tranparent Movers')
	end
end

function EO:Initialize()
  EP:RegisterPlugin(ElvUIEnhanced, EO.GetOptions)
  self:CheckIncompatible()
end

E:RegisterModule(EO:GetName())
