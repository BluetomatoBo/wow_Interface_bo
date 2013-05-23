-- French localization file for frFR.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("ElvUI", "frFR");
if not L then return; end

--TEMP
L["A taint has occured that is preventing you from using the queue system. Please reload your user interface and try again."] = "Une alteration s'est produite et vous empêche d'utiliser la file d'attente. Veuillez recharger votre interface utilisateur et essayer à nouveau."

--*_ADDON locales
L["INCOMPATIBLE_ADDON"] = "L'addon %s n'est pas compatible avec le module %s d'ElvUI. S'il vous plait, selectionnez soit l'addon ou le module d'ElvUI pour le désactiver."

--*_MSG locales
L['LOGIN_MSG'] = "Bienvenue sur %sElvUI|r version %s%s|r, tapez /ec afin d'accéder au menu de configuration en jeu. Si vous avez besoin d'un support technique, vous pouvez nous rejoindre sur http://www.tukui.org"

--ActionBars
L["Binding"] = "Raccourcis"
L["Key"] = "Touche"
L['KEY_ALT'] = "A"
L['KEY_CTRL'] = "C"
L['KEY_DELETE'] = "Suppr"
L['KEY_HOME'] = "Hm"
L['KEY_INSERT'] = "Ins"
L['KEY_MOUSEBUTTON'] = "M"
L['KEY_MOUSEWHEELDOWN'] = "MwD"
L['KEY_MOUSEWHEELUP'] = "MwU"
L['KEY_NUMPAD'] = "N"
L['KEY_PAGEDOWN'] = "PD"
L['KEY_PAGEUP'] = "PU"
L['KEY_SHIFT'] = "S"
L['KEY_SPACE'] = "SpB"
L["No bindings set."] = "Aucune assignation"
L['Remove Bar %d Action Page'] = "Retirer la pagination de la barre d'action"
L['Trigger'] = "Déclencheur"

--Bags
L['Delete Grays'] = "Détruire les objets gris."
L['Hold Control + Right Click:'] = "Contrôle enfoncée + Clic droit"
L['Hold Shift + Drag:'] = "Majscule enfoncée + Déplacer"
L['Hold Shift:'] = "Maintenir MAJ:"
L['Purchase'] = "Acheter"
L['Reset Position'] = "Réinitialiser la position"
L['Sort Bags'] = "Trier les sacs"
L['Sort Tab'] = true; --Not used, yet?
L['Stack Bags to Bank'] = "Empiler des Sacs vers la Banque"
L['Stack Bank to Bags'] = "Empiler de la Banque vers les Sacs"
L['Stack Items'] = "Empilement des objets"
L['Temporary Move'] = "Bouger temporairement";
L['Toggle Bags'] = "Afficher les sacs"
L['Vendor Grays'] = "Vendre les objets gris"

--Chat
L['AFK'] = "ABS" --Also used in datatexts and tooltip
L['DND'] = "NPD" --Also used in datatexts and tooltip
L['G'] = "G"
L['I'] = "I"
L['IL'] = "IL"
L['Invalid Target'] = "Cible incorrecte"
L['O'] = "O"
L['P'] = "Gr"
L['PL'] = "CdG"
L['R'] = "R"
L['RL'] = "RL"
L['RW'] = "RW"
L['says'] = "dit"
L['whispers'] = "chuchote"
L['yells'] = "crie"

