local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local VUF = E:GetModule('VerticalUnitFrames');
local UF = E:GetModule('UnitFrames')
local LSM = LibStub("LibSharedMedia-3.0");

function VUF:GenerateOptions()
    E.Options.args.unitframe.args.general.args.barGroup.args.vertstatusbar = {
        type = "select", dialogControl = 'LSM30_Statusbar',
        order = 4,
        name = L["Vertical StatusBar Texture"],
        desc = L["Vertical statusbar texture."],
        values = AceGUIWidgetLSMlists.statusbar,            
        set = function(info, value) E.db.unitframe[ info[#info] ] = value; VUF:UpdateAllFrames() end,
    }  
    E.Options.args.unitframe.args.general.args.allColorsGroup.order = 7
    E.Options.args.unitframe.args.general.args.barGroup.args.statusbar.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_StatusBars(); VUF:UpdateAllFrames() end
    E.Options.args.unitframe.args.general.args.fontGroup.args.font.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_FontStrings(); VUF:UpdateAllFrames() end
    E.Options.args.unitframe.args.general.args.fontGroup.args.fontSize.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_FontStrings(); VUF:UpdateAllFrames() end
    E.Options.args.unitframe.args.general.args.fontGroup.args.fontOutline.set = function(info, value) E.db.unitframe[ info[#info] ] = value; UF:Update_FontStrings(); VUF:UpdateAllFrames() end

    E.Options.args.unitframe.args.general.args.vufgen = {
        order = 4,
        type = "group",
        name = L["Vertical Unit Frames"] .. " " .. L["General"],
        guiInline = true,
        args = {
            enabled = {
                type = "toggle",
                order = 1,
                name = L["Enable"],
                desc = L["Enable the Vertical Unit Frames."],
                get = function(info) return E.db.unitframe.vuf[info[#info]] end,
                set = function(info,value) E.db.unitframe.vuf[info[#info]] = value; VUF:Enable(); end,
            },
            resetsettings = {
                type = "execute",
                order = 2,
                name = L["Reset Settings"],
                desc = L["Reset the settings of this addon to their defaults."],
                func = function() E:CopyTable(E.db.unitframe.vuf,P.unitframe.vuf); VUF:Enable(); VUF:UpdateHideSetting(); VUF:UpdateAllFrames(); VUF:UpdateMouseSetting(); end
            },
            oldDefault = {
                type = 'execute',
                order = 3,
                name = L["Old Default"],
                desc = L["Use the old default settings from version 4.17 or under"],
                func = function() VUF:OldDefault(); VUF:Enable(); VUF:UpdateHideSetting(); VUF:UpdateAllFrames(); VUF:UpdateMouseSetting(); end,
            },
            simpleLayout = {
                type = 'execute',
                order = 4,
                name = L['Simple Layout'],
                desc = L['Use the simple layout from 2.0'],
                func = function() VUF:SimpleLayout(); VUF:Enable(); VUF:UpdateHideSetting(); VUF:UpdateAllFrames(); VUF:UpdateMouseSetting(); end,
            },
            comboLayout = {
                type = 'execute',
                order = 5,
                name = L['Combo Layout'],
                desc = L["Use a layout designed to work with ElvUI unitframes"],
                func = function() VUF:ComboLayout(); VUF:Enable(); VUF:UpdateHideSetting(); VUF:UpdateAllFrames(); VUF:UpdateMouseSetting(); end,
            },
        },
    }
    E.Options.args.unitframe.args.general.args.vufOptions = {
        order = 5,
        type = "group",
        name = L["Vertical Unit Frame Options"],
        guiInline = true,
        get = function(info) return E.db.unitframe.vuf[info[#info]] end,
        set = function(info,value) E.db.unitframe.vuf[info[#info]] = value; end, 
        args = {
            hideElv = {
                type = "toggle",
                order = 8,
                name = L["Hide ElvUI Unitframes"],
                desc = L["Hide the ElvUI Unitframes when the Vertical Unit Frame is enabled"],
                get = function(info) return E.db.unitframe.vuf[ info[#info] ] end,   
                set = function(info, value) E.db.unitframe.vuf[ info[#info] ] = value; VUF:UpdateElvUFSetting() end,
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
                desc = L["Hide the Vertical Unit Frame when out of Combat"],
                get = function(info) return E.db.unitframe.vuf[ info[#info] ] end,   
                set = function(info, value) E.db.unitframe.vuf[ info[#info] ] = value; VUF:UpdateHideSetting() end,
            },
            enableMouse = {
                type = "toggle",
                order = 19,
                name = L["Enable Mouse"],
                desc = L["Enable the mouse to interface with the vertical unit frame (this option has no effect if ElvUI Unitframes are hidden)"],
                get = function(info) return E.db.unitframe.vuf[ info[#info] ] end,   
                set = function(info, value) E.db.unitframe.vuf[ info[#info] ] = value; VUF:UpdateMouseSetting() end,
            },
        },
    }
    E.Options.args.unitframe.args.general.args.vufVariables = {
        order = 6,
        type = "group",
        name = L["Variables"],
        guiInline = true,
        get = function(info) return E.db.unitframe.vuf[info[#info]] end,
        set = function(info,value) E.db.unitframe.vuf[info[#info]] = value; end,
        args = {
            alpha = {
                type = "range",
                order = 6,
                name = L["Alpha"],
                desc = L["Set the Alpha of the Vertical Unit Frame when in combat"],
                min = 0, max = 1, step = .05,   
            },
            alphaOOC = {
                type = "range",
                order = 7,
                name = L["Out of Combat Alpha"],
                desc = L["Set the Alpha of the Vertical Unit Frame when out of combat"],
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
    E.Options.args.unitframe.args.vuf = {
        order = 2150,
        type = "group",
        name = L["Vertical Unit Frames"],
        args = {
            header = {
                order = 1,
                type = "header",
                name = L["ElvUI VerticalUnitFrames by Sortokk"],
            },
            description = {
                order = 2,
                type = "description",
                name = L["ElvUI VerticalUnitFrames provides a configurable centered, vertical unit frame option for use with ElvUI.\n"],
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
                        name = L["ElvUI_VerticalUnitFrames_CREDITS"],
                    },
                }
            }
        }
    }
    VUF:GenerateOptionTables()
end