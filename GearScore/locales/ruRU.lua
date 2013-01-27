local L = LibStub("AceLocale-3.0"):NewLocale("GearScore4", "ruRU", false);

if not ( L ) then return false; end;

L["This is an aggregate of the various other scores, to give you a quick indication of a player's overall competency. It is weighted to consider the GearScore most heavily. The Crafting Score does not contribute to the Super Score."] = true;
L["GearScore is based on a player's equipment. It considers item level, gems and enchants, and appropriateness to class and spec. Two handed weapons receive bonuses, as do Hunter ranged weapons."] = "GearScore основывается на экипировке игрока. Он рассматривает уровень предметов, самоцветы и зачарования, правильность класса и спецификации. Получаемые бонусы двуручного оружия, как и оружие дальнего боя охотника.";
L["Raid score is based on the number of completed raids."] = "Оценка рейда основывается на количестве завершенных рейдов.";
L["PvE Score is based on quests and dungeons completed, bosses killed, and faction standing."] = "Оценка PvE основывается на завершенных заданиях и подземельях, убийствах боссов, и положения с фракциями.";
L["PvP Score is based on arena and battleground participation, win/lose ratios, and PvP kills."] = "Оценка PvP основывается на участие в сражениях на поле боя и арене, соотношения побед/проигрышей, и убийств в PvP.";
L["Crafting Score is based on Professions maxed, recipes learned, and secondary skills."] = "Оценка основывается на уровне профессии, знании рецептов, и вторичных навыках.";
L["Scan all members of your party or raid within inspection range. This will take about 30s"] = "Сканирование всех членов вашей группы или рейда в пределах зоны осмотра. Это займет около 30сек";
L["Latest news from TenTonHammer.com. Click a title for the whole article."] = "Последние новости из TenTonHammer.com. Нажмите по заглавию для целой статьи.";
L["%d database entries imported from PlayerScore.com."] = "%d записей базы данных импортировано из PlayerScore.com.";


L["GLOBAL_SEP"] = " +";
L["SEPARATORS"]= { "/", ", ", " & ", " и " };
L["PREFIX_SET"] = "Комплект: "




L["View your PlayerScore profile."] = "Просмотр вашего профиля PlayerScore.";
L["View the PlayerScore profile of your current target."] = "Просмотр профиля PlayerScore вашей текущей цели.";
L["View PlayerScore summary for your entire party or raid."] = "Просмотр сводки PlayerScore всей вашей группы или рейда.";
L["View your Online PlayerScore profile."] = "Просмотр вашего онлайн профиля PlayerScore.";
L["View help information."] = "Просмотр справки.";
L["View PlayerScore options."] = "Просмотр настроек PlayerScore.";
L["Scan Target"] = "Скан цели";
L["My Profile"] = "Мой профиль";
L["View Group"] = "Просмотр группы";
L["My Online Profile"] = "Мой онлайн профиль";
L["Scan Group"] = "Скан группы";
L["Scanning..."] = "Сканирование...";
L["Posted %s by"] = "Помещено %s -";

-- Tabs / Scores
L["Summary"] = "Сводка";
L["Database"] = "База данных";
L["Help"] = "Справка";
L["Options"] = "Настройка";
L["GearScore"] = "GearScore";
L["Rate"] = "Оценка";
L["Super"] = "Супер";
L["Equip"] = "Надеть";
L["PvP"] = "PvP";
L["PvE"] = "PvE";
L["Raid"] = "Рейд";
L["PlayerScore"] = "PlayerScore";
L["Equipment"] = "Экипировка";
L["Talents"] = "Таланты";
L["Experience"] = "Опыт";
L["Group"] = "Группа";
L["Scan All"] = "Скан всех";
L["News"] = "Новости";
L["Equipped Average Item Level"] = "Средний уровень экипировки";

--Equipment--
L["Head"] = "Голова"; 
L["Neck"] = "Шея"; 
L["Shoulder"] = "Плечи"; 
L["Chest"] = "Грудь"; 
L["Waist"] = "Пояс"; 
L["Legs"] = "Ноги"; 
L["Feet"] = "Ступни"; 
L["Wrist"] = "Запястья"; 
L["Gloves"] = "Кисти рук"; 
L["Finger 1"] = "Палец 1"; 
L["Finger 2"] = "Палец 2"; 
L["Trinket 1"] = "Аксессуар 1"; 
L["Trinket 2"] = "Аксессуар 2"; 
L["Back"] = "Спина"; 
L["Main Hand"] = "Правая рука"; 
L["Off Hand"] = "Левая рука"; 
L["Ranged"] = "Дальний бой"; 
L["Missing Enchantment!"] = "Отсутствует улучшение!";

