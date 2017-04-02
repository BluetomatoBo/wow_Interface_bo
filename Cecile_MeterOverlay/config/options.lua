----------------------------------------------------------------------------------------------------
-- Addon Default Const, Options & Options UI
--

--get the engine & Locale
local AddOnName,Engine = ...;
local L = Engine.Locale;

--create the module
local mod = Engine.AddOn:NewModule("options");

--get AceConfigDialog
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

--color, including class colors
Engine.colors = {};

for class, color in pairs(_G["RAID_CLASS_COLORS"]) do
 Engine.colors[class] = { r = color.r, g = color.g, b = color.b };
end

Engine.colors["PET"] 		= {r = 0.09, g = 0.61, b = 0.55};
Engine.colors["UNKNOWN"] 	= {r = 0.49803921568627, g = 0.49803921568627, b = 0.49803921568627};
Engine.colors["MOB"] 		= {r = 0.58, g = 0.24, b = 0.63};
Engine.colors["UNGROUPED"]	= {r = 0.63, g = 0.58, b = 0.24};
Engine.colors["HOSTILE"] 	= {r = 0.7, g = 0.1, b = 0.1};
Engine.colors["HEADER"] 	= {r=0.4,g=0.78,b=1};
Engine.colors["HEAL"] 		= {r=0,g=1,b=0};
Engine.colors["DAMAGE"] 	= {r=1,g=0,b=0};
Engine.colors["OTHER"] 		= {r = 0.35686274509804, g = 0.56470588235294, b = 0.031372549019608};

--type of overlay hide
Engine.OVERLAY_HIDE_NORMAL 	= "OVERLAY_HIDE_NORMAL";
Engine.OVERLAY_HIDE_FADE	= "OVERLAY_HIDE_FADE";

--list of overlay hide for options
Engine.OverlayHideTypeList={}
Engine.OverlayHideTypeList[Engine.OVERLAY_HIDE_NORMAL ] 	= L["OVERLAY_HIDE_NORMAL"];
Engine.OverlayHideTypeList[Engine.OVERLAY_HIDE_FADE ] 		= L["OVERLAY_HIDE_FADE"];

--type of floating datatext hide
Engine.DATATEXT_HIDE_NORMAL 	= "DATATEXT_HIDE_NORMAL";
Engine.DATATEXT_HIDE_FADE		= "DATATEXT_HIDE_FADE";

--list of floating datatext hide for options
Engine.DatatextHideTypeList={}
Engine.DatatextHideTypeList[Engine.DATATEXT_HIDE_NORMAL ] 	= L["DATATEXT_HIDE_NORMAL"];
Engine.DatatextHideTypeList[Engine.DATATEXT_HIDE_FADE ] 	= L["DATATEXT_HIDE_FADE"];

--type of sorting
Engine.SORT_PERSEC		= "SORT_PERSEC";
Engine.SORT_RAW			= "SORT_RAW";

--type of report we query
Engine.TYPE_DPS		= "TYPE_DPS";
Engine.TYPE_HEAL	= "TYPE_HEAL";

--overlay types
Engine.OVERLAY_TYPE_DPS 	= Engine.TYPE_DPS;
Engine.OVERLAY_TYPE_HEAL 	= Engine.TYPE_HEAL;
Engine.OVERLAY_TYPE_BOTH 	= "TYPE_BOTH"

--list of overlay for options ui
Engine.OverlayTypeList={}

Engine.OverlayTypeList[Engine.OVERLAY_TYPE_DPS ] 	= L["OVERLAY_TYPE_DPS"];
Engine.OverlayTypeList[Engine.OVERLAY_TYPE_HEAL ] 	= L["OVERLAY_TYPE_HEAL"];
Engine.OverlayTypeList[Engine.OVERLAY_TYPE_BOTH ] 	= L["OVERLAY_TYPE_BOTH"];

---segments type
Engine.CURRENT_DATA	= "CurrentFightData";
Engine.LAST_DATA 	= "LastFightData";
Engine.OVERALL_DATA	= "OverallData";

