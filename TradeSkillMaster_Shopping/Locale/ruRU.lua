-- ------------------------------------------------------------------------------ --
--                            TradeSkillMaster_Shopping                           --
--            http://www.curse.com/addons/wow/tradeskillmaster_shopping           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Shopping Locale - ruRU
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_Shopping/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Shopping", "ruRU")
if not L then return end

L["Added '%s' to your favorite searches."] = "Добавлено '%s' для избранного поиска." -- Needs review
-- L["Alts"] = ""
-- L["Auction Bid:"] = ""
--[==[ L[ [=[Auction Bid
(per item)]=] ] = "" ]==]
--[==[ L[ [=[Auction Bid
(per stack)]=] ] = "" ]==]
-- L["Auction Buyout"] = ""
L["Auction Buyout:"] = "Цена выкупа:"
--[==[ L[ [=[Auction Buyout
(per item)]=] ] = "" ]==]
--[==[ L[ [=[Auction Buyout
(per stack)]=] ] = "" ]==]
-- L["auctioning"] = ""
L["Auctions"] = "Лоты"
-- L["Below Custom Price ('0c' to disable)"] = ""
-- L["Below Vendor Sell Price"] = ""
L["Bid Percent"] = "Процент ставки"
-- L["Canceling Auction:"] = ""
-- L["|cff99ffff[Crafting]|r "] = ""
-- L["|cff99ffff[Normal]|r "] = ""
-- L["Could not find crafting info for the specified item."] = ""
-- L["Could not find this item on the AH. Removing it."] = ""
-- L["Could not lookup item info for '%s' so skipping it."] = ""
-- L["Ctrl-Left-Click to rename this search."] = ""
L["Custom Filter"] = "Свои Фильтры" -- Needs review
-- L["Custom Filter / Other Searches"] = ""
-- L["%d auctions found below vendor price for a potential profit of %s!"] = ""
-- L["Default Post Undercut Amount"] = ""
-- L["Desktop App Searches"] = ""
-- L["% DE Value"] = ""
-- L["disenchant search"] = ""
-- L["Disenchant Search Options"] = ""
L["Done Scanning"] = "Сканирование завершено" -- Needs review
-- L["Duration:"] = ""
L["Enter what you want to search for in this box. You can also use the following options for more complicated searches."] = "Введите то, что вы хотите найти в это поле. Вы также можете использовать следующие опции для более сложные запросы." -- Needs review
-- L["Even (5/10/15/20) Stacks Only"] = ""
-- L["Failed to bid on this auction. Skipping it."] = ""
-- L["Failed to buy this auction. Skipping it."] = ""
-- L["Failed to cancel auction because somebody has bid on it."] = ""
L["Favorite Searches"] = "Любимые поиски" -- Needs review
-- L["Found Auction Sound"] = ""
-- L["gathering"] = ""
L["General"] = "Основной" -- Needs review
L["General Operation Options"] = "Настройка основных операций" -- Needs review
L["General Options"] = "Общие настройки"
L["General Settings"] = "Общие Параметры" -- Needs review
-- L["great deals"] = ""
-- L["Great Deals"] = ""
-- L["group search"] = ""
-- L["If checked, auctions above the max price will be shown."] = ""
-- L["If checked, auctions below the max price will be shown while sniping."] = ""
-- L["If checked, only auctions posted in even quantities will be considered for purchasing."] = ""
-- L["If checked, the maximum shopping price will be shown in the tooltip for the item."] = ""
-- L["If set, only items which are usable by your character will be included in the results."] = ""
-- L["If set, only items which exactly match the search filter you have set will be included in the results."] = ""
-- L["Import"] = ""
-- L["Import Favorite Search"] = ""
-- L["Include in Sniper Searches"] = ""
-- L["Inline Filters:|r You can easily add common search filters to your search such as rarity, level, and item type. For example '%sarmor/leather/epic/85/i350/i377|r' will search for all leather armor of epic quality that requires level 85 and has an ilvl between 350 and 377 inclusive. Also, '%sinferno ruby/exact|r' will display only raw inferno rubys (none of the cuts)."] = ""
-- L["Invalid custom price source for %s. %s"] = ""
-- L["Invalid Even Only Filter"] = ""
-- L["Invalid Exact Only Filter"] = ""
L["Invalid Filter"] = "Недействительный фильтр" -- Needs review
-- L["Invalid Item Inventory Type"] = ""
L["Invalid Item Level"] = "Недействительный уровень предмета"
L["Invalid Item Rarity"] = "Недействительное качество предмета"
-- L["Invalid Item SubType"] = ""
L["Invalid Item Type"] = "Неверный тип товара" -- Needs review
-- L["Invalid Max Quantity"] = ""
L["Invalid Min Level"] = "Недействительный минимальный уровень"
-- L["Invalid Usable Only Filter"] = ""
-- L["Item Buyout"] = ""
-- L["Item Class"] = ""
-- L["Item Level Range:"] = ""
-- L["item notifications"] = ""
-- L["Item Notifications"] = ""
-- L["Item SubClass"] = ""
-- L["Items which are below their vendor sell price will be displayed in Sniper searches."] = ""
-- L["Items which are below this custom price will be displayed in Sniper searches."] = ""
-- L["Left-Click to run this search."] = ""
L["% Market Value"] = "% рыноч. цены"
-- L["Market Value Price Source"] = ""
-- L["% Mat Price"] = ""
-- L["Max Disenchant Level"] = ""
-- L["Max Disenchant Search Percent"] = ""
-- L["Maximum Auction Price (per item)"] = ""
-- L["Maximum Quantity to Buy:"] = ""
L["% Max Price"] = "% макс. цены"
-- L["Max Restock Quantity"] = ""
-- L["Max Shopping Price:"] = ""
-- L["Min Disenchant Level"] = ""
-- L["Minimum Bid:"] = ""
-- L["Minimum Rarity"] = ""
-- L["Multiple Search Terms:|r You can search for multiple things at once by simply separated them with a ';'. For example '%selementium ore; obsidium ore|r' will search for both elementium and obsidium ore."] = ""
-- L["No recent AuctionDB scan data found."] = ""
-- L["Normal"] = ""
-- L["Normal Post Price"] = ""
-- L["Nothing to search for!"] = ""
-- L["Only exporting normal mode searches is allows."] = ""
-- L["Other Searches"] = ""
-- L["Paste the search you'd like to import into the box below."] = ""
-- L["Play the selected sound when a new auction is found to snipe."] = ""
-- L["Post"] = ""
-- L["Posting auctions..."] = ""
-- L["Posting Options"] = ""
-- L["Preparing Filters..."] = ""
-- L["Press Ctrl-C to copy this saved search."] = ""
-- L["Price Per Item:"] = ""
-- L["Purchased the maximum quantity of this item!"] = ""
-- L["Purchasing Auction:"] = ""
L["Recent Searches"] = "Недавние поиски" -- Needs review
-- L["Removed '%s' from your favorite searches."] = ""
-- L["Removed '%s' from your recent searches."] = ""
-- L["Required Level Range:"] = ""
-- L["Reset Filters"] = ""
-- L["Right-Click to favorite this recent search."] = ""
-- L["Right-Click to remove from favorite searches."] = ""
-- L["Saved Searches / TSM Groups"] = ""
-- L["Scanning %d / %d (Page %d / %d)"] = ""
-- L["Scanning Last Page..."] = ""
-- L["Search Filter:"] = ""
-- L["Searching for auction..."] = ""
-- L["Search Mode:"] = ""
-- L["Search Results"] = ""
-- L["Select the groups which you would like to include in the search."] = ""
L["'%s' has a Shopping operation of '%s' which no longer exists. Shopping will ignore this group until this is fixed."] = "\"% s \" имеет Торговые операции '%s', которая больше не существует. Торговые будете игнорировать эту группу до тех пор, пока это будет Исправлено." -- Needs review
-- L["Shift-Click to run sniper again."] = ""
-- L["Shift-Click to run the next favorite search."] = ""
-- L["Shift-Left-Click to export this search."] = ""
-- L["Shift-Right-Click to remove this recent search."] = ""
-- L["Shopping for auctions including those above the max price."] = ""
-- L["Shopping for auctions with a max price set."] = ""
-- L["Shopping for even stacks including those above the max price"] = ""
-- L["Shopping for even stacks with a max price set."] = ""
-- L["Shopping operations contain settings items which you regularly buy from the auction house."] = ""
-- L["Shopping will only search for enough items to restock your bags to the specific quantity. Set this to 0 to disable this feature."] = ""
-- L["Show Auctions Above Max Price"] = ""
-- L["Show Shopping Max Price in Tooltip"] = ""
-- L["Skipped the following search term because it's invalid."] = ""
-- L["Skipped the following search term because it's too long. Blizzard does not allow search terms over 63 characters."] = ""
-- L["sniper"] = ""
-- L["Sniper Options"] = ""
-- L["Sources to Include in Restock"] = ""
-- L["stack(s) of"] = ""
L["Start Disenchant Search"] = "Начать Поиск Распыления" -- Needs review
L["Start Search"] = "Начать Поиск" -- Needs review
-- L["Start Sniper"] = ""
L["Start Vendor Search"] = "Начать Поиск Поставщика" -- Needs review
L["Stop"] = "Стоп" -- Needs review
--[==[ L[ [=[Target Price
(per item)]=] ] = "" ]==]
--[==[ L[ [=[Target Price
(per stack)]=] ] = "" ]==]
L["% Target Value"] = "% стоимость выделенного" -- Needs review
-- L["Test Selected Sound"] = ""
-- L["The disenchant search looks for items on the AH below their disenchant value. You can set the maximum percentage of disenchant value to search for in the Shopping General options"] = ""
-- L["The highest price per item you will pay for items in affected by this operation."] = ""
-- L["The Sniper feature will look in real-time for items that have recently been posted to the AH which are worth snatching! You can configure the parameters of Sniper in the Shopping options."] = ""
-- L["The vendor search looks for items on the AH below their vendor sell price."] = ""
-- L["This is how Shopping calculates the '% Market Value' column in the search results."] = ""
-- L["This is not a valid target item."] = ""
-- L["This is the default price Shopping will suggest to post items at when there's no others posted."] = ""
-- L["This is the main content area which will change depending on which button is selected above."] = ""
-- L["This is the maximum item level that the Other > Disenchant search will display results for."] = ""
-- L["This is the maximum percentage of disenchant value that the Other > Disenchant search will display results for."] = ""
-- L["This is the minimum item level that the Other > Disenchant search will display results for."] = ""
-- L["This is the percentage of your buyout price that your bid will be set to when posting auctions with Shopping."] = ""
-- L["This searches the AH for all items found on the TSM Great Deals page (http://tradeskillmaster.com/great-deals)."] = ""
-- L["This searches the AH for your current deals as displayed on the TSM website."] = ""
-- L["Total Deposit:"] = ""
-- L["Type in the new name for this saved search and hit the 'Save' button."] = ""
-- L["Unexpected filters (only '/even' or '/ignorede' or '/x<MAX_QUANTITY>' is supported in crafting mode): %s"] = ""
L["Unknown Filter"] = "Фильтр не указан" -- Needs review
-- L["Use these buttons to change what is shown below."] = ""
-- L["vendor search"] = ""
-- L["% Vendor Value"] = ""
-- L["Warning: The max disenchant level must be higher than the min disenchant level."] = ""
-- L["Warning: The min disenchant level must be lower than the max disenchant level."] = ""
-- L["What to set the default undercut to when posting items with Shopping."] = ""
-- L["When in crafting mode, the search results will include materials which can be used to craft the item which you search for. This includes milling, prospecting, and disenchanting."] = ""
-- L["When in normal mode, you may run simple and filtered searches of the auction house."] = ""
-- L["You can change the search mode here. Crafting mode will include items which can be crafted into the specific items (through professions, milling, prospecting, disenchanting, and more) in the search."] = ""
-- L["You can type search filters into the search bar and click on the 'SEARCH' button to quickly search the auction house. Refer to the tooltip of the search bar for details on more advanced filters."] = ""
-- L["You must enter a search filter before starting the search."] = ""