--DataTexts
L['(Hold Shift) Memory Usage'] = "(Maintenir MAJ) Utilisation de la Mémoire."
L['AP'] = "PA"
L['AVD: '] = "AVD: "
L["Avoidance Breakdown"] = "Répartition de l'évitement"
L['Bandwidth'] = "Bande passante"
L['Bases Assaulted'] = "Bases assaillis"
L['Bases Defended'] = "Bases défendues"
L['Carts Controlled'] = "Chariots contrôlés"
L["Character: "] = "Personnage: "
L['Chest'] = "Torse"
L["Combat Time"] = "Durée du Combat"
L["copperabbrev"] = "|cffeda55fc|r" --Also used in Bags
L['Defeated'] = "Defaite"
L["Deficit:"] = "Déficit:"
L['Demolishers Destroyed'] = "Démolisseurs détruits"
L['Download'] = "Téléchargement"
L["DPS"] = "DPS"
L["Earned:"] = "Gagné:"
L['Feet'] = "Pieds"
L['Flags Captured'] = "Drapeaux capturés"
L['Flags Returned'] = "Drapeaux retournés"
L['Friends List'] = "Liste d'amis"
L['Friends'] = "Amis" --Also in Skins
L['Galleon'] = "Galion"
L['Gates Destroyed'] = "Portes détruites"
L["goldabbrev"] = "|cffffd700g|r" --Also used in Bags
L['Graveyards Assaulted'] = "Cimetières assaillis"
L['Graveyards Defended'] = "Cimetières défendus"
L['Hands'] = "Mains"
L['Head'] = "Tête"
L['Hit'] = "Toucher"
L['Home Latency:'] = "Latence du Domicile:"
L['HP'] = "PdS"
L["HPS"] = "HPS"
L['Legs'] = "Jambes"
L['lvl'] = "niveau"
L['Main Hand'] = "Main droite"
L['Mitigation By Level: '] = "Réduction par niveau: "
L['Nalak'] = "Nalak"
L['No Guild'] = "Non Guildé"
L['Offhand'] = "Main gauche"
L['Oondasta'] = "Oondasta"
L['Orb Possessions'] = "Orbes obtenues"
L["Profit:"] = "Profit:"
L["Reset Data: Hold Shift + Right Click"] = "RAZ des données: Shift + Clic droit"
L["Saved Raid(s)"] = "Raid(s) Sauvegardé(s)"
L["Server: "] = "Serveur: "
L['Session:'] = "Session:"
L['Sha of Anger'] = "Sha de la colère"
L['Shoulder'] = "Épaule"
L["silverabbrev"] = "|cffc7c7cfs|r" --Also used in Bags
L['SP'] = "PdS"
L["Spent:"] = "Dépensé: "
L['Stats For:'] = "Stats pour:"
L['Total CPU:'] = "Charge du CPU:"
L['Total Memory:'] = "Mémoire totale:"
L["Total: "] = "Total: "
L['Towers Assaulted'] = "Tours attaquées"
L['Towers Defended'] = "Tours défendues"
L['Undefeated'] = "Invaincu"
L['Unhittable:'] = "Intouchable:"
L['Victory Points'] = "Points de Victoire"
L['Waist'] = "Ceinture"
L["World Boss(s)"] = "Boss Mondiaux"
L['Wrist'] = "Poignets"

--DebugTools
L["%s: %s tried to call the protected function '%s'."] = "%s: %s a essayé d'appeler la fonction protégée '%s'."
L["No locals to dump"] = "Aucunes données à vider"

--Distributor
L['%s is attempting to share his filters with you. Would you like to accept the request?'] = "%s tente de partager ses profils avec vous. Voulez-vous accepter la demande?"
L['%s is attempting to share the profile %s with you. Would you like to accept the request?'] = "%s tente de partager le profil %s avec vous. Voulez-vous accepter la demande?"
L["Data From: %s"] = "Donnée de: %s"
L['Filter download complete from %s, would you like to apply changes now?'] = "Téléchargement du filtre de %s complet, voulez-vous appliquer les changements maintenant ?" --Need review
L["Lord! It's a miracle! The download up and vanished like a fart in the wind! Try Again!"] = "Seigneur ! C'est un miracle ! Le téléchargement monte et a disparu comme une pet dans le vent! Essayez encore !"  --Need review for special english terms: the download up
L['Profile download complete from %s, but the profile %s already exists. Change the name or else it will overwrite the existing profile.'] = "Téléchargement du profil de %s complet, néanmoins le profil de % existe déjà. Changez le nom ou bien il écrasera le profil existant."
L['Profile download complete from %s, would you like to load the profile %s now?'] = "Téléchargement du profil de %s complet, voulez-vous charger le profil %s maintenant?"
L['Profile request sent. Waiting for response from player.'] = "Requête du profil envoyé. En attente de la reponse du joueur."
L['Request was denied by user.'] = "La requête a ete refusée par l'utilisateur."
L['Your profile was successfully recieved by the player.'] = "Votre profil a été reçu avec succès par le joueur."