--MISC--
L[""] = "";
L["???"] = "???";
L["Whisper this player."] = "Шепнуть этому игроку.";
L["Invite this player to your group."] = "Пригласить этого игрока в вашу группу.";
L["Refresh data on your curent target."] = "Обновить данные вашей текущей цели.";
L["Generate a link to this player's Online Profile at PlayerScore.com. View World-wide rankings, comments, and more."] = "Создать ссылку на онлайн профиль этого игрока в PlayerScore.com. Просмотр всемирного рейтинга, комментарии и многое другое.";
L["Just keep sitting there in your underwear for approximately 2 seconds."] = true;
L["This section will automagically refresh when we're done. Thanks!"] = "Этот раздел будет автоматически обновляться, когда мы закончим. Спасибо!";
L["Calculating scores, shining shields, putting the Gob in Goblins."] = true;
L["Right-Click to flag this talent as negative."] = "ПКМ - пометить этот талант \"плохим\" для этой спецификации.";
L["Left-Click to flag this talent as positive."] = "ЛКМ - пометить этот талант \"хорошим\" для этой спецификации.";
L["Middle-Click to flag this talent as neutral."] = "СКМ - пометить этот талант промежуточным для этой спецификации.";
L["GearScore Upgrades:"] = "Обновления GearScor:";
L["Ctrl-Right Click to find an upgrade!"] = "Ctrl-ПКМ - для поиска улучшения!";
L["No PlayerScore information found for this player."] = "Не найдено информации PlayerScore этого игрока.";
L["Ctrl-Right Click to view this player's scores online."] = "Ctrl-ПКМ - просмотр оценки игрока онлайн.";
L["Left-Click to scan your current target"] = "ЛКМ - сканировать вашу текущую цель";
L["Right-Click to Collapse."] = "ПКМ - свернуть.";
L["Right-Click to Expand."] = "ПКМ - развернуть.";
L["View the latest news from TenTonHammer.com"] = "Просмотреть последние новости из TenTonHammer.com";
L["Click here for URL to full story."] = "Щелкните здесь для получения ссылки на полную статью.";
L["Right-Click to flag this gem as negative for this spec."] = "ПКМ - пометить этот самоцвет \"плохим\" для этой спецификации.";
L["Left-Click to flag this gem as positive for this spec."] = "ЛКМ - пометить этот самоцвет \"хорошим\" для этой спецификации.";
L["Middle-Click to flag this gem as neutral for this spec."] = "СКМ - пометить этот самоцвет \"промежуточным\" для этой спецификации.";



