local L = LibStub("AceLocale-3.0"):NewLocale("SimpleILevel", "ruRU");

if not L then return end

L.core = {
	ageDays = "дней назад", -- Needs review
	ageHours = "%s часов", -- Needs review
	ageMinutes = "%s минут", -- Needs review
	ageSeconds = "%s секунд", -- Needs review
	desc = "Добавлять средний iLvL (AiL) в подсказки игроков", -- Needs review
	load = "Загрузка v%s", -- Needs review
	minimapClick = "SimpleiLevel - Кликните для деталей", -- Needs review
	minimapClickDrag = "Кликните и потяните, для того, чтобы перетянуть иконку", -- Needs review
	name = "Simple iLevel",
	purgeNotification = "Удаляю %s игроков из кэша", -- Needs review
	purgeNotificationFalse = "Вы не включили авто очистку кэша", -- Needs review
	scoreDesc = "Это средний уровень всех Ваших экипированных вещей.", -- Needs review
	scoreYour = "Ваш средний уровень %s", -- Needs review
	slashClear = "Очистить настройки", -- Needs review
	slashGetScore = "%s AiL равен %s вычислен %s назад", -- Needs review
	slashGetScoreFalse = "Простите, произошла ошибка вычисления iLvL для %s", -- Needs review
	slashTargetScore = "%s AiL равен %s", -- Needs review
	slashTargetScoreFalse = "Простите, произошла ошибка при вычислении iLvL выделенной цели", -- Needs review
	ttAdvanced = "%s назад", -- Needs review
	ttLeft = "Средний уровень:", -- Needs review
	options = {
		autoscan = "Авто-сканирование", -- Needs review
		autoscanDesc = "Включить автоматическое сканирование членов группы\\рейда", -- Needs review
		clear = "Очистить Настройки", -- Needs review
		clearDesc = "Очистить все настройки и кэш", -- Needs review
		color = "Окрашивать Значение", -- Needs review
		colorDesc = "Окрашивать Средний Уровень Предметов, где подходит. Откоючите это, если вы хоите видеть только белые и серые значения.", -- Needs review
		get = "Рассчитать средний уровень экипировки", -- Needs review
		getDesc = "Показать средний уровень экипировки выделенного, если есть в кэше", -- Needs review
		ldb = "LDB Опции", -- Needs review
		ldbRefresh = "Обновить оценки", -- Needs review
		ldbRefreshDesc = "Как часто должен обновляться LDB в секуднах", -- Needs review
		ldbSource = "Название ресурса", -- Needs review
		ldbSourceDesc = "Показывать название ресурсной базы в LDB очках", -- Needs review
		ldbText = "Включить LDB текст", -- Needs review
		ldbTextDesc = "Переключить LDB в влючен или выключен, это поможет сэкономить немного системных ресурсов (полезно для слабых PC)", -- Needs review
		maxAge = "Максимальный размер кэша", -- Needs review
		maxAgeDesc = "Выставите количество времени обновления кэша между проверками", -- Needs review
		minimap = "Показать иконку у мини-карты", -- Needs review
		minimapDesc = "Установки отображения иконки на мини-карте", -- Needs review
		modules = "Загружать Модули", -- Needs review
		modulesDesc = "Чтобы эти изменения вступили в силу вы должны перезагрузить свой UI при помощи /rl или /console reloadui.", -- Needs review
		name = "Общие опции", -- Needs review
		open = "Открыть опции UI", -- Needs review
		options = "SiL Опции", -- Needs review
		paperdoll = "Отображать в окне персонажа", -- Needs review
		paperdollDesc = "Отображать в окне персонажа средний уровень экипировки в разделе статистики. ", -- Needs review
		purge = "Очистить кэш", -- Needs review
		purgeAuto = "Автоматически удалять кэш", -- Needs review
		purgeAutoDesc = "Автоматически удалять информацию с кэша которая старше # дней. 0 - не удалять никогда.", -- Needs review
		purgeDesc = "Удалить всех персонажей старше %s дней из кэша", -- Needs review
		purgeError = "Пожалуйста введите количество дней", -- Needs review
		round = "Округлять илвл", -- Needs review
		roundDesc = "Округлять илвл до ближайшего целого числа", -- Needs review
		target = "Рассчитать средний уровень экипировки цели", -- Needs review
		targetDesc = "Получить средний уровень экипировки для вашей текущей цели",
		ttAdvanced = "Дополнительная подсказка", -- Needs review
		ttAdvancedDesc = "Включить дополнительные подсказки, включающие дату сканирования", -- Needs review
		ttCombat = "Подсказка в Бою",
		ttCombatDesc = "Показывать SiL информацию в подсказке во время боя",
	},
}
L.group = {
	addonName = "Simple iLevel - Группа", -- Needs review
	desc = "Посмотреть средний урвоень предметов всех в вашей группе", -- Needs review
	load = "Модуль Группа загружен",
	name = "SiL Группа",
	nameShort = "Группа",
	outputHeader = "Simple iLevel: Средний уровень экипировки группы %s", -- Needs review
	outputNoScore = "%s не доступно", -- Needs review
	outputRough = "* обозначает приблизительный рейтинг",
	options = {
		group = "Средний уровень экипировки группы", -- Needs review
		groupDesc = "Сообщать средний уровень экипировки группы в <%s>.", -- Needs review
	},
}
L.resil = {
	addonName = "Simple iLevel - Устойчивость", -- Needs review
	desc = "Показывает количество ПвП предметов, которые одели другие игроки в подсказке", -- Needs review
	load = "Модуль Устойчивость загружен",
	name = "SiL Устойчивость",
	nameShort = "Устойчивость",
	outputHeader = "Simple iLevel: Средний Уровень ПвП Предметов Группы %s", -- Needs review
	outputNoScore = "%s не доступен", -- Needs review
	outputRough = "* обозначает примерный уровень", -- Needs review
	ttPaperdoll = "На вас %s/%s предметов с %s рейтинга устойчивости.",
	ttPaperdollFalse = "В данный момент на вас нет ПвП предметов.",
	options = {
		cinfo = "Показать в окне Информации о персонаже.",
		cinfoDesc = "Показывает ваш SimpleiLevel Устойчивость рейтинг на панели характеристик.", -- Needs review
		group = "Уровень ПвП Предметов Группы", -- Needs review
		groupDesc = "Выводит уровень ПвП предметов вашей группы в <%s>.", -- Needs review
		name = "Настройки SiL Устойчивость",
		pvpDesc = "Отображены ПвП предметы всех в вашей группе.",
		ttType = "Вид подсказки",
		ttZero = "Без подсказки",
		ttZeroDesc = "Показывает информацию в подсказке, даже если у них нет ПвП предметов.",
	},
}
L.social = {
	addonName = "Simple iLevel - Общение", -- Needs review
	desc = "Добавлен средний уровень предметов в окно чата для разных каналов", -- Needs review
	load = "Модуль Общение загружен",
	name = "SiL Общение",
	nameShort = "Общение",
	options = {
		chatEvents = "Показ рейтинга включен:",
		color = "Цвет Рейтинга",
		colorDesc = "Окрашивать рейтинг в окне чата.",
		enabled = "Включено",
		enabledDesc = "Включить все опции SiL Общение.",
		name = "Настройки SiL Общение",
	},
}