--Install
L["Auras Set"] = "Configuration des Auras"
L["Auras System"] = "Système d'Auras"
L['Caster DPS'] = "DPS Distance"
L["Chat Set"] = "Chat configuré"
L["Chat"] = "Discussion"
L['Choose a theme layout you wish to use for your initial setup.'] = "Choisissez un modèle de thème que vous souhaitez utiliser pour votre configuration initiale."
L["Classic"] = "Classique"
L["Click the button below to resize your chat frames, unitframes, and reposition your actionbars."] = "Cliquez sur le bouton ci-dessous pour redimensionner vos fenêtres de chat, vos cadres d'unités et repositionner vos barres d'actions."
L['Config Mode:'] = "Mode Configuration:"
L["CVars Set"] = "CVars configurés"
L["CVars"] = "CVars"
L['Dark'] = "Sombre"
L['Disable'] = "Désactiver"
L["ElvUI Installation"] = "Installation d'ElvUI"
L["Finished"] = "Terminé"
L['Grid Size:'] = "Taille de la Grille:"
L['Healer'] = "Soigneur"
L["High Resolution"] = "Haute Résolution"
L["high"] = "Haute"
L['Icons Only'] = "Icônes seulement" --Also used in Bags
L["If you have an icon or aurabar that you don't want to display simply hold down shift and right click the icon for it to disapear."] = "Si vous avez une icône ou une barre d'aura que vous ne souhaitez pas afficher il suffit de maintenir la touche MAJ enfoncée et d'effectuer un clic droit sur l'icône correspondante pour la faire disparaitre."
L["Importance: |cff07D400High|r"] = "Importance: |cff07D400Haute|r"
L["Importance: |cffD3CF00Medium|r"] = "Importance: |cffD3CF00Moyenne|r"
L["Importance: |cffFF0000Low|r"] = "Importance: |cffFF0000Faible|r"
L["Installation Complete"] = "Installation terminée"
L['Integrated'] = "Intégré"
L["Layout Set"] = "Disposition configurée"
L["Layout"] = "Disposition"
L["Lock"] = "Verrouiller"
L['Low Resolution'] = "Basse résolution"
L["low"] = "Faible"
L["Movers unlocked. Move them now and click Lock when you are done."] = "Cadres déverrouillés. Déplacez-les et cliquez sur Verrouiller une fois terminé."
L['Nudge'] = true;
L['Physical DPS'] = "DPS Physique"
L["Pixel Perfect Set"] = "Réglage Pixel Parfait"
L["Pixel Perfect"] = "Pixel Parfait"
L["Please click the button below so you can setup variables and ReloadUI."] = "Pour configurer les variables et recharger l'interface, cliquez sur le bouton ci-dessous."
L["Please click the button below to setup your CVars."] = "Pour configurer les CVars, cliquez sur le bouton ci-dessous."
L["Please press the continue button to go onto the next step."] = "Pour passer à l'étape suivante, cliquez sur le bouton Continuer."
L["Resolution Style Set"] = "Paramètre de résolution configuré"
L["Resolution"] = "Résolution"
L["Select the type of aura system you want to use with ElvUI's unitframes. The integrated system utilizes both aura-bars and aura-icons. The icons only system will display only icons and aurabars won't be used. The classic system will configure your auras to be default."] = "Sélectionnez le type de système aura que vous souhaitez utiliser avec UnitFrames ElvUI. Le système intégré utilise à la fois les barres d'Auras et les icônes d'Auras. Le systeme icône seul va afficher uniquement les icônes et barres d'auras ne sera pas utilisé. Le système classique permet de configurer vos Auras par défaut."
L["Setup Chat"] = "Configurer le Chat."
L["Setup CVars"] = "Configurer les CVars"
L["Skip Process"] = "Passer cette étape"
L["Sticky Frames"] = "Cadres adhésifs"
L['Tank'] = "Tank"
L["The chat windows function the same as Blizzard standard chat windows, you can right click the tabs and drag them around, rename, etc. Please click the button below to setup your chat windows."] = "La fenêtre de chat d'ElvUi utilise les même fonctions que celle Blizzard, vous pouvez faire un clic droit sur un onglet pour le déplacer, le renommer, etc."
L["The in-game configuration menu can be accesses by typing the /ec command or by clicking the 'C' button on the minimap. Press the button below if you wish to skip the installation process."] = "Le menu de configuration est accessible en tapant la commande /ec ou en cliquant sur le bouton 'C' sur la Minicarte. Cliquez sur le bouton ci-dessous si vous voulez passer le processus d'installation."
L['The Pixel Perfect option will change the overall apperance of your UI. Using Pixel Perfect is a slight performance increase over the traditional layout.'] = "Le thème Pixel Parfait change entièrement l'apparence de votre UI. Utiliser le thème Piwel Parfait consomme moins de ressource que le thème traditionnel."
L["Theme Set"] = "Choisir le thème"
L['Theme Setup'] = "Configuration du thème"
L["This install process will help you learn some of the features in ElvUI has to offer and also prepare your user interface for usage."] = "Ce programme d'installation vous aidera à découvrir quelques fonctionnalités qu'ElvUI offre et préparera également votre interface à son utilisation."
L["This is completely optional."] = "Ceci est totalement optionnel."
L["This part of the installation process sets up your chat windows names, positions and colors."] = "Cette partie du processus d'installation configure les noms, positions et couleurs de vos fenêtres de chat."
L["This part of the installation process sets up your World of Warcraft default options it is recommended you should do this step for everything to behave properly."] = "Cette partie du processus d'installation paramètrera vos options par défaut de World of Warcraft. Il est recommandé d'effectuer cette étape afin que tout fonctionne correctement."
L["This resolution doesn't require that you change settings for the UI to fit on your screen."] = "Cette résolution ne nécessite pas que vous modifiez les paramètres de l'interface utilisateur pour s'adapter à votre écran."
L["This resolution requires that you change some settings to get everything to fit on your screen."] = "Cette résolution nécessite que vous modifiez les paramètres de l'interface utilisateur pour s'adapter sur votre écran."
L["This will change the layout of your unitframes, raidframes, and datatexts."] = "Ceci changera la disposition des cadres d'unités, des cadres de Raid et des Textes d'informations."
L['Trade'] = "Métiers"
L['Using this option will cause your borders around frames to be 1 pixel wide instead of 3 pixel. You may have to finish the installation to notice a differance. By default this is enabled.'] = "L'utilisation de cette option modifiera vos bordures d'images à 1 pixel de large au lieu de 3 pixels. Vous devez terminer l'installation pour constater une différence. Par défaut cette option est activée."
L["Welcome to ElvUI version %s!"] = "Bienvenue sur la version %s d'ElvUI!"
L["You are now finished with the installation process. If you are in need of technical support please visit us at http://www.tukui.org."] = "Vous avez maintenant terminé le processus d'installation. Si vous avez besoin d'un support technique, merci de vous rendre sur http://www.tukui.org"
L['You can always change fonts and colors of any element of elvui from the in-game configuration.'] = "Vous pouvez toujours modifier les polices et les couleurs de n'importe quel élément d'Elvui dans la configuration du jeu."
L["You can now choose what layout you wish to use based on your combat role."] = "Vous pouvez maintenant choisir quelle disposition vous souhaitez utiliser en fonction de votre rôle lors d'un combat."
L["You may need to further alter these settings depending how low you resolution is."] = "Vous devrez peut-être encore modifier ces paramètres en fonction d'un changement de résolution."
L["Your current resolution is %s, this is considered a %s resolution."] = "Votre résolution actuelle est %s, elle est donc considérée comme une %s Résolution."