--Player Information--
L["Player Rating"] = "Оценка игрока";
L["PlayerScores"] = "PlayerScores";
L["Raiding Difficulty"] = "Сложность рейдов";
L["Raiding Progression"] = "Прогресс рейдов";
L["Information"] = "Информация";
L["Status"] = "Статус";
L["%d Unused Talent(s)"] = "Неиспользуемых талантов: %d "; -- DO NOT CHANGE %d
L["No Guild"] = "Нет гильдии";
L["%d Unenchanted Item(s)"] = "Предметов без наложения чар: %d"; -- DO NOT CHANGE %d
L["All Items Enchanted"] = "Все предметы зачарованы";
L["No Empty Gem Sockets"] = "Нет пустых ячеек под самоцветы";
L["%d Empty Gem Socket(s)"] = "Пустых ячеек под самоцветы: %d";-- DO NOT CHANGE %d
L["High Ranking Member of Guild"] = "Высокопоставленный член Гильдии";
L["%s is a %q of this %s guild."] = "%s в звании %q\nФракция: %s."; -- Structure this sentence to fit into your languages Subject/Verb/Object format. First %s is the Player's Name, %q is the player's rank, and the second %s is their faction.
L["Player ratings are ratings assigned by other players. They are gathered from the addon and PlayerScore.com. \n\nTo view ratings or upload them you must use the PlayerScore Updater. Visit PlayerScore.com for more information."] = "Рейтинг игрока - это оценка, назначенная другими игроками. Она соберается с помощью аддона и PlayerScore.com. \n\nДля просмотра рейтингов или загрузки их, необходимо использовать PlayerScore Updater. Для получения дополнительной информации, посетите PlayerScore.com.";
L["Click here to rate this player up."] = "Нажав здесь, вы оцените этого игрока положительно.";
L["Click here to rate this player down."] = "Нажав здесь, вы оцените этого игрока отрицательно.";
L["Belt Buckle Detected"] = "Обнаружена поясная пряжка";
L["Missing Belt Buckle"] = "Отсутствует поясная пряжка";
L["This player has not applied an Belt Buckle to their belt."] = "Этот игрок не применил поясную пряжку на свой пояс.";
L["This player has used a Belt buckle to add a gem socket to their %s."] = "Этот игрок использовал поясную пряжку, чтобы инкрустировать самоцвет в его: %s.";
L["Belt Buckle"] = "Поясная пряжка";
L["%s is out of inspection range."] = "%s - вне зоны осмотра";
L["This player is currently riding TRH... \n (Which means nothing at all.)"] = "Этот игрок в настоящее время разъезжает на Небесном скакуне... \n (Что ничего не означает.)";
L["This player is currently riding a Spectral Tiger!"] = "Этот игрок в настоящее время разъезжает на Призрачном тигре!";
L["Celestial Steed"] = "Небесный скакун";
L["Spectral Tiger"] = "Призрачный тигр";
L["Estimated GearScore Upgrades:"] = "Приблизительное обновление GearScore:";
L["%d Negative gems."] = "Плохих самоцветов: %d .";
L["%d Negative enchantments."] = "Плохих наложений чар: %d.";
L["This player is using gems which you have marked as negative for their spec."] = "Этот игрок использует самоцветы которые вы отметили как \"плохие\" для такой спецификации.";
L["This player is using enchantments which you have marked as negative for their spec."] = "Этот игрок использует зачарования которые вы отметили как \"плохие\" для такой спецификации.";

