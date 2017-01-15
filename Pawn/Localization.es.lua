﻿-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

-- 
-- Spanish (European and Latin American) resources
-- See special cases at the end of the file!
------------------------------------------------------------

local function PawnUseThisLocalization()
PawnLocal =
{
	AverageItemLevelIgnoringRarityTooltipLine = "Nivel medio de objeto",
	BackupCommand = "backup",
	BaseValueWord = "base",
	CopyScaleEnterName = "Introduce un nombre para tu nueva escala, una copia de %s:",
	DebugOffCommand = "debug off",
	DebugOnCommand = "debug on",
	DecimalSeparator = ".",
	DeleteScaleConfirmation = "¿Está seguro de que desea eliminar %s? Esta acción no se puede deshacer. Escriba \"%s\" para confirmar:",
	DidntUnderstandMessage = "   (?) No entendo \"%s\".",
	EnchantedStatsHeader = "(Valor actual)",
	EngineeringName = "Ingeniería",
	ExportAllScalesMessage = "Pulse Ctrl+C para copiar sus etiquetas de escala, cree un fichero en su ordenador donde guardarlas como copia de seguridad, y pulse Ctrl+V para pegarlas. ",
	ExportScaleMessage = "Pulse Ctrl+C para copiar la siguiente etiqueta de escala para |cffffffff%s|r, y luego pulse Ctrl+V para pegarla.",
	FailedToGetItemLinkMessage = "   No se ha podido obtener el enlace al objeto desde el tooltip. Esto puede ser debido a un conflicto entre accesorios.",
	FailedToGetUnenchantedItemMessage = "   No se han podido obtener los valores base del objeto. Esto puede ser debido a un conflicto entre accesorios.",
	FoundStatMessage = "   %d %s",
	GemList2 = "%s o %s",
	GemListMany = "%d posibilidades (haz click al boton Pawn para ver mas detalles)",
	GenericGemLink = "|Hitem:%d|h[Gema %d]|h",
	GenericGemName = "(Gema %d)",
	HiddenScalesHeader = "Otras escalas",
	ImportScaleMessage = "Pulsa Ctrl+V para pegar aquí una etiqueta de escala que ha copiado de otra fuente: ",
	ImportScaleTagErrorMessage = "Pawn no entiende esa etiqueta de escala. ¿Ha copiado la etiqueta entera? Intente copiarla y pegarla de nuevo:",
	ItemIDTooltipLine = "ID de objeto",
	ItemLevelTooltipLine = "Nivel de objeto",
	LootUpgradeAdvisorHeader = "Pulse para comparar con sus objetos.|n",
	LootUpgradeAdvisorHeaderMany = "|TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t Este objeto es una mejora para %d escalas. Pulse para comparar con sus objetos.",
	MissocketWorthwhileMessage = "   -- Pero es mejor usar sólo gemas %s:",
	NeedNewerVgerCoreMessage = "Pawn necesita una versión más reciente de VgerCore. Por favor utilice la versión de VgerCore que vino con Pawn. ",
	NewScaleDuplicateName = "Ya existe una escala con ese nombre. Introduzca un nombre para su escala: ",
	NewScaleEnterName = "Introduzca un nombre para su escala: ",
	NewScaleNoQuotes = "Una escala no puede tener \" en su nombre. Introduzca un nombre para su escala: ",
	NormalizationMessage = "   ---- Normalizado dividiendo por %g",
	NoScale = "(ninguna)",
	NoScalesDescription = "Para empezar, importe una escala o comience una nueva. ",
	NoStatDescription = "Elija un atributo de la lista de la izquierda. ",
	Or = "o ",
	RenameScaleEnterName = "Escribe un nuevo nombre para %s:",
	SocketBonusValueCalculationMessage = "   -- La ranura extra valdrá: %g",
	StatNameText = "1 de |cffffffff%s|r vale:",
	ThousandsSeparator = ",",
	TooltipBestAnnotation = "%s  |cff8ec3e6(El mejor)|r",
	TooltipBestAnnotationSimple = "%s  El mejor",
	TooltipBigUpgradeAnnotation = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00 mejora%s|r",
	TooltipDowngradeAnnotation = "degradar", -- Needs review
	TooltipSecondBestAnnotation = "%s  |cff8ec3e6(El segundo mejor)|r",
	TooltipSecondBestAnnotationSimple = "%s  El segundo mejor",
	TooltipUpgradeAnnotation = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% mejora%s|r",
	TooltipUpgradeFor1H = " para armas 1H",
	TooltipUpgradeFor2H = " para armas 2H",
	TooltipUpgradeNeedsEnhancementsAnnotation = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% mejora potencial%s|r", -- Needs review
	TooltipVersusLine = "%s|n  vs. |c%s%s|r",
	TotalValueMessage = "   ---- Total: %g",
	UnenchantedStatsHeader = "(Valor base)",
	Unusable = "(No utilizable)",
	UnusableStatMessage = "   -- %s no es utilizable, parando.",
	Usage = [=[
Pawn by Vger-Azjol-Nerub
www.vgermods.com
 
/pawn -- Mostrar u ocultar la interfaz de Pawn
/pawn debug [ on | off ] -- Envía mensajes de depuracion a la consola
/pawn backup -- Crea un backup de tus escalas
 
Para más información sobre como personalizar Pawn, por favor lee el archivo (Readme.htm) que viene con el Addon.
]=],
	ValueCalculationMessage = "   %g %s x %g = %g",
	VisibleScalesHeader = "Escalas de %s",
	Stats = {
		AgilityInfo = "Agilidad.  Aumenta el poder de ataque en algunas clases.",
		ArmorInfo = "Armadura base.  No incluye la armadura extra recibida de los objetos especificos de tanque.",
		ArmorTypes = "Tipos de armadura",
		AvoidanceInfo = "Eludir.  Reduce el daño que recibes de ataques de área de efecto.",
		Cloth = "Tela",
		ClothInfo = "Puntos que asignar si el objeto es de Tela.",
		Crit = "Crit",
		CritInfo = "Golpe crítico.  Aumenta la probabilidad de que tus ataques y hechizos de curación sean más efectivos.",
		DpsInfo = "Daño por segundo del arma.  (Si quieres valorar el DPS de forma diferente para los distintos tipos de armas, mira la sección \"Atributos especiales de arma\".)",
		HasteInfo = "Celeridad.  Aumenta la velocidad de ataque y de lanzamiento de hechizos y la regeneracion de energía o enfoque.",
		IndestructibleInfo = "Indestructible.  Hace que el objeto no reciba daño de durabilidad.",
		IndestructibleIs = "Ser |cffffffffindestructible|r vale:",
		IntellectInfo = "Intelecto.  Aumenta el poder de hechizo para algunas clases.",
		Leather = "Cuero",
		LeatherInfo = "Puntos que asignar si el objeto es de Cuero",
		LeechInfo = "Restitución.  Te devuelve como sanación el daño que infliges o la sanación que realizas.",
		Mail = "Malla",
		MailInfo = "Puntos que asignar si el objeto es de malla.",
		MasteryInfo = "Maestría.  Mejora un bonus único para tu especialización.",
		MinorStats = "Estadísticas menores",
		MovementSpeedInfo = "Velocidad de movimiento.  Hace que tu personaje corra más rápido.",
		Plate = "Placas",
		PlateInfo = "Puntos que asignar si el objeto es de Placas.",
		Shield = "Escudo",
		ShieldInfo = "Puntos que asignar si el objeto es un Escudo",
		Sockets = "Ranuras",
		SpecialWeaponStats = "Atributos especiales de arma",
		SpeedBaseline = "Velocidad base",
		SpeedBaselineInfo = "No es un atributo que aparezca en armas, este número se resta de el atributo de Velocidad antes de multiplicarlo por el valor de la escala.",
		SpeedBaselineIs = "|cffffffffVelocidad base|r es:",
		SpeedInfo = "Velocidad de arma, en segundos por golpe.  (Si prefieres armas rápidas, éste número a de ser negativo.  Ver también: \"velocidad base\" en la sección \"Atributos especiales de arma\".)",
		SpeedIs = "1 segundo |cffffffffswing speed|r vale:",
		StaminaInfo = "Aguante.  Aumenta tu vida.",
		StrengthInfo = "Fuerza.  Aumenta el poder de ataque de algunas clases.",
		VersatilityInfo = "Versatilidad.  Aumenta el daño infligido para personajes DPS, la sanación realizada para personajes sanadores, y reduce el daño recibido para personajes tanque.",
		WeaponMainHandDps = "Mano Derecha: DPS",
		WeaponMainHandDpsInfo = "Daño del arma por segundo, sólo para armas de mano derecha.",
		WeaponMainHandMaxDamage = "Mano Derecha: daño máximo",
		WeaponMainHandMaxDamageInfo = "Daño máximo del arma, sólo para armas de mano derecha.",
		WeaponMainHandMinDamage = "Mano Derecha: daño mínimo",
		WeaponMainHandMinDamageInfo = "Daño mínimo del arma, sólo para armas de mano derecha.",
		WeaponMainHandSpeed = "Mano Derecha: velocidad",
		WeaponMainHandSpeedInfo = "Velocidad del arma, sólo para armas de mano derecha.",
		WeaponMaxDamage = "Daño máximo",
		WeaponMaxDamageInfo = "Daño máximo del arma.",
		WeaponMeleeDps = "DPS Cuerpo a Cuerpo",
		WeaponMeleeDpsInfo = "Daño del arma por segundo, sólo para armas cuerpo a cuerpo.",
		WeaponMeleeMaxDamage = "Cuerpo a Cuerpo: Daño máximo",
		WeaponMeleeMaxDamageInfo = "Daño máximo del arma, sólo para armas cuerpo a cuerpo.",
		WeaponMeleeMinDamage = "Cuerpo a Cuerpo: daño mínimo",
		WeaponMeleeMinDamageInfo = "Daño mínimo del arma, sólo para armas cuerpo a cuerpo.",
		WeaponMeleeSpeed = "Cuerpo a Cuerpo: velocidad",
		WeaponMeleeSpeedInfo = "Velocidad del arma, sólo para armas cuerpo a cuerpo.",
		WeaponMinDamage = "Daño mínimo",
		WeaponMinDamageInfo = "Daño mínimo del arma.",
		WeaponOffHandDps = "Mano Izquierda: DPS",
		WeaponOffHandDpsInfo = "Daño del arma por segundo, sólo para armas de mano izquierda.",
		WeaponOffHandMaxDamage = "Mano Izquierda: daño máximo",
		WeaponOffHandMaxDamageInfo = "Daño máximo del arma, sólo para armas de mano izquierda.",
		WeaponOffHandMinDamage = "Mano Izquierda: daño mínimo",
		WeaponOffHandMinDamageInfo = "Daño mínimo del arma, sólo para armas de mano izquierda.",
		WeaponOffHandSpeed = "Mano Izquierda: velocidad",
		WeaponOffHandSpeedInfo = "Velocidad del arma, sólo para armas de mano izquierda.",
		WeaponOneHandDps = "Una Mano: DPS",
		WeaponOneHandDpsInfo = "Daño del arma por segundo, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda",
		WeaponOneHandMaxDamage = "Una Mano: daño máximo",
		WeaponOneHandMaxDamageInfo = "Daño máximo del arma, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda.",
		WeaponOneHandMinDamage = "Una Mano: daño mínimo",
		WeaponOneHandMinDamageInfo = "Daño mínimo del arma, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda.",
		WeaponOneHandSpeed = "Una Mano: velocidad",
		WeaponOneHandSpeedInfo = "Velocidad de arma, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda.",
		WeaponRangedDps = "A Distancia: DPS",
		WeaponRangedDpsInfo = "Daño del arma por segundo, sólo para armas a distancia.",
		WeaponRangedMaxDamage = "A Distancia: daño máximo",
		WeaponRangedMaxDamageInfo = "Daño máximo del arma, sólo para armas a distancia.",
		WeaponRangedMinDamage = "A Distancia: daño mínimo",
		WeaponRangedMinDamageInfo = "Daño mínimo del arma, sólo para armas a distancia.",
		WeaponRangedSpeed = "A Distancia: velocidad",
		WeaponRangedSpeedInfo = "Velocidad de arma, sólo para armas a distancia.",
		WeaponStats = "Atributos de arma",
		WeaponTwoHandDps = "Dos Manos: DPS",
		WeaponTwoHandDpsInfo = "Daño del arma por segundo, sólo para armas a dos manos.",
		WeaponTwoHandMaxDamage = "Dos Manos: daño máximo",
		WeaponTwoHandMaxDamageInfo = "Daño máximo del arma, sólo para armas a dos manos.",
		WeaponTwoHandMinDamage = "Dos Manos: daño mínimo",
		WeaponTwoHandMinDamageInfo = "Daño mínimo del arma, sólo para armas a dos manos.",
		WeaponTwoHandSpeed = "Dos Manos: velocidad",
		WeaponTwoHandSpeedInfo = "Velocidad de arma, sólo para armas a dos manos.",
		WeaponType1HAxe = "Hacha: Una Mano",
		WeaponType1HAxeInfo = "Puntos que asignar si el objeto es un hacha de una mano.",
		WeaponType1HMace = "Maza: Una Mano",
		WeaponType1HMaceInfo = "Puntos que asignar si el objeto es una maza de una mano.",
		WeaponType1HSword = "Espada: Una Mano",
		WeaponType1HSwordInfo = "Puntos que asignar si el objeto es una espada de una mano.",
		WeaponType2HAxe = "Hacha: Dos Manos",
		WeaponType2HAxeInfo = "Puntos que asignar si el objeto es un hacha de dos manos.",
		WeaponType2HMace = "Maza: Dos Manos",
		WeaponType2HMaceInfo = "Puntos que asignar si el objeto es una maza de dos manos.",
		WeaponType2HSword = "Espada: Dos Manos",
		WeaponType2HSwordInfo = "Puntos que asignar si el objeto es una espada de dos manos.",
		WeaponTypeBow = "Arco",
		WeaponTypeBowInfo = "Puntos que asignar si el objeto es un arcos.",
		WeaponTypeCrossbow = "Ballesta",
		WeaponTypeCrossbowInfo = "Puntos que asignar si el objeto es una ballesta.",
		WeaponTypeDagger = "Daga",
		WeaponTypeDaggerInfo = "Puntos que asignar si el objeto es una daga.",
		WeaponTypeFistWeapon = "Arma de puño",
		WeaponTypeFistWeaponInfo = "Puntos que asignar si el objeto es un arma de puño.",
		WeaponTypeFrill = "Cosillas de mano izquierda",
		WeaponTypeFrillInfo = "Puntos que asignar si el objeto es un objeto de taumaturgo \"sostener en mano izquierda\".  No aplica a escudos o armas.",
		WeaponTypeGun = "Arma de fuego",
		WeaponTypeGunInfo = "Puntos que asignar si el objeto es un arma de fuego.",
		WeaponTypeOffHand = "Arma de mano izquierda",
		WeaponTypeOffHandInfo = "Puntos que asignar si el objeto es cualquier arma que sólo puede ser sostenida en la mano izquierda.  No aplica a objetos \"cosillas\" de (taumaturgo), escudos, o armas que pueden ser sostenidas en cualquier mano.",
		WeaponTypePolearm = "Arma de asta",
		WeaponTypePolearmInfo = "Puntos que asignar si el objeto es un arma de asta.",
		WeaponTypes = "Tipos de armas",
		WeaponTypeStaff = "Vara",
		WeaponTypeStaffInfo = "Puntos que asignar si el objeto es una vara.",
		WeaponTypeWand = "Varita",
		WeaponTypeWandInfo = "Puntos que asignar si el objeto es una varita.",
		WeaponTypeWarglaive = "Guja de Guerra",
		WeaponTypeWarglaiveInfo = "Puntos que seran asignados si el objetos es una guja de guerra", -- Needs review
	},
	TooltipParsing = {
		Agility = "^%+?([-%d%.,]+) agilidad$",
		AllStats = "^%+?([%d%.,]+) todas las estadísticas$",
		Ap = "^%+?([%d%.,]+) [Pp]oder de ataque$",
		Armor = "^%+?([%d%.,]+) p. de armadura$",
		Armor2 = "^UNUSED$",
		Avoidance = "^%+([%d%.,]+) elusión$",
		Axe = "^Hacha$",
		BagSlots = "^%d+ casillas .+$",
		Bow = "^Arco$",
		ChanceOnHit = "Probabilidad al acertar:",
		Charges = "^.+ cargas?$",
		Cloth = "^Tela$",
		CooldownRemaining = "^Tiempo de reutilización restante:",
		Crit = "^%+?([%d%.,]+) golpe crítico%.?$",
		Crit2 = "^UNUSED$",
		Crossbow = "^Ballesta$",
		Dagger = "^Daga$",
		Design = "Diseño:",
		DisenchantingRequires = "^Desencantar requiere",
		Dodge = "^%+?([%d%.,]+) esquivar$",
		Dodge2 = "^UNUSED$",
		Dps = "^%(([%d%.,]+) p. de daño por segundo%)$",
		DpsAdd = "^Añade ([%d%.,]+) p. de daño por segundo$",
		Duration = "^Duración:",
		Elite = "^Élite$",
		EnchantmentArmorKit = "^Reforzado %(%+([%d%.,]+) armadura%)$",
		EnchantmentCounterweight = "^Contrapeso %(%+([%d%.,]+) celeridad%)",
		EnchantmentFieryWeapon = "^Arma ígnea$",
		EnchantmentHealth = "^%+([%d%.,]+) HP$",
		EnchantmentHealth2 = "^%+([%d%.,]+) salud$",
		EnchantmentLivingSteelWeaponChain = "^Cadena$ de Acero Vivo",
		EnchantmentPyriumWeaponChain = "^Cadena$ de Pirium",
		EnchantmentTitaniumWeaponChain = "^Cadena$ de Titanio",
		Equip = "Equipar:",
		FistWeapon = "^Arma de puño$",
		Flexible = "^Flexible$",
		Formula = "Fórmula:",
		Gun = "^Arma de fuego$",
		Haste = "^%+?([%d%.,]+) celeridad$",
		Haste2 = "^UNUSED$",
		HaventCollectedAppearance = "^Aun no has recogido este aspecto$", -- Needs review
		HeirloomLevelRange = "^Requiere un nivel entre %d+ y (%d+)",
		HeirloomXpBoost = "^Equipar: La experiencia obtenida",
		HeirloomXpBoost2 = "^UNUSED$",
		Heroic = "^Heroico$",
		HeroicElite = "^Heroico de élite$",
		HeroicThunderforged = "^Heroico Forjas del Trueno$",
		HeroicWarforged = "^Heroico Forjas de la guerra$",
		Hp5 = "^([%d%.,]+) Salud cada 5 s%.$",
		Hp52 = "^Equipar: Restaura ([%d%.,]+) de vida cada 5 segundos%.$",
		Hp53 = "^Restaura %+?([%d%.,]+) [vV]ida [cC]ada 5 [sS]egundos%.?$",
		Hp54 = "^UNUSED$",
		Intellect = "^%+?([-%d%.,]+) intelecto$",
		Leather = "^Cuero$",
		Leech = "^%+([%d%.,]+) restitución$",
		Mace = "^Maza$",
		Mail = "^Malla$",
		Manual = "Manual:",
		Mastery = "^%+?([%d%.,]+) maestría$",
		Mastery2 = "^UNUSED$",
		MetaGemRequirements = "|cff%x%x%x%x%x%xRequiere",
		MovementSpeed = "^%+([%d%.,]+) velocidad$",
		MultiStatHeading = "^Estadisticas multiples$", -- Needs review
		MultiStatSeparator1 = "y",
		Multistrike = "^%+([%d%.,]+) multigolpe$",
		NormalizationEnchant = "^Encantado: (.*)$",
		Parry = "^%+?([%d%.,]+) parada$",
		Parry2 = "^UNUSED$",
		Pattern = "Patrón:",
		Plans = "Diseño:",
		Plate = "^Placas$",
		Polearm = "^Arma de asta$",
		PvPPower = "^%+?([%d%.,]+) poder JcJ$",
		RaidFinder = "^Buscador de bandas$",
		Recipe = "Receta:",
		Requires2 = "^Necesitas ser de nivel [%d%.,]+$",
		Resilience = "^%+?([%d%.,]+) temple JcJ$",
		Resilience2 = "^UNUSED$",
		Schematic = "Esquema:",
		Scope = "^Mira %(%+([%d%.,]+) daño%)$",
		ScopeCrit = "^Scope %(%+([%d%.,]+) Critical Strike%)$",
		ScopeRangedCrit = "^%+?([%d%.,]+) Golpe Crítico a distancia$",
		Shield = "^Escudo$",
		SocketBonusPrefix = "Bonus ranura: ",
		Speed = "^Velocidad ([%d%.,]+)$",
		Speed2 = "^UNUSED$",
		SpellPower = "^%+?([%d%.,]+) poder con hechizos$",
		Spirit = "^%+?([-%d%.,]+) espíritu$",
		Staff = "^Bastón$",
		Stamina = "^%+?([-%d%.,]+) aguante$",
		Strength = "^%+?([-%d%.,]+) fuerza$",
		Sword = "^Espada$",
		TemporaryBuffMinutes = "^.+%(%d+ min%)$",
		TemporaryBuffSeconds = "^.+%(%d+ seg%)$",
		Thunderforged = "^Forjas del Trueno$",
		Timeless = "^Sin tiempo$",
		Titanforged = "^Forjadoporlostitanes$", -- Needs review
		UpgradeLevel = "^Nivel de Mejora:",
		Use = "Usar:",
		Versatility = "^%+([%d%.,]+) versatilidad$",
		Wand = "^Varita$",
		Warforged = "^Forjas de la guerra$",
		Warglaives = "^Gujas de Guerra$",
		WeaponDamage = "^([%d%.,]+) %- ([%d%.,]+) p. de daño$",
		WeaponDamageArcane = "^%+?([%d%.,]+) %- ([%d%.,]+) p. de daño de Arcano$",
		WeaponDamageArcaneExact = "^%+?([%d%.,]+) p. de daño de Arcano$",
		WeaponDamageEnchantment = "^%+?([%d%.,]+) daño con arma$",
		WeaponDamageEquip = "^Equipar: %+?([%d%.,]+) p. de daño con arma%.$",
		WeaponDamageExact = "^%+?([%d%.,]+) p. de daño$",
		WeaponDamageFire = "^%+?([%d%.,]+) %- ([%d%.,]+) p. de daño de Fuego$",
		WeaponDamageFireExact = "^%+?([%d%.,]+) p. de daño de Fuego$",
		WeaponDamageFrost = "^%+?([%d%.,]+) %- ([%d%.,]+) p. de daño de Escarcha$",
		WeaponDamageFrostExact = "^%+?([%d%.,]+) p. de daño de Escarcha$",
		WeaponDamageHoly = "^%+?([%d%.,]+) %- ([%d%.,]+) p. de daño de Sagrado$",
		WeaponDamageHolyExact = "^%+?([%d%.,]+) p. de daño de Sagrado$",
		WeaponDamageNature = "^%+?([%d%.,]+) %- ([%d%.,]+) p. de daño de Naturaleza$",
		WeaponDamageNatureExact = "^%+?([%d%.,]+) p. de daño de Naturaleza$",
		WeaponDamageShadow = "^%+?([%d%.,]+) %- ([%d%.,]+) p. de daño de Sombras$",
		WeaponDamageShadowExact = "^%+?([%d%.,]+) p. de daño de Sombras$",
	},
	UI = {
		AboutHeader = "Acerca de Pawn",
		AboutMrRobot = "Default stat weights are provided by the generous Mr. Robot.  They’re a great starting point for characters with typical talents and artifact traits in typical fights.  You can get more accurate, customized stat weights for your character using the Ask Mr. Robot simulator at askmrrobot.com.", -- Requires localization
		AboutReadme = "Nuevo en Pawn? Mira la pestaña de primeros pasos para una introducción básica.",
		AboutTab = "Acerca de",
		AboutTranslation = "Traducción al Castellano por Minimoncho y Grimngor",
		AboutVersion = "Versión %s",
		AboutWebsite = "Para otros addons de Vger, visita vgermods.com.", -- Needs review
		AskMrRobotProvider = "Ask Mr. Robot scales", -- Requires localization
		CompareClearItems = "Limpiar",
		CompareClearItemsTooltip = "Quitar ambos objetos de la comparación.",
		CompareColoredSockets = "Ranuras de color",
		CompareEquipped = "Equipado",
		CompareGemTotalValue = "Valor de gemas",
		CompareHeader = "Compara objetos usando %s",
		CompareOtherHeader = "Otro",
		CompareSlotEmpty = "(vacío)",
		CompareSocketBonus = "Bonus de ranura",
		CompareSocketsHeader = "Ranuras",
		CompareSpecialEffects = "Efectos especiales",
		CompareSwap = "‹ Cambiar ›",
		CompareSwapTooltip = "Cambia el objeto de la izquierda por el de la derecha.",
		CompareTab = "Comparar",
		CompareVersus = "—vs.—",
		CompareWelcomeRight = [=[Despues, coloca un objeto en ésta caja. 

Puedes compararlo contra tus objetos existentes usando los iconos en la esquina inferior izquierda.]=],
		CompareYourBest = "El mejor",
		GemsColorHeader = "Gemas %s",
		GemsHeader = "Gemas para %s",
		GemsNoneFound = "No se encontraron gemas adecuadas.",
		GemsQualityLevel = "Nivel de calidad de la gema",
		GemsQualityLevelTooltip = [=[Nivel de objeto para el que sugerir gemas.

Por ejemplo, si "463", entonces Pawn mostrará gemas adecuadas para objetos de nivel 463: Botín de mazmorra heroica de Mists of Pandaria.]=],
		GemsShowBest = "Muestra las mejores gemas disponibles",
		GemsShowBestTooltip = "Muestra las mejores gemas que hay disponibles para la escala seleccionada actualmente.  Algunas de éstas gemas serán demasiado poderosas para encrustarlas en objetos viejos y de baja calidad.",
		GemsShowForItemLevel = "Muestra las gemas recomendadas para un nivel de objeto:",
		GemsShowForItemLevelTooltip = "Muestra las gemas que Pawn recomienda para la escala que está seleccionada actualmente y un objeto de un nivel específico.",
		GemsTab = "Gemas",
		GemsWelcome = "Selecciona una escala a la izquierda para ver las gemas que Pawn recomienda.",
		HelpHeader = "Bienvenido a Pawn!",
		HelpTab = "Primeros pasos",
		HelpText = [=[Pawn calcula el valor del objeto según los atributos del objeto.  Después utiliza estos valores para determinar cuales de tus objetos son los mejores, y identificar objetos que mejorarían tu equipamiento. 

	  
Cada objeto recibirá una puntuación por cada "escala" que esté activa para tu personaje.  Una escala enumera los atributos que son importantes para ti, y cuantos puntos vale cada atributo.  Normalmente dispones de una escala para cada uno de los roles o especializaciones de clase.  Las puntuaciones están escondidas por defecto, pero puedes ver como se calcula la puntuación de un objeto en la pestaña de Comparar. 

 • Puedes activar o desactivar una escala haciendo shift-click en ella en la lista de la pestaña de Escalas. 

 
Pawn viene con escalas pre-fabricadas para cada clase y especialización.  También puedes crear tu propia escala asignandole valores a cada atributo, importar escalas de internet o herramientas de simulación, o compartir escalas con compañeros de hermandad. 


|cff8ec3e6Prueba estás características una vez aprendas los básico:|r 
 • Compara las estadñisticas de dos objetos usando la pestaña de Comparar de  Pawn.
 • Haz click-derecho en la ventana de link al chat de un objeto para ver la comparación con tu objeto actual. 
 • Haz una copia de una de tus escalas en la pestaña de Escalas, y personaliza los valores de los atributos en la pesaña de Valores. 
 • Busca más escalas para tu clase en internet. 
 • Echa un vistazo al archivo leeme para aprender más acerca de las características avanzadas de Pawn.]=], -- Needs review
		InterfaceOptionsBody = "Haz click en el botón de Pawn para ir allí.  También puedes abrir Pawn desde tu ventana de personaje, o estableciendo un atajo de teclado a Pawn.",
		InterfaceOptionsWelcome = "Las opciones de Pawn se encuentran en la IU de Pawn.",
		InventoryButtonTooltip = "Haz click para abrir Pawn.",
		InventoryButtonTotalsHeader = "Totales para todos los objetos equipados:",
		KeyBindingCompareItemLeft = "Comparar objeto (izquierda)",
		KeyBindingCompareItemRight = "Comparar objeto (derecha)",
		KeyBindingShowUI = "Enciende/Apaga la IU de Pawn",
		OptionsAdvisorHeader = "Opciones del consejero",
		OptionsAlignRight = "Alinea los valores al lado derecho del tooltip",
		OptionsAlignRightTooltip = "Activa ésta opción para alinear tus valores de Pawn y la información de mejora al lado derecho del tooltip en vez de al izquierdo.",
		OptionsBagUpgradeAdvisor = "Show bag upgrade advisor",
		OptionsBagUpgradeAdvisorTooltip = [=[Enable this option to have Pawn take over the in-bag upgrade arrows.

If checked, Pawn will find upgrades in your bags and mark items that are an upgrade for any of your active scales with green arrows. 

If unchecked, WoW will mark items with a higher item level than what you're currently wearing, and Pawn will not interfere with the built-in feature.]=],
		OptionsBlankLine = "Añade una línea en blanco antes de los valores",
		OptionsBlankLineTooltip = "Mantén tus tooltips de objetos super ordenados activando ésta opción, que añade una línea en blanco antes de los valores de Pawn.",
		OptionsButtonHidden = "Esconder",
		OptionsButtonHiddenTooltip = "No mostrar el botón de Pawn en la ventana de Información de Personaje.",
		OptionsButtonPosition = "Mostrar el botón de Pawn:",
		OptionsButtonPositionLeft = "A la izquierda",
		OptionsButtonPositionLeftTooltip = "Muestra el botón de Pawn en la esquina inferior izquierda de la ventana de Información de Personaje.",
		OptionsButtonPositionRight = "A la derecha",
		OptionsButtonPositionRightTooltip = "Muestra el botón de Pawn en la esquina inferior derecha de la ventana de Información de Personaje.",
		OptionsColorBorder = "Colorear el borde del tooltip de mejoras",
		OptionsColorBorderTooltip = "Activa ésta opción para cambiar el color del borde del tooltip de objetos a partir de los verdes.  Desactiva ésta opción si interfiere con otros addons que cambian los bordes de los tooltips.",
		OptionsCurrentValue = "Muestra tanto los valores base como los actuales",
		OptionsCurrentValueTooltip = [=[Activa ésta opción para que Pawn muestre dos valores para objetos: el valor actual, que refleja el estado actual de un objeto con las gemas y encantamientos actuales, sin que las ranuras vacias den beneficio, y el valor base, que es lo que Pawn muestra normalmente.  Ésta opción no tiene efecto salvo que actives mostrar valor de objetos en tooltip. 

Deberías seguir usando el valor base para decidir entre dos objetos cuando llegues al "endgame", pero el valor actual puede ser de ayuda mientras subes de nivel y para que sea más fácil decidir si merece la pena equipar un objeto nuevo inmediatamente antes de que tenga gemas o encantamientos.]=],
		OptionsDebug = "Muestra la información de debug",
		OptionsDebugTooltip = [=[Si no estás seguro de como Pawn está calculando los valores de un objeto en particular, habilita ésta opción para que Pawn muestre todo yipo de datos "útiles" en la consola de chat cada vez que pongas el ratón sobre un objeto.  Ésta informacion incluye los atributos que Pawn cree que tiene el objeto, que partes del objeto Pawn no entiende, y como tiene cada uno de los atributos en cuenta para cada una de tus escalas. 

Ésta opción llenará tu registro de chat bastante rapido, te recomendamos apagarla cuando hayas terminado de hacer pruebas. 

Atajos: 
/pawn debug on 
/pawn debug off]=],
		OptionsHeader = "Ajusta las opciones de Pawn",
		OptionsIgnoreGemsWhileLevelingCheck = "Ignorar ranuras en objetos de bajo nivel",
		OptionsIgnoreGemsWhileLevelingCheckTooltip = [=[Habilita ésta opción para que Pawn ignore las ranuras en objetos de bajo nivel al calcular los valores de objetos, dado que la mayoría de la gente no dedica tiempo a incrustar objetos cuando aún está levelando.  Un objeto de "bajo nivel" es aquel peor que el que puede obtenerse en una mazmorra heroica en el nivel máximo.

Si está seleccionado, el asistente de ranuras de Pawn sugerira gemas apropriadas para objetos de bajo nivel, pero algunas ranuras serán ignoradas en los calculos y los objetos con incrustaciones no se mostrarán como mejoras con tanta frecuancia. 

Si está deseleccionado, Pawn calculará valores para objetos como si tuvieran las incrustaciones que maximizan el valor del objeto, independientemente del nivel del objeto.]=],
		OptionsIgnoreItemUpgradesCheck = "Ignorar las mejoras de valor y torvos", -- Needs review
		OptionsIgnoreItemUpgradesCheckTooltip = [=[Activa esta opción para que Pawn ignore el potencial para las mejoras de Valor y los objetos Torvos Mejorados cuando calcule el valor de los objetos.

Si esta marcado, Pawn tratará los objetos mejorables como son actualmente y no asumirá que usarás Valor y Fragmentos Apexis Mejorados para mejorar el objeto al determinar si el objeto es mejor que el que tienes actualmente.

Si no esta marcado, Pawn tratará esos objetos asumiendo que maximizaras su potencial con Valor y Fragmentos Apexis Mejorados. Esto podría causar que un objeto torvo de nivel 650 apareciera como una mejora notable respecto a un objeto nivel 670 de Fundición Rocanegra, ya que el objeto torvo podría mejorarse potencialmente hasta el nivel 705 a través de Valor y Apexis.]=], -- Needs review
		OptionsInventoryIcon = "Mostrar iconos de inventario", -- Needs review
		OptionsInventoryIconTooltip = "Habilita ésta opción para mostrar el incono de los objetos enlazados en el chat.",
		OptionsItemIDs = "Mostrar IDs de objetos",
		OptionsItemIDsTooltip = [=[Habilita ésta opción para uqe Pawn muestre los números de ID de todos los objetos que encuentres, asi como las IDs de todos los encantamientos y gemas. 

Todo objeto en World of Warcraft tiene un número de ID asociado.  Normalmente ésta información sólo es útil para desarrolladores de addons.]=],
		OptionsLootAdvisor = "Mostrar asistente de mejora en botín",
		OptionsLootAdvisorTooltip = "Cuando el botín de una mazmorra suponga una mejora, Pawn mostrará un popup anclado a la ventana de botín informándote de la mejora.",
		OptionsOtherHeader = "Otras opciones",
		OptionsQuestUpgradeAdvisor = "Mostrar asistente de mejora en misión",
		OptionsQuestUpgradeAdvisorTooltip = "En tu registro de misiones y en las conversaciones con PNJs, si una de las opciones de recompensa de la misión es una mejora para tu equipamiento actual, Pawn mostrará un icono de flecha verde en ese objeto.  SI ninguno de los objetos son una mejora, Pawn mostrará un montón de monedas en el objeto que valga más al venderlo a un comerciante.",
		OptionsResetUpgrades = "Re-escanear equipo",
		OptionsResetUpgradesTooltip = [=[Pawn olvidará lo que sabe sobre los mejores objetos que has equipado en el pasado y re-escaneará tu equipamiento para mostrar información de mejoras más relevante en el futuro. 

Usa ésta característica si crees que Pawn está haciendo malas sugerencias de mejora como resultado de objetos que has vendido, destruido, o que de otra forma ya no usas.  Ésto afectará a todos tus personajes que usen Pawn.]=],
		OptionsSocketingAdvisor = "Mostrar asistente de ranuras",
		OptionsSocketingAdvisorTooltip = "Cuando se añaden gemas a un objeto, Pawn mostrará un popup sugiriendo las gemas que puedes añadir al objeto para maximizar su poder.  (Para ver la lista completa de sugerencias de gemas para cada color, ve a la pestaña de Gemas, donde además podrás personalizar la calidad de las gemas que usar.)",
		OptionsTab = "Opciones",
		OptionsTooltipHeader = "Opciones de Tooltips",
		OptionsTooltipSpecIcon = "Mostrar iconos de especializacion",
		OptionsTooltipSpecIconTooltip = "Activar esta opcion para mostrar iconos de especializacion al lado de los nombres de las escalas en la descripcion emergente", -- Needs review
		OptionsTooltipUpgradesOnly = "Muestra sólo mejoras",
		OptionsTooltipUpgradesOnlyTooltip = [=[Ésta es la opción más simple.  Sólo muestra porcentajes de mejora para objetos que son una mejora de tu equipamiento actual, y indica cuales de tus objetos son los mejores para cada escala.  No muestra nada en absoluto para los objetos inferiores. 

|cff8ec3e6Fuego:|r  |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% mejora|r 

...o... 

|cff8ec3e6Fuego:  el mejor|r]=],
		OptionsTooltipValuesAndUpgrades = "Muestra los valores de las escalas y los valores %",
		OptionsTooltipValuesAndUpgradesTooltip = [=[Muestra valores de Pawn para todas tus escalas visibles en todos los objetos, excepto aquellos que tienen un valor de cero.  Además, indicar que objetos son una mejora para tu equipamiento actual. 

|cff8ec3e6Escarcha:  123.4 
Fire:  156.7 |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% mejora|r]=],
		OptionsTooltipValuesOnly = "Muestra sólo los valores de las escalas, no mejoras %",
		OptionsTooltipValuesOnlyTooltip = [=[Muestra valores de Pawn para todas tus escalas visibles en todos los objetos, excepto aquellos que tienen un valor de cero.  No indicar que objetos son una mejora para tu equipamiento actual.  Ésta opción refleja el comportamiento por defecto en versiones antiguas de Pawn. 

|cff8ec3e6Escarcha:  123.4
Fuego:  156.7|r]=],
		OptionsUpgradeHeader = "Muestra |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t mejoras en los tooltips:",
		OptionsUpgradesForBothWeaponTypes = "Muestra mejoras para Una Mano y Dos Manos",
		OptionsUpgradesForBothWeaponTypesTooltip = [=[El asistente de mejoras de Pawn buscarán y mostrarán mejoras para tus armas de dos manos y tus armas de doble empuñadura (o para taumaturgos, cosilla de mano derecha y mano izquierda) de forma independiente. 

Si está seleccionado, podrás estar usando un arma de dos manos y aún asi ver armas de una mano claramente inferiores como mejoras si son mejores que la última arma de una mano mejor (o segunda mejor) que tuviste, porque Pawn está buscando mejoras de forma independiente para ambos sets de armas.

Si está deseleccionado, equipar un arma de dos manos evitará que Pawn te muestre mejoras para armas de una mano y vice-versa.]=],
		OptionsUpgradeTrackingHeader = "Comparacion de mejoras",
		OptionsUpgradeTrackingOff = "Comparado con el equipo equipado (recomendado)",
		OptionsUpgradeTrackingOffTooltip = "Pawn mostrara el equipamiento que suponga una mejora respecto al que tengas equipado actualmente", -- Needs review
		OptionsUpgradeTrackingOn = "Rastrear para cada escala (avanzado)",
		OptionsUpgradeTrackingOnTooltip = "(Para usuarios avanzados.) Pawn tratara de rastrear el mejor equipamiento que te hayas equipado, independientemente de cada escala que hayas habilitado, y te mostrara el equipamiento que sea una mejora respecto a estos.",
		OptionsWelcome = "Configura Pawn a tu gusto.  Los cambios se mostrarán de forma inmediata.",
		ScaleAutoOff = "Manual",
		ScaleAutoOff2 = "Permitirme manejar las escalas",
		ScaleAutoOffTooltip = "Pawn te permitira elegir manualmente que escalas usar para sus calculos, haciendo posible activar mas de una escala cada vez, añadir escalas personalizadas, y mas.",
		ScaleAutoOn = "Automatico",
		ScaleAutoOn2 = "Solo mostrar mi especializacion actual",
		ScaleAutoOnTooltip = "Pawn mostrara automaticamente tu especializacion actual en la descripcion emergente del equipamiento, y lo usara para hacer recomendaciones y sugerir mejoras.",
		ScaleAutoWelcome = [=[Pawn mostrara sugerencias para tu especializacion actual

Si prefieres gestionar las cosas por tu cuenta, haz click en el boton Manual de debajo]=],
		ScaleChangeColor = "Cambiar color",
		ScaleChangeColorTooltip = "Cambia el color en el que aparecen el nombre y el valor de ésta escala en los tooltips de objetos.",
		ScaleCopy = "Copiar",
		ScaleCopyTooltip = "Crea una nueva escala haciendo una copia de ésta.",
		ScaleDefaults = "Predeterminados",
		ScaleDefaultsTooltip = "Crea una nueva escala haciendo una copia de los valores por defecto",
		ScaleDeleteTooltip = [=[Delete this scale. 

This ¡el comando no se puede deshacer!]=],
		ScaleEmpty = "Vacío",
		ScaleEmptyTooltip = "Crea una nueva escala de cero.",
		ScaleExport = "Exportar",
		ScaleExportTooltip = "Comparte tu escala con otros en internet.",
		ScaleHeader = "Gestiona tus escalas de Pawn",
		ScaleImport = "Importar",
		ScaleImportTooltip = "Añade una nueva escala copiando una etiqueta de escala de internet.",
		ScaleNewHeader = "Crear una nueva escala",
		ScaleRename = "Renombrar",
		ScaleRenameTooltip = "Renombra ésta escala.",
		ScaleSelectorHeader = "Selecciona una escala:",
		ScaleSelectorShowingSuggestionsFor = "Mostrando sugerencias para",
		ScaleSelectorShowScale = "Muestra ésta escala en tooltips",
		ScaleSelectorShowScaleTooltip = [=[Cuando esta opción está activada, los valores de ésta escala se mostrarán en los tooltips de objetos de éste personaje.  Cada escala se puede mostrar para uno de tus personajes, varios personajes, o ningún personaje. 

Atajo: Shift+click en una escala]=],
		ScaleShareHeader = "Compartir tus escalas",
		ScaleTab = "Escala",
		ScaleTypeNormal = "Puedes modificar ésta escala en la pestaña Valores.",
		ScaleTypeReadOnly = "Tienes que hacer una copia de ésta escala para poder personalizarla.",
		ScaleWelcome = "Las Escalas son conjuntos de atributos y valores que se usan para asignar puntos de valor a los objetos.  Puedes personalizar tu propia escala y sus valores, o usar los que han creado otros.",
		SocketingAdvisorButtonTooltip = "Haz click para abrir la pestaña de Gemas de Pawn, en la que podrás ver más información sobre las gemas que Pawn recomienda.",
		SocketingAdvisorHeader = "El asesor de ranuras de Pawn sugiere:",
		SocketingAdvisorIgnoreThisItem = "No merece la pena añadir gemas a éste objeto de bajo nivel.  Pero si lo haces, usa éstas:",
		StarterProvider = "Escalas por defecto", -- Needs review
		ValuesDoNotShowUpgradesFor1H = "No mostrar mejoras para objectos de Una Mano",
		ValuesDoNotShowUpgradesFor2H = "No mostrar mejoras para objetos de Dos Manos",
		ValuesDoNotShowUpgradesTooltip = "Habilita ésta opción para no mostrar las mejoras de este tipo de objeto.  Por ejemplo, aunque los tanques paladín pueden usar armas de dos manos, un arma de dos manos nunca en una \"mejora\" para un set de paladín tanque, de forma que Pawn no debería mostrar notificaciones de mejora para esas armas.  De forma similar, los paladines reprensión pueden usar armas de una mano, pero éstas nunca son mejoras.",
		ValuesFollowSpecialization = "Sólo mostrar mejoras para mi especialización de armadura tras el nivel 50",
		ValuesFollowSpecializationTooltip = "Habilita ésta opción para no mostrar mejoras para armaduras que no se corresponden con la especialización de tu clase tras el nivel 50.  Por ejemplo. al nivel 50 los paladines sagrados aprenden Especialización en Placas, que incrementa su intelecto un 5% cuando equipan sólo armaduras de placas.  Cuando se elige ésta opción Pawn nunca considerará tela, cuero o malla como mejoras para paladines sagrados de nivel 50 o más.",
		ValuesHeader = "Valores de escala para %s", -- Needs review
		ValuesIgnoreStat = "Los objetos con éste atributo son inutilizables",
		ValuesIgnoreStatTooltip = "Habilita ésta opción para que cualquier objeto con éste atributo no tenga un valor para ésta escala.  Por ejemplo, los chamanes no pueden equipar placas, asi que en una escala diseñada para un chaman se podría marcar placas como inutilizable de forma que las armaduras de placas no reciban un valor para esa escala.",
		ValuesNormalize = "Normalizar valores (como en Wowhead)",
		ValuesNormalizeTooltip = [=[Habilita ésta opción para dividir el cálculo del valor final para un objeto entre la suma de todos los valores de atributo en tu escala, como se hace en WowHead y Lootzor.  Esto ayuda a compensar situaciones como que una escala tenga valores cercanos a 1 y otra cercanos a 5.  También ayuda a mantener los numeros más cortos y manejables. 

Para más información sobre éstas opciones, consulta el archivo leeme.]=],
		ValuesRemove = "Borrar",
		ValuesRemoveTooltip = "Borra éste atributo de la escala.",
		ValuesTab = "Valores", -- Needs review
		ValuesWelcome = "Puedes personalizar los valores asignados a cada atributo para ésta escala. Para administrar tus escalas o añadir nuevas escalas, usa la pestaña de Escala.", -- Needs review
		ValuesWelcomeNoScales = "No has seleccionado ninguna escala.  Para comenzar, ve a la pestaña de Escala y crea una nueva escala o cópiala de internet.",
		ValuesWelcomeReadOnly = "La escala que has seleccionado no se puede modificar.  Para cambiar estos valores, ve a la pestaña de Escala y haz una copia de ésta escala o crea una escala nueva.", -- Needs review
	},
}
end 

if GetLocale() == "esES" then
	PawnUseThisLocalization()
	PawnLocal.ThousandsSeparator = "."
	PawnLocal.DecimalSeparator = ","
elseif GetLocale() == "esMX" then 
   PawnUseThisLocalization() 
	PawnLocal.ThousandsSeparator = ","
	PawnLocal.DecimalSeparator = "."
end 

-- After using this localization or deciding that we don't need it, remove it from memory.
PawnUseThisLocalization = nil
