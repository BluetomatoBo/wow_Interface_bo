-- zhCN By wowui.me
local L = LibStub("AceLocale-3.0"):NewLocale("GearScore4", "zhCN", false)
if not ( L ) then return false; end;

L["This is an aggregate of the various other scores, to give you a quick indication of a player's overall competency. It is weighted to consider the GearScore most heavily. The Crafting Score does not contribute to the Super Score."] = "这个一个不同分值的集合, 给你一个关于玩家总体情况的快速指示. 这个主要是有玩家的GS值加权而成. 专业技能分值没有合并到超级分值中.";
L["GearScore is based on a player's equipment. It considers item level, gems and enchants, and appropriateness to class and spec. Two handed weapons receive bonuses, as do Hunter ranged weapons."] = "GS值基于玩家的装备, 如物品等级, 宝石和附魔, 职业和天赋等.双手武器和猎人的远程武器也享受加成.";
L["Raid score is based on the number of completed raids."] = "团队分值基于已完成的团队地城数量.";
L["PvE Score is based on quests and dungeons completed, bosses killed, and faction standing."] = "PvE 分值基于已完成的任务,地城,首领击杀以及阵营声望等.";
L["PvP Score is based on arena and battleground participation, win/lose ratios, and PvP kills."] = "PvP 分值寄居竞技场和战场的参赛, 输赢比率和 PvP 击杀等.";
L["Crafting Score is based on Professions maxed, recipes learned, and secondary skills."] = "製作分值基于专业技能, 已学图纸和次要专业.";
L["Scan all members of your party or raid within inspection range. This will take about 30s"] = "在检视范围内检查你的消毒或团队的所有成员. 这个需要耗时大约30秒.";
L["Latest news from TenTonHammer.com. Click a title for the whole article."] = "TenTonHammer.com的最新讯息, 点击标题来查看完整的文章.";
L["%d database entries imported from PlayerScore.com."] = "%d 数据库条目导入自 PlayerScore.com.";


L["GLOBAL_SEP"] = " +";
L["SEPARATORS"]= { "/", ", ", " & ", " and " };
L["PREFIX_SET"] = "组合: "




L["View your PlayerScore profile."] = "查看你的玩家评分设定档";
L["View the PlayerScore profile of your current target."] = "查看你当前目标的玩家评分设定档";
L["View PlayerScore summary for your entire party or raid."] = "查看你所在小队或团队的玩家评分摘要";
L["View your Online PlayerScore profile."] = "查看你的在綫玩家评分设定档";
L["View help information."] = "查看帮助讯息";
L["View PlayerScore options."] = "查看玩家评分选项";
L["Scan Target"] = "检查目标";
L["My Profile"] = "我的设定档";
L["View Group"] = "查看队伍";
L["My Online Profile"] = "我的在綫设定档";
L["Scan Group"] = "检查队伍";
L["Scanning..."] = "检查中....";
L["Posted %s by"] = "发佈 %s 来自";

-- Tabs / Scores
L["Summary"] = "摘要";
L["Database"] = "数据库";
L["Help"] = "帮助";
L["Options"] = "选项";
L["GearScore"] = "GS值";
L["Rate"] = "评级";
L["Super"] = "超级";
L["Equip"] = "装备";
L["PvP"] = "PvP";
L["PvE"] = "PvE";
L["Raid"] = "团队";
L["PlayerScore"] = "玩家评分";
L["Equipment"] = "装备";
L["Talents"] = "天赋";
L["Experience"] = "经验";
L["Group"] = "队伍";
L["Scan All"] = "检查全部";
L["News"] = "新闻";