--Raid Difficulty--
L["Trivial"] = "---------|cffffffff*|r-"; --"Низкий уровень"
L["Easy"] = "--------|cffffffff*|r--"; --"Без труда";
L["Effortless"] = "----------|cffffffff*|r"; --"Не требующий усилий";
L["Normal"] = "------|cffffffff*|r----"; --"Обычный";
L["Light"] = "-------|cffffffff*|r---"; --"Легко";
L["Moderate"] = "----|cffffffff*|r------"; --"Средний";
L["Formidable"] = "--|cffffffff*|r--------"; --"Труднопреодолимый";
L["Brutal"] = "-|cffffffff*|r---------"; --"Жестокий";
L["Challenging"] = "----|cffffffff*|r------"; --"Перспективный";
L["Difficult"] = "---|cffffffff*|r-------"; --"Сложный";
L["Impossible"] = "|cffffffff*|r----------"; --"Невозможный";
L["Naxxramas 10"] = "Наксрамас 10";
L["Naxxramas 25"] = "Наксрамас 25";
L["Ulduar 10"] = "Ульдуар 10";
L["Ulduar 25"] = "Ульдуар 25";
L["Crusader 10"] = "Крестоносец 10";
L["Crusader 25"] = "Крестоносец 25";
L["Icecrown 10"] = "Ледяная Корона 10";
L["Icecrown 25"] = "Ледяная Корона 25";
L["Heroic Icecrown 25"] = "Ледяная Корона 25 (героич.)";
L["Level 80 Heroics"] = "Героики 80 уровня";
L["Tier 11 Raids"] = "Рейды 11 тира";
L["Level 85 Heroics"] = "Героики 85 уровня";
L["This player will need extremely honed skills to succeed in this instance."] = "Для достижения успехов в данном подземелье, этоту игроку необходим чрезвычайно отточенные навыки.";
L["This player will need perfect skills and reaction time to succeed in this instance."] = "Для достижения успехов в данном подземелье, этому игроку необходим идеальный навык и реакция.";
L["This player would face utter defeat and devastation in this instance."] = "В этом подземелье, этого игрока ожидает полное поражение и уничтожение.";
L["This player has enchanted all their enchantable items which will increase their performance."] = "Этот игрок экипирировал всю свою экипировку зачарованиями, что улучшает её эффективность.";
L["This player is missing enchantments and will not be able to perform at their maximum."] = "У этого игрока отсутствуют наложения чар, что понижает его эффективность в бою.";
L["This player is missing gems and will not be able to perform at their maximum."] = "У этого игрока отсутствуют самоцветы, что понижает его эффективность в бою.";
L["This player has not spent some of their talents. This will significantly lower this player's potential."] = "Этот игрок не использовал некоторые из своих талантов. Это значительно уменьшает потенциал этого игрока.";
L["This player has gemmed all their items which will increase their performance."] = "Этот игрок экипирировал всю свою экипировку самоцветами, что улучшает её эффективность.";
L["A player who is not a member of a guild is more likely to not play well with other players."] = "Игрок, который не является членом гильдии, скорее всего, не хорошо играет с другими игроками.";
L["These items are not appropriate for this player's spec. These items will reduce this player's potential performance in PVE Combat."] = "Эти предметы не подходят для спецификации этого игрока. Эти предметы будут уменьшать потенциальную эффективность этого игрока в PVE боях.";
L["This player is missing equipment and which will drastically reduce performance."] = "У этого игрока не хватает экипировки, что значительно снижает его эффективность.";
L["%s empty equipment slot(s)"] = "%s пустой слот(ы) экипировки";
L["This player has talents that you have marked as positive."] = "У этого игрока есть таланты, которые вы отметили как \"хорошие\".";
L["This player has talents that you have marked as negative."] = "У этого игрока есть таланты, которые вы отметили как \"плохие\".";
L["%d %s items equipped"] = "%d %s предметов одето";
L["%d Positive talent(s)."] = "%d \"хороших\" талантов.";
L["%d Negative talent(s)."] = "%d \"плохих\" талантов.";
L["Right-Click to flag this enchant as negative for this spec."] = "ПКМ - пометить это наложение чар для данной спецификации как \"плохое\".";
L["Left-Click to flag this enchant as positive for this spec."] = "ЛКМ - пометить это наложение чар для данной спецификации как \"хорошее\".";
L["Middle-Click to flag this enchant as neutral for this spec."] = "СКМ - пометить это наложение чар для данной спецификации как \"промежуточное\".";
L["You have marked this enchantment as bad for this spec."] = "Вы пометили это наложение чар \"плохим\" для данной спецификации.";

-- Class Info --
 L["This player has no specialization for their class."] = "Этот игрок не имеет специализацию для своего класса.";
L["Shaman"] = "Шаман";
L["Elemental"] = "Укрощение стихии";
L["Enhancement"] = "Совершенствование";
L["Restoration"] = "Исцеление";
L["Rogue"] = "Разбойник";
L["Assassination"] = "Убийство";
L["Combat"] = "Бой";
L["Subtlety"] = "Скрытность";
L["Tank"] = "Танк";
L["Caster DPS"] = "Боец - заклинатель";
L["Melee DPS"] = "Боец - ближний бой";
L["Healer"] = "Лекарь";
L["Warlock"] = "Чернокнижник";
L["Affliction"] = "Колдовство";
L["Demonology"] = "Демонология";
L["Destruction"] = "Разрушение";

-- Stats --
L["STA"] = "Выносливость";
L["INT"] = "Интеллект";
L["SPI"] = "Дух";
L["AGI"] = "Ловкость";
L["STR"] = "Сила";
L["DODGE"] = "Уклонение";
L["PARRY"] = "Парирование";
L["CRIT"] = "Крит";
L["HASTE"] = "Скорость";
L["TOHIT"] = "Меткость";
L["EXPERTISE"] = "Мастерство";
L["MASTERY"] = "Искусность";
L[" "] = " ";
L["These values represent stats acquired from gear only. They do not account for Talents, Buffs, Passive Abilities, Spells, or Base Stats."] = "Эти значения представляют статистику, приобретенную только из экипировки. Они не учитывают таланты, баффы, пассивные способности, заклинания или базовые характеристики.";


