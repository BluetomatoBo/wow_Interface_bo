local L = LibStub("AceLocale-3.0"):NewLocale("WorldQuestTrackerAddon", "ptBR") 
if not L then return end 

L["S_APOWER_AVAILABLE"] = "Disponível"
L["S_APOWER_NEXTLEVEL"] = "Próximo nível"
L["S_DECREASESIZE"] = "Diminuir Tamanho"
L["S_ENABLED"] = "Ativado"
L["S_ERROR_NOTIMELEFT"] = "Esta missão expirou."
L["S_ERROR_NOTLOADEDYET"] = "Esta missão não foi carregada ainda, por favor aguarde alguns segundos."
L["S_FACTION_TOOLTIP_SELECT"] = "Clique: selecione esta facção."
L["S_FACTION_TOOLTIP_TRACK"] = "Shift + Clique: rastreie as missões desta facção."
L["S_FLYMAP_SHOWTRACKEDONLY"] = "Apenas Rastreadas"
L["S_FLYMAP_SHOWTRACKEDONLY_DESC"] = "Mostrar apenas missões que estão sendo rastreadas."
L["S_FLYMAP_SHOWWORLDQUESTS"] = "Mostrar Missões Mundiais"
L["S_GROUPFINDER_ACTIONS_CANCEL_APPLICATIONS"] = "clique para cancelar aplicações..."
L["S_GROUPFINDER_ACTIONS_CANCELING"] = "cancelando..."
L["S_GROUPFINDER_ACTIONS_CREATE"] = [=[nenhum grupo encontrado?
clique para criar um]=]
L["S_GROUPFINDER_ACTIONS_CREATE_DIRECT"] = "criar grupo"
L["S_GROUPFINDER_ACTIONS_LEAVEASK"] = "Sair do grupo?"
L["S_GROUPFINDER_ACTIONS_LEAVINGIN"] = "Saindo do grupo em (clique para sair agora):"
L["S_GROUPFINDER_ACTIONS_RETRYSEARCH"] = "repetir busca"
L["S_GROUPFINDER_ACTIONS_SEARCH"] = "clique para iniciar busca por grupos"
L["S_GROUPFINDER_ACTIONS_SEARCH_RARENPC"] = "procurar por grupo para matar este raro"
L["S_GROUPFINDER_ACTIONS_SEARCH_TOOLTIP"] = "Entre em um grupo que está fazendo esta missão"
L["S_GROUPFINDER_ACTIONS_SEARCHING"] = "buscando..."
L["S_GROUPFINDER_ACTIONS_SEARCHMORE"] = "clique para buscar por mais jogadores para o grupo"
L["S_GROUPFINDER_ACTIONS_SEARCHOTHER"] = "Sair e buscar outro grupo?"
L["S_GROUPFINDER_ACTIONS_UNAPPLY1"] = "clique para remover a aplicação e criar um grupo novo"
L["S_GROUPFINDER_ACTIONS_UNLIST"] = "clique para deslistar o seu grupo"
L["S_GROUPFINDER_ACTIONS_UNLISTING"] = "deslistando..."
L["S_GROUPFINDER_ACTIONS_WAITING"] = "esperando..."
L["S_GROUPFINDER_AUTOOPEN_RARENPC_TARGETED"] = "Abrir automaticamente ao Selecionar um Raro"
L["S_GROUPFINDER_ENABLED"] = "Abrir esta janela automaticamente em uma nova missão"
L["S_GROUPFINDER_LEAVEOPTIONS"] = "Opções de sair do grupo"
L["S_GROUPFINDER_LEAVEOPTIONS_AFTERX"] = "Sair Depois de X Segundos"
L["S_GROUPFINDER_LEAVEOPTIONS_ASKX"] = "Não sair automaticamente, apenas perguntar durante X segundos"
L["S_GROUPFINDER_LEAVEOPTIONS_DONTLEAVE"] = "Não mostrar painel de sair do grupo"
L["S_GROUPFINDER_LEAVEOPTIONS_IMMEDIATELY"] = "Sair imediatamente após completar a missão"
L["S_GROUPFINDER_NOPVP"] = "Evitar servidores JxJ"
L["S_GROUPFINDER_OT_ENABLED"] = "Mostrar botões na listagem de objetivos"
L["S_GROUPFINDER_QUEUEBUSY"] = "você já está em uma fila."
L["S_GROUPFINDER_QUEUEBUSY2"] = "Não foi possível mostrar a janela do Localizador de grupo: você já está no grupo ou na fila."
L["S_GROUPFINDER_RESULTS_APPLYING"] = "Faltam %d grupos para aplicar, clique novamente"
L["S_GROUPFINDER_RESULTS_APPLYING1"] = "Falta um grupo para aplicar, clique novamente"
L["S_GROUPFINDER_RESULTS_FOUND"] = [=[%d grupos encontrados
clique para iniciar as aplicações]=]
L["S_GROUPFINDER_RESULTS_FOUND1"] = [=[1 grupo encontrado
clique para entrar no grupo]=]
L["S_GROUPFINDER_RESULTS_UNAPPLY"] = "%d aplicações restantes..."
L["S_GROUPFINDER_RIGHTCLICKCLOSE"] = "botão direito para fechar este painel"
L["S_GROUPFINDER_SECONDS"] = "Segundos"
L["S_GROUPFINDER_TITLE"] = "Localizador de Grupos"
L["S_GROUPFINDER_TUTORIAL1"] = "Faça missões mundiais mais rápido ao se juntar a um grupo que está fazendo a mesma missão!"
L["S_INCREASESIZE"] = "Aumentar Tamanho"
L["S_MAPBAR_FILTER"] = "Filtros"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES"] = "Objetivos de facções"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES_DESC"] = "Mostra missões de facções mesmo que tenham sido excluídas por filtros."
L["S_MAPBAR_OPTIONS"] = "Opções"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED"] = "Velocidade de atualização da seta"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_HIGH"] = "Rápida"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_MEDIUM"] = "Média"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_REALTIME"] = "Em tempo real"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_SLOW"] = "Lenta"
L["S_MAPBAR_OPTIONSMENU_EQUIPMENTICONS"] = "Ícones de equipamentos"
L["S_MAPBAR_OPTIONSMENU_QUESTTRACKER"] = "Habilitar Listagem de Missões"
L["S_MAPBAR_OPTIONSMENU_REFRESH"] = "Recarregar"
L["S_MAPBAR_OPTIONSMENU_SOUNDENABLED"] = "Habilitar som"
--[[Translation missing --]]
--[[ L["S_MAPBAR_OPTIONSMENU_STATUSBAR_ONDISABLE"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_MAPBAR_OPTIONSMENU_STATUSBAR_VISIBILITY"] = ""--]] 
L["S_MAPBAR_OPTIONSMENU_STATUSBARANCHOR"] = "Ancorar ao topo"
L["S_MAPBAR_OPTIONSMENU_TOMTOM_WPPERSISTENT"] = "Ponto persistente"
L["S_MAPBAR_OPTIONSMENU_TRACKER_CURRENTZONE"] = "Apenas zona atual"
L["S_MAPBAR_OPTIONSMENU_TRACKER_SCALE"] = "Escala do rastreador: %s"
L["S_MAPBAR_OPTIONSMENU_TRACKERCONFIG"] = "Ajustes do rastreador"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_AUTO"] = "Posição automática"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_CUSTOM"] = "Posição manual"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_LOCKED"] = "Trancado"
L["S_MAPBAR_OPTIONSMENU_UNTRACKQUESTS"] = "Parar de listar tudo"
L["S_MAPBAR_OPTIONSMENU_WORLDMAPCONFIG"] = "Ajustes do Mapa Mundi"
L["S_MAPBAR_OPTIONSMENU_YARDSDISTANCE"] = "Mostrar Distância"
L["S_MAPBAR_OPTIONSMENU_ZONE_QUESTSUMMARY"] = "Resumo de missões (tela cheia)"
L["S_MAPBAR_OPTIONSMENU_ZONEMAPCONFIG"] = "Ajustas do Mapa Zona"
L["S_MAPBAR_RESOURCES_TOOLTIP_TRACKALL"] = "Clique para rastrear: |cFFFFFFFF%s|r quests."
L["S_MAPBAR_SORTORDER"] = "Ordem"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_FADE"] = "Usar Trasparência"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_OPTION"] = "Menos De %d Horas"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SHOWTEXT"] = "Texto do Tempo Restante"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SORTBYTIME"] = "Ordem por Tempo"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_TITLE"] = "Tempo Restante"
L["S_MAPBAR_SUMMARY"] = "Sumário"
L["S_MAPBAR_SUMMARYMENU_ACCOUNTWIDE"] = "Na Conta"
L["S_MAPBAR_SUMMARYMENU_MOREINFO"] = "botão esquerdo: mostrar mais"
L["S_MAPBAR_SUMMARYMENU_NOATTENTION"] = [=[Nenhuma quest sendo rastreadas nos seus demais personagens
tem menos de 2 horas de tempo restante.]=]
L["S_MAPBAR_SUMMARYMENU_REQUIREATTENTION"] = "Requer Atenção"
L["S_MAPBAR_SUMMARYMENU_TODAYREWARDS"] = "Conquistas de Hoje"
L["S_MAPFRAME_ALIGN_CENTER"] = "centro"
L["S_MAPFRAME_ALIGN_DESC"] = "|cFF22FF22Clique|r para alternar o alinhamento da janela do mapa do centro para a esquerda e da esquerda para o centro da sua tela."
L["S_MAPFRAME_ALIGN_LEFT"] = "esquerda"
--[[Translation missing --]]
--[[ L["S_OPTIONS_ANIMATIONS"] = ""--]] 
L["S_OPTIONS_MAPFRAME_ALIGN"] = "Janela do Mapa Centralizada"
--[[Translation missing --]]
--[[ L["S_OPTIONS_MAPFRAME_ERROR_SCALING_DISABLED"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_MAPFRAME_SCALE"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_MAPFRAME_SCALE_ENABLED"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_QUESTBLACKLIST"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_RESET"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_SHOWFACTIONS"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_TIMELEFT_NOPRIORITY"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_TRACKER_RESETPOSITION"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_WORLD_ANCHOR_LEFT"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_WORLD_ANCHOR_RIGHT"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_WORLD_DECREASEICONSPERROW"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_WORLD_INCREASEICONSPERROW"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_WORLD_ORGANIZE_BYMAP"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_WORLD_ORGANIZE_BYTYPE"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_OPTIONS_ZONE_SHOWONLYTRACKED"] = ""--]] 
L["S_OVERALL"] = "Em Geral"
L["S_PARTY"] = "Grupo"
L["S_PARTY_DESC1"] = "Uma estrela azul na quest significa que todos do grupo a possuem."
L["S_PARTY_DESC2"] = "Se uma estrela vermelha é mostrada, algum member do grupo não tem WQT instalado ainda."
L["S_PARTY_PLAYERSWITH"] = "Jogadores no grupo com WQT:"
L["S_PARTY_PLAYERSWITHOUT"] = "Jogadores no grupo sem WQT:"
L["S_QUESTSCOMPLETED"] = "Missões completadas"
L["S_QUESTTYPE_ARTIFACTPOWER"] = "Poder de Artefato"
L["S_QUESTTYPE_DUNGEON"] = "Masmorra"
L["S_QUESTTYPE_EQUIPMENT"] = "Equipamento"
L["S_QUESTTYPE_GOLD"] = "Ouro"
L["S_QUESTTYPE_PETBATTLE"] = "Batalha de Mascote"
L["S_QUESTTYPE_PROFESSION"] = "Profissão"
L["S_QUESTTYPE_PVP"] = "JxJ"
L["S_QUESTTYPE_RESOURCE"] = "Recursos"
L["S_QUESTTYPE_TRADESKILL"] = "Materiais"
L["S_RAREFINDER_ADDFROMPREMADE"] = "Adicionar Raros Encontrado em Grupos Premade"
L["S_RAREFINDER_NPC_NOTREGISTERED"] = "monstro raro não registrado no banco de dados"
L["S_RAREFINDER_OPTIONS_ENGLISHSEARCH"] = "Procurar Usando Nomes em Inglês"
L["S_RAREFINDER_OPTIONS_SHOWICONS"] = "Mostrar Ícones para Raros Ativos"
L["S_RAREFINDER_SOUND_ALWAYSPLAY"] = "Reproduzir mesmo quando os efeitos sonoros estão desativados"
L["S_RAREFINDER_SOUND_ENABLED"] = "Reproduzir Som para Raros no Mini Mapa"
L["S_RAREFINDER_SOUNDWARNING"] = "som reproduzido devido a um raro no minimapa, você pode desativar esse som no menu de opções > rato,localizar, sub-menu."
L["S_RAREFINDER_TITLE"] = "Procura  de Raros"
L["S_RAREFINDER_TOOLTIP_REMOVE"] = "Remover"
L["S_RAREFINDER_TOOLTIP_SEACHREALM"] = "Procurar em outros reinos"
L["S_RAREFINDER_TOOLTIP_SPOTTEDBY"] = "Visto Por"
L["S_RAREFINDER_TOOLTIP_TIMEAGO"] = "minutos atrás"
L["S_SUMMARYPANEL_EXPIRED"] = "EXPIRADA"
L["S_SUMMARYPANEL_LAST15DAYS"] = "Últimos 15 dias"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_ACCOUNT"] = "Estatísticas da Conta"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_CHARACTER"] = "Estatísticas do Personagem"
L["S_SUMMARYPANEL_OTHERCHARACTERS"] = "Outros Personagems"
L["S_TUTORIAL_AMOUNT"] = "indica a quantidade a receber"
L["S_TUTORIAL_CLICKTOTRACK"] = "Clique para rastrear a missão."
--[[Translation missing --]]
--[[ L["S_TUTORIAL_MAPALIGN"] = ""--]] 
L["S_TUTORIAL_PARTY"] = "Quando estiver em grupo, uma estrela azul é mostrada em missões em que todos do grupo estão!"
L["S_TUTORIAL_TIMELEFT"] = "indica o tempo restante (+4 horas, +90 minutos, +30 minutos, menos de 30 minutos)."
--[[Translation missing --]]
--[[ L["S_TUTORIAL_WORLDBUTTONS"] = ""--]] 
L["S_TUTORIAL_WORLDMAPBUTTON"] = "Este botão mostra o mapa das Ilhas Partidas."
L["S_UNKNOWNQUEST"] = "Missão desconhecida"
--[[Translation missing --]]
--[[ L["S_WORLDBUTTONS_SHOW_NONE"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_WORLDBUTTONS_SHOW_TYPE"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_WORLDBUTTONS_SHOW_ZONE"] = ""--]] 
--[[Translation missing --]]
--[[ L["S_WORLDBUTTONS_TOGGLE_QUESTS"] = ""--]] 
L["S_WORLDMAP_QUESTLOCATIONS"] = "Mostrar local da quest"
L["S_WORLDMAP_QUESTSUMMARY"] = "Mostrar resumo de quest"
L["S_WORLDMAP_TOOGLEQUESTS"] = "Alternar Missões"
--[[Translation missing --]]
--[[ L["S_WORLDMAP_TOOLTIP_TRACKALL"] = ""--]] 
L["S_WORLDQUESTS"] = "Missões Mundiais"