--Equipment--
L["Head"] = "头部"; 
L["Neck"] = "颈部"; 
L["Shoulder"] = "肩膀"; 
L["Chest"] = "胸部"; 
L["Waist"] = "腰部"; 
L["Legs"] = "腿部"; 
L["Feet"] = "脚部"; 
L["Wrist"] = "手腕"; 
L["Gloves"] = "手套"; 
L["Finger 1"] = "手指 1"; 
L["Finger 2"] = "手指 2"; 
L["Trinket 1"] = "饰品 1"; 
L["Trinket 2"] = "饰品 2"; 
L["Back"] = "背部"; 
L["Main Hand"] = "主手"; 
L["Off Hand"] = "副手"; 
L["Ranged"] = "远程"; 
L["Missing Enchantment!"] = "缺失的附魔";

--MISC--
L[""] = "";
L["???"] = "???";
L["Whisper this player."] = "密语这个玩家";
L["Invite this player to your group."] = "邀请这个玩家到你的队伍";
L["Refresh data on your curent target."] = "刷新你当前目标的数据";
L["Generate a link to this player's Online Profile at PlayerScore.com. View World-wide rankings, comments, and more."] = "为这个玩家生成一个在PlayerScore.com的设定档的链接. 查看在世界范围内的等级, 评论以及更多.";
L["Just keep sitting there in your underwear for approximately 2 seconds."] = "只要穿著你的内衣坐在那大约2秒.";
L["This section will automagically refresh when we're done. Thanks!"] = "这个部分将在我们完成时自动刷新. 谢谢!";
L["Calculating scores, shining shields, putting the Gob in Goblins."] = "Calculating scores, shining shields, putting the Gob in Goblins.";
L["Right-Click to flag this talent as negative."] = "右键点击 标记这个天赋为不良.";
L["Left-Click to flag this talent as positive."] = "左键点击 标记这个天赋为良好.";
L["Middle-Click to flag this talent as neutral."] = "中键点击 标记这个天赋为一般.";
L["GearScore Upgrades:"] = "GearScore 升级:";
L["Ctrl-Right Click to find an upgrade!"] = "Ctrl-右键点击 搜寻一个更新!";
L["No PlayerScore information found for this player."] = "没有找到这个玩家的玩家评分讯息";
L["Ctrl-Right Click to view this player's scores online."] = "Ctrl-右键点击 在綫查看这个玩家的评分.";
L["Left-Click to scan your current target"] = "左键点击 检查你的当前目标";
L["Right-Click to Collapse."] = "右键点击 收起";
L["Right-Click to Expand."] = "右键点击 展开";
L["View the latest news from TenTonHammer.com"] = "查看来自 TenTonHammer.com 的最新新闻.";
L["Click here for URL to full story."] = "点击这裡获得链接";
L["Right-Click to flag this gem as negative for this spec."] = "右键点击 标记相对这个天赋的宝石为不良.";
L["Left-Click to flag this gem as positive for this spec."] = "左键点击 标记相对这个天赋的宝石为良好.";
L["Middle-Click to flag this gem as neutral for this spec."] = "中键点击 标记相对这个天赋的宝石为一般.";



