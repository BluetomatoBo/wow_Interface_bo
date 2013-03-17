local L = LibStub("AceLocale-3.0"):NewLocale("SimpleILevel", "ptBR");

if not L then return end

L.core = {
	ageDays = "%s dias", -- Needs review
	ageHours = "%s horas", -- Needs review
	ageMinutes = "%s minutos", -- Needs review
	ageSeconds = "%s segundos", -- Needs review
	desc = "Incluir iLevel Medio (AiL) na informacção flutuante dos players", -- Needs review
	load = "Lendo v%s", -- Needs review
	minimapClick = "iLevelSimples - Clique para detalhes", -- Needs review
	minimapClickDrag = "Clique e mova o ícone", -- Needs review
	name = "iLevel Simples", -- Needs review
	purgeNotification = "Limpa %s pessoas do seu cache de informações", -- Needs review
	purgeNotificationFalse = "Voçê nao pussui configuração de auto limpeza", -- Needs review
	scoreDesc = "Este é o iLevel medio de seus itens equipados", -- Needs review
	scoreYour = "Seu AiL atrual é %s", -- Needs review
	slashClear = "Limpeza de ajustes", -- Needs review
	slashGetScore = "Este %s possui o seguinte %s baseado em informacoes de %s dias atras", -- Needs review
	slashGetScoreFalse = "Desculpe, houve um erro ao tentar pegar o score deste %s", -- Needs review
	slashTargetScore = "Este %s tem de %s", -- Needs review
	slashTargetScoreFalse = "Desculpe, ouve um erro ao tentar capturar o score deste player", -- Needs review
	ttAdvanced = "%s atras", -- Needs review
	ttLeft = "iLevel Medio:", -- Needs review
	options = {
		autoscan = "Autoscan", -- Needs review
		autoscanDesc = "Faz automaticamente alterações de scan em Paty ou raid ", -- Needs review
		clear = "Limpar Configurações", -- Needs review
		clearDesc = "Limpar as configurações do cache", -- Needs review
		color = "Color Score", -- Requires localization
		colorDesc = "Color the AiL where appropriate. Disable this if you only want to see white and gray scores.", -- Requires localization
		get = "Pegando Score", -- Needs review
		getDesc = "Pegar o AiL do nome em cache", -- Needs review
		ldb = "Opções LDB", -- Needs review
		ldbRefresh = "Taxa de atualização", -- Needs review
		ldbRefreshDesc = "Atualizar a LDB a cada quantos segundos", -- Needs review
		ldbSource = "Tamanho do Banco", -- Needs review
		ldbSourceDesc = "Ajuda na descrição do LDB", -- Needs review
		ldbText = "Limpa o tesxo da LDB", -- Needs review
		ldbTextDesc = "Limpa LDB e o desliga, o tornara  com recursos minimos", -- Needs review
		maxAge = "Idade maxima de Cache", -- Needs review
		maxAgeDesc = "Define a quantidade de tempo para fazer nova inspeção", -- Needs review
		minimap = "Mostrar o botao no minimap", -- Needs review
		minimapDesc = "Altera o modo de exibição do botão no minimap", -- Needs review
		modules = "Load Modules", -- Requires localization
		modulesDesc = "For these changes to take effect you need to reload your UI with /rl or /console reloadui.", -- Requires localization
		name = "Opçoes gerais", -- Needs review
		open = "Abrui as opções da UI", -- Needs review
		options = "SiL Opções", -- Needs review
		paperdoll = "Mostra as Informações de seu char", -- Needs review
		paperdollDesc = "Mostra seu AiL no painel de visualizacao de seu char", -- Needs review
		purge = "Limpar Cache", -- Needs review
		purgeAuto = "Limpa o Cache automaticamente", -- Needs review
		purgeAutoDesc = "Limpau automaticament e o Cache que possui mais de # dias. 0 é nunca", -- Needs review
		purgeDesc = "Limpar todo cache que possui mais de %s dias", -- Needs review
		purgeError = "Por Favor, entre com  o numero de dias", -- Needs review
		round = "Round iLevel", -- Requires localization
		roundDesc = "Round the iLevel to the nearest whole number", -- Requires localization
		target = "Pega o Score do Target", -- Needs review
		targetDesc = "Verificar AiL do target atual", -- Needs review
		ttAdvanced = "Dicas Avançadas", -- Needs review
		ttAdvancedDesc = "Ferramentas de dicas Avançada", -- Needs review
		ttCombat = "Tooltip in Combat", -- Requires localization
		ttCombatDesc = "Show the SiL information on the tooltip while in combat", -- Requires localization
	},
}
L.group = {
	addonName = "Simple iLevel - Group", -- Requires localization
	desc = "View the AiL of everyone in your group", -- Requires localization
	load = "Group Module Loaded", -- Requires localization
	name = "SiL Group", -- Requires localization
	nameShort = "Group", -- Requires localization
	outputHeader = "iLevel Simples: Media do Grupo - %s", -- Needs review
	outputNoScore = "%s nao esta disponível", -- Needs review
	outputRough = "* as doações estao por volta da seguinte meta.", -- Needs review
	options = {
		group = "Score do Grupo", -- Needs review
		groupDesc = "Envia o score do seu grupo para <%s>.", -- Needs review
	},
}
L.resil = {
	addonName = "Simple iLevel - Resilience", -- Requires localization
	desc = "Shows the amount of PvP gear other players have equipped in the tooltip", -- Requires localization
	load = "Resilience Module Loaded", -- Requires localization
	name = "SiL Resilience", -- Requires localization
	nameShort = "Resilience", -- Requires localization
	outputHeader = "Simple iLevel: Group Average PvP Gear %s", -- Requires localization
	outputNoScore = "%s is not available", -- Requires localization
	outputRough = "* denotes an approximate score", -- Requires localization
	ttPaperdoll = "You have %s/%s items with a %s resilience rating.", -- Requires localization
	ttPaperdollFalse = "You currently do not have any PvP items equiped.", -- Requires localization
	options = {
		cinfo = "Show on Character Info", -- Requires localization
		cinfoDesc = "Shows your SimpleiLevel Resilience score on the stats pane.", -- Requires localization
		group = "Group PvP Score", -- Requires localization
		groupDesc = "Prints the PvP Score of your group to <%s>.", -- Requires localization
		name = "SiL Resilience Options", -- Requires localization
		pvpDesc = "Displayed the PvP gear of everyone in your group.", -- Requires localization
		ttType = "Tooltip Type", -- Requires localization
		ttZero = "Zero Tooltip", -- Requires localization
		ttZeroDesc = "Shows information in the tooltip even if they have no PvP gear.", -- Requires localization
	},
}
L.social = {
	addonName = "Simple iLevel - Social", -- Requires localization
	desc = "Added the AiL to chat windows for various channels", -- Requires localization
	load = "Social Module Loaded", -- Requires localization
	name = "SiL Social", -- Requires localization
	nameShort = "Social", -- Requires localization
	options = {
		chatEvents = "Show Score On:", -- Requires localization
		color = "Color Score", -- Requires localization
		colorDesc = "Color the score in the chat windows.", -- Requires localization
		enabled = "Enabled", -- Requires localization
		enabledDesc = "Enable all features or SiL Social.", -- Requires localization
		name = "SiL Social Options", -- Requires localization
	},
}


