--------------------------------------------------------
-- System Settable Variables --
--------------------------------------------------------
local E, L, V, P, G =  unpack(ElvUI);
local RC = E:GetModule('RaidCooldown')
--------------------------------------------------------

--------------------------------------------------------
-- Defaults --
--------------------------------------------------------
P['raidcooldown'] = {
	['enable'] = true,
	['type'] = 'raid',
	['castannounce'] = false,
	['cdannounce'] = false,
	['scale'] = 1,
	['grow'] = 'right',
	['active'] = false,
	['debug'] = false,
	['cooldown'] = {
		["DA"] = true,
		["HOS"] = true,
		["PWB"] = true,
		["PS"] = true,
 		["DH"] = true,
 		["GS"] = true,
		["VS"] = true,
		["HH"] = true,	
		["T"] = true,
		["FE"] = true,
		["R"] = true,
		["I"] = true,
		["SLT"] = true,
		["MTT"] = true,
		["HTT"] = true,
		["ST"] = true,
		["ZEN"] = true,
		["LIFE"] = true,
		["REV"] = true,
		["SR"] = true,
		["RA"] = true,
		["AMZ"] = true,
 		["RC"] = true,
		["DB"] = true,
	},
}
--------------------------------------------------------

--------------------------------------------------------
-- Options --
--------------------------------------------------------
function RC:GetOptions()
	E.Options.args.raidcooldown = {
		type = "group",
		name = "RaidCooldown",
		get = function(info) return E.db.raidcooldown[ info[#info] ] end,
		set = function(info, value) E.db.raidcooldown[ info[#info] ] = value end,
		args = {
			intro = {
				order = 1,
				type = "description",
				name = "Adjust Raidcooldown settings for ElvUI.",
			},
			enable = {
				order = 2,
				type = "toggle",
				name = L["Enable"],
				set = function(info, value) E.db.raidcooldown.enable = value; StaticPopup_Show("GLOBAL_RL") end,
			},
			castannounce = {
				order = 3,
				type = "toggle",
				name = "Announce Casts",
				set = function(info, value) E.db.raidcooldown.castannounce = value; end,
			},		
			cdannounce = {
				order = 4,
				type = "toggle",
				name = "Announce CD Expire",
				set = function(info, value) E.db.raidcooldown.cdannounce = value; end,
			},		
			active = {
				order = 5,
				type = "toggle",
				name = "Activate Active Mode",
				set = function(info, value) E.db.raidcooldown.active = value; StaticPopup_Show("GLOBAL_RL") end,
			},			
			scale = {
				order = 5,
				type = "range",
				name = L['Set Scale'],
				desc = "Sets Scale of Raid Cooldowns",
				min = 0.3, max = 2, step = 0.01,
				set = function(info, value) E.db.raidcooldown.scale = value; RC:Scale(); RC:MoverSize(); end,
	        },	
			grow = {
				order = 6,
				name = "Bar Grow Direction",
				type = 'select',
				set = function(info, value) E.db.raidcooldown.grow = value; StaticPopup_Show("GLOBAL_RL") end,
				values = {
					['left'] = "left",
					['right'] = "right",
				},			
			},		
			type = {
				order = 7,
				name = "Show Option",
				type = 'select',
				set = function(info, value) E.db.raidcooldown.type = value; StaticPopup_Show("GLOBAL_RL") end,
				values = {
					['always'] = "always",
					['raid'] = "raid",
					['group'] = "group",
				},				
			},
			cooldown = {
				order = 300,
				type = 'group',
				name = 'Raid Cooldowns',
				get = function(info) return E.db.raidcooldown.cooldown[ info[#info] ] end,
				set = function(info, value) E.db.raidcooldown.cooldown[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,	
				guiInline = true,
				args = {
					DA = {
						type = 'toggle',
						name = 'Devotion Aura'
					},
					HOS = {
						type = 'toggle',
						name = 'Hand of Sacrifice'
					},
					PWB = {
						type = 'toggle',
						name = "Power Word: Barrier"
					},
					PS = {
						type = 'toggle',
						name = 'Pain Suppression'	
					},
		     		DH = {
		     			type = 'toggle',
		     			name = 'Divine Hymn'
		     		},
		     		GS = {
		     			type = 'toggle',
		     			name = 'Guardian Spirit'
		     		},
					VS = {
						type = 'toggle',
						name = 'Void Shift'
					},
					HH = {
						type = 'toggle',
						name = 'Hymn of Hope'
					},	
					T = {
						type = 'toggle',
						name = 'Tranquility'
					},
					FE = {
						type = 'toggle',
						name = 'Ironbark'
					},
					R = {
						type = 'toggle',
						name = 'Rebirth'
					},
					I = {
						type = 'toggle',
						name = 'Innervate'
					},
					SLT = {
						type = 'toggle',
						name = 'Spirit Link Totem'
					},
					MTT = {
						type = 'toggle',
						name = 'Mana Tide Totem'
					},
					HTT = {
						type = 'toggle',
						name = 'Healing Tide Totem'
					},
					ST = {
						type = 'toggle',
						name = 'Stormlash Totem'
					},
					ZEN = {
						type = 'toggle',
						name = 'Zen Meditation'
					},
					LIFE = {
						type = 'toggle',
						name = 'Life Cocoon'
					},
					REV = {
						type = 'toggle',
						name = 'Revival'
					},
		 			SR = {
		 				type = 'toggle',
		 				name = 'Soulstone Resurrection'
		 			},
					RA = {
						type = 'toggle',
						name = 'Raise Ally'
					},
					AMZ = {
						type = 'toggle',
						name = 'Anti-Magic Zone'
					},
		     		RC = {
		     			type = 'toggle',
		     			name = 'Rallying Cry'
		     		},
					DB = {
						type = 'toggle',
						name = 'Demoralizing Banner'
					}
				},		
			},
		},
	}
end
--------------------------------------------------------

E:RegisterModule(RC:GetName());