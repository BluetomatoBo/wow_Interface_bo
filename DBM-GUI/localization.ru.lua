﻿if GetLocale() ~= "ruRU" then return end

if not DBM_GUI_Translations then DBM_GUI_Translations = {} end
local L = DBM_GUI_Translations

L.MainFrame = "Deadly Boss Mods"

L.TranslationByPrefix		= "Перевод на русский язык - "
L.TranslationBy 			= "Swix, TOM_RUS"
L.Website					= "Посетите наши новые форумы обсуждения и поддержки на |cFF73C2FBwww.deadlybossmods.com|r (организовано Elitist Jerks!)"
L.WebsiteButton				= "Форумы"

L.OTabBosses				= "Боссы"
L.OTabOptions				= "Настройки"

L.TabCategory_Options	 	= "Общие параметры"
L.TabCategory_WOD	 		= "Warlords of Draenor"
L.TabCategory_MOP	 		= "Туманы Пандарии"
L.TabCategory_CATA	 		= "Катаклизм"
L.TabCategory_WOTLK 		= "Wrath of the Lich King"
L.TabCategory_BC 			= "The Burning Crusade"
L.TabCategory_CLASSIC		= "Классическая игра"
L.TabCategory_PVP 			= "PvP"
L.TabCategory_OTHER    		= "Другие боссы"

L.BossModLoaded 			= "%s - статистика"
L.BossModLoad_now 			= [[Модуль для этих боссов не загружен. 
Он будет загружен сразу после входа в подземелье. 
Также вы можете нажать кнопку, чтобы загрузить модуль вручную.]]

L.PosX						= 'Позиция X'
L.PosY						= 'Позиция Y'

L.MoveMe 					= 'Передвинь меня'
L.Button_OK 				= 'OK'
L.Button_Cancel 			= 'Отмена'
L.Button_LoadMod			= 'Загрузить модуль'
L.Mod_Enabled				= "Включить модуль"
L.Mod_Reset					= "Сброс настроек"
L.Reset 					= "Сброс"

L.Enable  					= "Вкл."
L.Disable					= "Откл."

L.NoSound					= "Без звука"

L.IconsInUse				= "Используемые метки"

-- Tab: Boss Statistics
L.BossStatistics			= "Статистика босса"
L.Statistic_Kills			= "Убийства:"
L.Statistic_Wipes			= "Поражения:"
L.Statistic_Incompletes		= "Не завершено:"
L.Statistic_BestKill		= "Лучший бой:"

-- Tab: General Core Options
L.General 					= "Общие параметры DBM"
L.EnableDBM 				= "Включить DBM"
L.EnableMiniMapIcon			= "Отображать кнопку на мини-карте"
L.UseSoundChannel			= "Выбор аудио канала для предупреждений DBM"
L.UseMasterChannel			= "Основной аудио канал"
L.UseDialogChannel			= "Аудио канал диалогов"
L.UseSFXChannel				= "Аудио канал эффектов"
L.Latency_Text				= "Макс. задержка для синхронизации: %d"
-- Tab: General Timer Options
L.TimerGeneral 				= "Общие параметры таймера"
L.SKT_Enabled				= "Всегда отображать таймер рекордной победы<br/>(переопределяет настройку для конкретного босса)"
L.CRT_Enabled				= "Отображать таймер до след. заряда воскрешения в бою (только уровни сложности в 6.x)"
L.ChallengeTimerOptions		= "Отображать таймер лучшего прохождения для режима испытаний"
L.ChallengeTimerPersonal	= "Персональный"
L.ChallengeTimerGuild		= "Гильдия"
L.ChallengeTimerRealm		= "Сервер"

L.ModelOptions				= "Настройки 3D моделей на странице боссов"
L.EnableModels				= "Показывать 3D модели боссов"
L.ModelSoundOptions			= "Выбор голосового приветствия"
L.ModelSoundShort			= "Короткое"
L.ModelSoundLong			= "Длинное"

L.Button_RangeFrame			= "Окно проверки дистанции"
L.Button_InfoFrame			= "Окно информации"
L.Button_TestBars			= "Проверка индикаторов"

