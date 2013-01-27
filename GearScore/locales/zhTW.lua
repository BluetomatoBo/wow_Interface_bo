-- zhTW By wowui.me
local L = LibStub("AceLocale-3.0"):NewLocale("GearScore4", "zhTW", false)
if not ( L ) then return false; end;

L["This is an aggregate of the various other scores, to give you a quick indication of a player's overall competency. It is weighted to consider the GearScore most heavily. The Crafting Score does not contribute to the Super Score."] = "這個壹個不同分值的集合, 給妳壹個關於玩家總體情況的快速指示. 這個主要是有玩家的GS值加權而成. 專業技能分值沒有合並到超級分值中.";
L["GearScore is based on a player's equipment. It considers item level, gems and enchants, and appropriateness to class and spec. Two handed weapons receive bonuses, as do Hunter ranged weapons."] = "GS值基於玩家的裝備, 如物品等級, 寶石和附魔, 職業和天賦等.雙手武器和獵人的遠程武器也享受加成.";
L["Raid score is based on the number of completed raids."] = "團隊分值基於已完成的團隊地城數量.";
L["PvE Score is based on quests and dungeons completed, bosses killed, and faction standing."] = "PvE 分值基於已完成的任務,地城,首領擊殺以及陣營聲望等.";
L["PvP Score is based on arena and battleground participation, win/lose ratios, and PvP kills."] = "PvP 分值寄居競技場和戰場的參賽, 輸贏比率和 PvP 擊殺等.";
L["Crafting Score is based on Professions maxed, recipes learned, and secondary skills."] = "製作分值基於專業技能, 已學圖紙和次要專業.";
L["Scan all members of your party or raid within inspection range. This will take about 30s"] = "在檢視範圍內檢查你的消毒或團隊的所有成員. 這個需要耗時大約30秒.";
L["Latest news from TenTonHammer.com. Click a title for the whole article."] = "TenTonHammer.com的最新訊息, 點擊標題來查看完整的文章.";
L["%d database entries imported from PlayerScore.com."] = "%d 數據庫條目導入自 PlayerScore.com.";


L["GLOBAL_SEP"] = " +";
L["SEPARATORS"]= { "/", ", ", " & ", " and " };
L["PREFIX_SET"] = "組合: "




L["View your PlayerScore profile."] = "查看你的玩家評分設定檔";
L["View the PlayerScore profile of your current target."] = "查看你當前目標的玩家評分設定檔";
L["View PlayerScore summary for your entire party or raid."] = "查看你所在小隊或團隊的玩家評分摘要";
L["View your Online PlayerScore profile."] = "查看你的在綫玩家評分設定檔";
L["View help information."] = "查看幫助訊息";
L["View PlayerScore options."] = "查看玩家評分選項";
L["Scan Target"] = "檢查目標";
L["My Profile"] = "我的設定檔";
L["View Group"] = "查看隊伍";
L["My Online Profile"] = "我的在綫設定檔";
L["Scan Group"] = "檢查隊伍";
L["Scanning..."] = "檢查中....";
L["Posted %s by"] = "發佈 %s 來自";

-- Tabs / Scores
L["Summary"] = "摘要";
L["Database"] = "數據庫";
L["Help"] = "幫助";
L["Options"] = "選項";
L["GearScore"] = "GS值";
L["Rate"] = "評級";
L["Super"] = "超級";
L["Equip"] = "裝備";
L["PvP"] = "PvP";
L["PvE"] = "PvE";
L["Raid"] = "團隊";
L["PlayerScore"] = "玩家評分";
L["Equipment"] = "裝備";
L["Talents"] = "天賦";
L["Experience"] = "經驗";
L["Group"] = "隊伍";
L["Scan All"] = "檢查全部";
L["News"] = "新聞";

--Equipment--
L["Head"] = "頭部"; 
L["Neck"] = "頸部"; 
L["Shoulder"] = "肩膀"; 
L["Chest"] = "胸部"; 
L["Waist"] = "腰部"; 
L["Legs"] = "腿部"; 
L["Feet"] = "腳部"; 
L["Wrist"] = "手腕"; 
L["Gloves"] = "手套"; 
L["Finger 1"] = "手指 1"; 
L["Finger 2"] = "手指 2"; 
L["Trinket 1"] = "飾品 1"; 
L["Trinket 2"] = "飾品 2"; 
L["Back"] = "背部"; 
L["Main Hand"] = "主手"; 
L["Off Hand"] = "副手"; 
L["Ranged"] = "遠程"; 
L["Missing Enchantment!"] = "缺失的附魔";