--Player Information--
L["Player Rating"] = "玩家评级";
L["PlayerScores"] = "玩家评分";
L["Raiding Difficulty"] = "团队难度";
L["Raiding Progression"] = "团队进度";
L["Information"] = "讯息";
L["Status"] = "状态";
L["%d Unused Talent(s)"] = "%d 未分配天赋"; -- DO NOT CHANGE %d
L["No Guild"] = "没有公会";
L["%d Unenchanted Item(s)"] = "%d 未附魔装备"; -- DO NOT CHANGE %d
L["All Items Enchanted"] = "所有装备已附魔";
L["No Empty Gem Sockets"] = "没有空的宝石插槽";
L["%d Empty Gem Socket(s)"] = "%d 空的宝石插槽";-- DO NOT CHANGE %d
L["High Ranking Member of Guild"] = "公会的高等级成员";
L["%s is a %q of this %s guild."] = "%s 是公会 %s 的一位 %q ."; -- Structure this sentence to fit into your languages Subject/Verb/Object format. First %s is the Player's Name, %q is the player's rank, and the second %s is their faction.
L["Player ratings are ratings assigned by other players. They are gathered from the addon and PlayerScore.com. \n\nTo view ratings or upload them you must use the PlayerScore Updater. Visit PlayerScore.com for more information."] = "玩家评分已分配给其他玩家评分, 他们採集自这个插件和 PlayerScore.com. \n\n要查看评级或上传你必须使用玩家评分更新器. 访问 PlayerScore.com 来查看更多讯息.";
L["Click here to rate this player up."] = "点击这裡提升这个玩家的评级";
L["Click here to rate this player down."] = "点击这裡降低这个玩家的评级";
L["Belt Buckle Detected"] = "腰带打孔";
L["Missing Belt Buckle"] = "缺失腰带打孔";
L["This player has not applied a Belt Buckle to their belt."] = "这个玩家没有腰带打孔";
L["This player has used a Belt buckle to add a gem socket to their %s."] = "这个玩家已使用玩家打孔";
L["Belt Buckle"] = "腰带打孔";
L["%s is out of inspection range."] = "%s 超出了检视距离.";
L["This player is currently riding TRH... \n (Which means nothing at all.)"] = "这个玩家当前骑的是TRH... \n (我们没什麽其他意思.)";
L["This player is currently riding a Spectral Tiger!"] = "这个玩家当前骑的是鬼灵之虎!";
L["Celestial Steed"] = "星穹战马";
L["Spectral Tiger"] = "鬼灵之虎";
L["Estimated GearScore Upgrades:"] = "预测 GearScore 升级:";
L["%d Negative gems."] = "%d 不良宝石.";
L["%d Negative enchantments."] = "%d 不良附魔.";
L["This player is using gems which you have marked as negative for their spec."] = "这个玩家正在使用被你标记为相对他们天赋不符合的宝石.";
L["This player is using enchantments which you have marked as negative for their spec."] = "这个玩家正在使用被你标记为相对他们天赋不符合的附魔.";

--Raid Difficulty--
L["Trivial"] = "琐碎";
L["Easy"] = "简易";
L["Effortless"] = "轻鬆";
L["Normal"] = "普通";
L["Light"] = "轻微";
L["Moderate"] = "中等";
L["Formidable"] = "强大";
L["Brutal"] = "残酷";
L["Challenging"] = "挑战";
L["Difficult"] = "困难";
L["Impossible"] = "难以想像";
L["Naxxramas 10"] = "Naxx 10";
L["Naxxramas 25"] = "Naxx 25";
L["Ulduar 10"] = "奥杜尔 10";
L["Ulduar 25"] = "奥杜尔 25";
L["Crusader 10"] = "TOC 10";
L["Crusader 25"] = "TOC 25";
L["Icecrown 10"] = "ICC 10";
L["Icecrown 25"] = "ICC 25";
L["Heroic Icecrown 25"] = "英雄ICC 25";
L["Level 80 Heroics"] = "等级 80 英雄";
L["Tier 11 Raids"] = "T11 团队";
L["Level 85 Heroics"] = "等级 85 英雄";
L["This player will need extremely honed skills to succeed in this instance."] = "这个玩家还需要很多的磨练来胜任这个地城.";
L["This player will need perfect skills and reaction time to succeed in this instance."] = "这个玩家还需要完美的技能来胜任这个地城.";
L["This player would face utter defeat and devastation in this instance."] = "";
L["This player has enchanted all their enchantable items which will increase their performance."] = "这个玩家的装备已经全部附魔.";
L["This player is missing enchantments and will not be able to perform at their maximum."] = "这个玩家有缺失的附魔, 不能发挥自己的全部实力.";
L["This player is missing gems and will not be able to perform at their maximum."] = "这个玩家有缺失的宝石, 不能发挥自己的全部实力";
L["This player has not spent some of their talents. This will significantly lower this player's potential."] = "这个玩家的天赋有未分配的点数.";
L["This player has gemmed all their items which will increase their performance."] = "这个玩家的装备已经全部插上宝石.";
L["A player who is not a member of a guild is more likely to not play well with other players."] = "没有公会的玩家看起来不能和其他玩家玩的来.";
L["These items are not appropriate for this player's spec. These items will reduce this player's potential performance in PVE Combat."] = "这些物品不适用于这个玩家的天赋. 这些物品将在 PvE 战斗中降低玩家的表现.";
L["This player is missing equipment and which will drastically reduce performance."] = "这个玩家有未装备的部位.";
L["%s empty equipment slot(s)"] = "%s 空的装备插槽";
L["This player has talents that you have marked as positive."] = "这个玩家拥有你标记为良好的天赋.";
L["This player has talents that you have marked as negative."] = "这个玩家拥有你标记为不良的天赋.";
L["%d %s items equipped"] = "%d %s 物品已装备";
L["%d Positive talent(s)."] = "%d 良好天赋.";
L["%d Negative talent(s)."] = "%d 不良天赋.";
L["Right-Click to flag this enchant as negative for this spec."] = "右键点击 标记这个附魔相对这个天赋为不良.";
L["Left-Click to flag this enchant as positive for this spec."] = "左键点击 标记这个附魔相对这个天赋为良好.";
L["Middle-Click to flag this enchant as neutral for this spec."] = "中键点击 标记这个附魔相对这个天赋为一般.";
L["You have marked this enchantment as bad for this spec."] = "你已标记这个附魔相对这个天赋为很差.";

