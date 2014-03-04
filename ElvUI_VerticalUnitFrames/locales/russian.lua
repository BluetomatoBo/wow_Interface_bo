local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "ruRU")
if not L then return; end

L["ElvUI VerticalUnitFrames "] = true
L[" is loaded. Thank you for using it and note that I will always support you."] = " загружен. Спасибо за использование. Вы всегда можете рассчитывать на мою поддержку"
L["Vertical Unit Frames"] = true
L["Enable the Vertical Unit Frames."] = "Включить Vertical Unit Frame"
L["Reset Settings"] = "Сбросить настройки"
L['Simple Layout'] = "Простой вид"
L['Use the simple layout from 2.0'] = "Использовать простой вид из версии 2.0"
L['Combo Layout'] = true
L["Use a layout designed to work with ElvUI unitframes"] = true
L["Vertical Unit Frame Options"] = "Опции Vertical Unit Frame"
L["Hide ElvUI Unitframes"] = "Спрятать рамки ElvUI"
L["Flash"] = "Мигание"
L["Flash health/power when the low threshold is reached"] = "Полосы здоровья/ресурса начнут мигать при достижении минимального значения"
L["Text Warning"] = "Текстовое предупреждение"
L["Show a Text Warning when the low threshold is reached"] = "Показывать текстовое предупреждение при достижении минимального значения"
L["Horizontal Castbar"] = "Горизонтальная полоса заклинаний"
L["Use a horizontal castbar"] = "Использовать горизонтальную полосу заклинаний"
L["Variables"] = "Переменные"
L["Set the Alpha of the Vertical Unit Frame when out of combat"] = "Установите прозрачность элементов вне боя"
L["Out of Combat Alpha"] = "Прозрачность вне боя"
L["Start flashing health/power under this percentage"] = "Включиь мигание полос здоровья/ресурса при значениях ниже этого процента"
L["Raid Icon"] = "Рейдовые иконки"
L["Combat Indicator"] = "Индикатор боя"
L["PVP Text"] = "ПвП текст"
L["Wild Mushroom Tracker"] = "Треккер грибов"
L["GCD Spark"] = "Искра ГКД"
L["Player Vertical Unit Frame"] = "Игрок"
L["Target Vertical Unit Frame"] = "Цель"
L["Pet Vertical Unit Frame"] = "Питомец"
L["Target Target Vertical Unit Frame"] = "Цель цели"
L["Pet Target Vertical Unit Frame"] = "Цель питомца"
L['What to attach this element to.'] = "К чему прикреплять этот элемент"
L["Eclipse"] = "Затмение"
L["Override"] = "Заменить"
L["Override the texture for this element"] = "Заменить стандартную текстуру для этого элемента"
L['ElvUI VerticalUnitFrames by Sortokk'] = "ElvUI VerticalUnitFrames от Sortokk"
L['ElvUI VerticalUnitFrames provides a configurable centered, vertical unit frame option for use with ElvUI.\n'] = "ElvUI VerticalUnitFrames добавляет настраеваемый centered, vertical unit frame option для ElvUI."
L['Reset the settings of this addon to their defaults.'] = "Сбросить настройки аддона на умолчания"
L['Hide the ElvUI Unitframes when the Vertical Unit Frame is enabled'] = "Скрывать рамки юнитов ElvUI, когда включен Vertical Unit Frame"
L['Hide the Vertical Unit Frame when out of Combat'] = "Скрывать Vertical Unit Frame внее боя"
L['Hide Out of Combat'] = "Скрывать вне боя"
L['Enable Mouse'] = "Разрешить мышь"
L['Enable the mouse to interface with the vertical unit frame (this option has no effect if ElvUI Unitframes are hidden)'] = "Сделать Vertical Unit Frame воспринимать клики мышью (опция не оказывает эффекта при скрытых рамках ElvUI)"
L['Set the Alpha of the Vertical Unit Frame when in combat'] = "Установите прозрачность элементов в бою"
L['The texture that will be used for statusbars on this element.'] = "Текстура, которая будет использоваться для полос состояния на этом элементе"
L['Override the font for this element'] = "Заменить стандартный шрифт этого элемента"
L['Set the font for this element'] = "Установить шрифт для этого элемента"
L['Set the font size for this element'] = "Установить размер шрифта этого элемента"
L['Spacing'] = "Отступ"
L["Texture"] = "Текстура"
L['Tick Color'] = "Цвет тиков"
L['Default'] = true
L["ElvUI_VerticalUnitFrames_CREDITS"] = [[Благодарю следующих людей:

Tukz, чей код рамок юнитов послужил основой этого аддона
Elv за его замечательный UI, который вдохновил меня на создание версии 3
Hydrazine за вдохновение
Boradan за помощь с опциями
Sgt.Hydra за преждложения
Darth Predator за русский перевод
N0me за корейского перевод
BuG за французский перевод

Сообщество Tuku за поддержку.
]]

L["Thank you for using ElvUI VerticalUnitFrames!"] = "Спасибо за использование ElvUI VerticalUnitFrames!"
L["Here you can choose between the simple layout (only player health and power) or the default layout for the Vertical Unit Frame"] = "Здесь вы можете выбрать между упрощенным видом (только здоровье и ресурс игрока) или видом по умолчанию"
L["Simple Layout"] = "Простой вид"
L["Default Layout"] = "Вид по умолчанию"
L["Simple Layout Set"] = "Простой вид установлен"
L["Default Layout Set"] = "Вид по умолчанию установлен"