--MISC--
L[""] = "";
L["???"] = "???";
L["Whisper this player."] = "密語這個玩家";
L["Invite this player to your group."] = "邀請這個玩家到你的隊伍";
L["Refresh data on your curent target."] = "刷新你當前目標的數據";
L["Generate a link to this player's Online Profile at PlayerScore.com. View World-wide rankings, comments, and more."] = "為這個玩家生成一個在PlayerScore.com的設定檔的鏈接. 查看在世界範圍內的等級, 評論以及更多.";
L["Just keep sitting there in your underwear for approximately 2 seconds."] = "只要穿著你的內衣坐在那大約2秒.";
L["This section will automagically refresh when we're done. Thanks!"] = "這個部分將在我們完成時自動刷新. 謝謝!";
L["Calculating scores, shining shields, putting the Gob in Goblins."] = "Calculating scores, shining shields, putting the Gob in Goblins.";
L["Right-Click to flag this talent as negative."] = "右鍵點擊 標記這個天賦為不良.";
L["Left-Click to flag this talent as positive."] = "左鍵點擊 標記這個天賦為良好.";
L["Middle-Click to flag this talent as neutral."] = "中鍵點擊 標記這個天賦為一般.";
L["GearScore Upgrades:"] = "GearScore 升級:";
L["Ctrl-Right Click to find an upgrade!"] = "Ctrl-右鍵點擊 搜尋一個更新!";
L["No PlayerScore information found for this player."] = "沒有找到這個玩家的玩家評分訊息";
L["Ctrl-Right Click to view this player's scores online."] = "Ctrl-右鍵點擊 在綫查看這個玩家的評分.";
L["Left-Click to scan your current target"] = "左鍵點擊 檢查你的當前目標";
L["Right-Click to Collapse."] = "右鍵點擊 收起";
L["Right-Click to Expand."] = "右鍵點擊 展開";
L["View the latest news from TenTonHammer.com"] = "查看來自 TenTonHammer.com 的最新新聞.";
L["Click here for URL to full story."] = "點擊這裡獲得鏈接";
L["Right-Click to flag this gem as negative for this spec."] = "右鍵點擊 標記相對這個天賦的寶石為不良.";
L["Left-Click to flag this gem as positive for this spec."] = "左鍵點擊 標記相對這個天賦的寶石為良好.";
L["Middle-Click to flag this gem as neutral for this spec."] = "中鍵點擊 標記相對這個天賦的寶石為一般.";



--Player Information--
L["Player Rating"] = "玩家評級";
L["PlayerScores"] = "玩家評分";
L["Raiding Difficulty"] = "團隊難度";
L["Raiding Progression"] = "團隊進度";
L["Information"] = "訊息";
L["Status"] = "狀態";
L["%d Unused Talent(s)"] = "%d 未分配天賦"; -- DO NOT CHANGE %d
L["No Guild"] = "沒有公會";
L["%d Unenchanted Item(s)"] = "%d 未附魔裝備"; -- DO NOT CHANGE %d
L["All Items Enchanted"] = "所有裝備已附魔";
L["No Empty Gem Sockets"] = "沒有空的寶石插槽";
L["%d Empty Gem Socket(s)"] = "%d 空的寶石插槽";-- DO NOT CHANGE %d
L["High Ranking Member of Guild"] = "公會的高等級成員";
L["%s is a %q of this %s guild."] = "%s 是公會 %s 的一位 %q ."; -- Structure this sentence to fit into your languages Subject/Verb/Object format. First %s is the Player's Name, %q is the player's rank, and the second %s is their faction.
L["Player ratings are ratings assigned by other players. They are gathered from the addon and PlayerScore.com. \n\nTo view ratings or upload them you must use the PlayerScore Updater. Visit PlayerScore.com for more information."] = "玩家評分已分配給其他玩家評分, 他們採集自這個插件和 PlayerScore.com. \n\n要查看評級或上傳你必須使用玩家評分更新器. 訪問 PlayerScore.com 來查看更多訊息.";
L["Click here to rate this player up."] = "點擊這裡提升這個玩家的評級";
L["Click here to rate this player down."] = "點擊這裡降低這個玩家的評級";
L["Belt Buckle Detected"] = "腰帶打孔";
L["Missing Belt Buckle"] = "缺失腰帶打孔";
L["This player has not applied a Belt Buckle to their belt."] = "這個玩家沒有腰帶打孔";
L["This player has used a Belt buckle to add a gem socket to their %s."] = "這個玩家已使用玩家打孔";
L["Belt Buckle"] = "腰帶打孔";
L["%s is out of inspection range."] = "%s 超出了檢視距離.";
L["This player is currently riding a Spectral Tiger!"] = "這個玩家當前騎的是鬼靈之虎!";
L["Celestial Steed"] = "星穹戰馬";
L["Spectral Tiger"] = "鬼靈之虎";
L["Estimated GearScore Upgrades:"] = "預測 GearScore 升級:";
L["%d Negative gems."] = "%d 不良寶石.";
L["%d Negative enchantments."] = "%d 不良附魔.";
L["This player is using gems which you have marked as negative for their spec."] = "這個玩家正在使用被你標記為相對他們天賦不符合的寶石.";
L["This player is using enchantments which you have marked as negative for their spec."] = "這個玩家正在使用被你標記為相對他們天賦不符合的附魔.";