-- Class Info --
L["This player has no specialization for their class."] = "这个玩家没有所属职业的天赋";
L["Shaman"] = "萨满";
L["Elemental"] = "元素";
L["Enhancement"] = "增强";
L["Restoration"] = "恢复";
L["Rogue"] = "盗贼";
L["Assassination"] = "刺杀";
L["Combat"] = "战斗";
L["Subtlety"] = "敏锐";
L["Tank"] = "坦克";
L["Caster DPS"] = "法系DPS";
L["Melee DPS"] = "近战DPS";
L["Healer"] = "补职";
L["Warlock"] = "术士";
L["Affliction"] = "痛苦";
L["Demonology"] = "恶魔";
L["Destruction"] = "毁灭";

-- Stats --
L["STA"] = "耐力";
L["INT"] = "智力";
L["SPI"] = "精神";
L["AGI"] = "敏捷";
L["STR"] = "力量";
L["DODGE"] = "躲闪";
L["PARRY"] = "招架";
L["CRIT"] = "致命一击";
L["HASTE"] = "加速";
L["TOHIT"] = "TOHIT";
L["EXPERTISE"] = "熟练";
L["MASTERY"] = "精通";
L[" "] = " ";
L["These values represent stats acquired from gear only. They do not account for Talents, Buffs, Passive Abilities, Spells, or Base Stats."] = "这些分值仅体现了从装备上获得的收益. 没有统计天赋, 增益, 被动技能, 法术或基础人物数据.";


-- Instances -- 
L["Heroic Icecrown 25 player"] = "英雄ICC 25人";
L["Heroic Icecrown 10 player"] = "英雄ICC 10人";
L["Icecrown 25 player"] = "ICC 25人";
L["Icecrown 10 player"] = "ICC 10人";
L["Trial of the Grand Crusader 25 player"] = "TOGC 25人";
L["Trial of the Grand Crusader 10 player"] = "TOGC 10人";
L["Trial of the Crusader 25 player"] = "TOC 25人";
L["Trial of the Crusader 10 player"] = "TOC 10人";
L["Ulduar 25 player"] = "奥杜亚 25人";
L["Ulduar 10 player"] = "奥杜亚 10人";
L["Naxxramas 25 player"] = "Naxx 25人";
L["Naxxramas 10 player"] = "Naxx 10人";
L["Wintergrasp 25 player"] = "冬握湖 25人";
L["Wintergrasp 10 player"] = "冬握湖 10人";
L["Malygos 25 player"] = "玛里苟斯 25人";
L["Malygos 10 player"] = "玛里苟斯 10人";
L["Heroic Ruby Sanctum 25 player"] = "英雄RS 25人";
L["Heroic Ruby Sanctum 10 player"] = "英雄RS 10人";
L["Ruby Sanctum 25 player"] = "RS 25人";
L["Ruby Sanctum 10 player"] = "RS 10人";
L["Anub'arak kills"] = "阿努佈雷坎击杀";
L["Blackwing Descent"] = "黑翼陷窟";
L["The Bastion of Twilight"] = "暮光堡垒";
L["Throne of the Four Winds"] = "四风王座";
			
