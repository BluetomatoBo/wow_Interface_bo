local L = LibStub("AceLocale-3.0"):NewLocale("GearScore4", "enUS", true)
L["This is an aggregate of the various other scores, to give you a quick indication of a player's overall competency. It is weighted to consider the GearScore most heavily. The Crafting Score does not contribute to the Super Score."] = true;
L["GearScore is based on a player's equipment. It considers item level, gems and enchants, and appropriateness to class and spec. Two handed weapons receive bonuses, as do Hunter ranged weapons."] = true;
L["Raid score is based on the number of completed raids."] = true;
L["PvE Score is based on quests and dungeons completed, bosses killed, and faction standing."] = true;
L["PvP Score is based on arena and battleground participation, win/lose ratios, and PvP kills."] = true;
L["Crafting Score is based on Professions maxed, recipes learned, and secondary skills."] = true;
L["Scan all members of your party or raid within inspection range. This will take about 30s"] = true;
L["Latest news from TenTonHammer.com. Click a title for the whole article."] = true;
L["%d database entries imported from PlayerScore.com."] = true;


L["GLOBAL_SEP"] = " +";
L["SEPARATORS"]= { "/", ", ", " & ", " and " };
L["PREFIX_SET"] = "Set: "




L["View your PlayerScore profile."] = true;
L["View the PlayerScore profile of your current target."] = true;
L["View PlayerScore summary for your entire party or raid."] = true;
L["View your Online PlayerScore profile."] = true;
L["View help information."] = true;
L["View PlayerScore options."] = true;
L["Scan Target"] = true;
L["My Profile"] = true;
L["View Group"] = true;
L["My Online Profile"] = true;
L["Scan Group"] = true;
L["Scanning..."] = true;
L["Posted %s by"] = true;

-- Tabs / Scores
L["Summary"] = true;
L["Database"] = true;
L["Help"] = true;
L["Options"] = true;
L["GearScore"] = true;
L["Rate"] = true;
L["Super"] =true;
L["Equip"] = true;
L["PvP"] = true;
L["PvE"] = true;
L["Raid"] = true;
L["PlayerScore"] = true;
L["Equipment"] = "Gear";
L["Talents"] = "Spec";
L["Experience"] = true;
L["Group"] = true;
L["Scan All"] = true;
L["News"] = true;
L["Equipped Average Item Level"] = true;

--Equipment--
L["Head"] = true; 
L["Neck"] = true; 
L["Shoulder"] = true; 
L["Chest"] = true; 
L["Waist"] = true; 
L["Legs"] = true; 
L["Feet"] = true; 
L["Wrist"] = true; 
L["Gloves"] = true; 
L["Finger 1"] = true; 
L["Finger 2"] = true; 
L["Trinket 1"] = true; 
L["Trinket 2"] = true; 
L["Back"] = true; 
L["Main Hand"] = true; 
L["Off Hand"] = true; 
L["Ranged"] = true; 
L["Missing Enchantment!"] = true;

--MISC--
L[""] = true;
L["???"] = true;
L["Whisper this player."] = true;
L["Invite this player to your group."] = true;
L["Refresh data on your curent target."] = true;
L["Generate a link to this player's Online Profile at PlayerScore.com. View World-wide rankings, comments, and more."] = true;
L["Just keep sitting there in your underwear for approximately 2 seconds."] = true;
L["This section will automagically refresh when we're done. Thanks!"] = true;
L["Calculating scores, shining shields, putting the Gob in Goblins."] = "Requesting player's equipment from the server...";
L["Right-Click to flag this talent as negative."] = true;
L["Left-Click to flag this talent as positive."] = true;
L["Middle-Click to flag this talent as neutral."] = true;
L["GearScore Upgrades:"] = true;
L["Ctrl-Right Click to find an upgrade!"] = true;
L["No PlayerScore information found for this player."] = true;
L["Ctrl-Right Click to view this player's scores online."] = true;
L["Left-Click to scan your current target"] = true;
L["Right-Click to Collapse."] = true;
L["Right-Click to Expand."] = true;
L["View the latest news from TenTonHammer.com"] = true;
L["Click here for URL to full story."] = true;
L["Right-Click to flag this gem as negative for this spec."] = true;
L["Left-Click to flag this gem as positive for this spec."] = true;
L["Middle-Click to flag this gem as neutral for this spec."] = true;