--Misc
L['Bars'] = "Barres" --Also used in UnitFrames
L['Calendar'] = true;
L["Can't Roll"] = "Ne peut pas jeter les dés"
L['Disband Group'] = "Dissoudre le groupe"
L['Empty Slot'] = "Emplacement libre"
L["Enable"] = "Activer" --Doesn't fit a section since it's used a lot of places
L['Experience'] = "Expérience"
L['Fishy Loot'] = "Butin de pêche"
L['Left Click:'] = "Clic Gauche:" --layout\layout.lua
L['Raid Menu'] = "Menu Raid"
L['Remaining:'] = "Restant:"
L['Rested:'] = "Reposé:"
L['Right Click:'] = "Clic Droit:" --layout\layout.lua
L['Show BG Texts'] = "Voir les textes de BG" --layout\layout.lua
L['Toggle Chat Frame'] = "Activer la fenêtre de discussion" --layout\layout.lua
L['Toggle Configuration'] = "Afficher la Configuration" --layout\layout.lua
L['XP:'] = "XP:"
L["You don't have permission to mark targets."] = "Vous n'avez pas la permission de marquer les cibles."
L['ABOVE_THREAT_FORMAT'] = '%s: %.0f%% [%.0f%% above |cff%02x%02x%02x%s|r]'

