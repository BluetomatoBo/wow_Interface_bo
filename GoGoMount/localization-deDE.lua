﻿if GetLocale() == "deDE" then
	BINDING_HEADER_GOGOHEADER = "GoGoMount"
	BINDING_NAME_GOGOBINDING = "Aufsitzen/Absitzen"
	BINDING_NAME_GOGOBINDING2 = "Aufsitzen/Absitzen (nicht fliegend)"
	BINDING_NAME_GOGOBINDING3 = "Aufsitzen/Absitzen bei Fahrgast-Mounts"
	GoGo_Variables.Localize = {
	Skill = {
		Engineering = "Ingenieurskunst",
		Riding = "Reiten",
		Tailoring = "Schneiderei",
	},
	String = {
		AutoExcludeFlyingMountsInNoFlyAreas = "Flugreittiere in Zonen, in denen diese nicht erlaubt sind, ausschließen",
		AutoExcludeFlyingMountsInNoFlyAreas_Long = "Ist diese Option aktiviert, wird GoGoMount automatisch alle Flugreittiere aus der Zufallsliste entfernen, wenn angenommen wird, dass du hier nicht fliegen kannst. Dies ist im Grunde das gleiche, wie die Tastenzuweisung #2 von GoGoMount zu verwenden. Dies ist während des Levelns, in Schlachtfeldern usw. sinnvoll. Beachte, wenn deine Liste nur Flugreittiere enthält und du versuchst in einem Schlachtfeld ein Reittier zu benutzen, du gar nicht aufsteigen wirst.", -- Needs review
		AutomaticallyRemoveBuffs = "Zauber, die das Aufsitzen verhindern, automatisch entfernen",
		AutoStartCrusaderAura = "Aura des Kreuzfahrers automatisch verwenden",
		AutoStartCrusaderAura_Long = "Aktiviert automatisch die Aura des Kreuzfahrers, wenn GoGoMount zum Aufsteigen verwendet wird.",
		Clear = "Löschen",
		ClearGlobalFavoriteMounts = "Lösche global favorisierte Mounts",
		CurrentZone = "Aktuelle Zone",
		CurrentZoneDescription = "Reittiere, die hier als Zonenfavoriten markiert sind, sind die einzigen, die von GoGoMount in dieser Zone verwendet werden. Alle anderen Reittiere und Gestaltwandlungen werden ignoriert. Wird diese Liste geleert, kann GoGoMount wieder alle Reittiere verwenden (oder die globalen Favoriten, falls festgelegt).",
		CurrentZoneExclusions = "Aktuelle Zonenausnahmen",
		CurrentZoneFavorites = "Favoriten der aktuellen Zone",
		DisableFlyingFromWater = "Verhindere Fliegen vom Wasser",
		DisableInCombat = "GoGoMount-Buttons während des Kampfes deaktivieren",
		DisableInCombat_Long = "Diese Einstellung deaktiviert die GoGoMount-Buttons während des Kampfes. Nützlich für Druiden, die in Bärform Tanken und versehentlich den GoGoMount-Button klicken. Muss vor dem Kampf aktiviert oder deaktiviert sein.",
		DisableUnknownMountNotices = "Mitteilungen über unbekannte Reittiere ausschalten",
		DisableUpdateNotices = "Aktualisierungsnachrichten ausschalten",
		DruidFlightPreference = "Immer Flugformen verwenden, ausser bei reiner Bewegung",
		DruidOptions = "Druiden-Optionen",
		DruidSingleClick = "Einfacher Klick für den Wechsel in Reisegestalten",
		EnableAutoDismount = "Automatisches Absitzen aktivieren",
		ExtraPassengerMounts = "Passagierreittiere",
		ExtraPassengerMountsDescription = "Diese Liste fügt Passagierreittiere der Zufallsauswahl hinzu, aber nur, wenn der Passagierreittier-Button geklickt wird. So können bei Bedarf Passagierreittiere benutzt werden, auch wenn sie in den Listen der bevorzugten Reittiere ausgeschlossen wurden. Diese Reittiere werden nicht benutzt, wenn sie global oder für die derzeitige Zone ausgeschlossen wurden.",
		Favorites = "Favoriten",
		GlobalExclusions = "Globale Ausnahmen",
		GlobalExclusionsDescription = "Reittiere werden immer ignoriert. Selbst dann, wenn die hier angegebenen Reittiere als Favoriten festgelegt wurden, werden sie nicht verwendet.",
		GlobalFavorites = "Globale Favoriten",
		GlobalPreferences = "Globale Präferenzen",
		GlobalZoneDescription = "Die hier definierten bevorzugten Reittiere werden nur verwendet, wenn keine zonenspezifischen Favoriten für die Zone definiert sind, in der du dich gerade befindest.",
		HunterOptions = "Jäger-Optionen",
		NewVersionFound = "Eine aktualisierte Version von GoGoMount ist verfügbar und wird verwendet von ",
		NoShapeInRandom = "Gestaltwandlung und Reittiere nicht gemeinsam in einer Zufallsliste verwenden.",
		PaladinOptions = "Paladin-Einstellungen",
		RemoveBuffs = "Entferne Buffs, die das Aufsitzen verhindern",
		RemoveBuffs_Long = "GoGoMount wird versuchen, aus Zaubern und Gegenständen resultierende Stärkungszauber und Gestaltwandlungen zu entfernen, die das Aufsteigen verhindern. Dies funktioniert nur für bekannte Stärkungszauber und in einigen Fällen muss der GoGoMount-Button zweimal geklickt werden.",
		ShamanOptions = "Schamanen-Optionen",
		ShamanSingleClick = "Mit einem Klick aus der Geisterwolf-Form aufsitzen anstatt abzusitzen",
		UnknownMountFound = "Ein unbekanntes Reittier wurde in deiner Liste entdeckt. Bitte melde es, damit es in zukünftige Versionen von GoGoMount integriert werden kann.",
		UseAspectOfThePackInstead = "Aspekt des Rudels statt Aspekt des Geparden verwenden",
		UseAspectOfThePackInstead_Long = "Wenn aktiviert, wird GoGoMount den Aspekt des Rudels statt des Aspekt des Geparden verwenden. Lokale Zonen- oder globale Einstellungen überschreiben diese Einstellung. Wenn dies auf Aspekt des Rudels eingestellt ist und du hast Aspekt des Geparden als Zonenfavoriten eingestellt, wird Aspekt des Geparden verwendet.",
		ZoneExclusionsDescription = "Zonenspezifische Ausnahmen funktionieren genauso wie die globalen Ausnahmen, allerdings nur für die angegebene Zone. Alle Reittiere, die unten als Ausnahme für die Zone, in der du gerade bist, markiert sind, werden niemals verwendet.",
	},
	Talent = {
		AncestralSwiftness = "Schnelligkeit der Ahnen",
		FeralSwiftness = "Schnelligkeit der Wildnis",
	},
	Zone = {
		AbyssalDepths = "Abyssische Tiefen",
		AmaniMountains = "Amanipass",
		AQ40 = "Tempel von Ahn'Qiraj",
		AzuremystIsle = "Azurmythosinsel",
		BloodmystIsle = "Blutmythosinsel",
		CrumblingDepths = "Bröselnde Tiefen",
		Dalaran = "Dalaran",
		DarkbreakCove = "Dämmerbucht",
		Deepholm = "Tiefenheim",
		DireMaul = "Düsterbruch",
		EversongWoods = "Immersangwald",
		Ghostlands = "Geisterlande",
		Icecrown = "Eiskrone",
		Ironforge = "Eisenschmiede",
		IsleOfQuelDanas = "Insel von Quel'Danas",
		KrasusLanding = "Krasus' Landeplatz",
		LegionsRest = "Ruhestatt der Legion",
		Lghorek = "L'ghorek",
		Nespirah = "Nespirah",
		ShimmeringExpanse = "Schimmernde Weiten",
		SholazarBasin = "Sholazarbecken",
		SilvermoonCity = "Silbermond",
		SilverTideHollow = "Silberfluthöhle",
		TempleOfBethekk = "Tempel von Bethekk",
		TempleOfEarth = "Tempel der Erde",
		TenebrousCavern = "Schattenhöhle",
		ThalassianPass = "Thalassischer Pass",
		ThalassianRange = "Thalassischer Pass",
		TheCerebrillum = "Cerebrillum ",
		TheExodar = "Die Exodar",
		TheFrozenSea = "Die gefrorene See",
		TheOculus = "Das Oculus",
		TheStormPeaks = "Die Sturmgipfel",
		TheTempleOfAtalHakkar = "Der Tempel von Atal'Hakkar",
		TheUnderbelly = "Die Schattenseite",
		TheVioletCitadel = "Die Violette Zitadelle",
		TheVortexPinnacle = "Der Vortexgipfel",
		TolBarad = "Tol Barad",
		TolBaradPeninsula = "Halbinsel von Tol Barad",
		TwistingNether = "Wirbelnder Nether",
		Vashjir = "Vashj'ir",
		Wintergrasp = "Tausendwintersee",
	},
}

end --if