-- Expansion Names --
L["Wrath of the Lich King"] = "巫妖王之怒";
L["Cataclysm"] = "大灾变";



-- HELP FILES --
L["Introduction"] = "介绍";
L["Welcome to GearScore/PlayerScore 4.0\n\nGearScore is now PlayerScore, a collaboration between GearScore and MMORPG news and guides website, TenTonHammer.com. With a vast array of features, easy to use interface, and an integrated web component, PlayerScore is the most powerful addon experience ever created for World of Warcraft.\n\nClick a Question on the left to view more information and in-game help."] = "";
L["What is PlayerScore?"] = "什麽是 PlayerScore";
L["Questions"] = "问题";
L["How are scores calculated?"] = "分值如何计算?";
L["|cffff0000GearScore|r is based on the equipment a player wears. It factors item level, gems, enchants, and appropriateness to class and spec.\n\n|cffff0000Raid Score|r is based on experience in raids and bosses killed.\n\n|cffff0000PvE Score|r is based on Quests and dungeons completed, and faction standing.\n\n|cffff0000PvP Score|r is based on your Arena & Battleground participation, rankings, win/loss ratio, and PvP Kills.\n\n|cffff0000Player Rating|r is based on ratings from other players."] = "";
L["PlayerScore is a world wide player ranking and information service for World of Warcraft. PlayerScore is comprised of a Web-based component, an auto-updater, and an in-game addon. These components work together to create the most powerful addon experience ever created for WoW.\n\nThe Web-based component allows you to view world-wide rankings and scores for any player as well as allowing you to comment and rate other players.\n\nThe Addon is this program your using right now and allows you to view scores in-game as well as providing essential information about other players. You can rate players you play with and upload the data to PlayerScore.com via the Updater.\n\nThe Updater allows you to download the scores and ratings of every player on your server, keeps the addon up to date, and uploads in-game ratings and data collected from the addon."] = "";
L["What exactly is the Updater?"] = "What exactly is the Updater?";
L["The Updater is a completely optional piece of software written by Ten Ton Hammer which is completely external to World of Warcraft. It keeps the AddOn up-to-date, uploads data you gather and ratings you assign (so that they can be shared with others), and (if you so choose) downloads character information from Ten Ton Hammer for you to view in-game. If you never run the Updater, your data won't be shared and no one else will know how you rated other players.\n\nThe Updater doesn't collect any personal information. It only transmits scores and ratings for characters and never your World of Warcraft Account Name or Password. |cffff0000You should never give your password to anyone."] = "The Updater is a completely optional piece of software written by Ten Ton Hammer which is completely external to World of Warcraft. It keeps the AddOn up-to-date, uploads data you gather and ratings you assign (so that they can be shared with others), and (if you so choose) downloads character information from Ten Ton Hammer for you to view in-game. If you never run the Updater, your data won't be shared and no one else will know how you rated other players.\n\nThe Updater doesn't collect any personal information. It only transmits scores and ratings for characters and never your World of Warcraft Account Name or Password. |cffff0000You should never give your password to anyone.";
L["How do I use the addon?"] = "How do I use the addon?";
L["Using the addon is very simple. Simply target any player and inspect them. You can right click their picture and choose inspect from the options menu or you can type '/inspect'. The PlayerScore addon will appear and display information about this player to you.\n\nYou can check each tab to view detailed information, or use the summary tab for a break down of the most essential data."] = "";
L["Why isn't scoring instant?"] = "Why isn't scoring instant?";
L["Does this addon spam?"] = "Does this addon spam?";
L["GearScore/PlayerScore 4.0 no longer contains automatic data communication aside from a single version number announcement when you first login.\n\nPrevious versions of GearScore would automatically transmit player information to other guildmates in order to allow everyone's database to stay up-to-date. This feature has been completely removed from GearScore/PlayerScore 4.0.\n\nGearScore/PlayerScore now relies on the updater to keep your database up-to-date. If you choose to use the updater then scores for every player on your server will be downloaded automatically. Otherwise only information you have personally gathered with the addon will be saved to your database."] = "GearScore/PlayerScore 4.0 no longer contains automatic data communication aside from a single version number announcement when you first login.\n\nPrevious versions of GearScore would automatically transmit player information to other guildmates in order to allow everyone's database to stay up-to-date. This feature has been completely removed from GearScore/PlayerScore 4.0.\n\nGearScore/PlayerScore now relies on the updater to keep your database up-to-date. If you choose to use the updater then scores for every player on your server will be downloaded automatically. Otherwise only information you have personally gathered with the addon will be saved to your database.";
L["What happened to the database?"] = "What happened to the database?";
L["In GearScore 3.0 the database stored a vast array of information about a player to allow for the remote armory feature. This information required an unreasonable amount of system resources and generally slowed a player's computer down.\n\nThe PlayerScore Updater has the ability to download a database of every player on your server, However this information is minimal and is 95% smaller then the GearScore 3.0 database.\n\nIn GearScore/PlayerScore 4.0 the remote armory feature was removed. However, you can now right-click their names in your chat window to generate a link to their Online PlayerScore profile. This profile shows you scores, ratings, rankings, and even comments on any player."] = "In GearScore 3.0 the database stored a vast array of information about a player to allow for the remote armory feature. This information required an unreasonable amount of system resources and generally slowed a player's computer down.\n\nThe PlayerScore Updater has the ability to download a database of every player on your server, However this information is minimal and is 95% smaller then the GearScore 3.0 database.\n\nIn GearScore/PlayerScore 4.0 the remote armory feature was removed. However, you can now right-click their names in your chat window to generate a link to their Online PlayerScore profile. This profile shows you scores, ratings, rankings, and even comments on any player.";
--L["Can scores be faked?"] = "";
--L["If you manually scan a player then score information cannot be faked, as this information is requested directly from the World of Warcraft servers.\n\nHowever, when you use the request & transmit features, players who transmit their scores to you could send fake data. You should always manually inspect players when you get the chance.\n\nIf you are using the request & transmit features to build a raid you can also use the 'Scan Group' feature to confirm data. Once everyone in the raid is gathered simply click 'Scan Group' and the PlayerScore will scan everyone in your group (within inspection range) and display their scores. A quick glance will let you see if anything is out of place or if anyone faked their information to you."] = "";





