local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local LSM = LibStub("LibSharedMedia-3.0");

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
};

local growthValues = {
    UP = L['Up'],
    DOWN = L['Down']
}

function H:GenerateValidAnchors(unit,element,value)
    local anchors = { self = "self", ui = "ui"}

    local u = self.units[unit]
    for e,_ in pairs(u) do
        if value or e ~= element then
            if self:GetElement(e) then
                anchors[e] = e
            end
        end
    end
    for u,_ in pairs(self.units) do
        if u ~= unit then
            anchors[u] = u
            for e,_ in pairs(self.units[u]) do
                if self:GetElement(e) then
                    local anchor = string.format('%s:%s',u,e)
                    anchors[anchor] = anchor
                end
            end
        end
    end

    return anchors
end

function H:GenerateElementOptionTable(unit,element,order,name,hasAnchor,hasSize,hasValue,hasTag,hasSpacing)
    local options = {
		order = order,
		type = 'group',
		name = L[name],
		get = function(info) return E.db.unitframe.hud.units[unit][element][ info[#info] ] end,
		set = function(info,value)  E.db.unitframe.hud.units[unit][element][ info[#info] ] = value; H:UpdateAllFrames() end,
		args = {
			enabled = {
                type = 'toggle',
                order = 1,
                name = L['Enable'],
            },
		}
	}
	if hasAnchor then
		if element ~= 'mushroom' then
			options.args.anchor = {
				order = 2,
	            type = "group",
	            name = L["Anchor"],
	            guiInline = true,
	            get = function(info) return E.db.unitframe.hud.units[unit][element].anchor[ info[#info] ] end,
	            set = function(info,value) E.db.unitframe.hud.units[unit][element].anchor[ info[#info] ] = value; H:UpdateAllFrames() end,
	            args = {
	                attachTo = {
	                    type = 'select',
	                    name = L['Attach To'],
	                    desc = L['What to attach this element to.'],
	                    order = 3,
                        values = self:GenerateValidAnchors(unit,element),
	                },
	                xOffset = {
	                    order = 5,
	                    name = L['X Offset'],
	                    type = 'range',
	                    min = -1000, max = 1000, step = 1,
	                },
	                yOffset = {
	                    order = 6,
	                    name = L['Y Offset'],
	                    type = 'range',
	                    min = -1000, max = 1000, step = 1,
	                },
	            } 
			}
		elseif element == 'mushroom' then
            options.args.anchor = {
                order = 2,
                type = "group",
                name = L["Anchor"],
                guiInline = true,
                get = function(info) return E.db.unitframe.hud.units[unit][element].anchor[ info[#info] ] end,
                set = function(info,value) E.db.unitframe.hud.units[unit][element].anchor[ info[#info] ] = value; H:UpdateAllFrames() end,
                args = {
                    default = {
                        order = 2,
                        type = "group",
                        name = L["Default"],
                        guiInline = true,
                        get = function(info) return E.db.unitframe.hud.units[unit][element].anchor.default[ info[#info] ] end,
                        set = function(info,value) E.db.unitframe.hud.units[unit][element].anchor.default[ info[#info] ] = value; H:UpdateAllFrames() end,
                        args = {
                            attachTo = {
                                type = 'select',
                                name = L['Attach To'],
                                desc = L['What to attach this element to.'],
                                order = 3,
                                values = self:GenerateValidAnchors(unit,element)
                            },
                            xOffset = {
                                order = 5,
                                name = L['X Offset'],
                                type = 'range',
                                min = -1000, max = 1000, step = 1,
                            },
                            yOffset = {
                                order = 6,
                                name = L['Y Offset'],
                                type = 'range',
                                min = -1000, max = 1000, step = 1,
                            },
                        },
                    },
                    eclipse = {
                        order = 2,
                        type = "group",
                        name = L["Eclipse"],
                        guiInline = true,
                        get = function(info) return E.db.unitframe.hud.units[unit][element].anchor.eclipse[ info[#info] ] end,
                        set = function(info,value) E.db.unitframe.hud.units[unit][element].anchor.eclipse[ info[#info] ] = value; H:UpdateAllFrames() end,
                        args = {
                            attachTo = {
                                type = 'select',
                                name = L['Attach To'],
                                desc = L['What to attach this element to.'],
                                order = 3,
                                values = self:GenerateValidAnchors(unit,element)
                            },
                            xOffset = {
                                order = 5,
                                name = L['X Offset'],
                                type = 'range',
                                min = -1000, max = 1000, step = 1,
                            },
                            yOffset = {
                                order = 6,
                                name = L['Y Offset'],
                                type = 'range',
                                min = -1000, max = 1000, step = 1,
                            },
                        }
                    },    
                }    
            }
        end
	end
	if hasSize then
		if not ((unit == 'player' or unit == 'target') and element == 'castbar') then
            if element ~= 'aurabars' then
    			options.args.size = {
    				order = 3,
    	            type = 'group',
    	            name = L['Size'],
    	            guiInline = true,
    	            get = function(info) return E.db.unitframe.hud.units[unit][element].size[ info[#info] ] end,
    	            set = function(info,value) E.db.unitframe.hud.units[unit][element].size[ info[#info] ] = value; H:UpdateAllFrames() end,
    	            args = {
    	                width = {
    	                    order = 4,
    	                    name = L['Width'],
    	                    type = 'range',
    	                    min = 7, max = 50, step = 1,
    	                },
    	                height = {
    	                    order = 4,
    	                    name = L['Height'],
    	                    type = 'range',
    	                    min = 20, max = 600, step = 1,
    	                },
    	            },
    			}
            else
                options.args.size = {
                    order = 3,
                    type = 'group',
                    name = L['Size'],
                    guiInline = true,
                    get = function(info) return E.db.unitframe.hud.units[unit][element].size[ info[#info] ] end,
                    set = function(info,value) E.db.unitframe.hud.units[unit][element].size[ info[#info] ] = value; H:UpdateAllFrames() end,
                    args = {
                        width = {
                            order = 4,
                            name = L['Width'],
                            type = 'range',
                            min = 100, max = 500, step = 1,
                        },
                        height = {
                            order = 4,
                            name = L['Height'],
                            type = 'range',
                            min = 20, max = 80, step = 1,
                        },
                    },
                }
            end
		else
			options.args.size = {
                order = 3,
                type = 'group',
                name = L['Size'],
                guiInline = true,
                get = function(info) return E.db.unitframe.hud.units[unit][element].size[ info[#info] ] end,
                set = function(info,value) E.db.unitframe.hud.units[unit][element].size[ info[#info] ] = value; H:UpdateAllFrames() end,
                args = {
                    horizontal = {
                        order = 3,
                        type = 'group',
                        name = L['Horizontal'],
                        guiInline = true,
                        get = function(info) return E.db.unitframe.hud.units[unit][element].size.horizontal[ info[#info] ] end,
                        set = function(info,value) E.db.unitframe.hud.units[unit][element].size.horizontal[ info[#info] ] = value; H:UpdateAllFrames() end,
                        args = {
                            width = {
                                order = 4,
                                name = L['Width'],
                                type = 'range',
                                min = 7, max = 50, step = 1,
                            },
                            height = {
                                order = 4,
                                name = L['Height'],
                                type = 'range',
                                min = 20, max = 600, step = 1,
                            },
                        },
                    },
                    vertical = {
                        order = 3,
                        type = 'group',
                        name = L['Vertical'],
                        guiInline = true,
                        get = function(info) return E.db.unitframe.hud.units[unit][element].size.vertical[ info[#info] ] end,
                        set = function(info,value) E.db.unitframe.hud.units[unit][element].size.vertical[ info[#info] ] = value; H:UpdateAllFrames() end,
                        args = {
                            width = {
                                order = 4,
                                name = L['Width'],
                                type = 'range',
                                min = 7, max = 50, step = 1,
                            },
                            height = {
                                order = 4,
                                name = L['Height'],
                                type = 'range',
                                min = 20, max = 600, step = 1,
                            },
                        },
                    },
                },
            }
        end
	end
	
	if hasValue then
		options.args.value = {
            order = 10,
            type = "group",
            name = L["Value"],
            guiInline = true,
            get = function(info) return E.db.unitframe.hud.units[unit][element].value[ info[#info] ] end,
            set = function(info,value) E.db.unitframe.hud.units[unit][element].value[ info[#info] ] = value; H:UpdateAllFrames() end,
            args = {
                enabled = {
                    type = 'toggle',
                    order = 1,
                    name = L['Enable'],
                },
                anchor = {
                    order = 2,
                    type = "group",
                    name = L["Anchor"],
                    guiInline = true,
                    get = function(info) return E.db.unitframe.hud.units[unit][element].value.anchor[ info[#info] ] end,
                    set = function(info,value) E.db.unitframe.hud.units[unit][element].value.anchor[ info[#info] ] = value; H:UpdateAllFrames() end,
                    args = {
                        attachTo = {
                            type = 'select',
                            name = L['Attach To'],
                            desc = L['What to attach this element to.'],
                            order = 3,
                            values = self:GenerateValidAnchors(unit,element,true)
                        },
                        xOffset = {
                            order = 5,
                            name = L['X Offset'],
                            type = 'range',
                            min = -1000, max = 1000, step = 1,
                        },
                        yOffset = {
                            order = 6,
                            name = L['Y Offset'],
                            type = 'range',
                            min = -1000, max = 1000, step = 1,
                        },
                    },
                },  
            },
        }
    end

    if hasTag then
    	if hasValue then
	    	options.args.value.args.tag = {
	            type = 'input',
	            width = 'full',
	            name = L['Text Format'],
	            desc = L['TEXT_FORMAT_DESC'],
	            order = 3,
	        }
        else
        	options.args.tag = {
	            type = 'input',
	            width = 'full',
	            name = L['Text Format'],
	            desc = L['TEXT_FORMAT_DESC'],
	            order = 3,
	        }
	    end
	end

    if hasSpacing then
        options.args.spacing = {
            order = 11,
            type = "group",
            name = L["Spacing"],
            guiInline = true,
            args = {
                spaced = {
                    type = 'toggle',
                    order = 1,
                    name = L['Spaced'],
                },
                spacesettings = {
                    order = 2,
                    type = "group",
                    name = L["Anchor"],
                    guiInline = true,
                    get = function(info) return E.db.unitframe.hud.units[unit][element].spacesettings[ info[#info] ] end,
                    set = function(info,value) E.db.unitframe.hud.units[unit][element].spacesettings[ info[#info] ] = value; H:UpdateAllFrames() end,
                    args = {
                        offset = {
                            order = 5,
                            name = L['Offset'],
                            type = 'range',
                            min = -200, max = 200, step = 1,
                        },
                        spacing = {
                            order = 6,
                            name = L['Spacing'],
                            type = 'range',
                            min = 1, max = 100, step = 1,
                        },
                    },
                },  
            },
        }
    end

    if element == 'aurabars' then
        options.args.growthDirection = {
            type = "select",
            order = 2,
            name = L["Growth Direction"],
            values = growthValues
        }
    end

    return options
end
--H:GenerateElementOptionTable(unit,element,order,name,hasAnchor,hasSize,hasValue,hasTag,hasSpacing)
local function healthOptions(unit) return H:GenerateElementOptionTable(unit,'health',100,'Health',false,true,true,true,false) end
local function powerOptions(unit) return H:GenerateElementOptionTable(unit,'power',200,'Power',true,true,true,true,false) end
local function castbarOptions(unit) return H:GenerateElementOptionTable(unit,'castbar',300,'Castbar',true,true,false,false,false) end
local function nameOptions(unit) return H:GenerateElementOptionTable(unit,'name',400,'Name',true,false,false,true,false) end
local function classbarOptions(unit) return H:GenerateElementOptionTable(unit,'classbars',500,'Classbar',true,true,true,true,true) end
local function cpointOptions(unit) return H:GenerateElementOptionTable(unit,'cpoints',600,'Combobar',true,true,false,false,true) end
local function aurabarOptions(unit) return H:GenerateElementOptionTable(unit,'aurabars',700,'Aura Bars',false,true,false,false,false) end
local function raidIconOptions(unit) return H:GenerateElementOptionTable(unit,'raidicon',800,'Raid Icon',true,false,false,false,false) end
local function restingOptions(unit) return H:GenerateElementOptionTable(unit,'resting',900,'Rest Icon',true,false,false,false,false) end
local function combatOptions(unit) return H:GenerateElementOptionTable(unit,'combat',1000,'Combat Indicator',true,false,false,false,false) end
local function pvpOptions(unit) return H:GenerateElementOptionTable(unit,'pvp',1100,'PVP Text',true,false,false,true,false) end
local function healcommOptions(unit) return H:GenerateElementOptionTable(unit,'healcomm',1200,'Heal Prediction',false,false,false,false,false) end
local function mushroomOptions(unit) return H:GenerateElementOptionTable(unit,'mushroom',550,'Wild Mushroom Tracker',true,true,false,false,true) end
local function gcdOptions(unit) return H:GenerateElementOptionTable(unit,'gcd',1300,'GCD Spark',true,true,false,false,false) end
local function buffOptions(unit) return H:GenerateElementOptionTable(unit,'buffs',725,'Buffs',true,true,false,false,false) end
local function debuffOptions(unit) return H:GenerateElementOptionTable(unit,'debuffs',750,'Debuffs',true,true,false,false,false) end

local elementOptions = {
	['health'] = healthOptions,
	['power'] = powerOptions,
	['castbar'] = castbarOptions,
	['name'] = nameOptions,
	['classbars'] = classbarOptions,
	['cpoints'] = cpointOptions,
	['aurabars'] = aurabarOptions,
	['raidicon'] = raidIconOptions,
	['resting'] = restingOptions,
	['combat'] = combatOptions,
	['pvp'] = pvpOptions,
	['healcomm'] = healcommOptions,
    ['mushroom'] = mushroomOptions,
    ['gcd'] = gcdOptions,
    ['buffs'] = buffOptions,
    ['debuffs'] = debuffOptions,
}

local nameMap = {
    ['player'] = {
        ['name'] = 'Player Hud',
        ['mover'] = 'Player Hud Frame'
    },
    ['target'] = {
        ['name'] = 'Target Hud',
        ['mover'] = 'Target Hud Frame'
    },
    ['pet'] = {
        ['name'] = 'Pet Hud',
        ['mover'] = 'Pet Hud Frame'
    },
    ['targettarget'] = {
        ['name'] = 'Target Target Hud',
        ['mover'] = 'Target Target Hud Frame'
    },
    ['pettarget'] = {
        ['name'] = 'Pet Target Hud',
        ['mover'] = 'Pet Target Hud Frame'
    },
    ['focus'] = {
        ['name'] = 'Focus Hud',
        ['mover'] = 'Focus Hud Frame'
    },
    ['focustarget'] = {
        ['name'] = 'Focus Target Hud',
        ['mover'] = 'Focus Target Hud Frame'
    },
    ['playeraurabar'] = {
        ['mover'] = 'Player Hud AuraBar Header'
    },
    ['targetaurabar'] = {
        ['mover']  = 'Target Hud AuraBar Header'
    },
    ['playercastbar'] = {
        ['mover'] = 'Player Hud Castbar'
    },
    ['targetcastbar'] = {
        ['mover']  = 'Target Hud Castbar'
    }
}

function H:GenerateUnitOptionTable(unit,name,order,mover,elements)
	local options = {
        name = L[name],
        type = 'group',
        order = order,
        childGroups = "select",
        get = function(info) return E.db.unitframe.hud.units[unit][ info[#info] ] end,
        set = function(info, value) E.db.unitframe.hud.units[unit][ info[#info] ] = value; H:UpdateAllFrames(); end,
        args = {
            enabled = {
                type = 'toggle',
                order = 1,
                name = L['Enable'],
            },
            resetSettings = {
                type='execute',
                order = 2,
                name = L['Restore Defaults'],
                func = function(info,value) H:ResetUnitSettings(unit); E:ResetMovers(mover); 
                    if unit == "player" or unit == "target" then 
                        local aurabarMover = nameMap[unit..'aurabar'].mover
                        local castbarMover = nameMap[unit..'castbar'].mover
                        E:ResetMovers(aurabarMover)
                        E:ResetMovers(castbarMover)
                    end
                end,
            },
            width = {
                order = 4,
                name = L['Width'],
                type = 'range',
                min = 7, max = 50, step = 1,
                get = function(info) return E.db.unitframe.hud.units[unit][ info[#info] ] end,
                set = function(info,value)
                    E.db.unitframe.hud.units['player'][ info[#info] ] = value;
                    H:UpdateElementSizes('player',true,value)
                    H:UpdateAllFrames() 
                end
            },
            height = {
                order = 5,
                name = L['Height'],
                type = 'range',
                min = 20, max = 600, step = 1,
                get = function(info) return E.db.unitframe.hud.units[unit][ info[#info] ] end,
                set = function(info,value) 
                    E.db.unitframe.hud.units['player'][ info[#info] ] = value; 
                    H:UpdateElementSizes('player',false,value)
                    H:UpdateAllFrames() 
                end
            },
            customText = {
                order = 50,
                name = L['Custom Texts'],
                type = 'input',
                width = 'full',
                desc = L['Create a custom fontstring. Once you enter a name you will be able to select it from the elements dropdown list.'],
                get = function() return '' end,
                set = function(info, textName)
                    for object, _ in pairs(E.db.unitframe.hud.units[unit]) do
                        if object:lower() == textName:lower() then
                            E:Print(L['The name you have selected is already in use by another element.'])
                            return
                        end
                    end

                    H:AddCustomText(unit,textName)
                end,
            },
        }
    }
    if unit == 'player' or unit == 'target' then
        options.args.horizCastbar = {
            type = "toggle",
            order = 20,
            name = L["Horizontal Castbar"],
            desc = L["Use a horizontal castbar"],
            get = function(info) return E.db.unitframe.hud.units[unit][ info[#info] ] end,
            set = function(info,value) E.db.unitframe.hud.units[unit][ info[#info] ] = value; H:UpdateAllFrames() end,
        }
    end
    for element,_ in pairs(elements) do
        if self:GetElement(element) then
            options.args[element] = elementOptions[element](unit)
        end
    end

    return options
end

function H:GenerateOptionTables()
    local order = 200
    local step = 200
    for unit,_ in pairs(self.units) do
        E.Options.args.unitframe.args.hud.args[unit] = self:GenerateUnitOptionTable(unit,nameMap[unit].name,order,nameMap[unit].mover,self.units[unit])
        self:SetUpCustomTexts(self.units[unit])
        order = order + step
    end
end