--Movers
L[' Frames'] = "Fenêtres"
L['Alternative Power'] = "Puissance Alternative"
L['Arena Frames'] = "Cadre d'arène" --Also used in UnitFrames
L["Auras Frame"] = "Fenêtre des Auras"
L['Bags'] = "Sacs" --Also in DataTexts
L['Bar '] = "Barre " --Also in ActionBars
L['BNet Frame'] = "Fenetre BNet"
L['Boss Button'] = "Bouton du Boss"
L['Boss Frames'] = "Cadre du Boss" --Also used in UnitFrames
L["Experience Bar"] = "Barre d'expérience"
L['Focus Castbar'] = "Barre d'incantation du Focus"
L['Focus Frame'] = "Cadre de la Focalisation" --Also used in UnitFrames
L['FocusTarget Frame'] = "Cadre de la cible de votre focalisation" --Also used in UnitFrames
L["GM Ticket Frame"] = "Fenêtre du ticket MJ"
L["Left Chat"] = "Chat de gauche"
L["Loot / Alert Frames"] = "Butin / Fenêtre d'alerte"
L["Loot Frame"] = "Fenêtre du butin"
L['Loss Control Icon'] = "Icône de la perte de contrôle"
L['MA Frames'] = "Fenêtre du second Tank"
L['Micro Bar'] = "Micro Barre" --Also in ActionBars
L['Minimap'] = "Minicarte"
L['MT Frames'] = "Fenêtre du Tank"
L['Party Frames'] = "Cadre de groupe" --Also used in UnitFrames
L['Pet Bar'] = "Barre de familier" --Also in ActionBars
L['Pet Frame'] = "Cadre du familier" --Also used in UnitFrames
L['PetTarget Frame'] = "Cadre de la cible du familier" --Also used in UnitFrames
L['Player Castbar'] = "Barre d'incantation du joueur"
L['Player Frame'] = "Cadre du joueur" --Also used in UnitFrames
L['Raid 1-'] = "Raid 1-"
L["Reputation Bar"] = "Barre de réputation"
L["Right Chat"] = "Chat de droite"
L['Stance Bar'] = "Barre de posture" --Also in ActionBars
L['Target Castbar'] = "Barre d'incantation de la cible"
L['Target Frame'] = "Cadre de la cible" --Also used in UnitFrames
L['TargetTarget Frame'] = "Cadre de la cible de votre cible" --Also used in UnitFrames
L['Tooltip'] = "Info-bulle"
L['Totems'] = "Totems"
L["Vehicle Seat Frame"] = "Fenêtre de l'assise du vehicule"
L['Watch Frame'] = "Fenêtre des quètes"
L['Weapons'] = "Armes"

