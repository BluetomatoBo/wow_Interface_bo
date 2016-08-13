﻿if GetLocale() ~= "deDE" then return end
local L

---------------
-- Skorpyron --
---------------
L= DBM:GetModLocalization(1706)

L:SetWarningLocalization({
})

L:SetTimerLocalization({
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
	NoDebuff	= "Kein %s"
})

---------------------------
-- Chronomatic Anomaly --
---------------------------
L= DBM:GetModLocalization(1725)

---------------------------
-- Trilliax --
---------------------------
L= DBM:GetModLocalization(1731)

------------------
-- Spellblade Aluriel --
------------------
L= DBM:GetModLocalization(1751)

------------------
-- Tichondrius --
------------------
L= DBM:GetModLocalization(1762)

L:SetMiscLocalization({
	First				= "Erster",
	Second				= "Zweiter",
	Third				= "Dritter"
})

------------------
-- Krosus --
------------------
L= DBM:GetModLocalization(1713)

------------------
-- High Botanist Tel'arn --
------------------
L= DBM:GetModLocalization(1761)

L:SetWarningLocalization({
	warnStarLow				= "Plasmasphäre stirbt bald"
})

L:SetOptionLocalization({
	warnStarLow				= "Spezialwarnung, wenn eine Plasmasphäre bald stirbt (bei ~15%)"
})

L:SetMiscLocalization({
	RadarMessage			= "Use Radar to find a non debuff partner and HUD to avoid other debuffs. I hope to improve this function over time and provide more options than this."--translate later
})

------------------
-- Star Augur Etraeus --
------------------
L= DBM:GetModLocalization(1732)

L:SetOptionLocalization({
	ShowNeutralColor		= "Zeige auf HudMap weiße Kreise um Spieler ohne Sternzeichen, bis alle Zeichen entfernt wurden",
	FilterOtherSigns		= "Filter target announces for Star Signs you are not affected by."--translate (unused)
})

------------------
-- Grand Magistrix Elisande --
------------------
L= DBM:GetModLocalization(1743)

------------------
-- Gul'dan --
------------------
L= DBM:GetModLocalization(1737)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("NightholdTrash")

L:SetGeneralLocalization({
	name =	"Trash der Nachtfestung"
})