--look table for locale of a segment type
Engine.ConvertDataSet={};
Engine.ConvertDataSet[Engine.OVERALL_DATA] 	= L["OVERALL_DATA"];
Engine.ConvertDataSet[Engine.CURRENT_DATA] 	= L["CURRENT_DATA"];

--datatex formats
Engine.formatlist={};

Engine.formatlist["FORMAT_OWN_DPS"] = "DPS: [dps]";
Engine.formatlist["FORMAT_OWN_HPS"] = "HPS: [hps]";
Engine.formatlist["FORMAT_OWN_DPS_OWN_HPS"] = "DPS: [dps] - HPS: [hps]";
Engine.formatlist["FORMAT_COMBAT_DPS"] = "[ndps] [combat] [dps] ([pdps]%)";
Engine.formatlist["FORMAT_COMBAT_HEAL"] = "[nhealer] [combat] [hps] ([pheal]%)";

Engine.formatlist["FORMAT_RAID_DPS"] = "RDPS: [rdps]";
Engine.formatlist["FORMAT_RAID_HPS"] = "RHPS: [rhps]";

Engine.formatlist["FORMAT_OWN_DPS_RAID_DPS"] = "DPS: [dps] - RDPS: [rdps]";
Engine.formatlist["FORMAT_OWN_HPS_RAID_HPS"] = "HPS: [hps] - RHPS: [rhps]";

Engine.formatlist["FORMAT_OWN_HPS_RAID_DPS"] = "HPS: [hps] - RDPS: [rdps]";
Engine.formatlist["FORMAT_OWN_DPS_RAID_HPS"] = "DPS: [dps] - RHPS: [rhps]";

Engine.formatlist["FORMAT_RAID_DPS_RAID_HPS"] = "RDPS: [rdps] - RHPS: [rhps]";
Engine.formatlist["FORMAT_RAID_DPS_RAID_HPS"] = "RDPS: [rdps] - RHPS: [rhps]";

Engine.formatlist["FORMAT_OWN_DPS_RAID_DPS_OWN_HPS_RAID_HPS"] = "DPS: [dps] - RDPS: [rdps] - HPS: [hps] - RDPS: [rhps]";

Engine.formatlist["FORMAT_DEFAULT_DPS"] = "[ndps] [player] [damage] ([dps])";
Engine.formatlist["FORMAT_DEFAULT_HEALER"] = "[nhealer] [player] [healing] ([hps])";

Engine.formatlist["FORMAT_CUSTOM"] = "";

--list of formats localized for the options ui
Engine.formatdesc = {};

for key, format in pairs(Engine.formatlist) do
 Engine.formatdesc[key] = L[key];
end

--report types
Engine.REPORT_SELF 		= "REPORT_SELF";
Engine.REPORT_GUILD 	= "REPORT_GUILD";
Engine.REPORT_INSTANCE 	= "REPORT_INSTANCE";

--list of reports for options ui
Engine.ReportTypeList={}

Engine.ReportTypeList[Engine.REPORT_SELF ] 		= L["REPORT_SELF"];
Engine.ReportTypeList[Engine.REPORT_GUILD ] 	= L["REPORT_GUILD"];
Engine.ReportTypeList[Engine.REPORT_INSTANCE ] 	= L["REPORT_INSTANCE"];

--strata types

Engine.STRATA_BACKGROUND 		= "BACKGROUND"
Engine.STRATA_LOW 				= "LOW"
Engine.STRATA_MEDIUM 			= "MEDIUM"
Engine.STRATA_HIGH 				= "HIGH"
Engine.STRATA_DIALOG 			= "DIALOG"
Engine.STRATA_FULLSCREEN 		= "FULLSCREEN"
Engine.STRATA_FULLSCREEN_DIALOG	= "FULLSCREEN_DIALOG"
Engine.STRATA_TOOLTIP 			= "TOOLTIP"


--list of strata types for options UI
Engine.StrataModesList={}