--NamePlates
L['Discipline'] = "Discipline"
L['Holy'] = "Sacré"
L['Mistweaver'] = "Tisse-Brume"
L['Restoration'] = "Restauration"

--Prints
L[" |cff00ff00bound to |r"] = "|cff00ff00assigné à |r"
L["%s frame(s) has a conflicting anchor point, please change either the buff or debuff anchor point so they are not attached to each other. Forcing the debuffs to be attached to the main unitframe until fixed."] = "% du (des) cadre(s) à un point d'ancrage contradictoire(s), merci de changer le point d'ancrage des améliorations ou des affaiblissements de sorte qu'ils ne soint pas attachés les uns aux autres. Forcer les affaiblissement à être attaché au cadre d'unité principale jusqu'à ce qu'ils soient fixés."
L["All keybindings cleared for |cff00ff00%s|r."] = "Tous les raccourcis ont été effacés pour |cff00ff00%s|r."
L['Already Running.. Bailing Out!'] = "Déjà en cours d'exécution..."
L['Battleground datatexts temporarily hidden, to show type /bgstats or right click the "C" icon near the minimap.'] = "Textes d'informations des champs de bataille temporairement masqués, pour les afficher tapez /bgstats ou clic droit sur le 'C' près de la minicarte."
L['Battleground datatexts will now show again if you are inside a battleground.'] = "Les textes d'informations des champs de bataille seront à nouveau affichés si vous êtes dans un champs de bataille."
L['Binds Discarded'] = "Raccourcis annulés"
L['Binds Saved'] = "Raccourcis sauvegardés"
L['Confused.. Try Again!'] = "Confus...Essayez à nouveau!"
L['Deleted %d gray items. Total Worth: %s'] = "%d Objet(s) gris détruit(s). Valeur totale perdue :%s"
L['No gray items to delete.'] = "Aucun objet gris à détruire."
L['No gray items to sell.'] = "Aucun objet gris à vendre."
L['The spell "%s" has been added to the Blacklist unitframe aura filter.'] = "Le sort '%s' a bien été ajouté à la liste noire des filtres des cadres d'unités."
L['Vendored gray items for:'] = "Objets gris vendus pour:"
L["You don't have enough money to repair."] = "Vous n'avez pas assez d'argent pour réparer votre équipement."
L['You must be at a vendor.'] = "Vous devez être chez un marchand."
L['Your items have been repaired for: '] = "Votre équipement a été réparé pour: "
L['Your items have been repaired using guild bank funds for: '] = "Votre équipement a été réparé avec l'argent de la banque de guilde pour: "
L["Your version of ElvUI is out of date. You can download the latest version from http://www.tukui.org"] = "Votre version d'ElvUI n'est pas à jour. Vous pouvez télécharger la dernière version sur http://www.tukui.org"
L['|cFFE30000Lua error recieved. You can view the error message when you exit combat.'] = "|cFFE30000Erreur Lua reçue. Vous pouvez voir ce message d'erreur quand vous sortez de combat."

