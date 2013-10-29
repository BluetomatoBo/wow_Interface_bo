local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore

--Locked Settings, These settings are stored for your character only regardless of profile options.

V.general.pvpautorelease = true
V.general.autorepchange = true
V.general.selectquestreward = true

V.general.minimap.hideincombat = false
V.general.minimap.fadeindelay = 5
V.general.minimap.locationdigits = 1

V.general.minimapbar = {
	['skinButtons'] = true,
	['skinStyle'] = 'HORIZONTAL',
	['backdrop'] = false,
	['layoutDirection'] = 'NORMAL',
	['buttonSize'] = 28,
	['mouseover'] = false,
}

V.general.raidmarkerbar = {
	['enable'] = true,
	['visibility'] = 'DEFAULT',
	['backdrop'] = false,
	['buttonSize'] = 22,
	['spacing'] = 2,
	['orientation'] = 'HORIZONTAL',
	['modifier'] = 'shift-',
}

V.equipment = {
	['specialization'] = {
		['enable'] = false,
	},
	['battleground'] = {
		['enable'] = false,
	},
	['primary'] = 'none',
	['secondary'] = 'none',
	['equipmentset'] = 'none',
	['durability'] = {
		enable = true,
		onlydamaged = false,
	},
	['itemlevel'] = {
		enable = true,
	},
	['misc'] = {
		setoverlay = true,
	}
}

V.farmer = {
	['enabled'] = true,
	['farmbars'] = {
		['enable'] = true,
		['onlyactive'] = true,
		['droptools'] = true,
		['seedbardirection'] = 'VERTICAL',
	}
}

V['watchframe'] = {
	['enable'] = true,
}
