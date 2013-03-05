local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local LPB = E:GetModule('LocationPlus')

-- Defaults
P['locplus'] = {
-- Options
	['both'] = true,
	['combat'] = false,
	['dig'] = true,
	['displayLevel'] = false,
-- Tooltip
	['tt'] = true,
	['tthint'] = true,
	['ttst'] = true,
	['ttlvl'] = true,
	['fish'] = true,
	['petlevel'] = true,
	['ttinst'] = true,
	['ttreczones'] = true,
	['ttrecinst'] = true,
	['ttcoords'] = true,
-- ttFilters
	['tthideraid'] = false,
	['tthidepvp'] = false,
-- Layout
	['dtshow'] = true,
	['shadow'] = false,
	['trans'] = true,
	['noback'] = true,
	['ht'] = false,
	['lpwidth'] = 200,
	['dtwidth'] = 100,
	['dtheight'] = 21,
	['lpauto'] = true,
	['userColor'] = { r = 1, g = 1, b = 1 },
	['customColor'] = 1,
	['userCoordsColor'] = { r = 1, g = 1, b = 1 },
	['customCoordsColor'] = 3,
	['trunc'] = false,
	['mouseover'] = false,
	['malpha'] = 1,
-- Fonts
	['lpfont'] = E.db.general.font,
	['lpfontsize'] = 12,
	['lpfontflags'] = "NONE",
}

local newsign = "|cffff4400 ("..NEW..")|r"