--Static Popups
L["A setting you have changed will change an option for this character only. This setting that you have changed will be uneffected by changing user profiles. Changing this setting requires that you reload your User Interface."] = "Un réglage que vous avez modifié ne s'appliquera que pour ce personnage. La modification de ce réglage ne sera pas affecté par un changement de profil. Changer ce réglage requiert de relancer l'interface."
L["Are you sure you want to delete all your gray items?"] = "Êtes-vous sûr de vouloir détruire tous vos Objets Gris ?"
L["Are you sure you want to disband the group?"] = "Êtes-vous sûr de vouloir dissoudre le groupe ? "
L["Are you sure you want to reset every mover back to it's default position?"] = "Êtes-vous sûre de vouloir réinitialiser tous les cadres à leur position par défaut ?"
L["Because of the mass confusion caused by the new aura system I've implemented a new step to the installation process. This is optional. If you like how your auras are setup go to the last step and click finished to not be prompted again. If for some reason you are prompted repeatedly please restart your game."] = "En raison de la confusion générale provoquée par le nouveau système d'aura, j'ai mis en place une nouvelle étape dans le processus d'installation. Cette option est facultative. Si vous aimez la façon dont vos auras sont configurés allez à la dernière étape et cliquez sur Terminé pour ne pas être averti à nouveau.  Si, pour une raison quelconque, vous êtes averti de nouveau, relancez complètement le jeu."
L["Can't buy anymore slots!"] = "Impossible d'acheter plus emplacements !"
L["Disable Warning"] = "Désactiver l'alerte"
L["Discard"] = "Annuler"
L["Do you swear not to post in technical support about something not working without first disabling the addon/module combination first?"] = "Jurez-vous de ne pas avoir posté sur le support technique du forum sur quelquechose qui ne fonctionne pas sans avoir desactivé en premier la combinaison Addon/Module?"
L["Hover your mouse over any actionbutton or spellbook button to bind it. Press the escape key or right click to clear the current actionbutton's keybinding."] = "Passez votre souris sur n'importe quel bouton d'action ou bouton du grimoire pour lui attribuer un raccourcis. Appuyez sur la touche Echap ou le clic droit pour effacer le raccourci en cours."
L["I Swear"] = "Je le jure"
L["Oh lord, you have got ElvUI and Tukui both enabled at the same time. Select an addon to disable."] = "Oh seigneur, vous avez ElvUI et Tukui d'activé en même temps. Selectionnez un add-on à désactiver."
L["One or more of the changes you have made require a ReloadUI."] = "Une ou plusieurs modifications que vous avez effectuées necessitent un rechargement de l'interface."
L["One or more of the changes you have made will effect all characters using this addon. You will have to reload the user interface to see the changes you have made."] = "Un ou plusieurs changement(s) que vous avez effectués a une incidence sur tous les personnages qui utilise cet addon. Vous devriez recharger l'interface utilisateur pour voir le(s) changement(s) apporté(s)."
L["Save"] = "Sauvegarder"
L["Using the healer layout it is highly recommended you download the addon Clique if you wish to have the click-to-heal function."] = true;
L["You have changed the pixel perfect option. You will have to complete the installation process to remove any graphical bugs."] = "Vous avez modifié l'option Pixel Parfait. Vous devrez compléter le processus d'installation pour éliminer les bugs graphiques."
L["You have changed your UIScale, however you still have the AutoScale option enabled in ElvUI. Press accept if you would like to disable the Auto Scale option."] = "Vous venez de changer l'échelle de votre interface, alors que votre option d'échelle automatique est encore activée dans ElvUI. Cliquer sur accepter si vous voulez désactiver l'option d'échelle automatique."
L["You must purchase a bank slot first!"] = "Vous devez d'abord acheter un emplacement de banque !"

--Tooltip
L["Count"] = "Nombre:"
L["Targeted By:"] = "Ciblé par:"

