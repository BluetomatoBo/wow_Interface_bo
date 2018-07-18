-- THIS CONTENTS OF THIS FILE IS AUTO-GENERATED BY THE WOWACE PACKAGER
-- Please use the Localization App on WoWAce to update this
-- at http://www.wowace.com/projects/omen-threat-meter/localization/

-- Russian localization file for ruRU by StingerSoft.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("Omen", "ruRU")
if not L then return end

L["*Not in Party*"] = "*Не в группе*"
L["|cffff0000Error:|r Omen cannot use shake warning if you have turned on nameplates at least once since logging in."] = "|cffff0000Ошибка:|r Omen не может использовать предупреждения встряской, если вы включали nameplates после входа в игру."
L["<Unknown>"] = "<Неизвестно>"
L["> Pull Aggro <"] = "> Срыв аггро <"
L["A collection of help pages"] = "Коллекция страниц помощи"
L["Alpha"] = "Прозрачность"
L["Always Show Self"] = "Всегда показывать себя"
L["Always show your threat bar on Omen (ignores class filter settings), showing your bar on the last row if necessary"] = "Всегда отображать вашу полосу угрозы в Omen (игнорируя настройки фильтрации по классу), отображая её в последнем ряду, если это необходимо"
L["Ambience"] = "Мир"
L["Animate Bars"] = "Анимация полос"
L["Attach to minimap"] = "Закрепить у мини-карты"
L["AUTO_SHOW/HIDE_NOTE"] = "Заметка: Если вы отобразили/скрыли окно Omen вручную, он будет оставаться скрытым или будет отображаться вне зависимости от настроек автоматического отображения/скрытия, пока вы не смените зону, не вступите/покинете группу/рейд, или не смените настроек автоматического отображения/скрытия."
L["Autocollapse"] = "Автосворачивание"
L["Autocollapse Options"] = "Настройки автосворачивания"
L["Background Color"] = "Цвет фона"
L["Background Options"] = "Настройки фона"
L["Background Texture"] = "Текстура фона"
L["Background Tile Size"] = "Размер фонового узора"
L["Bar BG Color"] = "Цвет фона полос"
L["Bar Height"] = "Высота полосы"
L["Bar Inset"] = "Врезка полосы"
L["Bar Label Options"] = "Настройка надписей полос"
L["Bar Settings"] = "Настройка полос"
L["Bar Spacing"] = "Промежуток между полосами"
L["Bar Texture"] = "Текстура полос"
L["Border Color"] = "Цвет краев"
L["Border Texture"] = "Текстура краев"
L["Border Thickness"] = "Толщина краев"
L["Causes Omen to play a chosen sound effect"] = "Проигрывать выбранный вами звуковой эффект"
L["Causes the entire game world to shake momentarily. This option only works if nameplates are turned off."] = "Весь экран будет трястись. Данная настройка будет работать только если выключены таблицы имен"
L["Causes the entire screen to flash red momentarily"] = "Весь экран будет мигать красным цветом"
L["Center"] = "По центру"
L["Center Omen"] = "Центрировать Omen"
L["Clamp To Screen"] = "Прикрепить к экрану"
L["Click Through"] = "Кликов"
L["Click|r to toggle the Omen window"] = "Клик|r для открытия/закрытия окна Omen"
L["Collapse to show a minimum number of bars"] = "Сжимать окно для отображения минимального количества полос"
L["Configure"] = "Настройка"
L["Configure bar settings."] = "Настройка полос."
L["Configure title bar settings."] = "Настройка заглавной полосы."
L["Control the font size of the labels"] = "Настройка размера шрифта надписей"
L["Control the font size of the title text"] = "Настройка размера шрифта заглавного текста"
L["Controls the frame strata of the main Omen window. Default: MEDIUM"] = "Контроль слоя фрейма главного окна Омена. По умолчанию: Среднее"
L["Controls the scaling of the main Omen window."] = "Настройка масштаба главного окна Omen."
L["Controls the transparency of the main Omen window."] = "Настройка прозрачности главного окна Omen."
L["Controls whether the main Omen window can be dragged offscreen"] = "Контролирует возможность выноса главного окна Omen за пределы экрана"
L["DEATHKNIGHT"] = "Рыцарь смерти"
--[[Translation missing --]]
--[[ L["DEMONHUNTER"] = "Demon Hunter"--]] 
L["Disable while tanking"] = "Отключать при танковании"
L["DISABLE_WHILE_TANKING_DESC"] = "Не выводить предупреждений, если на вас активна Оборонительная стойка, Облик медведя, Праведное неистовство или Власть крови."
L["Display large numbers in Ks"] = "Отображать большие числа с сокращением К"
L["DRUID"] = "Друид"
L["Enable Screen Flash"] = "Включить мигание экрана"
L["Enable Screen Shake"] = "Включить встряску экрана"
L["Enable Sound"] = "Включить звуки"
L["Enable Warning Message"] = "Включить предупреждения"
L["FAQ Part 1"] = "FAQ, часть 1"
L["FAQ Part 2"] = "FAQ, часть 2"
L["Font"] = "Шрифт"
L["Font Color"] = "Цвет шрифта"
L["Font Outline"] = "Контур шрифта"
L["Font Size"] = "Размер шрифта"
L["Frame Strata"] = "Cлои фрейма"
L["Frame's background color"] = "Цвет фона фрейма"
L["Frame's border color"] = "Цвет краев фрейма"
L["Frequently Asked Questions"] = "Часто задаваемые вопросы"
L["FuBar Options"] = "Опции FuBar"
L["General Settings"] = "Основные настройки"
L["GENERAL_FAQ"] = [=[|cffffd200Чем Omen3 отличается от Omen2?|r

Omen3 берёт информацию из стандартного API угрозы и событий угрозы. Он не вычисляет или экстраполирует угрозу в отличие от Omen2.

Omen2 использует библиотеку Threat-2.0. Эта библиотека отвечает за мониторинг журнала боя, применение заклинаний, баффов, дебаффов, стоек, талантов и комплектацию снаряжения для вычисления угрозы индивидуально для каждого. Вычисление угрозы основано на известном или приблизительно известном наблюдаемом поведении. Значения уменьшения угрозы многих способностей, таких, как, например, Отпор лишь приблизительно, так как точные значения, в большинстве своём, не удаётся определить.

Библиотека Threat-2.0 также включала аддон связи, передававший значение вашей угрозы остальным участникам рейда, если они также использовали Threat-2.0. Эти данные использовались для обеспечения рейда информацией о угрозе.

После патча 3.0.2 Omen больше не делает чего-либо из этих вещей, и необходимости в библиотеке Threat-2.0 больше нет. Omen3 использует новый, встроенный в стандартный интерфейс игры мониторинг угрозы, для получения точных значений угрозы каждого игрока. Это означает, что Omen3 больше не нуждается в синхронизации данных, мониторинга журнала боя, что привело к значительному увеличению эффективности с точки зрения использования сетевого трафика, CPU и памяти. Необходимость в реализации специальных событий боссов, связанных с обнулением угрозы (к примеру, как Ночная Погибель при посадке обнуляет всю угрозу) также отпадает.

Другие преимущества новой реализации включают в себя добавление угрозы NPC на мобе (например, Калесгос в форме человека). Однако, присутствуют и некоторые недостатки: частота обновлений намного медленнее, сведения об угрозе не могут быть получены, пока кто-либо из вашей группы/рейда не выделит моба, а также невозможно получить сведения об угрозе мобу, с которым вы не находитесь в бою.

|cffffd200Как избавиться от двух вертикальных серых линий?|r

Зафиксируйте Omen. Фиксация Omen не позволит перетаскивать его, или изменять его размер, а также не позволит изменять размер колонок. Если вы не сделали этого, две вертикальные серые линии - это регулировщики изменения размера колонок.

|cffffd200Как сделать Omen3 похожим на Omen2?|r

Смените Текстуру фона и Текстуру краев на Blizzard Tooltip, Цвет фона на черный (с помощью перетаскивания полосы яркости вниз), а Цвет краев - на синий.

|cffffd200Почему данные об угрозе не отображаются, когда я выделяю моба, даже если он находится в режиме боя?|r

Стандартный API угрозы не возвращает данные об угрозе мобам, с которыми вы не находитесь в непосредственном бою. Мы подозреваем, что это является попыткой со стороны Blizzard сохранить сетевой трафик.

|cffffd200Существует ли какой-либо способ обойти это ограничение Blizzard? Невозможность увидеть угрозу своего питомца, пока я не атакую сам, заставляет меня только строить предположения об этом.|r

Нет способа обойти это ограничение, это мог сделать только Omen2.

Цель Omen3 - обеспечивать точной информацией об угрозе, мы не намерены делать что-либо, снижающее FPS. Надейтесь на вашего питомца/танка, или просто подождите 2 секунды перед тем, как атаковать, и используйте заклинание с небольшим уроном типа Ледяного копья, это поможет вам получить начальные данные об угрозе.
]=]
L["GENERAL_FAQ2"] = [=[|cffffd200Можно ли вернуть АоЕ-режим?|r

Повторюсь, это невозможно без получения приблизительных значений угрозы. Стандартный API угрозы позволяет нам запрашивать данные об угрозе только тем мобам, которые являются целью кого-либо из участников вашего рейда. Это означает, что если вы находитесь в бою с 20 мобами, но только 6 из них являются целями участников рейда, нет способа получить точную информацию об угрозе другим 14.

Также очень сложно определять значения угрозы от лечения и баффов (угроза от которых распределяется на всех мобов, с которыми вы находитесь в бою), так как таблица угрозы мобов не модифицируется при нахождении под эффектами контроля (Превращение, Изгнание, Ошеломление и т.п.) , а аддоны не могут предоставить вам достоверную информацию о количестве мобов, с котоыми вы находитесь в бою. Предположения Omen2 почти всегда были неверны.

|cffffd200Всплывающие подсказки, отображающиеся при наведении курсора на моба, отображают % угрозы, не соответствующий отображаемому в Omen3. Почему?|r

Стандартные значения угрозы изменяются в диапазоне от 0% до 100%, то есть, вы всегда будете срывать аггро при 100%. Данные Omen являются приблизительными значениями, а процент срыва аггро является 110% для находящихся в мили-радиусе, и 130% в других случаях.

По всеобщему соглашению, основная цель моба называется танком и имеет 100% угрозы.

|cffffd200Данные об угрозе обновляются медленно...|r

Omen3 обновляет значения угрозы, которые вы видите, с такой же частотой, с которой Blizzard обновляет значения угрозы для нас.

Фактически, Blizzard обновляет их раз в секунду, что намного быстрее, чем синхронизация Omen2. Omen2 отправлял остальным участникам рейда ваше значение угрозы каждые 3 секунды (или 1.5с, если вы были танком).

|cffffd200Куда я могу сообщать о багах или давать предложения?|r

http://forums.wowace.com/showthread.php?t=14249

|cffffd200Кто написал Omen3?|r

Это сделал Xinhuan (Blackrock/Barthilas US, Альянс).

|cffffd200Принимаете ли вы пожертвования посредством Paypal?|r

Да, отправляйте их на xinhuan AT gmail DOT com.]=]
L["Grow bars upwards"] = "Возрастание полос вверх"
L["Heading background color"] = "Цвет фона заголовка"
L["Heading BG Color"] = "Цвет фона заголовка"
L["Height of each bar"] = "Высота всех полос"
L["Height of the title bar. The minimum height allowed is twice the background border thickness."] = "Высота полосы заглавия. Минимальная высота в два раза превышает толщину краев фона."
L["Help File"] = "Файл справки"
L["Hide minimap/FuBar icon"] = "Скрыть иконку у мини-карты/FuBar'а"
L["Hide Omen"] = "Скрыть Omen"
L["Hide Omen entirely if it collapses to show 0 bars"] = "Полностью скрывать Omen, когда он сжимается до 0 полос"
L["Hide Omen on 0 bars"] = "Скрывать Omen при отсутствии полос"
L["However, hide Omen if any of the following are true (higher priority than the above)."] = "Тем не менее скрывать Omen, если какое-либо из следующих условий верно (приоритет выше, чем у вышеперечисленного)."
L["HUNTER"] = "Охотник"
L["Ignore Player Pets"] = "Игнор. питомцев"
L["IGNORE_PLAYER_PETS_DESC"] = [=[Игнорировать питомцев вражеских игроков при определении объекта для отображения данных по угрозе.

Питомцы игрока отображаются в таблице угрозы, в |cffffff78Агрессивном|r или  |cffffff78Оборонительном|r режиме, и ведут себя, как обычные мобы, атакуя цель с наибольшим уровнем угрозы. Если питомцу указано атаковать конкретные цели, питомец будет поддерживать угрозу в таблице, полоса установленной цели по определению будет указывать 100% угрозы. Питомцы игрока могут быть спровоцированы, чтобы заставить их атаковать вас.

Однако, питомцы в |cffffff78пассивном|r режиме не будут внесены с таблицу угрозы, и провокация на них не подействует. Они будут атаковать только указанные цели, и не будут внесены в таблицу угрозы.

Если питомцу приказано |cffffff78Следовать|r, то значения в таблице угрозы питомца будут аннулированы, а атака прекратится, но, несмотря на это, он может снова приобрести цель в зависимости от того, находится он в режиме Агрессии, или же Обороны.
]=]
L["Invert Bar/Text Colors"] = "Инвертировать цвета полос/текста"
L["Left"] = "Слева"
L["Lock Omen"] = "Зафиксировать Omen"
L["Locks Omen in place and prevents it from being dragged or resized."] = "Фиксирует Omen на месте, не позволяя изменять размер или перетаскивать его."
L["MAGE"] = "Маг"
L["Makes the Omen window non-interactive"] = "Делает окна без Омен-интерактивных"
L["Master"] = "Общая громкость"
L["Max bars to show"] = "Макс. полос"
L["Max number of bars to show"] = "Максимальное число показываемых полос"
L["Music"] = "Музыка"
L["'My Bar' BG Color"] = "Цвет фона 'Моей полосы'"
L["Name"] = "Имя"
L["None"] = "Отсутствует"
L["Omen Quick Menu"] = "Быстрое меню Omen"
L["OMEN_DESC"] = "Omen - это легковесный измеритель угрозы, который показывает вам угрозу по отношению к монстрам, с которыми вы вступили в бой. Вы можете изменить его вид,  параметры работы, а также сконфигурировать различные профили для каждого из ваших персонажей."
L["OMEN_SLASH_DESC"] = "Эти кнопки выполняют те же функции, что и слеш-команды /omen"
L["OMEN_WARNINGS_DESC"] = "Данный раздел поможет вам настроить вывод сообщений о том, что вы почти перехватили агрессию моба на себя."
L["Open Config"] = "Открыть настройки"
L["Open Omen's configuration panel"] = "Открыть окно настроек Omen"
L["Open the configuration dialog"] = "Открыть окно настройки"
L["Outline"] = "Контур"
L["PALADIN"] = "Паладин"
L["Passed %s%% of %s's threat!"] = "Выработано %s%% от угрозы |3-1(%s)!"
L["PET"] = "Питомец"
L["Pet Bar Color"] = "Цвет полос питомцев"
L["Position"] = "Позиция"
L["PRIEST"] = "Жрец"
L["Print a message to screen when you accumulate too much threat"] = "Выводить сообщение на экран, когда вы вырабатываете слишком много угрозы"
L["Profiles"] = "Профили"
L["Pull Aggro Bar Color"] = "Цвет полосы срыва аггро"
L["Right"] = "Справа"
L["Right-click|r to open the options menu"] = "Клик правой кнопкой|r для открытия меню настроек"
L["ROGUE"] = "Разбойник"
L["Scale"] = "Масштаб"
L["Sets how far inside the frame the threat bars will display from the 4 borders of the frame"] = "Установить глубину нахождения полос угрозы во фрейме по отношению к его краям"
L["SFX"] = "Звук"
L["SHAMAN"] = "Шаман"
L["Short Numbers"] = "Сокращать цифры"
L["Show a bar for the amount of threat you will need to reach in order to pull aggro."] = "Отображать полосу со значением угрозы, достигнув которого вы сорвёте аггро."
L["Show bars for these classes"] = "Показывать полосы для этих классов"
L["Show Classes..."] = "Показывать классы..."
L["Show column headings"] = "Отображать заголовки колонок"
L["Show Headings"] = "Показ заголовков"
L["Show icon"] = "Отображать иконку"
L["Show minimap button"] = "Кнопка у мини-карты"
L["Show Omen"] = "Показать Omen"
L["Show Omen when any of the following are true"] = "Показывать Omen, если какое-либо из следующих условий верно"
L["Show Omen when you are alone"] = "Отображать Omen, когда вы один"
L["Show Omen when you are in a 5-man party"] = "Отображать Omen, когда вы находитесь в группе"
L["Show Omen when you are in a raid"] = "Отображать Omen, когда вы находитесь в рейде"
L["Show Omen when you have a pet out"] = "Отображать Omen, когда у вас есть питомец"
L["Show Omen when..."] = "Отображать Omen, когда..."
L["Show Pull Aggro Bar"] = "Отображать полосу срыва аггро"
L["Show text"] = "Отображать текст"
L["Show the Omen minimap button"] = "Отображать кнопку Omen у мини-карты"
L["Show the Omen Title Bar"] = "Отображать заглавную полосу Omen"
L["Show Threat %"] = "Отображение угрозы в %"
L["Show threat per second values"] = "Отображать значение вырабатываемой в секунду угрозы"
L["Show Threat Values"] = "Отображать значения угрозы"
L["Show Title Bar"] = "Отображать полосу заглавия"
L["Show TPS"] = "Отображать УгрВС"
L["Show When..."] = "Показывать, когда..."
L["SHOW_CLASSES_DESC"] = "Показывать полосы угрозы Омена для определённых классов. Относится только к группе/рейду. Исключением является опция 'Не в группе'."
L["Slash Command"] = "Команды"
L["Smoothly animate bar changes"] = "Плавная анимация изменений полос"
L["Sound Channel"] = "Воспроизводить в канал"
L["Sound to play"] = "Проигрываемый звук"
L["Spacing between each bar"] = "Промежутки между полосами"
L["Switch the colors so that the bar background colors and the text colors are swapped."] = "Поменять местами цвета фона и текста."
L["Tank Bar Color"] = "Цвет полосы танка"
L["Tells Omen to additionally check your 'focus' and 'focustarget' before your 'target' and 'targettarget' in that order for threat display."] = "Выполнять дополнительную проверку вашего 'focus' перед проверкой 'target' и 'targettarget' на наличие угрозы для ее отображения."
L["Tells Omen to enter Test Mode so that you can configure Omen's display much more easily."] = "Войти в режим тестирования для более удобной настройки Omen."
L["Temp Threat Bar Color"] = "Врем. цвет полосы угрозы"
L["Test Mode"] = "Режим тестирования"
L["Test warnings"] = "Тестирование предупреждений"
L["Texture to use for the frame's background"] = "Текстура фона фрейма"
L["Texture to use for the frame's border"] = "Текстура краев фрейма"
L["The background color for all threat bars"] = "Цвет фона для всех полос угрозы"
L["The background color for pets"] = "Цвет фона питомцев"
L["The background color for players under the effects of Fade, Mirror Image, Tricks of the Trade and Misdirection"] = "Цвет фона для игроков под эффектами Уход в Тень, Зеркальное Изображение, Длань Спасения с символом, Маленькие Хитрости и Перенаправление"
L["The background color for your Pull Aggro bar"] = "Цвет фона полосы срыва аггро"
L["The background color for your tank's threat bar"] = "Цвет фона полосы угрозы вашего танка"
L["The background color for your threat bar"] = "Цвет фона вашей полосы угрозы"
L["The color of the labels"] = "Цвет надписей"
L["The color of the title text"] = "Цвет заглавного текста"
L["The font that the labels will use"] = "Шрифт, используемый для надписей"
L["The font that the title text will use"] = "Шрифт, используемый в заглавии"
L["The outline that the labels will use"] = "Контур шрифта надписей"
L["The outline that the title text will use"] = "Контур заглавного текста"
L["The size used to tile the background texture"] = "Размер узора, наносимого на текстуру фона"
L["The texture that the bar will use"] = "Текстура, используемая для полос"
L["The thickness of the border"] = "Толщина краев"
L["Thick Outline"] = "Толстый контур"
L["This section controls when Omen is automatically shown or hidden."] = "Данный раздел отвечает за автоматическое скрытие или отображение окна Omen."
L["Threat"] = "Угроза"
L["Threat [%]"] = "Угроза [%]"
L["Tile Background"] = "Узорчатый фон"
L["Tile the background texture"] = "Нанесение узора на текстуру фона"
L["Title Bar Background Options"] = "Опции фона заглавной полосы"
L["Title Bar Height"] = "Высота заглавной полосы"
L["Title Bar Settings"] = "Настройки заглавной полосы"
L["Title Text Options"] = "Опции заглавного текста"
L["Toggle Focus"] = "Вкл/откл фокус"
L["Toggle Omen"] = "Показать/Скрыть Omen"
L["TPS"] = "УгрВС"
L["TPS Window"] = "Окно УгрВС"
L["TPS_WINDOW_DESC"] = "Вычисление угрозы в секунду базируется на количестве угрозы, выработанной за последние Х секунд."
L["Turning this on will cause Omen to hide whenever you are in a battleground or arena."] = "Скрывать Omen, когда вы находитесь на арене или поле боя."
L["Turning this on will cause Omen to hide whenever you are in a city or inn."] = "Скрывать Omen, когда вы находитесь в городе или таверне."
L["Turning this on will cause Omen to hide whenever you are not in combat."] = "Скрывать Omen вне боя."
L["Use !ClassColors"] = "Исп. !ClassColors"
L["Use !ClassColors addon for class colors for the background color of threat bars"] = "Использовать аддон !ClassColors для цвета классов и цвета фона полос угрозы"
L["Use a different colored background for the tank's threat bar in Omen"] = "Использовать другую окраску фона полос угрозы танков в Omen"
L["Use a different colored background for your threat bar in Omen"] = "Использовать другую окраску фона для вашей полосы угрозы в Omen"
L["Use Auto Show/Hide"] = "Автоматическое отображение/скрытие"
L["Use Class Colors"] = "Использовать цвет класса"
L["Use Focus Target"] = "Использовать фокус"
L["Use 'My Bar' color"] = "Использовать цвет 'Моей полосы'"
L["Use Same Background"] = "Одинаковый фон"
L["Use standard class colors for the background color of threat bars"] = "Использовать стандартный цвет класса в качестве цвета фона полосы угрозы"
L["Use Tank Bar color"] = "Использовать цвет полосы танка"
L["Use the same background settings for the title bar as the main window's background"] = "Использовать для заглавной полосы такие же настройки фона, что и для основного окна"
L["WARLOCK"] = "Чернокнижник"
L["Warning Settings"] = "Настройки предупреждений"
L["Warning Threshold %"] = "Порог предупреждения в %"
L["Warrior"] = "Воин"
L["WARRIOR"] = "Воин"
L["WARRIOR_FAQ"] = [=[Следующие данные взяты с |cffffd200http://www.tankspot.com/forums/f200/39775-wow-3-0-threat-values.html|r  2 Окт 2008 (автор - Satrina). Значения для 80 уровня.

|cffffd200Модификатор|r
Боевая стойка ____________ x 80
Стойка берсерка ___________x 80
Тактическое превосходство _x 121/142/163
Оборонительная стойка _____x 207.35

Note that in our original threat estimations (that we use now in WoW 2.0), we equated 1 damage to 1 threat, and used 1.495 to represent the stance+defiance multiplier. We see that Blizzard's method is to use the multiplier without decimals, so in 2.x it would've been x149 (maybe x149.5); it is x207 (maybe 207.3) in 3.0. I expect that this is to allow the transport of integer values instead of decimal values across the Internet for efficiency. It appears that threat values are multiplied by 207.35 at the server, then rounded.

Если Вы все же хотите использовать метод, когда 1 единица урона = 1 единице угрозы, модификатор стоек - 0.8 и 2.0735.

|cffffd200Значения угрозы  (stance modifiers apply unless otherwise noted):|r
Боевой крик __________ 78 (split)
Рассекающий удар _____ урон + 225 (split)
Командирский крик ____ 80 (split)
Оглушающий удар ______ только урон
Ранящий щит __________ только урон
Деморализующий крик __ 63 (split)
Сокрушение ___________ урон + 5% от СА *** Нужно перепроверить для 8982 **
Уклон/Парир/Блок______ 1 (только в оборонительной стойке с улучшенной оборонительной стойкой)
Удар героя ___________ урон + 259
Героический бросок ____1.50 x урона
Получение Ярости______ 5 (не модифицируется стойкой)
Кровопускание_________ только урон
Реванш  ______________ урон + 121
Удар щитом ___________ 36
Мощный удар щитом _____урон + 770
Ударная волна _________только урон
Сокрушение ____________урон + 140
Отражение заклинания __только урон (только для заклинаний, направленных на вас)
Общественное аггро ___ 0
Раскол брони _________ 345 + 5%СА
Удар грома ___________ 1.85 x урона
Бдительность __________10% от вырабатываемой угрозы цели (не модифицируется стойкой)

Вы не вырабатываете угрозы при отражении заклинаний, направленных на союзников, с помощью Улучшенного отражения заклинаний. Если вы отражаете заклинание, направленное на союзника, ваш союзник вырабатывает угрозу за нанесенный отраженным заклинанием урон.]=]
L["You are alone"] = "Вы один"
L["You are in a battleground"] = "Вы на поле боя"
L["You are in a party"] = "Вы в группе"
L["You are in a raid"] = "Вы в рейде"
L["You are not in combat"] = "Вы не в бою"
L["You are resting"] = "Вы отдыхаете"
L["You have a pet"] = "У вас есть питомец"

