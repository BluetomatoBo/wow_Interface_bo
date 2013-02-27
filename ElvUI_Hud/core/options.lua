local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local LSM = LibStub("LibSharedMedia-3.0");

function H:GenerateOptions()
    E.Options.args.hud = {
        order = 2150,
        type = "group",
        name = L["Hud"],
        args = {
            header = {
                order = 1,
                type = "header",
                name = L["ElvUI Hud by Sortokk"],
            },
            description = {
                order = 2,
                type = "description",
                name = L["ElvUI Hud provides a configurable Heads Up Display for use with ElvUI.\n"],
            },
            general = {
                order = 3,
                type = "group",
                name = L["General"],
                guiInline = true,

                args = {
                    enabled = {
                        type = "toggle",
                        order = 1,
                        name = L["Enable"],
                        desc = L["Enable the Hud."],
                        get = function(info) return E.db.hud[info[#info]] end,
                        set = function(info,value) E.db.hud[info[#info]] = value; H:Enable(); end,
                    },
                    resetsettings = {
                        type = "execute",
                        order = 2,
                        name = L["Reset Settings"],
                        desc = L["Reset the settings of this addon to their defaults."],
                        func = function() E:CopyTable(E.db.hud,P.hud); H:Enable(); H:UpdateHideSetting(); H:UpdateAllFrames(); H:UpdateMouseSetting(); end
                    },
                    simpleLayout = {
                        type = 'execute',
                        order = 3,
                        name = L['Simple Layout'],
                        desc = L['Use the simple layout from 2.0'],
                        func = function() H:SimpleLayout(); H:UpdateAllFrames(); end,
                    }
                },
            },
            hudOptions = {
                order = 4,
                type = "group",
                name = L["Hud Options"],
                guiInline = true,
                get = function(info) return E.db.hud[info[#info]] end,
                set = function(info,value) E.db.hud[info[#info]] = value; end, 
                args = {
                    hideElv = {
                        type = "toggle",
                        order = 8,
                        name = L["Hide ElvUI Unitframes"],
                        desc = L["Hide the ElvUI Unitframes when the Hud is enabled"],
                        get = function(info) return E.db.hud[ info[#info] ] end,   
                        set = function(info, value) E.db.hud[ info[#info] ] = value; H:UpdateElvUFSetting(false) end,
                    },
                    flash = {
                        type = "toggle",
                        order = 15,
                        name = L["Flash"],
                        desc = L["Flash health/power when the low threshold is reached"],
                    },
                    screenflash = {
                        type = "toggle",
                        order = 16,
                        name = L["Screen Flash"],
                        desc = L["Flash the screen border red when the low threshold is reached"],
                    },
                    warningText = {
                        type = "toggle",
                        order = 16,
                        name = L["Text Warning"],
                        desc = L["Show a Text Warning when the low threshold is reached"],
                    },
                    hideOOC  = {
                        type = "toggle",
                        order = 17,
                        name = L["Hide Out of Combat"],
                        desc = L["Hide the Hud when out of Combat"],
                        get = function(info) return E.db.hud[ info[#info] ] end,   
                        set = function(info, value) E.db.hud[ info[#info] ] = value; H:UpdateHideSetting() end,
                    },
                    colorHealthByValue = {
                        type = "toggle",
                        order = 18,
                        name = L["Health By Value"],
                        desc = L["Color health by amount remaining."],
                    },
                    enableMouse = {
                        type = "toggle",
                        order = 19,
                        name = L["Enable Mouse"],
                        desc = L["Enable the mouse to interface with the hud (this option has no effect if ElvUI Unitframes are hidden)"],
                        get = function(info) return E.db.hud[ info[#info] ] end,   
                        set = function(info, value) E.db.hud[ info[#info] ] = value; H:UpdateMouseSetting() end,
                    },
                    horizCastbar = {
                        type = "toggle",
                        order = 20,
                        name = L["Horizontal Castbar"],
                        desc = L["Use a horizontal castbar"],
                        get = function(info) return E.db.hud[info[#info]] end,
                        set = function(info,value) E.db.hud[info[#info]] = value; E:StaticPopup_Show("CONFIG_RL"); end,
                    },
                    font = {
                        type = "select", dialogControl = 'LSM30_Font',
                        order = 1,
                        name = L["Default Font"],
                        desc = L["The font that the core of the UI will use."],
                        values = AceGUIWidgetLSMlists.font, 
                        get = function(info) return E.db.hud[ info[#info] ] end,   
                        set = function(info, value) E.db.hud[ info[#info] ] = value; H:UpdateAllFrames() end,
                    },
                    texture = {
                        type = "select", dialogControl = 'LSM30_Statusbar',
                        order = 1,
                        name = L["Primary Texture"],
                        desc = L["The texture that will be used mainly for statusbars."],
                        values = AceGUIWidgetLSMlists.statusbar,
                        get = function(info) return E.db.hud[ info[#info] ] end,
                        set = function(info, value) E.db.hud[ info[#info] ] = value; H:UpdateAllFrames() end,                            
                    },
                },
            },
            hudVariables = {
                order = 5,
                type = "group",
                name = L["Variables"],
                guiInline = true,
                get = function(info) return E.db.hud[info[#info]] end,
                set = function(info,value) E.db.hud[info[#info]] = value; end,
                args = {
                    fontsize = {
                        type = "range",
                        order = 5,
                        name = L["Font Size"],
                        min = 10, max = 30, step = 1,   
                    },
                    alpha = {
                        type = "range",
                        order = 6,
                        name = L["Alpha"],
                        desc = L["Set the Alpha of the Hud when in combat"],
                        min = 0, max = 1, step = .05,   
                    },
                    alphaOOC = {
                        type = "range",
                        order = 7,
                        name = L["Out of Combat Alpha"],
                        desc = L["Set the Alpha of the Hud when out of combat"],
                        min = 0, max = 1, step = 0.05,  
                    },
                    lowThreshold = {
                        type = "range",
                        order = 8,
                        name = L["Low Threshold"],
                        desc = L["Start flashing health/power under this percentage"],
                        min = 0, max = 100, step = 1,
                    }
                },
            },
            credits = {
                order = 10000,
                type = "group",
                name = L["Credits"],
                guiInline = false,
                args = {
                    creditheader = {
                        order = 1,
                        type = "header",
                        name = L["Credits"],
                    },
                    credits = {
                        order = 2,
                        type = "description",
                        name = L["ELVUI_HUD_CREDITS"],
                    },
                }
            }
        }
    }
    H:GenerateOptionTables()
end