--Player Information--
L["Player Rating"] = true;
L["PlayerScores"] = true;
L["Raiding Difficulty"] = true;
L["Raiding Progression"] = true;
L["Information"] = true;
L["Status"] = true;
L["%d Unused Talent(s)"] = true; -- DO NOT CHANGE %d
L["No Guild"] = true;
L["%d Unenchanted Item(s)"] = true; -- DO NOT CHANGE %d
L["All Items Enchanted"] = true;
L["No Empty Gem Sockets"] = true;
L["%d Empty Gem Socket(s)"] = true;-- DO NOT CHANGE %d
L["High Ranking Member of Guild"] = true;
L["%s is a %q of this %s guild."] = true; -- Structure this sentence to fit into your languages Subject/Verb/Object format. First %s is the Player's Name, %q is the player's rank, and the second %s is their faction.
L["Player ratings are ratings assigned by other players. They are gathered from the addon and PlayerScore.com. \n\nTo view ratings or upload them you must use the PlayerScore Updater. Visit PlayerScore.com for more information."] = true;
L["Click here to rate this player up."] = true;
L["Click here to rate this player down."] = true;
L["Belt Buckle Detected"] = true;
L["Missing Belt Buckle"] = true;
L["This player has not applied a Belt Buckle to their belt."] = true;
L["This player has used a Belt buckle to add a gem socket to their %s."] = true;
L["Belt Buckle"] = true;
L["%s is out of inspection range."] = true;
L["This player is currently riding TRH... \n (Which means nothing at all.)"] = true;
L["This player is currently riding a Spectral Tiger!"] = true;
L["Celestial Steed"] = true;
L["Spectral Tiger"] = true;
L["Estimated GearScore Upgrades:"] = true;
L["%d Negative gems."] = true;
L["%d Negative enchantments."] = true;
L["This player is using gems which you have marked as negative for their spec."] = true;
L["This player is using enchantments which you have marked as negative for their spec."] = true;

--Raid Difficulty--
L["Trivial"] = true;
L["Easy"] = true;
L["Effortless"] = true;
L["Normal"] = true;
L["Light"] = true;
L["Moderate"] = true;
L["Formidable"] = true;
L["Brutal"] = true;
L["Challenging"] = true;
L["Difficult"] = true;
L["Impossible"] = true;
L["Naxxramas 10"] = true;
L["Naxxramas 25"] = true;
L["Ulduar 10"] = true;
L["Ulduar 25"] = true;
L["Crusader 10"] = true;
L["Crusader 25"] = true;
L["Icecrown 10"] = true;
L["Icecrown 25"] = true;
L["Heroic Icecrown 25"] = true;
L["Level 80 Heroics"] = true;
L["Tier 11 Raids"] = true;
L["Level 85 Heroics"] = true;
L["This player will need extremely honed skills to succeed in this instance."] = true;
L["This player will need perfect skills and reaction time to succeed in this instance."] = true;
L["This player would face utter defeat and devastation in this instance."] = true;
L["This player has enchanted all their enchantable items which will increase their performance."] = true;
L["This player is missing enchantments and will not be able to perform at their maximum."] = true;
L["This player is missing gems and will not be able to perform at their maximum."] = true;
L["This player has not spent some of their talents. This will significantly lower this player's potential."] = true;
L["This player has gemmed all their items which will increase their performance."] = true;
L["A player who is not a member of a guild is more likely to not play well with other players."] = true;
L["These items are not appropriate for this player's spec. These items will reduce this player's potential performance in PVE Combat."] = true;
L["This player is missing equipment and which will drastically reduce performance."] = true;
L["%s empty equipment slot(s)"] = true;
L["This player has talents that you have marked as positive."] = true;
L["This player has talents that you have marked as negative."] = true;
L["%d %s items equipped"] = true;
L["%d Positive talent(s)."] = true;
L["%d Negative talent(s)."] = true;
L["Right-Click to flag this enchant as negative for this spec."] = true;
L["Left-Click to flag this enchant as positive for this spec."] = true;
L["Middle-Click to flag this enchant as neutral for this spec."] = true;
L["You have marked this enchantment as bad for this spec."] = true;

-- Class Info --
 L["This player has no specialization for their class."] = true;
L["Shaman"] = true;
L["Elemental"] = true;
L["Enhancement"] = true;
L["Restoration"] = true;
L["Rogue"] = true;
L["Assassination"] = true;
L["Combat"] = true;
L["Subtlety"] = true;
L["Tank"] = true;
L["Caster DPS"] = true;
L["Melee DPS"] = true;
L["Healer"] = true;
L["Warlock"] = true;
L["Affliction"] = true;
L["Demonology"] = true;
L["Destruction"] = true;

