local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

P['unitframe']['vertstatusbar'] = "Minimalist"

P['unitframe']['vuf'] = {
    ['enabled'] = true,
    ['install_complete'] = 0,
    ['hideElv'] = true,
    ['unicolor'] = true,
    ['flash'] = true,
    ['screenflash'] = true,
    ['enableMouse'] = false, -- Turn off the mouse for click through
    ['warningText'] = true,
    ['lowThreshold'] = 20, -- flash health and mana bars below this %
    ['colorHealthByValue'] = true,
    ['hideOOC'] = false,
    ['font'] = "ElvUI Font",
    ['statusbar'] = "Minimalist",
    ['fontSize'] = 12,
    ['alpha'] = 1,
    ['alphaOOC'] = 0,
    ['customtext'] = {
        ['enabled'] = true,
        ['anchor'] = {
            ['pointFrom'] = 'TOPRIGHT',
            ['attachTo'] = 'health',
            ['pointTo'] = 'TOPLEFT',
            ['xOffset'] = -20,
            ['yOffset'] = 20,
        },
        ['tag'] = ''
    }
}

P['unitframe']['vuf']['units'] = {
    ['player'] = {
        ['enabled'] = true,
        ['height'] = 150,
        ['width'] = 75,
        ['horizCastbar'] = true,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 150,
                ['width'] = 50,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'TOPRIGHT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'TOPLEFT',
                    ['xOffset'] = -20,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'LEFT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'RIGHT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 150,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'TOPLEFT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'TOPRIGHT',
                    ['xOffset'] = 10,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
        },
        ['castbar'] = {
            ['enabled'] = true,
            ['ticks'] = true,
            ['tickcolor'] = { r = 0.4, g = 0.4, b = 0.4 },
            ['format'] = 'REMAINING',
            ['displayTarget'] = false,
            ['size'] = {
                ['horizontal'] = {
                    ['height'] = 26,
                    ['width'] = 300,
                },
                ['vertical'] = {
                    ['height'] = 150,
                    ['width'] = 10,
                },
            },
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'power',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[smartlevel] [shortclassification] [namecolor][name:medium]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['classbars'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOMRIGHT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'BOTTOMLEFT',
                ['xOffset'] = 2,
                ['yOffset'] = 0,
            },
            ['spaced'] = true,
            ['spacesettings'] = {
                ['offset'] = 4,
                ['spacing'] = 6,
            },
            ['size'] = {
                ['height'] = 146,
                ['width'] = 7,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'BOTTOMRIGHT',
                    ['attachTo'] = 'classbars',
                    ['pointTo'] = 'BOTTOMLEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 15,
                },
                ['tag'] = '[classpowercolor][classpower:current-max]'
            },
        },
        ['mushroom'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['default'] = {
                    ['pointFrom'] = 'BOTTOMRIGHT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'BOTTOMLEFT',
                    ['xOffset'] = 2,
                    ['yOffset'] = 0,
                },
                ['eclipse'] = {
                    ['pointFrom'] = 'BOTTOMRIGHT',
                    ['attachTo'] = 'classbars',
                    ['pointTo'] = 'BOTTOMLEFT',
                    ['xOffset'] = -2,
                    ['yOffset'] = 0,
                },
            },
            ['spaced'] = true,
            ['spacesettings'] = {
                ['offset'] = 4,
                ['spacing'] = 6,
            },
            ['size'] = {
                ['height'] = 146,
                ['width'] = 7,
            },
        },
        ['cpoints'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOMRIGHT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'BOTTOMLEFT',
                ['xOffset'] = 2,
                ['yOffset'] = 0,
            },
            ['spaced'] = true,
            ['spacesettings'] = {
                ['offset'] = 4,
                ['spacing'] = 6,
            },
            ['size'] = {
                ['height'] = 146,
                ['width'] = 7,
            },
        },
        ['aurabars'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 20,
                ['width'] = 225,
            },
            ['growthDirection'] = 'DOWN',
        },
        ['buffs'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 9,
                ['yOffset'] = 40,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['debuffs'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'TOP',
                ['attachTo'] = 'buffs',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 9,
                ['yOffset'] = 6,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }
        },
        ['resting'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOPLEFT',
                ['xOffset'] = -6,
                ['yOffset'] = 10
            }
        },
        ['combat'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOPRIGHT',
                ['xOffset'] = 6,
                ['yOffset'] = 10
            }
        },
        ['pvp'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'TOP',
                ['attachTo'] = 'health',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 0,
                ['yOffset'] = -6
            },
            ['tag'] = '[pvptimer]'
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
        ['gcd'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'LEFT',
                ['attachTo'] = 'power',
                ['pointTo'] = 'RIGHT',
                ['xOffset'] = 4,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 150,
                ['width'] = 4,
            },
        },
        ['portrait'] = {
            ['enabled'] = true,
            ['rotation'] = 0,
            ['camDistanceScale'] = 1,
        },
        ['resurrecticon'] = {
            ['enabled'] = true,
        },
    },
    ['target'] = {
        ['enabled'] = true,
        ['height'] = 150,
        ['width'] = 75,
        ['horizCastbar'] = true,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 150,
                ['width'] = 50,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'LEFT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'RIGHT',
                    ['xOffset'] = 6 ,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'RIGHT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'LEFT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 150,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'RIGHT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'LEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
        },
        ['castbar'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'power',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ["color"] = { r = 0.1,g = 0.1,b = 0.1 },
            ['interruptcolor'] = { r = 0.78, g = 0.25, b = 0.25 },
            ['size'] = {
                ['horizontal'] = {
                    ['height'] = 26,
                    ['width'] = 300,
                },
                ['vertical'] = {
                    ['height'] = 150,
                    ['width'] = 10,
                },
            },
            ['format'] = 'REMAINING',
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[namecolor][name:medium] [difficultycolor][smartlevel] [shortclassification]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['cpoints'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOMLEFT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'BOTTOMRIGHT',
                ['xOffset'] = -2,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 146,
                ['width'] = 7,
            },
            ['spaced'] = true,
            ['spacesettings'] = {
                ['offset'] = 4,
                ['spacing'] = 6,
            },
        },
        ['aurabars'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 20,
                ['width'] = 225,
            },
            ['growthDirection'] = 'DOWN'
        },
        ['buffs'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 9,
                ['yOffset'] = 40,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['debuffs'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'TOP',
                ['attachTo'] = 'buffs',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 9,
                ['yOffset'] = 6,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }

        },
        ['portrait'] = {
            ['enabled'] = true,
            ['rotation'] = 0,
            ['camDistanceScale'] = 1,
        },
    },
    ['pet'] = {
        ['enabled'] = true,
        ['height'] = 113,
        ['width'] = 27,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 112,
                ['width'] = 15,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'RIGHT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'LEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'LEFT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'RIGHT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'LEFT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'RIGHT',
                    ['xOffset'] = 4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
        },
        ['castbar'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'power',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['format'] = 'REMAINING',
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[namecolor][name:medium]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }
        },
        ['buffs'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 9,
                ['yOffset'] = 40,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['debuffs'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'TOP',
                ['attachTo'] = 'buffs',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 9,
                ['yOffset'] = 6,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
    },
    ['targettarget'] = {
        ['enabled'] = true,
        ['height'] = 113,
        ['width'] = 27,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 112,
                ['width'] = 15,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'LEFT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'RIGHT',
                    ['xOffset'] = 6,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'RIGHT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'LEFT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'RIGHT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'LEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[namecolor][name:medium]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
    },
    ['pettarget'] = {
        ['enabled'] = true,
        ['height'] = 113,
        ['width'] = 27,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 112,
                ['width'] = 15,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'RIGHT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'LEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'LEFT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'RIGHT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'LEFT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'RIGHT',
                    ['xOffset'] = 4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
            ['buffs'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 9,
                ['yOffset'] = 40,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['debuffs'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'TOP',
                ['attachTo'] = 'buffs',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 9,
                ['yOffset'] = 6,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[namecolor][name:medium]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
    },
    ['focus'] = {
        ['enabled'] = true,
        ['height'] = 113,
        ['width'] = 27,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 112,
                ['width'] = 15,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'RIGHT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'LEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'LEFT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'RIGHT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'LEFT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'RIGHT',
                    ['xOffset'] = 4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
        },
        ['castbar'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'power',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['format'] = 'REMAINING',
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[namecolor][name:medium]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }
        },
        ['buffs'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 9,
                ['yOffset'] = 40,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['debuffs'] = {
            ['enabled'] = false,
            ['anchor'] = {
                ['pointFrom'] = 'TOP',
                ['attachTo'] = 'buffs',
                ['pointTo'] = 'BOTTOM',
                ['xOffset'] = 9,
                ['yOffset'] = 6,
            },
            ['size'] = {
                ['height'] = 26,
                ['width'] = 252,
            },
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
    },
    ['focustarget'] = {
        ['enabled'] = false,
        ['height'] = 113,
        ['width'] = 27,
        ['health'] = {
            ['enabled'] = true,
            ['size'] = {
                ['height'] = 112,
                ['width'] = 15,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'LEFT',
                    ['attachTo'] = 'health',
                    ['pointTo'] = 'RIGHT',
                    ['xOffset'] = 6,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[healthcolor][health:current-percent]'
            },
        },
        ['power'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'RIGHT',
                ['attachTo'] = 'health',
                ['pointTo'] = 'LEFT',
                ['xOffset'] = 0,
                ['yOffset'] = 0,
            },
            ['size'] = {
                ['height'] = 112,
                ['width'] = 10,
            },
            ['value'] = {
                ['enabled'] = true,
                ['anchor'] = {
                    ['pointFrom'] = 'RIGHT',
                    ['attachTo'] = 'power',
                    ['pointTo'] = 'LEFT',
                    ['xOffset'] = -4,
                    ['yOffset'] = 0,
                },
                ['tag'] = '[powercolor][power:current-percent]'
            },
        },
        ['name'] = {
            ['enabled'] = true,
            ['tag'] = '[namecolor][name:medium]',
            ['anchor'] = {
                ['pointFrom'] = 'BOTTOM',
                ['attachTo'] = 'health',
                ['pointTo'] = 'TOP',
                ['xOffset'] = 0,
                ['yOffset'] = 15,
            },
        },
        ['raidicon'] = {
            ['enabled'] = true,
            ['anchor'] = {
                ['pointFrom'] = 'CENTER',
                ['attachTo'] = 'health',
                ['pointTo'] = 'CENTER',
                ['xOffset'] = 0,
                ['yOffset'] = 0
            }
        },
        ['healcomm'] = {
            ['enabled'] = true,
        },
    },
}
                    