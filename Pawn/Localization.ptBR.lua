-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2017 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

-- 
-- Brazilian Portuguese resources
------------------------------------------------------------

local function PawnUseThisLocalization()
PawnLocal =
{
	["AverageItemLevelIgnoringRarityTooltipLine"] = "Nível de item médio",
	["BackupCommand"] = "backup",
	["BaseValueWord"] = "base",
	["CopyScaleEnterName"] = "Digite o nome para sua nova esclaa, uma copia de %s:",
	["DebugOffCommand"] = "debug off",
	["DebugOnCommand"] = "debug on",
	["DecimalSeparator"] = ",",
	["DeleteScaleConfirmation"] = "Você quer mesmo deletar %s? Isso não pode ser desfeito. Digite \"%s\" para confirmar:",
	["DidntUnderstandMessage"] = "   (?) Não entendi \"%s\".",
	["EnchantedStatsHeader"] = "(Valor atual)",
	["EngineeringName"] = "Engenharia",
	["ExportAllScalesMessage"] = "Pressione Ctrl+C para copiar a tag da sua escala, crie um arquivo no seu computador para backup, então pressione Ctrl+V para colar nele.",
	["ExportScaleMessage"] = "Pressione Ctrl+C para copiar as seguintes tag de escalas para |cffffffff%s|r, e então pressione Ctrl+V para colar depois.",
	["FailedToGetItemLinkMessage"] = "   Erro ao pegar o link do tooltip.  Isso pode ser devido conflito de mods.",
	["FailedToGetUnenchantedItemMessage"] = "   Erro ao pegar valores base de items.  Isso pode ser devido conflito de mods.",
	["FoundStatMessage"] = "   %d %s",
	["GemList2"] = "%s or %s",
	--Translation missing 
	["GemListMany"] = "%d possibilities (click the Pawn button for details)",
	["GenericGemLink"] = "|Hitem:%d|h[Gema %d]|h",
	["GenericGemName"] = "(Gema %d)",
	["HiddenScalesHeader"] = "Outras escalas",
	["ImportScaleMessage"] = "Pressione Ctrl+V para colar a tag de escala que você copiou de outra fonte aqui:",
	["ImportScaleTagErrorMessage"] = "Pawn não entende essa tag de escala.  Você copiou a tag inteira?  Tente copiar e colar de novo:",
	["ItemIDTooltipLine"] = "ID do Item",
	["ItemLevelTooltipLine"] = "Nível do Item",
	["LootUpgradeAdvisorHeader"] = "Clique para comparar com seus items.|n",
	["LootUpgradeAdvisorHeaderMany"] = "|TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t Este item é um upgrade para %d escalas.  Clique para comparar com seus items.",
	["MissocketWorthwhileMessage"] = "   -- Mas é melhor usar somente %s gemas:",
	["NeedNewerVgerCoreMessage"] = "Pawn precisa de uma versão nova do VgerCore.  Por favor use a versão do VgerCore que veio com Pawn.",
	["NewScaleDuplicateName"] = "Uma escala com esse nome já existe.  Digite o nome para sua escala:",
	["NewScaleEnterName"] = "Digite o nome para sua escala:",
	["NewScaleNoQuotes"] = "Uma escala não pode ter \" no nome.  Digite o nome para sua escala:",
	["NormalizationMessage"] = "   -- Normalizado por dividir por %g",
	["NoScale"] = "(nenhuma)",
	["NoScalesDescription"] = "Para começar, importe uma escala ou comece uma nova.",
	["NoStatDescription"] = "Escolha um atributo da lista na esquerda.",
	["Or"] = "ou",
	["RenameScaleEnterName"] = "Digite um nome para %s:",
	["SocketBonusValueCalculationMessage"] = "   -- Bonus de engaste valeria: %g",
	["StatNameText"] = "1 |cffffffff%s|r vale:",
	["ThousandsSeparator"] = ".",
	["TooltipBestAnnotation"] = "%s  |cff8ec3e6(melhor)|r",
	["TooltipBestAnnotationSimple"] = "%s  seu melhor",
	["TooltipBigUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00 upgrade%s|r",
	--Translation missing 
	["TooltipDowngradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00-%.0f%% downgrade%s|r",
	--Translation missing 
	["TooltipRelicUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%d item levels%s|r",
	["TooltipSecondBestAnnotation"] = "%s  |cff8ec3e6(segundo melhor)|r",
	["TooltipSecondBestAnnotationSimple"] = "%s  seu segundo melhor",
	["TooltipUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% upgrade%s|r",
	["TooltipUpgradeFor1H"] = "para sets 1 Mão",
	["TooltipUpgradeFor2H"] = "para 2 Mãos",
	--Translation missing 
	["TooltipUpgradeNeedsEnhancementsAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% upgrade potential%s|r",
	["TooltipVersusLine"] = "%s|n  vs. |c%s%s|r",
	["TotalValueMessage"] = "   ---- Total: %g",
	["UnenchantedStatsHeader"] = "(Valor base)",
	["Unusable"] = "(não utilizável)",
	["UnusableStatMessage"] = "   -- %s é inútil, então pare.",
	["Usage"] = [=[
Pawn por Vger-Azjol-Nerub
www.vgermods.com

/pawn -- mostra ou esconde a janela do Pawn
/pawn debug [ on | off ] -- mostra mensagens de debug no console do chat
/pawn backup -- backup todas as suas tags de escala
 
Para mais informações em personalizar o Pawn, favor veja o arquivo de ajuda (Readme.htm) que vem com o mod.]=],
	["ValueCalculationMessage"] = "   %g %s x %g cada = %g",
	["VisibleScalesHeader"] = "%s's scales",
	["Stats"] = {
		["AgilityInfo"] = "O atributo primário, Agilidade.",
		["ArmorInfo"] = "Armadura, não importa que tipo de item.  Não distingue entre armadura base ou bonus de armadura desde que items com bonus de armadura são obsoletos.",
		["ArmorTypes"] = "Tipos de armaduras",
		--Translation missing 
		["AvoidanceInfo"] = "Avoidance.  Reduces the damage you take from area-of-effect attacks.",
		["Cloth"] = "Tecido",
		["ClothInfo"] = "Pontos para distribuir se o item é tecido.",
		["Crit"] = "Crítico",
		["CritInfo"] = "Ataque crítico.  Afeta ataques de perto, ataques de longe, e magias.",
		["DpsInfo"] = "Danos por segundo da Arma.  (Se você quer valores de DPS diferentes para tipos de armas diferentes, veja a seção \"Atributos especiais de armas\".)",
		["HasteInfo"] = "Aceleração.  Afeta ataques corpo-a-corpo, ataques de longo alcance, e magias.",
		--Translation missing 
		["IndestructibleInfo"] = "Indestructible.  Prevents your equipment from taking durability damage.",
		--Translation missing 
		["IndestructibleIs"] = "Being |cffffffffindestructible|r is worth:",
		["IntellectInfo"] = "Atributo Primário, Intelecto",
		["Leather"] = "Atributo - Variáveis usadas pela listra mestre de atributos na aba Valores.",
		["LeatherInfo"] = "Pontos para distribuir se o item for couro.",
		--Translation missing 
		["LeechInfo"] = "Leech.  Causes your attacks and healing spells to restore your health.",
		["Mail"] = "Atributos - Variáveis utilizadas pelas listas de atributos mestres na aba de Valores.",
		["MailInfo"] = "Pontos para distribuir se o item for malha.",
		["MasteryInfo"] = "Maestria.  Melhora o bônus único da especialização da sua classe",
		--Translation missing 
		["MinorStats"] = "Minor stats",
		--Translation missing 
		["MovementSpeedInfo"] = "Movement speed.  Causes your character to run faster.",
		["Plate"] = "Placa",
		["PlateInfo"] = "Pontos para distribuir se o item for placa.",
		["Shield"] = "Escudo",
		["ShieldInfo"] = "Pontos para distribuir se o item for um escudo.",
		["Sockets"] = "Engastes",
		["SpecialWeaponStats"] = "Status especiais de armas",
		["SpeedBaseline"] = "Velocidade base",
		["SpeedBaselineInfo"] = "Não é atributo.  Este número é subtraído do Atributo Velocidade antes de multiplicar pelo valor da escala.",
		["SpeedBaselineIs"] = "|cffffffffVelocidade base|r é:",
		["SpeedInfo"] = "Velocidade da arma, em golpes por segundo.  (Se você prefere armas mais rápidas, este número deve ser negativo.  Veja também: \"velocidade base\" na seção \"Status especiais de armas\")",
		["SpeedIs"] = "1 segundo |cffffffffvelocidade do golpe|r vale:",
		["StaminaInfo"] = "Atributo primário, Vigor.",
		["StrengthInfo"] = "Atributo primário, Força.",
		--Translation missing 
		["VersatilityInfo"] = "Versatility.  Increases damage dealt for damage characters, increases healing done by healing characters, and reduces damage taken for tank characters.",
		["WeaponMainHandDps"] = "Mão Principal: DPS",
		["WeaponMainHandDpsInfo"] = "Danos por segundo da arma, somente para armas de uma mão principal.",
		["WeaponMainHandMaxDamage"] = "Mão Principal: dano maximo",
		["WeaponMainHandMaxDamageInfo"] = "Dano máximo da arma, somente para armas de uma mão principal.",
		["WeaponMainHandMinDamage"] = "Arma Principal: dano mínimo",
		["WeaponMainHandMinDamageInfo"] = "Dano mínimo da arma, somente para armas de uma mão principal.",
		["WeaponMainHandSpeed"] = "Arma Principal: velocidade",
		["WeaponMainHandSpeedInfo"] = "Velocidade da arma, somente para armas de uma mão principal.",
		["WeaponMaxDamage"] = "Dano máximo",
		["WeaponMaxDamageInfo"] = "Dano máximo de arma",
		["WeaponMeleeDps"] = "Corpo-a-corpo: DPS",
		["WeaponMeleeDpsInfo"] = "Dano por segundo de arma, somente para armas corpo-a-corpo",
		["WeaponMeleeMaxDamage"] = "Corpo-a-corpo: Dano máximo",
		["WeaponMeleeMaxDamageInfo"] = "Dano máximo de arma, somente para armas de corpo-a-corpo.",
		["WeaponMeleeMinDamage"] = "Corpo-a-corpo: dano mínimo",
		["WeaponMeleeMinDamageInfo"] = "Dano mínimo de arma, somente para armas corpo-a-corpo.",
		["WeaponMeleeSpeed"] = "Corpo-a-corpo: velocidade",
		["WeaponMeleeSpeedInfo"] = "Velocidade da arma, somente para armas corpo-a-corpo.",
		["WeaponMinDamage"] = "Dano mínimo",
		["WeaponMinDamageInfo"] = "Dano mínimo de arma",
		["WeaponOffHandDps"] = "Mão Secundária: DPS",
		["WeaponOffHandDpsInfo"] = "Dano por segundo de arma, somente para armas de mão secundária.",
		["WeaponOffHandMaxDamage"] = "Mão Secundária: dano máximo",
		["WeaponOffHandMaxDamageInfo"] = "Damo máximo de arma, somente para armas de mão secundária.",
		["WeaponOffHandMinDamage"] = "Mão Secundária: dano mínimo",
		["WeaponOffHandMinDamageInfo"] = "dano mínimo de arma, somente para armas de mão secundária.",
		["WeaponOffHandSpeed"] = "Mão Secundária: velocidade",
		["WeaponOffHandSpeedInfo"] = "Velocidade de arma, somente para armas de mão secundária.",
		["WeaponOneHandDps"] = "Uma mão: DPS",
		["WeaponOneHandDpsInfo"] = "Dano por segundo de arma, somente para armas marcadas como uma mão, não sendo mão principal nem mão secundária.",
		["WeaponOneHandMaxDamage"] = "Uma mão: dano máximo",
		["WeaponOneHandMaxDamageInfo"] = "Dano máximo de arma, somente para armas marcadas como uma mão, não sendo mão principal nem mão secundária.",
		["WeaponOneHandMinDamage"] = "Uma mão: dano mínimo",
		["WeaponOneHandMinDamageInfo"] = "Dano mínimo de arma, somente para armas marcadas como uma mão, não sendo mão principal nem mão secundária.",
		["WeaponOneHandSpeed"] = "Uma mão: velocidade",
		["WeaponOneHandSpeedInfo"] = "Velocidade da arma, somente para armas marcadas como uma mão, não sendo mão principal nem mão secundária.",
		["WeaponRangedDps"] = "Longo alcance: DPS",
		["WeaponRangedDpsInfo"] = "Dano por segundo de arma, somente para armas de longo alcance.",
		["WeaponRangedMaxDamage"] = "Longo alcance: dano máximo",
		["WeaponRangedMaxDamageInfo"] = "Dano máximo de arma, somente para armas de longo alcance.",
		["WeaponRangedMinDamage"] = "Longo alcance: dano mínimo",
		["WeaponRangedMinDamageInfo"] = "Dano mínimo de arma, somente para armas de longo alcance.",
		["WeaponRangedSpeed"] = "Longo alcance: velocidade",
		["WeaponRangedSpeedInfo"] = "Velocidade da arma, somente para armas de longo alcance.",
		["WeaponStats"] = "Atributos de arma",
		["WeaponTwoHandDps"] = "Duas mãos: DPS",
		["WeaponTwoHandDpsInfo"] = "Dano por segundo de arma, somente para armas de duas mãos.",
		["WeaponTwoHandMaxDamage"] = "Duas mãos: dano máximo",
		["WeaponTwoHandMaxDamageInfo"] = "Dano máximo de arma, somente para armas de duas mãos.",
		["WeaponTwoHandMinDamage"] = "Duas mãos: dano mínimo",
		["WeaponTwoHandMinDamageInfo"] = "Dano mínimo de arma, somente para armas de duas mãos.",
		["WeaponTwoHandSpeed"] = "Duas mãos: velocidade",
		["WeaponTwoHandSpeedInfo"] = "Velocidade da arma, somente para armas de duas mãos.",
		["WeaponType1HAxe"] = "Machado: uma mão",
		["WeaponType1HAxeInfo"] = "Pontos para distribuir se o item for um machado de uma mão.",
		["WeaponType1HMace"] = "Maça: uma mão",
		["WeaponType1HMaceInfo"] = "Pontos para distribuir se o item for uma maça de uma mão.",
		["WeaponType1HSword"] = "Espada: uma mão",
		["WeaponType1HSwordInfo"] = "Pontos para distribuir se o item for uma espada de uma mão.",
		["WeaponType2HAxe"] = "Machado: duas mãos",
		["WeaponType2HAxeInfo"] = "Pontos para distribuir se o item for um machado de duas mãos.",
		["WeaponType2HMace"] = "Maça: duas mãos",
		["WeaponType2HMaceInfo"] = "Pontos para distribuir se o item for uma ma;ca de duas mãos",
		["WeaponType2HSword"] = "Espada: duas mãos",
		["WeaponType2HSwordInfo"] = "Pontos para distribuir se o item for uma espada de duas mãos.",
		["WeaponTypeBow"] = "Arco",
		["WeaponTypeBowInfo"] = "Pontos para distribuir se o item for um arco.",
		["WeaponTypeCrossbow"] = "Besta",
		["WeaponTypeCrossbowInfo"] = "Pontos para distribuir se o item for uma besta.",
		["WeaponTypeDagger"] = "Adaga",
		["WeaponTypeDaggerInfo"] = "Pontos para distribuir se o item for uma adaga.",
		["WeaponTypeFistWeapon"] = "Arma de punho",
		["WeaponTypeFistWeaponInfo"] = "Pontos para distribuir se o item for uma arma de punho",
		["WeaponTypeFrill"] = "Acessórios de mão secundária",
		["WeaponTypeFrillInfo"] = "Pontos para distribuir se o item é um acessório do tipo \"Empunhado na mão secundária\".  Não aplica a escudo ou armas.",
		["WeaponTypeGun"] = "Arma",
		["WeaponTypeGunInfo"] = "Pontos para distribuir se o item for uma arma.",
		["WeaponTypeOffHand"] = "Arma de mão secundária",
		["WeaponTypeOffHandInfo"] = "Pontos para distribuir se o item for qualquer arma que pode ser empunhada na mão secundária. Não aplica a acessórios, escudos, ou armas que pode ser equipadas em ambas as mãos.",
		["WeaponTypePolearm"] = "Armas de Haste",
		["WeaponTypePolearmInfo"] = "Pontos para distribuir se o item for uma arma de haste.",
		["WeaponTypes"] = "Tipos de armas",
		["WeaponTypeStaff"] = "Cajado",
		["WeaponTypeStaffInfo"] = "Pontos para distribuir se o item for um cajado.",
		["WeaponTypeWand"] = "Varinha",
		["WeaponTypeWandInfo"] = "Pontos para distribuir se o item for uma varinha.",
		["WeaponTypeWarglaive"] = "Glaive de Guerra",
		--Translation missing 
		["WeaponTypeWarglaiveInfo"] = "Points to be assigned if the item is a warglaive."
	},
	["TooltipParsing"] = {
		["Agility"] = "^%+?([-%d%.,]+) d?e? ?Agilidade$",
		["AllStats"] = "^%+?([%d%.,]+) em Todos os [aA]tributos$",
		["Ap"] = "^%+?([%d%.,]+) d?e? ?Poder de ataque$",
		["Armor"] = "^%+?([%d%.,]+) Armadura$",
		["Armor2"] = "^%+?([%d%.,]+) de Armadura$",
		["Avoidance"] = "^%+([%d%.,]+) Evasiva$",
		["Axe"] = "^Machado$",
		["BagSlots"] = "^%d+ Compartimento .+$",
		["Bow"] = "^Arco$",
		["ChanceOnHit"] = "Chance ao acertar:",
		["Charges"] = "^.+ Cargas?$",
		["Cloth"] = "^Tecido$",
		["CooldownRemaining"] = "^Tempo de recarga restante:",
		["Crit"] = "^%+?([%d%.,]+) Acerto Crítico%.?$",
		["Crit2"] = "^%+?([%d%.,]+) de Acerto Crítico%.?$",
		["Crossbow"] = "^Besta$",
		["Dagger"] = "^Adaga$",
		["DisenchantingRequires"] = "^Desencantamento necessita",
		["Dodge"] = "^%+?([%d%.,]+) Esquiva$",
		["Dodge2"] = "^%+?([%d%.,]+) de Esquiva$",
		["Dps"] = "^%(([%d%.,]+) d?e? ?dano por segundo%)$",
		["DpsAdd"] = "^Adiciona ([%d%.,]+) dano por segundo$",
		["Duration"] = "^Dura%ç%ão:",
		["Elite"] = "^Elite$",
		["EnchantmentArmorKit"] = "^Armadura %(%+([%d%.,]+) Refor%çada%)$",
		["EnchantmentCounterweight"] = "^Contrapeso %(%+([%d%.,]+) Acelera&ç&ão%)",
		["EnchantmentFieryWeapon"] = "^Arma Ígnea$",
		["EnchantmentHealth"] = "^%+([%d%.,]+) Vida$",
		["EnchantmentHealth2"] = "^%+([%d%.,]+) de Vida$",
		["EnchantmentLivingSteelWeaponChain"] = "^Corrente de Arma de Aço Viva$",
		["EnchantmentPyriumWeaponChain"] = "^Corrente de Arma de Pírio$",
		["EnchantmentTitaniumWeaponChain"] = "^Corrente de Arma de Titânico$",
		["Equip"] = "Equipar:",
		["FistWeapon"] = "^Arma de Punho$",
		["Flexible"] = "^Flexivel$",
		["Gun"] = "^Arma$",
		["Haste"] = "^%+?([%d%.,]+) Aceleração$",
		["Haste2"] = "^%+?([%d%.,]+) de Aceleração$",
		--Translation missing 
		["HaventCollectedAppearance"] = "^You haven't collected this appearance$",
		["HeirloomLevelRange"] = "^Requer nível %d+ to (%d+)",
		["HeirloomXpBoost"] = "^Equipar: Experiência obtida",
		["HeirloomXpBoost2"] = "^UNUSED$",
		["Heroic"] = "^Heroico$",
		["HeroicElite"] = "^Heroico de Elite$",
		["HeroicThunderforged"] = "^Forjado pelo Trovão Heroico$",
		["HeroicWarforged"] = "^Forjado para a Guerra Heroico$",
		["Hp5"] = "^Equipar: Restaura ([%d%.,]+) pontos de vida a cada 5 s%.$",
		["Hp52"] = "^Equipar: Recupera ([%d%.,]+) pontos de vida a cada 5 s%.$",
		["Hp53"] = "^Recupera %+?([%d%.,]+) [pP]ontos [dD]e [vV]ida [aA] [cC]ada 5 [sS]%.?$",
		["Hp54"] = "^UNUSED$",
		["Intellect"] = "^%+?([-%d%.,]+) d?e? ?Intelecto$",
		["Leather"] = "^Couro$",
		["Leech"] = "^%+([%d%.,]+) Sorver$",
		["Mace"] = "^Ma%ça$",
		["Mail"] = "^Correio$",
		["Mastery"] = "^%+?([%d%.,]+) Maestria$",
		["Mastery2"] = "^%+?([%d%.,]+) de Maestria$",
		["MetaGemRequirements"] = "|cff%x%x%x%x%x%xRequer",
		["MovementSpeed"] = "^%+([%d%.,]+) Velocidade$",
		--Translation missing 
		["MultiStatHeading"] = "^Multiple Stats$",
		["MultiStatSeparator1"] = "e",
		["Multistrike"] = "^%+([%d%.,]+) Golpes Múltiplos$",
		["NormalizationEnchant"] = "^Encantado: (.*)$",
		["Parry"] = "^%+?([%d%.,]+) Aparo$",
		["Parry2"] = "^%+?([%d%.,]+) de Aparo$",
		["Plate"] = "^Placas$",
		["Polearm"] = "^Arma de Haste$",
		["PvPPower"] = "^%+?([%d%.,]+) d?e? ?Poder JxJ$",
		["RaidFinder"] = "^Localizador de Raides$",
		["Requires2"] = "^UNUSED$",
		["Resilience"] = "^%+?([%d%.,]+) Resiliência JxJ$",
		["Resilience2"] = "^%+?([%d%.,]+) de Resiliência JxJ$",
		["Scope"] = "^Mira %(%+([%d%.,]+) de Dano%)$",
		["ScopeCrit"] = "^Mira %(%+([%d%.,]+) Acerto Crítico%)$",
		["ScopeRangedCrit"] = "^%+?([%d%.,]+) Acerto Crítico de Longo Alcance$",
		["Shield"] = "^Escudo$",
		["SocketBonusPrefix"] = "Bônus de engaste: ",
		["Speed"] = "^Velocidade ([%d%.,]+)$",
		["Speed2"] = "^UNUSED$",
		["SpellPower"] = "^%+?([%d%.,]+) d?e? ?Poder [mM]ágico$",
		["Spirit"] = "^%+?([-%d%.,]+) d?e? ?Espírito$",
		["Staff"] = "^Cajado$",
		["Stamina"] = "^%+?([-%d%.,]+) d?e? ?Vigor$",
		["Strength"] = "^%+?([-%d%.,]+) d?e? ?Força$",
		["Sword"] = "^Espada$",
		["TemporaryBuffMinutes"] = "^.+%(%d+ min%)$",
		["TemporaryBuffSeconds"] = "^.+%(%d+ s%)$",
		["Thunderforged"] = "^Forjado pelo Trovão$",
		["Timeless"] = "^Perene$",
		--Translation missing 
		["Titanforged"] = "^Titanforged$",
		["UpgradeLevel"] = "^Nível de aprimoramento:",
		["Use"] = "Usar:",
		["Versatility"] = "^%+([%d%.,]+) Versatilidade$",
		["Wand"] = "^Varinha$",
		["Warforged"] = "^Forjado para a Guerra$",
		["Warglaives"] = "^Glaives de Guerra$",
		["WeaponDamage"] = "^([%d%.,]+) %- ([%d%.,]+) d?e? ?Dano$",
		["WeaponDamageArcane"] = "^%+?([%d%.,]+) %- ([%d%.,]+) de [dD]ano Arcano$",
		["WeaponDamageArcaneExact"] = "^%+?([%d%.,]+) de [dD]ano Arcano$",
		["WeaponDamageEnchantment"] = "^%+?([%d%.,]+) [dD]ano de [aA]rma$",
		["WeaponDamageEquip"] = "^%+?([%d%.,]+) [dD]ano de [aA]rma%.$",
		["WeaponDamageExact"] = "^%+?([%d%.,]+) Dano$",
		["WeaponDamageFire"] = "^%+?([%d%.,]+) %- ([%d%.,]+) [dD]ano de [dF]ogo$",
		["WeaponDamageFireExact"] = "^%+?([%d%.,]+) [dD]ano de [dF]ogo$",
		["WeaponDamageFrost"] = "^%+?([%d%.,]+) %- ([%d%.,]+) [dD]ano [dD]e [gG]elo.$",
		["WeaponDamageFrostExact"] = "^%+?([%d%.,]+) [dD]ano [dD]e [gG]elo.$",
		["WeaponDamageHoly"] = "^%+?([%d%.,]+) %- ([%d%.,]+) [dD]ano [sS]agrado$",
		["WeaponDamageHolyExact"] = "^%+?([%d%.,]+) [dD]ano [sS]agrado$",
		["WeaponDamageNature"] = "^%+?([%d%.,]+) %- ([%d%.,]+) [dD]ano [dD]e [nN]atureza$",
		["WeaponDamageNatureExact"] = "^%+?([%d%.,]+) [dD]ano [dD]e [nN]atureza$",
		["WeaponDamageShadow"] = "^%+?([%d%.,]+) %- ([%d%.,]+) [dD]ano [dD]e [sS]ombra$",
		["WeaponDamageShadowExact"] = "^%+?([%d%.,]+) [dD]ano [dD]e [sS]ombra$"
	},
	["UI"] = {
		["AboutHeader"] = "Sobre Pawn",
		--Translation missing 
		["AboutMrRobot"] = "Default stat weights are provided by the generous Mr. Robot.  They’re a great starting point for characters with typical talents and artifact traits in typical fights.  You can get more accurate, customized stat weights for your character using the Ask Mr. Robot simulator at askmrrobot.com.",
		["AboutReadme"] = "Novato no Pawn?  Veja a aba começando para uma introdução básica.",
		["AboutTab"] = "Sobre",
		["AboutTranslation"] = "Português traduzido por Maxmag-Goldrinn magnodias.maxmag@gmail.com",
		["AboutVersion"] = "Versão %s",
		["AboutWebsite"] = "Para outros mods por Vger, visite vgermods.com.",
		--Translation missing 
		["AskMrRobotProvider"] = "Ask Mr. Robot scales",
		["CompareClearItems"] = "Limpar",
		["CompareClearItemsTooltip"] = "Remover ambos itens da comparação.",
		["CompareColoredSockets"] = "Engastes coloridos",
		["CompareEquipped"] = "Equipado",
		["CompareGemTotalValue"] = "Valor das gemas",
		["CompareHeader"] = "Comparar itens usando %s",
		["CompareOtherHeader"] = "Outro",
		["CompareSlotEmpty"] = "(sem item)",
		["CompareSocketBonus"] = "Bonus de engaste",
		["CompareSocketsHeader"] = "Engastes",
		["CompareSpecialEffects"] = "Efeitos especiais",
		["CompareSwap"] = "‹ Troca ›",
		["CompareSwapTooltip"] = "Troca o item da esquerda pelo da direita.",
		["CompareTab"] = "Comparar",
		["CompareVersus"] = "—vs.—",
		["CompareWelcomeRight"] = [=[Então, solte um item nessa caixa.

Você pode comparar ele versus seus itens atuais usando os ícones no canto inferior-esquerdo.]=],
		["CompareYourBest"] = "Seu melhor",
		["GemsColorHeader"] = "%s gemas",
		["GemsHeader"] = "Gemas para %s",
		["GemsNoneFound"] = "Nenhuma gema apropriada foi encontrada.",
		["GemsQualityLevel"] = "Nível de qualidade da gema",
		["GemsQualityLevelTooltip"] = [=[O nível do item que deve ser sugerido gemas.

Exemplo, se for "463", então o Pawn vai mostrar gemas que são apropriadas para uso de item nível 463: loot de masmorras heróicas do Mists of Pandaria.]=],
		["GemsShowBest"] = "Motrar melhores gemas disponíveis",
		["GemsShowBestTooltip"] = "Mostra as melhores gemas disponíveis para a escala atualmente selecionada.  Algumas dessas gemas vão ser muito poderosas para engastar em items de baixa qualidade.",
		["GemsShowForItemLevel"] = "Mostrar gemas recomendadas pelo nível do item:",
		["GemsShowForItemLevelTooltip"] = "Mostra as gemas que o Pawn recomenda para a escala atualmente selecionada e um item de nível específico.",
		["GemsTab"] = "Gemas",
		["GemsWelcome"] = "Selecione uma escala do lado direito para ver as gemas que Pawn recomenda.",
		["HelpHeader"] = "Bem-vindo ao Pawn!",
		["HelpTab"] = "Começando",
		["HelpText"] = [=[Pawn calcula pontos em seus items baseados nos atributos que o item tem.  Ele usa esses pontos para determinar qual dos seus items são melhor, e pada identificar items que podem dar upgrade no seu equipamento.


Cada item vai ter um ponto para cada "escala" que é ativa no seu personagem.  Uma escala lista os atributos importantes para você, e mostra como cada ponto vale no atributo.  Você geralmente vai ter uma escala para cada especialização da sua classe.  Os pontos são geralmente ocultos, mas você pode ver como a pontuação do item é calculada na aba Comparar.

 • Você pode habilitar uma escala ou não fazendo Shift+Clique na lista que fica na aba de Escalas.


Pawn vem com escalas do Wowhead para cada Classe e Especialização.  Você também pode criar seu próprio distribuindo pontos em cada atributo, importar escalas da internet ou ferramentas de simulação, ou compartilhar escalas com seu grupo ou guilda.

|cff8ec3e6Tente esses recursos assim que você aprender o básico:|r
 • Comparar os status de dois items usando a aba Comparar do Pawn.
 • Clique-direito em um link de item para ver como ele faz a comparação do seu item atual.
 • Shift-Clique em um item com engastes para o Pawn sugerir gemas para ele.
 • Faça a cópia de uma escala na aba de Escalas, e personalize o valores de atributos na aba Valores.
 • Ache mais escalas para sua classe na internet.
 • Verifique o arquivo leia-me para aprender mais sobre as características avançadas do Pawn.]=],
		["InterfaceOptionsBody"] = "Clique no botão do Pawn para abri-lo.  Você pode também abrir o Pawn da página do seu inventário, ou colocando uma tecla de atalho.",
		["InterfaceOptionsWelcome"] = "Opções do Pawn são encontradas na janela do Pawn.",
		["InventoryButtonTooltip"] = "Clique para abrir Pawn.",
		["InventoryButtonTotalsHeader"] = "Total para todos items equipados:",
		["KeyBindingCompareItemLeft"] = "Comparar item (esquerda)",
		["KeyBindingCompareItemRight"] = "Comparar item (direita)",
		["KeyBindingShowUI"] = "Alternar janela do Pawn",
		["OptionsAdvisorHeader"] = "Opções do Assessor",
		["OptionsAlignRight"] = "Alinhar valores para o canto direito do tooltip",
		["OptionsAlignRightTooltip"] = "Habilite isso para alinhar os valores do Pawn e atualizar informação para o canto direito do tooltip ao invés da esquerda.",
		--Translation missing 
		["OptionsBagUpgradeAdvisor"] = "Show bag upgrade advisor",
		--Translation missing 
		["OptionsBagUpgradeAdvisorTooltip"] = [=[Enable this option to have Pawn take over the in-bag upgrade arrows.

If checked, Pawn will find upgrades in your bags and mark items that are an upgrade for any of your active scales with green arrows. 

If unchecked, WoW will mark items with a higher item level than what you're currently wearing, and Pawn will not interfere with the built-in feature.]=],
		["OptionsBlankLine"] = "Adicione uma linha em branco antes dos valores",
		["OptionsBlankLineTooltip"] = "Mantem o tooltip dos items extra menor habilitanto essa opção, que adiciona uma linha em branco antes dos valores do Pawn.",
		["OptionsButtonHidden"] = "Esconder",
		["OptionsButtonHiddenTooltip"] = "Não mostrar o botão do Pawn na janela de Informações do personagem.",
		["OptionsButtonPosition"] = "Mostrar o botão do Pawn:",
		["OptionsButtonPositionLeft"] = "No lado esquerdo",
		["OptionsButtonPositionLeftTooltip"] = "Mostrar o botão do Pawn no canto inferior-esquerdo na janela de Informações do Personagem.",
		["OptionsButtonPositionRight"] = "No lado direito",
		["OptionsButtonPositionRightTooltip"] = "Mostrar o botão do Pawn no canto inferior-direito na janela de Informações do Personagem.",
		["OptionsColorBorder"] = "Colorir a borda do tooltip nos upgrades",
		["OptionsColorBorderTooltip"] = "Habilite essa opção para mudar a cor da borda do tooltip dos items que tem upgrades para verde.  Desabilite se isso interfere com outros mods que mudam a borda dos tooltips.",
		["OptionsCurrentValue"] = "Mostrar ambos valores atuais e valores base",
		["OptionsCurrentValueTooltip"] = [=[Habilite essa opção para que o Pawn mostre dois valores para items: o valor atual, que reflete no estado atual de um item com valores atuais de gemas, encantamentos, e reforja que o item tem no momento, com engastes vazios que não fornecem benefício, adicionando os valores base, que é o que o Pawn normalmente mostra.  O valor atual vai ser mostrado antes do valor atual.  Esta opção não tem efeito a não ser que você habilite mostrar valores de items nos tooltips.

Você deve continuar usando os valores base para determinar entre dois items no fim-do-jogo, mas o valor atual pode ser útil quando subindo de nível e para facilitar em decidir qual que vale mais imediatamente equipando um novo item antes que tenha gemas ou encantamentos.]=],
		["OptionsDebug"] = "Mostrar informação de debug",
		["OptionsDebugTooltip"] = [=[Se você não está certo de como Pawn calcula os valores de um item particular, habilite esta opção para Pawn mostrar todos tipo de dados 'úteis' para o console do chat sempre que passar o mouse sobre um item.  Esta informação inclui que atributos o Pawn acha que o ítem tem, que partes de item Pawn não entende, e como cada um entrou no calculo para a sua escala.

Esta opção vai preencher o seu registro de chat rapidamente, então você deve desliga-lo assim que você terminar de investigar.

Atalhos:
/pawn debug on
/pawn debug off]=],
		["OptionsHeader"] = "Ajustar opções do Pawn",
		--Translation missing 
		["OptionsIgnoreGemsWhileLevelingCheck"] = "Ignore sockets on low-level items",
		--Translation missing 
		["OptionsIgnoreGemsWhileLevelingCheckTooltip"] = [=[Enable this option to have Pawn ignore sockets on low-level items when calculating item values, since most people do not go to the effort or expense of socketing items while still leveling.  A "low-level" item is one weaker than what can be obtained in a heroic dungeon at the level cap.

If checked, Pawn's socketing advisor will still suggest appropriate gems for low-level items, but sockets will be ignored in calculations and socketed items will not show up as upgrades as often.

If unchecked, Pawn will calculate values for items as if they were socketed in the way that maximizes the item's value, regardless of the item's level.]=],
		--Translation missing 
		["OptionsIgnoreItemUpgradesCheck"] = "Ignore valor and baleful upgrades",
		--Translation missing 
		["OptionsIgnoreItemUpgradesCheckTooltip"] = [=[Enable this option to have Pawn ignore the potential for Valor upgrades and Empowered Baleful items when calculating item values.

If checked, Pawn will treat upgradeable items as they are and will not assume that you would use Valor and Empowered Apexis Fragments to improve the item when determining whether an item is better than what you currently have.

If unchecked, Pawn will treat those items assuming that you would maximize their potential with Valor and Empowered Apexis Fragments.  This could cause a level 650 baleful item to appear as a significant upgrade over a level 670 item from Blackrock Foundry, since the baleful item could potentially be improved to level 705 through valor and Apexis.]=],
		["OptionsInventoryIcon"] = "Mostrar ícones de inventário",
		["OptionsInventoryIconTooltip"] = "Habilite esta opção para mostrar ícones de inventário próximo ao link de janela de item.",
		["OptionsItemIDs"] = "Mostrar ID de items",
		["OptionsItemIDsTooltip"] = [=[Habilite esta opção para o Pawn mostrar o ID de cada item que você ver, como também ID de todos encantamentos e gemas.

Cada item no World of Warcraft tem um número de ID associado a ele.  Esta informação é geralmente somente útil para criadores de mod.]=],
		["OptionsLootAdvisor"] = "Mostrar Assessor de upgrade de Items",
		["OptionsLootAdvisorTooltip"] = "Quando um item cai de uma masmorra e é um upgrade para seu personagem, Pawn vai mostrar uma popup anexada a janela de loot dizendo para você sobre o upgrade.",
		["OptionsOtherHeader"] = "Outras opções",
		["OptionsQuestUpgradeAdvisor"] = "Mostrar Assessor de upgrade de missão",
		["OptionsQuestUpgradeAdvisorTooltip"] = "No histórico de missões enquanto você fala com um 'NPC', se alguma recompensa de quest é um upgrade para seu equipamente, Pawn vai mostrar uma seta verde no item.  Se nenhum item é upgrade, Pawn vai mostrar uma pilha de ouro mostrando que este item vale mais ser vendido para um vendedor.",
		--Translation missing 
		["OptionsShowRelicUpgrades"] = "Show relic advisor",
		--Translation missing 
		["OptionsShowRelicUpgradesTooltip"] = "Pawn will show you when a relic would increase the item level of one of your artifact weapons.  (This works differently from other upgrade features, since it's based on item level, not stats.)",
		["OptionsResetUpgrades"] = "Re-escanear",
		["OptionsResetUpgradesTooltip"] = [=[Pawn vai esquecer o que conhece sobre seus melhores items que você equipou e re-escanear seu equipamento para promover informações de upgrade no futuro.

Use esta característica se você achar que o Pawn está fazendo sugestões de upgrades incorretas como resultado de items que você vendeu, destruiu ou não usa mais.  Isto vai afetar todos os personagens que usam Pawn.]=],
		["OptionsSocketingAdvisor"] = "Mostrar Assessor de engastes",
		["OptionsSocketingAdvisorTooltip"] = "Quando adicionar gemas em um item, Pawn vai mostrar uma popup sugerindo gemas que você pode engastar em um item que irá melhora-lo.  (Para ser a lista completa de sugestões para cada cor, veja a aba Gemas, onde você também pode alterar a qualidade das gemas que ira utilizar.)",
		["OptionsTab"] = "Opções",
		["OptionsTooltipHeader"] = "Opções de tooltip",
		--Translation missing 
		["OptionsTooltipSpecIcon"] = "Show spec icons",
		--Translation missing 
		["OptionsTooltipSpecIconTooltip"] = "Enable this option to show spec icons next to scale names on tooltips.",
		["OptionsTooltipUpgradesOnly"] = "Somente mostrar upgrades",
		["OptionsTooltipUpgradesOnlyTooltip"] = [=[Esta é a opção mais simples.  Somente mostra porcentagem de upgrade de um item para seu equipamento, e indica quais items são melhores para sua própria escala.  Não mostra nada sobre items fracos.

|cff8ec3e6Fire:|r  |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% upgrade|r

...ou...

|cff8ec3e6Fogo:  seu melhor|r]=],
		["OptionsTooltipValuesAndUpgrades"] = "Mostrar valores de escala e % de upgrade",
		["OptionsTooltipValuesAndUpgradesTooltip"] = [=[Mostra valores do Pawn em todas as escalas visíveis em todos os items, exceto naqueles que tem um valor de zero.  Também indica quais items são upgrades para seu equipamento atual.

|cff8ec3e6Gelo:  123.4
Fogo:  156.7 |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% upgrade|r]=],
		["OptionsTooltipValuesOnly"] = "Mostrar somente valores de escala, sem % de upgrade",
		["OptionsTooltipValuesOnlyTooltip"] = [=[Mostra valores do Pawn em todas as escalas visíveis em todos os items, exceto naqueles que tem um valor de zero.  Não indica quais items são upgrades para seu equipamento atual.

|cff8ec3e6Gelo:  123.4
Fire:  156.7|r]=],
		["OptionsUpgradeHeader"] = "Mostrar |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t upgrades nos tooltips:",
		--Translation missing 
		["OptionsUpgradeSettingsHeader"] = "Upgrade options",
		["OptionsUpgradesForBothWeaponTypes"] = "Mostrar upgrades para ambas armas de uma mão e duas mãos",
		["OptionsUpgradesForBothWeaponTypesTooltip"] = [=[Pawn assessor de upgrade deve monitorar e sugerir upgrades para armas de duas mãos e dupla de arma (ou para magos, arma de mão principal e enfeites de mão secundária) sets de armas separados.

Se marcado, você pode estar usando uma arma de duas mãos e claramente ver armas de uma mão como upgrades se eles são melhores (ou segundo melhores) da sua arma de uma mão anterior, porque Pawn monitora upgrades separadamente para sets de duas armas.

Se desmarcado, equpar uma arma de duas mãos vai prevenir que Pawn mostra upgrades para armas de uma mão e vice-versa.]=],
		--Translation missing 
		["OptionsUpgradeTrackingHeader"] = "Upgrade comparisons:",
		--Translation missing 
		["OptionsUpgradeTrackingOff"] = "Versus equipped gear (recommended)",
		--Translation missing 
		["OptionsUpgradeTrackingOffTooltip"] = "Pawn will show you items that are an upgrade compared to the items that you currently have equipped.",
		--Translation missing 
		["OptionsUpgradeTrackingOn"] = "Track for each scale (advanced)",
		--Translation missing 
		["OptionsUpgradeTrackingOnTooltip"] = "(For advanced users.)  Pawn will try to track the best items that you've equipped, independently for each scale that you have enabled, and show you items that are an upgrade compared to those.",
		["OptionsWelcome"] = "Configure Pawn do jeito que deseja.  Mudanças terão efeito imediatamente.",
		--Translation missing 
		["ScaleAutoOff"] = "Manual",
		--Translation missing 
		["ScaleAutoOff2"] = "Let me manage scales.",
		--Translation missing 
		["ScaleAutoOffTooltip"] = "Pawn will let you manually choose which scales to use for its calculations, allowing you to enable more than one scale at a time, add custom scales, and more.",
		--Translation missing 
		["ScaleAutoOn"] = "Automatic",
		--Translation missing 
		["ScaleAutoOn2"] = "Just show my current spec.",
		--Translation missing 
		["ScaleAutoOnTooltip"] = "Pawn will automatically show your current specialization in item tooltips, and use that to make recommendations and suggest upgrades.",
		--Translation missing 
		["ScaleAutoWelcome"] = [=[Pawn will show suggestions for your current specialization.

If you'd rather manage things on your own, just click Manual below.]=],
		["ScaleChangeColor"] = "Mudar cor",
		["ScaleChangeColorTooltip"] = "Mudar a cor de nome e valores da escala que aparecem nos tooltips.",
		["ScaleCopy"] = "Copiar",
		["ScaleCopyTooltip"] = "Criar uma nova escala copiando esta.",
		["ScaleDefaults"] = "Padrões",
		["ScaleDefaultsTooltip"] = "Criar uma nova escala fazendo uma cópia dos padrões.",
		["ScaleDeleteTooltip"] = [=[Deletar esta escala.

Este comando não pode ser desfeito]=],
		["ScaleEmpty"] = "Vazia",
		["ScaleEmptyTooltip"] = "Cria uma nova escala em branco.",
		["ScaleExport"] = "Exportar",
		["ScaleExportTooltip"] = "Compartilhe sua escala com outros na internet.",
		["ScaleHeader"] = "Gerenciar suas escalas do Pawn",
		["ScaleImport"] = "Importar",
		["ScaleImportTooltip"] = "Adicionar uma nova escala colando outra tag de escala da internet.",
		["ScaleNewHeader"] = "Criar uma nova escala",
		["ScaleRename"] = "Renomear",
		["ScaleRenameTooltip"] = "Renomeia esta escala.",
		["ScaleSelectorHeader"] = "Selecione uma escala:",
		--Translation missing 
		["ScaleSelectorShowingSuggestionsFor"] = "Showing suggestions for",
		["ScaleSelectorShowScale"] = "Mostrar escala nos tooltips",
		["ScaleSelectorShowScaleTooltip"] = [=[Quando esta opção esta marcada, valores para cada escala vão ser mostrados no tooltips de items para este personagem.  Cada esclaa pode mostrar até uma para cada um do seu personagem, multiplos personagens, ou nenhum personagem,

Atalho: Shift+clique em uma escala]=],
		["ScaleShareHeader"] = "Compartilhar suas escalas",
		["ScaleTab"] = "Escala",
		["ScaleTypeNormal"] = "Você pode mudar esta escala na aba Valores",
		["ScaleTypeReadOnly"] = "Você deve fazer uma cópia desta escala se você quiser personaliza-la.",
		["ScaleWelcome"] = "Escalas que são conjunto de atributos e valores usados para distribuir pontos em items.  Você pode personalizaor seu próprio ou usar valores de escala que outros criaram.",
		["SocketingAdvisorButtonTooltip"] = "Clique para abrir a aba de Gemas do Pawn, onde você pode encontrar mais informação sobre gemas que o Pawn recomenda.",
		["SocketingAdvisorHeader"] = "Pawn Assessor de engaste sugere:",
		--Translation missing 
		["SocketingAdvisorIgnoreThisItem"] = "Don't bother adding gems to this low-level item.  But if you do, use these:",
		--Translation missing 
		["StarterProvider"] = "Starter scales",
		["ValuesDoNotShowUpgradesFor1H"] = "Não mostrar upgrades para armas de uma mão",
		["ValuesDoNotShowUpgradesFor2H"] = "Não mostrar upgrades para armas de duas mãos",
		["ValuesDoNotShowUpgradesTooltip"] = "Habilite esta opção para esconder upgrades deste tipo de item.  Exemplo, mesmo se tankers paladinos podem usar armas de duas mãos, uma arma de duas mãos nunca é um upgrade para um set tanker de paladino, então Pawn não deve mostrar notificações de ugprade para ele.  Similarmente, paladinos retribuição podem usar armas de uma mão, mas nunca serão upgrades.",
		["ValuesFollowSpecialization"] = "Somente mostrar upgrades para meu melhor tipo de armadura depois do nível 50",
		["ValuesFollowSpecializationTooltip"] = "Habilite esta opção para esconder ugprades para armaduras que sua classe não tem especialização depois do nível 50.  Exemplo, um nível 50 paladino sagrado aprende especialização em placa, que aumenta seu intelecto em 5% usando somente armaduras de placa.  Quando esta opção é marcada Pawn nunca vai considerar tecido, couro ou malha para upgrades em paladinos sagrados acima de nível 50.",
		["ValuesHeader"] = "Escalar valores para %s",
		["ValuesIgnoreStat"] = "Items com isso não são usáveis",
		["ValuesIgnoreStatTooltip"] = "Habilite esta opção para causar qualquer item com este atributo não pegar valores para esta escala.  Por exemplo, xamãs nao podem usar placas, então uma escala desenhada para xamã pode marcar placa com não usável e armaduras de placa não pegam valores para esta escala.",
		["ValuesNormalize"] = "Normalizar valores (como Wowhead)",
		["ValuesNormalizeTooltip"] = [=[Habilite esta opção para dividir o valor de calculo final para um item de mesma soma para todos valores de atribudos na escala, como Wowhead e Lootzor fazem.  Isto ajuda em situações em que atributos perto de 1 e outros valores perto de 5.  Também ajuda manter números pequenos.

Para mais informação nesta opção, veja o arquivo leia-me.]=],
		["ValuesRemove"] = "Remover",
		["ValuesRemoveTooltip"] = "Remover este atributo da escala.",
		["ValuesTab"] = "Valores",
		["ValuesWelcome"] = "Você pode personalizar os valores que são designados para cada atributo nesta escala.  Para genreciar esta escala e adicionar novos, use a aba Escalas.",
		["ValuesWelcomeNoScales"] = "Você pode não ter uma escala selecionada.  Para começar, vá para a aba de Escala e comece uma nova escala ou cole uma da internet.",
		["ValuesWelcomeReadOnly"] = "A escala que você selecionou não pode ser mudada.  Se você quer mudar os valores, vá para a aba Escala e crie uma cópia desta escala ou comece uma nova."
	}
}
end

if GetLocale() == "ptBR" then
	PawnUseThisLocalization()
end

-- After using this localization or deciding that we don't need it, remove it from memory.
PawnUseThisLocalization = nil
