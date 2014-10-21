﻿local AS, ASL = unpack(AddOnSkins)

function AS:UpdateLocale_ruRU()
	ASL.DataText.ToggleEmbed = 'Показать/скрыть всроенный'
	ASL.DataText.LeftClick = 'ЛКМ для показа'
	ASL.DataText.RightClick = 'ПКМ для скрытия'

	ASL.EmbedSystem.ToggleLeftChat = 'Показать/скрыть левую панель чата'
	ASL.EmbedSystem.ToggleRightChat = 'Показать/ скрыть правую панель чата'
	ASL.EmbedSystem.ToggleEmbed = 'Показать/скрыть встроенный аддон'
	ASL.EmbedSystem.ToggleOptions = 'Toggle Extra Skins/Options'

	ASL.OptionsPanel.SkinDesc = 'Включить/выключить этот скин.'
	ASL.OptionsPanel.EmbedDesc = 'Enable/Disable this embed.'
	ASL.OptionsPanel.OptionDesc = 'Включить/выключить эту опцию.'

	ASL["AddOn Skins"] = "Скины аддонов"
	ASL["Blizzard Skins"] = "Скины Blizzard"
	ASL["BossMod Options"] = "Опции босс-модов"
	ASL["DBM|VEM Font"] = "Шрифт DBM|VEM"
	ASL["DBM|VEM Font Size"] = "Размер шрифта DBM|VEM"
	ASL["DBM|VEM Font Flag"] = "Граница шрифта DBM|VEM"
	ASL["None"] = "Нет"
	ASL["OUTLINE"] = "OUTLINE"
	ASL["THICKOUTLINE"] = "THICKOUTLINE"
	ASL["MONOCHROME"] = "MONOCHROME"
	ASL["MONOCHROMEOUTLINE"] = "MONOCHROMEOUTLINE"
	ASL["DBM|VEM Half-bar Skin"] = "DBM|VEM режим тонких полос"
	ASL["BigWigs Half-Bar"] = "Тонкие полосы BigWigs"
	ASL["Embed Settings"] = "Настройки Встраивания"
	ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS"] = "Настройки для конктроля встроенных аддонов:\n\nДоступны для встраивания: alDamageMeter | Omen | Skada | Recount | TinyDPS"
	ASL["Single Embed System"] = "Встроить одно окно"
	ASL["Embed for Main Panel"] = "Встроить в главную панель"
	ASL["Dual Embed System"] = "Встроить два окна"
	ASL["Embed for Left Window"] = "Левое встроенное окно"
	ASL["Embed for Right Window"] = "Правое встроенное окно"
	ASL["Embed Left Window Width"] = "Ширина левого встроенного окна"
	ASL["Out of Combat (Hide)"] = "Out of Combat (Hide)"
	ASL["Attach SexyCD to action bar"] = "Прикрепить SexyCD к панели команд"
	ASL["Attach CoolLine to action bar"] = "Прикрепить CoolLine к панели команд"
	ASL["Embed Transparancy"] = "Прозрачный фон"
	ASL["Embed Below Top Tab"] = "Не перекрывать панель вкладок"
	ASL["Recount Backdrop"] = "Фон Recount"
	ASL["Skada Backdrop"] = "Фон Skada"
	ASL["Omen Backdrop"] = "Фон Omen"
	ASL["WeakAura AuraBar"] = "Полосы WeakAura"
	ASL["Auction House"] = "Аукцион"
	ASL["FAQ's"] = "FAQ"
	ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"] = "Тонике полосы DBM/VEM слишком плотно расположены. Как исправить?"
	ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."] = "Для использования тонких полос DBM/VEM нужно поменять настройки DBM/VEM. Отступ по Y должен быть как минимум 15."
	ASL["Credits"] = "Благодарности"
	ASL["Credits:"] = "Благодарности:"
	ASL["About/Help"] = "Информация/Помощь"
	ASL["This is where you can find out more of AddOnSkins."] = "По этим ссылкам вы найдете больше информации."
	ASL["Download Link"] = "Скачать"
	ASL["Changelog Link"] = "Изменения"
	ASL["GitLab Link / Report Errors"] = "GitLab / Сообщить об ошибках"
	ASL["Available Skins / Skin Requests"] = "Доступные скины / Запросы на скины"
	ASL["Version"] = "Версия"
	ASL["Left Click to Show"] = "ЛКМ для показа"
	ASL["Right Click to Hide"] = "ПКМ для скрытия"
	ASL["Left Click:"] = "ЛКМ"
	ASL["Right Click:"] = "ПКМ:"
	ASL["Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory."] = "Системный конфликт: Пожалуйста, удалите '%s' из вашей папки 'World of Warcraft\\Interface\\AddOns\\'."
	ASL["Skin Template"] = "Шаблон скина"
	ASL["Hide Chat Frame"] = "Скрыть фрейм чата"
	ASL["Embed OoC Delay"] = "Embed OoC Delay"
end