--Raid Difficulty--
L["Trivial"] = "瑣碎";
L["Easy"] = "簡易";
L["Effortless"] = "輕鬆";
L["Normal"] = "普通";
L["Light"] = "輕微";
L["Moderate"] = "中等";
L["Formidable"] = "強大";
L["Brutal"] = "殘酷";
L["Challenging"] = "挑戰";
L["Difficult"] = "困難";
L["Impossible"] = "難以想像";
L["Naxxramas 10"] = "Naxx 10";
L["Naxxramas 25"] = "Naxx 25";
L["Ulduar 10"] = "奧杜爾 10";
L["Ulduar 25"] = "奧杜爾 25";
L["Crusader 10"] = "TOC 10";
L["Crusader 25"] = "TOC 25";
L["Icecrown 10"] = "ICC 10";
L["Icecrown 25"] = "ICC 25";
L["Heroic Icecrown 25"] = "英雄ICC 25";
L["Level 80 Heroics"] = "等級 80 英雄";
L["Tier 11 Raids"] = "T11 團隊";
L["Level 85 Heroics"] = "等級 85 英雄";
L["This player will need extremely honed skills to succeed in this instance."] = "這個玩家還需要很多的磨練來勝任這個地城.";
L["This player will need perfect skills and reaction time to succeed in this instance."] = "這個玩家還需要完美的技能來勝任這個地城.";
L["This player would face utter defeat and devastation in this instance."] = "";
L["This player has enchanted all their enchantable items which will increase their performance."] = "這個玩家的裝備已經全部附魔.";
L["This player is missing enchantments and will not be able to perform at their maximum."] = "這個玩家有缺失的附魔, 不能發揮自己的全部實力.";
L["This player is missing gems and will not be able to perform at their maximum."] = "這個玩家有缺失的寶石, 不能發揮自己的全部實力";
L["This player has not spent some of their talents. This will significantly lower this player's potential."] = "這個玩家的天賦有未分配的點數.";
L["This player has gemmed all their items which will increase their performance."] = "這個玩家的裝備已經全部插上寶石.";
L["A player who is not a member of a guild is more likely to not play well with other players."] = "沒有公會的玩家看起來不能和其他玩家玩的來.";
L["These items are not appropriate for this player's spec. These items will reduce this player's potential performance in PVE Combat."] = "這些物品不適用於這個玩家的天賦. 這些物品將在 PvE 戰鬥中降低玩家的表現.";
L["This player is missing equipment and which will drastically reduce performance."] = "這個玩家有未裝備的部位.";
L["%s empty equipment slot(s)"] = "%s 空的裝備插槽";
L["This player has talents that you have marked as positive."] = "這個玩家擁有你標記為良好的天賦.";
L["This player has talents that you have marked as negative."] = "這個玩家擁有你標記為不良的天賦.";
L["%d %s items equipped"] = "%d %s 物品已裝備";
L["%d Positive talent(s)."] = "%d 良好天賦.";
L["%d Negative talent(s)."] = "%d 不良天賦.";
L["Right-Click to flag this enchant as negative for this spec."] = "右鍵點擊 標記這個附魔相對這個天賦為不良.";
L["Left-Click to flag this enchant as positive for this spec."] = "左鍵點擊 標記這個附魔相對這個天賦為良好.";
L["Middle-Click to flag this enchant as neutral for this spec."] = "中鍵點擊 標記這個附魔相對這個天賦為一般.";
L["You have marked this enchantment as bad for this spec."] = "你已標記這個附魔相對這個天賦為很差.";