-- Instances -- 
L["Heroic Icecrown 25 player"] = "Ледяная Корона 25 (героич.)";
L["Heroic Icecrown 10 player"] = "Ледяная Корона 10 (героич.)";
L["Icecrown 25 player"] = "Ледяная Корона 25";
L["Icecrown 10 player"] = "Ледяная Корона 10";
L["Trial of the Grand Crusader 25 player"] = "Испытание великого крестоносца 25";
L["Trial of the Grand Crusader 10 player"] = "Испытание великого крестоносца 10";
L["Trial of the Crusader 25 player"] = "Испытание крестоносца 25";
L["Trial of the Crusader 10 player"] = "Испытание крестоносца 10";
L["Ulduar 25 player"] = "Ульдуар 25";
L["Ulduar 10 player"] = "Ульдуар 10";
L["Naxxramas 25 player"] = "Наксрамас 25";
L["Naxxramas 10 player"] = "Наксрамас 10";
L["Wintergrasp 25 player"] = "Озеро Ледяных Оков 25";
L["Wintergrasp 10 player"] = "Озеро Ледяных Оков 10";
L["Malygos 25 player"] = "Малигос 25";
L["Malygos 10 player"] = "Малигос 10";
L["Heroic Ruby Sanctum 25 player"] = "Рубиновое святилище 25 (героич.)";
L["Heroic Ruby Sanctum 10 player"] = "Рубиновое святилище 10 (героич.)";
L["Ruby Sanctum 25 player"] = "Рубиновое святилище 25";
L["Ruby Sanctum 10 player"] = "Рубиновое святилище 10";
L["Anub'arak kills"] = "Убийств Ануб'арака";
L["Blackwing Descent"] = "Твердыня Крыла Тьмы";
L["The Bastion of Twilight"] = "Сумеречный бастион";
L["Throne of the Four Winds"] = "Трон Четырех Ветров";
L["Lady Sinestra"] = "Леди Синестра";
L["Tier 11 Heroic Raids"] = "Героические рейды 11 тира";
			
-- Expansion Names --
L["Wrath of the Lich King"] = "Wrath of the Lich King";
L["Cataclysm"] = "Cataclysm";