-- Stats --
L["STA"] = "Stamina";
L["INT"] = "Intellect";
L["SPI"] = "Spirit";
L["AGI"] = "Agility";
L["STR"] = "Strength";
L["DODGE"] = "Dodge";
L["PARRY"] = "Parry";
L["CRIT"] = "Crit";
L["HASTE"] = "Haste";
L["TOHIT"] = "Hit";
L["EXPERTISE"] = "Expertise";
L["MASTERY"] = "Mastery";
L[" "] = true;
L["These values represent stats acquired from gear only. They do not account for Talents, Buffs, Passive Abilities, Spells, or Base Stats."] = true;


-- Instances -- 
L["Heroic Icecrown 25 player"] = true;
L["Heroic Icecrown 10 player"] = true;
L["Icecrown 25 player"] = true;
L["Icecrown 10 player"] = true;
L["Trial of the Grand Crusader 25 player"] = true;
L["Trial of the Grand Crusader 10 player"] = true;
L["Trial of the Crusader 25 player"] = true;
L["Trial of the Crusader 10 player"] = true;
L["Ulduar 25 player"] = true;
L["Ulduar 10 player"] = true;
L["Naxxramas 25 player"] = true;
L["Naxxramas 10 player"] = true;
L["Wintergrasp 25 player"] = true;
L["Wintergrasp 10 player"] = true;
L["Malygos 25 player"] = true;
L["Malygos 10 player"] = true;
L["Heroic Ruby Sanctum 25 player"] = true;
L["Heroic Ruby Sanctum 10 player"] = true;
L["Ruby Sanctum 25 player"] = true;
L["Ruby Sanctum 10 player"] = true;
L["Anub'arak kills"] = true;
L["Blackwing Descent"] = true;
L["The Bastion of Twilight"] = true;
L["Throne of the Four Winds"] = true;
			
-- Expansion Names --
L["Wrath of the Lich King"] = true;
L["Cataclysm"] = true;



-- HELP FILES --
L["Introduction"] = true;
L["Welcome to GearScore/PlayerScore 4.0\n\nGearScore is now PlayerScore, a collaboration between GearScore and MMORPG news and guides website, TenTonHammer.com. With a vast array of features, easy to use interface, and an integrated web component, PlayerScore is the most powerful addon experience ever created for World of Warcraft.\n\nClick a Question on the left to view more information and in-game help."] = true;
L["What is PlayerScore?"] = true;
L["Questions"] = true;
L["How are scores calculated?"] = true;
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
L["What happened to the database?"] = true;
L["In GearScore 3.0 the database stored a vast array of information about a player to allow for the remote armory feature. This information required an unreasonable amount of system resources and generally slowed a player's computer down.\n\nThe PlayerScore Updater has the ability to download a database of every player on your server, However this information is minimal and is 95% smaller then the GearScore 3.0 database.\n\nIn GearScore/PlayerScore 4.0 the remote armory feature was removed. However, you can now right-click their names in your chat window to generate a link to their Online PlayerScore profile. This profile shows you scores, ratings, rankings, and even comments on any player."] = true;
--L["Can scores be faked?"] = true;
--L["If you manually scan a player then score information cannot be faked, as this information is requested directly from the World of Warcraft servers.\n\nHowever, when you use the request & transmit features, players who transmit their scores to you could send fake data. You should always manually inspect players when you get the chance.\n\nIf you are using the request & transmit features to build a raid you can also use the 'Scan Group' feature to confirm data. Once everyone in the raid is gathered simply click 'Scan Group' and the PlayerScore will scan everyone in your group (within inspection range) and display their scores. A quick glance will let you see if anything is out of place or if anyone faked their information to you."] = true;





--Options --
L["Show GearScore"] = true;
L["Show Raid Score"] = true;
L["Show PvE Score"] = true;
L["Show PvP Score"] = true;
L["Master Loot Mode"] = true;
L["Show Player Ratings"] = true;
L["Show known GearScores of players on mouse-over tooltip."] = true;
L["Show known Player Ratings of players on mouse-over tooltip."] = true;
L["Show known PvP Scores of players on mouse-over tooltip."] = true;
L["Show known Raid Scores of players on mouse-over tooltip."] = true;
L["Show known PvE Scores of players on mouse-over tooltip."] = true;
L["Show Chat Frame Tooltips"] = true;
L["Shows PlayerScore tooltips in your chat frame"] = true;
L["When enabled loot items will display upgrade values of your raid members."] = true;

