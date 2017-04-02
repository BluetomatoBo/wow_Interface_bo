----------------------------------------------------------------------------------------------------
-- localized Spanish strings
--

--get the addon engine
local AddOnName, Engine = ...;

--spanish or latin america spanish
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esES")
if not L then
	L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esMX");
	if not L then
		return;
	end
end

--set the localized strings
L["LOAD_MESSAGE"] = "%s (versión |cff0070de%s|r) cargado, escribe /%s o /%s para opciones."
L["CONFIG_NAME"] = "Cecile Meter Overlay"
L["GENERAL"] = "General"
L["PROFILES"] = "Perfiles"
L["GENERAL_SETTINGS"] = "Opciones Generales"
L["DEV_SETTINGS"] = "Opciones del desarollador"
L["DEBUGGING"] = "Activar Depuración"
L["DEBUGGING_DESC"] = "Activa la depuración del AddOn y muestra la ventana de depuración."
L["DATATEXT"] = "Texto flotante"
L["ENABLE_DATATEXT"] ="Activar"
L["ENABLE_DATATEXT_DESC"] ="Activa el texto flotante."
L["LOCKDATATEXT"] = "Fijar"
L["LOCKDATATEXT_DESC"] = "Bloquea el texto flotante en su posición actual."
L["OPEN_CONFIG"] = "Abrir Configuración"
L["OPEN_CONFIG_DESC"] = "Abre la ventana de configuración."
L["CONFIG_WINDOW"] = "%s (version |cff0070de%s|r) herramienta de configuración."
L["NO_DATA"] = "Sin Datos"
L["NO_METER"] = "No tiene activado ningún medido de combate, por favor active Details, Recount, Skada, TinyDPS o Numeration."
L["OVERALL_DATA"] = "Datos Totales"
L["CURRENT_DATA"] = "Combate Actual"
L["LAST_DATA"] = "Último Combate"
L["DAMAGE_DONE"] = "Daño Realizado"
L["HEALING_DONE"] = "Sanación Realizada"
L["FORMAT_OWN_DPS"] = "DPS propio"
L["FORMAT_OWN_HPS"] = "HPS propio"
L["FORMAT_OWN_DPS_OWN_HPS"] = "DPS Propio - HPS Propio"
L["FORMAT_RAID_DPS"] = "DPS de la Banda"
L["FORMAT_RAID_HPS"] = "HPS de la Banda"
L["FORMAT_OWN_DPS_RAID_DPS"] = "DPS Propio - DPS de la Banda"
L["FORMAT_OWN_HPS_RAID_HPS"] = "HPS Propio - HPS de la Banda"
L["FORMAT_OWN_HPS_RAID_DPS"] = "HPS Propio - DPS de la Banda"
L["FORMAT_OWN_DPS_RAID_HPS"] = "DPS Propio - HPS de la Banda"
L["FORMAT_RAID_DPS_RAID_HPS"] = "DPS de la Banda - HPS de la Banda"
L["FORMAT_COMBAT_DPS"] = "Posición - Combate - DPS - % Daño"
L["FORMAT_COMBAT_HEAL"] = "Posición - Combate - HPS - % Sanación"
L["FORMAT_OWN_DPS_RAID_DPS_OWN_HPS_RAID_HPS"] = "DPS Propio - DPS de la Banda - HPS Propio - HPS de la Banda"
L["FORMAT_DEFAULT_DPS"] = "Posición Nombre del Jugador : Daño (dps)"
L["FORMAT_DEFAULT_HEALER"] = "Posición Nombre del Jugador : Sanación (hps)"
L["FORMAT_CUSTOM"] = "Personalizado"
L["FORMAT"] = "Formato del texto de datos"
L["FORMAT_DESC"] = "Define el formato del texto de datos"
L["FORMAT_CUSTOM_DESC"] = "Define el formato personalizado"
L["UPDATE_INTERVAL"] = "Frecuencia de actualización"
L["UPDATE_INTERVAL_DESC"] = "Establece la frecuencia de actualización, en segundos"
L["EXAMPLE"] = "Ejemplo"
L["SEGMENT"] = "Segmento de datos"
L["SEGMENT_DESC"] = "Establece el segmento de datos."
L["TAGS"] = "Etiquetas"
L["TAGS_LIST"] = [[
Esta es la lista de etiquetas disponibles.

|cff0070de[dps]|r - Tu |cffff2020DPS|r actual.
|cff0070de[rdps]|r - El |cffff2020DPS|r de tu raid.
|cff0070de[damage]|r - Tu |cffff2020Daño|r actual.
|cff0070de[rdamage]|r - El |cffff2020Daño|r de tu raid.
|cff0070de[pdps]|r - Tu % de |cffff2020Daño|r de la raid. (No incluye el simbolo %)
|cff0070de[ndps]|r - Tu posición en la lista de |cffff2020Dps|r.

|cff0070de[hps]|r - Tu |cff44ff44HPS|r actual.
|cff0070de[rhps]|r - El |cff44ff44HPS|r de tu raid.
|cff0070de[healing]|r - Tu |cff44ff44Sanación|r actual.
|cff0070de[rhealing]|r - La |cff44ff44Sanación|r de tu raid.
|cff0070de[pheal]|r - Tu % de |cff44ff44Sanación|r de la raid. (No incluye el simbolo %)
|cff0070de[nhealer]|r - Tu posición en la lista de |cff44ff44Curanderos|r.

|cff0070de[meter]|r - El nombre del |cff82c5ffmedidor de combate|r activo.
|cff0070de[combat]|r - El |cffffff00combate|r activo.
|cff0070de[dataset]|r - El |cffffff00segmento de datos|r activo.
|cff0070de[player]|r - El |cffff7f3fname|r del jugador.
]]
L["OVERLAY_TYPE"] = "Ventana Flotante"
L["OVERLAY_TYPE_DESC"] = "Establece el tipo de ventana flotante."
L["OVERLAY_TYPE_DPS"] = "Daño Realizado"
L["OVERLAY_TYPE_HEAL"] = "Sanación Realizada"
L["OVERLAY_TYPE_BOTH"] = "Daño y Sanación Realizada"
L["NUM_LINES"] = "Lineas de Venta Flotante"
L["NUM_LINES_DESC"] = "Establece el numero maximo de lineas en la ventana flotante."
L["TIP_UNLOCK"] = [[
|cffaaaaaaclick izq. para mover
click derec. para opciones.|r
]]
L["TIP_LOCK"] = [[
|cffaaaaaaclick izq. para mostrar
click derec. para opciones.|r
]]
L["FONT_NAME"] = "Fuente de Texto"
L["FONT_NAME_DESC"] = "Establece la fuente de texto."
L["FONT_SIZE"] = "Tamaño de la fuente"
L["FONT_SIZE_DESC"] = "Establece el tamaño de la fuente de texto."
L["OVERLAY_SETTINGS"] = "Ventana Flotante"
L["HEIGHT"] = "Alto"
L["HEIGHT_DESC"] = "Establece el alto."
L["WIDTH"] = "Ancho"
L["WIDTH_DESC"] = "Establece el ancho."
L["TIP"] = "Mostrar consejo de botones"
L["TIP_DESC"] = "Muestra informacion sobre la pulsacion de botones del raton en la ventana flotante."
L["TOTALS"] = "Mostrar Totales"
L["TOTALS_DESC"] = "Muestra una linea de totales en la ventana flotante."
L["TUKUI_CONFIG"] = "Posición para Cecile_MeterOverlay (0 para desactivar)"
L["DEBUG_WINDOW_HELP"] = "Rueda de raton para desplazarse (pulsar shift para principio/fin). Click tiulo mover y esquina inferior derecha para tamaño."
L["WRONG_VERSION"] = "%s - Una nueva versión (|cff0070de%s|r) de este addon esta disponible, por favor actualice su versión."
L["PLAYER_VERSION"] = "%s - El jugador %s tiene una versión(|cff0070de%s|r) del addon desactualizada."
L["ELV_TUK_OVERRIDE"] = "Modificar formato de ElvUI y TukUI"
L["ELV_TUK_OVERRIDE_DESC"] = "Modifica el formato de la ventana flotante para ElvUI y TukUI, cambia su fuente, y fondo."
L["OVERLAY_BG_COLOR"] = "Color de fondo"
L["OVERLAY_BG_COLOR_DESC"] = "Cambia el color de fondo, incluyendo la transaparencia (alfa)."
L["OVERLAY_HIDE_TYPE"] = "Modo ocultación"
L["OVERLAY_HIDE_TYPE_DESC"] = "Cambia como se oculta la ventana flotante."
L["OVERLAY_HIDE_NORMAL"] = "Ocultar"
L["ENABLE_DATATEXT_HIDE_OCC"] = "Ocultar fuera de combate"
L["ENABLE_DATATEXT_HIDE_OCC_DESC"] = "Oculta la ventana floante cuando no estamos en combate"
L["OVERLAY_HIDE_FADE"] = "Desvanecer"
L["ENABLE_DATATEXT_BACGROUND"] ="Activar Fondo"
L["ENABLE_DATATEXT_BACGROUND_DESC"] ="Activar el fondo para el texto flotante."
L["DATATEXT_HIDE_TYPE"] = "Modo ocultación fuera de combate"
L["DATATEXT_HIDE_TYPE_DESC"] = "Cambia como se oculta la ventana flotante fuera de combate."
L["DATATEXT_HIDE_NORMAL"] = "Ocultar"
L["DATATEXT_HIDE_FADE"] = "Desvanecer"
L["ENCOUNTERS_SETTINGS"] = "Récors de Encuentros"
L["ENCOUNTERS_WARNING"] = [[
Para usar estas opciones debes de tener instalado un AddOn para encuentros de jefes.

Los AddOns que se soportan son:

- |cff0070deDeadly Boss Mods|r
- |cff0070deBigWigs|r
]]
L["REPORT_SELF"]="A mi mismo";
L["REPORT_GUILD"]="El chat de hermandad";
L["REPORT_INSTANCE"]="El chat de instancia";
L["ENCOUNTERS_STORE"]="Almacenar encuentros"
L["ENCOUNTERS_STORE_DESC"]="Activa el almacenar los encuentros con jefes"
L["ENCOUNTERS_WIPE"]="Borrar todos"
L["ENCOUNTERS_WIPE_DESC"]="Borra todos los datos almacenados de todos los encuentros"
L["ENCOUNTERS_INSTANCE"]="Instancia"
L["ENCOUNTERS_INSTANCE_DESC"]="Selecciona instancia"
L["ENCOUNTERS_DIFFICULTY"]="Dificultad"
L["ENCOUNTERS_DIFFICULTY_DESC"]="Selecciona dificultad"
L["ENCOUNTERS_CHOOSE"]="Encuentro"
L["ENCOUNTERS_CHOOSE_DESC"]="Selecciona encuentro"
L["ENCOUNTERS_BROWSE"]="Explorar encuentros salvados"
L["ENCOUNTERS_TOP_RECORDS_DESC"]="Récords"
L["ENCOUNTERS_PLAYER_RECORDS_DESC"]="Récords personales"
L["ENCOUNTERS_RECORD_DPS_LINE"]="|c%s%s|r |cffff2020%s DPS |r el |cff0070de%s|r con un grupo de |cff0070de%s|r"
L["ENCOUNTERS_RECORD_HPS_LINE"]="|c%s%s|r |cff44ff44%s HPS |r el |cff0070de%s|r con un grupo de |cff0070de%s|r"
L["REPORT_NOW"]="Reportar ahora"
L["REPORT_NOW_TOP_DESC"]="Reportar los récords ahora"
L["REPORT_NOW_PLAYER_DESC"]="Reportar los récords personales ahora"
L["REPORT_NOW_TO"]="Report ahora en.."
L["REPORT_TO_DESC"]="Selecciona el canal a reportar"
L["REPORT_ENCOUNTER_RECORDS_TOP"]="|cfffff569%s|r máximos récords para |cff0070de%s|r (%s):"
L["REPORT_ENCOUNTER_RECORDS_PLAYER"]="|cfffff569%s|r récords personal para |cff0070de%s|r (%s):"
L["ENCOUNTERS_AUTO_REPORT_TOP"]="Autoreportar récords"
L["ENCOUNTERS_AUTO_REPORT_TOP_DESC"]="Activar el autoreportar los récords"
L["ENCOUNTERS_AUTO_REPORT_PLAYER"]="Autoreportar personales"
L["ENCOUNTERS_AUTO_REPORT_PLAYER_DESC"]="Activar el autoreportar los récords personales"
L["ENCOUNTERS_AUTO_REPORT_TYPE"]="Autoreportar en.."
L["ENCOUNTERS_AUTO_REPORT_TYPE_DESC"]="Selecciona el canal a autoreportar"
L["ENCOUNTERS_NEW_RECORD_DPS"]="- nuevo |c%s%s|r |cffff2020%s DPS|r"
L["ENCOUNTERS_NEW_RECORD_HPS"]="- nuevo |c%s%s|r |cff44ff44%s HPS|r"
L["ENCOUNTERS_NEW_RECORD_DPS_OVER"]="- nuevo |c%s%s|r |cffff2020%s DPS|r, era |c%s%s|r |cffff2020%s DPS|r"
L["ENCOUNTERS_NEW_RECORD_HPS_OVER"]="- nuevo |c%s%s|r |cff44ff44%s HPS|r, era |c%s%s|r |cff44ff44%s HPS|r"
L["ENCOUNTERS_FAIL_RECORD_DPS"]="- mantenido |c%s%s|r |cffff2020%s DPS|r, intento |c%s%s|r |cffff2020%s DPS|r"
L["ENCOUNTERS_FAIL_RECORD_HPS"]="- mantenido |c%s%s|r |cff44ff44%s HPS|r, intento |c%s%s|r |cff44ff44%s HPS|r"
L["STRATA_BACKGROUND"] = "Fondo"
L["STRATA_LOW"] = "Baja"
L["STRATA_MEDIUM"] = "Media"
L["STRATA_HIGH"] = "Alta"
L["STRATA_DIALOG"] = "Dialogo"
L["STRATA_FULLSCREEN"] = "Pantalla Completa"
L["STRATA_FULLSCREEN_DIALOG"] = "Dialog sobre Pantalla Completa"
L["STRATA_TOOLTIP"] = "Flotante"
L["STRATA_TYPE"] = "Prioridad Visual"
L["STRATA_TYPE_DESC"] = "Cambia la prioridad visual del texto flotante"
L["COLOR"] = "Colores del texto de datos"
L["COLOR_DESC"] = "Cambia los colores del texto de datos"
L["DATATEXT_GENERAL_COLOR"] = "Color general"
L["DATATEXT_GENERAL_COLOR_DESC"] = "Cambia el color del texto general"
L["DATATEXT_DAMAGE_COLOR"] = "Color de etiquetas de daño"
L["DATATEXT_DAMAGE_COLOR_DESC"] = "Cambia el color de las etiquetas de daño"
L["DATATEXT_HEALING_COLOR"] = "Color de etiquetas de sanación"
L["DATATEXT_HEALING_COLOR_DESC"] = "Cambia el color de las etiquetas de sanación"
L["DATATEXT_OTHER_COLOR"] = "Color para otras etiquetas"
L["DATATEXT_OTHER_COLOR_DESC"] = "Cambia el color para otras etiquetas"
L["BROWSE_RECORDS"] = "Ver records"
L["BROWSE_RECORDS_DESC"] = "Abre una ventana para ver los récords grabados"
L["BROWSE_RECORDS_WINDOW"] = "Récords de Encuentros"
L["BROWSE_RECORDS_STATUS"] = "Explorando Récords de Encuentros grabados"
L["HEADER_RECORDS_INSTANCE"] = "Récords para |cff0070de%s|r"
L["HEADER_RECORDS_INSTANCE_DIFFICULT"] = "Récords para |cff0070de%s|r (|cffffff00%s|r)"
L["HEADER_RECORDS_INSTANCE_DIFFICULT_ENCOUNTER"] = "Récords para |cff0070de%s|r (|cffffff00%s|r) : |cffff7f3f%s|r"
L["RECORDS_INSTANCE_DESC"] = "Tienes |cffff7f3f%d|r récords de encuentros en esta instancia."
L["RECORDS_INSTANCE_DIFIFICULT_DESC"] = "Tienes |cffff7f3f%d|r récords de encuentro en esta instancia y dificultad."
L["RECORDS_TREE_INSTANCE_FORMAT"] = "|cff0070de%s|r"
L["RECORDS_TREE_DIFFICULT_FORMAT"] = "|cffffff00%s|r"
L["RECORDS_TREE_ENCOUNTER_FORMAT"] = "|cffff7f3f%s|r"
L["RECORD_WARNING_WIPE_ALL"] = [[
|cffff2020Borrator todo|r los datos eliminara todos los récords de encuentro grabados.

¿Está seguro que quiere |cffff2020borrar todos los datos|r?"
]]

--get ordinal sufix for a number (1o,2o,3o,4o...) (spanish locale)
function Engine:OrdinalSuffix(number)
       return "o";
end