-- Class Info --
L["This player has no specialization for their class."] = "這個玩家沒有所屬職業的天賦";
L["Shaman"] = "薩滿";
L["Elemental"] = "元素";
L["Enhancement"] = "增強";
L["Restoration"] = "恢復";
L["Rogue"] = "盜賊";
L["Assassination"] = "刺殺";
L["Combat"] = "戰鬥";
L["Subtlety"] = "敏銳";
L["Tank"] = "坦克";
L["Caster DPS"] = "法系DPS";
L["Melee DPS"] = "近戰DPS";
L["Healer"] = "補職";
L["Warlock"] = "術士";
L["Affliction"] = "痛苦";
L["Demonology"] = "惡魔";
L["Destruction"] = "毀滅";

-- Stats --
L["STA"] = "耐力";
L["INT"] = "智力";
L["SPI"] = "精神";
L["AGI"] = "敏捷";
L["STR"] = "力量";
L["DODGE"] = "躲閃";
L["PARRY"] = "招架";
L["CRIT"] = "致命一擊";
L["HASTE"] = "加速";
L["TOHIT"] = "TOHIT";
L["EXPERTISE"] = "熟練";
L["MASTERY"] = "精通";
L[" "] = " ";
L["These values represent stats acquired from gear only. They do not account for Talents, Buffs, Passive Abilities, Spells, or Base Stats."] = "這些分值僅體現了從裝備上獲得的收益. 沒有統計天賦, 增益, 被動技能, 法術或基礎人物數據.";


-- Instances -- 
L["Heroic Icecrown 25 player"] = "英雄ICC 25人";
L["Heroic Icecrown 10 player"] = "英雄ICC 10人";
L["Icecrown 25 player"] = "ICC 25人";
L["Icecrown 10 player"] = "ICC 10人";
L["Trial of the Grand Crusader 25 player"] = "TOGC 25人";
L["Trial of the Grand Crusader 10 player"] = "TOGC 10人";
L["Trial of the Crusader 25 player"] = "TOC 25人";
L["Trial of the Crusader 10 player"] = "TOC 10人";
L["Ulduar 25 player"] = "奧杜亞 25人";
L["Ulduar 10 player"] = "奧杜亞 10人";
L["Naxxramas 25 player"] = "Naxx 25人";
L["Naxxramas 10 player"] = "Naxx 10人";
L["Wintergrasp 25 player"] = "冬握湖 25人";
L["Wintergrasp 10 player"] = "冬握湖 10人";
L["Malygos 25 player"] = "瑪裏苟斯 25人";
L["Malygos 10 player"] = "瑪裏苟斯 10人";
L["Heroic Ruby Sanctum 25 player"] = "英雄RS 25人";
L["Heroic Ruby Sanctum 10 player"] = "英雄RS 10人";
L["Ruby Sanctum 25 player"] = "RS 25人";
L["Ruby Sanctum 10 player"] = "RS 10人";
L["Anub'arak kills"] = "阿努佈雷坎擊殺";
L["Blackwing Descent"] = "黑翼陷窟";
L["The Bastion of Twilight"] = "暮光堡壘";
L["Throne of the Four Winds"] = "四風王座";
			
-- Expansion Names --
L["Wrath of the Lich King"] = "巫妖王之怒";
L["Cataclysm"] = "大災變";



-- HELP FILES --
L["Introduction"] = "介紹";
L["Welcome to GearScore/PlayerScore 4.0\n\nGearScore is now PlayerScore, a collaboration between GearScore and MMORPG news and guides website, TenTonHammer.com. With a vast array of features, easy to use interface, and an integrated web component, PlayerScore is the most powerful addon experience ever created for World of Warcraft.\n\nClick a Question on the left to view more information and in-game help."] = "";
L["What is PlayerScore?"] = "什麼是 PlayerScore";
L["Questions"] = "問題";
L["How are scores calculated?"] = "分值如何計算?";
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
L["Show GearScore"] = "顯示 GS 分值";
L["Show Raid Score"] = "顯示團隊分值";
L["Show PvE Score"] = "顯示 PvE 分值";
L["Show PvP Score"] = "顯示 PvP 分值";
L["Show Player Ratings"] = "顯示玩家評級";
L["Show known GearScores of players on mouse-over tooltip."] = "在提示訊息中顯示玩家的已知 GS 值.";
L["Show known Player Ratings of players on mouse-over tooltip."] = "在提示訊息中顯示玩家的評級.";
L["Show known PvP Scores of players on mouse-over tooltip."] = "在提示訊息中顯示玩家的 PvP 分值.";
L["Show known Raid Scores of players on mouse-over tooltip."] = "在提示訊息中顯示玩家的團隊分值.";
L["Show known PvE Scores of players on mouse-over tooltip."] = "在提示訊息中顯示玩家的 PvE 分值.";
L["Show Chat Frame Tooltips"] = "顯示聊天框提示訊息";
L["Shows PlayerScore tooltips in your chat frame"] = "在你的聊天框中顯示玩家評分提示訊息.";