-- Tab: Raidwarning
L.Tab_RaidWarning 			= "Предупреждения для рейда"
L.RaidWarning_Header		= "Параметры рейд-предупреждений"
L.RaidWarnColors 			= "Цвета предупреждений для рейда"
L.RaidWarnColor_1 			= "Цвет 1"
L.RaidWarnColor_2 			= "Цвет 2"
L.RaidWarnColor_3		 	= "Цвет 3"
L.RaidWarnColor_4 			= "Цвет 4"
L.InfoRaidWarning			= [[Вы можете указать расположение и цвет предупреждений для рейда. 
Используется для сообщений вроде "Игрок X под воздействием Y"]]
L.ColorResetted 			= "Цветовые параметры для этого поля восстановлены."
L.ShowWarningsInChat 		= "Показывать предупреждения в окне чата"
L.ShowFakedRaidWarnings 	= "Показывать предупреждения в виде объявлений рейду"
L.WarningIconLeft 			= "Отображать значок с левой стороны"
L.WarningIconRight 			= "Отображать значок с правой стороны"
L.WarningIconChat 			= "Отображать значки в окне чата"
L.Warn_FontType				= "Выбор шрифта"
L.Warn_FontStyle			= "Флаги шрифта"
L.Warn_FontShadow			= "Тень"
L.Warn_FontSize				= "Размер шрифта: %d"
L.Warn_Duration				= "Длительность предупреждения: %d сек"
L.None						= "Нет"
L.Outline					= "Контур"
L.ThickOutline				= "Толстый контур"
L.MonochromeOutline			= "Монохромный контур"
L.MonochromeThickOutline	= "Монохромный толстый контур"
L.RaidWarnSound				= "Звук рейд-предупреждения"

-- Tab: Generalwarnings
L.Tab_GeneralMessages 		= "Общие сообщения"
L.CoreMessages				= "Параметры общих сообщений"
L.ShowLoadMessage 			= "Показывать сообщения о загрузке модулей в окне чата"
L.ShowPizzaMessage 			= "Показывать сообщения транслируемых таймеров в окне чата"
L.ShowCombatLogMessage 		= "Показывать сообщение DBM о записи лога боя в окне чата"
L.ShowTranscriptorMessage	= "Показывать сообщение DBM о записи лога боя с помощью Transcriptor в окне чата"
L.ShowAllVersions	 		= "Показывать версии босс мода для всех членов группы в окне чата"
L.CombatMessages			= "Параметры сообщений в бою"
L.ShowEngageMessage 		= "Показывать сообщения о вступлении в бой в окне чата"
L.ShowKillMessage 			= "Показывать сообщения об убийстве босса в окне чата"
L.ShowWipeMessage 			= "Показывать сообщения при вайпе в окне чата"
L.ShowGuildMessages 		= "Показывать сообщения о вступлении в бой/убийстве/вайпе гильдии в окне чата"
L.ShowRecoveryMessage 		= "Показывать сообщения о восстановлении таймеров в окне чата"
L.WhisperMessages			= "Параметры приватных сообщений"
L.AutoRespond 				= "Включить авто-ответ в бою"
L.EnableStatus 				= "Отвечать на запрос статуса боя шепотом"
L.WhisperStats 				= "Добавлять статистику убийств/вайпов в авто-ответ"
L.DisableStatusWhisper 		= "Отключить ответы на запрос статуса боя шепотом для всей группы (требуется лидер группы). Применяется только для обычных/гер./эпох. рейдов и испытаний/эпох. подземелий"

-- Tab: Barsetup
L.BarSetup   				= "Настройки индикатора"
L.BarTexture 				= "Текстура индикатора"
L.BarStyle					= "Стиль индикатора"
L.BarDBM					= "DBM"
L.BarBigWigs				= "BigWigs (без анимации)"
L.BarStartColor				= "Цвет в начале"
L.BarEndColor 				= "Цвет в конце"
L.Bar_Font					= "Шрифт для индикаторов"
L.Bar_FontSize				= "Размер шрифта: %d"
L.Bar_Height				= "Высота индикатора: %d"
L.Slider_BarOffSetX 		= "Сдвиг X: %d"
L.Slider_BarOffSetY 		= "Сдвиг Y: %d"
L.Slider_BarWidth 			= "Ширина: %d"
L.Slider_BarScale 			= "Масштаб: %0.2f"
L.AreaTitle_BarSetup		= "Параметры основного индикатора"
L.AreaTitle_BarSetupSmall 	= "Параметры уменьшенного индикатора"
L.AreaTitle_BarSetupHuge	= "Параметры увеличенного индикатора"
L.EnableHugeBar 			= "Включить увеличенный индикатор (Полоса 2)"
L.BarIconLeft 				= "Значок слева"
L.BarIconRight 				= "Значок справа"
L.ExpandUpwards				= "Выровнять по верху"
L.FillUpBars				= "Наполняющая заливка"
L.ClickThrough				= "Отключить события мыши (щелчок сквозь)"
L.Bar_Decimal				= "Отображать десятые когда время меньше: %d"
L.Bar_DBMOnly				= "Настройки ниже работают только со стилем индикатора \"DBM\"."
L.Bar_EnlargeTime			= "Увеличивать, когда время меньше: %d"
L.Bar_EnlargePercent		= "Увеличивать, когда процент меньше: %0.1f%%"
L.BarSpark					= "Искрение индикатора"
L.BarFlash					= "Мигание когда индикатор скоро исчезнет"
L.BarSort					= "Сортировать по ставшемуся времени"