--Tutorials
L["A raid marker feature is available by pressing Escape -> Keybinds scroll to the bottom under ElvUI and setting a keybind for the raid marker."] = "Une fonction marqueur de raid est disponible en appuyant sur Echap -> Raccourcis, défilez en bas d'ElvUI et paramétrez le raccourcis pour le marqueur de raid."
L["ElvUI has a dual spec feature which allows you to load different profiles based on your current spec on the fly. You can enable this from the profiles tab."] = "ElvUI dispose d'une fonction double spécialisation qui vous permet de charger à la volée des profils différents en fonction de votre specialisation actuelle."
L["For technical support visit us at http://www.tukui.org."] = "Pour tout support technique, merci de nous visiter à http://www.tukui.org."
L["If you accidently remove a chat frame you can always go the in-game configuration menu, press install, go to the chat portion and reset them."] = "Si vous supprimez accidentellement un cadre de discussion, vous pouvez toujours aller dans le menu de configuration d'ElvUI. Cliquez ensuite sur Installation puis passez à l'étape concernant les fenêtres de discussion pour remettre à zero les paramètres."
L["If you are experiencing issues with ElvUI try disabling all your addons except ElvUI, remember ElvUI is a full UI replacement addon, you cannot run two addons that do the same thing."] = "Si vous rencontrez des problèmes avec ElvUI, essayez de désactiver tous vos addons sauf ElvUI. Rappelez-vous que'ElvUi est une interface utilisateur complète et que vous ne pouvez pas exécuter deux addons qui font la même chose."
L["The buff panel to the right of minimap is a list of your consolidated buffs. You can disable it in Buffs and Debuffs options of ElvUI."] = "Le panneau d'améliorations à droite de la minicarte est une liste de vos améliorations groupées. Vous pouvez la désactiver dans la section Améliorations et Affaiblissement d'ElvUI."
L["The focus unit can be set by typing /focus when you are targeting the unit you want to focus. It is recommended you make a macro to do this."] = "La cadre de focus peut être défini en tapent /focus quand vous êtes en train de cibler une unité que vous voulez focus. Il est recommandé de faire une macro pour cela."
L["To move abilities on the actionbars by default hold shift + drag. You can change the modifier key from the actionbar options menu."] = "Pour déplacer par défaut les capacités des barres d'actions, maintenant MAJ + déplacer. Vous pouvez modifier la touche de modification dans le menu des barres d'actions."
L["To setup which channels appear in which chat frame, right click the chat tab and go to settings."] = "Pour configurer quels canaux de discussions doivent apparaitre de les fenêtres de Chat, faites un clic droit sur l'onglet de Chat et allez dans les paramètres."
L["Using the /farmmode <size> command will spawn a larger minimap on your screen that can be moved around, very useful when farming."] = "En utilisant la commande /farmmode <taille>, vous pouvez afficher une minicarte plus grande qui peut être déplacée. Très utile pour les métiers de récolte."
L["You can access copy chat and chat menu functions by mouse over the top right corner of chat panel and left/right click on the button that will appear."] = "Vous pouvez accéder à une copie du Chat et des fonctions du Chat en survolant avec votre souris le coin haut droit de la fenêtre de discussion. Cliquez ensuite sur le bouton."
L["You can see someones average item level of their gear by holding shift and mousing over them. It should appear inside the tooltip."] = "Vous pouvez voir le niveau d'objet moyen de n'importe qui en maintenant la touche MAJ enfoncée puis en passant votre souris sur un joueur. Le score apparaitra dans la bulle d'information."
L["You can set your keybinds quickly by typing /kb."] = "Vous pouvez assignez rapidement vos raccourcis en tapant /kb."
L["You can toggle the microbar by using your middle mouse button on the minimap you can also accomplish this by enabling the actual microbar located in the actionbar settings."] = "Vous pouvez afficher la microbar en utilisant le bouton central de votre souris sur la minicarte. Vous pouvez aussi l'afficher via les réglages des Barres d'actions"
L["You can use the /resetui command to reset all of your movers. You can also use the command to reset a specific mover, /resetui <mover name>.\nExample: /resetui Player Frame"] = "Vous pouvez utiliser la commande /resetui pour réinitialiser l'ensemble de vos cadres. Vous pouvez aussi utiliser la commande /resetui <nom du cadre> pour réinitialiser un cadre spécifique.\nExemple: /resetui Player Frame"

--UnitFrames
L['Ghost'] = "Fantôme"
L['Offline'] = "Déconnecté"