L["Integrate with Inspection"] = "合併檢視UI";
L["When enabled, this option replaces the default inspection UI with PlayerScore's Scan feature."] = "啟用後, 這個選項將把預設的監視UI替換為玩家評分的檢查功能.";
L["Save Playerscore Data"] = "儲存玩家評分數據";
L["When enabled, PlayerScore will save the score information.\n\nOut of date information is automatically removed, and database size is automatically limited.\n\nThis feature allows you to view PlayerScores of players on mouseover or in chat.\n"] = "啟用後, 玩家評分將儲存這個分值訊息.\n\n過期數據將被自動移除, 數據庫大小也會自動限制.\n\n這個功能允許你在提示訊息或在聊天框中查看玩家的玩家評分.\n";
L["Use Hammer Icon"] = "使用錘型圖示";
L["When enabled, PlayerScore will display a hammer icon on your screen which you can use to access PlayerScore features."] = "啟用後, 將在你的屏幕上顯示一個錘形的圖示來打開玩家評分功能.";
L["Use Minimap Button"] = "使用小地圖按鈕";
L["Use Titan Panel Plugin"] = "使用 Titan 訊息條插件";
L["Use Foobar Plugin"] = "使用 Fubar 插件";
L["|cffcccccc(Currently Unavailable, look for an update soon!)"] = "|cffcccccc(當前不可用, 馬上搜尋更新!)";
L["Anchor Bottom-Left"] = "錨點: 底部左側";
L["Anchor Bottom-Right"] = "錨點: 底部右側";
L["Anchor Top-Right"] = "錨點: 頂部右側";
L["Anchor Top-Left"] = "錨點: 頂部左側";
L["Anchor the hammer icon to the top-right of the pop-out controls."] = "錘形圖示定位在彈出式控制的頂部右側";
L["Anchor the hammer icon to the top-left of the pop-out controls."] = "錘形圖示定位在彈出式控制的頂部左側";
L["Anchor the hammer icon to the bottom-right of the pop-out controls."]  = "錘形圖示定位在彈出式控制的底部右側";
L["Anchor the hammer icon to the bottom-left of the pop-out controls."] = "錘形圖示定位在彈出式控制的底部左側";
L["Download Online Database"] = "下載在綫數據庫";
L["(This option requires the PlayerScore Updater)\n\nWhen Enabled, this option will allow your updater to download PlayerScore data for this server.\n\nDownload the updater at PlayerScore.com"] = "(這個選項需要玩家評分更新器)\n\n啟用後, 這個選項將允許你上傳和下載這個服務器的玩家評分數據.\n\n在 PlayerScore.com 下載更新器.";
L["To view News in game, you must use the PlayerScore Updater. Get the Updater at www.PlayerScore.com!"] = "你必須使用玩家評分更新器來在遊戲中查看新聞. 在 PlayerScore.com 下載更新器.";
L["Enable this tab."] = "啟用這個標籤";
L["Enable Equipment Tab"] = "啟用裝備標籤";
L["Enable Talents Tab"] = "啟用天賦標籤";
L["Enable Experience Tab"] = "啟用經驗標籤";
L["Enable PvP Tab"] = "啟用 PvP 標籤";
L["Enable News Tab"] = "啟用新聞標籤";
L["Enable Group Tab"] = "啟用隊伍標籤";
L["Enable Quick-Scan Mode"] = "啟用快速檢查模式";
L["When enbled, this mode will scan & score a characther when you target them. The scan will still take a few seconds to request item information from the server.\n\nThis mode may decrease performance due to constant inspecting / scanning. A future release will make this mode far more efficient.\n\nTo prevent lag, this mode will not function while you are in combat."] = "啟用後, 這個模式將在你以他們為目標時檢查 & 評分這個角色. 檢查需要幾秒鐘來從服務器請求裝備物品數據.\n\n這個模式因為要不斷的請求檢視數據而導致性能的降低. 未來的某個正式版將使這個模式更具有效率.\n\n為了防止延遲, 這個模式在你戰鬥中將不啟用.";