L["Integrate with Inspection"] = true;
L["When enabled, this option replaces the default inspection UI with PlayerScore's Scan feature."] = true;
L["Save Playerscore Data"] = true;
L["When enabled, PlayerScore will save the score information.\n\nOut of date information is automatically removed, and database size is automatically limited.\n\nThis feature allows you to view PlayerScores of players on mouseover or in chat.\n"] = true;
L["Use Hammer Icon"] = true;
L["When enabled, PlayerScore will display a hammer icon on your screen which you can use to access PlayerScore features."] = true;
L["Use Minimap Button"] = true;
L["Use Titan Panel Plugin"] = true;
L["Use Foobar Plugin"] = true;
L["|cffcccccc(Currently Unavailable, look for an update soon!)"] = true;
L["Anchor Bottom-Left"] = true;
L["Anchor Bottom-Right"] = true;
L["Anchor Top-Right"] = true;
L["Anchor Top-Left"] = true;
L["Anchor the hammer icon to the top-right of the pop-out controls."] = true;
L["Anchor the hammer icon to the top-left of the pop-out controls."] = true;
L["Anchor the hammer icon to the bottom-right of the pop-out controls."]  = true;
L["Anchor the hammer icon to the bottom-left of the pop-out controls."] = true;
L["Download Online Database"] = true;
L["(This option requires the PlayerScore Updater)\n\nWhen Enabled, this option will allow your updater to download PlayerScore data for this server.\n\nDownload the updater at PlayerScore.com"] = true;
L["To view News in game, you must use the PlayerScore Updater. Get the Updater at www.PlayerScore.com!"] = true;
L["Enable this tab."] = true;
L["Enable Equipment Tab"] = true;
L["Enable Talents Tab"] = true;
L["Enable Experience Tab"] = true;
L["Enable PvP Tab"] = true;
L["Enable News Tab"] = true;
L["Enable Group Tab"] = true;
L["Enable Quick-Scan Mode"] = true;
L["When enbled, this mode will scan & score a characther when you target them.\n\nTo prevent lag, this mode will not function while you are in combat."] = true;
L["Shows off-spec Item scores in item tooltips."] = true;
L["Show Off-Spec ItemScores"] = true;
L["Shows Equipped Average Item Level for Quick-Scan Targets."] = true;
L["When enabled with Quick-Scan mode, tooltips will display more detailed information."] = true;
L["Verbose"] = true;
L["Tier 11 Heroic Raids"] = true;
L["Lady Sinestra"] = true;



-- PVP TAB --
L["Battlegrounds"] = true;
L["Arenas"] = true;
L["Total Played"] = true;
L["Victories"] = true;
L["Arenas"] = true;
L["Duels"] = true;
L["Total Duels"] = true;
L["Victories"] = true;
L["Unenchanted"] = true;
L["Enchanted"] = true;



-- I'm going to just start ordering this in the order i make changes so you can keep up, instead of me droping in stuff at random locations --
--4.4.x
L["Paste this URL into your browser window to Claim/Verify your character."] = true;
L["Full"] = true;
L["Lite"] = true;
L["Manual"] = true;
L["Full Mode"] = true;
L["Manually Set Options"] = true;
L["View the options menu now, and manually set your PlayerScore options"] = true;
L["Disables the Graphical Interface and only displays information on tooltips."] = true;
L["Lite Mode"] = true;
L["How can I claim my character?"] = true;
L["Claiming your wow characters is very easy. Simply type '/claim' into your chat window. PlayerScore will generate a validation URL. Copy the URL and paste it into your browser. This will take you to PlayerScore's website and complete the character claiming process.\n\nClaimed characters earn a special in-game title viewable by all PlayerScore users. In addition you can track comments and ratings on your character and respond to criticism."] = true;
L["Type '/psreset' to re-enable full mode. Additional options comming soon."] = true;
L["Welcome to PlayerScore's Lite-Mode. Type '/ps' for options or to re-enable Full Mode"] = true;


--4.4.03
L["Reforged"] = true;

--4.5.00
L["Quick Rate Mode"] = true;
L["When enabled, PlayerScore will display a small window for quickly rating party members in a 5-man dungeon."] = true;
L["Rate Group"] = true;
L["Allows you to quickly rate your current party. You must have scanned them at least once to rate them."] = true;

--4.5.02
L["Baradin Hold"] = true;
L["Blackwing Descent"] = true;
L["Bastion of Twilight"] = true;
L["Throne of the Four Winds"] = true;