-- Tab: Spec Warn Frame
L.Panel_SpecWarnFrame		= "Специальные предупреждения"
L.Area_SpecWarn				= "Настройка специальных предупреждений"
L.SpecWarn_ClassColor		= "Использовать цвета классов для спец-предупреждений"
L.ShowSWarningsInChat 		= "Показывать спец-предупреждения в окне чата"
L.SpecWarn_FlashFrame		= "Мигать экраном во время специальных предупреждений"
L.SpecWarn_FlashFrameRepeat	= "Повторять %d раз (если включено)"
L.SpecWarn_Font				= "Выбор шрифта для специальных предупреждений"
L.SpecWarn_FontSize			= "Размер шрифта: %d"
L.SpecWarn_FontColor		= "Цвет шрифта"
L.SpecWarn_FontType			= "Выбор шрифта"
L.SpecWarn_FlashRepeat		= "Повторять мигание"
L.SpecWarn_FlashColor		= "Цвет мигания"
L.SpecWarn_FlashDur			= "Длительности мигания: %0.1f"
L.SpecWarn_FlashAlpha		= "Прозрачность мигания: %0.1f"
L.SpecWarn_DemoButton		= "Показать пример"
L.SpecWarn_MoveMe			= "Расположение"
L.SpecWarn_ResetMe			= "Восстановить умолчания"
L.SpecialWarnSound			= "Звук спец-предупреждения для вас или для вашей роли"
L.SpecialWarnSound2			= "Звук спец-предупреждения для всех"
L.SpecialWarnSound3			= "Звук очень важного спец-предупреждения"
L.SpecialWarnSound4			= "Звук для спец-предупреждений \"убегайте\""

-- Tab: Spoken Alerts Frame
L.Panel_SpokenAlerts		= "Голосовые предупреждения"
L.Area_VoiceSelection		= "Выбор голоса"
L.CountdownVoice			= "Основной голос для звуков отсчета"
L.CountdownVoice2			= "Вторичный голос для звуков отсчета"
L.CountdownVoice3			= "Третичный голос для звуков отсчета"
L.VoicePackChoice			= "Голосовой пакет для предупреждений"
L.Area_CountdownOptions		= "Настройки обратного отсчета"
L.ShowCountdownText			= "Отображать текст обратного отсчета во время основных голосовых отсчетов"
L.Area_VoicePackOptions		= "Настройки голосового пакета (голосовые пакеты третих лиц)"
L.SpecWarn_NoSoundsWVoice	= "Не проигрывать звуки спец-предупреждений для предупреждений, которые имеют голосовую настройку"
L.SWFNever					= "Никогда"
L.SWFDefaultOnly			= "когда спец-предупреждения используют звуки по умолчанию. (позволяет проигрывать пользовательские звуки)"--too long, doesn't fit into frame
L.SWFAll					= "когда спец-предупреждения используют любые звуки"
L.SpecWarn_AlwaysVoice		= "Всегда воспроизводить все голосовые предупреждения (Переопределяет настройки для конкретных боссов. Полезно для рейд лидера.)"
--TODO, maybe add URLS right to GUI panel on where to acquire 3rd party voice packs?

-- Tab: HealthFrame
L.Panel_HPFrame				= "Здоровье босса"
L.Area_HPFrame				= "Настройка здоровья босса"
L.HP_Enabled				= "Всегда отображать здоровье босса (переопределяет настройку для конкретного босса)"
L.HP_GrowUpwards			= "Выровнять индикатор здоровья по верху"
L.HP_ShowDemo				= "Индикатор здоровья"
L.BarWidth					= "Ширина индикатора: %d"

