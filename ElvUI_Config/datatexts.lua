local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local datatexts = {}

function DT:PanelLayoutOptions()
	for name, _ in pairs(DT.RegisteredDataTexts) do
		datatexts[name] = name
	end
	datatexts[''] = NONE

	local order
	local table = E.Options.args.datatexts.args.panels.args
	for pointLoc, tab in pairs(P.datatexts.panels) do
		if not _G[pointLoc] then table[pointLoc] = nil; return; end
		if type(tab) == 'table' then
			if pointLoc:find("Chat") then
				order = 15
			else
				order = 20
			end
			table[pointLoc] = {
				type = 'group',
				args = {},
				name = L[pointLoc] or pointLoc,
				order = order,
			}
			for option, value in pairs(tab) do
				table[pointLoc].args[option] = {
					type = 'select',
					name = L[option] or option:upper(),
					values = datatexts,
					get = function(info) return E.db.datatexts.panels[pointLoc][ info[#info] ] end,
					set = function(info, value) E.db.datatexts.panels[pointLoc][ info[#info] ] = value; DT:LoadDataTexts() end,
				}
			end
		elseif type(tab) == 'string' then
			table.smallPanels.args[pointLoc] = {
				type = 'select',
				name = L[pointLoc] or pointLoc,
				values = datatexts,
				get = function(info) return E.db.datatexts.panels[pointLoc] end,
				set = function(info, value) E.db.datatexts.panels[pointLoc] = value; DT:LoadDataTexts() end,
			}
		end
	end
end

local function CreateCustomCurrencyOptions(currencyID)
	local currency = E.global.datatexts.customCurrencies[currencyID] --The datatext has been registered prior to this
	if currency then
		E.Options.args.datatexts.args.customCurrency.args.currencies.args[currency.NAME] = {
			order = 1,
			type = "group",
			name = currency.NAME,
			guiInline = false,
			args = {
				removeDT = {
					order = 1,
					type = "execute",
					name = DELETE,
					func = function()
						--Remove stored entries of this currency datatext
						DT:RemoveCustomCurrency(currency.NAME)
						--Remove options group
						E.Options.args.datatexts.args.customCurrency.args.currencies.args[currency.NAME] = nil
						--Remove entry from registered datatext storage
						DT.RegisteredDataTexts[currency.NAME] = nil
						--Remove from persistent storage
						E.global.datatexts.customCurrencies[currencyID] = nil
						--Remove currency from datatext selection
						datatexts[currency.NAME] = nil
						DT:PanelLayoutOptions()
						--Reload datatexts to clear panel
						DT:LoadDataTexts()
					end,
				},
				spacer = {
					order = 2,
					type = "description",
					name = "\n",
				},
				displayStyle = {
					order = 3,
					type = "select",
					name = L["Display Style"],
					get = function(info) return E.global.datatexts.customCurrencies[currencyID].DISPLAY_STYLE end,
					set = function(info, value)
						--Save new display style
						E.global.datatexts.customCurrencies[currencyID].DISPLAY_STYLE = value
						--Update internal value
						DT:UpdateCustomCurrencySettings(currency.NAME, "DISPLAY_STYLE", value)
						--Reload datatexts
						DT:LoadDataTexts()
					end,
					values = {
						["ICON"] = L["Icons Only"],
						["ICON_TEXT"] = L["Icons and Text"],
						["ICON_TEXT_ABBR"] = L["Icons and Text (Short)"],
					},
				},
				showMax = {
					order = 4,
					type = "toggle",
					name = L["Current / Max"],
					get = function(info) return E.global.datatexts.customCurrencies[currencyID].SHOW_MAX end,
					set = function(info, value)
						--Save new value
						E.global.datatexts.customCurrencies[currencyID].SHOW_MAX = value
						--Update internal value
						DT:UpdateCustomCurrencySettings(currency.NAME, "SHOW_MAX", value)
						--Reload datatexts
						DT:LoadDataTexts()
					end,
				},
				useTooltip = {
					order = 5,
					type = "toggle",
					name = L["Use Tooltip"],
					get = function(info) return E.global.datatexts.customCurrencies[currencyID].USE_TOOLTIP end,
					set = function(info, value)
						--Save new value
						E.global.datatexts.customCurrencies[currencyID].USE_TOOLTIP = value
						--Update internal value
						DT:UpdateCustomCurrencySettings(currency.NAME, "USE_TOOLTIP", value)
					end,
				},
			},
		}
	end
end

local function SetupCustomCurrencies()
	--Create options for all stored custom currency datatexts
	for currencyID in pairs(E.global.datatexts.customCurrencies) do
		CreateCustomCurrencyOptions(currencyID)
	end
end

E.Options.args.datatexts = {
	type = "group",
	name = L["DataTexts"],
	childGroups = "tab",
	get = function(info) return E.db.datatexts[ info[#info] ] end,
	set = function(info, value) E.db.datatexts[ info[#info] ] = value; DT:LoadDataTexts() end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["DATATEXT_DESC"],
		},
		spacer = {
			order = 2,
			type = "description",
			name = "",
		},
		general = {
			order = 3,
			type = "group",
			name = L["General"],
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["General"],
				},
				generalGroup = {
					order = 2,
					type = "group",
					guiInline = true,
					name = L["General"],
					args = {
						battleground = {
							order = 3,
							type = 'toggle',
							name = L["Battleground Texts"],
							desc = L["When inside a battleground display personal scoreboard information on the main datatext bars."],
						},
						panelTransparency = {
							order = 4,
							name = L["Panel Transparency"],
							type = 'toggle',
							set = function(info, value)
								E.db.datatexts[ info[#info] ] = value
								E:GetModule('Layout'):SetDataPanelStyle()
							end,
						},
						noCombatClick = {
							order = 5,
							type = "toggle",
							name = L["Block Combat Click"],
							desc = L["Blocks all click events while in combat."],
						},
						noCombatHover = {
							order = 6,
							type = "toggle",
							name = L["Block Combat Hover"],
							desc = L["Blocks datatext tooltip from showing in combat."],
						},
						goldFormat = {
							order = 7,
							type = 'select',
							name = L["Gold Format"],
							desc = L["The display format of the money text that is shown in the gold datatext and its tooltip."],
							values = {
								['SMART'] = L["Smart"],
								['FULL'] = L["Full"],
								['SHORT'] = L["Short"],
								['SHORTINT'] = L["Short (Whole Numbers)"],
								['CONDENSED'] = L["Condensed"],
								['BLIZZARD'] = L["Blizzard Style"],
							},
						},
						goldCoins = {
							order = 8,
							type = 'toggle',
							name = L["Show Coins"],
							desc = L["Use coin icons instead of colored text."],
						},
					},
				},
				fontGroup = {
					order = 3,
					type = 'group',
					guiInline = true,
					name = L["Fonts"],
					args = {
						font = {
							type = "select", dialogControl = 'LSM30_Font',
							order = 1,
							name = L["Font"],
							values = AceGUIWidgetLSMlists.font,
						},
						fontSize = {
							order = 2,
							name = L["Font Size"],
							type = "range",
							min = 4, max = 212, step = 1,
						},
						fontOutline = {
							order = 3,
							name = L["Font Outline"],
							desc = L["Set the font outline."],
							type = "select",
							values = {
								['NONE'] = L["None"],
								['OUTLINE'] = 'OUTLINE',
								['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
								['THICKOUTLINE'] = 'THICKOUTLINE',
							},
						},
						wordWrap = {
							order = 4,
							type = "toggle",
							name = L["Word Wrap"],
						},
					},
				},
			},
		},
		panels = {
			type = 'group',
			name = L["Panels"],
			order = 4,
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["Panels"],
				},
				leftChatPanel = {
					order = 2,
					name = L["Datatext Panel (Left)"],
					desc = L["Display data panels below the chat, used for datatexts."],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						if E.db.LeftChatPanelFaded then
							E.db.LeftChatPanelFaded = true;
							HideLeftChat()
						end
						E:GetModule('Chat'):UpdateAnchors()
						E:GetModule('Layout'):ToggleChatPanels()
					end,
				},
				rightChatPanel = {
					order = 3,
					name = L["Datatext Panel (Right)"],
					desc = L["Display data panels below the chat, used for datatexts."],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						if E.db.RightChatPanelFaded then
							E.db.RightChatPanelFaded = true;
							HideRightChat()
						end
						E:GetModule('Chat'):UpdateAnchors()
						E:GetModule('Layout'):ToggleChatPanels()
					end,
				},
				minimapPanels = {
					order = 4,
					name = L["Minimap Panels"],
					desc = L["Display minimap panels below the minimap, used for datatexts."],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapTop = {
					order = 5,
					name = L["TopMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapTopLeft = {
					order = 6,
					name = L["TopLeftMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapTopRight = {
					order = 7,
					name = L["TopRightMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapBottom = {
					order = 8,
					name = L["BottomMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapBottomLeft = {
					order = 9,
					name = L["BottomLeftMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				minimapBottomRight = {
					order = 10,
					name = L["BottomRightMiniPanel"],
					type = 'toggle',
					set = function(info, value)
						E.db.datatexts[ info[#info] ] = value
						E:GetModule('Minimap'):UpdateSettings()
					end,
				},
				spacer = {
					order = 11,
					type = "description",
					name = "\n",
				},
				smallPanels = {
					type = "group",
					name = L["Small Panels"],
					order = 12,
					args = {},
				},
			},
		},
		currencies = {
			order = 5,
			type = "group",
			name = "Currencies", --Name of datatext, which isn't localized
			args = {
				header = {
					order = 1,
					type = "header",
					name = "Currencies",
				},
				displayedCurrency = {
					order = 2,
					type = "select",
					name = L["Displayed Currency"],
					get = function(info) return E.db.datatexts.currencies.displayedCurrency end,
					set = function(info, value) E.db.datatexts.currencies.displayedCurrency = value; DT:LoadDataTexts() end,
					values = function() return DT:Currencies_GetCurrencyList() end,
				},
				displayStyle = {
					order = 3,
					type = "select",
					name = L["Currency Format"],
					get = function(info) return E.db.datatexts.currencies.displayStyle end,
					set = function(info, value) E.db.datatexts.currencies.displayStyle = value; DT:LoadDataTexts() end,
					disabled = function() return (E.db.datatexts.currencies.displayedCurrency == "GOLD") end,
					values = {
						["ICON"] = L["Icons Only"],
						["ICON_TEXT"] = L["Icons and Text"],
						["ICON_TEXT_ABBR"] = L["Icons and Text (Short)"],
					},
				},
			},
		},
		time = {
			order = 6,
			type = "group",
			name = "Time", --Name of datatext, which isn't localized
			args = {
				header = {
					order = 1,
					type = "header",
					name = "Time",
				},
				time24 = {
					order = 2,
					type = 'toggle',
					name = L["24-Hour Time"],
					desc = L["Toggle 24-hour mode for the time datatext."],
					get = function(info) return E.db.datatexts.time24 end,
					set = function(info, value) E.db.datatexts.time24 = value; DT:LoadDataTexts() end,
				},
				localtime = {
					order = 3,
					type = 'toggle',
					name = L["Local Time"],
					desc = L["If not set to true then the server time will be displayed instead."],
					get = function(info) return E.db.datatexts.localtime end,
					set = function(info, value) E.db.datatexts.localtime = value; DT:LoadDataTexts() end,
				},
			},
		},
		customCurrency = {
			order = 7,
			type = "group",
			name = L["Custom Currency"],
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["Custom Currency"],
				},
				description = {
					order = 2,
					type = "description",
					name = L["This allows you to create a new datatext which will track the currency with the supplied currency ID. The datatext can be added to a panel immediately after creation."],
				},
				addCustomCurrency = {
					order = 3,
					type = "input",
					name = L["Add Currency ID"],
					desc = "http://www.wowhead.com/currencies",
					get = function() return "" end,
					set = function(info, value)
						local currencyID = tonumber(value)
						if not currencyID then return; end
						--Register a new datatext where name is the name of the currency
						DT:RegisterCustomCurrencyDT(currencyID)
						--Create options for this datatext
						CreateCustomCurrencyOptions(currencyID)
						DT:PanelLayoutOptions()
						--Reload datatexts in case the currency we just added was already selected on a panel
						DT:LoadDataTexts()
					end,
				},
				spacer = {
					order = 4,
					type = "description",
					name = "\n",
				},
				currencies = {
					order = 5,
					type = "group",
					name = L["Custom Currencies"],
					args = {}
				},
			},
		},
	},
}

DT:PanelLayoutOptions()
SetupCustomCurrencies()