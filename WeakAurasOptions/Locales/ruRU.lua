if not(GetLocale() == "ruRU") then
  return
end

local L = WeakAuras.L

-- WeakAuras/Options
	--[[Translation missing --]]
	L[" by "] = " by "
	--[[Translation missing --]]
	L[" Configuration"] = " Configuration"
	L["-- Do not remove this comment, it is part of this trigger: "] = "-- Не удаляйте этот комментарий, он является частью этого триггера: "
	--[[Translation missing --]]
	L[" to version "] = " to version "
	L["% of Progress"] = "% прогресса"
	L["%i auras selected"] = "%i |4индикация выбрана:индикации выбраны:индикаций выбрано;"
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
	--[[Translation missing --]]
	L["A Unit ID (e.g., party1)."] = "A Unit ID (e.g., party1)."
	L["Actions"] = "Действия"
	L["Add a new display"] = "Добавить новую индикацию"
	L["Add Condition"] = "Добавить условие"
	--[[Translation missing --]]
	L["Add Option"] = "Add Option"
	L["Add Overlay"] = "Добавить наложение (дополнительный прогресс)"
	L["Add Property Change"] = "Добавить свойство"
	L["Add to group %s"] = "Добавить в группу %s"
	L["Add to new Dynamic Group"] = "Добавить в новую динамическую группу"
	L["Add to new Group"] = "Добавить в новую группу"
	L["Add Trigger"] = "Добавить триггер"
	L["Addon"] = "Аддон"
	L["Addons"] = "Аддоны"
	L["Advanced"] = "Комплексный подход"
	L["Align"] = "Выравнивание"
	L["All of"] = "И (все условия)"
	L["Allow Full Rotation"] = "Разрешить полное вращение"
	L["Alpha"] = "Прозрачность"
	L["Anchor"] = "Крепление"
	L["Anchor Point"] = "Точка крепления"
	L["Anchored To"] = "Прикрепить к"
	L["And "] = "И "
	L["and Trigger %s"] = "Триггер %s"
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
	L["Any of"] = "ИЛИ (любое условие)"
	L["Apply Template"] = "Применить шаблон"
	L["Arcane Orb"] = "Чародейский шар"
	L["At a position a bit left of Left HUD position."] = "Немного левее позиции левого HUD"
	L["At a position a bit left of Right HUD position"] = "Немного правее позиции правого HUD"
	L["At the same position as Blizzard's spell alert"] = "В таком же положении, как предупреждение заклинаний Blizzard"
	L["Aura Name"] = "Название ауры"
	--[[Translation missing --]]
	L["Aura Name Pattern"] = "Aura Name Pattern"
	L["Aura Type"] = "Тип эффекта"
	L["Aura(s)"] = "Эффекты"
	--[[Translation missing --]]
	L["Author Options"] = "Author Options"
	L["Auto"] = "Авто"
	--[[Translation missing --]]
	L["Auto-Clone (Show All Matches)"] = "Auto-Clone (Show All Matches)"
	L["Auto-cloning enabled"] = "Автоклонирование включено"
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
	--[[Translation missing --]]
	L["Can be a Name or a Unit ID (e.g. party1). A name only works on friendly players in your group."] = "Can be a Name or a Unit ID (e.g. party1). A name only works on friendly players in your group."
	L["Cancel"] = "Отмена"
	L["Channel Number"] = "Номер канала"
	L["Chat Message"] = "Сообщение в чат"
	L["Check On..."] = "Проверять..."
	L["Children:"] = "Индикации:"
	L["Choose"] = "Выбрать"
	L["Choose Trigger"] = "Выберите триггер"
	L["Choose whether the displayed icon is automatic or defined manually"] = "Выберите, будет ли иконка задана автоматически или вручную"
	--[[Translation missing --]]
	L["Clip Overlays"] = "Clip Overlays"
	L["Clone option enabled dialog"] = [=[Вы активировали параметр, использующий |cFFFF0000Автоклонирование|r.

|cFFFF0000Автоклонирование|r заставляет индикацию автоматически дублироваться для отображения нескольких источников информации. Если вы не разместите ее в |cFF22AA22Динамической группе|r, то все клоны будут отображаться друг над другом в большой куче.

Вы хотите поместить эту индикацию в новую |cFF22AA22Динамическую группу|r?]=]
	L["Close"] = "Закрыть"
	L["Collapse"] = "Свернуть"
	L["Collapse all loaded displays"] = "Свернуть все загруженные индикации"
	L["Collapse all non-loaded displays"] = "Свернуть все не загруженные индикации"
	L["Color"] = "Цвет"
	L["color"] = "цвет"
	L["Combinations"] = "Логические операции"
	--[[Translation missing --]]
	L["Combine Matches Per Unit"] = "Combine Matches Per Unit"
	--[[Translation missing --]]
	L["Compare against the number of units affected."] = "Compare against the number of units affected."
	L["Compress"] = "Сжать"
	L["Condition %i"] = "Условие %i"
	L["Conditions"] = "Условия"
	--[[Translation missing --]]
	L["Configure what options appear on this pannel."] = "Configure what options appear on this pannel."
	L["Constant Factor"] = "Постоянный параметр"
	L["Control-click to select multiple displays"] = "Ctrl-клик для выбора нескольких индикаций"
	L["Controls the positioning and configuration of multiple displays at the same time"] = "Управляет позиционированием и настройкой нескольких индикаций одновременно"
	--[[Translation missing --]]
	L["Convert to New Aura Trigger"] = "Convert to New Aura Trigger"
	L["Convert to..."] = "Преобразовать в ..."
	L["Cooldown"] = "Перезарядка"
	--[[Translation missing --]]
	L["Cooldown Edge"] = "Cooldown Edge"
	--[[Translation missing --]]
	L["Cooldown Settings"] = "Cooldown Settings"
	--[[Translation missing --]]
	L["Cooldown Swipe"] = "Cooldown Swipe"
	L["Copy settings..."] = "Копировать настройки из ..."
	L["Copy to all auras"] = "Копировать во все индикации"
	L["Copy URL"] = "Копировать строку URL"
	L["Count"] = "Кол-во"
	--[[Translation missing --]]
	L["Counts the number of matches over all units."] = "Counts the number of matches over all units."
	L["Creating buttons: "] = "Создание кнопок:"
	L["Creating options: "] = "Создание настроек:"
	L["Crop X"] = "Обрезать по X"
	L["Crop Y"] = "Обрезать по Y"
	L["Custom"] = "Самостоятельно"
	L["Custom Code"] = "Свой код"
	--[[Translation missing --]]
	L["Custom Configuration"] = "Custom Configuration"
	L["Custom Function"] = "Своя функция"
	--[[Translation missing --]]
	L["Custom Options"] = "Custom Options"
	L["Custom Trigger"] = "Свой триггер"
	L["Custom trigger event tooltip"] = [=[Напишите события, которые будут вызывать проверку вашего триггера. Несколько событий должны быть разделены запятыми или пробелами.

|cFF4444FFПример:|r
UNIT_POWER  UNIT_AURA, PLAYER_TARGET_CHANGED]=]
	L["Custom trigger status tooltip"] = [=[Напишите события, которые будут вызывать проверку вашего триггера. Несколько событий должны быть разделены запятыми или пробелами.
Поскольку это триггер статуса, указанные события могут быть переданы WeakAuras без ожидаемых аргументов.

|cFF4444FFПример:|r
UNIT_POWER  UNIT_AURA, PLAYER_TARGET_CHANGED]=]
	L["Custom Untrigger"] = "Свой детриггер"
	L["Custom Variables"] = "Свои переменные"
	L["Debuff Type"] = "Тип дебаффа"
	L["Default"] = "По умолчанию"
	L["Delete"] = "Удалить"
	L["Delete all"] = "Удалить всё"
	L["Delete children and group"] = "Удалить индикации и группу"
	L["Delete Trigger"] = "Удалить триггер"
	L["Desaturate"] = "Обесцветить"
	--[[Translation missing --]]
	L["Description"] = "Description"
	--[[Translation missing --]]
	L["Description Text"] = "Description Text"
	L["Differences"] = "Различия"
	L["Disable Import"] = "Отключить импорт"
	L["Disabled"] = "Выключено"
	L["Discrete Rotation"] = "Дискретный поворот"
	L["Display"] = "Отображение"
	L["Display Icon"] = "Отображать иконку"
	--[[Translation missing --]]
	L["Display Name"] = "Display Name"
	L["Display Text"] = "Отображать текст"
	L["Displays a text, works best in combination with other displays"] = "Отображает текст, лучше всего работает в сочетании с другими индикациями"
	L["Distribute Horizontally"] = "Распределить по горизонтали"
	L["Distribute Vertically"] = "Распределить по вертикали"
	L["Do not group this display"] = "Не группировать эту индикацию"
	L["Done"] = "Выполнено"
	--[[Translation missing --]]
	L["Don't skip this Version"] = "Don't skip this Version"
	L["Down"] = "Переместить вниз"
	L["Drag to move"] = "Перетащите для перемещения"
	L["Duplicate"] = "Дублировать"
	L["Duplicate All"] = "Дублировать все"
	L["Duration (s)"] = "Длительность"
	L["Duration Info"] = "Информация о длительности"
	L["Dynamic Duration"] = "Динамическое значение"
	L["Dynamic Group"] = "Динамическая группа"
	--[[Translation missing --]]
	L["Dynamic Group Settings"] = "Dynamic Group Settings"
	L["Dynamic Information"] = "Динамическая информация"
	L["Dynamic information from first active trigger"] = "Динамическая информация из первого активного триггера"
	L["Dynamic information from Trigger %i"] = "Динамическая информация из Триггера %i"
	L["Dynamic text tooltip"] = [=[Несколько специальных кодов для отображения динамической информации в тексте:

|cFFFF0000%p|r - Прогресс - Оставшееся время таймера или текущее бестаймерное значение
|cFFFF0000%t|r - Всего - Максимальное время таймера или бестаймерное значение
|cFFFF0000%n|r - Название - Название эффекта, заклинания, предмета и т. д. или ID индикации
|cFFFF0000%i|r - Иконка - Иконка, связанная с индикацией
|cFFFF0000%s|r - Стаки - Количество стаков эффекта, предмета, зарядов заклинания и т. д.
|cFFFF0000%c|r - Свой код - Позволяет написать функцию на Lua, которая возвращает одно значение или их список. Для отображения единственного значения используйте |cFFFF0000%c|r, для n-го значения из списка - |cFFFF0000%cn|r]=]
	--[[Translation missing --]]
	L["Enable"] = "Enable"
	L["Enabled"] = "Включено"
	L["End Angle"] = "Конечный угол"
	--[[Translation missing --]]
	L["Enter a Spell ID"] = "Enter a Spell ID"
	L["Enter an aura name, partial aura name, or spell id"] = "Введите полное название эффекта, часть его названия или ID заклинания."
	--[[Translation missing --]]
	L["Enter an Aura Name, partial Aura Name, or Spell ID. A Spell ID will match any spells with the same name."] = "Enter an Aura Name, partial Aura Name, or Spell ID. A Spell ID will match any spells with the same name."
	--[[Translation missing --]]
	L["Enter Author Mode"] = "Enter Author Mode"
	--[[Translation missing --]]
	L["Enter User Mode"] = "Enter User Mode"
	--[[Translation missing --]]
	L["Enter user mode."] = "Enter user mode."
	L["Event"] = "Событие"
	L["Event Type"] = "Тип триггера"
	L["Event(s)"] = "Событие(я)"
	L["Everything"] = "Всех вкладок"
	--[[Translation missing --]]
	L["Exact Spell ID(s)"] = "Exact Spell ID(s)"
	L["Exact Spell Match"] = "Точное совпадение"
	L["Expand"] = "Развернуть"
	L["Expand all loaded displays"] = "Развернуть все загруженные индикации"
	L["Expand all non-loaded displays"] = "Развернуть все не загруженные индикации"
	L["Expansion is disabled because this group has no children"] = "Расширение отключено, так как эта группа не имеет индикаций"
	L["Export to Lua table..."] = "Экспорт в таблицу Lua ..."
	L["Export to string..."] = "Экспорт в строку ..."
	L["External"] = "Внешний ресурс"
	L["Fade"] = "Выцветание"
	L["Fade In"] = "Появление"
	L["Fade Out"] = "Исчезновение"
	L["False"] = "Ложь"
	--[[Translation missing --]]
	L["Fetch Affected/Unaffected Names"] = "Fetch Affected/Unaffected Names"
	L["Filter by Group Role"] = "Применить фильтр:"
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
	--[[Translation missing --]]
	L["From version "] = "From version "
	L["General Text Settings"] = "Общие настройки текста"
	L["Global Conditions"] = "Универсальные условия"
	L["Glow Action"] = "Действие"
	--[[Translation missing --]]
	L["Glow Color"] = "Glow Color"
	--[[Translation missing --]]
	L["Glow Settings"] = "Glow Settings"
	--[[Translation missing --]]
	L["Glow Type"] = "Glow Type"
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
	--[[Translation missing --]]
	L["Group contains updates from Wago"] = "Group contains updates from Wago"
	L["Group Member Count"] = "Кол-во участников"
	L["Group Role"] = "Роль в группе"
	L["Group Scale"] = "Масштаб группы"
	--[[Translation missing --]]
	L["Group Settings"] = "Group Settings"
	L["Grow"] = "Направление роста"
	L["Hawk"] = "Ястреб"
	L["Height"] = "Высота"
	L["Hide"] = "Скрыть"
	L["Hide on"] = "Скрыть на"
	L["Hide this group's children"] = "Скрыть индикации этой группы"
	L["Hide When Not In Group"] = "Скрыть когда не в группе"
	L["Horizontal Align"] = "Выравнивание по горизонтали"
	L["Horizontal Bar"] = "Горизонтальная полоса"
	L["Huge Icon"] = "Огромная иконка"
	L["Hybrid Position"] = "Гибридная позиция"
	L["Hybrid Sort Mode"] = "Режим гибридной сортировки"
	L["Icon"] = "Иконка"
	L["Icon Alpha"] = "Прозрачность иконки"
	L["Icon Color"] = "Цвет иконки"
	L["Icon Info"] = "Информация об иконке"
	L["Icon Inset"] = "Вставка иконки"
	--[[Translation missing --]]
	L["Icon Settings"] = "Icon Settings"
	L["If"] = "Если"
	--[[Translation missing --]]
	L["If checked, then this space will span across multiple lines."] = "If checked, then this space will span across multiple lines."
	L["If this option is enabled, you are no longer able to import auras."] = "Если этот параметр включен, то вы больше не сможете импортировать индикации"
	L["If Trigger %s"] = "Если Триггер %s"
	--[[Translation missing --]]
	L["If unchecked, then a default color will be used (usually yellow)"] = "If unchecked, then a default color will be used (usually yellow)"
	--[[Translation missing --]]
	L["If unchecked, then this space will fill the entire line it is on in User Mode."] = "If unchecked, then this space will fill the entire line it is on in User Mode."
	--[[Translation missing --]]
	L["Ignore all Updates"] = "Ignore all Updates"
	--[[Translation missing --]]
	L["Ignore Self"] = "Ignore Self"
	L["Ignore self"] = "Исключить себя из числа участников"
	L["Ignored"] = "Игнорируется"
	L["Import"] = "Импорт"
	L["Import a display from an encoded string"] = "Импортировать индикацию из закодированной строки"
	L["Invalid Item Name/ID/Link"] = "Неверное название, ссылка или ID предмета"
	L["Invalid Spell ID"] = "Неверный ID заклинания"
	L["Invalid Spell Name/ID/Link"] = "Неверное название, ссылка или ID заклинания"
	L["Inverse"] = "Обратная"
	L["Inverse Slant"] = "В обратную сторону"
	--[[Translation missing --]]
	L["Is Stealable"] = "Is Stealable"
	L["Justify"] = "Выравнивание"
	L["Keep Aspect Ratio"] = "Сохранять пропорции"
	--[[Translation missing --]]
	L["Key for aura_env.config at which the user value can be found."] = "Key for aura_env.config at which the user value can be found."
	L["Leaf"] = "Лист"
	L["Left 2 HUD position"] = "Позиция 2-го левого HUD"
	L["Left HUD position"] = "Позиция левого HUD"
	L["Left Text"] = "Текст слева"
	--[[Translation missing --]]
	L["Length"] = "Length"
	L["Load"] = "Загрузка"
	L["Loaded"] = "Загружено"
	L["Loop"] = "Зациклить"
	L["Low Mana"] = "Мало маны"
	L["Main"] = "Основная"
	L["Manage displays defined by Addons"] = "Управление индикациями, определенными аддонами"
	--[[Translation missing --]]
	L["Match Count"] = "Match Count"
	--[[Translation missing --]]
	L["Max"] = "Max"
	--[[Translation missing --]]
	L["Max Length"] = "Max Length"
	L["Medium Icon"] = "Средняя иконка"
	L["Message"] = "Сообщение"
	L["Message Prefix"] = "Префикс сообщения"
	L["Message Suffix"] = "Суффикс сообщения"
	L["Message Type"] = "Тип сообщения"
	--[[Translation missing --]]
	L["Min"] = "Min"
	L["Mirror"] = "Отразить"
	L["Model"] = "Модель"
	--[[Translation missing --]]
	L["Model Settings"] = "Model Settings"
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
	--[[Translation missing --]]
	L["Name Pattern Match"] = "Name Pattern Match"
	--[[Translation missing --]]
	L["Name(s)"] = "Name(s)"
	L["Negator"] = "Не"
	L["Never"] = "Никогда"
	L["New"] = "Новая индикация"
	--[[Translation missing --]]
	L["New Value"] = "New Value"
	L["No"] = "Нет"
	L["No Children"] = "Нет индикаций"
	L["No tooltip text"] = "Без подсказки"
	L["None"] = "Нет"
	L["Not all children have the same value for this option"] = "Не все индикации имеют одинаковое значение для этого параметра"
	L["Not Loaded"] = "Не загружено"
	L["Offer a guided way to create auras for your class"] = "Предлагаем пошаговое руководство по созданию индикаций для вашего класса"
	L["Okay"] = "Ок"
	L["On Hide"] = "При скрытии"
	L["On Init"] = "При инициализации"
	L["On Show"] = "При появлении"
	L["Only match auras cast by people other than the player"] = "Совпадение для эффектов других людей, но не игрока"
	--[[Translation missing --]]
	L["Only match auras cast by people other than the player or his pet"] = "Only match auras cast by people other than the player or his pet"
	L["Only match auras cast by the player"] = "Совпадение только для эффектов игрока"
	--[[Translation missing --]]
	L["Only match auras cast by the player or his pet"] = "Only match auras cast by the player or his pet"
	L["Operator"] = "Оператор"
	--[[Translation missing --]]
	L["Option #%i"] = "Option #%i"
	--[[Translation missing --]]
	L["Option %i"] = "Option %i"
	--[[Translation missing --]]
	L["Option key"] = "Option key"
	--[[Translation missing --]]
	L["Option Type"] = "Option Type"
	L["Options will open after combat ends."] = "Параметры откроются после окончания боя."
	L["or"] = "или"
	L["or Trigger %s"] = "Триггер %s"
	L["Orange Rune"] = "Оранжевая руна"
	L["Orientation"] = "Ориентация"
	L["Outline"] = "Контур"
	L["Overflow"] = "Переполнение"
	L["Overlay %s Info"] = "Информация о наложении %s"
	L["Overlays"] = "Настройка цвета наложений"
	L["Own Only"] = "Только своё"
	L["Paste Action Settings"] = "Вставить настройки действий"
	L["Paste Animations Settings"] = "Вставить настройки анимации"
	--[[Translation missing --]]
	L["Paste Author Options Settings"] = "Paste Author Options Settings"
	L["Paste Condition Settings"] = "Вставить настройки условий"
	--[[Translation missing --]]
	L["Paste Custom Configuration"] = "Paste Custom Configuration"
	L["Paste Display Settings"] = "Вставить настройки отображения"
	L["Paste Group Settings"] = "Вставить настройки группы"
	L["Paste Load Settings"] = "Вставить настройки загрузки"
	L["Paste Settings"] = "Вставить настройки"
	L["Paste text below"] = "Вставьте текст ниже"
	L["Paste Trigger Settings"] = "Вставить настройки триггера"
	L["Play Sound"] = "Проиграть звук"
	L["Portrait Zoom"] = "Увеличить портрет"
	L["Position Settings"] = "Настройки размера и расположения"
	--[[Translation missing --]]
	L["Preferred Match"] = "Preferred Match"
	L["Preset"] = "Предустановка"
	L["Prevents duration information from decreasing when an aura refreshes. May cause problems if used with multiple auras with different durations."] = "Не позволяет снижать информацию о длительности эффекта при его обновлении. Может вызвать проблемы при использовании с несколькими эффектами разной длительности."
	L["Processed %i chars"] = "Обработано %i |4символ:символа:символов;"
	L["Progress Bar"] = "Полоса прогресса"
	--[[Translation missing --]]
	L["Progress Bar Settings"] = "Progress Bar Settings"
	L["Progress Texture"] = "Текстура прогресса"
	--[[Translation missing --]]
	L["Progress Texture Settings"] = "Progress Texture Settings"
	L["Purple Rune"] = "Фиолетовая руна"
	L["Put this display in a group"] = "Переместить эту индикацию в группу"
	L["Radius"] = "Радиус"
	L["Re-center X"] = "Рецентрировать по X"
	L["Re-center Y"] = "Рецентрировать по Y"
	L["Regions of type \"%s\" are not supported."] = "Регионы типа \"%s\" не поддерживаются."
	L["Remaining Time"] = "Оставшееся время"
	L["Remaining Time Precision"] = "Точность оставшегося времени"
	L["Remove"] = "Удалить"
	L["Remove this display from its group"] = "Убрать индикацию из этой группы"
	L["Remove this property"] = "Удалить это свойство"
	L["Rename"] = "Переименовать"
	L["Repeat After"] = "Повторять после"
	L["Repeat every"] = "Повторять каждые"
	L["Required for Activation"] = "Необходимо для активации"
	--[[Translation missing --]]
	L["Reset all options in this group to their default values."] = "Reset all options in this group to their default values."
	--[[Translation missing --]]
	L["Reset all options to their default values."] = "Reset all options to their default values."
	--[[Translation missing --]]
	L["Reset ALL to Defaults"] = "Reset ALL to Defaults"
	--[[Translation missing --]]
	L["Reset to Defaults"] = "Reset to Defaults"
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
	L["Set Parent to Anchor"] = "Назначить родителем"
	L["Set tooltip description"] = "Описание подсказки"
	L["Sets the anchored frame as the aura's parent, causing the aura to inherit attributes such as visiblility and scale."] = "Устанавливает данный кадр в качестве родителя для кадра индикации. При этом индикация наследует такие атрибуты, как видимость и масштаб"
	L["Settings"] = "Параметры"
	L["Shift-click to create chat link"] = "Shift-клик для создания ссылки чата"
	L["Show all matches (Auto-clone)"] = "Показать все совпадения (Автоклонирование)"
	L["Show Cooldown Text"] = "Показать отсчет времени"
	--[[Translation missing --]]
	L["Show Glow Effect"] = "Show Glow Effect"
	--[[Translation missing --]]
	L["Show If Unit Does Not Exist"] = "Show If Unit Does Not Exist"
	L["Show If Unit Is Invalid"] = "Показать, если нет допустимой цели"
	--[[Translation missing --]]
	L["Show Matches for"] = "Show Matches for"
	--[[Translation missing --]]
	L["Show Matches for Units"] = "Show Matches for Units"
	L["Show model of unit "] = "Показать модель элемента"
	L["Show On"] = "Показать"
	L["Show this group's children"] = "Показать индикации этой группы"
	L["Shows a 3D model from the game files"] = "Показывает 3D модель из файлов игры"
	L["Shows a custom texture"] = "Показывает свою текстуру"
	L["Shows a progress bar with name, timer, and icon"] = "Показывает полосу прогресса с названием, таймером и иконкой"
	L["Shows a spell icon with an optional cooldown overlay"] = "Показывает иконку заклинания с наложением анимации восстановления (перезарядки)"
	L["Shows a texture that changes based on duration"] = "Показывает текстуру, меняющуюся в зависимости от длительности"
	L["Shows one or more lines of text, which can include dynamic information such as progress or stacks"] = "Показывает одну или несколько строк текста, которые могут включать в себя динамическую информацию такую как длительность или стаки"
	L["Simple"] = "Простой способ"
	L["Size"] = "Размер"
	--[[Translation missing --]]
	L["Skip this Version"] = "Skip this Version"
	L["Slant Amount"] = "Уровень наклона"
	L["Slant Mode"] = "Режим наклона"
	L["Slanted"] = "Наклонная текстура"
	L["Slide"] = "Перемещение"
	L["Slide In"] = "Приближение"
	L["Slide Out"] = "Отдаление"
	--[[Translation missing --]]
	L["Slider Step Size"] = "Slider Step Size"
	L["Small Icon"] = "Маленькая иконка"
	L["Smooth Progress"] = "Плавный прогресс"
	--[[Translation missing --]]
	L["Soft Max"] = "Soft Max"
	--[[Translation missing --]]
	L["Soft Min"] = "Soft Min"
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
	--[[Translation missing --]]
	L["Step Size"] = "Step Size"
	L["Sticky Duration"] = "Липкая длительность"
	--[[Translation missing --]]
	L["Stop ignoring Updates"] = "Stop ignoring Updates"
	L["Stop Sound"] = "Остановить звук"
	L["Symbol Settings"] = "Настройки иконки"
	L["Temporary Group"] = "Временная группа"
	L["Text"] = "Текст"
	L["Text Color"] = "Цвет текста"
	L["Text Position"] = "Позиция текста"
	--[[Translation missing --]]
	L["Text Settings"] = "Text Settings"
	L["Texture"] = "Текстура"
	L["Texture Info"] = "Информация о текстуре"
	--[[Translation missing --]]
	L["Texture Settings"] = "Texture Settings"
	L["Texture Wrap"] = "Режим обертки текстурой"
	L["The duration of the animation in seconds."] = "Длительность анимации в секундах."
	L["The duration of the animation in seconds. The finish animation does not start playing until after the display would normally be hidden."] = [=[Длительность анимации в секундах.
Конечная анимация не начнет отображаться, пока индикация не будет нормально скрыта  (должен сработать детриггер).]=]
	L["The type of trigger"] = "Тип триггера"
	L["Then "] = "Тогда "
	--[[Translation missing --]]
	L["This adds %tooltip, %tooltip1, %tooltip2, %tooltip3 as text replacements."] = "This adds %tooltip, %tooltip1, %tooltip2, %tooltip3 as text replacements."
	L["This display is currently loaded"] = "Эта индикация загружена"
	L["This display is not currently loaded"] = "Эта индикация не загружена"
	L["This region of type \"%s\" is not supported."] = "Регион типа \"%s\" не поддерживается."
	--[[Translation missing --]]
	L["This setting controls what widget is generated in user mode."] = "This setting controls what widget is generated in user mode."
	L["Time in"] = "Время"
	L["Tiny Icon"] = "Крошечная иконка"
	L["To Frame's"] = "Относительно кадра"
	L["to group's"] = "Относительно группы"
	L["To Personal Ressource Display's"] = "На индикаторе личного ресурса"
	L["To Screen's"] = "Относительно экрана"
	L["Toggle the visibility of all loaded displays"] = "Переключить видимость всех загруженных индикаций"
	L["Toggle the visibility of all non-loaded displays"] = "Переключить видимость всех не загруженных индикаций"
	L["Toggle the visibility of this display"] = "Переключить видимость этой индикации"
	L["Tooltip"] = "Подсказка"
	--[[Translation missing --]]
	L["Tooltip Content"] = "Tooltip Content"
	L["Tooltip on Mouseover"] = "Подсказка при наведении курсора"
	--[[Translation missing --]]
	L["Tooltip Pattern Match"] = "Tooltip Pattern Match"
	--[[Translation missing --]]
	L["Tooltip Text"] = "Tooltip Text"
	--[[Translation missing --]]
	L["Tooltip Value"] = "Tooltip Value"
	--[[Translation missing --]]
	L["Tooltip Value #"] = "Tooltip Value #"
	L["Top HUD position"] = "Верхняя позиция HUD"
	L["Top Text"] = "Текст вверху"
	L["Total Time Precision"] = "Точность общего времени"
	L["Trigger"] = "Триггер"
	L["Trigger %d"] = "Триггер %d"
	L["Trigger %s"] = "Триггер %s"
	L["True"] = "Истина"
	L["Type"] = "Тип"
	L["Ungroup"] = "Разгруппировать"
	L["Unit"] = "Единица"
	--[[Translation missing --]]
	L["Unit Count"] = "Unit Count"
	L["Unlike the start or finish animations, the main animation will loop over and over until the display is hidden."] = "В отличие от начальной или конечной анимации, основная зациклена и будет повторяться пока индикация не пропадет."
	L["Up"] = "Переместить вверх"
	--[[Translation missing --]]
	L["Update "] = "Update "
	L["Update Custom Text On..."] = "Обновить свой текст на..."
	--[[Translation missing --]]
	L["Update in Group"] = "Update in Group"
	--[[Translation missing --]]
	L["Update this Aura"] = "Update this Aura"
	L["Use Full Scan (High CPU)"] = "Использовать Полное сканирование (загрузка ЦП)"
	L["Use nth value from tooltip:"] = "Использовать n-ое значение из подсказки:"
	L["Use SetTransform"] = "Использовать ф-ю SetTransform"
	L["Use tooltip \"size\" instead of stacks"] = "Использовать значение из подсказки вместо стаков"
	--[[Translation missing --]]
	L["Use Tooltip Information"] = "Use Tooltip Information"
	--[[Translation missing --]]
	L["Used in Auras:"] = "Used in Auras:"
	L["Used in auras:"] = "Использовано в индикациях:"
	--[[Translation missing --]]
	L["Value %i"] = "Value %i"
	--[[Translation missing --]]
	L["Values are in normalized rgba format."] = "Values are in normalized rgba format."
	--[[Translation missing --]]
	L["Values:"] = "Values:"
	L["Version: "] = "Версия: "
	L["Vertical Align"] = "Выравнивание по вертикали"
	L["Vertical Bar"] = "Вертикальная полоса"
	L["View"] = "Вид"
	--[[Translation missing --]]
	L["Wago Update"] = "Wago Update"
	L["Width"] = "Ширина"
	L["X Offset"] = "Смещение по X"
	L["X Rotation"] = "Поворот по X"
	L["X Scale"] = "Масштаб по X"
	L["Y Offset"] = "Смещение по Y"
	L["Y Rotation"] = "Поворот по Y"
	L["Y Scale"] = "Масштаб по Y"
	L["Yellow Rune"] = "Жёлтая руна"
	L["Yes"] = "Да"
	L["You are about to delete %d aura(s). |cFFFF0000This cannot be undone!|r Would you like to continue?"] = [=[Вы собираетесь удалить %d |4индикацию:индикации:индикаций;.
|cFFFF0000Это действие нельзя отменить!|r
Вы хотите продолжить?]=]
	L["Z Offset"] = "Смещение по Z"
	L["Z Rotation"] = "Поворот по Z"
	L["Zoom"] = "Масштабирование"
	L["Zoom In"] = "Увеличение"
	L["Zoom Out"] = "Уменьшение"

