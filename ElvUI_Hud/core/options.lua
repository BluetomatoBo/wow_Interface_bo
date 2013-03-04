local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local UF = E:GetModule('UnitFrames')
local LSM = LibStub("LibSharedMedia-3.0");

function H:GenerateOptions()
    E.Options.args.unitframe.args.general.args.barGroup.args.vertstatusbar = {
        type = "select", dialogControl = 'LSM30_Statusbar',
        order = 4,
        name = L["Vertical StatusBar Texture"],
        desc = L["Vertical statusbar texture."],
        values = AceGUIWidgetLSMlists.statusbar,            
        set = function(info, value) E.db.unitframe[ info[#info] ] = value; H:UpdateAllFrames() end,
    }  
    E.Options.args.unitframe.args.general.args.allColorsGroup.order = 7
    E.Options.args.unitframe.args.general.args.barGroup.args.statusbar.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_StatusBars(); H:UpdateAllFrames() end
    E.Options.args.unitframe.args.general.args.fontGroup.args.font.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_FontStrings(); H:UpdateAllFrames() end
    E.Options.args.unitframe.args.general.args.fontGroup.args.fontSize.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_FontStrings(); H:UpdateAllFrames() end
    E.Options.args.unitframe.args.general.args.fontGroup.args.fontOutline.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_FontStrings(); H:UpdateAllFrames() end

    E.Options.args.unitframe.args.general.args.hudgen = {
        order = 4,
        type = "group",
        name = L["Hud"] .. " " .. L["General"],
        guiInline = true,
        args = {
            enabled = {
                type = "toggle",
                order = 1,
                name = L["Enable"],
                desc = L["Enable the Hud."],
                get = function(info) return E.db.unitframe.hud[info[#info]] end,
                set = function(info,value) E.db.unitframe.hud[info[#info]] = value; H:Enable(); end,
            },
            resetsettings = {
                type = "execute",
                order = 2,
                name = L["Reset Settings"],
                desc = L["Reset the settings of this addon to their defaults."],
                func = function() E:CopyTable(E.db.unitframe.hud,P.unitframe.hud); H:Enable(); H:UpdateHideSetting(); H:UpdateAllFrames(); H:UpdateMouseSetting(); end
            },
            simpleLayout = {
                type = 'execute',
                order = 3,
                name = L['Simple Layout'],
                desc = L['Use the simple layout from 2.0'],
                func = function() H:SimpleLayout(); H:Enable(); H:UpdateHideSetting(); H:UpdateAllFrames(); H:UpdateMouseSetting(); end,
            },
            comboLayout = {
                type = 'execute',
                order = 4,
                name = L['Combo Layout'],
                desc = L["Use a layout designed to work with ElvUI unitframes"],
                func = function() H:ComboLayout(); H:Enable(); H:UpdateHideSetting(); H:UpdateAllFrames(); H:UpdateMouseSetting(); end,
            },
        },
    }
    E.Options.args.unitframe.args.general.args.hudOptions = {
        order = 5,
        type = "group",
        name = L["Hud Options"],
        guiInline = true,
        get = function(info) return E.db.unitframe.hud[info[#info]] end,
        set = function(info,value) E.db.unitframe.hud[info[#info]] = value; end, 
        args = {
            hideElv = {
                type = "toggle",
                order = 8,
                name = L["Hide ElvUI Unitframes"],
                desc = L["Hide the ElvUI Unitframes when the Hud is enabled"],
                get = function(info) return E.db.unitframe.hud[ info[#info] ] end,   
                set = function(info, value) E.db.unitframe.hud[ info[#info] ] = value; H:UpdateElvUFSetting() end,
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
                get = function(info) return E.db.unitframe.hud[ info[#info] ] end,   
                set = function(info, value) E.db.unitframe.hud[ info[#info] ] = value; H:UpdateHideSetting() end,
            },
            enableMouse = {
                type = "toggle",
                order = 19,
                name = L["Enable Mouse"],
                desc = L["Enable the mouse to interface with the hud (this option has no effect if ElvUI Unitframes are hidden)"],
                get = function(info) return E.db.unitframe.hud[ info[#info] ] end,   
                set = function(info, value) E.db.unitframe.hud[ info[#info] ] = value; H:UpdateMouseSetting() end,
            },
        },
    }
    E.Options.args.unitframe.args.general.args.hudVariables = {
        order = 6,
        type = "group",
        name = L["Variables"],
        guiInline = true,
        get = function(info) return E.db.unitframe.hud[info[#info]] end,
        set = function(info,value) E.db.unitframe.hud[info[#info]] = value; end,
        args = {
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
    }
    E.Options.args.unitframe.args.hud = {
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