-- HELP FILES --
L["Introduction"] = "Введение";
L["Welcome to GearScore/PlayerScore 4.0\n\nGearScore is now PlayerScore, a collaboration between GearScore and MMORPG news and guides website, TenTonHammer.com. With a vast array of features, easy to use interface, and an integrated web component, PlayerScore is the most powerful addon experience ever created for World of Warcraft.\n\nClick a Question on the left to view more information and in-game help."] = true;
L["What is PlayerScore?"] = "Что такое PlayerScore?";
L["Questions"] = "Вопросы";
L["How are scores calculated?"] = "Как рассчитывается оценка?";
L["|cffff0000GearScore|r is based on the equipment a player wears. It factors item level, gems, enchants, and appropriateness to class and spec.\n\n|cffff0000Raid Score|r is based on experience in raids and bosses killed.\n\n|cffff0000PvE Score|r is based on Quests and dungeons completed, and faction standing.\n\n|cffff0000PvP Score|r is based on your Arena & Battleground participation, rankings, win/loss ratio, and PvP Kills.\n\n|cffff0000Player Rating|r is based on ratings from other players."] = true;
L["PlayerScore is a world wide player ranking and information service for World of Warcraft. PlayerScore is comprised of a Web-based component, an auto-updater, and an in-game addon. These components work together to create the most powerful addon experience ever created for WoW.\n\nThe Web-based component allows you to view world-wide rankings and scores for any player as well as allowing you to comment and rate other players.\n\nThe Addon is this program your using right now and allows you to view scores in-game as well as providing essential information about other players. You can rate players you play with and upload the data to PlayerScore.com via the Updater.\n\nThe Updater allows you to download the scores and ratings of every player on your server, keeps the addon up to date, and uploads in-game ratings and data collected from the addon."] = true;
L["What exactly is the Updater?"] = true;
L["The Updater is a completely optional piece of software written by Ten Ton Hammer which is completely external to World of Warcraft. It keeps the AddOn up-to-date, uploads data you gather and ratings you assign (so that they can be shared with others), and (if you so choose) downloads character information from Ten Ton Hammer for you to view in-game. If you never run the Updater, your data won't be shared and no one else will know how you rated other players.\n\nThe Updater doesn't collect any personal information. It only transmits scores and ratings for characters and never your World of Warcraft Account Name or Password. |cffff0000You should never give your password to anyone."] = true;
L["How do I use the addon?"] = true;
L["Using the addon is very simple. Simply target any player and inspect them. You can right click their picture and choose inspect from the options menu or you can type '/inspect'. The PlayerScore addon will appear and display information about this player to you.\n\nYou can check each tab to view detailed information, or use the summary tab for a break down of the most essential data."] = true;
L["Information used to calculate scores isn't instantly available to the addon. Achievements, Statistics, Talents, Gems, and Reforging status must be requested from the server. PlayerScore makes the request but for some information there is no way of knowing when the request has be fulfilled. To compensate, PlayerScore will wait an amount of time dependent on your latency before processing the score.\n\nSome players will take longer to score then others because of how the game client handles item caching and reforging. Each time you view an item in game it is stored in your local 'Item Cache'. Then each time you request that item the client will simply display the info from the cache. Now that reforging has been added to the game the cache isn't very useful anymore. Each item can have many different versions of itself depending on which stats were reforged. When PlayerScore requests the items from the server they may appear as non-existant until the cache updates the reforged item. When this occurs, the addon will wait additional time before processing and scoring this player."] = true;
L["Why isn't scoring instant?"] = true;
L["Does this addon spam?"] = true;
L["GearScore/PlayerScore 4.0 no longer contains automatic data communication aside from a single version number announcement when you first login.\n\nPrevious versions of GearScore would automatically transmit player information to other guildmates in order to allow everyone's database to stay up-to-date. This feature has been completely removed from GearScore/PlayerScore 4.0.\n\nGearScore/PlayerScore now relies on the updater to keep your database up-to-date. If you choose to use the updater then scores for every player on your server will be downloaded automatically. Otherwise only information you have personally gathered with the addon will be saved to your database."] = true;
L["What happened to the database?"] = "Что произошло с базой данных?";
L["In GearScore 3.0 the database stored a vast array of information about a player to allow for the remote armory feature. This information required an unreasonable amount of system resources and generally slowed a player's computer down.\n\nThe PlayerScore Updater has the ability to download a database of every player on your server, However this information is minimal and is 95% smaller then the GearScore 3.0 database.\n\nIn GearScore/PlayerScore 4.0 the remote armory feature was removed. However, you can now right-click their names in your chat window to generate a link to their Online PlayerScore profile. This profile shows you scores, ratings, rankings, and even comments on any player."] = true;
--L["Can scores be faked?"] = true;
--L["If you manually scan a player then score information cannot be faked, as this information is requested directly from the World of Warcraft servers.\n\nHowever, when you use the request & transmit features, players who transmit their scores to you could send fake data. You should always manually inspect players when you get the chance.\n\nIf you are using the request & transmit features to build a raid you can also use the 'Scan Group' feature to confirm data. Once everyone in the raid is gathered simply click 'Scan Group' and the PlayerScore will scan everyone in your group (within inspection range) and display their scores. A quick glance will let you see if anything is out of place or if anyone faked their information to you."] = true;





--Options --
L["Show GearScore"] = "Показать GearScore";
L["Show Raid Score"] = "Показать оценку рейда";
L["Show PvE Score"] = "Показать оценка PvE";
L["Show PvP Score"] = "Показать оценку PvP";
L["Show Player Ratings"] = "Показать рейтинг игрока";
L["Show known GearScores of players on mouse-over tooltip."] = "Показать известный GearScores в подсказке игрока при наведении курсора мыши.";
L["Show known Player Ratings of players on mouse-over tooltip."] = "Показать известный рейтинг игрока в подсказке игрока при наведении курсора мыши.";
L["Show known PvP Scores of players on mouse-over tooltip."] = "Показать известную оценку PvP в подсказке игрока при наведении курсора мыши.";
L["Show known Raid Scores of players on mouse-over tooltip."] = "Показать известную рейд оценку в подсказке игрока при наведении курсора мыши.";
L["Show known PvE Scores of players on mouse-over tooltip."] = "Показать известную оценку PvE в подсказке игрока при наведении курсора мыши.";
L["Show Chat Frame Tooltips"] = "Показать подсказки в окне чата";
L["Shows PlayerScore tooltips in your chat frame"] = "Показать подсказки PlayerScore в вашем окне чата";

