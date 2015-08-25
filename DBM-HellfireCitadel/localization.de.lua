﻿if GetLocale() ~= "deDE" then return end
local L

---------------
-- Hellfire Assault --
---------------
L= DBM:GetModLocalization(1426)

L:SetTimerLocalization({
	timerSiegeVehicleCD		= "Nächste Maschine %s"
})

L:SetOptionLocalization({
	timerSiegeVehicleCD =	"Zeige Zeit bis nächste Belagerungsmaschinen erscheinen"
})

L:SetMiscLocalization({
	AddsSpawn1		=	"Comin' in hot!",--translate (trigger) (unused)
	AddsSpawn2		=	"Fire in the hole!",--translate (trigger) (unused)
	BossLeaving		=	"Ich bin gleich wieder da..."
})

---------------------------
-- Iron Reaver --
---------------------------
L= DBM:GetModLocalization(1425)

---------------------------
-- Hellfire High Council --
---------------------------
L= DBM:GetModLocalization(1432)

------------------
-- Kormrok --
------------------
L= DBM:GetModLocalization(1392)

--------------
-- Kilrogg Deadeye --
--------------
L= DBM:GetModLocalization(1396)

L:SetMiscLocalization({
	BloodthirstersSoon		=	"Kommt, Brüder! Eure Bestimmung wartet!"
})

--------------------
--Gorefiend --
--------------------
L= DBM:GetModLocalization(1372)

L:SetTimerLocalization({
	SoDDPS2		= "Nächste Schatten (%s)",
	SoDTank2	= "Nächste Schatten (%s)",
	SoDHealer2	= "Nächste Schatten (%s)"
})

L:SetOptionLocalization({
	SoDDPS2					= "Zeige Zeit bis nächste $spell:179864 die DDs betreffen",
	SoDTank2				= "Zeige Zeit bis nächste $spell:179864 die Tanks betreffen",
	SoDHealer2				= "Zeige Zeit bis nächste $spell:179864 die Heiler betreffen"
})

--------------------------
-- Shadow-Lord Iskar --
--------------------------
L= DBM:GetModLocalization(1433)

L:SetWarningLocalization({
	specWarnThrowAnzu =	"Wirf Auge von Anzu zu %s!"
})

L:SetOptionLocalization({
	specWarnThrowAnzu =	"Spezialwarnung, wenn du das $spell:179202 werfen musst"
})

--------------------------
-- Fel Lord Zakuun --
--------------------------
L= DBM:GetModLocalization(1391)

L:SetWarningLocalization({
	specWarnSeedPosition =	"Saatposition: %s"
})

L:SetOptionLocalization({
	SeedsBehavior		= "Auswahl der Positionierungsschreie für Saat der Zerstörung (nur als Schlachtzugsleiter)",
	Iconed				= "Stern, Kreis, Diamant, Dreieck, Mond (für Strategien mit Weltmarkierungen)",
	Numbered			= "1, 2, 3, 4, 5 (für Strategien mit nummerierten Positionen)",
	DirectionLine		= "Links, Mitte Links, Mitte, Mitte Rechts, Rechts (typisch für geradlinige Formationen)", 
	FreeForAll			= "Nur Standardschrei verwenden (ohne Positionszuweisung)"
})

L:SetMiscLocalization({
	DBMConfigMsg		= "Die Positionierungsschreie für Saat der Zerstörung wurden wie beim Schlachtzugsleiter auf \"%s\" gesetzt.",
	BWConfigMsg			= "Der Schlachtzugsleiter nutzt \"BigWigs\". DBM wird für die Schreie für Saat der Zerstörung automatisch \"nummerierte Positionen\" verwenden."
})

--------------------------
-- Xhul'horac --
--------------------------
L= DBM:GetModLocalization(1447)

L:SetOptionLocalization({
	ChainsBehavior		= "Warnverhalten bei Dämonenketten",
	Cast				= "nur ursprüngliches Ziel bei Zauberbeginn (Timersynchronisierung auf Zauberbeginn)",
	Applied				= "nur betroffene Ziele bei Zauberende (Timersynchronisierung auf Zauberende)",
	Both				= "urspüngliches Ziel bei Zauberbeginn und betroffene Ziele bei Zauberende"
})

--------------------------
-- Socrethar the Eternal --
--------------------------
L= DBM:GetModLocalization(1427)

--------------------------
-- Tyrant Velhari --
--------------------------
L= DBM:GetModLocalization(1394)

--------------------------
-- Mannoroth --
--------------------------
L= DBM:GetModLocalization(1395)

L:SetMiscLocalization({
	felSpire		=	"begins to empower the Fel Spire!"--translate (trigger)
})

--------------------------
-- Archimonde --
--------------------------
L= DBM:GetModLocalization(1438)

L:SetWarningLocalization({
	specWarnBreakShackle	= "Gefesselte Pein: Breche als %s!"
})

L:SetOptionLocalization({
	specWarnBreakShackle	= "Spezialwarnung, wenn du von $spell:184964 betroffen bist (diese Warnung weist zur Minimierung des gleichzeitigen Schadens die Brechungsreihenfolge automatisch zu)",
	FilterOtherPhase		= "Zeige keine Warnungen für Ereignisse, die sich nicht in deiner Phase befinden"
})

L:SetMiscLocalization({
	phase2point5		= "Look upon the endless forces of the Burning Legion and know the folly of your resistance.",--translate (trigger)
	First				= "Erster",
	Second				= "Zweiter",
	Third				= "Dritter",
	Fourth				= "Vierter",
	Fifth				= "Fünfter"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("HellfireCitadelTrash")

L:SetGeneralLocalization({
	name =	"Trash der Höllenfeuerzitadelle"
})