function LPB:AddOptions()
	E.Options.args.locplus = {
		order = 9000,
		type = 'group',
		name = L["Location Plus"],
		args = {
			name = {
				order = 1,
				type = "header",
				name = L["Location Plus "]..format("v|cff33ffff%s|r",LPB.version)..L[" by Benik (EU-Emerald Dream)"],
			},		
			desc = {
				order = 2,
				type = "description",
				name = L["LocationPlus adds a movable player location panel, 2 datatext panels and more"],
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "",
			},		
			toptop = {
				order = 4,
				type = "group",
				name = L["General"],
				guiInline = true,
				args = {
					combat = {
						order = 1,
						name = L["Combat Hide"],
						desc = L["Show/Hide all panels when in combat"],
						type = 'toggle',
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; end,					
					},
				},
			},
			general = {
				order = 5,
				type = "group",
				name = SHOW,
				guiInline = true,
				args = {
					both = {
						order = 1,
						name = L["Zone and Subzone"],
						desc = L["Displays the main zone and the subzone in the location panel"],
						type = 'toggle',
						width = "full",	
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; end,					
					},
					dig = {
						order = 2,
						name = L["Detailed Coords"],
						desc = L["Adds 2 digits in the coords"],
						type = 'toggle',
						width = "full",	
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; LCoordsDig() end,					
					},
					displayLevel = {
						order = 3,
						name = LEVEL_RANGE..newsign,
						--desc = L["The frame is not shown unless you mouse over the frame."],
						type = 'toggle',
						width = "full",	
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; end,					
					},
					mouseover = {
						order = 4,
						name = L["Mouse Over"]..newsign,
						desc = L["The frame is not shown unless you mouse over the frame."],
						type = 'toggle',
						width = "full",	
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; LocMouseOver() end,					
					},
					malpha = {
						order = 5,
						type = "range",
						name = L["Alpha"],
						desc = L["Change the alpha level of the frame."],
						min = 0, max = 1, step = 0.1,
						disabled = function() return not E.db.locplus.mouseover end,
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; LocMouseOver() end,
					},				
				},
			},
			gen_tt = {
				order = 6,
				type = "group",
				name = L["Tooltip"],
				get = function(info) return E.db.locplus[ info[#info] ] end,
				set = function(info, value) E.db.locplus[ info[#info] ] = value; end,	
				args = {
					tt_grp = {
						order = 1,
						type = "group",
						name = L["Tooltip"],
						guiInline = true,
						args = {				
							tt = {
								order = 1,
								name = L["Show/Hide tooltip"],
								type = 'toggle',
								width = "full",			
							},
							ttst = {
								order = 2,
								name = L["Show Status"],
								desc = L["Enable/Disable status on Tooltip."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,			
							},
							ttlvl = {
								order = 3,
								name = L["Show Level Range"],
								desc = L["Enable/Disable level range on Tooltip."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,		
							},
							fish = {
								order = 4,
								name = L["Show Fishing level"],
								desc = L["Enable/Disable fishing level on the area."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,				
							},
							petlevel = {
								order = 5,
								name = L["Show Battle Pet level"],
								desc = L["Enable/Disable battle pet level on the area."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,				
							},
							ttreczones = {
								order = 6,
								name = L["Show Recommended Zones"],
								desc = L["Enable/Disable recommended zones on Tooltip."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,		
							},
							ttinst = {
								order = 7,
								name = L["Show zone Dungeons"],
								desc = L["Enable/Disable dungeons in the zone, on Tooltip."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,			
							},
							ttrecinst = {
								order = 8,
								name = L["Show Recommended Dungeons"],
								desc = L["Enable/Disable recommended dungeons on Tooltip."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,			
							},
							ttcoords = {
								order = 9,
								name = L["Show Dungeon Entrances Coords"],
								desc = L["Enable/Disable the coords for area and recommended dungeon entrances, on Tooltip."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.tt end,			
							},
							tthint = {
								order = 10,
								name = L["Show Hints"],
								desc = L["Enable/Disable hints on Tooltip."],
								type = 'toggle',
								disabled = function() return not E.db.locplus.tt end,			
							},
						},
					},
					tt_filters = {
						order = 2,
						type = "group",
						name = FILTERS,
						guiInline = true,
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; end,	
						args = {
							tthideraid = {
								order = 1,
								name = L["Hide Raid"],
								desc = L["Show/Hide raids or dungeons."],
								type = 'toggle',
								disabled = function() return not E.db.locplus.tt end,
							},
							tthidepvp = {
								order = 2,
								name = L["Hide PvP"],
								desc = L["Show/Hide PvP zones, Arenas and BGs on recommended dungeons and zones."],
								type = 'toggle',
								disabled = function() return not E.db.locplus.tt end,
							},
						},
					},
				},
			},
			layout = {
				order = 7,
				type = "group",
				name = L["Layout"],
				args = {
					lp_lo = {
						order = 1,
						type = "group",
						name = L["Layout"],
						guiInline = true,
						args = {	
							shadow = {
								order = 1,
								name = L["Shadows"],
								desc = L["Enable/Disable layout with shadows."],
								type = 'toggle',
								disabled = function() return not E.db.locplus.noback end,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; AllLocPanelsShadow(); end,					
							},
							trans = {
								order = 2,
								name = L["Transparent"],
								desc = L["Enable/Disable transparent layout."],
								type = 'toggle',
								disabled = function() return not E.db.locplus.noback end,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; AllLocPanelsTransparent(); end,	
							},
							noback = {
								order = 3,
								name = L["Backdrop"],
								desc = L["Hides all panels background so you can place them on ElvUI's top or bottom panel."],
								type = 'toggle',
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; AllLocPanelsTransparent(); AllLocPanelsShadow(); end,	
							},							
						},
					},
					locpanel = {
						order = 2,
						type = "group",
						name = L["Location Panel"],
						guiInline = true,
						args = {
							ht = {
								order = 1,
								name = L["Larger Location Panel"],
								desc = L["Adds 6 pixels at the Main Location Panel height."],
								type = 'toggle',
								width = "full",
								disabled = function() return not E.db.locplus.noback end,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; LocPlusDTHeight() end,	
							},
							lpauto = {
								order = 2,
								type = "toggle",
								name = L["Auto width"],
								desc = L["Auto resized Location Panel."],
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; E.db.locplus.trunc = false; end,
							},	
							lpwidth = {
								order = 3,
								type = "range",
								name = L["Width"],
								desc = L["Adjust the Location Panel Width."],
								min = 100, max = 300, step = 1,
								disabled = function() return E.db.locplus.lpauto end,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; end,
							},
							trunc = {
								order = 4,
								type = "toggle",
								name = L["Truncate text"]..newsign,
								desc = L["Truncates the text rather than auto enlarge the location panel when the text is bigger than the panel."],
								disabled = function() return E.db.locplus.lpauto end,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; end,
							},
							customColor = {
								order = 5,
								type = "select",
								name = COLOR,
								values = {
									[1] = L["Auto Colorize"],
									[2] = CLASS_COLORS,
									[3] = CUSTOM,
								},
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; end,
							},
							userColor = {
								order = 6,
								type = "color",
								name = COLOR_PICKER,
								disabled = function() return E.db.locplus.customColor == 1 or E.db.locplus.customColor == 2 end,
								get = function(info)
									local t = E.db.locplus[ info[#info] ]
									return t.r, t.g, t.b, t.a
									end,
								set = function(info, r, g, b)
									local t = E.db.locplus[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									LCoordsColor()
								end,
							},

						},
					},
					coords = {
						order = 3,
						type = "group",
						name = L["Coordinates"],
						guiInline = true,
						args = {
							customCoordsColor = {
								order = 1,
								type = "select",
								name = COLOR,
								values = {
									[1] = L["Use Custom Location Color"],
									[2] = CLASS_COLORS,
									[3] = CUSTOM,
								},
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; LCoordsColor() end,
							},
							userCoordsColor = {
								order = 2,
								type = "color",
								name = COLOR_PICKER,
								disabled = function() return E.db.locplus.customCoordsColor == 1 or E.db.locplus.customCoordsColor == 2 end,
								get = function(info)
									local t = E.db.locplus[ info[#info] ]
									return t.r, t.g, t.b, t.a
									end,
								set = function(info, r, g, b)
									local t = E.db.locplus[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									LCoordsColor() 
								end,
							},
							dig = {
								order = 3,
								name = L["Detailed Coords"],
								desc = L["Adds 2 digits in the coords"],
								type = 'toggle',
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; LCoordsDig() end,					
							},
						},
					},
					panels = {
						order = 4,
						type = "group",
						name = L["Size"],
						guiInline = true,
						args = {
							dtwidth = {
								order = 1,
								type = "range",
								name = L["DataTexts Width"],
								desc = L["Adjust the DataTexts Width."],
								min = 70, max = 200, step = 1,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; LocPlusDTWidth() end,
							},
							dtheight = {
								order = 2,
								type = "range",
								name = L["All Panels Height"],
								desc = L["Adjust All Panels Height."],
								min = 10, max = 32, step = 1,
								get = function(info) return E.db.locplus[ info[#info] ] end,
								set = function(info, value) E.db.locplus[ info[#info] ] = value; LocPlusDTHeight() end,
							},		
						},
					},
					font = {
						order = 5,
						type = "group",
						name = L["Fonts"],
						guiInline = true,
						get = function(info) return E.db.locplus[ info[#info] ] end,
						set = function(info, value) E.db.locplus[ info[#info] ] = value; LPB:LocCoordPanelFont(); end,
						args = {
							lpfont = {
								type = "select", dialogControl = 'LSM30_Font',
								order = 1,
								name = L["Font"],
								desc = L["Choose font for the Location and Coords panels."],
								values = AceGUIWidgetLSMlists.font,
							},
							lpfontsize = {
								order = 2,
								name = L["Font Size"],
								desc = L["Set the font size."],
								type = "range",
								min = 6, max = 22, step = 1,
							},
							lpfontflags = {
								order = 3,
								name = L["Font Outline"],
								type = 'select',
								values = {
									['NONE'] = L['None'],
									['OUTLINE'] = 'OUTLINE',
									['MONOCHROME'] = (not E.isMacClient) and 'MONOCHROME' or nil,
									['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
									['THICKOUTLINE'] = 'THICKOUTLINE',
								},
							},
						},
					},
				},
			},
		},					
	}
end

local optf = CreateFrame('Frame')
optf:RegisterEvent('ADDON_LOADED')
optf:SetScript('OnEvent',function(self, event, addon)
	if addon == 'ElvUI_Config' then
		LPB:AddOptions()
		optf:UnregisterEvent('ADDON_LOADED')
	end
end)