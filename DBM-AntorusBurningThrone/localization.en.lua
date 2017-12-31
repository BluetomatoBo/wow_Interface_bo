local L

---------------------------
-- Garothi Worldbreaker --
---------------------------
L= DBM:GetModLocalization(1992)

L:SetTimerLocalization({
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
})

---------------------------
-- Hounds of Sargeras --
---------------------------
L= DBM:GetModLocalization(1987)

L:SetOptionLocalization({
	SequenceTimers =	"Squence the cooldown timers on heroic/mythic difficulty off previous ability casts instead of current ability cast to reduce timer clutter at expense of minor timer accuracy (1-2sec early)"
})

---------------------------
-- War Council --
---------------------------
L= DBM:GetModLocalization(1997)

---------------------------
-- Eonar, the Lifebinder --
---------------------------
L= DBM:GetModLocalization(2025)

L:SetTimerLocalization({
	timerObfuscator		=	"Next Obfuscator (%s)",
	timerDestructor 	=	"Next Destructor (%s)",
	timerPurifier 		=	"Next Purifier (%s)",
	timerBats	 		=	"Next Bats (%s)"
})

L:SetOptionLocalization({
	timerObfuscator		=	DBM_CORE_AUTO_TIMER_OPTIONS["cdcount"]:format("ej16501"),
	timerDestructor 	=	DBM_CORE_AUTO_TIMER_OPTIONS["cdcount"]:format("ej16502"),
	timerPurifier 		=	DBM_CORE_AUTO_TIMER_OPTIONS["cdcount"]:format("ej16500"),
	timerBats	 		=	DBM_CORE_AUTO_TIMER_OPTIONS["cdcount"]:format("ej17039")
})

L:SetMiscLocalization({
	Obfuscators =	"Obfuscator",
	Destructors =	"Destructor",
	Purifiers 	=	"Purifier",
	Bats 		=	"Bats",
	EonarHealth	= 	"Eonar Health",
	EonarPower	= 	"Eonar Power"
})

---------------------------
-- Portal Keeper Hasabel --
---------------------------
L= DBM:GetModLocalization(1985)

L:SetOptionLocalization({
	ShowAllPlatforms =	"Show all announces regardless of player platform location"
})

---------------------------
-- Imonar the Soulhunter --
---------------------------
L= DBM:GetModLocalization(2009)

L:SetMiscLocalization({
	DispelMe =		"Dispel Me!"
})

---------------------------
-- Kin'garoth --
---------------------------
L= DBM:GetModLocalization(2004)

L:SetOptionLocalization({
	InfoFrame =	"Show InfoFrame for fight overview",
	UseAddTime = "Always show timers for what's coming next when boss leaves initialisation phase instead of hiding them. (If disabled, correct timers will resume when boss becomes active again, but may leave little warning if any cooldowns only had 1-2 seconds left)"
})

---------------------------
-- Varimathras --
---------------------------
L= DBM:GetModLocalization(1983)

---------------------------
-- The Coven of Shivarra --
---------------------------
L= DBM:GetModLocalization(1986)

L:SetTimerLocalization({
	timerBossIncoming		= DBM_INCOMING
})

L:SetOptionLocalization({
	timerBossIncoming		= "Show timer for next boss swap"
})

---------------------------
-- Aggramar --
---------------------------
L= DBM:GetModLocalization(1984)

L:SetMiscLocalization({
	Foe			=	"Foe",
	Rend		=	"Rend",
	Tempest 	=	"Tempest"
})

---------------------------
-- Argus the Unmaker --
---------------------------
L= DBM:GetModLocalization(2031)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("AntorusTrash")

L:SetGeneralLocalization({
	name =	"Antorus Trash"
})
