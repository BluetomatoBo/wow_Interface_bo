﻿local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

--Global Settings
G['general'] = {
	["autoScale"] = true,
}

G['classtimer'] = {}

G["nameplate"] = {}

G['unitframe'] = {
	['aurafilters'] = {},
	['buffwatch'] = {},
}
