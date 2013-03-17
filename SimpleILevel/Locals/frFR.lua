local L = LibStub("AceLocale-3.0"):NewLocale("SimpleILevel", "frFR");

if not L then return end

L.core = {
	ageDays = "%s jours", -- Needs review
	ageHours = "%s heures", -- Needs review
	ageMinutes = "%s minutes", -- Needs review
	ageSeconds = "%s secondes", -- Needs review
	desc = "Ajoute leur iLevel moyen (AiL) à l'infobulle des autres joueurs", -- Needs review
	load = "Chargement v%s", -- Needs review
	minimapClick = "SimpleiLevel - cliquer pour les détails", -- Needs review
	minimapClickDrag = "Cliquer/déplacer pour déplacer l’icône", -- Needs review
	name = "Simple iLevel", -- Needs review
	purgeNotification = "Efface %s personnages du cache", -- Needs review
	purgeNotificationFalse = "Vous n'avez pas une purge auto configurée", -- Needs review
	scoreDesc = "Ceci est le iLevel moyen de votre équipement actuel", -- Needs review
	scoreYour = "Votre AiL est %s", -- Needs review
	slashClear = "Effacement des paramètres", -- Needs review
	slashGetScore = "%s a un AiL de %s et l'information date de %s", -- Needs review
	slashGetScoreFalse = "Désolé, il y a eu une erreur lors de l'obtention du score de %s", -- Needs review
	slashTargetScore = "%s a un AiL de %s", -- Needs review
	slashTargetScoreFalse = "Désolé, il y a eu une erreur lors de la détermination du score de votre cible", -- Needs review
	ttAdvanced = "vieux de %s", -- Needs review
	ttLeft = "iLevel moyen :", -- Needs review
	options = {
		autoscan = "Scan automatique", -- Needs review
		autoscanDesc = "Scan automatiquement les membres du groupe lorsque leur équipement semble changer", -- Needs review
		clear = "Effacer les paramètres", -- Needs review
		clearDesc = "Effacer tous les paramètres et le cache", -- Needs review
		color = "Colorer le score", -- Needs review
		colorDesc = "Colorer l'AiL quand approprié. Désactivé ceci si vous ne voulez voir que des scores blanc et gris", -- Needs review
		get = "Obtenir le score", -- Needs review
		getDesc = "Obtenir l'AiL à partir d'un nom si présent dans le cache", -- Needs review
		ldb = "Options LDB", -- Needs review
		ldbRefresh = "Taux de rafraîchissement", -- Needs review
		ldbRefreshDesc = "A quelle fréquence LDB doit être mis à jour en secondes", -- Needs review
		ldbSource = "Libellé de la source LDB", -- Needs review
		ldbSourceDesc = "Affiche le libellé de la source de données pour le score LDB", -- Needs review
		ldbText = "Texte LDB", -- Needs review
		ldbTextDesc = "Active/désactive LDB, cela va économiser quelques ressources", -- Needs review
		maxAge = "Intervalle maximum de rafraîchissement (minutes)", -- Needs review
		maxAgeDesc = "Définir le temps de rafraîchissement des inspection en minutes", -- Needs review
		minimap = "Afficher le bouton sur la minimap", -- Needs review
		minimapDesc = "Active/désactive l'affichage du bouton sur la minimap", -- Needs review
		modules = "Charger les modules", -- Needs review
		modulesDesc = "Pour que ces changements prennent effet vous devez recharger votre interface avec /rl ou /console reloadui", -- Needs review
		name = "Options de Simple iLevel", -- Needs review
		open = "Ouvrir l'interface des options", -- Needs review
		options = "Options de SiL", -- Needs review
		paperdoll = "Afficher sur la feuille de personnage", -- Needs review
		paperdollDesc = "Affiche votre AiL sur la feuille de personnage dans le panneau des stats", -- Needs review
		purge = "Effacer le cache", -- Needs review
		purgeAuto = "Purger automatiquement le cache", -- Needs review
		purgeAutoDesc = "Purge automatiquement les informations se trouvant dans le cache datant de plus de # jours. 0 pour jamais", -- Needs review
		purgeDesc = "Effacer du cache tous les personnages vieux de plus de %s jours", -- Needs review
		purgeError = "Veuillez entrer le nombre de jours", -- Needs review
		round = "Arrondir iLevel", -- Needs review
		roundDesc = "Arrondir le iLevel à la plus proche valeur entière", -- Needs review
		target = "Obtenir le score de votre cible", -- Needs review
		targetDesc = "Obtenir l'AiL de votre cible", -- Needs review
		ttAdvanced = "Infobulle avancée", -- Needs review
		ttAdvancedDesc = "Active/désactive les infobulles avancés, dont l'âge du score", -- Needs review
		ttCombat = "Infobulle en combat", -- Needs review
		ttCombatDesc = "Show the SiL information on the tooltip while in combat", -- Requires localization
	},
}
L.group = {
	addonName = "Simple iLevel - Groupe", -- Needs review
	desc = "Voir l'AiL de chacun dans votre groupe", -- Needs review
	load = "Module Groupe chargé", -- Needs review
	name = "SiL Group", -- Needs review
	nameShort = "Groupe", -- Needs review
	outputHeader = "Simple iLevel : iLevel moyen du groupe = %s", -- Needs review
	outputNoScore = "%s n'est pas disponible", -- Needs review
	outputRough = "* indique un score aproximatif", -- Needs review
	options = {
		group = "Score du groupe", -- Needs review
		groupDesc = "Affiche le score de votre groupe dans <%s>", -- Needs review
	},
}
L.resil = {
	addonName = "Simple iLevel - Résilience", -- Needs review
	desc = "Shows the amount of PvP gear other players have equipped in the tooltip", -- Requires localization
	load = "Module Résilience chargé", -- Needs review
	name = "SiL Résilience", -- Needs review
	nameShort = "Résilience", -- Needs review
	outputHeader = "Simple iLevel: Group Average PvP Gear %s", -- Requires localization
	outputNoScore = "%s n'est pas disponible", -- Needs review
	outputRough = "* indique un score approximatif", -- Needs review
	ttPaperdoll = "You have %s/%s items with a %s resilience rating.", -- Requires localization
	ttPaperdollFalse = "Vous n'avez pour l'instant aucun objet JCJ équipé", -- Needs review
	options = {
		cinfo = "Affiche sur les fiche personnage", -- Needs review
		cinfoDesc = "Shows your SimpleiLevel Resilience score on the stats pane.", -- Requires localization
		group = "Group PvP Score", -- Requires localization
		groupDesc = "Prints the PvP Score of your group to <%s>.", -- Requires localization
		name = "SiL Résilience Options", -- Needs review
		pvpDesc = "Afficher l'équipement JCJ de chacun dans votre groupe", -- Needs review
		ttType = "Type d'infobulle", -- Needs review
		ttZero = "Infobulle Zero", -- Needs review
		ttZeroDesc = "Montre l'information dans l'infobulle même s'ils n'ont pas d'équipement JCJ", -- Needs review
	},
}
L.social = {
	addonName = "Simple iLevel - Social", -- Needs review
	desc = "Added the AiL to chat windows for various channels", -- Requires localization
	load = "Module social chargé", -- Needs review
	name = "SiL Sociale", -- Needs review
	nameShort = "Sociale", -- Needs review
	options = {
		chatEvents = "Show Score On:", -- Requires localization
		color = "Colorer le score", -- Needs review
		colorDesc = "Colorer le score dans le fenêtre de discussion", -- Needs review
		enabled = "Activé", -- Needs review
		enabledDesc = "Enable all features or SiL Social.", -- Requires localization
		name = "SiL Sociale Options", -- Needs review
	},
}


