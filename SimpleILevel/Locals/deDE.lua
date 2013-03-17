local L = LibStub("AceLocale-3.0"):NewLocale("SimpleILevel", "deDE");

if not L then return end

L.core = {
	ageDays = "%s Tage", -- Needs review
	ageHours = "%s Stunden", -- Needs review
	ageMinutes = "%s Minuten", -- Needs review
	ageSeconds = "%s Sekunden", -- Needs review
	desc = "Fügt die durchschnittliche Gegenstandsstufe in den Tooltip des Spielers ein", -- Needs review
	load = "Lade v%s", -- Needs review
	minimapClick = "SimpleiLevel - Klick für Details", -- Needs review
	minimapClickDrag = "Klicken und ziehen um das Icon zu bewegen", -- Needs review
	name = "Simple iLevel", -- Needs review
	purgeNotification = "%s aus dem Speicher gelöscht", -- Needs review
	purgeNotificationFalse = "Du hast das automatische reinigen nicht eingestellt.", -- Needs review
	scoreDesc = "Dieses ist das durchschnittliche iLevel all deiner angezogene Gegenstände", -- Needs review
	scoreYour = "Deine durchschnittliches Gegenstandsstufe ist %s", -- Needs review
	slashClear = "Einstellungen zurücksetzen", -- Needs review
	slashGetScore = "%s hat eine durchschnittliche Gegenstandsstufe von %s und die Imformation ist %s alt", -- Needs review
	slashGetScoreFalse = "Entschuldigung, es ist ein Fehler aufgetreten bei der Wertermittlung für %s", -- Needs review
	slashTargetScore = "%s hat eine durchschnittliche Gegenstandsstufe von %s", -- Needs review
	slashTargetScoreFalse = "Entschuldigung, es ist ein Fehler aufgetreten bei der Wertermittlung deines Zieles", -- Needs review
	ttAdvanced = "%s alt", -- Needs review
	ttLeft = "Durchschnittliche Gegenstandsstufe:", -- Needs review
	options = {
		autoscan = "Automatisches scannen bei veränderungen", -- Needs review
		autoscanDesc = "Die Gruppenmitglieder neu scannen wenn sich deren Ausrüstung ändert", -- Needs review
		clear = "Einstellungen zurücksetzen", -- Needs review
		clearDesc = "Setzt alle Einstellungen und den Speicher zurück", -- Needs review
		color = "Färbe Wert", -- Needs review
		colorDesc = "Färbt den Wert der durchschnittlichen Gegenstandsstufe. Deaktiviere diese Option, wenn nur weiße und graue Werte angezeigt werden sollen.", -- Needs review
		get = "Bekomme Wert", -- Needs review
		getDesc = "Zeigt die durchschnittliche Gegenstandsstufe eines Namens wen er im Speicher ist", -- Needs review
		ldb = "LDB Optionen", -- Needs review
		ldbRefresh = "Aktualisierungsrate", -- Needs review
		ldbRefreshDesc = "Wie oft LDB, in Sekunden, aktualisiert werden soll.", -- Needs review
		ldbSource = "LDB Source Label", -- Needs review
		ldbSourceDesc = "Zeigt eine Beschriftung für den LDB Wert.", -- Needs review
		ldbText = "LDB Text", -- Needs review
		ldbTextDesc = "Schaltet LDB an und aus, dieses sparrt ein wenig Ressourcen.", -- Needs review
		maxAge = "Maximales Cache alter", -- Needs review
		maxAgeDesc = "Legt die Zeitspanne zwischen dem inspizieren in Minuten fest", -- Needs review
		minimap = "Symbol an der Karte anzeigen", -- Needs review
		minimapDesc = "Wechselt die Anzeige des Minimap Button", -- Needs review
		modules = "Lade Module", -- Needs review
		modulesDesc = "Damit diese Änderungen übernommen werden musst du dein UI mit /rl oder /console reloadui neu laden.", -- Needs review
		name = "Allgemeine Optionen", -- Needs review
		open = "SiL Einstellungen öffnen", -- Needs review
		options = "SiL Optionen", -- Needs review
		paperdoll = "Zeigt die Charakterinformationen", -- Needs review
		paperdollDesc = "Zeigt dein durchschnittliches Itemlevel im Charakterfenster an.", -- Needs review
		purge = "Cache reinigen", -- Needs review
		purgeAuto = "Automatische Cache-reinigung", -- Needs review
		purgeAutoDesc = "Automatisches reinigen des Caches wenn sie älter sind als # Tage. 0 für nie.", -- Needs review
		purgeDesc = "Lösche alle gespeicherten Charaktäre die älter sind als %s Tage", -- Needs review
		purgeError = "Bitte geben Sie die Zahl der Tage ein", -- Needs review
		round = "Round iLevel", -- Requires localization
		roundDesc = "Round the iLevel to the nearest whole number", -- Requires localization
		target = "Holt sich die Werte des Zieles", -- Needs review
		targetDesc = "Zeigt die durchschnittliche Gegenstandsstufe deines aktuellen Zieles", -- Needs review
		ttAdvanced = "Erweiterter Tooltip", -- Needs review
		ttAdvancedDesc = "Wechselt zwischen dem normalen und dem erweiterten Tooltip, welches das Alter mit anzeigt", -- Needs review
		ttCombat = "Tooltip im Kampf", -- Needs review
		ttCombatDesc = "Zeigt die SiL Informationen im Tooltip während des Kampfes an", -- Needs review
	},
}
L.group = {
	addonName = "Simple iLevel - Gruppe", -- Needs review
	desc = "Zeige die durchschnittliche Gegenstandsstufe von allen aus deiner Gruppe", -- Needs review
	load = "Gruppen-Modul geladen", -- Needs review
	name = "SiL Gruppe", -- Needs review
	nameShort = "Gruppe", -- Needs review
	outputHeader = "Simple iLevel: Gruppendurchnitt %s", -- Needs review
	outputNoScore = "%s ist nicht verfügbar", -- Needs review
	outputRough = "* bezeichnet einen ungefähren Wert", -- Needs review
	options = {
		group = "Gruppenwert", -- Needs review
		groupDesc = "Gibt den Wert deiner Gruppe in <%s> aus.", -- Needs review
	},
}
L.resil = {
	addonName = "Simple iLevel - Abhärtung", -- Needs review
	desc = "Zeigt die angelegte Menge der PvP Ausrüstung anderer Spieler im Tooltip an", -- Needs review
	load = "Abhärtungs-Modul geladen", -- Needs review
	name = "SiL Abhärtung", -- Needs review
	nameShort = "Abhärtung", -- Needs review
	outputHeader = "Simple iLevel: Durchschnittliche Gruppen PvP Ausrüstung %s", -- Needs review
	outputNoScore = "%s ist nicht verfügbar", -- Needs review
	outputRough = "* Kennzeichnet einen ungefähren Wert", -- Needs review
	ttPaperdoll = "Du hast %s/%s Ausrüstungsteile mit einem Abhärtungswert von %s an.", -- Needs review
	ttPaperdollFalse = "Du hast zur Zeit keine PvP Ausrüstung an.", -- Needs review
	options = {
		cinfo = "Zeige in den Charakterinformationen an", -- Needs review
		cinfoDesc = "Zeigt dein SiL-Abhärtungswert im Charakterfenster an.", -- Needs review
		group = "Gruppen PvP Wert", -- Needs review
		groupDesc = "Gibt den PvP Wert deiner Gruppe in <%s> aus.", -- Needs review
		name = "Sil Abhärtungs Einstellungen", -- Needs review
		pvpDesc = "Zeige die PvP-Ausrüstung von jedem aus deiner Gruppe.", -- Needs review
		ttType = "Tooltip Art", -- Needs review
		ttZero = "Leerer Tooltip", -- Needs review
		ttZeroDesc = "Zeigt Informationen im Tooltip, auch wenn keine PvP-Ausrüstung angelegt ist.", -- Needs review
	},
}
L.social = {
	addonName = "Simple iLevel - Sozial", -- Needs review
	desc = "Fügt die durchschnittliche Gegenstandsstufe im Chatfenster für verschiedene Kanäle hinzu", -- Needs review
	load = "Sozial-Modul geladen", -- Needs review
	name = "SiL Sozial", -- Needs review
	nameShort = "Sozial", -- Needs review
	options = {
		chatEvents = "Zeige den Wert an:", -- Needs review
		color = "Färbe Wert", -- Needs review
		colorDesc = "Färbe den Wert im Chatfenster.", -- Needs review
		enabled = "Aktiviert", -- Needs review
		enabledDesc = "Aktiviere alle Funktionen oder SiL Sozial.", -- Needs review
		name = "SiL Sozial Einstellungen", -- Needs review
	},
}


