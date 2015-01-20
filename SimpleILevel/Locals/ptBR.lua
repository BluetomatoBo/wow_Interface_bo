local L = LibStub("AceLocale-3.0"):NewLocale("SimpleILevel", "ptBR");

if not L then return end

L.core = {
	ageDays = "%s dias",
	ageHours = "%s horas", -- Needs review
	ageMinutes = "%s minutos",
	ageSeconds = "%s segundos",
	desc = "Incluir iLevel Medio (AiL) na dica de infrmação dos players",
	load = "Lendo v%s ...",
	minimapClick = "iLevelSimples - Clique para detalhes",
	minimapClickDrag = "Clique e mova o ícone",
	name = "iLevelSimples",
	purgeNotification = "Limpa %s pessoas do seu cache de informações",
	purgeNotificationFalse = "Voçê nao pussui configuração de auto limpeza",
	scoreDesc = "Este é o iLevel medio de seus itens equipados",
	scoreYour = "Seu AiL atrual é %s",
	slashClear = "Limpeza de ajustes",
	slashGetScore = "Este %s possui o seguinte AiL %s baseado em informacoes de %s atras",
	slashGetScoreFalse = "Desculpe, houve um erro ao tentar pegar o score deste %s",
	slashTargetScore = "%s tem um AiL de %s",
	slashTargetScoreFalse = "Desculpe, ouve um erro ao tentar capturar o score deste player",
	ttAdvanced = "%s atrás",
	ttLeft = "iLevel Medio:",
	options = {
		autoscan = "Auto Scan",
		autoscanDesc = "Faz automaticamente alterações de scan em Paty ou Raid ",
		clear = "Limpar Configurações",
		clearDesc = "Limpar as configurações do cache",
		color = "Cor do Score",
		colorDesc = "Cor apropriada para o AiL, Desabilite e informará apenas o Score em Branco e Cinza",
		get = "Pegando Score...",
		getDesc = "Pegar o Ilv do nome em cache",
		ldb = "Opções LDB",
		ldbRefresh = "Taxa de atualização",
		ldbRefreshDesc = "Atualizar a LDB a cada quantos segundos",
		ldbSource = "Origem / Marca da LDB",
		ldbSourceDesc = "Mostrar um registro de dados de origem para a pontuação LDB.",
		ldbText = "Base da LDB",
		ldbTextDesc = "LDB on/off , o salvará com recursos minimos",
		maxAge = "Idade maxima de Cache",
		maxAgeDesc = "Define a quantidade de tempo para fazer nova inspeção",
		minimap = "Mostrar o botao no minimap",
		minimapDesc = "Altera o modo de exibição do botão no minimap",
		modules = "Lendo Modulos...",
		modulesDesc = "Para que estas alterações tenham efeito voce precisará dar reloar em sua UI,  com os cosmando /UI  ou /console reloadui.",
		name = "Opçoes gerais Ilv",
		open = "Abrir as opções de SiL",
		options = "SiL Opções",
		paperdoll = "Mostra as Informações de seu char",
		paperdollDesc = "Mostra seu Ilv no painel de visualizacao de seu char",
		purge = "Limpar Cache",
		purgeAuto = "Limpa o Cache automaticamente",
		purgeAutoDesc = "Limpa automaticamente o Cache que possui mais de # dias. 0 é nunca",
		purgeDesc = "Limpar todo cache que possui mais de %s dias",
		purgeError = "Por Favor, entre com o número de dias",
		round = "Arredondar iLevel",
		roundDesc = "Arredondar iLevel para um numero aproximado",
		target = "Pega o Score do Target...",
		targetDesc = "Verificar Ilv do target atual",
		ttAdvanced = "Dicas Avançadas",
		ttAdvancedDesc = "Ferramentas de dicas Avançada",
		ttCombat = "Dicas em combate",
		ttCombatDesc = "Mostra a SiL informação nas dicas de combate",
	},
}
L.group = {
	addonName = "Ilevel Simpes - Grupo",
	desc = "Ve o AiL de todos em seu Grupo ",
	load = "Módulo de Grupo Carregado",
	name = "Grupo SiL",
	nameShort = "Grupo",
	outputHeader = "iLevel Simples: Media do Grupo - %s",
	outputNoScore = "%s nao esta disponível",
	outputRough = "* as doações estao por volta da seguinte meta.",
	options = {
		group = "Score do Grupo",
		groupDesc = "Envia o score do seu grupo para <%s>.",
	},
}
L.resil = {
	addonName = "Ilevel Simples - Resiliência",
	desc = "Mostra o valor de GEAR PVP que os outros players tem equipado em seu grupo",
	load = "Módulo de Resiliência Carregado",
	name = "Ilv Resiliência",
	nameShort = "Resiliência",
	outputHeader = "Ilevel Simples: Media do Grupo para PVP GEAR",
	outputNoScore = "%s nao esta disponivel",
	outputRough = "* denota um score aproximado",
	ttPaperdoll = "Você tem % s / % s itens com uma classificação % s de resiliência",
	ttPaperdollFalse = "Atualmente você não possui itens de PVP equipados ",
	options = {
		cinfo = "Mostra informações do Char",
		cinfoDesc = "Mostra o Simpleilevel do status de resiliência no painel",
		group = "Score do Grupo PVP",
		groupDesc = "Informa  o PVP Score do Grupo para <%s>.",
		name = "Opções de Ilv resiliência ",
		pvpDesc = "Mostra a GEAR de PVP de todos em seu grupo",
		ttType = "Tipo da Dica",
		ttZero = "Sem dicas",
		ttZeroDesc = "Mostra a informação nas dicas toda vez que houver GEAR de PVP",
	},
}
L.social = {
	addonName = "iLevel Simples - Social",
	desc = "Inclui o AiL na janela de Chat em varios canais",
	load = "Módulo Social Carregado",
	name = "Social SiL",
	nameShort = "Social",
	options = {
		chatEvents = "Mostrar Score em:",
		color = "Cor do Score",
		colorDesc = "Cor do Score nas telas de Chat",
		enabled = "Aberto",
		enabledDesc = "Abrir todas as opções ou SiL Social",
		name = "Social SiL Opções",
	},
}


