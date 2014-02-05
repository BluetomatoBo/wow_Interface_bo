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
L["NO_METER"] = "No tiene activado ningún medido de combate, por favor active Recount, Skada o TinyDPS."
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
L.tags = [[
Esta es la lista de etiquetas disponibles.

|cff0070de[dps]|r - Tu |cffff2020DPS|r actual.
|cff0070de[rdps]|r - El |cffff2020DPS|r de tu raid.
|cff0070de[damage]|r - Tu |cffff2020Daño|r actual.
|cff0070de[rdamage]|r - El |cffff2020Daño|r de tu raid.
|cff0070de[ndps]|r - Tu posición en la lista de |cffff2020Dps|r.

|cff0070de[hps]|r - Tu |cff44ff44HPS|r actual.
|cff0070de[rhps]|r - El |cff44ff44HPS|r de tu raid.
|cff0070de[healing]|r - Tu |cff44ff44Sanación|r actual.
|cff0070de[rhealing]|r - La |cff44ff44Sanación|r de tu raid.
|cff0070de[nhps]|r - Tu posición en la lista de |cff44ff44Healers|r.

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
L["OVERLAY_HIDE_FADE"] = "Desvanecer"
L["ENABLE_DATATEXT_BACGROUND"] ="Activar Fondo"
L["ENABLE_DATATEXT_BACGROUND_DESC"] ="Activar el fondo para el texto flotante."

--get ordinal sufix for a number (1o,2o,3o,4o...) (spanish locale)
function Engine:OrdinalSuffix(number)    
       return "o";
end