-- Tab: Global Filter
L.Panel_SpamFilter			= "Общие и спам-фильтры"
L.Area_SpamFilter_Outgoing	= "Параметры общего фильтра"
L.SpamBlockNoShowAnnounce	= "Не объявлять или предупреждать звуком игрока"
L.SpamBlockNoSetIcon		= "Не устанавливать метки на цели"
L.SpamBlockNoRangeFrame		= "Не отображать окно проверки дистанции"
L.SpamBlockNoInfoFrame		= "Не отображать информационное окно"
L.SpamBlockNoHudMap			= "Не отображать HudMap"
L.SpamBlockNoHealthFrame	= "Не отображать окно здоровья"
L.SpamBlockNoCountdowns		= "Не воспроизводить звуки обратного отсчета"
L.SpamBlockNoIconRestore	= "Не сохранять состояние меток и восстанавливать их после боя"
L.SpamBlockNoRangeRestore	= "Не восстанавливать окно проверки дистанции в предыдущее состояние при скрытии модулями"

-- Tab: Spam Filter
L.Area_SpamFilter			= "Параметры спам-фильтра"
L.DontShowFarWarnings		= "Не отображать предупреждения/таймеры для событий, которые далеко"
L.StripServerName			= "Удалять имя сервера в предупреждениях и таймерах"
L.SpamBlockBossWhispers		= "Фильтрация &lt;DBM&gt; предупреждений шепотом в бою"
L.BlockVersionUpdateNotice		= "Отключить уведомление о доступном обновлении (не рекомендуется)"

L.Area_SpecFilter			= "Параметры фильтра по роли"
L.FilterTankSpec			= "Фильтровать предупреждения для роли танка когда не в специализации танка"
L.FilterInterrupts			= "Фильтровать предупреждения для прерываемых спеллов если кастер не является вашей текущей целью или фокусом."
L.FilterDispels				= "Фильтровать предупреждения для рассеиваемых спеллов если ваш диспел на кулдауне."
L.FilterSelfHud				= "Фильтровать себя на HudMap (кроме функций проверки дистанции)"

L.Area_PullTimer			= "Параметры фильтра таймеров пулла/боя/пользов."
L.DontShowPTNoID			= "Блокировать таймер пулла, отправленный из другой зоны"
L.DontShowPT				= "Не отображать индикатор таймера пулла"
L.DontShowPTText			= "Не отображать текст объявления для таймера пулла"
L.DontPlayPTCountdown		= "Не воспроизводить звук отсчета таймера пулла/боя/пользов."
L.DontShowPTCountdownText	= "Не отображать текст отсчета таймера пулла/боя/пользов."
L.PT_Threshold				= "Не отображать текст отсчета таймера пулла/боя/пользов. больше: %d"

L.Panel_HideBlizzard		= "Скрыть Blizzard"
L.Area_HideBlizzard			= "Настройки скрытия Blizzard"
L.HideBossEmoteFrame		= "Скрывать окно эмоций рейдового босса во время боя с боссом"
L.HideWatchFrame			= "Скрывать окно отслеживания заданий во время боя с боссом"
L.HideGarrisonUpdates		= "Скрывать уведомления из гарнизона во время боя с боссом"
L.HideGuildChallengeUpdates	= "Скрывать уведомления о гильдейских испытаниях во время боя с боссами"
L.HideTooltips				= "Скрывать подсказки во время боя с боссом"
L.DisableSFX				= "Отключить канал звуковых эффектов во время боя с боссами"
L.HideApplicantAlerts		= "Скрывать оповещения о кандидатах в заранее собранных группах"
L.HideApplicantAlertsFull	= "Если группа набрана"
L.HideApplicantAlertsNotL	= "Если вы не лидер группы (и если группа набрана и вы лидер)"
L.SpamBlockSayYell			= "Скрыть текст оповещений в облачках из окна чата"
L.DisableCinematics			= "Отключить внутриигровые ролики"
L.AfterFirst				= "После одного просмотра"
L.Always					= "Всегда"