--Options --
L["Show GearScore"] = "显示 GS 分值";
L["Show Raid Score"] = "显示团队分值";
L["Show PvE Score"] = "显示 PvE 分值";
L["Show PvP Score"] = "显示 PvP 分值";
L["Show Player Ratings"] = "显示玩家评级";
L["Show known GearScores of players on mouse-over tooltip."] = "在提示讯息中显示玩家的已知 GS 值.";
L["Show known Player Ratings of players on mouse-over tooltip."] = "在提示讯息中显示玩家的评级.";
L["Show known PvP Scores of players on mouse-over tooltip."] = "在提示讯息中显示玩家的 PvP 分值.";
L["Show known Raid Scores of players on mouse-over tooltip."] = "在提示讯息中显示玩家的团队分值.";
L["Show known PvE Scores of players on mouse-over tooltip."] = "在提示讯息中显示玩家的 PvE 分值.";
L["Show Chat Frame Tooltips"] = "显示聊天框提示讯息";
L["Shows PlayerScore tooltips in your chat frame"] = "在你的聊天框中显示玩家评分提示讯息.";

L["Integrate with Inspection"] = "合併检视UI";
L["When enabled, this option replaces the default inspection UI with PlayerScore's Scan feature."] = "启用后, 这个选项将把预设的监视UI替换为玩家评分的检查功能.";
L["Save Playerscore Data"] = "储存玩家评分数据";
L["When enabled, PlayerScore will save the score information.\n\nOut of date information is automatically removed, and database size is automatically limited.\n\nThis feature allows you to view PlayerScores of players on mouseover or in chat.\n"] = "启用后, 玩家评分将储存这个分值讯息.\n\n过期数据将被自动移除, 数据库大小也会自动限制.\n\n这个功能允许你在提示讯息或在聊天框中查看玩家的玩家评分.\n";
L["Use Hammer Icon"] = "使用锤型图示";
L["When enabled, PlayerScore will display a hammer icon on your screen which you can use to access PlayerScore features."] = "启用后, 将在你的屏幕上显示一个锤形的图示来打开玩家评分功能.";
L["Use Minimap Button"] = "使用小地图按钮";
L["Use Titan Panel Plugin"] = "使用 Titan 讯息条插件";
L["Use Foobar Plugin"] = "使用 Fubar 插件";
L["|cffcccccc(Currently Unavailable, look for an update soon!)"] = "|cffcccccc(当前不可用, 马上搜寻更新!)";
L["Anchor Bottom-Left"] = "锚点: 底部左侧";
L["Anchor Bottom-Right"] = "锚点: 底部右侧";
L["Anchor Top-Right"] = "锚点: 顶部右侧";
L["Anchor Top-Left"] = "锚点: 顶部左侧";
L["Anchor the hammer icon to the top-right of the pop-out controls."] = "锤形图示定位在弹出式控制的顶部右侧";
L["Anchor the hammer icon to the top-left of the pop-out controls."] = "锤形图示定位在弹出式控制的顶部左侧";
L["Anchor the hammer icon to the bottom-right of the pop-out controls."]  = "锤形图示定位在弹出式控制的底部右侧";
L["Anchor the hammer icon to the bottom-left of the pop-out controls."] = "锤形图示定位在弹出式控制的底部左侧";
L["Download Online Database"] = "下载在綫数据库";
L["(This option requires the PlayerScore Updater)\n\nWhen Enabled, this option will allow your updater to download PlayerScore data for this server.\n\nDownload the updater at PlayerScore.com"] = "(这个选项需要玩家评分更新器)\n\n启用后, 这个选项将允许你上传和下载这个服务器的玩家评分数据.\n\n在 PlayerScore.com 下载更新器.";
L["To view News in game, you must use the PlayerScore Updater. Get the Updater at www.PlayerScore.com!"] = "你必须使用玩家评分更新器来在游戏中查看新闻. 在 PlayerScore.com 下载更新器.";
L["Enable this tab."] = "启用这个标籤";
L["Enable Equipment Tab"] = "启用装备标籤";
L["Enable Talents Tab"] = "启用天赋标籤";
L["Enable Experience Tab"] = "启用经验标籤";
L["Enable PvP Tab"] = "启用 PvP 标籤";
L["Enable News Tab"] = "启用新闻标籤";
L["Enable Group Tab"] = "启用队伍标籤";
L["Enable Quick-Scan Mode"] = "启用快速检查模式";
L["When enbled, this mode will scan & score a characther when you target them. The scan will still take a few seconds to request item information from the server.\n\nThis mode may decrease performance due to constant inspecting / scanning. A future release will make this mode far more efficient.\n\nTo prevent lag, this mode will not function while you are in combat."] = "启用后, 这个模式将在你以他们为目标时检查 & 评分这个角色. 检查需要几秒钟来从服务器请求装备物品数据.\n\n这个模式因为要不断的请求检视数据而导致性能的降低. 未来的某个正式版将使这个模式更具有效率.\n\n为了防止延迟, 这个模式在你战斗中将不启用.";