Engine.StrataModesList[Engine.STRATA_BACKGROUND] 		= L["STRATA_BACKGROUND"]
Engine.StrataModesList[Engine.STRATA_LOW] 				= L["STRATA_LOW"]
Engine.StrataModesList[Engine.STRATA_MEDIUM] 			= L["STRATA_MEDIUM"]
Engine.StrataModesList[Engine.STRATA_HIGH] 				= L["STRATA_HIGH"]
Engine.StrataModesList[Engine.STRATA_DIALOG] 			= L["STRATA_DIALOG"]
Engine.StrataModesList[Engine.STRATA_FULLSCREEN] 		= L["STRATA_FULLSCREEN"]
Engine.StrataModesList[Engine.STRATA_FULLSCREEN_DIALOG] = L["STRATA_FULLSCREEN_DIALOG"]
Engine.StrataModesList[Engine.STRATA_TOOLTIP] 			= L["STRATA_TOOLTIP"]


--configuration colors
Engine.CONFIG_COLOR_GENERAL 	= "general"
Engine.CONFIG_COLOR_DAMAGE 		= "damage"
Engine.CONFIG_COLOR_HEALING 	= "healing"
Engine.CONFIG_COLOR_OTHER 		= "other"

--defaults
Engine.Defaults = {
	profile = {
		debug = false,
		forceLocale = "",
		datatext = {
			x = nil,
			y = nil,
			w = 200,
			h = 16,
			lock = false,
			enable = true,
			format = "FORMAT_DEFAULT_DPS",
			customformat = Engine.formatlist["FORMAT_DEFAULT_DPS"],
			font = "Cecile",
			fontSize = 12,
			background = {
				enable = true,
				color = {
					r = 0,
					g = 0,
					b = 0,
					a = 0.75,
				},
			},
			hideOOC = false,
			hideOCCMode = Engine.DATATEXT_HIDE_FADE,
			strata = Engine.STRATA_TOOLTIP,
			colors = {
				general = Engine.colors["PRIEST"],
				damage = Engine.colors["DAMAGE"],
				healing = Engine.colors["HEAL"],
				other = Engine.colors["HEADER"],
			},
		},
		encounters = {
			store = false,
			autoReportTop = false,
			autoReportTopType = Engine.REPORT_SELF,
			autoReportPlayer = false,
			autoReportPlayerType = Engine.REPORT_SELF,
		},
		interval = 1,
		segment = Engine.CURRENT_DATA,
		overlay = {
			type = Engine.TYPE_DPS,
			lines = 10,
			font = "Cecile",
			fontSize = 10,
			tip = true,
			totals = true,
			elvtukoverride = false,
			color = {
				r = 0,
				g = 0,
				b = 0,
				a = 0.65,
			},
			hide = Engine.OVERLAY_HIDE_FADE,
		}
	}
}