L.Panel_ExtraFeatures		= "Дополнительные возможности"
L.Area_ChatAlerts			= "Параметры оповещений в чате"
L.RoleSpecAlert				= "Показывать предупреждение когда ваша специализация добычи не совпадает с текущей специализацией при присоединении к рейду"
L.CheckGear					= "Показывать предупреждение когда уровень надетых предметов намного ниже чем максимальный (40+)"
L.WorldBossAlert			= "Показывать предупреждение когда в вашем игровом мире ваши друзья или согильдийцы возможно вступают в бой с боссами вне подземелья<br/>(неточно, если отправитель в межсерверной зоне)"
L.Area_SoundAlerts			= "Параметры звуковых оповещений"
L.LFDEnhance				= "Проигрывать звук проверки готовности для проверки ролей и приглашений на БГ/ЛФГ через основной аудио канал"
L.WorldBossNearAlert		= "Проигрывать звук проверки готовности когда неподалеку пулят нужных вам боссов вне подземелья (переопределяет настройку для конкретного босса)"
L.RLReadyCheckSound			= "Проигрывать звук проверки готовности при проверке готовности через основной аудио канал или канал диалогов"
L.AFKHealthWarning			= "Звуковое оповещение если вы теряете здоровье во время АФК"
L.Area_AutoLogging			= "Параметры автоматической записи"
L.AutologBosses				= "Автоматически записывать бои с боссами используя журнал боя Blizzard (Требуется использовать /dbm pull перед боссами для совместимости с <a href=\"http://www.warcraftlogs.com\">|cff3588ffwarcraftlogs.com|r</a>)"
L.AdvancedAutologBosses		= "Автоматически записывать бои с боссами используя Transcriptor"
L.LogOnlyRaidBosses			= "Записывать только бои с рейдовыми боссами (искл. Поиск Рейдов/5 ппл/сценарии)"
L.Area_3rdParty				= "Параметры аддонов третих лиц"
L.ShowBBOnCombatStart		= "Выполнять проверку положительных эффектов Big Brother в начале боя"
L.BigBrotherAnnounceToRaid	= "Объявлять результаты проверки Big Brother в рейд"
L.Area_Invite				= "Параметры приглашений"
L.AutoAcceptFriendInvite	= "Автоматически принимать приглашения в группу от друзей"
L.AutoAcceptGuildInvite		= "Автоматически принимать приглашения в группу от согильдийцев"
L.Area_Advanced				= "Дополнительные настройки"
L.FakeBW					= "Притворяться BigWigs вместо DBM при приверке версий (Полезно для гильдий которые заставляют использовать BigWigs)"

L.PizzaTimer_Headline 		= 'Создать "Pizza Timer"'
L.PizzaTimer_Title			= 'Название (например, "Pizza!")'
L.PizzaTimer_Hours 			= "час."
L.PizzaTimer_Mins 			= "мин."
L.PizzaTimer_Secs 			= "сек."
L.PizzaTimer_ButtonStart 	= "Начать отсчет"
L.PizzaTimer_BroadCast		= "Транслировать рейду"

L.Panel_Profile				= "Профили"
L.Area_CreateProfile        = "Создание профиля"
L.EnterProfileName			= "Введите имя профиля"
L.CreateProfile				= "Создать профиль настроек DBM Core"
L.Area_ApplyProfile			= "Выбор активного профиля настроек DBM Core"
L.SelectProfileToApply		= "Выберите профиль для применения"
L.Area_CopyProfile			= "Копирование профиля настроек DBM Core"
L.SelectProfileToCopy		= "Выберите профиль для копирования"
L.Area_DeleteProfile		= "Удаление профиля настроек DBM Core"
L.SelectProfileToDelete		= "Выберите профиль для удаления"
L.Area_DualProfile			= "Настройки профиля для босс-модулей"
L.DualProfile				= "Включить поддержку разных настроек босс-модулей для специализаций. (Управление профилями босс-модулей производится с экрана статистики загруженного модуля)"

L.Area_ModProfile			= "Копирование настроек модуля с другого персонажа/спека или удаление настроек модуля"
L.ModAllReset				= "Сбросить все настройки модуля"
L.ModAllStatReset			= "Сбросить всю статистику модуля"
L.SelectModProfileCopy		= "Скопировать все настройки из"
L.SelectModProfileCopySound	= "Скопировать настройки звука из"
L.SelectModProfileDelete	= "Удалить настройки модуля для"

-- Misc
L.FontHeight	= 16
