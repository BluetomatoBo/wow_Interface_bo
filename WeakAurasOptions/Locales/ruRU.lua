if not(GetLocale() == "ruRU") then
  return
end

local L = WeakAuras.L

-- WeakAuras/Options
	L["-- Do not remove this comment, it is part of this trigger: "] = "-- Не удаляйте этот комментарий, он является частью этого триггера: "
	L["% of Progress"] = "% прогресса"
	L["%i Matches"] = "%i |4совпадение:совпадения:совпадений;"
	L["%s Color"] = "%s "
	L["%s total auras"] = "Всего %s |4индикация:индикации:индикаций;"
	L["1 Match"] = "1 cовпадение"
	L["1. Text"] = "1. Текст"
	L["1. Text Settings"] = "1. Настройки текста"
	L["2. Text"] = "2. Текст"
	L["2. Text Settings"] = "2. Настройки текста"
	L["A 20x20 pixels icon"] = "Иконка 20х20 пикселей"
	L["A 32x32 pixels icon"] = "Иконка 32х32 пикселей"
	L["A 40x40 pixels icon"] = "Иконка 40х40 пикселей"
	L["A 48x48 pixels icon"] = "Иконка 48х48 пикселей"
	L["A 64x64 pixels icon"] = "Иконка 64х64 пикселей"
	L["A group that dynamically controls the positioning of its children"] = "Группа, динамически изменяющая позиции своих индикаций"
	L["Actions"] = "Действия"
	L["Add a new display"] = "Добавить новую индикацию"
	L["Add Condition"] = "Добавить условие"
	L["Add Overlay"] = "Добавить наложение (дополнительный прогресс)"
	L["Add Property Change"] = "Добавить свойство"
	L["Add to group %s"] = "Добавить в группу %s"
	L["Add to new Dynamic Group"] = "Добавить в новую динамическую группу"
	L["Add to new Group"] = "Добавить в новую группу"
	L["Add Trigger"] = "Добавить триггер"
	L["Addon"] = "Аддон"
	L["Addons"] = "Аддоны"
	L["Align"] = "Выравнивание"
	L["Allow Full Rotation"] = "Разрешить полное вращение"
	L["Alpha"] = "Прозрачность"
	L["Anchor"] = "Крепление"
	L["Anchor Point"] = "Точка крепления"
	L["Anchored To"] = "Прикрепить к"
	L["And "] = "И "
	L["Angle"] = "Угол"
	L["Animate"] = "Анимация"
	L["Animated Expand and Collapse"] = "Анимированное сворачивание и разворачивание"
	L["Animates progress changes"] = "Изменение прогресса отображается при помощи анимации"
	L["Animation relative duration description"] = [=[Длительность анимации относительно длительности индикации, выраженная в виде обыкновенной (1/2) или десятичной (0.5) дробей, процента (50%).

|cFFFF0000Замечание:|r если у индикации нет прогресса (аура без длительности, триггер события без времени и т. д.), то анимация не будет отображаться.

|cFF4444FFПримеры:|r
Если длительность анимации установлена в |cFF00CC0010%|r и триггер индикации - это бафф длительностью 20 секунд, то анимация будет отображаться в течение 2 секунд.
Если длительность анимации установлена в |cFF00CC0010%|r и триггер индикации - это бесконечная аура, то анимация отображаться не будет (хотя могла бы, если бы вы указали длительность в секундах).]=]
	L["Animation Sequence"] = "Цепочка анимаций"
	L["Animations"] = "Анимация"
	L["Apply Template"] = "Применить шаблон"
	L["Arcane Orb"] = "Чародейский шар"
	L["At a position a bit left of Left HUD position."] = "Немного левее позиции левого HUD"
	L["At a position a bit left of Right HUD position"] = "Немного правее позиции правого HUD"
	L["At the same position as Blizzard's spell alert"] = "В таком же положении, как предупреждение заклинаний Blizzard"
	L["Aura Name"] = "Название ауры"
	L["Aura Type"] = "Тип эффекта"
	L["Aura(s)"] = "Эффекты"
	L["Aura:"] = "Эффект:"
	L["Auras:"] = "Эффекты:"
	L["Auto"] = "Авто"
	L["Auto-cloning enabled"] = "Авто-клонирование включено"
	L["Automatic Icon"] = "Автоматическая иконка"
	L["Backdrop Color"] = "Цвет фона"
	L["Backdrop in Front"] = "Фон спереди"
	L["Backdrop Style"] = "Стиль фона"
	L["Background"] = "Фон"
	L["Background Color"] = "Цвет подложки"
	L["Background Inset"] = "Вставка фона"
	L["Background Offset"] = "Смещение подложки"
	L["Background Texture"] = "Текстура подложки"
	L["Bar Alpha"] = "Прозрачность полосы"
	L["Bar Color"] = "Цвет полосы"
	L["Bar Color Settings"] = "Настройки цвета полосы"
	L["Bar Texture"] = "Текстура полосы"
	L["Big Icon"] = "Большая иконка"
	L["Blend Mode"] = "Режим наложения"
	L["Blue Rune"] = "Синяя руна"
	L["Blue Sparkle Orb"] = "Синий искрящийся шар"
	L["Border"] = "Граница"
	L["Border Color"] = "Цвет границы"
	L["Border in Front"] = "Граница спереди"
	L["Border Inset"] = "Вставка границы"
	L["Border Offset"] = "Смещение границы"
	L["Border Settings"] = "Настройки границы"
	L["Border Size"] = "Размер границы"
	L["Border Style"] = "Стиль границы"
	L["Bottom Text"] = "Текст внизу"
	L["Bracket Matching"] = "Закрывать скобки"
	L["Button Glow"] = "Подсветка кнопки"
	L["Can be a name or a UID (e.g., party1). A name only works on friendly players in your group."] = "Может быть именем или UID (например, party1). Название работает только на дружественных игроках в вашей группе."
	L["Cancel"] = "Отмена"
	L["Channel Number"] = "Номер кaнала"
	L["Chat Message"] = "Сообщение в чат"
	L["Check On..."] = "Проверять..."
	L["Children:"] = "Индикации:"
	L["Choose"] = "Выбрать"
	L["Choose Trigger"] = "Выберите триггер"
	L["Choose whether the displayed icon is automatic or defined manually"] = "Выберите, будет ли иконка задана автоматически или вручную"
	L["Clone option enabled dialog"] = [=[Вы активировали параметр, использующий |cFFFF0000Авто-клонирование|r.

|cFFFF0000Авто-клонирование|r заставляет индикацию автоматически дублироваться для отображения нескольких источников информации. Если вы не разместите ее в |cFF22AA22Динамической Группе|r, то все клоны будут отображаться друг над другом в большой куче.

Вы хотите поместить эту индикацию в новую |cFF22AA22Динамическую Группу|r?]=]
	L["Close"] = "Закрыть"
	L["Collapse"] = "Свернуть"
	L["Collapse all loaded displays"] = "Свернуть все загруженные индикации"
	L["Collapse all non-loaded displays"] = "Свернуть все не загруженные индикации"
	L["Color"] = "Цвет"
	L["color"] = "цвет"
	L["Common Options"] = "Общие параметры"
	L["Compress"] = "Сжать"
	L["Condition %i"] = "Условие %i"
	L["Conditions"] = "Условия"
	L["Constant Factor"] = "Постоянный параметр"
	L["Control-click to select multiple displays"] = "Ctrl-клик для выбора нескольких индикаций"
	L["Controls the positioning and configuration of multiple displays at the same time"] = "Управляет позиционированием и настройкой нескольких индикаций одновременно"
	L["Convert to..."] = "Преобразовать в ..."
	L["Cooldown"] = "Перезарядка"
	L["Copy settings..."] = "Копировать настройки из ..."
	L["Copy to all auras"] = "Копировать во все индикации"
	L["Copy URL"] = "Копировать URL"
	L["Count"] = "Кол-во"
	L["Creating buttons: "] = "Создание кнопок:"
	L["Creating options: "] = "Создание настроек:"
	L["Crop"] = "Обрезать"
	L["Crop X"] = "Обрезать по X"
	L["Crop Y"] = "Обрезать по Y"
	L["Custom"] = "Самостоятельно"
	L["Custom Code"] = "Свой код"
	L["Custom Function"] = "Своя функция"
	L["Custom Trigger"] = "Свой триггер"
	L["Custom trigger event tooltip"] = [=[Напишите события, которые будут вызывать проверку вашего триггера. Несколько событий должны быть разделены запятыми или пробелами.

|cFF4444FFПример:|r
UNIT_POWER  UNIT_AURA, PLAYER_TARGET_CHANGED]=]
	L["Custom trigger status tooltip"] = [=[Напишите события, которые будут вызывать проверку вашего триггера. Несколько событий должны быть разделены запятыми или пробелами.
Поскольку это триггер статуса, указанные события могут быть переданы WeakAuras без ожидаемых аргументов.

|cFF4444FFПример:|r
UNIT_POWER  UNIT_AURA, PLAYER_TARGET_CHANGED]=]
	L["Custom Untrigger"] = "Свой детриггер"
	L["Debuff Type"] = "Тип дебаффа"
	L["Default"] = "По умолчанию"
	L["Delete"] = "Удалить"
	L["Delete all"] = "Удалить всё"
	L["Delete children and group"] = "Удалить индикации и группу"
	L["Delete Trigger"] = "Удалить триггер"
	L["Desaturate"] = "Обесцветить"
	L["Differences"] = "Различия"
	L["Disable Import"] = "Отключить импорт"
	L["Disabled"] = "Выключено"
	L["Discrete Rotation"] = "Дискретный поворот"
	L["Display"] = "Индикация"
	L["Display Icon"] = "Отображать иконку"
	L["Display Text"] = "Отображать текст"
	L["Displays a text, works best in combination with other displays"] = "Отображает текст, лучше всего работает в сочетании с другими индикациями"
	L["Distribute Horizontally"] = "Распределить по горизонтали"
	L["Distribute Vertically"] = "Распределить по вертикали"
	L["Do not group this display"] = "Не группировать эту индикацию"
	L["Done"] = "Выполнено"
	L["Down"] = "Переместить вниз"
	L["Drag to move"] = "Перетащите для перемещения"
	L["Duplicate"] = "Дублировать"
	L["Duplicate All"] = "Дублировать все"
	L["Duration (s)"] = "Длительность"
	L["Duration Info"] = "Информация о длительности"
	L["Dynamic Group"] = "Динамическая Группа"
	L["Dynamic Information"] = "Динамическая информация"
	L["Dynamic information from first active trigger"] = "Динамическая информация из первого активного триггера"
	L["Dynamic information from Trigger %i"] = "Динамическая информация из Триггера %i"
	L["Dynamic text tooltip"] = [=[Несколько специальных кодов для отображения динамической информации в тексте:

|cFFFF0000%p|r - Прогресс - Оставшееся время таймера или текущее бестаймерное значение
|cFFFF0000%t|r - Всего - Максимальное время таймера или бестаймерное значение
|cFFFF0000%n|r - Название - Название эффекта, заклинания, предмета и т. д. или ID индикации
|cFFFF0000%i|r - Иконка - Иконка, связанная с индикацией
|cFFFF0000%s|r - Стаки - Количество стаков эффекта, предмета, зарядов заклинания и т. д.
|cFFFF0000%c|r - В ручную - Позволяет написать функцию на Lua, возвращаемое значение которой и будет отображено]=]
	L["Enabled"] = "Включено"
	L["End Angle"] = "Конечный угол"
	L["Enter an aura name, partial aura name, or spell id"] = "Введите полное название эффекта, часть его названия или ID заклинания."
	L["Event"] = "Событие"
	L["Event Type"] = "Тип триггера"
	L["Event(s)"] = "Событие(я)"
	L["Everything"] = "Всех вкладок"
	L["Expand"] = "Развернуть"
	L["Expand all loaded displays"] = "Развернуть все загруженные индикации"
	L["Expand all non-loaded displays"] = "Развернуть все не загруженные индикации"
	L["Expansion is disabled because this group has no children"] = "Расширение отключено, так как эта группа не имеет индикаций"
	L["Export to Lua table..."] = "Экспорт в таблицу Lua ..."
	L["Export to string..."] = "Экспорт в строку ..."
	L["Fade"] = "Выцветание"
	L["Fade In"] = "Появление"
	L["Fade Out"] = "Исчезновение"
	L["False"] = "Ложь"
	L["Finish"] = "Конечная"
	L["Fire Orb"] = "Огненный шар"
	L["Font"] = "Шрифт"
	L["Font Flags"] = "Контур шрифта"
	L["Font Size"] = "Размер шрифта"
	L["Font Type"] = "Тип шрифта"
	L["Foreground Color"] = "Основной цвет"
	L["Foreground Texture"] = "Основная текстура"
	L["Frame"] = "Кадр"
	L["Frame Strata"] = "Слой кадра"
	L["From Template"] = "Из шаблона"
	L["Full Scan"] = "Полное сканирование"
	L["General Text Settings"] = "Общие настройки текста"
	--[[Translation missing --]]
	L["Global Conditions"] = "Global Conditions"
	L["Glow"] = "Свечение"
	L["Glow Action"] = "Действие"
	L["Green Rune"] = "Зеленая руна"
	L["Group"] = "Группа"
	L["Group (verb)"] = "Группировать"
	L["Group aura count description"] = [=[Количество участников группы (рейда), к которым должен быть применен один или более данных эффектов, чтобы триггер сработал.

Если указано целое число (5), то количество человек с этим эффектом будет сравниваться с введенным числом. Если указана обыкновенная (1/2) или десятичная (0.5) дроби, процент (50%%), то эта часть участников группы (рейда) и будет использована в сравнении.

|cFF4444FFПримеры:|r
|cFF00CC00> 0|r - сработает, когда кто-нибудь из группы попал под воздействие
|cFF00CC00= 100%%|r - сработает, когда вся группа попала под воздействие
|cFF00CC00!= 2|r - сработает, если число человек с этим эффектом не равно 2 (0 или 1 или >2)
|cFF00CC00<= 0.8|r - сработает, если менее 80%% группы под воздействием эффекта (4 из 5, 7 из 10 человек)
|cFF00CC00> 1/2|r - сработает, если больше половины группы по воздействием эффекта (5 из 5, 6 из 10 человек)
|cFF00CC00>= 0|r - всегда срабатывает, несмотря ни на что]=]
	L["Group Member Count"] = "Кол-во участников"
	L["Group Scale"] = "Масштаб группы"
	L["Grow"] = "Направление роста"
	L["Hawk"] = "Ястреб"
	L["Height"] = "Высота"
	L["Hide"] = "Скрыть"
	L["Hide on"] = "Скрыть на"
	L["Hide this group's children"] = "Скрыть индикации этой группы"
	L["Hide When Not In Group"] = "Скрыть когда не в группе"
	L["Horizontal Align"] = "Выравнивание по горизонтали"
	L["Horizontal Bar"] = "Горизонтальная полоса"
	L["Horizontal Blizzard Raid Bar"] = "Горизонтальная рейд полоса Blizzard"
	L["Huge Icon"] = "Огромная иконка"
	L["Hybrid Position"] = "Гибридная позиция"
	L["Hybrid Sort Mode"] = "Режим гибридной сортировки"
	L["Icon"] = "Иконка"
	--[[Translation missing --]]
	L["Icon Alpha"] = "Icon Alpha"
	L["Icon Color"] = "Цвет иконки"
	L["Icon Info"] = "Информация об иконке"
	L["Icon Inset"] = "Вставка иконки"
	L["If"] = "Если"
	L["If this option is enabled, you are no longer able to import auras."] = "Если этот параметр включен, то вы больше не сможете импортировать индикации"
	L["If Trigger %s"] = "Если Триггер %s"
	L["Ignored"] = "Игнорируется"
	L["Import"] = "Импорт"
	L["Import a display from an encoded string"] = "Импортировать индикацию из закодированной строки"
	L["Inverse"] = "Обратная"
	L["Inverse Slant"] = "В обратную сторону"
	L["Justify"] = "Выравнивание"
	L["Keep Aspect Ratio"] = "Сохранять пропорции"
	L["Leaf"] = "Лист"
	L["Left 2 HUD position"] = "Позиция 2-го левого HUD"
	L["Left HUD position"] = "Позиция левого HUD"
	L["Left Text"] = "Текст слева"
	L["Load"] = "Загрузка"
	L["Loaded"] = "Загружено"
	L["Loop"] = "Зациклить"
	L["Low Mana"] = "Мало маны"
	L["Main"] = "Основная"
	L["Manage displays defined by Addons"] = "Управление индикациями, определенными Аддонами"
	L["Medium Icon"] = "Средняя иконка"
	L["Message"] = "Сообщение"
	L["Message Prefix"] = "Префикс сообщения"
	L["Message Suffix"] = "Суффикс сообщения"
	L["Message Type"] = "Тип сообщения"
	L["Message type:"] = "Тип сообщения:"
	L["Mirror"] = "Отразить"
	L["Model"] = "Модель"
	L["Move Down"] = "Переместить вниз"
	L["Move this display down in its group's order"] = "Переместить индикацию вниз в порядке элементов группы"
	L["Move this display up in its group's order"] = "Переместить индикацию вверх в порядке элементов группы"
	L["Move Up"] = "Переместить вверх"
	L["Multiple Displays"] = "Несколько индикаций"
	L["Multiple Triggers"] = "Несколько триггеров"
	L["Multiselect ignored tooltip"] = [=[
|cFFFF0000Ничего|r - |cFF777777Одно|r - |cFF777777Несколько|r
Этот параметр не определяет, когда индикация должна быть загружена]=]
	L["Multiselect multiple tooltip"] = [=[
|cFF777777Ничего|r - |cFF777777Одно|r - |cFF00FF00Несколько|r
Можно выбрать любое количество соответствующих значений. Выполнение любого условия приведет к загрузке]=]
	L["Multiselect single tooltip"] = [=[
|cFF777777Ничего|r - |cFF00FF00Одно|r - |cFF777777Несколько|r
Можно выбрать только одно соответствующее значение]=]
	L["Name Info"] = "Информация о названии"
	L["Negator"] = "Не"
	L["Never"] = "Никогда"
	L["New"] = "Новая индикация"
	L["No"] = "Нет"
	L["No Children"] = "Нет индикаций"
	L["No tooltip text"] = "Без подсказки"
	L["None"] = "Нет"
	L["Not all children have the same value for this option"] = "Не все индикации имеют одинаковое значение для этого параметра"
	L["Not Loaded"] = "Не загружено"
	L["Offer a guided way to create auras for your class"] = "Предлагаем простой способ создания индикаций для вашего класса"
	L["Okay"] = "Ок"
	L["On Hide"] = "При скрытии"
	L["On Init"] = "При инициализации"
	L["On Show"] = "При появлении"
	L["Only match auras cast by people other than the player"] = "Совпадение для эффектов других людей, но не игрока"
	L["Only match auras cast by the player"] = "Совпадение только для эффектов игрока"
	L["Operator"] = "Оператор"
	L["Options will open after combat ends."] = "Параметры откроются после окончания боя."
	L["or"] = "или"
	L["Orange Rune"] = "Оранжевая руна"
	L["Orientation"] = "Ориентация"
	L["Outline"] = "Контур"
	L["Overflow"] = "Переполнение"
	L["Overlay %s Info"] = "Информация о наложении %s"
	L["Overlays"] = "Настройка цвета наложений"
	L["Own Only"] = "Только своё"
	L["Paste Action Settings"] = "Вставить настройки действий"
	L["Paste Animations Settings"] = "Вставить настройки анимации"
	L["Paste Condition Settings"] = "Вставить настройки условий"
	L["Paste Display Settings"] = "Вставить настройки индикации"
	L["Paste Group Settings"] = "Вставить настройки группы"
	L["Paste Load Settings"] = "Вставить настройки загрузки"
	L["Paste Settings"] = "Вставить настройки"
	L["Paste text below"] = "Вставьте текст ниже"
	L["Paste Trigger Settings"] = "Вставить настройки триггера"
	L["Play Sound"] = "Проиграть звук"
	L["Portrait Zoom"] = "Увеличить портрет"
	--[[Translation missing --]]
	L["Position Settings"] = "Position Settings"
	L["Preset"] = "Предустановка"
	L["Prevents duration information from decreasing when an aura refreshes. May cause problems if used with multiple auras with different durations."] = "Не позволяет снижать информацию о длительности эффекта при его обновлении. Может вызвать проблемы при использовании с несколькими эффектами разной длительности."
	L["Processed %i chars"] = "Обработано %i |4символ:символа:символов;"
	L["Progress Bar"] = "Полоса Прогресса"
	L["Progress Texture"] = "Текстура Прогресса"
	L["Purple Rune"] = "Фиолетовая руна"
	L["Put this display in a group"] = "Переместить эту индикацию в группу"
	L["Radius"] = "Радиус"
	L["Re-center X"] = "Рецентровать X"
	L["Re-center Y"] = "Рецентровать Y"
	--[[Translation missing --]]
	L["Regions of type \"%s\" are not supported."] = "Regions of type \"%s\" are not supported."
	L["Remaining Time"] = "Оставшееся время"
	L["Remaining Time Precision"] = "Точность оставшегося времени"
	L["Remove"] = "Удалить"
	L["Remove this condition"] = "Удалить это условие"
	L["Remove this display from its group"] = "Убрать индикацию из этой группы"
	L["Remove this property"] = "Удалить это свойство"
	L["Rename"] = "Переименовать"
	L["Repeat After"] = "Повторять после"
	L["Repeat every"] = "Повторять каждые"
	L["Required for Activation"] = "Необходимо для активации"
	L["Right 2 HUD position"] = "Позиция 2-го правого HUD"
	L["Right HUD position"] = "Позиция правого HUD"
	L["Right Text"] = "Текст справа"
	L["Right-click for more options"] = "Правый клик для дополнительных опций"
	L["Rotate"] = "Поворот"
	L["Rotate In"] = [=[Поворот в
(исходное положение)]=]
	L["Rotate Out"] = [=[Поворот из
(исходного положения)]=]
	L["Rotate Text"] = "Повернуть текст"
	L["Rotation"] = "Поворот"
	L["Rotation Mode"] = "Режим вращения"
	L["Same"] = "Похожие"
	L["Scale"] = "Масштаб"
	L["Search"] = "Поиск"
	L["Select the auras you always want to be listed first"] = "Выберите индикации для гибридной позиции"
	L["Send To"] = "Отправить"
	L["Set Parent to Anchor"] = "Исходное крепление"
	L["Set tooltip description"] = "Описание подсказки"
	L["Settings"] = "Параметры"
	L["Shift-click to create chat link"] = "Shift-клик для создания ссылки чата"
	L["Show all matches (Auto-clone)"] = "Показать все совпадения (Авто-клонирование)"
	L["Show Cooldown Text"] = "Показать отсчет времени"
	L["Show If Unit Is Invalid"] = "Показать, если нет допустимой цели"
	L["Show model of unit "] = "Показать модель элемента"
	L["Show On"] = "Показать"
	L["Show this group's children"] = "Показать индикации этой группы"
	L["Shows a 3D model from the game files"] = "Показывает 3D модель из файлов игры"
	L["Shows a custom texture"] = "Показывает свою текстуру"
	L["Shows a progress bar with name, timer, and icon"] = "Показывает полосу прогресса с названием, таймером и иконкой"
	L["Shows a spell icon with an optional cooldown overlay"] = "Показывает иконку заклинания с наложением анимации восстановления (перезарядки)"
	L["Shows a texture that changes based on duration"] = "Показывает текстуру, меняющуюся в зависимости от длительности"
	L["Shows one or more lines of text, which can include dynamic information such as progress or stacks"] = "Показывает одну или несколько строк текста, которые могут включать в себя динамическую информацию такую как длительность или стаки"
	L["Size"] = "Размер"
	L["Slant Amount"] = "Уровень наклона"
	L["Slant Mode"] = "Режим наклона"
	L["Slanted"] = "Наклонная текстура"
	L["Slide"] = "Перемещение"
	L["Slide In"] = "Приближение"
	L["Slide Out"] = "Отдаление"
	L["Small Icon"] = "Маленькая иконка"
	L["Smooth Progress"] = "Плавный прогресс"
	L["Sort"] = "Сортировка"
	L["Sound"] = "Звук"
	L["Sound Channel"] = "Звуковой канал"
	L["Sound File Path"] = "Путь к звуковому файлу"
	L["Sound Kit ID"] = "ID звукового набора (см. ru.wowhead.com/sounds)"
	L["Space"] = "Отступ"
	L["Space Horizontally"] = "Отступ по горизонтали"
	L["Space Vertically"] = "Отступ по вертикали"
	L["Spark"] = "Вспышка"
	L["Spark Settings"] = "Настройки вспышки"
	L["Spark Texture"] = "Текстура вспышки"
	L["Specific Unit"] = "Конкретная единица"
	L["Spell ID"] = "ID заклинания"
	L["Stack Count"] = "Кол-во cтаков"
	L["Stack Info"] = "Информация о стаках"
	L["Stacks"] = "Стаки"
	L["Stacks Settings"] = "Настройки стаков"
	L["Stagger"] = "Выступ (смещение уровня)"
	L["Star"] = "Звезда"
	L["Start"] = "Начальная"
	L["Start Angle"] = "Начальный угол"
	L["Status"] = "Статус"
	L["Stealable"] = "Можно украсть"
	L["Sticky Duration"] = "Липкая длительность"
	L["Stop Sound"] = "Остановить звук"
	L["Symbol Settings"] = "Настройки иконки"
	L["Temporary Group"] = "Временная Группа"
	L["Text"] = "Текст"
	L["Text Color"] = "Цвет текста"
	L["Text Position"] = "Позиция текста"
	L["Texture"] = "Текстура"
	L["Texture Info"] = "Информация о текстуре"
	L["Texture Wrap"] = "Режим обертки текстурой"
	L["The duration of the animation in seconds."] = "Длительность анимации в секундах."
	L["The duration of the animation in seconds. The finish animation does not start playing until after the display would normally be hidden."] = [=[Длительность анимации в секундах.
Конечная анимация не начнет отображаться, пока индикация не будет нормально скрыта  (должен сработать детриггер).]=]
	L["The type of trigger"] = "Тип триггера"
	L["Then "] = "Тогда "
	L["This display is currently loaded"] = "Эта индикация загружена"
	L["This display is not currently loaded"] = "Эта индикация не загружена"
	L["This region of type \"%s\" is not supported."] = "Этот тип Региона \"%s\" не поддерживается"
	L["Time in"] = "Время"
	L["Tiny Icon"] = "Крошечная иконка"
	L["To Frame's"] = "Относительно кадра"
	L["to group's"] = "в группы"
	L["To Personal Ressource Display's"] = "На индикаторе личного ресурса"
	L["To Screen's"] = "Относительно экрана"
	L["Toggle the visibility of all loaded displays"] = "Переключить видимость всех загруженных индикаций"
	L["Toggle the visibility of all non-loaded displays"] = "Переключить видимость всех не загруженных индикаций"
	L["Toggle the visibility of this display"] = "Переключить видимость этой индикации"
	L["Tooltip"] = "Подсказка"
	L["Tooltip on Mouseover"] = "Подсказка при наведении курсора"
	L["Top HUD position"] = "Верхняя позиция HUD"
	L["Top Text"] = "Текст вверху"
	L["Total Time Precision"] = "Точность общего времени"
	L["Trigger"] = "Триггер"
	L["Trigger %d"] = "Триггер %d"
	L["Trigger:"] = "Триггер:"
	L["True"] = "Истина"
	L["Type"] = "Тип"
	L["Undefined"] = "Не определено"
	L["Ungroup"] = "Разгруппировать"
	L["Unit"] = "Единица"
	L["Unlike the start or finish animations, the main animation will loop over and over until the display is hidden."] = "В отличие от начальной или конечной анимации, основная зациклена и будет повторяться пока индикация не пропадет."
	L["Up"] = "Переместить вверх"
	L["Update Custom Text On..."] = "Обновить свой текст на..."
	L["Use Full Scan (High CPU)"] = "Использовать Полное сканирование (загрузка ЦП)"
	L["Use nth value from tooltip:"] = "Использовать n-ое значение из подсказки:"
	L["Use SetTransform"] = "Использовать ф-ю SetTransform"
	L["Use tooltip \"size\" instead of stacks"] = "Использовать значение из подсказки вместо стаков"
	L["Used in auras:"] = "Использовано в индикациях:"
	L["Version: "] = "Версия: "
	L["Vertical Align"] = "Выравнивание по вертикали"
	L["Vertical Bar"] = "Вертикальная полоса"
	L["View"] = "Вид"
	L["Width"] = "Ширина"
	L["X Offset"] = "Смещение по X"
	L["X Rotation"] = "Поворот X"
	L["X Scale"] = "Масштаб по X"
	L["Y Offset"] = "Смещение по Y"
	L["Y Rotation"] = "Поворот Y"
	L["Y Scale"] = "Масштаб по Y"
	L["Yellow Rune"] = "Жёлтая руна"
	L["Yes"] = "Да"
	L["You are about to delete %d aura(s). |cFFFF0000This cannot be undone!|r Would you like to continue?"] = [=[Вы собираетесь удалить %d |4индикацию:индикации:индикаций;.
|cFFFF0000Это действие нельзя отменить!|r
Вы хотите продолжить?]=]
	L["Z Offset"] = "Смещение по Z"
	L["Z Rotation"] = "Поворот Z"
	L["Zoom"] = "Масштабирование"
	L["Zoom In"] = "Увеличение"
	L["Zoom Out"] = "Уменьшение"