--options table for the options ui
Engine.Options = {
	type = "group",
	name = L["CONFIG_NAME"],
	args = {

    Title = {
      order = 0,
      type = "description",
      fontSize = "large",
      name = string.format(L["CONFIG_WINDOW"],GetAddOnMetadata(AddOnName, "Title"),GetAddOnMetadata(AddOnName, "Version"))
    },
    Header = {
      order = 1,
      type = "header",
      name = "",
      width = "full",
    },
		general = {
			order = 2,
			type = "group",
			name = L["GENERAL_SETTINGS"],
			cmdInline = true,
			args = {
				Frames_Header = {
				  type = "description",
				  order = 0,
				  name = L["GENERAL_SETTINGS"],
				  fontSize = "large",
				},
				interval = {
					order = 1,
					min = 1,
					max = 30,
					step = 1,
					bigStep  = 5,
					type = "range",
					name = L["UPDATE_INTERVAL"],
					desc = L["UPDATE_INTERVAL_DESC"],
					get = function()
						return Engine.Profile.interval;
					end,
					set = function(key, value)
						Engine.Profile.interval = value;
					end,
				},
				dataset = {
					order = 2,
					type = "select",
					name = L["SEGMENT"],
					desc = L["SEGMENT_DESC"],
					values = Engine.ConvertDataSet,
					get = function()
						return Engine.Profile.segment;
					end,
					set = function(key, value)
						Engine.Profile.segment = value;
					end,
				},
			}
		},
		overlay = {
			order = 3,
			type = "group",
			name = L["OVERLAY_SETTINGS"],
			cmdInline = true,
			args = {
				Frames_Header = {
				  type = "description",
				  order = 0,
				  name = L["OVERLAY_SETTINGS"],
				  fontSize = "large",
				},
				overlaytype = {
					order = 1,
					type = "select",
					name = L["OVERLAY_TYPE"],
					desc = L["OVERLAY_TYPE_DESC"],
					values = Engine.OverlayTypeList,
					get = function()
						return Engine.Profile.overlay.type;
					end,
					set = function(key, value)
						Engine.Profile.overlay.type = value;
					end,
				},
				lines = {
					order = 2,
					min = 5,
					max = 40,
					step = 1,
					bigStep  = 5,
					type = "range",
					name = L["NUM_LINES"],
					desc = L["NUM_LINES_DESC"],
					get = function()
						return Engine.Profile.overlay.lines;
					end,
					set = function(key, value)
						Engine.Profile.overlay.lines = value;
					end,
				},
				tip = {
					order = 3,
					type = "toggle",
					name = L["TIP"],
					desc = L["TIP_DESC"],
					get = function()
						return Engine.Profile.overlay.tip;
					end,
					set = function(key, value)
						Engine.Profile.overlay.tip = value;
					end,
					disabled = function()
						return false;
					end,
				},
				totals = {
					order = 4,
					type = "toggle",
					name = L["TOTALS"],
					desc = L["TOTALS_DESC"],
					get = function()
						return Engine.Profile.overlay.totals;
					end,
					set = function(key, value)
						Engine.Profile.overlay.totals = value;
					end,
				},
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 5,
					name = L["FONT_NAME"],
					desc = L["FONT_NAME_DESC"],
					values = AceGUIWidgetLSMlists.font,
					get = function()
						return Engine.Profile.overlay.font;
					end,
					set = function(key, value)
						Engine.Profile.overlay.font = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:ChangeFont();
					end,
				},
				fontSize = {
					order = 6,
					name = L["FONT_SIZE"],
					desc = L["FONT_SIZE_DESC"],
					type = "range",
					min = 6,
					max = 22,
					step = 1,
					bigStep = 2,
					get = function()
						return Engine.Profile.overlay.fontSize;
					end,
					set = function(key, value)
						Engine.Profile.overlay.fontSize = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:ChangeFont();
					end,
				},
				color = {
					order = 7,
					type = "color",
					name = L["OVERLAY_BG_COLOR"],
					desc = L["OVERLAY_BG_COLOR_DESC"],
					hasAlpha = true,
					get = function()
						return 	Engine.Profile.overlay.color.r,
								Engine.Profile.overlay.color.g,
								Engine.Profile.overlay.color.b,
								Engine.Profile.overlay.color.a
					end,
					set = function(key,r,g,b,a)
						Engine.Profile.overlay.color.r = r;
						Engine.Profile.overlay.color.g = g;
						Engine.Profile.overlay.color.b = b;
						Engine.Profile.overlay.color.a = a;
					end,
				},
				hidetype = {
					order = 8,
					type = "select",
					name = L["OVERLAY_HIDE_TYPE"],
					desc = L["OVERLAY_HIDE_TYPE_DESC"],
					values = Engine.OverlayHideTypeList,
					get = function()
						return Engine.Profile.overlay.hide;
					end,
					set = function(key, value)
						Engine.Profile.overlay.hide = value;
					end,
				},
				elvtukoverride = {
					order = 10,
					type = "toggle",
					name = L["ELV_TUK_OVERRIDE"],
					desc = L["ELV_TUK_OVERRIDE_DESC"],
					get = function()
						return Engine.Profile.overlay.elvtukoverride;
					end,
					set = function(key, value)
						Engine.Profile.overlay.elvtukoverride = value;
					end,
					disabled = function()
						return not (mod.encounters)
					end
				},

			}
		},
		formatOptioss={
			type = "group",
			name = L["FORMAT"],
			desc = L["FORMAT_DESC"],
			childGroups = 'tab',
			order = 4,
			args ={
				format = {
					order = 1,
					type = "group",
					name = L["FORMAT"],
					desc = L["FORMAT_DESC"],
					cmdInline = true,
					args = {
						format = {
							order = 3,
							type = "select",
							name = L["FORMAT"],
							desc = L["FORMAT_DESC"],
							width = "full",
							values = Engine.formatdesc,
							get = function()
								return Engine.Profile.datatext.format;
							end,
							set = function(key, value)
								Engine.Profile.datatext.format = value;
								if not (value=="FORMAT_CUSTOM") then
									Engine.Profile.datatext.customformat = Engine.formatlist[value];
								end
							end,
						},
						customformat = {
							order = 4,
							type = "input",
							name = L["FORMAT_CUSTOM"],
							desc = L["FORMAT_CUSTOM_DESC"],
							width = "full",
							get = function()
								return Engine.Profile.datatext.customformat;
							end,
							set = function(key, value)
								Engine.Profile.datatext.customformat = value;
							end,
							disabled = function()
								return not (Engine.Profile.datatext.format == "FORMAT_CUSTOM");
							end,
						},
						exampleformat = {
							order = 5,
							type = "input",
							name = L["EXAMPLE"],
							width = "full",
							get = function()
								local meter = Engine.AddOn:GetModule("meter");

								meter:SetNumberValue( "dps",		random(10000,100000),		Engine.CONFIG_COLOR_DAMAGE);
								meter:SetNumberValue( "rdps",		random(100000,1000000),		Engine.CONFIG_COLOR_DAMAGE);
								meter:SetNumberValue( "damage",		random(100000,1000000),		Engine.CONFIG_COLOR_DAMAGE);
								meter:SetNumberValue( "rdamage",	random(1000000,10000000),	Engine.CONFIG_COLOR_DAMAGE);
								meter:SetOrdinalValue( "ndps",		random(1,10),				Engine.CONFIG_COLOR_DAMAGE);

								meter:SetNumberValue( "hps",		random(10000,100000),		Engine.CONFIG_COLOR_HEALING);
								meter:SetNumberValue( "rhps",		random(100000,1000000),		Engine.CONFIG_COLOR_HEALING);
								meter:SetNumberValue( "healing",	random(100000,1000000),		Engine.CONFIG_COLOR_HEALING);
								meter:SetNumberValue( "rhealing",	random(1000000,10000000),	Engine.CONFIG_COLOR_HEALING);
								meter:SetOrdinalValue( "nhealer",	random(1,10),				Engine.CONFIG_COLOR_HEALING);

								return meter:PaseString(Engine.Profile.datatext.customformat);
							end,
							disabled = true,
						},
						tagsHelp = {
							order = 6,
							type = "description",
							name = L["TAGS_LIST"],
							width = "full",
						},

					},
				},
				colors = {
					order = 2,
					type = "group",
					name = L["COLOR"],
					desc = L["COLOR_DESC"],
					cmdInline = true,
					args = {
						general = {
							order = 1,
							type = "color",
							name = L["DATATEXT_GENERAL_COLOR"],
							desc = L["DATATEXT_GENERAL_COLOR_DESC"],
							hasAlpha = false,
							get = function()
								return 	Engine.Profile.datatext.colors.general.r,
										Engine.Profile.datatext.colors.general.g,
										Engine.Profile.datatext.colors.general.b,
										Engine.Profile.datatext.colors.general.a
							end,
							set = function(key,r,g,b,a)
								Engine.Profile.datatext.colors.general.r = r;
								Engine.Profile.datatext.colors.general.g = g;
								Engine.Profile.datatext.colors.general.b = b;
								Engine.Profile.datatext.colors.general.a = a;
							end,
						},
						damage = {
							order = 2,
							type = "color",
							name = L["DATATEXT_DAMAGE_COLOR"],
							desc = L["DATATEXT_DAMAGE_COLOR_DESC"],
							hasAlpha = false,
							get = function()
								return 	Engine.Profile.datatext.colors.damage.r,
										Engine.Profile.datatext.colors.damage.g,
										Engine.Profile.datatext.colors.damage.b,
										Engine.Profile.datatext.colors.damage.a
							end,
							set = function(key,r,g,b,a)
								Engine.Profile.datatext.colors.damage.r = r;
								Engine.Profile.datatext.colors.damage.g = g;
								Engine.Profile.datatext.colors.damage.b = b;
								Engine.Profile.datatext.colors.damage.a = a;
							end,
						},
						healing = {
							order = 3,
							type = "color",
							name = L["DATATEXT_HEALING_COLOR"],
							desc = L["DATATEXT_HEALING_COLOR_DESC"],
							hasAlpha = false,
							get = function()
								return 	Engine.Profile.datatext.colors.healing.r,
										Engine.Profile.datatext.colors.healing.g,
										Engine.Profile.datatext.colors.healing.b,
										Engine.Profile.datatext.colors.healing.a
							end,
							set = function(key,r,g,b,a)
								Engine.Profile.datatext.colors.healing.r = r;
								Engine.Profile.datatext.colors.healing.g = g;
								Engine.Profile.datatext.colors.healing.b = b;
								Engine.Profile.datatext.colors.healing.a = a;
							end,
						},
						other = {
							order = 4,
							type = "color",
							name = L["DATATEXT_OTHER_COLOR"],
							desc = L["DATATEXT_OTHER_COLOR_DESC"],
							hasAlpha = false,
							get = function()
								return 	Engine.Profile.datatext.colors.other.r,
										Engine.Profile.datatext.colors.other.g,
										Engine.Profile.datatext.colors.other.b,
										Engine.Profile.datatext.colors.other.a
							end,
							set = function(key,r,g,b,a)
								Engine.Profile.datatext.colors.other.r = r;
								Engine.Profile.datatext.colors.other.g = g;
								Engine.Profile.datatext.colors.other.b = b;
								Engine.Profile.datatext.colors.other.a = a;
							end,
						},
					},
				},
			},
		},
		datatext = {
			order = 5,
			type = "group",
			name = L["DATATEXT"],
			cmdInline = true,
			args = {
				Frames_Header = {
				  type = "description",
				  order = 0,
				  name = L["DATATEXT"],
				  fontSize = "large",
				},
				enable = {
					order = 1,
					type = "toggle",
					name = L["ENABLE_DATATEXT"],
					desc = L["ENABLE_DATATEXT_DESC"],
					get = function()
						return Engine.Profile.datatext.enable;
					end,
					set = function(key, value)
						Engine.Profile.datatext.enable = value;

						local datatext = Engine.AddOn:GetModule("datatext");

						if (value) then
							datatext:Enable();
						else
							datatext:Disable();
						end
					end,
				},
				LockDatatext = {
					order = 2,
					type = "toggle",
					name = L["LOCKDATATEXT"],
					desc = L["LOCKDATATEXT_DESC"],
					get = function()
						return Engine.Profile.datatext.lock;
					end,
					set = function(key, value)
						Engine.Profile.datatext.lock = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:Lock(value);
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				width = {
					order = 3,
					min = 50,
					max = 400,
					step = 1,
					bigStep  = 50,
					type = "range",
					name = L["WIDTH"],
					desc = L["WIDTH_DESC"],
					get = function()
						return Engine.Profile.datatext.w
					end,
					set = function(key, value)
						Engine.Profile.datatext.w = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:Reset();
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				height = {
					order = 4,
					min = 8,
					max = 40,
					step = 1,
					bigStep  = 2,
					type = "range",
					name = L["HEIGHT"],
					desc = L["HEIGHT_DESC"],
					get = function()
						return Engine.Profile.datatext.h
					end,
					set = function(key, value)
						Engine.Profile.datatext.h = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:Reset();
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 5,
					name = L["FONT_NAME"],
					desc = L["FONT_NAME_DESC"],
					values = AceGUIWidgetLSMlists.font,
					get = function()
						return Engine.Profile.datatext.font;
					end,
					set = function(key, value)
						Engine.Profile.datatext.font = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:ChangeFont();
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				fontSize = {
					order = 6,
					name = L["FONT_SIZE"],
					desc = L["FONT_SIZE_DESC"],
					type = "range",
					min = 6, max = 22, step = 1,
					get = function()
						return Engine.Profile.datatext.fontSize;
					end,
					set = function(key, value)
						Engine.Profile.datatext.fontSize = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:ChangeFont();
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				background = {
					order = 7,
					type = "toggle",
					name = L["ENABLE_DATATEXT_BACGROUND"],
					desc = L["ENABLE_DATATEXT_BACGROUND_DESC"],
					get = function()
						return Engine.Profile.datatext.background.enable;
					end,
					set = function(key, value)
						Engine.Profile.datatext.background.enable = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:Reset();
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				bgcolor = {
					order = 8,
					type = "color",
					name = L["OVERLAY_BG_COLOR"],
					desc = L["OVERLAY_BG_COLOR_DESC"],
					hasAlpha = true,
					get = function()
						return 	Engine.Profile.datatext.background.color.r,
								Engine.Profile.datatext.background.color.g,
								Engine.Profile.datatext.background.color.b,
								Engine.Profile.datatext.background.color.a

					end,
					set = function(key,r,g,b,a)
						Engine.Profile.datatext.background.color.r = r;
						Engine.Profile.datatext.background.color.g = g;
						Engine.Profile.datatext.background.color.b = b;
						Engine.Profile.datatext.background.color.a = a;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:Reset();
					end,
					disabled = function()
						return not (Engine.Profile.datatext.enable and Engine.Profile.datatext.background.enable);
					end,
				},
				hideOOC = {
					order = 8,
					type = "toggle",
					name = L["ENABLE_DATATEXT_HIDE_OCC"],
					desc = L["ENABLE_DATATEXT_HIDE_OCC_DESC"],
					get = function()
						return Engine.Profile.datatext.hideOOC;
					end,
					set = function(key, value)
						Engine.Profile.datatext.hideOOC = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:ControlVisibility();
					end,
					disabled = function()
						return not Engine.Profile.datatext.enable;
					end,
				},
				hidetype = {
					order = 9,
					type = "select",
					name = L["DATATEXT_HIDE_TYPE"],
					desc = L["DATATEXT_HIDE_TYPE_DESC"],
					values = Engine.DatatextHideTypeList,
					get = function()
						return Engine.Profile.datatext.hideOCCMode;
					end,
					set = function(key, value)
						Engine.Profile.datatext.hideOCCMode = value;
					end,
					disabled = function()
						return not (Engine.Profile.datatext.enable and Engine.Profile.datatext.hideOOC);
					end,
				},
				strata = {
					order = 10,
					type = "select",
					name = L["STRATA_TYPE"],
					desc = L["STRATA_TYPE_DESC"],
					values = Engine.StrataModesList,
					get = function()
						return Engine.Profile.datatext.strata;
					end,
					set = function(key, value)
						Engine.Profile.datatext.strata = value;

						local datatext = Engine.AddOn:GetModule("datatext");
						datatext:Reset();
					end,
					disabled = function()
						return not (Engine.Profile.datatext.enable);
					end,
				},
			}
		},
		encounters = {
			order = 6,
			type = "group",
			name = L["ENCOUNTERS_SETTINGS"],
			cmdInline = true,
			args = {
				Frames_Header = {
				  type = "description",
				  order = 0,
				  name = L["ENCOUNTERS_SETTINGS"],
				  fontSize = "large",
				},
				warning = {
					order = 1,
					type = "description",
					name = L["ENCOUNTERS_WARNING"],
					width = "full",
					hidden = function()
						return mod.encounters.hasBossMod;
					end,
				},
				store = {
					order = 2,
					type = "toggle",
					width = "full",
					name = L["ENCOUNTERS_STORE"],
					desc = L["ENCOUNTERS_STORE_DESC"],
					get = function()
						return Engine.Profile.encounters.store and mod.encounters.hasBossMod;
					end,
					set = function(key, value)
						Engine.Profile.encounters.store = value;
					end,
					disabled = function()
						return not mod.encounters.hasBossMod;
					end,
				},
				autoReportTop = {
					order = 4,
					type = "toggle",
					name = L["ENCOUNTERS_AUTO_REPORT_TOP"],
					desc = L["ENCOUNTERS_AUTO_REPORT_TOP_DESC"],
					get = function()
						return Engine.Profile.encounters.autoReportTop;
					end,
					set = function(key, value)
						Engine.Profile.encounters.autoReportTop = value;
					end,
					disabled = function()
						return not Engine.Profile.encounters.store;
					end,
				},
				autoReportTopType = {
				  order = 5,
				  type = "select",
				  name = L["ENCOUNTERS_AUTO_REPORT_TYPE"],
				  desc = L["ENCOUNTERS_AUTO_REPORT_TYPE_DESC"],
				  values = Engine.ReportTypeList,
				  disabled = function()
					return not (Engine.Profile.encounters.store and Engine.Profile.encounters.autoReportTop);
				  end,
				  get = function()
					return Engine.Profile.encounters.autoReportTopType;
				  end,
				  set = function(key, value)
					Engine.Profile.encounters.autoReportTopType = value;
				  end,
				},
				autoReportPlayer = {
					order = 6,
					type = "toggle",
					name = L["ENCOUNTERS_AUTO_REPORT_PLAYER"],
					desc = L["ENCOUNTERS_AUTO_REPORT_PLAYER_DESC"],
					get = function()
						return Engine.Profile.encounters.autoReportPlayer;
					end,
					set = function(key, value)
						Engine.Profile.encounters.autoReportPlayer = value;
					end,
					disabled = function()
						return not Engine.Profile.encounters.store;
					end,
				},
				autoReportPlayerType = {
				  order = 7,
				  type = "select",
				  name = L["ENCOUNTERS_AUTO_REPORT_TYPE"],
				  desc = L["ENCOUNTERS_AUTO_REPORT_TYPE_DESC"],
				  values = Engine.ReportTypeList,
				  disabled = function()
					return not (Engine.Profile.encounters.store and Engine.Profile.encounters.autoReportPlayer);
				  end,
				  get = function()
					return Engine.Profile.encounters.autoReportPlayerType;
				  end,
				  set = function(key, value)
					Engine.Profile.encounters.autoReportPlayerType = value;
				  end,
				},
				Browse_Header = {
				  type = "description",
				  order = 10,
				  name = L["ENCOUNTERS_BROWSE"],
				  fontSize = "medium",
				},
				browse = {
				  order = 11,
				  type = 'execute',
				  name = L["BROWSE_RECORDS"],
				  desc = L["BROWSE_RECORDS_DESC"],
				  func = function()
				  	GameTooltip:Hide();
				  	AceConfigDialog:Close(Engine.Name);
					mod.encounters:browseRecords();
				  end,
				},
			},
		},
		developer = {
			order = 7,
			type = "group",
			name = L["DEV_SETTINGS"],
			cmdInline = true,
			args = {
				Frames_Header = {
				  type = "description",
				  order = 0,
				  name = L["DEV_SETTINGS"],
				  fontSize = "large",
				},
				debug = {
					order = 1,
					type = "toggle",
					name = L["DEBUGGING"],
					desc = L["DEBUGGING_DESC"],
					get = function()
						return Engine.Profile.debug
					end,
					set = function(key, value)
						local debug = Engine.AddOn:GetModule("debug");

						debug:EnableDebugging(value);
						debug:Show(value);

						Engine.Profile.debug = value;
					end,
				},
			}
		},
	}
}

-- Interface - Addons (Ace3 Blizzard Options)
Engine.blizzardOptions = {
  name = string.format(L["CONFIG_WINDOW"],GetAddOnMetadata(AddOnName, "Title"),GetAddOnMetadata(AddOnName, "Version")),
  handler = x,
  type = 'group',
  args = {
    showConfig = {
      order = 1,
      type = 'execute',
      name = L["OPEN_CONFIG"],
	  desc = L["OPEN_CONFIG_DESC"],
      func = function() InterfaceOptionsFrameOkay:Click();
		LibStub("AceConfigDialog-3.0"):Open(AddOnName);
		GameMenuButtonContinue:Click()
	  end,
    },
  },
}

--initialize module
function mod:OnInitialize()

	--get the encounters module
	mod.encounters = Engine.AddOn:GetModule("encounters");

end