L["Integrate with Inspection"] = "Интегрировать в осмотр";
L["When enabled, this option replaces the default inspection UI with PlayerScore's Scan feature."] = "При включении этой опции, стандартное UI осмотра будет заменено на окно PlayerScore, с возможностью сканирования.";
L["Save Playerscore Data"] = "Сохр. данные Playerscore";
L["When enabled, PlayerScore will save the score information.\n\nOut of date information is automatically removed, and database size is automatically limited.\n\nThis feature allows you to view PlayerScores of players on mouseover or in chat.\n"] = "Когда включено, PlayerScore будет сохронять информацию о оценке.\n\nУстаревшая иформация будет автоматически удаляется, и размер базы данных автоматически ограничивается.\n\nЭто функция позволяет просматривать PlayerScores игроков при наведении курсора мыши на игрока или в чате на ник.\n";
L["Use Hammer Icon"] = "Иконка молотка";
L["When enabled, PlayerScore will display a hammer icon on your screen which you can use to access PlayerScore features."] = "Когда включено, PlayerScore покажет иконку молотка на экран, которую можно использовать для доступа к возможностям PlayerScore.";
L["Use Minimap Button"] = "Кнопка у мини-карты";
L["Use Titan Panel Plugin"] = "Плагин Titan Panel";
L["Use Foobar Plugin"] = "Плагин FuBar";
L["|cffcccccc(Currently Unavailable, look for an update soon!)"] = "|cffcccccc(в настоящее время недоступна, следите за обновлениями!)";
L["Anchor Bottom-Left"] = "Привязка снизу-слева";
L["Anchor Bottom-Right"] = "Привязка снизу-справа";
L["Anchor Top-Right"] = "Привязка сверху-справа";
L["Anchor Top-Left"] = "Привязка сверху-слева";
L["Anchor the hammer icon to the top-right of the pop-out controls."] = "Привязать иконку молотка сверху-справа от всплывающего меню.";
L["Anchor the hammer icon to the top-left of the pop-out controls."] = "Привязать иконку молотка сверху-слева от всплывающего меню.";
L["Anchor the hammer icon to the bottom-right of the pop-out controls."]  = "Привязать иконку молотка снизу-справа от всплывающего меню.";
L["Anchor the hammer icon to the bottom-left of the pop-out controls."] = "Привязать иконку молотка снизу-слева от всплывающего меню.";
L["Download Online Database"] = "Загрузить онлайн базу данных";
L["(This option requires the PlayerScore Updater)\n\nWhen Enabled, this option will allow your updater to download PlayerScore data for this server.\n\nDownload the updater at PlayerScore.com"] = "(Для этой опции требуется PlayerScore Updater)\n\nЕсли включена, эта опция позволит вашему updater'у загружать PlayerScore данные с его сервера.n\nСкачать Updater можно на www.PlayerScore.com";
L["To view News in game, you must use the PlayerScore Updater. Get the Updater at www.PlayerScore.com!"] = "Для просмотра новостей в игре, вы должны использовать PlayerScore Updater. Получить Updater можно на www.PlayerScore.com!";
L["Enable this tab."] = "Включить эту закладку";
L["Enable Equipment Tab"] = "Включить закладку экипировки";
L["Enable Talents Tab"] = "Включить закладку талантов";
L["Enable Experience Tab"] = "Включить закладку опыта";
L["Enable PvP Tab"] = "Включить закладку PvP";
L["Enable News Tab"] = "Включить закладку новостей";
L["Enable Group Tab"] = "Включить закладку группы";
L["Enable Quick-Scan Mode"] = "Включить режим бострого сканирования";
L["When enbled, this mode will scan & score a characther when you target them.\n\nTo prevent lag, this mode will not function while you are in combat."] = "Если включено, этот режим позволит сканировать и оценивать персонажа при взятии его в цель.\n\nДля предотвращения лагов, этот режим не будет функционировать в режиме боя.";
L["Shows off-spec Item scores in item tooltips."] = "Показать оценку предметов офф-спека в подсказке предмета.";
L["Show Off-Spec ItemScores"] = "Показать оценку предмета офф-спека";
L["Shows Equipped Average Item Level for Quick-Scan Targets."] = "Показать средний уровень экипировки на персонаже для целей быстрого-сканирования.";
L["When enabled with Quick-Scan mode, tooltips will display more detailed information."] = "При включении в режиме быстрого сканирования, подсказки будут отображать более подробную информацию.";
L["Verbose"] = "Подробнее";
