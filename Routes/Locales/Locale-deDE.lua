﻿-- THIS CONTENTS OF THIS FILE IS AUTO-GENERATED BY THE WOWACE PACKAGER
-- Please use the Localization App on WoWAce to update this
-- at http://www.wowace.com/projects/routes/localization/

--  Translation courtesy of Stan (Arcádia - EU Zirkel des Cenarius)
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("Routes", "deDE")
if not L then return end

L["Add"] = "Hinzufügen"
L["Add node after (green)"] = "Knotenpunkt danach hinzufügen (grün)"
L["Add node before (red)"] = "Knotenpunkt davor hinzufügen (rot)"
L["Always show"] = "Immer anzeigen"
L["An updated copy of TomTom is required for TomTom integration to work"] = "Eine aktuelle Version von TomTom wird vorrausgesetzt damit die Integrierung funktioniert"
L["Archaeology"] = "Archäologie"
L["Are you sure you want to delete this route?"] = "Sind Sie sicher, dass Sie diese Route löschen möchten?"
L["Are you sure you want to delete this taboo? This action will also remove the taboo from all routes that use it."] = "Sind Sie sicher, dass Sie dieses Tabu entfernen möchten? Diese Aktion wird es auch von allen Routen entfernen die sie nutzen."
-- L["Are you sure you want to recreate this route? This will delete all customized settings for this route."] = "Are you sure you want to recreate this route? This will delete all customized settings for this route."
L["A route with that name already exists. Overwrite?"] = "Eine Route mit diesem Name existiert bereits. Überschreiben?"
L["A taboo with that name already exists. Overwrite?"] = "Ein Tabu mit diesem Namen existiert bereits. Überschreiben?"
L["Automatic route updating"] = "Automatisches Updaten von Routen"
L["AUTOMATIC_UPDATE_TEXT"] = [=[Routes wird Ihre Routen automatisch aktualisieren und Knotenpunkte einfügen/entfernen wie es verlangt wird wenn Sie |cffffff78GatherMate|r oder |cffffff78Cartographer_<Profs>|r als Datenquellen nutzen. |cffffff78Gatherer/HandyNotes|r wird nicht unterstützt, da es im moment keine Callbacks liefert.

Wenn Sie in einer dieser Addons einen neuen Knotenpunkt finden, wird Routes die Zonen nach existierenden Routen mit diesem Knotenpunkttyp durchsuchen und ihn in die beste Position in der Route einfügen. Ähnliches passiert, wenn Sie einen Knotenpunkt in diesen Addons entfernen, dann wird Routes den Knotenpunkt auch aus den relevanten Routen entfernen.

Das Verschieben eines Knotenpunkts um ein paar Yards wird mit einer Löschung und Wiedereintragung gehandhabt. Das ist die selbe Methode die auch von GatherMate und Cartographer_<Profs> intern verwendet wird.

Um das automatische Aktualisieren zu deaktivieren folgen Sie folgenden Schritten:

|cffffff781.|r Wechseln Sie in das |cffffff78Routes|r-Hauptverzeichnis auf der linken Seite des Konfigurationsfensters.

|cffffff782.|r Entfernen Sie die Haken der Boxen jeder Datenquelle.
]=] -- Needs review
L["Auto show and hide routes based on your professions"] = "Automatisches Anzeigen und Verstecken in Abhängigkeite ihrer Berufe"
L["Auto show/hide"] = "Auto. Anzeigen/Verstecken"
L["Auto Show/Hide per route type"] = "Auto. Anzeigen/Verstecken nach Routentyp"
L["Auto Show/Hide settings"] = "Einstellungen für Automatisches Anzeigen/Verstecken"
L["Background"] = "Hintergrund"
L["Background Disclaimer"] = "Diese Option wird die TSP Routengenerierung im Hintergrund ausführen ohne ihr Spiel zum hängen zu bringen, ist dafür aber wesentlich langsamer. Bitte seien Sie sich bewusst, dass ihr WoW in dieser Zeit an Geschwindigkeitsverlust leiden wird."
L["Cancel route edit"] = "Routenbearbeitung abbrechen"
L["Cancel taboo edit"] = "Bearbeitung abbrechen"
L["Cartographer_Waypoints module is missing or disabled"] = "Das Cartographer_Waypoints Modul fehlt oder ist deaktiviert"
L["|cffffd200     %d|r node(s) are at |cffffd2000|r yards of a cluster point"] = "|cffffd200     %d|r Knotenpunkt(e) sind bei |cffffd2000|r Yards des Anhäufungspunkts"
L["|cffffd200     %d|r node(s) are between |cffffd200%d|r-|cffffd200%d|r yards of a cluster point"] = "|cffffd200     %d|r Knotenpunkt(e) sind zwischen |cffffd200%d|r-|cffffd200%d|r Yards des Anhäufungspunkts"
L["Change default hidden route color"] = "Ändere die Standardfarbe einer versteckten Route"
L["Change default route color"] = "Ändere die Standardfarbe einer Route"
L["Change direction (TomTom)"] = "Richtung ändern (TomTom)"
L["Change the line color"] = "Linienfarbe ändern"
L["Cluster"] = "Anhäufung"
L["CLUSTER_DESC"] = "Bei der Routenkomprimierung nimmt Routes alle Knotenpunkte die nahe beieinander sind und kombiniert sie zu einem einzigen Knotenpunkt als Reiseziel. Dieser Prozess dauert eine Weile aber ists halbwegs schnell."
L["Cluster Radius"] = "Anhäufungs Radius"
L["CLUSTER_RADIUS_DESC"] = "Die maximale Entfernung eines Knotenpunktes die er von einem Anhäufungspunkt haben kann. Die Standardeinstellung ist 60 Yards weil der Erkennungsradius der Berufe 80 Yards ist."
L["Cluster this route"] = "Diese Route komprimieren"
L["Color of lines"] = "Farbe der Linien"
-- L["Create Bare Route"] = "Create Bare Route"
L["CREATE_BARE_ROUTE_DESC"] = "This will create a route with just 3 initial points in it, and does not use any data from any source. You may then manually edit this route to insert and move nodes."
L["Create Route"] = "Route erstellen"
-- L["Create Route from Data Sources"] = "Create Route from Data Sources"
L["CREATE_ROUTE_TEXT"] = [=[
Eine Route zu erstellen besteht aus 4 einfachen Punkten. Als ersters öffnen Sie die |cffffff78Hinzufügen|r Sektion auf der linken Seite.

|cffffff781.|r Geben Sie den Namen der Route ein und und drücken Sie |cffffff78ENTER|r oder klicken den |cffffff78OK|r-Knopf.

|cffffff782.|r Wählen Sie die Zone in der Sie die Route erstellen wollen.

|cffffff783.|r Wählen Sie die Quelle für ihre Daten.

|cffffff784.|r Wählen Sie die Datentypen die Sie in Ihrer Route benutzen möchten.


|cffffd200Anmerkungen:|r

* Es ist wichtig, dass Sie den |cffffff78ENTER|r-Knopf drücken oder auf |cffffff78OK|r klicken, wenn Sie einen Routennamen eingeben, sonst wird der Name nicht gespeichert.

* Wenn die Route erfolgreich erstellt wurde, werden Sie pinke Linien sehen, die im gewählten Gebiet über Ihre ganze Karte verlaufen. Es wird ein Eintrag auf der rechten Seite unter Routen für jede Route angelegt. Diese anfängliche Route ist nicht optimiert und muss deswegen verbessert werden.
]=]
L["Create Taboo"] = "Tabu erstellen"
L["CREATE_TABOOS_TEXT"] = [=[
|cffffff78Taburegionen|r sind Bereiche (2D Polygone) auf der Weltkarte die Sie festlegen um Routes zu sagen, dass sie ignoriert werden sollen. Wenn solche Bereiche angelegt werden, wird Routes jegliche Knotenpunkte die in diesen Gebieten liegen ignorieren und versuchen, dass die generierte Route diese Bereiche nicht durchquert. Das ist sehr hilftreich um Gegenden zu markieren, die nur im Weg umgehen, wie zB fliegende Inseln, Höhlen, hohe Berge, feindliche Städte und so weiter.

Taburegionen werden durch folgende Schritte erstellt:

|cffffff781.|r Wählen Sie |cffffff78Tabus|r aus dem Hauptverzeichnis auf der linken Seite des Einstellungsfenster aus.

|cffffff782.|r Geben Sie der Taburegionen einen Namen und drücken Sie |cffffff78ENTER|r oder klicken Sie auf den|cffffff78OK|r-Knopf.

|cffffff783.|r Wählen Sie eine Zone aus dem Auswahlmenü in der Sie die Taburegion erstellen möchten.

|cffffff784.|r Klicken Sie auf |cffffff78Tabu erstellen|r.

|cffffff785.|r Wählen Sie die neu erstelle Taburegion auf der linken Seite des Einstellungsfenster im |cffffff78Tabus|r Bereich aus.

|cffffff786.|r Klicken Sie auf den |cffffff78Taburegion bearbeiten|r-Knopf.

|cffffff787.|r Öffnen Sie die Weltkarte und wählen Sie die falls nötig die korrekte Karte auf der sich die Taburegion befindet, aus.

|cffffff788.|r Sie sollten jetzt einen gestreiften Bereich auf der Weltkarte sehen. Bearbeiten Sie die Taburegion indem Sie
a) Die Knotenpunkte des Polygons|cffffff78ziehen|r;
b) Einen Knotenpunkt in das Polygon einfügen indem Sie auf einen bereits existierenden Knotenpunkt |cffffff78rechts-klicken|r;
c) Einen Knotenpunkt löschen indem Sie auf einen bereits existierenden Knotenpunkt|cffffff78rechts-klicken|r.