--4.5.03
L["iLvl Chat Compatibility"] = true;
L["Adds GearScore requirements in parentheses to LFM messages."] = true;

--4.6.00
L["PvP GearScore is normal GearScore adjusted to compensate for performance quality in PvP Combat."] = true;
L["PvP GearScore"] = true;
L["Raid Score"] = true;
L["PvP GearScore"] = true;
L["PvP Score"] = true;
L["Show PvP GearScore"] = true;
L["Show known PvP GearScores of players on mouse-over tooltip."] = true;
L["Bonus"] = true;
L["Bonus Tab Comming Soon!"] = true;

--4.6.01
L["Enable Bonus Tab"] = true;
L["Bonus"] = true;
L["View additional PlayerScore resources."] = true;
L["Enable Database Tab"] = true;

--4.8.01
L["Firelands"] = true;
L["Heroic Firelands"] = true;
L["So easy you might as well go AFK and make a sammich."] = true;
L["Very easy. However, you should still pretend you're paying attention."] = true;
L["This player should easily defeat bosses in this instance as long as they don't stand in fire!"] = true;
L["This instance will be difficult to this player, and require them to work well as a team, know their bosses, and be fairly skilled"] = true;

--4.9.x
L["Previous Page"] = true;
L["Next Page"] = true;
L["View all database entries."] = true;
L["View entries for guild members."] = true;
L["View entries for party or raid."] = true;

L["WARRIOR"] = "Warrior";
L["PALADIN"] = "Paladin";
L["HUNTER"] = "Hunter";
L["ROGUE"] = "Rogue";
L["PRIEST"] = "Priest";
L["DEATHKNIGHT"] = "Death Knight";
L["SHAMAN"] = "Shaman";
L["MAGE"] = "Mage";
L["WARLOCK"] = "Warlock";
L["DRUID"]  = "Druid";
L["MONK"] = "Monk";
L["???"] = true;
L["Group"] = true;
L["Database"] = true;
L["View Database"] = true;


--4.10.x
L["PlayerScore Quest Helper"] = true;


--4.11.x
L["Dragon Soul"] = true;
L["Heroic Dragon Soul"] = true;


--5.00.x
	L["Blood"] = true;
	L["Frost"] = true;
	L["Unholy"] = true;
		
	-- Druid
	L["Balance"] = true;
	L["Feral"] = true;         
	L["Guardian"] = true;
	L["Restoration"] = true;
	
	-- Hunter
	L["Beast Mastery"] = true;
	L["Marksmanship"] = true;
	L["Survival"] = true;
	
	-- Mage
	L["Arcane"] = true;
	L["Fire"] = true;
	L["Frost"] = true;
	
	-- Monk
	L["Brewmaster"] = true;
	L["Mistweaver"] = true;
	L["Windwalker"] = true;
	
	-- Paladin
	L["Holy"] = true;
	L["Protection"] = true;
	L["Retribution"] = true;
	
	-- Priest
	L["Discipline"] = true;
	L["Holy"] = true;
	L["Shadow"] = true;
	
	-- Rogue
	L["Assassination"] = true;
	L["Combat"] = true;
	L["Subtlety"] = true;
	
	-- Shaman
	L["Elemental"] = true;
	L["Enhancement"] = true;
	L["Restoration"] = true;
	
	-- Warlock
	L["Affliction"] = true;
	L["Demonology"] = true;
	L["Destruction"] = true;
	
	-- Warrior
	L["Arms"] = true;
	L["Fury"] = true;
	L["Protection"] = true;


	L["Type '/psreset' to re-enable full mode. (Reloads your UI). Additional options comming soon."] = true;
	L["Mists of Pandaria"] = true;
	

	
	-- Mists of Panda Instances
	L["LFR Mogu'shan Vaults"] = true;
	L["Normal Mogu'shan Vaults"] = true;
	L["Heroic Mogu'shan Vaults"] = true;

	L["LFR Heart of Fear"] = true;
	L["Normal Heart of Fear"] = true;
	L["Heroic Heart of Fear"] = true;
				
	-- Terrace of the Endless Spring
	L["LFR Terrace of Endless Spring"] = true;
	L["Normal Terrace of Endless Spring"] = true;
	L["Heroic Terrace of Endless Spring"] = true;
	
	L["Level 90 Dungeons"] = true;
	L["Mogu'shan Vaults"] = true;
	L["Terrace of the Endless Spring"] = true;
	L["Heart of Fear"] = true;
	
	
	
	
	L["Brewmaster"] = true;
	L["Mistweaver"] = true;
	L["Windwalker"] = true;
