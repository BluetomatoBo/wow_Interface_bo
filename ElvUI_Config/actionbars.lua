local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local AB = E:GetModule('ActionBars')
local group

local points = {
	["TOPLEFT"] = "TOPLEFT",
	["TOPRIGHT"] = "TOPRIGHT",
	["BOTTOMLEFT"] = "BOTTOMLEFT",
	["BOTTOMRIGHT"] = "BOTTOMRIGHT",
}

local function BuildABConfig()
	for i=1, 5 do
		local name = L['Bar ']..i
		group['bar'..i] = {
			order = i,
			name = name,
			type = 'group',
			order = 200,
			guiInline = false,
			disabled = function() return not E.private.actionbar.enable end,
			get = function(info) return E.db.actionbar['bar'..i][ info[#info] ] end,
			set = function(info, value) E.db.actionbar['bar'..i][ info[#info] ] = value; AB:PositionAndSizeBar('bar'..i) end,
			args = {
				enabled = {
					order = 1,
					type = 'toggle',
					name = L['Enable'],
				},
				restorePosition = {
					order = 2,
					type = 'execute',
					name = L['Restore Bar'],
					desc = L['Restore the actionbars default settings'],
					func = function() E:CopyTable(E.db.actionbar['bar'..i], P.actionbar['bar'..i]); E:ResetMovers('Bar '..i); AB:PositionAndSizeBar('bar'..i) end,
				},	
				point = {
					order = 3,
					type = 'select',
					name = L['Anchor Point'],
					desc = L['The first button anchors itself to this point on the bar.'],
					values = points,
				},				
				backdrop = {
					order = 4,
					type = "toggle",
					name = L['Backdrop'],
					desc = L['Toggles the display of the actionbars backdrop.'],
				},	
				mouseover = {
					order = 5,
					name = L['Mouse Over'],
					desc = L['The frame is not shown unless you mouse over the frame.'],
					type = "toggle",
				},
				buttons = {
					order = 6,
					type = 'range',
					name = L['Buttons'],
					desc = L['The amount of buttons to display.'],
					min = 1, max = NUM_ACTIONBAR_BUTTONS, step = 1,				
				},
				buttonsPerRow = {
					order = 7,
					type = 'range',
					name = L['Buttons Per Row'],
					desc = L['The amount of buttons to display per row.'],
					min = 1, max = NUM_ACTIONBAR_BUTTONS, step = 1,					
				},
				buttonsize = {
					type = 'range',
					name = L['Button Size'],
					desc = L['The size of the action buttons.'],
					min = 15, max = 60, step = 1,
					order = 8,
					disabled = function() return not E.private.actionbar.enable end,
				},
				buttonspacing = {
					type = 'range',
					name = L['Button Spacing'],
					desc = L['The spacing between buttons.'],
					min = 1, max = 10, step = 1,	
					order = 9, 
					disabled = function() return not E.private.actionbar.enable end,
				},				
				heightMult = {
					order = 10,
					type = 'range',
					name = L['Height Multiplier'],
					desc = L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'],
					min = 1, max = 5, step = 1,					
				},
				widthMult = {
					order = 11,
					type = 'range',
					name = L['Width Multiplier'],
					desc = L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'],
					min = 1, max = 5, step = 1,					
				},
				alpha = {
					order = 12,
					type = 'range',
					name = L['Alpha'],
					isPercent = true,
					min = 0, max = 1, step = 0.01,
				},
				paging = {
					type = 'input',
					order = 13,
					name = L['Action Paging'],
					desc = L["This works like a macro, you can run different situations to get the actionbar to page differently.\n Example: '[combat] 2;'"],
					width = 'full',
					multiline = true,
					get = function(info) return E.db.actionbar['bar'..i]['paging'][E.myclass] end,
					set = function(info, value) 
						if not E.db.actionbar['bar'..i]['paging'][E.myclass] then
							E.db.actionbar['bar'..i]['paging'][E.myclass] = {}
						end
						
						E.db.actionbar['bar'..i]['paging'][E.myclass] = value
						AB:UpdateButtonSettings() 
					end,
				},
				visibility = {
					type = 'input',
					order = 14,
					name = L['Visibility State'],
					desc = L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"],
					width = 'full',
					multiline = true,
					set = function(info, value) 						
						E.db.actionbar['bar'..i]['visibility'] = value; 
						AB:UpdateButtonSettings()
					end,
				},
			},
		}
	end

	group['barPet'] = {
		order = i,
		name = L['Pet Bar'],
		type = 'group',
		order = 200,
		guiInline = false,
		disabled = function() return not E.private.actionbar.enable end,
		get = function(info) return E.db.actionbar['barPet'][ info[#info] ] end,
		set = function(info, value) E.db.actionbar['barPet'][ info[#info] ] = value; AB:PositionAndSizeBarPet() end,
		args = {
			enabled = {
				order = 1,
				type = 'toggle',
				name = L['Enable'],
			},
			restorePosition = {
				order = 2,
				type = 'execute',
				name = L['Restore Bar'],
				desc = L['Restore the actionbars default settings'],
				func = function() E:CopyTable(E.db.actionbar['barPet'], P.actionbar['barPet']); E:ResetMovers('Pet Bar'); AB:PositionAndSizeBarPet() end,
			},	
			point = {
				order = 3,
				type = 'select',
				name = L['Anchor Point'],
				desc = L['The first button anchors itself to this point on the bar.'],
				values = points,
			},				
			backdrop = {
				order = 4,
				type = "toggle",
				name = L['Backdrop'],
				desc = L['Toggles the display of the actionbars backdrop.'],
			},	
			mouseover = {
				order = 5,
				name = L['Mouse Over'],
				desc = L['The frame is not shown unless you mouse over the frame.'],
				type = "toggle",
			},
			buttons = {
				order = 6,
				type = 'range',
				name = L['Buttons'],
				desc = L['The amount of buttons to display.'],
				min = 1, max = NUM_PET_ACTION_SLOTS, step = 1,				
			},
			buttonsPerRow = {
				order = 7,
				type = 'range',
				name = L['Buttons Per Row'],
				desc = L['The amount of buttons to display per row.'],
				min = 1, max = NUM_PET_ACTION_SLOTS, step = 1,					
			},
			buttonsize = {
				type = 'range',
				name = L['Button Size'],
				desc = L['The size of the action buttons.'],
				min = 15, max = 60, step = 1,
				order = 8,
				disabled = function() return not E.private.actionbar.enable end,
			},
			buttonspacing = {
				type = 'range',
				name = L['Button Spacing'],
				desc = L['The spacing between buttons.'],
				min = 1, max = 10, step = 1,	
				order = 9, 
				disabled = function() return not E.private.actionbar.enable end,
			},				
			heightMult = {
				order = 10,
				type = 'range',
				name = L['Height Multiplier'],
				desc = L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'],
				min = 1, max = 5, step = 1,					
			},
			widthMult = {
				order = 11,
				type = 'range',
				name = L['Width Multiplier'],
				desc = L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'],
				min = 1, max = 5, step = 1,					
			},
			alpha = {
				order = 12,
				type = 'range',
				name = L['Alpha'],
				isPercent = true,
				min = 0, max = 1, step = 0.01,
			},			
			visibility = {
				type = 'input',
				order = 13,
				name = L['Visibility State'],
				desc = L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"],
				width = 'full',
				multiline = true,
				set = function(info, value) 						
					E.db.actionbar['barPet']['visibility'] = value; 
					AB:UpdateButtonSettings()
				end,
			},
		},
	}	
	group['stanceBar'] = {
		order = i,
		name = L['Stance Bar'],
		type = 'group',
		order = 200,
		guiInline = false,
		disabled = function() return not E.private.actionbar.enable end,
		get = function(info) return E.db.actionbar['stanceBar'][ info[#info] ] end,
		set = function(info, value) E.db.actionbar['stanceBar'][ info[#info] ] = value; AB:PositionAndSizeBarShapeShift() end,
		args = {
			enabled = {
				order = 1,
				type = 'toggle',
				name = L['Enable'],
			},
			restorePosition = {
				order = 2,
				type = 'execute',
				name = L['Restore Bar'],
				desc = L['Restore the actionbars default settings'],
				func = function() E:CopyTable(E.db.actionbar['stanceBar'], P.actionbar['stanceBar']); E:ResetMovers('Stance Bar'); AB:PositionAndSizeBarShapeShift() end,
			},	
			point = {
				order = 3,
				type = 'select',
				name = L['Anchor Point'],
				desc = L['The first button anchors itself to this point on the bar.'],
				values = points,
			},				
			backdrop = {
				order = 4,
				type = "toggle",
				name = L['Backdrop'],
				desc = L['Toggles the display of the actionbars backdrop.'],
			},	
			mouseover = {
				order = 5,
				name = L['Mouse Over'],
				desc = L['The frame is not shown unless you mouse over the frame.'],
				type = "toggle",
			},
			buttons = {
				order = 6,
				type = 'range',
				name = L['Buttons'],
				desc = L['The amount of buttons to display.'],
				min = 1, max = NUM_PET_ACTION_SLOTS, step = 1,				
			},
			buttonsPerRow = {
				order = 7,
				type = 'range',
				name = L['Buttons Per Row'],
				desc = L['The amount of buttons to display per row.'],
				min = 1, max = NUM_PET_ACTION_SLOTS, step = 1,					
			},
			buttonsize = {
				type = 'range',
				name = L['Button Size'],
				desc = L['The size of the action buttons.'],
				min = 15, max = 60, step = 1,
				order = 8,
				disabled = function() return not E.private.actionbar.enable end,
			},
			buttonspacing = {
				type = 'range',
				name = L['Button Spacing'],
				desc = L['The spacing between buttons.'],
				min = 1, max = 10, step = 1,	
				order = 9, 
				disabled = function() return not E.private.actionbar.enable end,
			},				
			heightMult = {
				order = 10,
				type = 'range',
				name = L['Height Multiplier'],
				desc = L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'],
				min = 1, max = 5, step = 1,					
			},
			widthMult = {
				order = 11,
				type = 'range',
				name = L['Width Multiplier'],
				desc = L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'],
				min = 1, max = 5, step = 1,					
			},
			alpha = {
				order = 12,
				type = 'range',
				name = L['Alpha'],
				isPercent = true,
				min = 0, max = 1, step = 0.01,
			},			
		},
	}
	
	group['cdgroup'] = {
		type = "group",
		order = 500,
		name = L['Cooldown Text'],
		disabled = function() return not E.private.actionbar.enable end,
		set = function(info, value) E.db.actionbar[ info[#info] ] = value; AB:UpdateCooldownSettings() end,
		args = {
			enablecd = {
				type = "toggle",
				order = 1,
				name = L['Enable'],
				desc = L['Display cooldown text on anything with the cooldown spiril.'],
				disabled = function() return not E.private.actionbar.enable end,
			},			
			treshold = {
				type = 'range',
				name = L['Low Threshold'],
				desc = L['Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red'],
				min = -1, max = 20, step = 1,	
				order = 2, 					
			},
			restoreColors = {
				type = 'execute',
				name = L["Restore Defaults"],
				order = 3,
				func = function() 
					AB.db.expiringcolor = P['actionbar'].expiringcolor;
					AB.db.secondscolor = P['actionbar'].secondscolor;
					AB.db.minutescolor = P['actionbar'].minutescolor;
					AB.db.hourscolor = P['actionbar'].hourscolor;
					AB.db.dayscolor = P['actionbar'].dayscolor;
					AB:UpdateCooldownSettings();
				end,
			},
			expiringcolor = {
				type = 'color',
				order = 4,
				name = L['Expiring'],
				desc = L['Color when the text is about to expire'],
				get = function(info)
					local t = E.db.actionbar[ info[#info] ]
					return t.r, t.g, t.b, t.a
				end,
				set = function(info, r, g, b)
					E.db.actionbar[ info[#info] ] = {}
					local t = E.db.actionbar[ info[#info] ]
					t.r, t.g, t.b = r, g, b
					AB:UpdateCooldownSettings();
				end,					
			},
			secondscolor = {
				type = 'color',
				order = 5,
				name = L['Seconds'],
				desc = L['Color when the text is in the seconds format.'],
				get = function(info)
					local t = E.db.actionbar[ info[#info] ]
					return t.r, t.g, t.b, t.a
				end,
				set = function(info, r, g, b)
					E.db.actionbar[ info[#info] ] = {}
					local t = E.db.actionbar[ info[#info] ]
					t.r, t.g, t.b = r, g, b
					AB:UpdateCooldownSettings();
				end,				
			},
			minutescolor = {
				type = 'color',
				order = 6,
				name = L['Minutes'],
				desc = L['Color when the text is in the minutes format.'],
				get = function(info)
					local t = E.db.actionbar[ info[#info] ]
					return t.r, t.g, t.b, t.a
				end,
				set = function(info, r, g, b)
					E.db.actionbar[ info[#info] ] = {}
					local t = E.db.actionbar[ info[#info] ]
					t.r, t.g, t.b = r, g, b
					AB:UpdateCooldownSettings();
				end,				
			},
			hourscolor = {
				type = 'color',
				order = 7,
				name = L['Hours'],
				desc = L['Color when the text is in the hours format.'],
				get = function(info)
					local t = E.db.actionbar[ info[#info] ]
					return t.r, t.g, t.b, t.a
				end,
				set = function(info, r, g, b)
					E.db.actionbar[ info[#info] ] = {}
					local t = E.db.actionbar[ info[#info] ]
					t.r, t.g, t.b = r, g, b
					AB:UpdateCooldownSettings();
				end,				
			},	
			dayscolor = {
				type = 'color',
				order = 8,
				name = L['Days'],
				desc = L['Color when the text is in the days format.'],
				get = function(info)
					local t = E.db.actionbar[ info[#info] ]
					return t.r, t.g, t.b, t.a
				end,
				set = function(info, r, g, b)
					E.db.actionbar[ info[#info] ] = {}
					local t = E.db.actionbar[ info[#info] ]
					t.r, t.g, t.b = r, g, b
					AB:UpdateCooldownSettings();
				end,				
			},				
		},
	}	
end

E.Options.args.actionbar = {
	type = "group",
	name = L["ActionBars"],
	childGroups = "tree",
	get = function(info) return E.db.actionbar[ info[#info] ] end,
	set = function(info, value) E.db.actionbar[ info[#info] ] = value; AB:UpdateButtonSettings() end,
	args = {
		enable = {
			order = 1,
			type = "toggle",
			name = L["Enable"],
			get = function(info) return E.private.actionbar[ info[#info] ] end,
			set = function(info, value) E.private.actionbar[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end
		},
		toggleKeybind = {
			order = 3,
			type = "execute",
			name = L["Keybind Mode"],
			func = function() AB:ActivateBindMode(); E:ToggleConfig(); GameTooltip:Hide(); end,
			disabled = function() return not E.private.actionbar.enable end,
		},		
		macrotext = {
			type = "toggle",
			name = L['Macro Text'],
			desc = L['Display macro names on action buttons.'],
			order = 4,
			disabled = function() return not E.private.actionbar.enable end,
		},
		hotkeytext = {
			type = "toggle",
			name = L['Keybind Text'],
			desc = L['Display bind names on action buttons.'],	
			order = 5,
			disabled = function() return not E.private.actionbar.enable end,
		},
		keyDown = {
			type = 'toggle',
			name = L['Key Down'],
			desc = OPTION_TOOLTIP_ACTION_BUTTON_USE_KEY_DOWN,
			order = 7,
			disabled = function() return not E.private.actionbar.enable end,
		},
		showGrid = {
			type = 'toggle',
			name = ALWAYS_SHOW_MULTIBARS_TEXT,
			desc = OPTION_TOOLTIP_ALWAYS_SHOW_MULTIBARS,
			order = 8,
			disabled = function() return not E.private.actionbar.enable end,
		},
		movementModifier = {
			type = 'select',
			name = PICKUP_ACTION_KEY_TEXT,
			desc = L['The button you must hold down in order to drag an ability to another action button.'],	
			disabled = function() return not E.private.actionbar.enable end,
			order = 8,
			values = {
				['SHIFT'] = SHIFT_KEY,
				['ALT'] = ALT_KEY,
				['CTRL'] = CTRL_KEY,
			},
		},
		noRangeColor = {
			type = 'color',
			order = 9,
			name = L['Out of Range'],
			desc = L['Color of the actionbutton when out of range.'],
			get = function(info)
				local t = E.db.actionbar[ info[#info] ]
				return t.r, t.g, t.b, t.a
			end,
			set = function(info, r, g, b)
				E.db.actionbar[ info[#info] ] = {}
				local t = E.db.actionbar[ info[#info] ]
				t.r, t.g, t.b = r, g, b
				AB:UpdateButtonSettings();
			end,				
		},
		noPowerColor = {
			type = 'color',
			order = 10,
			name = L['Out of Power'],
			desc = L['Color of the actionbutton when out of power (Mana, Rage, Focus, Holy Power).'],
			get = function(info)
				local t = E.db.actionbar[ info[#info] ]
				return t.r, t.g, t.b, t.a
			end,
			set = function(info, r, g, b)
				E.db.actionbar[ info[#info] ] = {}
				local t = E.db.actionbar[ info[#info] ]
				t.r, t.g, t.b = r, g, b
				AB:UpdateButtonSettings();
			end,			
		},
		fontGroup = {
			order = 11,
			type = 'group',
			guiInline = true,
			disabled = function() return not E.private.actionbar.enable end,
			name = L['Fonts'],
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 4,
					name = L["Font"],
					values = AceGUIWidgetLSMlists.font,
				},
				fontSize = {
					order = 5,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,
				},	
				fontOutline = {
					order = 6,
					name = L["Font Outline"],
					desc = L["Set the font outline."],
					type = "select",
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
		microbar = {
			type = "group",
			name = L['Micro Bar'],
			disabled = function() return not E.private.actionbar.enable end,
			get = function(info) return E.db.actionbar.microbar[ info[#info] ] end,
			set = function(info, value) E.db.actionbar.microbar[ info[#info] ] = value; AB:UpdateMicroPositionDimensions() end,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
				},		
				alpha = {
					order = 2,
					type = 'range',
					name = L['Alpha'],
					desc = L['Change the alpha level of the frame.'],
					min = 0, max = 1, step = 0.1,					
				},						
				mouseover = {
					order = 3,
					name = L['Mouse Over'],
					desc = L['The frame is not shown unless you mouse over the frame.'],
					type = "toggle",
				},	
				buttonsPerRow = {
					order = 4,
					type = 'range',
					name = L['Buttons Per Row'],
					desc = L['The amount of buttons to display per row.'],
					min = 1, max = #MICRO_BUTTONS, step = 1,					
				},				
			},
		},
	},
}
group = E.Options.args.actionbar.args
BuildABConfig()