|cffffff789.|r Klicken Sie auf |cffffff78Bearbeitung speichern|r um Ihre Änderungen zu speichern, oder auf |cffffff78Bearbeitung abbrechen|r um die Änderungen zu verwerfen.

Taburegionen können sich überlappen und soviele Knotenpunkte beinhalten wie Sie möchten. Das bedeutet, dass Sie sehr komplizierte und detailierte Taburegionen erstellen können, falls Sie das denn möchten.


|cffffd200Anmerkungen:|r

* Sobalt eine Taburegion erstellt wurde, können Sie die Taburegion an eine bereits existierende Route in den individuellen Einstellungen der Route anfügen. Sie müssen aber die Route neu optimieren, nachdem Sie eine Taburegion angefügt oder entfernt haben.

* Das Bearbeiten einer Taburegion betrifft alle Routen alle Routen die diese benutzen, so wird eine Taburegion auch von allen Routen entfernt auf der sie benutzt wird, wenn Sie sie löschen.
]=]
L["Creating a route"] = "Eine Route erstellen"
L["Creating a taboo region"] = "Eine Taburegion erstellen"
L["Customizing route display"] = "Die Anzeige einer Route anpassen"
L["CUSTOMIZING_ROUTE_TEXT"] = [=[
Sie können die Anzeige Ihrer Routen auf der Karte sehr leicht anpassen. Die Einstellungen sind in zwei Teile gegliedert. Die |cffffff78Einstellungen|r Sektion auf der linken Seite enthält globale Einstellungen die alles betreffen, die |cffffff78Linien Einstellungen|r Optionen jeder individuellen Route wird benutzt um unterschiedliche Einstellungen von den Globalen Einstellungen pro Route zu verwenden.

Was das Zeichnen auf den Karten angeht, so können Sie bestimmen auf welchen Karten Routes Ihre Routen anzeigt und was die Standardfarbe und -breit der Linien ist. Weiterhin können Sie einstellen ob Linien auf der Minikarte kleine Lücken aufweisen sollen, damit sie die gelben Sammelsymbole und die Zeichen die von |cffffff78GatherMate|r/|cffffff78Cartographer|r/|cffffff78Gatherer|r/|cffffff78HandyNotes|r gesetzt wurden nicht überlappen.

Jede Route kann in ihren Optionen dahingehend geändert werden, dass sie eine spezifische Farbe und Linienbreite besitzt, oder sogar ob sie gänzlich versteckt werden soll. Dies ermöglicht Ihnen Routen die Sie nicht länger benutzen aber auch nicht löschen möchten vom auftauchen auf der Karte zu hindern. Die |cffffff78Zeige versteckte Routen|r Option in den allgemeinen Einstellungen kann dazu benutzt werden die individuellen Einstellungen der Routen zu überschreiben.

Sie können allerdings auch die |cffffff78Auto. Anzeigen/Verstecken|r Funktion verwenden, die es Routes ermöglicht Routen basierend auf ihren Knotenpunkttypen wie Erz oder Kräuterkunde anzuzeigen und festlegen ob derartige Routen nur auf den Karten auftauchen sollen wenn Sie über den notwendigen Beruf verfügen oder die entsprechende Suchfähigkeit aktiviert ist, immer oder niemals angezeigt werden sollen. Wenn eine Route mehrer Knotenpunkttypen enthält, wird die Route angezeigt solange mindestens eine Bedingung zutrifft um angezeigt zu werden.
]=]
L[" Data"] = " Daten"
L["Default route"] = "Standardroute"
L["Delete"] = "Löschen"
L["Delete node"] = "Knotenpunkt löschen"
L["Delete Taboo"] = "Tabu löschen"
L["Delete this taboo region permanently. This will also remove it from all routes that use it."] = "Diese Taburegion unwideruflich löschen. Dies wird sie auch von allen Routen entfernen die sie nutzen."
L["Direction changed"] = "Richtung geändert"
L["Do not draw gaps for clustered node points in routes."] = "Keine Lücken für angehäufte Knotenpunkte in den Routen zeichnen"
L["Draw line gaps"] = "Linien Lücken zeichnen"
-- L["Draw on minimap when indoors"] = "Draw on minimap when indoors"
L["Edit route"] = "Route bearbeiten"
L["Edit Route Manually"] = "Route manuell bearbeiten"
L["Edit taboo region"] = "Taburegion bearbeiten"
L["Edit this route on the world map"] = "Bearbeite diese route auf der Weltkarte"
L["Edit this taboo region on the world map"] = "Diese Taburegion auf der Weltkarte bearbeiten"
L["ExtractGas"] = "Gas"
L["ExtraOptDesc"] = "Wenn Sie diese Option aktivieren, dauert das Optimieren der Route ungefähr 40% länger, aber es wird eine -leicht- bessere Route generiert. Empfohlene Einstellung ist AUS."
L["Extra optimization"] = "Extra Optimierung"
L["FAQ"] = "FAQ"
L["FAQ_TEXT"] = [=[
|cffffd200
Wenn ich versuche eine Route zu erstellen bekomme ich die Meldung, dass keine Daten gefunden wurden. Was mache ich falsch?
|r
Es bedeutet genau das: Es wurden keine Daten gefunden, meistens weil das Addon nicht geladen oder im Standby Modus ist. Wenn Sie eines der |cffffff78Cartographer_<Beruf>|r Module benutzen, müssen diese Module geladen und aktiviert sein um Daten verfügbar zu machen.

Bitte beachten Sie, dass alle |cffffff78Cartographer_<Beruf>|r Module nur bei Bedarf geladen werden und |cffffff78Cartographer_Professions|r vorraussetzen um aktiviert zu werden.

|cffffd200
I made a route with Rich Adamantite Ore in it. When I find normal Adamantite Ore in the same place, GatherMate/Cartographer deletes the rich node and replaces it with a normal node. This removes the node from my route since it is contructed out of only rich nodes. What can I do?
|r
1. You can make a route with both rich and normal Adamantite Ore in it.

2. You can tell Routes not to automatically insert/delete nodes. This option is found in the root options of the Routes tree in the config screen.

|cffffd200
Könnt ihr einen Fortschrittsbalken einfügen, der anzeigt wie lange die Hintergrundoptimierung einer Route noch dauert?
|r
Nein, das ist leider nicht möglich, da der Optimierungsprozess ein nicht-linearer Algorithmus ist. Er funktioniert auf einer mehrflutigen Basis dessen Optimierungen immer auf der Vorrangegangenen aufbaut, bis er einen Punkt erreicht hat an dem die Verbesserungen zu gering wären.

Das ist ein bisschen so wie das |cffffff78Windows XP Festplatten Defragmentierungs|r Programm und dessen Fortschrittsbalken, der auch sinnlos ist, da er nur die % jedes Durchgangs anzeigt, aber nicht weiß wieviele Durchgänge es benötigt. Es könnten 3 Durchgänge oder auch 10 sein. Er hört auf wenn er denkt, dass er genug getan hat. Aus diesem Grund gibt es in der |cffffff78Vista|r Version keinen Fortschrittsbalken mehr.

|cffffd200
Wie führt Routes die Routenoptimierung aus?
|r
Routes benutzt einen |cffffff78Ant Colony Optimization|r (ACO) genannten Algorithmus, der eine Methode zur heuristischen/wahrscheinlichkeitstheoretischen Berechnung für optimale Graphen, basierend auf den Beobachtungen des Verhaltens von Ameisen aus dem echten Leben, darstellt.

ACO Algorithmen wurden dazu benutzt um fast optimale Lösungen für das |cffffff78Traveling Salesman Problem|r (TSP) zu finden. Für weitere Informationen, befragen Sie bitte Google oder Wikipedia.

|cffffd200
Was macht die "Extra Optimierung" Option?
|r
Standardmäßig benutzen wir ACO nur mit dem Standard |cffffff782-opt Algorithmus|r um Routen zu optimieren. Wenn Sie "Extra Optimierung" anschalten, wird Routes auch 2.5-opt verwenden, der eine spezielle Untermenge von 3-opt ist. 2-opt ist der Prozess bei dem paarweise angeordnete Ecken ausgetauscht werden (A-B und C-D werden zu A-C und B-D) um kürzere Routen zu produzieren.

|cffffd200
Welchen Algorithmus nutzt die Routenkomprimierung?
|r
Wir nutzen einen Hierarchical Agglomerative Clustering Algorithmus auf eine sehr erfolgshungrige Weise, so dass das Ergebnis plangesteuert ist.

|cffffd200
Ich habe eine Taburegion erstellt, sie an eine Route angehängt und optimiert. Meine Route führt trotzdem noch durch die Taburegion. Warum?
|r
Es ist nicht immer möglich eine Route zu finden die nicht durch eine Taburegion geht oder nicht sehr brauchbar.

Der Benutzer könnte eventuell Taburegionen erstellen die die Karte in unpassierbare Sektionen und Regionen aufteilt, so dass der Algorithmusgorithm einfach zu befangen ist sie zu durchqueren auch wenn es möglich ist.

|cffffd200
Ich habe einen Fehler gefunden! Wo kann ich ihn melden?
|r
Hier können Sie Fehler melden oder Vorschläge abgeben: |cffffff78http://forums.wowace.com/showthread.php?t=10369|r

Alternativ finden Sie uns auch auf |cffffff78irc://irc.freenode.org/wowace|r

Wenn Sie einen Fehler melden, fügen Sie bitte die |cffffff78nötigen Schritte an, die dazu nötig sind den Fehler zu reproduzieren|r. Geben Sie wenn möglich alle|cffffff78Fehlermeldungen|r mit Stapelspeicherverfolgungen, die |cffffff78Revisions Nummer|r von Routes, in der das Problem auftrat, sowie die |cffffff78Sprachversion ihres WoW-Spiels|r an.

|cffffd200
Wer hat dieses coole Addon geschrieben?
|r
|cffffff78Xaros|r von EU Doomhammer Allianz & |cffffff78Xinhuan|r von US Blackrock Allianz waren es.
]=]
L["Fishing"] = "Angeln"
L["Foreground"] = "Vordergrund"
L["Foreground Disclaimer"] = "Generiert fast optimalen Weg für alle Knotenpunkte der Route. Bitte beachten Sie, dass dieser Prozess ihr Spiel für kurze Zeit zum hängen bringt, je nachdem wieviele Knotenpunkte (mehrere sorgen für eine fast exponentiale Erhöhung)und wie schnell ihre CPU ist, könnte es sogar sein, dass ihre Verbindung unterbrochen wird, wenn es zulange dauert."
L["Frequently Asked Questions"] = "Häufig gefragtes"
L[" Gatherer/HandyNotes currently does not support callbacks, so this is impossible for Gatherer/HandyNotes."] = " Gatherer/HandyNotes unterstützt im moment keine Callbacks, also ist dies unmöglich für Gatherer/HandyNotes" -- Needs review
L["GathererHERB"] = "Kräuterkunde"
L["GathererMINE"] = "Bergbau"
L["GathererOPEN"] = "Schätze"
L["GatherMate2Archaeology"] = "Archäologie"
L["GatherMate2Extract Gas"] = "Gas"
L["GatherMate2Fishing"] = "Angeln"
L["GatherMate2Herb Gathering"] = "Kräuterkunde"
-- L["GatherMate2Logging"] = "GatherMate2Logging"
L["GatherMate2Mining"] = "Bergbau"
L["GatherMate2Treasure"] = "Schätze"
L["Help File"] = "Hilfedatei"
L["Herbalism"] = "Kräuterkunde"
L["Hidden route"] = "Versteckte Route"
L["Hide Route"] = "Route verstecken"
L["Hide the route from being shown on the maps"] = "Verstecke die Route auf den Karten"
L["Information"] = "Information"
L["Integrated support options for TomTom"] = "Integrierte Optionen für TomTom"
L["Line Color"] = "Linienfarbe"
L["Line gaps"] = "Linien Lücken"
L["Line Settings"] = "Linieneinstellungen"
L["Map Drawing"] = "Karten Zeichnung"
L["Minimap"] = "Minimap"
L["Minimap drawing"] = "Auf der Minimap zeichnen"
-- L["Minimap when indoors"] = "Minimap when indoors"
L["Mining"] = "Bergbau"
L["Name of Route"] = "Name der Route"
L["Name of Taboo"] = "Name des Tabus"
L["Name of taboo region to add"] = "Name der Taburegion die hinzugefügt werden soll"
L["Name of the route to add"] = "Name der Route die hinzugefügt werden soll"
L["Never show"] = "Niemals anzeigen"
L["No data found"] = "Keine Daten gefunden"
L["No data selected for new route"] = "Keine Daten für neue Route ausgewählt"
L["No name given for new route"] = "Kein Name für neue Route angegeben"
L["No name given for new taboo region"] = "Es wurde kein Name für die neue Taburegion angegeben"
L["Normal lines"] = "Normale Linien"
L["Note"] = "Notiz"
L["Now running TSP in the background..."] = "Führt TSP jetzt im Hintergrund aus..."
L["Only while tracking"] = "Nur wenn man danach sucht"
L["Only with profession"] = "Nur mit Beruf"
L["Optimize Route"] = "Route Optimieren"
L["Optimizing a route"] = "Eine Route optimieren"
L["OPTIMIZING_ROUTE_TEXT"] = [=[
Neue Routen die erstellt werden sind von Anfang an nicht optimiert und sehen aus wie ein planloser Haufen Linien auf der Karte. Um eine Route zu optimieren, klicken Sie auf Ihre Route auf der linken Seite. Auf der rechten Seite sind nun 4 Registerkarten; Klicken Sie auf |cffffff78Route Optimieren|r.

Die Optimierung einer Route besteht aus 2 Teilen. Der erste ist das komprimieren der Route, der zweite die Routenoptimierung.

|cffffff781.|r Klicken Sie auf den |cffffff78Komprimieren|r-Knopf um die Route zu komprimieren.

|cffffff782.|r Klicken Sie auf den |cffffff78Vordergrund|r ODER |cffffff78Hintergrund|r-Knopf und warten Sie.


|cffffd200Anmerkungen:|r

* Das Routenkomprimieren ist optional. Was es genau macht ist, dass es nahe beieinander stehende Knotenpunkte in einer festgelegten Entfernung in einen einzigen Wegpunkt kombiniert. Das komprimieren einer Route ist ein umkehrbarer Prozess, es gehen keine Daten verloren.

* Die Routenoptimierung kann entweder im Vordergrund oder Hintergrund durchgeführt werden. Beide Methoden bewirken das selbe. Bei der Vordergrundmethode wird die komplette, verfügbare CPU Zeit genutzt und bringt WoW kurz zum "hängen" bis der Vorgang abgeschlossen ist, während die Hintergrundoptimierung das Selbe viel langsamer im Hintergrund durchführt ohne WoW einfrieren zu lassen.

* Einfach gesagt, nutzen Sie die Vordergrundoptimierung wenn Ihre Route weniger als 100 Knotenpunkte hat, Hintergrund wenn die Anzahl der Knotenpunkte hoch ist, sonst besteht die Gefahr, dass Ihre Verbindung mit dem WoW-Serven getrennt wird, wenn die Optimierung zu lange dauert.

* Die Routenerstellung nutzt einen Algorithmus der als |cffffff78Ant Colony Optimization|r bekannt ist. Dieser Algorithmus basiert auf Beobachtungen von Ameisen im echten Leben und nutzt tausende, zufallsgenerierte, Zahlen um die Ameisen zu simulieren und die Route zu erstellen.

* Das bedeutet, dass die Routengenerierung zufällig ist und beim Optimieren der selben Anfangsroute jedesmal ein anderes Ergebnis dabei hervorkommt. Sie können eine Route mehrmals optimieren um zu versuchen eine bessere Lösung zu finden, Routes wird immer die kürzeste bekannte Lösung benutzen.

* Der andere Grund warum wir eine zufällige Route generiert haben wollen, ist die Tatsache dass wir nicht wollen, dass tausende andere Leute genau die selbe Route benutzen wie man selbst, oder? Die Standard WowHead Knotenpunktdaten sind sehr einfach zu downloaden für die 3 Datenerfassungsaddons.

* In der momentanen Implementierung wir der ACO Algorithmus in einer sehr beschnittenen Version genutzt um die Rechendauer zu reduzieren. Zu versuchen ein NP-Komplettes Problem in einer WoW Sandbox, die eine Lua Scriptsprache benutzt, zu lösen, ist nicht unbedingt das Beste was man machen kann.

* Wir geben unser Bestes die Route daran zu hindern sich selbst zu überkreuzen, aber manchmal passiert es und der Algorithmus kann es nicht auffangen. Falls dies passieren sollte, optimieren Sie die Route einfach nochmal.
]=]
L["Options"] = "Optionen"
L["Overview"] = "Übersicht"
L["OVERVIEW_TEXT"] = [=[
|cffffff78Routes|r ist ein Addon das dazu konstruiert wurde um das Sammeln von Dingen zu effizienter zu gestalten. Es macht dies indem es effiziente Sammelrouten, basierend auf dem was man Sammeln will, erstellt und dabei existierende Daten aus Ihren |cffffff78GatherMate|r, |cffffff78Cartographer_<Profs>|r oder |cffffff78Gatherer|r Addons nutzt. Diese Routen werden dann auf Ihren Karten gezeichnet und Sie können Ihren einfach und schnell folgen.

Das|cffffff78Travelling Salesman Problem|r (TSP) ist ein traditionelles Problem bei dem N Städte und die Entfernung zwischen irgendeinem Paar von Städten gegeben ist und die kürzeste Reise zwischen diesen Städten, die jede Stadt genau einmal besucht und dann zum Ausgangspunkt zurückkehrt, gefunden werden soll. Das selbe Problem kann auf Sammelpunkte in World of Warcraft angewendet werden um die kürzeste mögliche Route zu finden um jeden bekannten Sammelpunkt in einem Kreis abzulaufen.
]=]
-- L["Pass %d: %d%%"] = "Pass %d: %d%%"
-- L["Pass %d: %d%% - %d yards"] = "Pass %d: %d%% - %d yards"
L["Path with %d nodes found with length %.2f yards after %d iterations in %.2f seconds."] = "Pfad mit %d Knotenpunkten gefunden mit der Länge von %.2f yards nach %d Durchgängen in %.2f Sekunden"
L["Permanently delete a route"] = "Eine Route gänzlich löschen"
-- L["Recreate Route"] = "Recreate Route"
-- L["Recreate this route with the same creation settings. NOTE: This only works for data from GatherMate2 and Gatherer."] = "Recreate this route with the same creation settings. NOTE: This only works for data from GatherMate2 and Gatherer."
L["Reset"] = "Zurücksetzen"
L["Reset the line settings to defaults"] = "Setzt die Linieneinstellungen auf ihre Ursprungswerte zurück"
L["Route Clustering"] = "Routen Komprimierung"
L["ROUTE_EDIT_DESC"] = [=[
To edit a route, click on the |cffffd200Edit|r button. The route will be drawn on the World Map. Drag the nodes to position them, left click on an in-between vertex to add nodes, right click on them to delete. After editing, you may click the |cffffd200Save|r button to save your changes, or the |cffffd200Cancel|r button to discard your changes.

Please note that you cannot edit a route when it is being optimized in the background or if the route is a clustered route.
]=]
L["Route Optimizing"] = "Routen Optimierung"
L["routes"] = "routes"
L["Routes"] = "Routen"
L["Routes in %s"] = "Routen in %s"
L["Routes Node Menu"] = "Routes Knotenpunkte Menü"
L["Routes with Archaeology"] = "Routen mit Archäologie"
L["Routes with Fish"] = "Routen mit Fischen"
L["Routes with Gas"] = "Routen mit Gasen"
L["Routes with Herbs"] = "Routen mit Kräutern"
L["Routes with Notes"] = "Routen mit Notizen"
L["Routes with Ore"] = "Routen mit Erzen"
L["Routes with Treasure"] = "Routen mit Schätzen"
-- L["Save route edit"] = "Save route edit"
L["Save taboo edit"] = "Bearbeitung speichern"
L["Select data to use"] = "Wähle welche Daten genutzt werden sollen"
L["Select data to use in the route creation"] = "Wähle die Daten die bei der Routenerstellung benutzt werden sollen"
L["Select sources of data"] = "Quelle der Daten auswählen"
L["Select taboo regions to apply:"] = "Wählen Sie die Taburegion zum Übernehmen"
L["Select Zone"] = "Zone auswählen"
L["Set the width of lines on each of the maps."] = "Setze die Breite der Linien auf jeder der Karten"
L["Shorten the lines drawn on the minimap slightly so that they do not overlap the icons and minimap tracking blips."] = "Verkürze die Linien auf der Minimap so, dass sie keine Symbole überdecken."
L["Show hidden routes"] = "Zeige versteckte Routen"
L["Show hidden routes?"] = "Versteckte Routen anzeigen?"
L["Skill-Engineering"] = "Ingenieurskunst"
L["Skill-Fishing"] = "Angeln"
L["Skill-Herbalism"] = "Kräuterkunde"
L["Skill-Mining"] = "Bergbau"
L["Skip clustered node points"] = "Angehäufte Knotenpunkte überspringen"
L["%s - Node %d"] = "%s - Knotenpunkt %d"
L["Start using TomTom"] = "TomTom benutzen"
L["Start using TomTom by finding the closest visible route/node in the current zone and using that as the waypoint"] = "Beginne TomTom zu nutzen um den/die nächsten sichtbaren Knotenpunkt/Route in der aktuellen Zone als Wegpunkt zu benutzen"
L["Start using Waypoints (TomTom)"] = "Wegpunkte (TomTom) benutzen"
-- L["Stop editing this route on the world map and abandon changes made"] = "Stop editing this route on the world map and abandon changes made"
-- L["Stop editing this route on the world map and save the edits"] = "Stop editing this route on the world map and save the edits"
L["Stop editing this taboo region on the world map and abandon changes made"] = "Bearbeitung dieser Taburegion auf der Weltkarte abbrechen und Änderungen nicht speichern"
L["Stop editing this taboo region on the world map and save the edits"] = "Bearbeitung dieser Taburegion auf der Weltkarte abbrechen und Änderungen speichern"
L["Stop using TomTom"] = "TomTom nicht mehr benutzen"
L["Stop using TomTom by clearing the last queued node"] = "Beende die Nutzung von TomTom indem der letzte Knotenpunkt in der Reihe gelöscht wird"
L["Stop using Waypoints (TomTom)"] = "Wegpunkte (TomTom) nicht mehr benutzen"
L["TABOO_DESC"] = "Taburegionen sind Bereiche die Sie festlegen um Knotenpunkte auszuschliessen. Sobald Sie eine Taburegion erstellt haben, können Sie diese Taburegion zu einer bereits existierenden Route hinzufügen, alle Knotenpunkte dieser Region werden entfernt und keine neuen mehr hinzugefügt."
L["TABOO_DESC2"] = "Taburegionen sind Bereiche die Sie festlegen damit sie von Routen ignoriert werden. Knotenpunkte in diesen Taburegionen werden ignoriert und nicht in die Route eingeschlossen. Desweiteren wird bei der Routenoptiomierung versucht diese Gebiete nicht zu durchqueren, soweit dies möglich ist."
L["TABOO_EDIT_DESC"] = "Um eine Taburegion zu bearbeiten, klicken Sie auf den |cffffd200Bearbeiten|r-Knopf. Die Taburegion wird auf der Weltkarte gezeichnet. Ziehen Sie an den Ecken um sie zu positionieren. Klicken Sie mit der rechten Maustauste auf die Ecken um weitere Ecken hinzuzufügen oder zu entfernen. Nachdem Bearbeiten können Sie den |cffffd200Speichern|r-Knopf um ihre Änderungen zu Speichern, oder den |cffffd200Abbrechen|r-Knopf um sie zu verwerfen."
L["Taboos"] = "Tabus"
L["Taboos in %s"] = "Tabus in %s"
L["The cluster radius of this route is |cffffd200%d|r yards."] = "Der Anhäufungsradius dieser Route ist |cffffd200%d|r Yards."
L["The following error occured in the background path generation coroutine, please report to Grum or Xinhuan:"] = "Der folgende Fehler trat bei der Berechnung des Pfades auf, bitte melden Sie ihn bei Grum oder Xinhuan:"
L["There is already a TSP running in background. Wait for it to complete first."] = "Es läuft schon eine TSP im Hintergrund. Bitte warten Sie, bis die erste abgeschlossen ist."
L["These settings control the visibility and look of the drawn route."] = "Diese Einstellungen kontrollieren die Sichtbarkeit und das Aussehen der gezeichneten Route"
L["This route contains |cffffd200%d|r nodes that have been tabooed."] = "Diese Route enthält |cffffd200%d|r Knotenpunkte die ausgeschlossen wurden."
L["This route contains the following nodes:"] = "Diese Route enthält folgende Knotenpunkte:"
L["This route has |cffffd200%d|r nodes and is |cffffd200%d|r yards long."] = "Diese Route hat |cffffd200%d|r Knotenpunkte und ist |cffffd200%d|r yards lang."
L["This route has nodes that belong to the following categories:"] = "Diese Route enthält Knotenpunkte folgender Kategorien:"
L["This route has no taboo regions."] = "Diese Route hat keine Taburegionen."
L["This route has the following taboo regions:"] = "Diese Route hate die folgenden Taburegionen:"
L["This route is a clustered route, down from the original |cffffd200%d|r nodes."] = "Diese Route enthält Anhäufungen aus den originalen |cffffd200%d|r Knotenpunkten."
L["This route is not a clustered route."] = "Diese Route enthält keine Anhäufungen"
L[ [=[This section implements TomTom support for Routes. Click Start to find the nearest node in a visible route in the current zone.
]=] ] = [=[Dieser Bereich implementiert TomTom Unterstützung in Routes. Klicken Sie Start um den nächsten Knotenpunkt einer sichtbaren Route in der momentanen Zone zu finden.
]=]
L["Toggle drawing on each of the maps."] = "Zeichnen auf jeder der Karten an- und ausschalten"
L["TomTom is missing or disabled"] = "TomTom fehlt oder ist deaktiviert"
L["TOO_MANY_NODES_ERROR"] = "This route has more than 724 nodes. Please reduce it by removing some nodes or by clustering otherwise memory allocation errors will occur."
L["Treasure"] = "Schätze"
L["Uncluster"] = "Dekomprimieren"
L["Uncluster this route"] = "Diese Route dekomprimieren"
L["Update distance"] = "Update Distanz"
L["Use Auto Show/Hide"] = "Auto. Anzeigen/Verstecken benutzen"
L["Waypoints Integration"] = "Integration von Wegpunkten"
L["WAYPOINTS_INTEGRATION_TEXT"] = [=[
Routes verfügt über direkte Unterstützung für |cffffff78Cartographer_Waypoints|r oder |cffffff78TomTom|r, um das Wegpunkte-System zu benutzen um Ihnen ein schnelles Reisen auf Ihren Routen zu ermöglichen ohne mitten auf dem Weg die Orientierung zu verlieren.

Das Benutzen von Wegpunkten ist einfach. Gehen Sie einfach zu einer Zone mit einer sichtbaren Route und klicken Sie auf den |cffffff78Anfangen Wegpunkte zu Benutzen|r-Knopf. Das führt dazu, dass sich Routes den am nahesten gelegenen Knotenpunkt in der am nahe liegensten, sichtbaren, Route sucht und diesen dann in die Reihe von Wegpunkten in |cffffff78Cartographer_Waypoints|r oder |cffffff78TomTom|r einfügt. Ein grafischer Pfeil wird jetzt in der Mitte Ihres Bildschirms erscheinen der Ihnen die Richtung und Entfernung anzeigt um den Wegpunkt zu erreichen.

Wenn Sie den Knotenpunkt erreichen, wird Routes automatisch den nächsten Punkt anwählen und so weiter. Klicken Sie auf |cffffff78Aufhören Wegpunkte zu benutzen|r um den momentan anvisierten Wegpunkt zu entfernen und |cffffff78Richtung ändern|r um die Richtung zu ändern in der die Knotenpunkte angewählt werden.

Für ein bisschen Hilfe bei der Nutzung von Wegpunkten, können Sie einfach Tastenkombinationen zum Starten/Stoppen und Richtung ändern im Routes Einstellungsmenü oder über ESC -> Tastenbelegungen anlegen ESC -> Key Bindings. Weiterhin bietet auch |cffffff78FuBar_RoutesFu|r einen schnellen Zugriff auf diese Funktionen.


|cffffd200Anmerkungen:|r

* Die integrierten Wegpunktsysteme sind deaktiviert falls kein unterstütztes Addon gefunden werden kann.
]=]
L["Waypoints (TomTom)"] = "Wegpunkte (TomTom)"
L["When the following data sources add or delete node data, update my routes automatically by inserting or removing the same node in the relevant routes."] = "Wenn die folgenden Datenquellen Knotenpunkte hinzufügen oder entfernen, aktualisiere meine Routen indem diese Knotenpunkte in den relevanten Routen hinzugefügt oder entfernt werden"
L["Width (Map)"] = "Breite (Karte)"
L["Width (Minimap)"] = "Breite (Minimap)"
L["Width of the line in the map"] = "Breite der Linie auf der Karte"
L["Width of the line in the Minimap"] = "Breite der Linie auf der Minimap"
L["Width of the line in the Worldmap"] = "Breite der Linien auf der Weltkarte"
L["Width of the line in the Zone Map"] = "Breite der Linie auf der Gebietskarte"
L["Width (Zone Map)"] = "Breite (Gebietskarte"
L["Worldmap"] = "Weltkarte"
L["Worldmap drawing"] = "Auf der Weltkarte zeichnen"
L["Yards to move before triggering a minimap update"] = "Yards die man gehen muss um ein Minimap Update auszulösen"
L["You have |cffffd200%d|r route(s) in |cffffd200%s|r."] = "Sie haben |cffffd200%d|r Route(n) in |cffffd200%s|r."
L["You have |cffffd200%d|r taboo region(s) in |cffffd200%s|r."] = "Sie haben |cffffd200%d|r Taburegion(en) in |cffffd200%s|r."
L["You may not delete a route that is being optimized in the background."] = "Sie können keine Route löschen, die gerade im Hintergrund optimiert wird"
L["You may not delete a taboo that is being edited."] = "Tabus die gerade bearbeitet werden, können nicht gelöscht werden."
L["Zone Map"] = "Zonenkarte"
L["Zone Map drawing"] = "Auf der Zonenkarte zeichnen"
L["Zone to create route in"] = "Zone in der die Route erstellt werden soll"
L["Zone to create taboo in"] = "Zone in der das Tabu erstellt werden soll"

